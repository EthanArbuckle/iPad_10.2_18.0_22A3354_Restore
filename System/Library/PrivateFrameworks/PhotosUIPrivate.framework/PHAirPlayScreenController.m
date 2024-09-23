@implementation PHAirPlayScreenController

- (PHAirPlayScreenController)init
{
  PHAirPlayScreenController *v2;
  PUAirPlayScreenDetector *v3;
  PUAirPlayContentRegistry *v4;
  PUAirPlayRouteObserverRegistry *v5;
  uint64_t v6;
  void *v7;
  AVOutputContext *outputContext;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHAirPlayScreenController;
  v2 = -[PHAirPlayScreenController init](&v10, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(PUAirPlayScreenDetector);
    -[PUAirPlayScreenDetector setReceiver:](v3, "setReceiver:", v2);
    -[PHAirPlayScreenController _setScreenDetector:](v2, "_setScreenDetector:", v3);
    v4 = objc_alloc_init(PUAirPlayContentRegistry);
    -[PHAirPlayScreenController _setContentRegistry:](v2, "_setContentRegistry:", v4);

    v5 = objc_alloc_init(PUAirPlayRouteObserverRegistry);
    -[PUAirPlayRouteObserverRegistry setDelegate:](v5, "setDelegate:", v2);
    -[PHAirPlayScreenController _setRouteObserverRegistry:](v2, "_setRouteObserverRegistry:", v5);
    objc_msgSend(MEMORY[0x1E0C8B2A8], "sharedSystemScreenContext");
    v6 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__outputDeviceDidChange_, *MEMORY[0x1E0C8AB28], v6);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__sceneWillDeactivate_, *MEMORY[0x1E0DC5330], 0);
    objc_msgSend(v7, "addObserver:selector:name:object:", v2, sel__sceneDidActivate_, *MEMORY[0x1E0DC5308], 0);
    outputContext = v2->_outputContext;
    v2->_outputContext = (AVOutputContext *)v6;

  }
  return v2;
}

- (unint64_t)screenAvailability
{
  void *v2;
  void *v3;
  uint64_t v4;
  unint64_t v5;

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "type");
    if (v4 == 1)
      v5 = 2;
    else
      v5 = v4 == 2;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isDisplayingContent
{
  void *v3;
  void *v4;
  unint64_t v5;
  BOOL v6;
  BOOL v7;
  void *v8;

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[PHAirPlayScreenController screenAvailability](self, "screenAvailability");
  if (v4)
    v6 = v5 == 0;
  else
    v6 = 1;
  v7 = !v6;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "childViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      v7 = 0;

  }
  return v7;
}

- (id)_currentContent
{
  void *v3;
  void *v4;

  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentForController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PHAirPlayScreenController _lastDisplayedContent](self, "_lastDisplayedContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (void)_cacheDisplayedContentIfNeededForUnregisteringProvider:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCurrentContentProvider:", v7)
    && (objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v7, "wantsContentVisibleAfterUnregisteringWithAirPlayController:", self)
    && objc_msgSend(v4, "placeholderType") == 2
    && -[PHAirPlayScreenController isDisplayingContent](self, "isDisplayingContent"))
  {
    objc_msgSend(v5, "contentForController:", self);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAirPlayScreenController _setLastDisplayedContent:](self, "_setLastDisplayedContent:", v6);

  }
}

