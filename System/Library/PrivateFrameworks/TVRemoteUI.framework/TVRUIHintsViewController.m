@implementation TVRUIHintsViewController

- (TVRUIHintsViewController)init
{
  TVRUIHintsViewController *v2;
  TVRUIHintsViewController *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  TVRUIHintsStyleProvider *styleProvider;
  NSObject *v8;
  TVRUIHintsStyleProvider *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  TVRUIHintsStyleProvider *v13;
  objc_super v15;
  uint8_t buf[4];
  TVRUIHintsStyleProvider *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)TVRUIHintsViewController;
  v2 = -[TVRUIHintsViewController init](&v15, sel_init);
  v3 = v2;
  if (v2)
  {
    v4 = 1;
    v2->_allowSiriHint = 1;
    v2->_allowVolumeHint = 1;
    v2->_allowTips = 1;
    +[TVRUIDeviceInfo currentDeviceInfo](TVRUIDeviceInfo, "currentDeviceInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isPad"))
      v4 = -[TVRUIHintsViewController currentInterfaceOrientation](v3, "currentInterfaceOrientation");
    +[TVRUIHintsStyle styleProviderForUserInterfaceIdiom:hasHomeButton:](TVRUIHintsStyle, "styleProviderForUserInterfaceIdiom:hasHomeButton:", objc_msgSend(v5, "isPad"), objc_msgSend(v5, "hasHomeButton"));
    v6 = objc_claimAutoreleasedReturnValue();
    styleProvider = v3->_styleProvider;
    v3->_styleProvider = (TVRUIHintsStyleProvider *)v6;

    _TVRUIHintsLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = v3->_styleProvider;
      *(_DWORD *)buf = 138412290;
      v17 = v9;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Style provider: %@", buf, 0xCu);
    }

    objc_msgSend(v5, "hardwareInfoForOrientation:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsViewController setHardwareInfo:](v3, "setHardwareInfo:", v10);

    _TVRUIHintsLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIHintsViewController hardwareInfo](v3, "hardwareInfo");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "description");
      v13 = (TVRUIHintsStyleProvider *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v17 = v13;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Current hardwareInfo for device: %@", buf, 0xCu);

    }
    -[TVRUIHintsViewController setLastAnimatedTimeInterval:](v3, "setLastAnimatedTimeInterval:", 0.0);

  }
  return v3;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[TVRUIHintsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[TVRUIHintsViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[TVRUIHintsViewController _applyTransformForOrientation:](self, "_applyTransformForOrientation:", -[TVRUIHintsViewController currentInterfaceOrientation](self, "currentInterfaceOrientation"));
  -[TVRUIHintsViewController _setupDebugUIIfEnabled](self, "_setupDebugUIIfEnabled");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__largeTextEnabledStatusChanged_, *MEMORY[0x24BEBE088], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__siriActivated_, CFSTR("TVRUISiriManagerSiriActivated"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__siriDeactivated_, CFSTR("TVRUISiriManagerSiriDeactivated"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__volumeUpButtonPressed_, CFSTR("TVRUIVolumeUpEventGenerated"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__volumeDownButtonPressed_, CFSTR("TVRUIVolumeDownEventGenerated"), 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TVRUIHintsViewController _applyTransformForOrientation:](self, "_applyTransformForOrientation:", -[TVRUIHintsViewController currentInterfaceOrientation](self, "currentInterfaceOrientation"));
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  if (+[TVRUIFeatures persistHintsUIEnabled](TVRUIFeatures, "persistHintsUIEnabled"))
    -[TVRUIHintsViewController requestHintsForSiri:volume:](self, "requestHintsForSiri:volume:", 1, 1);
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  -[TVRUIHintsViewController dismissHints](self, "dismissHints");
  -[TVRUIHintsViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 0, 0);
  -[TVRUIHintsViewController _applyTransformForOrientation:](self, "_applyTransformForOrientation:", -[TVRUIHintsViewController currentInterfaceOrientation](self, "currentInterfaceOrientation"));
}

- (void)dealloc
{
  objc_super v3;

  -[TVRUIHintsViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 0, 0);
  v3.receiver = self;
  v3.super_class = (Class)TVRUIHintsViewController;
  -[TVRUIHintsViewController dealloc](&v3, sel_dealloc);
}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volume:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  void *v15;
  __int16 v16;
  _BOOL4 v17;
  __int16 v18;
  _BOOL4 v19;
  uint64_t v20;

  v5 = a5;
  v6 = a4;
  v20 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[TVRUIHintsViewController setSupportsSiri:](self, "setSupportsSiri:", v6);
  -[TVRUIHintsViewController setSupportsVolume:](self, "setSupportsVolume:", v5);
  objc_msgSend(v8, "name");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIHintsViewController lastSeenDeviceName](self, "lastSeenDeviceName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", v9);

  if (v11)
  {
    _TVRUIHintsLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "Hints have already been displayed for this device, no hints will be shown again until the next session", (uint8_t *)&v14, 2u);
    }

  }
  else
  {
    -[TVRUIHintsViewController setLastSeenDeviceName:](self, "setLastSeenDeviceName:", v9);
    _TVRUIHintsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138412802;
      v15 = v9;
      v16 = 1024;
      v17 = v6;
      v18 = 1024;
      v19 = v5;
      _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewControllerDelegate callback deviceName='%@', supportsSiri=%{BOOL}d, supportsVolume=%{BOOL}d", (uint8_t *)&v14, 0x18u);
    }

    -[TVRUIHintsViewController _setupTipsControllerIfNeeded](self, "_setupTipsControllerIfNeeded");
    -[TVRUIHintsViewController requestHintsForSiri:volume:](self, "requestHintsForSiri:volume:", v6, v5);
  }

}

- (void)device:(id)a3 supportsVolume:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  NSObject *v15;
  void *v16;
  int v17;
  double v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v4 = a4;
  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  -[TVRUIHintsViewController setSupportsVolume:](self, "setSupportsVolume:", v4);
  v7 = CACurrentMediaTime();
  -[TVRUIHintsViewController lastAnimatedTimeInterval](self, "lastAnimatedTimeInterval");
  v8 = 0.0;
  if (v9 > 0.0)
  {
    -[TVRUIHintsViewController lastAnimatedTimeInterval](self, "lastAnimatedTimeInterval");
    v8 = v7 - v10;
  }
  _TVRUIHintsLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 134217984;
    v18 = v8;
    _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Elapsed time: %f", (uint8_t *)&v17, 0xCu);
  }

  if (v4)
  {
    -[TVRUIHintsViewController lastSeenDeviceName](self, "lastSeenDeviceName");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      if (v8 > 1.0)
      {
        _TVRUIHintsLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v6, "name");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = 138412546;
          v18 = *(double *)&v16;
          v19 = 1024;
          v20 = 1;
          _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewControllerDelegate callback deviceName='%@', supportsVolume=%{BOOL}d", (uint8_t *)&v17, 0x12u);

        }
        -[TVRUIHintsViewController requestHintsForSiri:volume:](self, "requestHintsForSiri:volume:", 0, 1);
      }
    }
  }

}

