@implementation THScrollViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THScrollView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_thaxIsScrollingEnabled
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A1C);
}

- (void)_thaxSetScrollingEnabled:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A1C, a3);
}

- (BOOL)_thaxShouldIgnoreScrollingEnabledChanges
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A1D);
}

- (void)_thaxSetShouldIgnoreScrollingEnabledChanges:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A1D, a3);
}

- (void)_axInitializeScrollingEnabledFlag
{
  if (-[THScrollViewAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isScrollingEnabled")))-[THScrollViewAccessibility _thaxSetScrollingEnabled:](self, "_thaxSetScrollingEnabled:", 1);
}

- (THScrollViewAccessibility)initWithFrame:(CGRect)a3
{
  THScrollViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  v3 = -[THScrollViewAccessibility initWithFrame:](&v5, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[THScrollViewAccessibility _axInitializeScrollingEnabledFlag](v3, "_axInitializeScrollingEnabledFlag");
  return v3;
}

- (THScrollViewAccessibility)initWithCoder:(id)a3
{
  THScrollViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  v3 = -[THScrollViewAccessibility initWithCoder:](&v5, "initWithCoder:", a3);
  -[THScrollViewAccessibility _axInitializeScrollingEnabledFlag](v3, "_axInitializeScrollingEnabledFlag");
  return v3;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  _BOOL8 v8;
  id v9;
  objc_super v11;

  y = a3.y;
  x = a3.x;
  v8 = -[THScrollViewAccessibility _thaxShouldIgnoreScrollingEnabledChanges](self, "_thaxShouldIgnoreScrollingEnabledChanges");
  -[THScrollViewAccessibility _thaxSetShouldIgnoreScrollingEnabledChanges:](self, "_thaxSetShouldIgnoreScrollingEnabledChanges:", 1);
  v11.receiver = self;
  v11.super_class = (Class)THScrollViewAccessibility;
  v9 = -[THScrollViewAccessibility hitTest:withEvent:](&v11, "hitTest:withEvent:", a4, x, y);
  -[THScrollViewAccessibility _thaxSetShouldIgnoreScrollingEnabledChanges:](self, "_thaxSetShouldIgnoreScrollingEnabledChanges:", v8);
  return v9;
}

- (void)setScrollEnabled:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)THScrollViewAccessibility;
  -[THScrollViewAccessibility setScrollEnabled:](&v5, "setScrollEnabled:");
  if (!-[THScrollViewAccessibility _thaxShouldIgnoreScrollingEnabledChanges](self, "_thaxShouldIgnoreScrollingEnabledChanges"))-[THScrollViewAccessibility _thaxSetScrollingEnabled:](self, "_thaxSetScrollingEnabled:", v3);
}

- (BOOL)_accessibilityScrollingEnabled
{
  return -[THScrollViewAccessibility _thaxIsScrollingEnabled](self, "_thaxIsScrollingEnabled");
}

- (void)_accessibilityScrollToFrame:(CGRect)a3 forView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double MaxY;
  double MaxX;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double MinY;
  double v40;
  double v41;
  double v42;
  double v43;
  BOOL v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGFloat rect;
  CGFloat recta;
  objc_super v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = -[THScrollViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController");
  if (objc_msgSend(v10, "tsaxValueForKey:", CFSTR("canvasScrollView")) == self
    && objc_msgSend(v10, "tsaxBoolValueForKey:", CFSTR("inFlowMode")))
  {
    -[THScrollViewAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("visibleBounds"));
    v12 = v11;
    v14 = v13;
    rect = v15;
    v17 = v16;
    if (a4 != self)
    {
      if (a4)
      {
        objc_msgSend(a4, "bounds");
        objc_msgSend(a4, "convertRect:toView:", self);
      }
      else
      {
        -[THScrollViewAccessibility convertRect:fromView:](self, "convertRect:fromView:", 0, x, y, width, height);
      }
      x = v18;
      y = v19;
      width = v20;
      height = v21;
    }
    v22 = v14 + -20.0;
    v23 = v12 + 20.0;
    v52.origin.x = x;
    v52.origin.y = y;
    v52.size.width = width;
    v52.size.height = height;
    MinX = CGRectGetMinX(v52);
    v53.origin.x = v17;
    v53.origin.y = v23;
    v53.size.width = rect;
    v53.size.height = v22;
    if (MinX < CGRectGetMinX(v53))
      goto LABEL_32;
    v54.origin.x = x;
    v54.origin.y = y;
    v54.size.width = width;
    v54.size.height = height;
    MaxY = CGRectGetMaxY(v54);
    v55.origin.x = v17;
    v55.origin.y = v23;
    v55.size.height = v22;
    v55.size.width = rect;
    if (MaxY < CGRectGetMinY(v55))
      goto LABEL_32;
    v56.origin.x = x;
    v56.origin.y = y;
    v56.size.width = width;
    v56.size.height = height;
    MaxX = CGRectGetMaxX(v56);
    v57.origin.x = v17;
    v57.origin.y = v23;
    v57.size.height = v22;
    v57.size.width = rect;
    if (MaxX > CGRectGetMaxX(v57))
      goto LABEL_32;
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    v27 = CGRectGetMaxY(v58);
    v59.origin.x = v17;
    v59.origin.y = v23;
    v59.size.height = v22;
    v59.size.width = rect;
    if (v27 > CGRectGetMaxY(v59))
    {
LABEL_32:
      -[THScrollViewAccessibility bounds](self, "bounds");
      v28 = v60.origin.x;
      v29 = v60.origin.y;
      v30 = v60.size.width;
      v31 = v60.size.height;
      v80.origin.x = x;
      v80.origin.y = y;
      v80.size.width = width;
      v80.size.height = height;
      if (!CGRectContainsRect(v60, v80))
      {
        -[THScrollViewAccessibility contentOffset](self, "contentOffset");
        v47 = v33;
        v48 = v32;
        v61.origin.x = x;
        v61.origin.y = y;
        v61.size.width = width;
        v61.size.height = height;
        v34 = CGRectGetMinX(v61);
        v62.size.height = v31;
        v35 = v34;
        v62.origin.x = v28;
        v62.origin.y = v29;
        v62.size.width = v30;
        recta = v62.size.height;
        if (v35 >= CGRectGetMaxX(v62))
        {
          v66.origin.x = x;
          v66.origin.y = y;
          v66.size.width = width;
          v66.size.height = height;
          v38 = CGRectGetMaxX(v66);
          v67.origin.x = v28;
          v67.origin.y = v29;
          v67.size.width = v30;
          v67.size.height = recta;
          v37 = v38 - CGRectGetWidth(v67);
        }
        else
        {
          v63.origin.x = x;
          v63.origin.y = y;
          v63.size.width = width;
          v63.size.height = height;
          v36 = CGRectGetMinX(v63);
          v64.origin.x = v28;
          v64.origin.y = v29;
          v64.size.width = v30;
          v64.size.height = recta;
          if (v36 >= CGRectGetMinX(v64))
            goto LABEL_20;
          v65.origin.x = x;
          v65.origin.y = y;
          v65.size.width = width;
          v65.size.height = height;
          v37 = CGRectGetMinX(v65);
        }
        v48 = v37;
LABEL_20:
        v68.origin.x = x;
        v68.origin.y = y;
        v68.size.width = width;
        v68.size.height = height;
        MinY = CGRectGetMinY(v68);
        v69.origin.x = v28;
        v69.origin.y = v29;
        v69.size.width = v30;
        v69.size.height = recta;
        if (MinY < CGRectGetMinY(v69))
        {
          v70.origin.x = x;
          v70.origin.y = y;
          v70.size.width = width;
          v70.size.height = height;
          v40 = CGRectGetMinY(v70);
          v41 = v48;
LABEL_29:
          -[THScrollViewAccessibility setContentOffset:animated:](self, "setContentOffset:animated:", 0, v41, v40);
          -[THScrollViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_adjustContentOffsetIfNecessary"));
          return;
        }
        v71.origin.x = x;
        v71.origin.y = y;
        v71.size.width = width;
        v71.size.height = height;
        v42 = CGRectGetMaxY(v71);
        v72.origin.x = v28;
        v72.origin.y = v29;
        v72.size.width = v30;
        v72.size.height = recta;
        if (v42 <= CGRectGetMaxY(v72))
        {
          v77.origin.x = x;
          v77.origin.y = y;
          v77.size.width = width;
          v77.size.height = height;
          v46 = CGRectGetMinY(v77);
          v78.origin.x = v28;
          v78.origin.y = v29;
          v78.size.width = v30;
          v78.size.height = recta;
          v44 = v46 < CGRectGetMinY(v78);
          v40 = v47;
          v41 = v48;
          if (!v44)
            goto LABEL_29;
        }
        else
        {
          v73.origin.x = x;
          v73.origin.y = y;
          v73.size.width = width;
          v73.size.height = height;
          v43 = CGRectGetHeight(v73);
          v74.origin.x = v28;
          v74.origin.y = v29;
          v74.size.width = v30;
          v74.size.height = recta;
          v44 = v43 < CGRectGetHeight(v74);
          v41 = v48;
          if (v44)
          {
            v75.origin.x = x;
            v75.origin.y = y;
            v75.size.width = width;
            v75.size.height = height;
            v45 = CGRectGetMaxY(v75);
            v76.origin.x = v28;
            v76.origin.y = v29;
            v76.size.width = v30;
            v76.size.height = recta;
            v40 = v45 - CGRectGetHeight(v76);
            goto LABEL_29;
          }
        }
        v79.origin.x = x;
        v79.origin.y = y;
        v79.size.width = width;
        v79.size.height = height;
        v40 = CGRectGetMinY(v79);
        goto LABEL_29;
      }
    }
  }
  else
  {
    v51.receiver = self;
    v51.super_class = (Class)THScrollViewAccessibility;
    -[THScrollViewAccessibility _accessibilityScrollToFrame:forView:](&v51, "_accessibilityScrollToFrame:forView:", a4, x, y, width, height);
  }
}

- (BOOL)_accessibilityShouldUpdateQuickSpeakContent
{
  return 1;
}

- (void)tsaxLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)THScrollViewAccessibility;
  -[THScrollViewAccessibility tsaxLoadAccessibilityInformation](&v3, "tsaxLoadAccessibilityInformation");
  -[THScrollViewAccessibility _axInitializeScrollingEnabledFlag](self, "_axInitializeScrollingEnabledFlag");
}

@end
