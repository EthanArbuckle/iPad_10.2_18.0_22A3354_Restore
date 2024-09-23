@implementation TSWPEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPEditingController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSAccessibilitySafeCategory, a2);
}

- (BOOL)_tsaxShouldSkipSelectionChangedNotification
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543888);
}

- (void)_tsaxSetShouldSkipSelectionChangedNotification:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543888, a3);
}

- (TSWPSelectionAccessibility)tsaxSelection
{
  void *v3;
  TSWPSelectionAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPSelectionAccessibility);
  result = (TSWPSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("selection")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (_NSRange)tsaxSelectedTextRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPSelectionAccessibility tsaxRange](-[TSWPEditingControllerAccessibility tsaxSelection](self, "tsaxSelection"), "tsaxRange");
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (void)tsaxSetSelectedTextRange:(_NSRange)a3
{
  void *v4;
  _QWORD v5[5];
  _NSRange v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  uint64_t v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3052000000;
  v10 = sub_23858C;
  v11 = sub_23859C;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2385A8;
  v5[3] = &unk_43BCD8;
  v5[4] = &v7;
  v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  -[TSWPEditingControllerAccessibility setValue:forKey:](self, "setValue:forKey:", v4, CFSTR("selection"));

}

- (TSWPRepAccessibility)tsaxEditingRepWithCaret
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  void *v12;
  Class v13;
  TSWPRepAccessibility *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  _BYTE v21[128];

  v3 = -[TSWPEditingControllerAccessibility tsaxUnsignedIntegerValueForKey:](self, "tsaxUnsignedIntegerValueForKey:", CFSTR("insertionPoint"));
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = v3;
  v20 = 0;
  v5 = __TSAccessibilityCastAsProtocol((Protocol *)&OBJC_PROTOCOL___NSFastEnumeration, -[TSWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("editingReps")), 1, &v20);
  if (v20)