- (void)_updateScreenContentWithShouldTryToFindAvailableScreen:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  __CFString *v6;
  PUAirPlayRootViewController *v7;
  NSObject *v8;
  NSObject *v9;
  _BOOL4 v10;
  __CFString *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  __CFString *v15;
  uint64_t v16;
  NSObject *v17;
  PUAirPlayRootViewController *v18;
  NSObject *v19;
  NSObject *v20;
  PUAirPlayRootViewController *v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  const __CFString *v28;
  int v29;
  const __CFString *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v3 = a3;
  v33 = *MEMORY[0x1E0C80C00];
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v29) = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Updating PHAirPlayScreenController", (uint8_t *)&v29, 2u);
  }

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _rootViewController](self, "_rootViewController");
  v7 = (PUAirPlayRootViewController *)objc_claimAutoreleasedReturnValue();
  if (!v6 && v3)
  {
    PLAirPlayGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "\tNo screen currently in use; searching for screens",
        (uint8_t *)&v29,
        2u);
    }

    -[PHAirPlayScreenController _findAvailableScreen](self, "_findAvailableScreen");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[PHAirPlayScreenController _setCurrentScreen:](self, "_setCurrentScreen:", v6);
  }
  PLAirPlayGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v10)
    {
      v29 = 138412290;
      v30 = v6;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "\tUsing AirPlay screen: %@", (uint8_t *)&v29, 0xCu);
    }

    -[PHAirPlayScreenController _currentContent](self, "_currentContent");
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
    PLAirPlayGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v29 = 138412290;
      v30 = v11;
      _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "\tFetched content: %@", (uint8_t *)&v29, 0xCu);
    }

    PLAirPlayGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "currentContentProvider");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v29 = 138412290;
      v30 = v15;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "\tContent provider: %@", (uint8_t *)&v29, 0xCu);

    }
    v16 = -[__CFString placeholderType](v6, "placeholderType");
    if (v11 || v16 == 1)
    {
      if (!v7)
      {
        PLAirPlayGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v29) = 0;
          _os_log_impl(&dword_1AAB61000, v19, OS_LOG_TYPE_DEFAULT, "\tCreating system root view controller", (uint8_t *)&v29, 2u);
        }

        v7 = objc_alloc_init(PUAirPlayRootViewController);
      }
      PLAirPlayGetLog();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "\tProviding system root view controller to AirPlay screen", (uint8_t *)&v29, 2u);
      }

      v18 = v7;
      v7 = v18;
    }
    else
    {
      PLAirPlayGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1AAB61000, v17, OS_LOG_TYPE_DEFAULT, "\tRemoving AirPlay screen's view controller because there is no content to display and placeholders are disabled for the current screen in AirPlay settings", (uint8_t *)&v29, 2u);
      }

      v11 = 0;
      v18 = 0;
    }
  }
  else
  {
    if (v10)
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_DEFAULT, "\tNo available screen; ignoring any registered content and discarding root view controller",
        (uint8_t *)&v29,
        2u);
    }

    v11 = 0;
    v18 = 0;
    v7 = 0;
  }
  -[__CFString rootViewController](v6, "rootViewController");
  v21 = (PUAirPlayRootViewController *)objc_claimAutoreleasedReturnValue();

  if (v18 == v21)
    v22 = 0;
  else
    v22 = objc_alloc_init(MEMORY[0x1E0DC4308]);
  -[PHAirPlayScreenController _setRootViewController:](self, "_setRootViewController:", v7);
  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = objc_msgSend(v23, "switchToMediaPresentationMode");

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "type");

  if (!v24 || v26 == 1)
  {
    -[__CFString setRootViewController:](v6, "setRootViewController:", v18);
    -[PUAirPlayRootViewController setChildViewController:animated:](v7, "setChildViewController:animated:", v11, v18 == v21);
  }
  if (v22)
  {
    objc_msgSend(v22, "setCurrentOutputDeviceEnabled:", v18 != 0);
    PLAirPlayGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = CFSTR("NO");
      if (v18)
        v28 = CFSTR("YES");
      v29 = 138412546;
      v30 = v28;
      v31 = 2112;
      v32 = v22;
      _os_log_impl(&dword_1AAB61000, v27, OS_LOG_TYPE_DEFAULT, "\tSetting enabled %@ on screen picker %@", (uint8_t *)&v29, 0x16u);
    }

  }
}

- (BOOL)_shouldUpdateSecondDisplayModeWithCurrentContent
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "switchToMediaPresentationMode");

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "type");

  if (v5)
    v8 = v4;
  else
    v8 = 0;
  return v7 != 1 && v8;
}

