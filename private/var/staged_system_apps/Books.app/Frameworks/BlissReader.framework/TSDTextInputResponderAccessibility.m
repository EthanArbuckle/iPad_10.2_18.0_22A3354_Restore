@implementation TSDTextInputResponderAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSDTextInputResponder");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications v3;
  NSString *UIKitLocalizedString;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSDTextInputResponderAccessibility;
  -[TSDTextInputResponderAccessibility selectAll:](&v5, "selectAll:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionSelectAll"));
  UIAccessibilityPostNotification(v3, UIKitLocalizedString);
}

- (void)forwardInvocation:(id)a3
{
  id v5;
  id v6;
  char *v7;
  __CFString **v8;
  __CFString *v9;
  objc_super v10;
  _QWORD v11[6];

  v5 = -[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editor"));
  if (!v5)
    goto LABEL_11;
  v6 = v5;
  v7 = (char *)objc_msgSend(a3, "selector");
  if ((objc_opt_respondsToSelector(v6, v7) & 1) == 0)
    goto LABEL_11;
  if (v7 == "copy:")
  {
    v8 = &TSAccessibilityTextOperationActionCopy;
  }
  else if (v7 == "cut:")
  {
    v8 = &TSAccessibilityTextOperationActionCut;
  }
  else
  {
    if (v7 != "paste:")
      goto LABEL_11;
    v8 = &TSAccessibilityTextOperationActionPaste;
  }
  v9 = *v8;
  if (*v8)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_237D90;
    v11[3] = &unk_426E28;
    v11[4] = a3;
    v11[5] = self;
    -[TSDTextInputResponderAccessibility tsaxHandleTextOperationAction:usingBlock:](self, "tsaxHandleTextOperationAction:usingBlock:", v9, v11);
    return;
  }
LABEL_11:
  v10.receiver = self;
  v10.super_class = (Class)TSDTextInputResponderAccessibility;
  -[TSDTextInputResponderAccessibility forwardInvocation:](&v10, "forwardInvocation:", a3);
}

- (id)tsaxFocusedElement
{
  void *v3;
  Class v4;
  _BYTE *v5;
  _BYTE *v6;
  objc_class *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  Class v16;
  Class v17;
  _BYTE *v18;
  unint64_t v19;
  void *v21;
  Class v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  char v28;
  _BYTE v29[128];

  v3 = (void *)objc_opt_class(TSWPSelectionAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editor")), "tsaxValueForKey:", CFSTR("selection")), 0, 0);
  if (!v4 || (v5 = -[objc_class tsaxRange](v4, "tsaxRange"), v5 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL))
  {
LABEL_19:
    v28 = 0;
    v21 = (void *)objc_opt_class(TSDInteractiveCanvasControllerAccessibility);
    v22 = __TSAccessibilityCastAsSafeCategory(v21, (uint64_t)-[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("p_ICC")), 1, &v28);
    if (!v28)
    {
      v17 = (Class)objc_msgSend(-[objc_class tsaxFocusedRep](v22, "tsaxFocusedRep"), "tsaxFocusedElement");
      if (!v17)
        return -[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editingTextRep"));
      return v17;
    }
LABEL_23:
    abort();
  }
  v6 = v5;
  v28 = 0;
  v7 = (objc_class *)objc_opt_class(NSSet);
  v8 = (void *)__TSAccessibilityCastAsClass(v7, (uint64_t)-[TSDTextInputResponderAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editingTextReps")), 1, &v28);
  if (v28)
    goto LABEL_23;
  v9 = v8;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (!v10)
    goto LABEL_19;
  v11 = v10;
  v12 = *(_QWORD *)v25;
LABEL_6:
  v13 = 0;
  while (1)
  {
    if (*(_QWORD *)v25 != v12)
      objc_enumerationMutation(v9);
    v14 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v13);
    v28 = 0;
    v15 = (void *)objc_opt_class(TSWPRepAccessibility);
    v16 = __TSAccessibilityCastAsSafeCategory(v15, v14, 1, &v28);
    if (v28)
      goto LABEL_23;
    v17 = v16;
    v18 = -[objc_class tsaxStorageRangeOfRep](v16, "tsaxStorageRangeOfRep");
    if (v6 >= v18 && v6 - v18 < v19)
      break;
    if (v11 == (id)++v13)
    {
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (!v11)
        goto LABEL_19;
      goto LABEL_6;
    }
  }
  if (!v17)
    goto LABEL_19;
  return v17;
}

@end
