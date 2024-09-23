@implementation WBSWebExtensionData

+ (id)supportedPermissions
{
  _QWORD v3[16];
  _QWORD v4[17];

  v4[16] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("activeTab");
  v3[1] = CFSTR("alarms");
  v4[0] = CFSTR("14.0");
  v4[1] = CFSTR("14.0");
  v3[2] = CFSTR("clipboardWrite");
  v3[3] = CFSTR("contextMenus");
  v4[2] = CFSTR("14.0");
  v4[3] = CFSTR("14.0");
  v3[4] = CFSTR("cookies");
  v3[5] = CFSTR("declarativeNetRequestFeedback");
  v4[4] = CFSTR("14.0");
  v4[5] = CFSTR("15.4");
  v3[6] = CFSTR("menus");
  v3[7] = CFSTR("nativeMessaging");
  v4[6] = CFSTR("14.0");
  v4[7] = CFSTR("14.0");
  v3[8] = CFSTR("scripting");
  v3[9] = CFSTR("storage");
  v4[8] = CFSTR("15.4");
  v4[9] = CFSTR("14.0");
  v3[10] = CFSTR("tabs");
  v3[11] = CFSTR("unlimitedStorage");
  v4[10] = CFSTR("14.0");
  v4[11] = CFSTR("14.0");
  v3[12] = CFSTR("webRequest");
  v3[13] = CFSTR("webNavigation");
  v4[12] = CFSTR("14.0");
  v4[13] = CFSTR("14.0");
  v3[14] = CFSTR("declarativeNetRequest");
  v3[15] = CFSTR("declarativeNetRequestWithHostAccess");
  v4[14] = CFSTR("15.0");
  v4[15] = CFSTR("16.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedWebExtensionPatternSchemes
{
  uint64_t v2;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  v4[0] = CFSTR("*");
  v4[1] = CFSTR("http");
  v5[0] = CFSTR("14.0");
  v5[1] = CFSTR("14.0");
  v2 = *MEMORY[0x1E0D8A6E8];
  v4[2] = CFSTR("https");
  v4[3] = v2;
  v5[2] = CFSTR("14.0");
  v5[3] = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)supportedWebExtensionFeaturesForManifestVersion:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  _QWORD v27[2];
  _QWORD v28[2];
  const __CFString *v29;
  const __CFString *v30;
  _QWORD v31[7];
  _QWORD v32[7];
  _QWORD v33[3];
  _QWORD v34[3];
  const __CFString *v35;
  const __CFString *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[3];
  _QWORD v40[3];
  const __CFString *v41;
  const __CFString *v42;
  const __CFString *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  const __CFString *v48;
  _QWORD v49[3];
  _QWORD v50[3];
  _QWORD v51[23];
  _QWORD v52[25];

  v52[23] = *MEMORY[0x1E0C80C00];
  if (a3 < 2)
    return 0;
  v51[0] = CFSTR("manifest_version");
  v51[1] = CFSTR("name");
  v52[0] = CFSTR("14.0");
  v52[1] = CFSTR("14.0");
  v51[2] = CFSTR("version");
  v51[3] = CFSTR("default_locale");
  v52[2] = CFSTR("14.0");
  v52[3] = CFSTR("14.0");
  v51[4] = CFSTR("description");
  v51[5] = CFSTR("icons");
  v52[4] = CFSTR("14.0");
  v52[5] = CFSTR("14.0");
  v51[6] = CFSTR("background");
  v49[0] = CFSTR("page");
  v49[1] = CFSTR("service_worker");
  v50[0] = CFSTR("14.0");
  v50[1] = CFSTR("15.4");
  v49[2] = CFSTR("scripts");
  v50[2] = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 3);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v23, "mutableCopy");
  v52[6] = v6;
  v51[7] = CFSTR("content_scripts");
  +[WBSWebExtensionInjectedContentData supportedInjectedContentFeatures](WBSWebExtensionInjectedContentData, "supportedInjectedContentFeatures");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v52[7] = v7;
  v51[8] = CFSTR("externally_connectable");
  v47 = CFSTR("matches");
  v48 = CFSTR("15.4");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v52[8] = v8;
  v52[9] = CFSTR("14.0");
  v51[9] = CFSTR("options_page");
  v51[10] = CFSTR("options_ui");
  v45 = CFSTR("page");
  v46 = CFSTR("14.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v46, &v45, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v52[10] = v9;
  v52[11] = CFSTR("14.0");
  v51[11] = CFSTR("short_name");
  v51[12] = CFSTR("version_name");
  v52[12] = CFSTR("14.0");
  v52[13] = CFSTR("14.0");
  v51[13] = CFSTR("commands");
  v51[14] = CFSTR("chrome_url_overrides");
  v43 = CFSTR("newtab");
  v44 = CFSTR("14.1");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v44, &v43, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52[14] = v10;
  v51[15] = CFSTR("browser_url_overrides");
  v41 = CFSTR("newtab");
  v42 = CFSTR("15.0");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v42, &v41, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v52[15] = v11;
  v52[16] = CFSTR("15.0");
  v51[16] = CFSTR("declarative_net_request");
  v51[17] = CFSTR("author");
  v52[17] = CFSTR("allowedToIgnore");
  v52[18] = CFSTR("allowedToIgnore");
  v51[18] = CFSTR("homepage_url");
  v51[19] = CFSTR("key");
  v52[19] = CFSTR("allowedToIgnore");
  v52[20] = CFSTR("allowedToIgnore");
  v51[20] = CFSTR("minimum_chrome_version");
  v51[21] = CFSTR("update_url");
  v51[22] = CFSTR("browser_specific_settings");
  v52[21] = CFSTR("allowedToIgnore");
  v52[22] = CFSTR("allowedToIgnore");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v52, v51, 23);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v12, "mutableCopy");

  objc_msgSend(a1, "supportedPermissions");
  if (a3 == 2)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v13, "mutableCopy");

    objc_msgSend(v14, "setObject:forKeyedSubscript:", CFSTR("14.0"), CFSTR("<all_urls>"));
    v39[0] = CFSTR("default_title");
    v39[1] = CFSTR("default_icon");
    v40[0] = CFSTR("14.0");
    v40[1] = CFSTR("14.0");
    v39[2] = CFSTR("default_popup");
    v40[2] = CFSTR("14.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 3);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = CFSTR("browser_action");
    v37[1] = CFSTR("page_action");
    v38[0] = v15;
    v38[1] = v15;
    v37[2] = CFSTR("permissions");
    v37[3] = CFSTR("optional_permissions");
    v38[2] = v14;
    v38[3] = v14;
    v37[4] = CFSTR("content_security_policy");
    v37[5] = CFSTR("web_accessible_resources");
    v38[4] = CFSTR("14.0");
    v38[5] = CFSTR("14.0");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 6);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addEntriesFromDictionary:", v16);

    objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("background"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setObject:forKeyedSubscript:", CFSTR("14.1"), CFSTR("persistent"));
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = CFSTR("<all_urls>");
    v36 = CFSTR("15.4");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v36, &v35, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = CFSTR("default_title");
    v33[1] = CFSTR("default_icon");
    v34[0] = CFSTR("15.4");
    v34[1] = CFSTR("15.4");
    v33[2] = CFSTR("default_popup");
    v34[2] = CFSTR("15.4");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 3);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = CFSTR("action");
    v31[1] = CFSTR("permissions");
    v32[0] = v17;
    v32[1] = v14;
    v31[2] = CFSTR("optional_permissions");
    v31[3] = CFSTR("host_permissions");
    v32[2] = v14;
    v32[3] = v15;
    v32[4] = v15;
    v31[4] = CFSTR("optional_host_permissions");
    v31[5] = CFSTR("content_security_policy");
    v29 = CFSTR("extension_pages");
    v30 = CFSTR("15.4");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v32[5] = v18;
    v31[6] = CFSTR("web_accessible_resources");
    v28[0] = CFSTR("15.4");
    v27[0] = CFSTR("resources");
    v27[1] = CFSTR("matches");
    v25 = CFSTR("<all_urls>");
    v26 = CFSTR("15.4");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v32[6] = v20;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addEntriesFromDictionary:", v21);

  }
  v22 = (void *)objc_msgSend(v24, "copy");

  return v22;
}

+ (id)createWebExtensionError:(int64_t)a3
{
  return (id)objc_msgSend(a1, "createWebExtensionError:underlyingError:", a3, 0);
}

+ (id)createWebExtensionError:(int64_t)a3 customLocalizedDescription:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v6 = objc_alloc(MEMORY[0x1E0CB35C8]);
  v10 = *MEMORY[0x1E0CB2D50];
  v11[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithDomain:code:userInfo:", CFSTR("WBSWebExtensionErrorDomain"), a3, v7);

  return v8;
}

+ (id)createWebExtensionError:(int64_t)a3 underlyingError:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    v13[0] = *MEMORY[0x1E0CB2D50];
    localizedDescriptionForErrorCode(a3, v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = *MEMORY[0x1E0CB3388];
    v14[0] = v6;
    v14[1] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = *MEMORY[0x1E0CB2D50];
    localizedDescriptionForErrorCode(a3, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1);
    v7 = objc_claimAutoreleasedReturnValue();
  }
  v8 = (void *)v7;

  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB35C8]), "initWithDomain:code:userInfo:", CFSTR("WBSWebExtensionErrorDomain"), a3, v8);
  return v9;
}

