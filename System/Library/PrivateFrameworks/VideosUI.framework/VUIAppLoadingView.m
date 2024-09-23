@implementation VUIAppLoadingView

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

+ (id)loadingScreen
{
  if (loadingScreen_onceToken[0] != -1)
    dispatch_once(loadingScreen_onceToken, &__block_literal_global_59);
  return (id)loadingScreen_loadingScreen;
}

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "startAnimating");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 1.0);
}

- (VUIAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  VUIAppLoadingView *v10;
  VUIAppLoadingView *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  void *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  id v40;
  double v41;
  double v42;
  double v43;
  double v44;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[VUIAppLoadingView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[VUIAppLoadingView bounds](v10, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v11;
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v21, "setAllowsGroupBlending:", 0);
    v22 = v20;
    if (v9)
    {
      v23 = (void *)MEMORY[0x1E0DC3F08];
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 1000);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "effectForBlurEffect:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v26 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F58]), "initWithEffect:", v25);
      v27 = v20[58];
      v20[58] = (id)v26;

      objc_msgSend(v20[58], "setAutoresizingMask:", 18);
      objc_msgSend(v20[58], "setFrame:", v13, v15, v17, v19);
      v28 = (void *)MEMORY[0x1E0DC3890];
      objc_msgSend(v9, "vuiTemplateImage");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "vui_imageViewWithImage:", v29);
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = v20[57];
      v20[57] = (id)v30;

      objc_msgSend(v20[58], "contentView");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "addSubview:", v20[57]);

      objc_msgSend(v20[57], "layer");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "setAllowsGroupOpacity:", 0);

      v34 = v20[57];
      objc_msgSend(v20[58], "bounds");
      objc_msgSend(v34, "setFrame:");
      objc_msgSend(v20, "addSubview:", v20[58]);
      objc_msgSend(v20[58], "contentView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x1E0DC3658], "grayColor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = *MEMORY[0x1E0DC5660];
    objc_msgSend((id)*MEMORY[0x1E0DC4730], "keyWindow");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObserver:selector:name:object:", v20, sel_didRotate_, v37, v38);

    +[VUIActivityIndicatorView vui_activityIndicatorViewWithActivityIndicatorStyle:](VUIActivityIndicatorView, "vui_activityIndicatorViewWithActivityIndicatorStyle:", 0);
    v39 = objc_claimAutoreleasedReturnValue();
    v40 = v20[59];
    v20[59] = (id)v39;

    if (v35)
      objc_msgSend(v20[59], "setColor:", v35);
    objc_msgSend(v20[59], "sizeToFit");
    objc_msgSend(v20[59], "bounds");
    v42 = round(v13 + (v17 - v41) * 0.5);
    v44 = round(v15 + (v19 - v43) * 0.5);
    if (v9)
      v44 = v44 + 50.0;
    objc_msgSend(v20[59], "setFrame:", v42, v44);
    objc_msgSend(v22, "addSubview:", v20[59]);
    objc_msgSend(v20[59], "vui_startAnimating");

  }
  return v11;
}

- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3
{
  _VUILoadingOverlayWindow *v4;
  UIWindow *v5;
  UIWindow *overlayWindow;
  UIWindow *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  double delay;
  dispatch_time_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t);
  void *v24;
  id v25;
  _QWORD aBlock[5];

  -[UIImageView setHidden:](self->_maskView, "setHidden:", a3);
  if (!self->_overlayWindow)
  {
    v4 = [_VUILoadingOverlayWindow alloc];
    -[VUIAppLoadingView bounds](self, "bounds");
    v5 = -[_VUILoadingOverlayWindow initWithFrame:](v4, "initWithFrame:");
    overlayWindow = self->_overlayWindow;
    self->_overlayWindow = v5;

    -[UIWindow setWindowLevel:](self->_overlayWindow, "setWindowLevel:", *MEMORY[0x1E0DC5628]);
    v7 = self->_overlayWindow;
    v8 = objc_alloc_init(MEMORY[0x1E0DC3F20]);
    -[UIWindow setRootViewController:](v7, "setRootViewController:", v8);

    -[UIWindow layer](self->_overlayWindow, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "superlayer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAllowsGroupOpacity:", 0);

    -[UIWindow layer](self->_overlayWindow, "layer");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setAllowsGroupOpacity:", 0);

    -[UIWindow setBackgroundColor:](self->_overlayWindow, "setBackgroundColor:", 0);
  }
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIAppLoadingView superview](self, "superview");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isEqual:", v12);

  if ((v14 & 1) == 0)
  {
    -[UIWindow setVuiHidden:](self->_overlayWindow, "setVuiHidden:", 0);
    -[UIWindow rootViewController](self->_overlayWindow, "rootViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setView:", self);

    -[UIView setVuiAlpha:](self->_wallpaperView, "setVuiAlpha:", 1.0);
    -[VUIAppLoadingView setVuiAlpha:](self, "setVuiAlpha:", 1.0);
    -[UIImageView setVuiAlpha:](self->_maskView, "setVuiAlpha:", 1.0);
    -[UIVisualEffectView _setTintOpacity:](self->_visualEffectView, "_setTintOpacity:", 1.0);
    -[VUIActivityIndicatorView setVuiAlpha:](self->_spinner, "setVuiAlpha:", 0.0);
    v16 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke;
    aBlock[3] = &unk_1E9F9DBE0;
    aBlock[4] = self;
    v17 = _Block_copy(aBlock);
    v18 = v17;
    delay = self->_delay;
    if (delay <= 0.0)
    {
      (*((void (**)(void *, double))v17 + 2))(v17, 0.2);
    }
    else
    {
      v20 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      v21 = v16;
      v22 = 3221225472;
      v23 = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3;
      v24 = &unk_1E9F98E68;
      v25 = v18;
      dispatch_after(v20, MEMORY[0x1E0C80D38], &v21);

    }
    -[VUIAppLoadingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_timeout, 0, self->_timeout, v21, v22, v23, v24);

  }
}

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke(uint64_t a1, double a2)
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_2;
  v3[3] = &unk_1E9F98DF0;
  v3[4] = *(_QWORD *)(a1 + 32);
  return objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v3, 0, 0.6, a2);
}

