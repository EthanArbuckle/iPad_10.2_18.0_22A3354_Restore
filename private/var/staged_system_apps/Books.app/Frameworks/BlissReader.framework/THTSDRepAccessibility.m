@implementation THTSDRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (BOOL)thaxShouldHideChildReps
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A17);
}

- (void)thaxSetShouldHideChildReps:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A17, a3);
}

- (unint64_t)thaxAbsolutePageIndex
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)thaxIsVisibleOnPage
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGRect v16;
  CGRect v17;

  -[THTSDRepAccessibility accessibilityFrame](self, "accessibilityFrame");
  if (v5 <= 0.0)
    return 0;
  v7 = v6;
  if (v6 <= 0.0)
    return 0;
  v8 = v3;
  v9 = v4;
  v10 = v5;
  objc_msgSend(-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](-[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView"), "tsaxEnclosingScrollView"), "accessibilityFrame");
  v17.origin.x = v11;
  v17.origin.y = v12;
  v17.size.width = v13;
  v17.size.height = v14;
  v16.origin.x = v8;
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v7;
  return CGRectIntersectsRect(v16, v17);
}

- (THTSDRepAccessibility)thaxParentRep
{
  void *v3;
  THTSDRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THTSDRepAccessibility);
  result = (THTSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (THTSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  THTSDInteractiveCanvasControllerAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THTSDInteractiveCanvasControllerAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)THTSDRepAccessibility;
  v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](&v6, "tsaxInteractiveCanvasController");
  result = (THTSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (THTSDLayoutAccessibility)tsaxLayout
{
  void *v3;
  TSDLayoutAccessibility *v4;
  THTSDLayoutAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(THTSDLayoutAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)THTSDRepAccessibility;
  v4 = -[TSDRepAccessibility tsaxLayout](&v6, "tsaxLayout");
  result = (THTSDLayoutAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (id)tsaxLayoutDescription
{
  return 0;
}

- (THTSDRepAccessibility)initWithLayout:(id)a3 canvas:(id)a4
{
  THTSDRepAccessibility *v4;
  THTSDRepAccessibility *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)THTSDRepAccessibility;
  v4 = -[THTSDRepAccessibility initWithLayout:canvas:](&v7, "initWithLayout:canvas:", a3, a4);
  v5 = v4;
  if (v4)
    -[THTSDRepAccessibility tsaxLoadAccessibilityInformation](v4, "tsaxLoadAccessibilityInformation");
  return v5;
}

- (BOOL)thaxShouldDisableElementIgnoredTest
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A48);
}

- (void)thaxSetShouldDisableElementIgnoredTest:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A48, a3);
}

- (BOOL)thaxShouldHideElement
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A49);
}

- (void)thaxSetShouldHideElement:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A49, a3);
}

- (id)thaxDuplicateRepInGroupWidgetEmbeddedCanvas
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A4A);
}

- (void)thaxSetDuplicateRepInGroupWidgetEmbeddedCanvas:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A4A, a3);
}

+ (BOOL)thaxRepShouldAllowHitTestingOfChildren:(id)a3
{
  unsigned __int8 v5;
  unsigned int v6;

  v5 = -[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements");
  if ((objc_msgSend(a1, "accessibilityElementsHidden") & 1) != 0)
    LOBYTE(v6) = 0;
  else
    v6 = objc_msgSend(a3, "thaxShouldHideChildReps") ^ 1;
  return v5 ^ 1 | v6;
}

- (BOOL)thaxPressRep
{
  Class v3;
  void *v4;

  LODWORD(v3) = -[THTSDRepAccessibility thaxIsRepPressable](self, "thaxIsRepPressable");
  if ((_DWORD)v3)
  {
    LODWORD(v3) = -[THTSDRepAccessibility _thaxRepWantsPressAction](self, "_thaxRepWantsPressAction");
    if ((_DWORD)v3)
    {
      v4 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
      v3 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), 0, 0);
      if (v3)
      {
        -[objc_class thaxPressableRepWasPressedAtActivationPoint:](v3, "thaxPressableRepWasPressedAtActivationPoint:", self);
        LOBYTE(v3) = 1;
      }
    }
  }
  return (char)v3;
}

