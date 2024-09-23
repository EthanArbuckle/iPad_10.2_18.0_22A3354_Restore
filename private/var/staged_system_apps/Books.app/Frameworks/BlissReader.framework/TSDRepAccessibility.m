@implementation TSDRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)tsaxWasExplicitlyFocused
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543849);
}

- (void)tsaxSetWasExplicitlyFocused:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543849, a3);
}

- (NSArray)_tsaxKnobAccessibilityElementsCache
{
  return (NSArray *)__TSAccessibilityGetAssociatedObject(self, &unk_54384A);
}

- (void)_tsaxSetKnobAccessibilityElementsCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_54384A, a3);
}

- (BOOL)_tsaxShouldPreventAccessToCanvas
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54384B);
}

- (void)_tsaxSetShouldPreventAccessToCanvas:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54384B, a3);
}

- (BOOL)_tsaxKnobElementCacheIsInvalid
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54384C);
}

- (void)_tsaxSetKnobElementCacheIsInvalid:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54384C, a3);
}

- (BOOL)tsaxIsInInteractiveCanvas
{
  return -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController") != 0;
}

- (CGRect)tsaxFrameInUnscaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDRepAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("frameInUnscaledCanvas"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)tsaxLayerFrameInScaledCanvas
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDRepAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("layerFrameInScaledCanvas"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)tsaxFrameInScreenSpace
{
  TSDCanvasAccessibility *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect result;

  v3 = -[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas");
  -[TSDRepAccessibility tsaxLayerFrameInScaledCanvas](self, "tsaxLayerFrameInScaledCanvas");
  -[TSDCanvasAccessibility tsaxScreenFrameFromLayerFrameInScaledCanvas:](v3, "tsaxScreenFrameFromLayerFrameInScaledCanvas:");
  result.size.height = v7;
  result.size.width = v6;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  void *v3;
  TSDCanvasAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDCanvasAccessibility);
  result = (TSDCanvasAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvas")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
  result = (TSDInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDCanvasAccessibility tsaxInteractiveCanvasController](-[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas"), "tsaxInteractiveCanvasController"), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDCanvasViewAccessibility)tsaxCanvasView
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvasView");
}

- (TSDRepAccessibility)tsaxParentRep
{
  void *v3;
  TSDRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDRepAccessibility);
  result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("parentRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxInfo
{
  return -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("info"));
}

- (TSDLayoutAccessibility)tsaxLayout
{
  void *v3;
  TSDLayoutAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDLayoutAccessibility);
  result = (TSDLayoutAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layout")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxIsSelected
{
  if ((-[TSDRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isSelected")) & 1) != 0)
    return 1;
  else
    return -[TSDRepAccessibility tsaxIsSelected](-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), "tsaxIsSelected");
}

- (BOOL)tsaxIsSelectable
{
  return -[TSDRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isSelectable"));
}

- (TSDRepAccessibility)tsaxRepForSelecting
{
  TSDRepAccessibility *result;
  void *v4;
  char v5;

  result = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  if (result)
  {
    v5 = 0;
    v4 = (void *)objc_opt_class(TSDRepAccessibility);
    result = (TSDRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("repForSelecting")), 1, &v5);
    if (v5)
      abort();
  }
  return result;
}

- (BOOL)tsaxShouldCreateKnobs
{
  return -[TSDRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("shouldCreateKnobs"));
}

- (CGRect)tsaxNaturalBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[TSDRepAccessibility tsaxCGRectValueForKey:](self, "tsaxCGRectValueForKey:", CFSTR("naturalBounds"));
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (NSString)tsaxLayoutDescription
{
  NSString *v3;
  NSString *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSDRepAccessibility _tsaxSizeDescription](self, "_tsaxSizeDescription");
  v4 = -[TSDRepAccessibility _tsaxOriginDescription](self, "_tsaxOriginDescription");
  -[TSDRepAccessibility _tsaxRotationDescription](self, "_tsaxRotationDescription");
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (BOOL)tsaxIsLocked
{
  return -[TSDRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isLocked"));
}

- (NSString)tsaxLockedLabel
{
  if (-[TSDRepAccessibility tsaxIsLocked](self, "tsaxIsLocked"))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("canvas.item.locked.label"));
  else
    return 0;
}

- (NSString)tsaxLockedHint
{
  if (-[TSDRepAccessibility tsaxIsLocked](self, "tsaxIsLocked"))
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("canvas.item.locked.hint"));
  else
    return 0;
}

- (NSArray)tsaxKnobAccessibilityElements
{
  objc_class *v3;
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  NSArray *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v20;
  id v21;
  id obj;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v31 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  obj = (id)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("knobs")), 1, &v31);
  if (v31)
LABEL_28:
    abort();
  if (-[TSDRepAccessibility _tsaxKnobElementCacheIsInvalid](self, "_tsaxKnobElementCacheIsInvalid")
    || (v4 = -[NSArray count](-[TSDRepAccessibility _tsaxKnobAccessibilityElementsCache](self, "_tsaxKnobAccessibilityElementsCache"), "count"), v4 != objc_msgSend(obj, "count")))
  {
    v21 = +[NSMutableArray array](NSMutableArray, "array");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v28;
      v20 = *(_QWORD *)v28;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v28 != v7)
            objc_enumerationMutation(obj);
          v9 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
          v31 = 0;
          v10 = (void *)objc_opt_class(TSDKnobAccessibility);
          v11 = __TSAccessibilityCastAsSafeCategory(v10, v9, 1, &v31);
          if (v31)
            goto LABEL_28;
          v12 = v11;
          if (v11
            && -[TSDRepAccessibility tsaxShouldCreateAccessibilityElementForKnob:](self, "tsaxShouldCreateAccessibilityElementForKnob:", v11))
          {
            v25 = 0u;
            v26 = 0u;
            v23 = 0u;
            v24 = 0u;
            v13 = -[TSDRepAccessibility _tsaxKnobAccessibilityElementsCache](self, "_tsaxKnobAccessibilityElementsCache");
            v14 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
            if (v14)
            {
              v15 = v14;
              v16 = *(_QWORD *)v24;
LABEL_14:
              v17 = 0;
              while (1)
              {
                if (*(_QWORD *)v24 != v16)
                  objc_enumerationMutation(v13);
                v18 = *(id *)(*((_QWORD *)&v23 + 1) + 8 * v17);
                if ((objc_msgSend(v18, "isEqualToKnob:", v12) & 1) != 0)
                  break;
                if (v15 == (id)++v17)
                {
                  v15 = -[NSArray countByEnumeratingWithState:objects:count:](v13, "countByEnumeratingWithState:objects:count:", &v23, v32, 16);
                  if (v15)
                    goto LABEL_14;
                  goto LABEL_22;
                }
              }
              if (v18)
                goto LABEL_23;
            }
LABEL_22:
            v18 = -[TSDRepAccessibility tsaxNewKnobElementForKnob:](self, "tsaxNewKnobElementForKnob:", v12);
LABEL_23:
            objc_msgSend(v18, "setParentRep:", self);
            objc_msgSend(v21, "tsaxAddObjectIfNotNil:", v18);
            v7 = v20;
          }
        }
        v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v27, v33, 16);
      }
      while (v6);
    }
    -[TSDRepAccessibility _tsaxSetKnobAccessibilityElementsCache:](self, "_tsaxSetKnobAccessibilityElementsCache:", v21);
    -[TSDRepAccessibility _tsaxSetKnobElementCacheIsInvalid:](self, "_tsaxSetKnobElementCacheIsInvalid:", 0);
  }
  return -[TSDRepAccessibility _tsaxKnobAccessibilityElementsCache](self, "_tsaxKnobAccessibilityElementsCache");
}

