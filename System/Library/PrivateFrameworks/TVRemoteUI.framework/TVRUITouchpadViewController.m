@implementation TVRUITouchpadViewController

- (void)viewDidLoad
{
  void *v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TVRUITouchpadViewController;
  -[TVRUITouchpadViewController viewDidLoad](&v9, sel_viewDidLoad);
  -[TVRUITouchpadViewController _darkenSystemColorsChanged:](self, "_darkenSystemColorsChanged:", 0);
  -[TVRUITouchpadViewController _setupTouchpadView](self, "_setupTouchpadView");
  if (_AXSAppleTVRemoteUsesSimpleGestures())
    -[TVRUITouchpadViewController _transitionToDirectionalControlView](self, "_transitionToDirectionalControlView");
  else
    -[TVRUITouchpadViewController _transitionToTouchpadView](self, "_transitionToTouchpadView");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__simpleRemoteGesturesEnabled_, *MEMORY[0x24BED26D8], 0);

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Registered to listen for accessibility simple remote gestures", v8, 2u);
  }

  -[TVRUITouchpadViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD828]), "initWithDelegate:", self);
  objc_msgSend(v5, "addInteraction:", v6);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:object:", self, sel__darkenSystemColorsChanged_, *MEMORY[0x24BEBDDE8], 0);

  -[TVRUITouchpadViewController setEnabled:](self, "setEnabled:", 1);
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
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TVRUITouchpadViewController;
  -[TVRUITouchpadViewController viewWillLayoutSubviews](&v34, sel_viewWillLayoutSubviews);
  -[TVRUITouchpadViewController backgroundView](self, "backgroundView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[TVRUITouchpadViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    -[TVRUITouchpadViewController backgroundView](self, "backgroundView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
  -[TVRUITouchpadViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v16, v18, v20, v22);

  -[TVRUITouchpadViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setFrame:", v26, v28, v30, v32);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TVRUITouchpadViewController;
  -[TVRUITouchpadViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x24BED26D8], 0);

  _TVRUIViewControllerLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_21B042000, v5, OS_LOG_TYPE_DEFAULT, "Unregistered to listen for accessibility simple remote gestures", v6, 2u);
  }

}

- (void)transitonToViewForDeviceType:(int64_t)a3
{
  if (a3 == 2)
    -[TVRUITouchpadViewController _transitionToDirectionalControlView](self, "_transitionToDirectionalControlView");
  else
    -[TVRUITouchpadViewController _transitionToTouchpadView](self, "_transitionToTouchpadView");
}

- (void)_setupTouchpadView
{
  TVRUITouchpadView *v3;
  TVRUITouchpadView *touchpadView;
  void *v5;
  void *v6;
  TVRUIStandardTouchProcessor *v7;
  TVRUITouchProcessor *touchProcessor;
  TVRUITouchProcessor *v9;
  id v10;

  v3 = objc_alloc_init(TVRUITouchpadView);
  touchpadView = self->_touchpadView;
  self->_touchpadView = v3;

  -[TVRUITouchpadView setAutoresizingMask:](self->_touchpadView, "setAutoresizingMask:", 18);
  -[TVRUITouchpadViewController touchDelegate](self, "touchDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadView setTouchDelegate:](self->_touchpadView, "setTouchDelegate:", v5);

  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadView setBackgroundColor:](self->_touchpadView, "setBackgroundColor:", v6);

  v7 = -[TVRUIStandardTouchProcessor initWithTouchpadView:]([TVRUIStandardTouchProcessor alloc], "initWithTouchpadView:", self->_touchpadView);
  touchProcessor = self->_touchProcessor;
  self->_touchProcessor = (TVRUITouchProcessor *)v7;

  v9 = self->_touchProcessor;
  -[TVRUITouchpadViewController eventDelegate](self, "eventDelegate");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchProcessor setEventDelegate:](v9, "setEventDelegate:", v10);

}

- (void)_setupDirectionalArrowView
{
  TVRUIDirectionalControlView *v3;
  void *v4;
  TVRUIDirectionalControlView *v5;
  TVRUIDirectionalControlView *directionalControlView;
  void *v7;
  id v8;

  v3 = [TVRUIDirectionalControlView alloc];
  -[TVRUITouchpadViewController styleProvider](self, "styleProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TVRUIDirectionalControlView initWithStyleProvider:](v3, "initWithStyleProvider:", v4);
  directionalControlView = self->_directionalControlView;
  self->_directionalControlView = v5;

  -[TVRUIDirectionalControlView setAutoresizingMask:](self->_directionalControlView, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUIDirectionalControlView setBackgroundColor:](self->_directionalControlView, "setBackgroundColor:", v7);

  -[TVRUITouchpadViewController eventDelegate](self, "eventDelegate");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRUIDirectionalControlView setEventDelegate:](self->_directionalControlView, "setEventDelegate:", v8);

}

