@implementation TSKComposedViewController

- (TSKComposedViewController)initWithViewController:(id)a3
{
  TSKComposedViewController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKComposedViewController;
  v4 = -[TSKPopoverBasedViewController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, 0, 0);
  if (v4)
    v4->mComposedViewController = (UIViewController *)a3;
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[UIView removeFromSuperview](-[UIViewController view](self->mComposedViewController, "view"), "removeFromSuperview");

  self->mComposedViewController = 0;
  v3.receiver = self;
  v3.super_class = (Class)TSKComposedViewController;
  -[TSKPopoverBasedViewController dealloc](&v3, sel_dealloc);
}

- (void)p_loadChildView
{
  double v3;
  double v4;
  double v5;
  double v6;

  if (!-[UIView superview](-[UIViewController view](self->mComposedViewController, "view"), "superview"))
  {
    objc_msgSend((id)-[TSKComposedViewController view](self, "view"), "bounds");
    -[UIView setFrame:](-[UIViewController view](self->mComposedViewController, "view"), "setFrame:", v3, v4, v5, v6);
    objc_msgSend((id)-[TSKComposedViewController view](self, "view"), "addSubview:", -[UIViewController view](self->mComposedViewController, "view"));
  }
}

- (void)p_unloadChildView
{
  if (-[UIView superview](-[UIViewController view](self->mComposedViewController, "view"), "superview"))
  {
    -[UIView removeFromSuperview](-[UIViewController view](self->mComposedViewController, "view"), "removeFromSuperview");

    self->mComposedViewController = 0;
  }
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKComposedViewController;
  -[TSKPopoverBasedViewController viewDidLoad](&v3, sel_viewDidLoad);
  -[TSKComposedViewController p_loadChildView](self, "p_loadChildView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  -[TSKPopoverBasedViewController viewWillAppear:](&v7, sel_viewWillAppear_, v3);
  -[UIViewController viewWillAppear:](self->mComposedViewController, "viewWillAppear:", v3);
  objc_msgSend(v5, "setStatusBarHidden:", v6);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication"), "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  -[TSKComposedViewController viewDidAppear:](&v7, sel_viewDidAppear_, v3);
  -[UIViewController viewDidAppear:](self->mComposedViewController, "viewDidAppear:", v3);
  objc_msgSend(v5, "setStatusBarHidden:", v6);
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  -[TSKComposedViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, v3);
  -[UIViewController viewWillDisappear:](self->mComposedViewController, "viewWillDisappear:", v3);
  objc_msgSend(v5, "setStatusBarHidden:", v6);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = a3;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v6 = objc_msgSend((id)objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "keyWindow"), "windowScene"), "statusBarManager"), "isStatusBarHidden");
  -[UIViewController viewDidDisappear:](self->mComposedViewController, "viewDidDisappear:", v3);
  v7.receiver = self;
  v7.super_class = (Class)TSKComposedViewController;
  -[TSKPopoverBasedViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, v3);
  -[TSKComposedViewController p_unloadChildView](self, "p_unloadChildView");
  objc_msgSend(v5, "setStatusBarHidden:", v6);
}

- (id)title
{
  return -[UIViewController title](self->mComposedViewController, "title");
}

- (id)i_contentViewController
{
  return self->mComposedViewController;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  objc_super v8;

  height = a3.height;
  width = a3.width;
  v8.receiver = self;
  v8.super_class = (Class)TSKComposedViewController;
  -[TSKComposedViewController viewWillTransitionToSize:withTransitionCoordinator:](&v8, sel_viewWillTransitionToSize_withTransitionCoordinator_);
  -[UIViewController viewWillTransitionToSize:withTransitionCoordinator:](self->mComposedViewController, "viewWillTransitionToSize:withTransitionCoordinator:", a4, width, height);
}

- (UIViewController)composedViewController
{
  return self->mComposedViewController;
}

@end
