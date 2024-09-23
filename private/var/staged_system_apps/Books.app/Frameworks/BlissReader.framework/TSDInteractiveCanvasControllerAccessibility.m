@implementation TSDInteractiveCanvasControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDInteractiveCanvasController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxIsTearingDown
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543851);
}

- (void)_tsaxSetIsTearingDown:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543851, a3);
}

- (id)tsaxDelegate
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
}

- (BOOL)tsaxCurrentlyWaitingOnThreadedLayoutAndRender
{
  return -[TSDInteractiveCanvasControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("currentlyWaitingOnThreadedLayoutAndRender"));
}

- (BOOL)tsaxShapeRepsAreIgnored
{
  return 0;
}

- (TSDCanvasViewAccessibility)tsaxCanvasView
{
  void *v3;
  TSDCanvasViewAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDCanvasViewAccessibility);
  result = (TSDCanvasViewAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasView")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDCanvasAccessibility)tsaxCanvas
{
  void *v3;
  TSDCanvasAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDCanvasAccessibility);
  result = (TSDCanvasAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvas")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSDEditorControllerAccessibility)tsaxEditorController
{
  void *v3;
  TSDEditorControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDEditorControllerAccessibility);
  result = (TSDEditorControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editorController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxCanvasEditor
{
  id v2;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v10;

  v2 = -[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("canvasEditor"));
  if ((objc_msgSend(v2, "conformsToProtocol:", NSProtocolFromString(CFSTR("TSDCanvasEditor"))) & 1) == 0)
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Object doesn't conform to TSDCanvasEditor protocol!"), v4, v5, v6, v7, v8, v10))abort();
    }
    return 0;
  }
  return v2;
}

- (TSDKeyboardMovementManipulatorAccessibility)tsaxKeyboardMovementManipulator
{
  id v2;
  void *v3;
  TSDKeyboardMovementManipulatorAccessibility *result;
  char v5;

  v2 = objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasEditor](self, "tsaxCanvasEditor"), "tsaxValueForKey:", CFSTR("canvasEditorHelper"));
  v5 = 0;
  v3 = (void *)objc_opt_class(TSDKeyboardMovementManipulatorAccessibility);
  result = (TSDKeyboardMovementManipulatorAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(v2, "tsaxValueForKey:", CFSTR("keyboardMovementManipulator")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (NSArray)tsaxTopLevelRepsForHitTesting
{
  if (-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "tsaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    return 0;
  }
  else
  {
    return (NSArray *)-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("topLevelRepsForHitTesting"));
  }
}

- (NSSet)tsaxSelectedReps
{
  return (NSSet *)-[TSDInteractiveCanvasControllerAccessibility _tsaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:](self, "_tsaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:", -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasEditor](self, "tsaxCanvasEditor"), 0);
}

- (TSDRepAccessibility)tsaxFirstSelectedRep
{
  return (TSDRepAccessibility *)-[TSDInteractiveCanvasControllerAccessibility _tsaxFirstSelectedRepInCanvasEditor:preferExplicitlyFocusedReps:](self, "_tsaxFirstSelectedRepInCanvasEditor:preferExplicitlyFocusedReps:", -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasEditor](self, "tsaxCanvasEditor"), 0);
}

- (id)tsaxCanvasSelection
{
  return objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasEditor](self, "tsaxCanvasEditor"), "tsaxValueForKey:", CFSTR("canvasSelection"));
}

- (id)_tsaxSelectedRepsInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *i;
  uint64_t v11;
  id v12;
  char *v13;
  void *v14;
  Class v15;
  Class v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  void *v22;
  Class v23;
  _BOOL4 v25;
  id obj;
  uint64_t v27;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  _BYTE v39[128];

  v4 = a4;
  v37 = 0;
  v5 = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, objc_msgSend(objc_msgSend(a3, "tsaxValueForKey:", CFSTR("canvasSelection")), "tsaxValueForKey:", CFSTR("infos")), 1, &v37);
  if (v37)