- (void)_updateSecondDisplayModeWithCurrentContent
{
  void *v3;
  void *v4;
  _BOOL8 v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;
  BOOL v12;
  id location;

  if (-[PHAirPlayScreenController _shouldUpdateSecondDisplayModeWithCurrentContent](self, "_shouldUpdateSecondDisplayModeWithCurrentContent"))
  {
    objc_initWeak(&location, self);
    -[PHAirPlayScreenController _rootViewController](self, "_rootViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAirPlayScreenController _currentContent](self, "_currentContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __71__PHAirPlayScreenController__updateSecondDisplayModeWithCurrentContent__block_invoke;
    v8[3] = &unk_1E58A6558;
    objc_copyWeak(&v11, &location);
    v12 = v4 != 0;
    v6 = v3;
    v9 = v6;
    v7 = v4;
    v10 = v7;
    -[PHAirPlayScreenController _switchModeForHighResolutionContent:completionHandler:](self, "_switchModeForHighResolutionContent:completionHandler:", v5, v8);

    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
}

- (void)_switchModeForHighResolutionContent:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL4 v4;
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  id *v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  void (**v16)(_QWORD);
  id v17;
  BOOL v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v4 = a3;
  v21 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(_QWORD))a4;
  -[PHAirPlayScreenController outputContext](self, "outputContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "outputDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = (id *)MEMORY[0x1E0C8AB98];
    if (!v4)
      v9 = (id *)MEMORY[0x1E0C8AB90];
    v10 = *v9;
    PLAirPlayGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v10;
      _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Switch AirPlay mode to %@", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __83__PHAirPlayScreenController__switchModeForHighResolutionContent_completionHandler___block_invoke;
    v14[3] = &unk_1E589AAC0;
    v12 = v10;
    v15 = v12;
    v18 = v4;
    objc_copyWeak(&v17, (id *)buf);
    v16 = v6;
    objc_msgSend(v8, "setSecondDisplayMode:completionHandler:", v12, v14);

    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
  else
  {
    PLAirPlayGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_DEFAULT, "Skip switching AirPlay mode as output device is nil", buf, 2u);
    }

    if (v6)
      v6[2](v6);
  }

}

- (void)_handleSettingHighResolutionContent:(BOOL)a3 forRootController:(id)a4 content:(id)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v6 = a3;
  v18 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  PLAirPlayGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 138412546;
    v15 = v8;
    v16 = 2112;
    v17 = v9;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Set up content for presentation with root controller %@, content %@", (uint8_t *)&v14, 0x16u);
  }

  -[PHAirPlayScreenController _updateScreenContentWithShouldTryToFindAvailableScreen:](self, "_updateScreenContentWithShouldTryToFindAvailableScreen:", 1);
  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v6)
    v13 = v8;
  else
    v13 = 0;
  objc_msgSend(v11, "setRootViewController:", v13);

  objc_msgSend(v8, "setChildViewController:animated:", v9, 0);
}

- (id)_findAvailableScreen
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  -[PHAirPlayScreenController _screenDetector](self, "_screenDetector");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableScreens");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (!-[PHAirPlayScreenController _shouldIgnoreScreen:](self, "_shouldIgnoreScreen:", v11, (_QWORD)v14))
        {
          v12 = v11;

          v8 = v12;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_shouldIgnoreScreen:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  int v8;
  BOOL v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") != 2)
    goto LABEL_11;
  if (objc_msgSend(v4, "ignoreMirroredScreens"))
  {
    PLAirPlayGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138412290;
      v12 = v3;
      v6 = "Ignoring mirrored screen per AirPlay settings: %@";
LABEL_9:
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v11, 0xCu);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  if (!objc_msgSend(v4, "ignoreScreenRecordingScreens"))
    goto LABEL_11;
  objc_msgSend(v3, "size");
  PXSizeGetAspectRatio();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  PXSizeGetAspectRatio();
  v8 = PXFloatEqualToFloatWithTolerance();

  if (!v8)
  {
LABEL_11:
    v9 = 0;
    goto LABEL_12;
  }
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v3;
    v6 = "Ignoring screen recording screen per AirPlay settings: %@";
    goto LABEL_9;
  }
LABEL_10:

  v9 = 1;
LABEL_12:

  return v9;
}

- (void)registerContentProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Registering content provider: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAirPlayScreenController _setLastDisplayedContent:](self, "_setLastDisplayedContent:", 0);
  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addContentProvider:", v4);

  -[PHAirPlayScreenController _updateScreenContentWithShouldTryToFindAvailableScreen:](self, "_updateScreenContentWithShouldTryToFindAvailableScreen:", 1);
  -[PHAirPlayScreenController _updateSecondDisplayModeWithCurrentContent](self, "_updateSecondDisplayModeWithCurrentContent");

}