- (BOOL)_thaxRepWantsPressAction
{
  unsigned int v3;

  v3 = -[THTSDRepAccessibility conformsToProtocol:](self, "conformsToProtocol:", NSProtocolFromString(CFSTR("THWPressableRep")));
  if (v3)
    LOBYTE(v3) = -[THTSDRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("wantsPressAction"));
  return v3;
}

- (id)thaxPageController
{
  return __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___THAccessibilityPageController, -[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 0, 0);
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  if (-[THTSDInteractiveCanvasControllerAccessibility thaxShouldFilterOutNonVisibleReps](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldFilterOutNonVisibleReps"))
  {
    return -[THTSDRepAccessibility thaxIsVisibleOnPage](self, "thaxIsVisibleOnPage");
  }
  else
  {
    return 1;
  }
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  objc_class *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  Class v16;
  char v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];

  if (!-[THTSDRepAccessibility thaxShouldHideChildReps](self, "thaxShouldHideChildReps"))
  {
    v6 = (void *)objc_opt_new(NSMutableArray, v5);
    v22.receiver = self;
    v22.super_class = (Class)THTSDRepAccessibility;
    -[TSDRepAccessibility tsaxLoadChildrenIntoCollection:](&v22, "tsaxLoadChildrenIntoCollection:", v6);
    if (-[THTSDInteractiveCanvasControllerAccessibility thaxShouldFilterOutNonVisibleReps](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldFilterOutNonVisibleReps"))
    {
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v19;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v19 != v9)
              objc_enumerationMutation(v6);
            v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
            v12 = (objc_class *)objc_opt_class(TSDRepContainerAccessibilityElement);
            v13 = __TSAccessibilityCastAsClass(v12, v11, 0, 0);
            if (!v13)
              goto LABEL_11;
            v14 = (void *)v13;
            v17 = 0;
            v15 = (void *)objc_opt_class(THTSDRepAccessibility);
            v16 = __TSAccessibilityCastAsSafeCategory(v15, (uint64_t)objc_msgSend(v14, "rep"), 1, &v17);
            if (v17)
              abort();
            if (-[objc_class thaxIsVisibleOnPage](v16, "thaxIsVisibleOnPage"))
LABEL_11:
              objc_msgSend(a3, "addObject:", v11);
          }
          v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
        }
        while (v8);
      }
    }
    else
    {
      objc_msgSend(a3, "addObjectsFromArray:", v6);
    }

  }
}

