@implementation CRLTextEditorAccessibility

- (BOOL)crlaxShouldSuppressSpeechForNextSelectionChangedNotification
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414C3A);
}

- (void)crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414C3A, a3);
}

- (void)crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  void *v10;
  unsigned int v11;
  id v12;
  _QWORD v13[7];
  _QWORD v14[9];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v8 = -[CRLTextEditorAccessibility crlaxSelectedTextRange](self, "crlaxSelectedTextRange");
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL
    && location != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)v8 <= location
    && (unint64_t)v8 + v9 >= location + length)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxStorage](self, "crlaxStorage"));
    v11 = objc_msgSend(v10, "crlaxBoolValueForKey:", CFSTR("hasSmartFields"));

    if (v11)
    {
      v21 = 0;
      v22 = &v21;
      v23 = 0x3010000000;
      v25 = 0;
      v26 = 0;
      v24 = &unk_1010E66AB;
      v15 = 0;
      v16 = &v15;
      v17 = 0x3032000000;
      v18 = sub_1000520C4;
      v19 = sub_1000520D4;
      v20 = 0;
      v14[0] = _NSConcreteStackBlock;
      v14[1] = 3221225472;
      v14[2] = sub_1000520DC;
      v14[3] = &unk_10122F8B8;
      v14[4] = self;
      v14[5] = &v15;
      v14[7] = location;
      v14[8] = length;
      v14[6] = &v21;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v14))
        abort();
      v12 = (id)v16[5];
      _Block_object_dispose(&v15, 8);

      if (v12)
        location = v22[4];

      _Block_object_dispose(&v21, 8);
    }
  }
  if (v4)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100052140;
    v13[3] = &unk_10122EDB8;
    v13[4] = self;
    v13[5] = location;
    v13[6] = length;
    -[CRLTextEditorAccessibility crlaxPerformBlockAffectingTextSelection:](self, "crlaxPerformBlockAffectingTextSelection:", v13);
  }
  else
  {
    -[CRLTextEditorAccessibility crlaxSetSelectedTextRange:](self, "crlaxSetSelectedTextRange:", location, length);
  }
}

- (void)crlaxInsertText:(id)a3
{
  id v3;
  _QWORD v4[5];
  id v5;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1000521D0;
  v4[3] = &unk_10122D3D8;
  v4[4] = self;
  v3 = a3;
  v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();

}

- (void)cut:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRLTextEditorAccessibility *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10005226C;
  v5[3] = &unk_10122D3D8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[CRLTextEditorAccessibility crlaxHandleTextOperationAction:usingBlock:](self, "crlaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionCut"), v5);

}

- (void)copy:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRLTextEditorAccessibility *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100052334;
  v5[3] = &unk_10122D3D8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[CRLTextEditorAccessibility crlaxHandleTextOperationAction:usingBlock:](self, "crlaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionCopy"), v5);

}

- (void)paste:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  CRLTextEditorAccessibility *v7;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000523FC;
  v5[3] = &unk_10122D3D8;
  v6 = a3;
  v7 = self;
  v4 = v6;
  -[CRLTextEditorAccessibility crlaxHandleTextOperationAction:usingBlock:](self, "crlaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionPaste"), v5);

}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications v3;
  NSString *UIKitLocalizedString;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility selectAll:](&v6, "selectAll:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = CRLAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionSelectAll"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(UIKitLocalizedString);
  UIAccessibilityPostNotification(v3, v5);

}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v5, "crlaxCancelCollaborationOccurredTimer");

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility insertText:](&v6, "insertText:", v4);

  -[CRLTextEditorAccessibility crlaxEditingRepContentsChanged](self, "crlaxEditingRepContentsChanged");
}

- (void)deleteBackward:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v5, "crlaxCancelCollaborationOccurredTimer");

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility deleteBackward:](&v6, "deleteBackward:", v4);

  -[CRLTextEditorAccessibility crlaxEditingRepContentsChanged](self, "crlaxEditingRepContentsChanged");
}

- (void)deleteForward:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v5, "crlaxCancelCollaborationOccurredTimer");

  v6.receiver = self;
  v6.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility deleteForward:](&v6, "deleteForward:", v4);

  -[CRLTextEditorAccessibility crlaxEditingRepContentsChanged](self, "crlaxEditingRepContentsChanged");
}

- (void)replaceAction:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility replaceAction:](&v3, "replaceAction:", a3);
}

- (void)didBecomeTextInputRespondersEditor
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility didBecomeTextInputRespondersEditor](&v2, "didBecomeTextInputRespondersEditor");
  UIAccessibilityPostNotification(CRLAccessibilityFirstResponderChangedNotification, 0);
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textSource"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));

  return v4;
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  -[CRLTextEditorAccessibility crlaxSetSelectedTextRange:skipSelectionChangedNotification:](self, "crlaxSetSelectedTextRange:skipSelectionChangedNotification:", a3.location, a3.length, 0);
}

