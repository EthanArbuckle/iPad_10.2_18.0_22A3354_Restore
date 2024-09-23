@implementation CRLTextRepAccessibility

- (CRLTextRepAccessibility)_crlaxShapeContainedTextRep
{
  return (CRLTextRepAccessibility *)__CRLAccessibilityGetAssociatedObject(self, &unk_101414ED0);
}

- (void)_crlaxSetShapeContainedTextRep:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101414ED0, a3);
}

- (unint64_t)_crlaxLastSpeakThisVisibleStorageOffset
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_101414ED1);
}

- (void)_crlaxSetLastSpeakThisVisibleStorageOffset:(unint64_t)a3
{
  __CRLAccessibilitySetAssociatedUnsignedInteger(self, &unk_101414ED1, (id)a3);
}

- (id)_crlaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  CRLTextRepAccessibility *v18;
  uint64_t *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;

  v6 = a3;
  v7 = qword_101414ED8;
  if (!qword_101414ED8)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%C%C"), 65532, 14));
    v9 = objc_claimAutoreleasedReturnValue(+[NSCharacterSet characterSetWithCharactersInString:](NSCharacterSet, "characterSetWithCharactersInString:", v8));
    v10 = (void *)qword_101414ED8;
    qword_101414ED8 = v9;

    v7 = qword_101414ED8;
  }
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = sub_100181B10;
  v25 = sub_100181B20;
  v26 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100181B28;
  v16[3] = &unk_10123E500;
  v19 = &v21;
  v11 = v6;
  v20 = a4;
  v17 = v11;
  v18 = self;
  objc_msgSend(v11, "crl_enumerateRangesOfCharactersInSet:usingBlock:", v7, v16);
  v12 = (void *)v22[5];
  if (v12)
    v13 = v12;
  else
    v13 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v11);
  v14 = v13;

  _Block_object_dispose(&v21, 8);
  return v14;
}

- (BOOL)crlaxPreventRotorCacheCleanup
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414EE0);
}

- (void)crlaxSetPreventRotorCacheCleanup:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414EE0, a3);
}

- (BOOL)crlaxPreventSelectedTextRangeChanges
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_101414ED2);
}

- (void)crlaxSetPreventSelectedTextRangeChanges:(BOOL)a3
{
  __CRLAccessibilitySetAssociatedBool(self, &unk_101414ED2, a3);
}

- (BOOL)crlaxNeedsEditRotorMenu
{
  if (-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
    return 1;
  else
    return -[CRLCanvasRepAccessibility crlaxIsSelectedIgnoringLocking](self, "crlaxIsSelectedIgnoringLocking");
}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  unsigned int v7;
  void *v8;
  void *v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CRLTextRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityCustomActions](&v11, "accessibilityCustomActions");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = objc_msgSend(v4, "mutableCopy");

  if (!v5)
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v7 = objc_msgSend(v6, "crlaxCurrentSelectionContainsVisibleTrackedChanges");

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("Show change"), 0, 0));

    +[CRLAccessibilityBlockBasedCustomAction addActionToArray:withName:actionBlock:](CRLAccessibilityBlockBasedCustomAction, "addActionToArray:withName:actionBlock:", v5, v9, &stru_10123E540);
  }
  return v5;
}

- (id)_accessibilityTextOperations
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CRLTextRepAccessibility;
  v2 = -[CRLCanvasRepAccessibility _accessibilityTextOperations](&v7, "_accessibilityTextOperations");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v3));

  v5 = objc_msgSend(v4, "copy");
  return v5;
}

- (BOOL)accessibilityEditOperationAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Remove smart annotation"), 0, 0));

  if ((objc_msgSend(v4, "isEqualToString:", v6) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CRLTextRepAccessibility;
    v7 = -[CRLCanvasRepAccessibility accessibilityEditOperationAction:](&v9, "accessibilityEditOperationAction:", v4);
  }

  return v7;
}

- (BOOL)crlaxNeedsTextEntryTrait
{
  void *v3;
  unsigned __int8 v4;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v4 = objc_msgSend(v3, "crlaxUnsignedIntValueForKey:", CFSTR("wpKind"));
  if (v4 == 4 || (v4 & 0xFC) == 0)
    v6 = -[CRLTextRepAccessibility _crlaxTextIsEditable](self, "_crlaxTextIsEditable");
  else
    v6 = 0;

  return v6;
}

- (void)_crlaxCondenseAttributedString:(id)a3
{
  id v3;
  id v4;
  unint64_t v5;
  void *v6;
  NSUInteger v7;
  void *v8;
  NSUInteger location;
  NSUInteger length;
  void *v11;
  NSRange v12;
  NSUInteger v13;
  NSUInteger v14;
  id v15;
  NSRange v16;
  NSRange v17;

  v3 = a3;
  v4 = objc_msgSend(v3, "length");
  if (v4)
  {
    v5 = (unint64_t)v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    location = 0;
    v16.location = 0;
    v16.length = 0;
    length = 1;
    do
    {
      v11 = v6;
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "attributesAtIndex:effectiveRange:", v7, &v16));

      if (objc_msgSend(v8, "isEqual:", v6))
      {
        v17.location = location;
        v17.length = length;
        v12 = NSUnionRange(v17, v16);
        location = v12.location;
        length = v12.length;
        v13 = v16.location;
        v14 = v16.length;
      }
      else
      {
        if (v8)
          objc_msgSend(v3, "setAttributes:range:", v8, location, length);
        v15 = v6;

        v13 = v16.location;
        v14 = v16.length;
        v8 = v15;
        location = v16.location;
        length = v16.length;
      }
      v7 = v14 + v13;
    }
    while (v14 + v13 < v5);
    if (v8)
      objc_msgSend(v3, "setAttributes:range:", v8, location, length);

  }
}

- (id)crlaxSubstringInStorageWithRange:(_NSRange)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", a3.location, a3.length));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "string"));

  return v4;
}

- (id)crlaxAttributedSubstringInStorageWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void **v26;
  uint64_t v27;
  void (*v28)(_QWORD *, unint64_t, NSUInteger, void *, void *);
  void *v29;
  id v30;
  uint64_t *v31;
  NSRange v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  NSRange v39;
  NSRange v40;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v40.location = (NSUInteger)objc_msgSend(v6, "crlaxRange");
  v40.length = v7;
  v39.location = location;
  v39.length = length;
  v8 = NSIntersectionRange(v39, v40);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "substringWithRange:", v8.location, v8.length));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringEquivalentFromRange:", v8.location, v8.length));
  v11 = v10;
  if (v9)
  {
    if (v10)
    {
      v12 = (char *)objc_msgSend(v10, "length");
      if (objc_msgSend(v9, "length") == v12)
      {
        if (v12)
        {
          v13 = v12 - 1;
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "substringFromIndex:", v13));
          if ((objc_msgSend(v14, "isEqualToString:", CFSTR("\r")) & 1) != 0)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "substringFromIndex:", v13));
            v16 = objc_msgSend(v15, "isEqualToString:", CFSTR("\n"));

            if (v16)
            {
              v17 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v13, 1, CFSTR("\n")));
LABEL_10:
              v18 = v17;

              v9 = v18;
              goto LABEL_11;
            }
          }
          else
          {

          }
        }
        v17 = v11;
        goto LABEL_10;
      }
    }
  }
LABEL_11:
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = sub_100181B10;
  v37 = sub_100181B20;
  v38 = 0;
  if (objc_msgSend(v9, "length"))
  {
    v19 = objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxProcessStringForObjectReplacements:rangeOffset:](self, "_crlaxProcessStringForObjectReplacements:rangeOffset:", v9, v8.location));
    v20 = (void *)v34[5];
    v34[5] = v19;

  }
  v26 = _NSConcreteStackBlock;
  v27 = 3221225472;
  v28 = sub_10018233C;
  v29 = &unk_10123E568;
  v31 = &v33;
  v21 = v9;
  v30 = v21;
  v32 = v8;
  -[CRLTextRepAccessibility crlaxEnumerateSpecialTextTokensInRange:usingBlock:](self, "crlaxEnumerateSpecialTextTokensInRange:usingBlock:", v8.location, v8.length, &v26);
  v22 = (void *)v34[5];
  if (v22)
  {
    objc_msgSend(v22, "endEditing", v26, v27, v28, v29);
    v23 = (id)v34[5];
  }
  else
  {
    if (!objc_msgSend(v21, "length", v26, v27, v28, v29))
    {
      v24 = 0;
      goto LABEL_18;
    }
    v23 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v21);
  }
  v24 = v23;
