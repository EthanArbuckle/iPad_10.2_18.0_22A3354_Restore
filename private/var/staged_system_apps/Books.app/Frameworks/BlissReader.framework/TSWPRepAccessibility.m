@implementation TSWPRepAccessibility

+ (id)tsaxTargetClassName
{
  return CFSTR("TSWPRep");
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(TSDRepAccessibility, a2);
}

- (BOOL)tsaxShouldIgnoreParentShape
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_543878);
}

- (void)tsaxSetShouldIgnoreParentShape:(BOOL)a3
{
  __TSAccessibilitySetAssociatedBool(self, &unk_543878, a3);
}

- (BOOL)tsaxIsEditing
{
  return -[TSWPRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isEditing"));
}

- (_NSRange)tsaxStorageRangeOfRep
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[TSWPRepAccessibility tsaxRangeValueForKey:](self, "tsaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (TSWPStorageAccessibility)tsaxStorage
{
  void *v3;
  TSWPStorageAccessibility *result;
  char v5;

  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPStorageAccessibility);
  result = (TSWPStorageAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("storage")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPEditingControllerAccessibility)tsaxEditingController
{
  void *v3;
  TSWPEditingControllerAccessibility *result;
  char v5;

  if (!-[TSWPRepAccessibility tsaxIsEditing](self, "tsaxIsEditing"))
    return 0;
  v5 = 0;
  v3 = (void *)objc_opt_class(TSWPEditingControllerAccessibility);
  result = (TSWPEditingControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)objc_msgSend(-[TSWPInteractiveCanvasControllerAccessibility tsaxValueForKey:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxValueForKey:", CFSTR("editorController")), "tsaxValueForKey:", CFSTR("textInputEditor")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (BOOL)tsaxIsSelectionHighlightSuppressed
{
  return -[TSWPRepAccessibility tsaxBoolValueForKey:](self, "tsaxBoolValueForKey:", CFSTR("isSelectionHighlightSuppressed"));
}

- (NSArray)tsaxColumns
{
  objc_class *v3;
  NSArray *result;
  char v5;

  v5 = 0;
  v3 = (objc_class *)objc_opt_class(NSArray);
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)-[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("columns")), 1, &v5);
  if (v5)
    abort();
  return result;
}

- (TSWPInteractiveCanvasControllerAccessibility)tsaxInteractiveCanvasController
{
  void *v3;
  TSDInteractiveCanvasControllerAccessibility *v4;
  TSWPInteractiveCanvasControllerAccessibility *result;
  objc_super v6;
  char v7;

  v7 = 0;
  v3 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  v6.receiver = self;
  v6.super_class = (Class)TSWPRepAccessibility;
  v4 = -[TSDRepAccessibility tsaxInteractiveCanvasController](&v6, "tsaxInteractiveCanvasController");
  result = (TSWPInteractiveCanvasControllerAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 1, &v7);
  if (v7)
    abort();
  return result;
}

- (id)tsaxBeginEditingWithChosenTextRepReference:(id *)a3
{
  void *v5;
  Class v6;
  TSWPRepAccessibility *v7;
  Class v8;
  TSWPInteractiveCanvasControllerAccessibility *v9;
  void *v10;
  uint64_t v11;
  id result;
  _QWORD v13[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  uint64_t v19;
  char v20;
  _QWORD v21[5];

  v5 = (void *)objc_opt_class(TSWPShapeRepAccessibility);
  v6 = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  v7 = self;
  if (v6)
  {
    v8 = v6;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_2305AC;
    v21[3] = &unk_426DD0;
    v21[4] = v6;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v21))
      goto LABEL_9;
    v7 = (TSWPRepAccessibility *)-[objc_class tsaxContainedRep](v8, "tsaxContainedRep");
  }
  v9 = -[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  v20 = 0;
  v10 = (void *)objc_opt_class(TSWPEditingControllerAccessibility);
  v14 = 0;
  v15 = &v14;
  v16 = 0x3052000000;
  v17 = sub_2305B4;
  v18 = sub_2305C4;
  v19 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2305D0;
  v13[3] = &unk_427D68;
  v13[5] = v7;
  v13[6] = &v14;
  v13[4] = v9;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v13))
    abort();
  v11 = v15[5];
  _Block_object_dispose(&v14, 8);
  result = __TSAccessibilityCastAsSafeCategory(v10, v11, 1, &v20);
  if (v20)
LABEL_9:
    abort();
  if (a3)
    *a3 = v7;
  return result;
}

- (_NSRange)tsaxClampRangeToStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSRange v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  _NSRange result;
  NSRange v10;

  length = a3.length;
  location = a3.location;
  v5.location = (NSUInteger)-[TSWPStorageAccessibility tsaxRange](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxRange");
  if (location + length == v5.location + v5.length)
  {
    v6 = location;
    v7 = length;
  }
  else
  {
    v10.location = location;
    v10.length = length;
    v8 = NSIntersectionRange(v5, v10);
    v7 = v8.length;
    v6 = v8.location;
  }
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)tsaxEnumerateAttachedReps:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  Class v8;
  TSWPInteractiveCanvasControllerAccessibility *v9;
  _QWORD v10[9];

  v5 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v7 = v6;
  v8 = NSClassFromString(CFSTR("TSWPDrawableAttachment"));
  v9 = -[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  if (v9)
  {
    if (v8)
    {
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_230708;
      v10[3] = &unk_43BA68;
      v10[7] = v5;
      v10[8] = v7;
      v10[4] = v8;
      v10[5] = v9;
      v10[6] = a3;
      -[TSWPStorageAccessibility tsaxEnumerateAttachmentsUsingBlock:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxEnumerateAttachmentsUsingBlock:", v10);
    }
  }
}

- (_NSRange)tsaxRepRangeWithStorageRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = -[TSWPRepAccessibility tsaxRepPositionWithStoragePosition:](self, "tsaxRepPositionWithStoragePosition:", a3.location);
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)tsaxRepPositionWithStoragePosition:(unint64_t)a3
{
  return a3 - (_QWORD)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
}

- (_NSRange)tsaxStorageRangeWithRepRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  length = a3.length;
  v4 = -[TSWPRepAccessibility tsaxStoragePositionWithRepPosition:](self, "tsaxStoragePositionWithRepPosition:", a3.location);
  v5 = length;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)tsaxStoragePositionWithRepPosition:(unint64_t)a3
{
  return (unint64_t)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep") + a3;
}

