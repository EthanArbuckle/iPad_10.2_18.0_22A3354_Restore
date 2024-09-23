@implementation _TVAppLoadingView

+ (id)loadingScreen
{
  if (loadingScreen_onceToken != -1)
    dispatch_once(&loadingScreen_onceToken, &__block_literal_global_14);
  return (id)loadingScreen_loadingScreen;
}

- (void)setTimeout:(double)a3
{
  self->_timeout = a3;
}

- (void)setLoadingDelay:(double)a3
{
  self->_delay = a3;
}

- (void)showOverKeyWindow
{
  -[_TVAppLoadingView showOverKeyWindowWithSpinnerOnly:](self, "showOverKeyWindowWithSpinnerOnly:", 0);
}

- (void)showOverKeyWindowWithSpinnerOnly:(BOOL)a3
{
  _TVLoadingOverlayWindow *v4;
  UIWindow *v5;
  UIWindow *overlayWindow;
  UIWindow *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double delay;
  dispatch_time_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t);
  void *v25;
  id v26;
  _QWORD v27[5];

  -[UIImageView setHidden:](self->_maskView, "setHidden:", a3);
  if (!self->_overlayWindow)
  {
    v4 = [_TVLoadingOverlayWindow alloc];
    -[_TVAppLoadingView bounds](self, "bounds");
    v5 = -[_TVLoadingOverlayWindow initWithFrame:](v4, "initWithFrame:");
    overlayWindow = self->_overlayWindow;
    self->_overlayWindow = v5;

    -[UIWindow setWindowLevel:](self->_overlayWindow, "setWindowLevel:", *MEMORY[0x24BDF8000]);
    v7 = self->_overlayWindow;
    v8 = objc_alloc_init(MEMORY[0x24BDF6F98]);
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
  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "keyWindow");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[_TVAppLoadingView superview](self, "superview");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isEqual:", v13);

  if ((v15 & 1) == 0)
  {
    -[UIWindow setHidden:](self->_overlayWindow, "setHidden:", 0);
    -[UIWindow rootViewController](self->_overlayWindow, "rootViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setView:", self);

    -[UIView setAlpha:](self->_wallpaperView, "setAlpha:", 1.0);
    -[_TVAppLoadingView setAlpha:](self, "setAlpha:", 1.0);
    -[UIImageView setAlpha:](self->_maskView, "setAlpha:", 1.0);
    -[UIVisualEffectView _setTintOpacity:](self->_visualEffectView, "_setTintOpacity:", 1.0);
    -[UIActivityIndicatorView setAlpha:](self->_spinner, "setAlpha:", 0.0);
    v17 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke;
    v27[3] = &unk_24EB85D28;
    v27[4] = self;
    v18 = MEMORY[0x22767F470](v27);
    v19 = (void *)v18;
    delay = self->_delay;
    if (delay == 0.0)
    {
      (*(void (**)(uint64_t, double))(v18 + 16))(v18, 0.2);
    }
    else
    {
      v21 = dispatch_time(0, (uint64_t)(delay * 1000000000.0));
      v22 = v17;
      v23 = 3221225472;
      v24 = __54___TVAppLoadingView_showOverKeyWindowWithSpinnerOnly___block_invoke_3;
      v25 = &unk_24EB85320;
      v26 = v19;
      dispatch_after(v21, MEMORY[0x24BDAC9B8], &v22);

    }
    -[_TVAppLoadingView performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_timeout, 0, self->_timeout, v22, v23, v24, v25);

  }
}

- (void)timeout
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[_TVAppLoadingView isVisible](self, "isVisible"))
  {
    v3 = TVMLKitLogObject;
    if (os_log_type_enabled((os_log_t)TVMLKitLogObject, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_222D98000, v3, OS_LOG_TYPE_DEFAULT, "_TVAppLoadingView timed out, hiding", v4, 2u);
    }
    -[_TVAppLoadingView hide](self, "hide");
  }
}

