@implementation MTAAddSheetNavigationController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  if (MTUIIsPadIdiom(self, a2))
    return 30;
  else
    return 2;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  objc_super v8;

  v4 = a4;
  v8.receiver = self;
  v8.super_class = (Class)MTAAddSheetNavigationController;
  v6 = a3;
  -[MTAAddSheetNavigationController pushViewController:animated:](&v8, "pushViewController:animated:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection traitCollectionWithUserInterfaceStyle:](UITraitCollection, "traitCollectionWithUserInterfaceStyle:", 2, v8.receiver, v8.super_class));
  -[MTAAddSheetNavigationController setOverrideTraitCollection:forChildViewController:](self, "setOverrideTraitCollection:forChildViewController:", v7, v6);

}

@end
