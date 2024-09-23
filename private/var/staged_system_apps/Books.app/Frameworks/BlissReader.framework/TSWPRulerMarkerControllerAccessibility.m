@implementation TSWPRulerMarkerControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPRulerMarkerController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPRulerControllerAccessibility)tsaxParentRulerController
{
  return (TSWPRulerControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543885);
}

- (void)tsaxSetParentRulerController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543885, a3);
}

- (NSString)_tsaxLastAnnouncedValue
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_543886);
}

- (void)_tsaxSetLastAnnouncedValue:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543886, a3);
}

- (void)tsaxAdjustValueOfMarker:(id)a3 byNumberOfTicks:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  _QWORD v13[9];
  CGRect v14;
  CGRect v15;

  -[TSWPRulerMarkerControllerAccessibility _tsaxSetDraggingRulerMarker:](self, "_tsaxSetDraggingRulerMarker:", a3);
  -[TSWPRulerMarkerControllerAccessibility _tsaxConvertNumberOfTicksToPoints:](self, "_tsaxConvertNumberOfTicksToPoints:", a4);
  v7 = v6;
  objc_msgSend(-[TSWPRulerMarkerControllerAccessibility _tsaxParentLayer](self, "_tsaxParentLayer"), "frame");
  x = v14.origin.x;
  y = v14.origin.y;
  width = v14.size.width;
  height = v14.size.height;
  MidX = CGRectGetMidX(v14);
  v15.origin.x = x;
  v15.origin.y = y;
  v15.size.width = width;
  v15.size.height = height;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2373C4;
  v13[3] = &unk_427178;
  v13[4] = self;
  v13[5] = v7;
  v13[6] = 0;
  *(CGFloat *)&v13[7] = MidX;
  v13[8] = CGRectGetMidY(v15);
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v13))
    abort();
  -[TSWPRulerMarkerControllerAccessibility _tsaxSetDraggingRulerMarker:](self, "_tsaxSetDraggingRulerMarker:", 0);
}

- (NSString)tsaxCurrentRulerUnitsDescription
{
  return -[TSWPRulerControllerAccessibility tsaxCurrentRulerUnitsDescription](-[TSWPRulerMarkerControllerAccessibility tsaxParentRulerController](self, "tsaxParentRulerController"), "tsaxCurrentRulerUnitsDescription");
}

- (double)tsaxEquivalentValueInCurrentRulerUnitsForModelValue:(double)a3 andMarkerType:(int)a4
{
  double v7;
  double v8;
  double v9;
  _QWORD v11[7];
  uint64_t v12;
  double *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  uint64_t v18;
  uint64_t v19;

  v16 = 0;
  v17 = (double *)&v16;
  v18 = 0x2020000000;
  v19 = 0;
  v12 = 0;
  v13 = (double *)&v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_23754C;
  v11[3] = &unk_427AC8;
  v11[4] = self;
  v11[5] = &v16;
  v11[6] = &v12;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  if (a4 >= 6)
  {
    if (a4 == 6)
    {
      v7 = v13[3] - a3;
      goto LABEL_4;
    }
    v7 = 0.0;
    if (a4 != 7)
      goto LABEL_4;
  }
  v7 = v17[3] + a3;
LABEL_4:
  -[TSWPRulerControllerAccessibility tsaxEquivalentValueInCurrentRulerUnitsForModelValue:](-[TSWPRulerMarkerControllerAccessibility tsaxParentRulerController](self, "tsaxParentRulerController"), "tsaxEquivalentValueInCurrentRulerUnitsForModelValue:", v7);
  v9 = v8;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  return v9;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)tsaxMinMaxModelValuesForRulerMarker:(id)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[7];
  uint64_t v8;
  double *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v8 = 0;
  v9 = (double *)&v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_237634;
  v7[3] = &unk_427D68;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.var1 = v6;
  result.var0 = v5;
  return result;
}

- (NSArray)tsaxMarkerLayers
{
  objc_class *v3;
  NSArray *v4;
  NSArray *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  Class v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];

  v18 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  v4 = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSWPRulerMarkerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("markerLayers")), 1, &v18);
  if (v18)