LABEL_17:
    abort();
  v6 = v5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  if (!v7)
    return 0;
  v8 = v7;
  v9 = *(_QWORD *)v17;
  do
  {
    for (i = 0; i != v8; i = (char *)i + 1)
    {
      if (*(_QWORD *)v17 != v9)
        objc_enumerationMutation(v6);
      v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
      v20 = 0;
      v12 = (void *)objc_opt_class(TSWPRepAccessibility);
      v13 = __TSAccessibilityCastAsSafeCategory(v12, v11, 1, &v20);
      if (v20)
        goto LABEL_17;
      v14 = (TSWPRepAccessibility *)v13;
      if (v13
        && -[objc_class tsaxRespondsToSelector:fromExtrasProtocol:](v13, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxRepRangeContainsLocation:", &OBJC_PROTOCOL___TSWPRepAccessibilityExtras)&& -[TSWPRepAccessibility tsaxRepRangeContainsLocation:](v14, "tsaxRepRangeContainsLocation:", v4))
      {
        return v14;
      }
    }
    v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v21, 16);
  }
  while (v8);
  return v14;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  void *v3;
  TSWPStorageAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPStorageAccessibility);
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("storage")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSWPInteractiveCanvasControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  result = (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("interactiveCanvasController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)tsaxHintForTextRep:(id)a3
{
  void *v4;
  Class v5;

  if ((objc_msgSend(a3, "tsaxShouldIgnoreParentShape") & 1) != 0)
    return 0;
  v4 = (void *)objc_opt_class(TSDShapeRepAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)objc_msgSend(a3, "tsaxParentRep"), 0, 0);
  if ((-[objc_class tsaxIsIgnored](v5, "tsaxIsIgnored") & 1) != 0)
    return 0;
  else
    return -[objc_class tsaxShapeLabel](v5, "tsaxShapeLabel");
}

- (void)tsaxEditingRepContentsChanged
{
  if (-[TSWPEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxHandleEditingRepContentsChanged", &OBJC_PROTOCOL___TSWPEditingControllerAccessibilityExtras))-[TSWPEditingControllerAccessibility tsaxHandleEditingRepContentsChanged](self, "tsaxHandleEditingRepContentsChanged");
}

- (void)tsaxPerformBlockAffectingTextSelection:(id)a3
{
  if (-[TSWPEditingControllerAccessibility _tsaxShouldSkipSelectionChangedNotification](self, "_tsaxShouldSkipSelectionChangedNotification"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[TSWPEditingControllerAccessibility _tsaxSetShouldSkipSelectionChangedNotification:](self, "_tsaxSetShouldSkipSelectionChangedNotification:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSWPEditingControllerAccessibility _tsaxSetShouldSkipSelectionChangedNotification:](self, "_tsaxSetShouldSkipSelectionChangedNotification:", 0);
  }
}

- (void)tsaxInsertText:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2389D4;
  v3[3] = &unk_426E28;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3))
    abort();
}

- (void)tsaxReplaceRange:(_NSRange)a3 withText:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  NSUInteger v9;
  NSUInteger v10;
  int ShouldCrashOnValidationErrorAfterLaunch;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[8];
  NSRange v19;
  NSRange v20;
  NSRange v21;
  NSRange v22;

  length = a3.length;
  location = a3.location;
  v8 = -[TSWPStorageAccessibility tsaxRange](-[TSWPEditingControllerAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxRange");
  v10 = v9;
  v19.location = location;
  v19.length = length;
  v22.location = (NSUInteger)v8;
  v22.length = v10;
  if (NSIntersectionRange(v19, v22).length)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_238AD4;
    v18[3] = &unk_42BEC8;
    v18[6] = location;
    v18[7] = length;
    v18[4] = self;
    v18[5] = a4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v18))
      goto LABEL_3;
  }
  else if (TSAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    v20.location = location;
    v20.length = length;
    v12 = NSStringFromRange(v20);
    v21.location = (NSUInteger)v8;
    v21.length = v10;
    NSStringFromRange(v21);
    if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Out of bounds range: %@, storage range: %@"), v13, v14, v15, v16, v17, (uint64_t)v12))LABEL_3:abort();
  }
}

- (_NSRange)tsaxStorageRangeOfLineFragmentAtCharIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  _QWORD v7[7];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  _NSRange result;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3010000000;
  v12 = 0;
  v13 = 0;
  v11 = "";
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_238BA4;
  v7[3] = &unk_428E60;
  v7[4] = self;
  v7[5] = &v8;
  v7[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7))
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

- (void)selectionChangedWithFlags:(unint64_t)a3 wpFlags:(unint64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility selectionChangedWithFlags:wpFlags:](&v5, "selectionChangedWithFlags:wpFlags:", a3, a4);
  if (!-[TSWPEditingControllerAccessibility _tsaxShouldSkipSelectionChangedNotification](self, "_tsaxShouldSkipSelectionChangedNotification"))
  {
    if (-[TSWPEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxHandleSelectionChanged", &OBJC_PROTOCOL___TSWPEditingControllerAccessibilityExtras))-[TSWPEditingControllerAccessibility tsaxHandleSelectionChanged](self, "tsaxHandleSelectionChanged");
  }
}

- (void)tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v11[7];
  _QWORD v12[9];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a4;
  length = a3.length;
  location = a3.location;
  v8 = -[TSWPEditingControllerAccessibility tsaxSelectedTextRange](self, "tsaxSelectedTextRange");
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL
    && location != 0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)v8 <= location
    && (unint64_t)v8 + v9 >= location + length
    && -[TSWPStorageAccessibility tsaxBoolValueForKey:](-[TSWPEditingControllerAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxBoolValueForKey:", CFSTR("hasSmartFields")))
  {
    v19 = 0;
    v20 = &v19;
    v21 = 0x3010000000;
    v23 = 0;
    v24 = 0;
    v22 = "";
    v13 = 0;
    v14 = &v13;
    v15 = 0x3052000000;
    v16 = sub_23920C;
    v17 = sub_23921C;
    v18 = 0;
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_239228;
    v12[3] = &unk_43BD00;
    v12[4] = self;
    v12[5] = &v13;
    v12[7] = location;
    v12[8] = length;
    v12[6] = &v19;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v12))
      abort();
    v10 = v14[5];
    _Block_object_dispose(&v13, 8);
    if (v10)
      location = v20[4];
    _Block_object_dispose(&v19, 8);
  }
  if (v4)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_23926C;
    v11[3] = &unk_43BBD0;
    v11[4] = self;
    v11[5] = location;
    v11[6] = length;
    -[TSWPEditingControllerAccessibility tsaxPerformBlockAffectingTextSelection:](self, "tsaxPerformBlockAffectingTextSelection:", v11);
  }
  else
  {
    -[TSWPEditingControllerAccessibility tsaxSetSelectedTextRange:](self, "tsaxSetSelectedTextRange:", location, length);
  }
}

