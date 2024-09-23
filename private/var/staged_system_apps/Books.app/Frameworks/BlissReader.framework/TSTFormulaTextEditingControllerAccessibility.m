@implementation TSTFormulaTextEditingControllerAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSTFormulaTextEditingController");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSWPEditingControllerAccessibility, a2);
}

- (BOOL)_tsaxDidUpdateAutocompletionText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54384D);
}

- (void)_tsaxSetDidUpdateAutocompletionText:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54384D, a3);
}

- (BOOL)_tsaxIsAcceptingTypedText
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_54384E);
}

- (void)_tsaxSetAcceptingTypedText:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_54384E, a3);
}

- (NSString)_tsaxFormulaPlainTextOfAbsorbedToken
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_54384F);
}

- (void)_tsaxSetFormulaPlainTextOfAbsorbedToken:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_54384F, a3);
}

- (BOOL)_tsaxAllowsDidUpdateSelectedChoiceForCompletionToken
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543850);
}

- (void)_tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543850, a3);
}

- (TSTTableRepAccessibility)tsaxTableRep
{
  void *v3;
  TSTTableRepAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTTableRepAccessibility);
  result = (TSTTableRepAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("formulaCellEditor")), "tsaxValueForKey:", CFSTR("tableRep")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSTCompletionTokenAccessibility)tsaxCompletionToken
{
  void *v3;
  TSTCompletionTokenAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSTCompletionTokenAccessibility);
  result = (TSTCompletionTokenAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("completionToken")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxHasMultipleAutocompletionChoices
{
  unsigned int v3;

  v3 = -[TSTFormulaTextEditingControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isAutocompleting"));
  if (v3)
    LOBYTE(v3) = (unint64_t)objc_msgSend(-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("typingChoicesController")), "tsaxUnsignedIntegerValueForKey:", CFSTR("countChoicesForCurrentDisplay")) > 1;
  return v3;
}

- (CGRect)tsaxFirstRectForRange:(_NSRange)a3
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
  _NSRange v12;
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
  v11[2] = sub_22C6CC;
  v11[3] = &unk_43B930;
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

- (void)tsaxPerformBlockAffectingKeyboardReferenceToken:(id)a3
{
  void *v5;
  Class v6;
  objc_class *v7;
  void *v8;
  Class v9;
  Class v10;
  char v11;
  char v12;

  v12 = 0;
  v5 = (void *)objc_opt_class(TSTWPTokenAttachmentAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mKeyboardReferenceToken")), 1, &v12);
  if (v12
    || (v7 = v6,
        (*((void (**)(id))a3 + 2))(a3),
        v11 = 0,
        v8 = (void *)objc_opt_class(TSTWPTokenAttachmentAccessibility),
        v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)-[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mKeyboardReferenceToken")), 1, &v11), v11))
  {
    abort();
  }
  v10 = v9;
  if (v7 != v9)
  {
    -[objc_class tsaxSetMovingReferenceToken:](v7, "tsaxSetMovingReferenceToken:", 0);
    -[objc_class tsaxSetMovingReferenceToken:](v10, "tsaxSetMovingReferenceToken:", 1);
  }

}

- (void)_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:(id)a3
{
  if (-[TSTFormulaTextEditingControllerAccessibility _tsaxAllowsDidUpdateSelectedChoiceForCompletionToken](self, "_tsaxAllowsDidUpdateSelectedChoiceForCompletionToken"))
  {
    (*((void (**)(id))a3 + 2))(a3);
  }
  else
  {
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:](self, "_tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:", 1);
    (*((void (**)(id))a3 + 2))(a3);
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:](self, "_tsaxSetAllowsDidUpdateSelectedChoiceForCompletionToken:", 0);
  }
}

- (BOOL)acceptTypedText:(id)a3
{
  unsigned __int8 v5;
  BOOL v6;
  objc_super v8;

  v5 = -[TSTFormulaTextEditingControllerAccessibility _tsaxIsAcceptingTypedText](self, "_tsaxIsAcceptingTypedText");
  if ((v5 & 1) == 0)
  {
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetAcceptingTypedText:](self, "_tsaxSetAcceptingTypedText:", 1);
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetFormulaPlainTextOfAbsorbedToken:](self, "_tsaxSetFormulaPlainTextOfAbsorbedToken:", 0);
  }
  v8.receiver = self;
  v8.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  v6 = -[TSTFormulaTextEditingControllerAccessibility acceptTypedText:](&v8, "acceptTypedText:", a3);
  if ((v5 & 1) == 0)
  {
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetAcceptingTypedText:](self, "_tsaxSetAcceptingTypedText:", 0);
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetFormulaPlainTextOfAbsorbedToken:](self, "_tsaxSetFormulaPlainTextOfAbsorbedToken:", 0);
  }
  return v6;
}

