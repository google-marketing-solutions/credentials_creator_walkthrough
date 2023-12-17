#!/bin/bash
# Copyright 2022 Google LLC
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      https://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
set -e

# Function to prompt for input and validate
prompt_and_validate() {
    local prompt=$1
    local var_name=$2
    local special_char=$3
    local input

    while true; do
        read -p "$prompt: " input
        if [[ "$input" =~ [$special_char] ]]; then
            echo "Invalid input: '$special_char' characters are not allowed. Please try again."
        else
            eval $var_name="$input"
            break
        fi
    done
}

# Prompt for variables with specific validations

prompt_and_validate "Enter client secret" client_secret "\""
prompt_and_validate "Enter client id" client_id "\""
prompt_and_validate "Enter refresh token" refresh_token "\""
prompt_and_validate "Enter your customer id (MCC or cid in Google Ads) " customer_id "-"

# Check for developer token
read -p "Do you have a developer token? (y/n): " has_developer_token
if [ "$has_developer_token" == "y" ]; then
    prompt_and_validate "Enter developer token" developer_token "\""
else
    developer_token="Developer token missing"
fi

# Check if google-ads.yaml already exists
if [ -f google-ads.yaml ]; then
    echo "Warning: google-ads.yaml already exists and will be overwritten."
    read -p "Press Enter to continue or Ctrl+C to cancel..."
fi

# Create or overwrite the YAML file
{
    echo "login_customer_id: $customer_id"
    echo "client_secret: $client_secret"
    echo "client_id: $client_id"
    echo "refresh_token: $refresh_token"
    echo "developer_token: $developer_token"
} > google-ads.yaml

echo "google-ads.yaml file has been created/updated."

cloudshell download-file google-ads.yaml

echo "google-ads.yaml file has been downloaded to filesystem."
