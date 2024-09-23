@implementation BKCollectionsListCellAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKCollectionsListCell");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  UIAccessibilityTraits v8;
  unint64_t v9;
  __int16 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)BKCollectionsListCellAccessibility;
  v3 = -[BKCollectionsListCellAccessibility accessibilityTraits](&v12, "accessibilityTraits");
  v11 = 10003;
  v4 = objc_msgSend(objc_alloc((Class)NSString), "initWithCharacters:length:", &v11, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKCollectionsListCellAccessibility accessoryView](self, "accessoryView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessibilityLabel"));
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  v8 = UIAccessibilityTraitSelected;
  if (!v7)
    v8 = 0;
  v9 = v8 | v3;

  return v9;
}

@end