LABEL_18:

  _Block_object_dispose(&v33, 8);
  return v24;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int16 v23;
  __int16 v24;
  void *v25;
  NSRange v26;
  NSRange v27;

  v4 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3->location, a3->length);
  v6 = v5;
  v27.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  v27.length = v7;
  v26.location = (NSUInteger)v4;
  v26.length = v6;
  v8 = NSIntersectionRange(v26, v27);
  if (v8.length)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v8.location, v8.length));
    v10 = objc_msgSend(v9, "mutableCopy");

    objc_msgSend(v10, "beginEditing");
    v11 = 0;
    do
    {
      if (v11 + 1 > (unint64_t)objc_msgSend(v10, "length"))
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
      v13 = objc_msgSend(v12, "textIsVertical");

      if (v13)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("Vertical text"), 0, 0));

        v25 = v15;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
        objc_msgSend(v10, "addAttribute:value:range:", CFSTR("UIAccessibilityTextAttributeCustom"), v16, v11, 1);

      }
      ++v11;
    }
    while (v8.location + v11 < v8.location + v8.length);
    if (!qword_101414EE8)
    {
      v24 = 14;
      v23 = -4;
      v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v24, 1));
      v18 = (void *)qword_101414EE8;
      qword_101414EE8 = v17;

      v19 = objc_claimAutoreleasedReturnValue(+[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v23, 1));
      v20 = (void *)qword_101414EF0;
      qword_101414EF0 = v19;

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "mutableString"));
    objc_msgSend(v21, "replaceOccurrencesOfString:withString:options:range:", qword_101414EE8, qword_101414EF0, 0, 0, objc_msgSend(v10, "length"));

    objc_msgSend(v10, "endEditing");
    -[CRLTextRepAccessibility _crlaxCondenseAttributedString:](self, "_crlaxCondenseAttributedString:", v10);
    -[CRLTextRepAccessibility performSelector:withObject:](self, "performSelector:withObject:", NSSelectorFromString(CFSTR("_accessibilityAddMispellingsToAttributedString:")), v10);
  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  void *v9;
  void *v10;
  NSRange v12;
  NSRange v13;

  v4 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3->location, a3->length);
  v6 = v5;
  v13.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  v13.length = v7;
  v12.location = (NSUInteger)v4;
  v12.length = v6;
  v8 = NSIntersectionRange(v12, v13);
  if (v8.length)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v8.location, v8.length));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "string"));

  }
  else
  {
    v10 = 0;
  }
  return v10;
}

- (BOOL)_crlaxTextIsEditable
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  char v10;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPShapeRepAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = objc_msgSend(v8, "crlaxCanBeginEditingChildRepOnDoubleTap:", self);
  else
    v9 = 1;
  v10 = v9 & ~-[CRLCanvasRepAccessibility crlaxInReadOnlyMode](self, "crlaxInReadOnlyMode");

  return v10;
}

- (void)_crlaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  BOOL v12;
  BOOL v13;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
    v9 = v8;
    if (v8
      && (!objc_msgSend(v8, "crlaxIsSelected")
       || (objc_opt_class(CRLGroupRep, v10), (objc_opt_isKindOfClass(v9, v11) & 1) != 0)))
    {
      v12 = 0;
      v13 = 1;
    }
    else if (-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
    {
      v13 = 0;
      v12 = 0;
    }
    else
    {
      v12 = -[CRLTextRepAccessibility _crlaxTextIsEditable](self, "_crlaxTextIsEditable");
      v13 = 0;
    }

    if (a3)
      goto LABEL_12;
  }
  else
  {
    v12 = 0;
    v13 = 1;
    if (a3)
LABEL_12:
      *a3 = v12;
  }
  if (a4)
    *a4 = v13;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;
  __int16 v5;

  v5 = 0;
  -[CRLTextRepAccessibility _crlaxActivationShouldBeginEditing:shouldHandleCanvasSelection:](self, "_crlaxActivationShouldBeginEditing:shouldHandleCanvasSelection:", (char *)&v5 + 1, &v5);
  if (HIBYTE(v5))
    return 1;
  if (!(_BYTE)v5)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CRLTextRepAccessibility;
  return -[CRLCanvasRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  unsigned __int8 v8;
  id v9;
  CRLTextRepAccessibility *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;
  id v16;
  __int16 v17;

  v17 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "layerHost"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "asiOSCVC"));
  v7 = objc_msgSend(v6, "isCurrentlyInQuickSelectMode");

  v8 = 0;
  if ((v7 & 1) == 0)
  {
    -[CRLTextRepAccessibility _crlaxActivationShouldBeginEditing:shouldHandleCanvasSelection:](self, "_crlaxActivationShouldBeginEditing:shouldHandleCanvasSelection:", (char *)&v17 + 1, &v17);
    if (HIBYTE(v17))
    {
      v16 = 0;
      v9 = -[CRLTextRepAccessibility crlaxBeginEditingRangeInStorage:chosenTextRepReference:](self, "crlaxBeginEditingRangeInStorage:chosenTextRepReference:", 0x7FFFFFFFFFFFFFFFLL, 0, &v16);
      v10 = (CRLTextRepAccessibility *)v16;
      if (v10 != self)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));

        if (!v11)
          -[CRLTextRepAccessibility _crlaxSetShapeContainedTextRep:](self, "_crlaxSetShapeContainedTextRep:", v10);
      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
      objc_msgSend(v12, "crlaxScrollCurrentSelectionToVisible");

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
      -[CRLTextRepAccessibility accessibilityActivationPoint](self, "accessibilityActivationPoint");
      v8 = objc_msgSend(v13, "crlaxHandleDoubleTapAtPoint:");

    }
    else if ((_BYTE)v17)
    {
      v15.receiver = self;
      v15.super_class = (Class)CRLTextRepAccessibility;
      return -[CRLCanvasRepAccessibility accessibilityActivate](&v15, "accessibilityActivate");
    }
    else
    {
      return 0;
    }
  }
  return v8;
}

- (CGPoint)accessibilityActivationPoint
{
  double y;
  unint64_t v4;
  double MidY;
  double v6;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  _BOOL4 v29;
  double v31;
  double v32;
  objc_super v33;
  CGPoint result;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  y = CGPointZero.y;
  v4 = -[CRLTextRepAccessibility accessibilityTraits](self, "accessibilityTraits");
  v6 = y;
  x = CGPointZero.x;
  if ((CRLAccessibilityTraitIsEditing & v4) != 0)
  {
    -[CRLTextRepAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("caretRect"));
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvas](self, "crlaxCanvas"));
    objc_msgSend(v16, "crlaxScreenFrameFromUnscaledCanvas:", v9, v11, v13, v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;

    -[CRLTextRepAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
    v38.origin.x = v25;
    v38.origin.y = v26;
    v38.size.width = v27;
    v38.size.height = v28;
    v35.origin.x = v18;
    v35.origin.y = v20;
    v35.size.width = v22;
    v35.size.height = v24;
    v29 = CGRectIntersectsRect(v35, v38);
    v6 = y;
    x = CGPointZero.x;
    if (v29)
    {
      v36.origin.x = v18;
      v36.origin.y = v20;
      v36.size.width = v22;
      v36.size.height = v24;
      x = CGRectGetMidX(v36);
      v37.origin.x = v18;
      v37.origin.y = v20;
      v37.size.width = v22;
      v37.size.height = v24;
      MidY = CGRectGetMidY(v37);
      v6 = MidY;
    }
  }
  if (x == CGPointZero.x && v6 == y)
  {
    v33.receiver = self;
    v33.super_class = (Class)CRLTextRepAccessibility;
    -[CRLCanvasRepAccessibility accessibilityActivationPoint](&v33, "accessibilityActivationPoint", MidY, v6);
    x = v31;
  }
  v32 = x;
  result.y = v6;
  result.x = v32;
  return result;
}

- (CGRect)accessibilityFrameForScrolling
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)CRLTextRepAccessibility;
  -[CRLTextRepAccessibility accessibilityFrameForScrolling](&v20, "accessibilityFrameForScrolling");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[CRLTextRepAccessibility accessibilityTraits](self, "accessibilityTraits");
  if ((CRLAccessibilityTraitIsEditing & v11) != 0)
  {
    -[CRLTextRepAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("caretRect"));
    -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToScreenSpace:](self, "crlaxConvertNaturalRectToScreenSpace:");
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;
  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (BOOL)crlaxRepRangeContainsLocation:(unint64_t)a3
{
  id v4;
  unint64_t v5;

  v4 = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  return a3 >= (unint64_t)v4 && a3 - (unint64_t)v4 < v5;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  NSUInteger v8;
  _NSRange result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v4 = objc_msgSend(v3, "crlaxSelectedTextRange");
  v6 = v5;

  v7 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v4, v6);
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (void)_crlaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
{
  _BOOL8 v4;
  char *v6;
  NSUInteger v7;
  NSUInteger v8;
  char *v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger length;
  NSUInteger location;
  NSRange v14;
  NSRange v15;
  void *v16;
  NSUInteger v17;
  NSUInteger v18;
  id v19;
  NSRange v20;

  v4 = a4;
  v6 = (char *)-[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3.location, a3.length);
  v8 = v7;
  v9 = (char *)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  v11 = (NSUInteger)v9;
  if (v8 || v6 < &v9[v10 + 1])
  {
    if (v8)
      v14.length = v10;
    else
      v14.length = v10 + 1;
    v20.location = (NSUInteger)v6;
    v20.length = v8;
    v14.location = v11;
    v15 = NSIntersectionRange(v20, v14);
    location = v15.location;
    length = v15.length;
    if (v15.location)
      goto LABEL_12;
  }
  else
  {
    length = 0;
    location = (NSUInteger)&v9[v10];
    if (&v9[v10])
      goto LABEL_12;
  }
  if ((char *)v11 == v6)
  {
LABEL_12:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
    v19 = v16;
    v17 = location;
    v18 = length;
    goto LABEL_13;
  }
  if ((unint64_t)v6 >= v11)
    return;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v19 = v16;
  v17 = v11;
  v18 = 0;
LABEL_13:
  objc_msgSend(v16, "crlaxSetSelectedTextRange:skipSelectionChangedNotification:", v17, v18, v4);

}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  id v11;

  length = a3.length;
  location = a3.location;
  if (!-[CRLTextRepAccessibility crlaxPreventSelectedTextRangeChanges](self, "crlaxPreventSelectedTextRangeChanges"))
  {
    v6 = -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", location, length);
    v8 = -[CRLTextRepAccessibility crlaxClampRangeToStorageRange:](self, "crlaxClampRangeToStorageRange:", v6, v7);
    v10 = v9;
    v11 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
    objc_msgSend(v11, "crlaxSetSelectedTextRange:skipSelectionChangedNotification:", v8, v10, 0);

  }
}

