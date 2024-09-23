@implementation PUSearchHomeViewController

- (BOOL)searchTabIsSelected
{
  void *v2;
  void *v3;
  void *v4;
  BOOL v5;

  -[PUSearchHomeViewController navigationController](self, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "parentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "selectedContentMode") == 12)
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "applicationState") == 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  char v7;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUSearchHomeViewController;
  -[PXSearchHomeViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[PUSearchHomeViewController navigationItem](self, "navigationItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isActive");

  if ((v7 & 1) == 0)
    -[UIViewController pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:](self, "pu_setupInitialBarsVisibilityOnViewWillAppearAnimated:", v3);
}

@end
