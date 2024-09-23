@implementation THWPRepAccessibility

- (id)_thaxCachedHighlightsRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A24);
}

- (void)_thaxSetCachedHighlightsRotorItems:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A24, a3);
}

- (id)_thaxCachedGlossaryTermsRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A25);
}

- (void)_thaxSetCachedGlossaryTermsRotorItems:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A25, a3);
}

- (id)_thaxCachedLinksRotorItems
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A26);
}

- (void)_thaxSetCachedLinksRotorItems:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A26, a3);
}

- (id)_thaxStoredHighlightsRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A27);
}

- (void)_thaxSetStoredHighlightsRotor:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A27, a3);
}

- (id)_thaxStoredGlossaryTermsRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A28);
}

- (void)_thaxSetStoredGlossaryTermsRotor:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A28, a3);
}

- (id)_thaxStoredLinksRotor
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_543A29);
}

- (void)_thaxSetStoredLinksRotor:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A29, a3);
}

- (BOOL)thaxIsPageNumberTextRep
{
  id v3;
  id v4;
  TSWPStorageAccessibility *v5;
  uint64_t v6;
  unint64_t v7;

  v3 = objc_msgSend(-[THWPRepAccessibility thaxPageController](self, "thaxPageController"), "thaxCurrentAbsolutePageIndex");
  if (v3 == (id)0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v4 = v3;
  v5 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  if (-[TSWPStorageAccessibility tsaxRange](v5, "tsaxRange"))
    return 0;
  v7 = (unint64_t)v4 + 1;
  if (v6 != (unint64_t)(floor(log10((double)v7)) + 1.0))
    return 0;
  else
    return -[NSString isEqualToString:](-[TSWPStorageAccessibility tsaxString](v5, "tsaxString"), "isEqualToString:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%lu"), v7));
}

- (NSString)thaxFormattedPageNumberString
{
  NSString *v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);
  void (*v9)(uint64_t);
  uint64_t v10;

  v5 = 0;
  v6 = &v5;
  v7 = 0x3052000000;
  v8 = sub_25FE30;
  v9 = sub_25FE40;
  v10 = 0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_25FE4C;
  v4[3] = &unk_42BF18;
  v4[4] = self;
  v4[5] = &v5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v4))
    abort();
  v2 = (NSString *)v6[5];
  _Block_object_dispose(&v5, 8);
  return v2;
}

- (void)thaxHighlightsDidChange
{
  -[THWPRepAccessibility _thaxSetCachedHighlightsRotorItems:](self, "_thaxSetCachedHighlightsRotorItems:", 0);
}

- (void)thaxEnumerateHighlightsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  id v7;
  _QWORD v8[8];
  _QWORD v9[4];

  length = a3.length;
  location = a3.location;
  v7 = objc_msgSend(-[THWPRepAccessibility _thaxHighlightController](self, "_thaxHighlightController"), "thaxAnnotationCache");
  if (v7)
  {
    v9[0] = 0;
    v9[1] = v9;
    v9[2] = 0x2020000000;
    v9[3] = 0;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_25FF44;
    v8[3] = &unk_43C528;
    v8[6] = location;
    v8[7] = length;
    v8[4] = a4;
    v8[5] = v9;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v8);
    _Block_object_dispose(v9, 8);
  }
}

- (void)thaxEnumerateGlossaryTermsInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorageAccessibility *v8;
  void *v9;
  Class v10;
  _QWORD v11[8];
  _QWORD v12[4];

  length = a3.length;
  location = a3.location;
  v8 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v9 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
  v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), 0, 0);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_260100;
    v11[3] = &unk_43C550;
    v11[4] = v10;
    v11[5] = self;
    v11[6] = a4;
    v11[7] = v12;
    -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v8, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v11);
  }
  _Block_object_dispose(v12, 8);
}

