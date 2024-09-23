@implementation TTRISplitViewController

- (UIViewController)detailViewController
{
  UIViewController *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TTRISplitViewController;
  v2 = -[TTRISplitViewController detailViewController](&v4, "detailViewController");
  return (UIViewController *)(id)objc_claimAutoreleasedReturnValue(v2);
}

- (void)setupColumnStyle_workaroundRdar58463688
{
  double v2;

  LODWORD(v2) = 0;
  -[TTRISplitViewController setGutterWidth:](self, "setGutterWidth:", v2);
  -[TTRISplitViewController _setUsesExtraWidePrimaryColumn:](self, "_setUsesExtraWidePrimaryColumn:", 1);
}

@end
