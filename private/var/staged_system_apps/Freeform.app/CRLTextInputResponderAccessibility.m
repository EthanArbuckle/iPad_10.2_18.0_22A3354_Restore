@implementation CRLTextInputResponderAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLTextInputResponder");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (void)crlaxReloadInputViews
{
  _QWORD v2[5];

  v2[0] = _NSConcreteStackBlock;
  v2[1] = 3221225472;
  v2[2] = sub_1001E26D0;
  v2[3] = &unk_10122D110;
  v2[4] = self;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v2))
    abort();
}

- (id)crlaxVoiceControlPositionFromPosition:(id)a3 inDirection:(int64_t)a4 offset:(unint64_t)a5
{
  _BOOL4 v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v8 = (a4 & 0xFFFFFFFFFFFFFFFELL) == 4;
  v9 = a3;
  v10 = v9;
  if (a5 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "tokenizer"));

    v10 = v9;
    if (a5)
    {
      v13 = 4 * v8;
      v14 = v9;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "positionFromPosition:toBoundary:inDirection:", v14, v13, a4));

        v14 = v10;
        --a5;
      }
      while (a5);
    }

  }
  return v10;
}

- (void)forwardInvocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char *v7;
  __CFString **v8;
  __CFString *v9;
  __CFString *v10;
  objc_super v11;
  _QWORD v12[4];
  id v13;
  CRLTextInputResponderAccessibility *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "editor"));

  if (!v6)
    goto LABEL_11;
  v7 = (char *)objc_msgSend(v4, "selector");
  if ((objc_opt_respondsToSelector(v6, v7) & 1) == 0)
    goto LABEL_11;
  if (v7 == "copy:")
  {
    v8 = &CRLAccessibilityTextOperationActionCopy;
  }
  else if (v7 == "cut:")
  {
    v8 = &CRLAccessibilityTextOperationActionCut;
  }
  else
  {
    if (v7 != "paste:")
    {
LABEL_11:
      v11.receiver = self;
      v11.super_class = (Class)CRLTextInputResponderAccessibility;
      -[CRLTextInputResponderAccessibility forwardInvocation:](&v11, "forwardInvocation:", v4);
      goto LABEL_12;
    }
    v8 = &CRLAccessibilityTextOperationActionPaste;
  }
  v9 = *v8;
  if (!v9)
    goto LABEL_11;
  v10 = v9;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001E291C;
  v12[3] = &unk_10122D3D8;
  v13 = v4;
  v14 = self;
  -[CRLTextInputResponderAccessibility crlaxHandleTextOperationAction:usingBlock:](self, "crlaxHandleTextOperationAction:usingBlock:", v10, v12);

LABEL_12:
}

- (id)_accessibilityResponderElement
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CRLAccessibility sharedInstance](CRLAccessibility, "sharedInstance"));
  if ((objc_msgSend(v3, "shouldPreventFocusingCanvasResponderElementOnScreenChange") & 1) != 0)
    v4 = 0;
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxFocusedElement](self, "crlaxFocusedElement"));

  return v4;
}

- (id)crlaxFocusedElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "editingReps"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allObjects"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility _crlaxInteractiveCanvasController](self, "_crlaxInteractiveCanvasController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxFocusedRep"));

    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxFocusedElement"));
  }
  return v6;
}

- (BOOL)crlaxIsFirstResponder
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isFirstResponder");

  return v3;
}

- (UITextRange)crlaxTextRange
{
  CRLTextInputResponderAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  char v12;

  v12 = 0;
  v2 = self;
  objc_opt_class(UIResponder, v3);
  v5 = __CRLAccessibilityCastAsClassAndProtocol(v4, (Protocol *)&OBJC_PROTOCOL___UITextInput, v2, 1, &v12);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v12)
    abort();
  v7 = (void *)v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "beginningOfDocument"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "endOfDocument"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "textRangeFromPosition:toPosition:", v8, v9));

  return (UITextRange *)v10;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "icc"));

  objc_opt_class(CRLCanvasInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (id)_accessibilityQuickSpeakContent
{
  double v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  objc_super v13;

  *(_QWORD *)&v3 = objc_opt_class(UITextRange, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget", v3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "selectedTextRange"));
  v8 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v7, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  if (!-[CRLTextInputResponderAccessibility crlaxBoolValueForKey:](self, "crlaxBoolValueForKey:", CFSTR("_accessibilityIsTextInput"))|| (v10 = 0, v9))
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLTextInputResponderAccessibility;
    v11 = -[CRLTextInputResponderAccessibility _accessibilityQuickSpeakContent](&v13, "_accessibilityQuickSpeakContent");
    v10 = (void *)objc_claimAutoreleasedReturnValue(v11);
  }

  return v10;
}

- (id)crlaxTextEditor
{
  void *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextInputResponderAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "editor"));

  objc_opt_class(_TtC8Freeform11CRLWPEditor, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

@end