- (void)_transitionToTouchpadView
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;

  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);

  if (v6)
  {
    v7 = (void *)MEMORY[0x24BEBDB00];
    -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionFromView:toView:duration:options:completion:", v8, v9, 5242880, 0, 0.2);
  }
  else
  {
    -[TVRUITouchpadViewController view](self, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);
  }

  -[TVRUITouchpadViewController setTouchpadMode:](self, "setTouchpadMode:", 0);
}

- (void)_transitionToDirectionalControlView
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    -[TVRUITouchpadViewController _setupDirectionalArrowView](self, "_setupDirectionalArrowView");
  -[TVRUITouchpadViewController eventDelegate](self, "eventDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  if ((v5 & 1) != 0)
  {
    -[TVRUITouchpadViewController eventDelegate](self, "eventDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "willShowDirectionalControls");

  }
  -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "superview");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqual:", v9);

  if (v10)
  {
    v11 = (void *)MEMORY[0x24BEBDB00];
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transitionFromView:toView:duration:options:completion:", v12, v13, 5242880, 0, 0.2);
  }
  else
  {
    -[TVRUITouchpadViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);
  }

  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAlpha:", 1.0);

  -[TVRUITouchpadViewController setTouchpadMode:](self, "setTouchpadMode:", 1);
  -[TVRUITouchpadViewController _toggleControlScale](self, "_toggleControlScale");
}

- (void)setDevice:(id)a3
{
  objc_storeStrong((id *)&self->_remoteDevice, a3);
  -[TVRUITouchpadViewController _transitionToAppropriateView](self, "_transitionToAppropriateView");
}

- (void)_transitionToAppropriateView
{
  int v3;
  int64_t v4;

  if (-[TVRUIDevice supportsTouchEvents](self->_remoteDevice, "supportsTouchEvents"))
  {
    v3 = _AXSAppleTVRemoteUsesSimpleGestures();
    v4 = -[TVRUITouchpadViewController touchpadMode](self, "touchpadMode");
    if (!v3)
    {
      if (v4)
        -[TVRUITouchpadViewController _transitionToTouchpadView](self, "_transitionToTouchpadView");
      return;
    }
  }
  else
  {
    v4 = -[TVRUITouchpadViewController touchpadMode](self, "touchpadMode");
  }
  if (v4 != 1)
    -[TVRUITouchpadViewController _transitionToDirectionalControlView](self, "_transitionToDirectionalControlView");
}

- (void)_updateViewState
{
  BOOL v3;
  double v4;
  double v5;
  void *v6;
  id v7;

  if (-[TVRUITouchpadViewController isShowingControls](self, "isShowingControls"))
  {
    v3 = -[TVRUITouchpadViewController enabled](self, "enabled");
    if (v3)
    {
      v4 = 1.0;
    }
    else
    {
      -[TVRUITouchpadViewController styleProvider](self, "styleProvider");
      v7 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "disabledButtonAlpha");
      v4 = v5;
    }
    -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAlpha:", v4);

    if (!v3)
  }
}

- (void)setEnabled:(BOOL)a3
{
  if (self->_enabled != a3)
  {
    self->_enabled = a3;
    -[TVRUITouchpadViewController _updateViewState](self, "_updateViewState");
  }
}

- (void)setShowControls:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  double v9;
  void *v10;
  id v11;

  v3 = a3;
  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);

  if (v8)
  {
    if (v3)
      v9 = 1.0;
    else
      v9 = 0.0;
    -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAlpha:", v9);

    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setUserInteractionEnabled:", v3);

  }
}

- (BOOL)isShowingControls
{
  void *v2;
  double v3;
  BOOL v4;

  -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "alpha");
  v4 = v3 > 0.0;

  return v4;
}

- (void)setMediaControlsAreVisible:(BOOL)a3
{
  if (self->_mediaControlsAreVisible != a3)
  {
    self->_mediaControlsAreVisible = a3;
    -[TVRUITouchpadViewController _toggleControlScale](self, "_toggleControlScale");
  }
}

- (void)_toggleControlScale
{
  NSObject *v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  _DWORD v9[2];
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[TVRUITouchpadViewController isShowingControls](self, "isShowingControls");
    -[TVRUITouchpadViewController styleProvider](self, "styleProvider");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v9[0] = 67109376;
    v9[1] = v4;
    v10 = 1024;
    v11 = objc_msgSend(v5, "isSmallDevice");
    _os_log_impl(&dword_21B042000, v3, OS_LOG_TYPE_DEFAULT, "#directional - toggleControlState %d %d", (uint8_t *)v9, 0xEu);

  }
  if (-[TVRUITouchpadViewController isShowingControls](self, "isShowingControls"))
  {
    -[TVRUITouchpadViewController styleProvider](self, "styleProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isSmallDevice");

    if (v7)
    {
      -[TVRUITouchpadViewController directionalControlView](self, "directionalControlView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setOffsetDirectionalPad:", self->_mediaControlsAreVisible);

    }
  }
}