- (void)crlaxHandleEditingRepContentsChanged
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100052730;
  block[3] = &unk_10122D110;
  block[4] = self;
  CRLAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
}

- (void)crlaxHandleSelectionChangedWithFlags:(unint64_t)a3
{
  void *v4;
  const __CFString *v5;
  void *v6;

  if (-[CRLTextEditorAccessibility crlaxShouldSuppressSpeechForNextSelectionChangedNotification](self, "crlaxShouldSuppressSpeechForNextSelectionChangedNotification", a3))
  {
    v5 = CFSTR("AXSelectionChangedRemoteUserOperation");
    v6 = &__kCFBooleanTrue;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v6, &v5, 1));
    -[CRLTextEditorAccessibility crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:](self, "crlaxSetShouldSuppressSpeechForNextSelectionChangedNotification:", 0);
  }
  else
  {
    v4 = 0;
  }
  UIAccessibilityPostNotification(CRLAccessibilitySelectionChangedNotification, v4);

}

- (void)crlaxHandleStorageRangeChanged
{
  -[CRLTextEditorAccessibility crlaxHandleEditingRepContentsChanged](self, "crlaxHandleEditingRepContentsChanged");
}

- (BOOL)_crlaxIsDictating
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "textInputMode"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "primaryLanguage"));

  LOBYTE(v2) = objc_msgSend(v4, "isEqualToString:", CFSTR("dictation"));
  return (char)v2;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLWPEditor");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (BOOL)_crlaxShouldSkipSelectionChangedNotification
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1014151C0);
}

- (void)_crlaxSetShouldSkipSelectionChangedNotification:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_1014151C0, a3);
}

+ (BOOL)crlaxCommittingRemoteCommand
{
  return byte_1014151C1;
}

+ (void)crlaxSetCommittingRemoteCommand:(BOOL)a3
{
  byte_1014151C1 = a3;
}

- (CRLWPSelectionAccessibility)crlaxSelection
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selection"));

  objc_opt_class(CRLWPSelectionAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLWPSelectionAccessibility *)v8;
}

- (_NSRange)crlaxSelectedTextRange
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxSelection](self, "crlaxSelection"));
  v3 = objc_msgSend(v2, "crlaxRange");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)crlaxSetSelectedTextRange:(_NSRange)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility _crlaxSelectionWithRange:](self, "_crlaxSelectionWithRange:", a3.location, a3.length));
  -[CRLTextEditorAccessibility setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("selection"));

}

- (CRLTextRepAccessibility)crlaxEditingRepWithCaret
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingReps"));

  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v21;
LABEL_3:
    v8 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v7)
        objc_enumerationMutation(v4);
      v9 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v8);
      if ((objc_msgSend(v9, "isShowingCaret") & 1) != 0)
        break;
      if (v6 == (id)++v8)
      {
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v6)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v10 = v9;

    if (v10)
      goto LABEL_12;
  }
  else
  {
LABEL_9:

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxEditingRepWithSelection](self, "crlaxEditingRepWithSelection"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));

LABEL_12:
  v19 = 0;
  v12 = v10;
  objc_opt_class(CRLTextRepAccessibility, v13);
  v15 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v12, 1, &v19);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (v19)
    abort();
  v17 = (void *)v16;

  return (CRLTextRepAccessibility *)v17;
}

- (id)crlaxEditingRepWithSelection
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  char v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v18 = -[CRLTextEditorAccessibility crlaxInsertionPoint](self, "crlaxInsertionPoint");
  if (v18 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editingReps"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v21;
LABEL_5:
    v10 = 0;
    while (1)
    {
      v11 = v8;
      if (*(_QWORD *)v21 != v9)
        objc_enumerationMutation(v5);
      v12 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
      v19 = 0;
      v13 = v12;
      objc_opt_class(CRLTextRepAccessibility, v14);
      v16 = __CRLAccessibilityCastAsSafeCategory(v15, (uint64_t)v13, 1, &v19);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (v19)
        abort();
      v8 = (void *)v17;

      if (v8)
      {
        if (objc_msgSend(v8, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxRepRangeContainsLocation:", &OBJC_PROTOCOL___CRLTextRepAccessibilityExtras)&& (objc_msgSend(v8, "crlaxRepRangeContainsLocation:", v18) & 1) != 0)
        {
          break;
        }
      }
      if (v7 == (id)++v10)
      {
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        if (v7)
          goto LABEL_5;
        break;
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (CRLWPStorageAccessibility)crlaxStorage
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));

  objc_opt_class(CRLWPStorageAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLWPStorageAccessibility *)v8;
}

- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "icc"));

  objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLTextInteractiveCanvasControllerAccessibility *)v8;
}

- (NSString)crlaxEditorLabel
{
  return 0;
}