- (void)tsaxLoadAccessibilityInformation
{
  TSWPStorageAccessibility *v3;
  void *v4;
  Class v5;
  Class v6;
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  char v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)TSWPRepAccessibility;
  -[TSWPRepAccessibility tsaxLoadAccessibilityInformation](&v11, "tsaxLoadAccessibilityInformation");
  v3 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v10 = 0;
  v4 = (void *)objc_opt_class(TSWPInteractiveCanvasControllerAccessibility);
  v5 = __TSAccessibilityCastAsSafeCategory(v4, (uint64_t)-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), 1, &v10);
  if (v10)
    abort();
  if (v3)
  {
    v6 = v5;
    if (v5)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_23096C;
      v9[3] = &unk_43BA90;
      v9[4] = v5;
      -[TSWPStorageAccessibility tsaxEnumerateAttachmentsUsingBlock:](v3, "tsaxEnumerateAttachmentsUsingBlock:", v9);
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_230978;
      v8[3] = &unk_43BAB8;
      v8[4] = v6;
      -[TSWPStorageAccessibility tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:](v3, "tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:", v8);
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_230984;
      v7[3] = &unk_43BAE0;
      v7[4] = v6;
      -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsUsingBlock:](v3, "tsaxEnumerateSmartFieldsUsingBlock:", v7);
    }
  }
}

