@implementation SSChromePlaceholderViewController

- (int64_t)preferredStatusBarStyle
{
  return +[SSChromeHelper statusBarStyle](SSChromeHelper, "statusBarStyle");
}

- (void)viewDidLayoutSubviews
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
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SSChromePlaceholderViewController;
  -[SSChromePlaceholderViewController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
  -[SSChromePlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SSChromePlaceholderView setFrame:](self->_placeholderView, "setFrame:", v5, v7, v9, v11);
}

- (void)viewDidLoad
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  SSChromePlaceholderView *v8;
  SSChromePlaceholderView *placeholderView;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SSChromePlaceholderViewController;
  -[SSChromePlaceholderViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[SSChromePlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v8 = -[SSChromePlaceholderView initWithFrame:]([SSChromePlaceholderView alloc], "initWithFrame:", v4, v5, v6, v7);
  placeholderView = self->_placeholderView;
  self->_placeholderView = v8;

  objc_msgSend(v3, "addSubview:", self->_placeholderView);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (int)_preferredStatusBarVisibility
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  _BOOL8 v8;
  void *v9;

  -[SSChromePlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  -[SSChromePlaceholderViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 < v7;

  -[SSChromePlaceholderViewController traitCollection](self, "traitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = +[SSChromeHelper statusBarVisibilityForTraitCollection:isPortrait:](SSChromeHelper, "statusBarVisibilityForTraitCollection:isPortrait:", v9, v8);

  return (int)v3;
}

- (int64_t)backgroundBlurEffectStyle
{
  return +[SSChromeHelper backgroundBlurEffectStyle](SSChromeHelper, "backgroundBlurEffectStyle");
}

- (double)contentAlpha
{
  double result;

  -[SSChromePlaceholderView contentAlpha](self->_placeholderView, "contentAlpha");
  return result;
}

- (UIColor)cropsCornerColor
{
  void *v2;
  void *v3;

  +[SSMaterial cropHandle](SSMaterial, "cropHandle");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "color");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (double)cropsCornerContentPadding
{
  double result;

  +[SSChromeHelper cropsHandleOutset](SSChromeHelper, "cropsHandleOutset");
  return result;
}

- (double)cropsCornerEdgeLength
{
  double result;

  +[SSChromeHelper cropsCornerLength](SSChromeHelper, "cropsCornerLength");
  return result;
}

- (double)cropsCornerLineWidth
{
  double result;

  +[SSChromeHelper cropsCornerWidth](SSChromeHelper, "cropsCornerWidth");
  return result;
}

- (CGRect)screenshotContentFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  -[SSChromePlaceholderViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  objc_msgSend(v3, "safeAreaInsets");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  -[SSChromePlaceholderViewController traitCollection](self, "traitCollection");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "displayScale");

  +[SSChromeHelper availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:](SSChromeHelper, "availableRectForFullscreenContent:layoutBounds:bleedToBottom:topBarHeight:bottomBarHeight:userInterfaceIdiom:multipleScreenshots:", 0, 1, 0, v5, v7, v9, v11, v5 + v15, v7 + v13, v9 - (v15 + v19), v11 - (v13 + v17), 0, 0);
  SSizeToFitSizeInAspectRatioOfSize(v9, v11, v21, v22);
  SSRoundSizeToScale();
  UIRectCenteredIntegralRect();
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (void)setContentAlpha:(double)a3
{
  -[SSChromePlaceholderView setContentAlpha:](self->_placeholderView, "setContentAlpha:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_placeholderView, 0);
}

@end