- (void)thaxEnumerateLinksInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorageAccessibility *v8;
  void *v9;
  Class v10;
  _QWORD v11[8];
  _QWORD v12[4];

  length = a3.length;
  location = a3.location;
  v8 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v9 = (void *)objc_opt_class(THInteractiveCanvasControllerAccessibility);
  v10 = __TSAccessibilityCastAsSafeCategory(v9, (uint64_t)-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), 0, 0);
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x2020000000;
  v12[3] = 0;
  if (v10)
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_2602B8;
    v11[3] = &unk_43C550;
    v11[4] = v10;
    v11[5] = self;
    v11[6] = a4;
    v11[7] = v12;
    -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v8, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v11);
  }
  _Block_object_dispose(v12, 8);
}

- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  _QWORD v8[6];
  _QWORD v9[7];
  _QWORD v10[6];
  objc_super v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  length = a3.length;
  location = a3.location;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_260524;
  v12[3] = &unk_43C578;
  v12[4] = a4;
  v12[5] = &v13;
  v11.receiver = self;
  v11.super_class = (Class)THWPRepAccessibility;
  -[TSWPRepAccessibility tsaxEnumerateSpecialTextTokensInRange:usingBlock:](&v11, "tsaxEnumerateSpecialTextTokensInRange:usingBlock:", a3.location, a3.length, v12);
  if (!*((_BYTE *)v14 + 24))
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_260574;
    v10[3] = &unk_43C5A0;
    v10[4] = a4;
    v10[5] = &v13;
    -[THWPRepAccessibility thaxEnumerateHighlightsInRange:usingBlock:](self, "thaxEnumerateHighlightsInRange:usingBlock:", location, length, v10);
    if (!*((_BYTE *)v14 + 24))
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_260604;
      v9[3] = &unk_43C5C8;
      v9[4] = THAccessibilityLocalizedString((uint64_t)CFSTR("glossary.term"));
      v9[5] = a4;
      v9[6] = &v13;
      -[THWPRepAccessibility thaxEnumerateGlossaryTermsInRange:usingBlock:](self, "thaxEnumerateGlossaryTermsInRange:usingBlock:", location, length, v9);
      if (!*((_BYTE *)v14 + 24))
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_26066C;
        v8[3] = &unk_43C5F0;
        v8[4] = a4;
        v8[5] = &v13;
        -[THWPRepAccessibility thaxEnumerateLinksInRange:usingBlock:](self, "thaxEnumerateLinksInRange:usingBlock:", location, length, v8);
      }
    }
  }
  _Block_object_dispose(&v13, 8);
}

- (id)accessibilityLabel
{
  if (-[THWPRepAccessibility thaxIsPageNumberTextRep](self, "thaxIsPageNumberTextRep"))
    return THAccessibilityLocalizedString((uint64_t)CFSTR("page.number.no.format"));
  else
    return 0;
}

- (BOOL)_accessibilityIncludeDuringContentReading
{
  _BOOL4 v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)THWPRepAccessibility;
  v3 = -[THTSWPRepAccessibility _accessibilityIncludeDuringContentReading](&v5, "_accessibilityIncludeDuringContentReading");
  if (v3)
    LOBYTE(v3) = !-[THWPRepAccessibility thaxIsPageNumberTextRep](self, "thaxIsPageNumberTextRep");
  return v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v8;
  TSWPStorageAccessibility *v9;
  id v10;
  uint64_t v11;
  id result;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  if (!-[THTSWPRepAccessibility isAccessibilityElement](self, "isAccessibilityElement")
    || (-[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxConvertBoundsToUnscaledPoint:", x, y), -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:"), v8 = -[THWPRepAccessibility charIndexForPointWithPinning:](self, "charIndexForPointWithPinning:"), v9 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), v10 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep"), (result = -[TSWPStorageAccessibility tsaxSmartFieldNearestToCharIndex:inStorageRange:](v9, "tsaxSmartFieldNearestToCharIndex:inStorageRange:", v8, v10, v11)) == 0))
  {
    v13.receiver = self;
    v13.super_class = (Class)THWPRepAccessibility;
    return -[THWPRepAccessibility _accessibilityHitTest:withEvent:](&v13, "_accessibilityHitTest:withEvent:", a4, x, y);
  }
  return result;
}