- (unint64_t)_crlaxPositionOfLastSelectedLine:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v6 = objc_msgSend(v5, "crlaxSelectedTextRange");
  v8 = (uint64_t)v6 + v7;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v10 = (char *)objc_msgSend(v9, "crlaxStorageRangeOfLineFragmentAtCharIndex:", v8);
  v12 = v11;

  if (v10 == (char *)0x7FFFFFFFFFFFFFFFLL && v12 == 0)
  {
    if (CRLAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line fragment range not found for positionInStorage: %lu"), v16, v17, v18, v19, v20, v8))abort();
    }
    return -1;
  }
  else if (v3)
  {
    return (unint64_t)-[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v10, v12);
  }
  else
  {
    return -[CRLTextRepAccessibility crlaxRepPositionWithStoragePosition:](self, "crlaxRepPositionWithStoragePosition:", &v10[v12]);
  }
}

- (int64_t)_accessibilityLineEndPosition
{
  return -[CRLTextRepAccessibility _crlaxPositionOfLastSelectedLine:](self, "_crlaxPositionOfLastSelectedLine:", 0);
}

- (int64_t)_accessibilityLineStartPosition
{
  return -[CRLTextRepAccessibility _crlaxPositionOfLastSelectedLine:](self, "_crlaxPositionOfLastSelectedLine:", 1);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned int v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  unsigned __int8 v22;
  void *v23;
  void *v24;
  void *v25;
  unint64_t v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)CRLTextRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility accessibilityTraits](&v28, "accessibilityTraits");
  v4 = -[CRLTextRepAccessibility crlaxNeedsTextEntryTrait](self, "crlaxNeedsTextEntryTrait");
  v5 = CRLAccessibilityTraitTextEntry;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited")
    || (v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep")),
        v9,
        !v9)
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxShapeContainedTextRep](self, "_crlaxShapeContainedTextRep")),
        v11 = objc_msgSend(v10, "crlaxIsBeingEdited"),
        v10,
        v11))
  {
    v8 = CRLAccessibilityTraitIsEditing | CRLAccessibilityTraitTextOperationsAvailable | v6;
  }
  else
  {
    v8 = v6 & ~CRLAccessibilityTraitIsEditing;
  }
  *(_QWORD *)&v12 = objc_opt_class(CRLWPShapeRepAccessibility, v7).n128_u64[0];
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep", v12));
  v16 = __CRLAccessibilityCastAsSafeCategory(v14, (uint64_t)v15, 0, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  v18 = CRLAccessibilityTraitTextArea;
  if (v17)
    v18 = 0;
  v19 = v18 | v8;
  v20 = objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  if (v20
    && (v21 = (void *)v20,
        v22 = -[CRLCanvasRepAccessibility crlaxInReadOnlyMode](self, "crlaxInReadOnlyMode"),
        v21,
        (v22 & 1) == 0))
  {
    if ((CRLAccessibilityTraitTextEntry & v19) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
      v24 = v23;
      if (v23 && (objc_msgSend(v23, "crlaxIsSelected") & 1) == 0)
        v19 |= CRLAccessibilityTraitStaticText;

    }
  }
  else
  {
    v19 &= ~(CRLAccessibilityTraitTextArea | CRLAccessibilityTraitTextEntry);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v26 = (unint64_t)objc_msgSend(v25, "accessibilityTraits") | v19;

  return v26;
}

- (id)automationElements
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  objc_super v13;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPShapeRepAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxKnobAccessibilityElements"));
  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)CRLTextRepAccessibility;
    v10 = -[CRLTextRepAccessibility automationElements](&v13, "automationElements");
    v9 = objc_claimAutoreleasedReturnValue(v10);
  }
  v11 = (void *)v9;

  return v11;
}

- (id)accessibilityHint
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;
  objc_super v15;

  if (-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxParentShapeHint](self, "_crlaxParentShapeHint"));
  if (!objc_msgSend(v4, "length"))
  {
    v15.receiver = self;
    v15.super_class = (Class)CRLTextRepAccessibility;
    v11 = -[CRLCanvasRepAccessibility accessibilityHint](&v15, "accessibilityHint");
    v12 = objc_claimAutoreleasedReturnValue(v11);

    v4 = (void *)v12;
  }
  v13 = __CRLAccessibilityStringForVariables(1, 0, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (id)crlaxKnobLabel
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("Text"), 0, 0));

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility accessibilityAttributedValue](self, "accessibilityAttributedValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "string"));

  return v3;
}

- (id)accessibilityAttributedValue
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  if (-[CRLCanvasRepAccessibility crlaxIsTitle](self, "crlaxIsTitle")
    && !-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "crlaxParentRep"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "crlaxTitle"));

    if (objc_msgSend(v6, "length"))
      goto LABEL_11;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Empty title");
    goto LABEL_10;
  }
  if (!-[CRLCanvasRepAccessibility crlaxIsCaption](self, "crlaxIsCaption")
    || -[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
  {
    v3 = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
    v5 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v3, v4));
    v6 = 0;
    goto LABEL_14;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxParentRep"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxCaption"));

  if (!objc_msgSend(v6, "length"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v10 = v9;
    v11 = CFSTR("Empty caption");
LABEL_10:
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedStringForKey:value:table:", v11, 0, 0));

    v6 = (void *)v14;
  }
LABEL_11:
  if (v6)
    v5 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v6);
  else
    v5 = 0;
LABEL_14:

  return v5;
}

- (BOOL)isAccessibilityElement
{
  return !-[CRLTextRepAccessibility crlaxIsDecorativeElement](self, "crlaxIsDecorativeElement");
}

- (id)_crlaxParentShapeTypeLabel
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPShapeRepAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityLabel"));

  return v9;
}

- (id)_crlaxParentShapeHint
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  *(_QWORD *)&v3 = objc_opt_class(CRLWPShapeRepAccessibility, a2).n128_u64[0];
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep", v3));
  v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "accessibilityHint"));
  else
    v9 = 0;

  return v9;
}

- (id)_crlaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, CFSTR("lineNumber"), v6, CFSTR("lineColumn"), 0));

  return v7;
}

- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5
{
  void *v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  unint64_t v13;
  void **v14;
  uint64_t v15;
  id (*v16)(uint64_t, void *, uint64_t, _BYTE *);
  void *v17;
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxColumns](self, "crlaxColumns"));
  objc_opt_class(NSArray, v10);
  if ((objc_opt_isKindOfClass(v9, v11) & 1) == 0)
  {
    v13 = 0x7FFFFFFFFFFFFFFFLL;
    if (!a3)
      goto LABEL_6;
    goto LABEL_5;
  }
  v14 = _NSConcreteStackBlock;
  v15 = 3221225472;
  v16 = sub_100183860;
  v17 = &unk_10123E590;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility columnForCharIndex:](self, "columnForCharIndex:", a5));
  v18 = v12;
  v19 = &v20;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v14);
  v13 = (unint64_t)objc_msgSend(v12, "lineIndexForCharIndex:eol:", a5, 1, v14, v15, v16, v17);

  if (a3)
LABEL_5:
    *a3 = v13;
LABEL_6:
  if (a4)
    *a4 = v21[3];

  _Block_object_dispose(&v20, 8);
}

- (id)_crlaxLineNumberAndColumnForPosition:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLTextRepAccessibility _crlaxGetEffectiveLineNumber:columnNumber:forPosition:](self, "_crlaxGetEffectiveLineNumber:columnNumber:forPosition:", &v6, &v5, a3);
  return (id)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxGetDictionaryForLineNumber:columnNumber:](self, "_crlaxGetDictionaryForLineNumber:columnNumber:", v6, v5));
}