+ (id)webExtensionForWebKitExtensionContext:(id)a3
{
  void *v3;
  void *v4;

  objc_getAssociatedObject(a3, (const void *)webKitContextAssociationKey);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSString *v17;
  NSString *containingAppBundleIdentifier;
  void *v19;
  WBSWebExtensionData *v20;
  void *v21;
  void *v22;

  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "_extensionBundle");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "resourceURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "absoluteURL");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB34D0];
  objc_msgSend(v7, "_plugIn");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "containingUrl");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bundleWithURL:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "bundleIdentifier");
  v17 = (NSString *)objc_claimAutoreleasedReturnValue();
  containingAppBundleIdentifier = self->_containingAppBundleIdentifier;
  self->_containingAppBundleIdentifier = v17;

  objc_msgSend(v8, "composedIdentifierForExtensionStateForExtension:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0;
  if (v7 && v11 && v12)
  {
    objc_storeStrong((id *)&self->_extension, a3);
    objc_storeStrong((id *)&self->_composedIdentifier, v19);
    objc_storeStrong((id *)&self->_resourcesDirectoryURL, v11);
    objc_msgSend(v7, "sf_uniqueIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    self = -[WBSWebExtensionData initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:](self, "initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:", v7, v8, v12, v19, v21, v22);

    v20 = self;
  }

  return v20;
}

- (WBSWebExtensionData)initWithExtension:(id)a3 extensionsController:(id)a4 extensionBundleIdentifier:(id)a5 extensionIdentifier:(id)a6 uniqueIdentifier:(id)a7 baseURIHost:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  WBSWebExtensionData *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  WBSWebExtensionData *v22;
  void *v23;
  id v24;
  NSURL *resourcesDirectoryURL;
  id v26;
  _WKWebExtension *webKitExtension;
  NSObject *v28;
  uint64_t v29;
  NSString *extensionBundleIdentifier;
  uint64_t v31;
  NSString *composedIdentifier;
  id v34;
  id v35;
  void *v36;
  void *v37;
  objc_super v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v34 = a7;
  v35 = a8;
  v38.receiver = self;
  v38.super_class = (Class)WBSWebExtensionData;
  v18 = -[WBSSafariExtension initWithExtension:extensionsController:](&v38, sel_initWithExtension_extensionsController_, v14, v15);
  if (v18)
  {
    objc_msgSend(v14, "_extensionBundle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v37 = 0;
      v20 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF710]), "initWithAppExtensionBundle:error:", v19, &v37);
      v21 = v37;
    }
    else
    {
      v24 = objc_alloc(MEMORY[0x1E0CEF710]);
      resourcesDirectoryURL = v18->_resourcesDirectoryURL;
      v36 = 0;
      v20 = objc_msgSend(v24, "initWithResourceBaseURL:error:", resourcesDirectoryURL, &v36);
      v21 = v36;
    }
    v26 = v21;
    webKitExtension = v18->_webKitExtension;
    v18->_webKitExtension = (_WKWebExtension *)v20;

    v23 = v16;
    if (v26)
    {
      v28 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v26, "safari_privacyPreservingDescription");
        objc_claimAutoreleasedReturnValue();
        -[WBSWebExtensionData initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:].cold.1();
      }

      v22 = 0;
    }
    else
    {
      v29 = objc_msgSend(v16, "copy");
      extensionBundleIdentifier = v18->_extensionBundleIdentifier;
      v18->_extensionBundleIdentifier = (NSString *)v29;

      v31 = objc_msgSend(v17, "copy");
      composedIdentifier = v18->_composedIdentifier;
      v18->_composedIdentifier = (NSString *)v31;

      objc_storeStrong((id *)&v18->_uniqueIdentifier, a7);
      objc_storeStrong((id *)&v18->_baseURIHost, a8);
      -[WBSWebExtensionData _configureWebKitExtensionContext](v18, "_configureWebKitExtensionContext");
      v22 = v18;
    }

  }
  else
  {
    v22 = 0;
    v23 = v16;
  }

  return v22;
}

- (WBSWebExtensionData)initWithManifestDictionary:(id)a3 extensionIdentifier:(id)a4 uniqueIdentifier:(id)a5
{
  id v8;
  id v9;
  id v10;
  WBSWebExtensionData *v11;
  uint64_t v12;
  _WKWebExtension *webKitExtension;
  uint64_t v14;
  NSString *composedIdentifier;
  WBSWebExtensionData *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)WBSWebExtensionData;
  v11 = -[WBSSafariExtension initWithExtension:extensionsController:](&v18, sel_initWithExtension_extensionsController_, 0, 0);
  if (v11)
  {
    v12 = objc_msgSend(objc_alloc(MEMORY[0x1E0CEF710]), "_initWithManifestDictionary:", v8);
    webKitExtension = v11->_webKitExtension;
    v11->_webKitExtension = (_WKWebExtension *)v12;

    v14 = objc_msgSend(v9, "copy");
    composedIdentifier = v11->_composedIdentifier;
    v11->_composedIdentifier = (NSString *)v14;

    objc_storeStrong((id *)&v11->_uniqueIdentifier, a5);
    objc_storeStrong((id *)&v11->_baseURIHost, a5);
    -[WBSWebExtensionData _configureWebKitExtensionContext](v11, "_configureWebKitExtensionContext");
    v16 = v11;
  }

  return v11;
}

- (_WKWebExtensionContext)webKitContext
{
  _WKWebExtensionContext *webKitContext;

  webKitContext = self->_webKitContext;
  if (!webKitContext)
  {
    -[WBSWebExtensionData _configureWebKitExtensionContext](self, "_configureWebKitExtensionContext");
    webKitContext = self->_webKitContext;
  }
  return webKitContext;
}

- (void)_configureWebKitExtensionContext
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSUUID *v8;
  NSUUID *baseURIHost;
  _WKWebExtensionContext *v10;
  _WKWebExtensionContext *webKitContext;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  _WKWebExtensionContext *v18;
  const void *v19;
  void *v20;
  void *v21;
  void *v22;
  _WKWebExtensionContext *v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  _WKWebExtensionContext *v28;
  id v29;
  uint64_t v30;
  _WKWebExtensionContext *v31;
  id v32;
  uint64_t v33;
  _WKWebExtensionContext *v34;
  id v35;
  uint64_t v36;
  _WKWebExtensionContext *v37;
  id v38;
  uint64_t v39;
  _WKWebExtensionContext *v40;
  id v41;
  uint64_t v42;
  _WKWebExtensionContext *v43;
  id v44;
  uint64_t v45;
  _WKWebExtensionContext *v46;
  id v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[5];
  _QWORD v51[5];
  _QWORD v52[5];
  _QWORD v53[5];
  _QWORD v54[5];
  _QWORD v55[5];

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData extension](self, "extension");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastSeenBaseURIForExtension:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = objc_alloc(MEMORY[0x1E0CB3A28]);
    objc_msgSend(v5, "host");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (NSUUID *)objc_msgSend(v6, "initWithUUIDString:", v7);
    baseURIHost = self->_baseURIHost;
    self->_baseURIHost = v8;

  }
  objc_msgSend(MEMORY[0x1E0CEF718], "contextForExtension:", self->_webKitExtension);
  v10 = (_WKWebExtensionContext *)objc_claimAutoreleasedReturnValue();
  webKitContext = self->_webKitContext;
  self->_webKitContext = v10;

  v12 = (void *)MEMORY[0x1E0C99E98];
  v13 = (void *)MEMORY[0x1E0CB3940];
  v14 = *MEMORY[0x1E0D8A6E8];
  -[NSUUID UUIDString](self->_baseURIHost, "UUIDString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringWithFormat:", CFSTR("%@://%@"), v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "URLWithString:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionContext setBaseURL:](self->_webKitContext, "setBaseURL:", v17);

  v18 = self->_webKitContext;
  v19 = (const void *)webKitContextAssociationKey;
  objc_msgSend(MEMORY[0x1E0D8A230], "wrapperWithObject:", self);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v18, v19, v20, (void *)1);

  -[_WKWebExtensionContext setUniqueIdentifier:](self->_webKitContext, "setUniqueIdentifier:", self->_composedIdentifier);
  -[_WKWebExtensionContext setHasAccessInPrivateBrowsing:](self->_webKitContext, "setHasAccessInPrivateBrowsing:", -[WBSWebExtensionData readAllowedInPrivateBrowsingValueFromDisk](self, "readAllowedInPrivateBrowsingValueFromDisk"));
  -[_WKWebExtensionContext setInspectable:](self->_webKitContext, "setInspectable:", 1);
  -[WBSWebExtensionData _remoteInspectionMenuTitle](self, "_remoteInspectionMenuTitle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionContext setInspectionName:](self->_webKitContext, "setInspectionName:", v21);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = self->_webKitContext;
  v24 = MEMORY[0x1E0C809B0];
  v25 = *MEMORY[0x1E0CEF878];
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke;
  v55[3] = &unk_1E5448590;
  v55[4] = self;
  v26 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v25, v23, 0, v55);
  v27 = *MEMORY[0x1E0CEF870];
  v28 = self->_webKitContext;
  v54[0] = v24;
  v54[1] = 3221225472;
  v54[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_2;
  v54[3] = &unk_1E5448590;
  v54[4] = self;
  v29 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v27, v28, 0, v54);
  v30 = *MEMORY[0x1E0CEF848];
  v31 = self->_webKitContext;
  v53[0] = v24;
  v53[1] = 3221225472;
  v53[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_3;
  v53[3] = &unk_1E5448590;
  v53[4] = self;
  v32 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v30, v31, 0, v53);
  v33 = *MEMORY[0x1E0CEF838];
  v34 = self->_webKitContext;
  v52[0] = v24;
  v52[1] = 3221225472;
  v52[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_4;
  v52[3] = &unk_1E5448590;
  v52[4] = self;
  v35 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v33, v34, 0, v52);
  v36 = *MEMORY[0x1E0CEF868];
  v37 = self->_webKitContext;
  v51[0] = v24;
  v51[1] = 3221225472;
  v51[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_5;
  v51[3] = &unk_1E5448590;
  v51[4] = self;
  v38 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v36, v37, 0, v51);
  v39 = *MEMORY[0x1E0CEF860];
  v40 = self->_webKitContext;
  v50[0] = v24;
  v50[1] = 3221225472;
  v50[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_6;
  v50[3] = &unk_1E5448590;
  v50[4] = self;
  v41 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v39, v40, 0, v50);
  v42 = *MEMORY[0x1E0CEF840];
  v43 = self->_webKitContext;
  v49[0] = v24;
  v49[1] = 3221225472;
  v49[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_7;
  v49[3] = &unk_1E5448590;
  v49[4] = self;
  v44 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v42, v43, 0, v49);
  v45 = *MEMORY[0x1E0CEF830];
  v46 = self->_webKitContext;
  v48[0] = v24;
  v48[1] = 3221225472;
  v48[2] = __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_8;
  v48[3] = &unk_1E5448590;
  v48[4] = self;
  v47 = (id)objc_msgSend(v22, "addObserverForName:object:queue:usingBlock:", v45, v46, 0, v48);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF858]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("webExtensionPermissionsWereGranted"), *(_QWORD *)(a1 + 32), v6);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF858]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("webExtensionPermissionsWereRevoked"), *(_QWORD *)(a1 + 32), v6);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF858]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("webExtensionGrantedPermissionsWereRemoved"), *(_QWORD *)(a1 + 32), v6);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF858]);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v8, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("webExtensionRevokedPermissionsWereRemoved"), *(_QWORD *)(a1 + 32), v6);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_5(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF850]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("webExtensionPermissionsWereGranted"), *(_QWORD *)(a1 + 32), v7);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_6(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF850]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("webExtensionPermissionsWereRevoked"), *(_QWORD *)(a1 + 32), v7);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_7(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF850]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("webExtensionGrantedPermissionsWereRemoved"), *(_QWORD *)(a1 + 32), v7);

}

