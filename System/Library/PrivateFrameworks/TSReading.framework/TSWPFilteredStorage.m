@implementation TSWPFilteredStorage

- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4
{
  return -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:](self, "initWithStorage:subRange:removeRanges:", a3, a4.location, a4.length, objc_msgSend(a3, "hiddenRangesInRange:", a4.location, a4.length));
}

- (TSWPFilteredStorage)initWithStorage:(id)a3 subRange:(_NSRange)a4 removeRanges:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPFilteredStorage *v9;
  TSWPFilteredStorage *v10;
  TSWPDeletionRangeMap *v11;
  unint64_t v12;
  objc_super v14;

  length = a4.length;
  location = a4.location;
  v14.receiver = self;
  v14.super_class = (Class)TSWPFilteredStorage;
  v9 = -[TSWPFilteredStorage init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_storage = (TSWPStorage *)a3;
    v11 = -[TSWPDeletionRangeMap initWithSubRange:removeRanges:]([TSWPDeletionRangeMap alloc], "initWithSubRange:removeRanges:", location, length, a5);
    v10->_rangeMap = v11;
    -[TSWPDeletionRangeMap mappedCharRange:](v11, "mappedCharRange:", location, length);
    v10->_length = v12;
    v10->_storageLength = objc_msgSend(a3, "length");
  }
  return v10;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPFilteredStorage;
  -[TSWPFilteredStorage dealloc](&v3, sel_dealloc);
}

- (unint64_t)length
{
  return self->_length;
}

- (id)string
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  _QWORD v8[6];

  v3 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v4 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  v6 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v4, v5);
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __29__TSWPFilteredStorage_string__block_invoke;
  v8[3] = &unk_24D82D940;
  v8[4] = v3;
  v8[5] = self;
  objc_msgSend(v6, "enumerateRangesUsingBlock:", v8);
  return v3;
}

uint64_t __29__TSWPFilteredStorage_string__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "appendString:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "substringWithRange:", a2, a3));
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[TSWPStorage characterAtIndex:](self->_storage, "characterAtIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  _QWORD v12[11];
  _QWORD v13[3];
  int v14;

  length = a4.length;
  location = a4.location;
  v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  v10 = v9;
  v11 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v8, v9);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __43__TSWPFilteredStorage_getCharacters_range___block_invoke;
  v12[3] = &unk_24D82D968;
  v12[6] = v8;
  v12[7] = v10;
  v12[8] = location;
  v12[9] = length;
  v12[4] = self;
  v12[5] = v13;
  v12[10] = a3;
  objc_msgSend(v11, "enumerateRangesUsingBlock:", v12);
  _Block_object_dispose(v13, 8);
}