- (void)_crlaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y;
  double x;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_class *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unint64_t v26;
  void *v27;
  id v28;
  double v29;
  double v30;
  char v32;
  unint64_t v33;
  unint64_t v34;

  y = a5.y;
  x = a5.x;
  v33 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v32 = 0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxCanvasView"));
  objc_opt_class(UIView, v12);
  v14 = __CRLAccessibilityCastAsClass(v13, (uint64_t)v11, 1, &v32);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v32)
    abort();
  v16 = (void *)v15;

  v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "window"));
  v18 = (void *)v17;
  if (v16)
    v19 = v17 == 0;
  else
    v19 = 1;
  if (!v19)
  {
    objc_msgSend(v16, "convertPoint:fromView:", v17, x, y);
    objc_msgSend(v10, "crlaxConvertBoundsToUnscaledPoint:");
    -[CRLCanvasRepAccessibility crlaxConvertNaturalPointFromUnscaledCanvas:](self, "crlaxConvertNaturalPointFromUnscaledCanvas:");
    v21 = v20;
    v23 = v22;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layout"));
    v26 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v25, v21, v23);

    -[CRLTextRepAccessibility _crlaxGetEffectiveLineNumber:columnNumber:forPosition:](self, "_crlaxGetEffectiveLineNumber:columnNumber:forPosition:", &v34, &v33, v26);
    if (v34)
    {
      if (v34 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxColumnForCharIndex:](self, "crlaxColumnForCharIndex:", v26));
        v28 = objc_msgSend(v27, "crlaxLineCount");
        if (v34 - 1 < (unint64_t)v28)
        {
          objc_msgSend(v27, "boundsOfLineFragmentAtIndex:");
          if (v29 <= v23 && v23 <= v29 + v30 && v34 >= 2)
            --v34;
        }

      }
    }
  }
  if (a3)
    *a3 = v34;
  if (a4)
    *a4 = v33;

}

- (id)accessibilityPreviousTextNavigationElement
{
  return -[CRLTextRepAccessibility crlaxContentSiblingInDirection:](self, "crlaxContentSiblingInDirection:", 1);
}

- (id)accessibilityNextTextNavigationElement
{
  return -[CRLTextRepAccessibility crlaxContentSiblingInDirection:](self, "crlaxContentSiblingInDirection:", 0);
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[CRLTextRepAccessibility _crlaxGetEffectiveLineNumber:columnNumber:forPoint:](self, "_crlaxGetEffectiveLineNumber:columnNumber:forPoint:", &v6, &v5, a3.x, a3.y);
  return (id)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxGetDictionaryForLineNumber:columnNumber:](self, "_crlaxGetDictionaryForLineNumber:columnNumber:", v6, v5));
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  unint64_t v23;
  id v24;
  NSUInteger v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  _QWORD v32[2];
  _NSRange result;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lineNumber")));
  v6 = v5;
  if (v5)
  {
    v7 = (unint64_t)objc_msgSend(v5, "integerValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", CFSTR("lineColumn")));
    v9 = (unint64_t)objc_msgSend(v8, "integerValue");

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxColumns](self, "crlaxColumns"));
    objc_opt_class(NSArray, v11);
    v13 = 0;
    v14 = 0x7FFFFFFFLL;
    if ((objc_opt_isKindOfClass(v10, v12) & 1) != 0 && (v9 & 0x8000000000000000) == 0)
    {
      if (v9 >= (unint64_t)objc_msgSend(v10, "count"))
      {
        v13 = 0;
        v14 = 0x7FFFFFFFLL;
      }
      else
      {
        LOBYTE(v32[0]) = 0;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));
        objc_opt_class(CRLColumnAccessibility, v16);
        v18 = __CRLAccessibilityCastAsSafeCategory(v17, (uint64_t)v15, 1, v32);
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (LOBYTE(v32[0]))
          abort();
        v20 = (void *)v19;

        v21 = objc_msgSend(v20, "crlaxLineCount");
        v13 = 0;
        v14 = 0x7FFFFFFFLL;
        if ((v7 & 0x8000000000000000) == 0 && v7 < (unint64_t)v21)
        {
          v22 = objc_msgSend(v20, "rangeOfLineFragmentAtIndex:", v7);
          if (v23 <= 0x7FFFFFFFFFFFFFFELL)
          {
            v24 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", v22, v23);
            v14 = (uint64_t)v24;
            v13 = v25;
            if (v25)
            {
              v32[0] = v24;
              v32[1] = v25;
              v26 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _accessibilityValueForRange:](self, "_accessibilityValueForRange:", v32));
              objc_opt_class(NSAttributedString, v27);
              if ((objc_opt_isKindOfClass(v26, v28) & 1) != 0)
              {
                v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "string"));

                v26 = (void *)v29;
              }
              if (objc_msgSend(v26, "hasSuffix:", CFSTR("\n")))
                v13 -= (unint64_t)objc_msgSend(v26, "length") > 1;

            }
          }
          else
          {
            v13 = 0;
            v14 = 0x7FFFFFFFLL;
          }
        }

      }
    }

  }
  else
  {
    v13 = 0;
    v14 = 0x7FFFFFFFLL;
  }

  v30 = v14;
  v31 = v13;
  result.length = v31;
  result.location = v30;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  void *v4;
  id v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _crlaxLineNumberAndColumnForPosition:](self, "_crlaxLineNumberAndColumnForPosition:", -[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3, 0)));
  v5 = -[CRLTextRepAccessibility _accessibilityRangeForLineNumberAndColumn:](self, "_accessibilityRangeForLineNumberAndColumn:", v4);
  v7 = v6;

  v8 = (NSUInteger)v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  char *v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  void *i;
  void *v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  char *v35;
  uint64_t v36;
  void *v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  char isKindOfClass;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  void *v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  char v57;
  _BYTE v58[128];
  CGRect result;

  v4 = (char *)-[CRLTextRepAccessibility crlaxStorageRangeWithRepRange:](self, "crlaxStorageRangeWithRepRange:", a3.location, a3.length);
  v6 = v5;
  if (!v5)
    -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  -[CRLCanvasRepAccessibility accessibilityFrame](self, "accessibilityFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxColumns](self, "crlaxColumns"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v57 = 0;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "crlaxCanvasView"));
  objc_opt_class(UIView, v18);
  v20 = __CRLAccessibilityCastAsClass(v19, (uint64_t)v17, 1, &v57);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (v57)
LABEL_25:
    abort();
  v22 = (void *)v21;

  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v23 = v15;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v24)
  {
    v25 = v24;
    v52 = v16;
    v26 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v25; i = (char *)i + 1)
      {
        if (*(_QWORD *)v54 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i);
        v57 = 0;
        v29 = v28;
        objc_opt_class(CRLColumnAccessibility, v30);
        v32 = __CRLAccessibilityCastAsSafeCategory(v31, (uint64_t)v29, 1, &v57);
        v33 = objc_claimAutoreleasedReturnValue(v32);
        if (v57)
          goto LABEL_25;
        v34 = (void *)v33;

        v35 = (char *)objc_msgSend(v34, "crlaxRange");
        if (v4 >= v35 && v4 < &v35[v36])
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttributedSubstringInStorageWithRange:](self, "crlaxAttributedSubstringInStorageWithRange:", v4, v6));
          v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "string"));

          objc_opt_class(NSAttributedString, v40);
          isKindOfClass = objc_opt_isKindOfClass(v39, v41);
          if ((isKindOfClass & 1) != 0)
          {
            v43 = objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "string"));

            v39 = (void *)v43;
          }
          v16 = v52;
          if (objc_msgSend(v39, "isEqualToString:", CFSTR("\n"), v22, v52, (_QWORD)v53))
            objc_msgSend(v34, "crlaxColumnRectForRange:", v4, v6);
          else
            objc_msgSend(v34, "crlaxGlyphRectForRange:includingLabel:", v4, v6, 0);
          -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:");
          objc_msgSend(v16, "crlaxConvertUnscaledToBoundsRect:");
          objc_msgSend(v22, "crlaxFrameFromBounds:");
          v8 = v44;
          v10 = v45;
          v12 = v46;
          v14 = v47;

          goto LABEL_24;
        }

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v25)
        continue;
      break;
    }
    v16 = v52;
  }
LABEL_24:

  v48 = v8;
  v49 = v10;
  v50 = v12;
  v51 = v14;
  result.size.height = v51;
  result.size.width = v50;
  result.origin.y = v49;
  result.origin.x = v48;
  return result;
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  void *v6;
  id v7;
  NSUInteger v8;
  void *v9;
  NSUInteger v10;
  NSUInteger length;
  _TtC8Freeform12CRLTextRange *v12;
  void *v13;
  void *v14;
  id v15;
  NSRange v16;
  NSRange v17;

  v15 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v7 = objc_msgSend(v6, "crlaxSelectedTextRange");

  v8 = (NSUInteger)v7 - a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v17.location = (NSUInteger)objc_msgSend(v9, "crlaxRange");
  v17.length = v10;
  v16.location = v8;
  v16.length = a3;
  length = NSIntersectionRange(v16, v17).length;

  if (length)
  {
    v12 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", v8, a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
    objc_msgSend(v14, "replace:with:", v12, v15);

  }
}

- (void)_accessibilityInsertText:(id)a3 atPosition:(int64_t)a4
{
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  if (a4 == -1)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
    objc_msgSend(v12, "crlaxInsertText:", v14);

  }
  else if (CRLAccessibilityShouldPerformValidationChecks())
  {
    ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
    if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Need to handle position > -1"), v7, v8, v9, v10, v11, v13))abort();
  }

}