- (unint64_t)crlaxInsertionPoint
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "selection"));

  if (objc_msgSend(v3, "isValid"))
    v4 = (unint64_t)objc_msgSend(v3, "start");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (void)crlaxEditingRepContentsChanged
{
  if (-[CRLTextEditorAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxHandleEditingRepContentsChanged", &OBJC_PROTOCOL___CRLTextEditorAccessibilityExtras))-[CRLTextEditorAccessibility crlaxHandleEditingRepContentsChanged](self, "crlaxHandleEditingRepContentsChanged");
}

- (void)crlaxPerformBlockAffectingTextSelection:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[CRLTextEditorAccessibility _crlaxShouldSkipSelectionChangedNotification](self, "_crlaxShouldSkipSelectionChangedNotification"))
  {
    v4[2]();
  }
  else
  {
    -[CRLTextEditorAccessibility _crlaxSetShouldSkipSelectionChangedNotification:](self, "_crlaxSetShouldSkipSelectionChangedNotification:", 1);
    v4[2]();
    -[CRLTextEditorAccessibility _crlaxSetShouldSkipSelectionChangedNotification:](self, "_crlaxSetShouldSkipSelectionChangedNotification:", 0);
  }

}

- (BOOL)crlaxCurrentSelectionContainsVisibleTrackedChanges
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxStorage](self, "crlaxStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxSelection](self, "crlaxSelection"));
  v5 = objc_msgSend(v3, "crlaxSelectionContainsVisibleTrackedChanges:", v4);

  return v5;
}

- (_NSRange)crlaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = &unk_1010E66AB;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1002285A8;
  v7[3] = &unk_10122DC18;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7))
    abort();
  v3 = v9[4];
  v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  v5 = v3;
  v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)replace:(id)a3 with:(id)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility replace:with:](&v5, "replace:with:", a3, a4);
  -[CRLTextEditorAccessibility crlaxEditingRepContentsChanged](self, "crlaxEditingRepContentsChanged");
}

- (void)selectionDidChangeFromSelection:(id)a3 toSelection:(id)a4 withFlags:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  CRLRepAccessibilitySelectionRangeCache *v11;
  id v12;
  uint64_t v13;
  CRLRepAccessibilitySelectionRangeCache *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility selectionDidChangeFromSelection:toSelection:withFlags:](&v16, "selectionDidChangeFromSelection:toSelection:withFlags:", a3, a4);
  if (!-[CRLTextEditorAccessibility _crlaxShouldSkipSelectionChangedNotification](self, "_crlaxShouldSkipSelectionChangedNotification"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxEditingRepWithCaret](self, "crlaxEditingRepWithCaret"));
    v8 = v7;
    if (v7)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxStorage"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxStorage](self, "crlaxStorage"));

      if (v9 == v10)
      {
        v11 = [CRLRepAccessibilitySelectionRangeCache alloc];
        v12 = -[CRLTextEditorAccessibility crlaxSelectedTextRange](self, "crlaxSelectedTextRange");
        v14 = -[CRLRepAccessibilitySelectionRangeCache initWithRep:selectedRangeInStorage:](v11, "initWithRep:selectedRangeInStorage:", v8, v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextEditorAccessibility crlaxEditingRepWithCaret](self, "crlaxEditingRepWithCaret"));
        objc_msgSend(v15, "crlaxSetLastSelection:", v14);

      }
    }
    if (-[CRLTextEditorAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxHandleSelectionChangedWithFlags:", &OBJC_PROTOCOL___CRLTextEditorAccessibilityExtras))-[CRLTextEditorAccessibility crlaxHandleSelectionChangedWithFlags:](self, "crlaxHandleSelectionChangedWithFlags:", a5);

  }
}

- (void)p_deleteBackwardsOnEmptyListWithRange:(_NSRange)a3 ignoreLevel:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CRLTextEditorAccessibility;
  -[CRLTextEditorAccessibility p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:](&v4, "p_deleteBackwardsOnEmptyListWithRange:ignoreLevel:", a3.location, a3.length, a4);
}

- (Class)_crlaxWPSelectionClass
{
  id v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2050000000;
  v8 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10022882C;
  v4[3] = &unk_10122C5F0;
  v4[4] = self;
  v4[5] = &v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = (id)v6[3];
  _Block_object_dispose(&v5, 8);
  return (Class)v2;
}

- (id)_crlaxSelectionWithRange:(_NSRange)a3
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v11[6];
  _NSRange v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = sub_100228974;
  v17 = sub_100228984;
  v18 = 0;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10022898C;
  v11[3] = &unk_1012348A0;
  v11[4] = self;
  v11[5] = &v13;
  v12 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v11))
    abort();
  v3 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  LOBYTE(v13) = 0;
  v4 = v3;
  objc_opt_class(CRLWPSelectionAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v13);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if ((_BYTE)v13)
    abort();
  v9 = (void *)v8;

  return v9;
}

- (BOOL)crlaxCurrentSelectionContainsComment
{
  return self->_crlaxCurrentSelectionContainsComment;
}

@end