void __55__WBSWebExtensionData__configureWebKitExtensionContext__block_invoke_8(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x1E0CEF850]);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v9);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_userInfoDictionaryForPermissionsNotificationWithPermissions:origins:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("webExtensionRevokedPermissionsWereRemoved"), *(_QWORD *)(a1 + 32), v7);

}

- (id)baseURIHost
{
  return self->_baseURIHost;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%@ %p (composed identifier \"%@\") %@ %@>"), objc_opt_class(), self, self->_composedIdentifier, self->_webKitExtension, self->_webKitContext);
}

- (BOOL)manifestParsedSuccessfully
{
  void *v2;
  BOOL v3;

  -[_WKWebExtension manifest](self->_webKitExtension, "manifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

- (id)manifestDictionary
{
  return (id)-[_WKWebExtension manifest](self->_webKitExtension, "manifest");
}

- (NSUUID)identifier
{
  return (NSUUID *)-[NSExtension sf_uniqueIdentifier](self->_extension, "sf_uniqueIdentifier");
}

- (NSString)displayName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  -[_WKWebExtension displayName](self->_webKitExtension, "displayName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSExtension safari_localizedDisplayName](self->_extension, "safari_localizedDisplayName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5 = v6;
    }
    else
    {
      -[NSExtension identifier](self->_extension, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "componentsSeparatedByString:", CFSTR("."));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v5 = (id)objc_claimAutoreleasedReturnValue();

    }
  }

  return (NSString *)v5;
}

- (NSString)displayShortName
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_WKWebExtension displayShortName](self->_webKitExtension, "displayShortName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WBSWebExtensionData displayName](self, "displayName");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayVersion
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_WKWebExtension displayVersion](self->_webKitExtension, "displayVersion");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSExtension safari_displayVersion](self->_extension, "safari_displayVersion");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)displayDescription
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_WKWebExtension displayDescription](self->_webKitExtension, "displayDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[NSExtension safari_humanReadableDescription](self->_extension, "safari_humanReadableDescription");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (NSString *)v6;
}

- (NSString)processDisplayName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "profileName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)MEMORY[0x1E0CB3940];
  _WBSLocalizedString();
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayShortName](self, "displayShortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7, v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayShortName](self, "displayShortName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v4, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)version
{
  return (NSString *)-[_WKWebExtension version](self->_webKitExtension, "version");
}

- (UIImage)preferencesIcon
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_WKWebExtension iconForSize:](self->_webKitExtension, "iconForSize:", (double)webExtensionPreferencesIconIdealPointSize, (double)webExtensionPreferencesIconIdealPointSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WBSWebExtensionData _containingAppIcon](self, "_containingAppIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)icon
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[_WKWebExtension iconForSize:](self->_webKitExtension, "iconForSize:", (double)webExtensionLargeIconIdealPointSize, (double)webExtensionLargeIconIdealPointSize);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    -[WBSWebExtensionData _containingAppIcon](self, "_containingAppIcon");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return (UIImage *)v6;
}

- (UIImage)toolbarImage
{
  void *v3;
  unint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "toolbarItemIdealPointSize");

  -[_WKWebExtension actionIconForSize:](self->_webKitExtension, "actionIconForSize:", (double)v4, (double)v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    -[WBSWebExtensionData _containingAppIcon](self, "_containingAppIcon");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  v8 = v7;

  return (UIImage *)v8;
}

- (BOOL)backgroundPageIsPersistent
{
  return -[_WKWebExtension backgroundContentIsPersistent](self->_webKitExtension, "backgroundContentIsPersistent");
}

- (BOOL)backgroundPageIsServiceWorker
{
  return -[_WKWebExtension _backgroundContentIsServiceWorker](self->_webKitExtension, "_backgroundContentIsServiceWorker");
}

- (BOOL)hasInjectedContentDataForURL:(id)a3
{
  return -[_WKWebExtensionContext hasInjectedContentForURL:](self->_webKitContext, "hasInjectedContentForURL:", a3);
}

- (NSURL)newTabOverridePageURL
{
  -[_WKWebExtensionContext overrideNewTabPageURL](self->_webKitContext, "overrideNewTabPageURL");
  return (NSURL *)objc_claimAutoreleasedReturnValue();
}

- (NSArray)manifestErrors
{
  return (NSArray *)-[_WKWebExtension errors](self->_webKitExtension, "errors");
}

- (BOOL)canLoad
{
  return -[WBSWebExtensionData canLoadWithErrorString:](self, "canLoadWithErrorString:", 0);
}

- (BOOL)canLoadWithErrorString:(id *)a3
{
  int64_t v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v5 = -[WBSWebExtensionData extensionSupportsCurrentSafariVersion](self, "extensionSupportsCurrentSafariVersion");
  -[WBSWebExtensionData manifestErrors](self, "manifestErrors");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a3 && objc_msgSend(v6, "count"))
  {
    objc_msgSend(v7, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedDescription");
    *a3 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (v5)
    v9 = 0;
  else
    v9 = -[WBSWebExtensionData manifestParsedSuccessfully](self, "manifestParsedSuccessfully");

  return v9;
}

- (void)load
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v6, v4, "Unable to load WebKit extension with identifier %{private}@ with error: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

id __27__WBSWebExtensionData_load__block_invoke()
{
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)unload
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v6, v4, "Unable to unload WebKit extension with identifier %{private}@ with error: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (BOOL)shouldShowInWebsitePreferences
{
  void *v3;
  BOOL v4;

  -[WBSWebExtensionData configuredPermissionOrigins](self, "configuredPermissionOrigins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
    v4 = 1;
  else
    v4 = -[WBSWebExtensionData _requestsAccessToAllHostsThroughImplicitPermission](self, "_requestsAccessToAllHostsThroughImplicitPermission");

  return v4;
}

- (void)_unloadInPrivateBrowsing
{
  void *v3;
  id v4;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "closeLocalExtensionContentInPrivateTabsForExtension:", v3);

}

- (id)_containingAppIcon
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v2 = (void *)MEMORY[0x1E0CB34D0];
  -[NSExtension _plugIn](self->_extension, "_plugIn");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containingUrl");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleWithURL:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CEA638];
  objc_msgSend(v5, "bundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "scale");
  objc_msgSend(v6, "_applicationIconImageForBundleIdentifier:format:scale:", v7, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)hasAction
{
  void *v3;
  void *v4;
  BOOL v5;

  if (!-[WBSWebExtensionData usesManifestVersion3](self, "usesManifestVersion3"))
    return 0;
  -[WBSWebExtensionData manifestDictionary](self, "manifestDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

- (BOOL)hasBrowserAction
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[WBSWebExtensionData usesManifestVersion3](self, "usesManifestVersion3"))
    return 0;
  -[WBSWebExtensionData manifestDictionary](self, "manifestDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("browser_action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (BOOL)hasPageAction
{
  BOOL v3;
  void *v4;
  void *v5;

  if (-[WBSWebExtensionData usesManifestVersion3](self, "usesManifestVersion3")
    || -[WBSWebExtensionData hasBrowserAction](self, "hasBrowserAction"))
  {
    return 0;
  }
  -[WBSWebExtensionData manifestDictionary](self, "manifestDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_dictionaryForKey:", CFSTR("page_action"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v5 != 0;

  return v3;
}

- (BOOL)hasCommands
{
  return -[_WKWebExtension hasCommands](self->_webKitExtension, "hasCommands");
}

- (BOOL)hasStorage
{
  return -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("storage"))
      || -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("unlimitedStorage"));
}

- (BOOL)shouldShowToolbarItemForTab:(id)a3
{
  id v4;
  char v5;
  BOOL v7;
  void *v8;
  char v9;

  v4 = a3;
  if (-[WBSWebExtensionData hasPageAction](self, "hasPageAction")
    || -[WBSWebExtensionData hasBrowserAction](self, "hasBrowserAction")
    || -[WBSWebExtensionData hasAction](self, "hasAction"))
  {
    v5 = 1;
  }
  else
  {
    v7 = -[WBSWebExtensionData hasPendingWebsiteRequests](self, "hasPendingWebsiteRequests");
    -[WBSWebExtensionData toolbarItem](self, "toolbarItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "shouldRequestAccessForTab:", v4);

    v5 = v7 | v9;
  }

  return v5;
}

- (int64_t)manifestVersion
{
  double v2;

  -[_WKWebExtension manifestVersion](self->_webKitExtension, "manifestVersion");
  return (uint64_t)v2;
}

- (BOOL)usesManifestVersion3
{
  return -[_WKWebExtension supportsManifestVersion:](self->_webKitExtension, "supportsManifestVersion:", 3.0);
}

- (NSArray)commands
{
  NSArray *commands;
  void *v4;
  NSArray *v5;
  NSArray *v6;

  commands = self->_commands;
  if (!commands)
  {
    -[_WKWebExtensionContext commands](self->_webKitContext, "commands");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safari_mapObjectsUsingBlock:", &__block_literal_global_206);
    v5 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_commands;
    self->_commands = v5;

    commands = self->_commands;
  }
  return commands;
}

WBSWebExtensionCommand *__31__WBSWebExtensionData_commands__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  WBSWebExtensionCommand *v3;

  v2 = a2;
  v3 = -[WBSWebExtensionCommand initWithWebKitCommand:]([WBSWebExtensionCommand alloc], "initWithWebKitCommand:", v2);

  return v3;
}

- (id)extensionStateWithPreviousState:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;

  v4 = (void *)objc_msgSend(a3, "mutableCopy");
  -[WBSWebExtensionData manifestPermissions](self, "manifestPermissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = MEMORY[0x1E0C9AA60];
  if (v6)
    v9 = v6;
  else
    v9 = MEMORY[0x1E0C9AA60];
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v9, CFSTR("Permissions"));

  -[WBSWebExtensionData manifestAccessibleOrigins](self, "manifestAccessibleOrigins");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "safari_mapAndFilterObjectsUsingBlock:", &__block_literal_global_209);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    v14 = v12;
  else
    v14 = v8;
  objc_msgSend(v4, "setObject:forKeyedSubscript:", v14, CFSTR("AccessibleOrigins"));

  return v4;
}

id __55__WBSWebExtensionData_extensionStateWithPreviousState___block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "description");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (NSURL)optionsPageURL
{
  return (NSURL *)-[_WKWebExtensionContext optionsPageURL](self->_webKitContext, "optionsPageURL");
}

- (NSDictionary)userVisiblePermissions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  char v24;
  _BOOL4 v25;
  _QWORD *v26;
  void *v27;
  void *v28;
  NSURL *v29;
  void *v30;
  void *v31;
  uint64_t v33;
  void *v34;

  if (-[WBSWebExtensionData canLoad](self, "canLoad"))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSSafariExtension extensionsController](self, "extensionsController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "loadPermissionsIfNecessaryForExtension:", self);
    v33 = *MEMORY[0x1E0D8A328];
    objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D8A318]);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSWebExtensionData hasAbilityToInjectContentIntoWebpages](self, "hasAbilityToInjectContentIntoWebpages"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, *MEMORY[0x1E0D8A320]);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSWebExtensionData hasDeclarativeNetRequestHostAccessPermission](self, "hasDeclarativeNetRequestHostAccessPermission"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v5, *MEMORY[0x1E0D8A350]);

    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData currentPermissionOrigins](self, "currentPermissionOrigins");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    addHostsFromPatternsToSet(v7, v6);

    v8 = objc_msgSend(v6, "containsObject:", CFSTR("*"));
    v9 = (_QWORD *)MEMORY[0x1E0D8A308];
    if (v8)
    {
      v10 = *MEMORY[0x1E0D8A310];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D8A308], *MEMORY[0x1E0D8A310]);
    }
    else if (objc_msgSend(v6, "count"))
    {
      objc_msgSend(v6, "safari_sortedArrayUsingFinderLikeSorting");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = *MEMORY[0x1E0D8A310];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v11, *MEMORY[0x1E0D8A310]);

    }
    else
    {
      v10 = *MEMORY[0x1E0D8A310];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D8A340], *MEMORY[0x1E0D8A310]);
    }
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData manifestAccessibleOrigins](self, "manifestAccessibleOrigins");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    addHostsFromPatternsToSet(v13, v12);

    objc_msgSend(v12, "unionSet:", v6);
    if ((objc_msgSend(v12, "containsObject:", CFSTR("*")) & 1) != 0
      || -[WBSWebExtensionData _requestsAccessToAllHostsThroughImplicitPermission](self, "_requestsAccessToAllHostsThroughImplicitPermission"))
    {
      v14 = *MEMORY[0x1E0D8A348];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *v9, *MEMORY[0x1E0D8A348]);
    }
    else if (objc_msgSend(v12, "count"))
    {
      objc_msgSend(v12, "safari_sortedArrayUsingFinderLikeSorting");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *MEMORY[0x1E0D8A348];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, *MEMORY[0x1E0D8A348]);

    }
    else
    {
      v14 = *MEMORY[0x1E0D8A348];
      objc_msgSend(v3, "setObject:forKeyedSubscript:", *MEMORY[0x1E0D8A340], *MEMORY[0x1E0D8A348]);
    }
    v15 = -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("activeTab"));
    objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData composedIdentifier](self, "composedIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v16, "allDomainsAreManagedForComposedIdentifier:", v17);

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15 & ~v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v19, CFSTR("Requested Current Site"));

    objc_msgSend(v3, "objectForKeyedSubscript:", v10);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = *MEMORY[0x1E0D8A340];
    if (objc_msgSend(v20, "isEqual:", *MEMORY[0x1E0D8A340]))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", v14);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v22, "isEqual:", v21) & 1) != 0)
      {
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("Requested Current Site"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "BOOLValue");

        if ((v24 & 1) == 0)
        {
          v25 = -[WBSWebExtensionData hasDeclarativeNetRequestPermission](self, "hasDeclarativeNetRequestPermission");
          v26 = (_QWORD *)MEMORY[0x1E0D8A338];
          if (!v25)
            v26 = (_QWORD *)MEMORY[0x1E0D8A330];
          objc_msgSend(v3, "setObject:forKeyedSubscript:", *v26, v33);
        }
        goto LABEL_21;
      }

    }
