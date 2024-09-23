@implementation VUISplitViewController

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VUISplitViewController;
  -[VUISplitViewController viewDidLoad](&v6, sel_viewDidLoad);
  v3 = (void *)objc_opt_new();
  -[VUISplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v3, 0);

  v4 = (void *)objc_opt_new();
  -[VUISplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v4, 2);

  v5 = (void *)objc_opt_new();
  -[VUISplitViewController setViewController:forColumn:](self, "setViewController:forColumn:", v5, 3);

  -[VUISplitViewController setPreferredDisplayMode:](self, "setPreferredDisplayMode:", 0);
  -[VUISplitViewController setDisplayModeButtonVisibility:](self, "setDisplayModeButtonVisibility:", 1);
}

@end
