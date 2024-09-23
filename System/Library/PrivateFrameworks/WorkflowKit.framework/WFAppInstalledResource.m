@implementation WFAppInstalledResource

- (WFAppInstalledResource)initWithAppDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4
{
  return (WFAppInstalledResource *)-[WFAppInstalledResource _initWithDescriptor:requiresAppToBeInstalled:isSyncedFromOtherDevice:](self, "_initWithDescriptor:requiresAppToBeInstalled:isSyncedFromOtherDevice:", a3, a4, 0);
}

- (WFAppInstalledResource)initWithIntentDescriptor:(id)a3 isSyncedFromOtherDevice:(BOOL)a4
{
  return (WFAppInstalledResource *)-[WFAppInstalledResource _initWithDescriptor:requiresAppToBeInstalled:isSyncedFromOtherDevice:](self, "_initWithDescriptor:requiresAppToBeInstalled:isSyncedFromOtherDevice:", a3, 1, a4);
}

- (id)_initWithDescriptor:(id)a3 requiresAppToBeInstalled:(BOOL)a4 isSyncedFromOtherDevice:(BOOL)a5
{
  _BOOL4 v6;
  id v9;
  WFAppInstalledResource *v10;
  WFAppInstalledResource *v11;
  id *p_descriptor;
  uint64_t v13;
  NSString *appName;
  dispatch_queue_t v15;
  OS_dispatch_queue *stateQueue;
  void *v17;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  WFAppInstalledResource *v22;
  objc_super v24;
  _QWORD v25[2];

  v6 = a4;
  v25[1] = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v24.receiver = self;
  v24.super_class = (Class)WFAppInstalledResource;
  v10 = -[WFResource initWithDefinition:](&v24, sel_initWithDefinition_, MEMORY[0x1E0C9AA70]);
  v11 = v10;
  if (v10)
  {
    p_descriptor = (id *)&v10->_descriptor;
    objc_storeStrong((id *)&v10->_descriptor, a3);
    objc_msgSend(v9, "localizedName");
    v13 = objc_claimAutoreleasedReturnValue();
    appName = v11->_appName;
    v11->_appName = (NSString *)v13;

    v15 = dispatch_queue_create("WFAppInstalledResource-state", 0);
    stateQueue = v11->_stateQueue;
    v11->_stateQueue = (OS_dispatch_queue *)v15;

    v11->_skipLookup = 0;
    v11->_requiresAppToBeInstalled = v6;
    v11->_intentIsSynced = a5;
    objc_msgSend(*p_descriptor, "bundleIdentifier");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
      v18 = !v6;
    else
      v18 = 1;
    if (!v18)
    {
      +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*p_descriptor, "bundleIdentifier");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v25[0] = v20;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "addInstallStatusObserver:forAppIdentifiers:", v11, v21);

    }
    v22 = v11;
  }

  return v11;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  -[WFAppInstalledResource descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && -[WFAppInstalledResource requiresAppToBeInstalled](self, "requiresAppToBeInstalled"))
  {
    +[ICAppRegistry sharedRegistry](ICAppRegistry, "sharedRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeInstallStatusObserver:forAppIdentifiers:", self, v6);

  }
  v7.receiver = self;
  v7.super_class = (Class)WFAppInstalledResource;
  -[WFResource dealloc](&v7, sel_dealloc);
}

- (id)bundleIdentifier
{
  void *v2;
  void *v3;

  -[WFAppInstalledResource descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bundleIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)eventDictionary
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)WFAppInstalledResource;
  -[WFResource eventDictionary](&v7, sel_eventDictionary);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");

  -[WFAppInstalledResource bundleIdentifier](self, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setValue:forKey:", v5, CFSTR("resource_app"));

  return v4;
}