- (void)unregisterContentProvider:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Unregistering content provider: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAirPlayScreenController _cacheDisplayedContentIfNeededForUnregisteringProvider:](self, "_cacheDisplayedContentIfNeededForUnregisteringProvider:", v4);
  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeContentProvider:", v4);

  -[PHAirPlayScreenController _updateScreenContentWithShouldTryToFindAvailableScreen:](self, "_updateScreenContentWithShouldTryToFindAvailableScreen:", 0);
  -[PHAirPlayScreenController _updateSecondDisplayModeWithCurrentContent](self, "_updateSecondDisplayModeWithCurrentContent");

}

- (BOOL)isContentProviderRegistered:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isContentProviderRegistered:", v4);

  return v6;
}

- (void)registerRouteObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Registering route observer: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAirPlayScreenController _routeObserverRegistry](self, "_routeObserverRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addRouteObserver:", v4);

}

- (void)unregisterRouteObserver:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLAirPlayGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEFAULT, "Unregistering route observer: %@", (uint8_t *)&v7, 0xCu);
  }

  -[PHAirPlayScreenController _routeObserverRegistry](self, "_routeObserverRegistry");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeRouteObserver:", v4);

}

- (void)airPlayRouteObserverRegistryRouteAvailabilityChanged:(id)a3 forRouteObserver:(id)a4
{
  objc_msgSend(a4, "airPlayControllerRouteAvailabilityChanged:", self);
}

- (unint64_t)routeAvailability
{
  void *v3;
  unint64_t v4;

  -[PHAirPlayScreenController _routeObserverRegistry](self, "_routeObserverRegistry");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "routeAvailability");

  if (-[PHAirPlayScreenController _shouldHideRoutesForExternalDisplay](self, "_shouldHideRoutesForExternalDisplay"))
    return 2;
  else
    return v4;
}

- (int64_t)routeUnavailableReason
{
  if (-[PHAirPlayScreenController routeAvailability](self, "routeAvailability") != 2)
    return 0;
  if (-[PHAirPlayScreenController _shouldHideRoutesForExternalDisplay](self, "_shouldHideRoutesForExternalDisplay"))
    return 2;
  return 1;
}

- (BOOL)_shouldHideRoutesForExternalDisplay
{
  char HasSceneOnExternalDisplay;

  HasSceneOnExternalDisplay = PXApplicationHasSceneOnExternalDisplay();
  return HasSceneOnExternalDisplay & !-[PHAirPlayScreenController isDisplayingContent](self, "isDisplayingContent");
}

- (void)screenDetector:(id)a3 didDetectScreen:(id)a4
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  const char *v13;
  void *v14;
  int v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLAirPlayGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Detected new AirPlay screen to use: %@", (uint8_t *)&v15, 0xCu);
  }

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = objc_msgSend(v7, "isValid");
    PLAirPlayGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v11)
      {
        -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 138412290;
        v16 = v12;
        v13 = "\tIgnoring connected screen, using current screen %@";
LABEL_13:
        _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, v13, (uint8_t *)&v15, 0xCu);

        goto LABEL_16;
      }
      goto LABEL_16;
    }
    if (v11)
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "\tCurrent screen connected but is invalid, replacing with the new screen", (uint8_t *)&v15, 2u);
    }

  }
  if (-[PHAirPlayScreenController _shouldIgnoreScreen:](self, "_shouldIgnoreScreen:", v5))
  {
    PLAirPlayGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412290;
      v16 = v12;
      v13 = "\tIgnoring screen: %@";
      goto LABEL_13;
    }
  }
  else
  {
    -[PHAirPlayScreenController _recordSessionBeganWithScreen:](self, "_recordSessionBeganWithScreen:", v5);
    -[PHAirPlayScreenController _setCurrentScreen:](self, "_setCurrentScreen:", v5);
    -[PHAirPlayScreenController _updateScreenContentWithShouldTryToFindAvailableScreen:](self, "_updateScreenContentWithShouldTryToFindAvailableScreen:", 1);
    -[PHAirPlayScreenController _updateSecondDisplayModeWithCurrentContent](self, "_updateSecondDisplayModeWithCurrentContent");
    -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentContentProvider");
    v10 = objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject airPlayControllerScreenAvailabilityChanged:](v10, "airPlayControllerScreenAvailabilityChanged:", self);
  }