LABEL_32:
    abort();
  v6 = v5;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    obj = v6;
    v27 = *(_QWORD *)v34;
    v25 = v4;
    while (1)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v34 != v27)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
        if (!v4)
          goto LABEL_23;
        v12 = -[TSDInteractiveCanvasControllerAccessibility tsaxRepsForInfo:](self, "tsaxRepsForInfo:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i));
        v13 = (char *)objc_msgSend(v12, "count");
        if (!v13)
          goto LABEL_23;
        if (v13 != (_BYTE *)&dword_0 + 1)
        {
          v31 = 0u;
          v32 = 0u;
          v29 = 0u;
          v30 = 0u;
          v17 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
          if (v17)
          {
            v18 = v17;
            v19 = *(_QWORD *)v30;
            do
            {
              for (j = 0; j != v18; j = (char *)j + 1)
              {
                if (*(_QWORD *)v30 != v19)
                  objc_enumerationMutation(v12);
                v21 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
                v37 = 0;
                v22 = (void *)objc_opt_class(TSDRepAccessibility);
                v23 = __TSAccessibilityCastAsSafeCategory(v22, v21, 1, &v37);
                if (v37)
                  goto LABEL_32;
                v16 = v23;
                if ((-[objc_class tsaxWasExplicitlyFocused](v23, "tsaxWasExplicitlyFocused") & 1) != 0)
                  goto LABEL_12;
              }
              v18 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
              v4 = v25;
            }
            while (v18);
          }
LABEL_23:
          v16 = -[TSDInteractiveCanvasControllerAccessibility tsaxRepForInfo:](self, "tsaxRepForInfo:", v11);
          if (!v16)
            continue;
          goto LABEL_24;
        }
        v37 = 0;
        v14 = (void *)objc_opt_class(TSDRepAccessibility);
        v15 = __TSAccessibilityCastAsSafeCategory(v14, (uint64_t)objc_msgSend(v12, "anyObject"), 1, &v37);
        if (v37)
          goto LABEL_32;
        v16 = v15;
LABEL_12:
        v4 = v25;
        if (!v16)
          goto LABEL_23;
LABEL_24:
        if (!v9)
          v9 = +[NSMutableSet set](NSMutableSet, "set");
        objc_msgSend(v9, "addObject:", v16);
      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (!v8)
        return v9;
    }
  }
  return 0;
}

- (id)_tsaxFirstSelectedRepInCanvasEditor:(id)a3 preferExplicitlyFocusedReps:(BOOL)a4
{
  id v4;
  id result;

  v4 = -[TSDInteractiveCanvasControllerAccessibility _tsaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:](self, "_tsaxSelectedRepsInCanvasEditor:preferExplicitlyFocusedReps:", a3, a4);
  result = objc_msgSend(v4, "count");
  if (result)
    return objc_msgSend(objc_msgSend(objc_msgSend(v4, "allObjects"), "sortedArrayUsingComparator:", &stru_43B9A0), "firstObject");
  return result;
}