- (id)accessibilityCustomRotors
{
  id v3;
  id v4;
  id v5;
  id v6;

  v3 = +[NSMutableArray array](NSMutableArray, "array");
  v4 = -[THWPRepAccessibility _thaxHighlightsRotor](self, "_thaxHighlightsRotor");
  if (v4)
    objc_msgSend(v3, "addObject:", v4);
  v5 = -[THWPRepAccessibility _thaxLinksRotor](self, "_thaxLinksRotor");
  if (v5)
    objc_msgSend(v3, "addObject:", v5);
  v6 = -[THWPRepAccessibility _thaxGlossaryTermsRotor](self, "_thaxGlossaryTermsRotor");
  if (v6)
    objc_msgSend(v3, "addObject:", v6);
  return objc_msgSend(v3, "copy");
}

- (id)_thaxHighlightsRotor
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[6];

  if (!objc_msgSend(-[THWPRepAccessibility _thaxHighlightsRotorItems](self, "_thaxHighlightsRotorItems"), "count"))
    return 0;
  v3 = -[THWPRepAccessibility _thaxStoredHighlightsRotor](self, "_thaxStoredHighlightsRotor");
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_25FE30;
    v6[4] = sub_25FE40;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_2609FC;
    v5[3] = &unk_43C618;
    v5[4] = v6;
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", THAccessibilityLocalizedString((uint64_t)CFSTR("highlights.menu.title")), v5);
    -[THWPRepAccessibility _thaxSetStoredHighlightsRotor:](self, "_thaxSetStoredHighlightsRotor:", v3);
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_thaxLinksRotor
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[6];

  if (!objc_msgSend(-[THWPRepAccessibility _thaxLinksRotorItems](self, "_thaxLinksRotorItems"), "count"))
    return 0;
  v3 = -[THWPRepAccessibility _thaxStoredLinksRotor](self, "_thaxStoredLinksRotor");
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_25FE30;
    v6[4] = sub_25FE40;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_260B44;
    v5[3] = &unk_43C618;
    v5[4] = v6;
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", THAccessibilityLocalizedString((uint64_t)CFSTR("links.menu.title")), v5);
    -[THWPRepAccessibility _thaxSetStoredLinksRotor:](self, "_thaxSetStoredLinksRotor:", v3);
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_thaxGlossaryTermsRotor
{
  id v3;
  _QWORD v5[5];
  _QWORD v6[6];

  if (!objc_msgSend(-[THWPRepAccessibility _thaxGlossaryTermsRotorItems](self, "_thaxGlossaryTermsRotorItems"), "count"))return 0;
  v3 = -[THWPRepAccessibility _thaxStoredGlossaryTermsRotor](self, "_thaxStoredGlossaryTermsRotor");
  if (!v3)
  {
    v6[0] = 0;
    v6[1] = v6;
    v6[2] = 0x3052000000;
    v6[3] = sub_25FE30;
    v6[4] = sub_25FE40;
    v6[5] = self;
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_260C8C;
    v5[3] = &unk_43C618;
    v5[4] = v6;
    v3 = objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotor), "initWithName:itemSearchBlock:", THAccessibilityLocalizedString((uint64_t)CFSTR("glossary.terms.menu.title")), v5);
    -[THWPRepAccessibility _thaxSetStoredGlossaryTermsRotor:](self, "_thaxSetStoredGlossaryTermsRotor:", v3);
    _Block_object_dispose(v6, 8);
  }
  return v3;
}

- (id)_accessibilityTextRangeFromNSRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  objc_class *v5;
  id result;
  char v7;

  length = a3.length;
  location = a3.location;
  v7 = 0;
  v5 = (objc_class *)objc_opt_class(UITextRange);
  result = (id)__TSAccessibilityCastAsClass(v5, (uint64_t)+[TSDTextRangeAccessibility tsaxNewTextRangeWithRange:](TSDTextRangeAccessibility, "tsaxNewTextRangeWithRange:", location, length), 1, &v7);
  if (v7)
    abort();
  return result;
}