- (NSString)tsaxKnobLabel
{
  return (NSString *)&stru_43D7D8;
}

- (id)tsaxKnobForTag:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  id result;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  char v15;

  v15 = 0;
  v5 = (void *)objc_opt_class(TSDKnobAccessibility);
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_22B2E8;
  v13 = sub_22B2F8;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_22B304;
  v8[3] = &unk_428E60;
  v8[4] = self;
  v8[5] = &v9;
  v8[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  result = __TSAccessibilityCastAsSafeCategory(v5, v6, 1, &v15);
  if (v15)
    abort();
  return result;
}

- (id)tsaxKnobElementForTag:(unint64_t)a3
{
  NSArray *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = -[TSDRepAccessibility tsaxKnobAccessibilityElements](self, "tsaxKnobAccessibilityElements", 0);
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(v4);
    v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if (objc_msgSend(v9, "knobTag") == (id)a3)
      return v9;
    if (v6 == (id)++v8)
    {
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (BOOL)tsaxShouldExposeAsAttachmentToken
{
  return 0;
}

- (NSString)tsaxSummaryDescription
{
  if ((objc_opt_respondsToSelector(self, "accessibilityLabel") & 1) != 0)
    return (NSString *)-[TSDRepAccessibility accessibilityLabel](self, "accessibilityLabel");
  else
    return 0;
}

- (BOOL)tsaxSupportsChangeTracking
{
  return 0;
}

- (TSDDrawableCommentAccessibility)tsaxComment
{
  void *v3;
  Class v4;
  char v6;

  v6 = 0;
  v3 = (void *)objc_opt_class(TSDDrawableInfoAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxInfo](self, "tsaxInfo"), 1, &v6);
  if (v6)
    abort();
  return (TSDDrawableCommentAccessibility *)-[objc_class tsaxComment](v4, "tsaxComment");
}

- (BOOL)tsaxHasComment
{
  return -[TSDRepAccessibility tsaxComment](self, "tsaxComment") != 0;
}

- (CGAffineTransform)tsaxTransformToConvertNaturalFromLayerRelative
{
  uint64_t *v4;
  __int128 v5;
  CGAffineTransform *result;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v8 = 0;
  v9 = &v8;
  v10 = 0x5010000000;
  v11 = "";
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22B5D4;
  v7[3] = &unk_42BF18;
  v7[4] = self;
  v7[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v4 = v9;
  v5 = *((_OWORD *)v9 + 3);
  *(_OWORD *)&retstr->a = *((_OWORD *)v9 + 2);
  *(_OWORD *)&retstr->c = v5;
  *(_OWORD *)&retstr->tx = *((_OWORD *)v4 + 4);
  _Block_object_dispose(&v8, 8);
  return result;
}

- (id)tsaxNewKnobElementForKnob:(id)a3
{
  return -[TSDKnobAccessibilityElement initWithKnobTag:parentRep:]([TSDKnobAccessibilityElement alloc], "initWithKnobTag:parentRep:", objc_msgSend(a3, "tsaxKnobTag"), self);
}

- (CGPoint)tsaxConvertNaturalPointFromUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  CGPoint v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22B730;
  v7[3] = &unk_43B930;
  v7[4] = self;
  v7[5] = &v9;
  v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v10[4];
  v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertNaturalRectFromUnscaledCanvas:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = "";
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_22B848;
  v11[3] = &unk_43B958;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)tsaxConvertNaturalPointToUnscaledCanvas:(CGPoint)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  _QWORD v7[6];
  CGPoint v8;
  uint64_t v9;
  double *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  CGPoint result;

  v9 = 0;
  v10 = (double *)&v9;
  v11 = 0x3010000000;
  v13 = 0;
  v14 = 0;
  v12 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_22B94C;
  v7[3] = &unk_43B930;
  v7[4] = self;
  v7[5] = &v9;
  v8 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v10[4];
  v4 = v10[5];
  _Block_object_dispose(&v9, 8);
  v5 = v3;
  v6 = v4;
  result.y = v6;
  result.x = v5;
  return result;
}