- (id)tsaxSummaryDescription
{
  id v3;
  uint64_t v4;

  if (!-[TSWPRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxSubstringInStorageWithRange:", &OBJC_PROTOCOL___TSWPRepAccessibilityExtras))return 0;
  v3 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v3, v4);
}

- (void)pulseCaret
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRepAccessibility;
  -[TSWPRepAccessibility pulseCaret](&v3, "pulseCaret");
  if (-[TSWPRepAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDidPulseCaret", &OBJC_PROTOCOL___TSWPRepAccessibilityExtras))-[TSWPRepAccessibility tsaxDidPulseCaret](self, "tsaxDidPulseCaret");
}

- (unint64_t)_tsaxLastCharacterIndexForActivation
{
  return (unint64_t)__TSAccessibilityGetAssociatedUnsignedInteger(self, &unk_543A11);
}

- (void)_tsaxSetLastCharacterIndexForActivation:(unint64_t)a3
{
  __TSAccessibilitySetAssociatedUnsignedInteger(self, &unk_543A11, (id)a3);
}

- (TSWPRepAccessibility)_tsaxShapeContainedTextRep
{
  return (TSWPRepAccessibility *)__TSAccessibilityGetAssociatedObject(self, &unk_543A12);
}

- (void)_tsaxSetShapeContainedTextRep:(id)a3
{
  __TSAccessibilitySetAssociatedObject(self, &unk_543A12, a3);
}

- (id)_tsaxProcessStringForObjectReplacements:(id)a3 rangeOffset:(unint64_t)a4
{
  NSString *v7;
  char *v8;
  id v9;
  char *v10;
  NSMutableString *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  id v17;
  Class v18;
  id v19;
  Class v20;
  void *v21;
  Class v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *i;
  void *v30;
  id v31;
  char *j;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int16 v39;
  __int16 v40;
  _BYTE v41[128];

  v40 = -4;
  v7 = +[NSString stringWithCharacters:length:](NSString, "stringWithCharacters:length:", &v40, 1);
  v8 = (char *)objc_msgSend(a3, "length");
  v9 = +[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary");
  v10 = 0;
  v11 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  v34 = a3;
  while (1)
  {
    v13 = (char *)objc_msgSend(a3, "rangeOfString:options:range:", v7, 0, v10, v8 - v10);
    if (v13 == (char *)0x7FFFFFFFFFFFFFFFLL)
      break;
    v15 = v13;
    v16 = v14;
    if (v11)
      -[NSMutableString appendString:](v11, "appendString:", objc_msgSend(a3, "substringWithRange:", v12, &v13[-v12]));
    else
      v11 = +[NSMutableString stringWithString:](NSMutableString, "stringWithString:", objc_msgSend(a3, "substringWithRange:", 0, v13));
    v17 = -[TSWPStorageAccessibility tsaxAttachmentOrFootnoteAtCharIndex:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxAttachmentOrFootnoteAtCharIndex:", &v15[a4]);
    v18 = NSClassFromString(CFSTR("TSWPDrawableAttachment"));
    if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
    {
      v19 = -[TSDInteractiveCanvasControllerAccessibility tsaxRepForInfo:](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxRepForInfo:", objc_msgSend(v17, "tsaxValueForKey:", CFSTR("drawable")));
      if (!objc_msgSend(v19, "tsaxShouldExposeAsAttachmentToken"))
      {
        v23 = objc_msgSend(v19, "accessibilityLabel");
LABEL_14:
        v24 = v23;
        goto LABEL_15;
      }
      a3 = v34;
      objc_msgSend(v9, "setObject:forKey:", v19, +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[NSMutableString length](v11, "length")));
    }
    else
    {
      v20 = NSClassFromString(CFSTR("TSTWPTokenAttachment"));
      if ((objc_opt_isKindOfClass(v17, v20) & 1) != 0)
      {
        LOBYTE(v39) = 0;
        v21 = (void *)objc_opt_class(TSTWPTokenAttachmentAccessibility);
        v22 = __TSAccessibilityCastAsSafeCategory(v21, (uint64_t)v17, 1, &v39);
        if ((_BYTE)v39)
          abort();
        v23 = -[objc_class tsaxFormulaPlainText](v22, "tsaxFormulaPlainText");
        goto LABEL_14;
      }
    }
    v24 = 0;
LABEL_15:
    if (objc_msgSend(v24, "length"))
      -[NSMutableString appendFormat:](v11, "appendFormat:", CFSTR(" %@ "), v24);
    v10 = &v15[v16];
    if (&v15[v16] != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = (uint64_t)&v15[v16];
      if (&v10[v16] <= v8)
        continue;
    }
    goto LABEL_23;
  }
  if (v11 && v12 != 0x7FFFFFFFFFFFFFFFLL)
    -[NSMutableString appendString:](v11, "appendString:", objc_msgSend(a3, "substringWithRange:", v12, &v8[-v12]));
LABEL_23:
  if (objc_msgSend(v9, "count") && v11)
  {
    if (!-[NSMutableString length](v11, "length"))
    {
      v39 = -4;
      v11 = +[NSMutableString stringWithCharacters:length:](NSMutableString, "stringWithCharacters:length:", &v39, 1);
    }
    v25 = objc_msgSend(objc_alloc((Class)AXAttributedString), "initWithString:", v11);
    v35 = 0u;
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v26 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v36;
      do
      {
        for (i = 0; i != v27; i = (char *)i + 1)
        {
          if (*(_QWORD *)v36 != v28)
            objc_enumerationMutation(v9);
          v30 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
          v31 = objc_msgSend(v9, "objectForKey:", v30);
          for (j = (char *)objc_msgSend(v30, "integerValue"); j; --j)
          {
            if (j + 1 <= objc_msgSend(v25, "length"))
              break;
          }
          objc_msgSend(v25, "setAttribute:forKey:withRange:", v31, CFSTR("UIAccessibilityTokenAttachment"), j, -[NSMutableString length](v11, "length") != 0);
        }
        v27 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
      }
      while (v27);
    }
    v11 = (NSMutableString *)v25;
    a3 = v34;
  }
  if (v11)
    return v11;
  else
    return a3;
}

- (BOOL)tsaxNeedsEditRotorMenu
{
  if (-[TSWPRepAccessibility tsaxIsEditing](self, "tsaxIsEditing"))
    return 1;
  else
    return -[TSDRepAccessibility tsaxIsSelected](self, "tsaxIsSelected");
}

- (id)accessibilityCustomActions
{
  id result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRepAccessibility;
  result = objc_msgSend(-[TSDRepAccessibility accessibilityCustomActions](&v3, "accessibilityCustomActions"), "mutableCopy");
  if (!result)
    return +[NSMutableArray array](NSMutableArray, "array");
  return result;
}

- (BOOL)tsaxNeedsTextEntryTrait
{
  return -[TSWPStorageAccessibility tsaxUnsignedIntValueForKey:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxUnsignedIntValueForKey:", CFSTR("wpKind")) < 5;
}

- (void)tsaxEnumerateSpecialTextTokensInRange:(_NSRange)a3 usingBlock:(id)a4
{
  _QWORD v5[6];
  _NSRange v6;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_24E400;
  v5[3] = &unk_43C318;
  v6 = a3;
  v5[4] = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v5[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
}

- (void)_tsaxCondenseAttributedString:(id)a3
{
  id v4;
  unint64_t v5;
  NSUInteger v6;
  void *v7;
  NSUInteger location;
  NSUInteger length;
  id v10;
  NSRange v11;
  NSUInteger v12;
  NSUInteger v13;
  NSRange v14;
  NSRange v15;

  v4 = objc_msgSend(a3, "length");
  if (v4)
  {
    v5 = (unint64_t)v4;
    v6 = 0;
    v7 = 0;
    location = 0;
    v14.location = 0;
    v14.length = 0;
    length = 1;
    do
    {
      v10 = objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v6, &v14);
      if (objc_msgSend(v7, "isEqual:", v10))
      {
        v15.location = location;
        v15.length = length;
        v11 = NSUnionRange(v15, v14);
        location = v11.location;
        length = v11.length;
        v12 = v14.location;
        v13 = v14.length;
      }
      else
      {
        if (v7)
          objc_msgSend(a3, "setAttributes:range:", v7, location, length);
        v12 = v14.location;
        v13 = v14.length;
        v7 = v10;
        location = v14.location;
        length = v14.length;
      }
      v6 = v13 + v12;
    }
    while (v13 + v12 < v5);
    if (v7)
      objc_msgSend(a3, "setAttributes:range:", v7, location, length);
  }
}

- (id)tsaxSubstringInStorageWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorageAccessibility *v6;
  NSUInteger v7;
  NSRange v8;
  id v9;
  id v10;
  void *v11;
  char *v12;
  char *v13;
  void *v14;
  _QWORD v16[6];
  NSRange v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  uint64_t v23;
  NSRange v24;
  NSRange v25;

  length = a3.length;
  location = a3.location;
  v6 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v25.location = (NSUInteger)-[TSWPStorageAccessibility tsaxRange](v6, "tsaxRange");
  v25.length = v7;
  v24.location = location;
  v24.length = length;
  v8 = NSIntersectionRange(v24, v25);
  v9 = -[TSWPStorageAccessibility substringWithRange:](v6, "substringWithRange:", v8.location, v8.length);
  v10 = -[TSWPStorageAccessibility stringEquivalentFromRange:](v6, "stringEquivalentFromRange:", v8.location, v8.length);
  if (v9)
  {
    v11 = v10;
    if (v10)
    {
      v12 = (char *)objc_msgSend(v10, "length");
      if (objc_msgSend(v9, "length") == v12)
      {
        if (v12
          && (v13 = v12 - 1,
              objc_msgSend(objc_msgSend(v11, "substringFromIndex:", v13), "isEqualToString:", CFSTR("\r")))
          && objc_msgSend(objc_msgSend(v9, "substringFromIndex:", v13), "isEqualToString:", CFSTR("\n")))
        {
          v9 = objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", v13, 1, CFSTR("\n"));
        }
        else
        {
          v9 = v11;
        }
      }
    }
  }
  if (objc_msgSend(v9, "length"))
    v9 = -[TSWPRepAccessibility _tsaxProcessStringForObjectReplacements:rangeOffset:](self, "_tsaxProcessStringForObjectReplacements:rangeOffset:", v9, v8.location);
  v18 = 0;
  v19 = &v18;
  v20 = 0x3052000000;
  v21 = sub_24E7F0;
  v22 = sub_24E800;
  v23 = 0;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_24E80C;
  v16[3] = &unk_43C340;
  v16[4] = v9;
  v16[5] = &v18;
  v17 = v8;
  -[TSWPRepAccessibility tsaxEnumerateSpecialTextTokensInRange:usingBlock:](self, "tsaxEnumerateSpecialTextTokensInRange:usingBlock:", v8.location, v8.length, v16);
  v14 = (void *)v19[5];
  if (v14)
    v9 = v14;
  _Block_object_dispose(&v18, 8);
  return v9;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  TSWPStorageAccessibility *v7;
  NSUInteger v8;
  NSRange v9;
  id v10;
  uint64_t v11;
  id v12;
  void *v14;
  uint64_t v15;
  const __CTFont *v16;
  const __CTFont *v17;
  CFStringRef v18;
  CFStringRef v19;
  CFStringRef v20;
  CFStringRef v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  id v30;
  Class v31;
  void *v32;
  Class v33;
  id v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id v38;
  id v39;
  NSUInteger v40;
  id v41;
  char v42;
  __int128 v43;
  NSRange v44;
  NSRange v45;

  v4 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3->location, a3->length);
  v6 = v5;
  v7 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v45.location = (NSUInteger)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v45.length = v8;
  v44.location = (NSUInteger)v4;
  v44.length = v6;
  v9 = NSIntersectionRange(v44, v45);
  if (!v9.length)
    return 0;
  v41 = v4;
  v10 = -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v9.location, v9.length);
  v11 = objc_opt_class(AXAttributedString);
  v40 = v6;
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
    v12 = objc_msgSend(objc_msgSend(v10, "cfAttributedString"), "mutableCopy");
  else
    v12 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", v10);
  v14 = v12;
  objc_msgSend(v12, "beginEditing");
  v15 = 0;
  v43 = xmmword_3146B0;
  do
  {
    if (v15 + 1 > (unint64_t)objc_msgSend(v14, "length"))
      break;
    v16 = (const __CTFont *)-[TSWPStorageAccessibility createFontAtCharIndex:scaleTextPercent:effectiveRange:styleProvider:](v7, "createFontAtCharIndex:scaleTextPercent:effectiveRange:styleProvider:", v9.location + v15, 100, &v43, objc_msgSend(-[TSWPRepAccessibility columnForCharIndex:](self, "columnForCharIndex:", v9.location + v15), "tsaxValueForKey:", CFSTR("styleProvider")));
    if (v16)
    {
      v17 = v16;
      v18 = CTFontCopyName(v16, kCTFontFamilyNameKey);
      if (v18)
      {
        v19 = v18;
        objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenFontFamily"), v18, v15, 1);
        CFRelease(v19);
      }
      v20 = CTFontCopyName(v17, kCTFontPostScriptNameKey);
      if (v20)
      {
        v21 = v20;
        objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenFontName"), v20, v15, 1);
        CFRelease(v21);
      }
      CFRelease(v17);
    }
    v22 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 19, v9.location + v15, &v43);
    v23 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v22, v23) & 1) != 0)
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenBold"), v22, v15, 1);
    v24 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 20, v9.location + v15, &v43);
    v25 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenItalic"), v24, v15, 1);
    v26 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 17, v9.location + v15, &v43);
    v27 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v26, v27) & 1) != 0)
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenFontSize"), v26, v15, 1);
    v28 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 22, v9.location + v15, &v43);
    v29 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v28, v29) & 1) != 0 && objc_msgSend(v28, "BOOLValue"))
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenUnderline"), v28, v15, 1);
    v30 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 18, v9.location + v15, &v43);
    v31 = NSClassFromString(CFSTR("TSUColor"));
    if ((objc_opt_isKindOfClass(v30, v31) & 1) != 0)
    {
      v42 = 0;
      v32 = (void *)objc_opt_class(TSUColorAccessibility);
      v33 = __TSAccessibilityCastAsSafeCategory(v32, (uint64_t)v30, 1, &v42);
      if (v42)
        abort();
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenForegroundColor"), -[objc_class tsaxStyleInfoDescription](v33, "tsaxStyleInfoDescription"), v15, 1);
    }
    v34 = -[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v7, "valueForProperty:atCharIndex:effectiveRange:", 86, v9.location + v15, &v43);
    v35 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v34, v35) & 1) != 0)
    {
      v36 = objc_msgSend(v34, "integerValue");
      if ((unint64_t)v36 >= 4)
        v37 = 4;
      else
        v37 = (uint64_t)v36;
      v38 = objc_msgSend(objc_alloc((Class)NSNumber), "initWithInteger:", v37);
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenParagraphAlignment"), v38, v15, 1);

    }
    v39 = -[TSWPEditingControllerAccessibility tsaxListItemLabelForLineAtCurrentSelection](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxListItemLabelForLineAtCurrentSelection");
    if (v39)
      objc_msgSend(v14, "addAttribute:value:range:", CFSTR("UIAccessibilityTokenListItemLabel"), v39, v15, 1);
    ++v15;
  }
  while (v9.location + v15 < v9.location + v9.length);
  if (-[TSWPStorageAccessibility tsaxContainsAnnotationInRange:](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxContainsAnnotationInRange:", v41, v40))
  {
    objc_msgSend(v14, "appendAttributedString:", objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR(", %@"), TSAccessibilityLocalizedString((uint64_t)CFSTR("annotation.has.annotation"))), 0));
  }
  objc_msgSend(v14, "endEditing");
  -[TSWPRepAccessibility _tsaxCondenseAttributedString:](self, "_tsaxCondenseAttributedString:", v14);
  -[TSWPRepAccessibility performSelector:withObject:](self, "performSelector:withObject:", NSSelectorFromString(CFSTR("_accessibilityAddMispellingsToAttributedString:")), v14);
  return v14;
}

