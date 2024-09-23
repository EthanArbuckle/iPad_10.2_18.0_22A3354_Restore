@implementation TVRUIRemoteViewController

- (TVRUIRemoteViewController)init
{
  TVRUIRemoteViewController *v2;
  TVRUIDarkStyleProvider *v3;
  TVRUIStyleProvider *styleProvider;
  id v5;
  TVRUITouchpadViewController *v6;
  TVRUITouchpadViewController *touchpadViewController;
  TVRUIControlPanelViewController *v8;
  TVRUIControlPanelViewController *controlPanelViewController;
  TVRUIMediaControlsViewController *v10;
  TVRUIMediaControlsViewController *mediaControlsViewController;
  TVRMessageView *v12;
  TVRMessageView *messageView;
  uint64_t v14;
  NSArray *deviceObservers;
  TVRKeyboardHaptic *v16;
  TVRKeyboardHaptic *keyboardHaptic;
  uint64_t v18;
  TVRUISiriManager *siriManager;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TVRUIRemoteViewController;
  v2 = -[TVRUIRemoteViewController init](&v21, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(TVRUIDarkStyleProvider);
    styleProvider = v2->_styleProvider;
    v2->_styleProvider = (TVRUIStyleProvider *)v3;

    v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v6 = -[TVRUITouchpadViewController initWithNibName:bundle:]([TVRUITouchpadViewController alloc], "initWithNibName:bundle:", 0, 0);
    touchpadViewController = v2->_touchpadViewController;
    v2->_touchpadViewController = v6;

    -[TVRUITouchpadViewController setTouchDelegate:](v2->_touchpadViewController, "setTouchDelegate:", v2);
    -[TVRUITouchpadViewController setStyleProvider:](v2->_touchpadViewController, "setStyleProvider:", v2->_styleProvider);
    -[TVRUITouchpadViewController setEventDelegate:](v2->_touchpadViewController, "setEventDelegate:", v2);
    objc_msgSend(v5, "addObject:", v2->_touchpadViewController);
    v8 = -[TVRUIControlPanelViewController initWithNibName:bundle:]([TVRUIControlPanelViewController alloc], "initWithNibName:bundle:", 0, 0);
    controlPanelViewController = v2->_controlPanelViewController;
    v2->_controlPanelViewController = v8;

    -[TVRUIControlPanelViewController setStyleProvider:](v2->_controlPanelViewController, "setStyleProvider:", v2->_styleProvider);
    -[TVRUIControlPanelViewController setButtonActionsDelegate:](v2->_controlPanelViewController, "setButtonActionsDelegate:", v2);
    objc_msgSend(v5, "addObject:", v2->_controlPanelViewController);
    v10 = -[TVRUIMediaControlsViewController initWithNibName:bundle:]([TVRUIMediaControlsViewController alloc], "initWithNibName:bundle:", 0, 0);
    mediaControlsViewController = v2->_mediaControlsViewController;
    v2->_mediaControlsViewController = v10;

    -[TVRUIMediaControlsViewController setStyleProvider:](v2->_mediaControlsViewController, "setStyleProvider:", v2->_styleProvider);
    -[TVRUIMediaControlsViewController setButtonActionsDelegate:](v2->_mediaControlsViewController, "setButtonActionsDelegate:", v2);
    objc_msgSend(v5, "addObject:", v2->_mediaControlsViewController);
    if (objc_msgSend(MEMORY[0x24BEB4088], "capellaEnabled"))
    {
      -[TVRUIRemoteViewController _setupNowPlayingController](v2, "_setupNowPlayingController");
      objc_msgSend(v5, "addObject:", v2->_nowPlayingController);
    }
    -[TVRUIRemoteViewController _setupDevicePickerController](v2, "_setupDevicePickerController");
    objc_msgSend(v5, "addObject:", v2->_devicePickerViewController);
    v12 = objc_alloc_init(TVRMessageView);
    messageView = v2->_messageView;
    v2->_messageView = v12;

    -[TVRMessageView setStyleProvider:](v2->_messageView, "setStyleProvider:", v2->_styleProvider);
    -[TVRMessageView setUserInteractionEnabled:](v2->_messageView, "setUserInteractionEnabled:", 0);
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v5);
    v14 = objc_claimAutoreleasedReturnValue();
    deviceObservers = v2->_deviceObservers;
    v2->_deviceObservers = (NSArray *)v14;

    v16 = objc_alloc_init(TVRKeyboardHaptic);
    keyboardHaptic = v2->_keyboardHaptic;
    v2->_keyboardHaptic = v16;

    +[TVRUISiriManager sharedManager](TVRUISiriManager, "sharedManager");
    v18 = objc_claimAutoreleasedReturnValue();
    siriManager = v2->_siriManager;
    v2->_siriManager = (TVRUISiriManager *)v18;

    -[TVRUISiriManager setButtonActionsDelegate:](v2->_siriManager, "setButtonActionsDelegate:", v2);
  }
  return v2;
}

- (void)configureWithContext:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v4 = a3;
  objc_msgSend(v4, "deviceIdentifier");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "deviceIdentifierType");
  v6 = objc_msgSend(v4, "deviceType");
  v7 = objc_msgSend(v4, "launchContext");

  -[TVRUIRemoteViewController configureWithDeviceIdentifier:identifierType:deviceType:launchContext:](self, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", v8, v5, v6, v7);
}

- (void)configureWithDeviceIdentifier:(id)a3 type:(int64_t)a4 showPicker:(BOOL)a5
{
  -[TVRUIRemoteViewController configureWithDeviceIdentifier:identifierType:deviceType:launchContext:](self, "configureWithDeviceIdentifier:identifierType:deviceType:launchContext:", a3, a4, 0, 0);
}

- (void)configureWithDeviceIdentifier:(id)a3 identifierType:(int64_t)a4 deviceType:(int64_t)a5 launchContext:(int64_t)a6
{
  __CFString *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  NSObject *v16;
  __CFString *v17;
  NSObject *v18;
  __CFString *v19;
  void *v20;
  NSObject *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  __CFString *v31;
  void *v32;
  void *v33;
  int v34;
  const __CFString *v35;
  __int16 v36;
  __CFString *v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  void *v41;
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  v10 = (__CFString *)a3;
  if (-[TVRUIRemoteViewController isConfigured](self, "isConfigured")
    || (-[TVRUIRemoteViewController activeDevice](self, "activeDevice"),
        v11 = (void *)objc_claimAutoreleasedReturnValue(),
        v11,
        v11))
  {
    _TVRUIViewControllerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "name");
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v14;
      v36 = 2114;
      v37 = v10;
      _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "RemoteViewController is already configured with device %{public}@ device-id %{public}@. Disconnecting this first", (uint8_t *)&v34, 0x16u);

    }
    -[TVRUIRemoteViewController stopConnections](self, "stopConnections");
  }
  if (-[__CFString length](v10, "length"))
  {
    +[TVRUIDeviceFactory deviceWithIdentifier:](TVRUIDeviceFactory, "deviceWithIdentifier:", v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", v15);

    _TVRUIViewControllerLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v17;
      _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v34, 0xCu);

    }
    _TVRUIViewControllerLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController _stringForDeviceDeviceIdentifierType:](self, "_stringForDeviceDeviceIdentifierType:", a4);
      v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = v10;
      v36 = 2114;
      v37 = v19;
      _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Configured RemoteViewController with device-id %{public}@ of type %{public}@", (uint8_t *)&v34, 0x16u);

    }
  }
  else
  {
    if (a6 != 11)
      goto LABEL_17;
    +[TVRUIDeviceFactory deviceWithIdentifier:](TVRUIDeviceFactory, "deviceWithIdentifier:", CFSTR("Apple TV"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", v20);

    _TVRUIViewControllerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v22 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543362;
      v35 = v22;
      _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v34, 0xCu);

    }
    -[TVRUIRemoteViewController setActiveDeviceIdentifier:](self, "setActiveDeviceIdentifier:", CFSTR("Apple TV"));
    _TVRUIViewControllerLog();
    v18 = objc_claimAutoreleasedReturnValue();
    a4 = 4;
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController _stringForDeviceDeviceIdentifierType:](self, "_stringForDeviceDeviceIdentifierType:", 4);
      v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v34 = 138543618;
      v35 = CFSTR("Apple TV");
      v36 = 2114;
      v37 = v23;
      _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "deviceIdentifier was nil and this was from TTSU, configuring RemoteViewController with device-id %{public}@ of type %{public}@", (uint8_t *)&v34, 0x16u);

    }
  }

LABEL_17:
  -[TVRUIRemoteViewController setDeviceIdentifierType:](self, "setDeviceIdentifierType:", a4);
  -[TVRUIRemoteViewController setDeviceType:](self, "setDeviceType:", a5);
  -[TVRUIRemoteViewController setLaunchContext:](self, "setLaunchContext:", a6);
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "transitonToViewForDeviceType:", -[TVRUIRemoteViewController deviceType](self, "deviceType"));

  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "transitonToViewForDeviceType:", -[TVRUIRemoteViewController deviceType](self, "deviceType"));

  +[TVRUIDeviceQuery deviceQuery](TVRUIDeviceQuery, "deviceQuery");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setDeviceQuery:](self, "setDeviceQuery:", v26);

  -[TVRUIRemoteViewController _stringForLaunchContextType:](self, "_stringForLaunchContextType:", a6);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setLaunchContextDesc:](self, "setLaunchContextDesc:", v27);

  objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController launchContextDesc](self, "launchContextDesc");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "logPresentationFrom:", v29);

  _TVRUIViewControllerLog();
  v30 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController _stringForDeviceDeviceIdentifierType:](self, "_stringForDeviceDeviceIdentifierType:", a4);
    v31 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController launchContextDesc](self, "launchContextDesc");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = 138544130;
    v35 = v10;
    v36 = 2114;
    v37 = v31;
    v38 = 2048;
    v39 = a5;
    v40 = 2114;
    v41 = v32;
    _os_log_impl(&dword_21B042000, v30, OS_LOG_TYPE_DEFAULT, "Configured RemoteViewController with device-id %{public}@  identifier type %{public}@ device-type %ld launch-context %{public}@", (uint8_t *)&v34, 0x2Au);

  }
  -[TVRUIRemoteViewController setConfigured:](self, "setConfigured:", 1);
  if (objc_msgSend(MEMORY[0x24BEB4088], "capellaEnabled"))
  {
    -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setViewServiceLaunchContext:", a6);

  }
}

- (void)viewDidLoad
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
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  objc_super v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x24BDAC8D0];
  v22.receiver = self;
  v22.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewDidLoad](&v22, sel_viewDidLoad);
  -[TVRUIRemoteViewController setOverrideUserInterfaceStyle:](self, "setOverrideUserInterfaceStyle:", 2);
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootBackgroundView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setBackgroundView:](self, "setBackgroundView:", v6);

  -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v4);

    -[TVRUIRemoteViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v10);

    -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", 0);
  }
  else
  {
    if (!v4)
      goto LABEL_6;
    -[TVRUIRemoteViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setBackgroundColor:", v4);
  }

LABEL_6:
  -[TVRUIRemoteViewController _setupChildViewControllers](self, "_setupChildViewControllers");
  -[TVRUIRemoteViewController _createBlackGradientView](self, "_createBlackGradientView");
  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setMenuProvider:", v12);

  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "userInterfaceIdiom");

  if (v15 != 1)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_sceneDidActivate_, *MEMORY[0x24BEBE6E8], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:selector:name:object:", self, sel_sceneWillDeactivate_, *MEMORY[0x24BEBE708], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addObserver:selector:name:object:", self, sel_sceneDidEnterBackground_, *MEMORY[0x24BEBE6F0], 0);

    objc_opt_self();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v20, sel_backlightLuminanceDidChange);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setTraitChangeRegistration:](self, "setTraitChangeRegistration:", v21);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  const char *v9;
  uint64_t v10;

  v3 = a3;
  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v9 = "-[TVRUIRemoteViewController viewDidAppear:]";
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  v7.receiver = self;
  v7.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  -[TVRUIRemoteViewController startConnections](self, "startConnections");
  -[TVRUIRemoteViewController _installTapToRadarButton](self, "_installTapToRadarButton");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel_connectionServiceDidInvalidate_, *MEMORY[0x24BEB4108], 0);

}

- (void)viewWillLayoutSubviews
{
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
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  void *v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  CGFloat v57;
  void *v58;
  double v59;
  double v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  void *v66;
  double v67;
  double v68;
  void *v69;
  double v70;
  double v71;
  void *v72;
  objc_super v73;
  uint8_t buf[4];
  void *v75;
  uint64_t v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  v76 = *MEMORY[0x24BDAC8D0];
  v73.receiver = self;
  v73.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewWillLayoutSubviews](&v73, sel_viewWillLayoutSubviews);
  -[TVRUIRemoteViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "rootBackgroundInsets");
    v15 = v5 + v14;
    v17 = v7 + v16;
    v19 = v9 - (v14 + v18);
    v21 = v11 - (v16 + v20);
    -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  if (v23)
  {
    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "deviceSafeAreaInsetTop");
    v26 = v25;

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setFrame:", 0.0, v26, v9, v11 - v26);

    _TVRUIViewControllerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v77.origin.x = 0.0;
      v77.origin.y = v26;
      v77.size.width = v9;
      v77.size.height = v11 - v26;
      NSStringFromCGRect(v77);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v75 = v30;
      _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_DEFAULT, "Setup device picker frame %@", buf, 0xCu);

    }
  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController _layoutTouchpadExpanded:](self, "_layoutTouchpadExpanded:", objc_msgSend(v32, "isDevicePickerShowing"));

  }
  else
  {
    -[TVRUIRemoteViewController _layoutTouchpadExpanded:](self, "_layoutTouchpadExpanded:", 0);
  }

  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "view");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "frame");
  v36 = v35;
  v38 = v37;
  v40 = v39;
  v42 = v41;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "primaryButtonSize");
  v45 = v44;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v34) = objc_msgSend(v46, "isPad");

  if ((_DWORD)v34)
  {
    v78.origin.x = v36;
    v78.origin.y = v38;
    v78.size.width = v40;
    v78.size.height = v42;
    v47 = v11 - CGRectGetMaxY(v78) - v45;
    v79.origin.x = v36;
    v79.origin.y = v38;
    v79.size.width = v40;
    v79.size.height = v42;
    v48 = CGRectGetMaxY(v79) + v47 * 0.5 + -6.0;
  }
  else
  {
    v48 = v11 * 0.77;
  }
  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "bottomSpacingRequired");
  v51 = v48 - v50;

  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "view");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "setFrame:", 0.0, v51, v9, v45);

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "mediaControlsViewHeight");
  v56 = v55;

  v80.origin.x = v36;
  v80.origin.y = v38;
  v80.size.width = v40;
  v80.size.height = v42;
  v57 = CGRectGetMaxY(v80) - v56 + -6.0;
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v58, "touchpadInsets");
  v60 = v59;

  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "view");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setFrame:", v60, v57, v40, v56);

  -[TVRUIRemoteViewController view](self, "view");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v63, "bounds");
  v65 = v64;
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "widthForMessagesView");
  v68 = (v65 - v67) * 0.5;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "widthForMessagesView");
  v71 = v70;

  -[TVRUIRemoteViewController messageView](self, "messageView");
  v72 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "setFrame:", v68, v38, v71, v42);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[6];
  char v20;
  objc_super v21;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewWillTransitionToSize:withTransitionCoordinator:](&v21, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isPad");

  if (v9)
  {
    -[TVRUIRemoteViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "bounds");
    v13 = v12;
    v15 = v14;

    if (width > height != v13 > v15)
    {
      -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "currentModalContext");

      if (v17)
      {
        -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dismissModalUI");

        v19[0] = MEMORY[0x24BDAC760];
        v19[1] = 3221225472;
        v19[2] = __80__TVRUIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2;
        v19[3] = &unk_24DE2D438;
        v20 = 1;
        v19[4] = self;
        v19[5] = v17;
        objc_msgSend(v7, "animateAlongsideTransition:completion:", &__block_literal_global_12, v19);
      }
    }
  }

}

void __80__TVRUIRemoteViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  id v2;

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(*(id *)(a1 + 32), "nowPlayingController");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "presentModalContext:animated:", *(_QWORD *)(a1 + 40), 0);

  }
}

