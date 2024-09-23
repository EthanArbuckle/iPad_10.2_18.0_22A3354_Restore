@implementation SKUILoadingViewController

- (SKUILoadingViewController)initWithClientContext:(id)a3
{
  id v5;
  SKUILoadingViewController *v6;
  SKUILoadingViewController *v7;
  objc_super v9;

  v5 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    -[SKUILoadingViewController initWithClientContext:].cold.1();
  }
  v9.receiver = self;
  v9.super_class = (Class)SKUILoadingViewController;
  v6 = -[SKUILoadingViewController initWithNibName:bundle:](&v9, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_clientContext, a3);

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SKUILoadingViewController;
  -[SKUILoadingViewController viewDidLoad](&v7, sel_viewDidLoad);
  -[SKUILoadingViewController backgroundColor](self, "backgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[SKUILoadingViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v4);

  if (!v3)
  -[SKUILoadingViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityIgnoresInvertColors:", 1);

  -[SKUILoadingViewController _initializeLoadingView](self, "_initializeLoadingView");
}

- (void)_initializeLoadingView
{
  _UNKNOWN **v3;
  SKUILoadingView *v4;
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
  id v15;

  v3 = &off_1E739E000;
  v4 = objc_alloc_init(SKUILoadingView);
  -[SKUILoadingViewController setLoadingView:](self, "setLoadingView:", v4);

  -[SKUILoadingViewController loadingText](self, "loadingText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[SKUILoadingViewController loadingText](self, "loadingText");
  }
  else
  {
    -[SKUILoadingViewController clientContext](self, "clientContext");
    v3 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue();
    +[SKUILoadingView defaultLoadingTextWithClientContext:](SKUILoadingView, "defaultLoadingTextWithClientContext:", v3);
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setLoadingText:", v6);

  if (!v5)
  {

    v6 = v3;
  }

  -[SKUILoadingViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "backgroundColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[SKUILoadingViewController spinnerColorScheme](self, "spinnerColorScheme");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setColorScheme:", v11);

  -[SKUILoadingViewController loadingView](self, "loadingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "sizeToFit");

  -[SKUILoadingViewController view](self, "view");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "addSubview:", v14);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGFloat v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double Width;
  CGFloat v19;
  CGFloat v20;
  double v21;
  void *v22;
  CGRect rect;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  -[SKUILoadingViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  rect.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;

  v24.origin.x = v5;
  v24.origin.y = v7;
  v24.size.width = v9;
  v24.size.height = v11;
  Width = CGRectGetWidth(v24);
  v25.origin.x = rect.origin.x;
  v25.origin.y = v12;
  v25.size.width = v15;
  v25.size.height = v17;
  v19 = floor((Width - CGRectGetWidth(v25)) * 0.5);
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  v20 = CGRectGetHeight(v26) * 0.5;
  v27.origin.x = v19;
  v27.origin.y = v12;
  v27.size.width = v15;
  v27.size.height = v17;
  v21 = floor(v20 - CGRectGetHeight(v27));
  -[SKUILoadingViewController loadingView](self, "loadingView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v19, v21, v15, v17);

  *(_QWORD *)&rect.origin.y = self;
  *(_QWORD *)&rect.size.width = SKUILoadingViewController;
  -[CGFloat viewDidLayoutSubviews]((objc_super *)&rect.origin.y, sel_viewDidLayoutSubviews);
}

- (SKUIClientContext)clientContext
{
  return self->_clientContext;
}

- (NSString)loadingText
{
  return self->_loadingText;
}

- (void)setLoadingText:(id)a3
{
  objc_storeStrong((id *)&self->_loadingText, a3);
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (void)setBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundColor, a3);
}

- (SKUIColorScheme)spinnerColorScheme
{
  return self->_spinnerColorScheme;
}

- (void)setSpinnerColorScheme:(id)a3
{
  objc_storeStrong((id *)&self->_spinnerColorScheme, a3);
}

- (SKUILoadingView)loadingView
{
  return self->_loadingView;
}

- (void)setLoadingView:(id)a3
{
  objc_storeStrong((id *)&self->_loadingView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loadingView, 0);
  objc_storeStrong((id *)&self->_spinnerColorScheme, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_loadingText, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

- (void)initWithClientContext:.cold.1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "-[SKUILoadingViewController initWithClientContext:]";
}

@end