- (CGRect)tsaxConvertNaturalRectToUnscaledCanvas:(CGRect)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  CGRect v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  const char *v16;
  __int128 v17;
  __int128 v18;
  CGRect result;

  v13 = 0;
  v14 = (double *)&v13;
  v15 = 0x4010000000;
  v16 = "";
  v17 = 0u;
  v18 = 0u;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_22BA64;
  v11[3] = &unk_43B958;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = v14[4];
  v4 = v14[5];
  v5 = v14[6];
  v6 = v14[7];
  _Block_object_dispose(&v13, 8);
  v7 = v3;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGPoint)tsaxConvertNaturalPointToScreenSpace:(CGPoint)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[TSDRepAccessibility tsaxConvertNaturalRectToScreenSpace:](self, "tsaxConvertNaturalRectToScreenSpace:", a3.x, a3.y, 0.0, 0.0);
  result.y = v4;
  result.x = v3;
  return result;
}

- (CGRect)tsaxConvertNaturalRectToScreenSpace:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGRect result;

  -[TSDRepAccessibility tsaxConvertNaturalRectToUnscaledCanvas:](self, "tsaxConvertNaturalRectToUnscaledCanvas:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxConvertUnscaledToBoundsRect:", v4, v5, v6, v7);
  -[TSDCanvasViewAccessibility tsaxFrameFromBounds:](-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvasView"), "tsaxFrameFromBounds:", v8, v9, v10, v11);
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (CGRect)tsaxConvertLayerRelativeRectToNaturalRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGAffineTransform v7;
  CGRect v8;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (self)
    -[TSDRepAccessibility tsaxTransformToConvertNaturalFromLayerRelative](self, "tsaxTransformToConvertNaturalFromLayerRelative");
  else
    memset(&v7, 0, sizeof(v7));
  v8.origin.x = x;
  v8.origin.y = y;
  v8.size.width = width;
  v8.size.height = height;
  return CGRectApplyAffineTransform(v8, &v7);
}

- (BOOL)tsaxShouldCreateAccessibilityElementForKnob:(id)a3
{
  return 1;
}

- (void)i_willBeRemoved
{
  objc_super v3;

  -[TSDRepAccessibility _tsaxSetShouldPreventAccessToCanvas:](self, "_tsaxSetShouldPreventAccessToCanvas:", 1);
  -[TSDRepAccessibility tsaxPerformCleanupTasksPriorToRemovalFromCanvas](self, "tsaxPerformCleanupTasksPriorToRemovalFromCanvas");
  if (-[TSDRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas", &OBJC_PROTOCOL___TSDRepAccessibilityExtras))-[TSDRepAccessibility tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas](self, "tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas");
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility i_willBeRemoved](&v3, "i_willBeRemoved");
}

- (void)invalidateKnobs
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility invalidateKnobs](&v3, "invalidateKnobs");
  -[TSDRepAccessibility _tsaxSetKnobElementCacheIsInvalid:](self, "_tsaxSetKnobElementCacheIsInvalid:", 1);
}