- (unint64_t)_crlaxSpeakThisVisibleStorageOffset
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  void *v46;
  unint64_t v47;
  __int128 v49;
  __int128 v50;
  __int128 v51;

  -[CRLTextRepAccessibility crlaxCGRectValueForKey:](self, "crlaxCGRectValueForKey:", CFSTR("_accessibilityVisibleFrame"));
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "crlaxTarget"));
  objc_msgSend(v12, "convertRect:fromView:", 0, v4, v6, v8, v10);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v21, "crlaxConvertBoundsToUnscaledRect:", v14, v16, v18, v20);
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v29 = v28;

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v30, "convertNaturalRectFromUnscaledCanvas:", v23, v25, v27, v29);
  v32 = v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  LODWORD(v12) = objc_msgSend(v35, "textIsVertical");

  if ((_DWORD)v12)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "closestColumnForPoint:", v32, v34));

    if (v37)
    {
      objc_msgSend(v37, "transformFromWP");
      v38 = *((double *)&v49 + 1);
      v39 = *(double *)&v49;
      v40 = *((double *)&v50 + 1);
      v41 = *(double *)&v50;
      v42 = *((double *)&v51 + 1);
      v43 = *(double *)&v51;
    }
    else
    {
      v50 = 0u;
      v51 = 0u;
      v49 = 0u;
      v42 = 0.0;
      v40 = 0.0;
      v38 = 0.0;
      v43 = 0.0;
      v41 = 0.0;
      v39 = 0.0;
    }
    v44 = v43 + v34 * v41 + v39 * v32;
    v34 = v42 + v34 * v40 + v38 * v32;

    v32 = v44;
  }
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget", v49, v50, v51));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "layout"));
  v47 = +[CRLWPColumn charIndexForPointWithPinning:inLayoutTarget:](CRLWPColumn, "charIndexForPointWithPinning:inLayoutTarget:", v46, v32, v34);

  return v47;
}

- (id)_accessibilitySpeakThisStringValue
{
  NSUInteger v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSString *v14;
  void *v15;
  NSString *v16;
  void *v17;
  void *v18;
  void *v19;
  NSString *v21;
  NSString *v22;
  void *v23;
  void *v24;
  NSObject *log;
  uint8_t buf[4];
  unsigned int v27;
  __int16 v28;
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;
  __int16 v34;
  void *v35;
  __int16 v36;
  void *v37;
  NSRange v38;
  NSRange v39;
  NSRange v40;
  NSRange v41;

  v3 = -[CRLTextRepAccessibility _crlaxSpeakThisVisibleStorageOffset](self, "_crlaxSpeakThisVisibleStorageOffset");
  -[CRLTextRepAccessibility _crlaxSetLastSpeakThisVisibleStorageOffset:](self, "_crlaxSetLastSpeakThisVisibleStorageOffset:", v3);
  v4 = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
  v6 = (NSUInteger)v4 + v5 - v3;
  if ((unint64_t)v4 > v3)
  {
    v7 = (NSUInteger)v4;
    v8 = v5;
    v9 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E5B0);
    v10 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
    {
      log = v10;
      v40.location = v3;
      v40.length = v6;
      v21 = NSStringFromRange(v40);
      v24 = (void *)objc_claimAutoreleasedReturnValue(v21);
      v41.location = v7;
      v41.length = v8;
      v22 = NSStringFromRange(v41);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      *(_DWORD *)buf = 67110402;
      v27 = v9;
      v28 = 2082;
      v29 = "-[CRLTextRepAccessibility(iOS) _accessibilitySpeakThisStringValue]";
      v30 = 2082;
      v31 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m";
      v32 = 1024;
      v33 = 1299;
      v34 = 2112;
      v35 = v24;
      v36 = 2112;
      v37 = v23;
      _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
        buf,
        0x36u);

    }
    if (qword_10147E370 != -1)
      dispatch_once(&qword_10147E370, &stru_10123E5D0);
    v11 = off_1013D9070;
    if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      sub_100DE87A4(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextRepAccessibility(iOS) _accessibilitySpeakThisStringValue]"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m"));
    v38.location = v3;
    v38.length = v6;
    v14 = NSStringFromRange(v38);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    v39.location = v7;
    v39.length = v8;
    v16 = NSStringFromRange(v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v12, v13, 1299, 0, "Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
      v15,
      v17);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "crlaxSubstringWithRange:", v3, v6));

  return v19;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  NSUInteger location;
  void *v5;
  _BYTE *v6;
  void *v7;
  NSUInteger v8;
  BOOL v9;
  NSUInteger v10;
  NSUInteger v11;
  id v12;
  uint64_t v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSString *v19;
  void *v20;
  NSString *v21;
  void *v22;
  id v23;
  void *v24;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *i;
  void *v29;
  NSUInteger v30;
  NSRange v31;
  char *v32;
  char *v33;
  char *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  NSString *v45;
  void *v46;
  NSString *v47;
  void *v48;
  id obj;
  uint64_t v50;
  NSUInteger range;
  id v52;
  void *v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  NSObject *log;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t v62[128];
  uint8_t buf[4];
  unsigned int v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  const char *v68;
  __int16 v69;
  int v70;
  __int16 v71;
  void *v72;
  __int16 v73;
  void *v74;
  NSRange v75;
  NSRange v76;
  NSRange v77;
  NSRange v78;
  NSRange v79;
  NSRange v80;
  NSRange v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;

  range = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _accessibilitySpeakThisString](self, "_accessibilitySpeakThisString"));
  v6 = objc_msgSend(v5, "length");
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility _accessibilitySpeakThisStringValue](self, "_accessibilitySpeakThisStringValue"));
  v8 = v6 - (_BYTE *)objc_msgSend(v7, "length");

  v9 = location >= v8;
  v10 = location - v8;
  if (v9)
  {
    v11 = -[CRLTextRepAccessibility _crlaxLastSpeakThisVisibleStorageOffset](self, "_crlaxLastSpeakThisVisibleStorageOffset")+ v10;
    v12 = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
    if ((unint64_t)v12 > v11 || (unint64_t)v12 + v13 < v11 + range)
    {
      v14 = +[CRLAssertionHandler _atomicIncrementAssertCount](CRLAssertionHandler, "_atomicIncrementAssertCount");
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E5F0);
      v15 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
      {
        log = v15;
        v79.location = v11;
        v79.length = range;
        v45 = NSStringFromRange(v79);
        v46 = (void *)objc_claimAutoreleasedReturnValue(v45);
        v80.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
        v47 = NSStringFromRange(v80);
        v48 = (void *)objc_claimAutoreleasedReturnValue(v47);
        *(_DWORD *)buf = 67110402;
        v64 = v14;
        v65 = 2082;
        v66 = "-[CRLTextRepAccessibility(iOS) _accessibilityTextRectsForSpeakThisStringRange:]";
        v67 = 2082;
        v68 = "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAc"
              "cessibility+iOS.m";
        v69 = 1024;
        v70 = 1327;
        v71 = 2112;
        v72 = v46;
        v73 = 2112;
        v74 = v48;
        _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "#Assert *** Assertion failure #%u: %{public}s %{public}s:%d Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
          buf,
          0x36u);

      }
      if (qword_10147E370 != -1)
        dispatch_once(&qword_10147E370, &stru_10123E610);
      v16 = off_1013D9070;
      if (os_log_type_enabled((os_log_t)off_1013D9070, OS_LOG_TYPE_ERROR))
        sub_100DE87A4(v16);
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[CRLTextRepAccessibility(iOS) _accessibilityTextRectsForSpeakThisStringRange:]"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Freeform/Source/CRLAccessibility/Text/Accessibility/iOS/CRLTextRepAccessibility+iOS.m"));
      v75.location = v11;
      v75.length = range;
      v19 = NSStringFromRange(v75);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v76.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
      v21 = NSStringFromRange(v76);
      v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
      +[CRLAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](CRLAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 1327, 0, "Adjusted speak this range is outside of rep's storage range: adjusted: %@; rep: %@",
        v20,
        v22);

    }
  }
  else
  {
    range = 0;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v23 = 0;
  if (v11 != 0x7FFFFFFFFFFFFFFFLL && range)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxColumns](self, "crlaxColumns"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = v24;
    v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
    if (v52)
    {
      v50 = *(_QWORD *)v59;
      y = CGRectNull.origin.y;
      width = CGRectNull.size.width;
      height = CGRectNull.size.height;
      v56 = CGRectZero.origin.y;
      v54 = CGRectZero.size.height;
      v55 = CGRectZero.size.width;
      do
      {
        for (i = 0; i != v52; i = (char *)i + 1)
        {
          if (*(_QWORD *)v59 != v50)
            objc_enumerationMutation(obj);
          v29 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
          v77.location = (NSUInteger)objc_msgSend(v29, "crlaxRange");
          v30 = v11;
          v81.location = v11;
          v81.length = range;
          v31 = NSIntersectionRange(v77, v81);
          if (v31.length)
          {
            v32 = (char *)objc_msgSend(v29, "crlaxLineIndexForCharIndex:eol:", v31.location, 0);
            v33 = (char *)objc_msgSend(v29, "crlaxLineIndexForCharIndex:eol:", v31.length + v31.location - 1, 0);
            if (v32 <= v33)
            {
              v34 = v33;
              do
              {
                v78.location = (NSUInteger)objc_msgSend(v29, "crlaxRangeOfLineFragmentAtIndex:", v32);
                -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", NSIntersectionRange(v78, v31).location- (unint64_t)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep"), v78.length);
                v36 = v35;
                v38 = v37;
                v40 = v39;
                v42 = v41;
                v82.origin.x = CGRectNull.origin.x;
                v82.origin.y = y;
                v82.size.width = width;
                v82.size.height = height;
                v84.origin.x = v36;
                v84.origin.y = v38;
                v84.size.width = v40;
                v84.size.height = v42;
                if (!CGRectEqualToRect(v82, v84))
                {
                  v83.origin.y = v56;
                  v83.origin.x = CGRectZero.origin.x;
                  v83.size.height = v54;
                  v83.size.width = v55;
                  v85.origin.x = v36;
                  v85.origin.y = v38;
                  v85.size.width = v40;
                  v85.size.height = v42;
                  if (!CGRectEqualToRect(v83, v85))
                  {
                    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v36, v38, v40, v42));
                    objc_msgSend(v53, "addObject:", v43);

                  }
                }
                ++v32;
              }
              while (v32 <= v34);
            }
          }
          v11 = v30;
        }
        v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v62, 16);
      }
      while (v52);
    }

    v23 = objc_msgSend(v53, "copy");
  }
  return v23;
}