LABEL_16:

}

- (void)screenDetector:(id)a3 didLoseScreen:(id)a4
{
  id v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  PLAirPlayGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "AirPlay screen disappeared: %@", (uint8_t *)&v16, 0xCu);
  }

  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v5)
  {
    -[PHAirPlayScreenController _setCurrentScreen:](self, "_setCurrentScreen:", 0);
    -[PHAirPlayScreenController _setLastDisplayedContent:](self, "_setLastDisplayedContent:", 0);
    -[PHAirPlayScreenController _updateScreenContentWithShouldTryToFindAvailableScreen:](self, "_updateScreenContentWithShouldTryToFindAvailableScreen:", 0);
    +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "switchToMediaPresentationMode");

    if (v11)
    {
      PLAirPlayGetLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        -[PHAirPlayScreenController secondDisplayModeToken](self, "secondDisplayModeToken");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1AAB61000, v12, OS_LOG_TYPE_DEFAULT, "\tReleasing second display mode token %@", (uint8_t *)&v16, 0xCu);

      }
      -[PHAirPlayScreenController setSecondDisplayModeToken:](self, "setSecondDisplayModeToken:", 0);
    }
    -[PHAirPlayScreenController _updateSecondDisplayModeWithCurrentContent](self, "_updateSecondDisplayModeWithCurrentContent");
    -[PHAirPlayScreenController _recordSessionEnded](self, "_recordSessionEnded");
    -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "currentContentProvider");
    v8 = objc_claimAutoreleasedReturnValue();

    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[NSObject airPlayControllerScreenAvailabilityChanged:](v8, "airPlayControllerScreenAvailabilityChanged:", self);
    -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "clearContent");

    -[PHAirPlayScreenController _setLastDisplayedContent:](self, "_setLastDisplayedContent:", 0);
  }
  else
  {
    PLAirPlayGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v9;
      _os_log_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_DEFAULT, "\tIgnoring disconnected screen, doesn't match current screen %@", (uint8_t *)&v16, 0xCu);

    }
  }

}

- (void)notifyDidPresentAirPlayRoutesFromShareSheet
{
  -[PHAirPlayScreenController _notifyWillRequestAirPlayScreenFromSource:](self, "_notifyWillRequestAirPlayScreenFromSource:", 1);
}

- (void)notifyDidPresentAirPlayRoutesFromSlideshow
{
  -[PHAirPlayScreenController _notifyWillRequestAirPlayScreenFromSource:](self, "_notifyWillRequestAirPlayScreenFromSource:", 2);
}

- (void)_notifyWillRequestAirPlayScreenFromSource:(int64_t)a3
{
  id v5;

  if (!-[PHAirPlayScreenController screenAvailability](self, "screenAvailability"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[PHAirPlayScreenController _setLastScreenRequestDate:](self, "_setLastScreenRequestDate:", v5);
    -[PHAirPlayScreenController _setLastScreenRequestOrigin:](self, "_setLastScreenRequestOrigin:", a3);

  }
}

- (void)_recordSessionBeganWithScreen:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  int64_t v8;
  NSObject *v9;
  uint8_t v10[16];

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _lastScreenRequestDate](self, "_lastScreenRequestDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6 || objc_msgSend(v4, "type") == 2 || (objc_msgSend(v5, "timeIntervalSinceDate:", v6), v7 >= 30.0))
    v8 = 0;
  else
    v8 = -[PHAirPlayScreenController _lastScreenRequestOrigin](self, "_lastScreenRequestOrigin");
  objc_msgSend((id)objc_opt_class(), "_keyForScreenRequestOrigin:", v8);
  PLSAggregateDictionaryAddValueForScalarKey();
  PLSAggregateDictionaryAddValueForScalarKey();
  -[PHAirPlayScreenController _setLastScreenConnectDate:](self, "_setLastScreenConnectDate:", v5);
  -[PHAirPlayScreenController _setLastScreenRequestDate:](self, "_setLastScreenRequestDate:", 0);
  -[PHAirPlayScreenController _setLastScreenRequestOrigin:](self, "_setLastScreenRequestOrigin:", v8);
  if (-[PHAirPlayScreenController airPlaySessionSignpost](self, "airPlaySessionSignpost"))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v10 = 0;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "AirPlay session started twice", v10, 2u);
    }

  }
  -[PHAirPlayScreenController setAirPlaySessionSignpost:](self, "setAirPlaySessionSignpost:", objc_msgSend(MEMORY[0x1E0D09910], "startSignpost"));

}