- (void)_layoutTouchpadExpanded:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  uint64_t v28;
  uint64_t v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  double v45;
  double v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  void *v54;
  double v55;
  double v56;
  void *v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  id v71;

  v3 = a3;
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchpadInsets");
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "deviceTitleHeight");
  v14 = v13;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "isPad");

  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    if (v17)
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "view");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "frame");
      v21 = v14 + v20;

    }
    else
    {
      -[TVRUIRemoteViewController view](self, "view");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "safeAreaInsets");
      v21 = v26;
    }

    v25 = v7 + v21;
  }
  else
  {
    -[TVRUIRemoteViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v22;
    if (v17)
    {
      objc_msgSend(v22, "bounds");
      v25 = v24 * 0.135;
    }
    else
    {
      objc_msgSend(v22, "safeAreaInsets");
      v25 = v7 + v27;
    }

  }
  v28 = MGGetProductType();
  v29 = v28;
  if (v28 > 2159747552)
  {
    if (v28 == 2159747553)
      goto LABEL_17;
    if (v28 != 3885279870)
      goto LABEL_19;
LABEL_16:
    v30 = 8.0;
LABEL_18:
    v25 = v25 + v30;
    goto LABEL_19;
  }
  if (v28 == 1060988941)
    goto LABEL_16;
  if (v28 == 2078329141)
  {
LABEL_17:
    v30 = 30.0;
    goto LABEL_18;
  }
LABEL_19:
  if (v3)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "_expandedContentHeight");
    v33 = v32;

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "_calculatedContentHeight");
    v36 = v35;
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "_expandedContentHeight");
    v39 = v38;

    if (v36 > v39)
    {
      -[TVRUIRemoteViewController blackGradientView](self, "blackGradientView");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "setAlpha:", 1.0);

    }
    v25 = v25 + v33;
    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "touchpadHeight");
    v43 = v42;
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "_expandedContentHeight");
    v46 = v43 - v45;

  }
  else
  {
    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "touchpadCornerRadius");
    v49 = v48;
    -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "view");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "_setContinuousCornerRadius:", v49);

    -[TVRUIRemoteViewController blackGradientView](self, "blackGradientView");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "setAlpha:", 0.0);

    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "touchpadHeight");
    v46 = v53;
  }

  if (v29 == 2159747553 || v29 == 2078329141)
    v46 = v46 + -30.0;
  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "bottomSpacingRequired");
  v56 = v46 - v55;

  -[TVRUIRemoteViewController view](self, "view");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "bounds");
  v59 = v58;

  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "view");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "setFrame:", v9, v25, v59 - v9 - v11, v56);

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "deviceListRowHeight");
  v64 = v63;

  -[TVRUIRemoteViewController blackGradientView](self, "blackGradientView");
  v65 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v65, "setFrame:", 0.0, v25 - v64, v59, v64);

  -[TVRUIRemoteViewController blackGradientView](self, "blackGradientView");
  v66 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v66, "layer");
  v67 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v67, "sublayers");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "objectAtIndexedSubscript:", 0);
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v69, "setFrame:", 0.0, 0.0, v59, v64);

  -[TVRUIRemoteViewController view](self, "view");
  v71 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController blackGradientView](self, "blackGradientView");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v71, "bringSubviewToFront:", v70);

}

- (void)_createBlackGradientView
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[3];

  v13[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BEBDB00]);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  objc_msgSend(v3, "setUserInteractionEnabled:", 0);
  objc_msgSend(MEMORY[0x24BDE56B8], "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_retainAutorelease(v6);
  v13[0] = objc_msgSend(v8, "CGColor");
  v9 = objc_retainAutorelease(v7);
  v13[1] = objc_msgSend(v9, "CGColor");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v13, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setColors:", v10);
  objc_msgSend(v3, "layer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "insertSublayer:atIndex:", v5, 0);

  -[TVRUIRemoteViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addSubview:", v3);

  -[TVRUIRemoteViewController setBlackGradientView:](self, "setBlackGradientView:", v3);
}

- (void)setIsInSecureWindow:(BOOL)a3
{
  if (self->_isInSecureWindow != a3)
  {
    self->_isInSecureWindow = a3;
    -[TVRUIRemoteViewController _updateSecureWindowState](self, "_updateSecureWindowState");
  }
}

- (void)_enableTVRemoteOnLockscreen:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const __CFString *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x24BDAC8D0];
  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 != 1)
  {
    _TVRUIViewControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v3)
        v8 = CFSTR("enable");
      else
        v8 = CFSTR("disable");
      -[TVRUIRemoteViewController activeDeviceIdentifier](self, "activeDeviceIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v8;
      v15 = 2114;
      v16 = v9;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Requesting tvremoted to %@ lock screen assertion for device: %{public}@", (uint8_t *)&v13, 0x16u);

    }
    objc_msgSend(MEMORY[0x24BEB40F8], "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enableTVRemoteOnLockscreen:forDeviceIdentifier:", v3, v12);

  }
}

- (void)_updateSecureWindowState
{
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[16];
  uint8_t buf[16];

  if (-[TVRUIRemoteViewController isInSecureWindow](self, "isInSecureWindow")
    && (-[TVRUIRemoteViewController activeDevice](self, "activeDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    _TVRUIViewControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewController is in a secure window", buf, 2u);
    }
    v5 = 1;
  }
  else
  {
    _TVRUIViewControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "TVRUIRemoteViewController is NOT in a secure window", v6, 2u);
    }
    v5 = 0;
  }

  -[TVRUIRemoteViewController _enableTVRemoteOnLockscreen:](self, "_enableTVRemoteOnLockscreen:", v5);
}

- (BOOL)shouldDisconnectAndStopConnections
{
  void *v3;
  uint64_t v4;
  void *v5;
  BOOL v6;

  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4 != 1)
  {
    -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "screenLocked"))
    {
      v6 = -[TVRUIRemoteViewController isInSecureWindow](self, "isInSecureWindow");

      if (v6)
        return 0;
    }
    else
    {

    }
  }
  return 1;
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  objc_super v8;
  uint8_t buf[4];
  const char *v10;
  uint64_t v11;

  v3 = a3;
  v11 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v10 = "-[TVRUIRemoteViewController viewWillDisappear:]";
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (-[TVRUIRemoteViewController shouldDisconnectAndStopConnections](self, "shouldDisconnectAndStopConnections"))
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v10) = v3;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "tvruiremoteviewcontroller will disappear animated=%d", buf, 8u);
    }

    if (v3)
      -[TVRUIRemoteViewController _disconnectUserInitiated](self, "_disconnectUserInitiated");
    else
      -[TVRUIRemoteViewController _disconnectSystemInitiated](self, "_disconnectSystemInitiated");
    -[TVRUIRemoteViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", v3, 0);
    -[TVRUIRemoteViewController stopConnections](self, "stopConnections");
  }
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x24BEB4108], 0);

  v8.receiver = self;
  v8.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, v3);
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  unint64_t v3;

  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "userInterfaceIdiom") == 1)
    v3 = 30;
  else
    v3 = 2;

  return v3;
}

- (CGSize)preferredContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)backlightLuminanceDidChange
{
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  _BOOL4 v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  self->_isInReducedBacklightMode = objc_msgSend(v3, "_backlightLuminance") == 1;

  -[TVRUIRemoteViewController _updateControlsAppearance](self, "_updateControlsAppearance");
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 134218240;
    v7 = objc_msgSend(v5, "_backlightLuminance");
    v8 = 1024;
    v9 = -[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode");
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Backlight Luminance: %ld in AOD: %d", (uint8_t *)&v6, 0x12u);

  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:", self);
  -[TVRUIRemoteViewController traitChangeRegistration](self, "traitChangeRegistration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController unregisterForTraitChanges:](self, "unregisterForTraitChanges:", v3);

  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disconnectUserInitiated");

  }
  -[TVRUIRemoteViewController setFindingSession:](self, "setFindingSession:", 0);
  v6.receiver = self;
  v6.super_class = (Class)TVRUIRemoteViewController;
  -[TVRUIRemoteViewController dealloc](&v6, sel_dealloc);
}

- (void)_setupNowPlayingController
{
  TVRUINowPlayingController *v3;
  TVRUINowPlayingController *nowPlayingController;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id location;

  +[TVRUINowPlayingController controllerWithHostingViewController:](TVRUINowPlayingController, "controllerWithHostingViewController:", self);
  v3 = (TVRUINowPlayingController *)objc_claimAutoreleasedReturnValue();
  nowPlayingController = self->_nowPlayingController;
  self->_nowPlayingController = v3;

  objc_initWeak(&location, self);
  v5 = MEMORY[0x24BDAC760];
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke;
  v8[3] = &unk_24DE2D4A0;
  objc_copyWeak(&v9, &location);
  -[TVRUINowPlayingController setCommandHandler:](self->_nowPlayingController, "setCommandHandler:", v8);
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_5;
  v6[3] = &unk_24DE2D4C8;
  objc_copyWeak(&v7, &location);
  -[TVRUINowPlayingController setCapellaInfoDidChangeHandler:](self->_nowPlayingController, "setCapellaInfoDidChangeHandler:", v6);
  objc_destroyWeak(&v7);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id WeakRetained;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD block[5];

  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v7 = WeakRetained;
  if (WeakRetained)
  {
    v8 = 0;
    v9 = 6;
    switch(a2)
    {
      case 0:
        v8 = 0;
        v9 = 7;
        goto LABEL_16;
      case 1:
        v8 = 0;
        v9 = 5;
        goto LABEL_16;
      case 2:
        goto LABEL_16;
      case 3:
        v8 = 1;
        goto LABEL_7;
      case 4:
        v8 = 2;
LABEL_7:
        v9 = 14;
        goto LABEL_16;
      case 5:
        v8 = 1;
        goto LABEL_10;
      case 6:
        v8 = 2;
LABEL_10:
        v9 = 15;
        goto LABEL_16;
      case 7:
        v8 = 0;
        v9 = 31;
        goto LABEL_16;
      case 8:
        v8 = 0;
        v9 = 29;
        goto LABEL_16;
      case 9:
        block[0] = MEMORY[0x24BDAC760];
        block[1] = 3221225472;
        block[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_2;
        block[3] = &unk_24DE2C198;
        block[4] = WeakRetained;
        dispatch_async(MEMORY[0x24BDAC9B8], block);
        break;
      case 10:
        v8 = 0;
        v9 = 3;
        goto LABEL_16;
      case 12:
        v8 = 0;
        v9 = 9998;
LABEL_16:
        +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", v8, v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "generatedButtonEvent:", v10);
        goto LABEL_17;
      case 13:
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("TVRUINowPlayingControllerParamPlayItemInfoKey"), 6);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v7, "activeDevice");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "playItem:completion:", v10, &__block_literal_global_59);

        }
LABEL_17:

        break;
      default:
        break;
    }
  }

}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_2(uint64_t a1)
{
  void *v2;
  dispatch_time_t v3;
  _QWORD block[5];

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "generatedButtonEvent:", v2);
  v3 = dispatch_time(0, 2000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_3;
  block[3] = &unk_24DE2C198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v3, MEMORY[0x24BDAC9B8], block);

}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_3(uint64_t a1)
{
  id v2;

  +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 3);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "generatedButtonEvent:", v2);

}

void __55__TVRUIRemoteViewController__setupNowPlayingController__block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateInfoButtonState");
    WeakRetained = v2;
  }

}

- (void)_setupChildViewControllers
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  -[TVRUIRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_touchpadViewController);
  -[TVRUIRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_controlPanelViewController);
  -[TVRUIRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_mediaControlsViewController);
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController bs_addChildViewController:](self, "bs_addChildViewController:", v3);

  -[TVRUIRemoteViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController messageView](self, "messageView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v5);

  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Setup remote child controllers and message view", v9, 2u);
  }

  -[TVRUIRemoteViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");

  -[TVRUIRemoteViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

}

- (void)_setupDevicePickerController
{
  void *v3;
  TVRUIDevicePickerViewController *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TVRUITipSourceViewProvider *v10;
  TVRUITipSourceViewProvider *tipSourceViewProvider;

  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc_init(TVRUIDevicePickerViewController);
    -[TVRUIRemoteViewController setDevicePickerViewController:](self, "setDevicePickerViewController:", v4);

    -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setStyleProvider:", v5);

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDelegate:", self);

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setButtonEventDelegate:", self);

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEnabled:", 1);

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v10 = (TVRUITipSourceViewProvider *)objc_claimAutoreleasedReturnValue();
    tipSourceViewProvider = self->_tipSourceViewProvider;
    self->_tipSourceViewProvider = v10;

  }
}

- (id)_stringForLaunchContextType:(int64_t)a3
{
  id result;

  switch(a3)
  {
    case 1:
      result = CFSTR("controlCenter");
      break;
    case 2:
      result = CFSTR("lockscreen");
      break;
    case 3:
      result = CFSTR("mediaPlatterHome");
      break;
    case 4:
      result = CFSTR("siriShortcut");
      break;
    case 5:
      result = CFSTR("mediaPlatterControlCenter");
      break;
    case 6:
      result = CFSTR("mediaPlatterLockscreen");
      break;
    case 7:
      result = CFSTR("mediaPlatterSiri");
      break;
    case 8:
      result = CFSTR("mediaPlatter");
      break;
    case 9:
      result = CFSTR("siri");
      break;
    case 10:
      result = CFSTR("continuityKeyboard");
      break;
    case 11:
      result = CFSTR("tapToSetup");
      break;
    case 12:
      result = CFSTR("expanse");
      break;
    case 13:
      result = CFSTR("jindo");
      break;
    case 14:
      result = CFSTR("controlCenterLockscreen");
      break;
    default:
      if (a3 == 100)
        result = CFSTR("internalDevelopment");
      else
        result = CFSTR("unspecified");
      break;
  }
  return result;
}

- (id)animatorForPresentationAsAlert
{
  void *v2;
  void *v3;
  TVRUIAlertAnimationController *v4;

  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[TVRUIAlertAnimationController initWithAnimationType:visualStyle:]([TVRUIAlertAnimationController alloc], "initWithAnimationType:visualStyle:", 0, v3);
  return v4;
}

- (id)animatorForDismissalAsAlert
{
  void *v2;
  void *v3;
  TVRUIAlertAnimationController *v4;

  -[TVRUIRemoteViewController traitCollection](self, "traitCollection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVRemoteAlertVisualStyleProviding visualStyleForIdiom:](TVRemoteAlertVisualStyleProviding, "visualStyleForIdiom:", objc_msgSend(v2, "userInterfaceIdiom"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = -[TVRUIAlertAnimationController initWithAnimationType:visualStyle:]([TVRUIAlertAnimationController alloc], "initWithAnimationType:visualStyle:", 1, v3);
  return v4;
}

- (void)setBackgroundCornerRadius:(double)a3
{
  void *v5;
  void *v6;
  id v7;

  -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v5;
  if (v5)
  {
    objc_msgSend(v5, "_setContinuousCornerRadius:", a3);
  }
  else
  {
    -[TVRUIRemoteViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_setContinuousCornerRadius:", a3);

  }
}

- (double)backgroundCornerRadius
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[TVRUIRemoteViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_continuousCornerRadius");
    v6 = v5;
  }
  else
  {
    -[TVRUIRemoteViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_continuousCornerRadius");
    v6 = v8;

  }
  return v6;
}

- (void)startConnections
{
  NSObject *v3;
  void *v4;
  void *v5;
  char v6;
  NSObject *v7;
  void *v8;
  void *v9;
  _BOOL4 v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  char *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  int64_t v23;
  void *v24;
  _BOOL4 v25;
  id v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  void (*v33)(uint64_t);
  void *v34;
  id v35;
  _QWORD v36[5];
  uint8_t buf[4];
  const char *v38;
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v38 = "-[TVRUIRemoteViewController startConnections]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "hasStarted");

    if ((v6 & 1) == 0)
    {
      _TVRUIViewControllerLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Starting device query", buf, 2u);
      }

      -[TVRUIRemoteViewController fetchPreferredDeviceIdentifier](self, "fetchPreferredDeviceIdentifier");
      -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v36[0] = MEMORY[0x24BDAC760];
      v36[1] = 3221225472;
      v36[2] = __45__TVRUIRemoteViewController_startConnections__block_invoke;
      v36[3] = &unk_24DE2D4F0;
      v36[4] = self;
      objc_msgSend(v8, "startQuery:completionHandler:", self, v36);

      -[TVRUIRemoteViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showSearchingSpinnerIfNeeded, 0, 2.0);
    }
  }
  -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9 == 0;

  if (v10)
  {
    v11 = objc_alloc_init(MEMORY[0x24BE900E8]);
    -[TVRUIRemoteViewController setSharingClient:](self, "setSharingClient:", v11);

    -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "activateAssertionWithIdentifier:", CFSTR("com.apple.sharing.PreventContinuityKeyboard"));

    _TVRUIViewControllerLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Activated assertion to prevent Continuity Keyboard", buf, 2u);
    }

  }
  _TVRUIViewControllerLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v15 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v38 = v15;
    _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_DEFAULT, "Active device: %{public}@", buf, 0xCu);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "isConnected");

  if (v17)
  {
    -[TVRUIRemoteViewController deviceConnectionStatusDelegate](self, "deviceConnectionStatusDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "deviceDidConnect");

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v20, "isConnecting"))
    {

    }
    else
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "isConnected");

      if ((v22 & 1) != 0)
        goto LABEL_22;
      v23 = -[TVRUIRemoteViewController _connectionContextFromLaunchContext:](self, "_connectionContextFromLaunchContext:", -[TVRUIRemoteViewController launchContext](self, "launchContext"));
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController _connectToDevice:connectionContext:](self, "_connectToDevice:connectionContext:", v19, v23);
    }

  }
LABEL_22:
  -[TVRUIRemoteViewController _setupNetworkObserverIfNeeded](self, "_setupNetworkObserverIfNeeded");
  -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v24 == 0;

  if (v25)
  {
    v26 = objc_alloc_init(MEMORY[0x24BE29840]);
    -[TVRUIRemoteViewController setSystemMonitor:](self, "setSystemMonitor:", v26);

    objc_initWeak((id *)buf, self);
    -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = MEMORY[0x24BDAC760];
    v32 = 3221225472;
    v33 = __45__TVRUIRemoteViewController_startConnections__block_invoke_103;
    v34 = &unk_24DE2C4F8;
    objc_copyWeak(&v35, (id *)buf);
    objc_msgSend(v27, "setScreenLockedChangedHandler:", &v31);

    -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor", v31, v32, v33, v34);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateWithCompletion:", &__block_literal_global_109);

    objc_destroyWeak(&v35);
    objc_destroyWeak((id *)buf);
  }
  if (-[TVRUIRemoteViewController supportsSiri](self, "supportsSiri"))
  {
    _TVRUIViewControllerLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_DEFAULT, "Registering for Siri Events", buf, 2u);
    }

    -[TVRUIRemoteViewController siriManager](self, "siriManager");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "registerForSiriEvents");

  }
  -[TVRUIRemoteViewController _initSessionStatistics](self, "_initSessionStatistics");
}