- (void)_simpleRemoteGesturesEnabled:(id)a3
{
  NSObject *v4;
  uint8_t v5[16];

  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "Accessibility simple remote gestures enabled notification received", v5, 2u);
  }

  -[TVRUITouchpadViewController _transitionToAppropriateView](self, "_transitionToAppropriateView");
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[TVRUITouchpadViewController touchpadMode](self, "touchpadMode"))
  {
    -[TVRUITouchpadViewController touchProcessor](self, "touchProcessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesBegan:touches:withEvent:", v8, v9, v6);

  }
}

- (void)touchesMoved:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[TVRUITouchpadViewController touchpadMode](self, "touchpadMode"))
  {
    -[TVRUITouchpadViewController touchProcessor](self, "touchProcessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesMoved:touches:withEvent:", v8, v9, v6);

  }
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[TVRUITouchpadViewController touchpadMode](self, "touchpadMode"))
  {
    -[TVRUITouchpadViewController touchProcessor](self, "touchProcessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesEnded:touches:withEvent:", v8, v9, v6);

  }
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (!-[TVRUITouchpadViewController touchpadMode](self, "touchpadMode"))
  {
    -[TVRUITouchpadViewController touchProcessor](self, "touchProcessor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[TVRUITouchpadViewController touchpadView](self, "touchpadView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "touchesCancelled:touches:withEvent:", v8, v9, v6);

  }
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  return a5;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  return 0;
}

- (void)pointerInteraction:(id)a3 willEnterRegion:(id)a4 animator:(id)a5
{
  NSObject *v6;
  NSObject *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVRUITouchpadViewController pointerInteraction:willEnterRegion:animator:]";
    _os_log_impl(&dword_21B042000, v6, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  if (-[TVRUITouchpadViewController touchpadMode](self, "touchpadMode") != 1)
  {
    _TVRUIViewControllerLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v8) = 0;
      _os_log_impl(&dword_21B042000, v7, OS_LOG_TYPE_DEFAULT, "Transitioning to directional controls because a pointer entered the touchpad", (uint8_t *)&v8, 2u);
    }

    -[TVRUITouchpadViewController _transitionToDirectionalControlView](self, "_transitionToDirectionalControlView");
  }
}

- (void)_darkenSystemColorsChanged:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  _TVRUIViewControllerLog();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136315138;
    v9 = "-[TVRUITouchpadViewController _darkenSystemColorsChanged:]";
    _os_log_impl(&dword_21B042000, v4, OS_LOG_TYPE_DEFAULT, "%s", (uint8_t *)&v8, 0xCu);
  }

  -[TVRUITouchpadViewController styleProvider](self, "styleProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "touchpadBackgroundColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRUITouchpadViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v6);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)enabled
{
  return self->_enabled;
}

- (_TVRUIEventDelegate)eventDelegate
{
  return (_TVRUIEventDelegate *)objc_loadWeakRetained((id *)&self->_eventDelegate);
}

- (void)setEventDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_eventDelegate, a3);
}

- (TVRUITouchpadDelegate)touchDelegate
{
  return (TVRUITouchpadDelegate *)objc_loadWeakRetained((id *)&self->_touchDelegate);
}

- (void)setTouchDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_touchDelegate, a3);
}

- (BOOL)areMediaControlsVisible
{
  return self->_mediaControlsAreVisible;
}

- (TVRUITouchpadView)touchpadView
{
  return self->_touchpadView;
}

- (void)setTouchpadView:(id)a3
{
  objc_storeStrong((id *)&self->_touchpadView, a3);
}

- (TVRUIDirectionalControlView)directionalControlView
{
  return self->_directionalControlView;
}

- (void)setDirectionalControlView:(id)a3
{
  objc_storeStrong((id *)&self->_directionalControlView, a3);
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

- (int64_t)touchpadMode
{
  return self->_touchpadMode;
}

- (void)setTouchpadMode:(int64_t)a3
{
  self->_touchpadMode = a3;
}

- (TVRUITouchProcessor)touchProcessor
{
  return self->_touchProcessor;
}

- (void)setTouchProcessor:(id)a3
{
  objc_storeStrong((id *)&self->_touchProcessor, a3);
}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_storeStrong((id *)&self->_touchProcessor, 0);
  objc_storeStrong((id *)&self->_styleProvider, 0);
  objc_storeStrong((id *)&self->_remoteDevice, 0);
  objc_storeStrong((id *)&self->_directionalControlView, 0);
  objc_storeStrong((id *)&self->_touchpadView, 0);
  objc_destroyWeak((id *)&self->_touchDelegate);
  objc_destroyWeak((id *)&self->_eventDelegate);
}

@end
