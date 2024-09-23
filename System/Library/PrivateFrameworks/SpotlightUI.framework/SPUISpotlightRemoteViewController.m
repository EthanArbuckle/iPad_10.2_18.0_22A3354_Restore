@implementation SPUISpotlightRemoteViewController

- (void)updateTraitCollection
{
  void *v3;
  _QWORD v4[5];

  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __58__SPUISpotlightRemoteViewController_updateTraitCollection__block_invoke;
  v4[3] = &unk_24DA1D180;
  v4[4] = self;
  objc_msgSend(v3, "updateSettingsWithBlock:", v4);

}

void __58__SPUISpotlightRemoteViewController_updateTraitCollection__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  if (objc_msgSend(v8, "isUISubclass"))
  {
    v3 = *(void **)(a1 + 32);
    v4 = v8;
    objc_msgSend(v3, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "tlks_screen");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setUserInterfaceStyle:", objc_msgSend(v7, "userInterfaceStyle"));

  }
}

- (FBScene)scene
{
  return (FBScene *)objc_getProperty(self, a2, 1008, 1);
}

- (NSString)sceneIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 992, 1);
}

+ (unint64_t)spotlightSupportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom"))
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (SPUISpotlightRemoteViewController)initWithSceneIdentifier:(id)a3
{
  id v4;
  SPUISpotlightRemoteViewController *v5;
  SPUISpotlightRemoteViewController *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SPUISpotlightRemoteViewController;
  v5 = -[SPUISpotlightRemoteViewController init](&v13, sel_init);
  v6 = v5;
  if (v5)
  {
    -[SPUISpotlightRemoteViewController setSceneIdentifier:](v5, "setSceneIdentifier:", v4);
    objc_msgSend(MEMORY[0x24BDF70F0], "sharedInstanceForStyle:", 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SPUISpotlightRemoteViewController setLegibilitySettings:](v6, "setLegibilitySettings:", v7);

    v8 = (void *)objc_opt_new();
    -[SPUISpotlightRemoteViewController setSceneEventsQueue:](v6, "setSceneEventsQueue:", v8);

    v9 = +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_updateTraitCollection, *MEMORY[0x24BDF8198], 0);

    if (-[SPUISpotlightRemoteViewController prewarmSceneInTheBackground](v6, "prewarmSceneInTheBackground"))
    {
      +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setDelegate:", v6);

    }
  }

  return v6;
}

- (void)willLaunchSpotlightInBackground
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __68__SPUISpotlightRemoteViewController_willLaunchSpotlightInBackground__block_invoke;
  block[3] = &unk_24DA1CF20;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t __68__SPUISpotlightRemoteViewController_willLaunchSpotlightInBackground__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createSceneIfNeededWithPriority:", 2);
}

- (int64_t)currentOrientation
{
  int64_t result;
  void *v4;

  if (objc_msgSend((id)objc_opt_class(), "spotlightSupportedInterfaceOrientations") == 2)
  {
    result = 1;
    self->_currentOrientation = 1;
  }
  else
  {
    result = self->_currentOrientation;
    if (!result)
    {
      SBUIGetUserAgent();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      self->_currentOrientation = objc_msgSend(v4, "activeInterfaceOrientation");

      return self->_currentOrientation;
    }
  }
  return result;
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v5;
  _QWORD v6[5];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SPUISpotlightRemoteViewController;
  -[SPUISpotlightRemoteViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v7, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__SPUISpotlightRemoteViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke;
  v6[3] = &unk_24DA1D180;
  v6[4] = self;
  objc_msgSend(v5, "updateSettingsWithBlock:", v6);

}

uint64_t __81__SPUISpotlightRemoteViewController_viewDidMoveToWindow_shouldAppearOrDisappear___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateSafeAreasOnSettings:", a2);
}