- (BOOL)_crlaxHasTextContent
{
  CRLTextRepAccessibility *v2;
  void *v3;
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSRange v8;
  NSRange v9;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v4 = objc_msgSend(v3, "crlaxRange");
  v6 = v5;
  v8.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](v2, "crlaxStorageRangeOfRep");
  v9.location = (NSUInteger)v4;
  v9.length = v6;
  LOBYTE(v2) = NSIntersectionRange(v8, v9).length != 0;

  return (char)v2;
}

- (void)crlaxPreventSelectedTextRangeChangesForInterval:(double)a3
{
  _QWORD v5[4];
  id v6;
  id location;

  -[CRLTextRepAccessibility crlaxSetPreventSelectedTextRangeChanges:](self, "crlaxSetPreventSelectedTextRangeChanges:", 1);
  objc_initWeak(&location, self);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100184E08;
  v5[3] = &unk_10122D4C0;
  objc_copyWeak(&v6, &location);
  CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v5, a3);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (CGRect)crlaxBoundsForStorageRange:(_NSRange)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGRect result;

  v4 = -[CRLTextRepAccessibility crlaxRepRangeWithStorageRange:](self, "crlaxRepRangeWithStorageRange:", a3.location, a3.length);
  -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v4, v5);
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (id)crlaxAttachmentElementForStorageIndex:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  double v8;
  id v9;
  void *v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "crlaxAttachmentOrFootnoteAtCharIndex:", a3));

  *(_QWORD *)&v8 = objc_opt_class(v6, v7).n128_u64[0];
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxAttachmentElementForAttachment:inTextRep:", v6, self, v8));

  return v10;
}

- (id)accessibilityTextualContext
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  _BOOL4 v6;
  void *v7;
  UIAccessibilityTextualContext v8;

  v2 = objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility accessibilityContainer](self, "accessibilityContainer"));
  if (v2)
  {
    v3 = (void *)v2;
    while (1)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityTextualContext"));

      if (v4)
        break;
      v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityContainer"));

      v3 = (void *)v5;
      if (!v5)
        goto LABEL_5;
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accessibilityTextualContext"));

    v6 = v7 == 0;
  }
  else
  {
LABEL_5:
    v6 = 1;
  }
  if (v6)
    v8 = UIAccessibilityTextualContextWordProcessing;
  else
    v8 = 0;
  return v8;
}

- (unint64_t)_accessibilityPositionInDirection:(int64_t)a3 offset:(unint64_t)a4 forPosition:(unint64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  id v16;

  v8 = -[CRLTextPosition init:]([_TtC8Freeform15CRLTextPosition alloc], "init:", a5);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxTextInputResponder"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "crlaxVoiceControlPositionFromPosition:inDirection:offset:", v8, a3, a4));

  objc_opt_class(_TtC8Freeform15CRLTextPosition, v12);
  v14 = sub_100221D0C(v13, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_msgSend(v15, "location");

  return (unint64_t)v16;
}

- (BOOL)crlaxSupportsPublicCustomRotors
{
  return 0;
}

- (id)accessibilityCustomRotors
{
  -[CRLTextRepAccessibility crlaxSupportsPublicCustomRotors](self, "crlaxSupportsPublicCustomRotors");
  return 0;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  objc_super v16;
  _NSRange result;

  v4 = a3;
  objc_opt_class(_TtC8Freeform12CRLTextRange, v5);
  v7 = sub_100221D0C(v6, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "nsRange");
  }
  else
  {
    v16.receiver = self;
    v16.super_class = (Class)CRLTextRepAccessibility;
    v10 = -[CRLTextRepAccessibility _accessibilityRawRangeForUITextRange:](&v16, "_accessibilityRawRangeForUITextRange:", v4);
  }
  v12 = (NSUInteger)v10;
  v13 = v11;

  v14 = v12;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  uint64_t v8;
  double v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _TtC8Freeform12CRLTextRange *v18;

  length = a3.length;
  location = a3.location;
  v7 = a4;
  *(_QWORD *)&v9 = objc_opt_class(_TtC8Freeform11CRLWPEditor, v8).n128_u64[0];
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController", v9));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "crlaxTarget"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "editorController"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "textInputEditor"));
  v16 = sub_1002223BC(v11, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);

  if (v17)
  {
    v18 = -[CRLTextRange initWithRange:]([_TtC8Freeform12CRLTextRange alloc], "initWithRange:", location, length);
    objc_msgSend(v17, "replace:with:", v18, v7);

  }
  return v17 != 0;
}

- (id)accessibilityDragSourceDescriptors
{
  id v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  id v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  id v30;
  void *v31;
  id v32;
  objc_super v34;
  id v35;

  v3 = -[CRLTextRepAccessibility _accessibilitySelectedTextRange](self, "_accessibilitySelectedTextRange");
  if (!v4)
    goto LABEL_3;
  -[CRLTextRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v3, v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "crlaxTarget"));
  objc_msgSend(v14, "convertRect:fromView:", 0, v6, v8, v10, v12);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  v23 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("Drag Text"), 0, 0));
  v26 = sub_100061400(v16, v18, v20, v22);
  v28 = v27;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v30 = objc_msgSend(v23, "initWithName:point:inView:", v25, v29, v26, v28);

  v35 = v30;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v35, 1));

  if (!v31)
  {
LABEL_3:
    v34.receiver = self;
    v34.super_class = (Class)CRLTextRepAccessibility;
    v32 = -[CRLCanvasRepAccessibility accessibilityDragSourceDescriptors](&v34, "accessibilityDragSourceDescriptors");
    v31 = (void *)objc_claimAutoreleasedReturnValue(v32);
  }
  return v31;
}

- (id)accessibilityDropPointDescriptors
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
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
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  id v32;
  void *v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  id v39;
  void *v40;
  id v41;
  objc_super v43;
  id v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "selection"));
  v5 = objc_msgSend(v4, "isInsertionPoint");

  if (!v5)
    goto LABEL_5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  objc_msgSend(v6, "caretRect");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v45.origin.x = v8;
  v45.origin.y = v10;
  v45.size.width = v12;
  v45.size.height = v14;
  if (CGRectIsNull(v45))
    goto LABEL_5;
  v47.origin.x = CGRectZero.origin.x;
  v47.origin.y = CGRectZero.origin.y;
  v47.size.width = CGRectZero.size.width;
  v47.size.height = CGRectZero.size.height;
  v46.origin.x = v8;
  v46.origin.y = v10;
  v46.size.width = v12;
  v46.size.height = v14;
  if (CGRectEqualToRect(v46, v47))
    goto LABEL_5;
  -[CRLCanvasRepAccessibility crlaxConvertNaturalRectToUnscaledCanvas:](self, "crlaxConvertNaturalRectToUnscaledCanvas:", v8, v10, v12, v14);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_msgSend(v23, "crlaxConvertUnscaledToBoundsRect:", v16, v18, v20, v22);
  v25 = v24;
  v27 = v26;
  v29 = v28;
  v31 = v30;

  v32 = objc_alloc((Class)UIAccessibilityLocationDescriptor);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("Drop Text"), 0, 0));
  v35 = sub_100061400(v25, v27, v29, v31);
  v37 = v36;
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxCanvasView](self, "crlaxCanvasView"));
  v39 = objc_msgSend(v32, "initWithName:point:inView:", v34, v38, v35, v37);

  v44 = v39;
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v44, 1));

  if (!v40)
  {
LABEL_5:
    v43.receiver = self;
    v43.super_class = (Class)CRLTextRepAccessibility;
    v41 = -[CRLCanvasRepAccessibility accessibilityDropPointDescriptors](&v43, "accessibilityDropPointDescriptors");
    v40 = (void *)objc_claimAutoreleasedReturnValue(v41);
  }
  return v40;
}