uint64_t __43__TSWPFilteredStorage_getCharacters_range___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  _QWORD *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  uint64_t v13;

  v5 = (_QWORD *)result;
  v6 = *(_QWORD *)(result + 48);
  if (v6 > a2 || *(_QWORD *)(result + 56) + v6 < a2 + a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage getCharacters:range:]_block_invoke");
    result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 107, CFSTR("Bogus visible range"));
  }
  v9 = *(unsigned int *)(*(_QWORD *)(v5[5] + 8) + 24);
  v10 = a3 + v9;
  v11 = v5[9];
  if (a3 + v9 > v11)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage getCharacters:range:]_block_invoke");
    result = objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 108, CFSTR("Not enough room in text buffer"));
    v9 = *(unsigned int *)(*(_QWORD *)(v5[5] + 8) + 24);
    v11 = v5[9];
    v10 = a3 + v9;
  }
  if (v10 <= v11)
  {
    result = objc_msgSend(*(id *)(v5[4] + 8), "getCharacters:range:", v5[10] + 2 * v9, a2, a3);
    *(_DWORD *)(*(_QWORD *)(v5[5] + 8) + 24) += a3;
  }
  return result;
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage hasColumnBreakAtCharIndex:](self->_storage, "hasColumnBreakAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage hasColumnStyleForParagraphBreakAtCharIndex:](self->_storage, "hasColumnStyleForParagraphBreakAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  NSUInteger v8;
  __int128 v9;

  v9 = xmmword_217C27470;
  -[TSWPStorage attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](self->_storage, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4, a5, &v9);
  if (a6)
  {
    a6->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v9);
    a6->length = v8;
  }
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  id v7;
  void *v8;
  NSUInteger v9;
  __int128 v11;

  v11 = xmmword_217C27470;
  v7 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_storage, "smartFieldAtCharIndex:attributeKind:effectiveRange:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), *(_QWORD *)&a4, &v11);
  v8 = v7;
  if (a5 && v7)
  {
    a5->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v11);
    a5->length = v9;
  }
  return v8;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  uint64_t v4;
  TSWPStorage *storage;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)&a3;
  storage = self->_storage;
  v6 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  return -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:](storage, "smartFieldsWithAttributeKind:intersectingRange:", v4, v6, v7);
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage footnoteReferenceAtCharIndex:](self->_storage, "footnoteReferenceAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage attachmentAtCharIndex:](self->_storage, "attachmentAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage attachmentOrFootnoteAtCharIndex:](self->_storage, "attachmentOrFootnoteAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPStorage *storage;
  unint64_t v7;
  __int128 *v8;
  id v9;
  NSUInteger v10;
  __int128 v12;

  v12 = xmmword_217C27470;
  storage = self->_storage;
  v7 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  if (a4)
    v8 = &v12;
  else
    v8 = 0;
  v9 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](storage, "characterStyleAtCharIndex:effectiveRange:", v7, v8);
  if (a4)
  {
    a4->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12);
    a4->length = v10;
  }
  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  _BOOL8 v4;
  NSUInteger *v7;
  NSUInteger v8;
  uint64_t v9;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  NSUInteger v13;
  BOOL v14;
  uint64_t v15;
  NSRange v16;
  NSUInteger location;
  NSUInteger v18;
  NSRange v19;
  NSUInteger length;
  NSRange v21;
  void *v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  _NSRange result;

  v4 = a4;
  v7 = (NSUInteger *)MEMORY[0x24BEB3BF0];
  v9 = *MEMORY[0x24BEB3BF0];
  v8 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v10 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:");
  v11 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", 0);
  v12 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", -[TSWPFilteredStorage length](self, "length"));
  v13 = v12;
  if (v10)
    v14 = v10 == v12;
  else
    v14 = 0;
  v15 = v14;
  v16.location = -[TSWPStorage textRangeForParagraphAtCharIndex:](self->_storage, "textRangeForParagraphAtCharIndex:", v10 - v15);
  location = v16.location;
  if (v16.length)
  {
    if (v11 <= v13)
      v18 = v13;
    else
      v18 = v11;
    if (v11 >= v13)
      v19.location = v13;
    else
      v19.location = v11;
    v19.length = v18 - v19.location;
    v21 = NSIntersectionRange(v16, v19);
    length = v21.length;
    location = 0x7FFFFFFFFFFFFFFFLL;
    if (v21.length)
      location = v21.location;
  }
  else if (v16.location <= v13)
  {
    length = 0;
  }
  else
  {
    v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage wordAtCharIndex:includePreviousWord:]");
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 224, CFSTR("unexpected paragraph range past the end of mapped storage"));
    location = *v7;
    length = v7[1];
  }
  if (location != *v7 || length != v7[1])
  {
    v25 = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", location, length);
    v27 = objc_msgSend(-[TSWPFilteredStorage substringWithRange:](self, "substringWithRange:", v25, v26), "rangeOfWordAtCharacterIndex:range:includePreviousWord:", a3 - v25, 0, v26, v4);
    v8 = v28;
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v9 = v27 + v25;
  }
  v29 = v9;
  v30 = v8;
  result.length = v30;
  result.location = v29;
  return result;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length;
  NSUInteger location;
  CFIndex v11;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  const __CFString *v15;
  int64_t result;
  CFRange v17;

  length = a4.length;
  location = a4.location;
  v11 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  v12 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  v14 = v13;
  v15 = -[TSWPStorage string](self->_storage, "string");
  v17.location = v12;
  v17.length = v14;
  result = CFStringGetHyphenationLocationBeforeIndex(v15, v11, v17, 0, a5, a6);
  if (result != -1)
    return -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", result);
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  id v7;
  NSUInteger v8;

  v7 = -[TSWPStorage objectAtLocationPriorToMappedCharIndex:forAttributeKind:effectiveRange:](self->_storage, "objectAtLocationPriorToMappedCharIndex:forAttributeKind:effectiveRange:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), *(_QWORD *)&a4, a5);
  if (a5)
  {
    a5->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a5->location, a5->length);
    a5->length = v8;
  }
  return v7;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  NSUInteger v7;
  double v8;
  double v9;
  NSUInteger v10;
  double result;

  if (a3)
  {
    a3->location = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3->location, a3->length);
    a3->length = v7;
    -[TSWPStorage filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:](self->_storage, "filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:", a3, a4);
    v9 = v8;
    a3->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a3->location, a3->length);
    a3->length = v10;
    return v9;
  }
  else
  {
    -[TSWPStorage filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:](self->_storage, "filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:", 0, a4);
  }
  return result;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  NSUInteger v9;
  __CFDictionary *v10;
  NSUInteger v11;

  if (!a4)
    return -[TSWPStorage createFilteredCoreTextAttributes:effectiveRange:filterDelegate:](self->_storage, "createFilteredCoreTextAttributes:effectiveRange:filterDelegate:", a3, 0, a5);
  a4->location = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4->location, a4->length);
  a4->length = v9;
  v10 = -[TSWPStorage createFilteredCoreTextAttributes:effectiveRange:filterDelegate:](self->_storage, "createFilteredCoreTextAttributes:effectiveRange:filterDelegate:", a3, a4, a5);
  a4->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a4->location, a4->length);
  a4->length = v11;
  return v10;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", a3);
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  return -[TSWPFilteredStorage charIndexMappedToStorage:](self, "charIndexMappedToStorage:", -[TSWPFilteredStorage charIndexMappedFromStorage:](self, "charIndexMappedFromStorage:", a3));
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id v6;
  NSUInteger v7;

  v6 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self->_storage, "paragraphStyleAtCharIndex:effectiveRange:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4);
  if (a4)
  {
    a4->location = -[TSWPDeletionRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a4->location, a4->length);
    a4->length = v7;
  }
  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtCharIndex:](self->_storage, "isWritingDirectionRightToLeftForParagraphAtCharIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  unint64_t v5;

  v5 = -[TSWPStorage storageLength](self->_storage, "storageLength");
  if (a3 && self->_storageLength != v5)
  {
    self->_storageLength = v5;
    -[TSWPDeletionRangeMap adjustByDelta:](self->_rangeMap, "adjustByDelta:", a3);
  }
  return 1;
}

