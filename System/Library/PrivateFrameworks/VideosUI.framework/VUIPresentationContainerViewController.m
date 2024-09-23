@implementation VUIPresentationContainerViewController

- (void)loadView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)VUIPresentationContainerViewController;
  -[VUIPresentationContainerViewController loadView](&v7, sel_loadView);
  -[VUIPresentationContainerViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel_tapped);
  -[VUIPresentationContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  objc_msgSend(v5, "setDelegate:", self);
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  void *v5;
  void *v6;

  objc_msgSend(a4, "view", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPresentationContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = v5 == v6;

  return (char)self;
}

- (void)tapped
{
  -[VUIPresentationContainerViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  VUIPresentationContainerViewController *v7;
  double v8;
  double v9;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VUIPresentationContainerViewController;
  -[VUIPresentationContainerViewController viewDidLayoutSubviews](&v15, sel_viewDidLayoutSubviews);
  -[VUIPresentationContainerViewController childViewControllers](self, "childViewControllers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VUIPresentationContainerViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");

  v7 = self;
  -[VUIPresentationContainerViewController preferredContentSize](v7, "preferredContentSize");
  if (*MEMORY[0x1E0C9D820] == v9 && *(double *)(MEMORY[0x1E0C9D820] + 8) == v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[VUIPresentationContainerViewController topViewController](v7, "topViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[VUIPresentationContainerViewController childViewControllers](v7, "childViewControllers");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        goto LABEL_11;
      -[VUIPresentationContainerViewController childViewControllers](v7, "childViewControllers");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "lastObject");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(v11, "preferredContentSize");

  }
LABEL_11:
  UIRectCenteredIntegralRect();
  objc_msgSend(v5, "setFrame:");

}

@end