- (void)devicePickerWillExpand
{
  -[TVRUIHintsViewController _dismissHintsWithCompletion:](self, "_dismissHintsWithCompletion:", 0);
}

- (void)requestHintsForSiri:(BOOL)a3 volume:(BOOL)a4
{
  void *v7;
  double v8;
  dispatch_time_t v9;
  _QWORD v10[5];
  BOOL v11;
  BOOL v12;

  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "animationPresentationDelay");
  v9 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke;
  v10[3] = &unk_24DE2CE30;
  v10[4] = self;
  v11 = a3;
  v12 = a4;
  dispatch_after(v9, MEMORY[0x24BDAC9B8], v10);

}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke(uint64_t a1)
{
  int v2;
  int v3;
  NSObject *v4;
  int v5;
  int v6;
  void *v7;
  NSObject *v8;
  int v9;
  int v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  NSObject *v41;
  _QWORD v42[4];
  id v43;
  _QWORD v44[4];
  id v45;
  char v46;
  char v47;
  id buf;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  uint64_t v53;

  v53 = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend(*(id *)(a1 + 32), "_shouldAllowHintsToPresent"))
    return;
  if (*(_BYTE *)(a1 + 40))
    v2 = objc_msgSend(*(id *)(a1 + 32), "_siriHintEnabled");
  else
    v2 = 0;
  if (*(_BYTE *)(a1 + 41))
  {
    v3 = objc_msgSend(*(id *)(a1 + 32), "_volumeHintEnabled");
    if ((v2 & 1) != 0)
      goto LABEL_12;
LABEL_9:
    _TVRUIHintsLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *(unsigned __int8 *)(a1 + 40);
      v6 = objc_msgSend(*(id *)(a1 + 32), "allowSiriHint");
      objc_msgSend(*(id *)(a1 + 32), "styleProvider");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 67109632;
      HIDWORD(buf) = v5;
      v49 = 1024;
      v50 = v6;
      v51 = 1024;
      v52 = objc_msgSend(v7, "shouldShowSiriHint");
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Siri button hint not enabled, showSiri=%{BOOL}d, allowSiriHint=%{BOOL}d, shouldShowSiriHint=%{BOOL}d", (uint8_t *)&buf, 0x14u);

    }
    goto LABEL_12;
  }
  v3 = 0;
  if ((v2 & 1) == 0)
    goto LABEL_9;
LABEL_12:
  if ((v3 & 1) != 0)
    goto LABEL_16;
  _TVRUIHintsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = *(unsigned __int8 *)(a1 + 41);
    v10 = objc_msgSend(*(id *)(a1 + 32), "allowVolumeHint");
    objc_msgSend(*(id *)(a1 + 32), "styleProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "shouldShowVolumeHint");
    LODWORD(buf) = 67109632;
    HIDWORD(buf) = v9;
    v49 = 1024;
    v50 = v10;
    v51 = 1024;
    v52 = v12;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Volume button hint not enabled, showVolumeHint=%{BOOL}d, allowVolumeHint=%{BOOL}d, shouldShowVolumeHint=%{BOOL}d", (uint8_t *)&buf, 0x14u);

  }
  if ((v2 & 1) != 0)
  {
LABEL_16:
    objc_msgSend(*(id *)(a1 + 32), "_updateUserIntentButtonHintFrameForPresentation:", 0);
    objc_msgSend(*(id *)(a1 + 32), "_updateVolumeButtonsHintFrameWithPresentation:", 0);
    _TVRUIHintsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 67109376;
      HIDWORD(buf) = v2;
      v49 = 1024;
      v50 = v3;
      _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Animating hints siri=%{BOOL}d, volume=%{BOOL}d", (uint8_t *)&buf, 0xEu);
    }

    +[TVRUICubicSpringAnimator standardSpringAnimator](TVRUICubicSpringAnimator, "standardSpringAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setPresentationAnimator:", v14);

    objc_msgSend(*(id *)(a1 + 32), "userIntentButtonHint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "userIntentButtonHint");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "_frameForUserIntentButtonPresented:", 0);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 32), "userIntentButtonHint");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setFrame:", v18, v20, v22, v24);

    objc_msgSend(*(id *)(a1 + 32), "volumeButtonsHint");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setHidden:", 0);

    objc_msgSend(*(id *)(a1 + 32), "volumeButtonsHint");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setAlpha:", 0.0);

    objc_msgSend(*(id *)(a1 + 32), "_frameForVolumeButtonsPresented:", 0);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    objc_msgSend(*(id *)(a1 + 32), "volumeButtonsHint");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setFrame:", v29, v31, v33, v35);

    objc_initWeak(&buf, *(id *)(a1 + 32));
    objc_msgSend(*(id *)(a1 + 32), "presentationAnimator");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v38 = MEMORY[0x24BDAC760];
    v44[0] = MEMORY[0x24BDAC760];
    v44[1] = 3221225472;
    v44[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_25;
    v44[3] = &unk_24DE2CDE0;
    objc_copyWeak(&v45, &buf);
    v46 = v3;
    v47 = v2;
    objc_msgSend(v37, "addAnimations:", v44);

    objc_msgSend(*(id *)(a1 + 32), "presentationAnimator");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = v38;
    v42[1] = 3221225472;
    v42[2] = __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_2;
    v42[3] = &unk_24DE2CE08;
    objc_copyWeak(&v43, &buf);
    objc_msgSend(v39, "addCompletion:", v42);

    objc_msgSend(*(id *)(a1 + 32), "presentationAnimator");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "startAnimation");

    objc_msgSend(*(id *)(a1 + 32), "setLastAnimatedTimeInterval:", CACurrentMediaTime());
    objc_destroyWeak(&v43);
    objc_destroyWeak(&v45);
    objc_destroyWeak(&buf);
  }
  else
  {
    _TVRUIHintsLog();
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_21B042000, v41, OS_LOG_TYPE_DEFAULT, "Siri and Volume are not supported so don't show the hints", (uint8_t *)&buf, 2u);
    }

  }
}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_25(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  id v23;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v23 = WeakRetained;
    if (*(_BYTE *)(a1 + 40))
    {
      objc_msgSend(WeakRetained, "volumeButtonsHint");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setAlpha:", 1.0);

      objc_msgSend(v23, "_frameForVolumeButtonsPresented:", 1);
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      objc_msgSend(v23, "volumeButtonsHint");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

      WeakRetained = v23;
    }
    if (*(_BYTE *)(a1 + 41))
    {
      objc_msgSend(v23, "userIntentButtonHint");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setAlpha:", 1.0);

      objc_msgSend(v23, "_frameForUserIntentButtonPresented:", 1);
      v15 = v14;
      v17 = v16;
      v19 = v18;
      v21 = v20;
      objc_msgSend(v23, "userIntentButtonHint");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

      WeakRetained = v23;
    }
  }

}