- (id)substringWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v10;
  id v11;
  _QWORD v12[11];
  _QWORD v13[3];
  int v14;

  length = a3.length;
  location = a3.location;
  v7 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:");
  v8 = v6;
  if (v6 == length)
    return -[TSWPStorage substringWithRange:](self->_storage, "substringWithRange:", v7, v6);
  v10 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "stringWithCapacity:", length);
  v11 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](self->_rangeMap, "inverseRangesInStorageRange:", v7, v8);
  v13[0] = 0;
  v13[1] = v13;
  v13[2] = 0x2020000000;
  v14 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __42__TSWPFilteredStorage_substringWithRange___block_invoke;
  v12[3] = &unk_24D82D990;
  v12[6] = v13;
  v12[7] = v7;
  v12[8] = v8;
  v12[9] = location;
  v12[10] = length;
  v12[4] = v10;
  v12[5] = self;
  objc_msgSend(v11, "enumerateRangesUsingBlock:", v12);
  _Block_object_dispose(v13, 8);
  return v10;
}

uint64_t __42__TSWPFilteredStorage_substringWithRange___block_invoke(uint64_t result, unint64_t a2, uint64_t a3)
{
  uint64_t v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;

  v5 = result;
  v6 = *(_QWORD *)(result + 56);
  if (v6 > a2 || *(_QWORD *)(result + 64) + v6 < a2 + a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage substringWithRange:]_block_invoke");
    result = objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 392, CFSTR("Bogus visible range"));
  }
  v9 = a3 + *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24);
  v10 = *(_QWORD *)(v5 + 80);
  if (v9 > v10)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage substringWithRange:]_block_invoke");
    result = objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 393, CFSTR("Not enough room in text buffer"));
    v10 = *(_QWORD *)(v5 + 80);
    v9 = a3 + *(unsigned int *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24);
  }
  if (v9 <= v10)
  {
    result = objc_msgSend(*(id *)(v5 + 32), "appendString:", objc_msgSend(*(id *)(*(_QWORD *)(v5 + 40) + 8), "substringWithRange:", a2, a3));
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(v5 + 48) + 8) + 24) += a3;
  }
  return result;
}

- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  TSWPStorage *storage;
  uint64_t v10;
  _QWORD v11[6];

  v6 = *(_QWORD *)&a3;
  v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  storage = self->_storage;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __69__TSWPFilteredStorage_enumerateWithAttributeKind_inRange_usingBlock___block_invoke;
  v11[3] = &unk_24D82D9B8;
  v11[4] = self;
  v11[5] = a5;
  -[TSWPStorage enumerateWithAttributeKind:inRange:usingBlock:](storage, "enumerateWithAttributeKind:inRange:usingBlock:", v6, v8, v10, v11);
}

uint64_t __69__TSWPFilteredStorage_enumerateWithAttributeKind_inRange_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "charRangeMappedFromStorage:");
  if (v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  uint64_t v6;
  uint64_t v8;
  TSWPStorage *storage;
  uint64_t v10;
  _QWORD v11[6];

  v6 = *(_QWORD *)&a3;
  v8 = -[TSWPDeletionRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  storage = self->_storage;
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __80__TSWPFilteredStorage_enumerateSmartFieldsWithAttributeKind_inRange_usingBlock___block_invoke;
  v11[3] = &unk_24D82D9B8;
  v11[4] = self;
  v11[5] = a5;
  -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](storage, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", v6, v8, v10, v11);
}

uint64_t __80__TSWPFilteredStorage_enumerateSmartFieldsWithAttributeKind_inRange_usingBlock___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "charRangeMappedFromStorage:");
  if (v3)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  TSWPFilteredStorage *v3;
  TSWPDeletionRangeMap *rangeMap;
  uint64_t v5;
  uint64_t v6;
  id v7;
  _QWORD v9[6];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = self;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  rangeMap = self->_rangeMap;
  v5 = -[TSWPDeletionRangeMap unmappedCharRange:](rangeMap, "unmappedCharRange:", a3.location, a3.length);
  v7 = -[TSWPDeletionRangeMap inverseRangesInStorageRange:](rangeMap, "inverseRangesInStorageRange:", v5, v6);
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__TSWPFilteredStorage_hasSmartFieldsInRange___block_invoke;
  v9[3] = &unk_24D82D9E0;
  v9[4] = v3;
  v9[5] = &v10;
  objc_msgSend(v7, "enumerateRangesUsingBlock:", v9);
  LOBYTE(v3) = *((_BYTE *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return (char)v3;
}

uint64_t __45__TSWPFilteredStorage_hasSmartFieldsInRange___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "hasSmartFieldsInRange:", a2, a3);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a5 = 1;
  }
  return result;
}

- (unint64_t)storageLength
{
  return self->_storageLength;
}

