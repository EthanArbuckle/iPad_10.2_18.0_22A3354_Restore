@implementation CRLUIViewAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("UIView");
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
  objc_opt_class(CRLUIViewAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (void)crlaxLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility crlaxLoadAccessibilityInformation](&v10, "crlaxLoadAccessibilityInformation");
  v9 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("_accessibilityViewController")));
  objc_opt_class(UIViewController, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v9);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v9)
    abort();
  v8 = (void *)v7;

  objc_msgSend(v8, "crlaxLoadAccessibilityInformation");
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
  uint64_t v11;
  double v12;
  objc_class *v13;
  objc_class *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  objc_super v24;
  CGRect result;

  v24.receiver = self;
  v24.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility _accessibilityFrameForSorting](&v24, "_accessibilityFrameForSorting");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  *(_QWORD *)&v12 = objc_opt_class(UINavigationBar, v11).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("superview"), v12));
  v16 = __CRLAccessibilityCastAsClass(v14, (uint64_t)v15, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
  {
    objc_msgSend(v17, "accessibilityFrame");
    v6 = v18;
    v10 = v19;
  }

  v20 = v4;
  v21 = v6;
  v22 = v8;
  v23 = v10;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (BOOL)accessibilityPerformEscape
{
  unsigned int v3;
  CRLUIViewAccessibility *v4;
  uint64_t v5;
  objc_class *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  char v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)CRLUIViewAccessibility;
  if (-[CRLUIViewAccessibility accessibilityPerformEscape](&v20, "accessibilityPerformEscape"))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    v19 = 0;
    v4 = self;
    objc_opt_class(CRLCanvasView, v5);
    v7 = __CRLAccessibilityCastAsClass(v6, (uint64_t)v4, 1, &v19);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (v19
      || (v9 = (void *)v8,
          v4,
          v19 = 0,
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "nextResponder")),
          objc_opt_class(CRLiOSCanvasViewController, v11),
          v13 = __CRLAccessibilityCastAsClass(v12, (uint64_t)v10, 1, &v19),
          v14 = objc_claimAutoreleasedReturnValue(v13),
          v19))
    {
      abort();
    }
    v15 = (void *)v14;

    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "miniFormatterPresenter"));
    v3 = objc_msgSend(v16, "isPresentingMiniFormatter");

    if (v3)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "miniFormatterPresenter"));
      objc_msgSend(v17, "dismissMiniFormatter");

    }
  }
  return v3;
}

- (id)_accessibilityContainingParentForOrdering
{
  id v3;
  CRLUIViewAccessibility *v4;
  CRLUIViewAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLUIViewAccessibility;
  v3 = -[CRLUIViewAccessibility _accessibilityContainingParentForOrdering](&v7, "_accessibilityContainingParentForOrdering");
  v4 = (CRLUIViewAccessibility *)objc_claimAutoreleasedReturnValue(v3);
  if (!v4)
  {
    v4 = self;
    do
    {
      v5 = v4;
      v4 = (CRLUIViewAccessibility *)objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility superview](v4, "superview"));

    }
    while ((-[CRLUIViewAccessibility crlaxServesAsContainingParentForOrdering](v4, "crlaxServesAsContainingParentForOrdering") & 1) == 0&& v4);
  }
  return v4;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, "_accessibilityLoadAccessibilityInformation");
  -[CRLUIViewAccessibility crlaxLoadAccessibilityInformation](self, "crlaxLoadAccessibilityInformation");
}

- (id)_crlaxParentCanvasView
{
  return -[CRLUIViewAccessibility crlaxViewAncestorOfType:](self, "crlaxViewAncestorOfType:", NSClassFromString(CFSTR("CRLCanvasView")));
}

- (void)_crlaxInvalidateChildrenOnParentCanvasView
{
  id v2;
  _QWORD v3[4];
  id v4;

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003A25E0;
  v3[3] = &unk_10122D110;
  v2 = (id)objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility _crlaxParentCanvasView](self, "_crlaxParentCanvasView"));
  v4 = v2;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();

}