- (TSDRepAccessibility)tsaxFocusedRep
{
  TSDRepAccessibility *v2;
  _QWORD v4[5];
  TSDInteractiveCanvasControllerAccessibility *v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22D888;
  v11 = sub_22D898;
  v12 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22D8A4;
  v4[3] = &unk_43B9C8;
  v5 = self;
  v6 = &v7;
  v4[4] = NSProtocolFromString(CFSTR("TSDCanvasEditor"));
  -[NSArray enumerateObjectsWithOptions:usingBlock:](-[TSDEditorControllerAccessibility tsaxCurrentEditors](-[TSDInteractiveCanvasControllerAccessibility tsaxEditorController](v5, "tsaxEditorController"), "tsaxCurrentEditors"), "enumerateObjectsWithOptions:usingBlock:", 2, v4);
  v2 = (TSDRepAccessibility *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v2;
}

- (BOOL)tsaxInPrintPreviewMode
{
  id v2;

  v2 = -[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("delegate"));
  if ((objc_opt_respondsToSelector(v2, "inPrintPreviewMode") & 1) != 0)
    return objc_msgSend(v2, "inPrintPreviewMode");
  else
    return 0;
}

- (CGPoint)tsaxConvertBoundsToUnscaledPoint:(CGPoint)a3
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
  v7[2] = sub_22DA6C;
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

- (CGRect)tsaxConvertBoundsToUnscaledRect:(CGRect)a3
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
  v11[2] = sub_22DB84;
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

- (CGPoint)tsaxConvertUnscaledToBoundsPoint:(CGPoint)a3
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
  v7[2] = sub_22DC88;
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

- (CGRect)tsaxConvertUnscaledToBoundsRect:(CGRect)a3
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
  v11[2] = sub_22DDA0;
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

- (id)tsaxRepForInfo:(id)a3
{
  id result;
  uint64_t v6;
  void *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  if (-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "tsaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    return 0;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_22D888;
  v13 = sub_22D898;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_22DEE0;
  v8[3] = &unk_427D68;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v7 = (void *)objc_opt_class(TSDRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v7, v6, 1, &v9);
  if ((_BYTE)v9)
    abort();
  return result;
}

- (id)tsaxRepsForInfo:(id)a3
{
  id result;
  uint64_t v6;
  objc_class *v7;
  _QWORD v8[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;

  if (-[TSDInteractiveCanvasControllerAccessibility tsaxCurrentlyWaitingOnThreadedLayoutAndRender](self, "tsaxCurrentlyWaitingOnThreadedLayoutAndRender"))
  {
    return 0;
  }
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = sub_22D888;
  v13 = sub_22D898;
  v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_22E018;
  v8[3] = &unk_427D68;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
    abort();
  v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v7 = (objc_class *)objc_opt_class(NSSet);
  result = (id)__TSAccessibilityCastAsClass(v7, v6, 1, &v9);
  if ((_BYTE)v9)
    abort();
  return result;
}

- (id)tsaxRepForLayout:(id)a3
{
  uint64_t v3;
  void *v4;
  id result;
  _QWORD v6[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_22D888;
  v11 = sub_22D898;
  v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22E138;
  v6[3] = &unk_427D68;
  v6[5] = a3;
  v6[6] = &v7;
  v6[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v3 = v8[5];
  _Block_object_dispose(&v7, 8);
  LOBYTE(v7) = 0;
  v4 = (void *)objc_opt_class(TSDRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v4, v3, 1, &v7);
  if ((_BYTE)v7)
    abort();
  return result;
}

- (id)tsaxHitTestWithUnscaledPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  Class v7;
  Class v8;
  int ShouldPerformValidationChecks;
  void *v10;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v26;
  void *v27;

  y = a3.y;
  x = a3.x;
  v27 = 0;
  HIBYTE(v26) = 0;
  v6 = (void *)objc_opt_class(TSDKnobAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility hitKnobAtPoint:returningRep:](self, "hitKnobAtPoint:returningRep:", &v27, x, y), 1, (_BYTE *)&v26 + 7);
  if (HIBYTE(v26))
    goto LABEL_18;
  v8 = v7;
  if (v7)
  {
    ShouldPerformValidationChecks = TSAccessibilityShouldPerformValidationChecks();
    v10 = v27;
    if (ShouldPerformValidationChecks && !v27)
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if ((__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("A knob was hit, but no rep returned!"), v12, v13, v14, v15, v16, v26) & 1) != 0)goto LABEL_18;
      v10 = v27;
    }
    v17 = objc_msgSend(v10, "tsaxKnobElementForTag:", -[objc_class tsaxKnobTag](v8, "tsaxKnobTag"));
    if (!TSAccessibilityShouldPerformValidationChecks()
      || v17
      || (v18 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
          !__TSAccessibilityHandleValidationErrorWithDescription(v18, 0, (uint64_t)CFSTR("Knob element not found!"), v19, v20, v21, v22, v23, v26)))
    {
      if (-[TSDInteractiveCanvasControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxKnobElementIsAccessibilityElement:", &OBJC_PROTOCOL___TSDInteractiveCanvasControllerAccessibilityExtras)&& -[TSDInteractiveCanvasControllerAccessibility tsaxKnobElementIsAccessibilityElement:](self, "tsaxKnobElementIsAccessibilityElement:", v17)&& v17)
      {
        return v17;
      }
      goto LABEL_13;
    }
LABEL_18:
    abort();
  }
LABEL_13:
  if ((objc_opt_respondsToSelector(self, "hitRep:allowsAllReps:") & 1) != 0)
    return -[TSDInteractiveCanvasControllerAccessibility hitRep:allowsAllReps:](self, "hitRep:allowsAllReps:", 1, x, y);
  else
    return -[TSDInteractiveCanvasControllerAccessibility hitRep:](self, "hitRep:", x, y);
}

- (void)tsaxSelectRep:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_22E330;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)tsaxSelectReps:(id)a3
{
  void *v5;
  id v6;
  id v7;
  Class v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  Class v13;
  id v14;
  _QWORD v15[6];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = (void *)objc_opt_new(NSMutableSet, a2);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(a3);
        v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_opt_class(TSDRepAccessibility);
        v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 0, 0);
        if (-[objc_class tsaxIsSelectable](v13, "tsaxIsSelectable"))
        {
          v14 = -[objc_class tsaxInfo](v13, "tsaxInfo");
          if (v14)
          {
            objc_msgSend(v5, "addObject:", v14);
            if (!v8)
              v8 = v13;
          }
        }
      }
      v7 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
  }
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_22E4FC;
  v15[3] = &unk_426E28;
  v15[4] = self;
  v15[5] = v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v15))
    abort();

  -[TSDInteractiveCanvasControllerAccessibility tsaxDidFocusRep:](self, "tsaxDidFocusRep:", v8);
}