uint64_t __45__TVRUIRemoteViewController_startConnections__block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_startDeviceQueryThresholdTimer");
  return result;
}

void __45__TVRUIRemoteViewController_startConnections__block_invoke_103(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "systemMonitor");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "screenLocked");

    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("unlocked");
      if (v4)
        v6 = CFSTR("locked");
      v8 = 138412290;
      v9 = v6;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Screen is now %@", (uint8_t *)&v8, 0xCu);
    }

    if (v4)
    {
      objc_msgSend(v2, "nowPlayingController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "dismissModalUI");

    }
  }

}

void __45__TVRUIRemoteViewController_startConnections__block_invoke_108()
{
  NSObject *v0;
  uint8_t v1[16];

  _TVRUIViewControllerLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21B042000, v0, OS_LOG_TYPE_DEFAULT, "Screen lock monitor activated", v1, 2u);
  }

}

- (void)stopConnections
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  const char *v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v29 = 136315138;
    v30 = "-[TVRUIRemoteViewController stopConnections]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v29, 0xCu);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "UI has active device. Calling disconnect on device", (uint8_t *)&v29, 2u);
    }

    -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "screenLocked");

    if (v7)
      -[TVRUIRemoteViewController _disconnectSystemInitiated](self, "_disconnectSystemInitiated");
    else
      -[TVRUIRemoteViewController _disconnectUserInitiated](self, "_disconnectUserInitiated");
    -[TVRUIRemoteViewController _updateSecureWindowState](self, "_updateSecureWindowState");
  }
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    _TVRUIViewControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Found an authenticating device. Requesting disconnect", (uint8_t *)&v29, 2u);
    }

    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "disconnectUserInitiated");

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "resetSelectedDevice");

  }
  -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    _TVRUIViewControllerLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_DEFAULT, "Stopping device query", (uint8_t *)&v29, 2u);
    }

    -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stop");

    -[TVRUIRemoteViewController setDeviceQuery:](self, "setDeviceQuery:", 0);
    -[TVRUIRemoteViewController _stopDeviceQueryThresholdTimer](self, "_stopDeviceQueryThresholdTimer");
  }
  -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "invalidate");

    -[TVRUIRemoteViewController setSharingClient:](self, "setSharingClient:", 0);
    _TVRUIViewControllerLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Invalidated sharing client", (uint8_t *)&v29, 2u);
    }

  }
  -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TVRUIRemoteViewController systemMonitor](self, "systemMonitor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "invalidate");

    -[TVRUIRemoteViewController setSystemMonitor:](self, "setSystemMonitor:", 0);
    _TVRUIViewControllerLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_21B042000, v21, OS_LOG_TYPE_DEFAULT, "system monitor for screen locked state invalidated", (uint8_t *)&v29, 2u);
    }

  }
  -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
    -[TVRUIRemoteViewController setNetworkObserver:](self, "setNetworkObserver:", 0);
  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", 0);
  -[TVRUIRemoteViewController siriManager](self, "siriManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "unregisterForSiriEvents");

  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDevices:", MEMORY[0x24BDBD1A8]);

  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setSuggestedDevices:", MEMORY[0x24BDBD1A8]);

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "collapseDeviceList");

  -[TVRUIRemoteViewController setConfigured:](self, "setConfigured:", 0);
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEnabled:", 0);

  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "dismissModalUI");

  -[TVRUIRemoteViewController _logSessionStatistics](self, "_logSessionStatistics");
}

- (void)_disconnectUserInitiated
{
  -[TVRUIRemoteViewController _disconnectUserInitiatedAndModifyLockscreenAssertion:](self, "_disconnectUserInitiatedAndModifyLockscreenAssertion:", 1);
}

- (void)_disconnectUserInitiatedAndModifyLockscreenAssertion:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  __int16 v11;
  __int16 v12;

  v3 = a3;
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController _stopFindingSessionForDevice:](self, "_stopFindingSessionForDevice:", v6);

    if (v3)
      -[TVRUIRemoteViewController _enableTVRemoteOnLockscreen:](self, "_enableTVRemoteOnLockscreen:", 0);
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "disconnectUserInitiated");

    -[TVRUIRemoteViewController _resetActiveDevice](self, "_resetActiveDevice");
    -[TVRUIRemoteViewController _enableMediaControls:animated:](self, "_enableMediaControls:animated:", 0, 0);
    -[TVRUIRemoteViewController _enableLiveTVButtons:animated:](self, "_enableLiveTVButtons:animated:", 0, 0);
    _TVRUIViewControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v9 = "#tvrlock - user initiated disconnect called on active device";
      v10 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    _TVRUIViewControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v9 = "#tvrlock - user initiated disconnect, but device is NOT ACTIVE";
      v10 = (uint8_t *)&v11;
      goto LABEL_8;
    }
  }

}

- (void)_disconnectSystemInitiated
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v9;
  __int16 v10;

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController _stopFindingSessionForDevice:](self, "_stopFindingSessionForDevice:", v4);

    -[TVRUIRemoteViewController _enableTVRemoteOnLockscreen:](self, "_enableTVRemoteOnLockscreen:", 0);
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "disconnectSystemInitiated");

    -[TVRUIRemoteViewController _resetActiveDevice](self, "_resetActiveDevice");
    -[TVRUIRemoteViewController _enableMediaControls:animated:](self, "_enableMediaControls:animated:", 0, 0);
    -[TVRUIRemoteViewController _enableLiveTVButtons:animated:](self, "_enableLiveTVButtons:animated:", 0, 0);
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "#tvrlock - system initiated disconnect called on active device";
      v8 = (uint8_t *)&v10;
LABEL_6:
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 0;
      v7 = "#tvrlock - system initiated disconnect, but device is NOT ACTIVE";
      v8 = (uint8_t *)&v9;
      goto LABEL_6;
    }
  }

}

- (void)_resetActiveDevice
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    _TVRUIViewControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Resetting active device", v7, 2u);
    }

    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setDelegate:", 0);

    -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", 0);
  }
  -[TVRUIRemoteViewController setActiveDeviceIdentifier:](self, "setActiveDeviceIdentifier:", 0);
  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setNowPlayingInfo:", 0);

}

- (void)_initSessionStatistics
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = objc_alloc_init(MEMORY[0x24BEB40C8]);
  -[TVRUIRemoteViewController setSessionData:](self, "setSessionData:", v3);

  objc_msgSend(MEMORY[0x24BDBCE60], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController sessionData](self, "sessionData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSessionStartTime:", v4);

  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Initialized session stats", v7, 2u);
  }

}

- (void)_logSessionStatistics
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  -[TVRUIRemoteViewController sessionData](self, "sessionData");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUIRemoteViewController launchContextDesc](self, "launchContextDesc");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController sessionData](self, "sessionData");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLaunchContextDesc:", v4);

    objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController sessionData](self, "sessionData");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "logSessionStatistics:", v7);

    -[TVRUIRemoteViewController setSessionData:](self, "setSessionData:", 0);
    _TVRUIViewControllerLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Logged session stats", v9, 2u);
    }

  }
}

- (void)sceneDidActivate:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[TVRUIRemoteViewController sceneDidActivate:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[TVRUIRemoteViewController _activate](self, "_activate");
}

- (void)sceneWillDeactivate:(id)a3
{
  void *v4;
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[TVRUIRemoteViewController sceneWillDeactivate:]";
    v8 = 2114;
    v9 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v6, 0x16u);
  }

  -[TVRUIRemoteViewController _deactivate](self, "_deactivate");
}

- (void)_deactivate
{
  id v2;

  -[TVRUIRemoteViewController siriManager](self, "siriManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unregisterForSiriEvents");

}

- (void)sceneDidEnterBackground:(id)a3
{
  void *v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  const char *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315394;
    v8 = "-[TVRUIRemoteViewController sceneDidEnterBackground:]";
    v9 = 2114;
    v10 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s - %{public}@", (uint8_t *)&v7, 0x16u);
  }

  if (-[TVRUIRemoteViewController isInSecureWindow](self, "isInSecureWindow"))
  {
    _TVRUIViewControllerLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v7) = 0;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Not disconnecting the connection the TV as we are transitioning to a secure window", (uint8_t *)&v7, 2u);
    }

  }
  else
  {
    -[TVRUIRemoteViewController _disconnect](self, "_disconnect");
  }

}

- (void)_disconnect
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  const char *v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v23 = 136315138;
    v24 = "-[TVRUIRemoteViewController _disconnect]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v23, 0xCu);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "UI has active device. Calling disconnect on device", (uint8_t *)&v23, 2u);
    }

    -[TVRUIRemoteViewController _disconnectUserInitiated](self, "_disconnectUserInitiated");
  }
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    _TVRUIViewControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Found an authenticating device. Requesting disconnect", (uint8_t *)&v23, 2u);
    }

    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "disconnectUserInitiated");

  }
  -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasStarted");

  if (v10)
  {
    _TVRUIViewControllerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Stopping device query", (uint8_t *)&v23, 2u);
    }

    -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stop");

    -[TVRUIRemoteViewController _stopDeviceQueryThresholdTimer](self, "_stopDeviceQueryThresholdTimer");
  }
  -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "invalidate");

    -[TVRUIRemoteViewController setSharingClient:](self, "setSharingClient:", 0);
    _TVRUIViewControllerLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "Invalidated sharing client", (uint8_t *)&v23, 2u);
    }

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "resetSelectedDevice");

    if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setSuggestedDevices:", MEMORY[0x24BDBD1A8]);

    }
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDevices:", MEMORY[0x24BDBD1A8]);

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collapseDeviceList");

  }
  -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v21)
    -[TVRUIRemoteViewController setNetworkObserver:](self, "setNetworkObserver:", 0);
  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", 0);
  -[TVRUIRemoteViewController _toggleControlAvailability](self, "_toggleControlAvailability");
  -[TVRUIRemoteViewController siriManager](self, "siriManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "unregisterForSiriEvents");

  -[TVRUIRemoteViewController setConfigured:](self, "setConfigured:", 0);
  -[TVRUIRemoteViewController _logSessionStatistics](self, "_logSessionStatistics");
}

- (void)fetchPreferredDeviceIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BEB40C0], "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredDeviceIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setPreferredDeviceIdentifier:](self, "setPreferredDeviceIdentifier:", v4);

  -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    if (v7)
    {
      -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Found preferredDeviceIdentifier %@", (uint8_t *)&v9, 0xCu);

    }
  }
  else if (v7)
  {
    LOWORD(v9) = 0;
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "No preferredDeviceIdentifier found", (uint8_t *)&v9, 2u);
  }

}

- (void)_connectToDevice:(id)a3 connectionContext:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController _stringForConnectionContext:](self, "_stringForConnectionContext:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2112;
    v19 = v8;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Requesting connect to device=%{public}@ with connectionContext:%@", (uint8_t *)&v16, 0x16u);

  }
  -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
  -[TVRUIRemoteViewController _cancelShowConnectingSpinner](self, "_cancelShowConnectingSpinner");
  -[TVRUIRemoteViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showConnectingSpinner, 0, 0.7);
  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "connectWithConnectionContext:", a4);
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v9 = objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v10 = (void *)v9;
    objc_msgSend(v6, "name");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDevice:", v6);

      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isDevicePickerShowing");

      if (v14)
      {
        -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "collapseDeviceList");

      }
    }
  }

}

- (void)_updateControlsAppearance
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = -[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode") ^ 1;
  if (-[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode"))
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collapseDeviceList");

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDevicePickerShowing");

  if ((v6 & 1) == 0)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEnabled:", v3);

  }
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v3);

  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", v3);

  -[TVRUIRemoteViewController _toggleControlAvailability](self, "_toggleControlAvailability");
  if (-[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode"))
  {
    if (-[TVRUIRemoteViewController hasPresentedContent](self, "hasPresentedContent"))
    {
      _TVRUIViewControllerLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Dismissing presented content", buf, 2u);
      }

      -[TVRUIRemoteViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 0, 0);
    }
  }
  else if (-[TVRUIRemoteViewController isEditingSessionActive](self, "isEditingSessionActive"))
  {
    -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v11)
    {
      _TVRUIViewControllerLog();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "Launching keyboard view controller", v14, 2u);
      }

      -[TVRUIRemoteViewController keyboardRequested](self, "keyboardRequested");
    }
  }
  if (-[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode"))
  {
    -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dismissModalUI");

  }
}

- (void)_toggleControlAvailability
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543618;
    v12 = v5;
    v13 = 1024;
    v14 = objc_msgSend(v6, "isConnected");
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Toggling control panel controls. active device %{public}@. isConnected %d", (uint8_t *)&v11, 0x12u);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isConnected");

    if (v9)
      v7 = -[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode") ^ 1;
    else
      v7 = 0;
  }
  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", v7);

}

- (void)_startDeviceQueryThresholdTimer
{
  NSObject *v3;
  dispatch_block_t v4;
  id deviceQueryThresholdBlock;
  void *v6;
  double v7;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD block[4];
  id v15;
  uint8_t buf[8];
  id location;

  objc_initWeak(&location, self);
  if (self->_deviceQueryThresholdBlock)
  {
    if (-[TVRUIRemoteViewController deviceQueryThresholdReached](self, "deviceQueryThresholdReached"))
    {
      _TVRUIViewControllerLog();
      v3 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Unable to cancel deviceQueryThresholdTimer as the query threshold was reached", buf, 2u);
      }

    }
    else
    {
      -[TVRUIRemoteViewController _stopDeviceQueryThresholdTimer](self, "_stopDeviceQueryThresholdTimer");
    }
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController__startDeviceQueryThresholdTimer__block_invoke;
  block[3] = &unk_24DE2C4F8;
  objc_copyWeak(&v15, &location);
  v4 = dispatch_block_create((dispatch_block_flags_t)0, block);
  deviceQueryThresholdBlock = self->_deviceQueryThresholdBlock;
  self->_deviceQueryThresholdBlock = v4;

  objc_msgSend(MEMORY[0x24BEB40C0], "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredDeviceSearchTimeout");
  v8 = v7;

  _TVRUIViewControllerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Started deviceQueryThresholdTimer", buf, 2u);
  }

  v10 = dispatch_time(0, (uint64_t)(v8 * 1000000000.0));
  v11 = MEMORY[0x24BDAC9B8];
  -[TVRUIRemoteViewController deviceQueryThresholdBlock](self, "deviceQueryThresholdBlock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x24BDAC9B8];
  dispatch_after(v10, MEMORY[0x24BDAC9B8], v12);

  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);
}

void __60__TVRUIRemoteViewController__startDeviceQueryThresholdTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v2;
  NSObject *v3;
  uint8_t v4[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "setDeviceQueryThresholdReached:", 1);
    _TVRUIViewControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Query threshold reached", v4, 2u);
    }

    objc_msgSend(v2, "_connectToMostRelevantDevice");
  }

}

- (void)_stopDeviceQueryThresholdTimer
{
  NSObject *v3;
  void *v4;
  void *v5;
  id deviceQueryThresholdBlock;
  uint8_t v7[16];

  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Stopping deviceQueryThresholdTimer", v7, 2u);
  }

  -[TVRUIRemoteViewController deviceQueryThresholdBlock](self, "deviceQueryThresholdBlock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIRemoteViewController deviceQueryThresholdBlock](self, "deviceQueryThresholdBlock");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    dispatch_block_cancel(v5);

    deviceQueryThresholdBlock = self->_deviceQueryThresholdBlock;
    self->_deviceQueryThresholdBlock = 0;

  }
  -[TVRUIRemoteViewController setDeviceQueryThresholdReached:](self, "setDeviceQueryThresholdReached:", 0);
}

- (void)_connectToMostRelevantDevice
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  int v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  char *v21;
  NSObject *v22;
  void *v23;
  char *v24;
  void *v25;
  int v26;
  void *v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  char *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint8_t buf[4];
  const char *v44;
  __int16 v45;
  int v46;
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Attempting to connect to the most relevant device", buf, 2u);
  }

  if (!-[TVRUIRemoteViewController deviceQueryThresholdReached](self, "deviceQueryThresholdReached"))
  {
    _TVRUIViewControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_WORD *)buf = 0;
    v15 = "Query threshold not reached. Ignoring call";
    v16 = v9;
    v17 = 2;
