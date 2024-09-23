@implementation BKViewAccessibility

+ (id)imaxTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(IMAccessibilitySafeCategory);
}

- (BOOL)_accessibilityServesAsContainingParentForOrdering
{
  void *v3;
  BOOL v4;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewAccessibility imaxIdentification](self, "imaxIdentification"));
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ContainerParent")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("TableSwitchSegment")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SwitcherToolbar")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("SwitchContentView")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKViewAccessibility;
    v4 = -[BKViewAccessibility _accessibilityServesAsContainingParentForOrdering](&v6, "_accessibilityServesAsContainingParentForOrdering");
  }

  return v4;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  void *v21;
  void *v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  objc_super v35;
  CGRect v36;
  CGRect v37;
  CGRect result;

  v35.receiver = self;
  v35.super_class = (Class)BKViewAccessibility;
  -[BKViewAccessibility accessibilityFrame](&v35, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewAccessibility imaxIdentification](self, "imaxIdentification"));
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("BookTopLabel")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("TableSwitchSegment")))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("bounds")));
    objc_msgSend(v12, "rectValue");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKViewAccessibility imaxValueForKey:](self, "imaxValueForKey:", CFSTR("window")));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "windowScene"));
    v23 = (char *)objc_msgSend(v22, "interfaceOrientation");

    if ((unint64_t)(v23 - 1) > 1 || (v26 = -20.0, (isPad(v24, v25) & 1) == 0))
      v26 = -10.0;
    v36.origin.x = v14;
    v36.origin.y = v16;
    v36.size.width = v18;
    v36.size.height = v20;
    v37 = CGRectInset(v36, 0.0, v26);
    -[BKViewAccessibility imaxFrameFromBounds:](self, "imaxFrameFromBounds:", v37.origin.x, v37.origin.y, v37.size.width, v37.size.height);
    v4 = v27;
    v6 = v28;
    v8 = v29;
    v10 = v30;

  }
  v31 = v4;
  v32 = v6;
  v33 = v8;
  v34 = v10;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

@end
