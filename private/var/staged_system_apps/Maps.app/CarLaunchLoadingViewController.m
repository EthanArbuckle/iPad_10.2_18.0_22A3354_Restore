@implementation CarLaunchLoadingViewController

- (id)initForResume
{
  id result;

  result = -[CarLaunchLoadingViewController init](self, "init");
  if (result)
    *((_BYTE *)result + 8) = 1;
  return result;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  NSBundle *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CarLaunchLoadingViewController;
  -[CarLaunchLoadingViewController viewWillAppear:](&v9, "viewWillAppear:", a3);
  if (+[CarDisplayController debugLaunchPerformance](CarDisplayController, "debugLaunchPerformance"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  }
  else
  {
    v5 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(MKMapView));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarLaunchLoadingViewController traitCollection](self, "traitCollection"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorNamed:inBundle:compatibleWithTraitCollection:](UIColor, "colorNamed:inBundle:compatibleWithTraitCollection:", CFSTR("CartographyBackground"), v6, v7));

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarLaunchLoadingViewController view](self, "view"));
  objc_msgSend(v8, "setBackgroundColor:", v4);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarLaunchLoadingViewController;
  -[CarLaunchLoadingViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (!self->_configuredForResume)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CarDisplayDidFinishLaunchingNotification"), 0);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CarLaunchLoadingViewController;
  -[CarLaunchLoadingViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (self->_configuredForResume)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v4, "postNotificationName:object:", CFSTR("CarDisplayDidBecomeActiveNotification"), 0);

  }
}

@end
