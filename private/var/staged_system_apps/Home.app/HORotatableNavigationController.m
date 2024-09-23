@implementation HORotatableNavigationController

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  id v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HORotatableNavigationController;
  -[HORotatableNavigationController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v5 = objc_msgSend(v4, "userInterfaceIdiom");

  if (!v5)
    objc_msgSend((id)objc_opt_class(self), "attemptRotationToDeviceOrientation");
}

- (unint64_t)supportedInterfaceOrientations
{
  void *v2;
  id v3;

  if (!-[HORotatableNavigationController isBeingPresented](self, "isBeingPresented"))
    return 30;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (v3)
    return 30;
  else
    return 2;
}

@end
