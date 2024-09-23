@implementation SAUIMonolithicElementViewController

- (SAUIMonolithicElementViewController)initWithMonolithicElementViewProvider:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SAUIMonolithicElementViewController;
  return -[SAUILayoutSpecifyingElementViewController initWithElementViewProvider:](&v4, sel_initWithElementViewProvider_, a3);
}

- (SAUIMonolithicElementViewProviding)elementViewProvider
{
  void *v2;
  void *v3;
  SAUIMonolithicElementViewProviding *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAUIMonolithicElementViewController;
  -[SAUILayoutSpecifyingElementViewController elementViewProvider](&v6, sel_elementViewProvider);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SAUIMonolithicElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewDidLoad](&v6, sel_viewDidLoad);
  -[SAUIMonolithicElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setClipsToBounds:", 1);
  -[SAUIMonolithicElementViewController elementViewProvider](self, "elementViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monolithicView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addSubview:", v5);

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
  int64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)SAUIMonolithicElementViewController;
  -[SAUILayoutSpecifyingElementViewController viewWillLayoutSubviews](&v28, sel_viewWillLayoutSubviews);
  -[SAUIMonolithicElementViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SAUIMonolithicElementViewController elementViewProvider](self, "elementViewProvider");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "monolithicView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "sizeThatFits:", v9, v11);
  BSRectWithSize();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = -[SAUILayoutSpecifyingElementViewController layoutMode](self, "layoutMode");
  if (v22 != 3)
  {
    if (v22 == 2)
    {
      v27 = 0;
      UIRectCenteredIntegralRectScale();
      v5 = v23;
      v7 = v24;
      v9 = v25;
      v11 = v26;
    }
    else
    {
      v9 = v19;
      v11 = v21;
      v7 = v17;
      v5 = v15;
    }
  }
  objc_msgSend(v13, "setFrame:", v5, v7, v9, v11, v27);

}

@end
