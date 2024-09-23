@implementation TVRUIControlPanelViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVRUIControlPanelViewController;
  -[TVRUIControlPanelViewController viewDidLoad](&v12, sel_viewDidLoad);
  -[TVRUIControlPanelViewController styleProvider](self, "styleProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "controlPanelBackgroundView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setBackgroundView:](self, "setBackgroundView:", v4);

  -[TVRUIControlPanelViewController backgroundView](self, "backgroundView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIControlPanelViewController backgroundView](self, "backgroundView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);
  }
  else
  {
    -[TVRUIControlPanelViewController styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "controlPanelBackgroundColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUIControlPanelViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setBackgroundColor:", v7);

  }
  v9 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  -[TVRUIControlPanelViewController setAllButtonPanels:](self, "setAllButtonPanels:", v9);

  -[TVRUIControlPanelViewController _createTouchpadButtonPanel](self, "_createTouchpadButtonPanel");
  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "disableButtons:", 0);

  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v11);

}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  objc_super v68;

  v68.receiver = self;
  v68.super_class = (Class)TVRUIControlPanelViewController;
  -[TVRUIControlPanelViewController viewWillLayoutSubviews](&v68, sel_viewWillLayoutSubviews);
  -[TVRUIControlPanelViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TVRUIControlPanelViewController backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
  -[TVRUIControlPanelViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[TVRUIControlPanelViewController genericButtonPanel](self, "genericButtonPanel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "bounds");
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[TVRUIControlPanelViewController genericButtonPanel](self, "genericButtonPanel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);

  }
  -[TVRUIControlPanelViewController panelWithKeyboardButton](self, "panelWithKeyboardButton");
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  if (v35)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "bounds");
    v38 = v37;
    v40 = v39;
    v42 = v41;
    v44 = v43;
    -[TVRUIControlPanelViewController panelWithKeyboardButton](self, "panelWithKeyboardButton");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setFrame:", v38, v40, v42, v44);

  }
  -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  if (v46)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "bounds");
    v49 = v48;
    v51 = v50;
    v53 = v52;
    v55 = v54;
    -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFrame:", v49, v51, v53, v55);

  }
  -[TVRUIControlPanelViewController legacyPanelWithKeyboardButton](self, "legacyPanelWithKeyboardButton");
  v57 = (void *)objc_claimAutoreleasedReturnValue();

  if (v57)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "bounds");
    v60 = v59;
    v62 = v61;
    v64 = v63;
    v66 = v65;
    -[TVRUIControlPanelViewController legacyPanelWithKeyboardButton](self, "legacyPanelWithKeyboardButton");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "setFrame:", v60, v62, v64, v66);

  }
}

- (void)_createTouchpadButtonPanel
{
  void *v3;
  void *v4;
  TVRUIControlPanelViewController *v5;
  uint64_t v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  uint8_t v11[16];

  if (+[TVRUIFeatures swapBackPlayPauseButtonsEnabled](TVRUIFeatures, "swapBackPlayPauseButtonsEnabled"))
  {
    v3 = &unk_24DE4DC28;
    v4 = &unk_24DE4DC40;
    v5 = self;
    v6 = 5;
  }
  else
  {
    v3 = &unk_24DE4DC58;
    v4 = &unk_24DE4DC70;
    v5 = self;
    v6 = 2;
  }
  -[TVRUIControlPanelViewController _createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:](v5, "_createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:", v6, v3, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setTouchpadButtonPanel:](self, "setTouchpadButtonPanel:", v7);

  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v11 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Created touchpad button panel WITHOUT page buttons", v11, 2u);
  }

  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObject:", v10);

}