- (BOOL)appDescriptorOrAccompanyingExtensionIsInstalled:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  BOOL v9;

  v3 = a3;
  if ((objc_msgSend(v3, "isInstalled") & 1) != 0)
    goto LABEL_4;
  objc_msgSend(v3, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "length");

  if (!v5)
    goto LABEL_5;
  v6 = objc_alloc(MEMORY[0x1E0CA5848]);
  objc_msgSend(v3, "extensionBundleIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithBundleIdentifier:error:", v7, 0);

  if (v8)
LABEL_4:
    v9 = 1;
  else
LABEL_5:
    v9 = 0;

  return v9;
}

- (void)refreshAvailability
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  WFAppInstalledResource *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  char v16;
  NSObject *stateQueue;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  _QWORD block[4];
  id v23;
  WFAppInstalledResource *v24;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  -[WFAppInstalledResource descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)MEMORY[0x1E0CF9688];
    -[WFAppInstalledResource descriptor](self, "descriptor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "applicationWithBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isHidden");

    if (v10)
    {
      -[WFAppInstalledResource appNotInstalledError](self, "appNotInstalledError");
      v11 = objc_claimAutoreleasedReturnValue();
      v21 = (id)v11;
      v12 = self;
      v13 = 0;
LABEL_13:
      -[WFResource updateAvailability:withError:](v12, "updateAvailability:withError:", v13, v11);
      goto LABEL_14;
    }
  }
  else
  {

  }
  if (-[WFAppInstalledResource intentIsEligibleForRemoteExecution](self, "intentIsEligibleForRemoteExecution"))
  {
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 1, 0);
    return;
  }
  -[WFAppInstalledResource descriptor](self, "descriptor");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v21, "requiresUserConfirmation"))
  {
    -[WFAppInstalledResource appNotResolvedError](self, "appNotResolvedError");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, v14);
  }
  else
  {
    if (!-[WFAppInstalledResource requiresAppToBeInstalled](self, "requiresAppToBeInstalled")
      || -[WFAppInstalledResource appDescriptorOrAccompanyingExtensionIsInstalled:](self, "appDescriptorOrAccompanyingExtensionIsInstalled:", v21))
    {
      v12 = self;
      v13 = 1;
      v11 = 0;
      goto LABEL_13;
    }
    if (!-[WFAppInstalledResource descriptorIsIntentDescriptor](self, "descriptorIsIntentDescriptor")
      || -[WFAppInstalledResource intentIsSynced](self, "intentIsSynced")
      || (-[WFAppInstalledResource intentDescriptor](self, "intentDescriptor"),
          v15 = (void *)objc_claimAutoreleasedReturnValue(),
          v16 = objc_msgSend(v15, "canRunOnLocalDevice"),
          v15,
          (v16 & 1) != 0))
    {
      stateQueue = self->_stateQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke;
      block[3] = &unk_1E7AF92C0;
      v23 = v21;
      v24 = self;
      dispatch_sync(stateQueue, block);
      -[WFAppInstalledResource appNotInstalledError](self, "appNotInstalledError");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, v18);

      goto LABEL_14;
    }
    -[WFAppInstalledResource descriptor](self, "descriptor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFAppInstalledResource appNeedsUpdateErrorWithAppName:](self, "appNeedsUpdateErrorWithAppName:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFResource updateAvailability:withError:](self, "updateAvailability:withError:", 0, v20);

  }
LABEL_14:

}

- (void)updateDescriptorsWithSelectedApp:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v20 = a3;
  if (-[WFAppInstalledResource descriptorIsIntentDescriptor](self, "descriptorIsIntentDescriptor"))
  {
    -[WFAppInstalledResource descriptor](self, "descriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0CBD980]);
    v17 = v4;
    objc_msgSend(v4, "intentClassName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "extensionBundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "uiExtensionBundleIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "counterpartIdentifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "teamIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v4, "preferredCallProvider");
    objc_msgSend(v20, "supportedIntents");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bundleURL");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "documentTypes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v16, "initWithIntentClassName:localizedName:bundleIdentifier:displayableBundleIdentifier:extensionBundleIdentifier:uiExtensionBundleIdentifier:counterpartIdentifiers:teamIdentifier:preferredCallProvider:supportedIntents:bundleURL:documentTypes:", v19, v18, v5, v6, v7, v15, v14, v8, v9, v10, v11, v12);
    -[WFAppInstalledResource setDescriptor:](self, "setDescriptor:", v13);

  }
  else
  {
    -[WFAppInstalledResource setDescriptor:](self, "setDescriptor:", v20);
  }

}