- (BOOL)_accessibilityShouldUseViewHierarchyForFindingScrollParent
{
  Class v3;
  void *v4;
  objc_super v6;

  v3 = NSClassFromString(CFSTR("CRLCanvasView"));
  if ((objc_opt_isKindOfClass(self, v3) & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility _crlaxParentCanvasView](self, "_crlaxParentCanvasView"));

    if (v4)
      return 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  return -[CRLUIViewAccessibility _accessibilityShouldUseViewHierarchyForFindingScrollParent](&v6, "_accessibilityShouldUseViewHierarchyForFindingScrollParent");
}

- (id)accessibilityContainer
{
  Class v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;
  id v10;
  objc_super v12;

  v3 = NSClassFromString(CFSTR("CRLCanvasView"));
  if ((objc_opt_isKindOfClass(self, v3) & 1) != 0)
    goto LABEL_10;
  v4 = objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility _crlaxParentCanvasView](self, "_crlaxParentCanvasView"));
  if (!v4)
    goto LABEL_10;
  v5 = (void *)v4;
  v6 = objc_claimAutoreleasedReturnValue(-[CRLUIViewAccessibility superview](self, "superview"));
  v7 = (void *)v6;
  if (v6 && (void *)v6 != v5)
  {
    do
    {
      v8 = v7;
      v9 = objc_msgSend(v5, "crlaxViewCanBeAddedToContainerElements:", v7);
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

    }
    while (v7 && v7 != v5 && !v9);
    if ((v9 & 1) != 0)
    {

LABEL_10:
      v12.receiver = self;
      v12.super_class = (Class)CRLUIViewAccessibility;
      v10 = -[CRLUIViewAccessibility accessibilityContainer](&v12, "accessibilityContainer");
      return (id)objc_claimAutoreleasedReturnValue(v10);
    }
  }

  return v5;
}

- (void)setIsAccessibilityElement:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CRLUIViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility setIsAccessibilityElement:](&v6, "setIsAccessibilityElement:", v3);
  if (v5 != v3)
    -[CRLUIViewAccessibility _crlaxInvalidateChildrenOnParentCanvasView](self, "_crlaxInvalidateChildrenOnParentCanvasView");
}

- (void)setHidden:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  objc_super v6;

  v3 = a3;
  v5 = -[CRLUIViewAccessibility isHidden](self, "isHidden");
  v6.receiver = self;
  v6.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility setHidden:](&v6, "setHidden:", v3);
  if (v5 != v3)
    -[CRLUIViewAccessibility _crlaxInvalidateChildrenOnParentCanvasView](self, "_crlaxInvalidateChildrenOnParentCanvasView");
}

- (void)setAlpha:(double)a3
{
  double v5;
  double v6;
  objc_super v7;

  -[CRLUIViewAccessibility alpha](self, "alpha");
  v6 = v5;
  v7.receiver = self;
  v7.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility setAlpha:](&v7, "setAlpha:", a3);
  if (a3 == 0.0 && v6 > 0.0 || a3 > 0.0 && v6 == 0.0)
    -[CRLUIViewAccessibility _crlaxInvalidateChildrenOnParentCanvasView](self, "_crlaxInvalidateChildrenOnParentCanvasView");
}

- (void)addSubview:(id)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility addSubview:](&v5, "addSubview:");
  if (a3)
    -[CRLUIViewAccessibility _crlaxInvalidateChildrenOnParentCanvasView](self, "_crlaxInvalidateChildrenOnParentCanvasView");
}

- (void)removeFromSuperview
{
  objc_super v3;

  -[CRLUIViewAccessibility _crlaxInvalidateChildrenOnParentCanvasView](self, "_crlaxInvalidateChildrenOnParentCanvasView");
  v3.receiver = self;
  v3.super_class = (Class)CRLUIViewAccessibility;
  -[CRLUIViewAccessibility removeFromSuperview](&v3, "removeFromSuperview");
}

@end