void __55__TVRUIHintsViewController_requestHintsForSiri_volume___block_invoke_2(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v4;
  id v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v5 = WeakRetained;
    if (a2)
    {
      objc_msgSend(WeakRetained, "_cleanupHints");
    }
    else
    {
      objc_msgSend(WeakRetained, "styleProvider");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "animationDuration");
      objc_msgSend(v5, "performSelector:withObject:afterDelay:", sel__dismissHintsWithCompletion_, 0);

    }
    WeakRetained = v5;
  }

}

- (void)dismissHints
{
  NSObject *v3;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  _TVRUIHintsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = 136315138;
    v5 = "-[TVRUIHintsViewController dismissHints]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v4, 0xCu);
  }

  -[TVRUIHintsViewController _dismissHintsWithCompletion:](self, "_dismissHintsWithCompletion:", 0);
}

- (void)remoteWillBeDismissed
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_debug_impl(&dword_21B042000, v0, OS_LOG_TYPE_DEBUG, "Invalidating Siri tip", v1, 2u);
  OUTLINED_FUNCTION_1_1();
}

- (void)replayHints
{
  -[TVRUIHintsViewController requestHintsForSiri:volume:](self, "requestHintsForSiri:volume:", -[TVRUIHintsViewController supportsSiri](self, "supportsSiri"), -[TVRUIHintsViewController supportsVolume](self, "supportsVolume"));
}

- (void)_updateUserIntentButtonHintFrameForPresentation:(unint64_t)a3
{
  void *v5;
  id v6;

  -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPresentation:", a3);

  }
  else
  {
    -[TVRUIHintsViewController _setupUserIntentButtonHintWithPresentation:](self, "_setupUserIntentButtonHintWithPresentation:", a3);
  }
}

- (void)_setupUserIntentButtonHintWithPresentation:(unint64_t)a3
{
  void *v5;
  NSObject *v6;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  NSObject *v16;
  TVRUIHintsUserIntentButtonView *v17;
  void *v18;
  void *v19;
  TVRUIHintsUserIntentButtonView *v20;
  void *v21;
  void *v22;
  void *v23;
  _OWORD v24[6];
  uint8_t buf[16];
  CGRect v26;

  -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _TVRUIHintsLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Setting up UserIntent button hint", buf, 2u);
    }

    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userIntentButtonRect");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;

    v26.origin.x = v9;
    v26.origin.y = v11;
    v26.size.width = v13;
    v26.size.height = v15;
    if (CGRectEqualToRect(v26, *MEMORY[0x24BDBF090]))
    {
      _TVRUIHintsLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "userIntentButtonRect is CGRectZero", buf, 2u);
      }
    }
    else
    {
      v17 = [TVRUIHintsUserIntentButtonView alloc];
      -[TVRUIHintsViewController styleProvider](self, "styleProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[TVRUIHintsUserIntentButtonView initWithPresentation:styleProvider:buttonEdge:](v17, "initWithPresentation:styleProvider:buttonEdge:", a3, v18, objc_msgSend(v19, "userIntentButtonEdge"));
      -[TVRUIHintsViewController setUserIntentButtonHint:](self, "setUserIntentButtonHint:", v20);

      -[TVRUIHintsViewController _gylphTransformForOrientation:](self, "_gylphTransformForOrientation:", -[TVRUIHintsViewController currentInterfaceOrientation](self, "currentInterfaceOrientation"));
      -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "glyphView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v24[0] = v24[3];
      v24[1] = v24[4];
      v24[2] = v24[5];
      objc_msgSend(v22, "setTransform:", v24);

      -[TVRUIHintsViewController view](self, "view");
      v16 = objc_claimAutoreleasedReturnValue();
      -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject addSubview:](v16, "addSubview:", v23);

    }
  }
}

- (void)_updateVolumeButtonsHintFrameWithPresentation:(unint64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  double MinY;
  void *v11;
  double v12;
  NSObject *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  _DWORD v21[2];
  uint64_t v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  v22 = *MEMORY[0x24BDAC8D0];
  -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPresentation:", a3);

  }
  else
  {
    -[TVRUIHintsViewController _setupVolumeButtonsHintWithPresentation:](self, "_setupVolumeButtonsHintWithPresentation:", a3);
  }
  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "volumeButtonsEdge");

  if (v8 == 1)
  {
    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "volumeUpButtonRect");
    MinY = CGRectGetMinY(v25);
    v12 = 0.0;
  }
  else if (v8 == 2)
  {
    -[TVRUIHintsViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    MinY = CGRectGetWidth(v23);

    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "volumeUpButtonRect");
    v12 = CGRectGetMinY(v24);
  }
  else
  {
    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "volumeUpButtonRect");
    v12 = CGRectGetMinY(v26);
    MinY = 0.0;
  }

  _TVRUIHintsLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v21[0] = 67109120;
    v21[1] = v8;
    _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Volume button hints presenting edge: %u", (uint8_t *)v21, 8u);
  }

  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "volumeHintContainerWidth");
  v16 = v15;

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "totalHeight");
  v19 = v18;
  -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setFrame:", MinY, v12, v16, v19);

}

- (void)_setupVolumeButtonsHintWithPresentation:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  double Height;
  void *v10;
  uint64_t v11;
  TVRUIHintsVolumeButtonsView *v12;
  void *v13;
  TVRUIHintsVolumeButtonsView *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _OWORD v19[6];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;
  CGRect v25;

  v24 = *MEMORY[0x24BDAC8D0];
  _TVRUIHintsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[TVRUIHintsViewController _setupVolumeButtonsHintWithPresentation:]";
    v22 = 2048;
    v23 = a3;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s, presentation=%ld", buf, 0x16u);
  }

  -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    _TVRUIHintsLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Setting up volume buttons hint", buf, 2u);
    }

    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "volumeUpButtonRect");
    Height = CGRectGetHeight(v25);

    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "volumeButtonsEdge");

    v12 = [TVRUIHintsVolumeButtonsView alloc];
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[TVRUIHintsVolumeButtonsView initWithPresentation:styleProvider:buttonEdge:buttonHeight:](v12, "initWithPresentation:styleProvider:buttonEdge:buttonHeight:", a3, v13, v11, Height);
    -[TVRUIHintsViewController setVolumeButtonsHint:](self, "setVolumeButtonsHint:", v14);

    -[TVRUIHintsViewController _gylphTransformForOrientation:](self, "_gylphTransformForOrientation:", -[TVRUIHintsViewController currentInterfaceOrientation](self, "currentInterfaceOrientation"));
    -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "glyphView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v19[0] = v19[3];
    v19[1] = v19[4];
    v19[2] = v19[5];
    objc_msgSend(v16, "setTransform:", v19);

    -[TVRUIHintsViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

  }
}

- (void)_volumeUpButtonPressed:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRUIHintsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TVRUIHintsViewController _volumeUpButtonPressed:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[TVRUIHintsViewController _cleanupHints](self, "_cleanupHints");
  -[TVRUIHintsViewController _presentVolumeButtonPressWithPresentation:](self, "_presentVolumeButtonPressWithPresentation:", 1);
}

- (void)_volumeDownButtonPressed:(id)a3
{
  NSObject *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRUIHintsLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TVRUIHintsViewController _volumeDownButtonPressed:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[TVRUIHintsViewController _cleanupHints](self, "_cleanupHints");
  -[TVRUIHintsViewController _presentVolumeButtonPressWithPresentation:](self, "_presentVolumeButtonPressWithPresentation:", 2);
}

