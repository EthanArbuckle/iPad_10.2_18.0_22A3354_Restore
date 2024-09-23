@implementation TSWPSmartFieldAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPSmartField");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (TSWPInteractiveCanvasControllerAccessibility)_tsaxParentInteractiveCanvasController
{
  return (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543896);
}

- (void)_tsaxSetParentInteractiveCanvasController:(id)a3
{
  __TSAccessibilitySetAssociatedNonRetainedObject(self, &unk_543896, a3);
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPSmartFieldAccessibility tsaxSetParentInteractiveCanvasController:](self, "tsaxSetParentInteractiveCanvasController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPSmartFieldAccessibility;
  -[TSWPSmartFieldAccessibility dealloc](&v3, "dealloc");
}

- (_NSRange)tsaxFieldRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPSmartFieldAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)tsaxSetParentInteractiveCanvasController:(id)a3
{
  TSWPInteractiveCanvasControllerAccessibility *v5;
  void *v6;
  Class v7;
  Class v8;
  char v9;

  v5 = -[TSWPSmartFieldAccessibility _tsaxParentInteractiveCanvasController](self, "_tsaxParentInteractiveCanvasController");
  v9 = 0;
  v6 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  v7 = __TSAccessibilityCastAsSafeCategory(v6, (uint64_t)a3, 1, &v9);
  if (v9)
    abort();
  v8 = v7;
  if (v5 != (TSWPInteractiveCanvasControllerAccessibility *)v7)
  {
    -[TSWPInteractiveCanvasControllerAccessibility tsaxUnregisterLinkedTextElement:](v5, "tsaxUnregisterLinkedTextElement:", self);
    -[TSWPSmartFieldAccessibility _tsaxSetParentInteractiveCanvasController:](self, "_tsaxSetParentInteractiveCanvasController:", v8);
    -[objc_class tsaxRegisterLinkedTextElement:](v8, "tsaxRegisterLinkedTextElement:", self);
  }
}

- (TSWPRepAccessibility)tsaxParentTextRep
{
  TSWPInteractiveCanvasControllerAccessibility *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  Class v11;
  Class v12;
  _BYTE *v13;
  TSWPRepAccessibility *v14;
  _BYTE *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  uint64_t v21;
  void *v22;
  Class v23;
  _BYTE *v24;
  unint64_t v25;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  char v32;
  _BYTE v33[128];

  v3 = -[TSWPSmartFieldAccessibility tsaxParentInteractiveCanvasController](self, "tsaxParentInteractiveCanvasController");
  if (TSAccessibilityShouldPerformValidationChecks() && !v3)
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment."), v5, v6, v7, v8, v9, v28))LABEL_26:abort();
    return 0;
  }
  if (!v3)
    return 0;
  v32 = 0;
  v10 = (void *)objc_opt_class(TSWPStorageAccessibility);
  v11 = __TSAccessibilityCastAsSafeCategory(v10, (uint64_t)-[TSWPSmartFieldAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("parentStorage")), 1, &v32);
  if (v32)
    goto LABEL_26;
  v12 = v11;
  v13 = -[TSWPSmartFieldAccessibility tsaxFieldRange](self, "tsaxFieldRange");
  v14 = 0;
  if (v12)
  {
    v15 = v13;
    if (v13 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = -[TSWPInteractiveCanvasControllerAccessibility tsaxTextRepsForStorage:](v3, "tsaxTextRepsForStorage:", v12);
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v18; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v19)
              objc_enumerationMutation(v16);
            v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
            v32 = 0;
            v22 = (void *)objc_opt_class(TSWPRepAccessibility);
            v23 = __TSAccessibilityCastAsSafeCategory(v22, v21, 1, &v32);
            if (v32)
              goto LABEL_26;
            v14 = (TSWPRepAccessibility *)v23;
            if (v23)
            {
              v24 = -[objc_class tsaxStorageRangeOfRep](v23, "tsaxStorageRangeOfRep");
              if (v15 >= v24 && v15 - v24 < v25)
                return v14;
            }
          }
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v18);
        return v14;
      }
      return 0;
    }
  }
  return v14;
}

@end