- (id)tsaxListItemLabelForLineAtCurrentSelection
{
  NSDictionary *v2;
  id v3;
  id v4;
  _QWORD v6[8];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  uint64_t v16;
  const __CFString *v17;
  CFBooleanRef v18;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3052000000;
  v14 = sub_23920C;
  v15 = sub_23921C;
  v16 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_239434;
  v6[3] = &unk_43BD28;
  v6[4] = self;
  v6[5] = &v11;
  v6[6] = &v7;
  v6[7] = -[TSWPEditingControllerAccessibility tsaxSelectedTextRange](self, "tsaxSelectedTextRange");
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();
  if (objc_msgSend((id)v12[5], "length"))
  {
    if (*((_BYTE *)v8 + 24))
    {
      v17 = CFSTR("UIAccessibilityTokenLiteralText");
      v18 = kCFBooleanTrue;
      v2 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v3 = objc_alloc((Class)NSAttributedString);
      v4 = objc_msgSend(v3, "initWithString:attributes:", v12[5], v2);
    }
    else
    {
      v4 = (id)v12[5];
    }
  }
  else
  {
    v4 = 0;
  }
  _Block_object_dispose(&v7, 8);
  _Block_object_dispose(&v11, 8);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TSWPEditingControllerAccessibility tsaxAccessibilityUnregister](self, "tsaxAccessibilityUnregister");
  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "removeObserver:name:object:", self, UIMenuControllerDidHideMenuNotification, 0);
  v3.receiver = self;
  v3.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility dealloc](&v3, "dealloc");
}

- (void)assignIntProperty:(int)a3 value:(int)a4 toSelection:(id)a5 forParagraph:(BOOL)a6
{
  const __CFString *v9;
  NSString *v10;
  const __CFString *v11;
  NSString *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableString *v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility assignIntProperty:value:toSelection:forParagraph:](&v20, "assignIntProperty:value:toSelection:forParagraph:", *(_QWORD *)&a3, *(_QWORD *)&a4, a5, a6);
  switch(a3)
  {
    case 19:
      v9 = CFSTR("bold");
      goto LABEL_7;
    case 22:
      v9 = CFSTR("underline");
      goto LABEL_7;
    case 20:
      v9 = CFSTR("italic");
LABEL_7:
      v10 = TSAccessibilityLocalizedString((uint64_t)v9);
      goto LABEL_9;
  }
  v10 = 0;
LABEL_9:
  if (-[NSString length](v10, "length"))
  {
    if (a4 == 1)
      v11 = CFSTR("font.attribute.on");
    else
      v11 = CFSTR("font.attribute.off");
    v12 = TSAccessibilityLocalizedString((uint64_t)v11);
    v19 = __TSAccessibilityStringForVariables(1, v10, v13, v14, v15, v16, v17, v18, (uint64_t)v12);
    TSAccessibilityPostAnnouncementNotification((uint64_t)self, (uint64_t)v19);
  }
}

