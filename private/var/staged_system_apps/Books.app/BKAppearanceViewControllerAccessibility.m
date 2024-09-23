@implementation BKAppearanceViewControllerAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("BKAppearanceViewController");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (void)_changeAppearanceStyle:(int)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  -[BKAppearanceViewControllerAccessibility _changeAppearanceStyle:](&v6, "_changeAppearanceStyle:", *(_QWORD *)&a3);
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_10009A13C(CFSTR("selected"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)increaseFontSize:(id)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  -[BKAppearanceViewControllerAccessibility increaseFontSize:](&v6, "increaseFontSize:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_10009A13C(CFSTR("font.size.increased"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)decreaseFontSize:(id)a3
{
  UIAccessibilityNotifications v3;
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  -[BKAppearanceViewControllerAccessibility decreaseFontSize:](&v6, "decreaseFontSize:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  v4 = sub_10009A13C(CFSTR("font.size.decreased"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)BKAppearanceViewControllerAccessibility;
  -[BKAppearanceViewControllerAccessibility viewDidAppear:](&v34, "viewDidAppear:", a3);
  v33 = 0;
  v4 = objc_opt_class(UITableView);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("tableView")));
  v6 = __IMAccessibilityCastAsClass(v4, v5, 1, &v33);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  if (v33)
    goto LABEL_7;
  objc_msgSend(v7, "setIsAccessibilityElement:", 0);
  v33 = 0;
  v8 = objc_opt_class(UISlider);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_brightnessSlider")));
  v10 = __IMAccessibilityCastAsClass(v8, v9, 1, &v33);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);

  if (v33)
    goto LABEL_7;
  v12 = sub_10009A13C(CFSTR("brightness.button"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v11, "setAccessibilityLabel:", v13);

  objc_msgSend(v11, "accessibilitySetIdentification:", CFSTR("BrightnessSlider"));
  v33 = 0;
  v14 = objc_opt_class(UIButton);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_sizeSmallerButton")));
  v16 = __IMAccessibilityCastAsClass(v14, v15, 1, &v33);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v33)
    goto LABEL_7;
  v18 = sub_10009A13C(CFSTR("decrease.font.size.button"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(v17, "setAccessibilityLabel:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_sizeLargerButton")));
  v21 = sub_10009A13C(CFSTR("increase.font.size.button"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
  objc_msgSend(v20, "setAccessibilityLabel:", v22);

  v33 = 0;
  v23 = objc_opt_class(UISwitch);
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("scrollSwitch")));
  v25 = __IMAccessibilityCastAsClass(v23, v24, 1, &v33);
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  if (v33
    || (v33 = 0,
        v27 = objc_opt_class(UITableViewCell),
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "superview")),
        v29 = __IMAccessibilityCastAsClass(v27, v28, 1, &v33),
        v30 = (void *)objc_claimAutoreleasedReturnValue(v29),
        v28,
        v33))
  {
LABEL_7:
    abort();
  }
  v31 = sub_10009A13C(CFSTR("vertical.scrolling.switch"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
  objc_msgSend(v30, "setAccessibilityLabel:", v32);

  UIAccessibilityPostNotification(UIAccessibilityLayoutChangedNotification, v11);
}

- (id)themeContainer
{
  id v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  v3 = -[BKAppearanceViewControllerAccessibility themeContainer](&v6, "themeContainer");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  -[BKAppearanceViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)BKAppearanceViewControllerAccessibility;
  v5 = -[BKAppearanceViewControllerAccessibility tableView:cellForRowAtIndexPath:](&v11, "tableView:cellForRowAtIndexPath:", a3, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_themeContainer")));
  if (objc_msgSend(v7, "_accessibilityIsDescendantOfElement:", v6))
  {
    objc_msgSend(v6, "setAccessibilityContainerType:", 4);
    v8 = sub_10009A13C(CFSTR("theme.selector.container"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    objc_msgSend(v6, "setAccessibilityLabel:", v9);

  }
  return v6;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKAppearanceViewControllerAccessibility;
  -[BKAppearanceViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, "_accessibilityLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_themeWhiteLabel")));
  objc_msgSend(v3, "setIsAccessibilityElement:", 0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_themeSepiaLabel")));
  objc_msgSend(v4, "setIsAccessibilityElement:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKAppearanceViewControllerAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("_themeNightLabel")));
  objc_msgSend(v5, "setIsAccessibilityElement:", 0);

}

- (BOOL)accessibilityPerformEscape
{
  -[BKAppearanceViewControllerAccessibility appearanceShouldDismissPopover](self, "appearanceShouldDismissPopover");
  return 1;
}

@end