- (id)_accessibilityValueForRange:(_NSRange *)a3
{
  id v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  NSRange v8;
  NSRange v10;
  NSRange v11;

  v4 = -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3->location, a3->length);
  v6 = v5;
  v11.location = (NSUInteger)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v11.length = v7;
  v10.location = (NSUInteger)v4;
  v10.length = v6;
  v8 = NSIntersectionRange(v10, v11);
  if (v8.length)
    return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v8.location, v8.length);
  else
    return 0;
}

- (BOOL)_tsaxTextIsEditable
{
  return -[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController") != 0;
}

- (void)_tsaxActivationShouldBeginEditing:(BOOL *)a3 shouldHandleCanvasSelection:(BOOL *)a4
{
  TSDRepAccessibility *v7;
  unsigned __int8 v8;
  BOOL v9;
  char v10;

  if (!-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController")
    || (v7 = -[TSDRepAccessibility tsaxRepForSelecting](self, "tsaxRepForSelecting")) != 0
    && !-[TSDRepAccessibility tsaxIsSelected](v7, "tsaxIsSelected"))
  {
    v10 = 0;
    v9 = 1;
    if (!a3)
      goto LABEL_8;
    goto LABEL_7;
  }
  v8 = -[TSWPRepAccessibility tsaxIsEditing](self, "tsaxIsEditing");
  v9 = 0;
  v10 = v8 ^ 1;
  if (a3)
LABEL_7:
    *a3 = v10;
LABEL_8:
  if (a4)
    *a4 = v9;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  objc_super v4;
  __int16 v5;

  v5 = 0;
  -[TSWPRepAccessibility _tsaxActivationShouldBeginEditing:shouldHandleCanvasSelection:](self, "_tsaxActivationShouldBeginEditing:shouldHandleCanvasSelection:", (char *)&v5 + 1, &v5);
  if (HIBYTE(v5))
    return 1;
  if (!(_BYTE)v5)
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)TSWPRepAccessibility;
  return -[TSDRepAccessibility _accessibilitySupportsActivateAction](&v4, "_accessibilitySupportsActivateAction");
}

- (BOOL)accessibilityActivate
{
  id v3;
  TSWPRepAccessibility *v4;
  TSDRepAccessibility *v5;
  objc_super v7;
  _QWORD v8[6];
  TSWPRepAccessibility *v9;
  __int16 v10;

  v10 = 0;
  -[TSWPRepAccessibility _tsaxActivationShouldBeginEditing:shouldHandleCanvasSelection:](self, "_tsaxActivationShouldBeginEditing:shouldHandleCanvasSelection:", (char *)&v10 + 1, &v10);
  if (HIBYTE(v10))
  {
    v9 = 0;
    v3 = -[TSWPRepAccessibility tsaxBeginEditingWithChosenTextRepReference:](self, "tsaxBeginEditingWithChosenTextRepReference:", &v9);
    v4 = self;
    if (v9 != self)
    {
      v5 = -[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep", self);
      v4 = v9;
      if (!v5)
      {
        -[TSWPRepAccessibility _tsaxSetShapeContainedTextRep:](self, "_tsaxSetShapeContainedTextRep:", v9);
        v4 = v9;
      }
    }
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_24F118;
    v8[3] = &unk_426E28;
    v8[4] = v3;
    v8[5] = v4;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v8))
      abort();
    -[TSDInteractiveCanvasControllerAccessibility tsaxScrollToPrimarySelection](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxScrollToPrimarySelection");
    return 1;
  }
  else if ((_BYTE)v10)
  {
    v7.receiver = self;
    v7.super_class = (Class)TSWPRepAccessibility;
    return -[TSDRepAccessibility accessibilityActivate](&v7, "accessibilityActivate");
  }
  else
  {
    return 0;
  }
}

