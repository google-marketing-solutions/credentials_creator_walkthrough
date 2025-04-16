# OAuth Credentials Creator

<walkthrough-metadata>
  <meta name="title" content="Creating OAuth credentials" />
  <meta name="description" content="A step by step guide on configuring cloud and creating OAuth credentials (client id, client secret and a refresh token)." />
</walkthrough-metadata>

## Introduction

In this walkthrough, you'll generate OAuth credentials in preparation for the deployment of a GPS solution.

<walkthrough-tutorial-difficulty difficulty="2"></walkthrough-tutorial-difficulty>
<walkthrough-tutorial-duration duration="10"></walkthrough-tutorial-duration>

## Google Cloud Project Setup

GCP organizes resources into projects. This allows you to
collect all of the related resources for a single application in one place.

Begin by creating a new project or selecting an existing project for this
solution.

<walkthrough-project-setup billing></walkthrough-project-setup>

For details, see
[Creating a project](https://cloud.google.com/resource-manager/docs/creating-managing-projects#creating_a_project).

## Enable Google Cloud APIs

Enable required API's for this project. Choose the necessary API's to the solution you're deploying, so that they're incorporated in the credentials you will generate in the next step.

### Google Ads API

<walkthrough-enable-apis apis="googleads.googleapis.com">
</walkthrough-enable-apis>

### Big Query API

<walkthrough-enable-apis apis="bigquery.googleapis.com">
</walkthrough-enable-apis>

### Google Drive API

<walkthrough-enable-apis apis="drive.googleapis.com">
</walkthrough-enable-apis>

### Google Sheets API

<walkthrough-enable-apis apis="sheets.googleapis.com">
</walkthrough-enable-apis>

### Additional API's:

If you do not see an API you need to enable in the list above, you can manually add it by following these steps:

1.  Go to the **APIs & Services > Enabled APIs & services** page in the Cloud
    Console. You can use the button below to find the section.
2.  <walkthrough-path-nav path="/apis/credentials">APIs & Services>Enabled APIs & services</walkthrough-path-nav>

3.  Click <walkthrough-spotlight-pointer cssSelector=".mdc-button.mat-mdc-button.gmat-mdc-button-with-prefix.mat-primary.mat-mdc-button-base.gmat-mdc-button.cm-button">**Enable API's and Services**</walkthrough-spotlight-pointer>.
4.  Browse for the API's needed and enable them.

## Configure OAuth Consent Screen

An authorization token is needed to communicate with Google Ads.

1.  Go to:
    <walkthrough-path-nav path="/auth/overview">**APIs & Services > OAuth Overview**</walkthrough-path-nav>

1.  Click on "Get started".

1.  Under _App information_, enter the **Application name** you want to display.
    For example, the name of the solution you are aiming to deploy in this project.

1.  For the **Support email** dropdown menu, select any email address that you have access to.

1.  In the Next section (Audience):

    - If you have an organization for your application, select **Internal**.
    - If you don't have an organization configured for your application,
      select **External**.

1.  Under **Developer contact information**, enter a valid email address and continue to accept the Terms.

1.  Click
    <walkthrough-spotlight-pointer cssSelector="button[type='submit']">**Create**</walkthrough-spotlight-pointer>
    to continue.

Click<walkthrough-spotlight-pointer cssSelector=".cfc-message-actions > a.cm-button[href^='/auth/clients/create']">**Create OAuth client**</walkthrough-spotlight-pointer>

## Creating OAuth Credentials

1. You should land in the following section:
   <walkthrough-path-nav path="/auth/clients/create">**Clients**</walkthrough-path-nav>

1. Under
   <walkthrough-spotlight-pointer cssSelector="[formcontrolname='typeControl']">**Application
   type**</walkthrough-spotlight-pointer>, select **Web application**.

1. Add a
   <walkthrough-spotlight-pointer cssSelector="[formcontrolname='displayName']">**Name**</walkthrough-spotlight-pointer>
   for your OAuth client ID.

1. Click <walkthrough-spotlight-pointer locator="semantic({group 'Authorized redirect URIs'} {button 'Add URI'})">Authorized redirect URI</walkthrough-spotlight-pointer>
   and copy the following:

   ```
   https://developers.google.com/oauthplayground
   ```

1. Click **Create**. Your OAuth client ID and client secret are generated and
   displayed on the OAuth client window.

1. Copy the **client_id** and **client_secret** as you will need those in a moment. (if you only see client_id, press OK and then find both id and secret after pressing the "edit" icon)

## Add Sensitive Scopes to Consent Screen

Scope the consent screen for necessary API's to the solution you're deploying.
For example: Google Ads API, BigQuery API, etc.

1. Click <walkthrough-spotlight-pointer locator="semantic({button 'Add or remove scopes'})">Add or remove scopes</walkthrough-spotlight-pointer>
1. Now in <walkthrough-spotlight-pointer locator="semantic({combobox 'Filter'})">Enter property name or value</walkthrough-spotlight-pointer> search for the API you need, check the box for the first option to choose it.
1. Do the same for all API's needed.
1. Click <walkthrough-spotlight-pointer locator="text('Update')">Update</walkthrough-spotlight-pointer>

## Generate Refresh Token

1. Go to the [OAuth2 Playground](https://developers.google.com/oauthplayground/#step1&scopes=https%3A//www.googleapis.com/auth/adwords&url=https%3A//&content_type=application/json&http_method=GET&useDefaultOauthCred=checked&oauthEndpointSelect=Google&oauthAuthEndpointValue=https%3A//accounts.google.com/o/oauth2/v2/auth&oauthTokenEndpointValue=https%3A//oauth2.googleapis.com/token&includeCredentials=unchecked&accessTokenType=bearer&autoRefreshToken=unchecked&accessType=offline&forceAprovalPrompt=checked&response_type=code) (opens in a new window)
2. On the right-hand pane, paste the client_id and client_secret in the appropriate fields ![paste credentials](https://services.google.com/fh/files/misc/pplayground_fields.png)
3. On the left-hand pane, select the scopes for the APIs you need to access. Google Ads API will be selected automatically. See this example for selecting Google Drive API. ![select drive API](https://services.google.com/fh/files/misc/scope_selection.png)
4. After selecting all requiered scopes, click the blue **Authorize APIs** button on the left-hand pane. ![Authorize APIs](https://services.google.com/fh/files/misc/authorize_apis.png)

   If you are prompted to authorize access, please choose your Google account that has access to Google Ads and approve.

5. Now, click the new blue button **Exchange authorization code for tokens** ![Exchange authorization code for tokens](https://services.google.com/fh/files/misc/exchange_authorization_code_for_token.png)
6. Finally, in the middle of the screen you'll see your refresh token on the last line. Copy it and save it for future reference. ![refresh_token](https://services.google.com/fh/files/misc/refresh_token.png) _Do not copy the quotation marks_

## Save Credentials in a google-ads.yaml File

If you would like to save the credentials and in a google-ads.yaml file and download it to your PC, do the following:
Copy the following command into the terminal, press enter and follow the instructions.

```bash
sh create_google_ads_yaml.sh
```

Enter credentials one by one, and choose "Download" to download the file to your file system.

## Conclusion

Congratulations. You've created OAuth credentials for the solution you will soon deploy!

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

<walkthrough-inline-feedback></walkthrough-inline-feedback>