- (void)arrowKeyReceivedInDirection:(int)a3 withModifierKeys:(int)a4
{
  id v7;
  uint64_t v8;
  int v9;
  _QWORD v10[5];
  int v11;
  int v12;

  if (!-[TSTFormulaTextEditingControllerAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isAutocompleting")))
  {
    v7 = 0;
    goto LABEL_5;
  }
  v7 = -[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("typingChoicesController"));
  if ((unint64_t)objc_msgSend(v7, "tsaxUnsignedIntegerValueForKey:", CFSTR("countChoicesForCurrentDisplay")) < 2)
  {
LABEL_5:
    v9 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_6;
  }
  v8 = (uint64_t)objc_msgSend(v7, "tsaxUnsignedIntegerValueForKey:", CFSTR("selectedChoiceIndex"));
  v9 = 1;
LABEL_6:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_22CA0C;
  v10[3] = &unk_427240;
  v11 = a3;
  v12 = a4;
  v10[4] = self;
  -[TSTFormulaTextEditingControllerAccessibility _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:](self, "_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:", v10);
  if (v9 && objc_msgSend(v7, "tsaxUnsignedIntegerValueForKey:", CFSTR("selectedChoiceIndex")) == (id)v8)
  {
    if (-[TSTFormulaTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidFailUpdatingSelectedChoiceForCompletionToken:", &OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras))-[TSTFormulaTextEditingControllerAccessibility tsaxDidFailUpdatingSelectedChoiceForCompletionToken:](self, "tsaxDidFailUpdatingSelectedChoiceForCompletionToken:", -[TSTFormulaTextEditingControllerAccessibility tsaxCompletionToken](self, "tsaxCompletionToken"));
  }
}

- (void)didSelectChoice:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  -[TSTFormulaTextEditingControllerAccessibility didSelectChoice:](&v4, "didSelectChoice:", a3);
  if (-[TSTFormulaTextEditingControllerAccessibility _tsaxAllowsDidUpdateSelectedChoiceForCompletionToken](self, "_tsaxAllowsDidUpdateSelectedChoiceForCompletionToken"))
  {
    if (-[TSTFormulaTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidUpdateSelectedChoiceForCompletionToken:", &OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras))-[TSTFormulaTextEditingControllerAccessibility tsaxDidUpdateSelectedChoiceForCompletionToken:](self, "tsaxDidUpdateSelectedChoiceForCompletionToken:", -[TSTFormulaTextEditingControllerAccessibility tsaxCompletionToken](self, "tsaxCompletionToken"));
  }
}

- (void)endInsertingKeyboardReferenceLeavingActive:(BOOL)a3
{
  id v5;
  _QWORD v6[5];
  BOOL v7;

  v5 = -[TSTFormulaTextEditingControllerAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("mKeyboardReferenceToken"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_22CB88;
  v6[3] = &unk_427268;
  v6[4] = self;
  v7 = a3;
  -[TSWPEditingControllerAccessibility tsaxPerformBlockAffectingTextSelection:](self, "tsaxPerformBlockAffectingTextSelection:", v6);
  if (objc_msgSend(objc_msgSend(v5, "tsaxValueForKey:", CFSTR("expressionNode")), "tsaxBoolValueForKey:", CFSTR("isBlankForKeyboardInsertion")))
  {
    if (-[TSTFormulaTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidDeleteBlankReferenceTokenForKeyboardInsertion", &OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras))-[TSTFormulaTextEditingControllerAccessibility tsaxDidDeleteBlankReferenceTokenForKeyboardInsertion](self, "tsaxDidDeleteBlankReferenceTokenForKeyboardInsertion");
  }
}

- (void)insertTabIgnoringFieldEditor:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_22CC74;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSTFormulaTextEditingControllerAccessibility _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:](self, "_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:", v3);
}

- (void)p_insertTab:(id)a3
{
  _QWORD v3[6];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_22CCFC;
  v3[3] = &unk_426E28;
  v3[4] = a3;
  v3[5] = self;
  -[TSTFormulaTextEditingControllerAccessibility _tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:](self, "_tsaxPerformBlockAllowingDidUpdateSelectedChoiceForCompletionToken:", v3);
}

- (void)p_modifyKeyboardReferenceInDirection:(int)a3 withModifierKeys:(int)a4
{
  _QWORD v4[5];
  int v5;
  int v6;

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_22CD88;
  v4[3] = &unk_427240;
  v5 = a3;
  v6 = a4;
  v4[4] = self;
  -[TSTFormulaTextEditingControllerAccessibility tsaxPerformBlockAffectingKeyboardReferenceToken:](self, "tsaxPerformBlockAffectingKeyboardReferenceToken:", v4);
}

- (void)p_startInsertingKeyboardReference
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_22CE14;
  v2[3] = &unk_426DD0;
  v2[4] = self;
  -[TSTFormulaTextEditingControllerAccessibility tsaxPerformBlockAffectingKeyboardReferenceToken:](self, "tsaxPerformBlockAffectingKeyboardReferenceToken:", v2);
}

- (void)setAutocompletionText:(id)a3 prefixRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  NSString *v8;
  _QWORD block[5];
  objc_super v10;
  _QWORD v11[8];

  length = a4.length;
  location = a4.location;
  v8 = -[TSTFormulaTextEditingControllerAccessibility _tsaxFormulaPlainTextOfAbsorbedToken](self, "_tsaxFormulaPlainTextOfAbsorbedToken");
  if (-[NSString length](v8, "length"))
  {
    if (-[TSTFormulaTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxWillAbsorbePreviousFormulaTokenWithText:", &OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras))-[TSTFormulaTextEditingControllerAccessibility tsaxWillAbsorbePreviousFormulaTokenWithText:](self, "tsaxWillAbsorbePreviousFormulaTokenWithText:", v8);
    -[TSTFormulaTextEditingControllerAccessibility _tsaxSetFormulaPlainTextOfAbsorbedToken:](self, "_tsaxSetFormulaPlainTextOfAbsorbedToken:", 0);
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_22CFA4;
    v11[3] = &unk_42BEC8;
    v11[6] = location;
    v11[7] = length;
    v11[4] = a3;
    v11[5] = self;
    -[TSWPEditingControllerAccessibility tsaxPerformBlockAffectingTextSelection:](self, "tsaxPerformBlockAffectingTextSelection:", v11);
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
    -[TSTFormulaTextEditingControllerAccessibility setAutocompletionText:prefixRange:](&v10, "setAutocompletionText:prefixRange:", a3, location, length);
  }
  if (!-[TSTFormulaTextEditingControllerAccessibility _tsaxDidUpdateAutocompletionText](self, "_tsaxDidUpdateAutocompletionText"))
  {
    if (-[TSTFormulaTextEditingControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidUpdateAutocompletionTextForToken:", &OBJC_PROTOCOL___TSTFormulaTextEditingControllerAccessibilityExtras))
    {
      -[TSTFormulaTextEditingControllerAccessibility _tsaxSetDidUpdateAutocompletionText:](self, "_tsaxSetDidUpdateAutocompletionText:", 1);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_22CFE0;
      block[3] = &unk_426DD0;
      block[4] = self;
      TSAccessibilityPerformBlockAsynchronouslyOnMainThread(block);
    }
  }
}

- (void)setSelection:(id)a3 withFlags:(unint64_t)a4
{
  void *v7;
  Class v8;
  Class v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  id v16;
  void *v17;
  Class v18;
  objc_super v19;
  char v20;

  if (-[TSTFormulaTextEditingControllerAccessibility _tsaxIsAcceptingTypedText](self, "_tsaxIsAcceptingTypedText")
    && !-[TSTFormulaTextEditingControllerAccessibility _tsaxFormulaPlainTextOfAbsorbedToken](self, "_tsaxFormulaPlainTextOfAbsorbedToken"))
  {
    v20 = 0;
    v7 = (void *)objc_opt_class(TSWPSelectionAccessibility);
    v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)a3, 1, &v20);
    if (v20)
      abort();
    v9 = v8;
    v10 = (char *)-[TSWPEditingControllerAccessibility tsaxSelectedTextRange](self, "tsaxSelectedTextRange");
    v12 = v11;
    v13 = (char *)-[objc_class tsaxRange](v9, "tsaxRange");
    if (!v12 && v14 == 1 && v13 + 1 == v10)
    {
      v16 = -[TSWPStorageAccessibility tsaxAttachmentOrFootnoteAtCharIndex:](-[TSWPRepAccessibility tsaxStorage](-[TSWPEditingControllerAccessibility tsaxEditingRepWithCaret](self, "tsaxEditingRepWithCaret"), "tsaxStorage"), "tsaxAttachmentOrFootnoteAtCharIndex:", v13);
      v17 = (void *)objc_opt_class(TSTWPTokenAttachmentAccessibility);
      v18 = __TSAccessibilityCastAsSafeCategory(v17, (uint64_t)v16, 0, 0);
      if (v18)
        -[TSTFormulaTextEditingControllerAccessibility _tsaxSetFormulaPlainTextOfAbsorbedToken:](self, "_tsaxSetFormulaPlainTextOfAbsorbedToken:", -[objc_class tsaxFormulaPlainText](v18, "tsaxFormulaPlainText"));
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)TSTFormulaTextEditingControllerAccessibility;
  -[TSTFormulaTextEditingControllerAccessibility setSelection:withFlags:](&v19, "setSelection:withFlags:", a3, a4);
}

@end