- (void)notifyDelegateWithUpdatedDescriptor:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[WFAppInstalledResource delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFAppInstalledResource delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appInstalledResource:didUpdateAppDescriptor:", self, v6);

  }
}

- (void)fetchiTunesStoreObjectForAppWithCompletionBlock:(id)a3
{
  id v5;
  NSObject *stateQueue;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke;
  block[3] = &unk_1E7AF1AF8;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(stateQueue, block);

}

- (BOOL)descriptorIsIntentDescriptor
{
  void *v2;
  char isKindOfClass;

  -[WFAppInstalledResource descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)intentDescriptor
{
  void *v2;
  void *v3;
  id v4;

  -[WFAppInstalledResource descriptor](self, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v2 = v3;
    else
      v2 = 0;
  }
  v4 = v2;

  return v4;
}

- (BOOL)intentIsEligibleForRemoteExecution
{
  _BOOL4 v3;

  v3 = -[WFAppInstalledResource descriptorIsIntentDescriptor](self, "descriptorIsIntentDescriptor");
  if (v3)
    LOBYTE(v3) = -[WFAppInstalledResource intentIsSynced](self, "intentIsSynced");
  return v3;
}

- (BOOL)intentIsLocallyAvailable
{
  void *v3;
  int v4;
  void *v5;
  char v6;

  if (!-[WFAppInstalledResource intentIsEligibleForRemoteExecution](self, "intentIsEligibleForRemoteExecution"))
    return -[WFResource isAvailable](self, "isAvailable");
  -[WFAppInstalledResource descriptor](self, "descriptor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isInstalled");

  if (!v4)
    return 0;
  if (!-[WFAppInstalledResource descriptorIsIntentDescriptor](self, "descriptorIsIntentDescriptor"))
    return 1;
  -[WFAppInstalledResource intentDescriptor](self, "intentDescriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "canRunOnLocalDevice");

  return v6;
}

- (id)appNotInstalledError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[WFAppInstalledResource appName](self, "appName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This action requires %@ to be installed."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This shortcut requires %@ to be installed."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This action requires an app to be installed."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("This shortcut requires an app to be installed."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D68];
  v19[0] = *MEMORY[0x1E0D142B8];
  v19[1] = v11;
  v20[0] = self;
  v20[1] = v6;
  v20[2] = v9;
  v12 = *MEMORY[0x1E0CB2D78];
  v19[2] = CFSTR("WFResourceErrorImportErrorReason");
  v19[3] = v12;
  WFLocalizedString(CFSTR("View in App Store"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ResourceErrorDomain"), 0, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)appNotResolvedError
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  -[WFAppInstalledResource appName](self, "appName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This action requires %@ but it may not be installed."));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This shortcut requires %@ but it may not be installed."));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringWithFormat:", v8, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This action requires an app but it may not be installed."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("This shortcut requires an app but it may not be installed."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0CB2D68];
  v19[0] = *MEMORY[0x1E0D142B8];
  v19[1] = v11;
  v20[0] = self;
  v20[1] = v6;
  v20[2] = v9;
  v12 = *MEMORY[0x1E0CB2D78];
  v19[2] = CFSTR("WFResourceErrorImportErrorReason");
  v19[3] = v12;
  WFLocalizedString(CFSTR("Select App"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "errorWithDomain:code:userInfo:", CFSTR("ResourceErrorDomain"), 1, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (id)appNeedsUpdateErrorWithAppName:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v16;
  _QWORD v17[4];
  _QWORD v18[5];

  v18[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (v4)
  {
    v5 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This action requires an updated version of %@."));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3940];
    WFLocalizedString(CFSTR("This shortcut requires an updated version of %@."));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    WFLocalizedString(CFSTR("This action cannot be run because a required app is missing"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    WFLocalizedString(CFSTR("This shortcut cannot be imported because a required app is missing"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v17[0] = *MEMORY[0x1E0CB2D68];
  v17[1] = CFSTR("WFResourceErrorImportErrorReason");
  v18[0] = v7;
  v18[1] = v10;
  v17[2] = *MEMORY[0x1E0CB2D78];
  WFLocalizedString(CFSTR("View in App Store"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v17[3] = *MEMORY[0x1E0D142B8];
  v18[2] = v12;
  v18[3] = self;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("ResourceErrorDomain"), 0, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)attemptRecoveryFromError:(id)a3 optionIndex:(unint64_t)a4 userInterface:(id)a5 completionHandler:(id)a6
{
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v9 = a5;
  v10 = a6;
  if (objc_msgSend(a3, "code"))
  {
    if (v10)
      (*((void (**)(id, _QWORD, _QWORD))v10 + 2))(v10, 0, 0);
  }
  else
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke;
    v11[3] = &unk_1E7AF0DD0;
    v13 = v10;
    v12 = v9;
    -[WFAppInstalledResource fetchiTunesStoreObjectForAppWithCompletionBlock:](self, "fetchiTunesStoreObjectForAppWithCompletionBlock:", v11);

  }
}

- (WFAppInstalledResourceDelegate)delegate
{
  return (WFAppInstalledResourceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (WFiTunesSessionManager)currentAppNameLookupSessionManager
{
  return self->_currentAppNameLookupSessionManager;
}

- (void)setCurrentAppNameLookupSessionManager:(id)a3
{
  objc_storeStrong((id *)&self->_currentAppNameLookupSessionManager, a3);
}

- (NSMutableArray)pendingAppLookupCompletions
{
  return self->_pendingAppLookupCompletions;
}

- (void)setPendingAppLookupCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_pendingAppLookupCompletions, a3);
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (BOOL)skipLookup
{
  return self->_skipLookup;
}

- (void)setSkipLookup:(BOOL)a3
{
  self->_skipLookup = a3;
}

- (BOOL)requiresAppToBeInstalled
{
  return self->_requiresAppToBeInstalled;
}

- (void)setRequiresAppToBeInstalled:(BOOL)a3
{
  self->_requiresAppToBeInstalled = a3;
}

- (BOOL)intentIsSynced
{
  return self->_intentIsSynced;
}

- (void)setIntentIsSynced:(BOOL)a3
{
  self->_intentIsSynced = a3;
}

- (NSString)appName
{
  return self->_appName;
}

- (void)setAppName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (INAppDescriptor)descriptor
{
  return self->_descriptor;
}

- (void)setDescriptor:(id)a3
{
  objc_storeStrong((id *)&self->_descriptor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_descriptor, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_pendingAppLookupCompletions, 0);
  objc_storeStrong((id *)&self->_currentAppNameLookupSessionManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

void __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2;
    block[3] = &unk_1E7AF8378;
    v6 = v3;
    v7 = *(id *)(a1 + 32);
    v8 = *(id *)(a1 + 40);
    dispatch_async(MEMORY[0x1E0C80D38], block);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }

}

void __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0D13E18], "sharedContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "viewURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3;
  v5[3] = &unk_1E7AF8860;
  v4 = *(_QWORD *)(a1 + 40);
  v6 = *(id *)(a1 + 48);
  objc_msgSend(v2, "openURL:userInterface:completionHandler:", v3, v4, v5);

}

uint64_t __95__WFAppInstalledResource_attemptRecoveryFromError_optionIndex_userInterface_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  WFiTunesSessionManager *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id location;

  objc_msgSend(*(id *)(a1 + 32), "currentAppNameLookupSessionManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingAppLookupCompletions");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("WFAppInstalledResource.m"), 185, CFSTR("Pending app lookup completions unexpectedly nil"));

    }
    objc_msgSend(*(id *)(a1 + 32), "pendingAppLookupCompletions");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    v5 = _Block_copy(v4);
    objc_msgSend(v14, "addObject:", v5);

  }
  else
  {
    v6 = objc_alloc_init(WFiTunesSessionManager);
    objc_msgSend(*(id *)(a1 + 32), "setCurrentAppNameLookupSessionManager:", v6);
    v7 = (void *)MEMORY[0x1E0C99DE8];
    v8 = (void *)objc_msgSend(*(id *)(a1 + 40), "copy");
    objc_msgSend(v7, "arrayWithObject:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPendingAppLookupCompletions:", v9);

    objc_initWeak(&location, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "bundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "countryCode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_2;
    v15[3] = &unk_1E7AF0DA8;
    objc_copyWeak(&v16, &location);
    v15[4] = *(_QWORD *)(a1 + 32);
    -[WFiTunesSessionManager lookupMediaWithBundleIdentifier:countryCode:completion:](v6, "lookupMediaWithBundleIdentifier:countryCode:completion:", v10, v12, v15);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&location);

  }
}

void __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id WeakRetained;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD block[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "stateQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_not_V2(v8);

  objc_msgSend(v5, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v22 = 0;
  v23 = &v22;
  v24 = 0x3032000000;
  v25 = __Block_byref_object_copy__30861;
  v26 = __Block_byref_object_dispose__30862;
  v27 = 0;
  v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 72);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_127;
  block[3] = &unk_1E7AF92E8;
  block[4] = WeakRetained;
  block[5] = &v22;
  dispatch_sync(v12, block);
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v13 = (id)v23[5];
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
  if (v14)
  {
    v15 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v18 != v15)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i) + 16))(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v17, v28, 16);
    }
    while (v14);
  }

  _Block_object_dispose(&v22, 8);
}

uint64_t __74__WFAppInstalledResource_fetchiTunesStoreObjectForAppWithCompletionBlock___block_invoke_127(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "pendingAppLookupCompletions");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(a1 + 32), "setPendingAppLookupCompletions:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setCurrentAppNameLookupSessionManager:", 0);
}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v5;
  void *v6;
  id v7;
  _QWORD v8[5];

  objc_msgSend(*(id *)(a1 + 32), "localizedName");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "length");

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "localizedName");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAppName:", v7);
LABEL_6:

    return;
  }
  objc_msgSend(*(id *)(a1 + 40), "appName");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "length"))
    goto LABEL_6;
  objc_msgSend(*(id *)(a1 + 40), "currentAppNameLookupSessionManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

    goto LABEL_6;
  }
  v5 = objc_msgSend(*(id *)(a1 + 40), "skipLookup");

  if ((v5 & 1) == 0)
  {
    v6 = *(void **)(a1 + 40);
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_2;
    v8[3] = &unk_1E7AF0D80;
    v8[4] = v6;
    objc_msgSend(v6, "fetchiTunesStoreObjectForAppWithCompletionBlock:", v8);
  }
}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(NSObject **)(v4 + 72);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_3;
  v7[3] = &unk_1E7AF92C0;
  v8 = v3;
  v9 = v4;
  v6 = v3;
  dispatch_async(v5, v7);

}

void __45__WFAppInstalledResource_refreshAvailability__block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setAppName:", v3);

    dispatch_get_global_queue(0, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __45__WFAppInstalledResource_refreshAvailability__block_invoke_4;
    block[3] = &unk_1E7AF94B0;
    block[4] = *(_QWORD *)(a1 + 40);
    dispatch_async(v4, block);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "setSkipLookup:", 1);
  }
}

uint64_t __45__WFAppInstalledResource_refreshAvailability__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "refreshAvailabilityWithNotification");
}

+ (BOOL)mustBeAvailableForDisplay
{
  return 1;
}

+ (BOOL)refreshesAvailabilityOnApplicationResume
{
  return 1;
}

@end