LABEL_21:
    v28 = (void *)MEMORY[0x1E0CB37E8];
    v29 = -[WBSWebExtensionData newTabOverridePageURL](self, "newTabOverridePageURL");
    objc_msgSend(v28, "numberWithBool:", v29 != 0);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v30, CFSTR("Override Page"));

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", -[WBSWebExtensionData allowedInPrivateBrowsing](self, "allowedInPrivateBrowsing"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v31, *MEMORY[0x1E0D8A540]);

    return (NSDictionary *)v3;
  }
  v3 = 0;
  return (NSDictionary *)v3;
}

+ (id)unlocalizedManifestDictionaryFromData:(id)a3 withExtensionIdentifier:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v23[5];

  v23[4] = *(id *)MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v7)
  {
    v23[0] = 0;
    objc_msgSend(MEMORY[0x1E0CB36D8], "JSONObjectWithData:options:error:", v7, 0, v23);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v23[0];
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v11 = v9;
    else
      v11 = 0;
    v12 = v11;

    if (v12)
    {
      v13 = v12;
    }
    else
    {
      if (a5)
      {
        objc_msgSend((id)objc_opt_class(), "createWebExtensionError:underlyingError:", 3, v10);
        *a5 = (id)objc_claimAutoreleasedReturnValue();
      }
      if (v10)
      {
        v14 = (id)WBS_LOG_CHANNEL_PREFIXWebExtensions();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(v10, "safari_privacyPreservingDescription");
          objc_claimAutoreleasedReturnValue();
          +[WBSWebExtensionData unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:].cold.2();
        }

      }
      else
      {
        v15 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          +[WBSWebExtensionData unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:].cold.1((uint64_t)v8, v15, v16, v17, v18, v19, v20, v21);
      }
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)hasPermission:(id)a3
{
  return -[_WKWebExtensionContext hasPermission:](self->_webKitContext, "hasPermission:", a3);
}

- (BOOL)hasDeclarativeNetRequestPermission
{
  return -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("declarativeNetRequest"))
      || -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("declarativeNetRequestWithHostAccess"));
}

- (BOOL)hasDeclarativeNetRequestHostAccessPermission
{
  return -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("declarativeNetRequestWithHostAccess"));
}

- (BOOL)hasPermissionToAccessURL:(id)a3
{
  return -[_WKWebExtensionContext hasAccessToURL:](self->_webKitContext, "hasAccessToURL:", a3);
}

- (int64_t)permissionStateForURL:(id)a3
{
  return -[WBSWebExtensionData permissionStateForURL:options:](self, "permissionStateForURL:options:", a3, 0);
}

- (int64_t)permissionStateForURL:(id)a3 options:(unint64_t)a4
{
  id v5;
  uint64_t v6;
  int64_t v7;

  v5 = a3;
  if (v5
    && (v6 = -[_WKWebExtensionContext permissionStatusForURL:](self->_webKitContext, "permissionStatusForURL:", v5),
        (unint64_t)(v6 + 3) < 7))
  {
    v7 = qword_1A84E3948[v6 + 3];
  }
  else
  {
    v7 = -2;
  }

  return v7;
}

- (BOOL)hasPermissionToAccessAllURLs
{
  return -[_WKWebExtensionContext hasAccessToAllURLs](self->_webKitContext, "hasAccessToAllURLs");
}

- (BOOL)hasPermissionToAccessAllHosts
{
  return -[_WKWebExtensionContext hasAccessToAllHosts](self->_webKitContext, "hasAccessToAllHosts");
}

- (BOOL)requestsAccessToAllHosts
{
  void *v3;
  BOOL v4;

  -[WBSWebExtensionData manifestAccessibleOrigins](self, "manifestAccessibleOrigins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = +[WBSWebExtensionMatchPattern patternSetContainsAllHostsPattern:](WBSWebExtensionMatchPattern, "patternSetContainsAllHostsPattern:", v3)|| -[WBSWebExtensionData _requestsAccessToAllHostsThroughImplicitPermission](self, "_requestsAccessToAllHostsThroughImplicitPermission");

  return v4;
}

- (BOOL)_requestsAccessToAllHostsThroughImplicitPermission
{
  return -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("tabs"))
      || -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("webNavigation"));
}

- (BOOL)requestedOptionalAccessToAllHosts
{
  return -[_WKWebExtensionContext requestedOptionalAccessToAllHosts](self->_webKitContext, "requestedOptionalAccessToAllHosts");
}

- (void)setRequestedOptionalAccessToAllHosts:(BOOL)a3
{
  -[_WKWebExtensionContext setRequestedOptionalAccessToAllHosts:](self->_webKitContext, "setRequestedOptionalAccessToAllHosts:", a3);
}

- (id)_userInfoDictionaryForPermissionsNotificationWithPermissions:(id)a3 origins:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[3];
  _QWORD v12[4];

  v12[3] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11[0] = CFSTR("permissions");
  v11[1] = CFSTR("permissionOrigins");
  v12[0] = v6;
  v12[1] = v7;
  v11[2] = CFSTR("permissionsWereUpdatedDueToAnExternalChange");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_permissionsAreBeingUpdatedDueToAnExternalChange);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, v11, 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)grantPermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5
{
  id v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint8_t v26;
  _BYTE v27[15];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[16];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v25 = a3;
  v24 = a4;
  v8 = a5;
  if (self->_webKitContext)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A840B000, v9, OS_LOG_TYPE_INFO, "grantPermissions:origins:expirationDate: called with non-nil _webKitContext", buf, 2u);
    }
  }
  else
  {
    v10 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[WBSWebExtensionData grantPermissions:origins:expirationDate:].cold.2(v10, v11, v12);
  }
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v13 = v25;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v13);
        -[_WKWebExtensionContext setPermissionStatus:forPermission:expirationDate:](self->_webKitContext, "setPermissionStatus:forPermission:expirationDate:", 3, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i), v8);
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v14);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v17 = v24;
  v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v18; ++j)
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v17);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * j), "webKitMatchPattern");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A840B000, v22, OS_LOG_TYPE_INFO, "grantPermissions:origins:expirationDate: webKitMatchPattern is non-nil", buf, 2u);
          }
        }
        else
        {
          v23 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
            -[WBSWebExtensionData grantPermissions:origins:expirationDate:].cold.1(&v26, v27, v23);
        }
        -[_WKWebExtensionContext setPermissionStatus:forMatchPattern:expirationDate:](self->_webKitContext, "setPermissionStatus:forMatchPattern:expirationDate:", 3, v21, v8);

      }
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v18);
  }

}

- (void)revokePermissions:(id)a3 origins:(id)a4 expirationDate:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _WKWebExtensionContext *webKitContext;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v20 = a4;
  v9 = a5;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v11)
  {
    v12 = *(_QWORD *)v26;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v26 != v12)
          objc_enumerationMutation(v10);
        -[_WKWebExtensionContext setPermissionStatus:forPermission:expirationDate:](self->_webKitContext, "setPermissionStatus:forPermission:expirationDate:", -3, *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v13++), v9);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v11);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v14 = v20;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v15)
  {
    v16 = *(_QWORD *)v22;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v22 != v16)
          objc_enumerationMutation(v14);
        webKitContext = self->_webKitContext;
        objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v17), "webKitMatchPattern");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WKWebExtensionContext setPermissionStatus:forMatchPattern:expirationDate:](webKitContext, "setPermissionStatus:forMatchPattern:expirationDate:", -3, v19, v9);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v15);
  }

}