- (BOOL)tsaxRepRangeContainsLocation:(unint64_t)a3
{
  id v4;
  unint64_t v5;

  v4 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  return a3 >= (unint64_t)v4 && a3 - (unint64_t)v4 < v5;
}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v3;
  uint64_t v4;
  id v5;
  NSUInteger v6;
  _NSRange result;

  v3 = -[TSWPEditingControllerAccessibility tsaxSelectedTextRange](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxSelectedTextRange");
  v5 = -[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v3, v4);
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (void)_tsaxSetSelectedTextRange:(_NSRange)a3 skipSelectionChangedNotification:(BOOL)a4
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
  NSRange v16;

  v4 = a4;
  v6 = (char *)-[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3.location, a3.length);
  v8 = v7;
  v9 = (char *)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v11 = (NSUInteger)v9;
  if (v8 || v6 < &v9[v10 + 1])
  {
    if (v8)
      v14.length = v10;
    else
      v14.length = v10 + 1;
    v16.location = (NSUInteger)v6;
    v16.length = v8;
    v14.location = v11;
    v15 = NSIntersectionRange(v16, v14);
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
    objc_msgSend(-[TSWPRepAccessibility tsaxBeginEditingWithChosenTextRepReference:](self, "tsaxBeginEditingWithChosenTextRepReference:", 0), "tsaxSetSelectedTextRange:skipSelectionChangedNotification:", location, length, v4);
    return;
  }
  if ((unint64_t)v6 < v11)
    objc_msgSend(-[TSWPRepAccessibility tsaxBeginEditingWithChosenTextRepReference:](self, "tsaxBeginEditingWithChosenTextRepReference:", 0), "tsaxSetSelectedTextRange:skipSelectionChangedNotification:", v11, 0, v4);
}

- (void)_accessibilitySetSelectedTextRange:(_NSRange)a3
{
  -[TSWPRepAccessibility _tsaxSetSelectedTextRange:skipSelectionChangedNotification:](self, "_tsaxSetSelectedTextRange:skipSelectionChangedNotification:", a3.location, a3.length, 0);
}

- (unint64_t)_tsaxLinePosition:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  id v6;
  char *v7;
  id v9;
  char *v10;
  int ShouldCrashOnValidationErrorAfterLaunch;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  TSWPStorageAccessibility *v18;
  id v19;
  uint64_t v20;
  id v21;
  unint64_t v22;

  v3 = a3;
  v5 = -[TSWPEditingControllerAccessibility tsaxSelectedTextRange](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxSelectedTextRange");
  v6 = -[TSWPEditingControllerAccessibility tsaxStorageRangeOfLineFragmentAtCharIndex:](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxStorageRangeOfLineFragmentAtCharIndex:", v5);
  if (v6 == NSInvalidRange[0] && v7 == NSInvalidRange[1])
  {
    if (TSAccessibilityShouldPerformValidationChecks())
    {
      ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
      if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, (uint64_t)CFSTR("Line fragment range not found for positionInStorage: %lu"), v13, v14, v15, v16, v17, (uint64_t)v5))abort();
    }
    return -1;
  }
  else
  {
    v9 = v6;
    v10 = v7;
    if (v3)
    {
      return (unint64_t)-[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v6, v7);
    }
    else
    {
      v18 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
      if (&v10[(_QWORD)v9] == (char *)-[TSWPStorageAccessibility tsaxSelectionRangeMaxForCharIndex:](v18, "tsaxSelectionRangeMaxForCharIndex:", v5))
      {
        return -[TSWPRepAccessibility tsaxRepPositionWithStoragePosition:](self, "tsaxRepPositionWithStoragePosition:", &v10[(_QWORD)v9]);
      }
      else
      {
        v19 = -[TSWPStorageAccessibility tsaxRange](v18, "tsaxRange");
        v21 = +[TSWPFilteredStorageAccessibility tsaxNewFilteredStorageWithStorage:subRange:](TSWPFilteredStorageAccessibility, "tsaxNewFilteredStorageWithStorage:subRange:", v18, v19, v20);
        v22 = -[TSWPRepAccessibility tsaxRepPositionWithStoragePosition:](self, "tsaxRepPositionWithStoragePosition:", objc_msgSend(v21, "tsaxPreviousCharacterIndex:", &v10[(_QWORD)v9]));

        return v22;
      }
    }
  }
}

- (int64_t)_accessibilityLineEndPosition
{
  return -[TSWPRepAccessibility _tsaxLinePosition:](self, "_tsaxLinePosition:", 0);
}