LABEL_15:
    _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, v15, buf, v17);
    goto LABEL_28;
  }
  -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
  v4 = objc_claimAutoreleasedReturnValue();
  if (!v4
    || (v5 = (void *)v4,
        -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v7 = objc_msgSend(v6, "hasStarted"),
        v6,
        v5,
        (v7 & 1) == 0))
  {
    _TVRUIViewControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      goto LABEL_28;
    *(_DWORD *)buf = 136315138;
    v44 = "-[TVRUIRemoteViewController _connectToMostRelevantDevice]";
    v15 = "%s - deviceQuery was invalidated";
    v16 = v9;
    v17 = 12;
    goto LABEL_15;
  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "devices");
  v9 = objc_claimAutoreleasedReturnValue();

  _TVRUIViewControllerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = -[NSObject count](v9, "count");
    *(_DWORD *)buf = 134217984;
    v44 = (const char *)v11;
    _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Queried devices count: %ld", buf, 0xCu);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12 || -[NSObject count](v9, "count") != 1)
  {
    v14 = 0;
  }
  else
  {
    -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "isPaired");

  }
  _TVRUIViewControllerLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v44) = v14;
    _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Query threshold reached. canAutoconnect to single device = %d", buf, 8u);
  }

  if (v14)
  {
    -[NSObject objectAtIndexedSubscript:](v9, "objectAtIndexedSubscript:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", v19);

    _TVRUIViewControllerLog();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v21 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v21;
      _os_log_impl(&dword_21B042000, v20, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", buf, 0xCu);

    }
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v22 = objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController _connectToDevice:connectionContext:](self, "_connectToDevice:connectionContext:", v22, 3);
LABEL_27:

    goto LABEL_28;
  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  if (v23 || !-[NSObject count](v9, "count"))
  {

    goto LABEL_25;
  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "isDevicePickerShowing");

  if ((v28 & 1) != 0)
  {
LABEL_25:
    _TVRUIViewControllerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v24 = (char *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = objc_msgSend(v25, "isDevicePickerShowing");
      *(_DWORD *)buf = 138412546;
      v44 = v24;
      v45 = 1024;
      v46 = v26;
      _os_log_impl(&dword_21B042000, v22, OS_LOG_TYPE_DEFAULT, "Failed to find a relevant TV. Active device :%@ isShowingDevicePicker: %d", buf, 0x12u);

    }
    goto LABEL_27;
  }
  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
  {
    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    v9 = v9;
    v29 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v40;
LABEL_34:
      v32 = 0;
      while (1)
      {
        if (*(_QWORD *)v40 != v31)
          objc_enumerationMutation(v9);
        v33 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * v32);
        if (objc_msgSend(v33, "classification", (_QWORD)v39) == 1)
          break;
        if (v30 == ++v32)
        {
          v30 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v39, v47, 16);
          if (v30)
            goto LABEL_34;
          goto LABEL_40;
        }
      }
      v22 = v33;
      _TVRUIViewControllerLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v44 = (const char *)v22;
        _os_log_impl(&dword_21B042000, v35, OS_LOG_TYPE_DEFAULT, "Found suggested device to auto select: %@", buf, 0xCu);
      }

      if (v22)
      {
        _TVRUIIRLog();
        v36 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v44 = (const char *)v22;
          _os_log_impl(&dword_21B042000, v36, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to connect to suggested device: %@", buf, 0xCu);
        }

        -[TVRUIRemoteViewController _selectDevice:withConnectionContext:](self, "_selectDevice:withConnectionContext:", v22, 3);
        goto LABEL_27;
      }
    }
    else
    {
LABEL_40:

    }
    _TVRUIIRLog();
    v37 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
      v38 = (char *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v44 = v38;
      _os_log_impl(&dword_21B042000, v37, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to connect to last selected device with id: %@", buf, 0xCu);

    }
    -[TVRUIRemoteViewController _connectToPreferredDeviceFromDeviceList:](self, "_connectToPreferredDeviceFromDeviceList:", v9);
  }
  else
  {
    _TVRUIViewControllerLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v34, OS_LOG_TYPE_DEFAULT, "Showing device picker after query threshold reached", buf, 2u);
    }

    -[TVRUIRemoteViewController _expandDeviceList](self, "_expandDeviceList");
  }
LABEL_28:

}

- (void)deviceBeganConnecting:(id)a3
{
  id v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v3, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "UI device callback - began connecting %@", (uint8_t *)&v6, 0xCu);

  }
}

- (void)deviceDidConnect:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  char v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v32 = v6;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "UI Device callback - did connect %@. Now messaging child view controllers", buf, 0xCu);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToDevice:", v4);

  if (v8)
  {
    -[TVRUIRemoteViewController deviceObservers](self, "deviceObservers");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = __46__TVRUIRemoteViewController_deviceDidConnect___block_invoke;
    v30[3] = &unk_24DE2D538;
    v30[4] = self;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v30);

    objc_msgSend(v4, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController setActiveDeviceIdentifier:](self, "setActiveDeviceIdentifier:", v10);

    _TVRUIViewControllerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "identifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v32 = v13;
      v33 = 2114;
      v34 = v15;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Active device did connect name: %{public}@ identifier: %{public}@", buf, 0x16u);

    }
  }
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v4, "isEqualToDevice:", v16);

  if (v17)
    -[TVRUIRemoteViewController setAuthenticatingDevice:](self, "setAuthenticatingDevice:", 0);
  -[TVRUIRemoteViewController deviceConnectionStatusDelegate](self, "deviceConnectionStatusDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "deviceDidConnect");

  if (-[TVRUIRemoteViewController shouldStartFindingSession](self, "shouldStartFindingSession"))
  {
    -[TVRUIRemoteViewController _startFindingSessionForDevice:](self, "_startFindingSessionForDevice:", v4);
    -[TVRUIRemoteViewController setShouldStartFindingSession:](self, "setShouldStartFindingSession:", 0);
  }
  -[TVRUIRemoteViewController _toggleControlAvailability](self, "_toggleControlAvailability");
  -[TVRUIRemoteViewController _hideMessageContent](self, "_hideMessageContent");
  -[TVRUIRemoteViewController _cancelShowConnectingSpinner](self, "_cancelShowConnectingSpinner");
  -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
  -[TVRUIRemoteViewController _stopDeviceQueryThresholdTimer](self, "_stopDeviceQueryThresholdTimer");
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", objc_msgSend(v19, "supportsVolumeControl"));

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v20, "supportsLaunchingApplications");

  if ((v21 & 1) == 0)
    -[TVRUIRemoteViewController _disableSearch](self, "_disableSearch");
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "supportsDonatingIntents");

  if (v23)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "identifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "name");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[TVRUIIntentManager donateIntentsForDeviceWithID:name:](TVRUIIntentManager, "donateIntentsForDeviceWithID:name:", v25, v27);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v28, "supportsTouchEvents"))
    goto LABEL_18;
  v29 = _AXSAppleTVRemoteUsesSimpleGestures();

  if (v29)
  {
    -[TVRUIRemoteViewController sessionData](self, "sessionData");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDirectionalControlsEnabled:", 1);
LABEL_18:

  }
  -[TVRUIRemoteViewController _enableTVRemoteOnLockscreen:](self, "_enableTVRemoteOnLockscreen:", 1);
  -[TVRUIRemoteViewController _layoutTouchpadExpanded:](self, "_layoutTouchpadExpanded:", 0);

}

uint64_t __46__TVRUIRemoteViewController_deviceDidConnect___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDevice:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 984));
}

- (void)deviceDidDisconnect:(id)a3 reason:(int64_t)a4 error:(id)a5
{
  id v8;
  id v9;
  BOOL v10;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  _BOOL4 v21;
  NSObject *v22;
  void *v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  uint8_t v30[8];
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  id v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  void *v42;
  uint64_t v43;

  v43 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = -[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable");
  _TVRUIViewControllerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v34 = v8;
      v35 = 2048;
      v36 = a4;
      v37 = 2114;
      v38 = v9;
      v39 = 2112;
      v40 = v13;
      v41 = 2112;
      v42 = v14;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Device disconnected - %@. Reason %ld. Error %{public}@. ActiveDevice %@, Auth Device %@", buf, 0x34u);

    }
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v8, "isEqualToDevice:", v15);

    if (v16)
    {
      _TVRUIViewControllerLog();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v17, OS_LOG_TYPE_DEFAULT, "Current device disconnected", buf, 2u);
      }

      -[TVRUIRemoteViewController _resetActiveDevice](self, "_resetActiveDevice");
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "resetSelectedDevice");

      -[TVRUIRemoteViewController siriManager](self, "siriManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "unregisterForSiriEvents");

      -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "isEqualToDevice:", v20))
      {
        v21 = -[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable");

        if (v21)
        {
          _TVRUIViewControllerLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_21B042000, v22, OS_LOG_TYPE_DEFAULT, "Authenticating device disconnected", buf, 2u);
          }

          -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "cancelAuthenitcationChallenge");

          -[TVRUIRemoteViewController setAuthenticatingDevice:](self, "setAuthenticatingDevice:", 0);
          -[TVRUIRemoteViewController _resetActiveDevice](self, "_resetActiveDevice");
        }
      }
      else
      {

      }
      objc_initWeak((id *)buf, self);
      v31[0] = MEMORY[0x24BDAC760];
      v31[1] = 3221225472;
      v31[2] = __62__TVRUIRemoteViewController_deviceDidDisconnect_reason_error___block_invoke;
      v31[3] = &unk_24DE2C4F8;
      objc_copyWeak(&v32, (id *)buf);
      -[TVRUIRemoteViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 1, v31);
      if (a4)
        v25 = v9 == 0;
      else
        v25 = 1;
      v24 = !v25;
      if (!v25)
      {
        -[TVRUIRemoteViewController _hideMessageContent](self, "_hideMessageContent");
        objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showConnectingSpinner, 0);
        _TVRUIViewControllerLog();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v30 = 0;
          _os_log_impl(&dword_21B042000, v26, OS_LOG_TYPE_DEFAULT, "Hiding existing message content and canceling connecting spinner selector", v30, 2u);
        }

        -[TVRUIRemoteViewController showMessageWithError:andDevice:](self, "showMessageWithError:andDevice:", v9, v8);
      }
      -[TVRUIRemoteViewController _toggleControlAvailability](self, "_toggleControlAvailability");
      -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", 0);
      objc_destroyWeak(&v32);
      objc_destroyWeak((id *)buf);
    }
    else
    {
      v24 = 0;
    }
    -[TVRUIRemoteViewController deviceConnectionStatusDelegate](self, "deviceConnectionStatusDelegate");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "deviceDidDisconnect");

    -[TVRUIRemoteViewController _cancelShowConnectingSpinner](self, "_cancelShowConnectingSpinner");
    -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
    if (v16)
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {

      }
      else if (((v24 | !-[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable")) & 1) == 0)
      {
        _TVRUIViewControllerLog();
        v29 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B042000, v29, OS_LOG_TYPE_DEFAULT, "Expanding picker since we got a disconnect message and no device is currently connected", buf, 2u);
        }

        -[TVRUIRemoteViewController _expandDeviceList](self, "_expandDeviceList");
      }
    }
  }
  else
  {
    if (v12)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Device disconnected but we are not connected to WiFi. Ignoring disconnection", buf, 2u);
    }

  }
}

void __62__TVRUIRemoteViewController_deviceDidDisconnect_reason_error___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  void *v3;
  _QWORD *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[139];
    WeakRetained[139] = 0;
    v4 = WeakRetained;

    v3 = (void *)v4[140];
    v4[140] = 0;

    WeakRetained = v4;
  }

}

- (void)device:(id)a3 beganTextEditingWithAttributes:(id)a4 initialText:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  NSObject *v16;
  void *v17;
  int v18;
  TVRUIRemoteViewController *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  v10 = a3;
  _TVRUIViewControllerLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController sharingClient](self, "sharingClient");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 138412802;
    v19 = self;
    v20 = 2112;
    v21 = v12;
    v22 = 2112;
    v23 = v13;
    _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "%@ RemoteViewCtrl received callback to present keyboard. Active Device %@. Sharing client %@", (uint8_t *)&v18, 0x20u);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v10, "isEqualToDevice:", v14);

  if (v15 && -[TVRUIRemoteViewController _shouldAllowKeyboardToBePresented](self, "_shouldAllowKeyboardToBePresented"))
  {
    if (-[TVRUIRemoteViewController isInReducedBacklightMode](self, "isInReducedBacklightMode"))
    {
      _TVRUIViewControllerLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v18) = 0;
        _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "undimming the screen", (uint8_t *)&v18, 2u);
      }

      SBSUndimScreen();
    }
    -[TVRUIRemoteViewController setEditingSessionActive:](self, "setEditingSessionActive:", 1);
    -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "showKeyboardButton");

    -[TVRUIRemoteViewController _presentKeyboardWithAttributes:initialText:](self, "_presentKeyboardWithAttributes:initialText:", v8, v9);
  }

}

- (void)device:(id)a3 endedTextEditingWithAttributes:(id)a4 endingText:(id)a5
{
  id v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412290;
    v12 = v6;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to end text editing for device %@", (uint8_t *)&v11, 0xCu);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqualToDevice:", v8);

  if (v9)
  {
    -[TVRUIRemoteViewController setEditingSessionActive:](self, "setEditingSessionActive:", 0);
    -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "hideKeyboardButton");

    -[TVRUIRemoteViewController dismissPresentedContentAnimated:completion:](self, "dismissPresentedContentAnimated:completion:", 1, 0);
  }

}

- (void)device:(id)a3 didUpdateText:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a4;
  v7 = a3;
  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to update text of local device text field", v13, 2u);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToDevice:", v9);

  if (v10)
  {
    -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setText:", v6);

    }
  }

}

- (void)device:(id)a3 didUpdateAttributes:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint8_t v13[16];

  v6 = a4;
  v7 = a3;
  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received callback to update keyboard attributes", v13, 2u);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqualToDevice:", v9);

  if (v10)
  {
    -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setKeyboardAttributes:", v6);

    }
  }

}

- (void)deviceDidEncounterAuthenticationChallenge:(id)a3 passwordType:(unint64_t)a4 passcode:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _TVRUIViewControllerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138412290;
    v17 = v8;
    _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "RemoteViewCtrl received authentication challenge for device %@", (uint8_t *)&v16, 0xCu);
  }

  -[TVRUIRemoteViewController setAuthenticatingDevice:](self, "setAuthenticatingDevice:", v8);
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setDevice:", v8);

  }
  -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
  switch(a4)
  {
    case 2uLL:
      _TVRUIViewControllerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_DEFAULT, "Challenge is legacy password type", (uint8_t *)&v16, 2u);
      }

      -[TVRUIRemoteViewController _presentLegacyPairingAlertWithCode:](self, "_presentLegacyPairingAlertWithCode:", v9);
      break;
    case 1uLL:
      _TVRUIViewControllerLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_21B042000, v15, OS_LOG_TYPE_DEFAULT, "Challenge is text password type", (uint8_t *)&v16, 2u);
      }

      -[TVRUIRemoteViewController _presentTextPasswordAlert](self, "_presentTextPasswordAlert");
      break;
    case 0uLL:
      _TVRUIViewControllerLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_21B042000, v13, OS_LOG_TYPE_DEFAULT, "Challenge is pin password type", (uint8_t *)&v16, 2u);
      }

      -[TVRUIRemoteViewController _presentPairingAlert](self, "_presentPairingAlert");
      break;
  }

}

- (void)device:(id)a3 didEncounterAuthenticationThrottle:(int64_t)a4
{
  -[TVRUIRemoteViewController _cancelShowConnectingSpinner](self, "_cancelShowConnectingSpinner", a3, a4);
  -[TVRUIRemoteViewController _cancelHideConnectingAndShowDevicePicker](self, "_cancelHideConnectingAndShowDevicePicker");
  -[TVRUIRemoteViewController showThrottleConnectMessage](self, "showThrottleConnectMessage");
}

- (void)device:(id)a3 needsMediaControls:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  _TVRUIButtonLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Device needs media controls", v7, 2u);
  }

  -[TVRUIRemoteViewController _enableMediaControls:animated:](self, "_enableMediaControls:animated:", 1, 1);
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaControlsAreVisible:", 1);

}

- (void)device:(id)a3 hidesMediaControls:(id)a4
{
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  _TVRUIButtonLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Device hides media controls", v7, 2u);
  }

  -[TVRUIRemoteViewController _enableMediaControls:animated:](self, "_enableMediaControls:animated:", 0, 1);
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMediaControlsAreVisible:", 0);

}

- (void)device:(id)a3 hasCaptionsEnabled:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  if ((objc_msgSend(a3, "supportsDirectCaptionQueries") & 1) == 0)
  {
    -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateCaptionState:buttonDisabled:", v4, 0);

  }
}

- (void)_enableMediaControls:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  unint64_t v23;
  void *v24;
  int v25;
  id v26;

  v4 = a3;
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", v4);

  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "availableButtons") & 4;

  v9 = v8;
  if (v4)
  {
    v10 = objc_msgSend(MEMORY[0x24BEB4088], "capellaEnabled");
    v11 = 9;
    if (!v10)
      v11 = 1;
    v12 = v11 | v8;
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "supportsCaptionsToggle");

    if (v14)
      v8 = v12 | 2;
    else
      v8 = v12;
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "supportsDirectCaptionQueries") & 1) != 0)
    {
      -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "nowPlayingInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "hasValidCaptionOptions");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (v18)
      {
        -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "nowPlayingInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "hasValidCaptionOptions");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "BOOLValue") ^ 1;

      }
      else
      {
        v22 = 1;
      }

      if (v22)
        v23 = v8 & 0xFFFFFFFFFFFFFFFDLL;
      else
        v23 = v8;
    }
    else
    {

      v23 = v8;
    }
    -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "capellaInfoAvailable");

    if (v25)
      v9 = v23;
    else
      v9 = v23 & 0xFFFFFFFFFFFFFFF7;
  }
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setAvailableButtons:enabledButtons:", v8, v9);

}

- (void)_updateInfoButtonState
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "nowPlayingInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "updateButton:enabled:", 8, objc_msgSend(v5, "capellaInfoAvailable"));

  }
}

- (void)device:(id)a3 hasGuideButtonEnabled:(BOOL)a4
{
  -[TVRUIRemoteViewController _enableLiveTVButtons:animated:](self, "_enableLiveTVButtons:animated:", a4, 1);
}

