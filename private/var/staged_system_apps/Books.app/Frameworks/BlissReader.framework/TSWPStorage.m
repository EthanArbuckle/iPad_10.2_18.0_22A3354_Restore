@implementation TSWPStorage

- (unsigned)wordCountOfRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  const __CFString *v5;
  CFStringTokenizerRef v6;
  __CFStringTokenizer *v7;
  unsigned int v8;
  CFRange v10;

  length = a3.length;
  location = a3.location;
  v5 = (const __CFString *)-[TSWPStorage string](self, "string");
  v10.location = location;
  v10.length = length;
  v6 = CFStringTokenizerCreate(0, v5, v10, 0, 0);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = -1;
  do
    ++v8;
  while (CFStringTokenizerAdvanceToNextToken(v7));
  CFRelease(v7);
  return v8;
}

- (id)initTemporaryWithContext:(id)a3 storage:(id)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;

  length = a5.length;
  location = a5.location;
  v9 = +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", a3);
  v10 = objc_msgSend(a4, "newSubstorageWithRange:storageContext:objectsContext:flags:", location, length, v9, v9, 1);
  if (v10)
  {
    v11 = v10;
    -[TSWPStorage dealloc](self, "dealloc");
    return v11;
  }
  return self;
}

- (id)initTemporaryWithContext:(id)a3 string:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = +[THTemporaryObjectContext temporaryContextForDocumentContext:](THTemporaryObjectContext, "temporaryContextForDocumentContext:", a3);
  v7 = objc_msgSend(objc_alloc((Class)TSSStylesheet), "initWithContext:", v6);
  v8 = objc_msgSend(objc_alloc((Class)objc_opt_class(self)), "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", v6, a4, 3, v7, +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", v6), +[TSWPListStyle defaultStyleWithContext:](TSWPListStyle, "defaultStyleWithContext:", v6), 0, 0);

  return v8;
}

- (void)setFontFamily:(id)a3 textColor:(id)a4
{
  _QWORD v7[6];
  _QWORD v8[6];

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:textColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 71, CFSTR("invalid nil value for '%s'"), "fontFamily");
    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:textColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 72, CFSTR("invalid nil value for '%s'"), "textColor");
    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1A0B90;
  v8[3] = &unk_42AA98;
  v8[4] = a3;
  v8[5] = a4;
  -[TSWPStorage p_modifyEachCharacterStyleWithBlock:](self, "p_modifyEachCharacterStyleWithBlock:", v8);
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1A0BCC;
  v7[3] = &unk_42AAC0;
  v7[4] = a3;
  v7[5] = a4;
  -[TSWPStorage p_modifyEachParagraphStyleWithBlock:](self, "p_modifyEachParagraphStyleWithBlock:", v7);
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5
{
  _QWORD v9[7];
  _QWORD v10[7];

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 87, CFSTR("invalid nil value for '%s'"), "fontFamily");
    if (a5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 88, CFSTR("invalid nil value for '%s'"), "textColor");
    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1A0D90;
  v10[3] = &unk_42AAE8;
  *(double *)&v10[6] = a4;
  v10[4] = a3;
  v10[5] = a5;
  -[TSWPStorage p_modifyEachCharacterStyleWithBlock:](self, "p_modifyEachCharacterStyleWithBlock:", v10);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1A0DDC;
  v9[3] = &unk_42AB10;
  *(double *)&v9[6] = a4;
  v9[4] = a3;
  v9[5] = a5;
  -[TSWPStorage p_modifyEachParagraphStyleWithBlock:](self, "p_modifyEachParagraphStyleWithBlock:", v9);
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 alignment:(unsigned int)a6 removeBackgroundFill:(BOOL)a7 removeIndent:(BOOL)a8
{
  _QWORD v15[8];
  unsigned int v16;
  BOOL v17;
  BOOL v18;
  _QWORD v19[8];
  BOOL v20;

  if (!a3)
  {
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:alignment:removeBackgroundFill:removeIndent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 105, CFSTR("invalid nil value for '%s'"), "fontFamily");
    if (a5)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:alignment:removeBackgroundFill:removeIndent:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 106, CFSTR("invalid nil value for '%s'"), "textColor");
    goto LABEL_3;
  }
  if (!a5)
    goto LABEL_5;