- (_NSRange)_accessibilityRawRangeForUITextRange:(id)a3
{
  void *v5;
  Class v6;
  id v7;
  NSUInteger v8;
  objc_super v9;
  _NSRange result;

  v5 = (void *)objc_opt_class(TSDTextRangeAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)a3, 0, 0);
  if (v6)
  {
    v7 = -[objc_class tsaxRange](v6, "tsaxRange");
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)THWPRepAccessibility;
    v7 = -[THWPRepAccessibility _accessibilityRawRangeForUITextRange:](&v9, "_accessibilityRawRangeForUITextRange:", a3);
  }
  result.length = v8;
  result.location = (NSUInteger)v7;
  return result;
}

- (id)_thaxRotorItemForPredicate:(id)a3 fromItems:(id)a4
{
  char *v7;
  void *v8;
  Class v9;
  Class v10;
  _BYTE *v11;
  BOOL v12;
  unint64_t v13;
  _BYTE *v15;
  uint64_t v16;
  _QWORD v17[5];
  char v18;

  v7 = (char *)objc_msgSend(a3, "searchDirection");
  v18 = 0;
  v8 = (void *)objc_opt_class(TSDTextRangeAccessibility);
  v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)objc_msgSend(objc_msgSend(a3, "currentItem"), "targetRange"), 1, &v18);
  if (v18)
    abort();
  v10 = v9;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_260F24;
  v17[3] = &unk_43C640;
  v17[4] = v9;
  v11 = objc_msgSend(a4, "indexOfObjectPassingTest:", v17);
  if (v10)
    v12 = v11 == (_BYTE *)0x7FFFFFFFFFFFFFFFLL;
  else
    v12 = 1;
  if (v12)
  {
    v13 = 0;
  }
  else
  {
    v15 = v11;
    if (v7 != (_BYTE *)&dword_0 + 1 && !v11)
      return 0;
    if (v7 == (_BYTE *)&dword_0 + 1)
    {
      if (v11 == (char *)objc_msgSend(a4, "count") - 1)
        return 0;
      v16 = 1;
    }
    else
    {
      v16 = -1;
    }
    v13 = (unint64_t)&v15[v16];
    if (&v15[v16] == (_BYTE *)0x7FFFFFFFFFFFFFFFLL)
      return 0;
  }
  if (v13 < (unint64_t)objc_msgSend(a4, "count"))
    return objc_msgSend(objc_alloc((Class)UIAccessibilityCustomRotorItemResult), "initWithTargetElement:targetRange:", self, objc_msgSend(a4, "objectAtIndexedSubscript:", v13));
  return 0;
}

- (void)tsaxChildWillBeRemoved:(id)a3
{
  objc_super v5;

  objc_msgSend(-[THWPRepAccessibility _thaxCachedHighlightsRotorItems](self, "_thaxCachedHighlightsRotorItems"), "enumerateObjectsUsingBlock:", &stru_43C680);
  objc_msgSend(-[THWPRepAccessibility _thaxCachedGlossaryTermsRotorItems](self, "_thaxCachedGlossaryTermsRotorItems"), "enumerateObjectsUsingBlock:", &stru_43C6A0);
  objc_msgSend(-[THWPRepAccessibility _thaxCachedLinksRotorItems](self, "_thaxCachedLinksRotorItems"), "enumerateObjectsUsingBlock:", &stru_43C6C0);
  -[THWPRepAccessibility _thaxSetCachedGlossaryTermsRotorItems:](self, "_thaxSetCachedGlossaryTermsRotorItems:", 0);
  -[THWPRepAccessibility _thaxSetCachedHighlightsRotorItems:](self, "_thaxSetCachedHighlightsRotorItems:", 0);
  -[THWPRepAccessibility _thaxSetCachedLinksRotorItems:](self, "_thaxSetCachedLinksRotorItems:", 0);
  v5.receiver = self;
  v5.super_class = (Class)THWPRepAccessibility;
  -[TSDRepAccessibility tsaxChildWillBeRemoved:](&v5, "tsaxChildWillBeRemoved:", a3);
}

