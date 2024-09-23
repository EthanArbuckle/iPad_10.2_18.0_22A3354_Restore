@implementation SUMoreNavigationController

- (SUMoreNavigationController)initWithNibName:(id)a3 bundle:(id)a4
{
  SUMoreNavigationController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUMoreNavigationController;
  v4 = -[SUMoreNavigationController initWithNibName:bundle:](&v6, sel_initWithNibName_bundle_, a3, a4);
  if (v4)
    -[SUMoreNavigationController setNavigationBarClass:](v4, "setNavigationBarClass:", objc_opt_class());
  return v4;
}

+ (Class)_moreListControllerClass
{
  return (Class)objc_opt_class();
}

- (id)copyScriptViewController
{
  SUScriptNavigationController *v3;

  v3 = objc_alloc_init(SUScriptNavigationController);
  -[SUScriptViewController setNativeViewController:](v3, "setNativeViewController:", self);
  return v3;
}

- (int64_t)ITunesStoreUIBarStyle
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice"), "userInterfaceIdiom") == 1)
    return 30;
  if (SUAllowsLandscapePhone())
    return 26;
  return 2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  v5 = (void *)-[SUMoreNavigationController tabBarController](self, "tabBarController");
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend((id)objc_msgSend((id)objc_msgSend(v5, "clientInterface"), "appearance"), "styleNavigationBar:", -[SUMoreNavigationController navigationBar](self, "navigationBar"));
  v6.receiver = self;
  v6.super_class = (Class)SUMoreNavigationController;
  -[SUMoreNavigationController viewWillAppear:](&v6, sel_viewWillAppear_, v3);
}

- (BOOL)window:(id)a3 shouldAutorotateToInterfaceOrientation:(int64_t)a4
{
  unsigned int v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)SUMoreNavigationController;
  v7 = -[SUMoreNavigationController window:shouldAutorotateToInterfaceOrientation:](&v11, sel_window_shouldAutorotateToInterfaceOrientation_);
  v8 = (void *)-[SUMoreNavigationController topViewController](self, "topViewController");
  if (v7)
    v9 = v8 == 0;
  else
    v9 = 1;
  if (!v9)
    LOBYTE(v7) = objc_msgSend(v8, "window:shouldAutorotateToInterfaceOrientation:", a3, a4);
  return v7;
}

@end
