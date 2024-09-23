@implementation TSUIMenuControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIMenuController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxShouldActuallyPreventMakingVisible
{
  BOOL v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  if (!-[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements"))return 0;
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_235D64;
  v5[3] = &unk_42BF18;
  v5[4] = self;
  v5[5] = &v6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = *((_BYTE *)v7 + 24) != 0;
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void)setMenuItems:(id)a3
{
  objc_super v5;

  if (-[TSUIMenuControllerAccessibility _tsaxShouldPreventMutatingItems](self, "_tsaxShouldPreventMutatingItems"))
  {
    -[TSUIMenuControllerAccessibility _tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:](self, "_tsaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:", a3);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIMenuControllerAccessibility;
    -[TSUIMenuControllerAccessibility setMenuItems:](&v5, "setMenuItems:", a3);
  }
}

- (void)setMenuVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3
    || !-[TSUIMenuControllerAccessibility _tsaxShouldActuallyPreventMakingVisible](self, "_tsaxShouldActuallyPreventMakingVisible"))
  {
    v5.receiver = self;
    v5.super_class = (Class)TSUIMenuControllerAccessibility;
    -[TSUIMenuControllerAccessibility setMenuVisible:](&v5, "setMenuVisible:", v3);
  }
}

- (void)setMenuVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  objc_super v7;

  v4 = a4;
  v5 = a3;
  if (!a3
    || !-[TSUIMenuControllerAccessibility _tsaxShouldActuallyPreventMakingVisible](self, "_tsaxShouldActuallyPreventMakingVisible"))
  {
    v7.receiver = self;
    v7.super_class = (Class)TSUIMenuControllerAccessibility;
    -[TSUIMenuControllerAccessibility setMenuVisible:animated:](&v7, "setMenuVisible:animated:", v5, v4);
  }
}

@end
