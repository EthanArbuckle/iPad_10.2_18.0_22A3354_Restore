@implementation CRLWPStorageAccessibility

+ (id)crlaxTargetClassName
{
  return CFSTR("Freeform.CRLWPStorage");
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class(CRLAccessibilitySafeCategory, a2);
}

- (unint64_t)crlaxInferredBaseFontSize
{
  return (unint64_t)__CRLAccessibilityGetAssociatedUnsignedInteger(self, &unk_101414D50);
}

- (void)crlaxSetInferredBaseFontSize:(unint64_t)a3
{
  __CRLAccessibilitySetAssociatedUnsignedInteger(self, &unk_101414D50, (id)a3);
}

- (_TtC8Freeform12CRLWPStorage)crlaxTarget
{
  CRLWPStorageAccessibility *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = self;
  v4 = (objc_class *)objc_opt_class(_TtC8Freeform12CRLWPStorage, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return (_TtC8Freeform12CRLWPStorage *)v7;
}

- (NSString)crlaxString
{
  void *v2;
  uint64_t v3;
  objc_class *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  char v9;

  v9 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxValueForKey:](self, "crlaxValueForKey:", CFSTR("string")));
  v4 = (objc_class *)objc_opt_class(NSString, v3);
  v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v2, 1, &v9);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (v9)
    abort();
  v7 = (void *)v6;

  return (NSString *)v7;
}

- (_NSRange)crlaxRange
{
  id v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[CRLWPStorageAccessibility crlaxRangeValueForKey:](self, "crlaxRangeValueForKey:", CFSTR("range"));
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)crlaxChangeCount
{
  return (unint64_t)-[CRLWPStorageAccessibility crlaxUnsignedIntegerValueForKey:](self, "crlaxUnsignedIntegerValueForKey:", CFSTR("changeCount"));
}

- (unint64_t)crlaxCharacterCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "characterCount");

  return (unint64_t)v3;
}

- (unint64_t)crlaxParagraphCount
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget"));
  v3 = objc_msgSend(v2, "paragraphCount");

  return (unint64_t)v3;
}

- (unint64_t)crlaxUpdatedInferredBaseFontSize
{
  -[CRLWPStorageAccessibility _crlaxUpdateInferredBaseFontSize](self, "_crlaxUpdateInferredBaseFontSize");
  return -[CRLWPStorageAccessibility crlaxInferredBaseFontSize](self, "crlaxInferredBaseFontSize");
}

- (id)crlaxSubstringWithRange:(_NSRange)a3
{
  id v3;
  _QWORD v5[6];
  _NSRange v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_1000BA32C;
  v11 = sub_1000BA33C;
  v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BA344;
  v5[3] = &unk_1012348A0;
  v5[4] = self;
  v5[5] = &v7;
  v6 = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

- (id)crlaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  char v10;

  v10 = 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility attachmentOrFootnoteAtCharIndex:](self, "attachmentOrFootnoteAtCharIndex:", a3));
  v5 = (void *)objc_opt_class(CRLWPAttachmentAccessibility, v4);
  v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v3, 1, &v10);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v10)
    abort();
  v8 = (void *)v7;

  return v8;
}

- (void)crlaxEnumerateSmartFieldsUsingBlock:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;

  v6 = a3;
  v4 = -[CRLWPStorageAccessibility crlaxRange](self, "crlaxRange");
  -[CRLWPStorageAccessibility crlaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "crlaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v4, v5, v6);

}

- (void)crlaxEnumerateSmartFieldsWithAttributeKind:(unint64_t)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  id v5;
  _QWORD v6[5];
  id v7;
  unint64_t v8;
  _NSRange v9;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000BA4D4;
  v6[3] = &unk_10122F890;
  v6[4] = self;
  v8 = a3;
  v9 = a4;
  v5 = a5;
  v7 = v5;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6))
    abort();

}

- (BOOL)crlaxSelectionContainsVisibleTrackedChanges:(id)a3
{
  return 0;
}

- (id)crlaxParagraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return 0;
}

- (NSArray)crlaxInferredHeadingRanges
{
  return (NSArray *)-[CRLWPStorageAccessibility crlaxInferredHeadingRangesWithBaseFontSize:](self, "crlaxInferredHeadingRangesWithBaseFontSize:", -[CRLWPStorageAccessibility crlaxUpdatedInferredBaseFontSize](self, "crlaxUpdatedInferredBaseFontSize"));
}

