@implementation BKLibraryBookshelfNavigationController

- (BOOL)shouldHideNavigationItemBackgroundDuringTransition:(id)a3
{
  return 1;
}

- (id)bc_ancestorOverrideCardPresentingViewController
{
  id v3;
  BKLibraryBookshelfNavigationController *v4;
  BKLibraryBookshelfNavigationController *v5;
  BKLibraryBookshelfNavigationController *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryBookshelfNavigationController;
  v3 = -[BKLibraryBookshelfNavigationController bc_ancestorOverrideCardPresentingViewController](&v8, "bc_ancestorOverrideCardPresentingViewController");
  v4 = (BKLibraryBookshelfNavigationController *)objc_claimAutoreleasedReturnValue(v3);
  v5 = v4;
  if (!v4)
    v4 = self;
  v6 = v4;

  return v6;
}

@end