- (void)updateSafeAreasOnSettings:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  id v10;

  v4 = a3;
  -[SPUISpotlightRemoteViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "settings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = v4;
  if (objc_msgSend(v8, "isUISubclass"))
  {
    if (objc_msgSend(v10, "isUISubclass"))
    {
      objc_msgSend(v8, "safeAreaInsetsPortrait");
      objc_msgSend(v10, "setSafeAreaInsetsPortrait:");
      objc_msgSend(v8, "peripheryInsets");
      if (v9 > 0.0)
      {
        UIEdgeInsetsRotate();
        objc_msgSend(v10, "setSafeAreaInsetsLandscapeLeft:");
        UIEdgeInsetsRotate();
        objc_msgSend(v10, "setSafeAreaInsetsLandscapeRight:");
      }
    }
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  objc_storeStrong((id *)&self->_legibilitySettings, a3);
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __59__SPUISpotlightRemoteViewController_setLegibilitySettings___block_invoke;
  v8[3] = &unk_24DA1D180;
  v9 = v5;
  v7 = v5;
  objc_msgSend(v6, "updateSettingsWithBlock:", v8);

}

void __59__SPUISpotlightRemoteViewController_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v3, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));

}

- (void)createSceneWithPriority:(int64_t)a3
{
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  char *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void (**v29)(_QWORD, _QWORD);
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  _QWORD v41[4];
  id v42;
  _QWORD v43[4];
  id v44[3];
  id buf;
  _QWORD v46[7];

  +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "launchSpotlightIfNeededWithForegroundPriority:", 1);

  -[SPUISpotlightRemoteViewController transaction](self, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = qword_253DC7800;
  if (v6)
  {
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v7 = qword_253DC7800;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[SPUISpotlightRemoteViewController createSceneWithPriority:].cold.1(v7, self);
  }
  else
  {
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v7 = qword_253DC7800;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_218DEA000, v7, OS_LOG_TYPE_DEFAULT, "Spotlight is running the frontboard transaction", (uint8_t *)&buf, 2u);
    }
    v8 = qword_253DC7808;
    if (!qword_253DC7808)
    {
      SPUIInitLogging();
      v8 = qword_253DC7808;
    }
    v9 = (char *)os_signpost_id_generate(v8);
    v10 = (void *)qword_253DC7808;
    if (!qword_253DC7808)
    {
      SPUIInitLogging();
      v10 = (void *)qword_253DC7808;
    }
    v11 = v10;
    v12 = v11;
    if ((unint64_t)(v9 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_218DEA000, v12, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v9, "sceneTransactionInterval", (const char *)&unk_218DF5EF7, (uint8_t *)&buf, 2u);
    }

    v13 = objc_alloc(MEMORY[0x24BE38050]);
    objc_msgSend(MEMORY[0x24BE80C98], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.Spotlight"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x24BDAC760];
    v46[0] = MEMORY[0x24BDAC760];
    v46[1] = 3221225472;
    v46[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke;
    v46[3] = &unk_24DA1D1A8;
    v46[4] = self;
    v46[5] = a3;
    v16 = (void *)objc_msgSend(v13, "initWithProcessIdentity:executionContextProvider:", v14, v46);
    -[SPUISpotlightRemoteViewController setTransaction:](self, "setTransaction:", v16);

    objc_initWeak(&buf, self);
    -[SPUISpotlightRemoteViewController transaction](self, "transaction");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v15;
    v43[1] = 3221225472;
    v43[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2;
    v43[3] = &unk_24DA1D1F8;
    objc_copyWeak(v44, &buf);
    v44[1] = (id)a3;
    v44[2] = v9;
    objc_msgSend(v17, "setCompletionBlock:", v43);

    -[SPUISpotlightRemoteViewController sceneSpecification](self, "sceneSpecification");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init((Class)objc_msgSend(v18, "settingsClass"));
    v20 = (void *)objc_msgSend(v19, "mutableCopy");

    -[SPUISpotlightRemoteViewController displayConfiguration](self, "displayConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDisplayConfiguration:", v21);

    -[SPUISpotlightRemoteViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "tlks_screen");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "traitCollection");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setUserInterfaceStyle:", objc_msgSend(v24, "userInterfaceStyle"));

    objc_msgSend(v20, "setForeground:", a3 == 4);
    -[SPUISpotlightRemoteViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    objc_msgSend(v20, "setFrame:");
    objc_msgSend(v20, "setDeviceOrientationEventsEnabled:", 0);
    objc_msgSend(v20, "setInterfaceOrientation:", -[SPUISpotlightRemoteViewController currentOrientation](self, "currentOrientation"));
    objc_msgSend(v20, "ignoreOcclusionReasons");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", CFSTR("SPUIRemoteSearchIgnoreOcclusionsReason"));

    objc_msgSend(v20, "setForcedStatusBarForegroundTransparent:", 1);
    objc_msgSend(v20, "setInterruptionPolicy:", 3);
    -[SPUISpotlightRemoteViewController sceneIdentifier](self, "sceneIdentifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setPersistenceIdentifier:", v26);

    -[SPUISpotlightRemoteViewController legibilitySettings](self, "legibilitySettings");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLegibilitySettings:", v27);

    if (+[SPUIDefaults enableFloatingWindow](SPUIDefaults, "enableFloatingWindow"))
      objc_msgSend(v20, "setEnhancedWindowingEnabled:", 1);
    v41[0] = v15;
    v41[1] = 3221225472;
    v41[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_19;
    v41[3] = &unk_24DA1D220;
    v28 = v20;
    v42 = v28;
    v29 = (void (**)(_QWORD, _QWORD))MEMORY[0x219A23794](v41);
    v29[2](v29, 1);
    v29[2](v29, 2);
    v29[2](v29, 4);
    v29[2](v29, 3);
    v30 = objc_alloc_init((Class)objc_msgSend(v18, "clientSettingsClass"));
    v31 = (void *)objc_msgSend(v30, "mutableCopy");

    objc_msgSend(v31, "setStatusBarAlpha:", 1.0);
    objc_msgSend(v31, "setStatusBarHidden:", 0);
    objc_msgSend(v31, "setBackgroundStyle:", 4);
    objc_msgSend(MEMORY[0x24BE380A0], "parametersForSpecification:", v18);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setSettings:", v28);
    objc_msgSend(v32, "setClientSettings:", v31);
    -[SPUISpotlightRemoteViewController transaction](self, "transaction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = (void *)MEMORY[0x24BE380E0];
    -[SPUISpotlightRemoteViewController sceneIdentifier](self, "sceneIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "identityForIdentifier:workspaceIdentifier:", v35, CFSTR("com.apple.Spotlight"));
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = objc_alloc_init((Class)objc_msgSend(v18, "transitionContextClass"));
    objc_msgSend(v33, "updateSceneWithIdentity:parameters:transitionContext:", v36, v32, v37);

    -[SPUISpotlightRemoteViewController transaction](self, "transaction");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addObserver:", self);

    -[SPUISpotlightRemoteViewController transaction](self, "transaction");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "begin");

    -[SPUISpotlightRemoteViewController transaction](self, "transaction");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setWaitsForSceneCommits:", 1);

    objc_destroyWeak(v44);
    objc_destroyWeak(&buf);
  }
}

id __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)objc_opt_new();
  objc_msgSend(v2, "setWatchdogProvider:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v2, "setLaunchIntent:", *(_QWORD *)(a1 + 40));
  return v2;
}

void __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2(uint64_t a1, char a2)
{
  id WeakRetained;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  dispatch_time_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  os_signpost_id_t v18;
  uint8_t v19[16];
  _QWORD block[6];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setTransaction:", 0);
  v5 = qword_253DC7800;
  if ((a2 & 1) != 0)
  {
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v5 = qword_253DC7800;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_218DEA000, v5, OS_LOG_TYPE_DEFAULT, "Spotlight scene transaction passed", v19, 2u);
    }
  }
  else
  {
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v5 = qword_253DC7800;
    }
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    v13 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_16;
    block[3] = &unk_24DA1D1D0;
    v14 = *(_QWORD *)(a1 + 40);
    block[4] = WeakRetained;
    block[5] = v14;
    dispatch_after(v13, MEMORY[0x24BDAC9B8], block);
  }
  v15 = (void *)qword_253DC7808;
  if (!qword_253DC7808)
  {
    SPUIInitLogging();
    v15 = (void *)qword_253DC7808;
  }
  v16 = v15;
  v17 = v16;
  v18 = *(_QWORD *)(a1 + 48);
  if (v18 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)v19 = 0;
    _os_signpost_emit_with_name_impl(&dword_218DEA000, v17, OS_SIGNPOST_INTERVAL_END, v18, "sceneTransactionInterval", " enableTelemetry=YES ", v19, 2u);
  }

}