- (void)_cleanupRotorCache
{
  objc_super v3;

  if (!-[CRLTextRepAccessibility crlaxPreventRotorCacheCleanup](self, "crlaxPreventRotorCacheCleanup"))
  {
    v3.receiver = self;
    v3.super_class = (Class)CRLTextRepAccessibility;
    -[CRLTextRepAccessibility _cleanupRotorCache](&v3, "_cleanupRotorCache");
  }
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  void *v3;
  unsigned int v4;

  if (-[CRLCanvasRepAccessibility crlaxIsSelected](self, "crlaxIsSelected")
    || -[CRLCanvasRepAccessibility crlaxIsSelectedIgnoringLocking](self, "crlaxIsSelectedIgnoringLocking"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v4 = objc_msgSend(v3, "isBeingEdited") ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

+ (id)crlaxTargetClassName
{
  return CFSTR("CRLWPRep");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLGroupRepAccessibility, a2);
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v3 = a3;
  objc_opt_class(CRLTextRepAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);

  return v7;
}

- (CRLRepAccessibilitySelectionRangeCache)crlaxLastSelection
{
  return (CRLRepAccessibilitySelectionRangeCache *)__CRLAccessibilityGetAssociatedObject(self, &unk_101415378);
}

- (void)crlaxSetLastSelection:(id)a3
{
  __CRLAccessibilitySetAssociatedObject(self, &unk_101415378, a3);
}

- (CRLWPRep)crlaxRetainedTarget
{
  CRLCanvasRep *v2;
  void *v3;
  uint64_t v4;
  objc_class *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CRLTextRepAccessibility;
  v2 = -[CRLCanvasRepAccessibility crlaxRetainedTarget](&v10, "crlaxRetainedTarget");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(CRLWPRep, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v11)
    abort();
  v8 = (void *)v7;

  return (CRLWPRep *)v8;
}

- (id)crlaxLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "info"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxValueForKey:", CFSTR("crlaxString")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxCollaboratorDescription](self, "crlaxCollaboratorDescription"));
  v13 = __CRLAccessibilityStringForVariables(1, v5, v7, v8, v9, v10, v11, v12, (uint64_t)v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

  return v14;
}

- (BOOL)crlaxIsBeingEdited
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxRetainedTarget](self, "crlaxRetainedTarget"));
  v3 = objc_msgSend(v2, "isBeingEdited");

  return v3;
}

- (BOOL)crlaxIsLockedDirectly
{
  void *v3;
  unsigned __int8 v4;
  unsigned __int8 v5;
  void *v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  char v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
  v4 = objc_msgSend(v3, "crlaxIsLockedDirectly");

  if ((v4 & 1) != 0)
    return 1;
  v13 = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInfo](self, "crlaxInfo"));
  objc_opt_class(NSObject, v7);
  v9 = __CRLAccessibilityCastAsClassAndProtocol(v8, (Protocol *)&OBJC_PROTOCOL___CRLCanvasLockableElementInfo, v6, 1, &v13);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (v13)
    abort();
  v11 = (void *)v10;

  if (v11)
    v5 = objc_msgSend(v11, "locked");
  else
    v5 = 0;

  return v5;
}

- (BOOL)crlaxIsDecorativeElement
{
  void *v3;
  char isKindOfClass;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxRepForSelecting](self, "crlaxRepForSelecting"));
  if (v3 || -[CRLCanvasRepAccessibility crlaxIsLocked](self, "crlaxIsLocked"))
  {
    isKindOfClass = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
    objc_opt_class(CRLWPShapeRep, v6);
    isKindOfClass = objc_opt_isKindOfClass(v5, v7);

  }
  return isKindOfClass & 1;
}

- (_NSRange)crlaxStorageRangeOfRep
{
  void *v2;
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "range");
  v5 = v4;

  v6 = (NSUInteger)v3;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "storage"));

  objc_opt_class(CRLWPStorageAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (CRLWPStorageAccessibility *)v8;
}

- (CRLTextEditorAccessibility)crlaxTextEditor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  char v13;

  if (-[CRLTextRepAccessibility crlaxIsBeingEdited](self, "crlaxIsBeingEdited"))
  {
    v13 = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxTarget"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "editorController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textInputEditor"));

    objc_opt_class(CRLTextEditorAccessibility, v7);
    v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v6, 1, &v13);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (v13)
      abort();
    v11 = (void *)v10;

  }
  else
  {
    v11 = 0;
  }
  return (CRLTextEditorAccessibility *)v11;
}

- (BOOL)crlaxIsSelectionHighlightSuppressed
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "isSelectionHighlightSuppressed");

  return v3;
}

- (NSArray)crlaxColumns
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
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "columns"));

  objc_opt_class(NSArray, v4);
  v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return (NSArray *)v8;
}

- (BOOL)crlaxJumpToNextInferredHeading
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v4 = objc_msgSend(v3, "crlaxSelectedTextRange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  objc_msgSend(v5, "crlaxNextInferredHeadingRangeFromCharacterIndex:wrap:", v4, 1);

  return 0;
}

- (BOOL)crlaxJumpToPreviousInferredHeading
{
  void *v3;
  id v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTextEditor](self, "crlaxTextEditor"));
  v4 = objc_msgSend(v3, "crlaxSelectedTextRange");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  objc_msgSend(v5, "crlaxPreviousInferredHeadingRangeFromCharacterIndex:wrap:", v4, 1);

  return 0;
}

- (id)crlaxSelectionPathForTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  char v18;

  length = a3.length;
  location = a3.location;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  v18 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "crlaxTarget"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectionModelTranslator"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "crlaxTarget"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "selectionPathForRange:onStorage:", location, length, v10));

  objc_opt_class(CRLSelectionPathAccessibility, v12);
  v14 = __CRLAccessibilityCastAsSafeCategory(v13, (uint64_t)v11, 1, &v18);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (v18)
    abort();
  v16 = (void *)v15;

  return v16;
}

- (NSSet)crlaxSiblings
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "siblings"));

  return (NSSet *)v3;
}

- (NSArray)crlaxAccessibilityLabelCustomAttributes
{
  void *v3;
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v5 = objc_msgSend(v4, "textIsVertical");

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("Vertical text"), 0, 0));

    objc_msgSend(v3, "addObject:", v7);
  }
  return (NSArray *)v3;
}

- (id)crlaxStringForNumberAttachment:(id)a3
{
  id v4;
  void *v5;
  __CFString *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxAttachmentNumberProvider](self, "crlaxAttachmentNumberProvider"));
  if (v5)
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringEquivalentWithNumberProvider:", v5));
  else
    v6 = &stru_1012A72B0;

  return v6;
}

- (CRLTextInteractiveCanvasControllerAccessibility)crlaxInteractiveCanvasController
{
  CRLCanvasInteractiveCanvasControllerAccessibility *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v10;
  char v11;

  v11 = 0;
  v10.receiver = self;
  v10.super_class = (Class)CRLTextRepAccessibility;
  v2 = -[CRLCanvasRepAccessibility crlaxInteractiveCanvasController](&v10, "crlaxInteractiveCanvasController");
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v11);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v11)
    abort();
  v8 = (void *)v7;

  return (CRLTextInteractiveCanvasControllerAccessibility *)v8;
}

- (id)crlaxCollaboratorDescription
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxCollaboratorDescriptionDirect](self, "crlaxCollaboratorDescriptionDirect"));
  if (!objc_msgSend(v3, "length"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](self, "crlaxParentRep"));
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "crlaxCollaboratorDescriptionDirect"));

    v3 = (void *)v5;
  }
  return v3;
}

- (id)crlaxCollaboratorDescriptionDirect
{
  NSString *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)CRLTextRepAccessibility;
  v3 = -[CRLCanvasRepAccessibility crlaxCollaboratorDescriptionDirect](&v14, "crlaxCollaboratorDescriptionDirect");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = objc_msgSend(v5, "isShowingCaret");

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxTarget](self, "crlaxTarget"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "p_currentCollaboratorPresence"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "displayName"));

    if (objc_msgSend(v9, "length"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("Edited by %@"), 0, 0));

      v12 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v11, v9));
      v4 = (void *)v12;
    }

  }
  return v4;
}