- (void)_presentVolumeButtonPressWithPresentation:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  SBSHardwareButtonHintViewContentVisibilityControlling *v13;
  SBSHardwareButtonHintViewContentVisibilityControlling *v14;
  NSObject *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  SBSHardwareButtonHintViewContentVisibilityControlling *v38;
  SBSHardwareButtonHintViewContentVisibilityControlling *v39;
  SBSHardwareButtonHintViewContentVisibilityControlling *volumeHintVisibilityController;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  void *v49;
  void *v50;
  dispatch_time_t v51;
  uint64_t v52;
  uint64_t v53;
  void (*v54)(uint64_t);
  void *v55;
  id v56[2];
  _QWORD v57[4];
  id v58;
  _QWORD v59[4];
  id v60;
  _QWORD v61[4];
  id v62;
  _QWORD block[4];
  id v64;
  uint8_t buf[4];
  const char *v66;
  __int16 v67;
  unint64_t v68;
  uint64_t v69;

  v69 = *MEMORY[0x24BDAC8D0];
  _TVRUIHintsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v66 = "-[TVRUIHintsViewController _presentVolumeButtonPressWithPresentation:]";
    v67 = 2048;
    v68 = a3;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s, presentation=%ld", buf, 0x16u);
  }

  -[TVRUIHintsViewController _cleanupHints](self, "_cleanupHints");
  if (-[TVRUIHintsViewController _shouldAllowHintsToPresent](self, "_shouldAllowHintsToPresent"))
  {
    -[TVRUIHintsViewController _updateVolumeButtonsHintFrameWithPresentation:](self, "_updateVolumeButtonsHintFrameWithPresentation:", a3);
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activationAnimationDismissalDelay");
    v8 = v7;

    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "supportsSBHints");

    if (!v10)
    {
      -[TVRUIHintsViewController styleProvider](self, "styleProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "activationAnimationDuration");
      v18 = v17;

      -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setHidden:", 0);

      -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "setAlpha:", 1.0);

      -[TVRUIHintsViewController _frameForVolumeButtonsPresented:](self, "_frameForVolumeButtonsPresented:", 0);
      v22 = v21;
      v24 = v23;
      v26 = v25;
      v28 = v27;
      -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "setFrame:", v22, v24, v26, v28);

      objc_initWeak((id *)buf, self);
      v30 = objc_alloc(MEMORY[0x24BEBDB20]);
      v31 = MEMORY[0x24BDAC760];
      v61[0] = MEMORY[0x24BDAC760];
      v61[1] = 3221225472;
      v61[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_2;
      v61[3] = &unk_24DE2C4F8;
      objc_copyWeak(&v62, (id *)buf);
      v32 = (void *)objc_msgSend(v30, "initWithDuration:curve:animations:", 2, v61, v18);
      -[TVRUIHintsViewController setPresentationAnimator:](self, "setPresentationAnimator:", v32);

      v33 = objc_alloc(MEMORY[0x24BEBDB20]);
      v59[0] = v31;
      v59[1] = 3221225472;
      v59[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_3;
      v59[3] = &unk_24DE2C4F8;
      objc_copyWeak(&v60, (id *)buf);
      v34 = (void *)objc_msgSend(v33, "initWithDuration:curve:animations:", 2, v59, v18);
      -[TVRUIHintsViewController setDismissalAnimator:](self, "setDismissalAnimator:", v34);

      -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v57[0] = v31;
      v57[1] = 3221225472;
      v57[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_4;
      v57[3] = &unk_24DE2CE08;
      objc_copyWeak(&v58, (id *)buf);
      objc_msgSend(v35, "addCompletion:", v57);

      -[TVRUIHintsViewController presentationAnimator](self, "presentationAnimator");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = v31;
      v53 = 3221225472;
      v54 = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_5;
      v55 = &unk_24DE2CE58;
      objc_copyWeak(v56, (id *)buf);
      v56[1] = v8;
      objc_msgSend(v36, "addCompletion:", &v52);

      -[TVRUIHintsViewController presentationAnimator](self, "presentationAnimator", v52, v53, v54, v55);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "startAnimation");

      objc_destroyWeak(v56);
      objc_destroyWeak(&v58);
      objc_destroyWeak(&v60);
      objc_destroyWeak(&v62);
      objc_destroyWeak((id *)buf);
      return;
    }
    if (a3)
    {
      if (a3 == 2)
      {
        -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "volumeDownButtonView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        SBSUIRegisterHardwareButtonHintView();
        v39 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
        volumeHintVisibilityController = self->_volumeHintVisibilityController;
        self->_volumeHintVisibilityController = v39;

      }
      else
      {
        if (a3 != 1)
        {
LABEL_16:
          -[TVRUIHintsViewController _frameForVolumeButtonsPresented:](self, "_frameForVolumeButtonsPresented:", 1);
          v42 = v41;
          v44 = v43;
          v46 = v45;
          v48 = v47;
          -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "setFrame:", v42, v44, v46, v48);

          -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "setHidden:", 0);

          -[SBSHardwareButtonHintViewContentVisibilityControlling setContentVisibility:animationSettings:](self->_volumeHintVisibilityController, "setContentVisibility:animationSettings:", 1, 0);
          objc_initWeak((id *)buf, self);
          v51 = dispatch_time(0, (uint64_t)(*(double *)&v8 * 1000000000.0));
          block[0] = MEMORY[0x24BDAC760];
          block[1] = 3221225472;
          block[2] = __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke;
          block[3] = &unk_24DE2C4F8;
          objc_copyWeak(&v64, (id *)buf);
          dispatch_after(v51, MEMORY[0x24BDAC9B8], block);
          objc_destroyWeak(&v64);
          objc_destroyWeak((id *)buf);
          return;
        }
        -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "volumeUpButtonView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        SBSUIRegisterHardwareButtonHintView();
        v13 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
        v14 = self->_volumeHintVisibilityController;
        self->_volumeHintVisibilityController = v13;

      }
    }
    else
    {
      -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SBSUIRegisterHardwareButtonHintView();
      v38 = (SBSHardwareButtonHintViewContentVisibilityControlling *)objc_claimAutoreleasedReturnValue();
      v12 = self->_volumeHintVisibilityController;
      self->_volumeHintVisibilityController = v38;
    }

    goto LABEL_16;
  }
  _TVRUIHintsLog();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "Not showing volume button activated hint because _shouldAllowHintsToPresent returned NO", buf, 2u);
  }

}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupHints");
    WeakRetained = v2;
  }

}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v11 = WeakRetained;
    objc_msgSend(WeakRetained, "_frameForVolumeButtonsPresented:", 1);
    v3 = v2;
    v5 = v4;
    v7 = v6;
    v9 = v8;
    objc_msgSend(v11, "volumeButtonsHint");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFrame:", v3, v5, v7, v9);

    WeakRetained = v11;
  }

}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "volumeButtonsHint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

    WeakRetained = v3;
  }

}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupHints");
    WeakRetained = v2;
  }

}