uint64_t __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_16(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "createSceneWithPriority:", *(_QWORD *)(a1 + 40));
}

uint64_t __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_19(uint64_t a1, uint64_t a2)
{
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "statusBarHeightForOrientation:ignoreHidden:", a2, 1);
  return objc_msgSend(*(id *)(a1 + 32), "setDefaultStatusBarHeight:forOrientation:", a2);
}

- (id)sceneSpecification
{
  return (id)objc_opt_new();
}

- (CGSize)initialFittingSize
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGSize result;

  -[SPUISpotlightRemoteViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "tlks_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = v5;
  v9 = v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)setDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v5;
  uint64_t v6;
  void *v7;
  FBSDisplayConfiguration *v8;
  _QWORD v9[4];
  FBSDisplayConfiguration *v10;
  SPUISpotlightRemoteViewController *v11;

  v5 = (FBSDisplayConfiguration *)a3;
  if (v5 && self->_displayConfiguration != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_displayConfiguration, a3);
    self->_delayPresentationTillSceneContentIsReady = 1;
    if (-[FBSDisplayConfiguration isExternal](v8, "isExternal"))
      v6 = 3;
    else
      v6 = 1;
    -[SPUISpotlightRemoteViewController setCurrentOrientation:](self, "setCurrentOrientation:", v6);
    -[SPUISpotlightRemoteViewController scene](self, "scene");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __61__SPUISpotlightRemoteViewController_setDisplayConfiguration___block_invoke;
    v9[3] = &unk_24DA1D248;
    v10 = v8;
    v11 = self;
    objc_msgSend(v7, "updateSettingsWithBlock:", v9);

    v5 = v8;
  }

}