- (void)removeGrantedPermissions:(id)a3 origins:(id)a4 exactPatternMatchesOnly:(BOOL)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _WKWebExtensionContext *webKitContext;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v9);
        -[_WKWebExtensionContext setPermissionStatus:forPermission:](self->_webKitContext, "setPermissionStatus:forPermission:", 0, *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12++));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v10);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v8;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v20;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v13);
        webKitContext = self->_webKitContext;
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v16), "webKitMatchPattern", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[_WKWebExtensionContext setPermissionStatus:forMatchPattern:](webKitContext, "setPermissionStatus:forMatchPattern:", 0, v18);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v14);
  }

}

- (NSSet)currentPermissions
{
  return (NSSet *)-[_WKWebExtensionContext currentPermissions](self->_webKitContext, "currentPermissions");
}

- (NSSet)currentPermissionOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtensionContext currentPermissionMatchPatterns](self->_webKitContext, "currentPermissionMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)_configuredDictionaryWithRequested:(id)a3 granted:(id)a4 revoked:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v7;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E547A230, *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * v14++));
      }
      while (v12 != v14);
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v38, 16);
    }
    while (v12);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v15 = v8;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
  if (v16)
  {
    v17 = *(_QWORD *)v29;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v15);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E547A218, *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v18++));
      }
      while (v16 != v18);
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v28, v37, 16);
    }
    while (v16);
  }

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
  if (v20)
  {
    v21 = *(_QWORD *)v25;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v25 != v21)
          objc_enumerationMutation(v19);
        objc_msgSend(v10, "setObject:forKeyedSubscript:", &unk_1E547A248, *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v22++));
      }
      while (v20 != v22);
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v36, 16);
    }
    while (v20);
  }

  return v10;
}

- (NSDictionary)configuredPermissions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WBSWebExtensionData manifestPermissions](self, "manifestPermissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData grantedPermissions](self, "grantedPermissions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData revokedPermissions](self, "revokedPermissions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData _configuredDictionaryWithRequested:granted:revoked:](self, "_configuredDictionaryWithRequested:granted:revoked:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSDictionary)configuredPermissionOrigins
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[WBSWebExtensionData manifestAccessibleOrigins](self, "manifestAccessibleOrigins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData grantedPermissionOrigins](self, "grantedPermissionOrigins");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData revokedPermissionOrigins](self, "revokedPermissionOrigins");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData _configuredDictionaryWithRequested:granted:revoked:](self, "_configuredDictionaryWithRequested:granted:revoked:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v6;
}

- (NSSet)requestedPermissionsNotAlreadyConfigured
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[WBSWebExtensionData configuredPermissions](self, "configuredPermissions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_219);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

id __63__WBSWebExtensionData_requestedPermissionsNotAlreadyConfigured__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue"))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (NSSet)requestedPermissionOriginsNotAlreadyConfigured
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[WBSWebExtensionData configuredPermissionOrigins](self, "configuredPermissionOrigins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safari_mapAndFilterKeysAndObjectsUsingBlock:", &__block_literal_global_221);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v6;
}

id __69__WBSWebExtensionData_requestedPermissionOriginsNotAlreadyConfigured__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  if (objc_msgSend(v3, "integerValue"))
    v4 = 0;
  else
    v4 = v3;
  v5 = v4;

  return v5;
}

- (NSSet)manifestPermissions
{
  return (NSSet *)-[_WKWebExtension requestedPermissions](self->_webKitExtension, "requestedPermissions");
}

- (NSSet)manifestOptionalPermissions
{
  return (NSSet *)-[_WKWebExtension optionalPermissions](self->_webKitExtension, "optionalPermissions");
}

- (NSDictionary)grantedPermissions
{
  return (NSDictionary *)-[_WKWebExtensionContext grantedPermissions](self->_webKitContext, "grantedPermissions");
}

- (void)setGrantedPermissions:(id)a3
{
  -[_WKWebExtensionContext setGrantedPermissions:](self->_webKitContext, "setGrantedPermissions:", a3);
}

- (NSDictionary)revokedPermissions
{
  return (NSDictionary *)-[_WKWebExtensionContext deniedPermissions](self->_webKitContext, "deniedPermissions");
}

- (void)setRevokedPermissions:(id)a3
{
  -[_WKWebExtensionContext setDeniedPermissions:](self->_webKitContext, "setDeniedPermissions:", a3);
}

- (NSSet)manifestAccessibleOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtension allRequestedMatchPatterns](self->_webKitExtension, "allRequestedMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)manifestPermissionOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtension requestedPermissionMatchPatterns](self->_webKitExtension, "requestedPermissionMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSSet)manifestOptionalPermissionOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtension optionalPermissionMatchPatterns](self->_webKitExtension, "optionalPermissionMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[WBSWebExtensionMatchPattern matchPatternsWtihWebKitPatterns:](WBSWebExtensionMatchPattern, "matchPatternsWtihWebKitPatterns:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (NSDictionary)grantedPermissionOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtensionContext grantedPermissionMatchPatterns](self->_webKitContext, "grantedPermissionMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_569);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setGrantedPermissionOrigins:(id)a3
{
  id v4;

  objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_571);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionContext setGrantedPermissionMatchPatterns:](self->_webKitContext, "setGrantedPermissionMatchPatterns:");

}

- (NSDictionary)revokedPermissionOrigins
{
  void *v2;
  void *v3;

  -[_WKWebExtensionContext deniedPermissionMatchPatterns](self->_webKitContext, "deniedPermissionMatchPatterns");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_569);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDictionary *)v3;
}

- (void)setRevokedPermissionOrigins:(id)a3
{
  id v4;

  objc_msgSend(a3, "safari_mapAndFilterKeysUsingBlock:", &__block_literal_global_571);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[_WKWebExtensionContext setDeniedPermissionMatchPatterns:](self->_webKitContext, "setDeniedPermissionMatchPatterns:");

}

+ (id)unsupportedManifestKeysInDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "_manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D8A0A8], "sharedLogger");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "didConvertExtensionWithKeySupport:", v6);

  objc_msgSend(a1, "_unsupportedKeysFromKeySupportDictionary:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)_unsupportedKeysFromKeySupportDictionary:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "keysOfEntriesPassingTest:", &__block_literal_global_224);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __64__WBSWebExtensionData__unsupportedKeysFromKeySupportDictionary___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;

  v4 = a2;
  v5 = a3;
  if (objc_msgSend(v5, "unsignedIntegerValue"))
  {
    v6 = 0;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = objc_msgSend(v4, "isEqualToString:", CFSTR("unknownKeyCount")) ^ 1;
    else
      v6 = 1;
  }

  return v6;
}

+ (id)_manifestKeySupportForDictionary:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  id v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v26 = a4;
  v24 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v28;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v28 != v11)
          objc_enumerationMutation(v9);
        v13 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v13);
          goto LABEL_19;
        }
        objc_msgSend(v26, "objectForKeyedSubscript:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v14)
        {
          objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("unknownKeyCount"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "unsignedIntegerValue");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18 + 1);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v19, CFSTR("unknownKeyCount"));

          objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v13);
          goto LABEL_18;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v15 = v14;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isShortVersion:supportedInSafariVersion:", v15, v24));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, v13);
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v13);
            goto LABEL_18;
          }
          objc_msgSend(v9, "objectForKeyedSubscript:", v13);
          v15 = (id)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);
            objc_msgSend(a1, "_manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:", v15, v14, v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_mergeKeySupportDictionary:intoDictionary:", v16, v8);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
            {
              objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v13);
              goto LABEL_11;
            }
            objc_msgSend(v8, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], v13);
            {
              v20 = (void *)+[WBSWebExtensionData _manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:]::patternKeys;
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("permissions"), CFSTR("optional_permissions"), CFSTR("host_permissions"), CFSTR("optional_host_permissions"), CFSTR("matches"), CFSTR("exclude_matches"), CFSTR("matches"), 0);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              +[WBSWebExtensionData _manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:]::patternKeys = (uint64_t)v20;
            }
            if (objc_msgSend(v20, "containsObject:", v13))
            {
              objc_msgSend(v15, "safari_filterObjectsUsingBlock:", &__block_literal_global_227);
              v21 = objc_claimAutoreleasedReturnValue();

              v15 = (id)v21;
            }
            objc_msgSend(a1, "_unsupportedValuesInArray:withSupportedFeatures:currentSafariShortVersion:", v15, v14, v24);
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_mergeKeySupportDictionary:intoDictionary:", v16, v8);
          }
        }

LABEL_11:
LABEL_18:

LABEL_19:
        ++v12;
      }
      while (v10 != v12);
      v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
      v10 = v22;
    }
    while (v22);
  }

  return v8;
}

uint64_t __104__WBSWebExtensionData__manifestKeySupportForDictionary_withSupportedFeatures_currentSafariShortVersion___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;

  v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = objc_msgSend(v2, "containsString:", CFSTR("://"));
  else
    v3 = 0;
  v4 = v3 ^ 1u;

  return v4;
}

+ (id)_unsupportedValuesInArray:(id)a3 withSupportedFeatures:(id)a4 currentSafariShortVersion:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id obj;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v22 = a4;
  v21 = a5;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  obj = v8;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v24;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(obj);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v22, "objectForKeyedSubscript:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(a1, "_isShortVersion:supportedInSafariVersion:", v14, v21));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v15, v13);

          }
          else
          {
            objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("unknownKeyCount"));
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "unsignedIntegerValue");

            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v17 + 1);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "setObject:forKeyedSubscript:", v18, CFSTR("unknownKeyCount"));

            objc_msgSend(v9, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], v13);
          }
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(a1, "_unsupportedValuesInArray:withSupportedFeatures:currentSafariShortVersion:", v13, v22, v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_mergeKeySupportDictionary:intoDictionary:", v14, v9);
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) == 0)
              goto LABEL_15;
            objc_msgSend(a1, "_manifestKeySupportForDictionary:withSupportedFeatures:currentSafariShortVersion:", v13, v22, v21);
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(a1, "_mergeKeySupportDictionary:intoDictionary:", v14, v9);
          }
        }

LABEL_15:
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v10);
  }

  return v9;
}

+ (void)_mergeKeySupportDictionary:(id)a3 intoDictionary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("unknownKeyCount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntegerValue");
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("unknownKeyCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithUnsignedInteger:", objc_msgSend(v9, "unsignedIntegerValue") + v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addEntriesFromDictionary:", v11);
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v10, CFSTR("unknownKeyCount"));

}

