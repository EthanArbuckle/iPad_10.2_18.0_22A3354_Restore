@implementation UIDebuggingInformationRootTableViewController

- (UIDebuggingInformationRootTableViewController)initWithStyle:(int64_t)a3
{
  UIDebuggingInformationRootTableViewController *v3;
  UIDebuggingInformationRootTableViewController *v4;
  void *v5;
  UIBarButtonItem *v6;
  void *v7;
  void *v8;
  UIBarButtonItem *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIDebuggingInformationRootTableViewController;
  v3 = -[UIDebuggingInformationListTableViewController initWithStyle:](&v11, sel_initWithStyle_, a3);
  v4 = v3;
  if (v3)
  {
    -[UIViewController navigationItem](v3, "navigationItem");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIBarButtonItem initWithTitle:style:target:action:]([UIBarButtonItem alloc], "initWithTitle:style:target:action:", CFSTR("Dismiss"), 2, v4, sel_toggleOverlayVisibility);
    objc_msgSend(v5, "setRightBarButtonItem:", v6);
    _UIImageWithName(CFSTR("UISplitViewControllerFullScreen.png"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "imageFlippedForRightToLeftLayoutDirection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = -[UIBarButtonItem initWithImage:landscapeImagePhone:style:target:action:]([UIBarButtonItem alloc], "initWithImage:landscapeImagePhone:style:target:action:", v8, 0, 0, v4, sel_toggleOverlayFullscreen);
    objc_msgSend(v5, "setLeftBarButtonItem:", v9);
    -[UIViewController setTitle:](v4, "setTitle:", CFSTR("Debugging"));

  }
  return v4;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)UIDebuggingInformationRootTableViewController;
  -[UITableViewController viewWillAppear:](&v6, sel_viewWillAppear_);
  -[UIViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setToolbarHidden:animated:", 1, v3);

}

@end