- (void)_recordSessionEnded
{
  void *v3;
  void *v4;
  unint64_t v5;
  id v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _lastScreenConnectDate](self, "_lastScreenConnectDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v3, "timeIntervalSinceDate:", v4);
    PLSAggregateDictionaryPushValueForDistributionKey();
  }
  -[PHAirPlayScreenController _setLastScreenConnectDate:](self, "_setLastScreenConnectDate:", 0);
  v5 = -[PHAirPlayScreenController _lastScreenRequestOrigin](self, "_lastScreenRequestOrigin");
  v6 = objc_alloc(MEMORY[0x1E0CB3940]);
  if (v5 > 2)
    v7 = CFSTR("Unknown");
  else
    v7 = off_1E589AAE0[v5];
  v8 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("com.apple.photos.CPAnalytics.airPlayedFrom%@"), v7);
  v9 = (void *)MEMORY[0x1E0D09910];
  v10 = -[PHAirPlayScreenController airPlaySessionSignpost](self, "airPlaySessionSignpost");
  v11 = *MEMORY[0x1E0D09708];
  v13 = *MEMORY[0x1E0D09850];
  v14[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "endSignpost:forEventName:withPayload:", v10, v11, v12);

  -[PHAirPlayScreenController setAirPlaySessionSignpost:](self, "setAirPlaySessionSignpost:", 0);
}

- (void)_outputDeviceDidChange:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLAirPlayGetLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[PHAirPlayScreenController outputContext](self, "outputContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "outputDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v10 = v6;
    _os_log_impl(&dword_1AAB61000, v4, OS_LOG_TYPE_DEFAULT, "AVOutputDevice did change: %@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__PHAirPlayScreenController__outputDeviceDidChange___block_invoke;
  block[3] = &unk_1E58AB2F8;
  objc_copyWeak(&v8, (id *)buf);
  dispatch_async(MEMORY[0x1E0C80D38], block);
  objc_destroyWeak(&v8);
  objc_destroyWeak((id *)buf);
}

- (void)_sceneWillDeactivate:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]))
  {
    v6 = -[PHAirPlayScreenController _shouldUpdateSecondDisplayModeWithCurrentContent](self, "_shouldUpdateSecondDisplayModeWithCurrentContent");

    if (v6)
      -[PHAirPlayScreenController _switchModeForHighResolutionContent:completionHandler:](self, "_switchModeForHighResolutionContent:completionHandler:", 0, 0);
  }
  else
  {

  }
}

- (void)_sceneDidActivate:(id)a3
{
  void *v4;
  void *v5;
  _BOOL4 v6;
  id v7;

  objc_msgSend(a3, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "role");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "isEqualToString:", *MEMORY[0x1E0DC5650]))
  {

    goto LABEL_5;
  }
  v6 = -[PHAirPlayScreenController _shouldUpdateSecondDisplayModeWithCurrentContent](self, "_shouldUpdateSecondDisplayModeWithCurrentContent");

  if (v6)
  {
    -[PHAirPlayScreenController _currentContent](self, "_currentContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHAirPlayScreenController _switchModeForHighResolutionContent:completionHandler:](self, "_switchModeForHighResolutionContent:completionHandler:", v4 != 0, 0);
LABEL_5:

  }
}

- (id)_screenAvailabilityName
{
  unint64_t v2;

  v2 = -[PHAirPlayScreenController screenAvailability](self, "screenAvailability");
  if (v2 > 2)
    return 0;
  else
    return off_1E589AAF8[v2];
}