LABEL_11:
    abort();
  v5 = v4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v18 = 0;
        v11 = (void *)objc_opt_class(TSWPRulerMarkerAccessibility);
        v12 = __TSAccessibilityCastAsSafeCategory(v11, v10, 1, &v18);
        if (v18)
          goto LABEL_11;
        -[objc_class tsaxSetParentRulerMarkerController:](v12, "tsaxSetParentRulerMarkerController:", self);
      }
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v7);
  }
  return v5;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  void *v9;
  Class v10;
  objc_super v11;
  char v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = -[TSWPRulerMarkerControllerAccessibility tsaxMarkerLayers](self, "tsaxMarkerLayers");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v12 = 0;
        v9 = (void *)objc_opt_class(TSWPRulerMarkerAccessibility);
        v10 = __TSAccessibilityCastAsSafeCategory(v9, v8, 1, &v12);
        if (v12)
          abort();
        -[objc_class tsaxSetParentRulerMarkerController:](v10, "tsaxSetParentRulerMarkerController:", 0);
      }
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }
  v11.receiver = self;
  v11.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  -[TSWPRulerMarkerControllerAccessibility dealloc](&v11, "dealloc");
}

- (void)addMarker:(id)a3 animation:(int)a4
{
  void *v6;
  Class v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  -[TSWPRulerMarkerControllerAccessibility addMarker:animation:](&v9, "addMarker:animation:", a3, *(_QWORD *)&a4);
  v8 = 0;
  v6 = (void *)objc_opt_class(TSWPRulerMarkerAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a3, 1, &v8);
  if (v8)
    abort();
  -[objc_class tsaxSetParentRulerMarkerController:](v7, "tsaxSetParentRulerMarkerController:", self);
}

- (void)removeMarker:(id)a3 animation:(int)a4
{
  uint64_t v4;
  void *v7;
  Class v8;
  objc_super v9;
  char v10;

  v4 = *(_QWORD *)&a4;
  v10 = 0;
  v7 = (void *)objc_opt_class(TSWPRulerMarkerAccessibility);
  v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)a3, 1, &v10);
  if (v10)
    abort();
  -[objc_class tsaxSetParentRulerMarkerController:](v8, "tsaxSetParentRulerMarkerController:", 0);
  v9.receiver = self;
  v9.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  -[TSWPRulerMarkerControllerAccessibility removeMarker:animation:](&v9, "removeMarker:animation:", a3, v4);
}

- (void)p_moveDragWithOffset:(CGPoint)a3 rulerPoint:(CGPoint)a4 forceUpdate:(BOOL)a5
{
  id v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSWPRulerMarkerControllerAccessibility;
  -[TSWPRulerMarkerControllerAccessibility p_moveDragWithOffset:rulerPoint:forceUpdate:](&v7, "p_moveDragWithOffset:rulerPoint:forceUpdate:", a5, a3.x, a3.y, a4.x, a4.y);
  v6 = objc_msgSend(-[TSWPRulerMarkerControllerAccessibility _tsaxDraggingRulerMarker](self, "_tsaxDraggingRulerMarker"), "tsaxValueWithUnits");
  if ((objc_msgSend(v6, "isEqualToString:", -[TSWPRulerMarkerControllerAccessibility _tsaxLastAnnouncedValue](self, "_tsaxLastAnnouncedValue")) & 1) == 0)
  {
    if (-[TSWPRulerMarkerControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxValueOfDraggingRulerMarkerWasUpdated:", &OBJC_PROTOCOL___TSWPRulerMarkerControllerAccessibilityExtras))-[TSWPRulerMarkerControllerAccessibility tsaxValueOfDraggingRulerMarkerWasUpdated:](self, "tsaxValueOfDraggingRulerMarkerWasUpdated:", v6);
    -[TSWPRulerMarkerControllerAccessibility _tsaxSetLastAnnouncedValue:](self, "_tsaxSetLastAnnouncedValue:", v6);
  }
}

- (void)_tsaxSetDraggingRulerMarker:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_237AF4;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (id)_tsaxDraggingRulerMarker
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPRulerMarkerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPRulerMarkerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("draggingRulerMarker")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_tsaxParentLayer
{
  objc_class *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(CALayer);
  result = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSWPRulerMarkerControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("_parentLayer")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (double)_tsaxConvertNumberOfTicksToPoints:(int64_t)a3
{
  double result;

  -[TSWPRulerControllerAccessibility tsaxPointValueForNumberOfTicks:](-[TSWPRulerMarkerControllerAccessibility tsaxParentRulerController](self, "tsaxParentRulerController"), "tsaxPointValueForNumberOfTicks:", a3);
  return result;
}

- (void)tsaxValueOfDraggingRulerMarkerWasUpdated:(id)a3
{
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, a3);
}

@end