- (int64_t)_accessibilityLineStartPosition
{
  return -[TSWPRepAccessibility _tsaxLinePosition:](self, "_tsaxLinePosition:", 1);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  unsigned int v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  Class v9;
  uint64_t v10;
  uint64_t v11;
  TSDRepAccessibility *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSWPRepAccessibility;
  v3 = -[TSDRepAccessibility accessibilityTraits](&v14, "accessibilityTraits");
  v4 = -[TSWPRepAccessibility tsaxNeedsTextEntryTrait](self, "tsaxNeedsTextEntryTrait");
  v5 = TSAccessibilityTraitTextEntry;
  if (!v4)
    v5 = 0;
  v6 = v5 | v3;
  if (-[TSWPRepAccessibility tsaxIsEditing](self, "tsaxIsEditing")
    || !-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep")
    && -[TSWPRepAccessibility tsaxIsEditing](-[TSWPRepAccessibility _tsaxShapeContainedTextRep](self, "_tsaxShapeContainedTextRep"), "tsaxIsEditing"))
  {
    v7 = TSAccessibilityTraitIsEditing | TSAccessibilityTraitTextOperationsAvailable | v6;
  }
  else
  {
    v7 = v6 & ~TSAccessibilityTraitIsEditing;
  }
  v8 = (void *)objc_opt_class(TSDShapeRepAccessibility);
  v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  v10 = TSAccessibilityTraitTextArea;
  if (v9)
    v10 = 0;
  v11 = v10 | v7;
  if (-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"))
  {
    if ((TSAccessibilityTraitTextEntry & v11) != 0)
    {
      v12 = -[TSDRepAccessibility tsaxRepForSelecting](self, "tsaxRepForSelecting");
      if (v12)
      {
        if (!-[TSDRepAccessibility tsaxIsSelected](v12, "tsaxIsSelected"))
          v11 |= TSAccessibilityTraitStaticText;
      }
    }
  }
  else
  {
    v11 &= ~(TSAccessibilityTraitTextArea | TSAccessibilityTraitTextEntry);
  }
  -[TSWPRepAccessibility _tsaxRepRangeIsHeading](self, "_tsaxRepRangeIsHeading");
  return (unint64_t)-[TSWPStorageAccessibility accessibilityTraits](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "accessibilityTraits") | v11;
}

- (id)automationElements
{
  void *v3;
  Class v4;
  objc_super v6;

  v3 = (void *)objc_opt_class(TSDShapeRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  if (v4)
    return -[objc_class tsaxKnobAccessibilityElements](v4, "tsaxKnobAccessibilityElements");
  v6.receiver = self;
  v6.super_class = (Class)TSWPRepAccessibility;
  return -[TSWPRepAccessibility automationElements](&v6, "automationElements");
}

- (id)accessibilityLabel
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v3 = -[TSWPRepAccessibility _tsaxParentPlaceholderDescription](self, "_tsaxParentPlaceholderDescription");
  v4 = -[TSWPRepAccessibility _tsaxParentShapeLabel](self, "_tsaxParentShapeLabel");
  return __TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (id)accessibilityHint
{
  NSString *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  objc_super v12;

  if (-[TSWPRepAccessibility tsaxIsEditing](self, "tsaxIsEditing"))
    return 0;
  if (-[TSDRepAccessibility tsaxIsSelected](self, "tsaxIsSelected"))
    v4 = TSAccessibilityLocalizedString((uint64_t)CFSTR("edit.hint.iOS"));
  else
    v4 = 0;
  v5 = -[TSWPRepAccessibility _tsaxParentShapeHint](self, "_tsaxParentShapeHint");
  if (!objc_msgSend(v5, "length"))
  {
    v12.receiver = self;
    v12.super_class = (Class)TSWPRepAccessibility;
    v5 = -[TSDRepAccessibility accessibilityHint](&v12, "accessibilityHint");
  }
  return __TSAccessibilityStringForVariables(1, v4, v6, v7, v8, v9, v10, v11, (uint64_t)v5);
}

- (id)tsaxKnobLabel
{
  return TSAccessibilityLocalizedString((uint64_t)CFSTR("text"));
}

- (id)accessibilityValue
{
  id v3;
  uint64_t v4;

  v3 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  return -[TSWPRepAccessibility tsaxSubstringInStorageWithRange:](self, "tsaxSubstringInStorageWithRange:", v3, v4);
}

- (BOOL)isAccessibilityElement
{
  return !-[TSDInteractiveCanvasControllerAccessibility tsaxInPrintPreviewMode](-[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController"), "tsaxInPrintPreviewMode");
}

- (id)_tsaxParentPlaceholderDescription
{
  void *v3;
  id result;

  v3 = (void *)objc_opt_class(TSWPShapeRepAccessibility);
  result = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  if (result)
    return objc_msgSend(result, "tsaxPlaceholderDescription");
  return result;
}

- (BOOL)_tsaxRepRangeIsHeading
{
  TSWPStorageAccessibility *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  unsigned int v7;
  __int128 v10;

  v3 = -[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage");
  v4 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v6 = v5;
  v10 = xmmword_3146B0;
  v7 = objc_msgSend(-[TSWPStorageAccessibility valueForProperty:atCharIndex:effectiveRange:](v3, "valueForProperty:atCharIndex:effectiveRange:", 47, v4, &v10), "isEqualToString:", CFSTR("heading"));
  if (v7)
    LOBYTE(v7) = v4 == (id)v10 && v6 == *((_QWORD *)&v10 + 1);
  return v7;
}

- (id)_tsaxParentShapeLabel
{
  void *v3;
  Class v4;
  Class v5;

  v3 = (void *)objc_opt_class(TSDShapeRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  if (v4 && (v5 = v4, !-[TSWPRepAccessibility tsaxShouldIgnoreParentShape](self, "tsaxShouldIgnoreParentShape")))
    return -[objc_class accessibilityLabel](v5, "accessibilityLabel");
  else
    return 0;
}

- (id)_tsaxParentShapeHint
{
  void *v3;
  Class v4;
  Class v5;

  v3 = (void *)objc_opt_class(TSDShapeRepAccessibility);
  v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)-[TSDRepAccessibility tsaxParentRep](self, "tsaxParentRep"), 0, 0);
  if (v4 && (v5 = v4, !-[TSWPRepAccessibility tsaxShouldIgnoreParentShape](self, "tsaxShouldIgnoreParentShape")))
    return -[objc_class accessibilityHint](v5, "accessibilityHint");
  else
    return 0;
}

- (id)_tsaxGetDictionaryForLineNumber:(unint64_t)a3 columnNumber:(unint64_t)a4
{
  return +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3), CFSTR("lineNumber"), +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4), CFSTR("lineColumn"), 0);
}

- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPosition:(unint64_t)a5
{
  id v9;
  uint64_t v10;
  id v11;
  unint64_t v12;
  _QWORD v13[6];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;

  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0x7FFFFFFFFFFFFFFFLL;
  v9 = -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("columns"));
  v10 = objc_opt_class(NSArray);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = -[TSWPRepAccessibility columnForCharIndex:](self, "columnForCharIndex:", a5);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_24FA8C;
    v13[3] = &unk_43C368;
    v13[4] = v11;
    v13[5] = &v14;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", v13);
    v12 = (unint64_t)objc_msgSend(v11, "lineIndexForCharIndex:eol:", a5, 1);
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if (a3)
LABEL_3:
    *a3 = v12;
LABEL_4:
  if (a4)
    *a4 = v15[3];
  _Block_object_dispose(&v14, 8);
}

- (id)_tsaxLineNumberAndColumnForPosition:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[TSWPRepAccessibility _tsaxGetEffectiveLineNumber:columnNumber:forPosition:](self, "_tsaxGetEffectiveLineNumber:columnNumber:forPosition:", &v6, &v5, a3);
  return -[TSWPRepAccessibility _tsaxGetDictionaryForLineNumber:columnNumber:](self, "_tsaxGetDictionaryForLineNumber:columnNumber:", v6, v5);
}