- (NSString)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;
  const __CFString *v26;
  void *v27;
  const __CFString *v28;
  void *v29;
  void *v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB37A0];
  -[PHAirPlayScreenController description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAirPlayScreenController _screenAvailabilityName](self, "_screenAvailabilityName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tScreen availability: %@"), v6);

  v7 = -[PHAirPlayScreenController isDisplayingContent](self, "isDisplayingContent");
  v8 = CFSTR("NO");
  if (v7)
    v8 = CFSTR("YES");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tDisplaying content: %@"), v8);
  -[PHAirPlayScreenController _currentScreen](self, "_currentScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _screenDetector](self, "_screenDetector");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableScreens");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHAirPlayScreenController _rootViewController](self, "_rootViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _currentContent](self, "_currentContent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHAirPlayScreenController _contentRegistry](self, "_contentRegistry");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "currentContentProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUAirPlaySettings sharedInstance](PUAirPlaySettings, "sharedInstance");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", CFSTR("\n\nScreens"));
  objc_msgSend(v9, "debugDescription");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\nCurrent screen: %@"), v15);

  objc_msgSend(v5, "appendFormat:", CFSTR("\nOther screens:"));
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  v16 = v11;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v16);
        if (*(void **)(*((_QWORD *)&v33 + 1) + 8 * i) != v9)
          objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * i));
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    }
    while (v18);
  }

  objc_msgSend(v5, "appendString:", CFSTR("\n\nRoot view controller"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tSystem: %@"), v12);
  objc_msgSend(v9, "rootViewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tScreen root: %@"), v21);

  objc_msgSend(v9, "rootViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 == v22)
    v23 = CFSTR("YES");
  else
    v23 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tScreen and system roots match: %@"), v23);

  objc_msgSend(v5, "appendString:", CFSTR("\n\nContent"));
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tCached: %@"), v13);
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tProvider: %@"), v32);
  objc_msgSend(v12, "childViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tRoot content: %@"), v24);

  objc_msgSend(v12, "childViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v25)
    v26 = CFSTR("YES");
  else
    v26 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tCached and root contents match: %@"), v26);

  objc_msgSend(v32, "contentViewControllerForAirPlayController:", self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13 == v27)
    v28 = CFSTR("YES");
  else
    v28 = CFSTR("NO");
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\tCached and provider contents match: %@"), v28);

  objc_msgSend(v31, "debugDescription");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendFormat:", CFSTR("\n\nSettings: %@"), v29);

  return (NSString *)v5;
}

- (PUAirPlayScreen)_currentScreen
{
  return self->__currentScreen;
}

- (void)_setCurrentScreen:(id)a3
{
  objc_storeStrong((id *)&self->__currentScreen, a3);
}

- (PUAirPlayScreenDetector)_screenDetector
{
  return self->__screenDetector;
}

- (void)_setScreenDetector:(id)a3
{
  objc_storeStrong((id *)&self->__screenDetector, a3);
}

- (PUAirPlayRootViewController)_rootViewController
{
  return self->__rootViewController;
}

- (void)_setRootViewController:(id)a3
{
  objc_storeStrong((id *)&self->__rootViewController, a3);
}

- (PUAirPlayContentRegistry)_contentRegistry
{
  return self->__contentRegistry;
}

- (void)_setContentRegistry:(id)a3
{
  objc_storeStrong((id *)&self->__contentRegistry, a3);
}

- (PUAirPlayRouteObserverRegistry)_routeObserverRegistry
{
  return self->__routeObserverRegistry;
}

- (void)_setRouteObserverRegistry:(id)a3
{
  objc_storeStrong((id *)&self->__routeObserverRegistry, a3);
}

- (UIViewController)_lastDisplayedContent
{
  return self->__lastDisplayedContent;
}

- (void)_setLastDisplayedContent:(id)a3
{
  objc_storeStrong((id *)&self->__lastDisplayedContent, a3);
}

- (NSDate)_lastScreenConnectDate
{
  return self->__lastScreenConnectDate;
}

- (void)_setLastScreenConnectDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastScreenConnectDate, a3);
}

- (NSDate)_lastScreenRequestDate
{
  return self->__lastScreenRequestDate;
}