- (void)_enableLiveTVButtons:(BOOL)a3 animated:(BOOL)a4
{
  void *v6;
  unint64_t v7;
  _BOOL4 v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  void *v17;
  id v18;

  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "availableButtons");

  v8 = a3 || _AXSAppleTVRemoteForceLiveTVButtons() != 0;
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "availableButtons") & 0xFFFFFFFFFFFFFFFBLL;

  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "enabledButtons") & 0xFFFFFFFFFFFFFFFBLL;

  v13 = 4;
  if (!v8)
    v13 = 0;
  v14 = v10 | v13;
  v15 = v12 | v13;
  v16 = (v7 >> 3) & 1;
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAvailableButtons:enabledButtons:", v14, v15);

  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v18 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setMediaControlsAreVisible:", v16 | v8);

}

- (void)connectionServiceDidInvalidate:(id)a3
{
  NSObject *v4;
  _QWORD v5[5];
  id v6;
  id buf[2];

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Connection service invalidate notification received. Dispatching cleanup", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke;
  v5[3] = &unk_24DE2CD28;
  objc_copyWeak(&v6, buf);
  v5[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(buf);
}

void __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained[123])
    objc_msgSend(WeakRetained, "_resetActiveDevice");
  if (v3[124])
  {
    +[TVRUIDeviceFactory deviceWithIdentifier:](TVRUIDeviceFactory, "deviceWithIdentifier:");
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = (void *)v3[123];
    v3[123] = v4;

  }
  v6 = (void *)v3[126];
  if (v6)
  {
    objc_msgSend(v6, "stop");
    v7 = (void *)v3[126];
    v3[126] = 0;

    objc_msgSend(v3, "devicePickerViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDevices:", MEMORY[0x24BDBD1A8]);

    if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
    {
      objc_msgSend(v3, "devicePickerViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setSuggestedDevices:", MEMORY[0x24BDBD1A8]);

    }
    +[TVRUIDeviceQuery deviceQuery](TVRUIDeviceQuery, "deviceQuery");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v3[126];
    v3[126] = v10;

    v12 = (void *)v3[126];
    v13 = *(_QWORD *)(a1 + 32);
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke_2;
    v15[3] = &unk_24DE2D4F0;
    v15[4] = v3;
    objc_msgSend(v12, "startQuery:completionHandler:", v13, v15);
  }
  v14 = v3[123];
  if (v14)
    objc_msgSend(v3, "_connectToDevice:connectionContext:", v14, 0);

}

uint64_t __60__TVRUIRemoteViewController_connectionServiceDidInvalidate___block_invoke_2(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_startDeviceQueryThresholdTimer");
  return result;
}

- (void)deviceListUpdated:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  NSObject *v9;
  _QWORD v10[5];
  uint8_t buf[4];
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Device list updated: %{public}@", buf, 0xCu);
  }

  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDevices:", v4);

  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isDevicePickerShowing");

  if (v8)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __47__TVRUIRemoteViewController_deviceListUpdated___block_invoke;
    v10[3] = &unk_24DE2C198;
    v10[4] = self;
    objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v10, 0.15);
  }
  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
  {
    if (-[TVRUIRemoteViewController deviceQueryThresholdReached](self, "deviceQueryThresholdReached"))
    {
      _TVRUIViewControllerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Query threshold reached. Attempting to the most relevant device from the updated device list", buf, 2u);
      }

      -[TVRUIRemoteViewController _connectToMostRelevantDevice](self, "_connectToMostRelevantDevice");
    }
  }
  else
  {
    -[TVRUIRemoteViewController _connectToPreferredDeviceFromDeviceList:](self, "_connectToPreferredDeviceFromDeviceList:", v4);
  }

}

void __47__TVRUIRemoteViewController_deviceListUpdated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_layoutTouchpadExpanded:", 1);
  objc_msgSend(*(id *)(a1 + 32), "devicePickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_updateTableFrame:", 1);

}

- (void)_connectToPreferredDeviceFromDeviceList:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7
      || (-[TVRUIRemoteViewController activeDeviceIdentifier](self, "activeDeviceIdentifier"),
          (v7 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {

LABEL_5:
      goto LABEL_6;
    }
    v8 = objc_msgSend(v4, "count");

    if (!v8)
      goto LABEL_6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v4;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier", (_QWORD)v25);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = objc_msgSend(v14, "hasIdentifier:", v15);

          if (v16)
          {
            _TVRUIViewControllerLog();
            v17 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v30 = v14;
              _os_log_impl(&dword_21B042000, v17, OS_LOG_TYPE_DEFAULT, "Connecting to last selected device: %@", buf, 0xCu);
            }

            -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", v14);
            _TVRUIViewControllerLog();
            v18 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
            {
              -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v30 = v19;
              _os_log_impl(&dword_21B042000, v18, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", buf, 0xCu);

            }
            -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[TVRUIRemoteViewController setActiveDeviceIdentifier:](self, "setActiveDeviceIdentifier:", v20);

            -[TVRUIRemoteViewController _connectToDevice:connectionContext:](self, "_connectToDevice:connectionContext:", v14, 3);
            goto LABEL_22;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v11)
          continue;
        break;
      }
    }
LABEL_22:

    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    _TVRUIViewControllerLog();
    v22 = objc_claimAutoreleasedReturnValue();
    v6 = v22;
    if (v21)
    {
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        -[TVRUIRemoteViewController preferredDeviceIdentifier](self, "preferredDeviceIdentifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v30 = v23;
        _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "Found preferred device to connect for id %{public}@", buf, 0xCu);

      }
      goto LABEL_5;
    }
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[TVRUIRemoteViewController _connectToPreferredDeviceFromDeviceList:].cold.1(self, v6);

    _TVRUIViewControllerLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v24, OS_LOG_TYPE_DEFAULT, "Showing device picker as no preferred device was found", buf, 2u);
    }

    -[TVRUIRemoteViewController _expandDeviceList](self, "_expandDeviceList");
  }
LABEL_6:

}

- (void)suggestedDevices:(id)a3
{
  id v4;
  NSObject *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  uint8_t buf[4];
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIIRLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Suggested devices %{public}@", buf, 0xCu);
  }

  if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
  {
    objc_initWeak((id *)buf, self);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __46__TVRUIRemoteViewController_suggestedDevices___block_invoke;
    v6[3] = &unk_24DE2CD28;
    objc_copyWeak(&v8, (id *)buf);
    v7 = v4;
    dispatch_async(MEMORY[0x24BDAC9B8], v6);

    objc_destroyWeak(&v8);
    objc_destroyWeak((id *)buf);
  }

}

void __46__TVRUIRemoteViewController_suggestedDevices___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  NSObject *v26;
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      _TVRUIIRLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v3, "activeDevice");
        v6 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v26 = v6;
        _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Skipping auto select because a device is already active %{public}@", buf, 0xCu);
LABEL_19:

      }
    }
    else
    {
      if (!objc_msgSend(*(id *)(a1 + 32), "count"))
      {
        _TVRUIIRLog();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "No suggested devices, attempting to connect to last selected TV", buf, 2u);
        }

        objc_msgSend(v3, "devicePickerViewController");
        v5 = objc_claimAutoreleasedReturnValue();
        -[NSObject devices](v5, "devices");
        v6 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_connectToPreferredDeviceFromDeviceList:", v6);
        goto LABEL_19;
      }
      objc_msgSend(v3, "devicePickerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "suggestedDevices");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "count");

      if (v9)
      {
LABEL_21:
        v17 = *(_QWORD *)(a1 + 32);
        objc_msgSend(v3, "devicePickerViewController", (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setSuggestedDevices:", v17);

        goto LABEL_22;
      }
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v10 = *(id *)(a1 + 32);
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v21;
LABEL_9:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v21 != v13)
            objc_enumerationMutation(v10);
          v15 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v14);
          if (objc_msgSend(v15, "classification", (_QWORD)v20) == 1)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
            if (v12)
              goto LABEL_9;
            goto LABEL_15;
          }
        }
        v5 = v15;

        if (!v5)
          goto LABEL_27;
        _TVRUIIRLog();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v5;
          _os_log_impl(&dword_21B042000, v19, OS_LOG_TYPE_DEFAULT, "Auto selecting %{public}@", buf, 0xCu);
        }

        objc_msgSend(v3, "_selectDevice:withConnectionContext:", v5, 3);
      }
      else
      {
LABEL_15:

LABEL_27:
        _TVRUIIRLog();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "No devices were classified as AutoPick", buf, 2u);
        }
      }
    }

    goto LABEL_21;
  }
LABEL_22:

}

- (void)_selectDevice:(id)a3 withConnectionContext:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController _stringForConnectionContext:](self, "_stringForConnectionContext:", a4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v8;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Selecting device: %{public}@ with connectionContext: %{public}@", (uint8_t *)&v16, 0x16u);

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
    -[TVRUIRemoteViewController _disconnectUserInitiatedAndModifyLockscreenAssertion:](self, "_disconnectUserInitiatedAndModifyLockscreenAssertion:", a4 != 1);
  -[TVRUIRemoteViewController setActiveDevice:](self, "setActiveDevice:", v6);
  _TVRUIViewControllerLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v11;
    _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Updated active device to: %{public}@", (uint8_t *)&v16, 0xCu);

  }
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "transitonToViewForDeviceType:", 0);

  objc_msgSend(v6, "identifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController setActiveDeviceIdentifier:](self, "setActiveDeviceIdentifier:", v13);

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setDelegate:", self);

  -[TVRUIRemoteViewController _connectToDevice:connectionContext:](self, "_connectToDevice:connectionContext:", v6, a4);
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "collapseDeviceList");

}

- (void)devicePicked:(id)a3
{
  -[TVRUIRemoteViewController _selectDevice:withConnectionContext:](self, "_selectDevice:withConnectionContext:", a3, 1);
}

- (void)devicePickerWillChangeState:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  double v6;
  void *v7;
  void *v8;
  void *v9;

  if (a4)
  {
    v4 = a3;
    v6 = 1.0;
    if (a3)
    {
      -[TVRUIRemoteViewController delegate](self, "delegate");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "devicePickerWillExpand");

      v6 = 0.0;
    }
    -[TVRUIRemoteViewController messageView](self, "messageView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAlpha:", v6);

    -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setShowControls:", v4 ^ 1);

    -[TVRUIRemoteViewController _layoutTouchpadExpanded:](self, "_layoutTouchpadExpanded:", v4);
  }
}

- (void)devicePickerTitleWasLongPressedForDevice:(id)a3
{
  id v3;

  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayUpNext");

}

- (void)_showBluetoothDisabledAlertWithCompletion:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  _BOOL4 supportsSiri;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[4];
  id v28;

  v24 = a3;
  v4 = (void *)MEMORY[0x24BEBD3B0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIBluetoothAlertTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  supportsSiri = self->_supportsSiri;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (supportsSiri)
    v10 = CFSTR("TVRemoteUIBluetoothAlertSiriRemoteSubtitle");
  else
    v10 = CFSTR("TVRemoteUIBluetoothAlertAppleTVRemoteSubtitle");
  objc_msgSend(v8, "localizedStringForKey:value:table:", v10, &stru_24DE30718, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v6, v11, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIBluetoothAlertDefaultButtonTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x24BDAC760];
  v27[0] = MEMORY[0x24BDAC760];
  v27[1] = 3221225472;
  v27[2] = __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke;
  v27[3] = &unk_24DE2D560;
  v17 = v24;
  v28 = v17;
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 0, v27);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v18);

  v19 = (void *)MEMORY[0x24BEBD3A8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIBluetoothAlertAlternateButtonTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v16;
  v25[1] = 3221225472;
  v25[2] = __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke_2;
  v25[3] = &unk_24DE2D560;
  v26 = v17;
  v22 = v17;
  objc_msgSend(v19, "actionWithTitle:style:handler:", v21, 0, v25);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addAction:", v23);

  -[TVRUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v12, 1, 0);
}

uint64_t __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __71__TVRUIRemoteViewController__showBluetoothDisabledAlertWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_turnOnBluetoothIfNeededWithCompletionBlock:(id)a3
{
  void (**v4)(id, uint64_t, _QWORD);
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  char v9;
  _QWORD v10[4];
  id v11;
  void (**v12)(id, uint64_t, _QWORD);
  uint8_t buf[4];
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, uint64_t, _QWORD))a3;
  -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cbController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v14 = objc_msgSend(v6, "bluetoothState");
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth State: %ld", buf, 0xCu);
  }

  -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isBluetoothAvailable");

  if ((v9 & 1) != 0)
  {
    v4[2](v4, 1, 0);
  }
  else
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke;
    v10[3] = &unk_24DE2D220;
    v11 = v6;
    v12 = v4;
    -[TVRUIRemoteViewController _showBluetoothDisabledAlertWithCompletion:](self, "_showBluetoothDisabledAlertWithCompletion:", v10);

  }
}

void __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke(uint64_t a1, int a2)
{
  void *v2;
  _QWORD v3[4];
  id v4;

  if (a2)
  {
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_2;
    v3[3] = &unk_24DE2D5B0;
    v2 = *(void **)(a1 + 32);
    v4 = *(id *)(a1 + 40);
    objc_msgSend(v2, "setPowerState:completion:", 5, v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  BOOL v9;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_3;
  block[3] = &unk_24DE2D588;
  v4 = *(id *)(a1 + 32);
  v9 = v3 == 0;
  v7 = v3;
  v8 = v4;
  v5 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __73__TVRUIRemoteViewController__turnOnBluetoothIfNeededWithCompletionBlock___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), *(_QWORD *)(a1 + 32));
}

- (void)_presentKeyboardWithAttributes:(id)a3 initialText:(id)a4
{
  id v6;
  id v7;
  _BOOL4 v8;
  TVRAlertController *v9;
  _BOOL4 v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  const __CFString *v16;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = -[TVRUIRemoteViewController _shouldAllowKeyboardToBePresented](self, "_shouldAllowKeyboardToBePresented");
  _TVRUIKeyboardLog();
  v9 = (TVRAlertController *)objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(&v9->super.super.super, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v11)
        v12 = CFSTR("true");
      else
        v12 = CFSTR("false");
      v17 = 138543618;
      v18 = (void *)v12;
      v19 = 1024;
      LODWORD(v20) = -[TVRUIRemoteViewController isSiriSessionActive](self, "isSiriSessionActive");
      _os_log_impl(&dword_21B042000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Keyboard presentation allowed activeDevice: %{public}@, siriSessionActive: %{BOOL}d", (uint8_t *)&v17, 0x12u);

    }
    v9 = -[TVRAlertController initWithKeyboardAttributes:]([TVRAlertController alloc], "initWithKeyboardAttributes:", v6);
    -[TVRAlertController setDelegate:](v9, "setDelegate:", self);
    -[TVRAlertController setText:](v9, "setText:", v7);
    -[TVRAlertController enableDictationButton:](v9, "enableDictationButton:", -[TVRUIDevice supportsSiri](self->_activeDevice, "supportsSiri"));
    -[TVRKeyboardHaptic play](self->_keyboardHaptic, "play");
    -[TVRUIRemoteViewController setKeyboardController:](self, "setKeyboardController:", v9);
    -[TVRUIRemoteViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
    -[TVRUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
    if ((-[TVRUIDevice isLegacyAppleTV](self->_activeDevice, "isLegacyAppleTV") & 1) == 0)
    {
      -[TVRUIRemoteViewController sessionData](self, "sessionData");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setUsedRTI:", 1);

    }
    _TVRUIKeyboardLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      -[TVRUIRemoteViewController presentedViewController](self, "presentedViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v15;
      _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_DEFAULT, "presented keyboard controller %@ %@", (uint8_t *)&v17, 0x16u);

    }
    goto LABEL_16;
  }
  if (v10)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
      v16 = CFSTR("true");
    else
      v16 = CFSTR("false");
    v17 = 138543618;
    v18 = (void *)v16;
    v19 = 1024;
    LODWORD(v20) = -[TVRUIRemoteViewController isSiriSessionActive](self, "isSiriSessionActive");
    _os_log_impl(&dword_21B042000, &v9->super.super.super, OS_LOG_TYPE_DEFAULT, "Keyboard presentation suppressed activeDevice: %{public}@, siriSessionActive: %{BOOL}d", (uint8_t *)&v17, 0x12u);
LABEL_16:

  }
}

- (void)_presentTextPasswordAlert
{
  TVRAlertController *v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v3 = [TVRAlertController alloc];
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textForPairingPasswordAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRAlertController initForTextPasswordType:](v3, "initForTextPasswordType:", v5);

  objc_msgSend(v6, "setDelegate:", self);
  objc_msgSend(v6, "setText:", &stru_24DE30718);
  -[TVRKeyboardHaptic play](self->_keyboardHaptic, "play");
  -[TVRUIRemoteViewController setAuthenticationAlertController:](self, "setAuthenticationAlertController:", v6);
  -[TVRUIRemoteViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[TVRUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  _TVRUIKeyboardLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Presented keyboard controller for alphanumeric pin", v8, 2u);
  }

}

