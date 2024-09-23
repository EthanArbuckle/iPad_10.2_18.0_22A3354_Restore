@implementation TSUIViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_class *v3;
  void *v4;
  char v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility tsaxLoadAccessibilityInformation](&v6, "tsaxLoadAccessibilityInformation");
  v5 = 0;
  v3 = (objc_class *)objc_opt_class(UIViewController);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSUIViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_accessibilityViewController")), 1, &v5);
  if (v5)
    abort();
  objc_msgSend(v4, "tsaxLoadAccessibilityInformation");
}

- (CGRect)_accessibilityFrameForSorting
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  objc_class *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  objc_super v19;
  CGRect result;

  v19.receiver = self;
  v19.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility _accessibilityFrameForSorting](&v19, "_accessibilityFrameForSorting");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (objc_class *)objc_opt_class(UINavigationBar);
  v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)-[TSUIViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("superview")), 0, 0);
  if (v12)
  {
    objc_msgSend(v12, "accessibilityFrame");
    v6 = v13;
    v10 = v14;
  }
  v15 = v4;
  v16 = v6;
  v17 = v8;
  v18 = v10;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)_accessibilityContainingParentForOrdering
{
  id v3;
  unsigned int v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  v3 = -[TSUIViewAccessibility _accessibilityContainingParentForOrdering](&v6, "_accessibilityContainingParentForOrdering");
  if (!v3)
  {
    v3 = self;
    do
    {
      v3 = objc_msgSend(v3, "superview");
      v4 = objc_msgSend(v3, "tsaxServesAsContainingParentForOrdering");
    }
    while (v3 && !v4);
  }
  return v3;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[TSUIViewAccessibility tsaxLoadAccessibilityInformation](self, "tsaxLoadAccessibilityInformation");
}

- (id)_tsaxParentCanvasView
{
  return -[TSUIViewAccessibility tsaxViewAncestorOfType:](self, "tsaxViewAncestorOfType:", NSClassFromString(CFSTR("TSDCanvasView")));
}

- (void)_tsaxInvalidateChildrenOnParentCanvasViewImmediately
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_23C748;
  v2[3] = &unk_426DD0;
  v2[4] = -[TSUIViewAccessibility _tsaxParentCanvasView](self, "_tsaxParentCanvasView");
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (void)_tsaxInvalidateChildrenOnParentCanvasViewEventually
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_23C7AC;
  v2[3] = &unk_426DD0;
  v2[4] = -[TSUIViewAccessibility _tsaxParentCanvasView](self, "_tsaxParentCanvasView");
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  Class v3;
  objc_super v5;

  v3 = NSClassFromString(CFSTR("TSDCanvasView"));
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0
    && -[TSUIViewAccessibility _tsaxParentCanvasView](self, "_tsaxParentCanvasView"))
  {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)TSUIViewAccessibility;
  return -[TSUIViewAccessibility _accessibilityShouldUseViewHierarchyForFindingScrollParent](&v5, "_accessibilityShouldUseViewHierarchyForFindingScrollParent");
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[TSUIViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility setIsAccessibilityElement:](&v6, "setIsAccessibilityElement:", v3);
  if (v5 != v3)
    -[TSUIViewAccessibility _tsaxInvalidateChildrenOnParentCanvasViewEventually](self, "_tsaxInvalidateChildrenOnParentCanvasViewEventually");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[TSUIViewAccessibility isHidden](self, "isHidden");
  v6.receiver = self;
  v6.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility setHidden:](&v6, "setHidden:", v3);
  if (v5 != v3)
    -[TSUIViewAccessibility _tsaxInvalidateChildrenOnParentCanvasViewEventually](self, "_tsaxInvalidateChildrenOnParentCanvasViewEventually");
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[TSUIViewAccessibility alpha](self, "alpha");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility setAlpha:](&v7, "setAlpha:", a3);
  if (a3 == 0.0 && v6 > 0.0 || a3 > 0.0 && v6 == 0.0)
    -[TSUIViewAccessibility _tsaxInvalidateChildrenOnParentCanvasViewEventually](self, "_tsaxInvalidateChildrenOnParentCanvasViewEventually");
}

- (void)addSubview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility addSubview:](&v5, "addSubview:");
  if (a3)
    -[TSUIViewAccessibility _tsaxInvalidateChildrenOnParentCanvasViewEventually](self, "_tsaxInvalidateChildrenOnParentCanvasViewEventually");
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[TSUIViewAccessibility _tsaxInvalidateChildrenOnParentCanvasViewImmediately](self, "_tsaxInvalidateChildrenOnParentCanvasViewImmediately");
  v3.receiver = self;
  v3.super_class = (Class)TSUIViewAccessibility;
  -[TSUIViewAccessibility removeFromSuperview](&v3, "removeFromSuperview");
}

@end