LABEL_3:
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1A0FE4;
  v19[3] = &unk_42AB38;
  *(double *)&v19[7] = a4;
  v19[4] = a3;
  v19[5] = a5;
  v20 = a7;
  v19[6] = self;
  -[TSWPStorage p_modifyEachCharacterStyleWithBlock:](self, "p_modifyEachCharacterStyleWithBlock:", v19);
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1A1050;
  v15[3] = &unk_42AB60;
  *(double *)&v15[7] = a4;
  v15[4] = a3;
  v15[5] = a5;
  v16 = a6;
  v17 = a7;
  v15[6] = self;
  v18 = a8;
  -[TSWPStorage p_modifyEachParagraphStyleWithBlock:](self, "p_modifyEachParagraphStyleWithBlock:", v15);
}

- (void)setFontFamily:(id)a3 fontSize:(double)a4 textColor:(id)a5 underlineColor:(id)a6 underlineWidth:(double)a7 lineSpacing:(id)a8 characterSpacing:(double)a9 alignment:(unsigned int)a10 stripOtherAttributes:(BOOL)a11
{
  uint64_t v12;
  id v21;
  double v22;
  void *v23;
  id v24;
  uint64_t v25;
  id v26;
  uint64_t v27;

  v12 = *(_QWORD *)&a10;
  if (a3)
  {
    if (a5)
      goto LABEL_3;
LABEL_20:
    objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:underlineColor:underlineWidth:lineSpacing:characterSpacing:alignment:stripOtherAttributes:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 153, CFSTR("invalid nil value for '%s'"), "textColor");
    if (a11)
      goto LABEL_4;
LABEL_21:
    -[TSWPStorage setFontFamily:fontSize:textColor:](self, "setFontFamily:fontSize:textColor:", a3, a5, a4);
    return;
  }
  objc_msgSend(+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler"), "handleFailureInFunction:file:lineNumber:description:", +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[TSWPStorage(THAdditions) setFontFamily:fontSize:textColor:underlineColor:underlineWidth:lineSpacing:characterSpacing:alignment:stripOtherAttributes:]"), +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Utility/TSWPStorage_THAdditions.mm"), 152, CFSTR("invalid nil value for '%s'"), "fontFamily");
  if (!a5)
    goto LABEL_20;
LABEL_3:
  if (!a11)
    goto LABEL_21;
LABEL_4:
  v21 = +[TSWPParagraphStyle defaultStyleWithContext:](TSWPParagraphStyle, "defaultStyleWithContext:", -[TSWPStorage context](self, "context"));
  v23 = v21;
  if (a3)
    objc_msgSend(v21, "setValue:forProperty:", a3, 16);
  if (a4 != 0.0)
    objc_msgSend(v23, "setCGFloatValue:forProperty:", 17, a4);
  if (a5)
    objc_msgSend(v23, "setValue:forProperty:", a5, 18);
  if (a6)
  {
    objc_msgSend(v23, "setIntValue:forProperty:", 1, 22);
    objc_msgSend(v23, "setValue:forProperty:", a6, 24);
  }
  if (a7 != 0.0)
  {
    *(float *)&v22 = a7;
    objc_msgSend(v23, "setFloatValue:forProperty:", 23, v22);
  }
  if (a8)
    objc_msgSend(v23, "setValue:forProperty:", a8, 85);
  if (a9 != 0.0)
  {
    *(float *)&v22 = a9;
    objc_msgSend(v23, "setFloatValue:forProperty:", 35, v22);
  }
  objc_msgSend(v23, "setIntValue:forProperty:", v12, 86);
  v24 = -[TSWPStorage range](self, "range");
  -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self, "setParagraphStyle:forCharRange:undoTransaction:", v23, v24, v25, 0);
  v26 = -[TSWPStorage range](self, "range");
  -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", 0, v26, v27, 0);
}