- (void)_createGenericControlButtonPanel
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRUIControlPanelViewController _createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:](self, "_createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:", 23, &unk_24DE4DC88, &unk_24DE4DCA0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setGenericButtonPanel:](self, "setGenericButtonPanel:", v3);

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Created generic tv button panel", v7, 2u);
  }

  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController genericButtonPanel](self, "genericButtonPanel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_createButtonPanelWithKeyboard
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRUIControlPanelViewController _createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:](self, "_createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:", 2, &unk_24DE4DCB8, &unk_24DE4DCD0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setPanelWithKeyboardButton:](self, "setPanelWithKeyboardButton:", v3);

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Created button panel with keyboard buttons and page buttons", v7, 2u);
  }

  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController panelWithKeyboardButton](self, "panelWithKeyboardButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_createLegacyButtonPanel
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRUIControlPanelViewController _createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:](self, "_createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:", 2, &unk_24DE4DCE8, &unk_24DE4DD00);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setLegacyButtonPanel:](self, "setLegacyButtonPanel:", v3);

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Created legacy button panel", v7, 2u);
  }

  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (void)_createLegacyPanelWithkeyboard
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  uint8_t v7[16];

  -[TVRUIControlPanelViewController _createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:](self, "_createViewWithPrimaryButtonType:leftButtonTypes:rightButtonTypes:", 2, &unk_24DE4DD18, &unk_24DE4DD30);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController setLegacyPanelWithKeyboardButton:](self, "setLegacyPanelWithKeyboardButton:", v3);

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Created legacy button panel with keyboard button", v7, 2u);
  }

  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController legacyPanelWithKeyboardButton](self, "legacyPanelWithKeyboardButton");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v6);

}

- (id)_createViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4 rightButtonTypes:(id)a5
{
  id v8;
  id v9;
  TVRUIButtonPanelView *v10;
  void *v11;
  TVRUIButtonPanelView *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = [TVRUIButtonPanelView alloc];
  -[TVRUIControlPanelViewController styleProvider](self, "styleProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[TVRUIButtonPanelView initWithPrimaryButtonType:secondaryLeftButtons:secondaryRightButtons:styleProvider:](v10, "initWithPrimaryButtonType:secondaryLeftButtons:secondaryRightButtons:styleProvider:", a3, v9, v8, v11);

  -[TVRUIButtonPanelView setAutoresizingMask:](v12, "setAutoresizingMask:", 18);
  -[TVRUIControlPanelViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIButtonPanelView setButtonEventDelegate:](v12, "setButtonEventDelegate:", v13);

  return v12;
}

- (id)_createPagedViewWithPrimaryButtonType:(int64_t)a3 leftButtonTypes:(id)a4
{
  id v6;
  TVRUIButtonPanelView *v7;
  void *v8;
  id v9;
  void *v10;

  v6 = a4;
  v7 = [TVRUIButtonPanelView alloc];
  -[TVRUIControlPanelViewController styleProvider](self, "styleProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[TVRUIButtonPanelView initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:](v7, "initPagedPanelWithPrimaryButtonType:secondaryLeftButtons:styleProvider:", a3, v6, v8);

  objc_msgSend(v9, "setAutoresizingMask:", 18);
  -[TVRUIControlPanelViewController buttonActionsDelegate](self, "buttonActionsDelegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setButtonEventDelegate:", v10);

  return v9;
}

- (void)showKeyboardButton
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  NSObject *v7;
  uint8_t v8[16];

  if (-[TVRUIDevice isLegacyAppleTV](self->_remoteDevice, "isLegacyAppleTV"))
  {
    -[TVRUIControlPanelViewController legacyPanelWithKeyboardButton](self, "legacyPanelWithKeyboardButton");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
      -[TVRUIControlPanelViewController _createLegacyPanelWithkeyboard](self, "_createLegacyPanelWithkeyboard");
    -[TVRUIControlPanelViewController legacyPanelWithKeyboardButton](self, "legacyPanelWithKeyboardButton");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[TVRUIControlPanelViewController panelWithKeyboardButton](self, "panelWithKeyboardButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      -[TVRUIControlPanelViewController _createButtonPanelWithKeyboard](self, "_createButtonPanelWithKeyboard");
    -[TVRUIControlPanelViewController panelWithKeyboardButton](self, "panelWithKeyboardButton");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;
  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Requesting transition to keyboard button panel", v8, 2u);
  }

  -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v6);
}

- (void)hideKeyboardButton
{
  NSObject *v3;
  void *v4;
  uint8_t v5[16];

  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "Hiding keyboard button panel and requesting transition to touchpad buttonpanel", v5, 2u);
  }

  if (-[TVRUIDevice isLegacyAppleTV](self->_remoteDevice, "isLegacyAppleTV"))
    -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
  else
    -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v4);

}