- (void)_tsaxGetEffectiveLineNumber:(unint64_t *)a3 columnNumber:(unint64_t *)a4 forPoint:(CGPoint)a5
{
  double y;
  double x;
  TSWPInteractiveCanvasControllerAccessibility *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  double v16;
  double v17;
  id v18;
  id v19;
  id v20;
  double v21;
  double v22;
  char v24;
  unint64_t v25;
  unint64_t v26;

  y = a5.y;
  x = a5.x;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  v10 = -[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  v24 = 0;
  v11 = (objc_class *)objc_opt_class(UIView);
  v12 = (void *)__TSAccessibilityCastAsClass(v11, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](v10, "tsaxCanvasView"), 1, &v24);
  if (v24)
    abort();
  v13 = v12;
  v14 = objc_msgSend(v12, "window");
  if (v13)
    v15 = v14 == 0;
  else
    v15 = 1;
  if (!v15)
  {
    objc_msgSend(v13, "convertPoint:fromView:", v14, x, y);
    -[TSDInteractiveCanvasControllerAccessibility tsaxConvertBoundsToUnscaledPoint:](v10, "tsaxConvertBoundsToUnscaledPoint:");
    -[TSDRepAccessibility tsaxConvertNaturalPointFromUnscaledCanvas:](self, "tsaxConvertNaturalPointFromUnscaledCanvas:");
    v17 = v16;
    v18 = -[TSWPRepAccessibility charIndexForPointWithPinning:](self, "charIndexForPointWithPinning:");
    -[TSWPRepAccessibility _tsaxSetLastCharacterIndexForActivation:](self, "_tsaxSetLastCharacterIndexForActivation:", v18);
    -[TSWPRepAccessibility _tsaxGetEffectiveLineNumber:columnNumber:forPosition:](self, "_tsaxGetEffectiveLineNumber:columnNumber:forPosition:", &v26, &v25, v18);
    if (v26)
    {
      if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v19 = -[TSWPRepAccessibility columnForCharIndex:](self, "columnForCharIndex:", v18);
        v20 = objc_msgSend(v19, "tsaxUnsignedIntegerValueForKey:", CFSTR("countLines"));
        if (v26 - 1 < (unint64_t)v20)
        {
          objc_msgSend(v19, "boundsOfLineFragmentAtIndex:");
          if (v21 <= v17 && v17 <= v21 + v22 && v26 >= 2)
            --v26;
        }
      }
    }
  }
  if (a3)
    *a3 = v26;
  if (a4)
    *a4 = v25;
}

- (id)_accessibilityLineNumberAndColumnForPoint:(CGPoint)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = 0x7FFFFFFFFFFFFFFFLL;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  -[TSWPRepAccessibility _tsaxGetEffectiveLineNumber:columnNumber:forPoint:](self, "_tsaxGetEffectiveLineNumber:columnNumber:forPoint:", &v6, &v5, a3.x, a3.y);
  return -[TSWPRepAccessibility _tsaxGetDictionaryForLineNumber:columnNumber:](self, "_tsaxGetDictionaryForLineNumber:columnNumber:", v6, v5);
}

- (_NSRange)_accessibilityRangeForLineNumberAndColumn:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  char isKindOfClass;
  NSUInteger v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  unint64_t v16;
  NSUInteger v17;
  id v18;
  NSUInteger v19;
  id v20;
  uint64_t v21;
  _QWORD v22[2];
  _NSRange result;

  v5 = objc_msgSend(a3, "objectForKey:", CFSTR("lineNumber"));
  if (!v5)
  {
    v11 = 0;
    v12 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_10;
  }
  v6 = (unint64_t)objc_msgSend(v5, "integerValue");
  v7 = (unint64_t)objc_msgSend(objc_msgSend(a3, "objectForKey:", CFSTR("lineColumn")), "integerValue");
  v8 = -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("columns"));
  v9 = objc_opt_class(NSArray);
  isKindOfClass = objc_opt_isKindOfClass(v8, v9);
  v11 = 0;
  v12 = 0x7FFFFFFFFFFFFFFFLL;
  if ((isKindOfClass & 1) != 0 && (v7 & 0x8000000000000000) == 0)
  {
    if (v7 >= (unint64_t)objc_msgSend(v8, "count"))
    {
LABEL_8:
      v11 = 0;
      goto LABEL_10;
    }
    v13 = objc_msgSend(v8, "objectAtIndex:", v7);
    v14 = objc_msgSend(v13, "tsaxUnsignedIntegerValueForKey:", CFSTR("countLines"));
    v11 = 0;
    if ((v6 & 0x8000000000000000) == 0 && v6 < (unint64_t)v14)
    {
      v15 = objc_msgSend(v13, "rangeOfLineFragmentAtIndex:", v6);
      if (v16 > 0x7FFFFFFFFFFFFFFELL)
        goto LABEL_8;
      v18 = -[TSWPRepAccessibility tsaxRepRangeWithStorageRange:](self, "tsaxRepRangeWithStorageRange:", v15, v16);
      v12 = (uint64_t)v18;
      if (v11)
      {
        v19 = v11;
        v22[0] = v18;
        v22[1] = v11;
        v20 = -[TSWPRepAccessibility _accessibilityValueForRange:](self, "_accessibilityValueForRange:", v22);
        v21 = objc_opt_class(NSAttributedString);
        if ((objc_opt_isKindOfClass(v20, v21) & 1) != 0)
          v20 = objc_msgSend(v20, "string");
        v11 = v19 - objc_msgSend(v20, "hasSuffix:", CFSTR("\n"));
      }
    }
  }
