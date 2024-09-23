@implementation IMGridViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("IMGridView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory, a2);
}

- (void)setGrabbedCell:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[IMGridViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_grabbedCell")));
  v10.receiver = self;
  v10.super_class = (Class)IMGridViewAccessibility;
  -[IMGridViewAccessibility setGrabbedCell:](&v10, "setGrabbedCell:", v4);
  if (v4 && v5 != v4)
  {
    v6 = IMAXLocString(CFSTR("started.moving.book %@"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accessibilityLabel"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8));

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v9);
  }

}

- (void)_swapGrabbedCell:(id)a3 withOtherCell:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)IMGridViewAccessibility;
  v6 = a3;
  -[IMGridViewAccessibility _swapGrabbedCell:withOtherCell:](&v20, "_swapGrabbedCell:withOtherCell:", v6, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[IMGridViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("numberOfColumns")));
  v8 = (uint64_t)objc_msgSend(v7, "integerValue");

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "imaxValueForKey:", CFSTR("tag")));
  v10 = (uint64_t)objc_msgSend(v9, "integerValue") - 10000;

  v11 = v10 % v8 + 1;
  v12 = v10 / v8 + 1;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedNumber:](NSNumberFormatter, "imaxLocalizedNumber:", v13));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", v12));
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumberFormatter imaxLocalizedNumber:](NSNumberFormatter, "imaxLocalizedNumber:", v15));

  LODWORD(v15) = UIAccessibilityAnnouncementNotification;
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, CFSTR("AXAnnouncementTypeReorderSound"));
  v17 = IMAXLocString(CFSTR("finished.moving.book %@ %@"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v18, v16, v14, v20.receiver, v20.super_class));

  UIAccessibilityPostNotification((UIAccessibilityNotifications)v15, v19);
}

@end
