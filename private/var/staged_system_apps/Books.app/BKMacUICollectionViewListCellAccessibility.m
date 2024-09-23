@implementation BKMacUICollectionViewListCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UICollectionViewListCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)accessibilityElementDidBecomeFocused
{
  dispatch_time_t v3;
  _QWORD block[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKMacUICollectionViewListCellAccessibility;
  -[BKMacUICollectionViewListCellAccessibility accessibilityElementDidBecomeFocused](&v5, "accessibilityElementDidBecomeFocused");
  v3 = dispatch_time(0, 500000000);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010098C;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_after(v3, (dispatch_queue_t)&_dispatch_main_q, block);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BKMacUICollectionViewListCellAccessibility;
  v3 = -[BKMacUICollectionViewListCellAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[BKMacUICollectionViewListCellAccessibility _isNewCollectionItem](self, "_isNewCollectionItem");
  v5 = UIAccessibilityTraitButton;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)_bkaxTarget
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  char v7;

  v7 = 0;
  v3 = objc_opt_class(UICollectionViewCell);
  v4 = __IMAccessibilityCastAsClass(v3, self, 1, &v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (v7)
    abort();
  return v5;
}

- (id)_bkaxParent
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v3 = objc_opt_class(UICollectionView);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMacUICollectionViewListCellAccessibility _bkaxTarget](self, "_bkaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));
  v6 = __IMAccessibilityCastAsClass(v3, v5, 1, &v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v9)
    abort();
  return v7;
}

- (id)_bkaxIndexPath
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKMacUICollectionViewListCellAccessibility _bkaxParent](self, "_bkaxParent"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKMacUICollectionViewListCellAccessibility _bkaxTarget](self, "_bkaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "indexPathForCell:", v4));

  return v5;
}

- (BOOL)_isNewCollectionItem
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKMacUICollectionViewListCellAccessibility _bkaxTarget](self, "_bkaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "accessibilityIdentifier"));
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("newCollection"));

  return v4;
}

@end