+ (BOOL)_isShortVersion:(id)a3 supportedInSafariVersion:(id)a4
{
  id v5;
  id v6;
  BOOL v7;

  v5 = a3;
  v6 = a4;
  v7 = (objc_msgSend(v5, "isEqualToString:", CFSTR("allowedToIgnore")) & 1) != 0
    || objc_msgSend(v5, "compare:", v6) != 1;

  return v7;
}

- (id)_minimumSafariVersionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WBSWebExtensionData manifest](self, "manifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_dictionaryForKey:", CFSTR("browser_specific_settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("safari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("strict_min_version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("*")) & 1) != 0)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (id)_maximumSafariVersionString
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[WBSWebExtensionData manifest](self, "manifest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_dictionaryForKey:", CFSTR("browser_specific_settings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safari_dictionaryForKey:", CFSTR("safari"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safari_stringForKey:", CFSTR("strict_max_version"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("*")) & 1) != 0)
    v6 = 0;
  else
    v6 = v5;

  return v6;
}

- (int64_t)extensionSupportsCurrentSafariVersion
{
  void *v3;
  void *v4;
  int64_t v5;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_safariShortVersion");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = -[WBSWebExtensionData extensionSupportsSafariShortVersion:](self, "extensionSupportsSafariShortVersion:", v4);
  return v5;
}

- (int64_t)extensionSupportsSafariShortVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  int64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  unint64_t v23;
  void *v24;
  unint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v30;
  void *v31;

  v4 = a3;
  if (-[WBSWebExtensionData manifestParsedSuccessfully](self, "manifestParsedSuccessfully"))
  {
    -[WBSWebExtensionData manifestDictionary](self, "manifestDictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safari_numberForKey:", CFSTR("manifest_version"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v9 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:].cold.1((uint64_t)self, v9, v10, v11, v12, v13, v14, v15);
      v8 = 6;
      goto LABEL_38;
    }
    if (objc_msgSend(v6, "integerValue") < 0 || (unint64_t)objc_msgSend(v6, "unsignedIntegerValue") <= 1)
    {
      v7 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:].cold.2();
      v8 = 4;
      goto LABEL_38;
    }
    if ((unint64_t)objc_msgSend(v6, "unsignedIntegerValue") >= 4)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXWebExtensions();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSWebExtensionData extensionSupportsSafariShortVersion:].cold.3();
      v8 = 5;
      goto LABEL_38;
    }
    -[WBSWebExtensionData _minimumSafariVersionString](self, "_minimumSafariVersionString");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      if ((objc_msgSend(v17, "containsString:", CFSTR("*")) & 1) != 0)
      {
        v8 = 3;
LABEL_37:

LABEL_38:
        goto LABEL_39;
      }
      if (objc_msgSend(v17, "compare:options:", v4, 64) == 1)
      {
        v8 = 1;
        goto LABEL_37;
      }
    }
    -[WBSWebExtensionData _maximumSafariVersionString](self, "_maximumSafariVersionString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v18, "length");
    if (!v8)
    {
LABEL_36:

      goto LABEL_37;
    }
    objc_msgSend(MEMORY[0x1E0CB38E8], "regularExpressionWithPattern:options:error:", CFSTR("\\*"), 0, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "numberOfMatchesInString:options:range:", v18, 0, 0, v8);
    if (v20)
    {
      if (v20 != 1 || (v21 = objc_msgSend(v18, "rangeOfString:", CFSTR(".*")), v21 != v8 - 2))
      {
        v8 = 3;
LABEL_35:

        goto LABEL_36;
      }
      objc_msgSend(v4, "componentsSeparatedByString:", CFSTR("."));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      objc_msgSend(v18, "componentsSeparatedByString:", CFSTR("."));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "count");
      if (v23 >= v25)
      {
        v31 = v24;
        v27 = (void *)objc_msgSend(v24, "mutableCopy");
        objc_msgSend(v22, "objectAtIndexedSubscript:", v25 - 1);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "setObject:atIndexedSubscript:", v30, v25 - 1);

        if (v25 < v23)
        {
          do
          {
            objc_msgSend(v22, "objectAtIndexedSubscript:", v25);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "addObject:", v28);

            ++v25;
          }
          while (v23 != v25);
        }
        objc_msgSend(v27, "componentsJoinedByString:", CFSTR("."));
        v26 = objc_claimAutoreleasedReturnValue();

        v18 = v27;
        v24 = v31;
      }
      else
      {
        objc_msgSend(v18, "substringWithRange:", 0, v21);
        v26 = objc_claimAutoreleasedReturnValue();
      }

      v18 = (void *)v26;
    }
    if (objc_msgSend(v18, "compare:options:", v4, 64) == -1)
      v8 = 2;
    else
      v8 = 0;
    goto LABEL_35;
  }
  v8 = 0;
LABEL_39:

  return v8;
}

- (id)_backgroundWebViewConfiguration
{
  return 0;
}

- (BOOL)_applicationIsActive
{
  return 0;
}

- (NSURL)backgroundPageURL
{
  return (NSURL *)-[_WKWebExtensionContext _backgroundContentURL](self->_webKitContext, "_backgroundContentURL");
}

- (WKWebView)backgroundWebView
{
  return (WKWebView *)-[_WKWebExtensionContext _backgroundWebView](self->_webKitContext, "_backgroundWebView");
}

- (id)_remoteInspectionMenuTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "hasNamedProfiles") & 1) != 0)
  {
    objc_msgSend(v3, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData backgroundPageIsServiceWorker](self, "backgroundPageIsServiceWorker");
    v5 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayShortName](self, "displayShortName");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "title");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringWithFormat:", v6, v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[WBSWebExtensionData backgroundPageIsServiceWorker](self, "backgroundPageIsServiceWorker");
    v9 = (void *)MEMORY[0x1E0CB3940];
    _WBSLocalizedString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData displayShortName](self, "displayShortName");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v4, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- (void)loadBackgroundPageIfNecessaryWithCompletionHandler:(id)a3
{
  id v4;
  _WKWebExtensionContext *webKitContext;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  webKitContext = self->_webKitContext;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __74__WBSWebExtensionData_loadBackgroundPageIfNecessaryWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5448778;
  v8 = v4;
  v6 = v4;
  -[_WKWebExtensionContext loadBackgroundContentWithCompletionHandler:](webKitContext, "loadBackgroundContentWithCompletionHandler:", v7);

}

uint64_t __74__WBSWebExtensionData_loadBackgroundPageIfNecessaryWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)allowedInPrivateBrowsing
{
  BOOL result;

  self->_isAllowedInPrivateBrowsingValuePopulated = 1;
  result = -[_WKWebExtensionContext hasAccessInPrivateBrowsing](self->_webKitContext, "hasAccessInPrivateBrowsing");
  self->_allowedInPrivateBrowsing = result;
  return result;
}

- (BOOL)readAllowedInPrivateBrowsingValueFromDisk
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  int v13;
  NSObject *v14;
  NSString *composedIdentifier;
  void *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSString *v20;
  void *v21;
  int v23;
  NSString *v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[WBSWebExtensionData extension](self, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_extensionStateForExtension:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D8A358];
  objc_msgSend(v5, "safari_numberForKey:", *MEMORY[0x1E0D8A358]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    v9 = objc_msgSend(v7, "BOOLValue");
  else
    v9 = -[WBSWebExtensionData _shouldAutomaticallyEnableInPrivateBrowsing](self, "_shouldAutomaticallyEnableInPrivateBrowsing");
  v10 = v9;

  objc_msgSend(MEMORY[0x1E0D8A148], "sharedController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "managedExtensionPrivateBrowsingStateForComposedIdentifier:", self->_composedIdentifier);

  if (v12 == 2)
    v13 = v10;
  else
    v13 = 0;
  if (v13 == 1)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      composedIdentifier = self->_composedIdentifier;
      v23 = 138477827;
      v24 = composedIdentifier;
      _os_log_impl(&dword_1A840B000, v14, OS_LOG_TYPE_INFO, "Disabling extension %{private}@ in Private Browsing due to managed extension configuration", (uint8_t *)&v23, 0xCu);
    }
    v16 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v17, v6);

    objc_msgSend(v4, "_setExtensionState:forExtension:", v16, v3);
LABEL_18:

    LOBYTE(v10) = v13 ^ 1;
    goto LABEL_19;
  }
  if (v12 == 1)
    v18 = v10;
  else
    v18 = 1;
  if ((v18 & 1) == 0)
  {
    v19 = WBS_LOG_CHANNEL_PREFIXManagedExtensions();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = self->_composedIdentifier;
      v23 = 138477827;
      v24 = v20;
      _os_log_impl(&dword_1A840B000, v19, OS_LOG_TYPE_INFO, "Enabling extension %{private}@ in Private Browsing due to managed extension configuration", (uint8_t *)&v23, 0xCu);
    }
    v16 = (void *)objc_msgSend(v5, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v21, v6);

    objc_msgSend(v4, "_setExtensionState:forExtension:", v16, v3);
    goto LABEL_18;
  }
LABEL_19:

  return v10;
}

- (void)setAllowedInPrivateBrowsing:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  BOOL v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;

  v3 = a3;
  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "profileServerID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = +[WBSWebExtensionUtilities isProfileServerIDForDefaultProfile:](WBSWebExtensionUtilities, "isProfileServerIDForDefaultProfile:", v5);

  if (v6 && self->_allowedInPrivateBrowsing != v3)
  {
    -[_WKWebExtensionContext setHasAccessInPrivateBrowsing:](self->_webKitContext, "setHasAccessInPrivateBrowsing:", v3);
    self->_allowedInPrivateBrowsing = v3;
    self->_isAllowedInPrivateBrowsingValuePopulated = 1;
    -[WBSSafariExtension extensionsController](self, "extensionsController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[WBSWebExtensionData extension](self, "extension");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v15, "extensionIsEnabled:", v7);

    if (v8)
    {
      if (v3)
        -[WBSWebExtensionData _loadToolbarItemInPrivateBrowsing](self, "_loadToolbarItemInPrivateBrowsing");
      else
        -[WBSWebExtensionData _unloadToolbarItemInPrivateBrowsing](self, "_unloadToolbarItemInPrivateBrowsing");
    }
    -[WBSWebExtensionData extension](self, "extension");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_extensionStateForExtension:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setObject:forKeyedSubscript:", v12, *MEMORY[0x1E0D8A358]);

    -[WBSWebExtensionData extension](self, "extension");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setExtensionState:forExtension:", v11, v13);

    if (v8)
    {
      if (!v3)
        -[WBSWebExtensionData _unloadInPrivateBrowsing](self, "_unloadInPrivateBrowsing");
    }

  }
}

