@implementation BKAppearanceFontViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKAppearanceFontViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  -[BKAppearanceFontViewControllerAccessibility viewDidAppear:](&v3, "viewDidAppear:", a3);
  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, 0);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char isKindOfClass;
  void *v9;
  id v10;
  void *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  v4 = -[BKAppearanceFontViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v13, "tableView:cellForRowAtIndexPath:", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryView"));
  v7 = objc_opt_class(UIButton);
  isKindOfClass = objc_opt_isKindOfClass(v6, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "accessoryView"));
    v10 = sub_10009A13C(CFSTR("download.font.button"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    objc_msgSend(v9, "setAccessibilityLabel:", v11);

  }
  return v5;
}

- (void)tableView:(id)a3 setSelectionState:(BOOL)a4 cell:(id)a5
{
  _BOOL8 v5;
  id v7;
  unint64_t v8;
  UIAccessibilityTraits v9;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)BKAppearanceFontViewControllerAccessibility;
  v7 = a5;
  -[BKAppearanceFontViewControllerAccessibility tableView:setSelectionState:cell:](&v10, "tableView:setSelectionState:cell:", a3, v5, v7);
  v8 = (unint64_t)objc_msgSend(v7, "accessibilityTraits", v10.receiver, v10.super_class);
  if (v5)
    v9 = UIAccessibilityTraitSelected | v8;
  else
    v9 = v8 & ~UIAccessibilityTraitSelected;
  objc_msgSend(v7, "setAccessibilityTraits:", v9);

}

@end