- (void)tsaxDidFocusRep:(id)a3
{
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  Class v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v5 = objc_msgSend(a3, "tsaxInfo");
  if (v5)
  {
    v6 = -[TSDInteractiveCanvasControllerAccessibility tsaxRepsForInfo:](self, "tsaxRepsForInfo:", v5);
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
          v14 = 0;
          v12 = (void *)objc_opt_class(TSDRepAccessibility);
          v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 1, &v14);
          if (v14)
            abort();
          -[objc_class tsaxSetWasExplicitlyFocused:](v13, "tsaxSetWasExplicitlyFocused:", -[objc_class isEqual:](v13, "isEqual:", a3));
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }
  }
}

- (void)tsaxScrollToPrimarySelection
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_22E6C0;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (BOOL)tsaxIsTearingDown
{
  return -[TSDInteractiveCanvasControllerAccessibility _tsaxIsTearingDown](self, "_tsaxIsTearingDown");
}

+ (double)tsaxSmallRepOutsetForHitTesting
{
  double v2;
  _QWORD v4[6];
  uint64_t v5;
  double *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = (double *)&v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22E780;
  v4[3] = &unk_42BF18;
  v4[4] = a1;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (id)tsaxLocalizedRulerUnitsForCanvas
{
  return objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxRulerUnitsInstance](self, "tsaxRulerUnitsInstance"), "tsaxLocalizedCompatibleRulerUnitsForCanvas");
}