- (id)crlaxInferredHeadingRangesWithBaseFontSize:(unint64_t)a3
{
  void *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v17;
  id v18;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v6 = -[CRLWPStorageAccessibility crlaxParagraphCount](self, "crlaxParagraphCount");
  v7 = v6;
  if (qword_101414D58)
  {
    if (!v6)
      goto LABEL_12;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v9 = objc_msgSend(v8, "mutableCopy");

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
    objc_msgSend(v9, "formUnionWithCharacterSet:", v10);

    objc_msgSend(v9, "addCharactersInRange:", 65532, 1);
    v11 = objc_msgSend(v9, "copy");
    v12 = (void *)qword_101414D58;
    qword_101414D58 = (uint64_t)v11;

    if (!v7)
      goto LABEL_12;
  }
  v13 = 0;
  do
  {
    v14 = -[CRLWPStorageAccessibility _crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:](self, "_crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:", v13, a3, qword_101414D58);
    if (v14 != (id)0x7FFFFFFFFFFFFFFFLL || v15 != 0)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithRange:](NSValue, "valueWithRange:", v14, v15));
      objc_msgSend(v5, "addObject:", v17);

    }
    ++v13;
  }
  while (v7 != v13);
LABEL_12:
  v18 = objc_msgSend(v5, "copy");

  return v18;
}

- (_NSRange)crlaxInferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4
{
  void *v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  NSUInteger v13;
  _NSRange result;

  if (!qword_101414D60)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet whitespaceAndNewlineCharacterSet](NSCharacterSet, "whitespaceAndNewlineCharacterSet"));
    v8 = objc_msgSend(v7, "mutableCopy");

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet controlCharacterSet](NSCharacterSet, "controlCharacterSet"));
    objc_msgSend(v8, "formUnionWithCharacterSet:", v9);

    objc_msgSend(v8, "addCharactersInRange:", 65532, 1);
    v10 = objc_msgSend(v8, "copy");
    v11 = (void *)qword_101414D60;
    qword_101414D60 = (uint64_t)v10;

  }
  v12 = -[CRLWPStorageAccessibility _crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:](self, "_crlaxInfferredHeadingRangeForParagraphIndex:withBaseFontSize:excludingCharacters:", a3, a4);
  result.length = v13;
  result.location = (NSUInteger)v12;
  return result;
}

- (_NSRange)_crlaxInfferredHeadingRangeForParagraphIndex:(unint64_t)a3 withBaseFontSize:(unint64_t)a4 excludingCharacters:(id)a5
{
  id v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  id v16;
  unint64_t v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  void *v21;
  unsigned int v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  void *v27;
  id v28;
  void *v29;
  NSUInteger v30;
  NSUInteger v31;
  NSUInteger v32;
  _NSRange result;

  v7 = a5;
  v9 = 0x7FFFFFFFFFFFFFFFLL;
  v8 = 0;
  v10 = -[CRLWPStorageAccessibility crlaxCharacterCount](self, "crlaxCharacterCount");
  v11 = (char *)-[CRLWPStorageAccessibility crlaxTextRangeForParagraphAtIndex:](self, "crlaxTextRangeForParagraphAtIndex:", a3);
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    v15 = &v11[v12];
    if ((unint64_t)v11 <= v10)
      v16 = (id)v10;
    else
      v16 = v11;
    v17 = (unint64_t)v11;
    while (v16 != (id)v17)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget"));
      v19 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v18, "characterAtIndex:", v17));

      if (v19)
      {
        if (++v17 < (unint64_t)v15)
          continue;
      }
      goto LABEL_11;
    }
    v17 = (unint64_t)v16;
LABEL_11:
    v20 = (unint64_t)&v13[v14 - 1];
    v8 = 0;
    v9 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget"));
      v22 = objc_msgSend(v7, "characterIsMember:", objc_msgSend(v21, "characterAtIndex:", v20));

      if (!v22)
        break;
      if (!v20)
        break;
      --v20;
    }
    while (v20 >= v17);
    v23 = v20 - v17;
    if (v20 > v17 && v23 <= 0x44)
    {
      v24 = v23 + 1;
      v25 = v20 + 1;
      if (v17 >= v20 + 1)
      {
        v8 = v24;
LABEL_23:
        v9 = v17;
      }
      else
      {
        v32 = v24;
        v26 = v17;
        while (1)
        {
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget", v32));
          v28 = objc_msgSend(v27, "characterAtIndex:", v26);

          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSCharacterSet lowercaseLetterCharacterSet](NSCharacterSet, "lowercaseLetterCharacterSet"));
          LODWORD(v28) = objc_msgSend(v29, "characterIsMember:", v28);

          if ((_DWORD)v28)
            break;
          if (v25 == ++v26)
          {
            v8 = v32;
            goto LABEL_23;
          }
        }
      }
    }
  }

  v30 = v9;
  v31 = v8;
  result.length = v31;
  result.location = v30;
  return result;
}