- (id)crlaxBeginEditingRangeInStorage:(_NSRange)a3 chosenTextRepReference:(id *)a4
{
  NSUInteger length;
  id location;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CRLTextRepAccessibility *v14;
  uint64_t v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  CRLTextRepAccessibility *v28;
  id v29;
  id *v30;
  id v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  id v55;
  char v56;

  length = a3.length;
  location = (id)a3.location;
  if (CRLAccessibilityShouldPerformValidationChecks())
  {
    if (-[CRLCanvasRepAccessibility crlaxInReadOnlyMode](self, "crlaxInReadOnlyMode"))
    {
      ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Should not attempt to begin editing in read-only mode"), v9, v10, v11, v12, v13, v50))goto LABEL_18;
    }
  }
  v14 = self;
  *(_QWORD *)&v16 = objc_opt_class(CRLWPShapeRepAccessibility, v15).n128_u64[0];
  v18 = v17;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxParentRep](v14, "crlaxParentRep", v16));
  v20 = __CRLAccessibilityCastAsSafeCategory(v18, (uint64_t)v19, 0, 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);

  v56 = 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CRLCanvasRepAccessibility crlaxInfo](v14, "crlaxInfo"));
  objc_opt_class(CRLWPStorageAccessibility, v23);
  v25 = __CRLAccessibilityCastAsSafeCategory(v24, (uint64_t)v22, 1, &v56);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (v56)
    goto LABEL_18;
  v27 = (void *)v26;

  v28 = v14;
  if (v21)
  {
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1002C9BB0;
    v53[3] = &unk_10122D3D8;
    v29 = v21;
    v54 = v29;
    v55 = v27;
    if (__CRLAccessibilityPerformSafeBlock((uint64_t)v53))
      goto LABEL_18;

    v28 = (CRLTextRepAccessibility *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "crlaxContainedRep"));
  }
  v51 = v27;
  v52 = v21;
  v30 = a4;
  if (location == (id)0x7FFFFFFFFFFFFFFFLL && length == 0)
  {
    location = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](v14, "crlaxStorageRangeOfRep");
    length = 0;
  }
  v32 = -[CRLTextRepAccessibility crlaxClampRangeToStorageRange:](v14, "crlaxClampRangeToStorageRange:", location, length);
  v34 = v33;
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](v14, "crlaxInteractiveCanvasController"));
  v56 = 0;
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "crlaxTarget"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "selectionModelTranslator"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](v28, "crlaxStorage"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "crlaxTarget"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "selectionPathForRange:onStorage:", v32, v34, v39));

  objc_opt_class(CRLSelectionPathAccessibility, v41);
  v43 = __CRLAccessibilityCastAsSafeCategory(v42, (uint64_t)v40, 1, &v56);
  v44 = objc_claimAutoreleasedReturnValue(v43);
  if (v56)
LABEL_18:
    abort();
  v45 = (void *)v44;

  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "crlaxEditorController"));
  objc_msgSend(v46, "crlaxSetSelectionPath:", v45);

  if (v30)
    *v30 = objc_retainAutorelease(v28);
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "crlaxEditorController"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "crlaxTextInputEditor"));

  return v48;
}

- (_NSRange)crlaxClampRangeToStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  NSRange v6;
  NSRange v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;
  NSRange v11;

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v6.location = (NSUInteger)objc_msgSend(v5, "crlaxRange");
  if (location + length != v6.location + v6.length)
  {
    v11.location = location;
    v11.length = length;
    v7 = NSIntersectionRange(v6, v11);
    location = v7.location;
    length = v7.length;
  }

  v8 = location;
  v9 = length;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)crlaxContentSiblingInDirection:(unint64_t)a3
{
  void *v5;
  char *v6;
  char *v7;
  uint64_t v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxSortedSiblingsByStorageRange](self, "crlaxSortedSiblingsByStorageRange"));
  v6 = (char *)objc_msgSend(v5, "indexOfObject:", self);
  v7 = v6;
  if (a3 == 1 && v6)
  {
    v8 = -1;
  }
  else
  {
    if (a3 || v6 >= (char *)objc_msgSend(v5, "count") - 1)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v8 = 1;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", &v7[v8]));
LABEL_9:

  return v9;
}

- (id)crlaxSortedSiblingsByStorageRange
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxSiblings](self, "crlaxSiblings"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "allObjects"));
  v5 = objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "addObject:", self);
  objc_msgSend(v5, "sortUsingComparator:", &stru_10124D608);
  v6 = objc_msgSend(v5, "copy");

  return v6;
}

- (_NSRange)crlaxRepRangeWithStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = -[CRLTextRepAccessibility crlaxRepPositionWithStoragePosition:](self, "crlaxRepPositionWithStoragePosition:", a3.location);
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)crlaxRepPositionWithStoragePosition:(unint64_t)a3
{
  return a3 - (_QWORD)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
}

- (_NSRange)crlaxStorageRangeWithRepRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = -[CRLTextRepAccessibility crlaxStoragePositionWithRepPosition:](self, "crlaxStoragePositionWithRepPosition:", a3.location);
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)crlaxStoragePositionWithRepPosition:(unint64_t)a3
{
  return (unint64_t)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep") + a3;
}

- (id)crlaxColumnForCharIndex:(unint64_t)a3
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[7];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  char v17;

  v17 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = sub_1002CA018;
  v15 = sub_1002CA028;
  v16 = 0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1002CA030;
  v10[3] = &unk_10122DC18;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v10))
    abort();
  v3 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  objc_opt_class(CRLColumnAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v17);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v17)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (id)crlaxAttachmentNumberProvider
{
  return 0;
}

- (void)crlaxLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  char v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CRLTextRepAccessibility;
  -[CRLTextRepAccessibility crlaxLoadAccessibilityInformation](&v13, "crlaxLoadAccessibilityInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v12 = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxInteractiveCanvasController](self, "crlaxInteractiveCanvasController"));
  objc_opt_class(CRLTextInteractiveCanvasControllerAccessibility, v5);
  v7 = __CRLAccessibilityCastAsSafeCategory(v6, (uint64_t)v4, 1, &v12);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (v12)
    abort();
  v9 = (void *)v8;

  if (v3 && v9)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_1002CA16C;
    v10[3] = &unk_10124D630;
    v11 = v9;
    objc_msgSend(v3, "crlaxEnumerateSmartFieldsUsingBlock:", v10);

  }
}

- (id)crlaxSummaryDescription
{
  void *v3;
  void *v4;
  NSMutableArray *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  NSMutableArray *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  _QWORD v29[4];
  NSMutableArray *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  NSRange v36;
  NSRange v37;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "crlaxInferredHeadingRanges"));

  if (objc_msgSend(v4, "count"))
  {
    v5 = objc_opt_new(NSMutableArray);
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v34 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v32;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v32 != v9)
            objc_enumerationMutation(v6);
          v11 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * (_QWORD)v10), "rangeValue");
          v13 = v12;
          v37.location = (NSUInteger)-[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
          v37.length = v14;
          v36.location = (NSUInteger)v11;
          v36.length = v13;
          if (NSIntersectionRange(v36, v37).length)
          {
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxStorage](self, "crlaxStorage"));
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "crlaxSubstringWithRange:", v11, v13));
            -[NSMutableArray addObject:](v5, "addObject:", v16);

          }
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      }
      while (v8);
    }

    if (-[NSMutableArray count](v5, "count"))
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v5, "componentsJoinedByString:", CFSTR(", ")));
    else
      v17 = 0;

  }
  else
  {
    v17 = 0;
  }
  if (!objc_msgSend(v17, "length")
    && -[CRLTextRepAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxSubstringInStorageWithRange:", &OBJC_PROTOCOL___CRLTextRepAccessibilityExtras))
  {
    v18 = -[CRLTextRepAccessibility crlaxStorageRangeOfRep](self, "crlaxStorageRangeOfRep");
    v20 = objc_claimAutoreleasedReturnValue(-[CRLTextRepAccessibility crlaxSubstringInStorageWithRange:](self, "crlaxSubstringInStorageWithRange:", v18, v19));

    v17 = (void *)v20;
  }
  if (!objc_msgSend(v17, "length"))
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRepAccessibility crlaxChildReps](self, "crlaxChildReps"));
    v22 = objc_msgSend(v21, "count");

    if (v22)
    {
      v23 = objc_opt_new(NSMutableArray);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CRLGroupRepAccessibility crlaxChildReps](self, "crlaxChildReps"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "sortedArrayUsingComparator:", &stru_10124D650));

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_1002CA57C;
      v29[3] = &unk_10124D678;
      v30 = v23;
      v26 = v23;
      objc_msgSend(v25, "crlaxPerformBlock:onElementsOfType:", v29, +[CRLAccessibilitySafeCategory crlaxTargetClass](CRLCanvasRepAccessibility, "crlaxTargetClass"));
      v27 = objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v26, "componentsJoinedByString:", CFSTR(", ")));

      v17 = (void *)v27;
    }
  }

  return v17;
}

- (void)pulseCaret
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CRLTextRepAccessibility;
  -[CRLTextRepAccessibility pulseCaret](&v3, "pulseCaret");
  if (-[CRLTextRepAccessibility crlaxRespondsToSelector:fromExtrasProtocol:](self, "crlaxRespondsToSelector:fromExtrasProtocol:", "crlaxDidPulseCaret", &OBJC_PROTOCOL___CRLTextRepAccessibilityExtras))-[CRLTextRepAccessibility crlaxDidPulseCaret](self, "crlaxDidPulseCaret");
}

- (NSString)crlaxAccessibilityLabelCustomAttributesString
{
  return self->_crlaxAccessibilityLabelCustomAttributesString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_crlaxAccessibilityLabelCustomAttributesString, 0);
}

@end