- (id)_thaxHighlightController
{
  void *v3;
  id result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPHighlightControllerAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("highlightController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (id)_thaxGlossaryTermsRotorItems
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[6];

  if (!-[THWPRepAccessibility _thaxCachedGlossaryTermsRotorItems](self, "_thaxCachedGlossaryTermsRotorItems"))
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_26114C;
    v7[3] = &unk_43C6E8;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateGlossaryTermsInRange:usingBlock:](self, "thaxEnumerateGlossaryTermsInRange:usingBlock:", v4, v5, v7);
    objc_msgSend(v3, "sortUsingSelector:", "tsaxCompareTextRangeByLocation:");
    -[THWPRepAccessibility _thaxSetCachedGlossaryTermsRotorItems:](self, "_thaxSetCachedGlossaryTermsRotorItems:", v3);

  }
  return -[THWPRepAccessibility _thaxCachedGlossaryTermsRotorItems](self, "_thaxCachedGlossaryTermsRotorItems");
}

- (id)_thaxHighlightsRotorItems
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[6];

  if (!-[THWPRepAccessibility _thaxCachedHighlightsRotorItems](self, "_thaxCachedHighlightsRotorItems"))
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_261258;
    v7[3] = &unk_43C710;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateHighlightsInRange:usingBlock:](self, "thaxEnumerateHighlightsInRange:usingBlock:", v4, v5, v7);
    objc_msgSend(v3, "sortUsingSelector:", "tsaxCompareTextRangeByLocation:");
    -[THWPRepAccessibility _thaxSetCachedHighlightsRotorItems:](self, "_thaxSetCachedHighlightsRotorItems:", v3);

  }
  return -[THWPRepAccessibility _thaxCachedHighlightsRotorItems](self, "_thaxCachedHighlightsRotorItems");
}

- (id)_thaxLinksRotorItems
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[6];

  if (!-[THWPRepAccessibility _thaxCachedLinksRotorItems](self, "_thaxCachedLinksRotorItems"))
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    v4 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_26136C;
    v7[3] = &unk_43C6E8;
    v7[4] = self;
    v7[5] = v3;
    -[THWPRepAccessibility thaxEnumerateLinksInRange:usingBlock:](self, "thaxEnumerateLinksInRange:usingBlock:", v4, v5, v7);
    objc_msgSend(v3, "sortUsingSelector:", "tsaxCompareTextRangeByLocation:");
    -[THWPRepAccessibility _thaxSetCachedLinksRotorItems:](self, "_thaxSetCachedLinksRotorItems:", v3);

  }
  return -[THWPRepAccessibility _thaxCachedLinksRotorItems](self, "_thaxCachedLinksRotorItems");
}

+ (id)tsaxTargetClassName
{
  return CFSTR("THWPRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(THTSWPRepAccessibility, a2);
}

- (NSString)thaxOverrideValue
{
  return (NSString *)__TSAccessibilityGetAssociatedObject(self, &unk_543A2D);
}

- (void)thaxSetOverrideValue:(id)a3
{
  __TSAccessibilitySetAssociatedCopiedObject(self, &unk_543A2D, a3);
}

- (THWPHighlightControllerAccessibility)thaxHighlightController
{
  void *v3;
  THWPHighlightControllerAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(THWPHighlightControllerAccessibility);
  result = (THWPHighlightControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("highlightController")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)_thaxShouldOverrideValue
{
  return -[THWPRepAccessibility thaxIsPageNumberTextRep](self, "thaxIsPageNumberTextRep")
      || -[NSString length](-[THWPRepAccessibility thaxOverrideValue](self, "thaxOverrideValue"), "length") != 0;
}

- (id)_thaxOverrideValue
{
  if (-[THWPRepAccessibility thaxIsPageNumberTextRep](self, "thaxIsPageNumberTextRep"))
    return -[THWPRepAccessibility thaxFormattedPageNumberString](self, "thaxFormattedPageNumberString");
  else
    return -[THWPRepAccessibility thaxOverrideValue](self, "thaxOverrideValue");
}

@end