- (void)cut:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_239620;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSWPEditingControllerAccessibility tsaxHandleTextOperationAction:usingBlock:](self, "tsaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionCut"), v3);
}

- (void)copy:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2396B8;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSWPEditingControllerAccessibility tsaxHandleTextOperationAction:usingBlock:](self, "tsaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionCopy"), v3);
}

- (void)paste:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_239750;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSWPEditingControllerAccessibility tsaxHandleTextOperationAction:usingBlock:](self, "tsaxHandleTextOperationAction:usingBlock:", CFSTR("AXTextOperationActionPaste"), v3);
}

- (void)selectAll:(id)a3
{
  UIAccessibilityNotifications v3;
  NSString *UIKitLocalizedString;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility selectAll:](&v5, "selectAll:", a3);
  v3 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString((uint64_t)CFSTR("AXTextOperationActionSelectAll"));
  UIAccessibilityPostNotification(v3, UIKitLocalizedString);
}

- (void)insertText:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility insertText:](&v4, "insertText:", a3);
  -[TSWPEditingControllerAccessibility tsaxEditingRepContentsChanged](self, "tsaxEditingRepContentsChanged");
}

- (void)p_addSelectedTextItemsIntoMenu:(id)a3
{
  uint64_t ShouldPreventActualLookup;
  objc_super v6;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    ShouldPreventActualLookup = TSUIReferenceLibraryViewControllerAccessibilityShouldPreventActualLookup();
    TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(1);
  }
  else
  {
    ShouldPreventActualLookup = 0;
  }
  v6.receiver = self;
  v6.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility p_addSelectedTextItemsIntoMenu:](&v6, "p_addSelectedTextItemsIntoMenu:", a3);
  if (UIAccessibilityIsVoiceOverRunning())
    TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(ShouldPreventActualLookup);
}

- (void)definitionAction:(id)a3
{
  TSWPStorageAccessibility *v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t ShouldPreventActualLookup;
  UIAccessibilityNotifications v10;
  NSString *v11;
  objc_super v12;

  if (UIAccessibilityIsVoiceOverRunning()
    && (v5 = -[TSWPEditingControllerAccessibility tsaxStorage](self, "tsaxStorage"),
        (objc_opt_respondsToSelector(v5, "substringWithRange:") & 1) != 0)
    && (v6 = -[TSWPEditingControllerAccessibility tsaxSelectedTextRange](self, "tsaxSelectedTextRange"),
        v8 = -[TSWPStorageAccessibility substringWithRange:](v5, "substringWithRange:", v6, v7),
        ShouldPreventActualLookup = TSUIReferenceLibraryViewControllerAccessibilityShouldPreventActualLookup(),
        TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(0),
        LOBYTE(v8) = +[UIReferenceLibraryViewController dictionaryHasDefinitionForTerm:](UIReferenceLibraryViewController, "dictionaryHasDefinitionForTerm:", v8), TSUIReferenceLibraryViewControllerAccessibilitySetShouldPreventActualLookup(ShouldPreventActualLookup), (v8 & 1) == 0))
  {
    v10 = UIAccessibilityAnnouncementNotification;
    v11 = TSAccessibilityLocalizedString((uint64_t)CFSTR("definition.missing"));
    UIAccessibilityPostNotification(v10, v11);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)TSWPEditingControllerAccessibility;
    -[TSWPEditingControllerAccessibility definitionAction:](&v12, "definitionAction:", a3);
  }
}

- (void)styleAction:(id)a3
{
  objc_super v5;

  -[TSWPEditingControllerAccessibility _tsaxAllowNextMenuToBecomeVisible](self, "_tsaxAllowNextMenuToBecomeVisible");
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility styleAction:](&v5, "styleAction:", a3);
}