- (void)becameSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility becameSelected](&v3, "becameSelected");
  if (-[TSDRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxBecameSelected", &OBJC_PROTOCOL___TSDRepAccessibilityExtras))-[TSDRepAccessibility tsaxBecameSelected](self, "tsaxBecameSelected");
}

- (void)becameNotSelected
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility becameNotSelected](&v3, "becameNotSelected");
  if (-[TSDRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxBecameNotSelected", &OBJC_PROTOCOL___TSDRepAccessibilityExtras))-[TSDRepAccessibility tsaxBecameNotSelected](self, "tsaxBecameNotSelected");
}

- (id)tsaxValueForKey:(id)a3
{
  objc_super v6;

  if (-[TSDRepAccessibility _tsaxShouldPreventAccessToCanvas](self, "_tsaxShouldPreventAccessToCanvas")
    && -[TSDRepAccessibility _tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:](self, "_tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:", a3))
  {
    return 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSDRepAccessibility;
  return -[TSDRepAccessibility tsaxValueForKey:](&v6, "tsaxValueForKey:", a3);
}

- (NSString)_tsaxSizeDescription
{
  TSDLayoutGeometryAccessibility *v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  double v5;

  v3 = -[TSDLayoutAccessibility tsaxInspectorGeometry](-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxInspectorGeometry");
  v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  -[TSDLayoutGeometryAccessibility tsaxSize](v3, "tsaxSize");
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.size.formatter %@ %@")), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:"), -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:", v5));
}

- (NSString)_tsaxOriginDescription
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t vars0;

  if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("App-specific subclasses must override"), v3, v4, v5, v6, v7, vars0))abort();
  }
  return 0;
}

- (NSString)_tsaxRotationDescription
{
  double v2;

  -[TSDLayoutGeometryAccessibility tsaxAngle](-[TSDLayoutAccessibility tsaxInspectorGeometry](-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxInspectorGeometry"), "tsaxAngle");
  if (v2 == 0.0)
    return 0;
  else
    return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("shape.angle %f")), *(_QWORD *)&v2);
}

- (id)_tsaxOriginDescriptionUsingPositionValuesFromInspector
{
  TSDLayoutGeometryAccessibility *v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  double v5;
  double v6;
  double v7;
  id v8;
  id v9;
  NSString *v10;
  NSString *v11;

  v3 = -[TSDLayoutAccessibility tsaxInspectorGeometry](-[TSDRepAccessibility tsaxLayout](self, "tsaxLayout"), "tsaxInspectorGeometry");
  v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  -[TSDLayoutGeometryAccessibility tsaxOrigin](v3, "tsaxOrigin");
  v6 = v5;
  v8 = -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:", v7);
  v9 = -[TSDInteractiveCanvasControllerAccessibility tsaxDescriptionOfPointValueConvertedToRulerUnit:](v4, "tsaxDescriptionOfPointValueConvertedToRulerUnit:", v6);
  v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.from.top.offset.formatter %@")), v8);
  v11 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.from.left.offset.formatter %@")), v9);
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.origin.formatter %@ %@")), v10, v11);
}

- (id)_tsaxOriginDescriptionRelativeToContainer:(CGRect)a3
{
  double y;
  double x;
  id v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  double v19;
  NSString *v21;
  NSString *v22;
  NSString *v23;
  NSString *v24;
  NSString *v25;
  CGFloat rect;
  double v27;
  CGFloat v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;

  y = a3.origin.y;
  x = a3.origin.x;
  v5 = -[TSDRepAccessibility tsaxFrameInUnscaledCanvas](self, "tsaxFrameInUnscaledCanvas");
  v7 = v6;
  rect = v6;
  v28 = v8;
  v10 = v9 - x;
  v12 = v11 - y;
  v29.origin.x = TSDRectWithSize(v5);
  v13 = v29.origin.x;
  v14 = v29.origin.y;
  width = v29.size.width;
  height = v29.size.height;
  MidX = CGRectGetMidX(v29);
  v30.origin.x = v10;
  v30.origin.y = v12;
  v30.size.width = v7;
  v30.size.height = v28;
  v27 = vabdd_f64(MidX, CGRectGetMidX(v30));
  v31.origin.x = v13;
  v31.origin.y = v14;
  v31.size.width = width;
  v31.size.height = height;
  MidY = CGRectGetMidY(v31);
  v32.origin.x = v10;
  v32.origin.y = v12;
  v32.size.width = rect;
  v32.size.height = v28;
  v19 = vabdd_f64(MidY, CGRectGetMidY(v32));
  if (v27 < 0.001 && v19 < 0.001)
    return TSAccessibilityLocalizedString((uint64_t)CFSTR("object.horizontally.and.vertically.centered"));
  if (v27 >= 0.001)
  {
    v22 = TSAccessibilityLocalizedString((uint64_t)CFSTR("object.from.left.offset.formatter %@"));
    v21 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v22, TSAccessibilityLocalizedPercent());
  }
  else
  {
    v21 = TSAccessibilityLocalizedString((uint64_t)CFSTR("object.horizontally.centered"));
  }
  v23 = v21;
  if (v19 >= 0.001)
  {
    v25 = TSAccessibilityLocalizedString((uint64_t)CFSTR("object.from.top.offset.formatter %@"));
    v24 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v25, TSAccessibilityLocalizedPercent());
  }
  else
  {
    v24 = TSAccessibilityLocalizedString((uint64_t)CFSTR("object.vertically.centered"));
  }
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.origin.formatter %@ %@")), v23, v24);
}