- (void)_presentPairingAlert
{
  TVRAlertController *v3;
  void *v4;
  void *v5;
  TVRAlertController *v6;
  void *v7;
  NSObject *v8;
  uint8_t v9[16];

  v3 = [TVRAlertController alloc];
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "textForPairingAlert");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[TVRAlertController initWithTitle:passcodeSize:](v3, "initWithTitle:passcodeSize:", v5, 4);

  -[TVRAlertController setDelegate:](v6, "setDelegate:", self);
  -[TVRUIRemoteViewController setAuthenticationAlertController:](self, "setAuthenticationAlertController:", v6);
  -[TVRUIRemoteViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[TVRUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);
  -[TVRUIRemoteViewController sessionData](self, "sessionData");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRequiredPairing:", 1);

  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Presented controller for pin", v9, 2u);
  }

}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  objc_msgSend(MEMORY[0x24BEBD3B0], "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BEBD3A8];
  -[TVRUIRemoteViewController styleProvider](self, "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "textForDeviceLockoutAlert");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "actionWithTitle:style:handler:", v7, 1, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addAction:", v8);

  -[TVRUIRemoteViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
}

- (void)_cancelPairing
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412290;
    v12 = v4;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "User requested to cancel pairing for authentication device %@", (uint8_t *)&v11, 0xCu);

  }
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelAuthenitcationChallenge");

    -[TVRUIRemoteViewController setAuthenticatingDevice:](self, "setAuthenticatingDevice:", 0);
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "name");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setTitle:", v10);

    }
    else
    {
      -[TVRUIRemoteViewController _expandDeviceList](self, "_expandDeviceList");
    }
  }
}

- (BOOL)hasPresentedContent
{
  void *v3;
  BOOL v4;
  void *v5;

  -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[TVRUIRemoteViewController authenticationAlertController](self, "authenticationAlertController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)dismissPresentedContentAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  NSObject *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  const char *v11;
  uint8_t *v12;
  void *v13;
  __int16 v14;
  __int16 v15;
  uint8_t buf[16];

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Attempting to dismiss any presented content", buf, 2u);
  }

  -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v4, v6);
    -[TVRUIRemoteViewController setKeyboardController:](self, "setKeyboardController:", 0);
    _TVRUIKeyboardLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 0;
      v11 = "Dismissed presented keyboard controller";
      v12 = (uint8_t *)&v15;
LABEL_9:
      _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, v11, v12, 2u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  -[TVRUIRemoteViewController authenticationAlertController](self, "authenticationAlertController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    -[TVRUIRemoteViewController authenticationAlertController](self, "authenticationAlertController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissViewControllerAnimated:completion:", v4, v6);
    -[TVRUIRemoteViewController setAuthenticationAlertController:](self, "setAuthenticationAlertController:", 0);
    -[TVRUIRemoteViewController _cancelPairing](self, "_cancelPairing");
    _TVRUIViewControllerLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v11 = "Dismissed presented authentication controller";
      v12 = (uint8_t *)&v14;
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (v6)
    v6[2](v6);
LABEL_11:

}

- (void)alertController:(id)a3 enteredText:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7 && !objc_msgSend(v12, "type"))
  {
    v10 = objc_msgSend(v6, "length");

    if (v10 == 4)
    {
      -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "sendAuthenticationCode:", v6);

      objc_msgSend(v12, "dismissViewControllerAnimated:completion:", 1, 0);
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && v8)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sendText:", v6);

  }
LABEL_9:

}

- (void)alertController:(id)a3 generatedTextInputPayload:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sendTextInputPayload:", v5);

}

- (void)alertControllerPressedDictationButton:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendButtonEvent:", v9);

    -[TVRUIRemoteViewController _performSiriEffectsWithButtonEvent:](self, "_performSiriEffectsWithButtonEvent:", v9);
  }
  else
  {
    _TVRUIKeyboardLog();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[TVRUIRemoteViewController alertControllerPressedDictationButton:].cold.1(v6, v7, v8);

  }
}

- (void)alertControllerReleasedDictationButton:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 4);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendButtonEvent:", v6);

    -[TVRUIRemoteViewController _performSiriEffectsWithButtonEvent:](self, "_performSiriEffectsWithButtonEvent:", v6);
  }
}

- (void)alertControllerHitKeyboardReturnKey:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t buf[16];

  v4 = a3;
  -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    v7 = objc_msgSend(v4, "type");

    if (v7 == 2)
    {
      _TVRUIKeyboardLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "User entered text password", buf, 2u);
      }

      objc_msgSend(v4, "text");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "text");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "sendAuthenticationCode:", v12);

        objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, 0);
        goto LABEL_13;
      }
      _TVRUIKeyboardLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_21B042000, v16, OS_LOG_TYPE_DEFAULT, "User entered password of zero length", v17, 2u);
      }
LABEL_12:

      goto LABEL_13;
    }
  }
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    v15 = objc_msgSend(v4, "type");

    if (v15 == 1)
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v16 = objc_claimAutoreleasedReturnValue();
      -[NSObject sendReturnKey](v16, "sendReturnKey");
      goto LABEL_12;
    }
  }
LABEL_13:

}

- (void)alertControllerCancelled:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if (!objc_msgSend(v8, "type") || objc_msgSend(v8, "type") == 2)
  {
    -[TVRUIRemoteViewController authenticatingDevice](self, "authenticatingDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
      -[TVRUIRemoteViewController _cancelPairing](self, "_cancelPairing");
  }
  -[TVRUIRemoteViewController keyboardController](self, "keyboardController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v8)
  {
    -[TVRUIRemoteViewController setKeyboardController:](self, "setKeyboardController:", 0);
    goto LABEL_9;
  }
  -[TVRUIRemoteViewController authenticationAlertController](self, "authenticationAlertController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v6 == v8)
  {
    -[TVRUIRemoteViewController setAuthenticationAlertController:](self, "setAuthenticationAlertController:", 0);
LABEL_9:
    v7 = v8;
  }

}

- (void)wifiStateDidUpdate:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  uint64_t v7;
  void *v8;
  void *v9;
  char v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  char v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  _QWORD v36[5];
  uint8_t buf[16];

  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 == 2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Network observer reported network is reachable", buf, 2u);
    }

    -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
    v7 = objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = (void *)v7;
      -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "hasStarted");

      if ((v10 & 1) == 0)
      {
        _TVRUIViewControllerLog();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Network is reachable. Requesting restarting query.", buf, 2u);
        }

        -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = __48__TVRUIRemoteViewController_wifiStateDidUpdate___block_invoke;
        v36[3] = &unk_24DE2D4F0;
        v36[4] = self;
        objc_msgSend(v12, "startQuery:completionHandler:", self, v36);

        -[TVRUIRemoteViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__showSearchingSpinnerIfNeeded, 0, 2.0);
      }
    }
    -[TVRUIRemoteViewController clearMessageContent](self, "clearMessageContent");
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v13 = objc_claimAutoreleasedReturnValue();
    if (!v13)
      goto LABEL_33;
    v14 = (void *)v13;
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "isConnected"))
    {

    }
    else
    {
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = objc_msgSend(v29, "isConnecting");

      if ((v30 & 1) != 0)
        goto LABEL_33;
      _TVRUIViewControllerLog();
      v31 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v31, OS_LOG_TYPE_DEFAULT, "Network is reachable. We have an active disconnected device. Requesting connect", buf, 2u);
      }

      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController _connectToDevice:connectionContext:](self, "_connectToDevice:connectionContext:", v14, 0);
    }

LABEL_33:
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (v32)
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "view");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "setHidden:", 0);

      _TVRUIViewControllerLog();
      v35 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v35, OS_LOG_TYPE_DEFAULT, "Network available. Making device picker button visible.", buf, 2u);
      }

    }
    goto LABEL_37;
  }
  if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Network observer reported network unreachable", buf, 2u);
  }

  -[TVRUIRemoteViewController _resetActiveDevice](self, "_resetActiveDevice");
  -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    _TVRUIViewControllerLog();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v17, OS_LOG_TYPE_DEFAULT, "No network. Stopping device query.", buf, 2u);
    }

    -[TVRUIRemoteViewController deviceQuery](self, "deviceQuery");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stop");

    -[TVRUIRemoteViewController _stopDeviceQueryThresholdTimer](self, "_stopDeviceQueryThresholdTimer");
  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "collapseDeviceList");

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "resetSelectedDevice");

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setDevices:", MEMORY[0x24BDBD1A8]);

    if (+[TVRUIFeatures corianderEnabled](TVRUIFeatures, "corianderEnabled"))
    {
      -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setSuggestedDevices:", MEMORY[0x24BDBD1A8]);

    }
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setHidden:", 1);

    _TVRUIViewControllerLog();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v26, OS_LOG_TYPE_DEFAULT, "No network. Collapsed device picker and hid it.", buf, 2u);
    }

  }
  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setEnabled:", 0);

  -[TVRUIRemoteViewController topButtonPanelViewController](self, "topButtonPanelViewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setEnabled:", 0);

  if (a3)
  {
    if (a3 == 1)
      -[TVRUIRemoteViewController showNoAssociatedNetworkMessage](self, "showNoAssociatedNetworkMessage");
  }
  else
  {
    -[TVRUIRemoteViewController showNoWIFIConnectionMessage](self, "showNoWIFIConnectionMessage");
  }
LABEL_37:
  -[TVRUIRemoteViewController setNetworkReachable:](self, "setNetworkReachable:", a3 == 2);
}

uint64_t __48__TVRUIRemoteViewController_wifiStateDidUpdate___block_invoke(uint64_t result, int a2)
{
  if (a2)
    return objc_msgSend(*(id *)(result + 32), "_startDeviceQueryThresholdTimer");
  return result;
}

- (void)bluetoothAvailabilityDidUpdate:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is enabled", buf, 2u);
    }

  }
  else
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Bluetooth is disabled", buf, 2u);
    }

    -[TVRUIRemoteViewController findingSession](self, "findingSession");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFindingSessionActive");

    if (v8)
    {
      _TVRUIViewControllerLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Bluetooth was disabled in the middle of a finding session. Attemping to restart the finding session", buf, 2u);
      }

      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[TVRUIRemoteViewController _stopFindingSessionForDevice:](self, "_stopFindingSessionForDevice:", v10);

      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __60__TVRUIRemoteViewController_bluetoothAvailabilityDidUpdate___block_invoke;
      block[3] = &unk_24DE2C198;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __60__TVRUIRemoteViewController_bluetoothAvailabilityDidUpdate___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "activeDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_startFindingSessionForDevice:", v2);

}

- (void)_setupNetworkObserverIfNeeded
{
  void *v3;
  TVRUINetworkObserver *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  id location;

  -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc_init(TVRUINetworkObserver);
    -[TVRUIRemoteViewController setNetworkObserver:](self, "setNetworkObserver:", v4);

    v5 = MEMORY[0x24BDAC760];
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke;
    v11[3] = &unk_24DE2CE08;
    objc_copyWeak(&v12, &location);
    -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWifiStateUpdatedHandler:", v11);

    v9[0] = v5;
    v9[1] = 3221225472;
    v9[2] = __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke_143;
    v9[3] = &unk_24DE2D4C8;
    objc_copyWeak(&v10, &location);
    -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setBluetoothAvailabilityDidUpdate:", v9);

    -[TVRUIRemoteViewController networkObserver](self, "networkObserver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startObserving");

    objc_destroyWeak(&v10);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
}

void __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  void *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRUIViewControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(WeakRetained, "networkObserver");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 134218240;
      v7 = a2;
      v8 = 1024;
      v9 = objc_msgSend(v5, "isNetworkReachable");
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Network observer reported reachability update, state=%ld, reachable=%d", (uint8_t *)&v6, 0x12u);

    }
    objc_msgSend(WeakRetained, "wifiStateDidUpdate:", a2);
  }

}

void __58__TVRUIRemoteViewController__setupNetworkObserverIfNeeded__block_invoke_143(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  NSObject *v4;
  _DWORD v5[2];
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    _TVRUIViewControllerLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5[0] = 67109120;
      v5[1] = a2;
      _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Network observer reported bluetooth availability update, available=%d", (uint8_t *)v5, 8u);
    }

    objc_msgSend(WeakRetained, "bluetoothAvailabilityDidUpdate:", a2);
  }

}

- (void)showMessageWithError:(id)a3 andDevice:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke;
  block[3] = &unk_24DE2C8C8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMessageWithError:device:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

  v4 = dispatch_time(0, 3000000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke_2;
  block[3] = &unk_24DE2C198;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

void __60__TVRUIRemoteViewController_showMessageWithError_andDevice___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_hideMessageContent");
  objc_msgSend(*(id *)(a1 + 32), "devicePickerViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expandDeviceList");

}

- (void)showMessageWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __58__TVRUIRemoteViewController_showMessageWithTitle_message___block_invoke;
  block[3] = &unk_24DE2C8C8;
  block[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __58__TVRUIRemoteViewController_showMessageWithTitle_message___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMessageWithTitle:message:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));

}

- (void)showMessageWithTitle:(id)a3 message:(id)a4 titleFont:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD v14[5];
  id v15;
  id v16;
  id v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __68__TVRUIRemoteViewController_showMessageWithTitle_message_titleFont___block_invoke;
  v14[3] = &unk_24DE2D5D8;
  v14[4] = self;
  v15 = v8;
  v16 = v9;
  v17 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  dispatch_async(MEMORY[0x24BDAC9B8], v14);

}

void __68__TVRUIRemoteViewController_showMessageWithTitle_message_titleFont___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showMessageWithTitle:message:titleFont:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

}

- (void)showPairingMessageWithCode:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __56__TVRUIRemoteViewController_showPairingMessageWithCode___block_invoke;
  v6[3] = &unk_24DE2C830;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

void __56__TVRUIRemoteViewController_showPairingMessageWithCode___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showPairingMessageWithCode:", *(_QWORD *)(a1 + 40));

}

- (void)showNoAssociatedNetworkMessage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __59__TVRUIRemoteViewController_showNoAssociatedNetworkMessage__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __59__TVRUIRemoteViewController_showNoAssociatedNetworkMessage__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showNoAssociatedNetworkMessage");

}

- (void)showNoWIFIConnectionMessage
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __56__TVRUIRemoteViewController_showNoWIFIConnectionMessage__block_invoke;
  block[3] = &unk_24DE2C198;
  block[4] = self;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __56__TVRUIRemoteViewController_showNoWIFIConnectionMessage__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "touchpadViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setShowControls:", 0);

  objc_msgSend(*(id *)(a1 + 32), "messageView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "showNoWIFIConnectionMessage");

}

- (void)showThrottleConnectMessage
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingLockoutTitle"), &stru_24DE30718, CFSTR("Localizable"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIPairingLockoutMessage"), &stru_24DE30718, CFSTR("Localizable"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVRUIRemoteViewController showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v6, v5);
}

- (void)showGenericUnableToConnectMessage
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIConnectionErrorTitleTV"), &stru_24DE30718, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController showMessageWithTitle:message:](self, "showMessageWithTitle:message:", v3, &stru_24DE30718);

}

- (void)showLoadingSpinner
{
  void *v3;

  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowControls:", 0);

  -[TVRMessageView showLoadingSpinner](self->_messageView, "showLoadingSpinner");
}

- (void)showSearchingSpinner
{
  void *v3;
  id v4;

  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setShowControls:", 0);

  -[TVRMessageView showSearchingSpinner](self->_messageView, "showSearchingSpinner");
  objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logSearchingSpinnerShown");

}

- (void)clearMessageContent
{
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v5 = 136315138;
    v6 = "-[TVRUIRemoteViewController clearMessageContent]";
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v5, 0xCu);
  }

  -[TVRMessageView clearContent](self->_messageView, "clearContent");
  -[TVRUIRemoteViewController touchpadViewController](self, "touchpadViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setShowControls:", 1);

}

- (void)_showConnectingSpinner
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  if (-[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable"))
  {
    _TVRUIViewControllerLog();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Showing connecting spinner", v8, 2u);
    }

    -[TVRUIRemoteViewController showLoadingSpinner](self, "showLoadingSpinner");
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "isLegacyAppleTV");

    -[TVRUIRemoteViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel__hideConnectingAndShowDevicePicker, 0, 10.0);
    objc_msgSend(MEMORY[0x24BEB4060], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "deviceContextInformation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "logConnectingSpinnerShown:", v7);

  }
}

- (void)_cancelShowConnectingSpinner
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showConnectingSpinner, 0);
}

- (void)_hideConnectingAndShowDevicePicker
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138412290;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_21B042000, a2, v4, "Disconnecting device %@ due to connection timeout", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)_cancelHideConnectingAndShowDevicePicker
{
  NSObject *v2;
  uint8_t v3[16];

  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__hideConnectingAndShowDevicePicker, 0);
  _TVRUIViewControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Cancelled showdevicepicker selector", v3, 2u);
  }

}

- (void)_showSearchingSpinnerIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;

  if (-[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable"))
  {
    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "devices");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (!v5)
    {
      -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setEnabled:", 0);

      -[TVRUIRemoteViewController showSearchingSpinner](self, "showSearchingSpinner");
    }
  }
}

- (void)_hideMessageContent
{
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showConnectingSpinner, 0);
  objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel__showSearchingSpinnerIfNeeded, 0);
  -[TVRUIRemoteViewController clearMessageContent](self, "clearMessageContent");
}