void __70__TVRUIHintsViewController__presentVolumeButtonPressWithPresentation___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v4 = WeakRetained;
    objc_msgSend(WeakRetained, "dismissalAnimator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startAnimationAfterDelay:", *(double *)(a1 + 40));

    WeakRetained = v4;
  }

}

- (void)_siriActivated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id *p_siriHintVisibilityController;
  id v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  uint8_t buf[4];
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIHintsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v17 = "-[TVRUIHintsViewController _siriActivated:]";
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (!-[TVRUIHintsViewController _shouldAllowHintsToPresent](self, "_shouldAllowHintsToPresent"))
  {
    _TVRUIHintsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Not showing user intent activated hint because _shouldAllowHintsToPresent returned NO", buf, 2u);
    }
    goto LABEL_9;
  }
  if (!-[TVRUIHintsViewController _siriHintEnabled](self, "_siriHintEnabled"))
  {
    _TVRUIHintsLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Not showing user intent activated hint because _siriHintEnabled returned NO", buf, 2u);
    }
LABEL_9:

    goto LABEL_14;
  }
  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsSBHints");

  if (v7)
  {
    -[TVRUIHintsViewController _updateUserIntentButtonHintFrameForPresentation:](self, "_updateUserIntentButtonHintFrameForPresentation:", 1);
    -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setHidden:", 0);

    -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    SBSUIRegisterHardwareButtonHintView();
    v10 = objc_claimAutoreleasedReturnValue();
    p_siriHintVisibilityController = (id *)&self->_siriHintVisibilityController;
    v12 = *p_siriHintVisibilityController;
    *p_siriHintVisibilityController = (id)v10;

    objc_msgSend(*p_siriHintVisibilityController, "setContentVisibility:animationSettings:", 1, 0);
  }
  else
  {
    objc_initWeak((id *)buf, self);
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __43__TVRUIHintsViewController__siriActivated___block_invoke;
    v14[3] = &unk_24DE2C4F8;
    objc_copyWeak(&v15, (id *)buf);
    -[TVRUIHintsViewController _dismissHintsWithCompletion:](self, "_dismissHintsWithCompletion:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak((id *)buf);
  }
LABEL_14:

}

void __43__TVRUIHintsViewController__siriActivated___block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  _QWORD v21[4];
  id v22;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_updateUserIntentButtonHintFrameForPresentation:", 1);
    objc_msgSend(v3, "styleProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "activationAnimationDuration");
    v6 = v5;

    objc_msgSend(v3, "userIntentButtonHint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHidden:", 0);

    objc_msgSend(v3, "userIntentButtonHint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", 1.0);

    objc_msgSend(v3, "_frameForUserIntentButtonPresented:", 0);
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(v3, "userIntentButtonHint");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setFrame:", v10, v12, v14, v16);

    v18 = objc_alloc(MEMORY[0x24BEBDB20]);
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __43__TVRUIHintsViewController__siriActivated___block_invoke_2;
    v21[3] = &unk_24DE2C4F8;
    objc_copyWeak(&v22, v1);
    v19 = (void *)objc_msgSend(v18, "initWithDuration:curve:animations:", 2, v21, v6);
    objc_msgSend(v3, "setPresentationAnimator:", v19);

    objc_msgSend(v3, "presentationAnimator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "startAnimation");

    objc_destroyWeak(&v22);
  }

}

void __43__TVRUIHintsViewController__siriActivated___block_invoke_2(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_frameForUserIntentButtonPresented:", 1);
  v2 = v1;
  v4 = v3;
  v6 = v5;
  v8 = v7;
  objc_msgSend(WeakRetained, "userIntentButtonHint");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v2, v4, v6, v8);

}

- (void)_siriDeactivated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint8_t buf[4];
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIHintsLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v24 = "-[TVRUIHintsViewController _siriDeactivated:]";
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "supportsSBHints");

  if (v7)
  {
    -[TVRUIHintsViewController _cleanupHints](self, "_cleanupHints");
  }
  else
  {
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activationAnimationDuration");
    v10 = v9;

    objc_initWeak((id *)buf, self);
    v11 = objc_alloc(MEMORY[0x24BEBDB20]);
    v12 = MEMORY[0x24BDAC760];
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __45__TVRUIHintsViewController__siriDeactivated___block_invoke;
    v21[3] = &unk_24DE2C4F8;
    objc_copyWeak(&v22, (id *)buf);
    v13 = (void *)objc_msgSend(v11, "initWithDuration:curve:animations:", 2, v21, v10);
    -[TVRUIHintsViewController setDismissalAnimator:](self, "setDismissalAnimator:", v13);

    -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v12;
    v17 = 3221225472;
    v18 = __45__TVRUIHintsViewController__siriDeactivated___block_invoke_2;
    v19 = &unk_24DE2CE08;
    objc_copyWeak(&v20, (id *)buf);
    objc_msgSend(v14, "addCompletion:", &v16);

    -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator", v16, v17, v18, v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAnimation");

    objc_destroyWeak(&v20);
    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)buf);
  }

}

void __45__TVRUIHintsViewController__siriDeactivated___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "userIntentButtonHint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

    WeakRetained = v3;
  }

}

void __45__TVRUIHintsViewController__siriDeactivated___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupHints");
    WeakRetained = v2;
  }

}

- (void)_largeTextEnabledStatusChanged:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  -[TVRUIHintsViewController styleProvider](self, "styleProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "siriImage");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsViewController siriGlyphView](self, "siriGlyphView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "imageView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setImage:", v5);

  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "volumeImage");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIHintsViewController volumeGlyphView](self, "volumeGlyphView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "imageView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setImage:", v8);

}

