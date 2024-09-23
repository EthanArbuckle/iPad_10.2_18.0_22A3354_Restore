@implementation SBSplashBoardLaunchRequestProvider

- (SBSplashBoardLaunchRequestProvider)initWithApplicationController:(id)a3 displayConfiguration:(id)a4
{
  id v7;
  id v8;
  SBSplashBoardLaunchRequestProvider *v9;
  SBSplashBoardLaunchRequestProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBSplashBoardLaunchRequestProvider;
  v9 = -[SBSplashBoardLaunchRequestProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_applicationController, a3);
    objc_storeStrong((id *)&v10->_displayConfiguration, a4);
  }

  return v10;
}

- (id)launchRequestsForApplication:(id)a3 withCompatibilityInfo:(id)a4 defaultLaunchRequests:(id)a5
{
  id v7;
  id v8;
  void *v9;
  int v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  SBApplicationController *applicationController;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  SBSplashBoardLaunchRequestProvider *v26;
  id v27;
  id v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  char v39;
  double v40;
  double v41;
  void *v42;
  void *v44;
  id obj;
  int v46;
  int v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "supportsDeviceFamily:", 2);
  if (v10)
    v47 = SBLayoutSupportsSideLayoutRole();
  else
    v47 = 0;
  if (__sb__runningInSpringBoard())
  {
    v11 = SBFEffectiveDeviceClass();
    v12 = v10 ^ 1;
    if (v11 != 2)
      v12 = 0;
    v46 = v12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "userInterfaceIdiom");
    v15 = v10 ^ 1;
    if (v14 != 1)
      v15 = 0;
    v46 = v15;

  }
  v50 = 0u;
  v51 = 0u;
  v48 = 0u;
  v49 = 0u;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v49;
    v44 = v9;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v49 != v18)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * i);
        applicationController = self->_applicationController;
        objc_msgSend(v7, "bundleIdentifier");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController applicationWithBundleIdentifier:](applicationController, "applicationWithBundleIdentifier:", v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
        {
          SBPhoneOnPadFallbackLaunchSize();
          objc_msgSend(v20, "setReferenceSize:");
        }
        else if (objc_msgSend(v23, "isClassic"))
        {
          objc_msgSend(MEMORY[0x1E0DC5B80], "sb_displayEdgeInfoForApplication:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "safeAreaInsetsPortrait");
          v25 = (void *)objc_claimAutoreleasedReturnValue();

          if (v25)
          {
            v26 = self;
            v27 = v7;
            v28 = objc_alloc(MEMORY[0x1E0DA8F48]);
            objc_msgSend(v25, "topInset");
            v30 = v29;
            objc_msgSend(v25, "leftInset");
            v32 = v31;
            objc_msgSend(v25, "bottomInset");
            v34 = v33;
            objc_msgSend(v25, "rightInset");
            v36 = (void *)objc_msgSend(v28, "initWithTop:left:bottom:right:", v30, v32, v34, v35);
            +[SBApplication _deviceSafeAreaInsets](SBApplication, "_deviceSafeAreaInsets");
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v37, "isEqual:", v36) & 1) == 0)
              objc_msgSend(v20, "setCustomSafeAreaInsets:", v36);

            v7 = v27;
            self = v26;
            v9 = v44;
          }
          objc_msgSend(v23, "defaultLaunchingSizeForDisplayConfiguration:", self->_displayConfiguration);
          objc_msgSend(v20, "setReferenceSize:");

        }
        objc_msgSend(v9, "addObject:", v20);
        if (v47)
        {
          objc_msgSend(v23, "info");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v39 = objc_msgSend(v38, "wantsFullScreen");

          if ((v39 & 1) == 0)
          {
            objc_msgSend(v20, "interfaceOrientation");
            SBLayoutDefaultSideLayoutElementWidth();
            v41 = v40;
            v42 = (void *)objc_msgSend(v20, "copy");
            objc_msgSend(v20, "naturalSize");
            objc_msgSend(v42, "setNaturalSize:", v41);
            objc_msgSend(v9, "addObject:", v42);

          }
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v17);
  }

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
}

@end
