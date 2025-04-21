# GCP OAuth Credentials Tutorial

Welcome! This repository provides a guided walkthrough for creating OAuth 2.0 credentials on the Google Cloud Platform (GCP). Generating these credentials is a crucial step for applications and scripts that need to securely access Google APIs on behalf of users.

## Overview

This repository contains a comprehensive, step-by-step tutorial, directly in the Google Cloud Platform, designed to help you navigate the process of generating OAuth 2.0 credentials within GCP. These credentials are essential for authenticating and authorizing access to Google services via APIs.

**Prerequisites**:

Before starting the tutorial, please ensure you have the following:

- **A Google Cloud Account:** You'll need an active account to follow the steps.
- **Required APIs and Scopes:** Identify the specific Google APIs and authorization scopes needed for the solution you plan to deploy. You will need this information to enable the correct services and configure permissions during the process. Consult your solution's documentation or developer if unsure.

## Access the Tutorial

Click the link below to launch the interactive tutorial directly in Google Cloud Shell:

**[Start the Step-by-Step OAuth Credentials Tutorial](https://console.cloud.google.com/?cloudshell=true&cloudshell_git_repo=https://github.com/google-marketing-solutions/credentials_creator_walkthrough&cloudshell_tutorial=walkthrough.md)**

## What This Tutorial Covers

By completing this walkthrough, you will learn how to:

- Set up a new Google Cloud project.
- Enable the necessary APIs required for your application within the project.
- Configure the OAuth consent screen, which informs users what permissions your application is requesting.
- Generate OAuth 2.0 credentials (Client ID, Client Secret, and Refresh Token).
- Save the generated credentials securely into a dedicated `google-ads.yaml` file, ready for use in other applications or deployment scripts.

## Contact

For questions, feedback, or issues related to this tutorial, please feel free to contact [halelid@google.com](mailto:halelid@google.com).