- (void)enableSearchButton
{
  id v2;

  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableSearchButton");

}

- (void)disableSearchButton
{
  id v2;

  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "disableSearchButton");

}

- (void)_transitionToPanelView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint8_t v19[16];

  v4 = a3;
  -[TVRUIControlPanelViewController setCurrentButtonPanel:](self, "setCurrentButtonPanel:", v4);
  -[TVRUIControlPanelViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "subviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "subviews");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v4);

    if ((v10 & 1) == 0)
    {
      v11 = (void *)MEMORY[0x24BEBDB00];
      -[TVRUIControlPanelViewController view](self, "view");
      v12 = objc_claimAutoreleasedReturnValue();
      -[NSObject subviews](v12, "subviews");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "objectAtIndexedSubscript:", 0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "transitionFromView:toView:duration:options:completion:", v14, v4, 5242880, &__block_literal_global_7, 0.3);

LABEL_8:
      goto LABEL_9;
    }
  }
  else
  {

  }
  -[TVRUIControlPanelViewController view](self, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "subviews");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (!v17)
  {
    -[TVRUIControlPanelViewController view](self, "view");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "addSubview:", v4);

    _TVRUIViewControllerLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl(&dword_21B042000, v12, OS_LOG_TYPE_DEFAULT, "Adding buttonpanel as subview. not performing transition.", v19, 2u);
    }
    goto LABEL_8;
  }
LABEL_9:

}

void __58__TVRUIControlPanelViewController__transitionToPanelView___block_invoke()
{
  NSObject *v0;
  uint8_t v1[16];

  _TVRUIViewControllerLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v1 = 0;
    _os_log_impl(&dword_21B042000, v0, OS_LOG_TYPE_DEFAULT, "Requested buttonpanel transition complete", v1, 2u);
  }

}

- (void)setDevice:(id)a3
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  NSObject *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  TVRUIDevice *remoteDevice;
  uint8_t v13[16];
  uint8_t v14[16];
  uint8_t buf[16];

  v4 = a3;
  if (objc_msgSend(v4, "supportsTouchEvents"))
  {
    _TVRUIViewControllerLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Device supports touch events. transitioning to touchpad buttonpanel", buf, 2u);
    }

    -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_11:
    v11 = (void *)v6;
    -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v6);

    goto LABEL_15;
  }
  v7 = objc_msgSend(v4, "isLegacyAppleTV");
  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT);
  if (v7)
  {
    if (v9)
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Device is legacy apple tv. transitioning to legacy buttonpanel", v14, 2u);
    }

    -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      -[TVRUIControlPanelViewController _createLegacyButtonPanel](self, "_createLegacyButtonPanel");
    -[TVRUIControlPanelViewController legacyButtonPanel](self, "legacyButtonPanel");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if (v9)
  {
    *(_WORD *)v13 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Device does not support touch events. transitioning to generic button panel", v13, 2u);
  }

  -[TVRUIControlPanelViewController _transitionToButtonPanelAndCreateIfNeeded](self, "_transitionToButtonPanelAndCreateIfNeeded");
LABEL_15:
  remoteDevice = self->_remoteDevice;
  self->_remoteDevice = (TVRUIDevice *)v4;

}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[TVRUIControlPanelViewController _updateViewState](self, "_updateViewState");
  }
}

- (void)_updateViewState
{
  if (-[TVRUIControlPanelViewController enabled](self, "enabled"))
    -[TVRUIControlPanelViewController _enableControls](self, "_enableControls");
  else
    -[TVRUIControlPanelViewController _disableControls](self, "_disableControls");
}

- (void)_disableControls
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint8_t v8[16];
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v6++), "disableButtons:", 1);
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  _TVRUIViewControllerLog();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Disabled all buttonpanels", v8, 2u);
  }

}

- (void)_enableControls
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  uint8_t v9[16];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[TVRUIControlPanelViewController allButtonPanels](self, "allButtonPanels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v7++), "enableButtonsForDevice:", self->_remoteDevice);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

  _TVRUIViewControllerLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl(&dword_21B042000, v8, OS_LOG_TYPE_DEFAULT, "Enabled all buttonpanels", v9, 2u);
  }

}

