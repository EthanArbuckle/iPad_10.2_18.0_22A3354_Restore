@implementation STActivityIndicatingWebView

- (STActivityIndicatingWebView)initWithConfiguration:(id)a3
{
  id v4;
  STActivityIndicatingWebView *v5;
  uint64_t v6;
  UIActivityIndicatorView *activityView;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)STActivityIndicatingWebView;
  v5 = -[STActivityIndicatingWebView initWithFrame:configuration:](&v17, sel_initWithFrame_configuration_, v4, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x24BEBD398]), "initWithActivityIndicatorStyle:", 101);
  activityView = v5->_activityView;
  v5->_activityView = (UIActivityIndicatorView *)v6;

  objc_initWeak(&location, v5);
  v18[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __53__STActivityIndicatingWebView_initWithConfiguration___block_invoke;
  v14 = &unk_24DB86418;
  objc_copyWeak(&v15, &location);
  -[STActivityIndicatingWebView registerForTraitChanges:withHandler:](v5, "registerForTraitChanges:withHandler:", v8, &v11);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[STActivityIndicatingWebView setInterfaceStyleObservation:](v5, "setInterfaceStyleObservation:", v9, v11, v12, v13, v14);

  -[STActivityIndicatingWebView setNavigationDelegate:](v5, "setNavigationDelegate:", v5);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v5;
}

void __53__STActivityIndicatingWebView_initWithConfiguration___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "didChangeUserInterfaceStyle");

}

- (void)didChangeUserInterfaceStyle
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[STActivityIndicatingWebView superview](self, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[STActivityIndicatingWebView traitCollection](self, "traitCollection");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceStyle") == 2)
      objc_msgSend(MEMORY[0x24BEBD4B8], "blackColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[STActivityIndicatingWebView superview](self, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setBackgroundColor:", v4);

  }
}

- (void)hostActivityIndicatorInView:(id)a3
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[3];

  v20[2] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[STActivityIndicatingWebView activityView](self, "activityView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    -[STActivityIndicatingWebView activityView](self, "activityView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[STActivityIndicatingWebView activityView](self, "activityView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addSubview:", v8);

    v18 = (void *)MEMORY[0x24BDD1628];
    -[STActivityIndicatingWebView activityView](self, "activityView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "centerXAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerXAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = v11;
    -[STActivityIndicatingWebView activityView](self, "activityView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "centerYAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "centerYAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v20[1] = v15;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "activateConstraints:", v16);

    -[STActivityIndicatingWebView setAlpha:](self, "setAlpha:", 0.0);
    -[STActivityIndicatingWebView activityView](self, "activityView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "startAnimating");

  }
}

- (void)webView:(id)a3 didFinishNavigation:(id)a4
{
  void *v5;
  _QWORD v6[5];

  -[STActivityIndicatingWebView activityView](self, "activityView", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stopAnimating");

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __59__STActivityIndicatingWebView_webView_didFinishNavigation___block_invoke;
  v6[3] = &unk_24DB86440;
  v6[4] = self;
  objc_msgSend(MEMORY[0x24BEBDB00], "animateWithDuration:animations:", v6, 0.25);
}

uint64_t __59__STActivityIndicatingWebView_webView_didFinishNavigation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

- (UIActivityIndicatorView)activityView
{
  return self->_activityView;
}

- (void)setActivityView:(id)a3
{
  objc_storeStrong((id *)&self->_activityView, a3);
}

- (UITraitChangeRegistration)interfaceStyleObservation
{
  return self->_interfaceStyleObservation;
}

- (void)setInterfaceStyleObservation:(id)a3
{
  objc_storeStrong((id *)&self->_interfaceStyleObservation, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_interfaceStyleObservation, 0);
  objc_storeStrong((id *)&self->_activityView, 0);
}

@end
