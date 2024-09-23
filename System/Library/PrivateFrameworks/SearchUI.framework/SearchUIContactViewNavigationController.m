@implementation SearchUIContactViewNavigationController

- (SearchUIContactViewNavigationController)initWithContact:(id)a3
{
  void *v4;
  SearchUIContactViewNavigationController *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x1E0C974D8], "viewControllerForNewContact:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)SearchUIContactViewNavigationController;
  v5 = -[SearchUIContactViewNavigationController initWithRootViewController:](&v7, sel_initWithRootViewController_, v4);
  if (v5)
    objc_msgSend(v4, "setDelegate:", v5);

  return v5;
}

- (BOOL)_canShowWhileLocked
{
  void *v2;
  void *v3;
  char v4;

  -[SearchUIContactViewNavigationController viewControllers](self, "viewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_canShowWhileLocked");

  return v4;
}

- (void)contactViewController:(id)a3 didCompleteWithContact:(id)a4
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", 1, 0);
}

@end