- (void)generatedButtonEvent:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  const __CFString *v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (objc_msgSend(v4, "buttonType") != 9999)
    {
      v7 = objc_msgSend(v4, "buttonType");
      -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v7 == 9992)
      {
        v10 = objc_msgSend(v8, "isModernAppleTV");

        if (!v10)
          goto LABEL_21;
        -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "infoButtonWasTapped");
      }
      else
      {
        objc_msgSend(v8, "sendButtonEvent:", v4);

        _TVRUIButtonLog();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315394;
          v16 = "-[TVRUIRemoteViewController generatedButtonEvent:]";
          v17 = 2114;
          v18 = v4;
          _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "%s, event=%{public}@", (uint8_t *)&v15, 0x16u);
        }

        switch(objc_msgSend(v4, "buttonType"))
        {
          case 2:
          case 3:
            -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "collapseChannelButton");
            goto LABEL_20;
          case 4:
            -[TVRUIRemoteViewController _performSiriEffectsWithButtonEvent:](self, "_performSiriEffectsWithButtonEvent:", v4);
            goto LABEL_21;
          case 10:
            if (objc_msgSend(v4, "eventType") != 1)
              goto LABEL_21;
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v13;
            v14 = CFSTR("TVRUIVolumeUpEventGenerated");
            break;
          case 11:
            if (objc_msgSend(v4, "eventType") != 1)
              goto LABEL_21;
            objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            v11 = v13;
            v14 = CFSTR("TVRUIVolumeDownEventGenerated");
            break;
          default:
            goto LABEL_21;
        }
        objc_msgSend(v13, "postNotificationName:object:", v14, 0);
      }
LABEL_20:

      goto LABEL_21;
    }
    if (objc_msgSend(v4, "eventType") == 2)
    {
      _TVRUIButtonLog();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "generatedButtonEvent [TVRUIButtonTypeKeyboard, TVRUIButtonEventTypeReleased]", (uint8_t *)&v15, 2u);
      }

      -[TVRUIRemoteViewController keyboardRequested](self, "keyboardRequested");
    }
  }
LABEL_21:

}

- (void)generatedTouchEvent:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendTouchEvent:", v6);

  }
}

- (void)keyboardRequested
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  _TVRUIKeyboardLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Keyboard was requested", v9, 2u);
  }

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyboardAttributes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "currentText");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController _presentKeyboardWithAttributes:initialText:](self, "_presentKeyboardWithAttributes:initialText:", v6, v8);

  }
}

- (void)_performSiriEffectsWithButtonEvent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  TVRUIRemoteViewController *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    _TVRUIButtonLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[TVRUIRemoteViewController _performSiriEffectsWithButtonEvent:].cold.1(v10);
    goto LABEL_11;
  }
  if (objc_msgSend(v4, "buttonType") != 4)
    goto LABEL_18;
  v6 = objc_msgSend(v4, "eventType");
  switch(v6)
  {
    case 3:
      _TVRUIButtonLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v14 = 0;
        _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypeButtonDown", v14, 2u);
      }
LABEL_11:

      break;
    case 2:
      _TVRUIButtonLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypeReleased", v13, 2u);
      }

      -[TVRUIRemoteViewController sessionData](self, "sessionData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setUsedSiri:", 1);

      v8 = self;
      v9 = 0;
      goto LABEL_17;
    case 1:
      _TVRUIButtonLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "TVRUIButtonTypeSiri, TVRUIButtonEventTypePressed", buf, 2u);
      }

      v8 = self;
      v9 = 1;
LABEL_17:
      -[TVRUIRemoteViewController setSiriSessionActive:](v8, "setSiriSessionActive:", v9);
      break;
  }
LABEL_18:

}

- (void)_enableSearch
{
  id v2;

  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableSearchButton");

}

- (void)_disableSearch
{
  id v2;

  -[TVRUIRemoteViewController controlPanelViewController](self, "controlPanelViewController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableSearchButton");

}

- (void)consumeSinglePressDownForButtonKind:(int64_t)a3
{
  NSObject *v5;
  int v6;
  const char *v7;
  __int16 v8;
  int64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIButtonLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315394;
    v7 = "-[TVRUIRemoteViewController consumeSinglePressDownForButtonKind:]";
    v8 = 2048;
    v9 = a3;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "%s, buttonKind=%ld", (uint8_t *)&v6, 0x16u);
  }

  if (a3 == 4)
  {
    -[TVRUIRemoteViewController volumeDownEventGenerated](self, "volumeDownEventGenerated");
  }
  else if (a3 == 3)
  {
    -[TVRUIRemoteViewController volumeUpEventGenerated](self, "volumeUpEventGenerated");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4 forTouchpadView:(id)a5
{
  double y;
  double x;
  id v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  void *v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  void *v27;
  id v28;
  CGPoint v30;
  CGRect v31;

  y = a3.y;
  x = a3.x;
  v8 = a5;
  -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isChannelButtonExpanded");

  if (v10)
  {
    -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_channelUpButtonView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[TVRUIRemoteViewController view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "frame");
    objc_msgSend(v13, "convertRect:fromView:", v12);
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v21 = v20;

    -[TVRUIRemoteViewController view](self, "view");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:fromView:", v8, x, y);
    v24 = v23;
    v26 = v25;

    v31.origin.x = v15;
    v31.origin.y = v17;
    v31.size.width = v19;
    v31.size.height = v21;
    v30.x = v24;
    v30.y = v26;
    if (CGRectContainsPoint(v31, v30))
      v27 = v12;
    else
      v27 = 0;
    v28 = v27;

  }
  else
  {
    v28 = 0;
  }

  return v28;
}

- (void)device:(id)a3 supportsFindMyRemote:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' supportsFindMy: %d", (uint8_t *)&v10, 0x12u);

  }
  -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_device:updatedFindMySupported:", v6, v4);

}

- (void)_showFindingAlert
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _BOOL4 supportsSiri;
  void *v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  _QWORD v28[5];
  _QWORD v29[5];

  -[TVRUIRemoteViewController findingSession](self, "findingSession");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v26, "isFindingSessionActive") & 1) != 0)
  {
    -[TVRUIRemoteViewController view](self, "view");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "window");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TVRUIRemoteViewController view](self, "view");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "window");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "rootViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "presentedViewController");
      v27 = (id)objc_claimAutoreleasedReturnValue();

      v8 = (void *)MEMORY[0x24BEBD3B0];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIFindingAlertTitle"), &stru_24DE30718, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      supportsSiri = self->_supportsSiri;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = v12;
      if (supportsSiri)
        v14 = CFSTR("TVRemoteUIFindingAlertSiriRemoteSubtitle");
      else
        v14 = CFSTR("TVRemoteUIFindingAlertAppleTVSubtitle");
      objc_msgSend(v12, "localizedStringForKey:value:table:", v14, &stru_24DE30718, CFSTR("Localizable"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", v10, v15, 1);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      v17 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIFindingAlertDefaultButtonTitle"), &stru_24DE30718, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = MEMORY[0x24BDAC760];
      v29[0] = MEMORY[0x24BDAC760];
      v29[1] = 3221225472;
      v29[2] = __46__TVRUIRemoteViewController__showFindingAlert__block_invoke;
      v29[3] = &unk_24DE2D600;
      v29[4] = self;
      objc_msgSend(v17, "actionWithTitle:style:handler:", v19, 0, v29);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v21);

      v22 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("TVRemoteUIFindingAlertAlternateButtonTitle"), &stru_24DE30718, CFSTR("Localizable"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v28[0] = v20;
      v28[1] = 3221225472;
      v28[2] = __46__TVRUIRemoteViewController__showFindingAlert__block_invoke_162;
      v28[3] = &unk_24DE2D600;
      v28[4] = self;
      objc_msgSend(v22, "actionWithTitle:style:handler:", v24, 0, v28);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "addAction:", v25);

      objc_msgSend(v27, "presentViewController:animated:completion:", v16, 1, 0);
    }
  }
  else
  {

  }
}

void __46__TVRUIRemoteViewController__showFindingAlert__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  uint8_t v5[16];

  _TVRUIViewControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "User requested to continue looking for the remote. Restarting finding session", v5, 2u);
  }

  v3 = *(void **)(a1 + 32);
  objc_msgSend(v3, "activeDevice");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_startFindingSessionForDevice:", v4);

}

void __46__TVRUIRemoteViewController__showFindingAlert__block_invoke_162(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint8_t v4[16];

  _TVRUIViewControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "User requested to stop finding remote", v4, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "findingSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopFindingSession");

}

- (void)device:(id)a3 didUpdateSiriRemoteFindingSessionState:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)a4 < 7 && ((0x77u >> a4) & 1) != 0)
    {
      v11 = off_24DE2D690[a4];
    }
    else
    {
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a4);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("Unknown %@"), v10);
      v11 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    *(_DWORD *)buf = 138543618;
    v13 = v8;
    v14 = 2114;
    v15 = v11;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' did update finding state: %{public}@", buf, 0x16u);

  }
  if (a4 == 6)
    -[TVRUIRemoteViewController _showFindingAlert](self, "_showFindingAlert");

}

- (void)device:(id)a3 didUpdateNowPlayingInfo:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "playbackRate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "playbackRate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updatePlaybackRate:", v10);

  }
  objc_msgSend(v7, "captionsEnabled");
  v11 = objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = (void *)v11;
    objc_msgSend(v7, "hasValidCaptionOptions");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      _TVRUIViewControllerLog();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        objc_msgSend(v6, "name");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "captionsEnabled");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "hasValidCaptionOptions");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = 138543874;
        v24 = v15;
        v25 = 2114;
        v26 = v16;
        v27 = 2114;
        v28 = v17;
        _os_log_impl(&dword_21B042000, v14, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' updateCaptionState: %{public}@, hasValidCaptionOptions: %{public}@", (uint8_t *)&v23, 0x20u);

      }
      -[TVRUIRemoteViewController mediaControlsViewController](self, "mediaControlsViewController");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "captionsEnabled");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v19, "BOOLValue");
      objc_msgSend(v7, "hasValidCaptionOptions");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "updateCaptionState:buttonDisabled:", v20, objc_msgSend(v21, "BOOLValue") ^ 1);

    }
  }
  -[TVRUIRemoteViewController nowPlayingController](self, "nowPlayingController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setNowPlayingInfo:", v7);

}

- (void)device:(id)a3 supportsVolumeControl:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  _BOOL4 v13;
  uint64_t v14;

  v4 = a4;
  v14 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v6, "name");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543618;
    v11 = v8;
    v12 = 1024;
    v13 = v4;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "device: '%{public}@' supportsVolumeControl %d", (uint8_t *)&v10, 0x12u);

  }
  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", v4);
  -[TVRUIRemoteViewController delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "device:supportsVolume:", v6, v4);

}

- (void)device:(id)a3 supportsSiri:(BOOL)a4 volumeControl:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  NSObject *v9;
  void *v10;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  _BOOL4 v18;
  uint64_t v19;

  v5 = a5;
  v6 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  _TVRUIViewControllerLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315906;
    v12 = "-[TVRUIRemoteViewController device:supportsSiri:volumeControl:]";
    v13 = 2112;
    v14 = v8;
    v15 = 1024;
    v16 = v6;
    v17 = 1024;
    v18 = v5;
    _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "%s device=%@, supportsSiri=%{BOOL}d, supportsVolumeControl=%{BOOL}d", (uint8_t *)&v11, 0x22u);
  }

  -[TVRUIRemoteViewController setSupportsVolumeControl:](self, "setSupportsVolumeControl:", v5);
  -[TVRUIRemoteViewController setSupportsSiri:](self, "setSupportsSiri:", v6);
  -[TVRUIRemoteViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "device:supportsSiri:volume:", v8, v6, v5);

}

- (void)setSupportsVolumeControl:(BOOL)a3
{
  _BOOL8 v3;
  TVRUIVolumeController *v5;
  void *v6;
  void *v7;
  TVRUIVolumeController *v8;
  TVRUIVolumeController *volumeController;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  BOOL v15;
  uint8_t buf[8];
  _QWORD v17[5];

  v3 = a3;
  if (!self->_volumeController)
  {
    v5 = [TVRUIVolumeController alloc];
    -[TVRUIRemoteViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke;
    v17[3] = &unk_24DE2C880;
    v17[4] = self;
    v8 = -[TVRUIVolumeController initForWindow:eventHandler:](v5, "initForWindow:eventHandler:", v7, v17);
    volumeController = self->_volumeController;
    self->_volumeController = v8;

  }
  -[TVRUIRemoteViewController volumeController](self, "volumeController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setSupportsVolumeControl:", v3);

  if (self->_isFindingSessionActive)
  {
    _TVRUIViewControllerLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v11, OS_LOG_TYPE_DEFAULT, "Finding session is active. Not enabling volume control", buf, 2u);
    }
  }
  else
  {
    -[TVRUIRemoteViewController volumeController](self, "volumeController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v3)
      objc_msgSend(v12, "enableVolumeControl");
    else
      objc_msgSend(v12, "disableVolumeControl");

    -[TVRUIRemoteViewController deviceObservers](self, "deviceObservers");
    v11 = objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke_164;
    v14[3] = &__block_descriptor_33_e45_v32__0___TVRUIRemoteDeviceObserving__8Q16_B24l;
    v15 = v3;
    -[NSObject enumerateObjectsUsingBlock:](v11, "enumerateObjectsUsingBlock:", v14);
  }

}

uint64_t __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2 == 2)
    return objc_msgSend(*(id *)(result + 32), "volumeDownEventGenerated");
  if (a2 == 1)
    return objc_msgSend(*(id *)(result + 32), "volumeUpEventGenerated");
  return result;
}

void __54__TVRUIRemoteViewController_setSupportsVolumeControl___block_invoke_164(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setVolumeControlAvailable:", *(unsigned __int8 *)(a1 + 32));

}

- (BOOL)supportsVolumeControl
{
  void *v3;
  void *v4;
  char v5;

  -[TVRUIRemoteViewController volumeController](self, "volumeController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    return 0;
  -[TVRUIRemoteViewController volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "supportsVolumeControl");

  return v5;
}

- (void)setSupportsSiri:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  if (self->_supportsSiri != a3)
  {
    self->_supportsSiri = a3;
    objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
    {

    }
    else
    {
      -[TVRUIRemoteViewController view](self, "view");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "window");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "windowScene");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "activationState");

      if (v9)
        goto LABEL_7;
    }
    if (a3)
    {
      -[TVRUIRemoteViewController siriManager](self, "siriManager");
      v10 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "registerForSiriEvents");
LABEL_8:

      return;
    }
LABEL_7:
    -[TVRUIRemoteViewController siriManager](self, "siriManager");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "unregisterForSiriEvents");
    goto LABEL_8;
  }
}

- (void)volumeUpEventGenerated
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TVRUIRemoteViewController activeDevice](self, "activeDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "supportsVolumeControl"),
        v5,
        v4,
        v6))
  {
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 10);
    v7 = objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController generatedButtonEvent:](self, "generatedButtonEvent:", v7);
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController generatedButtonEvent:](self, "generatedButtonEvent:", v8);
    _TVRUIViewControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Sent volume UP button event", buf, 2u);
    }

  }
  else
  {
    _TVRUIViewControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Volume up event generated but device does not support. Not sending", v10, 2u);
    }
  }

}

- (void)volumeDownEventGenerated
{
  uint64_t v3;
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint8_t v10[16];
  uint8_t buf[16];

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = objc_claimAutoreleasedReturnValue();
  if (v3
    && (v4 = (void *)v3,
        -[TVRUIRemoteViewController activeDevice](self, "activeDevice"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "supportsVolumeControl"),
        v5,
        v4,
        v6))
  {
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 1, 11);
    v7 = objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController generatedButtonEvent:](self, "generatedButtonEvent:", v7);
    +[TVRUIButtonEvent createButtonEvent:buttonType:](TVRUIButtonEvent, "createButtonEvent:buttonType:", 2, 11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIRemoteViewController generatedButtonEvent:](self, "generatedButtonEvent:", v8);
    _TVRUIViewControllerLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v9, OS_LOG_TYPE_DEFAULT, "Sent volume DOWN button event", buf, 2u);
    }

  }
  else
  {
    _TVRUIViewControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Volume down event generated but device does not support. Not sending", v10, 2u);
    }
  }

}

- (void)_expandDeviceList
{
  void *v3;
  id v4;

  if (-[TVRUIRemoteViewController isNetworkReachable](self, "isNetworkReachable"))
  {
    -[TVRUIRemoteViewController _hideMessageContent](self, "_hideMessageContent");
    -[TVRUIRemoteViewController delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "devicePickerWillExpand");

    -[TVRUIRemoteViewController devicePickerViewController](self, "devicePickerViewController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "expandDeviceList");

  }
}

- (BOOL)_shouldAllowKeyboardToBePresented
{
  void *v3;
  _BOOL4 v4;

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = !-[TVRUIRemoteViewController isSiriSessionActive](self, "isSiriSessionActive");
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (void)_installTapToRadarButton
{
  void *v3;
  dispatch_time_t v4;
  _QWORD block[5];

  if (+[TVRUIFeatures isTapToRadarEnabled](TVRUIFeatures, "isTapToRadarEnabled"))
  {
    -[TVRUIRemoteViewController tapToRadarButton](self, "tapToRadarButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      v4 = dispatch_time(0, 1000000000);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke;
      block[3] = &unk_24DE2C198;
      block[4] = self;
      dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
    }
  }
}

void __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  CGRect v15;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveUserInterfaceLayoutDirection");

  +[TVRTapToRadarManager bugImage](TVRTapToRadarManager, "bugImage");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "styleProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "primaryTextAndGlyphColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTintColor:", v7);

  objc_msgSend(v5, "setImage:forState:", v4, 0);
  v8 = 0.0;
  if (v3 == 1)
  {
    objc_msgSend(*(id *)(a1 + 32), "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bounds");
    v8 = CGRectGetWidth(v15) + -50.0;

  }
  objc_msgSend(v5, "setFrame:", v8, 0.0, 50.0, 50.0);
  objc_msgSend(v5, "addTarget:action:forControlEvents:", *(_QWORD *)(a1 + 32), sel__tapToRadar, 0x2000);
  objc_msgSend(v5, "setAlpha:", 0.0);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addSubview:", v5);

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 1168), v5);
  v11 = (void *)MEMORY[0x24BEBDB00];
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke_2;
  v13[3] = &unk_24DE2C198;
  v14 = v5;
  v12 = v5;
  objc_msgSend(v11, "animateWithDuration:animations:", v13, 0.75);

}