- (BOOL)isAccessibilityElement
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THTSDRepAccessibility;
  v3 = -[TSDRepAccessibility isAccessibilityElement](&v5, "isAccessibilityElement");
  if (v3)
  {
    if (-[THTSDInteractiveCanvasControllerAccessibility thaxShouldFilterOutNonVisibleReps](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldFilterOutNonVisibleReps"))
    {
      LOBYTE(v3) = -[THTSDRepAccessibility thaxIsVisibleOnPage](self, "thaxIsVisibleOnPage");
    }
    else
    {
      LOBYTE(v3) = 1;
    }
  }
  return v3;
}

- (id)accessibilityHint
{
  return 0;
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  return 0;
}

- (BOOL)accessibilityActivate
{
  return -[THTSDRepAccessibility thaxPressRep](self, "thaxPressRep");
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)thaxExpandRep
{
  _BOOL4 v3;
  void *v4;
  Class v5;
  char v7;

  v3 = -[THTSDRepAccessibility _thaxIsRepExpandable](self, "_thaxIsRepExpandable");
  if (v3)
  {
    v7 = 0;
    v4 = (void *)objc_opt_class(THDocumentViewControllerAccessibility);
    v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxDelegate](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxDelegate"), 1, &v7);
    if (v7)
      abort();
    -[objc_class thaxPresentRepExpanded:](v5, "thaxPresentRepExpanded:", self);
  }
  return v3;
}

- (BOOL)_thaxIsRepExpandable
{
  return -[THTSDRepAccessibility conformsToProtocol:](self, "conformsToProtocol:", NSProtocolFromString(CFSTR("THWExpandableRep")));
}

- (NSString)thaxContainingGutterRepLabel
{
  TSDRepAccessibility *v2;
  TSDRepAccessibility *v3;
  void *v4;
  Class v5;

  v2 = -[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep");
  if (!v2)
    return 0;
  v3 = v2;
  while (1)
  {
    v4 = (void *)objc_opt_class(THWGutterRepAccessibility);
    v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);
    if (v5)
      break;
    v3 = -[TSDRepAccessibility tsaxParentRep](v3, "tsaxParentRep");
    if (!v3)
      return 0;
  }
  return (NSString *)-[objc_class tsaxLabel](v5, "tsaxLabel");
}

- (BOOL)_axAllowsSubElementHitTesting
{
  return 0;
}

- (id)_axAncestorRepOfType:(Class)a3
{
  THTSDRepAccessibility *i;

  for (i = self; i; i = -[TSDRepAccessibility tsaxValueForKey:](i, "tsaxValueForKey:", CFSTR("parentRep")))
  {
    if ((objc_opt_isKindOfClass(i, a3) & 1) != 0)
      break;
  }
  return i;
}

- (BOOL)_axIsFlowModeRep
{
  return -[THTSDRepAccessibility _axAncestorRepOfType:](self, "_axAncestorRepOfType:", NSClassFromString(CFSTR("THFlowPageRep"))) != 0;
}

- (CGRect)accessibilityFrame
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  CGFloat width;
  double v9;
  CGFloat height;
  id v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect v21;
  CGRect v22;
  CGRect result;
  CGRect v24;

  v20.receiver = self;
  v20.super_class = (Class)THTSDRepAccessibility;
  -[TSDRepAccessibility accessibilityFrame](&v20, "accessibilityFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  if (-[THTSDInteractiveCanvasControllerAccessibility thaxShouldClipRepAccessibilityFrameToVisibleBounds:](-[THTSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "thaxShouldClipRepAccessibilityFrameToVisibleBounds:", self))
  {
    v11 = -[TSDCanvasViewAccessibility tsaxEnclosingScrollView](-[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView"), "tsaxEnclosingScrollView");
    if (v11)
    {
      objc_msgSend(v11, "accessibilityFrame");
      v24.origin.x = v12;
      v24.origin.y = v13;
      v24.size.width = v14;
      v24.size.height = v15;
      v21.origin.x = x;
      v21.origin.y = y;
      v21.size.width = width;
      v21.size.height = height;
      v22 = CGRectIntersection(v21, v24);
      x = v22.origin.x;
      y = v22.origin.y;
      width = v22.size.width;
      height = v22.size.height;
      if (CGRectIsNull(v22))
      {
        x = CGRectZero.origin.x;
        y = CGRectZero.origin.y;
        width = CGRectZero.size.width;
        height = CGRectZero.size.height;
      }
    }
  }
  v16 = x;
  v17 = y;
  v18 = width;
  v19 = height;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)_axBaseIsElementIgnored
{
  unsigned int v3;
  TSDCanvasViewAccessibility *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  if (!-[THTSDRepAccessibility thaxShouldHideElement](self, "thaxShouldHideElement"))
  {
    if (!-[THTSDRepAccessibility thaxShouldDisableElementIgnoredTest](self, "thaxShouldDisableElementIgnoredTest"))
    {
      v4 = -[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView");
      if (!-[THTSDRepAccessibility _axIsFlowModeRep](self, "_axIsFlowModeRep"))
      {
        v3 = objc_msgSend(-[TSDCanvasViewAccessibility tsaxEnclosingScrollView](v4, "tsaxEnclosingScrollView"), "tsaxBoolValueForKey:", CFSTR("isPagingEnabled"));
        if (!v3)
          return v3;
        -[THTSDRepAccessibility accessibilityFrame](self, "accessibilityFrame");
        v7 = v5 * v6;
        if (v5 * v6 > 0.0)
        {
          -[THTSDRepAccessibility accessibilityFrame](self, "accessibilityFrame");
          LOBYTE(v3) = v8 * v9 / v7 < 0.55;
          return v3;
        }
      }
    }
    LOBYTE(v3) = 0;
    return v3;
  }
  LOBYTE(v3) = 1;
  return v3;
}

- (BOOL)thaxIsElementIgnored
{
  return -[THTSDRepAccessibility _axBaseIsElementIgnored](self, "_axBaseIsElementIgnored");
}

@end