- (void)_setLastScreenRequestDate:(id)a3
{
  objc_storeStrong((id *)&self->__lastScreenRequestDate, a3);
}

- (int64_t)_lastScreenRequestOrigin
{
  return self->__lastScreenRequestOrigin;
}

- (void)_setLastScreenRequestOrigin:(int64_t)a3
{
  self->__lastScreenRequestOrigin = a3;
}

- (int64_t)airPlaySessionSignpost
{
  return self->_airPlaySessionSignpost;
}

- (void)setAirPlaySessionSignpost:(int64_t)a3
{
  self->_airPlaySessionSignpost = a3;
}

- (id)secondDisplayModeToken
{
  return self->_secondDisplayModeToken;
}

- (void)setSecondDisplayModeToken:(id)a3
{
  objc_storeStrong(&self->_secondDisplayModeToken, a3);
}

- (AVOutputContext)outputContext
{
  return self->_outputContext;
}

- (void)setOutputContext:(id)a3
{
  objc_storeStrong((id *)&self->_outputContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outputContext, 0);
  objc_storeStrong(&self->_secondDisplayModeToken, 0);
  objc_storeStrong((id *)&self->__lastScreenRequestDate, 0);
  objc_storeStrong((id *)&self->__lastScreenConnectDate, 0);
  objc_storeStrong((id *)&self->__lastDisplayedContent, 0);
  objc_storeStrong((id *)&self->__routeObserverRegistry, 0);
  objc_storeStrong((id *)&self->__contentRegistry, 0);
  objc_storeStrong((id *)&self->__rootViewController, 0);
  objc_storeStrong((id *)&self->__screenDetector, 0);
  objc_storeStrong((id *)&self->__currentScreen, 0);
}

void __52__PHAirPlayScreenController__outputDeviceDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_updateSecondDisplayModeWithCurrentContent");

}

void __83__PHAirPlayScreenController__switchModeForHighResolutionContent_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  NSObject *v10;
  void *v11;
  int v12;
  id v13;
  __int16 v14;
  id v15;
  __int16 v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLAirPlayGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(a1 + 32);
    v12 = 138412802;
    v13 = v8;
    v14 = 2112;
    v15 = v5;
    v16 = 2112;
    v17 = v6;
    _os_log_impl(&dword_1AAB61000, v7, OS_LOG_TYPE_DEFAULT, "Switched AirPlay mode to %@ with token %@, error %@", (uint8_t *)&v12, 0x20u);
  }

  if (v5 && *(_BYTE *)(a1 + 56))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "setSecondDisplayModeToken:", v5);

    PLAirPlayGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 138412290;
      v13 = v5;
      _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Storing second display mode token %@", (uint8_t *)&v12, 0xCu);
    }

  }
  v11 = *(void **)(a1 + 40);
  if (v11)
    dispatch_async(MEMORY[0x1E0C80D38], v11);

}

void __71__PHAirPlayScreenController__updateSecondDisplayModeWithCurrentContent__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_handleSettingHighResolutionContent:forRootController:content:", *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

+ (PHAirPlayScreenController)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_514);
  return (PHAirPlayScreenController *)(id)sharedInstance_sharedController;
}

+ (__CFString)_keyForScreenRequestOrigin:(int64_t)a3
{
  __CFString **v3;

  switch(a3)
  {
    case 2:
      v3 = (__CFString **)MEMORY[0x1E0D72598];
      return *v3;
    case 1:
      v3 = (__CFString **)MEMORY[0x1E0D72590];
      return *v3;
    case 0:
      v3 = (__CFString **)MEMORY[0x1E0D725A0];
      return *v3;
  }
  return 0;
}

void __43__PHAirPlayScreenController_sharedInstance__block_invoke()
{
  PHAirPlayScreenController *v0;
  void *v1;

  v0 = objc_alloc_init(PHAirPlayScreenController);
  v1 = (void *)sharedInstance_sharedController;
  sharedInstance_sharedController = (uint64_t)v0;

}

- (BOOL)pu_hasAvailableRoute
{
  return -[PHAirPlayScreenController routeAvailability](self, "routeAvailability") == 1;
}

@end