uint64_t __53__TVRUIRemoteViewController__installTapToRadarButton__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (void)_tapToRadar
{
  void *v2;
  id v3;

  -[TVRUIRemoteViewController view](self, "view");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[TVRTapToRadarManager fileRadarWithTitle:description:window:](TVRTapToRadarManager, "fileRadarWithTitle:description:window:", CFSTR("[TVRemote] "), 0, v2);

}

- (id)_stringForDeviceDeviceIdentifierType:(int64_t)a3
{
  if ((unint64_t)a3 > 4)
    return CFSTR("Unknown");
  else
    return off_24DE2D6C8[a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_forceShowMediaControls
{
  id v3;

  -[TVRUIRemoteViewController activeDevice](self, "activeDevice");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIRemoteViewController device:needsMediaControls:](self, "device:needsMediaControls:", v3, &unk_24DE4DD60);

}

- (int64_t)_connectionContextFromLaunchContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 5) > 8)
    return 1;
  else
    return qword_21B0F7B58[a3 - 5];
}

- (id)_stringForConnectionContext:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return CFSTR("Unspecified");
  else
    return off_24DE2D6F0[a3 - 1];
}

- (void)_createFindingSessionIfNeeded
{
  TVRUIFindingSession *v3;
  TVRUIFindingSession *findingSession;

  if (!self->_findingSession)
  {
    v3 = objc_alloc_init(TVRUIFindingSession);
    findingSession = self->_findingSession;
    self->_findingSession = v3;

  }
}

- (void)findButtonTappedForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  id v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v4;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Find button tapped for device: %@", (uint8_t *)&v6, 0xCu);
  }

  if ((objc_msgSend(v4, "isConnected") & 1) != 0)
  {
    -[TVRUIRemoteViewController _startFindingSessionForDevice:](self, "_startFindingSessionForDevice:", v4);
  }
  else
  {
    -[TVRUIRemoteViewController _selectDevice:withConnectionContext:](self, "_selectDevice:withConnectionContext:", v4, 1);
    -[TVRUIRemoteViewController setShouldStartFindingSession:](self, "setShouldStartFindingSession:", 1);
  }

}

- (void)_startFindingSessionForDevice:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  TVRUIRemoteViewController *v8;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke;
  v6[3] = &unk_24DE2D670;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[TVRUIRemoteViewController _turnOnBluetoothIfNeededWithCompletionBlock:](self, "_turnOnBluetoothIfNeededWithCompletionBlock:", v6);

}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  _BOOL4 v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_cold_1((uint64_t)v5, v7, v8);

  }
  else
  {
    v9 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (a2)
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth is enabled. Starting finding session", buf, 2u);
      }

      if (*(_QWORD *)(a1 + 32))
      {
        _TVRUIViewControllerLog();
        v10 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(*(id *)(a1 + 32), "name");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v22 = v11;
          _os_log_impl(&dword_21B042000, v10, OS_LOG_TYPE_DEFAULT, "Start finding session for: '%{public}@'", buf, 0xCu);

        }
        objc_msgSend(*(id *)(a1 + 40), "_createFindingSessionIfNeeded");
        objc_initWeak((id *)buf, *(id *)(a1 + 40));
        objc_msgSend(*(id *)(a1 + 40), "findingSession");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = *(void **)(a1 + 32);
        v15 = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_196;
        v18 = &unk_24DE2D648;
        v19 = v13;
        objc_copyWeak(&v20, (id *)buf);
        objc_msgSend(v12, "startFindingSessionForDevice:dismissedHandler:", v19, &v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(*(id *)(a1 + 32), "enableFindingSession:", 1, v15, v16, v17, v18, v19);
          objc_msgSend(*(id *)(a1 + 40), "presentViewController:animated:completion:", v14, 1, 0);
          objc_msgSend(*(id *)(a1 + 40), "findingSessionDidStart");
        }

        objc_destroyWeak(&v20);
        objc_destroyWeak((id *)buf);
      }
    }
    else
    {
      if (v9)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Bluetooth is not enabled. Ignoring user action to start finding session", buf, 2u);
      }

    }
  }

}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_196(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  id WeakRetained;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "name");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_21B042000, v2, OS_LOG_TYPE_DEFAULT, "Finding session ended for device: '%{public}@'", (uint8_t *)&v5, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "enableFindingSession:", 0);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "findingSessionDidEnd");

}

- (void)_stopFindingSessionForDevice:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  TVRUIFindingSession *findingSession;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "name");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Stop finding session for: '%{public}@'", (uint8_t *)&v9, 0xCu);

    }
    objc_msgSend(v4, "enableFindingSession:", 0);
    if (self->_findingSession)
    {
      -[TVRUIRemoteViewController findingSession](self, "findingSession");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "stopFindingSession");

      findingSession = self->_findingSession;
      self->_findingSession = 0;

    }
  }

}

- (void)findingSessionDidStart
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Finding session started. Pausing volume support", v5, 2u);
  }

  -[TVRUIRemoteViewController volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "disableVolumeControl");

  self->_isFindingSessionActive = 1;
}

- (void)findingSessionDidEnd
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Finding session ended. Restoring volume support.", v5, 2u);
  }

  self->_isFindingSessionActive = 0;
  -[TVRUIRemoteViewController volumeController](self, "volumeController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "enableVolumeControl");

}

- (BOOL)isConfigured
{
  return self->_configured;
}

- (void)setConfigured:(BOOL)a3
{
  self->_configured = a3;
}

- (TVRUIDevice)activeDevice
{
  return self->_activeDevice;
}

- (void)setActiveDevice:(id)a3
{
  objc_storeStrong((id *)&self->_activeDevice, a3);
}

- (NSString)activeDeviceIdentifier
{
  return self->_activeDeviceIdentifier;
}

- (void)setActiveDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 992);
}

- (TVRUIDevice)authenticatingDevice
{
  return self->_authenticatingDevice;
}

- (void)setAuthenticatingDevice:(id)a3
{
  objc_storeStrong((id *)&self->_authenticatingDevice, a3);
}

- (TVRUIDeviceQuery)deviceQuery
{
  return self->_deviceQuery;
}

- (void)setDeviceQuery:(id)a3
{
  objc_storeStrong((id *)&self->_deviceQuery, a3);
}

- (NSString)preferredDeviceIdentifier
{
  return self->_preferredDeviceIdentifier;
}

- (void)setPreferredDeviceIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1016);
}

- (int64_t)deviceIdentifierType
{
  return self->_deviceIdentifierType;
}

- (void)setDeviceIdentifierType:(int64_t)a3
{
  self->_deviceIdentifierType = a3;
}

- (int64_t)deviceType
{
  return self->_deviceType;
}

- (void)setDeviceType:(int64_t)a3
{
  self->_deviceType = a3;
}

- (int64_t)launchContext
{
  return self->_launchContext;
}

- (void)setLaunchContext:(int64_t)a3
{
  self->_launchContext = a3;
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (NSArray)deviceObservers
{
  return self->_deviceObservers;
}

- (void)setDeviceObservers:(id)a3
{
  objc_storeStrong((id *)&self->_deviceObservers, a3);
}

- (TVRUITopButtonPanelViewController)topButtonPanelViewController
{
  return self->_topButtonPanelViewController;
}

- (void)setTopButtonPanelViewController:(id)a3
{
  objc_storeStrong((id *)&self->_topButtonPanelViewController, a3);
}

- (TVRUITouchpadViewController)touchpadViewController
{
  return self->_touchpadViewController;
}

- (void)setTouchpadViewController:(id)a3
{
  objc_storeStrong((id *)&self->_touchpadViewController, a3);
}

- (TVRUIControlPanelViewController)controlPanelViewController
{
  return self->_controlPanelViewController;
}

- (void)setControlPanelViewController:(id)a3
{
  objc_storeStrong((id *)&self->_controlPanelViewController, a3);
}

- (UIView)blackGradientView
{
  return self->_blackGradientView;
}

- (void)setBlackGradientView:(id)a3
{
  objc_storeStrong((id *)&self->_blackGradientView, a3);
}

- (TVRUIDevicePickerViewController)devicePickerViewController
{
  return self->_devicePickerViewController;
}

- (void)setDevicePickerViewController:(id)a3
{
  objc_storeStrong((id *)&self->_devicePickerViewController, a3);
}

- (TVRUIMediaControlsViewController)mediaControlsViewController
{
  return self->_mediaControlsViewController;
}

- (void)setMediaControlsViewController:(id)a3
{
  objc_storeStrong((id *)&self->_mediaControlsViewController, a3);
}

- (TVRAlertController)keyboardController
{
  return self->_keyboardController;
}

- (void)setKeyboardController:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardController, a3);
}

- (TVRAlertController)authenticationAlertController
{
  return self->_authenticationAlertController;
}

- (void)setAuthenticationAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_authenticationAlertController, a3);
}

- (BOOL)isEditingSessionActive
{
  return self->_editingSessionActive;
}

- (void)setEditingSessionActive:(BOOL)a3
{
  self->_editingSessionActive = a3;
}

- (TVRMessageView)messageView
{
  return self->_messageView;
}

- (void)setMessageView:(id)a3
{
  objc_storeStrong((id *)&self->_messageView, a3);
}

- (TVRUINetworkObserver)networkObserver
{
  return self->_networkObserver;
}

- (void)setNetworkObserver:(id)a3
{
  objc_storeStrong((id *)&self->_networkObserver, a3);
}

- (BOOL)isNetworkReachable
{
  return self->_networkReachable;
}

- (void)setNetworkReachable:(BOOL)a3
{
  self->_networkReachable = a3;
}

- (TVRKeyboardHaptic)keyboardHaptic
{
  return self->_keyboardHaptic;
}

- (void)setKeyboardHaptic:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardHaptic, a3);
}

- (BOOL)isSiriSessionActive
{
  return self->_siriSessionActive;
}

- (void)setSiriSessionActive:(BOOL)a3
{
  self->_siriSessionActive = a3;
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (SFClient)sharingClient
{
  return self->_sharingClient;
}

- (void)setSharingClient:(id)a3
{
  objc_storeStrong((id *)&self->_sharingClient, a3);
}

- (UIButton)tapToRadarButton
{
  return self->_tapToRadarButton;
}

- (void)setTapToRadarButton:(id)a3
{
  objc_storeStrong((id *)&self->_tapToRadarButton, a3);
}

- (CUSystemMonitor)systemMonitor
{
  return self->_systemMonitor;
}

- (void)setSystemMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_systemMonitor, a3);
}

- (id)deviceQueryThresholdBlock
{
  return self->_deviceQueryThresholdBlock;
}

- (void)setDeviceQueryThresholdBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1184);
}

- (TVRUIVolumeController)volumeController
{
  return self->_volumeController;
}

- (void)setVolumeController:(id)a3
{
  objc_storeStrong((id *)&self->_volumeController, a3);
}

- (BOOL)supportsSiri
{
  return self->_supportsSiri;
}

- (NSString)launchContextDesc
{
  return self->_launchContextDesc;
}

- (void)setLaunchContextDesc:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1200);
}

- (TVRCSessionData)sessionData
{
  return self->_sessionData;
}

- (void)setSessionData:(id)a3
{
  objc_storeStrong((id *)&self->_sessionData, a3);
}

- (TVRUISiriManager)siriManager
{
  return self->_siriManager;
}

- (void)setSiriManager:(id)a3
{
  objc_storeStrong((id *)&self->_siriManager, a3);
}

- (BSInvalidatable)volumeDecreaseSBSInvalidator
{
  return self->_volumeDecreaseSBSInvalidator;
}

- (void)setVolumeDecreaseSBSInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, a3);
}

- (BSInvalidatable)volumeIncreaseSBSInvalidator
{
  return self->_volumeIncreaseSBSInvalidator;
}

- (void)setVolumeIncreaseSBSInvalidator:(id)a3
{
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, a3);
}

- (BOOL)isInReducedBacklightMode
{
  return self->_isInReducedBacklightMode;
}

- (void)setIsInReducedBacklightMode:(BOOL)a3
{
  self->_isInReducedBacklightMode = a3;
}

- (UITraitChangeRegistration)traitChangeRegistration
{
  return self->_traitChangeRegistration;
}

- (void)setTraitChangeRegistration:(id)a3
{
  objc_storeStrong((id *)&self->_traitChangeRegistration, a3);
}

- (BOOL)deviceQueryThresholdReached
{
  return self->_deviceQueryThresholdReached;
}

- (void)setDeviceQueryThresholdReached:(BOOL)a3
{
  self->_deviceQueryThresholdReached = a3;
}

- (BOOL)isFindingSessionActive
{
  return self->_isFindingSessionActive;
}

- (void)setIsFindingSessionActive:(BOOL)a3
{
  self->_isFindingSessionActive = a3;
}

- (BOOL)shouldStartFindingSession
{
  return self->_shouldStartFindingSession;
}

- (void)setShouldStartFindingSession:(BOOL)a3
{
  self->_shouldStartFindingSession = a3;
}

- (TVRUIFindingSession)findingSession
{
  return self->_findingSession;
}

- (void)setFindingSession:(id)a3
{
  objc_storeStrong((id *)&self->_findingSession, a3);
}

- (TVRUINowPlayingController)nowPlayingController
{
  return self->_nowPlayingController;
}

- (void)setNowPlayingController:(id)a3
{
  objc_storeStrong((id *)&self->_nowPlayingController, a3);
}

- (TVRUIRemoteViewControllerDelegate)delegate
{
  return (TVRUIRemoteViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (TVRUIDeviceConnectionStatusDelegate)deviceConnectionStatusDelegate
{
  return (TVRUIDeviceConnectionStatusDelegate *)objc_loadWeakRetained((id *)&self->_deviceConnectionStatusDelegate);
}

- (void)setDeviceConnectionStatusDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_deviceConnectionStatusDelegate, a3);
}

- (BOOL)isInSecureWindow
{
  return self->_isInSecureWindow;
}

- (TVRUITipSourceViewProvider)tipSourceViewProvider
{
  return self->_tipSourceViewProvider;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tipSourceViewProvider, 0);
  objc_destroyWeak((id *)&self->_deviceConnectionStatusDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nowPlayingController, 0);
  objc_storeStrong((id *)&self->_findingSession, 0);
  objc_storeStrong((id *)&self->_traitChangeRegistration, 0);
  objc_storeStrong((id *)&self->_volumeIncreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_volumeDecreaseSBSInvalidator, 0);
  objc_storeStrong((id *)&self->_siriManager, 0);
  objc_storeStrong((id *)&self->_sessionData, 0);
  objc_storeStrong((id *)&self->_launchContextDesc, 0);
  objc_storeStrong((id *)&self->_volumeController, 0);
  objc_storeStrong(&self->_deviceQueryThresholdBlock, 0);
  objc_storeStrong((id *)&self->_systemMonitor, 0);
  objc_storeStrong((id *)&self->_tapToRadarButton, 0);
  objc_storeStrong((id *)&self->_sharingClient, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_keyboardHaptic, 0);
  objc_storeStrong((id *)&self->_networkObserver, 0);
  objc_storeStrong((id *)&self->_messageView, 0);
  objc_storeStrong((id *)&self->_authenticationAlertController, 0);
  objc_storeStrong((id *)&self->_keyboardController, 0);
  objc_storeStrong((id *)&self->_mediaControlsViewController, 0);
  objc_storeStrong((id *)&self->_devicePickerViewController, 0);
  objc_storeStrong((id *)&self->_blackGradientView, 0);
  objc_storeStrong((id *)&self->_controlPanelViewController, 0);
  objc_storeStrong((id *)&self->_touchpadViewController, 0);
  objc_storeStrong((id *)&self->_topButtonPanelViewController, 0);
  objc_storeStrong((id *)&self->_deviceObservers, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_preferredDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_deviceQuery, 0);
  objc_storeStrong((id *)&self->_authenticatingDevice, 0);
  objc_storeStrong((id *)&self->_activeDeviceIdentifier, 0);
  objc_storeStrong((id *)&self->_activeDevice, 0);
}

- (void)_connectToPreferredDeviceFromDeviceList:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "preferredDeviceIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v3;
  OUTLINED_FUNCTION_0_3(&dword_21B042000, a2, v4, "No device found for preferred device id %{public}@", (uint8_t *)&v5);

  OUTLINED_FUNCTION_1_0();
}

- (void)alertControllerPressedDictationButton:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 136315138;
  v4 = "-[TVRUIRemoteViewController alertControllerPressedDictationButton:]";
  OUTLINED_FUNCTION_0_3(&dword_21B042000, a1, a3, "%s - no active device", (uint8_t *)&v3);
}

- (void)_performSiriEffectsWithButtonEvent:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_21B042000, log, OS_LOG_TYPE_ERROR, "No active device! Not performing Siri effects", v1, 2u);
}

void __59__TVRUIRemoteViewController__startFindingSessionForDevice___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0_3(&dword_21B042000, a2, a3, "Failed to turn on Bluetooth: %{public}@", (uint8_t *)&v3);
}

@end