- (_NSRange)scanBackwardForWordAtCharIndex:(unint64_t)a3
{
  unint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v5 = a3;
  if (self->_length > a3)
  {
    v5 = a3;
    if (IsWhitespaceCharacter(-[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", a3)))
    {
      v6 = -[TSWPFilteredStorage whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", a3, 1);
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        v5 = a3;
      else
        v5 = v6;
    }
  }
  v7 = -[TSWPFilteredStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", a3, 1);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v7 = v5;
  v8 = a3 - v7;
  result.length = v8;
  result.location = v7;
  return result;
}

- (unint64_t)previousCharacterIndex:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  do
    v4 = -[TSWPStorage previousCharacterIndex:](self->_storage, "previousCharacterIndex:", v4);
  while (-[TSWPDeletionRangeMap containsCharIndex:](self->_rangeMap, "containsCharIndex:", v4)
       && -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v4));
  return -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v4);
}

- (unint64_t)nextCharacterIndex:(unint64_t)a3
{
  unint64_t v4;

  v4 = -[TSWPDeletionRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  do
    v4 = -[TSWPStorage nextCharacterIndex:](self->_storage, "nextCharacterIndex:", v4);
  while (-[TSWPDeletionRangeMap containsCharIndex:](self->_rangeMap, "containsCharIndex:", v4)
       && -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v4) < self->_length);
  return -[TSWPDeletionRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v4);
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  unint64_t v5;
  unint64_t length;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  NSUInteger v12;
  uint64_t v13;
  char v14;
  NSUInteger v15;
  _NSRange result;

  v5 = a3;
  length = self->_length;
  if (-[TSWPFilteredStorage length](self, "length") > a3
    && IsWhitespaceCharacter(-[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", v5)))
  {
    if (v5)
    {
      v8 = v5;
      do
      {
        v9 = v8 - 1;
        v10 = -[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", v8 - 1);
        if (!IsWhitespaceCharacter(v10))
          break;
        if (!a4)
        {
          v11 = IsParagraphBreakingCharacter(v10);
          if ((_DWORD)v10 == 8232 || (v11 & 1) != 0)
            break;
        }
        --v8;
      }
      while (v9);
    }
    else
    {
      v8 = 0;
    }
    if (length > v5)
    {
      while (1)
      {
        v13 = -[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", v5);
        if (!IsWhitespaceCharacter(v13))
          break;
        if (!a4)
        {
          v14 = IsParagraphBreakingCharacter(v13);
          if ((_DWORD)v13 == 8232 || (v14 & 1) != 0)
            break;
        }
        if (length == ++v5)
        {
          v5 = length;
          break;
        }
      }
    }
    v12 = v5 - v8;
  }
  else
  {
    v12 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v15 = v8;
  result.length = v12;
  result.location = v15;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  unint64_t v5;
  void *v7;
  uint64_t v8;
  unint64_t length;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSUInteger v24;
  NSUInteger v25;
  _NSRange result;

  v5 = a3;
  if (a3 != a4 && -[TSWPFilteredStorage previousCharacterIndex:](self, "previousCharacterIndex:", a4) != a3)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage rangeForSelectionAtCharIndex:caretIndex:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 547, CFSTR("Precondition: caretIndex is either equal to the given charIndex or one past"));
  }
  length = self->_length;
  if (length - 1 < v5)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPFilteredStorage rangeForSelectionAtCharIndex:caretIndex:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPFilteredStorage.mm"), 557, CFSTR("Character index should be inside allowable selection range."));
  }
  if (length <= v5)
    v12 = 0;
  else
    v12 = -[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", v5);
  if (!IsSpecialCharacter(v12))
  {
    v14 = 0;
    goto LABEL_16;
  }
  v13 = -[TSWPFilteredStorage attachmentOrFootnoteAtCharIndex:](self, "attachmentOrFootnoteAtCharIndex:", v5);
  v14 = (uint64_t)v13;
  if (!v13)
  {
LABEL_16:
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_20;
  }
  if (objc_msgSend(v13, "isDrawable") && objc_msgSend((id)v14, "isAnchored"))
  {
    if (length <= a4)
      v12 = 0;
    else
      v12 = -[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", a4);
    v14 = 0;
    v15 = 0x7FFFFFFFFFFFFFFFLL;
    v5 = a4;
  }
  else
  {
    v14 = 1;
    v15 = v5;
  }
LABEL_20:
  if (IsSpecialCharacter(v12))
    goto LABEL_42;
  if (IsWhitespaceCharacter(v12))
  {
    if (v5 == a4 && v5)
    {
      v16 = a4 - 1;
    }
    else
    {
      if (length <= a4)
        v17 = v5;
      else
        v17 = a4;
      if (v5 + 1 == a4)
        v16 = v17;
      else
        v16 = v5;
    }
    v18 = -[TSWPFilteredStorage characterAtIndex:](self, "characterAtIndex:", v16);
    v19 = v18;
    if ((IsWhitespaceCharacter(v18) & 1) == 0 && !IsSpecialCharacter(v19))
      goto LABEL_35;
    v15 = -[TSWPFilteredStorage whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", v5, 0);
    v14 = v20;
  }
  v16 = v5;
LABEL_35:
  if (v15 == 0x7FFFFFFFFFFFFFFFLL || !v14)
  {
    v21 = -[TSWPFilteredStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", v16, 0);
    v14 = v22;
    if (v21 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v16 >= length)
      {
        v15 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v15 = objc_msgSend(-[TSWPFilteredStorage string](self, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v16);
        v14 = v23;
      }
    }
    else
    {
      v15 = v21;
    }
  }
LABEL_42:
  v24 = v15;
  v25 = v14;
  result.length = v25;
  result.location = v24;
  return result;
}

@end
