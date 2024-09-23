@implementation CRLUITableViewCellAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UITableViewCell");
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
  objc_opt_class(CRLUITableViewCellAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (UISwitch)_crlaxAccessibilityTableViewSwitch
{
  return (UISwitch *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415A7D);
}

- (void)_crlaxSetAccessibilityTableViewSwitch:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415A7D, a3);
}

- (void)crlaxClearChildrenWorkaroundFor20458918
{
  -[CRLUITableViewCellAccessibility _accessibilityClearChildren](self, "_accessibilityClearChildren");
  CRLAccessibilityPostLayoutChangedNotification(0);
}

- (id)_accessibilityTableViewSwitch
{
  void *v3;
  id v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUITableViewCellAccessibility _crlaxAccessibilityTableViewSwitch](self, "_crlaxAccessibilityTableViewSwitch"));
  if (!v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)CRLUITableViewCellAccessibility;
    v4 = -[CRLUITableViewCellAccessibility _accessibilityTableViewSwitch](&v6, "_accessibilityTableViewSwitch");
    v3 = (void *)objc_claimAutoreleasedReturnValue(v4);
  }
  return v3;
}

- (BOOL)accessibilityScrollToVisible
{
  int v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  CRLUITableViewCellAccessibility *v8;
  _BOOL4 v9;
  CRLUITableViewCellAccessibility *v10;
  _BOOL4 v11;
  void *v12;
  _QWORD v14[6];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)CRLUITableViewCellAccessibility;
  if (-[CRLUITableViewCellAccessibility accessibilityScrollToVisible](&v21, "accessibilityScrollToVisible"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = sub_10044DD2C;
    v19 = sub_10044DD3C;
    v20 = 0;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_10044DD44;
    v14[3] = &unk_10122C5F0;
    v14[4] = self;
    v14[5] = &v15;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v14))
      abort();
    v4 = (id)v16[5];
    _Block_object_dispose(&v15, 8);

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleCells"));
      v6 = objc_msgSend(v5, "sortedArrayUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:")));
      v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

      if ((unint64_t)objc_msgSend(v7, "count") < 2)
      {
        v9 = 0;
      }
      else
      {
        v8 = (CRLUITableViewCellAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 2));
        v9 = v8 == self;

      }
      if (objc_msgSend(v7, "count"))
      {
        v10 = (CRLUITableViewCellAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", (char *)objc_msgSend(v7, "count") - 1));
        v11 = v10 == self;

      }
      else
      {
        v11 = 0;
      }
      v3 = v9 || v11;
      if (v3 == 1)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "indexPathForCell:", self));
        objc_msgSend(v4, "scrollToRowAtIndexPath:atScrollPosition:animated:", v12, 2, 0);

      }
    }
    else
    {
      LOBYTE(v3) = 0;
    }

  }
  return v3;
}

@end