- (BOOL)_tsaxKeyCorrespondsToPropertyRequiringAccessToCanvas:(id)a3
{
  unint64_t v4;
  BOOL result;

  v4 = 0;
  do
  {
    result = objc_msgSend(a3, "isEqualToString:", *(&off_43B978 + v4));
    if (v4 > 3)
      break;
    ++v4;
  }
  while (!result);
  return result;
}

- (id)_tsaxRepContainerElementCache
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_5439F8);
}

- (void)_tsaxSetRepContainerElementCache:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_5439F8, a3);
}

+ (CGPoint)tsaxCurrentRepDragOffset
{
  double v2;
  double v3;
  CGPoint result;

  v2 = *(double *)&qword_543A00;
  v3 = *(double *)&qword_543A08;
  result.y = v3;
  result.x = v2;
  return result;
}

+ (void)tsaxSetCurrentRepDragOffset:(CGPoint)a3
{
  xmmword_543A00 = (__int128)a3;
}

- (TSDRepContainerAccessibilityElement)tsaxAccessibilityElement
{
  if (!-[TSDRepAccessibility _tsaxRepContainerElementCache](self, "_tsaxRepContainerElementCache")
    && -[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas"))
  {
    -[TSDRepAccessibility _tsaxSetRepContainerElementCache:](self, "_tsaxSetRepContainerElementCache:", -[TSDRepContainerAccessibilityElement initWithRep:]([TSDRepContainerAccessibilityElement alloc], "initWithRep:", self));
  }
  return (TSDRepContainerAccessibilityElement *)-[TSDRepAccessibility _tsaxRepContainerElementCache](self, "_tsaxRepContainerElementCache");
}

- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasViewController](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxCanvasViewController");
}

- (id)hitRep:(CGPoint)a3
{
  double y;
  double x;
  objc_super v7;

  y = a3.y;
  x = a3.x;
  if (!-[TSDRepAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    && (uint64_t)-[TSDRepAccessibility accessibilityElementCount](self, "accessibilityElementCount") <= 0
    && -[TSAccessibility needsAccessibilityElements](+[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance"), "needsAccessibilityElements"))
  {
    return 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)TSDRepAccessibility;
  return -[TSDRepAccessibility hitRep:](&v7, "hitRep:", x, y);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  UIAccessibilityTraits v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSDRepAccessibility;
  v3 = -[TSDRepAccessibility accessibilityTraits](&v7, "accessibilityTraits");
  v4 = -[TSDRepAccessibility tsaxIsSelected](self, "tsaxIsSelected");
  v5 = UIAccessibilityTraitSelected;
  if (!v4)
    v5 = 0;
  return v5 | v3;
}

- (id)accessibilityElements
{
  if (-[TSDRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  else
    return -[TSDRepAccessibility tsaxChildren](self, "tsaxChildren");
}

- (id)accessibilityContainer
{
  objc_super v4;

  -[TSDCanvasViewAccessibility tsaxEnsureChildrenAreLoaded](-[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView"), "tsaxEnsureChildrenAreLoaded");
  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  return -[TSDRepAccessibility accessibilityContainer](&v4, "accessibilityContainer");
}

- (id)accessibilityHint
{
  NSString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  NSString *v10;

  v3 = -[TSDRepAccessibility tsaxLayoutDescription](self, "tsaxLayoutDescription");
  if (-[TSDRepAccessibility _tsaxCanBeSelected](self, "_tsaxCanBeSelected"))
    v10 = TSAccessibilityLocalizedString((uint64_t)CFSTR("select.hint.iOS"));
  else
    v10 = 0;
  return __TSAccessibilityStringForVariables(1, v10, v4, v5, v6, v7, v8, v9, (uint64_t)v3);
}

- (CGPoint)accessibilityActivationPoint
{
  objc_class *v3;
  void *v4;
  void *v5;
  id v6;
  BOOL v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  TSAccessibility *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  double MidY;
  double v31;
  CGFloat MidX;
  double v33;
  double v34;
  double MinY;
  CGFloat v36;
  double v37;
  double v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat width;
  CGFloat height;
  double y;
  double x;
  objc_super v48;
  char v49;
  CGPoint result;
  CGRect v51;
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

  v49 = 0;
  v3 = (objc_class *)objc_opt_class(UIView);
  v4 = (void *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView"), 1, &v49);
  if (v49)
    abort();
  v5 = v4;
  v6 = objc_msgSend(v4, "window");
  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (v7)
    goto LABEL_13;
  v8 = v6;
  objc_msgSend(v5, "bounds");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[TSDRepAccessibility tsaxLayerFrameInScaledCanvas](self, "tsaxLayerFrameInScaledCanvas");
  v65.origin.x = v10;
  v65.origin.y = v12;
  v65.size.width = v14;
  v65.size.height = v16;
  v52 = CGRectIntersection(v51, v65);
  y = v52.origin.y;
  x = v52.origin.x;
  width = v52.size.width;
  height = v52.size.height;
  v17 = +[TSAccessibility sharedInstance](TSAccessibility, "sharedInstance");
  if (-[TSAccessibility isKeyboardVisible](v17, "isKeyboardVisible"))
  {
    -[TSAccessibility keyboardFrame](v17, "keyboardFrame");
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v25 = v24;
  }
  else
  {
    v19 = CGRectNull.origin.x;
    v21 = CGRectNull.origin.y;
    v23 = CGRectNull.size.width;
    v25 = CGRectNull.size.height;
  }
  v53.origin.y = y;
  v53.origin.x = x;
  v53.size.width = width;
  v53.size.height = height;
  if (CGRectIsNull(v53))
    goto LABEL_13;
  v54.origin.x = v19;
  v54.origin.y = v21;
  v54.size.width = v23;
  v54.size.height = v25;
  if (CGRectIsNull(v54))
    goto LABEL_13;
  objc_msgSend(v8, "convertRect:fromWindow:", 0, v19, v21, v23, v25);
  objc_msgSend(v5, "convertRect:fromView:", v8);
  v66.origin.x = v10;
  v66.origin.y = v12;
  v66.size.width = v14;
  v66.size.height = v16;
  v56 = CGRectIntersection(v55, v66);
  v26 = v56.origin.x;
  v27 = v56.origin.y;
  v28 = v56.size.width;
  v29 = v56.size.height;
  v56.origin.y = y;
  v56.origin.x = x;
  v56.size.width = width;
  v56.size.height = height;
  v67.origin.x = v26;
  v67.origin.y = v27;
  v67.size.width = v28;
  v67.size.height = v29;
  if (!CGRectIntersectsRect(v56, v67))
    goto LABEL_13;
  v57.origin.x = v26;
  v57.origin.y = v27;
  v57.size.width = v28;
  v57.size.height = v29;
  v68.origin.y = y;
  v68.origin.x = x;
  v68.size.width = width;
  v68.size.height = height;
  if (CGRectContainsRect(v57, v68))
  {
LABEL_13:
    v48.receiver = self;
    v48.super_class = (Class)TSDRepAccessibility;
    -[TSDRepAccessibility accessibilityActivationPoint](&v48, "accessibilityActivationPoint");
    MidX = v31;
  }
  else
  {
    v58.origin.x = x;
    v58.origin.y = y;
    v34 = height;
    v58.size.width = width;
    v58.size.height = height;
    MinY = CGRectGetMinY(v58);
    v59.origin.x = v26;
    v59.origin.y = v27;
    v59.size.width = v28;
    v59.size.height = v29;
    if (MinY >= CGRectGetMinY(v59))
    {
      v38 = width;
    }
    else
    {
      v60.origin.x = x;
      v60.origin.y = y;
      v60.size.width = width;
      v60.size.height = height;
      v43 = CGRectGetWidth(v60);
      v61.origin.x = v26;
      v61.origin.y = v27;
      v61.size.width = v28;
      v61.size.height = v29;
      v36 = CGRectGetMinY(v61);
      v62.size.height = height;
      v37 = v36;
      v62.origin.x = x;
      v62.origin.y = y;
      v62.size.width = width;
      v34 = v37 - CGRectGetMinY(v62);
      v38 = v43;
    }
    objc_msgSend(v5, "tsaxFrameFromBounds:", x, y, v38, v34, *(_QWORD *)&v43);
    v39 = v63.origin.x;
    v40 = v63.origin.y;
    v41 = v63.size.width;
    v42 = v63.size.height;
    MidX = CGRectGetMidX(v63);
    v64.origin.x = v39;
    v64.origin.y = v40;
    v64.size.width = v41;
    v64.size.height = v42;
    MidY = CGRectGetMidY(v64);
  }
  v33 = MidX;
  result.y = MidY;
  result.x = v33;
  return result;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;

  if (-[TSDRepAccessibility _tsaxCanBeSelected](self, "_tsaxCanBeSelected"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  return -[TSDRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (id)_accessibilityParentView
{
  id result;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSDRepAccessibility;
  result = -[TSDRepAccessibility _accessibilityParentView](&v4, "_accessibilityParentView");
  if (!result)
    return -[TSDRepAccessibility tsaxCanvasView](self, "tsaxCanvasView");
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  return 1;
}

- (id)_accessibilityTextOperations
{
  if (-[TSDRepAccessibility tsaxNeedsEditRotorMenu](self, "tsaxNeedsEditRotorMenu"))
    return objc_msgSend(+[TSAccessibilityEditMenuController sharedController](TSAccessibilityEditMenuController, "sharedController"), "editMenuTitlesForItemProvider:", -[TSDInteractiveCanvasControllerAccessibility tsaxEditMenuItemProvider](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxEditMenuItemProvider"));
  else
    return 0;
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  unsigned int v5;

  v5 = -[TSDRepAccessibility tsaxNeedsEditRotorMenu](self, "tsaxNeedsEditRotorMenu");
  if (v5)
    LOBYTE(v5) = objc_msgSend(+[TSAccessibilityEditMenuController sharedController](TSAccessibilityEditMenuController, "sharedController"), "performActionTitled:forEditMenuProvider:", a3, -[TSDInteractiveCanvasControllerAccessibility tsaxEditMenuItemProvider](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxEditMenuItemProvider"));
  return v5;
}

- (id)accessibilityCustomActions
{
  if (-[TSDRepAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return -[TSDInteractiveCanvasControllerAccessibility tsaxActionMenuItemsForRep:](-[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxActionMenuItemsForRep:", self);
  else
    return 0;
}

- (BOOL)tsaxIsReadyToLoadChildren
{
  _BOOL4 v3;

  v3 = +[NSThread isMainThread](NSThread, "isMainThread");
  if (v3)
    LOBYTE(v3) = -[TSDRepAccessibility tsaxCanvas](self, "tsaxCanvas") != 0;
  return v3;
}

- (void)tsaxLoadChildrenIntoCollection:(id)a3
{
  objc_class *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  char *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *k;
  void *v26;
  char *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *m;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[6];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _QWORD v45[6];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  char v50;
  _BYTE v51[128];
  _BYTE v52[128];
  _BYTE v53[128];
  _BYTE v54[128];

  if ((-[TSDRepAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) != 0)
    return;
  if (-[TSDRepAccessibility conformsToProtocol:](self, "conformsToProtocol:", NSProtocolFromString(CFSTR("TSDContainerRep"))))
  {
    v50 = 0;
    v5 = (objc_class *)objc_opt_class(NSArray);
    v6 = (void *)__TSAccessibilityCastAsClass(v5, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("childReps")), 1, &v50);
    if (v50)
      goto LABEL_48;
    v7 = v6;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v47;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(_QWORD *)v47 != v10)
            objc_enumerationMutation(v7);
          v12 = objc_msgSend(*(id *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i), "tsaxAccessibilityElement");
          if (v12)
          {
            v13 = v12;
            objc_msgSend(a3, "addObject:", v12);
            objc_msgSend(v13, "tsaxEnsureChildrenAreLoaded");
          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      }
      while (v9);
    }
    if ((objc_opt_respondsToSelector(self, "addAdditionalChildLayersToArray:") & 1) != 0)
    {
      v14 = objc_alloc_init((Class)NSMutableArray);
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_24D8E8;
      v45[3] = &unk_426E28;
      v45[4] = self;
      v45[5] = v14;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v45))
        goto LABEL_48;
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v16; j = (char *)j + 1)
          {
            if (*(_QWORD *)v42 != v17)
              objc_enumerationMutation(v14);
            v19 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)j);
            v20 = (char *)objc_msgSend(v19, "accessibilityElementCount");
            if ((objc_msgSend(v19, "isAccessibilityElement") & 1) != 0
              || (unint64_t)(v20 - 1) <= 0x7FFFFFFFFFFFFFFDLL)
            {
              objc_msgSend(a3, "addObject:", v19);
            }
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v16);
      }

    }
    if ((objc_opt_respondsToSelector(self, "addChildViewsToArray:") & 1) != 0)
    {
      v21 = objc_alloc_init((Class)NSMutableArray);
      v40[0] = _NSConcreteStackBlock;
      v40[1] = 3221225472;
      v40[2] = sub_24D8F4;
      v40[3] = &unk_426E28;
      v40[4] = self;
      v40[5] = v21;
      if (!__TSAccessibilityPerformSafeBlock((uint64_t)v40))
      {
        v38 = 0u;
        v39 = 0u;
        v36 = 0u;
        v37 = 0u;
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v37;
          do
          {
            for (k = 0; k != v23; k = (char *)k + 1)
            {
              if (*(_QWORD *)v37 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)k);
              v27 = (char *)objc_msgSend(v26, "accessibilityElementCount");
              if ((objc_msgSend(v26, "isAccessibilityElement") & 1) != 0
                || (unint64_t)(v27 - 1) < 0x7FFFFFFFFFFFFFFELL
                || objc_msgSend(objc_msgSend(v26, "_accessibilitySubviews"), "count"))
              {
                objc_msgSend(a3, "addObject:", v26);
              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v36, v52, 16);
          }
          while (v23);
        }

        goto LABEL_40;
      }
LABEL_48:
      abort();
    }
  }
LABEL_40:
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  v28 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v33;
    do
    {
      for (m = 0; m != v29; m = (char *)m + 1)
      {
        if (*(_QWORD *)v33 != v30)
          objc_enumerationMutation(a3);
        objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)m), "setAccessibilityContainer:", self);
      }
      v29 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v32, v51, 16);
    }
    while (v29);
  }
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_msgSend(a3, "setAccessibilityContainer:", 0);
}

- (void)tsaxDidInvalidateChildren
{
  TSAccessibilityPostLayoutChangedNotification(0);
}

- (BOOL)tsaxShouldSortChildrenUsingStandardAlgorithm
{
  return 1;
}

- (BOOL)tsaxSelect
{
  _BOOL4 v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  _QWORD v6[5];
  uint64_t v7;

  v7 = 0;
  v3 = -[TSDRepAccessibility _tsaxCanBeSelectedWithSelectableRepReference:](self, "_tsaxCanBeSelectedWithSelectableRepReference:", &v7);
  if (v3)
  {
    v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_24D9B8;
    v6[3] = &unk_426DD0;
    v6[4] = v4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
      abort();
    -[TSDInteractiveCanvasControllerAccessibility tsaxSelectRep:](v4, "tsaxSelectRep:", v7);
    TSAccessibilityPostLayoutChangedNotification(0);
  }
  return v3;
}

- (void)dealloc
{
  objc_super v3;

  -[TSDRepAccessibility tsaxAccessibilityUnregister](self, "tsaxAccessibilityUnregister");
  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility dealloc](&v3, "dealloc");
}

- (void)dynamicDragDidBegin
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility dynamicDragDidBegin](&v3, "dynamicDragDidBegin");
  objc_msgSend((id)objc_opt_class(self), "tsaxSetCurrentRepDragOffset:", CGPointZero.x, CGPointZero.y);
}

- (void)dynamicallyResizingWithTracker:(id)a3
{
  TSDRepAccessibility *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  id v10;
  uint64_t v11;
  const __CFString *v12;
  NSString *v13;
  uint64_t v14;
  NSString *v15;
  objc_super v16;

  v4 = self;
  v16.receiver = self;
  v16.super_class = (Class)TSDRepAccessibility;
  -[TSDRepAccessibility dynamicallyResizingWithTracker:](&v16, "dynamicallyResizingWithTracker:");
  objc_msgSend(a3, "tsaxCGRectValueForKey:", CFSTR("currentBoundsForStandardKnobs"));
  v6 = v5;
  v8 = v7;
  v9 = -[TSDInteractiveCanvasControllerAccessibility tsaxRulerUnitsInstance](-[TSDRepAccessibility tsaxInteractiveCanvasController](v4, "tsaxInteractiveCanvasController"), "tsaxRulerUnitsInstance");
  LODWORD(v4) = objc_msgSend(v9, "tsaxRulerUnits");
  v10 = objc_msgSend(objc_msgSend(v9, "tsaxLocalizedCompatibleRulerUnitsForCanvas"), "lowercaseString");
  objc_msgSend(v9, "tsaxConvertPointsToRulerUnits:", v6);
  if (v4 >= 2)
    v12 = CFSTR("%.0f %@");
  else
    v12 = CFSTR("%.2f %@");
  v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v11, v10);
  objc_msgSend(v9, "tsaxConvertPointsToRulerUnits:", v8);
  v15 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("object.resize.size.formatter %@ %@")), v13, +[NSString stringWithFormat:](NSString, "stringWithFormat:", v12, v14, v10));
  UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v15);
}

- (void)tsaxPerformExtraCleanupTasksPriorToRemovalFromCanvas
{
  void (*v3[5])(_QWORD);

  -[TSDRepAccessibility setAccessibilityContainer:](self, "setAccessibilityContainer:", 0);
  -[TSDRepAccessibility tsaxInvalidateChildrenImmediately](-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), "tsaxInvalidateChildrenImmediately");
  v3[0] = (void (*)(_QWORD))_NSConcreteStackBlock;
  v3[1] = (void (*)(_QWORD))3221225472;
  v3[2] = (void (*)(_QWORD))sub_24DC08;
  v3[3] = (void (*)(_QWORD))&unk_426DD0;
  v3[4] = (void (*)(_QWORD))self;
  TSAccessibilityPerformBlockOnMainThread(v3);
}

