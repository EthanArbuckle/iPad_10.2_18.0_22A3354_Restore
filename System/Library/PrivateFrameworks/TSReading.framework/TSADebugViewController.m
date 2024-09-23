@implementation TSADebugViewController

- (TSADebugViewController)initWithDelegate:(id)a3
{
  TSADebugViewController *v4;
  TSADebugViewController *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSADebugViewController;
  v4 = -[TSADebugViewController init](&v7, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_delegate = (UIViewController *)a3;
    v4->_debugTableViewController = -[TSADebugTableViewController initWithParent:]([TSADebugTableViewController alloc], "initWithParent:", v4);
  }
  -[TSADebugViewController view](v5, "view");
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSADebugViewController;
  -[TSKPopoverBasedViewController dealloc](&v3, sel_dealloc);
}

- (void)addItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5
{
  -[TSADebugTableViewController addItemWithTitle:target:action:](self->_debugTableViewController, "addItemWithTitle:target:action:", a3, a4, a5);
}

- (void)loadView
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSADebugViewController;
  -[TSADebugViewController loadView](&v4, sel_loadView);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6F90]), "initWithFrame:", 0.0, 0.0, 230.0, 375.0);
  objc_msgSend(v3, "addSubview:", -[TSADebugTableViewController tableView](self->_debugTableViewController, "tableView"));
  -[TSADebugViewController setView:](self, "setView:", v3);

}

- (void)toggleVisible:(id)a3
{
  if (-[TSKPopoverBasedViewController isVisible](self, "isVisible"))
    -[TSADebugViewController hideIt:](self, "hideIt:", a3);
  else
    -[TSADebugViewController showIt:](self, "showIt:", a3);
}

- (void)showIt:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  UIViewController *delegate;
  TSADebugViewController *v8;
  void *v9;
  void *v10;

  if (a3)
  {
    objc_opt_class();
    objc_msgSend((id)objc_msgSend((id)TSUDynamicCast(), "rightApplicationToolbarItems"), "firstObject");
    objc_opt_class();
    v4 = TSUDynamicCast();
    objc_opt_class();
    v5 = (void *)TSUDynamicCast();
    objc_opt_class();
    v6 = (void *)TSUDynamicCast();
    if (v4)
    {
      -[TSKPopoverBasedViewController presentModallyFromBarItem:viewController:](self, "presentModallyFromBarItem:viewController:", v4, self->_delegate);
      return;
    }
    if (v5)
    {
      objc_msgSend(v5, "bounds");
      delegate = self->_delegate;
      v8 = self;
      v9 = v5;
    }
    else
    {
      v10 = v6;
      if (!v6)
        return;
      objc_msgSend(v6, "bounds");
      delegate = self->_delegate;
      v8 = self;
      v9 = v10;
    }
    -[TSKPopoverBasedViewController presentModallyFromRect:inView:viewController:](v8, "presentModallyFromRect:inView:viewController:", v9, delegate);
  }
}

- (void)hideIt:(id)a3
{
  -[TSKPopoverBasedViewController dismissAnimated:](self, "dismissAnimated:", 1);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)TSADebugViewController;
  -[TSKPopoverBasedViewController viewWillAppear:](&v5, sel_viewWillAppear_);
  -[TSADebugTableViewController viewWillAppear:](self->_debugTableViewController, "viewWillAppear:", v3);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[TSADebugTableViewController viewDidDisappear:](self->_debugTableViewController, "viewDidDisappear:");
  v5.receiver = self;
  v5.super_class = (Class)TSADebugViewController;
  -[TSKPopoverBasedViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, v3);
}

@end