- (void)hide
{
  _QWORD v3[5];
  _QWORD v4[5];

  if (-[_TVAppLoadingView isVisible](self, "isVisible"))
  {
    if (!self->_hiding)
    {
      objc_msgSend(MEMORY[0x24BEDCDF0], "cancelPreviousPerformRequestsWithTarget:selector:object:", self, sel_timeout, 0);
      self->_hiding = 1;
      self->_delay = 0.0;
      v3[4] = self;
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = __25___TVAppLoadingView_hide__block_invoke;
      v4[3] = &unk_24EB85440;
      v4[4] = self;
      v3[0] = MEMORY[0x24BDAC760];
      v3[1] = 3221225472;
      v3[2] = __25___TVAppLoadingView_hide__block_invoke_2;
      v3[3] = &unk_24EB85A38;
      objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 6, v4, v3, 0.6, 0.0);
    }
  }
}

- (BOOL)isVisible
{
  double v2;

  -[_TVAppLoadingView alpha](self, "alpha");
  return v2 >= 1.0;
}

- (double)hideAnimationDuration
{
  return 0.6;
}

- (_TVAppLoadingView)initWithFrame:(CGRect)a3 templateImage:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  _TVAppLoadingView *v10;
  _TVAppLoadingView *v11;
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
  _TVVisualEffectView *v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  uint64_t v46;
  id v47;
  double v48;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v10 = -[_TVAppLoadingView initWithFrame:](self, "initWithFrame:", x, y, width, height);
  v11 = v10;
  if (v10)
  {
    -[_TVAppLoadingView bounds](v10, "bounds");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;
    v20 = v11;
    objc_msgSend(v20, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v21, "setAllowsGroupBlending:", 0);
    if (v9)
    {
      v22 = (void *)MEMORY[0x24BDF6F88];
      objc_msgSend(MEMORY[0x24BDF6878], "effectWithStyle:", 1000);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "effectForBlurEffect:", v23);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      v25 = -[_TVVisualEffectView initWithEffect:]([_TVVisualEffectView alloc], "initWithEffect:", v24);
      v26 = v20[58];
      v20[58] = v25;

      objc_msgSend(v20[58], "setAutoresizingMask:", 18);
      objc_msgSend(v20[58], "setFrame:", v13, v15, v17, v19);
      v27 = objc_alloc(MEMORY[0x24BDF6AE8]);
      objc_msgSend(v9, "imageWithRenderingMode:", 2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v27, "initWithImage:", v28);
      v30 = v20[57];
      v20[57] = (id)v29;

      objc_msgSend(v20[58], "contentView");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "addSubview:", v20[57]);

      objc_msgSend(v20[57], "layer");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "setAllowsGroupOpacity:", 0);

      objc_msgSend(v20, "addSubview:", v20[58]);
      objc_msgSend(v20[58], "contentView");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v33 = v20;
    }
    objc_msgSend(MEMORY[0x24BDF6950], "grayColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = *MEMORY[0x24BDF8028];
    objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "addObserver:selector:name:object:", v20, sel_didRotate_, v36, v37);

    objc_msgSend(MEMORY[0x24BDF67D0], "defaultSizeForStyle:", 100);
    UIRectCenteredIntegralRect();
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    v46 = objc_msgSend(objc_alloc(MEMORY[0x24BDF67D0]), "initWithActivityIndicatorStyle:", 100);
    v47 = v20[59];
    v20[59] = (id)v46;

    if (v34)
      objc_msgSend(v20[59], "setColor:", v34);
    if (v9)
      v48 = v41 + 50.0;
    else
      v48 = v41;
    objc_msgSend(v20[59], "setFrame:", v39, v48, v43, v45);
    objc_msgSend(v33, "addSubview:", v20[59]);
    objc_msgSend(v20[59], "startAnimating");

  }
  return v11;
}

- (void)didRotate:(id)a3
{
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
  double v14;

  -[UIActivityIndicatorView frame](self->_spinner, "frame", a3);
  objc_msgSend((id)*MEMORY[0x24BDF74F8], "keyWindow");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  UIRectCenteredIntegralRect();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[UIImageView image](self->_maskView, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
    v14 = v8 + 50.0;
  else
    v14 = v8;
  -[UIActivityIndicatorView setFrame:](self->_spinner, "setFrame:", v6, v14, v10, v12);
}

- (UIActivityIndicatorView)spinner
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