void __61__SPUISpotlightRemoteViewController_setDisplayConfiguration___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a1 + 32);
  v5 = a2;
  objc_msgSend(v5, "setDisplayConfiguration:", v3);
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v4, "sceneSettingsFrameFromRect:");
  objc_msgSend(v5, "setFrame:");

}

- (FBSDisplayConfiguration)displayConfiguration
{
  FBSDisplayConfiguration *displayConfiguration;

  displayConfiguration = self->_displayConfiguration;
  if (displayConfiguration)
    return displayConfiguration;
  objc_msgSend(MEMORY[0x24BE38058], "mainConfiguration");
  return (FBSDisplayConfiguration *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)createSceneIfNeededWithPriority:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SPUISpotlightRemoteViewController scene](self, "scene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        v6,
        (v8 & 1) != 0))
  {
    v9 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v9 = qword_253DC7800;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v9;
      -[SPUISpotlightRemoteViewController scene](self, "scene");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_218DEA000, v10, OS_LOG_TYPE_DEFAULT, "Current scene %@", (uint8_t *)&v12, 0xCu);

    }
  }
  else
  {
    -[SPUISpotlightRemoteViewController createSceneWithPriority:](self, "createSceneWithPriority:", a3);
  }
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SPUISpotlightRemoteViewController createSceneIfNeededWithPriority:](self, "createSceneIfNeededWithPriority:", 4);
  v5.receiver = self;
  v5.super_class = (Class)SPUISpotlightRemoteViewController;
  -[SPUISpotlightRemoteViewController viewWillAppear:](&v5, sel_viewWillAppear_, v3);
  -[SPUISpotlightRemoteViewController setForeground:](self, "setForeground:", 1);
}

- (void)setForeground:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  BOOL v16;
  id location;
  uint8_t buf[4];
  __CFString *v19;
  uint64_t v20;

  v3 = a3;
  v20 = *MEMORY[0x24BDAC8D0];
  -[SPUISpotlightRemoteViewController hostView](self, "hostView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "backgroundColorWhileHosting");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[SPUISpotlightRemoteViewController hostView](self, "hostView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "presenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "modifyPresentationContext:", &__block_literal_global_2);

  }
  objc_initWeak(&location, self);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_2;
  v14[3] = &unk_24DA1D2D8;
  objc_copyWeak(&v15, &location);
  v16 = v3;
  -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:](self, "addOrExecuteEventAsNeeded:", v14);
  v11 = CFSTR("background");
  if (v3)
    v11 = CFSTR("foreground");
  v12 = v11;
  v13 = qword_253DC7800;
  if (!qword_253DC7800)
  {
    SPUIInitLogging();
    v13 = qword_253DC7800;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v12;
    _os_log_impl(&dword_218DEA000, v13, OS_LOG_TYPE_DEFAULT, "Spotlight is getting to the %@", buf, 0xCu);
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

uint64_t __51__SPUISpotlightRemoteViewController_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setBackgroundColorWhileHosting:", 0);
}

