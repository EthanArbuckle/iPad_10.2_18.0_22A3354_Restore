@implementation BKLibraryBookCoverViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKLibraryBookCoverViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewControllerAccessibility;
  -[BKLibraryBookCoverViewControllerAccessibility viewDidLoad](&v3, "viewDidLoad");
  -[BKLibraryBookCoverViewControllerAccessibility _bkaxApplyAccessibilityInfo](self, "_bkaxApplyAccessibilityInfo");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKLibraryBookCoverViewControllerAccessibility;
  -[BKLibraryBookCoverViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[BKLibraryBookCoverViewControllerAccessibility _bkaxApplyAccessibilityInfo](self, "_bkaxApplyAccessibilityInfo");
}

- (id)_bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(BKLibraryBookCoverViewController);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (id)_bkaxBackButton
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  char v8;

  v8 = 0;
  v3 = objc_opt_class(UIButton);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("backButton")));
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);

  if (v8)
    abort();
  return v6;
}

- (void)_bkaxApplyAccessibilityInfo
{
  id v3;
  void *v4;
  id v5;

  v3 = sub_10009A13C(CFSTR("back.button"));
  v5 = (id)objc_claimAutoreleasedReturnValue(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryBookCoverViewControllerAccessibility _bkaxBackButton](self, "_bkaxBackButton"));
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

}

@end