- (CGRect)tsaxConvertUnscaledRectToRulerUnits:(CGRect)a3
{
  double height;
  double width;
  double y;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  -[TSDInteractiveCanvasControllerAccessibility _tsaxConvertPointToRulerValue:](self, "_tsaxConvertPointToRulerValue:", a3.origin.x);
  v8 = v7;
  -[TSDInteractiveCanvasControllerAccessibility _tsaxConvertPointToRulerValue:](self, "_tsaxConvertPointToRulerValue:", y);
  v10 = v9;
  -[TSDInteractiveCanvasControllerAccessibility _tsaxConvertPointToRulerValue:](self, "_tsaxConvertPointToRulerValue:", width);
  v12 = v11;
  -[TSDInteractiveCanvasControllerAccessibility _tsaxConvertPointToRulerValue:](self, "_tsaxConvertPointToRulerValue:", height);
  v14 = v13;
  v15 = v8;
  v16 = v10;
  v17 = v12;
  result.size.height = v14;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (id)tsaxDescriptionOfPointValueConvertedToRulerUnit:(double)a3
{
  id v5;
  id v6;

  v5 = -[TSDInteractiveCanvasControllerAccessibility tsaxRulerUnitsInstance](self, "tsaxRulerUnitsInstance");
  -[TSDInteractiveCanvasControllerAccessibility _tsaxConvertPointToRulerValue:](self, "_tsaxConvertPointToRulerValue:", a3);
  v6 = TSAccessibilityLocalizedNumber((uint64_t)+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", TSAccessibilityLocalizedString((uint64_t)CFSTR("ruler.formatter.general %@ %@")), v6, objc_msgSend(v5, "tsaxLocalizedCompatibleRulerUnitsForCanvas"));
}

- (id)tsaxRulerUnitsInstance
{
  id v2;
  void *v3;
  id result;
  char v5;

  v2 = -[objc_class tsaxValueForKey:](NSClassFromString(CFSTR("TSKRulerUnits")), "tsaxValueForKey:", CFSTR("instance"));
  v5 = 0;
  v3 = (void *)objc_opt_class(TSKRulerUnitsAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v2, 1, &v5);
  if (v5)
    abort();
  return result;
}

- (double)_tsaxConvertPointToRulerValue:(double)a3
{
  double v4;
  _QWORD v6[7];
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;

  v7 = 0;
  v8 = (double *)&v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22EA08;
  v6[3] = &unk_428E60;
  v6[4] = -[TSDInteractiveCanvasControllerAccessibility tsaxRulerUnitsInstance](self, "tsaxRulerUnitsInstance");
  v6[5] = &v7;
  *(double *)&v6[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return round(v4 * 10.0) / 10.0;
}

- (void)teardown
{
  objc_super v3;

  -[TSDInteractiveCanvasControllerAccessibility _tsaxSetIsTearingDown:](self, "_tsaxSetIsTearingDown:", 1);
  v3.receiver = self;
  v3.super_class = (Class)TSDInteractiveCanvasControllerAccessibility;
  -[TSDInteractiveCanvasControllerAccessibility teardown](&v3, "teardown");
  -[TSDInteractiveCanvasControllerAccessibility _tsaxSetIsTearingDown:](self, "_tsaxSetIsTearingDown:", 0);
}

- (TSDiOSCanvasViewControllerAccessibility)tsaxCanvasViewController
{
  void *v3;
  TSDiOSCanvasViewControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSDiOSCanvasViewControllerAccessibility);
  result = (TSDiOSCanvasViewControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("layerHost")), "tsaxValueForKey:", CFSTR("asiOSCVC")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_tsaxElementForMovingToSelection
{
  void *v3;
  Class v4;
  id result;
  char v6;

  v6 = 0;
  v3 = (void *)objc_opt_class(TSDTextInputResponderAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("textInputResponder")), 1, &v6);
  if (v6)
    abort();
  result = -[objc_class tsaxFocusedElement](v4, "tsaxFocusedElement");
  if (!result)
    return -[TSDRepAccessibility tsaxFocusedElement](-[TSDInteractiveCanvasControllerAccessibility tsaxFocusedRep](self, "tsaxFocusedRep"), "tsaxFocusedElement");
  return result;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  id v9;

  y = a3.y;
  x = a3.x;
  -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](self, "tsaxConvertBoundsToUnscaledPoint:");
  v8 = -[TSDInteractiveCanvasControllerAccessibility tsaxHitTestWithUnscaledPoint:](self, "tsaxHitTestWithUnscaledPoint:");
  if ((objc_msgSend(v8, "isAccessibilityElement") & 1) == 0)
  {
    v9 = objc_msgSend(v8, "_accessibilityHitTest:withEvent:", a4, x, y);
    if (objc_msgSend(v9, "isAccessibilityElement"))
      return v9;
    else
      return 0;
  }
  return v8;
}

- (TSAccessibilityEditMenuControllerItemProvider)tsaxEditMenuItemProvider
{
  TSAccessibilityEditMenuControllerItemProvider *result;

  result = (TSAccessibilityEditMenuControllerItemProvider *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___TSAccessibilityEditMenuControllerItemProvider, -[TSDEditorControllerAccessibility tsaxTextInputEditor](-[TSDInteractiveCanvasControllerAccessibility tsaxEditorController](self, "tsaxEditorController"), "tsaxTextInputEditor"), 0, 0);
  if (!result)
    return (TSAccessibilityEditMenuControllerItemProvider *)__TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___TSAccessibilityEditMenuControllerItemProvider, -[TSDInteractiveCanvasControllerAccessibility tsaxCanvasViewController](self, "tsaxCanvasViewController"), 0, 0);
  return result;
}

- (id)tsaxActionMenuItemsForRep:(id)a3
{
  id v5;

  v5 = +[NSMutableArray array](NSMutableArray, "array");
  -[TSDInteractiveCanvasControllerAccessibility _tsaxAddSelectionActionsToArray:forRep:](self, "_tsaxAddSelectionActionsToArray:forRep:", v5, a3);
  return v5;
}

- (void)_tsaxAddSelectionActionsToArray:(id)a3 forRep:(id)a4
{
  id v7;
  id v8;
  _QWORD v9[6];
  _QWORD v10[5];

  if ((objc_msgSend(a4, "tsaxIsSelected") & 1) == 0)
  {
    v7 = -[TSDInteractiveCanvasControllerAccessibility _tsaxElementForMovingToSelection](self, "_tsaxElementForMovingToSelection");
    if (v7)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_24BD60;
      v10[3] = &unk_42A8D0;
      v10[4] = v7;
      +[TSAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](TSAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", a3, TSAccessibilityLocalizedString((uint64_t)CFSTR("move.to.selected.element.action.title")), v10);
    }
    v8 = objc_msgSend(a4, "tsaxRepForSelecting");
    if (v8)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_24BD7C;
      v9[3] = &unk_43C2D8;
      v9[4] = v8;
      v9[5] = a4;
      +[TSAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](TSAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", a3, TSAccessibilityLocalizedString((uint64_t)CFSTR("select.action.title")), v9);
    }
  }
}

- (BOOL)tsaxKnobElementIsAccessibilityElement:(id)a3
{
  return objc_msgSend(a3, "isAccessibilityElement");
}

@end