- (void)_applyTransformForOrientation:(int64_t)a3
{
  void *v5;
  int v6;
  void *v7;
  double Width;
  void *v9;
  CGFloat Height;
  CGFloat v11;
  double v12;
  NSObject *v13;
  void *v14;
  void *v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  uint8_t buf[4];
  int64_t v19;
  __int16 v20;
  CGFloat v21;
  uint64_t v22;
  CGRect v23;
  CGRect v24;

  v22 = *MEMORY[0x24BDAC8D0];
  +[TVRUIDeviceInfo currentDeviceInfo](TVRUIDeviceInfo, "currentDeviceInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPad");

  if (!v6)
    return;
  -[TVRUIHintsViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  Width = CGRectGetWidth(v23);
  -[TVRUIHintsViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  Height = CGRectGetHeight(v24);

  if (a3 == 2)
  {
    v11 = 3.14159265;
LABEL_10:
    v12 = Height;
    goto LABEL_11;
  }
  if (a3 == 3)
  {
    v11 = -1.57079633;
    goto LABEL_8;
  }
  if (a3 != 4)
  {
    v11 = 0.0;
    goto LABEL_10;
  }
  v11 = 1.57079633;
LABEL_8:
  v12 = Width;
  Width = Height;
LABEL_11:
  _TVRUIHintsLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218240;
    v19 = a3;
    v20 = 2048;
    v21 = v11;
    _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Applying transform if needed for orientation=%ld, angle=%0.2frad", buf, 0x16u);
  }

  CGAffineTransformMakeRotation(&v17, v11);
  -[TVRUIHintsViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v17;
  objc_msgSend(v14, "setTransform:", &v16);

  -[TVRUIHintsViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBounds:", 0.0, 0.0, Width, v12);

}

- (CGAffineTransform)_gylphTransformForOrientation:(SEL)a3
{
  CGFloat v4;

  v4 = 0.0;
  if ((unint64_t)(a4 - 2) <= 2)
    v4 = dbl_21B0F7A80[a4 - 2];
  return CGAffineTransformMakeRotation(retstr, v4);
}

- (void)_dismissHintsWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  void (**v17)(_QWORD);
  id v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  v5 = +[TVRUIFeatures persistHintsUIEnabled](TVRUIFeatures, "persistHintsUIEnabled");
  _TVRUIHintsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[TVRUIHintsViewController _dismissHintsWithCompletion:]";
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "%s, persistHintsUIEnabled is on so hints will not be dismissed", buf, 0xCu);
    }

    if (v4)
      v4[2](v4);
  }
  else
  {
    if (v7)
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[TVRUIHintsViewController _dismissHintsWithCompletion:]";
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dismissHintsWithCompletion_, 0);
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activationAnimationDuration");
    v10 = v9;

    objc_initWeak((id *)buf, self);
    v11 = objc_alloc(MEMORY[0x24BEBDB20]);
    v12 = MEMORY[0x24BDAC760];
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke;
    v19[3] = &unk_24DE2C4F8;
    objc_copyWeak(&v20, (id *)buf);
    v13 = (void *)objc_msgSend(v11, "initWithDuration:curve:animations:", 2, v19, v10);
    -[TVRUIHintsViewController setDismissalAnimator:](self, "setDismissalAnimator:", v13);

    -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v12;
    v16[1] = 3221225472;
    v16[2] = __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke_2;
    v16[3] = &unk_24DE2CE80;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v4;
    objc_msgSend(v14, "addCompletion:", v16);

    -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "startAnimation");

    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

void __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  id v22;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v22 = WeakRetained;
    objc_msgSend(WeakRetained, "volumeButtonsHint");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setAlpha:", 0.0);

    objc_msgSend(v22, "_frameForVolumeButtonsPresented:", 0);
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v22, "volumeButtonsHint");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

    objc_msgSend(v22, "userIntentButtonHint");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);

    objc_msgSend(v22, "_frameForUserIntentButtonPresented:", 0);
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    objc_msgSend(v22, "userIntentButtonHint");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    WeakRetained = v22;
  }

}

void __56__TVRUIHintsViewController__dismissHintsWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_cleanupHints");
    objc_msgSend(v9, "volumeButtonsHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setHidden:", 1);

    objc_msgSend(v9, "userIntentButtonHint");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", 1);

    objc_msgSend(v9, "volumeButtonsHint");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", 1.0);

    objc_msgSend(v9, "userIntentButtonHint");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAlpha:", 1.0);

    v3 = v9;
    v8 = *(_QWORD *)(a1 + 32);
    if (v8)
    {
      (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
      v3 = v9;
    }
  }

}

- (void)_cleanupHints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__dismissHintsWithCompletion_, 0);
  -[TVRUIHintsViewController presentationAnimator](self, "presentationAnimator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopAnimation:", 1);

  -[TVRUIHintsViewController dismissalAnimator](self, "dismissalAnimator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stopAnimation:", 1);

  -[TVRUIHintsViewController siriHintVisibilityController](self, "siriHintVisibilityController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[TVRUIHintsViewController setSiriHintVisibilityController:](self, "setSiriHintVisibilityController:", 0);
  -[TVRUIHintsViewController volumeHintVisibilityController](self, "volumeHintVisibilityController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  -[TVRUIHintsViewController setVolumeHintVisibilityController:](self, "setVolumeHintVisibilityController:", 0);
  -[TVRUIHintsViewController volumeButtonsHint](self, "volumeButtonsHint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[TVRUIHintsViewController userIntentButtonHint](self, "userIntentButtonHint");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setHidden:", 1);

}

- (int64_t)currentInterfaceOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[TVRUIHintsViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_windowInterfaceOrientation");

  return v4;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (CGRect)_frameForUserIntentButtonPresented:(BOOL)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double y;
  double x;
  CGFloat height;
  CGFloat width;
  void *v18;
  double v19;
  double v20;
  void *v21;
  int v22;
  NSObject *v23;
  double v24;
  CGFloat v25;
  void *v26;
  int v27;
  NSObject *v28;
  NSObject *v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  uint8_t buf[16];
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect result;
  CGRect v42;

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "userIntentButtonRect");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  x = *MEMORY[0x24BDBF090];
  y = *(double *)(MEMORY[0x24BDBF090] + 8);
  width = *(double *)(MEMORY[0x24BDBF090] + 16);
  height = *(double *)(MEMORY[0x24BDBF090] + 24);
  v38.origin.x = v7;
  v38.origin.y = v9;
  v38.size.width = v11;
  v38.size.height = v13;
  v42.origin.x = *(CGFloat *)MEMORY[0x24BDBF090];
  v42.origin.y = y;
  v42.size.width = width;
  v42.size.height = height;
  if (!CGRectEqualToRect(v38, v42))
  {
    v36 = x;
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "siriHintContainerWidth");
    v20 = v19;

    v34 = *MEMORY[0x24BDBF148];
    v35 = *(double *)(MEMORY[0x24BDBF148] + 8);
    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "userIntentButtonEdge");

    switch(v22)
    {
      case 0:
        _TVRUIHintsLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[TVRUIHintsViewController _frameForUserIntentButtonPresented:].cold.3();
        goto LABEL_7;
      case 1:
        v24 = -v20;
        v25 = 0.0;
        height = v20;
        width = v11;
        y = -v20;
        x = v7;
        goto LABEL_17;
      case 2:
        v24 = 0.0;
        v25 = v20;
        height = v13;
        width = v20;
        x = v7 - v20;
        y = v9;
        goto LABEL_17;
      case 3:
        +[TVRUIDeviceInfo currentDeviceInfo](TVRUIDeviceInfo, "currentDeviceInfo");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "hasHomeButton");

        _TVRUIHintsLog();
        v28 = objc_claimAutoreleasedReturnValue();
        v29 = v28;
        if (v27)
        {
          x = v36;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_DEFAULT, "Device has a home button. Skip showing the Siri hint", buf, 2u);
          }
        }
        else
        {
          x = v36;
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
            -[TVRUIHintsViewController _frameForUserIntentButtonPresented:].cold.2();
        }

        goto LABEL_16;
      default:
        _TVRUIHintsLog();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
          -[TVRUIHintsViewController _frameForUserIntentButtonPresented:].cold.1();
LABEL_7:

        x = v36;
LABEL_16:
        v25 = v34;
        v24 = v35;
