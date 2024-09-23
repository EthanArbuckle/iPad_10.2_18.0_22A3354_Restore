@implementation CRLWPSmartFieldAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPSmartField");
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
  objc_opt_class(CRLWPSmartFieldAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLTextInteractiveCanvasControllerAccessibility)_crlaxParentInteractiveCanvasController
{
  return (CRLTextInteractiveCanvasControllerAccessibility *)__CRLAccessibilityGetAssociatedWeakObject(self, &unk_101415940);
}

- (void)_crlaxSetParentInteractiveCanvasController:(id)a3
{
  __CRLAccessibilitySetAssociatedWeakObject(self, &unk_101415940, (uint64_t)a3);
}

- (void)dealloc
{
  objc_super v3;

  -[CRLWPSmartFieldAccessibility crlaxSetParentInteractiveCanvasController:](self, "crlaxSetParentInteractiveCanvasController:", 0);
  v3.receiver = self;
  v3.super_class = (Class)CRLWPSmartFieldAccessibility;
  -[CRLWPSmartFieldAccessibility dealloc](&v3, "dealloc");
}

- (_NSRange)crlaxFieldRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)crlaxSetParentInteractiveCanvasController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v12;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility _crlaxParentInteractiveCanvasController](self, "_crlaxParentInteractiveCanvasController"));
  v12 = 0;
  v6 = v4;
  objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v7);
  v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v12);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v12)
    abort();
  v11 = (void *)v10;

  if (v5 != v11)
  {
    objc_msgSend(v5, "crlaxUnregisterLinkedTextElement:", self);
    -[CRLWPSmartFieldAccessibility _crlaxSetParentInteractiveCanvasController:](self, "_crlaxSetParentInteractiveCanvasController:", v11);
    objc_msgSend(v11, "crlaxRegisterLinkedTextElement:", self);
  }

}

- (CRLTextRepAccessibility)crlaxParentTextRep
{
  void *v3;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _BYTE *v17;
  void *v18;
  _BYTE *v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  _BYTE *v32;
  unint64_t v33;
  uint64_t v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  _BYTE v43[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility crlaxParentInteractiveCanvasController](self, "crlaxParentInteractiveCanvasController"));
  if (CRLAccessibilityShouldPerformValidationChecks() && !v3)
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Can't find interactive canvas controller even though we're asked for the parent text rep of an attachment."), v5, v6, v7, v8, v9, v36))LABEL_29:abort();
    goto LABEL_24;
  }
  if (!v3)
  {
LABEL_24:
    v18 = 0;
    goto LABEL_28;
  }
  v42 = 0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPSmartFieldAccessibility crlaxTarget](self, "crlaxTarget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "parentStorage"));

  objc_opt_class(CRLWPStorageAccessibility, v12);
  v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v11, 1, &v42);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v42)
    goto LABEL_29;
  v16 = (void *)v15;

  v17 = -[CRLWPSmartFieldAccessibility crlaxFieldRange](self, "crlaxFieldRange");
  v18 = 0;
  if (v16)
  {
    v19 = v17;
    if (v17 != (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
    {
      v37 = v16;
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTextRepsForStorage:", v16));
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
      if (v21)
      {
        v22 = v21;
        v18 = 0;
        v23 = *(_QWORD *)v39;
        do
        {
          v24 = 0;
          v25 = v18;
          do
          {
            if (*(_QWORD *)v39 != v23)
              objc_enumerationMutation(v20);
            v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)v24);
            v42 = 0;
            v27 = v26;
            objc_opt_class(CRLTextRepAccessibility, v28);
            v30 = __CRLAccessibilityCastAsSafeCategory(v29, (uint64_t)v27, 1, &v42);
            v31 = objc_claimAutoreleasedReturnValue(v30);
            if (v42)
              goto LABEL_29;
            v18 = (void *)v31;

            if (v18)
            {
              v32 = objc_msgSend(v18, "crlaxStorageRangeOfRep");
              if (v19 >= v32 && v19 - v32 < v33)
                goto LABEL_26;
            }
            v24 = (char *)v24 + 1;
            v25 = v18;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
        }
        while (v22);
      }
      else
      {
        v18 = 0;
      }
LABEL_26:

      v16 = v37;
    }
  }

LABEL_28:
  return (CRLTextRepAccessibility *)v18;
}

@end