- (void)replaceAction:(id)a3
{
  objc_super v5;

  -[TSWPEditingControllerAccessibility _tsaxAllowNextMenuToBecomeVisible](self, "_tsaxAllowNextMenuToBecomeVisible");
  v5.receiver = self;
  v5.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility replaceAction:](&v5, "replaceAction:", a3);
}

- (void)p_updateHUDState
{
  id v3;
  objc_super v4;

  if (UIAccessibilityIsVoiceOverRunning()
    && (-[objc_class tsaxBoolValueForKey:](NSClassFromString(CFSTR("TSWPEditMenuController")), "tsaxBoolValueForKey:", CFSTR("isAnimating")) & 1) == 0)
  {
    v3 = -[objc_class tsaxValueForKey:](NSClassFromString(CFSTR("TSWPEditMenuController")), "tsaxValueForKey:", CFSTR("sharedEditMenuController"));
    if (!objc_msgSend(v3, "tsaxAllowsMenuVisible"))
      v3 = 0;
  }
  else
  {
    v3 = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility p_updateHUDState](&v4, "p_updateHUDState");
  objc_msgSend(v3, "tsaxSetAllowsMenuVisible:", 0);
  -[NSNotificationCenter addObserver:selector:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"), "addObserver:selector:name:object:", self, "_tsaxDidHideMenu:", UIMenuControllerDidHideMenuNotification, 0);
}

- (void)p_didInsertPBAtRange:(_NSRange)a3 hasLabel:(BOOL)a4 shouldTerminateList:(BOOL)a5 newListStyle:(id)a6 newLabelLength:(unint64_t)a7 newListOverridePropertyMap:(id)a8
{
  _QWORD block[5];
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSWPEditingControllerAccessibility;
  -[TSWPEditingControllerAccessibility p_didInsertPBAtRange:hasLabel:shouldTerminateList:newListStyle:newLabelLength:newListOverridePropertyMap:](&v10, "p_didInsertPBAtRange:hasLabel:shouldTerminateList:newListStyle:newLabelLength:newListOverridePropertyMap:", a3.location, a3.length, a4, a5, a6, a7, a8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_239B8C;
  block[3] = &unk_426DD0;
  block[4] = self;
  TSAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
}

- (id)accessibilityValue
{
  return -[TSWPEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("unfilteredText"));
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  -[TSWPEditingControllerAccessibility tsaxSetSelectedTextRange:skipSelectionChangedNotification:](self, "tsaxSetSelectedTextRange:skipSelectionChangedNotification:", a3.location, a3.length, 0);
}

- (void)tsaxHandleEditingRepContentsChanged
{
  UIAccessibilityPostNotification(TSAccessibilityValueChangedNotification, 0);
}

- (void)tsaxHandleSelectionChanged
{
  UIAccessibilityPostNotification(TSAccessibilitySelectionChangedNotification, 0);
}

- (void)_tsaxDidHideMenu:(id)a3
{
  TSWPSelectionAccessibility *v4;
  _QWORD v5[6];

  -[NSNotificationCenter removeObserver:name:object:](+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter", a3), "removeObserver:name:object:", self, UIMenuControllerDidHideMenuNotification, 0);
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4 = -[TSWPEditingControllerAccessibility tsaxSelection](self, "tsaxSelection");
    if (v4)
    {
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_239CA0;
      v5[3] = &unk_426E28;
      v5[4] = v4;
      v5[5] = self;
      if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
        abort();
    }
  }
}

- (void)_tsaxAllowNextMenuToBecomeVisible
{
  if (UIAccessibilityIsVoiceOverRunning())
    objc_msgSend(-[objc_class tsaxValueForKey:](NSClassFromString(CFSTR("TSWPEditMenuController")), "tsaxValueForKey:", CFSTR("sharedEditMenuController")), "tsaxSetAllowsMenuVisible:", 1);
}

@end