LABEL_17:
        if (!a3)
        {
          v39.origin.x = x;
          v39.origin.y = y;
          v39.size.width = width;
          v39.size.height = height;
          v40 = CGRectOffset(v39, v25, v24);
          x = v40.origin.x;
          y = v40.origin.y;
          width = v40.size.width;
          height = v40.size.height;
        }
        break;
    }
  }
  v30 = x;
  v31 = y;
  v32 = width;
  v33 = height;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)_frameForVolumeButtonsPresented:(BOOL)a3
{
  void *v5;
  double v6;
  double width;
  void *v8;
  CGFloat MinY;
  void *v10;
  double v11;
  CGFloat height;
  void *v13;
  int v14;
  void *v15;
  CGFloat MinX;
  double v17;
  double v18;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect result;

  -[TVRUIHintsViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "volumeHintContainerWidth");
  width = v6;

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "volumeUpButtonRect");
  MinY = CGRectGetMinY(v27);

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "totalHeight");
  height = v11;

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "volumeButtonsEdge");

  if (v14 == 1)
  {
    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "volumeUpButtonRect");
    MinX = CGRectGetMinX(v29);

    -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "totalHeight");
    v22 = v21;

    v17 = -width;
    v18 = 0.0;
    height = 0.0;
    width = v22;
    MinY = 0.0;
    if (a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  if (v14 == 2)
  {
    -[TVRUIHintsViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    MinX = CGRectGetWidth(v28);

    v17 = 0.0;
    v18 = width;
    if (a3)
      goto LABEL_9;
    goto LABEL_8;
  }
  v18 = -width;
  v17 = 0.0;
  MinX = 0.0;
  if (!a3)
  {
LABEL_8:
    v30.origin.x = MinX;
    v30.origin.y = MinY;
    v30.size.width = width;
    v30.size.height = height;
    v31 = CGRectOffset(v30, v18, v17);
    MinX = v31.origin.x;
    MinY = v31.origin.y;
    width = v31.size.width;
    height = v31.size.height;
  }
LABEL_9:
  v23 = MinX;
  v24 = MinY;
  v25 = width;
  v26 = height;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v24;
  result.origin.x = v23;
  return result;
}

- (void)_setupDebugUIIfEnabled
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double Width;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  double Height;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  TVRUIHintsViewController *v28;
  uint64_t v29;
  uint8_t buf[8];
  _QWORD v31[3];
  CGRect v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;

  v31[2] = *MEMORY[0x24BDAC8D0];
  if (+[TVRUIFeatures isHintsDebugUIEnabled](TVRUIFeatures, "isHintsDebugUIEnabled"))
  {
    _TVRUIHintsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Hints Debug UI is enabled", buf, 2u);
    }

    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 0.5, 0.0, 0.25);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v4;
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 1.0, 1.0, 0.0, 0.25);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v5;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v31, 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUIHintsViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "bounds");
    v8 = (uint64_t)(CGRectGetHeight(v32) / 10.0);

    v9 = objc_msgSend(v6, "count");
    if (v8 >= 1)
    {
      v10 = v9;
      v11 = 0;
      v28 = self;
      v29 = v9;
      do
      {
        -[TVRUIHintsViewController view](self, "view");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bounds");
        Width = CGRectGetWidth(v33);

        v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, (double)(int)v11 * 10.0, Width, 10.0);
        objc_msgSend(v6, "objectAtIndexedSubscript:", v11 % v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "setBackgroundColor:", v15);

        -[TVRUIHintsViewController view](self, "view");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "addSubview:", v14);

        if ((v11 & 1) == 0)
        {
          objc_msgSend(v14, "bounds");
          v17 = CGRectGetWidth(v34) + -20.0;
          objc_msgSend(v14, "bounds");
          Height = CGRectGetHeight(v35);
          v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 10.0, 0.0, v17, Height);
          objc_msgSend(v19, "setAutoresizingMask:", 18);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.f"), (double)(int)v11 * 10.0);
          v20 = v8;
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setText:", v21);

          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setFont:", v22);

          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "setTextColor:", v23);

          objc_msgSend(v14, "addSubview:", v19);
          v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD708]), "initWithFrame:", 10.0, 0.0, v17, Height);
          objc_msgSend(v24, "setAutoresizingMask:", 18);
          objc_msgSend(v24, "setTextAlignment:", 2);
          objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%0.f"), (double)(int)v11 * 10.0);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setText:", v25);

          objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 10.0);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setFont:", v26);

          objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setTextColor:", v27);

          objc_msgSend(v14, "addSubview:", v24);
          v8 = v20;
          self = v28;
          v10 = v29;

        }
        ++v11;
      }
      while (v8 != v11);
    }

  }
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  void (**v5)(_QWORD);
  NSObject *v6;
  void *v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  int v11;
  const char *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = (void (**)(_QWORD))a4;
  _TVRUITipsLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[TVRUIHintsViewController dismissPresentedContentAnimated:completion:]";
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v11, 0xCu);
  }

  -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRUITipsLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Invalidating Siri tip", (uint8_t *)&v11, 2u);
    }

    -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate:completion:", 1, v5);

  }
  else
  {
    if (v9)
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "No siri tip manager, calling completion block", (uint8_t *)&v11, 2u);
    }

    if (v5)
      v5[2](v5);
  }

}

- (BOOL)hasPresentedContent
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  int v8;
  const char *v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _TVRUITipsLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[TVRUIHintsViewController hasPresentedContent]";
    v10 = 1024;
    v11 = objc_msgSend(v4, "isPresentingTip");
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s: %d", (uint8_t *)&v8, 0x12u);

  }
  -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresentingTip");

  return v6;
}

- (BOOL)_shouldAllowHintsToPresent
{
  void *v3;
  int v4;
  NSObject *v5;
  const char *v6;
  uint8_t *v7;
  __int16 v9;
  __int16 v10;
  __int16 v11;

  if (-[TVRUIHintsViewController _volumeHintEnabled](self, "_volumeHintEnabled"))
  {
    -[TVRUIHintsViewController presentationAnimator](self, "presentationAnimator");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "isRunning");

    if (v4)
    {
      _TVRUIHintsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 0;
        v6 = "Animation is already running, will not show hints";
        v7 = (uint8_t *)&v10;
LABEL_10:
        _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, v6, v7, 2u);
      }
    }
    else
    {
      if (!-[TVRUIHintsViewController isPresentingTip](self, "isPresentingTip"))
        return 1;
      _TVRUIHintsLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v9 = 0;
        v6 = "Tip is currently being presented, will not show hints";
        v7 = (uint8_t *)&v9;
        goto LABEL_10;
      }
    }
  }
  else
  {
    _TVRUIHintsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v6 = "Volume hints are disabled, will not show hints";
      v7 = (uint8_t *)&v11;
      goto LABEL_10;
    }
  }

  return 0;
}

