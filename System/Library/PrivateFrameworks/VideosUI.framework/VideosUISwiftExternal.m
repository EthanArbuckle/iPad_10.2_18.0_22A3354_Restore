@implementation VideosUISwiftExternal

+ (void)initializeUIFactory
{
  +[VideosUI initializeUIFactory](_TtC8VideosUI8VideosUI, "initializeUIFactory");
}

+ (id)viewControllerWith:(id)a3 appContext:(id)a4 documentOptions:(id)a5
{
  return +[VideosUI viewControllerWith:appContext:documentOptions:](_TtC8VideosUI8VideosUI, "viewControllerWith:appContext:documentOptions:", a3, a4, a5);
}

+ (id)ascAppInstallerViewControllerWithTitle:(id)a3 subtitle:(id)a4 request:(id)a5 forceDSIDlessInstall:(BOOL)a6 onFlowCompletion:(id)a7
{
  _BOOL8 v7;
  id v11;
  id v12;
  id v13;
  id v14;
  VUIASCAppInstallerViewController *v15;

  v7 = a6;
  v11 = a7;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = -[VUIASCAppInstallerViewController initWithTitle:subtitle:request:forceDSIDless:onFlowComplete:]([VUIASCAppInstallerViewController alloc], "initWithTitle:subtitle:request:forceDSIDless:onFlowComplete:", v14, v13, v12, v7, v11);

  return v15;
}

@end