void __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_2(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;
  void *v5;
  id WeakRetained;
  _QWORD v7[5];
  char v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = *(unsigned __int8 *)(a1 + 40);
  +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    objc_msgSend(v3, "sceneWillForeground:", v4);
  else
    objc_msgSend(v3, "sceneWillBackground:", v4);

  objc_msgSend(WeakRetained, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_3;
  v7[3] = &unk_24DA1D2B0;
  v8 = *(_BYTE *)(a1 + 40);
  v7[4] = WeakRetained;
  objc_msgSend(v5, "updateSettingsWithTransitionBlock:", v7);

}

uint64_t __51__SPUISpotlightRemoteViewController_setForeground___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "setForeground:", *(unsigned __int8 *)(a1 + 40));
  if (objc_msgSend(v3, "isUISubclass") && *(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setCurrentOrientation:", objc_msgSend(v5, "_windowInterfaceOrientation"));

    v6 = v3;
    objc_msgSend(v6, "setInterfaceOrientation:", objc_msgSend(*(id *)(a1 + 32), "currentOrientation"));
    objc_msgSend(*(id *)(a1 + 32), "updateSafeAreasOnSettings:", v6);
    if (!+[SPUIDefaults enableFloatingWindow](SPUIDefaults, "enableFloatingWindow"))
      objc_msgSend(v6, "setForcedStatusBarStyle:", &unk_24DA20F70);

  }
  return 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SPUISpotlightRemoteViewController;
  -[SPUISpotlightRemoteViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[SPUISpotlightRemoteViewController setCrashedWhileForeground:](self, "setCrashedWhileForeground:", 0);
  -[SPUISpotlightRemoteViewController setForeground:](self, "setForeground:", 0);
  -[SPUISpotlightRemoteViewController clearEventQueue](self, "clearEventQueue");
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  NSObject *v11;
  uint64_t v12;

  v4 = a3;
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[SPUISpotlightRemoteViewController transaction](self, "transaction");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[SPUISpotlightRemoteViewController setScene:](self, "setScene:", 0);
  -[SPUISpotlightRemoteViewController setPresenter:](self, "setPresenter:", 0);
  -[SPUISpotlightRemoteViewController hostView](self, "hostView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeFromSuperview");

  -[SPUISpotlightRemoteViewController setHostView:](self, "setHostView:", 0);
  +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "removeScene:", v4);

  objc_msgSend(v4, "settings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isForeground"))
    v10 = -[SPUISpotlightRemoteViewController _appearState](self, "_appearState") != 0;
  else
    v10 = 0;
  -[SPUISpotlightRemoteViewController setCrashedWhileForeground:](self, "setCrashedWhileForeground:", v10);

  if (-[SPUISpotlightRemoteViewController crashedWhileForeground](self, "crashedWhileForeground"))
  {
    v11 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v11 = qword_253DC7800;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[SPUISpotlightRemoteViewController sceneDidInvalidate:].cold.1((uint64_t)v4, v11, v12);
    -[SPUISpotlightRemoteViewController createSceneWithPriority:](self, "createSceneWithPriority:", 4);
  }

}

