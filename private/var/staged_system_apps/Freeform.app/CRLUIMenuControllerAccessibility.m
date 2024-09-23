@implementation CRLUIMenuControllerAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIMenuController");
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
  v5 = (void *)objc_opt_class(CRLUIMenuControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxShouldActuallyPreventMakingVisible
{
  void *v3;
  unsigned int v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  v4 = objc_msgSend(v3, "needsAccessibilityElements");

  if (!v4)
    return 0;
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100019858;
  v7[3] = &unk_10122C5F0;
  v7[4] = self;
  v7[5] = &v8;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v5 = *((_BYTE *)v9 + 24) != 0;
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (void)setMenuItems:(id)a3
{
  CRLUIMenuControllerAccessibility *v4;
  id v5;
  objc_super v6;

  v4 = self;
  v5 = a3;
  if (-[CRLUIMenuControllerAccessibility _crlaxShouldPreventMutatingItems](v4, "_crlaxShouldPreventMutatingItems"))
  {
    -[CRLUIMenuControllerAccessibility _crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:](v4, "_crlaxSetLastUpdatedMenuItemsWhilePreventingActualItemsMutation:", v5);
  }
  else
  {
    v6.receiver = v4;
    v6.super_class = (Class)CRLUIMenuControllerAccessibility;
    -[CRLUIMenuControllerAccessibility setMenuItems:](&v6, "setMenuItems:", v5);
  }

}

- (void)setMenuVisible:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (!a3
    || !-[CRLUIMenuControllerAccessibility _crlaxShouldActuallyPreventMakingVisible](self, "_crlaxShouldActuallyPreventMakingVisible"))
  {
    v5.receiver = self;
    v5.super_class = (Class)CRLUIMenuControllerAccessibility;
    -[CRLUIMenuControllerAccessibility setMenuVisible:](&v5, "setMenuVisible:", v3);
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
    || !-[CRLUIMenuControllerAccessibility _crlaxShouldActuallyPreventMakingVisible](self, "_crlaxShouldActuallyPreventMakingVisible"))
  {
    v7.receiver = self;
    v7.super_class = (Class)CRLUIMenuControllerAccessibility;
    -[CRLUIMenuControllerAccessibility setMenuVisible:animated:](&v7, "setMenuVisible:animated:", v5, v4);
  }
}

@end