void __34__VUIAppLoadingView_loadingScreen__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  int v4;
  VUIAppLoadingView *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v0 = (void *)MEMORY[0x1E0DC3870];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceIdiom:", 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "imageNamed:inBundle:compatibleWithTraitCollection:", CFSTR("LaunchImage"), v11, v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "objectForInfoDictionaryKey:", CFSTR("UITemplateLaunchImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  v5 = [VUIAppLoadingView alloc];
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  if (v4)
    v7 = v2;
  else
    v7 = 0;
  v8 = -[VUIAppLoadingView initWithFrame:templateImage:](v5, "initWithFrame:templateImage:", v7);
  v9 = (void *)loadingScreen_loadingScreen;
  loadingScreen_loadingScreen = v8;

  v10 = loadingScreen_loadingScreen;
  *(_QWORD *)(loadingScreen_loadingScreen + 440) = 0x4024000000000000;
  *(_QWORD *)(v10 + 448) = 0;

}

uint64_t __25__VUIAppLoadingView_hide__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "stopAnimating");
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 432) = 0;
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "setHidden:", 1);
}

uint64_t __25__VUIAppLoadingView_hide__block_invoke(uint64_t a1)
{
  id *v2;

  v2 = *(id **)(a1 + 32);
  if (v2[58])
  {
    objc_msgSend(v2[58], "_setTintOpacity:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 472), "setAlpha:", 0.0);
    v2 = *(id **)(*(_QWORD *)(a1 + 32) + 416);
  }
  return objc_msgSend(v2, "setAlpha:", 0.0);
}

- (BOOL)isVisible
{
  double v2;

  -[VUIAppLoadingView vuiAlpha](self, "vuiAlpha");
  return v2 >= 1.0;
}

- (void)hide
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[VUIAppLoadingView isVisible](self, "isVisible"))
  {
    if (!self->_hiding)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_timeout, 0);
      self->_hiding = 1;
      self->_delay = 0.0;
      v3[4] = self;
      v4[0] = MEMORY[0x1E0C809B0];
      v4[1] = 3221225472;
      v4[2] = __25__VUIAppLoadingView_hide__block_invoke;
      v4[3] = &unk_1E9F98DF0;
      v4[4] = self;
      v3[0] = MEMORY[0x1E0C809B0];
      v3[1] = 3221225472;
      v3[2] = __25__VUIAppLoadingView_hide__block_invoke_2;
      v3[3] = &unk_1E9F9B4F8;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v4, v3, 0.6, 0.0);
    }
  }
}

- (void)setLoadingDelay:(double)a3
{
  self->_delay = a3;
}

- (void)showOverKeyWindow
{
  -[VUIAppLoadingView showOverKeyWindowWithSpinnerOnly:](self, "showOverKeyWindowWithSpinnerOnly:", 0);
}

uint64_t __54__VUIAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.0);
}

- (void)timeout
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[VUIAppLoadingView isVisible](self, "isVisible"))
  {
    VUIDefaultLogObject();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D96EE000, v3, OS_LOG_TYPE_INFO, "VUIAppLoadingView - VUIAppLoadingView timed out, hiding", v4, 2u);
    }

    -[VUIAppLoadingView hide](self, "hide");
  }
}

- (void)hideImmediately
{
  if (-[VUIAppLoadingView isVisible](self, "isVisible"))
  {
    if (!self->_hiding)
    {
      objc_msgSend(MEMORY[0x1E0DE7910], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_timeout, 0);
      self->_hiding = 1;
      self->_delay = 0.0;
      -[VUIAppLoadingView setAlpha:](self, "setAlpha:", 0.0);
      -[VUIActivityIndicatorView stopAnimating](self->_spinner, "stopAnimating");
      self->_hiding = 0;
      -[UIWindow setHidden:](self->_overlayWindow, "setHidden:", 1);
    }
  }
}

- (double)hideAnimationDuration
{
  return 0.6;
}

- (void)didRotate:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;

  -[VUIActivityIndicatorView frame](self->_spinner, "frame", a3);
  v5 = v4;
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0DC3F98], "vui_keyWindow");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v11 = round(v10 + (v9 - v5) * 0.5);
  v14 = round(v13 + (v12 - v7) * 0.5);

  -[UIImageView image](self->_maskView, "image");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
    v16 = v14 + 50.0;
  else
    v16 = v14;
  -[VUIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v11, v16, v5, v7);
}

- (VUIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setSpinner:(id)a3
{
  objc_storeStrong((id *)&self->_spinner, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_maskView, 0);
  objc_storeStrong((id *)&self->_overlayWindow, 0);
  objc_storeStrong((id *)&self->_wallpaperView, 0);
}

@end
