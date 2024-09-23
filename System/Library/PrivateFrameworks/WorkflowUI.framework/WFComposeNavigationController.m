@implementation WFComposeNavigationController

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)WFComposeNavigationController;
  -[WFComposeNavigationController viewDidMoveToWindow:shouldAppearOrDisappear:](&v17, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
  if (a3)
  {
    -[WFComposeNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 1);
    -[WFComposeNavigationController navigationBar](self, "navigationBar");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;

    -[WFComposeNavigationController navigationBar](self, "navigationBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "intrinsicContentSize");
    v15 = v14;

    -[WFComposeNavigationController navigationBar](self, "navigationBar");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setBounds:", v8, v10, v12, v15);

    -[WFComposeNavigationController setNavigationBarHidden:](self, "setNavigationBarHidden:", 0);
  }
}

@end
