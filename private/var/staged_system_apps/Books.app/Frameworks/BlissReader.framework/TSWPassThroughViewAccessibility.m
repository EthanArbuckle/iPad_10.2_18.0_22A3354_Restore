@implementation TSWPassThroughViewAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPassThroughView");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  id result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSWPassThroughViewAccessibility;
  result = -[TSWPassThroughViewAccessibility _accessibilityHitTest:withEvent:](&v6, "_accessibilityHitTest:withEvent:", a4, a3.x, a3.y);
  if (result == self)
    return 0;
  return result;
}

- (id)_accessibilityElementsInDirection:(BOOL)a3 withCount:(unsigned int)a4 originalElement:(id)a5
{
  _BOOL4 v7;
  id v9;
  objc_super v11;

  v7 = a3;
  v11.receiver = self;
  v11.super_class = (Class)TSWPassThroughViewAccessibility;
  v9 = -[TSWPassThroughViewAccessibility _accessibilityElementsInDirection:withCount:originalElement:](&v11, "_accessibilityElementsInDirection:withCount:originalElement:");
  if (a5 == self && v7)
  {
    v9 = objc_msgSend(objc_msgSend(a5, "tsaxValueForKey:", CFSTR("_accessibleSubviews")), "sortedArrayUsingSelector:", NSSelectorFromString(CFSTR("accessibilityCompareGeometry:")));
    if ((unint64_t)objc_msgSend(v9, "count") > a4)
      return objc_msgSend(v9, "subarrayWithRange:", 0, a4);
  }
  return v9;
}

- (id)_accessibilityElementsInContainerIncludingContainers:(BOOL)a3
{
  _BOOL4 v3;
  id v6;
  id v7;
  Class v8;
  objc_super v10;

  v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TSWPassThroughViewAccessibility;
  v6 = -[TSWPassThroughViewAccessibility _accessibilityElementsInContainerIncludingContainers:](&v10, "_accessibilityElementsInContainerIncludingContainers:");
  if (v3
    && (objc_msgSend(-[TSWPassThroughViewAccessibility thaxDocumentViewController](self, "thaxDocumentViewController"), "tsaxBoolValueForKey:", CFSTR("inFlowMode")) & 1) == 0)
  {
    v7 = -[TSWPassThroughViewAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("superview"));
    v8 = NSClassFromString(CFSTR("TSDCanvasView"));
    if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
      return objc_msgSend(v7, "performSelector:withObject:", a2, +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", 1));
  }
  return v6;
}

@end
