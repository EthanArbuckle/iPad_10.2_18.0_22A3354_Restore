@implementation BKSearchViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKSearchViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)revealSearchResult:(id)a3 animated:(BOOL)a4
{
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKSearchViewControllerAccessibility;
  -[BKSearchViewControllerAccessibility revealSearchResult:animated:](&v6, "revealSearchResult:animated:", a3, a4);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10011D504;
  v5[3] = &unk_1008E72C0;
  v5[4] = self;
  IMAccessibilityPerformBlockOnMainThreadAfterDelay(v5, 1.0);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewControllerAccessibility _bkaxSearchDelegate](self, "_bkaxSearchDelegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewControllerAccessibility _bkaxTarget](self, "_bkaxTarget"));
  objc_msgSend(v3, "searchViewController:revealSearchResult:animated:", v4, 0, 1);

  return 1;
}

- (BKSearchViewController)_bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKSearchViewController);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return (BKSearchViewController *)v5;
}

- (BKSearchViewControllerDelegate)_bkaxSearchDelegate
{
  void *v2;
  uint64_t v3;
  void *v4;
  char v6;

  v6 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKSearchViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_searchDelegate")));
  v3 = __IMAccessibilityCastAsProtocol(&OBJC_PROTOCOL___BKSearchViewControllerDelegate, v2, 1, &v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);

  if (v6)
    abort();
  return (BKSearchViewControllerDelegate *)v4;
}

@end