- (void)removeSmartFields
{
  -[TSWPStorage addDisallowedElementKind:](self, "addDisallowedElementKind:", 802304);
  -[TSWPStorage filterInvalidContentForStorage:undoTransaction:](self, "filterInvalidContentForStorage:undoTransaction:", self, 0);
}

- (void)modifyEachListStyleWithBlock:(id)a3
{
  -[TSWPStorage p_modifyEachListStyleWithBlock:](self, "p_modifyEachListStyleWithBlock:", a3);
}

- (void)removeAllCharacterStyles
{
  id v3;
  uint64_t v4;

  v3 = -[TSWPStorage range](self, "range");
  -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", 0, v3, v4, 0);
}

- (void)replaceListLabelTypeNumberWithBullet
{
  -[TSWPStorage modifyEachListStyleWithBlock:](self, "modifyEachListStyleWithBlock:", &stru_42ABA0);
}

- (void)p_modifyEachCharacterStyleWithBlock:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  _NSRange v10;
  _BYTE v11[48];

  v5 = -[TSWPStorage range](self, "range");
  TSWPAttributeEnumerator::TSWPAttributeEnumerator(v11, self, v5, v6, 3);
  while (1)
  {
    v7 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v11, &v10);
    if (!v7)
      break;
    v8 = *(void **)(v7 + 8);
    if (v8)
    {
      v9 = objc_msgSend(v8, "copyWithContext:", -[TSWPStorage context](self, "context"));
      (*((void (**)(id, id))a3 + 2))(a3, v9);
      -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", v9, v10.location, v10.length, 0);

    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v11);
}

- (void)p_modifyEachParagraphStyleWithBlock:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _NSRange v12;
  _BYTE v13[48];

  v5 = -[TSWPStorage range](self, "range");
  TSWPAttributeEnumerator::TSWPAttributeEnumerator(v13, self, v5, v6, 0);
  while (1)
  {
    v7 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v13, &v12);
    if (!v7)
      break;
    v8 = *(void **)(v7 + 8);
    if (v8)
    {
      v9 = objc_msgSend(v8, "copyWithContext:", -[TSWPStorage context](self, "context"));
      (*((void (**)(id, id))a3 + 2))(a3, v9);
      v10 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", v12.location, v12.length);
      -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", v9, v10, v11, 0, 0);

    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v13);
}

- (void)p_modifyEachListStyleWithBlock:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  _NSRange v12;
  _BYTE v13[48];

  v5 = -[TSWPStorage range](self, "range");
  TSWPAttributeEnumerator::TSWPAttributeEnumerator(v13, self, v5, v6, 2);
  while (1)
  {
    v7 = TSWPAttributeEnumerator::nextAttributeIndex((TSWPAttributeEnumerator *)v13, &v12);
    if (!v7)
      break;
    v8 = *(void **)(v7 + 8);
    if (v8)
    {
      v9 = objc_msgSend(v8, "copyWithContext:", -[TSWPStorage context](self, "context"));
      (*((void (**)(id, id))a3 + 2))(a3, v9);
      v10 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", v12.location, v12.length);
      -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", v9, v10, v11, 2, 0);

    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v13);
}

- (void)p_removeBackgroundFillFromStyle:(id)a3
{
  NSNull *v4;
  NSNull *v5;

  v4 = (NSNull *)objc_msgSend(a3, "valueForProperty:", 37);
  if (v4 && v4 != +[NSNull null](NSNull, "null"))
    objc_msgSend(a3, "setValue:forProperty:", +[NSNull null](NSNull, "null"), 37);
  v5 = (NSNull *)objc_msgSend(a3, "valueForProperty:", 98);
  if (v5)
  {
    if (v5 != +[NSNull null](NSNull, "null"))
      objc_msgSend(a3, "setValue:forProperty:", +[NSNull null](NSNull, "null"), 98);
  }
}

@end