- (void)sceneContentStateDidChange:(id)a3
{
  uint64_t v4;
  void *v5;
  double v6;
  id v7;

  if (self->_delayPresentationTillSceneContentIsReady)
  {
    v4 = objc_msgSend(a3, "contentState");
    if (v4 == 2)
      self->_delayPresentationTillSceneContentIsReady = 0;
    -[SPUISpotlightRemoteViewController hostView](self, "hostView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v6 = 0.0;
    if (v4 == 2)
      v6 = 1.0;
    objc_msgSend(v5, "setAlpha:", v6);

  }
}

- (void)transaction:(id)a3 didCreateScene:(id)a4
{
  id v5;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t v44[128];
  uint8_t buf[4];
  _QWORD v46[3];

  *(_QWORD *)((char *)&v46[1] + 4) = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  -[SPUISpotlightRemoteViewController setScene:](self, "setScene:", v5);
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:", self);

  +[SPUISpotlightSceneManager sharedManager](SPUISpotlightSceneManager, "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addScene:", v5);

  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiPresentationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUISpotlightRemoteViewController sceneIdentifier](self, "sceneIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "createPresenterWithIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SPUISpotlightRemoteViewController setPresenter:](self, "setPresenter:", v11);
  objc_msgSend(v11, "presentationView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISpotlightRemoteViewController setHostView:](self, "setHostView:", v12);

  objc_msgSend(v11, "modifyPresentationContext:", &__block_literal_global_36);
  objc_msgSend(v11, "activate");
  -[SPUISpotlightRemoteViewController view](self, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISpotlightRemoteViewController hostView](self, "hostView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SPUISpotlightRemoteViewController hostView](self, "hostView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", v15);

  -[SPUISpotlightRemoteViewController hostView](self, "hostView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(v14, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setActive:", 1);

  objc_msgSend(v14, "trailingAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "trailingAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setActive:", 1);

  objc_msgSend(v14, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setActive:", 1);

  objc_msgSend(v14, "bottomAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bottomAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setActive:", 1);

  v29 = qword_253DC7800;
  if (!qword_253DC7800)
  {
    SPUIInitLogging();
    v29 = qword_253DC7800;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v46[0] = v5;
    _os_log_impl(&dword_218DEA000, v29, OS_LOG_TYPE_DEFAULT, "Spotlight created scene %@", buf, 0xCu);
  }
  -[SPUISpotlightRemoteViewController sceneContentStateDidChange:](self, "sceneContentStateDidChange:", v5);
  if (-[SPUISpotlightRemoteViewController crashedWhileForeground](self, "crashedWhileForeground"))
  {
    -[SPUISpotlightRemoteViewController didInvalidateSceneWhenForeground](self, "didInvalidateSceneWhenForeground");
    -[SPUISpotlightRemoteViewController setCrashedWhileForeground:](self, "setCrashedWhileForeground:", 0);
  }
  else
  {
    v37 = v11;
    v38 = v9;
    v39 = v5;
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[SPUISpotlightRemoteViewController sceneEventsQueue](self, "sceneEventsQueue");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v31)
    {
      v32 = v31;
      v33 = *(_QWORD *)v41;
      do
      {
        v34 = 0;
        do
        {
          if (*(_QWORD *)v41 != v33)
            objc_enumerationMutation(v30);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v34) + 16))();
          v35 = qword_253DC7800;
          if (!qword_253DC7800)
          {
            SPUIInitLogging();
            v35 = qword_253DC7800;
          }
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
            -[SPUISpotlightRemoteViewController transaction:didCreateScene:].cold.1(buf, v35, self, v46);
          ++v34;
        }
        while (v32 != v34);
        v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
      }
      while (v32);
    }

    -[SPUISpotlightRemoteViewController clearEventQueue](self, "clearEventQueue");
    v9 = v38;
    v5 = v39;
    v11 = v37;
  }
  -[SPUISpotlightRemoteViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "layoutIfNeeded");

}

void __64__SPUISpotlightRemoteViewController_transaction_didCreateScene___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setPresentedLayerTypes:", 26);
  objc_msgSend(v2, "setAppearanceStyle:", 2);
  objc_msgSend(v2, "setClippingDisabled:", 1);

}

- (void)didInvalidateSceneWhenForeground
{
  OUTLINED_FUNCTION_0_0(&dword_218DEA000, a1, a3, "Spotlight died in the foreground coming back up", a5, a6, a7, a8, 0);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  height = a3.height;
  width = a3.width;
  v11.receiver = self;
  v11.super_class = (Class)SPUISpotlightRemoteViewController;
  v7 = a4;
  -[SPUISpotlightRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v11, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SPUISpotlightRemoteViewController view](self, "view", v11.receiver, v11.super_class);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "_toWindowOrientation");

  if (v10)
    -[SPUISpotlightRemoteViewController setCurrentOrientation:](self, "setCurrentOrientation:", v10);
  else
    v10 = -[SPUISpotlightRemoteViewController currentOrientation](self, "currentOrientation");
  -[SPUISpotlightRemoteViewController updateSceneToOrientation:withTransitionCoordinator:](self, "updateSceneToOrientation:withTransitionCoordinator:", v10, v7);

}

- (void)updateSceneToOrientation:(int64_t)a3 withTransitionCoordinator:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  int64_t v13;

  v10 = a4;
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "interfaceOrientation");

  if (v8 != a3)
  {
    -[SPUISpotlightRemoteViewController scene](self, "scene");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __88__SPUISpotlightRemoteViewController_updateSceneToOrientation_withTransitionCoordinator___block_invoke;
    v11[3] = &unk_24DA1D320;
    v12 = v10;
    v13 = a3;
    objc_msgSend(v9, "updateSettingsWithTransitionBlock:", v11);

  }
}