- (BOOL)_shouldAutomaticallyEnableInPrivateBrowsing
{
  void *v2;
  void *v3;
  char v4;

  -[WBSWebExtensionData userVisiblePermissions](self, "userVisiblePermissions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safari_stringForKey:", *MEMORY[0x1E0D8A328]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0D8A318]) ^ 1;

  return v4;
}

- (BOOL)hasAbilityToInjectContentIntoWebpages
{
  void *v3;
  char v4;
  void *v5;
  void *v6;

  -[WBSWebExtensionData manifestAccessibleOrigins](self, "manifestAccessibleOrigins");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count"))
  {
    v4 = 1;
  }
  else
  {
    -[WBSWebExtensionData manifestOptionalPermissionOrigins](self, "manifestOptionalPermissionOrigins");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      v4 = 1;
    }
    else
    {
      -[WBSWebExtensionData currentPermissions](self, "currentPermissions");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v6, "containsObject:", CFSTR("activeTab"));

    }
  }

  if (-[WBSWebExtensionData manifestVersion](self, "manifestVersion") == 2 && (v4 & 1) != 0
    || -[WBSWebExtensionData hasPermission:](self, "hasPermission:", CFSTR("scripting")))
  {
    return 1;
  }
  else
  {
    return -[_WKWebExtension hasInjectedContent](self->_webKitExtension, "hasInjectedContent");
  }
}

- (void)previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally:(id)a3 previouslyRevokedPermissionOrigins:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  uint64_t v23;
  char v24;
  void *v25;
  char v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t j;
  uint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t k;
  uint64_t v36;
  char v37;
  void *v38;
  char v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t m;
  uint64_t v44;
  void *v45;
  void *v46;
  char v47;
  WBSWebExtensionData *v48;
  char v49;
  id v50;
  id v51;
  id v52;
  void *v53;
  void *v54;
  void *v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _QWORD v72[5];
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v51 = a3;
  v52 = a4;
  self->_permissionsAreBeingUpdatedDueToAnExternalChange = 1;
  v6 = objc_alloc_init(MEMORY[0x1E0D8A1C8]);
  v72[0] = MEMORY[0x1E0C809B0];
  v72[1] = 3221225472;
  v72[2] = __121__WBSWebExtensionData_previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally_previouslyRevokedPermissionOrigins___block_invoke;
  v72[3] = &unk_1E54425B0;
  v72[4] = self;
  v50 = v6;
  objc_msgSend(v6, "setHandler:", v72);
  v7 = (void *)MEMORY[0x1E0C99E60];
  -[WBSWebExtensionData grantedPermissionOrigins](self, "grantedPermissionOrigins");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x1E0C99E60];
  -[WBSWebExtensionData revokedPermissionOrigins](self, "revokedPermissionOrigins");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allKeys");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  matchPatternsWithExpiredItemsRemoved(v51);
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  matchPatternsWithExpiredItemsRemoved(v52);
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isEqualToSet:", v54);
  v16 = objc_msgSend(v14, "isEqualToSet:", v53);
  if ((v15 & v16 & 1) == 0)
  {
    v49 = v15;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = self;
    v47 = v16;
    if ((v15 & 1) == 0)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v19 = v54;
      v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
      if (v20)
      {
        v21 = *(_QWORD *)v69;
        do
        {
          for (i = 0; i != v20; ++i)
          {
            if (*(_QWORD *)v69 != v21)
              objc_enumerationMutation(v19);
            v23 = *(_QWORD *)(*((_QWORD *)&v68 + 1) + 8 * i);
            v24 = objc_msgSend(v14, "containsObject:", v23);
            v25 = v18;
            if ((v24 & 1) == 0)
            {
              v26 = objc_msgSend(v10, "containsObject:", v23);
              v25 = v55;
              if ((v26 & 1) != 0)
                continue;
            }
            objc_msgSend(v25, "addObject:", v23);
          }
          v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v68, v76, 16);
        }
        while (v20);
      }

      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v27 = v10;
      v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
      if (v28)
      {
        v29 = *(_QWORD *)v65;
        do
        {
          for (j = 0; j != v28; ++j)
          {
            if (*(_QWORD *)v65 != v29)
              objc_enumerationMutation(v27);
            v31 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * j);
            if ((objc_msgSend(v19, "containsObject:", v31) & 1) == 0)
              objc_msgSend(v17, "addObject:", v31);
          }
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v64, v75, 16);
        }
        while (v28);
      }

      self = v48;
      LOBYTE(v16) = v47;
    }
    if ((v16 & 1) == 0)
    {
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v32 = v53;
      v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
      if (v33)
      {
        v34 = *(_QWORD *)v61;
        do
        {
          for (k = 0; k != v33; ++k)
          {
            if (*(_QWORD *)v61 != v34)
              objc_enumerationMutation(v32);
            v36 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * k);
            v37 = objc_msgSend(v10, "containsObject:", v36);
            v38 = v17;
            if ((v37 & 1) == 0)
            {
              v39 = objc_msgSend(v14, "containsObject:", v36);
              v38 = v55;
              if ((v39 & 1) != 0)
                continue;
            }
            objc_msgSend(v38, "addObject:", v36);
          }
          v33 = objc_msgSend(v32, "countByEnumeratingWithState:objects:count:", &v60, v74, 16);
        }
        while (v33);
      }

      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v40 = v14;
      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
      if (v41)
      {
        v42 = *(_QWORD *)v57;
        do
        {
          for (m = 0; m != v41; ++m)
          {
            if (*(_QWORD *)v57 != v42)
              objc_enumerationMutation(v40);
            v44 = *(_QWORD *)(*((_QWORD *)&v56 + 1) + 8 * m);
            if ((objc_msgSend(v32, "containsObject:", v44) & 1) == 0)
              objc_msgSend(v18, "addObject:", v44);
          }
          v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v56, v73, 16);
        }
        while (v41);
      }

      self = v48;
      LOBYTE(v16) = v47;
    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v49 & 1) == 0)
      -[WBSWebExtensionData setGrantedPermissionOrigins:](self, "setGrantedPermissionOrigins:", v51);
    if ((v16 & 1) == 0)
      -[WBSWebExtensionData setRevokedPermissionOrigins:](self, "setRevokedPermissionOrigins:", v52);
    if (objc_msgSend(v17, "count"))
      -[WBSWebExtensionData grantPermissions:origins:expirationDate:](self, "grantPermissions:origins:expirationDate:", v45, v17, v46);
    if (objc_msgSend(v18, "count"))
      -[WBSWebExtensionData revokePermissions:origins:expirationDate:](self, "revokePermissions:origins:expirationDate:", v45, v18, v46);
    if (objc_msgSend(v55, "count"))
      -[WBSWebExtensionData removeGrantedAndRevokedPermissions:origins:exactPatternMatchesOnly:](self, "removeGrantedAndRevokedPermissions:origins:exactPatternMatchesOnly:", v45, v55, 0);

  }
}

uint64_t __121__WBSWebExtensionData_previouslyGrantedPermissionOriginsMayHaveBeenChangedExternally_previouslyRevokedPermissionOrigins___block_invoke(uint64_t result)
{
  *(_BYTE *)(*(_QWORD *)(result + 32) + 144) = 0;
  return result;
}

- (void)userGesturePerformedInTab:(id)a3
{
  -[_WKWebExtensionContext userGesturePerformedInTab:](self->_webKitContext, "userGesturePerformedInTab:", a3);
}

- (BOOL)hasActiveUserGestureInTab:(id)a3
{
  return -[_WKWebExtensionContext hasActiveUserGestureInTab:](self->_webKitContext, "hasActiveUserGestureInTab:", a3);
}

- (void)removeTemporaryPermissionsForTab:(id)a3
{
  -[_WKWebExtensionContext clearUserGestureInTab:](self->_webKitContext, "clearUserGestureInTab:", a3);
}

- (BOOL)hasPermission:(id)a3 inTab:(id)a4
{
  return -[_WKWebExtensionContext hasPermission:inTab:](self->_webKitContext, "hasPermission:inTab:", a3, a4);
}

- (BOOL)hasPermissionToAccessURL:(id)a3 inTab:(id)a4
{
  id v6;
  id v7;
  char v8;

  v6 = a3;
  v7 = a4;
  if (v6)
    v8 = -[_WKWebExtensionContext hasAccessToURL:inTab:](self->_webKitContext, "hasAccessToURL:inTab:", v6, v7);
  else
    v8 = 0;

  return v8;
}

- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4
{
  return -[WBSWebExtensionData permissionStateForURL:inTab:options:](self, "permissionStateForURL:inTab:options:", a3, a4, 0);
}

- (int64_t)permissionStateForURL:(id)a3 inTab:(id)a4 options:(unint64_t)a5
{
  id v7;
  id v8;
  uint64_t v9;
  int64_t v10;

  v7 = a3;
  v8 = a4;
  if (v7
    && (v9 = -[_WKWebExtensionContext permissionStatusForURL:inTab:](self->_webKitContext, "permissionStatusForURL:inTab:", v7, v8), (unint64_t)(v9 + 3) < 7))
  {
    v10 = qword_1A84E3948[v9 + 3];
  }
  else
  {
    v10 = -2;
  }

  return v10;
}

- (BOOL)hasMoreThanOneRequestedOriginNotAlreadyConfigured
{
  void *v2;
  BOOL v4;
  _BOOL4 v5;

  v4 = -[WBSWebExtensionData requestsAccessToAllHosts](self, "requestsAccessToAllHosts");
  if (v4
    || (-[WBSWebExtensionData requestedPermissionOriginsNotAlreadyConfigured](self, "requestedPermissionOriginsNotAlreadyConfigured"), v2 = (void *)objc_claimAutoreleasedReturnValue(), (unint64_t)objc_msgSend(v2, "count") >= 2))
  {
    v5 = !-[WBSWebExtensionData hasPermissionToAccessAllHosts](self, "hasPermissionToAccessAllHosts");
    if (v4)
      return v5;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (void)promptForAccessToURLs:(id)a3 inTab:(id)a4 completionHandler:(id)a5
{
  void *v5;
  void (**v6)(id, void *, _QWORD);

  v6 = (void (**)(id, void *, _QWORD))a5;
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[2](v6, v5, 0);

}

- (BOOL)hasPendingWebsiteRequests
{
  return -[NSMutableArray count](self->_websiteRequestsPendingApproval, "count") != 0;
}

- (void)dispatchExpiredPendingWebsiteRequests
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;
  void (**v13)(void);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (self->_websiteRequestsPendingApproval)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v4 = self->_websiteRequestsPendingApproval;
    v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v5)
    {
      v6 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v6)
            objc_enumerationMutation(v4);
          v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
          objc_msgSend(v8, "urls");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v9, "count"))
          {
            objc_msgSend(v8, "expirationDate");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "timeIntervalSinceNow");
            v12 = v11 > 0.0;

            if (v12)
              goto LABEL_13;
          }
          else
          {

          }
          objc_msgSend(v8, "completionHandler");
          v13 = (void (**)(void))objc_claimAutoreleasedReturnValue();
          v13[2]();

          objc_msgSend(v3, "addObject:", v8);
        }
        v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }
