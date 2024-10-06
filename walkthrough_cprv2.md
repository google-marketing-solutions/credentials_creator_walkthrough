#  Ads Placement Guardian (past: CPRv2)

<walkthrough-metadata>
  <meta name="title" content="Installing 'Ads Placement Guardian (CPRv2)' solution" />
  <meta name="description" content="A step by step guide on configuring GCP cloud and installing this web-tool." />
</walkthrough-metadata>


The solution looks for a `google-ads.yaml` file that you have to create and fill. 

This wizard will help you generate OAuth credentials (some of the data for this yaml file). 

<walkthrough-tutorial-difficulty difficulty="3"></walkthrough-tutorial-difficulty>
<walkthrough-tutorial-duration duration="20"></walkthrough-tutorial-duration>


## Google Cloud Project Setup

The web-tool is going to run on GCP.
Begin by creating a new project or selecting an existing project for this
solution.

<walkthrough-project-setup billing></walkthrough-project-setup>

For details, see
[Creating a project](https://cloud.google.com/resource-manager/docs/creating-managing-projects#creating_a_project).
    
## OAuth Consent Screen

1.  Open <walkthrough-path-nav path="/apis/credentials/consent">OAuth consent screen</walkthrough-path-nav>

1.  Choose the consent screen visibility.

    *   **Internal** - If you want to share the web-tool only with peers from your organization. 
    *   **External - Testing** - If you want to share with people outside your org select.

2.  Click
    <walkthrough-spotlight-pointer cssSelector="button[type='submit']">**Create**</walkthrough-spotlight-pointer>
    to continue.

3.  Under *App information*, enter the **Application name** you want to display.
    You enter the name of the solution you're deploying as the application name.

4.  For the **Support email** dropdown menu, select the email that will be presented on the consent screen as a contact email (you can use your email).
    
5.  Under **Developer contact information**, enter a valid email address.

6. Click
    <walkthrough-spotlight-pointer cssSelector=".cfc-stepper-step-continue-button">**Save
    and continue**</walkthrough-spotlight-pointer>.


## OAuth Credentials

**Copy each of the credentials you create**, you will need them later.

1.  Open <walkthrough-path-nav path="/apis/credentials">APIs & Services>credentials</walkthrough-path-nav>

2.  On the
    <walkthrough-spotlight-pointer cssSelector="[id$=action-bar-create-button]" validationPath="/apis/credentials">**Create
    credentials**</walkthrough-spotlight-pointer> drop-down list, select **OAuth
    client ID**.
3.  Under
    <walkthrough-spotlight-pointer cssSelector="[formcontrolname='typeControl']">**Application
    type**</walkthrough-spotlight-pointer>, select **Web application**.

4.  Add a
    <walkthrough-spotlight-pointer cssSelector="[formcontrolname='displayName']">**Name**</walkthrough-spotlight-pointer>
    for your OAuth client.

5. Click <walkthrough-spotlight-pointer locator="semantic({group 'Authorized redirect URIs'} {button 'Add URI'})">Authorized redirect URI</walkthrough-spotlight-pointer>
   and copy the following:
   ```
   https://developers.google.com/oauthplayground
   ```

6.  Click **Create**. Your OAuth client ID and client secret are generated and
    displayed on the OAuth client window.
 
7. Keep the confirmation screen open and go to the next step (you will need `client_id` and `client_secret`)


## Refresh Token

1. Go to the [OAuth2 Playground](https://developers.google.com/oauthplayground/#step1&scopes=https%3A//www.googleapis.com/auth/adwords&url=https%3A//&content_type=application/json&http_method=GET&useDefaultOauthCred=checked&oauthEndpointSelect=Google&oauthAuthEndpointValue=https%3A//accounts.google.com/o/oauth2/v2/auth&oauthTokenEndpointValue=https%3A//oauth2.googleapis.com/token&includeCredentials=unchecked&accessTokenType=bearer&autoRefreshToken=unchecked&accessType=offline&forceAprovalPrompt=checked&response_type=code) (opens in a new window)

2. On the right-hand pane, paste the `client_id` and `client_secret` in the settings gear icon ![paste credentials](https://services.google.com/fh/files/misc/pplayground_fields.png)

3. On the left-hand pane, open and mark the first itme under: `Google Ads API`, `Youtube Date API`. Apologies but there is no search option. See this example for selecting Google Drive API. ![select drive API](https://services.google.com/fh/files/misc/scope_selection.png)

4. After selecting all required scopes, click the blue **Authorize APIs** button on the left-hand pane. ![Authorize APIs](https://services.google.com/fh/files/misc/authorize_apis.png)

   If you are prompted to authorize access, please choose your Google account that has access to Google Ads and approve.
   
5.  Click the new blue button **Exchange authorization code for tokens** ![Exchange authorization code for tokens](https://services.google.com/fh/files/misc/exchange_authorization_code_for_token.png)

6.  Copy your refresh token from middle of the screen. *Do not copy the quotation marks*


## Fill in a google-ads.yaml File 

Create and fill a `google-ads.yaml` (if you don't have one from past Google-solutions):

Use the icon above the code line to automatically put the code into the cloud-shell. Press enter and follow the instructions.


```bash
sh create_google_ads_yaml.sh
```
Enter credentials one by one, and choose `Download` to download the file to your file system.
This will populate these fields in your file:

```
client_id:
client_secret:
refresh_token:
```

**client_id**: 			from GCP under oauth-id.

**client_secret**:

**refresh_token**: 		from Google oauth playground website.


Add the following fields to this `yaml` file manually:


```
client_customer_id:
login_customer_id:
developer_token:
use_proto_plus: true
```

**client_customer_id**: 		The MCC (No dashes. even though by definition its the child-client id)

**login_customer_id**: 		The MCC

**developer_token**:		(from Google Ads under Tools & Settings > Setup > API Centre).
				If you do not have a developer token, you will need to create one and fill in the details. 
				You will be given a ‘Testing’ API Token which is not suitable for this tool and you will
				need to apply for a Basic or Standard access token.

**use_proto_plus**: true


## Install `Ads Placement Guardian` on the cloud

You finished setting up google-cloud.

Click next to install the web-tool\solution itself.


## Download the code

1. Create a new script password from this [website](https://professional-services.googlesource.com/new-password) with the Google account you have access to in your Cloud.

3. Copy and paste the script from the lower blue box directly into the cloud-Shell. 
Press enter and wait for output.

3. Alternatively, ask your Google POC to add you to this [user-group](https://groups.google.com/a/professional-services.goog/g/solutions_cpr_placement_excluder-readers/members)



## Run the install script

1. Run these commands in the cloud shell

```bash
cd ~
```

This line will delete any past existing `cpr_placement_excluder` folder:
```bash
rm -r -f cpr_placement_excluder
```

Dowbload the code: 
```bash
git clone https://professional-services.googlesource.com/solutions/cpr_placement_excluder
```

Change directory to the `cpr_placement_excluder` folder using:
```bash
cd cpr_placement_excluder
```

Run the `install.sh` file using:
```bash
./gcp/install.sh deploy_all
```

Follow the instructions on the terminal.

If asked to Authorize, then do so.


Since it’s your first time, you will be asked to add some secret-data in the cloud-shell. This will create a `google-ads.yaml` file in your firestore (`default project\cpr`).
The installation takes 5 minutes. When completed it would show the web-tool url like `https://[project_id].ew.r.appspot.com/newtask` 


## Optional: Change `Settings.ini` (if you know your app engine is already installed on another region)
```
[config]
 name = cpr_v2 
[functions]
 region = europe-west1
[appengine]
 service = default
 region = europe-west1 
[firestore]
name = (default)
region = eur3
```

Please change all “region” if you know your appengine/could-function/firestore are already installed on other regions. Replace `"__FILL_IN__" `below and run this on cloud-shell:

```bash
export APPENGINE_REGION="__FILL_IN__" 
#for example: europe-west1
``` 


## Optional: Run `Update` instead of `Install` (if you had a working version before)

* Now and then, there will be updates available to the tool such as bug fixes and new features. When notified by our teams or every so-often, you can run the update script within your Cloud shell to get the latest version and have it automatically installed.

* Ensure you are in your correct Project in Google Cloud
Open ‘Cloud Shell’ (  in top right of your Cloud Console):
Change directory to the cpr_placement_excluder folder using:

```bash
cd cpr_placement_excluder
```

Take new changes from the code repo:
```bash
git pull --force
```

Then run the update script:
```bash
./gcp/update.sh
```

* Once completed, you would see the web-tool url.


## Optional: Grant others access to the web-application

*After deploying the solution.

1. Open <walkthrough-path-nav path="iam-admin/iam ">IAM</walkthrough-path-פקnav>   

2. Click 
    <walkthrough-spotlight-pointer cssSelector="[formcontrolname='displayName']">**Grant Access**</walkthrough-spotlight-pointer>
and enter the user's email address as the New Principle.

3. Grant 4 roles
```
Editor
App Engine Viewer
Cloud Scheduler Admin
IAP-secured Web App User
```

*  **Editor** - Editor allows them to edit things only within this 
GCP project and is required for them to create new `schedules` and save to the `storage` when 
saving tasks.
* **App Engine Viewer** - This is required in addition to editor to allow them access to the 
App Engine URL.
* **Cloud Scheduler Admin** - This is required to create, delete and view schedules in 
Cloud Scheduler.
* **IAP-secured Web App User** 


4. Click
<walkthrough-spotlight-pointer cssSelector="[formcontrolname='displayName']">**Save**</walkthrough-spotlight-pointer>
and wait 5 minutes.


5.  Open <walkthrough-path-nav path="/security/iap">IAP</walkthrough-path-nav>
Turn OFF and then ON again this toggle


6.  Make sure you have the right visibility for your <walkthrough-path-nav path="/apis/credentials/consent">OAuth consent screen</walkthrough-path-nav>

**Internal** If you share the web-tool only with peers from your org.

**External-Testing** If you share the web-tool with people outside your org.



**Note:** The users accessing the application will be making Google Ads/YouTube API requests on behalf of 
the user who did the original authentication and not their own account. This is due to the app needing 
to be able to run schedules and therefore, store the original users authentication to run the tasks.


## Conclusion

Congratulations. You've created OAuth credentials for the solution you will soon deploy!

<walkthrough-conclusion-trophy></walkthrough-conclusion-trophy>

<walkthrough-inline-feedback></walkthrough-inline-feedback>