id __88__SPUISpotlightRemoteViewController_updateSceneToOrientation_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDF6830], "transitionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(void **)(a1 + 32);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BE38008];
    objc_msgSend(v5, "transitionDuration");
    objc_msgSend(v6, "settingsWithDuration:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnimationSettings:", v7);

    objc_msgSend(MEMORY[0x24BDF6D20], "_synchronizedDrawingFence");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAnimationFence:", v8);

  }
  objc_msgSend(v3, "setInterfaceOrientation:", *(_QWORD *)(a1 + 40));

  return v4;
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  BOOL v18;
  _QWORD v19[4];
  id v20[5];
  id location;
  objc_super v22;
  CGRect v23;
  CGRect v24;

  v22.receiver = self;
  v22.super_class = (Class)SPUISpotlightRemoteViewController;
  -[SPUISpotlightRemoteViewController viewDidLayoutSubviews](&v22, sel_viewDidLayoutSubviews);
  -[SPUISpotlightRemoteViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  -[SPUISpotlightRemoteViewController sceneSettingsFrameFromRect:](self, "sceneSettingsFrameFromRect:");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "settings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v24.origin.x = v14;
  v24.origin.y = v15;
  v24.size.width = v16;
  v24.size.height = v17;
  *(_QWORD *)&v23.origin.x = v5;
  *(_QWORD *)&v23.origin.y = v7;
  *(_QWORD *)&v23.size.width = v9;
  *(_QWORD *)&v23.size.height = v11;
  v18 = CGRectEqualToRect(v23, v24);

  if (!v18)
  {
    objc_initWeak(&location, self);
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke;
    v19[3] = &unk_24DA1D368;
    objc_copyWeak(v20, &location);
    v20[1] = v5;
    v20[2] = v7;
    v20[3] = v9;
    v20[4] = v11;
    -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:](self, "addOrExecuteEventAsNeeded:", v19);
    objc_destroyWeak(v20);
    objc_destroyWeak(&location);
  }
}

void __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke(uint64_t a1)
{
  void *v2;
  __int128 v3;
  id WeakRetained;
  _QWORD v5[4];
  __int128 v6;
  __int128 v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke_2;
  v5[3] = &__block_descriptor_64_e33_v16__0__FBSMutableSceneSettings_8l;
  v3 = *(_OWORD *)(a1 + 56);
  v6 = *(_OWORD *)(a1 + 40);
  v7 = v3;
  objc_msgSend(v2, "updateSettingsWithBlock:", v5);

}

uint64_t __58__SPUISpotlightRemoteViewController_viewDidLayoutSubviews__block_invoke_2(double *a1, void *a2)
{
  return objc_msgSend(a2, "setFrame:", a1[4], a1[5], a1[6], a1[7]);
}

- (CGRect)sceneSettingsFrameFromRect:(CGRect)a3
{
  double height;
  double width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  int64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (CGRectEqualToRect(a3, *MEMORY[0x24BDBF090]))
  {
    -[SPUISpotlightRemoteViewController initialFittingSize](self, "initialFittingSize");
    width = v8;
    -[SPUISpotlightRemoteViewController initialFittingSize](self, "initialFittingSize");
    height = v9;
  }
  v10 = -[SPUISpotlightRemoteViewController currentOrientation](self, "currentOrientation");
  if ((unint64_t)(v10 - 3) >= 2)
    v11 = height;
  else
    v11 = width;
  if ((unint64_t)(v10 - 3) >= 2)
    v12 = width;
  else
    v12 = height;
  v13 = x;
  v14 = y;
  result.size.height = v11;
  result.size.width = v12;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)addOrExecuteEventAsNeeded:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  void *v11;

  v4 = (void (**)(_QWORD))a3;
  -[SPUISpotlightRemoteViewController scene](self, "scene");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5
    && (v6 = (void *)v5,
        -[SPUISpotlightRemoteViewController scene](self, "scene"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "isValid"),
        v7,
        v6,
        v8))
  {
    v4[2](v4);
    v9 = qword_253DC7800;
    if (!qword_253DC7800)
    {
      SPUIInitLogging();
      v9 = qword_253DC7800;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[SPUISpotlightRemoteViewController addOrExecuteEventAsNeeded:].cold.1(v9, self);
  }
  else
  {
    -[SPUISpotlightRemoteViewController sceneEventsQueue](self, "sceneEventsQueue");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)MEMORY[0x219A23794](v4);
    objc_msgSend(v10, "addObject:", v11);

  }
}

