@implementation CRLCanvasEditorHelperAccessibility

- (void)enterQuickSelectMode:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  -[CRLCanvasEditorHelperAccessibility enterQuickSelectMode:](&v7, "enterQuickSelectMode:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Entered Quick Select mode. Double tap an object to add to selection."), 0, 0));
  CRLAccessibilityPostAnnouncementNotification(v4, v6);

}

- (void)crlaxSpeakEditOperationCompletedAnnouncement:(id)a3
{
  CRLAccessibilityPostHighPriorityAnnouncementNotification(0, a3);
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLCanvasEditorHelper");
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
  objc_opt_class(CRLCanvasEditorHelperAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (BOOL)_crlaxIsPerformingCut
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1014157B0);
}

- (void)_crlaxSetIsPerformingCut:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_1014157B0, a3);
}

- (id)crlaxCanvasEditor
{
  return -[CRLCanvasEditorHelperAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("canvasEditor"));
}

- (CRLSubselectionAccessibility)crlaxCanvasSelection
{
  void *v2;
  Protocol *v3;
  void *v4;
  unsigned int v5;
  void *v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility crlaxCanvasEditor](self, "crlaxCanvasEditor"));
  v3 = NSProtocolFromString(CFSTR("CRLCanvasEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v2, "conformsToProtocol:", v4);

  if (v5)
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "crlaxValueForKey:", CFSTR("canvasSelection")));
  else
    v6 = 0;

  return (CRLSubselectionAccessibility *)v6;
}

- (void)delete:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility crlaxCanvasSelection](self, "crlaxCanvasSelection"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxUnlockedInfos"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility _crlaxDescriptionOfInfos:](self, "_crlaxDescriptionOfInfos:", v6));

  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  -[CRLCanvasEditorHelperAccessibility delete:](&v11, "delete:", v4);

  if (-[CRLCanvasEditorHelperAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxSpeakEditOperationCompletedAnnouncement:", &OBJC_PROTOCOL___CRLCanvasEditorHelperAccessibilityExtras))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Deleted %1$@"), 0, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v7));

    -[CRLCanvasEditorHelperAccessibility crlaxSpeakEditOperationCompletedAnnouncement:](self, "crlaxSpeakEditOperationCompletedAnnouncement:", v10);
  }

}

- (void)p_setLockStatusOfSelectedDrawables:(BOOL)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)CRLCanvasEditorHelperAccessibility;
  -[CRLCanvasEditorHelperAccessibility p_setLockStatusOfSelectedDrawables:](&v15, "p_setLockStatusOfSelectedDrawables:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility _crlaxInteractiveCanvasController](self, "_crlaxInteractiveCanvasController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxSelectedReps"));

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "crlaxClearKnobAccessibilityElementCache", (_QWORD)v11);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (id)_crlaxInteractiveCanvasController
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasEditorHelperAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "interactiveCanvasController"));

  objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (id)_crlaxDescriptionOfInfos:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v30;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v30 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v9);
        v28 = 0;
        v11 = v10;
        objc_opt_class(CRLBoardItemAccessibility, v12);
        v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v11, 1, &v28);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (v28)
          abort();
        v16 = (void *)v15;

        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxTypeDescription"));
        objc_msgSend(v4, "crlaxAddObjectIfNotNil:", v17);

        v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v7);
  }

  v25 = __CRLAccessibilityStringForArraysAndVariables(v4, v18, v19, v20, v21, v22, v23, v24, (uint64_t)CFSTR("__CRLAccessibilityStringForArraysAndVariablesSentinel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(v25);

  return v26;
}

@end