- (_NSRange)crlaxTextRangeForParagraphAtIndex:(unint64_t)a3
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
  v7[2] = sub_1000BAAE4;
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

- (unsigned)crlaxCharacterAtIndex:(unint64_t)a3
{
  unsigned __int16 v3;
  _QWORD v5[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  __int16 v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_1000BABE0;
  v5[3] = &unk_10122DC18;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v5))
    abort();
  v3 = *((_WORD *)v7 + 12);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (_NSRange)crlaxNextInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  BOOL v19;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _NSRange result;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxInferredHeadingRanges](self, "crlaxInferredHeadingRanges"));
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v24 = v4;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "rangeValue");
          if ((unint64_t)v14 > a3)
          {
            v17 = (uint64_t)v14;
            v16 = v15;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
      v16 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
      v4 = v24;
    }
    else
    {
      v16 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v19 = v17 != 0x7FFFFFFFFFFFFFFFLL || v16 != 0 || !v4;
    v7 = v16;
    v8 = v17;
    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
      v8 = (uint64_t)objc_msgSend(v20, "rangeValue");
      v7 = v21;

    }
  }

  v22 = v8;
  v23 = v7;
  result.length = v23;
  result.location = v22;
  return result;
}

- (_NSRange)crlaxPreviousInferredHeadingRangeFromCharacterIndex:(unint64_t)a3 wrap:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  NSUInteger v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  BOOL v19;
  void *v20;
  NSUInteger v21;
  NSUInteger v22;
  NSUInteger v23;
  _BOOL4 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _NSRange result;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxInferredHeadingRanges](self, "crlaxInferredHeadingRanges"));
  v8 = 0x7FFFFFFFFFFFFFFFLL;
  v7 = 0;
  if (objc_msgSend(v6, "count"))
  {
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "reverseObjectEnumerator"));
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v10)
    {
      v11 = v10;
      v24 = v4;
      v12 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v12)
            objc_enumerationMutation(v9);
          v14 = objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i), "rangeValue");
          if ((unint64_t)v14 + v15 <= a3)
          {
            v17 = (uint64_t)v14;
            v16 = v15;
            goto LABEL_12;
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
        if (v11)
          continue;
        break;
      }
      v16 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_12:
      v4 = v24;
    }
    else
    {
      v16 = 0;
      v17 = 0x7FFFFFFFFFFFFFFFLL;
    }

    v19 = v17 != 0x7FFFFFFFFFFFFFFFLL || v16 != 0 || !v4;
    v7 = v16;
    v8 = v17;
    if (!v19)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", (char *)objc_msgSend(v6, "count") - 1));
      v8 = (uint64_t)objc_msgSend(v20, "rangeValue");
      v7 = v21;

    }
  }

  v22 = v8;
  v23 = v7;
  result.length = v23;
  result.location = v22;
  return result;
}

- (id)crlaxHyperLinksInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v5;
  void *v6;

  length = a3.length;
  location = a3.location;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CRLWPStorageAccessibility crlaxTarget](self, "crlaxTarget"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "smartFieldsWithAttributeKind:intersectingRange:", 6, location, length));

  return v6;
}

- (void)_crlaxUpdateInferredBaseFontSize
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  _QWORD v7[1000];

  bzero(v7, 0x1F40uLL);
  v3 = 0;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v5 = v7[v3];
    if (v4 != 0x7FFFFFFFFFFFFFFFLL || (v6 = v3, !v5))
    {
      if (v5 <= v7[v4])
        v6 = v4;
      else
        v6 = v3;
    }
    ++v3;
    v4 = v6;
  }
  while (v3 != 1000);
  -[CRLWPStorageAccessibility crlaxSetInferredBaseFontSize:](self, "crlaxSetInferredBaseFontSize:");
}

@end