- (void)transitonToViewForDeviceType:(int64_t)a3
{
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  -[TVRUIControlPanelViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (a3 == 2)
  {
    if (v6)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Generic TV type. Requesting transition to generic button panel.", buf, 2u);
    }

    -[TVRUIControlPanelViewController _transitionToButtonPanelAndCreateIfNeeded](self, "_transitionToButtonPanelAndCreateIfNeeded");
  }
  else
  {
    if (v6)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Requesting transition to touch button panel", v7, 2u);
    }

    -[TVRUIControlPanelViewController _transitionToTouchpadPanelAndCreateIfNeeded](self, "_transitionToTouchpadPanelAndCreateIfNeeded");
  }
}

- (void)_transitionToButtonPanelAndCreateIfNeeded
{
  void *v3;
  id v4;

  -[TVRUIControlPanelViewController genericButtonPanel](self, "genericButtonPanel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[TVRUIControlPanelViewController _createGenericControlButtonPanel](self, "_createGenericControlButtonPanel");
  -[TVRUIControlPanelViewController genericButtonPanel](self, "genericButtonPanel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v4);

}

- (void)_transitionToTouchpadPanelAndCreateIfNeeded
{
  void *v3;
  id v4;

  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[TVRUIControlPanelViewController _createTouchpadButtonPanel](self, "_createTouchpadButtonPanel");
  -[TVRUIControlPanelViewController touchpadButtonPanel](self, "touchpadButtonPanel");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIControlPanelViewController _transitionToPanelView:](self, "_transitionToPanelView:", v4);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)buttonActionsDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_buttonActionsDelegate);
}

- (void)setButtonActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_buttonActionsDelegate, a3);
}

- (TVRUIButtonPanelView)currentButtonPanel
{
  return self->_currentButtonPanel;
}

- (void)setCurrentButtonPanel:(id)a3
{
  objc_storeStrong((id *)&self->_currentButtonPanel, a3);
}

- (TVRUIButtonPanelView)touchpadButtonPanel
{
  return self->_touchpadButtonPanel;
}

- (void)setTouchpadButtonPanel:(id)a3
{
  objc_storeStrong((id *)&self->_touchpadButtonPanel, a3);
}

- (TVRUIButtonPanelView)genericButtonPanel
{
  return self->_genericButtonPanel;
}

- (void)setGenericButtonPanel:(id)a3
{
  objc_storeStrong((id *)&self->_genericButtonPanel, a3);
}

- (TVRUIButtonPanelView)panelWithKeyboardButton
{
  return self->_panelWithKeyboardButton;
}

- (void)setPanelWithKeyboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_panelWithKeyboardButton, a3);
}

- (TVRUIButtonPanelView)legacyButtonPanel
{
  return self->_legacyButtonPanel;
}

- (void)setLegacyButtonPanel:(id)a3
{
  objc_storeStrong((id *)&self->_legacyButtonPanel, a3);
}

- (TVRUIButtonPanelView)legacyPanelWithKeyboardButton
{
  return self->_legacyPanelWithKeyboardButton;
}

- (void)setLegacyPanelWithKeyboardButton:(id)a3
{
  objc_storeStrong((id *)&self->_legacyPanelWithKeyboardButton, a3);
}

- (TVRUIDevice)remoteDevice
{
  return self->_remoteDevice;
}

- (void)setRemoteDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
}

- (TVRUIStyleProvider)styleProvider
{
  return self->_styleProvider;
}

- (void)setStyleProvider:(id)a3
{
  objc_storeStrong((id *)&self->_styleProvider, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (NSMutableSet)allButtonPanels
{
  return self->_allButtonPanels;
}

- (void)setAllButtonPanels:(id)a3
{
  objc_storeStrong((id *)&self->_allButtonPanels, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allButtonPanels, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_legacyPanelWithKeyboardButton, 0);
  objc_storeStrong((id *)&self->_legacyButtonPanel, 0);
  objc_storeStrong((id *)&self->_panelWithKeyboardButton, 0);
  objc_storeStrong((id *)&self->_genericButtonPanel, 0);
  objc_storeStrong((id *)&self->_touchpadButtonPanel, 0);
  objc_storeStrong((id *)&self->_currentButtonPanel, 0);
  objc_destroyWeak((id *)&self->_buttonActionsDelegate);
}

@end