- (id)_tsaxPrimaryEditingController
{
  TSDInteractiveCanvasControllerAccessibility *v2;
  id v3;
  Protocol *v4;
  id v5;

  v2 = -[TSDRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  v3 = objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](v2, "tsaxValueForKey:", CFSTR("editorController")), "tsaxValueForKey:", CFSTR("textInputEditor"));
  v4 = NSProtocolFromString(CFSTR("TSDCanvasEditor"));
  if ((objc_msgSend(v3, "conformsToProtocol:", v4) & 1) == 0)
  {
    v5 = -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasEditor](v2, "tsaxCanvasEditor");
    if (objc_msgSend(v5, "conformsToProtocol:", v4))
      return v5;
    else
      return 0;
  }
  return v3;
}

- (BOOL)_tsaxCanBeSelectedWithSelectableRepReference:(id *)a3
{
  TSDRepAccessibility *v4;
  TSDRepAccessibility *v5;
  TSDRepAccessibility *v6;

  v4 = -[TSDRepAccessibility tsaxRepForSelecting](self, "tsaxRepForSelecting");
  v5 = v4;
  if (v4)
    LODWORD(v4) = !-[TSDRepAccessibility tsaxIsSelected](v4, "tsaxIsSelected");
  if (a3)
  {
    if ((_DWORD)v4)
      v6 = v5;
    else
      v6 = 0;
    *a3 = v6;
  }
  return (char)v4;
}

- (BOOL)_tsaxCanBeSelected
{
  return -[TSDRepAccessibility _tsaxCanBeSelectedWithSelectableRepReference:](self, "_tsaxCanBeSelectedWithSelectableRepReference:", 0);
}

@end
