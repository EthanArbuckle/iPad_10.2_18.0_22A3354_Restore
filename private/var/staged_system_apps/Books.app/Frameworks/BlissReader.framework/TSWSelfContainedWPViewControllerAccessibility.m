@implementation TSWSelfContainedWPViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWSelfContainedWPViewController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_thaxNeedsRepSetup
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A30);
}

- (void)_thaxSetNeedsRepSetup:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A30, a3);
}

- (void)layoutWithFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  objc_super v13;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[TSWSelfContainedWPViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("icc"));
  v9 = objc_msgSend(v8, "tsaxValueForKey:", CFSTR("infosToDisplay"));
  v13.receiver = self;
  v13.super_class = (Class)TSWSelfContainedWPViewControllerAccessibility;
  -[TSWSelfContainedWPViewControllerAccessibility layoutWithFrame:](&v13, "layoutWithFrame:", x, y, width, height);
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0 && !objc_msgSend(v9, "count"))
  {
    v11 = objc_msgSend(v8, "tsaxValueForKey:", CFSTR("infosToDisplay"));
    v12 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      if (objc_msgSend(v11, "count"))
        -[TSWSelfContainedWPViewControllerAccessibility _thaxSetNeedsRepSetup:](self, "_thaxSetNeedsRepSetup:", 1);
    }
  }

}

- (void)interactiveCanvasControllerDidLayout:(id)a3
{
  id v5;
  _QWORD v6[6];
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWSelfContainedWPViewControllerAccessibility;
  -[TSWSelfContainedWPViewControllerAccessibility interactiveCanvasControllerDidLayout:](&v7, "interactiveCanvasControllerDidLayout:");
  if (-[TSWSelfContainedWPViewControllerAccessibility _thaxNeedsRepSetup](self, "_thaxNeedsRepSetup"))
  {
    v5 = -[TSWSelfContainedWPViewControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("storage"));
    if (v5)
    {
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_268610;
      v6[3] = &unk_426E28;
      v6[4] = a3;
      v6[5] = v5;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
        abort();
    }
    -[TSWSelfContainedWPViewControllerAccessibility _thaxSetNeedsRepSetup:](self, "_thaxSetNeedsRepSetup:", 0);
  }
}

@end
