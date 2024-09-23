@implementation ICSETableView

- (int64_t)style
{
  objc_super v4;

  if ((+[UIDevice ic_isVision](UIDevice, "ic_isVision") & 1) != 0)
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)ICSETableView;
  return -[ICSETableView style](&v4, "style");
}

- (id)_axFirstLastOpaqueHeaderElementFromSection:(int64_t)a3 options:(id)a4 direction:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  UIAccessibilityTraits v12;
  void *v13;
  UIAccessibilityTraits v14;
  uint64_t v15;
  void *v16;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)ICSETableView;
  v8 = -[ICSETableView _axFirstLastOpaqueHeaderElementFromSection:options:direction:](&v18, "_axFirstLastOpaqueHeaderElementFromSection:options:direction:", a3, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  if (v9)
    return v9;
  v10 = (uint64_t)-[ICSETableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3);
  if (a5 == 1)
  {
    if (v10 >= 1)
    {
      v11 = 0;
      v12 = UIAccessibilityTraitHeader;
      do
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v11, a3));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableView accessibilityCellForRowAtIndexPath:](self, "accessibilityCellForRowAtIndexPath:", v13));

        if ((v12 & ~(unint64_t)objc_msgSend(v9, "accessibilityTraits")) == 0)
          return v9;

      }
      while (++v11 < (uint64_t)-[ICSETableView numberOfRowsInSection:](self, "numberOfRowsInSection:", a3));
    }
LABEL_12:
    v9 = 0;
    return v9;
  }
  if (v10 < 1)
    goto LABEL_12;
  v14 = UIAccessibilityTraitHeader;
  v15 = v10 + 1;
  while (1)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v15 - 2, a3));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSETableView accessibilityCellForRowAtIndexPath:](self, "accessibilityCellForRowAtIndexPath:", v16));

    if ((v14 & ~(unint64_t)objc_msgSend(v9, "accessibilityTraits")) == 0)
      return v9;

    if ((unint64_t)--v15 <= 1)
      goto LABEL_12;
  }
}

- (id)accessibilityIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class(self, a2);
  return NSStringFromClass(v2);
}

@end