- (void)clearEventQueue
{
  id v2;

  -[SPUISpotlightRemoteViewController sceneEventsQueue](self, "sceneEventsQueue");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeAllObjects");

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)setSceneFrameOnRotation
{
  return 0;
}

- (id)watchdogPolicyForProcess:(id)a3 eventContext:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BYTE v12[24];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  if (objc_msgSend(v4, "event") == 1 || objc_msgSend(v4, "event") == 2)
  {
    v5 = 0;
  }
  else
  {
    objc_msgSend(v4, "sceneSettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "isForeground");

    v7 = (void *)MEMORY[0x24BE380B8];
    FBSProcessResourceAllowanceMakeWithRealTimeInterval();
    objc_msgSend(v7, "provisionWithAllowance:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)MEMORY[0x24BE380C8];
    v13[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "policyWithProvisions:", v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)watchdogTerminationRequestForProcess:(id)a3 error:(id)a4
{
  void *v4;

  objc_msgSend(MEMORY[0x24BE380C0], "requestForProcess:withLabel:", a3, CFSTR("Spotlight is unresponsive"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setExplanation:", CFSTR("Spotlight is unresponsive"));
  objc_msgSend(v4, "setReportType:", 1);
  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setSceneIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 992);
}

- (void)setCurrentOrientation:(int64_t)a3
{
  self->_currentOrientation = a3;
}

- (void)setScene:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1008);
}

- (FBApplicationUpdateScenesTransaction)transaction
{
  return (FBApplicationUpdateScenesTransaction *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setTransaction:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (UIScenePresentation)hostView
{
  return (UIScenePresentation *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setHostView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (UIScenePresenter)presenter
{
  return (UIScenePresenter *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPresenter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSMutableArray)sceneEventsQueue
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setSceneEventsQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (BOOL)prewarmSceneInTheBackground
{
  return self->_prewarmSceneInTheBackground;
}

- (BOOL)crashedWhileForeground
{
  return self->_crashedWhileForeground;
}

- (void)setCrashedWhileForeground:(BOOL)a3
{
  self->_crashedWhileForeground = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sceneEventsQueue, 0);
  objc_storeStrong((id *)&self->_presenter, 0);
  objc_storeStrong((id *)&self->_hostView, 0);
  objc_storeStrong((id *)&self->_transaction, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sceneIdentifier, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
}

- (void)createSceneWithPriority:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "transaction");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138412290;
  v7 = v4;
  OUTLINED_FUNCTION_2_0(&dword_218DEA000, v3, v5, "Spotlight has an existing transaction in progress %@", (uint8_t *)&v6);

  OUTLINED_FUNCTION_1_0();
}

void __61__SPUISpotlightRemoteViewController_createSceneWithPriority___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_218DEA000, a1, a3, "Spotlight launch failed retrying in 1 second", a5, a6, a7, a8, 0);
}

- (void)sceneDidInvalidate:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138412290;
  v4 = a1;
  OUTLINED_FUNCTION_2_0(&dword_218DEA000, a2, a3, "Spotlight died in the foreground for scene %@", (uint8_t *)&v3);
}

- (void)transaction:(void *)a3 didCreateScene:(_QWORD *)a4 .cold.1(uint8_t *a1, void *a2, void *a3, _QWORD *a4)
{
  NSObject *v7;
  void *v8;

  v7 = a2;
  objc_msgSend(a3, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a4 = v8;
  _os_log_debug_impl(&dword_218DEA000, v7, OS_LOG_TYPE_DEBUG, "Spotlight scene got updated %@", a1, 0xCu);

}

- (void)addOrExecuteEventAsNeeded:(void *)a1 .cold.1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v4;
  _os_log_debug_impl(&dword_218DEA000, v3, OS_LOG_TYPE_DEBUG, "Spotlight scene got updated %@", (uint8_t *)&v5, 0xCu);

  OUTLINED_FUNCTION_1_0();
}

@end