LABEL_13:

    -[NSMutableArray removeObjectsInArray:](self->_websiteRequestsPendingApproval, "removeObjectsInArray:", v3);
    -[WBSWebExtensionData _validateToolbarItemInAllWindows](self, "_validateToolbarItemInAllWindows");

  }
}

- (void)dispatchAllPendingWebsiteRequests
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(void);
  NSMutableArray *websiteRequestsPendingApproval;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_websiteRequestsPendingApproval;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6), "completionHandler", (_QWORD)v9);
        v7 = (void (**)(void))objc_claimAutoreleasedReturnValue();
        v7[2]();

        ++v6;
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  websiteRequestsPendingApproval = self->_websiteRequestsPendingApproval;
  self->_websiteRequestsPendingApproval = 0;

  -[WBSWebExtensionData _validateToolbarItemInAllWindows](self, "_validateToolbarItemInAllWindows");
}

- (void)dispatchPendingWebsiteRequestsMatchingOriginPatterns:(id)a3
{
  id v4;

  v4 = a3;
  if (+[WBSWebExtensionMatchPattern patternSetContainsAllHostsPattern:](WBSWebExtensionMatchPattern, "patternSetContainsAllHostsPattern:"))
  {
    -[WBSWebExtensionData dispatchAllPendingWebsiteRequests](self, "dispatchAllPendingWebsiteRequests");
  }

}

- (NSSet)urlsPendingApproval
{
  void *v3;
  NSMutableArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = self->_websiteRequestsPendingApproval;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7), "urls", (_QWORD)v10);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "unionSet:", v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  return (NSSet *)v3;
}

- (NSSet)apiNamesPendingApproval
{
  return (NSSet *)-[NSMutableArray safari_setByApplyingBlock:](self->_websiteRequestsPendingApproval, "safari_setByApplyingBlock:", &__block_literal_global_249);
}

id __46__WBSWebExtensionData_apiNamesPendingApproval__block_invoke(uint64_t a1, void *a2)
{
  objc_msgSend(a2, "apiName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)messageReceivedFromContainingAppWithName:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  void *v12;
  NSMutableArray *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSMutableArray *queuedNativeMessages;
  uint64_t v18;
  NSMutableArray **p_queuedNativeMessages;
  NSMutableArray *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[WBSSafariExtension extensionsController](self, "extensionsController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSWebExtensionData extension](self, "extension");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "extensionIsEnabled:", v9);

  if ((v10 & 1) != 0)
  {
    v26 = CFSTR("name");
    v27[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, &v26, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    if (v7)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, CFSTR("userInfo"));
    if (self->_hasFirstNativeMessagePort)
    {
      v23 = 0u;
      v24 = 0u;
      v21 = 0u;
      v22 = 0u;
      v13 = self->_webKitMessagePorts;
      v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v14)
      {
        v15 = *(_QWORD *)v22;
        do
        {
          v16 = 0;
          do
          {
            if (*(_QWORD *)v22 != v15)
              objc_enumerationMutation(v13);
            objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * v16++), "sendMessage:completionHandler:", v12, 0, (_QWORD)v21);
          }
          while (v14 != v16);
          v14 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        }
        while (v14);
      }

    }
    else
    {
      queuedNativeMessages = self->_queuedNativeMessages;
      if (!queuedNativeMessages)
      {
        objc_msgSend(MEMORY[0x1E0C99DE8], "array");
        v18 = objc_claimAutoreleasedReturnValue();
        p_queuedNativeMessages = &self->_queuedNativeMessages;
        v20 = *p_queuedNativeMessages;
        *p_queuedNativeMessages = (NSMutableArray *)v18;

        queuedNativeMessages = *p_queuedNativeMessages;
      }
      -[NSMutableArray addObject:](queuedNativeMessages, "addObject:", v12);
    }

  }
}

- (void)connectUsingMessagePort:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *webKitMessagePorts;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSMutableArray *queuedNativeMessages;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id from;
  id location;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!self->_webKitMessagePorts)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    webKitMessagePorts = self->_webKitMessagePorts;
    self->_webKitMessagePorts = v5;

  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = self->_queuedNativeMessages;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v22;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v7);
        objc_msgSend(v4, "sendMessage:completionHandler:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * v10++), 0);
      }
      while (v8 != v10);
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v8);
  }

  queuedNativeMessages = self->_queuedNativeMessages;
  self->_queuedNativeMessages = 0;

  self->_hasFirstNativeMessagePort = 1;
  -[NSMutableArray addObject:](self->_webKitMessagePorts, "addObject:", v4);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v4);
  v12 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke;
  v16[3] = &unk_1E5448808;
  objc_copyWeak(&v17, &location);
  objc_copyWeak(&v18, &from);
  objc_msgSend(v4, "setMessageHandler:", v16);
  v13[0] = v12;
  v13[1] = 3221225472;
  v13[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_3;
  v13[3] = &unk_1E5448830;
  objc_copyWeak(&v14, &location);
  objc_copyWeak(&v15, &from);
  objc_msgSend(v4, "setDisconnectHandler:", v13);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v5)
    {
      objc_msgSend(WeakRetained, "extensionsController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "applicationIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "identifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x1E0C809B0];
      v9[1] = 3221225472;
      v9[2] = __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_2;
      v9[3] = &unk_1E54487E0;
      v10 = v5;
      objc_msgSend(v6, "sendMessage:toApplicationWithID:fromExtensionWithIdentifier:completionHandler:", v3, v7, v8, v9);

    }
  }

}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "sendMessage:completionHandler:", v6, 0);

}

void __47__WBSWebExtensionData_connectUsingMessagePort___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  id v3;
  id *v4;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    v3 = objc_loadWeakRetained((id *)(a1 + 40));
    if (v3)
    {
      objc_msgSend(v4[19], "removeObject:", v3);
      *((_BYTE *)v4 + 128) = objc_msgSend(v4[19], "count") != 0;
    }

    WeakRetained = v4;
  }

}

- (NSExtension)extension
{
  return self->_extension;
}

- (NSString)composedIdentifier
{
  return self->_composedIdentifier;
}

- (_WKWebExtension)webKitExtension
{
  return self->_webKitExtension;
}

- (NSUUID)uniqueIdentifier
{
  return self->_uniqueIdentifier;
}

- (NSString)containingAppBundleIdentifier
{
  return self->_containingAppBundleIdentifier;
}

- (NSURL)resourcesDirectoryURL
{
  return self->_resourcesDirectoryURL;
}

- (WBSWebExtensionToolbarItem)toolbarItem
{
  return self->_toolbarItem;
}

- (void)setToolbarItem:(id)a3
{
  objc_storeStrong((id *)&self->_toolbarItem, a3);
}

- (NSString)toolbarLabel
{
  return self->_toolbarLabel;
}

- (NSString)toolbarPopupPath
{
  return self->_toolbarPopupPath;
}

- (BOOL)hasLoadedPermissionsFromStorage
{
  return self->_hasLoadedPermissionsFromStorage;
}

- (void)setHasLoadedPermissionsFromStorage:(BOOL)a3
{
  self->_hasLoadedPermissionsFromStorage = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toolbarPopupPath, 0);
  objc_storeStrong((id *)&self->_toolbarLabel, 0);
  objc_storeStrong((id *)&self->_toolbarItem, 0);
  objc_storeStrong((id *)&self->_resourcesDirectoryURL, 0);
  objc_storeStrong((id *)&self->_containingAppBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_uniqueIdentifier, 0);
  objc_storeStrong((id *)&self->_webKitExtension, 0);
  objc_storeStrong((id *)&self->_webKitContext, 0);
  objc_storeStrong((id *)&self->_webKitMessagePorts, 0);
  objc_storeStrong((id *)&self->_queuedNativeMessages, 0);
  objc_storeStrong((id *)&self->_commands, 0);
  objc_storeStrong((id *)&self->_baseURIHost, 0);
  objc_storeStrong((id *)&self->_extensionBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_websiteRequestsPendingApproval, 0);
  objc_storeStrong((id *)&self->_composedIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

- (void)initWithExtension:extensionsController:extensionBundleIdentifier:extensionIdentifier:uniqueIdentifier:baseURIHost:.cold.1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v6, v4, "Unable to create WebKit extension with identifier %{private}@ with error: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

+ (void)unlocalizedManifestDictionaryFromData:(uint64_t)a3 withExtensionIdentifier:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, a2, a3, "Format for manifest.json was not expected for extension with identifier %{private}@.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

+ (void)unlocalizedManifestDictionaryFromData:withExtensionIdentifier:error:.cold.2()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t *v5;
  NSObject *v6;

  OUTLINED_FUNCTION_6_0();
  OUTLINED_FUNCTION_4_0(v1, v2, v3, 5.8081e-34);
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v6, v4, "Unable to parse manifest.json for extension with identifier %{private}@. Error: %{public}@", v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)grantPermissions:(uint8_t *)a1 origins:(_BYTE *)a2 expirationDate:(NSObject *)a3 .cold.1(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a3, (uint64_t)a3, "grantPermissions:origins:expirationDate: webKitMatchPattern is nil", a1);
}

- (void)grantPermissions:(NSObject *)a1 origins:(uint64_t)a2 expirationDate:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  OUTLINED_FUNCTION_5(&dword_1A840B000, a1, a3, "grantPermissions:origins:expirationDate: called with nil _webKitContext", v3);
}

- (void)extensionSupportsSafariShortVersion:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_4(&dword_1A840B000, a2, a3, "Unknown manifest version for extension with identifier %{private}@.", a5, a6, a7, a8, 3u);
  OUTLINED_FUNCTION_1();
}

- (void)extensionSupportsSafariShortVersion:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v0, (uint64_t)v0, "Manifest version is too old for extension with identifier %{private}@. Version specified: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

- (void)extensionSupportsSafariShortVersion:.cold.3()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_5_1();
  OUTLINED_FUNCTION_0_0(&dword_1A840B000, v0, (uint64_t)v0, "Manifest version is too new for extension with identifier %{private}@. Version specified: %{public}@", v1);
  OUTLINED_FUNCTION_1();
}

@end