- (BOOL)_siriHintEnabled
{
  void *v3;
  char v4;
  NSObject *v5;
  uint8_t v7[16];

  if (-[TVRUIHintsViewController allowSiriHint](self, "allowSiriHint"))
  {
    -[TVRUIHintsViewController styleProvider](self, "styleProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowSiriHint");

  }
  else
  {
    v4 = 0;
  }
  if (+[TVRUIFeatures persistHintsUIEnabled](TVRUIFeatures, "persistHintsUIEnabled"))
  {
    _TVRUIHintsLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "persistHintsUIEnabled is enabled so hints will always show", v7, 2u);
    }

    return 1;
  }
  return v4;
}

- (BOOL)_volumeHintEnabled
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  char v6;
  uint8_t v8[16];

  if (+[TVRUIFeatures persistHintsUIEnabled](TVRUIFeatures, "persistHintsUIEnabled"))
  {
    _TVRUIHintsLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "persistHintsUIEnabled is enabled so hints will always show", v8, 2u);
    }

    LOBYTE(v4) = 1;
  }
  else
  {
    v4 = -[TVRUIHintsViewController allowVolumeHint](self, "allowVolumeHint");
    if (v4)
    {
      -[TVRUIHintsViewController styleProvider](self, "styleProvider");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "shouldShowVolumeHint");

      LOBYTE(v4) = v6;
    }
  }
  return v4;
}

- (void)_setupTipsControllerIfNeeded
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  TVRUITipManager *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (-[TVRUIHintsViewController allowTips](self, "allowTips"))
  {
    if (-[TVRUIHintsViewController allowSiriHint](self, "allowSiriHint"))
    {
      -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
      v3 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v3)
      {
        _TVRUITipsLog();
        v4 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(MEMORY[0x24BDD1488], "mainBundle");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "bundleIdentifier");
          v6 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = 138412290;
          v10 = v6;
          _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Creating Siri Tip Manager for: %@", (uint8_t *)&v9, 0xCu);

        }
        v7 = -[TVRUITipManager initWithTipSourceViewProvider:tipType:]([TVRUITipManager alloc], "initWithTipSourceViewProvider:tipType:", self, 1);
        -[TVRUIHintsViewController setSiriTipManager:](self, "setSiriTipManager:", v7);

        -[TVRUIHintsViewController siriTipManager](self, "siriTipManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "activate");

      }
    }
  }
}

- (CGRect)tipSourceRect
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[TVRUIHintsViewController hardwareInfo](self, "hardwareInfo");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIntentButtonRect");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (BOOL)canPresentTip
{
  return 1;
}

- (unint64_t)_permittedArrowDirectionsForDevice:(id)a3
{
  if (objc_msgSend(a3, "isPad"))
    return 15;
  else
    return 10;
}

- (unint64_t)permittedArrowDirections
{
  void *v3;
  unint64_t v4;

  +[TVRUIDeviceInfo currentDeviceInfo](TVRUIDeviceInfo, "currentDeviceInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[TVRUIHintsViewController _permittedArrowDirectionsForDevice:](self, "_permittedArrowDirectionsForDevice:", v3);

  return v4;
}

- (BOOL)allowSiriHint
{
  return self->_allowSiriHint;
}

- (void)setAllowSiriHint:(BOOL)a3
{
  self->_allowSiriHint = a3;
}

- (BOOL)allowVolumeHint
{
  return self->_allowVolumeHint;
}

- (void)setAllowVolumeHint:(BOOL)a3
{
  self->_allowVolumeHint = a3;
}

- (BOOL)allowTips
{
  return self->_allowTips;
}

- (void)setAllowTips:(BOOL)a3
{
  self->_allowTips = a3;
}

- (TVRUIHintsUserIntentButtonView)userIntentButtonHint
{
  return self->_userIntentButtonHint;
}

- (void)setUserIntentButtonHint:(id)a3
{
  objc_storeStrong((id *)&self->_userIntentButtonHint, a3);
}

- (TVRUIHintsVolumeButtonsView)volumeButtonsHint
{
  return self->_volumeButtonsHint;
}

- (void)setVolumeButtonsHint:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonsHint, a3);
}

- (TVRUIHintsGlyphView)siriGlyphView
{
  return self->_siriGlyphView;
}

- (void)setSiriGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_siriGlyphView, a3);
}

- (TVRUIHintsGlyphView)volumeGlyphView
{
  return self->_volumeGlyphView;
}

- (void)setVolumeGlyphView:(id)a3
{
  objc_storeStrong((id *)&self->_volumeGlyphView, a3);
}

- (TVRUIDeviceHardwareInfo)hardwareInfo
{
  return self->_hardwareInfo;
}

- (void)setHardwareInfo:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareInfo, a3);
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (void)setSupportsSiri:(BOOL)a3
{
  self->_supportsSiri = a3;
}

- (BOOL)supportsVolume
{
  return self->_supportsVolume;
}

- (void)setSupportsVolume:(BOOL)a3
{
  self->_supportsVolume = a3;
}

- (NSString)lastSeenDeviceName
{
  return self->_lastSeenDeviceName;
}

- (void)setLastSeenDeviceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (double)lastAnimatedTimeInterval
{
  return self->_lastAnimatedTimeInterval;
}

- (void)setLastAnimatedTimeInterval:(double)a3
{
  self->_lastAnimatedTimeInterval = a3;
}

- (BOOL)isPresentingTip
{
  return self->_presentingTip;
}

- (void)setPresentingTip:(BOOL)a3
{
  self->_presentingTip = a3;
}

- (TVRUIHintsStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (void)setPresentationAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_presentationAnimator, a3);
}

- (UIViewPropertyAnimator)dismissalAnimator
{
  return self->_dismissalAnimator;
}

- (void)setDismissalAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_dismissalAnimator, a3);
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)siriHintVisibilityController
{
  return self->_siriHintVisibilityController;
}

- (void)setSiriHintVisibilityController:(id)a3
{
  objc_storeStrong((id *)&self->_siriHintVisibilityController, a3);
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeHintVisibilityController
{
  return self->_volumeHintVisibilityController;
}

- (void)setVolumeHintVisibilityController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeHintVisibilityController, a3);
}

- (TVRUITipManager)siriTipManager
{
  return self->_siriTipManager;
}

- (void)setSiriTipManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriTipManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriTipManager, 0);
  objc_storeStrong((id *)&self->_volumeHintVisibilityController, 0);
  objc_storeStrong((id *)&self->_siriHintVisibilityController, 0);
  objc_storeStrong((id *)&self->_dismissalAnimator, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_lastSeenDeviceName, 0);
  objc_storeStrong((id *)&self->_hardwareInfo, 0);
  objc_storeStrong((id *)&self->_volumeGlyphView, 0);
  objc_storeStrong((id *)&self->_siriGlyphView, 0);
  objc_storeStrong((id *)&self->_volumeButtonsHint, 0);
  objc_storeStrong((id *)&self->_userIntentButtonHint, 0);
}

- (void)_frameForUserIntentButtonPresented:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_21B042000, v0, v1, "Unsupported CGRectEdge", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_frameForUserIntentButtonPresented:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_21B042000, v0, v1, "User intent buttons edge is being reported to be at bottom of the device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

- (void)_frameForUserIntentButtonPresented:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_2(&dword_21B042000, v0, v1, "User intent buttons edge is being reported to the left of the device", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_1();
}

@end
