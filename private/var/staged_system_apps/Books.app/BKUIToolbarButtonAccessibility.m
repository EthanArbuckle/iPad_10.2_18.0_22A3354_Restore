@implementation BKUIToolbarButtonAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIToolbarButton");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (id)accessibilityLabel
{
  void *v3;
  Class v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  __CFString *v9;
  id v10;
  void *v11;
  id v12;
  objc_super v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKUIToolbarButtonAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_info")));
  v4 = NSClassFromString(CFSTR("UISwappableImageView"));
  if ((objc_opt_isKindOfClass(v3, v4) & 1) == 0)
    goto LABEL_8;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imaxValueForKey:", CFSTR("_value")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imaxValueForKey:", CFSTR("accessibilityIdentification")));
  if (!objc_msgSend(v6, "isEqualToString:", CFSTR("brightness-nav-glyph.png")))
  {
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("ib_tb_icon_bookmark.png")))
    {
      v9 = CFSTR("bookmark.button");
      goto LABEL_6;
    }

LABEL_8:
    v14.receiver = self;
    v14.super_class = (Class)BKUIToolbarButtonAccessibility;
    v12 = -[BKUIToolbarButtonAccessibility accessibilityLabel](&v14, "accessibilityLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue(v12);
    goto LABEL_9;
  }
  v7 = sub_10009A13C(CFSTR("brightness.button.hint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[BKUIToolbarButtonAccessibility setAccessibilityHint:](self, "setAccessibilityHint:", v8);

  v9 = CFSTR("brightness.button");
LABEL_6:
  v10 = sub_10009A13C(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

LABEL_9:
  return v11;
}

@end
