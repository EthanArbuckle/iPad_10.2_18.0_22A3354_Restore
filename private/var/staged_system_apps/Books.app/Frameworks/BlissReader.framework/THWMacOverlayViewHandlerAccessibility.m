@implementation THWMacOverlayViewHandlerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("THWMacOverlayViewHandler");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)thaxIsShowingAlternateUI
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543A19);
}

- (void)thaxSetShowingAlternateUI:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543A19, a3);
}

- (void)thaxShowAllOverlays
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = -[NSDictionary allValues](-[THWMacOverlayViewHandlerAccessibility _thaxNameToViewMapping](self, "_thaxNameToViewMapping"), "allValues");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (objc_class *)objc_opt_class(UIView);
        v10 = __TSAccessibilityCastAsClass(v9, v8, 0, 0);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_25986C;
        v11[3] = &unk_426E28;
        v11[4] = self;
        v11[5] = v10;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
          abort();
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
}

- (void)thaxHideAllOverlays
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_class *v9;
  uint64_t v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = -[NSDictionary allValues](-[THWMacOverlayViewHandlerAccessibility _thaxNameToViewMapping](self, "_thaxNameToViewMapping"), "allValues");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v7);
        v9 = (objc_class *)objc_opt_class(UIView);
        v10 = __TSAccessibilityCastAsClass(v9, v8, 0, 0);
        v11[0] = _NSConcreteStackBlock;
        v11[1] = 3221225472;
        v11[2] = sub_2599D4;
        v11[3] = &unk_426E28;
        v11[4] = self;
        v11[5] = v10;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
          abort();
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }
}

- (void)p_showOverlay:(id)a3 withAutoHide:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
  -[THWMacOverlayViewHandlerAccessibility p_showOverlay:withAutoHide:](&v4, "p_showOverlay:withAutoHide:", a3, a4 & ~-[THWMacOverlayViewHandlerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"));
}

- (void)p_hideOverlay:(id)a3
{
  objc_super v5;

  if (!-[THWMacOverlayViewHandlerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"))
  {
    v5.receiver = self;
    v5.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    -[THWMacOverlayViewHandlerAccessibility p_hideOverlay:](&v5, "p_hideOverlay:", a3);
  }
}

- (void)mouseEnteredAtPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[THWMacOverlayViewHandlerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"))
  {
    v6.receiver = self;
    v6.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    -[THWMacOverlayViewHandlerAccessibility mouseEnteredAtPoint:](&v6, "mouseEnteredAtPoint:", x, y);
  }
}

- (void)mouseExitedAtPoint:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;

  y = a3.y;
  x = a3.x;
  if (!-[THWMacOverlayViewHandlerAccessibility thaxIsShowingAlternateUI](self, "thaxIsShowingAlternateUI"))
  {
    v6.receiver = self;
    v6.super_class = (Class)THWMacOverlayViewHandlerAccessibility;
    -[THWMacOverlayViewHandlerAccessibility mouseEnteredAtPoint:](&v6, "mouseEnteredAtPoint:", x, y);
  }
}

- (NSDictionary)_thaxNameToViewMapping
{
  objc_class *v3;

  v3 = (objc_class *)objc_opt_class(NSDictionary);
  return (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[THWMacOverlayViewHandlerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("nameToViewMapping")), 0, 0);
}

@end
