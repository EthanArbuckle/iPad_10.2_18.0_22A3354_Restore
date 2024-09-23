@implementation CRLiOSInspectorTableViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLiOSInspectorTableViewCell");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLiOSInspectorTableViewCellAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)setChecked:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v5;
  UIAccessibilityTraits v6;
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)CRLiOSInspectorTableViewCellAccessibility;
  -[CRLiOSInspectorTableViewCellAccessibility setChecked:](&v7, "setChecked:");
  v5 = (unint64_t)-[CRLiOSInspectorTableViewCellAccessibility accessibilityTraits](self, "accessibilityTraits");
  if (v3)
    v6 = UIAccessibilityTraitSelected | v5;
  else
    v6 = v5 & ~UIAccessibilityTraitSelected;
  -[CRLiOSInspectorTableViewCellAccessibility setAccessibilityTraits:](self, "setAccessibilityTraits:", v6);
}

- (id)accessibilityLabel
{
  CRLiOSInspectorTableViewCellAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v15;
  char v16;

  v16 = 0;
  v2 = self;
  objc_opt_class(UITableViewCell, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v16);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v16)
    abort();
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "text"));
  v10 = objc_msgSend(v9, "length");

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textLabel"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "text"));

  }
  else
  {
    v15.receiver = v2;
    v15.super_class = (Class)CRLiOSInspectorTableViewCellAccessibility;
    v13 = -[CRLiOSInspectorTableViewCellAccessibility accessibilityLabel](&v15, "accessibilityLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue(v13);
  }

  return v12;
}

- (BOOL)_accessibilityUsesSpecialKeyboardDismiss
{
  return 1;
}

- (id)_crlaxImageButton
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLiOSInspectorTableViewCellAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "imageButton"));

  return v3;
}

@end