LABEL_10:
  v17 = v12;
  result.length = v11;
  result.location = v17;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  id v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPRepAccessibility _accessibilityRangeForLineNumberAndColumn:](self, "_accessibilityRangeForLineNumberAndColumn:", -[TSWPRepAccessibility _tsaxLineNumberAndColumnForPosition:](self, "_tsaxLineNumberAndColumnForPosition:", -[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3, 0)));
  result.length = v4;
  result.location = (NSUInteger)v3;
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
  id v15;
  TSWPInteractiveCanvasControllerAccessibility *v16;
  objc_class *v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  char *v22;
  uint64_t v23;
  id v25;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  _QWORD v37[7];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  void (*v41)(uint64_t, uint64_t);
  void (*v42)(uint64_t);
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  CGRect result;

  v4 = (char *)-[TSWPRepAccessibility tsaxStorageRangeWithRepRange:](self, "tsaxStorageRangeWithRepRange:", a3.location, a3.length);
  v6 = v5;
  -[TSDRepAccessibility accessibilityFrame](self, "accessibilityFrame");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = -[TSDRepAccessibility tsaxValueForKey:](self, "tsaxValueForKey:", CFSTR("columns"));
  v16 = -[TSWPRepAccessibility tsaxInteractiveCanvasController](self, "tsaxInteractiveCanvasController");
  LOBYTE(v38) = 0;
  v17 = (objc_class *)objc_opt_class(UIView);
  v36 = (void *)__TSAccessibilityCastAsClass(v17, (uint64_t)-[TSDInteractiveCanvasControllerAccessibility tsaxCanvasView](v16, "tsaxCanvasView"), 1, &v38);
  if ((_BYTE)v38)
    abort();
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v47 = 0u;
  v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
  if (v18)
  {
    v19 = *(_QWORD *)v45;
    while (2)
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v45 != v19)
          objc_enumerationMutation(v15);
        v21 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
        v22 = (char *)objc_msgSend(v21, "tsaxRangeValueForKey:", CFSTR("range"), v36);
        if (v4 >= v22 && v4 < &v22[v23])
        {
          v25 = +[TSWPSelectionAccessibility tsaxSelectionWithRange:](TSWPSelectionAccessibility, "tsaxSelectionWithRange:", v4, v6);
          v38 = 0;
          v39 = &v38;
          v40 = 0x3052000000;
          v41 = sub_24E7F0;
          v42 = sub_24E800;
          v43 = 0;
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_250160;
          v37[3] = &unk_427D68;
          v37[5] = v25;
          v37[6] = &v38;
          v37[4] = v21;
          if (__TSAccessibilityPerformSafeBlock((uint64_t)v37))
            abort();
          v27 = (void *)v39[5];
          _Block_object_dispose(&v38, 8);
          if (objc_msgSend(v27, "count"))
          {
            objc_msgSend(objc_msgSend(v27, "firstObject"), "CGRectValue");
            -[TSDRepAccessibility tsaxConvertNaturalRectToUnscaledCanvas:](self, "tsaxConvertNaturalRectToUnscaledCanvas:");
            -[TSDInteractiveCanvasControllerAccessibility tsaxConvertUnscaledToBoundsRect:](v16, "tsaxConvertUnscaledToBoundsRect:");
            objc_msgSend(v36, "tsaxFrameFromBounds:");
            v8 = v28;
            v10 = v29;
            v12 = v30;
            v14 = v31;
          }
          goto LABEL_18;
        }
      }
      v18 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v44, v48, 16);
      if (v18)
        continue;
      break;
    }
  }
LABEL_18:
  v32 = v8;
  v33 = v10;
  v34 = v12;
  v35 = v14;
  result.size.height = v35;
  result.size.width = v34;
  result.origin.y = v33;
  result.origin.x = v32;
  return result;
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  char *v7;
  uint64_t v8;

  v7 = (char *)-[TSWPStorageAccessibility tsaxRange](-[TSWPEditingControllerAccessibility tsaxStorage](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxStorage"), "tsaxRange");
  -[TSWPEditingControllerAccessibility tsaxReplaceRange:withText:](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxReplaceRange:withText:", &v7[v8 - a3], a3, a4);
}

- (void)_accessibilityInsertText:(id)a3
{
  -[TSWPEditingControllerAccessibility tsaxInsertText:](-[TSWPRepAccessibility tsaxEditingController](self, "tsaxEditingController"), "tsaxInsertText:", a3);
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3
{
  NSUInteger location;
  NSArray *v7;
  id v8;
  id v9;
  id v10;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v14;
  void *v15;
  NSRange v16;
  char *v17;
  char *v18;
  char *v19;
  NSRange v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  NSArray *obj;
  uint64_t v30;
  NSRange v31;
  id v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  NSRange v41;
  NSRange v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  v31.length = a3.length;
  if (a3.location == 0x7FFFFFFFFFFFFFFFLL || a3.length == 0)
    return 0;
  location = a3.location;
  v7 = -[TSWPRepAccessibility tsaxColumns](self, "tsaxColumns");
  v8 = -[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v9 = +[NSMutableArray array](NSMutableArray, "array");
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v7;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
  v32 = v10;
  if (v10)
  {
    v31.location = (NSUInteger)v8 + location;
    v30 = *(_QWORD *)v37;
    y = CGRectNull.origin.y;
    width = CGRectNull.size.width;
    height = CGRectNull.size.height;
    v35 = CGRectZero.origin.y;
    v33 = CGRectZero.size.height;
    v34 = CGRectZero.size.width;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v37 != v30)
          objc_enumerationMutation(obj);
        v15 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)v14);
        v41.location = (NSUInteger)objc_msgSend(v15, "tsaxRange");
        v16 = NSIntersectionRange(v41, v31);
        if (v16.length)
        {
          v17 = (char *)objc_msgSend(v15, "tsaxLineIndexForCharIndex:eol:", v16.location, 0);
          v18 = (char *)objc_msgSend(v15, "tsaxLineIndexForCharIndex:eol:", v16.length + v16.location - 1, 0);
          if (v17 <= v18)
          {
            v19 = v18;
            do
            {
              v42.location = (NSUInteger)objc_msgSend(v15, "tsaxRangeOfLineFragmentAtIndex:", v17);
              v20 = NSIntersectionRange(v42, v16);
              -[TSWPRepAccessibility _accessibilityBoundsForRange:](self, "_accessibilityBoundsForRange:", v20.location - (unint64_t)v8, v20.length);
              v22 = v21;
              v24 = v23;
              v26 = v25;
              v28 = v27;
              v43.origin.x = CGRectNull.origin.x;
              v43.origin.y = y;
              v43.size.width = width;
              v43.size.height = height;
              v45.origin.x = v22;
              v45.origin.y = v24;
              v45.size.width = v26;
              v45.size.height = v28;
              if (!CGRectEqualToRect(v43, v45))
              {
                v44.origin.y = v35;
                v44.origin.x = CGRectZero.origin.x;
                v44.size.height = v33;
                v44.size.width = v34;
                v46.origin.x = v22;
                v46.origin.y = v24;
                v46.size.width = v26;
                v46.size.height = v28;
                if (!CGRectEqualToRect(v44, v46))
                  objc_msgSend(v9, "addObject:", +[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", v22, v24, v26, v28));
              }
              ++v17;
            }
            while (v17 <= v19);
          }
        }
        v14 = (char *)v14 + 1;
      }
      while (v14 != v32);
      v32 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
    }
    while (v32);
  }
  return objc_msgSend(v9, "copy");
}

- (BOOL)_tsaxHasTextContent
{
  id v3;
  NSUInteger v4;
  NSUInteger v5;
  NSRange v7;
  NSRange v8;

  v3 = -[TSWPStorageAccessibility tsaxRange](-[TSWPRepAccessibility tsaxStorage](self, "tsaxStorage"), "tsaxRange");
  v5 = v4;
  v7.location = (NSUInteger)-[TSWPRepAccessibility tsaxStorageRangeOfRep](self, "tsaxStorageRangeOfRep");
  v8.location = (NSUInteger)v3;
  v8.length = v5;
  return NSIntersectionRange(v7, v8).length != 0;
}

@end
