@implementation TSWPStorage

- (id)stylesheet
{
  return self->_stylesheet;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtParIndex:(unint64_t)a3
{
  unsigned int v4;
  int writingDirectionCache;
  void *v6;
  uint64_t v7;
  TSKDocumentRoot *documentRoot;
  void *v9;
  uint64_t v10;

  v4 = -[TSWPStorage writingDirectionForParagraphAtParIndex:](self, "writingDirectionForParagraphAtParIndex:", a3);
  if (v4 >= 2)
  {
    if (v4 == -1)
    {
      writingDirectionCache = self->_writingDirectionCache;
      if (writingDirectionCache == -1)
      {
        documentRoot = self->_documentRoot;
        v4 = !documentRoot
          && (v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler"),
              v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:]"), objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3326, CFSTR("_documentRoot should never be nil at this point")), (documentRoot = self->_documentRoot) == 0)|| -[TSKDocumentRoot isDirectionRightToLeft](documentRoot, "isDirectionRightToLeft");
        self->_writingDirectionCache = v4;
      }
      else
      {
        LOBYTE(v4) = writingDirectionCache == 1;
      }
    }
    else
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3343, CFSTR("Unknown writing direction."));
      LOBYTE(v4) = 0;
    }
  }
  return v4;
}

- (int)writingDirectionForParagraphAtParIndex:(unint64_t)a3
{
  return -[TSWPStorage writingDirectionForParagraphAtCharIndex:](self, "writingDirectionForParagraphAtCharIndex:", -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3));
}

- (int)writingDirectionForParagraphAtCharIndex:(unint64_t)a3
{
  int result;
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;

  result = objc_msgSend(-[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a3, 0), "intValueForProperty:", 44);
  if (result == -1)
  {
    v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 18);
    if (!v6)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage writingDirectionForParagraphAtCharIndex:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3383, CFSTR("writingDirectionForParagraphAtParIndex: no paragraph table."));
      return -[TSKDocumentRoot isDirectionRightToLeft](self->_documentRoot, "isDirectionRightToLeft");
    }
    v7 = v6;
    if (!v6->var2)
      return -[TSKDocumentRoot isDirectionRightToLeft](self->_documentRoot, "isDirectionRightToLeft");
    v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
    if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage writingDirectionForParagraphAtCharIndex:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3387, CFSTR("writingDirectionForParagraphAtParIndex: no paragraph table."));
    }
    result = *((_DWORD *)v7->var4 + 4 * v8 + 2);
    if (result == -1)
      return -[TSKDocumentRoot isDirectionRightToLeft](self->_documentRoot, "isDirectionRightToLeft");
  }
  return result;
}

- (id)paragraphStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPAttributeArray *v7;
  void *v8;
  uint64_t v9;
  NSUInteger v10;

  v7 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (!v7)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphStyleAtParIndex:effectiveRange:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3800, CFSTR("paragraphStyleAtParIndex: no paragraph table."));
  }
  if (a4)
  {
    a4->location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3);
    a4->length = v10;
  }
  if (v7 && v7->var2 > a3)
    return (id)*((_QWORD *)v7->var4 + 2 * a3 + 1);
  else
    return 0;
}

- (id)textSourceForLayoutInRange:(_NSRange)a3
{
  return -[TSWPRubyTextSource initWithSource:subRange:]([TSWPRubyTextSource alloc], "initWithSource:subRange:", self, a3.location, a3.length);
}

- (int)wpKind
{
  return self->_WPKind;
}

- (BOOL)allowsElementKind:(int)a3
{
  return (-[TSWPStorage disallowedElementKinds](self, "disallowedElementKinds") & a3) == 0;
}

- (unsigned)disallowedElementKinds
{
  uint64_t WPKind;
  unsigned int v3;
  unsigned int v4;

  WPKind = self->_WPKind;
  v3 = *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds | 0xF;
  if ((_DWORD)WPKind != 5)
    v3 = *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds;
  v4 = v3 | 0x100040;
  if ((_DWORD)WPKind)
    return v4;
  else
    return *((_DWORD *)&sDisallowElementKinds + WPKind) | self->_disallowElementKinds;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)findCharIndexForAttachment:(id)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t Object;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (v4
    && (v5 = v4, Object = TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0), Object != 0x7FFFFFFFFFFFFFFFLL))
  {
    return TSWPAttributeArray::charIndexForAttributeIndex(v5, Object);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)applyObject:(id)a3 toParagraphsInCharRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7;
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _NSRange v17;

  v7 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v12 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (v12)
  {
    v17.location = location;
    v17.length = length;
    v13 = TSWPParagraphAttributeArray::paragraphRangeForCharRange((TSWPParagraphAttributeArray *)v12, v17);
    -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", a3, v13, v14, v7, a6);
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyObject:toParagraphsInCharRange:forKind:undoTransaction:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 470, CFSTR("No paragraph array."));
  }
}

- (void)p_replaceCharactersInSelection:(id)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  _BOOL4 v15;
  BOOL v16;
  uint64_t v17;
  TSWPAttributeArray *v18;
  uint64_t v19;
  uint64_t v20;
  TSWPAttributeArray *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  TSWPAttributeArray *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  TSWPAttributeArray *v30;
  uint64_t v31;
  uint64_t v32;
  __int16 v33;
  void *__p;
  void *v35;
  uint64_t v36;

  __p = 0;
  v35 = 0;
  v36 = 0;
  v33 = 0;
  if (!a3)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TSWPStorage_private) p_replaceCharactersInSelection:withString:length:undoTransaction:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_private.mm"), 78, CFSTR("invalid nil value for '%s'"), "selection");
  }
  if (a5)
    -[TSWPStorage p_fillMarkers:string:length:hasAttachments:hasFootnotes:hasBreaks:](self, "p_fillMarkers:string:length:hasAttachments:hasFootnotes:hasBreaks:", &__p, a4, a5, (char *)&v33 + 1, &v33, 0);
  v13 = -[TSWPStorage pOverrideObjectBeforeReplacingCharactersInSelection:withString:](self, "pOverrideObjectBeforeReplacingCharactersInSelection:withString:", a3, a4);
  v14 = 0;
  do
  {
    if ((_DWORD)v14)
    {
      v15 = (_DWORD)v14 == 4 && HIBYTE(v33) != 0;
      v16 = (_DWORD)v14 != 5 || v33 == 0;
      v17 = !v16 || (unint64_t)v15;
      v18 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v14, v17, a6);
      if (v18)
      {
        v19 = objc_msgSend(a3, "range");
        (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *))v18->var0
         + 9))(v18, v19, v20, a4, a5, &__p, a6);
      }
    }
    v14 = (v14 + 1);
  }
  while ((_DWORD)v14 != 19);
  v21 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 0, a6);
  if (v21)
  {
    v22 = objc_msgSend(a3, "range");
    (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *))v21->var0
     + 9))(v21, v22, v23, a4, a5, &__p, a6);
  }
  v24 = objc_msgSend(a3, "range");
  -[TSWPStorage p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:](self, "p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:", v24, v25, a4, a5, a6);
  v26 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (v26)
  {
    v27 = objc_msgSend(a3, "range");
    (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *, uint64_t))v26->var0
     + 11))(v26, v27, v28, a4, a5, &__p, a6, objc_msgSend(a3, "styleInsertionBehavior"));
  }
  v29 = 0;
  do
  {
    if ((_DWORD)v29)
    {
      v30 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v29);
      if (v30)
      {
        v31 = objc_msgSend(a3, "range");
        (*((void (**)(TSWPAttributeArray *, uint64_t, uint64_t, id, unint64_t, void **, TSWPStorageTransaction *, uint64_t))v30->var0
         + 11))(v30, v31, v32, a4, a5, &__p, a6, objc_msgSend(a3, "styleInsertionBehavior"));
      }
    }
    v29 = (v29 + 1);
  }
  while ((_DWORD)v29 != 19);
  -[TSWPStorage pApplyOverrideObjectAfterReplacingCharactersInSelection:withString:overrideObject:undoTransaction:](self, "pApplyOverrideObjectAfterReplacingCharactersInSelection:withString:overrideObject:undoTransaction:", a3, a4, v13, a6);
  if (__p)
  {
    v35 = __p;
    operator delete(__p);
  }
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  return -[TSWPStorage attributeArrayForKind:withCreate:fromUndo:undoTransaction:](self, "attributeArrayForKind:withCreate:fromUndo:undoTransaction:", *(_QWORD *)&a3, a4, 0, a5);
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4 fromUndo:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  TSWPAttributeArray **attributesTable;
  TSWPAttributeArray *result;
  BOOL v9;
  _BOOL4 v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  attributesTable = self->_attributesTable;
  result = self->_attributesTable[a3];
  if (result)
    v9 = 1;
  else
    v9 = !a4;
  if (!v9)
  {
    v11 = a5;
    v12 = *(_QWORD *)&a3;
    v13 = a3;
    v14 = (void *)objc_opt_class();
    if (v11)
      result = (TSWPAttributeArray *)objc_msgSend(v14, "createEmptyAttributeArrayForKind:", v12);
    else
      result = (TSWPAttributeArray *)objc_msgSend(v14, "createAttributeArrayForKind:undoTransaction:", v12, a6);
    attributesTable[v13] = result;
    if (result)
      result->var5 = self;
  }
  return result;
}

+ (TSWPAttributeArray)createAttributeArrayForKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  void *v9;
  uint64_t v10;
  _QWORD v11[2];

  v6 = +[TSWPStorage createEmptyAttributeArrayForKind:](TSWPStorage, "createEmptyAttributeArrayForKind:");
  v7 = v6;
  if (a3 > 0x12)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPStorage(AttributeTables) createAttributeArrayForKind:undoTransaction:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 116, CFSTR("createAttributeArrayForKind: bad kind."));
  }
  else if (((1 << a3) & 0x40F37) == 0)
  {
    v11[0] = 0;
    v11[1] = 0;
    TSWPAttributeArray::insertAttribute(v6, (const TSWPAttributeRecord *)v11, 0, 0, a4);
  }
  return v7;
}

+ (TSWPAttributeArray)createEmptyAttributeArrayForKind:(unsigned int)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  char *v8;
  void *v9;
  uint64_t v10;
  TSWPAttributeArray *v11;
  TSWPAttributeArray *v12;
  TSWPAttributeArray *v13;
  TSWPAttributeArray *v14;
  TSWPAttributeArray *v15;
  TSWPAttributeArray *v16;
  TSWPAttributeArray *v17;
  TSWPAttributeArray *v18;
  TSWPAttributeArray *v19;

  switch(a3)
  {
    case 0u:
    case 1u:
    case 2u:
    case 0xAu:
    case 0xBu:
    case 0x12u:
      v4 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x24BEDB6B8]);
      v5 = v4;
      if (v4)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v4, a3);
        goto LABEL_4;
      }
      break;
    case 3u:
      v11 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x24BEDB6B8]);
      v5 = v11;
      if (v11)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v11, 3);
        v5->var0 = (void **)&off_24D82E248;
        LOBYTE(v5[1].var0) = 0;
        *(_QWORD *)&v5[1].var1 = 0;
      }
      break;
    case 4u:
      v12 = (TSWPAttributeArray *)operator new(0x38uLL, MEMORY[0x24BEDB6B8]);
      v5 = v12;
      if (v12)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v12, 4);
        goto LABEL_16;
      }
      break;
    case 5u:
      v13 = (TSWPAttributeArray *)operator new(0x38uLL, MEMORY[0x24BEDB6B8]);
      v5 = v13;
      if (v13)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v13, 5);
LABEL_16:
        goto LABEL_30;
      }
      break;
    case 6u:
    case 7u:
      v6 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x24BEDB6B8]);
      v5 = v6;
      if (v6)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v6, a3);
        goto LABEL_23;
      }
      break;
    case 8u:
      v14 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x24BEDB6B8]);
      v5 = v14;
      if (v14)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v14, 8);
        goto LABEL_4;
      }
      break;
    case 9u:
      v15 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x24BEDB6B8]);
      v5 = v15;
      if (v15)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v15, 9);
LABEL_4:
        v5->var0 = (void **)&off_24D82D510;
        LOBYTE(v5[1].var0) = 0;
        *(_QWORD *)&v5[1].var1 = 0x7FFFFFFFFFFFFFFFLL;
      }
      break;
    case 0xCu:
      v16 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x24BEDB6B8]);
      v5 = v16;
      if (v16)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v16, 12);
LABEL_23:
        LOBYTE(v5[1].var0) = 0;
        *(_QWORD *)&v5[1].var1 = 0;
        goto LABEL_30;
      }
      break;
    case 0xDu:
    case 0xEu:
      v7 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x24BEDB6B8]);
      v5 = v7;
      if (v7)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v7, a3);
        LOBYTE(v5[1].var0) = 0;
        *(_QWORD *)&v5[1].var1 = 0;
        goto LABEL_30;
      }
      break;
    case 0xFu:
      v17 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x24BEDB6B8]);
      v5 = v17;
      if (v17)
        TSWPChangeAttributeArray::TSWPChangeAttributeArray((uint64_t)v17, 15);
      break;
    case 0x10u:
      v18 = (TSWPAttributeArray *)operator new(0x50uLL, MEMORY[0x24BEDB6B8]);
      v5 = v18;
      if (v18)
        TSWPChangeAttributeArray::TSWPChangeAttributeArray((uint64_t)v18, 16);
      break;
    case 0x11u:
      v19 = (TSWPAttributeArray *)operator new(0x48uLL, MEMORY[0x24BEDB6B8]);
      v5 = v19;
      if (v19)
      {
        TSWPAttributeArray::TSWPAttributeArray((uint64_t)v19, 17);
        LOBYTE(v5[1].var0) = 0;
        *(_QWORD *)&v5[1].var1 = 0;
LABEL_30:
        v5->var0 = (void **)(v8 + 16);
      }
      break;
    default:
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPStorage(AttributeTables) createEmptyAttributeArrayForKind:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 83, CFSTR("createAttributeArrayForKind: bad kind."));
      v5 = 0;
      break;
  }
  return v5;
}

- (BOOL)isWritingDirectionRightToLeftForListAtParIndex:(unint64_t)a3
{
  id v5;
  void *v6;
  int v7;

  v5 = -[TSWPStorage listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", a3, 0);
  if (v5
    && (v6 = v5, objc_msgSend(v5, "containsProperty:", 44))
    && (v7 = objc_msgSend(v6, "intValueForProperty:", 44), v7 != -1))
  {
    return v7 != 0;
  }
  else
  {
    return -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:](self, "isWritingDirectionRightToLeftForParagraphAtParIndex:", -[TSWPStorage firstParIndexInListAtParIndex:](self, "firstParIndexInListAtParIndex:", a3));
  }
}

- (void)p_attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  TSWPAttributeArray *v13;
  void *var2;
  NSUInteger v15;
  unint64_t v16;

  v10 = 0;
  v11 = -[TSWPStorage characterCount](self, "characterCount") - a3;
  v12 = a3;
  do
  {
    if (!a4[v10])
      goto LABEL_9;
    v13 = self->_attributesTable[v10];
    if (!v13)
      goto LABEL_9;
    var2 = (void *)v13->var2;
    if (!var2)
      goto LABEL_10;
    if ((*((unsigned int (**)(TSWPAttributeArray *))v13->var0 + 2))(v13))
    {
      TSWPAttributeArray::rangeForCharIndex(v13, a3);
      v12 = NSIntersectionRangeInclusive();
      v11 = v15;
      v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, a3);
    }
    else
    {
      v16 = TSWPAttributeArray::exactAttributeIndexForCharIndex(v13, a3);
      v12 = a3;
      v11 = 1;
    }
    if (v16 != 0x7FFFFFFFFFFFFFFFLL)
      var2 = (void *)*((_QWORD *)v13->var4 + 2 * v16 + 1);
    else
LABEL_9:
      var2 = 0;
LABEL_10:
    a5[v10++] = var2;
  }
  while (v10 != 19);
  a6->location = v12;
  a6->length = v11;
}

- (unint64_t)storageLength
{
  return -[NSMutableString length](self->_string, "length");
}

- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4 requireHidden:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v12;
  NSUInteger v13;
  uint64_t v14;

  length = a4.length;
  location = a4.location;
  v12 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  v13 = location + length;
  if (v13 == -[TSWPStorage length](self, "length"))
  {
    v14 = -[TSWPStorage paragraphCount](self, "paragraphCount");
  }
  else if (length)
  {
    v14 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", v13 - 1) + 1;
  }
  else
  {
    v14 = v12 + 1;
  }
  return (TSWPParagraphEnumerator *)TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)retstr, (uint64_t)self, (uint64_t)a5, v12, v14, a6);
}

- (unint64_t)paragraphCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)enumerateSmartFieldsWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v8;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  _NSRange v19;
  id v20[6];
  NSRange v21;

  length = a4.length;
  location = a4.location;
  v8 = *(_QWORD *)&a3;
  if (a3 > 0xC || ((1 << a3) & 0x10C0) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5384, CFSTR("Not a smart field attribute kind"));
  }
  v12 = -[TSWPStorage length](self, "length");
  if (self->_attributesTable[v8])
  {
    v13 = v12;
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v20, self, location, length, v8);
    v19.location = 0;
    v19.length = 0;
    v18 = 0;
    while (1)
    {
      v14 = TSWPAttributeEnumerator::nextAttributeIndex(v20, &v19);
      if (!v14)
        break;
      v15 = *(_QWORD *)(v14 + 8);
      if (v15)
      {
        v21.location = location;
        v21.length = length;
        if (NSIntersectionRange(v21, v19).length
          || !length && TSWPInsertionPointInRangeWithOptions(location, 0, v19.location, v19.length, 0))
        {
          (*((void (**)(id, uint64_t, NSUInteger, NSUInteger, char *))a5 + 2))(a5, v15, v19.location, v19.length, &v18);
          if (-[TSWPStorage length](self, "length") != v13)
          {
            v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
            v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:]");
            objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5404, CFSTR("Storage was modified while enumerating attributes"));
          }
          if (v18)
            break;
        }
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v20);
  }
}

- (unint64_t)length
{
  return -[NSMutableString length](self->_string, "length");
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3), a4);
}

- (TSWPParagraphEnumerator)paragraphEnumeratorForCharRange:(SEL)a3 styleProvider:(_NSRange)a4
{
  if (self)
    return (TSWPParagraphEnumerator *)-[TSWPParagraphEnumerator paragraphEnumeratorForCharRange:styleProvider:requireHidden:](self, "paragraphEnumeratorForCharRange:styleProvider:requireHidden:", a4.location, a4.length, a5, 1);
  *(_QWORD *)&retstr->var6 = 0;
  *(_OWORD *)&retstr->var2 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  return self;
}

- (TSWPParagraphEnumerator)paragraphEnumeratorAtCharIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  TSWPParagraphEnumerator *result;
  unint64_t v10;
  unint64_t v11;

  result = -[TSWPStorage length](self, "length");
  if (self)
  {
    if ((unint64_t)result >= a4)
      v10 = a4;
    else
      v10 = (unint64_t)result;
    if ((unint64_t)result <= a4)
      v11 = a4;
    else
      v11 = (unint64_t)result;
    return -[TSWPStorage paragraphEnumeratorForCharRange:styleProvider:](self, "paragraphEnumeratorForCharRange:styleProvider:", v10, v11 - v10, a5);
  }
  else
  {
    *(_QWORD *)&retstr->var6 = 0;
    *(_OWORD *)&retstr->var2 = 0u;
    *(_OWORD *)&retstr->var4 = 0u;
    *(_OWORD *)&retstr->var0 = 0u;
  }
  return result;
}

- (_NSRange)textRangeForParagraphAtIndex:(unint64_t)a3
{
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (v5)
  {
    v6 = v5;
    v7 = TSWPAttributeArray::charIndexForAttributeIndex(v5, a3);
    if (a3 + 1 >= v6->var2)
      v8 = -[TSWPStorage characterCount](self, "characterCount");
    else
      v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3 + 1);
    v11 = v8 - v7;
  }
  else
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage textRangeForParagraphAtIndex:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3205, CFSTR("textRangeForParagraphAtIndex: no paragraph table."));
    v11 = 0;
    v7 = 0;
  }
  v12 = v7;
  result.length = v11;
  result.location = v12;
  return result;
}

- (unint64_t)characterCount
{
  return -[NSMutableString length](self->_string, "length");
}

- (unint64_t)paragraphIndexAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  void *v5;
  uint64_t v6;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (!v4)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphIndexAtCharIndex:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3193, CFSTR("paragraphIndexAtCharIndex: no paragraph table."));
  }
  return TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
}

- (TSWPAttributeArray)attributeArrayForKind:(unsigned int)a3
{
  return -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", *(_QWORD *)&a3, 0, 0);
}

- (unint64_t)firstParIndexInListAtParIndex:(unint64_t)a3
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  BOOL isFirstParagraph;
  void *v8;
  uint64_t v9;
  TSWPParagraphEnumerator v11;

  v3 = a3;
  if (self)
    -[TSWPStorage paragraphEnumeratorAtParIndex:styleProvider:](self, "paragraphEnumeratorAtParIndex:styleProvider:", a3, 0);
  else
    memset(&v11, 0, sizeof(v11));
  v4 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v11);
  v5 = TSWPParagraphEnumerator::paragraphLevel(&v11);
  if (v4 && objc_msgSend(v4, "labelTypeForLevel:", v5))
  {
    while (1)
    {
      isFirstParagraph = TSWPParagraphEnumerator::isFirstParagraph(&v11);
      if (!v3 || isFirstParagraph)
        break;
      TSWPParagraphEnumerator::operator--(&v11);
      v8 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v11);
      v9 = TSWPParagraphEnumerator::paragraphLevel(&v11);
      if (!v8 || !objc_msgSend(v8, "labelTypeForLevel:", v9))
        break;
      --v3;
    }
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v11);
  return v3;
}

- (id)listStyleAtParIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  NSUInteger v6;
  NSUInteger v7;

  v6 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3);
  if (a4)
  {
    a4->location = v6;
    a4->length = v7;
  }
  return -[TSWPStorage listStyleAtCharIndex:effectiveRange:](self, "listStyleAtCharIndex:effectiveRange:", v6, 0);
}

- (id)listStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  unint64_t v8;
  void *v9;
  NSUInteger v10;

  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 2);
  if (!v6)
    return 0;
  v7 = v6;
  v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v9 = (void *)*((_QWORD *)v7->var4 + 2 * v8 + 1);
  if (a4)
  {
    a4->location = TSWPAttributeArray::rangeForAttributeIndex(v7, v8);
    a4->length = v10;
  }
  return v9;
}

- (unint64_t)paragraphLevelAtParIndex:(unint64_t)a3
{
  return -[TSWPStorage paragraphLevelAtCharIndex:](self, "paragraphLevelAtCharIndex:", -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3));
}

- (unint64_t)paragraphLevelAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 1);
  if (!v4)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphLevelAtCharIndex:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4146, CFSTR("paragraphLevelAtCharIndex: no paragraph table."));
    return 0;
  }
  v5 = v4;
  if (!v4->var2)
    return 0;
  v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphLevelAtCharIndex:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4151, CFSTR("paragraphFlagsAtCharIndex: no paragraph table."));
  }
  return *((unsigned __int16 *)v5->var4 + 8 * v6 + 4);
}

- (TSWPParagraphEnumerator)paragraphEnumeratorAtParIndex:(SEL)a3 styleProvider:(unint64_t)a4
{
  return (TSWPParagraphEnumerator *)TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)retstr, (uint64_t)self, (uint64_t)a5, a4, -[TSWPStorage paragraphCount](self, "paragraphCount"), 1);
}

- (id)documentRoot
{
  return self->_documentRoot;
}

- (void)p_lowLevelReplaceCharactersInRange:(_NSRange)a3 withString:(id)a4 length:(unint64_t)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger length;
  NSUInteger location;
  void *v10;
  uint64_t v11;
  const __CFString *v12;

  length = a3.length;
  location = a3.location;
  if (a3.location + a3.length > -[NSMutableString length](self->_string, "length"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TSWPStorage_private) p_lowLevelReplaceCharactersInRange:withString:length:undoTransaction:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_private.mm"), 143, CFSTR("Attempting to delete past end of storage."));
  }
  if (a4)
    v12 = (const __CFString *)a4;
  else
    v12 = &stru_24D82FEB0;
  -[NSMutableString replaceCharactersInRange:withString:](self->_string, "replaceCharactersInRange:withString:", location, length, v12);
}

- (id)pOverrideObjectBeforeReplacingCharactersInSelection:(id)a3 withString:(id)a4
{
  uint64_t v7;
  uint64_t v8;

  v7 = objc_msgSend(a3, "range");
  return -[TSWPStorage pOverrideObjectBeforeReplacingCharactersInRange:withString:withInsertionBehavior:](self, "pOverrideObjectBeforeReplacingCharactersInRange:withString:withInsertionBehavior:", v7, v8, a4, objc_msgSend(a3, "styleInsertionBehavior"));
}

- (id)pOverrideObjectBeforeReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 withInsertionBehavior:(int)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  uint64_t v11;
  id v12;
  TSWPStorage *v13;
  NSUInteger v14;
  unint64_t v15;
  __int128 v17;

  length = a3.length;
  location = a3.location;
  v17 = *MEMORY[0x24BEB3BF0];
  if (!objc_msgSend(a4, "length") || !length)
  {
    v11 = objc_msgSend(a4, "length");
    v10 = 0;
    if (!v11 || length)
      return v10;
    if (a5 == 2)
    {
      v12 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location, 6, &v17);
      v10 = 0;
      if (!v12 || (_QWORD)v17 != location)
        return v10;
    }
    else
    {
      if (a5 == 1)
      {
        if (!location)
          goto LABEL_4;
        v10 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location - 1, 6, &v17);
        if (!v10)
          return v10;
        if (*((_QWORD *)&v17 + 1) + (_QWORD)v17 != location)
          goto LABEL_4;
        v13 = self;
        v14 = location - 1;
        goto LABEL_31;
      }
      if (a5)
        goto LABEL_4;
      if (!location)
      {
        v10 = -[TSWPStorage length](self, "length");
        if (v10)
        {
          if (-[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", 0, 6, &v17))
          {
            goto LABEL_40;
          }
          v10 = -[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", 0);
          if (v10)
            goto LABEL_40;
        }
        return v10;
      }
      if (!-[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location - 1, 6, &v17)|| *((_QWORD *)&v17 + 1) + (_QWORD)v17 != location)
      {
        v10 = -[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", location - 1);
        if (v10 && location >= 2)
        {
          v10 = -[TSWPStorage pFindValidInsertionCharStyleFromCharIndex:](self, "pFindValidInsertionCharStyleFromCharIndex:", location - 2);
          if (v10)
            return v10;
        }
        else if (!v10)
        {
          return v10;
        }
      }
      if (location >= -[TSWPStorage length](self, "length"))
        goto LABEL_40;
      v15 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location, 6, &v17);
      if (v15 | (unint64_t)-[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", location))goto LABEL_40;
    }
    v13 = self;
    v14 = location;
LABEL_31:
    v10 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](v13, "characterStyleAtCharIndex:effectiveRange:", v14, 0);
    if (v10)
      return v10;
    goto LABEL_40;
  }
  if (a5)
  {
LABEL_4:
    v10 = 0;
    return v10;
  }
  if ((-[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", location, 6, &v17)&& (_QWORD)v17 == location&& objc_msgSend((id)objc_opt_class(), "defaultFieldStyleIdentifier")|| (v10 = -[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", location)) != 0)&& (!location|| (v10 = -[TSWPStorage pFindValidInsertionCharStyleFromCharIndex:](self, "pFindValidInsertionCharStyleFromCharIndex:", location - 1)) == 0))
  {
LABEL_40:
    v10 = (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  }
  return v10;
}

- (void)pApplyOverrideObjectAfterReplacingCharactersInSelection:(id)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v10;
  uint64_t v11;

  v10 = objc_msgSend(a3, "range");
  -[TSWPStorage pApplyOverrideObjectAfterReplacingCharactersInRange:withString:overrideObject:undoTransaction:](self, "pApplyOverrideObjectAfterReplacingCharactersInRange:withString:overrideObject:undoTransaction:", v10, v11, a4, a5, a6);
}

- (void)pApplyOverrideObjectAfterReplacingCharactersInRange:(_NSRange)a3 withString:(id)a4 overrideObject:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  id v12;

  location = a3.location;
  v10 = objc_msgSend(a4, "length", a3.location, a3.length);
  if (a5)
  {
    v11 = v10;
    if ((id)objc_msgSend(MEMORY[0x24BDBCEF8], "null") == a5)
      v12 = 0;
    else
      v12 = a5;
    -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", v12, location, v11, a6);
  }
}

- (BOOL)isInInit
{
  return self->_isInInit;
}

- (id)footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  unint64_t v7;
  unint64_t v8;
  id result;
  TSWPAttributeArray *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;

  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (!v5
    || (v6 = v5, !v5->var2)
    || (v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3), v7 == 0x7FFFFFFFFFFFFFFFLL)
    || (v8 = v7, TSWPAttributeArray::charIndexForAttributeIndex(v6, v7) != a3)
    || (result = (id)*((_QWORD *)v6->var4 + 2 * v8 + 1)) == 0)
  {
    if (-[TSWPStorage wpKind](self, "wpKind") != 2)
      return 0;
    result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
    if (!result)
      return result;
    v10 = (TSWPAttributeArray *)result;
    if (*((_QWORD *)result + 2)
      && (v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v11 != 0x7FFFFFFFFFFFFFFFLL)
      && (v12 = v11, TSWPAttributeArray::charIndexForAttributeIndex(v10, v11) == a3))
    {
      v13 = (void *)*((_QWORD *)v10->var4 + 2 * v12 + 1);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        return v13;
      else
        return 0;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (void)setParagraphStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphsInCharRange:forKind:undoTransaction:](self, "applyObject:toParagraphsInCharRange:forKind:undoTransaction:", a3, a4.location, a4.length, 0, a5);
}

- (void)setCharacterStyle:(id)a3 range:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, a4.location, a4.length, 3, 0, a5);
}

- (BOOL)hasSmartFields
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage range](self, "range");
  return -[TSWPStorage hasSmartFieldsInRange:](self, "hasSmartFieldsInRange:", v3, v4);
}

- (BOOL)hasSmartFieldsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v5;
  BOOL v6;
  _NSRange v8;
  id v9[6];
  NSRange v10;

  if (!self->_attributesTable[6])
    return 0;
  length = a3.length;
  location = a3.location;
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v9, self, a3.location, a3.length, 6);
  v8.location = 0;
  v8.length = 0;
  while (1)
  {
    v5 = TSWPAttributeEnumerator::nextAttributeIndex(v9, &v8);
    v6 = v5 != 0;
    if (!v5)
      break;
    if (*(_QWORD *)(v5 + 8))
    {
      v10.location = location;
      v10.length = length;
      if (NSIntersectionRange(v8, v10).length)
        break;
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v9);
  return v6;
}

- (unint64_t)attachmentCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (TSDContainerInfo)parentInfo
{
  return self->_parentInfo;
}

- (id)string
{
  return self->_string;
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSMutableString characterAtIndex:](self->_string, "characterAtIndex:", a3);
}

- (BOOL)hasTrackedChanges
{
  return -[TSWPStorage insertionChangesTable](self, "insertionChangesTable")
      || -[TSWPStorage deletionChangesTable](self, "deletionChangesTable") != 0;
}

- (TSWPChangeAttributeArray)insertionChangesTable
{
  return (TSWPChangeAttributeArray *)-[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 15);
}

- (TSWPChangeAttributeArray)deletionChangesTable
{
  return (TSWPChangeAttributeArray *)-[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 16);
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  unint64_t v7;
  unint64_t v8;
  id result;
  TSWPAttributeArray *v10;
  unint64_t v11;
  unint64_t v12;

  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (!v5
    || (v6 = v5, !v5->var2)
    || (v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3), v7 == 0x7FFFFFFFFFFFFFFFLL)
    || (v8 = v7, TSWPAttributeArray::charIndexForAttributeIndex(v6, v7) != a3)
    || (result = (id)*((_QWORD *)v6->var4 + 2 * v8 + 1)) == 0)
  {
    result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
    if (result)
    {
      v10 = (TSWPAttributeArray *)result;
      if (*((_QWORD *)result + 2)
        && (v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
            v11 != 0x7FFFFFFFFFFFFFFFLL)
        && (v12 = v11, TSWPAttributeArray::charIndexForAttributeIndex(v10, v11) == a3))
      {
        return (id)*((_QWORD *)v10->var4 + 2 * v12 + 1);
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  id result;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (result)
  {
    v5 = (TSWPAttributeArray *)result;
    if (*((_QWORD *)result + 2)
      && (v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL)
      && (v7 = v6, TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3))
    {
      return (id)*((_QWORD *)v5->var4 + 2 * v7 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (_NSRange)attachmentIndexRangeForTextRange:(_NSRange)a3
{
  uint64_t *v3;
  NSUInteger v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  __n128 (*v12)(__n128 *, __n128 *);
  uint64_t (*v13)();
  void *v14;
  __int128 v15;
  _NSRange result;

  v9 = 0;
  v10 = &v9;
  v11 = 0x4012000000;
  v12 = __Block_byref_object_copy__24;
  v13 = __Block_byref_object_dispose__24;
  v14 = &unk_217C8B239;
  v15 = xmmword_217C27470;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__TSWPStorage_attachmentIndexRangeForTextRange___block_invoke;
  v8[3] = &unk_24D82E038;
  v8[4] = &v9;
  -[TSWPStorage enumerateAttachmentsInTextRange:usingBlock:](self, "enumerateAttachmentsInTextRange:usingBlock:", a3.location, a3.length, v8);
  v3 = v10;
  v4 = v10[6];
  if (v4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 0;
    v10[6] = 0;
  }
  v5 = v3[7];
  _Block_object_dispose(&v9, 8);
  v6 = v4;
  v7 = v5;
  result.length = v7;
  result.location = v6;
  return result;
}

- (void)enumerateAttachmentsOfClass:(Class)a3 inTextRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v9;
  _QWORD v10[9];
  _QWORD v11[3];
  char v12;

  length = a4.length;
  location = a4.location;
  v9 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (v9)
  {
    v11[0] = 0;
    v11[1] = v11;
    v11[2] = 0x2020000000;
    v12 = 0;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __66__TSWPStorage_enumerateAttachmentsOfClass_inTextRange_usingBlock___block_invoke;
    v10[3] = &unk_24D82E010;
    v10[7] = location;
    v10[8] = length;
    v10[4] = a3;
    v10[5] = a5;
    v10[6] = v11;
    TSWPAttributeArray::enumerateObjectAttributesInCharacterRange(v9, location, length, (uint64_t)v10);
    _Block_object_dispose(v11, 8);
  }
}

- (void)enumerateAttachmentsInTextRange:(_NSRange)a3 usingBlock:(id)a4
{
  -[TSWPStorage enumerateAttachmentsOfClass:inTextRange:usingBlock:](self, "enumerateAttachmentsOfClass:inTextRange:usingBlock:", objc_opt_class(), a3.location, a3.length, a4);
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 left:(BOOL)a4 effectiveRange:(_NSRange *)a5
{
  _BOOL4 v6;
  unint64_t v7;
  void *v9;
  uint64_t v10;
  TSWPAttributeArray *v11;
  TSWPAttributeArray *v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;

  v6 = a4;
  v7 = a3;
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4203, CFSTR("charIndex has an uninitialized value"));
  }
  v11 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 3);
  if (!v11 || (v12 = v11, !v11->var2))
  {
    if (a5)
    {
      v15 = -[TSWPStorage range](self, "range");
      goto LABEL_13;
    }
    return 0;
  }
  if (v6)
  {
    if (!v7)
      goto LABEL_9;
    --v7;
  }
  v13 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v11, v7);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v16 = (void *)*((_QWORD *)v12->var4 + 2 * v13 + 1);
    if (!a5)
      return v16;
    v15 = TSWPAttributeArray::rangeForAttributeIndex(v12, v13);
    goto LABEL_14;
  }
LABEL_9:
  if (!a5)
    return 0;
  v14 = TSWPAttributeArray::charIndexForAttributeIndex(v12, 0);
  v15 = 0;
LABEL_13:
  v16 = 0;
LABEL_14:
  a5->location = v15;
  a5->length = v14;
  return v16;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  return -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", a3, 0, a4);
}

- (id)attachmentAtAttachmentIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4
{
  TSWPAttributeArray *v6;
  void *v7;

  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (!v6 || v6->var2 <= a3)
    return 0;
  v7 = (void *)*((_QWORD *)v6->var4 + 2 * a3 + 1);
  if (a4)
    *a4 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3);
  return v7;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return a3;
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 stylesheet:(id)a5 kind:(int)a6
{
  return -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:](self, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:", a3, a4, *(_QWORD *)&a6, a5, objc_msgSend(a5, "defaultParagraphStyle"), objc_msgSend(a5, "defaultListStyle"), 0, 0);
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10
{
  uint64_t v13;
  void *v17;
  _BOOL4 v18;
  uint64_t v20;

  v13 = *(_QWORD *)&a5;
  objc_opt_class();
  objc_msgSend(a3, "documentObject");
  v17 = (void *)TSUDynamicCast();
  if (v17)
    v18 = objc_msgSend(v17, "writingDirection") == 2;
  else
    v18 = 0;
  LODWORD(v20) = v18;
  return -[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:](self, "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", a3, a4, v13, a6, a7, a8, a9, a10, v20);
}

- (void)dealloc
{
  uint64_t v3;
  TSWPAttributeArray *v4;
  objc_super v5;

  v3 = 0;
  self->_broadcaster = 0;
  do
  {
    v4 = self->_attributesTable[v3];
    if (v4)
      (*((void (**)(TSWPAttributeArray *))v4->var0 + 1))(v4);
    ++v3;
  }
  while (v3 != 19);

  v5.receiver = self;
  v5.super_class = (Class)TSWPStorage;
  -[TSWPStorage dealloc](&v5, sel_dealloc);
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 notifyObservers:(BOOL)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  _BOOL8 v7;
  TSWPSelection *v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  v7 = a5;
  v10 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  v11 = -[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", v10, a4, v7, 0, 0, a6, 0);
  v13 = v12;

  v14 = v11;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)p_replaceCharactersInLogicalSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9
{
  uint64_t location;
  NSUInteger v13;
  NSUInteger length;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t *v32;
  uint64_t *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  uint64_t *v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  TSWPStorage *v43;
  NSRange *v44;
  unsigned __int8 v45;
  NSRange v46;
  NSUInteger v47;
  void *v48;
  uint64_t v49;
  NSUInteger v50;
  NSUInteger v51;
  uint64_t *v52;
  _NSRange *v53;
  _NSRange *v54;
  NSUInteger v55;
  BOOL v56;
  NSUInteger v57;
  NSUInteger v58;
  id v59;
  id v60;
  char v62;
  id obj;
  uint64_t v64;
  TSWPStorage *v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  void *__p;
  uint64_t *v72;
  uint64_t *v73;
  _BYTE v74[128];
  uint64_t v75;
  NSRange v76;
  _NSRange result;

  v62 = a5;
  v75 = *MEMORY[0x24BDAC8D0];
  location = objc_msgSend(a3, "range");
  length = v13;
  objc_msgSend(a3, "range");
  if (v15 || objc_msgSend(a4, "length"))
  {
    v16 = objc_msgSend(a3, "range");
    v66 = self;
    if (v16 != -[TSWPStorage length](self, "length")
      && (-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", objc_msgSend(a3, "range")) & 0xFC00) == 0xDC00)
    {
      v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:]");
      objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2432, CFSTR("Inserting text within surrogate pair"));
    }
    -[TSPObject willModify](self, "willModify");
    v60 = -[TSWPStorage relocateNonSelectedAnchorsInSelection:undoTransaction:](self, "relocateNonSelectedAnchorsInSelection:undoTransaction:", a3, a8);
    self->_delayBroadcast = 1;
    v59 = a4;
    v19 = -[TSWPStorage p_replacementsForSelection:withString:changeSession:shouldTrackDeletions:](self, "p_replacementsForSelection:withString:changeSession:shouldTrackDeletions:");
    __p = 0;
    v72 = 0;
    v73 = 0;
    v20 = *MEMORY[0x24BEB3BF0];
    v21 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
    v67 = 0u;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    obj = v19;
    v22 = 0;
    v23 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
    if (v23)
    {
      v64 = *(_QWORD *)v68;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v68 != v64)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v67 + 1) + 8 * i);
          objc_msgSend(v25, "performWithStorage:delta:undoTransaction:replaceBlock:");
          v26 = objc_msgSend(v25, "delta");
          v27 = objc_msgSend(v25, "insertedRange");
          v29 = v27;
          v30 = v28;
          v31 = v72;
          if (v72 >= v73)
          {
            v33 = (uint64_t *)__p;
            v34 = ((char *)v72 - (_BYTE *)__p) >> 4;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 60)
              abort();
            v36 = (char *)v73 - (_BYTE *)__p;
            if (((char *)v73 - (_BYTE *)__p) >> 3 > v35)
              v35 = v36 >> 3;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF0)
              v37 = 0xFFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)&v73, v37);
              v33 = (uint64_t *)__p;
              v31 = v72;
            }
            else
            {
              v38 = 0;
            }
            v39 = (uint64_t *)&v38[16 * v34];
            *v39 = v29;
            v39[1] = v30;
            v40 = (char *)v39;
            if (v31 != v33)
            {
              do
              {
                *((_OWORD *)v40 - 1) = *((_OWORD *)v31 - 1);
                v40 -= 16;
                v31 -= 2;
              }
              while (v31 != v33);
              v33 = (uint64_t *)__p;
            }
            v32 = v39 + 2;
            __p = v40;
            v72 = v39 + 2;
            v73 = (uint64_t *)&v38[16 * v37];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *v72 = v27;
            v31[1] = v28;
            v32 = v31 + 2;
          }
          v72 = v32;
          objc_msgSend(v25, "insertedRange");
          if (v41)
          {
            v20 = objc_msgSend(v25, "insertedRange");
            v21 = v42;
          }
          v22 += v26;
        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v67, v74, 16);
      }
      while (v23);
    }
    if (a6)
    {
      v43 = v66;
      if (v21)
      {
        if (!objc_msgSend(a6->var0, "isEqualToString:", CFSTR("TSWPShouldExtendStoredLanguage")))
        {
          if (objc_msgSend(v59, "isEqualToString:", CFSTR("\t"))
            && -[TSWPStorage writingDirectionForParagraphAtCharIndex:](v66, "writingDirectionForParagraphAtCharIndex:", v20) == 1&& objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", a6->var0) != 2)
          {
            -[TSWPStorage setLanguage:forCharRange:undoTransaction:](v66, "setLanguage:forCharRange:undoTransaction:", *MEMORY[0x24BEB3D40], v20, v21, a8);
          }
          else
          {
            -[TSWPStorage setLanguage:forCharRange:undoTransaction:](v66, "setLanguage:forCharRange:undoTransaction:", a6->var0, v20, v21, a8);
          }
        }
        -[TSWPStorage setDictationAndAutocorrection:forCharRange:undoTransaction:](v66, "setDictationAndAutocorrection:forCharRange:undoTransaction:", a6->var1, v20, v21, a8);
      }
    }
    else
    {
      v43 = v66;
      if (v21)
        -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](v66, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, v20, v21, 13, 0, a8);
    }
    v43->_delayBroadcast = 0;
    location = objc_msgSend(v60, "range");
    length = 0;
    v44 = (NSRange *)__p;
    if (__p != v72)
    {
      v45 = 0;
      do
      {
        v76.location = location;
        v76.length = length;
        v46 = NSUnionRange(v76, *v44);
        location = v46.location;
        length = v46.length;
        v47 = v44->length;
        if (((v47 != 0) & v45) == 1)
        {
          v48 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v49 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:]");
          objc_msgSend(v48, "handleFailureInFunction:file:lineNumber:description:", v49, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2510, CFSTR("multiple inserted ranges aren't handled yet"));
        }
        v45 |= v47 != 0;
        ++v44;
      }
      while (v44 != (NSRange *)v72);
    }
    if ((v62 & 1) != 0)
    {
      v50 = v66->_rangeToBroadcast.location;
      v51 = v66->_rangeToBroadcast.length;
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v66, "p_didChangeRange:delta:broadcastKind:", location, length, v22, 1);
      if (v50 | v51)
        -[TSWPStorage p_didChangeRange:delta:broadcastKind:](v66, "p_didChangeRange:delta:broadcastKind:", v50, v51, 0, 1);
    }
    v52 = (uint64_t *)__p;
    if (a9)
    {
      v53 = (_NSRange *)v72;
      if (__p != v72)
      {
        v54 = (_NSRange *)__p;
        do
        {
          *a9 = *v54;
          v55 = v54->length;
          ++v54;
          if (v55)
            v56 = 1;
          else
            v56 = v54 == v53;
        }
        while (!v56);
      }
    }
    v66->_rangeToBroadcast.location = 0;
    v66->_rangeToBroadcast.length = 0;
    if (v52)
    {
      v72 = v52;
      operator delete(v52);
    }
  }
  v57 = location;
  v58 = length;
  result.length = v58;
  result.location = v57;
  return result;
}

- (void)compressAttributeArrayKind:(unsigned int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  TSWPAttributeArray **attributesTable;
  TSWPAttributeArray *v5;

  attributesTable = self->_attributesTable;
  v5 = self->_attributesTable[a3];
  if (v5)
  {
    (*((void (**)(TSWPAttributeArray *, TSWPStorageTransaction *))v5->var0 + 19))(self->_attributesTable[a3], a4);
    if ((*((unsigned int (**)(TSWPAttributeArray *))v5->var0 + 6))(v5))
    {
      (*((void (**)(TSWPAttributeArray *))v5->var0 + 1))(v5);
      attributesTable[a3] = 0;
    }
  }
}

- (void)applyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  uint64_t v8;

  v8 = *(_QWORD *)&a5;
  -[TSWPStorage lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, a4.location, a4.length, *(_QWORD *)&a5, a6);
  -[TSWPStorage compressAttributeArrayKind:undoTransaction:](self, "compressAttributeArrayKind:undoTransaction:", v8, a7);
}

- (void)lowLevelApplyObject:(id)a3 toCharRange:(_NSRange)a4 forKind:(int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v13;
  TSWPAttributeArray *v14;
  void *v15;
  uint64_t v16;

  if (a5 <= 0x11 && ((1 << a5) & 0x3F0C8) != 0)
  {
    length = a4.length;
    location = a4.location;
    v13 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", *(_QWORD *)&a5, a3 != 0, a7);
    if (v13)
    {
      v14 = v13;
      -[TSPObject willModify](self, "willModify");
      (*((void (**)(TSWPAttributeArray *, id, NSUInteger, NSUInteger, id, TSWPStorageTransaction *))v14->var0
       + 8))(v14, a3, location, length, a6, a7);
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, length, 0, 0);
    }
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.location, a4.length);
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 309, CFSTR("applyObject:toCharRange: Bad attribute array."));
  }
}

- (TSWPStorage)initWithContext:(id)a3 string:(id)a4 kind:(int)a5 stylesheet:(id)a6 paragraphStyle:(id)a7 listStyle:(id)a8 section:(id)a9 columnStyle:(id)a10 paragraphDirection:(int)a11
{
  uint64_t v15;
  TSWPStorage *v18;
  TSWPStorage *v19;
  uint64_t v20;
  TSWPStorage *v21;
  id v22;
  void *v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v28;

  if (!a7)
  {
    v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4, *(_QWORD *)&a5, a6, 0, a8);
    v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:]");
    objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 381, CFSTR("initWithString: Missing paragraph style."));

    return 0;
  }
  v15 = *(_QWORD *)&a5;
  v18 = -[TSPObject initWithContext:](self, "initWithContext:");
  v19 = v18;
  if (v18)
  {
    v18->_isInInit = 1;
    v18->_stylesheet = (TSSStylesheet *)a6;
    v19->_WPKind = v15;
    v19->_writingDirectionCache = -1;
    -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](v19, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", a7, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 0, 1, 0), 0, 0, 0);
    -[TSWPStorage insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:](v19, "insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:", 0, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 1, 1, 0), 0, 0);
    -[TSWPStorage insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:](v19, "insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:", 0, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 11, 1, 0), 0, 0);
    -[TSWPStorage insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:](v19, "insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:", a11, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 18, 1, 0), 0, 0);
    if ((_DWORD)v15 == 5)
      -[TSWPStorage insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:](v19, "insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:", a11, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 10, 1, 0), 0, 0);
    if (a8)
    {
      v20 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 2, 1, 0);
      v21 = v19;
      v22 = a8;
    }
    else
    {
      if (v19->_WPKind != 5
        || -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 2, 0, 0))
      {
        goto LABEL_11;
      }
      v28 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 2, 1, 0);
      v22 = (id)objc_msgSend(-[TSWPStorage stylesheet](v19, "stylesheet"), "defaultListStyle");
      v21 = v19;
      v20 = v28;
    }
    -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](v21, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", v22, 0, v20, 0, 0, 0);
LABEL_11:
    if (-[TSWPStorage supportsSections](v19, "supportsSections"))
    {
      v25 = a9;
      if (!a9)
        v25 = -[TSWPStorage pDefaultSectionForContext:](v19, "pDefaultSectionForContext:", a3);
      -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](v19, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", v25, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 8, 1, 0), 0, 0, 0);
    }
    if (-[TSWPStorage supportsColumnStyles](v19, "supportsColumnStyles"))
    {
      v26 = a10;
      if (!a10)
        v26 = (id)objc_msgSend(a6, "defaultColumnStyle");
      -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](v19, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", v26, 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](v19, "attributeArrayForKind:withCreate:undoTransaction:", 9, 1, 0), 0, 0, 0);
    }
    v19->_string = (NSMutableString *)objc_alloc_init((Class)objc_msgSend((id)objc_opt_class(), "pStringClassForWPKind:", v15));
    if (a4)
      -[TSWPStorage insertString:atCharIndex:undoTransaction:](v19, "insertString:atCharIndex:undoTransaction:", a4, 0, 0);
    v19->_isInInit = 0;
  }
  return v19;
}

- (void)insertObject:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8
{
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[2];

  -[TSPObject willModify](self, "willModify");
  if (!a5)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 266, CFSTR("insertObject: Bad attribute array."));
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:]");
    objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 267, CFSTR("insertObject: Bad attribute index."));
  }
  v21[0] = a4;
  v21[1] = a3;
  TSWPAttributeArray::insertAttribute(a5, (const TSWPAttributeRecord *)v21, a6, (TSKAddedToDocumentContext *)a7, a8);
  v19 = TSWPAttributeArray::rangeForAttributeIndex(a5, a6);
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v19, v20, 0, 0);
}

- (void)insertParagraphData:(id)a3 charIndex:(unint64_t)a4 attributeArray:(TSWPAttributeArray *)a5 attributeIndex:(unint64_t)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unsigned int var0;

  -[TSPObject willModify](self, "willModify");
  if (!a5)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 283, CFSTR("insertParagraphData: Bad attribute array."));
  }
  if (a6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertParagraphData:charIndex:attributeArray:attributeIndex:undoTransaction:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 284, CFSTR("insertParagraphData: Bad attribute index."));
  }
  v19 = a4;
  var0 = a3.var0.var0.var0;
  TSWPAttributeArray::insertAttribute(a5, (const TSWPAttributeRecord *)&v19, a6, 0, a7);
  v17 = TSWPAttributeArray::rangeForAttributeIndex(a5, a6);
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v17, v18, 0, 0);
}

- (void)p_didChangeRange:(_NSRange)a3 delta:(int64_t)a4 broadcastKind:(int)a5
{
  uint64_t v5;
  NSUInteger length;
  NSUInteger location;
  _NSRange *p_rangeToBroadcast;
  NSRange v11;
  NSRange v12;

  v5 = *(_QWORD *)&a5;
  length = a3.length;
  location = a3.location;
  ++self->_changeCount;
  if (a4 || !self->_delayBroadcast)
  {
    -[TSPObject willModify](self, "willModify");
    -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, location, length, a4, v5);
  }
  else
  {
    p_rangeToBroadcast = &self->_rangeToBroadcast;
    v11.location = self->_rangeToBroadcast.location;
    if (*(_OWORD *)&self->_rangeToBroadcast == 0)
    {
      p_rangeToBroadcast->location = a3.location;
      self->_rangeToBroadcast.length = a3.length;
    }
    else
    {
      v11.length = self->_rangeToBroadcast.length;
      v12 = NSUnionRange(v11, a3);
      p_rangeToBroadcast->location = v12.location;
      self->_rangeToBroadcast.length = v12.length;
    }
  }
}

- (BOOL)supportsSections
{
  return self->_WPKind == 0;
}

- (BOOL)supportsColumnStyles
{
  return self->_WPKind == 0;
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v5 = -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", a3.location, a3.length, a4, 1, a5);
  result.length = v6;
  result.location = v5;
  return result;
}

- (void)insertString:(id)a3 atCharIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self, "replaceCharactersInRange:withString:undoTransaction:", a4, 0, a3, a5);
}

+ (Class)pStringClassForWPKind:(int)a3
{
  return (Class)objc_opt_class();
}

uint64_t __137__TSWPStorage_p_replaceCharactersInLogicalSelection_withString_withFlags_replaceTextData_changeSession_undoTransaction_outInsertedRange___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "p_replaceCharactersInSelection:withString:length:undoTransaction:", a2, a3, objc_msgSend(a3, "length"), *(_QWORD *)(a1 + 40));
}

- (void)applyObject:(id)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7;
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v12;
  TSWPParagraphAttributeArray *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  TSWPAttributeArray *v19;
  TSWPParagraphAttributeArray *v20;
  NSRange v21;
  NSRange v22;
  _NSRange v23;

  v7 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v12 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 1, a6);
  if (v12)
  {
    v13 = (TSWPParagraphAttributeArray *)v12;
    v14 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", location);
    v16 = v15;
    v22.location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", length + location - 1);
    v22.length = v17;
    v21.location = v14;
    v21.length = v16;
    v18 = NSUnionRange(v21, v22);
    v19 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v7, a3 != 0, a6);
    if (v19)
    {
      v20 = (TSWPParagraphAttributeArray *)v19;
      -[TSPObject willModify](self, "willModify");
      v23.location = location;
      v23.length = length;
      TSWPParagraphAttributeArray::applyObjectToParagraphRange(v20, (objc_object *)a3, v23, v13, a6);
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0);
    }
  }
}

- (id)p_replacementsForSelection:(id)a3 withString:(id)a4 changeSession:(id)a5 shouldTrackDeletions:(BOOL)a6
{
  _BOOL4 v6;
  void *v11;
  NSUInteger v12;
  TSWPChangeAttributeArray *v13;
  TSWPAttributeArray *v14;
  unint64_t i;
  NSUInteger v16;
  TSWPAttributeArray *v17;
  TSWPAttributeArray *v18;
  unint64_t j;
  NSUInteger v20;
  TSWPAttributeArray *v21;
  TSWPAttributeArray *v22;
  unint64_t k;
  NSUInteger v24;
  _NSRange *end;
  _NSRange *begin;
  TSWPChangeAttributeArray *v27;
  TSWPAttributeArray *v28;
  unint64_t v29;
  uint64_t v30;
  NSUInteger v31;
  id v32;
  NSUInteger v33;
  _NSRange *v34;
  _NSRange *v35;
  NSUInteger v36;
  NSUInteger location;
  NSUInteger length;
  void *v39;
  void *v40;
  TSWPTextReplacement *v41;
  TSWPTextReplacement *v42;
  _NSRange *v43;
  _NSRange *v44;
  void *v45;
  id m;
  TSWPTrackedDeletion *v47;
  void *v48;
  TSWPTrackedInsertion *v49;
  id v51;
  id v52;
  _NSRange v53;
  TSWPAttributeArray *v54;
  uint64_t v55;
  TSWPAttributeArray *v56;
  unint64_t v57;
  TSWPRangeVector __p;
  TSWPRangeVector v59;
  _NSRange v60;

  v6 = a6;
  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  if (a5)
  {
    v60.location = objc_msgSend(a3, "range");
    v60.length = v12;
    TSWPRangeVector::TSWPRangeVector(&v59, &v60);
    memset(&__p, 0, sizeof(__p));
    if (v60.length)
    {
      if (v6)
        TSWPRangeVector::addRange(&__p, &v60);
      v13 = -[TSWPStorage insertionChangesTable](self, "insertionChangesTable");
      v14 = (TSWPAttributeArray *)v13;
      if (v13)
      {
        TSWPAttributeArray::begin((TSWPAttributeArray *)v13, &v60, &v56);
        TSWPAttributeArray::end(v14, &v60, &v54);
        for (i = v57; i != v55; i = ++v57)
        {
          if (objc_msgSend(*((id *)v56->var4 + 2 * i + 1), "isFromChangeSession:", a5))
          {
            v53.location = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            v53.length = v16;
            TSWPRangeVector::removeRange(&__p, &v53);
          }
        }
      }
      v17 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
      v18 = v17;
      if (v17)
      {
        TSWPAttributeArray::begin(v17, &v60, &v56);
        TSWPAttributeArray::end(v18, &v60, &v54);
        for (j = v57; j != v55; v57 = j)
        {
          if ((objc_msgSend(*((id *)v56->var4 + 2 * j + 1), "elementKind") & 0x10000F) != 0)
          {
            v20 = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            if (v20 != 0x7FFFFFFFFFFFFFFFLL)
            {
              v53.location = v20;
              v53.length = 1;
              TSWPRangeVector::removeRange(&__p, &v53);
            }
          }
          j = v57 + 1;
        }
      }
      v21 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 6);
      v22 = v21;
      if (v21)
      {
        TSWPAttributeArray::begin(v21, &v60, &v56);
        TSWPAttributeArray::end(v22, &v60, &v54);
        for (k = v57; k != v55; v57 = k)
        {
          if (objc_msgSend(*((id *)v56->var4 + 2 * k + 1), "isMemberOfClass:", objc_opt_class()))
          {
            v53.location = 0;
            v53.length = 0;
            v53.location = TSWPAttributeArray::rangeForAttributeIndex(v56, v57);
            v53.length = v24;
            TSWPRangeVector::removeRange(&__p, &v53);
          }
          k = v57 + 1;
        }
      }
      begin = __p.__begin_;
      end = __p.__end_;
      while (begin != end)
        TSWPRangeVector::removeRange(&v59, begin++);
      v27 = -[TSWPStorage deletionChangesTable](self, "deletionChangesTable");
      v28 = (TSWPAttributeArray *)v27;
      if (v27)
      {
        TSWPAttributeArray::begin((TSWPAttributeArray *)v27, &v60, &v56);
        TSWPAttributeArray::end(v28, &v60, &v54);
        v29 = v57;
        v30 = v55;
        while (v29 != v30)
        {
          if (*((_QWORD *)v56->var4 + 2 * v29 + 1))
          {
            v53.location = TSWPAttributeArray::rangeForAttributeIndex(v56, v29);
            v53.length = v31;
            TSWPRangeVector::removeRange(&__p, &v53);
            v29 = v57;
            v30 = v55;
          }
          v57 = ++v29;
        }
      }
    }
    v51 = a5;
    v52 = a3;
    v32 = a4;
    v33 = v60.length + v60.location;
    v35 = v59.__begin_;
    v34 = v59.__end_;
    if (v59.__begin_ == v59.__end_)
    {
      v36 = 0;
    }
    else
    {
      v36 = 0;
      do
      {
        location = v35->location;
        length = v35->length;
        if (length + v35->location == v60.length + v60.location)
        {
          v36 = v35->length;
          v33 = v35->location;
          v39 = v32;
        }
        else
        {
          v39 = 0;
        }
        if (!objc_msgSend(v39, "length", v51))
        {
          v40 = (void *)objc_msgSend(v52, "copyWithNewRange:", location, length);
          v41 = -[TSWPTextReplacement initWithSelection:string:]([TSWPTextReplacement alloc], "initWithSelection:string:", v40, v39);
          objc_msgSend(v11, "addObject:", v41);

        }
        ++v35;
      }
      while (v35 != v34);
    }
    v43 = __p.__begin_;
    v44 = __p.__end_;
    v45 = v32;
    for (m = v51; v43 != v44; ++v43)
    {
      v47 = -[TSWPTrackedDeletion initWithRange:changeSession:]([TSWPTrackedDeletion alloc], "initWithRange:changeSession:", v43->location, v43->length, v51);
      objc_msgSend(v11, "addObject:", v47);

    }
    if (objc_msgSend(v45, "length", v51))
    {
      v48 = (void *)objc_msgSend(v52, "copyWithNewRange:", v33, v36);
      v49 = -[TSWPTrackedInsertion initWithSelection:string:changeSession:]([TSWPTrackedInsertion alloc], "initWithSelection:string:changeSession:", v48, v45, m);
      objc_msgSend(v11, "addObject:", v49);

    }
    if (__p.__begin_)
    {
      __p.__end_ = __p.__begin_;
      operator delete(__p.__begin_);
    }
    if (v59.__begin_)
    {
      v59.__end_ = v59.__begin_;
      operator delete(v59.__begin_);
    }
  }
  else
  {
    v42 = -[TSWPTextReplacement initWithSelection:string:]([TSWPTextReplacement alloc], "initWithSelection:string:", a3, a4);
    objc_msgSend(v11, "addObject:", v42);

  }
  objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_76);
  return v11;
}

- (void)p_handleChangeSplittingForInsertedRange:(_NSRange)a3 changeSession:(id)a4 undoTransaction:(void *)a5
{
  uint64_t i;
  uint64_t v9;
  TSWPAttributeArray *v10;
  TSWPAttributeArray *v11;
  unint64_t j;
  char *v13;
  void *v14;
  NSUInteger v15;
  uint64_t v16;
  NSUInteger v17;
  void *v18;
  NSUInteger v19;
  NSUInteger v20;
  TSWPAttributeArray *v21[2];
  TSWPAttributeArray *v22;
  unint64_t v23;
  _NSRange v24;

  v24 = a3;
  if (a3.length)
  {
    for (i = 0; i != 2; ++i)
    {
      v9 = *((unsigned int *)&unk_217C2BD68 + i);
      v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v9);
      if (v10)
      {
        v11 = v10;
        TSWPAttributeArray::begin(v10, &v24, &v22);
        TSWPAttributeArray::end(v11, &v24, v21);
        for (j = v23; (TSWPAttributeArray *)j != v21[1]; j = ++v23)
        {
          v13 = (char *)v22->var4 + 16 * j;
          v14 = (void *)*((_QWORD *)v13 + 1);
          if (v14)
          {
            if (-[TSWPStorage p_shouldInsertionSplitChange:changeSession:](self, "p_shouldInsertionSplitChange:changeSession:", *((_QWORD *)v13 + 1), a4))
            {
              v15 = TSWPAttributeArray::rangeForAttributeIndex(v22, v23);
              if (v15 < v24.location)
              {
                v17 = v15 + v16;
                if (v15 + v16 > v24.length + v24.location)
                {
                  v18 = (void *)objc_msgSend(v14, "copyWithContext:", -[TSPObject context](self, "context"));
                  if (v24.length + v24.location <= v17)
                    v19 = v17;
                  else
                    v19 = v24.length + v24.location;
                  if (v24.length + v24.location >= v17)
                    v20 = v17;
                  else
                    v20 = v24.length + v24.location;
                  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v18, v20, v19 - v20, v9, 0, a5);
                  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, v24.location, v24.length, v9, 0, a5);

                }
              }
            }
          }
        }
      }
    }
  }
}

- (id)relocateNonSelectedAnchorsInSelection:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t location;
  NSUInteger v13;
  NSUInteger length;
  NSUInteger v15;
  char v18;
  _NSRange v19;
  _NSRange v20;
  TSWPRangeVector __p;

  -[TSPObject willModify](self, "willModify");
  if (!objc_msgSend(a3, "isRange"))
    return a3;
  memset(&__p, 0, sizeof(__p));
  if (objc_msgSend(a3, "isVisual"))
  {
    v7 = objc_msgSend(a3, "visualRanges");
    if (&__p != (TSWPRangeVector *)v7)
      std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>((char *)&__p, *(char **)v7, *(_QWORD *)(v7 + 8), (uint64_t)(*(_QWORD *)(v7 + 8) - *(_QWORD *)v7) >> 4);
  }
  if (!objc_msgSend(a3, "visualRangeCount"))
  {
    v8 = 1;
LABEL_10:
    v10 = 0;
    v18 = 0;
    v11 = v8;
    v9 = a3;
    do
    {
      v20.location = 0;
      v20.length = 0;
      if (v8 == 1)
      {
        location = objc_msgSend(a3, "range");
        length = v13;
        v20.location = location;
        v20.length = v13;
      }
      else
      {
        v20 = *(_NSRange *)(*(_QWORD *)objc_msgSend(a3, "visualRanges") + v10);
        location = v20.location;
        length = v20.length;
      }
      v19.location = 0;
      v19.length = 0;
      v19.location = -[TSWPStorage p_RelocateNonSelectedAnchorsInRange:selectionInfos:undoTransaction:](self, "p_RelocateNonSelectedAnchorsInRange:selectionInfos:undoTransaction:", location, length, objc_msgSend((id)TSUProtocolCast(), "infos"), a4);
      v19.length = v15;
      if (v20.location != v19.location || v20.length != v15)
      {
        if (objc_msgSend(a3, "isVisual"))
        {
          TSWPRangeVector::removeRange(&__p, &v20);
          TSWPRangeVector::addRange(&__p, &v19);
          v18 = 1;
        }
        else
        {
          v9 = (id)objc_msgSend(a3, "copyWithNewRange:", v19.location, v19.length);
        }
      }
      v10 += 16;
      --v11;
    }
    while (v11);
    if ((v18 & 1) != 0)
      v9 = (id)objc_msgSend(a3, "copyWithNewVisualRanges:", &__p);
    goto LABEL_24;
  }
  v8 = objc_msgSend(a3, "visualRangeCount");
  if (v8)
    goto LABEL_10;
  v9 = a3;
LABEL_24:
  if (__p.__begin_)
  {
    __p.__end_ = __p.__begin_;
    operator delete(__p.__begin_);
  }
  return v9;
}

- (BOOL)isDOLCSuppressed
{
  return self->_dolcSuppressed;
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  CFRetain(a3);
  return a3;
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  -[NSMutableString getCharacters:range:](self->_string, "getCharacters:range:", a3, a4.location, a4.length);
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4 passingTest:(id)a5
{
  void *v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  uint64_t v13;

  v8 = 0;
  v9 = &v8;
  v10 = 0x3052000000;
  v11 = __Block_byref_object_copy__199;
  v12 = __Block_byref_object_dispose__200;
  v13 = 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__TSWPStorage_smartFieldsWithAttributeKind_intersectingRange_passingTest___block_invoke;
  v7[3] = &unk_24D82E060;
  v7[4] = a5;
  v7[5] = &v8;
  -[TSWPStorage enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", *(_QWORD *)&a3, a4.location, a4.length, v7);
  v5 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v5;
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  return -[TSWPStorage smartFieldsWithAttributeKind:intersectingRange:passingTest:](self, "smartFieldsWithAttributeKind:intersectingRange:passingTest:", *(_QWORD *)&a3, a4.location, a4.length, 0);
}

- (id)languageForTextRange:(_NSRange)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  NSUInteger v11;
  unint64_t v12;
  NSUInteger *v13;
  __CFString *v14;
  unint64_t v15;
  __CFString *v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  uint64_t v20;
  __CFString *v21;
  NSRange v22;
  uint64_t v24;
  uint64_t v25;
  __CFString *v28;
  BOOL v29;
  __CFString *v30;
  NSUInteger v32;
  _BOOL4 v33;
  _BOOL4 v34;
  NSUInteger v35;
  NSRange v36;
  NSRange v37;
  CFRange v38;

  v5 = a5;
  v6 = a4;
  length = a3.length;
  location = a3.location;
  v10 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  v35 = location;
  v11 = location + length;
  v12 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", location + length);
  if (v12 > v10)
    v12 -= v11 == -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", v12);
  v13 = (NSUInteger *)MEMORY[0x24BEB3BF0];
  v34 = v6;
  if (v10 > v12)
  {
LABEL_4:
    v14 = 0;
    v15 = v35;
LABEL_5:
    if (v15 <= v11)
    {
      v32 = length;
      v33 = v5;
      v16 = 0;
      v17 = v15;
      v18 = *v13;
      v19 = v13[1];
      while (1)
      {
        v36 = *(NSRange *)v13;
        v20 = objc_msgSend(-[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", v17, &v36), "valueForProperty:", 39);
        if (v36.location >= v11)
          break;
        v21 = (__CFString *)v20;
        if (!v20 || v20 == objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
          goto LABEL_43;
        if (v16)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_43;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || !-[__CFString isEqualToString:](v16, "isEqualToString:", v21))
          {
            goto LABEL_43;
          }
        }
        else
        {
          v16 = v21;
        }
        v22 = v36;
        if (v36.length + v36.location <= v17)
          ++v17;
        else
          v17 = v36.length + v36.location;
        if (v18 != *v13 || v19 != v13[1])
        {
          v37.location = v18;
          v37.length = v19;
          v22 = NSUnionRange(v37, v22);
        }
        v18 = v22.location;
        v19 = v22.length;
        if (v17 > v11)
          goto LABEL_38;
      }
      v22.location = v18;
      v22.length = v19;
      if (!v16)
      {
LABEL_43:
        v5 = v33;
        length = v32;
        v15 = v35;
        goto LABEL_44;
      }
LABEL_38:
      v15 = v35;
      v5 = v33;
      length = v32;
      if (v22.location == v35 && v22.length == v32 || v22.location <= v35 && v22.location + v22.length >= v11)
        v14 = v16;
    }
    goto LABEL_44;
  }
  v14 = 0;
  do
  {
    v24 = objc_msgSend(-[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", v10, 0), "valueForProperty:", 39);
    v25 = v24;
    if (v14)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
        goto LABEL_4;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || !-[__CFString isEqualToString:](v14, "isEqualToString:", v25))
      {
        goto LABEL_4;
      }
    }
    else
    {
      v14 = (__CFString *)v24;
    }
    ++v10;
  }
  while (v10 <= v12);
  v15 = v35;
  if (!v14 || v14 == (__CFString *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    goto LABEL_5;
LABEL_44:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (unint64_t)-[__CFString length](v14, "length") >= 2 && v14)
    return v14;
  if (length == v13[1] && v15 == *v13 || length == 0)
  {
    v14 = 0;
  }
  else
  {
    v28 = -[TSWPStorage bestCharacterLanguageForTextRange:](self, "bestCharacterLanguageForTextRange:", v15, length);
    v14 = v28;
    if (v28)
      goto LABEL_65;
  }
  if (!v34 || ((v14 = 0, length == v13[1]) ? (v29 = v15 == *v13) : (v29 = 0), v29 || !length))
  {
LABEL_65:
    if (v14)
      return v14;
    goto LABEL_66;
  }
  v38.location = v15;
  v38.length = length;
  v30 = (__CFString *)CFStringTokenizerCopyBestStringLanguage((CFStringRef)self->_string, v38);
  if (v30)
  {
    v14 = v30;
    goto LABEL_65;
  }
  v14 = 0;
LABEL_66:
  if (v5)
    return -[TSKDocumentRoot creationLanguage](self->_documentRoot, "creationLanguage");
  return v14;
}

- (id)languageAtParIndex:(unint64_t)a3 useStringTokenizer:(BOOL)a4 useCreationLanguage:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  uint64_t v8;
  unint64_t v9;

  v5 = a5;
  v6 = a4;
  v8 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3);
  return -[TSWPStorage languageForTextRange:useStringTokenizer:useCreationLanguage:](self, "languageForTextRange:useStringTokenizer:useCreationLanguage:", v8, (_QWORD)((__PAIR128__(v9, v8 + v9) - -[TSWPStorage length](self, "length")) >> 64), v6, v5);
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  uint64_t v5;
  int v6;

  v5 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:");
  if ((v5 - 4) < 0xC && ((0x907u >> (v5 - 4)) & 1) != 0
    || (v6 = IsParagraphBreakingCharacter(v5)) != 0
    && (-[TSWPStorage hasColumnStyleForParagraphBreakAtCharIndex:](self, "hasColumnStyleForParagraphBreakAtCharIndex:", a3)|| (v6 = -[TSWPStorage hasSectionForParagraphBreakAtCharIndex:](self, "hasSectionForParagraphBreakAtCharIndex:", a3)) != 0))
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (void)p_fillMarkers:(void *)a3 string:(id)a4 length:(unint64_t)a5 hasAttachments:(BOOL *)a6 hasFootnotes:(BOOL *)a7 hasBreaks:(BOOL *)a8
{
  unint64_t v11;
  uint64_t v13;
  __int16 v14;
  unint64_t v15;
  unint64_t v16;
  __int16 v17;
  CFIndex v18;
  UniChar *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t i;
  int v23;
  BOOL *v25;
  int v26;
  CFIndex v27;
  UniChar v28;
  unint64_t v29;
  unint64_t v30;
  char *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  char *v38;
  char *v39;
  char *v40;
  unint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  unint64_t v45;
  uint64_t v46;
  unint64_t v47;
  char *v48;
  uint64_t v49;
  unint64_t v50;
  uint64_t v51;
  unint64_t v52;
  char *v53;
  uint64_t v54;
  unint64_t v55;
  uint64_t v56;
  unint64_t v57;
  char *v58;
  char *v59;
  char *v60;
  char *v61;
  char *v62;
  char *v63;
  char *v64;
  CFIndex v67;
  unint64_t v68;
  char *v69;
  CFRange v71;

  if (a5)
  {
    v11 = a5;
    if (a5 == 1)
    {
      v13 = objc_msgSend(a4, "characterAtIndex:", 0);
      if ((_DWORD)v13 == 14)
      {
        if (a7)
          *a7 = 1;
        v41 = *((_QWORD *)a3 + 2);
        v16 = *((_QWORD *)a3 + 1);
        if (v16 < v41)
        {
          *(_QWORD *)v16 = 0;
          v17 = 14;
          goto LABEL_54;
        }
        v49 = (uint64_t)(v16 - *(_QWORD *)a3) >> 4;
        v50 = v49 + 1;
        if (!((unint64_t)(v49 + 1) >> 60))
        {
          v51 = v41 - *(_QWORD *)a3;
          if (v51 >> 3 > v50)
            v50 = v51 >> 3;
          if ((unint64_t)v51 >= 0x7FFFFFFFFFFFFFF0)
            v52 = 0xFFFFFFFFFFFFFFFLL;
          else
            v52 = v50;
          if (v52)
            v53 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v52);
          else
            v53 = 0;
          v59 = &v53[16 * v49];
          v60 = &v53[16 * v52];
          *(_QWORD *)v59 = 0;
          *((_WORD *)v59 + 4) = 14;
          v43 = v59 + 16;
          v63 = *(char **)a3;
          v61 = (char *)*((_QWORD *)a3 + 1);
          if (v61 == *(char **)a3)
            goto LABEL_97;
          do
          {
            *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
            v59 -= 16;
            v61 -= 16;
          }
          while (v61 != v63);
          goto LABEL_96;
        }
      }
      else
      {
        v14 = v13;
        if ((_DWORD)v13 == 65532)
        {
          if (a6)
            *a6 = 1;
          v15 = *((_QWORD *)a3 + 2);
          v16 = *((_QWORD *)a3 + 1);
          if (v16 < v15)
          {
            *(_QWORD *)v16 = 0;
            v17 = -4;
LABEL_54:
            *(_WORD *)(v16 + 8) = v17;
LABEL_60:
            v43 = (char *)(v16 + 16);
LABEL_99:
            *((_QWORD *)a3 + 1) = v43;
            return;
          }
          v44 = (uint64_t)(v16 - *(_QWORD *)a3) >> 4;
          v45 = v44 + 1;
          if (!((unint64_t)(v44 + 1) >> 60))
          {
            v46 = v15 - *(_QWORD *)a3;
            if (v46 >> 3 > v45)
              v45 = v46 >> 3;
            if ((unint64_t)v46 >= 0x7FFFFFFFFFFFFFF0)
              v47 = 0xFFFFFFFFFFFFFFFLL;
            else
              v47 = v45;
            if (v47)
              v48 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v47);
            else
              v48 = 0;
            v59 = &v48[16 * v44];
            v60 = &v48[16 * v47];
            *(_QWORD *)v59 = 0;
            *((_WORD *)v59 + 4) = -4;
            v43 = v59 + 16;
            v62 = *(char **)a3;
            v61 = (char *)*((_QWORD *)a3 + 1);
            if (v61 == *(char **)a3)
              goto LABEL_97;
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
              v59 -= 16;
              v61 -= 16;
            }
            while (v61 != v62);
LABEL_96:
            v61 = *(char **)a3;
LABEL_97:
            *(_QWORD *)a3 = v59;
            *((_QWORD *)a3 + 1) = v43;
            *((_QWORD *)a3 + 2) = v60;
            if (v61)
              operator delete(v61);
            goto LABEL_99;
          }
        }
        else
        {
          if (!IsParagraphBreakingCharacter(v13))
            return;
          if (a8)
            *a8 = 1;
          v42 = *((_QWORD *)a3 + 2);
          v16 = *((_QWORD *)a3 + 1);
          if (v16 < v42)
          {
            *(_QWORD *)v16 = 0;
            *(_WORD *)(v16 + 8) = v14;
            goto LABEL_60;
          }
          v54 = (uint64_t)(v16 - *(_QWORD *)a3) >> 4;
          v55 = v54 + 1;
          if (!((unint64_t)(v54 + 1) >> 60))
          {
            v56 = v42 - *(_QWORD *)a3;
            if (v56 >> 3 > v55)
              v55 = v56 >> 3;
            if ((unint64_t)v56 >= 0x7FFFFFFFFFFFFFF0)
              v57 = 0xFFFFFFFFFFFFFFFLL;
            else
              v57 = v55;
            if (v57)
              v58 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a3 + 16, v57);
            else
              v58 = 0;
            v59 = &v58[16 * v54];
            v60 = &v58[16 * v57];
            *(_QWORD *)v59 = 0;
            *((_WORD *)v59 + 4) = v14;
            v43 = v59 + 16;
            v64 = *(char **)a3;
            v61 = (char *)*((_QWORD *)a3 + 1);
            if (v61 == *(char **)a3)
              goto LABEL_97;
            do
            {
              *((_OWORD *)v59 - 1) = *((_OWORD *)v61 - 1);
              v59 -= 16;
              v61 -= 16;
            }
            while (v61 != v64);
            goto LABEL_96;
          }
        }
      }
LABEL_101:
      abort();
    }
    v18 = 0;
    v19 = 0;
    v69 = (char *)a3 + 16;
    do
    {
      if (!v19)
        v19 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
      v20 = v18 + 1024;
      v68 = v18 + 1024;
      if (v18 + 1024 >= v11)
        v20 = v11;
      v67 = v20;
      v21 = v20 - v18;
      v71.location = v18;
      v71.length = v20 - v18;
      CFStringGetCharacters((CFStringRef)a4, v71, v19);
      if (v21 >= 1)
      {
        for (i = 0; i != v21; ++i)
        {
          if ((IsParagraphBreakingCharacter(v19[i]) & 1) == 0)
          {
            v23 = v19[i];
            if (v23 != 65532 && v23 != 14)
              continue;
          }
          if (a6 && (v25 = a6, (__int16)v19[i] == -4)
            || a7 && (v25 = a7, v19[i] == 14)
            || a8 && (v26 = IsParagraphBreakingCharacter(v19[i]), v25 = a8, v26))
          {
            *v25 = 1;
          }
          v27 = i + v18;
          v28 = v19[i];
          v30 = *((_QWORD *)a3 + 1);
          v29 = *((_QWORD *)a3 + 2);
          if (v30 >= v29)
          {
            v32 = (uint64_t)(v30 - *(_QWORD *)a3) >> 4;
            v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 60)
              goto LABEL_101;
            v34 = v29 - *(_QWORD *)a3;
            if (v34 >> 3 > v33)
              v33 = v34 >> 3;
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF0)
              v35 = 0xFFFFFFFFFFFFFFFLL;
            else
              v35 = v33;
            if (v35)
              v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)v69, v35);
            else
              v36 = 0;
            v37 = &v36[16 * v32];
            *(_QWORD *)v37 = v27;
            *((_WORD *)v37 + 4) = v28;
            v39 = *(char **)a3;
            v38 = (char *)*((_QWORD *)a3 + 1);
            v40 = v37;
            if (v38 != *(char **)a3)
            {
              do
              {
                *((_OWORD *)v40 - 1) = *((_OWORD *)v38 - 1);
                v40 -= 16;
                v38 -= 16;
              }
              while (v38 != v39);
              v38 = *(char **)a3;
            }
            v31 = v37 + 16;
            *(_QWORD *)a3 = v40;
            *((_QWORD *)a3 + 1) = v37 + 16;
            *((_QWORD *)a3 + 2) = &v36[16 * v35];
            if (v38)
              operator delete(v38);
          }
          else
          {
            *(_QWORD *)v30 = v27;
            *(_WORD *)(v30 + 8) = v28;
            v31 = (char *)(v30 + 16);
          }
          *((_QWORD *)a3 + 1) = v31;
        }
      }
      v18 = v67;
      v11 = a5;
    }
    while (v68 < a5);
    if (v19)
      free(v19);
  }
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return a3;
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  TSWPAttributeArray *v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;

  v6 = self->_attributesTable[a4];
  if (!v6)
  {
    if (a5)
    {
      v9 = -[TSWPStorage range](self, "range", a3);
      goto LABEL_7;
    }
    return 0;
  }
  v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(self->_attributesTable[a4], a3);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (a5)
    {
      v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, 0);
      v9 = 0;
LABEL_7:
      v10 = 0;
LABEL_10:
      a5->location = v9;
      a5->length = v8;
      return v10;
    }
    return 0;
  }
  v10 = (void *)*((_QWORD *)v6->var4 + 2 * v7 + 1);
  if (a5)
  {
    v9 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
    goto LABEL_10;
  }
  return v10;
}

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = -[NSMutableString length](self->_string, "length");
  v3 = 0;
  result.length = v2;
  result.location = v3;
  return result;
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  id result;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (result)
  {
    v5 = (TSWPAttributeArray *)result;
    if (*((_QWORD *)result + 2)
      && (v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL)
      && (v7 = v6, TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3))
    {
      return (id)*((_QWORD *)v5->var4 + 2 * v7 + 1);
    }
    else
    {
      return 0;
    }
  }
  return result;
}

uint64_t __66__TSWPStorage_enumerateAttachmentsOfClass_inTextRange_usingBlock___block_invoke(uint64_t a1, int a2, int a3, NSRange range2, _BYTE *a5)
{
  uint64_t result;
  NSRange v8;

  v8 = NSIntersectionRange(*(NSRange *)(a1 + 56), range2);
  result = v8.location;
  if (v8.length)
  {
    result = objc_opt_isKindOfClass();
    if ((result & 1) != 0)
      result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }
  else if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *a5 = 1;
  }
  return result;
}

uint64_t __48__TSWPStorage_attachmentIndexRangeForTextRange___block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)(result + 32) + 8);
  if (*(_QWORD *)(v3 + 48) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = 1;
    *(_QWORD *)(v3 + 48) = a3;
  }
  else
  {
    v4 = *(_QWORD *)(v3 + 56) + 1;
  }
  *(_QWORD *)(v3 + 56) = v4;
  return result;
}

+ (void)resetDisallowedElementKinds
{
  sDisallowElementKinds = xmmword_217C2B1A0;
  unk_253DE2220 = xmmword_217C2B1B0;
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char isKindOfClass;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v9 = 5;
  else
    v9 = 4;
  if ((isKindOfClass & 1) != 0)
    v10 = 14;
  else
    v10 = 65532;
  v11 = -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", v10, a3, v9, location, length, 0, 0, 0);
  result.length = v12;
  result.location = v11;
  return result;
}

- (_NSRange)insertSpecialCharacter:(unsigned __int16)a3 object:(id)a4 kind:(unsigned int)a5 range:(_NSRange)a6 dolcContext:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v11;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  void *v16;
  TSWPAttributeArray *v17;
  TSWPAttributeArray *v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  const __CFString *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  uint64_t v34;
  unsigned __int16 v35;
  _NSRange result;

  length = a6.length;
  location = a6.location;
  v11 = *(_QWORD *)&a5;
  v35 = a3;
  v13 = *MEMORY[0x24BEB3BF0];
  v34 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  if (((1 << a5) & 0x301) != 0)
    v14 = a6.location + 1;
  else
    v14 = a6.location;
  if (a5 <= 9)
    v15 = v14;
  else
    v15 = a6.location;
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v35, 1);
  -[TSWPStorage replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length), v16, 0, 0, a9, a8, 0);

  v17 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v11, 1, a8);
  if (v17)
  {
    v18 = v17;
    v19 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v17, v15);
    if (v19 != 0x7FFFFFFFFFFFFFFFLL)
    {
      TSWPAttributeArray::replaceObjectForAttributeIndex(v18, (objc_object *)a4, v19, (TSKAddedToDocumentContext *)a7, a8);
      v29 = 1;
      v13 = location;
      goto LABEL_13;
    }
    v20 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:]");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm");
    v23 = CFSTR("insertSpecialCharacter: Bad attribute index.");
    v24 = (void *)v20;
    v25 = v21;
    v26 = 236;
  }
  else
  {
    v27 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v28 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:]");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm");
    v23 = CFSTR("insertSpecialCharacter: Bad attribute array.");
    v24 = (void *)v27;
    v25 = v28;
    v26 = 232;
  }
  objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, v22, v26, v23);
  v29 = v34;
LABEL_13:
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, 1, 1 - length, 1);
  v30 = v13;
  v31 = v29;
  result.length = v31;
  result.location = v30;
  return result;
}

- (_NSRange)replaceCharactersInSelection:(id)a3 withString:(id)a4 withFlags:(unsigned int)a5 replaceTextData:(id *)a6 changeSession:(id)a7 undoTransaction:(TSWPStorageTransaction *)a8 outInsertedRange:(_NSRange *)a9
{
  uint64_t v9;
  id v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t i;
  TSWPSelection *v20;
  uint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  uint64_t v25;
  NSUInteger v26;
  void *__p;
  _BYTE *v31;
  _NSRange result;

  v9 = *(_QWORD *)&a5;
  v11 = a3;
  if ((unint64_t)objc_msgSend(a3, "visualRangeCount") < 2)
  {
    if (objc_msgSend(v11, "isVisual"))
    {
      v21 = objc_msgSend(v11, "superRange");
      v11 = (id)objc_msgSend(v11, "copyWithNewType:range:", 0, v21, v22);
    }
    v23 = -[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", v11, a4, v9, a6, a7, a8, a9);
  }
  else
  {
    std::vector<CGPoint>::vector(&__p, objc_msgSend(v11, "visualRanges"));
    v13 = objc_msgSend(v11, "superRange");
    v15 = v14;
    v26 = v13;
    v16 = objc_msgSend(a4, "length");
    v25 = v16 + v15 - TSWPRangeVector::characterCount((TSWPRangeVector *)objc_msgSend(v11, "visualRanges"));
    v17 = ((v31 - (_BYTE *)__p) >> 4) + 1;
    for (i = (v31 - (_BYTE *)__p) & 0xFFFFFFFFFFFFFFF0; v17-- > 1; i -= 16)
    {
      v20 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", *(_QWORD *)((char *)__p + i - 16), *(_QWORD *)((char *)__p + i - 8));
      -[TSWPStorage p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "p_replaceCharactersInLogicalSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", v20, a4, v9, a6, a7, a8, a9);

      a4 = &stru_24D82FEB0;
    }
    if (__p)
    {
      v31 = __p;
      operator delete(__p);
    }
    v24 = v25;
    v23 = v26;
  }
  result.length = v24;
  result.location = v23;
  return result;
}

+ (id)plainTextPasteStringForStorages:(id)a3 forcePlainText:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id result;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  if (!a4)
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v5 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v24;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(a3);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v8), "canPasteAsPlainText"))
          return 0;
        if (v6 == ++v8)
        {
          v6 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
          if (v6)
            goto LABEL_4;
          break;
        }
      }
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = (id)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (!result)
    return result;
  v10 = result;
  v11 = 0;
  v12 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v10; i = (char *)i + 1)
    {
      if (*(_QWORD *)v20 != v12)
        objc_enumerationMutation(a3);
      v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
      v15 = objc_msgSend(v14, "range");
      v17 = (void *)objc_msgSend(v14, "stringEquivalentFromRange:withLayoutParent:", v15, v16, 0);
      if (v17)
      {
        v18 = v17;
        if (objc_msgSend(v17, "length"))
        {
          if (v11)
            v11 = (void *)objc_msgSend(v11, "stringByAppendingFormat:", CFSTR("%c%@"), 10, v18);
          else
            v11 = v18;
        }
      }
    }
    v10 = (id)objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  }
  while (v10);
  if (!v11)
    return 0;
  if (objc_msgSend(v11, "length"))
    return v11;
  else
    return 0;
}

- (id)plainTextStringFromRange:(_NSRange)a3 convertTextualAttachments:(BOOL)a4 includeChildTextStorages:(BOOL)a5 forExport:(BOOL)a6 withLayoutParent:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unsigned int v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  BOOL v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  unsigned int v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  int v37;
  unsigned int i;
  void *v39;
  void *v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  __CFString *v45;
  int v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  int v58;
  BOOL v59;
  const __CFString *v60;
  __CFString *v61;
  _BOOL4 v63;
  id v64;
  NSUInteger v65;
  _BOOL4 v66;
  id v68;
  TSWPFilteredStorage *v70;
  uint64_t v71;

  v66 = a6;
  v63 = a5;
  length = a3.length;
  location = a3.location;
  v70 = -[TSWPFilteredStorage initWithStorage:subRange:removeRanges:]([TSWPFilteredStorage alloc], "initWithStorage:subRange:removeRanges:", self, location, length, -[TSWPStorage deletedRangesInRange:](self, "deletedRangesInRange:", location, length));
  v68 = (id)objc_msgSend(-[TSWPFilteredStorage string](v70, "string"), "mutableCopy");
  objc_msgSend(v68, "replaceBreaksWithPlainTextVersions");
  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v65 = length;
  v11 = -[TSWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", location, length);
  if (v12)
  {
    v13 = v11;
    v14 = v12;
    v15 = 0;
    v16 = 1;
    do
    {
      v71 = 0x7FFFFFFFFFFFFFFFLL;
      v17 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v15 + v13, &v71);
      if (v17)
      {
        v18 = v17;
        if (!-[TSWPStorage hasDeletionInRange:](self, "hasDeletionInRange:", v71, 1))
        {
          v19 = objc_alloc(MEMORY[0x24BDD16E0]);
          v20 = (void *)objc_msgSend(v19, "initWithUnsignedInteger:", v71);
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v18, v20, 0);
          objc_msgSend(v10, "addObject:", v21);

        }
      }
      v15 = v16;
      v22 = v14 > v16++;
    }
    while (v22);
  }
  v23 = -[TSWPStorage footnoteRangeForTextRange:](self, "footnoteRangeForTextRange:", location, v65);
  if (v24)
  {
    v25 = v23;
    v26 = v24;
    v27 = 0;
    v28 = 1;
    do
    {
      v71 = 0x7FFFFFFFFFFFFFFFLL;
      v29 = -[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", v27 + v25, &v71);
      if (v29)
      {
        v30 = v29;
        if (!-[TSWPStorage hasDeletionInRange:](self, "hasDeletionInRange:", v71, 1))
        {
          v31 = objc_alloc(MEMORY[0x24BDD16E0]);
          v32 = (void *)objc_msgSend(v31, "initWithUnsignedInteger:", v71);
          v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v30, v32, 0);
          objc_msgSend(v10, "addObject:", v33);

        }
      }
      v27 = v28;
      v22 = v26 > v28++;
    }
    while (v22);
  }
  objc_msgSend(v10, "sortUsingFunction:context:", compareAttachments, 0);
  v34 = objc_msgSend(v10, "count");
  if (v34)
  {
    v35 = v34;
    v36 = 0;
    v37 = 0;
    for (i = 0; i < v35; v36 = ++i)
    {
      v39 = (void *)objc_msgSend(v10, "objectAtIndexedSubscript:", v36);
      v40 = (void *)objc_msgSend(v39, "objectAtIndexedSubscript:", 0);
      v41 = -[TSWPFilteredStorage charIndexMappedFromStorage:](v70, "charIndexMappedFromStorage:", objc_msgSend((id)objc_msgSend(v39, "objectAtIndexedSubscript:", 1), "unsignedIntValue"))+ v37;
      if (v41 >= 0x7FFFFFFFFFFFFFFFLL)
      {
        v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v44 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TSWPStorage_conversion) plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:]");
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v44, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion.mm"), 228, CFSTR("Bad charIndex"));
      }
      else
      {
        if (!a4)
          goto LABEL_32;
        if (v40)
        {
          if ((objc_opt_respondsToSelector() & 1) != 0 || (objc_opt_respondsToSelector() & 1) != 0)
          {
            if ((objc_opt_respondsToSelector() & 1) != 0)
              v42 = objc_msgSend(v40, "performSelector:withObject:", sel_stringEquivalentWithLayoutParent_, a7);
            else
              v42 = objc_msgSend(v40, "stringEquivalent");
            if (v42)
              v45 = (__CFString *)v42;
            else
              v45 = &stru_24D82FEB0;
            v46 = -[__CFString length](v45, "length");
            objc_msgSend(v68, "replaceCharactersInRange:withString:", v41, 1, v45);
            v37 = v37 + v46 - 1;
            continue;
          }
          if (v63)
          {
            if (v66 && (objc_opt_respondsToSelector() & 1) != 0)
            {
              v47 = (void *)objc_msgSend(v40, "textRepresentationForExport");
LABEL_37:
              v48 = v47;
              if (!v47)
                goto LABEL_42;
              v49 = objc_msgSend(v47, "length");
              if (!v49)
                goto LABEL_42;
              v50 = (void *)objc_msgSend(v48, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", 0, v49, 1, 1, v66, a7);
              if (!v50)
                goto LABEL_42;
              v51 = v50;
              if (!objc_msgSend(v50, "length"))
                goto LABEL_42;
              v64 = v51;
              if (!v64)
                goto LABEL_42;
LABEL_52:
              if (v41)
                goto LABEL_53;
LABEL_55:
              v58 = 0;
            }
            else
            {
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v47 = (void *)objc_msgSend(v40, "textRepresentationForCopy");
                goto LABEL_37;
              }
LABEL_42:
              if ((objc_opt_respondsToSelector() & 1) != 0)
              {
                v52 = (void *)objc_msgSend((id)objc_msgSend(v40, "textStorages"), "objectEnumerator");
                v53 = objc_msgSend(v52, "nextObject");
                if (v53)
                {
                  v54 = (void *)v53;
                  v64 = 0;
                  do
                  {
                    v55 = objc_msgSend(v54, "length");
                    if (v55)
                    {
                      v56 = (void *)objc_msgSend(v54, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", 0, v55, 1, 1, v66, a7);
                      if (v56)
                      {
                        v57 = v56;
                        if (objc_msgSend(v56, "length"))
                        {
                          if (v64)
                            objc_msgSend(v64, "appendFormat:", CFSTR("\n%@"), v57);
                          else
                            v64 = (id)objc_msgSend(v57, "mutableCopy");
                        }
                      }
                    }
                    v54 = (void *)objc_msgSend(v52, "nextObject");
                  }
                  while (v54);
                  goto LABEL_52;
                }
              }
              v64 = 0;
              if (!v41)
                goto LABEL_55;
LABEL_53:
              v58 = IsParagraphBreakingCharacter(objc_msgSend(v68, "characterAtIndex:", v41 - 1)) ^ 1;
            }
            if (v64)
            {
              v59 = v58 == 0;
              v60 = CFSTR("\n");
              if (v59)
                v60 = &stru_24D82FEB0;
              v61 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@%@%@"), v60, v64, &stru_24D82FEB0);
            }
            else
            {
              v61 = &stru_24D82FEB0;
            }
            objc_msgSend(v68, "replaceCharactersInRange:withString:", v41, 1, v61);
            v37 = v37 + -[__CFString length](v61, "length") - 1;

            continue;
          }
LABEL_32:
          objc_msgSend(v68, "deleteCharactersInRange:", v41, 1);
          --v37;
        }
      }
    }
  }

  return v68;
}

- (id)stringEquivalentFromRange:(_NSRange)a3 withLayoutParent:(id)a4
{
  return -[TSWPStorage plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:](self, "plainTextStringFromRange:convertTextualAttachments:includeChildTextStorages:forExport:withLayoutParent:", a3.location, a3.length, 1, 1, 0, a4);
}

- (id)stringEquivalentFromRange:(_NSRange)a3
{
  return -[TSWPStorage stringEquivalentFromRange:withLayoutParent:](self, "stringEquivalentFromRange:withLayoutParent:", a3.location, a3.length, 0);
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4
{
  return -[TSWPStorage nsAttributedSubstringFromRange:scale:applyChanges:includeInlineDrawables:withLayoutParent:](self, "nsAttributedSubstringFromRange:scale:applyChanges:includeInlineDrawables:withLayoutParent:", a3.location, a3.length, 1, 0, 0, a4);
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 scale:(double)a4 applyChanges:(BOOL)a5 includeInlineDrawables:(BOOL)a6 withLayoutParent:(id)a7
{
  _BOOL4 v8;
  _BOOL4 v9;
  id v11;
  void *v12;
  _QWORD *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v18;
  __int128 v19;
  __int128 v20;

  v8 = a6;
  v9 = a5;
  v11 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, -[TSPObject context](self, "context"), 7);
  v12 = v11;
  if (v9)
  {
    v13 = (_QWORD *)MEMORY[0x24BEB3BF0];
    v19 = *MEMORY[0x24BEB3BF0];
    v20 = v19;
    v14 = objc_msgSend(v11, "range");
    LOBYTE(v18) = 1;
    objc_msgSend(v12, "applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:", 1, v14, v15, *v13, v13[1], &v20, &v19, 0, v18);
  }
  v16 = (void *)objc_msgSend(v12, "pNSAttributedStringWithDefaultDelegateIgnoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", 1, 0, 1, !v8, CFSTR(" "), a7, a4);

  return v16;
}

- (id)nsAttributedSubstringFromRange:(_NSRange)a3 delegate:(id)a4 scale:(double)a5 applyChanges:(BOOL)a6 includeInlineDrawables:(BOOL)a7 withLayoutParent:(id)a8
{
  _BOOL4 v9;
  _BOOL4 v10;
  id v13;
  void *v14;
  _QWORD *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v20;
  __int128 v21;
  __int128 v22;

  v9 = a7;
  v10 = a6;
  v13 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, -[TSPObject context](self, "context"), 7);
  v14 = v13;
  if (v10)
  {
    v15 = (_QWORD *)MEMORY[0x24BEB3BF0];
    v21 = *MEMORY[0x24BEB3BF0];
    v22 = v21;
    v16 = objc_msgSend(v13, "range");
    LOBYTE(v20) = 1;
    objc_msgSend(v14, "applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:", 1, v16, v17, *v15, v15[1], &v22, &v21, 0, v20);
  }
  v18 = (void *)objc_msgSend(v14, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", a4, 1, 0, 1, !v9, CFSTR(" "), a5, a8);

  return v18;
}

- (id)nsAttributedSubstringWithAttachmentsRemovedFromRange:(_NSRange)a3 withLayoutParent:(id)a4
{
  id v5;
  void *v6;

  v5 = -[TSWPStorage newSubstorageWithRange:context:flags:](self, "newSubstorageWithRange:context:flags:", a3.location, a3.length, -[TSPObject context](self, "context"), 7);
  v6 = (void *)objc_msgSend(v5, "pNSAttributedStringWithDefaultDelegateIgnoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", 1, 1, 1, 1, &stru_24D82FEB0, a4, 1.0);

  return v6;
}

- (id)nsAttributedStringWithDefaultAttributeDelegateWithLayoutParent:(id)a3
{
  TSWPNSAttributedStringAttachmentConversionDelegate *v5;
  id v6;

  v5 = objc_alloc_init(TSWPNSAttributedStringAttachmentConversionDelegate);
  v6 = -[TSWPStorage pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:](self, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", v5, 0, 0, 0, 0, 0, 1.0, a3);

  return v6;
}

- (id)nsAttributedStringWithAttributeDelegate:(id)a3 withLayoutParent:(id)a4
{
  return -[TSWPStorage pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:](self, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", a3, 0, 0, 0, 0, 0, 1.0, a4);
}

- (id)nsAttributedStringWithLayoutParent:(id)a3
{
  return -[TSWPStorage pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:](self, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", 0, 0, 0, 0, 0, 0, 1.0, a3);
}

- (id)nsAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 withLayoutParent:(id)a5
{
  return -[TSWPStorage pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:](self, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", a3, a4, 0, 0, 0, 0, 1.0, a5);
}

- (TSWPParagraphAttributeArray)paragraphAttributeArrayForKind:(unsigned int)a3 withCreate:(BOOL)a4
{
  return (TSWPParagraphAttributeArray *)-[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", *(_QWORD *)&a3, a4, 0);
}

- (void)compress:(TSWPStorageTransaction *)a3
{
  uint64_t v5;

  v5 = 0;
  do
  {
    -[TSWPStorage compressAttributeArrayKind:undoTransaction:](self, "compressAttributeArrayKind:undoTransaction:", v5, a3);
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 19);
}

- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphIndexRange:(_NSRange)a5 forKind:(unsigned int)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  uint64_t v8;
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v14;
  TSWPAttributeArray *v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  unint64_t v19;
  NSUInteger v20;
  NSRange v21;
  NSUInteger v22;
  NSUInteger v23;
  TSWPAttributeArray *v24;
  TSWPParagraphAttributeArray *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  _QWORD *v30;
  NSUInteger v31;
  NSUInteger v32;
  unint64_t v33;
  unint64_t v34;
  id v35;
  NSRange v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  unsigned __int16 v45;
  _QWORD v46[2];
  unsigned __int16 v47[2];
  NSRange v48;
  NSRange v49;
  NSRange v50;
  NSRange v51;

  v8 = *(_QWORD *)&a6;
  length = a5.length;
  location = a5.location;
  v14 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 1, a7);
  if (v14)
  {
    v15 = v14;
    v45 = a3;
    v16 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", location);
    v18 = v17;
    v19 = location + length;
    v50.location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:");
    v50.length = v20;
    v48.location = v16;
    v48.length = v18;
    v21 = NSUnionRange(v48, v50);
    v22 = v21.location;
    v23 = v21.length;
    v24 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v8, 1, a7);
    if (v24)
    {
      v25 = (TSWPParagraphAttributeArray *)v24;
      -[TSPObject willModify](self, "willModify");
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v25->var0 + 4))(v25) & 1) == 0)
      {
        v43 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v26 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]");
        v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm");
        v28 = v26;
        v23 = v21.length;
        objc_msgSend(v43, "handleFailureInFunction:file:lineNumber:description:", v28, v27, 366, CFSTR("Do not call this method unless table has paired data."));
      }
      if (a4 >= 0x10000)
      {
        v44 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v40 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]");
        v41 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm");
        v42 = v40;
        v22 = v21.location;
        objc_msgSend(v44, "handleFailureInFunction:file:lineNumber:description:", v42, v41, 369, CFSTR("Out-of-bounds type assignment was clamped to max"));
        LOWORD(a4) = -1;
      }
      v47[0] = a4;
      v47[1] = v45;
      TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v25, v47, location, length, v15, a7);
      v29 = -[TSWPStorage listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", location + length - 1, 0);
      if (objc_msgSend(v29, "parent"))
        v29 = (id)objc_msgSend(v29, "parent");
      v30 = (_QWORD *)MEMORY[0x24BEB3BF0];
      v31 = *MEMORY[0x24BEB3BF0];
      v32 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
      v33 = -[TSWPStorage paragraphCount](self, "paragraphCount");
      if (v19 < v33)
      {
        v34 = v33;
        do
        {
          v35 = -[TSWPStorage listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", v19, v46);
          if (v35 != v29 && (id)objc_msgSend(v35, "parent") != v29)
            break;
          v31 = v46[0];
          v32 = v46[1];
          ++v19;
        }
        while (v19 < v34);
      }
      if (v31 != *v30 || v32 != v30[1])
      {
        v49.location = v22;
        v49.length = v23;
        v51.location = v31;
        v51.length = v32;
        v37 = NSUnionRange(v49, v51);
        v22 = v37.location;
        v23 = v37.length;
      }
      -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v22, v23, 0, 0);
    }
    else
    {
      v38 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:]");
      objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 360, CFSTR("applyObject: Bad attribute array."));
    }
  }
}

- (void)applyDataValue:(unsigned int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7;
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v12;
  TSWPAttributeArray *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  TSWPAttributeArray *v19;
  TSWPParagraphAttributeArray *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  unsigned int v25;
  NSRange v26;
  NSRange v27;

  v7 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v12 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 1, a6);
  if (v12)
  {
    v13 = v12;
    v14 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", location);
    v16 = v15;
    v27.location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", length + location - 1);
    v27.length = v17;
    v26.location = v14;
    v26.length = v16;
    v18 = NSUnionRange(v26, v27);
    v19 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v7, 1, a6);
    if (v19)
    {
      v20 = (TSWPParagraphAttributeArray *)v19;
      -[TSPObject willModify](self, "willModify");
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v20->var0 + 5))(v20) & 1) == 0)
      {
        v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyDataValue:toParagraphIndexRange:forKind:undoTransaction:]");
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 416, CFSTR("Do not call this method unless table has single data."));
      }
      v25 = a3;
      if (TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v20, (unsigned __int16 *)&v25, location, length, v13, a6))-[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0);
    }
    else
    {
      v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyDataValue:toParagraphIndexRange:forKind:undoTransaction:]");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 410, CFSTR("applyObject: Bad attribute array."));
    }
  }
}

- (void)applyWritingDirection:(int)a3 toParagraphIndexRange:(_NSRange)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7;
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v12;
  TSWPAttributeArray *v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSRange v18;
  TSWPAttributeArray *v19;
  TSWPParagraphAttributeArray *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  void *v24;
  int v25;
  NSRange v26;
  NSRange v27;

  v7 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v12 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 1, a6);
  if (v12)
  {
    v13 = v12;
    v14 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", location);
    v16 = v15;
    v27.location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", length + location - 1);
    v27.length = v17;
    v26.location = v14;
    v26.length = v16;
    v18 = NSUnionRange(v26, v27);
    v19 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v7, 1, a6);
    if (v19)
    {
      v20 = (TSWPParagraphAttributeArray *)v19;
      -[TSPObject willModify](self, "willModify");
      if (((*((uint64_t (**)(TSWPParagraphAttributeArray *))v20->var0 + 5))(v20) & 1) == 0)
      {
        v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v21 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:]");
        objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v21, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 450, CFSTR("Do not call this method unless table has single data."));
      }
      v25 = a3;
      if (TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange(v20, (unsigned __int16 *)&v25, location, length, v13, a6))-[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v18.location, v18.length, 0, 0);
    }
    else
    {
      v22 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v23 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:]");
      objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 444, CFSTR("applyObject: Bad attribute array."));
    }
  }
}

- (void)applyFlags:(unsigned __int16)a3 level:(unint64_t)a4 toParagraphsInCharRange:(_NSRange)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  TSWPAttributeArray *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _NSRange v17;

  length = a5.length;
  location = a5.location;
  v10 = a3;
  v12 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (v12)
  {
    v17.location = location;
    v17.length = length;
    v13 = TSWPParagraphAttributeArray::paragraphRangeForCharRange((TSWPParagraphAttributeArray *)v12, v17);
    -[TSWPStorage applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:](self, "applyFlags:level:toParagraphIndexRange:forKind:undoTransaction:", v10, a4, v13, v14, 1, a6);
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) applyFlags:level:toParagraphsInCharRange:undoTransaction:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 481, CFSTR("No paragraph array."));
  }
}

- (_NSRange)replaceAllOccurrencesOfObject:(id)a3 withObject:(id)a4 forKind:(unsigned int)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  uint64_t v7;
  void *v11;
  uint64_t v12;
  TSWPAttributeArray *v13;
  TSWPAttributeArray *v14;
  unint64_t var2;
  NSUInteger length;
  unint64_t v17;
  uint64_t v18;
  NSUInteger location;
  NSUInteger v20;
  NSRange v21;
  NSUInteger v22;
  NSUInteger v23;
  NSRange v24;
  _NSRange result;

  v7 = *(_QWORD *)&a5;
  if (!a4)
  {
    v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) replaceAllOccurrencesOfObject:withObject:forKind:undoTransaction:]");
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 495, CFSTR("replaceAllOccurrencesOfStyle: toReplace is nil."));
  }
  v13 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v7, 0, a6);
  if (!v13 || (v14 = v13, (var2 = v13->var2) == 0))
  {
    length = 0;
LABEL_14:
    location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_15;
  }
  length = 0;
  v17 = 0;
  v18 = 8;
  location = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    if (*(id *)((char *)v14->var4 + v18) == a3)
    {
      TSWPAttributeArray::replaceObjectForAttributeIndex(v14, (objc_object *)a4, v17, 0, a6);
      v21.location = TSWPAttributeArray::rangeForAttributeIndex(v14, v17);
      v21.length = v20;
      if (location != 0x7FFFFFFFFFFFFFFFLL)
      {
        v24.location = location;
        v24.length = length;
        v21 = NSUnionRange(v24, v21);
      }
      var2 = v14->var2;
      length = v21.length;
      location = v21.location;
    }
    ++v17;
    v18 += 16;
  }
  while (v17 < var2);
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_14;
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", location, length, 0, 0);
LABEL_15:
  v22 = location;
  v23 = length;
  result.length = v23;
  result.location = v22;
  return result;
}

- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 forSourceRange:(_NSRange)a4 toDestStorage:(id)a5 objectContext:(id)a6 dolcContext:(id)a7 flags:(int)a8
{
  uint64_t var1;
  NSUInteger location;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  NSUInteger *v14;
  unint64_t v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  objc_object *v19;
  NSRange v20;
  BOOL v21;
  NSUInteger v22;
  NSUInteger v23;
  objc_object *v24;
  TSWPAttributeArray *v25;
  int v26;
  unint64_t v27;
  TSWPAttributeArray *v28;
  unint64_t v29;
  TSWPAttributeArray *v30;
  unint64_t v31;
  TSWPAttributeArray *v32;
  objc_object *v33;
  uint64_t v34;
  unint64_t v35;
  unint64_t v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  objc_object *v40;
  unint64_t var2;
  void *v42;
  unint64_t v44;
  TSWPAttributeArray *v47;
  NSUInteger range1;
  unint64_t v49;
  unint64_t v50;
  objc_object *v51;
  NSRange v52;
  NSRange v53;

  range1 = a4.length;
  if (a3)
  {
    if (a4.length)
    {
      var1 = a3->var1;
      if (var1 <= 0x12)
      {
        location = a4.location;
        if (((1 << var1) & 0x63BFF) != 0 || ((1 << var1) & 0x18000) != 0 && (a8 & 2) != 0)
        {
          v11 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a3, a4.location);
          v12 = v11 == 0x7FFFFFFFFFFFFFFFLL ? 0 : v11;
          if (v12 < a3->var2)
          {
            v47 = 0;
            v44 = 0;
            v49 = location + range1;
            v13 = (16 * v12) | 8;
            v14 = (NSUInteger *)MEMORY[0x24BEB3BF0];
            while (1)
            {
              v15 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v12);
              v16 = TSWPAttributeArray::rangeForAttributeIndex(a3, v12);
              v18 = v17;
              if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3))
                v19 = *(objc_object **)((char *)a3->var4 + v13);
              else
                v19 = 0;
              switch((int)var1)
              {
                case 0:
                  if (v19)
                  {
                    v33 = 0;
                    goto LABEL_55;
                  }
                  goto LABEL_70;
                case 1:
                case 11:
                case 18:
                  if (v15 > location && v15 <= v49)
                  {
                    v25 = v47;
                    if (!v47)
                    {
                      v25 = (TSWPAttributeArray *)objc_msgSend(a5, "attributeArrayForKind:withCreate:undoTransaction:", var1, 0, 0);
                      if (!v25)
                        goto LABEL_65;
                    }
                    v26 = *(_DWORD *)((char *)a3->var4 + v13);
                    v50 = v15 - location;
                    LODWORD(v51) = v26;
                    v47 = v25;
                    TSWPAttributeArray::insertAttribute(v25, (const TSWPAttributeRecord *)&v50, ++v44, 0, 0);
                  }
                  goto LABEL_70;
                case 2:
                case 9:
                  if (v19)
                  {
                    v27 = v15 - location;
                    if (v15 > location && v15 <= v49)
                    {
                      v28 = v47;
                      if (!v47)
                      {
                        v28 = (TSWPAttributeArray *)objc_msgSend(a5, "attributeArrayForKind:withCreate:undoTransaction:", var1, 0, 0);
                        if (!v28)
                          goto LABEL_65;
                      }
                      v29 = v15 - location;
                      v30 = v28;
                      v31 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v28, v29);
                      v47 = v30;
                      if (v31 < v30->var2 && TSWPAttributeArray::charIndexForAttributeIndex(v30, v31) >= v27)
                      {
                        v38 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                        v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:]");
                        objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 659, CFSTR("Source and dest tables are out of order."));
                      }
                      else
                      {
                        v50 = v27;
                        v51 = v19;
                        TSWPAttributeArray::insertAttribute(v30, (const TSWPAttributeRecord *)&v50, ++v44, (TSKAddedToDocumentContext *)a7, 0);
                      }
                    }
                  }
                  goto LABEL_70;
                case 3:
                case 6:
                case 7:
                case 12:
                case 13:
                case 15:
                case 16:
                case 17:
                  if (!v19)
                    goto LABEL_70;
                  v52.location = location;
                  v52.length = range1;
                  v53.location = v16;
                  v53.length = v18;
                  v20 = NSIntersectionRange(v52, v53);
                  v21 = (_DWORD)var1 == 17 && v20.length < v18;
                  v22 = v21 ? v14[1] : v20.length;
                  if (!v22)
                    goto LABEL_70;
                  if (v21)
                    v23 = *v14;
                  else
                    v23 = v20.location;
                  if ((a8 & 8) != 0)
                  {
                    if ((_DWORD)var1 != 17)
                    {
                      v24 = 0;
                      goto LABEL_64;
                    }
                  }
                  else
                  {
                    v24 = 0;
                    if (var1 > 0x11 || ((1 << var1) & 0x210C0) == 0)
                      goto LABEL_64;
                  }
                  v19 = (objc_object *)-[objc_object copyWithContext:](v19, "copyWithContext:", a6);
                  v24 = v19;
LABEL_64:
                  objc_msgSend(a5, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", v19, v23 - location, v22, var1, a7, 0);

LABEL_70:
                  ++v12;
                  var2 = a3->var2;
                  if (v12 < var2)
                  {
                    if (TSWPAttributeArray::charIndexForAttributeIndex(a3, v12) > v49)
                      return;
                    var2 = a3->var2;
                  }
                  v13 += 16;
                  if (v12 >= var2)
                    return;
                  break;
                case 4:
                case 5:
                  if (v19 && v15 >= location && v15 < v49)
                  {
                    v32 = v47;
                    if (v47
                      || (v32 = (TSWPAttributeArray *)objc_msgSend(a5, "attributeArrayForKind:withCreate:undoTransaction:", var1, 1, 0)) != 0)
                    {
                      v47 = v32;
                      if (v44 < v32->var2)
                      {
                        if ((a8 & 1) != 0)
                        {
                          v40 = (objc_object *)-[objc_object copyWithContext:](v19, "copyWithContext:", a6);
                          TSWPAttributeArray::replaceObjectForAttributeIndex(v47, v40, v44, (TSKAddedToDocumentContext *)a7, 0);

                        }
                        else
                        {
                          TSWPAttributeArray::replaceObjectForAttributeIndexForShallowCopy(v32, v19, v44);
                        }
                        ++v44;
                      }
                    }
                    else
                    {
LABEL_65:
                      v47 = 0;
                    }
                  }
                  goto LABEL_70;
                case 8:
                  if (objc_msgSend(a5, "supportsSectionCopying") && v19)
                  {
                    v33 = (objc_object *)-[objc_object copyWithContext:](v19, "copyWithContext:", a6);
                    v19 = v33;
LABEL_55:
                    if (v15 > location && v15 <= v49)
                    {
                      v34 = (uint64_t)v47;
                      if (v47
                        || (v34 = objc_msgSend(a5, "attributeArrayForKind:withCreate:undoTransaction:", var1, 0, 0)) != 0)
                      {
                        v35 = v44 + 1;
                        v47 = (TSWPAttributeArray *)v34;
                        v36 = *(_QWORD *)(v34 + 16);
                        if (v44 + 1 >= v36)
                        {
                          v42 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                          v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(AttributeTables) transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:]");
                          objc_msgSend(v42, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_attributeTables.mm"), 617, CFSTR("Bad par index count."));
                          v36 = v47->var2;
                        }
                        if (v35 < v36)
                        {
                          TSWPAttributeArray::replaceObjectForAttributeIndex(v47, v19, v35, (TSKAddedToDocumentContext *)a7, 0);
                          ++v44;
                        }
                      }
                      else
                      {
                        v47 = 0;
                      }
                    }

                  }
                  goto LABEL_70;
                default:
                  goto LABEL_70;
              }
            }
          }
        }
      }
    }
  }
}

- (int)compareAttributeArray:(TSWPAttributeArray *)a3 range:(_NSRange)a4 otherStorage:(id)a5 otherRange:(_NSRange)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v8;
  NSUInteger v9;
  uint64_t v12;
  TSWPAttributeArray *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  TSWPAttributeArray *v21;
  TSWPAttributeArray *v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  NSUInteger v26;
  NSUInteger v27;

  if (!a3)
    return -2;
  length = a6.length;
  location = a6.location;
  v8 = a4.length;
  v9 = a4.location;
  v12 = objc_msgSend(a5, "attributeArrayForKind:withCreate:undoTransaction:", a3->var1, 0, 0);
  if (!v12)
    return -2;
  v13 = (TSWPAttributeArray *)v12;
  v14 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a3, v9);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL)
    v15 = 0;
  else
    v15 = v14;
  v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, location);
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = v16;
  v18 = a3->var2 - v15;
  v19 = v13->var2 - v17;
  v20 = v18 > v19;
  if (v18 <= v19)
    v21 = a3;
  else
    v21 = v13;
  if (v18 <= v19)
    v22 = v13;
  else
    v22 = a3;
  if (v18 <= v19)
    v23 = length;
  else
    v23 = v8;
  if (v18 <= v19)
    v24 = location;
  else
    v24 = v9;
  if (v18 <= v19)
    v25 = v15;
  else
    v25 = v17;
  if (v20)
  {
    v17 = v15;
    v26 = location;
  }
  else
  {
    v26 = v9;
  }
  if (v20)
    v27 = length;
  else
    v27 = v8;
  return -[TSWPStorage compareAttributeArray1:array2:range1:range2:attributeIndex1:attributeIndex2:](self, "compareAttributeArray1:array2:range1:range2:attributeIndex1:attributeIndex2:", v21, v22, v26, v27, v24, v23, v25, v17);
}

- (int)compareAttributeArray1:(TSWPAttributeArray *)a3 array2:(TSWPAttributeArray *)a4 range1:(_NSRange)a5 range2:(_NSRange)a6 attributeIndex1:(unint64_t)a7 attributeIndex2:(unint64_t)a8
{
  int v8;
  TSWPAttributeArray *v9;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t i;
  unint64_t v15;
  unint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  void *v20;
  unint64_t var2;
  NSUInteger v22;
  NSRange v23;
  void *v24;
  unsigned int var1;
  int v26;
  NSUInteger length;
  NSUInteger v28;
  NSUInteger v29;
  NSRange v34;
  NSUInteger v35;
  int v36;
  int v37;

  v8 = 0;
  if (a3)
  {
    v9 = a4;
    if (a4)
    {
      v11 = a7;
      if (a3->var2 > a7)
      {
        v12 = a8;
        if (a4->var2 > a8)
        {
          v8 = 0;
          v35 = a5.location + a5.length;
          v13 = (16 * a7) | 8;
          for (i = (16 * a8) | 8; ; i += 16)
          {
            v15 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v11);
            if (v8 || v15 > v35)
              return v8;
            v16 = TSWPAttributeArray::charIndexForAttributeIndex(a3, v11);
            v17 = TSWPAttributeArray::rangeForAttributeIndex(a3, v11);
            v19 = v18;
            if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3))
              v20 = *(void **)((char *)a3->var4 + v13);
            else
              v20 = 0;
            var2 = v9->var2;
            if (v12 >= var2)
            {
              v34 = (NSRange)0x7FFFFFFFFFFFFFFFuLL;
            }
            else
            {
              v34.location = TSWPAttributeArray::rangeForAttributeIndex(v9, v12);
              v34.length = v22;
              var2 = v9->var2;
            }
            if (v12 < var2 && (*((unsigned int (**)(TSWPAttributeArray *))v9->var0 + 3))(v9))
            {
              v23.length = v19;
              v24 = *(void **)((char *)v9->var4 + i);
            }
            else
            {
              v23.length = v19;
              v24 = 0;
            }
            v8 = 0;
            var1 = a3->var1;
            if (var1 > 0x12)
              goto LABEL_42;
            v26 = 1 << var1;
            if ((v26 & 0x3078) != 0)
              break;
            if ((v26 & 0x305) != 0)
            {
              if (v16 <= v35)
              {
                v23.location = v17;
                length = NSIntersectionRange(v23, a5).length;
                if (length != NSIntersectionRange(v34, a6).length)
                  goto LABEL_41;
                if (v20 != v24)
                {
                  if (objc_msgSend(v20, "isEqual:", v24))
                    v8 = 0;
                  else
                    v8 = -2;
                  goto LABEL_42;
                }
              }
              goto LABEL_33;
            }
            v9 = a4;
            if ((v26 & 0x40802) != 0)
            {
              if (v16 <= v35)
              {
                v23.location = v17;
                v29 = NSIntersectionRange(v23, a5).length;
                if (v29 == NSIntersectionRange(v34, a6).length)
                {
                  v37 = *(_DWORD *)((char *)a3->var4 + v13);
                  v9 = a4;
                  v36 = *(_DWORD *)((char *)a4->var4 + i);
                  if (TSWPParagraphAttributeArray::dataIsSame((uint64_t)a3, (unsigned __int16 *)&v37, (unsigned __int16 *)&v36))
                  {
                    v8 = 0;
                  }
                  else
                  {
                    v8 = -2;
                  }
                  goto LABEL_43;
                }
LABEL_41:
                v8 = -2;
LABEL_42:
                v9 = a4;
                goto LABEL_43;
              }
              v8 = 0;
            }
LABEL_43:
            ++v11;
            ++v12;
            v13 += 16;
            if (v11 >= a3->var2)
              return v8;
          }
          if (v16 < v35)
          {
            v23.location = v17;
            v28 = NSIntersectionRange(v23, a5).length;
            if (v28 != NSIntersectionRange(v34, a6).length
              || v20 != v24 && (!v20 || !v24 || (objc_msgSend(v20, "isEqual:", v24) & 1) == 0))
            {
              goto LABEL_41;
            }
          }
LABEL_33:
          v8 = 0;
          goto LABEL_42;
        }
      }
      return 0;
    }
  }
  return v8;
}

- (id)pFindValidInsertionCharStyleFromCharIndex:(unint64_t)a3
{
  unint64_t v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id result;
  unint64_t v10;

  v5 = -[TSWPStorage paragraphStartAtCharIndex:](self, "paragraphStartAtCharIndex:");
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v6 = v5;
  while (1)
  {
    v7 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, 6, &v10);
    if (!(v7 | (unint64_t)-[TSWPStorage footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:](self, "footnoteReferenceAttachmentOrFootnoteMarkAttachmentAtCharIndex:", a3)))break;
    v8 = v10;
    if (!v7)
      v8 = a3;
    if (v8 > v6)
    {
      a3 = v8 - 1;
      if (v8 != 0x8000000000000000)
        continue;
    }
    return 0;
  }
  result = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", a3, 0);
  if (!result)
    return (id)objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  return result;
}

- (id)pNSAttributedStringWithDefaultDelegateIgnoreLists:(BOOL)a3 stripTextualAttachments:(BOOL)a4 stripGraphicalAttachments:(BOOL)a5 stripInlineAttachments:(BOOL)a6 attachmentChar:(id)a7 scale:(double)a8 withLayoutParent:(id)a9
{
  _BOOL8 v12;
  _BOOL8 v13;
  _BOOL8 v14;
  _BOOL8 v15;
  TSWPNSAttributedStringAttachmentConversionDelegate *v17;
  id v18;

  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v17 = objc_alloc_init(TSWPNSAttributedStringAttachmentConversionDelegate);
  v18 = -[TSWPStorage pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:](self, "pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:", v17, v15, v14, v13, v12, a7, a8, a9);

  return v18;
}

- (id)pNSAttributedStringWithAttributeDelegate:(id)a3 ignoreLists:(BOOL)a4 stripTextualAttachments:(BOOL)a5 stripGraphicalAttachments:(BOOL)a6 stripInlineAttachments:(BOOL)a7 attachmentChar:(id)a8 scale:(double)a9 withLayoutParent:(id)a10
{
  void *v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  unint64_t v26;
  TSWPStorage *v27;
  unint64_t v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unsigned int v33;
  id v34;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  unint64_t v50;
  unint64_t v51;
  BOOL v53;
  id v54;
  _BOOL4 v56;
  id v58;
  _BOOL4 v59;
  _NSRange v60;
  uint64_t v61;
  uint64_t v62;

  v56 = a5;
  v59 = a4;
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1688]), "initWithString:", -[TSWPStorage string](self, "string"));
  objc_msgSend((id)objc_msgSend(v14, "mutableString"), "replaceBreaksWithPlainTextVersions");
  if (a3 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v15 = -[TSWPStorage range](self, "range");
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)&v61, self, v15, v16, 6);
    v17 = *MEMORY[0x24BDF6618];
    while (TSWPAttributeEnumerator::nextAttributeIndex((id *)&v61, &v60))
    {
      objc_opt_class();
      v18 = TSUDynamicCast();
      if (v18)
      {
        v19 = objc_msgSend(a3, "urlForHyperlinkField:", v18);
        if (v19)
          objc_msgSend(v14, "addAttribute:value:range:", v17, v19, v60.location, v60.length);
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)&v61);
  }
  v60.location = 0;
  v20 = objc_msgSend(v14, "length");
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    do
    {
      v23 = -[TSWPStorage pExportAttributes:effectiveRange:stickyFont:scale:](self, "pExportAttributes:effectiveRange:stickyFont:scale:", v22, &v61, &v60, a9);
      if (v23)
        objc_msgSend(v14, "addAttributes:range:", v23, v61, v62);
      if (v22 == (char *)(v62 + v61))
        ++v22;
      else
        v22 = (char *)(v62 + v61);
    }
    while ((unint64_t)v22 < v21);
  }
  v24 = -[TSWPStorage attachmentCount](self, "attachmentCount");
  v58 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  if (!v24 && !v59)
  {
    v26 = -[TSWPStorage length](self, "length");
    v27 = self;
    v28 = 0;
    v29 = v14;
    v30 = 0;
LABEL_68:
    -[TSWPStorage pMapListsFromStorageRange:toString:atStringLoc:textListMap:](v27, "pMapListsFromStorageRange:toString:atStringLoc:textListMap:", v28, v26, v29, v30, v58);
    goto LABEL_69;
  }
  if (v24)
  {
    v54 = a3;
    v53 = a6;
    v25 = 0;
    v31 = 0;
    v32 = 0;
    v33 = 1;
    while (1)
    {
      v61 = 0x7FFFFFFFFFFFFFFFLL;
      v34 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v25, &v61);
      v35 = v61;
      if (v61 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v36 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pNSAttributedStringWithAttributeDelegate:ignoreLists:stripTextualAttachments:stripGraphicalAttachments:stripInlineAttachments:attachmentChar:scale:withLayoutParent:]");
        objc_msgSend(v36, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 118, CFSTR("Could not find an expected attachment"));
        v35 = v61;
      }
      if (!v59)
      {
        if (v32 <= v35 + 1)
          v38 = v35 + 1;
        else
          v38 = v32;
        if (v32 >= v35 + 1)
          v39 = v35 + 1;
        else
          v39 = v32;
        v31 += -[TSWPStorage pMapListsFromStorageRange:toString:atStringLoc:textListMap:](self, "pMapListsFromStorageRange:toString:atStringLoc:textListMap:", v39, v38 - v39, v14, v31 + v32, v58);
        v35 = v61;
      }
      if (!v34)
      {
LABEL_55:
        objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31--, 1, &stru_24D82FEB0);
        goto LABEL_56;
      }
      objc_opt_class();
      v40 = (void *)TSUDynamicCast();
      objc_opt_class();
      v41 = (void *)TSUDynamicCast();
      if (v40)
      {
        if (!v56)
        {
          v42 = objc_msgSend(v40, "stringEquivalentWithLayoutParent:", a10);
          if (!v42)
            goto LABEL_55;
          v43 = (void *)v42;
          objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31, 1, v42);
          v44 = v31 + objc_msgSend(v43, "length");
LABEL_37:
          v31 = v44 - 1;
          goto LABEL_56;
        }
      }
      else
      {
        v45 = v41;
        if (v41)
        {
          if (objc_msgSend(v41, "isAnchored") && !objc_msgSend(v45, "isHTMLWrap"))
          {
            if (!v53)
            {
LABEL_45:
              if (!v54
                || (objc_opt_respondsToSelector() & 1) == 0
                || objc_msgSend(v45, "isAnchored") && !objc_msgSend(v45, "isHTMLWrap"))
              {
                goto LABEL_55;
              }
              v46 = objc_msgSend(v54, "attachmentStringForDrawableAttachment:", v45);
              if (!v46)
                goto LABEL_55;
              v47 = (void *)v46;
              objc_msgSend(v14, "replaceCharactersInRange:withAttributedString:", v35 + v31, 1, v46);
              v48 = objc_msgSend(v47, "length");
              if (!v59
                && -[TSWPStorage paragraphHasListLabelAtCharIndex:](self, "paragraphHasListLabelAtCharIndex:", v61)
                && v48 != 1)
              {
                TSULogErrorInFunction();
              }
              v44 = v31 + v48;
              goto LABEL_37;
            }
          }
          else if (!a7)
          {
            goto LABEL_45;
          }
        }
      }
      if (!objc_msgSend(a8, "length"))
        goto LABEL_55;
      objc_msgSend(v14, "replaceCharactersInRange:withString:", v35 + v31, 1, a8);
LABEL_56:
      v32 = v35 + 1;
      v25 = v33;
      if (v24 <= v33++)
        goto LABEL_59;
    }
  }
  v32 = 0;
  v31 = 0;
LABEL_59:
  if (v32 < -[TSWPStorage length](self, "length", v25) && !v59)
  {
    v50 = -[TSWPStorage length](self, "length");
    if (v32 <= v50)
      v51 = v50;
    else
      v51 = v32;
    if (v32 >= v50)
      v28 = v50;
    else
      v28 = v32;
    v26 = v51 - v28;
    v30 = v31 + v32;
    v27 = self;
    v29 = v14;
    goto LABEL_68;
  }
LABEL_69:

  return v14;
}

- (id)pExportAttributes:(unint64_t)a3 effectiveRange:(_NSRange *)a4 stickyFont:(id *)a5 scale:(double)a6
{
  void *v11;
  id v12;
  id v13;
  unint64_t v14;
  id v15;
  uint64_t v16;
  NSRange v17;
  NSRange range2;
  _NSRange v20;

  v11 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v20 = (_NSRange)0;
  range2.location = 0;
  range2.length = 0;
  v12 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a3, &v20);
  v13 = -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", a3, &range2);
  if (v12)
  {
    v14 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", v20.location + v20.length - 1)
        + 1;
    if (v14 <= -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", -[TSWPStorage length](self, "length")))v15 = -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", v14, 0);
    else
      v15 = 0;
    objc_msgSend(v11, "addEntriesFromDictionary:", -[TSWPStorage pExportParagraphAttributes:nextParagraphStyle:scale:](self, "pExportParagraphAttributes:nextParagraphStyle:scale:", v12, v15, a6));
    +[TSWPPropertyConverter mapCharacterPropertiesFromStyle:toNS:stickyFont:scale:](TSWPPropertyConverter, "mapCharacterPropertiesFromStyle:toNS:stickyFont:scale:", v12, v11, a5, a6);
  }
  +[TSWPPropertyConverter mapCharacterPropertiesFromStyle:secondaryStyle:toNS:stickyFont:scale:](TSWPPropertyConverter, "mapCharacterPropertiesFromStyle:secondaryStyle:toNS:stickyFont:scale:", v13, v12, v11, a5, a6);
  v16 = objc_msgSend(v11, "count");
  if (a4)
  {
    *a4 = v20;
    v17.length = range2.length;
    if (range2.length)
    {
      v17.location = range2.location;
      *a4 = NSIntersectionRange(*a4, v17);
    }
  }
  if (v16)
    return v11;
  else
    return 0;
}

- (int64_t)pMapListsFromStorageRange:(_NSRange)a3 toString:(id)a4 atStringLoc:(unint64_t)a5 textListMap:(id)a6
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v8;
  NSUInteger v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  id v14;
  id v15;
  void *v16;
  unint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  double v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  int64_t v53;
  NSUInteger v54;
  NSRange v55;
  NSRange v56;

  if (!a3.length)
    return 0;
  length = a3.length;
  location = a3.location;
  v54 = a3.location + a3.length;
  if (a3.location >= a3.location + a3.length)
    return 0;
  v8 = a5;
  v53 = 0;
  v50 = *MEMORY[0x24BDF6628];
  v10 = a3.location;
  do
  {
    v11 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", v10);
    v55.location = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", v11);
    v12 = v55.location;
    v13 = v55.length;
    v56.location = location;
    v56.length = length;
    NSIntersectionRange(v55, v56);
    v14 = -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", v11, 0);
    v15 = -[TSWPStorage listStyleAtParIndex:effectiveRange:](self, "listStyleAtParIndex:effectiveRange:", v11, 0);
    if (v15)
    {
      v16 = v15;
      v17 = -[TSWPStorage paragraphLevelAtParIndex:](self, "paragraphLevelAtParIndex:", v11);
      if (objc_msgSend(v16, "effectiveTypeForLevel:", v17))
      {
        v18 = v12 - location;
        if (v12 < location)
          v18 = 0;
        v19 = v53 + v8 + v18;
        if (v19 < objc_msgSend(a4, "length"))
        {
          v20 = objc_msgSend(a4, "attribute:atIndex:effectiveRange:", v50, v19, 0);
          if (v20)
          {
            v21 = (void *)v20;
            v22 = objc_msgSend((id)objc_msgSend(a4, "string"), "paragraphRangeForRange:", v19, 1);
            v48 = v23;
            v49 = v22;
            v24 = (void *)objc_msgSend(v21, "mutableCopy");
            objc_msgSend(v16, "labelIndentForLevel:", v17);
            v26 = v25;
            objc_msgSend(-[TSWPStorage valueForProperty:atCharIndex:effectiveRange:](self, "valueForProperty:atCharIndex:effectiveRange:", 17, v10, 0), "tsu_CGFloatValue");
            objc_msgSend(v16, "textIndentForLevel:fontSize:", v17);
            v28 = v27;
            objc_msgSend(v24, "headIndent");
            objc_msgSend(v24, "setHeadIndent:", v26 + v28 + v29);
            if (v26 == 0.0)
              v26 = 1.0;
            v30 = (void *)objc_msgSend((id)objc_msgSend(v24, "tabStops"), "mutableCopy");
            objc_msgSend((id)objc_msgSend(v14, "valueForProperty:", 80), "tsu_CGFloatValue");
            v32 = v26 + v31;
            v33 = v28 + v32;
            v8 = a5;
            if (objc_msgSend(v30, "count"))
            {
              v34 = 0;
              v35 = 0;
              v36 = 0x7FFFFFFFFFFFFFFFLL;
              while (1)
              {
                objc_msgSend((id)objc_msgSend(v30, "objectAtIndexedSubscript:", v34), "location");
                if (v37 > v33)
                  break;
                ++v35;
                if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                  v36 = 0;
                v34 = v35;
                if (objc_msgSend(v30, "count") <= (unint64_t)v35)
                  goto LABEL_21;
              }
              if (v36 == 0x7FFFFFFFFFFFFFFFLL)
                goto LABEL_22;
LABEL_21:
              objc_msgSend(v30, "removeObjectsInRange:", v36, v35);
            }
LABEL_22:
            v38 = objc_alloc(MEMORY[0x24BDF6780]);
            v39 = MEMORY[0x24BDBD1B8];
            v40 = (void *)objc_msgSend(v38, "initWithTextAlignment:location:options:", 0, MEMORY[0x24BDBD1B8], v33);
            objc_msgSend(v30, "insertObject:atIndex:", v40, 0);

            v41 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6780]), "initWithTextAlignment:location:options:", 0, v39, v32);
            objc_msgSend(v30, "insertObject:atIndex:", v41, 0);

            objc_msgSend(v24, "setTabStops:", v30);
            objc_msgSend(a4, "addAttribute:value:range:", v50, v24, v49, v48);
            v42 = objc_msgSend(a4, "labelMarkerStringAtIndex:", v49);
            v43 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\t%@\t"), v42);
            v44 = objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithObjectsAndKeys:", v24, v50, 0);
            v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:attributes:", v43, v44);
            objc_msgSend(a4, "insertAttributedString:atIndex:", v45, v49);
            v53 += objc_msgSend(v43, "length");

          }
          else
          {
            v8 = a5;
          }
        }
        location = a3.location;
        length = a3.length;
      }
    }
    v10 = v12 + v13;
  }
  while (v12 + v13 < v54);
  return v53;
}

- (id)pExportParagraphAttributes:(id)a3 nextParagraphStyle:(id)a4 scale:(double)a5
{
  void *v8;
  id v9;
  void *v10;
  double v11;
  double v12;
  float v13;
  double v14;
  float v15;
  double v16;
  double v17;
  float v18;
  float v19;
  float v20;
  double v21;
  void *v22;
  void *v23;
  float v24;
  uint64_t v25;
  unsigned int v26;
  uint64_t v27;
  void *v28;
  double v29;
  double v30;
  int v31;
  uint64_t v32;
  void *v33;

  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v9 = objc_alloc_init(MEMORY[0x24BDF6748]);
  v10 = (void *)objc_msgSend(a3, "valueForProperty:", 85);
  objc_msgSend(v10, "amount");
  v12 = v11 * a5;
  switch(objc_msgSend(v10, "mode"))
  {
    case 0u:
      objc_msgSend(v9, "setLineHeightMultiple:", v12);
      break;
    case 1u:
      objc_msgSend(v9, "setMinimumLineHeight:", v12);
      break;
    case 2u:
      objc_msgSend(v9, "setMinimumLineHeight:", v12);
      goto LABEL_5;
    case 3u:
LABEL_5:
      objc_msgSend(v9, "setMaximumLineHeight:", v12);
      break;
    default:
      break;
  }
  objc_msgSend(a3, "floatValueForProperty:", 88);
  v14 = v13;
  if (a4)
  {
    objc_msgSend(a4, "floatValueForProperty:", 87);
    v16 = v15;
  }
  else
  {
    v16 = 0.0;
  }
  v17 = v16 * a5;
  if (v14 * a5 >= v17)
    v17 = v14 * a5;
  objc_msgSend(v9, "setParagraphSpacing:", v17);
  objc_msgSend(v9, "setAlignment:", (int)objc_msgSend(a3, "intValueForProperty:", 86));
  objc_msgSend(a3, "floatValueForProperty:", 80);
  objc_msgSend(v9, "setFirstLineHeadIndent:", v18 * a5);
  objc_msgSend(a3, "floatValueForProperty:", 81);
  objc_msgSend(v9, "setHeadIndent:", v19 * a5);
  objc_msgSend(a3, "floatValueForProperty:", 82);
  v21 = v20 * a5;
  if (v21 > 0.0 && v21 < 468.0)
    objc_msgSend(v9, "setTailIndent:", 468.0 - v21);
  v22 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", 10);
  v23 = (void *)objc_msgSend(a3, "valueForProperty:", 84);
  objc_msgSend(a3, "floatValueForProperty:", 83);
  objc_msgSend(v9, "setDefaultTabInterval:", v24 * a5);
  if (objc_msgSend(v23, "count"))
  {
    v25 = 0;
    v26 = 1;
    v27 = MEMORY[0x24BDBD1B8];
    do
    {
      v28 = (void *)objc_msgSend(v23, "tabAtIndex:", v25);
      objc_msgSend(v28, "position");
      v30 = v29 * a5;
      v31 = objc_msgSend(v28, "alignment");
      if (v31 == 2)
        v32 = 2;
      else
        v32 = v31 == 1;
      v33 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6780]), "initWithTextAlignment:location:options:", v32, v27, v30);
      objc_msgSend(v22, "addObject:", v33);

      v25 = v26;
    }
    while (objc_msgSend(v23, "count") > (unint64_t)v26++);
  }
  if (objc_msgSend(v22, "count"))
    objc_msgSend(v9, "setTabStops:", v22);
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BDF6628]);

  return v8;
}

- (id)pTextListsFromListStyle:(id)a3 atLevel:(unint64_t)a4 labelTypeMap:(id)a5
{
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (!a5)
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pTextListsFromListStyle:atLevel:labelTypeMap:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 611, CFSTR("Expecting a non-nil labelTypeMap parameter"));
    if (a3)
      return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4 + 1);
LABEL_5:
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pTextListsFromListStyle:atLevel:labelTypeMap:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 612, CFSTR("Expecting a non-nil listStyle parameter"));
    return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4 + 1);
  }
  if (!a3)
    goto LABEL_5;
  return (id)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", a4 + 1);
}

- (void)pMapAttributesFromAttributedString:(id)a3 ontoRange:(_NSRange)a4 asCharacterStylesOnly:(BOOL)a5
{
  NSUInteger v7;
  uint64_t v8;
  uint64_t *v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _BOOL4 v14;
  NSUInteger v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  NSUInteger v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  NSUInteger v28;
  void *v29;
  uint64_t v30;
  NSUInteger v31;
  NSUInteger v32;
  NSUInteger v34;
  uint64_t v35;
  NSUInteger location;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  location = a4.location;
  v7 = a4.location + a4.length;
  v8 = objc_msgSend(a3, "length");
  v9 = (uint64_t *)MEMORY[0x24BDF6600];
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *MEMORY[0x24BDF6600];
    do
    {
      v13 = objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v11, &v41), "objectForKeyedSubscript:", v12);
      v14 = v13 != 0;
      if (v13)
        break;
      if (v42 + v41 <= v11 + 1)
        ++v11;
      else
        v11 = v42 + v41;
    }
    while (v11 < v10);
  }
  else
  {
    v14 = 0;
  }
  if (location < v7)
  {
    v35 = *v9;
    v15 = location;
    v32 = v7;
    do
    {
      v39 = 0;
      v40 = 0;
      v16 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", v15, &v39);
      v17 = v40 + v39;
      if (v7 < v40 + v39)
        v17 = v7;
      if (v15 <= v17)
        v18 = v17;
      else
        v18 = v15;
      if (v15 < v17)
        v17 = v15;
      v19 = v18 - v17;
      v20 = v17 - location;
      v37 = 0;
      v38 = 0;
      v34 = v18;
      if (!a5 && v17 == v39 && v19 == v40)
      {
        v16 = -[TSWPStorage pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:](self, "pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:", a3, v17 - location, v18 - v17, v16);
        if (v16)
          -[TSWPStorage setParagraphStyle:forCharRange:undoTransaction:](self, "setParagraphStyle:forCharRange:undoTransaction:", v16, v39, v40, 0);
      }
      while (v19)
      {
        v22 = v20 + v19;
        if (v20 + v19 > objc_msgSend(a3, "length"))
        {
          v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pMapAttributesFromAttributedString:ontoRange:asCharacterStylesOnly:]");
          objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 712, CFSTR("Remaining range extends outside attributed string"));
        }
        v25 = (void *)objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:longestEffectiveRange:inRange:", v20, &v37, v20, v19), "mutableCopy");
        v26 = v25;
        if (v14 && !objc_msgSend(v25, "objectForKeyedSubscript:", v35))
          objc_msgSend(v26, "setObject:forKeyedSubscript:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BEB3C40], "blackColor"), "platformColor"), v35);
        v27 = (void *)objc_msgSend(+[TSWPPropertyConverter mapCharacterPropertiesFromNS:](TSWPPropertyConverter, "mapCharacterPropertiesFromNS:", v26), "mutableCopy");
        -[TSWPStorage setCharacterStyle:range:undoTransaction:](self, "setCharacterStyle:range:undoTransaction:", -[TSSStylesheet variationOfCharacterStyle:paragraphStyle:propertyMap:](self->_stylesheet, "variationOfCharacterStyle:paragraphStyle:propertyMap:", -[TSWPStorage characterStyleAtCharIndex:effectiveRange:](self, "characterStyleAtCharIndex:effectiveRange:", v37 + location, 0), v16, v27), v37 + location, v38, 0);
        v28 = v38 + v37;
        if (v38 + v37 > v22)
        {
          v29 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v30 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pMapAttributesFromAttributedString:ontoRange:asCharacterStylesOnly:]");
          objc_msgSend(v29, "handleFailureInFunction:file:lineNumber:description:", v30, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 746, CFSTR("Attribute range extends outside remaining range - expected attribute range to be clamped"));
          v28 = v38 + v37;
        }
        if (v28 <= v22)
          v31 = v22;
        else
          v31 = v28;
        if (v28 >= v22)
          v20 = v22;
        else
          v20 = v28;
        v19 = v31 - v20;

      }
      v15 = v34;
      v7 = v32;
    }
    while (v34 < v32);
  }
}

- (id)pParagraphStyleWithFrequentAttributesInString:(id)a3 withinStringRange:(_NSRange)a4 currentParagraphStyle:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  NSUInteger v20;
  uint64_t v21;
  id v22;
  uint64_t v25;
  unint64_t v26;

  length = a4.length;
  location = a4.location;
  v9 = a4.location + a4.length;
  if (a4.location + a4.length > objc_msgSend(a3, "length"))
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pParagraphStyleWithFrequentAttributesInString:withinStringRange:currentParagraphStyle:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 760, CFSTR("Range extends outside attributed string"));
  }
  v12 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  if (location < v9)
  {
    v13 = location;
    do
    {
      v25 = 0;
      v26 = 0;
      objc_msgSend(v12, "addObjectsFromArray:", objc_msgSend((id)objc_msgSend(a3, "attributesAtIndex:effectiveRange:", v13, &v25), "allKeys"));
      v13 = v26 + v25;
    }
    while (v26 + v25 < v9);
  }
  v14 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v15 = (void *)objc_msgSend(v12, "objectEnumerator");
  v16 = objc_msgSend(v15, "nextObject");
  if (v16)
  {
    v17 = v16;
    do
    {
      if (location < v9)
      {
        v18 = 0;
        v19 = 0;
        v20 = location;
        do
        {
          v25 = 0;
          v26 = 0;
          v21 = objc_msgSend(a3, "attribute:atIndex:longestEffectiveRange:inRange:", v17, v20, &v25, location, length);
          if (v26 > v18)
          {
            v19 = v21;
            v18 = v26;
          }
          v20 = v26 + v25;
        }
        while (v26 + v25 < v9);
        if (v19)
          objc_msgSend(v14, "setObject:forKeyedSubscript:", v19, v17);
      }
      v17 = objc_msgSend(v15, "nextObject");
    }
    while (v17);
  }
  v22 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  objc_msgSend(v22, "addValuesFromPropertyMap:", +[TSWPPropertyConverter mapCharacterPropertiesFromNS:](TSWPPropertyConverter, "mapCharacterPropertiesFromNS:", v14));
  objc_msgSend(v22, "addValuesFromPropertyMap:", -[TSWPStorage pImportParagraphAttributes:paragraphStyle:](self, "pImportParagraphAttributes:paragraphStyle:", v14, 0));
  return -[TSSStylesheet variationOfStyle:propertyMap:](self->_stylesheet, "variationOfStyle:propertyMap:", a5, v22);
}

- (id)pImportParagraphAttributes:(id)a3 paragraphStyle:(id)a4
{
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  TSWPLineSpacing *v8;
  double v9;
  double v10;
  TSWPLineSpacing *v11;
  double v12;
  double v13;
  TSWPLineSpacing *v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v20;
  void *v21;
  TSWPTabs *v22;
  unint64_t v23;
  void *v24;
  uint64_t v25;
  double v26;
  double v27;
  uint64_t v28;
  id v29;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;

  v4 = objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x24BDF6628], a4);
  if (!v4)
    return 0;
  v5 = (void *)v4;
  v6 = +[TSSPropertyMap propertyMap](TSSPropertyMap, "propertyMap");
  objc_msgSend(v5, "lineHeightMultiple");
  if (v7 <= 0.0)
  {
    objc_msgSend(v5, "minimumLineHeight");
    v10 = v9;
    objc_msgSend(v5, "maximumLineHeight");
    if (v10 > 0.0)
    {
      v13 = v12;
      v14 = [TSWPLineSpacing alloc];
      v15 = v10 == v13 ? 2 : 1;
      v11 = -[TSWPLineSpacing initWithMode:amount:](v14, "initWithMode:amount:", v15, v10);
      if (v11)
        goto LABEL_12;
    }
    v8 = +[TSWPLineSpacing lineSpacing](TSWPLineSpacing, "lineSpacing", v11);
  }
  else
  {
    v8 = -[TSWPLineSpacing initWithMode:amount:]([TSWPLineSpacing alloc], "initWithMode:amount:", 0, v7);
  }
  v11 = v8;
LABEL_12:
  objc_msgSend(v6, "setObject:forProperty:", v11, 85);
  objc_msgSend(v5, "paragraphSpacingBefore");
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 87);
  objc_msgSend(v5, "paragraphSpacing");
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 88);
  objc_msgSend(v6, "setIntValue:forProperty:", objc_msgSend(v5, "baseWritingDirection") == 1, 44);
  v16 = objc_msgSend(v5, "alignment");
  if (v16 >= 0x80000000)
  {
    v31 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v32 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pImportParagraphAttributes:paragraphStyle:]");
    objc_msgSend(v31, "handleFailureInFunction:file:lineNumber:description:", v32, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 890, CFSTR("Out-of-bounds type assignment was clamped to max"));
  }
  else if (v16 <= (uint64_t)0xFFFFFFFF7FFFFFFFLL)
  {
    v33 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", v16);
    v34 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(conversion_private) pImportParagraphAttributes:paragraphStyle:]");
    objc_msgSend(v33, "handleFailureInFunction:file:lineNumber:description:", v34, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_conversion_private.mm"), 890, CFSTR("Out-of-bounds type assignment was clamped to min"));
  }
  objc_msgSend(v6, "setIntValue:forProperty:");
  objc_msgSend(v5, "firstLineHeadIndent");
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 80);
  objc_msgSend(v5, "headIndent");
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 81);
  objc_msgSend(v5, "tailIndent");
  v18 = 468.0 - v17;
  if (468.0 - v17 <= 0.0 || v17 == 0.0)
    v20 = 0.0;
  else
    v20 = 468.0 - v17;
  objc_msgSend(v6, "setCGFloatValue:forProperty:", 82, v20, v18);
  v21 = (void *)objc_msgSend(v5, "tabStops");
  if (objc_msgSend(v21, "count"))
  {
    v22 = objc_alloc_init(TSWPTabs);
    if (objc_msgSend(v21, "count"))
    {
      v23 = 0;
      do
      {
        v24 = (void *)objc_msgSend(v21, "objectAtIndexedSubscript:", v23);
        v25 = objc_msgSend(v24, "alignment");
        objc_msgSend(v24, "location");
        v27 = v26;
        if (v25 == 2)
          v28 = 2;
        else
          v28 = v25 == 1;
        v29 = +[TSWPTab tab](TSWPTab, "tab");
        objc_msgSend(v29, "setPosition:", v27);
        objc_msgSend(v29, "setAlignment:", v28);
        -[TSWPTabs insertTab:](v22, "insertTab:", v29);
        ++v23;
      }
      while (v23 < objc_msgSend(v21, "count"));
    }
    objc_msgSend(v6, "setObject:forProperty:", v22, 84);

  }
  return v6;
}

- (id)pDrawableInfoFromImporter:(id)a3 error:(id *)a4
{
  NSObject *v6;
  id v7;
  _QWORD v9[8];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  uint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;

  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__21;
  v20 = __Block_byref_object_dispose__21;
  v21 = 0;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3052000000;
  v13 = __Block_byref_object_copy__21;
  v14 = __Block_byref_object_dispose__21;
  v15 = 0;
  if (a3)
  {
    v6 = dispatch_semaphore_create(0);
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __67__TSWPStorage_conversion_private__pDrawableInfoFromImporter_error___block_invoke;
    v9[3] = &unk_24D82D8F8;
    v9[6] = &v16;
    v9[7] = &v10;
    v9[4] = a3;
    v9[5] = v6;
    objc_msgSend(a3, "importInfoWithCompletionHandler:", v9);
    dispatch_semaphore_wait(v6, 0xFFFFFFFFFFFFFFFFLL);
    dispatch_release(v6);
  }
  if (a4)
    *a4 = (id)v11[5];
  v7 = (id)v17[5];
  _Block_object_dispose(&v10, 8);
  _Block_object_dispose(&v16, 8);
  return v7;
}

intptr_t __67__TSWPStorage_conversion_private__pDrawableInfoFromImporter_error___block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = (id)objc_msgSend(*(id *)(a1 + 32), "info");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "error"), "copy");
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
}

- (void)transferAttributeArraySource:(TSWPAttributeArray *)a3 toAttributeArrayDest:(TSWPAttributeArray *)a4 atCharIndex:(unint64_t)a5 dolcContext:(id)a6 undoTransaction:(void *)a7
{
  unint64_t var2;
  unint64_t v9;
  TSWPStorage *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  objc_object *v16;
  uint64_t var1;
  unint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v22;
  NSUInteger v23;
  NSUInteger v24;
  unint64_t v25;
  unint64_t v26;
  uint64_t v27;
  TSWPAttributeArray *v28;
  objc_object *v29;
  TSKAddedToDocumentContext *v30;
  int64_t v31;
  int64_t v32;
  unint64_t v33;
  objc_object *v34;
  _BOOL4 v35;
  unsigned int v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unint64_t v41;
  TSWPAttributeArray *v46;
  uint64_t v48;
  int v49;
  _NSRange v50;

  if (a3 && a4)
  {
    var2 = a3->var2;
    if (var2)
    {
      v9 = a5;
      v10 = self;
      v46 = 0;
      v11 = 0;
      v41 = a5 - 1;
      v12 = 8;
      v48 = 0x7FFFFFFFFFFFFFFFLL;
      while (1)
      {
        v13 = TSWPAttributeArray::rangeForAttributeIndex(a3, v11);
        v15 = v14;
        if ((*((unsigned int (**)(TSWPAttributeArray *))a3->var0 + 3))(a3))
          v16 = *(objc_object **)((char *)a3->var4 + v12);
        else
          v16 = 0;
        var1 = a3->var1;
        v18 = v13 + v9;
        switch((int)var1)
        {
          case 0:
          case 8:
            v25 = v48;
            if (v48 == 0x7FFFFFFFFFFFFFFFLL)
              v25 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a4, v9);
            v48 = v25;
            if (v11 || (v26 = TSWPAttributeArray::charIndexForAttributeIndex(a4, v25), v25 = v48, v26 >= v9))
            {
              v27 = v25 + v11;
              v28 = a4;
              v29 = v16;
              v30 = 0;
              goto LABEL_52;
            }
            goto LABEL_53;
          case 1:
          case 2:
          case 9:
          case 11:
          case 18:
            if (!v15)
              goto LABEL_53;
            v19 = v48;
            if (v48 == 0x7FFFFFFFFFFFFFFFLL)
              v19 = -[TSWPStorage paragraphIndexAtCharIndex:](v10, "paragraphIndexAtCharIndex:", v9);
            v48 = v19;
            v20 = (uint64_t)v46;
            if (!v46)
              v20 = -[TSWPStorage attributeArrayForKind:](v10, "attributeArrayForKind:", 0);
            v46 = (TSWPAttributeArray *)v20;
            v21 = -[TSWPStorage paragraphIndexAtCharIndex:](v10, "paragraphIndexAtCharIndex:", v18);
            v22 = -[TSWPStorage paragraphIndexAtCharIndex:](v10, "paragraphIndexAtCharIndex:", v15 + v18 - 1);
            v23 = v22 - v21;
            v24 = v22 - v21 + 1;
            if (v11)
            {
              if (v22 - v21 == -1)
                goto LABEL_49;
            }
            else
            {
              v35 = TSWPAttributeArray::charIndexForAttributeIndex(v46, v21) < v9 && v24 != 0;
              if (v35)
                v24 = v23;
              if (!v24)
                goto LABEL_49;
              v21 += v35;
              if (TSWPAttributeArray::charIndexForAttributeIndex(v46, v21) < v9)
                goto LABEL_49;
            }
            v36 = a3->var1;
            v10 = self;
            if (v36 > 0x12 || ((1 << v36) & 0x40802) == 0)
            {
              if (!a4->var2)
              {
                v40 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
                v37 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TSWPStorage_copying) transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:]");
                objc_msgSend(v40, "handleFailureInFunction:file:lineNumber:description:", v37, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_copying.mm"), 100, CFSTR("This attribute table should not be empty. This storage was created incorrectly."));
              }
              v50.location = v21;
              v50.length = v24;
              TSWPParagraphAttributeArray::applyObjectToParagraphRange((TSWPParagraphAttributeArray *)a4, v16, v50, (TSWPParagraphAttributeArray *)v46, (TSWPStorageTransaction *)a7);
LABEL_49:
              v10 = self;
              goto LABEL_53;
            }
            v49 = *(_DWORD *)((char *)a3->var4 + v12);
            TSWPParagraphAttributeArray::applyParagraphDataToParagraphRange((TSWPParagraphAttributeArray *)a4, (unsigned __int16 *)&v49, v21, v24, v46, (TSWPStorageTransaction *)a7);
LABEL_53:
            ++v11;
            v12 += 16;
            if (var2 == v11)
              return;
            break;
          case 3:
          case 6:
          case 7:
          case 12:
          case 13:
          case 17:
            if (v15)
              goto LABEL_31;
            goto LABEL_53;
          case 4:
          case 5:
            v31 = v48;
            if (v48 == 0x7FFFFFFFFFFFFFFFLL)
            {
              if (v9
                && (v32 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(a4, v41), v32 < 0x7FFFFFFFFFFFFFFELL))
              {
                v31 = v32 + 1;
              }
              else
              {
                v31 = 0;
              }
            }
            v48 = v31;
            v27 = v31 + v11;
            v28 = a4;
            v29 = v16;
            v30 = (TSKAddedToDocumentContext *)a6;
LABEL_52:
            TSWPAttributeArray::replaceObjectForAttributeIndex(v28, v29, v27, v30, (TSWPStorageTransaction *)a7);
            goto LABEL_53;
          case 15:
          case 16:
            if (!objc_msgSend(a6, "exportingFootnotes") || !v15)
              goto LABEL_53;
            var1 = a3->var1;
LABEL_31:
            if ((_DWORD)var1 != 17)
              goto LABEL_34;
            if (-[TSWPStorage highlightsAllowed](v10, "highlightsAllowed"))
            {
              var1 = a3->var1;
LABEL_34:
              v33 = var2;
              v34 = 0;
              if (var1 <= 0x11 && ((1 << var1) & 0x390C0) != 0)
              {
                v10 = self;
                v16 = (objc_object *)-[objc_object copyWithContext:](v16, "copyWithContext:", -[TSPObject context](self, "context"));
                v34 = v16;
              }
              else
              {
                v10 = self;
              }
              -[TSWPStorage lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:](v10, "lowLevelApplyObject:toCharRange:forKind:dolcContext:undoTransaction:", v16, v18, v15, var1, a6, a7);

              var2 = v33;
              v9 = a5;
            }
            goto LABEL_53;
          default:
            goto LABEL_53;
        }
      }
    }
  }
  else
  {
    v38 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v39 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TSWPStorage_copying) transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:]");
    objc_msgSend(v38, "handleFailureInFunction:file:lineNumber:description:", v39, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_copying.mm"), 25, CFSTR("transferAttributeArraySource: bad tables."));
  }
}

- (_NSRange)replaceCharactersInRange:(_NSRange)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 undoTransaction:(void *)a7
{
  _BOOL8 v9;
  TSWPSelection *v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  _NSRange result;

  v9 = a5;
  v12 = -[TSWPSelection initWithRange:]([TSWPSelection alloc], "initWithRange:", a3.location, a3.length);
  v13 = -[TSWPStorage replaceCharactersInSelection:withStorage:usePasteRules:dolcContext:changeSession:undoTransaction:](self, "replaceCharactersInSelection:withStorage:usePasteRules:dolcContext:changeSession:undoTransaction:", v12, a4, v9, a6, 0, a7);
  v15 = v14;

  v16 = v13;
  v17 = v15;
  result.length = v17;
  result.location = v16;
  return result;
}

- (_NSRange)replaceCharactersInSelection:(id)a3 withStorage:(id)a4 usePasteRules:(BOOL)a5 dolcContext:(id)a6 changeSession:(id)a7 undoTransaction:(void *)a8
{
  _BOOL4 v11;
  TSWPStoragePasteRules *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  TSWPAttributeArray *v27;
  double v28;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v31;
  NSUInteger v32;
  __int128 v33;
  _NSRange result;

  v11 = a5;
  -[TSPObject willModify](self, "willModify");
  if (v11)
    v15 = objc_alloc_init(TSWPStoragePasteRules);
  else
    v15 = 0;
  v16 = -[TSWPStorage relocateNonSelectedAnchorsInSelection:undoTransaction:](self, "relocateNonSelectedAnchorsInSelection:undoTransaction:", a3, a8);
  v17 = objc_msgSend(v16, "range");
  -[TSWPStoragePasteRules willPasteStorage:intoDestStorage:atDestRange:](v15, "willPasteStorage:intoDestStorage:atDestRange:", a4, self, v17, v18);
  v19 = objc_msgSend(a4, "string");
  v20 = -[TSWPStorage length](self, "length");
  v33 = xmmword_217C27470;
  v21 = -[TSWPStorage replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", v16, v19, 0, 0, a7, a8, &v33);
  v23 = v22;
  if (*((_QWORD *)&v33 + 1))
  {
    v24 = 0;
    do
    {
      v25 = objc_msgSend(a4, "attributeArrayForKind:", v24);
      if (v25)
      {
        v26 = v25;
        if ((_DWORD)v24 == 9)
        {
          if ((unint64_t)objc_msgSend(a4, "columnStyleCount") < 2
            || !-[TSWPStorage supportsColumnStyles](self, "supportsColumnStyles"))
          {
            goto LABEL_19;
          }
        }
        else if ((_DWORD)v24 == 8)
        {
          if ((unint64_t)objc_msgSend(a4, "sectionCount") < 2
            || !-[TSWPStorage supportsSections](self, "supportsSections"))
          {
            goto LABEL_19;
          }
        }
        else if ((_DWORD)v24 == 2
               && (!-[TSWPStorage supportsListStyles](self, "supportsListStyles")
                || !-[TSWPStorage listStyleCount](self, "listStyleCount")))
        {
          goto LABEL_19;
        }
        v27 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", v24, 1, a8);
        -[TSWPStorage transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:](self, "transferAttributeArraySource:toAttributeArrayDest:atCharIndex:dolcContext:undoTransaction:", v26, v27, (_QWORD)v33, a6, a8);
      }
LABEL_19:
      v24 = (v24 + 1);
    }
    while ((_DWORD)v24 != 19);
  }
  -[TSWPStorage compress:](self, "compress:", a8);
  if (a8)
    *(_QWORD *)&v28 = TSWPStorageTransaction::compress((TSWPStorageTransaction *)a8).u64[0];
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v21, v23, -[TSWPStorage length](self, "length", v28) - v20, 1);
  self->_delayBroadcast = 1;
  self->_rangeToBroadcast.location = 0;
  self->_rangeToBroadcast.length = 0;
  -[TSWPStoragePasteRules didPasteWithIOTransaction:atDestRange:](v15, "didPasteWithIOTransaction:atDestRange:", a8, v33);

  location = self->_rangeToBroadcast.location;
  length = self->_rangeToBroadcast.length;
  self->_rangeToBroadcast.location = 0;
  self->_rangeToBroadcast.length = 0;
  self->_delayBroadcast = 0;
  if (location | length)
    -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:");
  v31 = v21;
  v32 = v23;
  result.length = v32;
  result.location = v31;
  return result;
}

- (_NSRange)textRangeIgnoringTrailingLineBreaksForParagraphAtIndex:(unint64_t)a3
{
  uint64_t v4;
  NSUInteger v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  int v9;
  unsigned int v10;
  uint64_t v11;
  NSUInteger v12;
  _NSRange result;

  v4 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a3);
  v6 = v4;
  if (v5)
  {
    v7 = v5;
    v8 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v5 + v4 - 1);
    v9 = v8;
    v10 = IsParagraphBreakingCharacter(v8);
    if (v9 == 8232)
      v11 = 1;
    else
      v11 = v10;
    v5 = v7 - v11;
  }
  v12 = v6;
  result.length = v5;
  result.location = v12;
  return result;
}

- (id)pDefaultSectionForContext:(id)a3
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return (id)-[TSWPStorage defaultSectionForContext:](self, "defaultSectionForContext:", a3);
  else
    return -[TSWPSectionPlaceholder initWithContext:]([TSWPSectionPlaceholder alloc], "initWithContext:", a3);
}

- (void)p_fillMarkers:(void *)a3 startingAtCharIndex:(unint64_t)a4 forCount:(unint64_t)a5
{
  unint64_t v6;
  unint64_t v8;
  unint64_t *v9;
  _QWORD *v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  unint64_t v15;
  char *v16;
  unint64_t *v17;
  char *v18;
  unint64_t v19;
  unint64_t v20;
  UniChar *v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unsigned int v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t *v29;
  _QWORD *v30;
  unint64_t *v31;
  uint64_t v32;
  unint64_t v33;
  uint64_t v34;
  unint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  BOOL v40;
  char *v42;
  CFRange v43;

  v6 = a4;
  v8 = *((_QWORD *)a3 + 2);
  v42 = (char *)a3 + 16;
  v9 = (unint64_t *)*((_QWORD *)a3 + 1);
  if ((unint64_t)v9 >= v8)
  {
    v11 = *(unint64_t **)a3;
    v12 = ((uint64_t)v9 - *(_QWORD *)a3) >> 3;
    v13 = v12 + 1;
    if ((unint64_t)(v12 + 1) >> 61)
LABEL_55:
      abort();
    v14 = v8 - (_QWORD)v11;
    if (v14 >> 2 > v13)
      v13 = v14 >> 2;
    if ((unint64_t)v14 >= 0x7FFFFFFFFFFFFFF8)
      v15 = 0x1FFFFFFFFFFFFFFFLL;
    else
      v15 = v13;
    if (v15)
    {
      v16 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)v42, v15);
      v11 = *(unint64_t **)a3;
      v9 = (unint64_t *)*((_QWORD *)a3 + 1);
    }
    else
    {
      v16 = 0;
    }
    v17 = (unint64_t *)&v16[8 * v12];
    v18 = &v16[8 * v15];
    *v17 = v6;
    v10 = v17 + 1;
    while (v9 != v11)
    {
      v19 = *--v9;
      *--v17 = v19;
    }
    *(_QWORD *)a3 = v17;
    *((_QWORD *)a3 + 1) = v10;
    *((_QWORD *)a3 + 2) = v18;
    if (v11)
      operator delete(v11);
  }
  else
  {
    *v9 = a4;
    v10 = v9 + 1;
  }
  *((_QWORD *)a3 + 1) = v10;
  if (a5 > ((uint64_t)v10 - *(_QWORD *)a3) >> 3)
  {
    v20 = -[NSMutableString length](self->_string, "length");
    v21 = 0;
    do
    {
      if (v6 >= v20)
        break;
      if (!v21)
        v21 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
      if (v20 >= v6 + 1024)
        v22 = v6 + 1024;
      else
        v22 = v20;
      v23 = v22 - v6;
      v43.location = v6;
      v43.length = v22 - v6;
      CFStringGetCharacters((CFStringRef)self->_string, v43, v21);
      if ((uint64_t)(v22 - v6) >= 1)
      {
        v24 = 0;
        v25 = 0;
        v26 = v6 + 1;
        do
        {
          while (!IsParagraphBreakingCharacter(v21[v24]))
          {
            v24 = ++v25;
            if (v23 <= v25)
              goto LABEL_51;
          }
          v27 = v26 + v24;
          v29 = (unint64_t *)*((_QWORD *)a3 + 1);
          v28 = *((_QWORD *)a3 + 2);
          if ((unint64_t)v29 >= v28)
          {
            v31 = *(unint64_t **)a3;
            v32 = ((uint64_t)v29 - *(_QWORD *)a3) >> 3;
            v33 = v32 + 1;
            if ((unint64_t)(v32 + 1) >> 61)
              goto LABEL_55;
            v34 = v28 - (_QWORD)v31;
            if (v34 >> 2 > v33)
              v33 = v34 >> 2;
            if ((unint64_t)v34 >= 0x7FFFFFFFFFFFFFF8)
              v35 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v35 = v33;
            if (v35)
            {
              v36 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)v42, v35);
              v31 = *(unint64_t **)a3;
              v29 = (unint64_t *)*((_QWORD *)a3 + 1);
            }
            else
            {
              v36 = 0;
            }
            v37 = &v36[8 * v32];
            *(_QWORD *)v37 = v27;
            v30 = v37 + 8;
            while (v29 != v31)
            {
              v38 = *--v29;
              *((_QWORD *)v37 - 1) = v38;
              v37 -= 8;
            }
            *(_QWORD *)a3 = v37;
            *((_QWORD *)a3 + 1) = v30;
            *((_QWORD *)a3 + 2) = &v36[8 * v35];
            if (v31)
              operator delete(v31);
          }
          else
          {
            *v29 = v27;
            v30 = v29 + 1;
          }
          *((_QWORD *)a3 + 1) = v30;
          v39 = (uint64_t)v30 - *(_QWORD *)a3;
          v24 = v25 + 1;
          v40 = a5 <= v39 >> 3 || v23 <= v24;
          ++v25;
        }
        while (!v40);
      }
LABEL_51:
      v6 = v22;
    }
    while (a5 > (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 3);
    if (v21)
      free(v21);
  }
}

+ (void)setDisallowedElementKinds:(unsigned int)a3 forStorageKind:(int)a4
{
  *((_DWORD *)&sDisallowElementKinds + a4) = a3;
}

+ (BOOL)allowsElementKind:(int)a3 forStorageKind:(int)a4
{
  return (*((_DWORD *)&sDisallowElementKinds + a4) & a3) == 0;
}

+ (id)filterText:(id)a3
{
  return (id)objc_msgSend(a1, "filterText:removingAttachments:", a3, 1);
}

+ (id)filterText:(id)a3 removingAttachments:(BOOL)a4
{
  _BOOL4 v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v29;

  v4 = a4;
  v5 = +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars;
  if (+[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars)
  {
    v6 = a3;
    v7 = (void *)+[TSWPStorage filterText:removingAttachments:]::sFilteredStorageCharsWithAttachmentChar;
  }
  else
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD1690]);
    objc_msgSend(v8, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "controlCharacterSet"));
    v6 = a3;
    objc_msgSend(v8, "formUnionWithCharacterSet:", objc_msgSend(MEMORY[0x24BDD14A8], "illegalCharacterSet"));
    objc_msgSend(v8, "removeCharactersInRange:", 10, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 11, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8233, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8232, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 13, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 9, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 173, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8203, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 65279, 1);
    objc_msgSend(v8, "removeCharactersInRange:", 8378, 1);
    objc_msgSend(v8, "addCharactersInRange:", 14, 1);
    objc_msgSend(v8, "addCharactersInRange:", 65533, 1);
    +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars = (uint64_t)v8;
    v7 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v7, "addCharactersInRange:", 65532, 1);
    +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageCharsWithAttachmentChar = (uint64_t)v7;
    v5 = +[TSWPStorage filterText:removingAttachments:]::sFilteredStorageChars;
  }
  if (v4)
    v9 = v7;
  else
    v9 = (void *)v5;
  objc_opt_class();
  v10 = (void *)TSUDynamicCast();
  v29 = v10;
  if (v10)
  {
    v11 = objc_msgSend(v10, "string");
  }
  else
  {
    objc_opt_class();
    v11 = TSUDynamicCast();
  }
  v12 = (void *)v11;
  if (!v11)
  {
    v13 = objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPStorage filterText:removingAttachments:]");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm");
    v16 = (void *)v13;
    v6 = a3;
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v14, v15, 268, CFSTR("invalid nil value for '%s'"), "theStr");
  }
  if (objc_msgSend(v12, "length"))
  {
    v17 = 0;
    v18 = 0;
    do
    {
      v19 = objc_msgSend(v12, "rangeOfCharacterFromSet:options:range:", v9, 0, v17, objc_msgSend(v12, "length") - v17);
      if (v19 == 0x7FFFFFFFFFFFFFFFLL || v20 == 0)
        break;
      v17 = v19;
      v22 = v20;
      v23 = objc_msgSend(v12, "length");
      if ((v18 & 1) == 0)
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v24 = (void *)objc_msgSend(a3, "mutableCopy");
          v6 = v24;
          v25 = objc_msgSend(v24, "mutableString");
        }
        else
        {
          v25 = objc_msgSend(MEMORY[0x24BDD16A8], "stringWithString:", v12);
          v6 = (id)v25;
        }
        v12 = (void *)v25;
      }
      objc_msgSend(v6, "replaceCharactersInRange:withString:", v17, v22, &stru_24D82FEB0);
      v18 = 1;
    }
    while (v23 != v17 + v22);
  }
  if (v29 && (objc_msgSend(v12, "isEqualToString:", objc_msgSend(v6, "string")) & 1) == 0)
  {
    v26 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v27 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSWPStorage filterText:removingAttachments:]");
    objc_msgSend(v26, "handleFailureInFunction:file:lineNumber:description:", v27, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 305, CFSTR("Internal inconsistency in attributed string"));
  }
  return v6;
}

+ (id)filterMarkAttributes:(id)a3
{
  return a3;
}

- (void)addObserver:(id)a3
{
  TSWPStorageBroadcaster *broadcaster;

  broadcaster = self->_broadcaster;
  if (!broadcaster)
  {
    broadcaster = objc_alloc_init(TSWPStorageBroadcaster);
    self->_broadcaster = broadcaster;
  }
  -[TSWPStorageBroadcaster addObserver:](broadcaster, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[TSWPStorageBroadcaster removeObserver:](self->_broadcaster, "removeObserver:", a3);
}

- (void)setDocumentRoot:(id)a3
{
  if (self->_documentRoot != a3)
    -[TSPObject willModify](self, "willModify");
  self->_documentRoot = (TSKDocumentRoot *)a3;
}

- (void)setWPKind:(int)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  void *v7;
  uint64_t v8;
  TSWPAttributeArray *v9;
  TSWPAttributeArray *v10;

  if (self->_WPKind != a3)
  {
    if (!a3)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage setWPKind:undoTransaction:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1081, CFSTR("Can't set storage kind to kBody without a context and column style"));
    }
    self->_WPKind = a3;
    if (!-[TSWPStorage supportsColumnStyles](self, "supportsColumnStyles"))
    {
      v9 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 9, 0, 0);
      if (v9)
        (*((void (**)(TSWPAttributeArray *, _QWORD, unint64_t, TSWPStorageTransaction *))v9->var0 + 7))(v9, 0, v9->var2, a4);
    }
    if (!-[TSWPStorage supportsSections](self, "supportsSections"))
    {
      v10 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 8, 0, 0);
      if (v10)
        (*((void (**)(TSWPAttributeArray *, _QWORD, unint64_t, TSWPStorageTransaction *))v10->var0 + 7))(v10, 0, v10->var2, a4);
    }
    if (self->_WPKind == 5
      && !-[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 2, 0, 0))
    {
      -[TSWPStorage insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:](self, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", objc_msgSend(-[TSWPStorage stylesheet](self, "stylesheet"), "defaultListStyle"), 0, -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 2, 1, 0), 0, 0, 0);
    }
    -[TSWPStorage filterInvalidContentForStorage:undoTransaction:](self, "filterInvalidContentForStorage:undoTransaction:", self, a4);
  }
}

- (void)addDisallowedElementKind:(int)a3
{
  self->_disallowElementKinds |= a3;
}

- (void)removeDisallowedElementKind:(int)a3
{
  self->_disallowElementKinds &= ~a3;
}

- (void)filterSectionBreaksFromStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  TSWPAttributeArray *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int16 v11;
  __int16 v12;

  if ((objc_msgSend(a3, "supportsSectionCopying") & 1) == 0)
  {
    v6 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 8, 0, 0);
    if (v6)
      (*((void (**)(TSWPAttributeArray *, _QWORD, unint64_t, TSWPStorageTransaction *))v6->var0 + 7))(v6, 0, v6->var2, a4);
    if (-[NSMutableString length](self->_string, "length"))
    {
      v12 = 4;
      v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v12, 1);
      v8 = -[NSMutableString rangeOfString:](self->_string, "rangeOfString:", v7);
      if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v9 = v8;
        v11 = 5;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithCharacters:length:", &v11, 1);
        -[NSMutableString replaceOccurrencesOfString:withString:options:range:](self->_string, "replaceOccurrencesOfString:withString:options:range:", v7, v10, 2, v9, -[NSMutableString length](self->_string, "length") - v9);

      }
    }
  }
}

- (void)filterInvalidContentForStorage:(id)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  char v11;
  const __CFString *v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  void *v16;
  char v17;
  const __CFString *v18;
  uint64_t i;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  NSUInteger v23;
  uint64_t v24;
  uint64_t v25;
  NSUInteger location;
  NSUInteger length;
  _NSRange v28;
  id v29[6];

  -[TSWPStorage filterSectionBreaksFromStorage:undoTransaction:](self, "filterSectionBreaksFromStorage:undoTransaction:");
  if ((objc_msgSend(a3, "allowsElementKind:", 1049087) & 1) == 0)
  {
    v7 = -[TSWPStorage attachmentCount](self, "attachmentCount");
    if (v7)
    {
      v8 = v7 - 1;
      do
      {
        v29[0] = (id)0x7FFFFFFFFFFFFFFFLL;
        v9 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v8, v29);
        if (v9)
        {
          if (v29[0] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v10 = v9;
            if (!objc_msgSend(a3, "allowsElementKind:", objc_msgSend(v9, "elementKind"))
              || objc_msgSend(v10, "isDrawable")
              && objc_msgSend(v10, "isAnchored")
              && objc_msgSend(a3, "wpKind"))
            {
              v11 = objc_opt_respondsToSelector();
              v12 = &stru_24D82FEB0;
              if ((v11 & 1) != 0)
                v12 = (const __CFString *)objc_msgSend(v10, "stringEquivalent");
              -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v29[0], 1, v12, 0, a4);
            }
          }
        }
        --v8;
      }
      while (v8 != -1);
    }
    v13 = -[TSWPStorage footnoteCount](self, "footnoteCount");
    if (v13)
    {
      v14 = v13 - 1;
      do
      {
        v29[0] = (id)0x7FFFFFFFFFFFFFFFLL;
        v15 = -[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", v14, v29);
        if (v15)
        {
          if (v29[0] != (id)0x7FFFFFFFFFFFFFFFLL)
          {
            v16 = v15;
            if ((objc_msgSend(a3, "allowsElementKind:", objc_msgSend(v15, "elementKind")) & 1) == 0)
            {
              v17 = objc_opt_respondsToSelector();
              v18 = &stru_24D82FEB0;
              if ((v17 & 1) != 0)
                v18 = (const __CFString *)objc_msgSend(v16, "stringEquivalent");
              -[TSWPStorage replaceCharactersInRange:withString:notifyObservers:undoTransaction:](self, "replaceCharactersInRange:withString:notifyObservers:undoTransaction:", v29[0], 1, v18, 0, a4);
            }
          }
        }
        --v14;
      }
      while (v14 != -1);
    }
  }
  for (i = 0; i != 3; ++i)
  {
    v20 = dword_217C2B1D0[i];
    if (self->_attributesTable[v20])
    {
      if ((objc_msgSend(a3, "allowsElementKind:", 802304) & 1) == 0)
      {
        v21 = -[TSWPStorage length](self, "length");
        if (v21)
        {
          v22 = v21;
          v23 = 0;
          while (2)
          {
            TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v29, self, v23, v22 - v23, v20);
            v28.location = 0;
            v28.length = 0;
            do
            {
              v24 = TSWPAttributeEnumerator::nextAttributeIndex(v29, &v28);
              if (!v24)
              {
                TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v29);
                goto LABEL_35;
              }
              v25 = *(_QWORD *)(v24 + 8);
            }
            while (!v25
                 || (objc_msgSend(a3, "allowsElementKind:", objc_msgSend(*(id *)(v24 + 8), "elementKind")) & 1) != 0);
            -[TSWPStorage removeSmartField:fromRange:undoTransaction:](self, "removeSmartField:fromRange:undoTransaction:", v25, v28.location, v28.length, a4);
            location = v28.location;
            length = v28.length;
            v22 = -[TSWPStorage length](self, "length");
            v23 = length + location;
            TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v29);
            if (v23 < v22)
              continue;
            break;
          }
        }
      }
    }
LABEL_35:
    ;
  }
}

- (BOOL)setDOLCSuppressed:(BOOL)a3
{
  BOOL dolcSuppressed;

  dolcSuppressed = self->_dolcSuppressed;
  self->_dolcSuppressed = a3;
  return dolcSuppressed;
}

- (id)stringValue
{
  void *v3;
  uint64_t v4;

  if (!self->_WPKind)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage stringValue]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1362, CFSTR("performance warning: -[TSWPStorage stringValue] should not be called on body storage."));
  }
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithString:", self->_string);
}

- (unint64_t)wordCount
{
  CFIndex v3;
  CFStringTokenizerRef v4;
  __CFStringTokenizer *v5;
  unint64_t v6;
  CFRange v8;

  v8.location = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:", 0);
  v8.length = v3;
  v4 = CFStringTokenizerCreate(0, (CFStringRef)self->_string, v8, 0, 0);
  if (!v4)
    return 0;
  v5 = v4;
  v6 = -1;
  do
    ++v6;
  while (CFStringTokenizerAdvanceToNextToken(v5));
  CFRelease(v5);
  return v6;
}

- (id)childEnumeratorForRange:(_NSRange)a3
{
  return -[TSWPStorageChildEnumerator initWithStorage:range:]([TSWPStorageChildEnumerator alloc], "initWithStorage:range:", self, a3.location, a3.length);
}

- (unint64_t)previousCharacterIndex:(unint64_t)a3
{
  return -[TSWPStorage previousCharacterIndex:forDelete:](self, "previousCharacterIndex:forDelete:", a3, 0);
}

- (unint64_t)previousCharacterIndex:(unint64_t)location forDelete:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  unint64_t v10;
  CFRange RangeOfComposedCharactersAtIndex;
  BOOL v12;

  v4 = a4;
  v7 = -[TSWPStorage characterCount](self, "characterCount");
  if (v7 >= location)
  {
    v10 = location - 1;
    if (location - 1 < v7)
    {
      RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex((CFStringRef)self->_string, location - 1);
      location = RangeOfComposedCharactersAtIndex.location;
      v12 = RangeOfComposedCharactersAtIndex.length < 2 || !v4;
      if (!v12
        && isDeletableWithoutCombining(-[NSMutableString characterAtIndex:](self->_string, "characterAtIndex:", v10)))
      {
        return v10;
      }
    }
  }
  else
  {
    v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage previousCharacterIndex:forDelete:]");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1455, CFSTR("Character index is outside storage bounds"));
  }
  return location;
}

- (unint64_t)nextCharacterIndex:(unint64_t)a3
{
  unint64_t v3;
  CFRange RangeOfComposedCharactersAtIndex;

  v3 = a3;
  if (-[TSWPStorage characterCount](self, "characterCount") > a3)
  {
    RangeOfComposedCharactersAtIndex = CFStringGetRangeOfComposedCharactersAtIndex((CFStringRef)self->_string, v3);
    return RangeOfComposedCharactersAtIndex.location + RangeOfComposedCharactersAtIndex.length;
  }
  return v3;
}

- (unint64_t)indexForCharacter:(unsigned __int16)a3 startCharIndex:(unint64_t)a4
{
  int v5;
  UniChar *v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  UniChar *v11;
  int v12;
  CFRange v14;

  v5 = a3;
  v7 = (UniChar *)malloc_type_malloc(0x800uLL, 0x1000040BDFB0063uLL);
  v8 = -[TSWPStorage characterCount](self, "characterCount");
  if (v8 > a4)
  {
    while (1)
    {
      v9 = a4 + 1024;
      v10 = v8 >= a4 + 1024 ? a4 + 1024 : v8;
      v14.location = a4;
      v14.length = v10 - a4;
      CFStringGetCharacters((CFStringRef)self->_string, v14, v7);
      v11 = v7;
      if ((uint64_t)(v10 - a4) >= 1)
        break;
LABEL_8:
      a4 = v10;
      if (v8 <= v9)
        goto LABEL_11;
    }
    while (1)
    {
      v12 = *v11++;
      if (v12 == v5)
        break;
      if (v10 == ++a4)
        goto LABEL_8;
    }
    v8 = a4;
  }
LABEL_11:
  free(v7);
  return v8;
}

- (unint64_t)selectedParagraphBreakCount:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  NSUInteger v14;
  BOOL v15;

  if (!a3.length)
    return 0;
  length = a3.length;
  location = a3.location;
  v6 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:");
  if (v6 >= v6 + v7)
    return 0;
  v8 = v6;
  v9 = v7;
  v10 = 0;
  do
  {
    v11 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", v8);
    v13 = v12 + v11 - 1;
    v15 = v13 >= location;
    v14 = v13 - location;
    v15 = !v15 || v14 >= length;
    if (!v15)
      ++v10;
    ++v8;
    --v9;
  }
  while (v9);
  return v10;
}

- (unint64_t)emptyParagraphCount:(_NSRange)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;

  if (!a3.length)
    return 0;
  v4 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", a3.location);
  if (v4 >= v4 + v5)
    return 0;
  v6 = v4;
  v7 = v5;
  v8 = 0;
  do
  {
    v9 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", v6);
    if (!v10
      || v10 == 1
      && IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v9)))
    {
      ++v8;
    }
    ++v6;
    --v7;
  }
  while (v7);
  return v8;
}

- (BOOL)isWholeParagraphsForRange:(_NSRange)a3 ignoreAttachmentCharacters:(BOOL)a4 requireParagraphBreakSelected:(BOOL)a5
{
  _BOOL4 v6;
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  BOOL result;
  NSUInteger v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  BOOL v23;
  void *v24;
  uint64_t v25;

  if (!a3.length)
    return 0;
  v6 = a4;
  length = a3.length;
  location = a3.location;
  v10 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  v12 = v10;
  if (v6 && (v13 = v11, v14 = v10 + v11, v10 < v10 + v11))
  {
    v15 = v10;
    while (IsSpecialCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v15)))
    {
      ++v15;
      if (!--v13)
      {
        v15 = v14;
        break;
      }
    }
  }
  else
  {
    v15 = v10;
  }
  result = 0;
  if (location >= v12 && location <= v15)
  {
    v17 = location + length;
    v18 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:", v17 - 1);
    if (v19)
    {
      v20 = v18 + v19;
      v21 = v18 + v19 - 1;
      v22 = IsParagraphBreakingCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v21));
      v23 = v22;
      if (v17 == v20)
      {
        result = !a5 | v22;
        if (result || a5)
          return result;
        return v17 == v21 && v23;
      }
      if (!a5)
        return v17 == v21 && v23;
    }
    else
    {
      v24 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage isWholeParagraphsForRange:ignoreAttachmentCharacters:requireParagraphBreakSelected:]");
      objc_msgSend(v24, "handleFailureInFunction:file:lineNumber:description:", v25, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1604, CFSTR("Paragraph should not be zero length"));
    }
    return 0;
  }
  return result;
}

- (BOOL)isEmptyParagraphSelection:(id)a3 outRange:(_NSRange *)a4
{
  uint64_t v7;
  BOOL v8;
  void *v9;
  NSUInteger v10;
  TSWPParagraphEnumerator v12;

  if (!objc_msgSend(a3, "isInsertionPoint"))
    return 0;
  v7 = objc_msgSend(a3, "range");
  if (self)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](self, "paragraphEnumeratorAtCharIndex:styleProvider:", v7, 0);
  else
    memset(&v12, 0, sizeof(v12));
  v9 = (void *)TSWPParagraphEnumerator::paragraphString(&v12);
  if (!objc_msgSend(v9, "length")
    || objc_msgSend(v9, "length") == 1
    && IsParagraphBreakingCharacter(objc_msgSend(v9, "characterAtIndex:", 0)))
  {
    if (a4)
    {
      a4->location = TSWPParagraphEnumerator::paragraphTextRange(&v12);
      a4->length = v10;
    }
    v8 = 1;
  }
  else
  {
    v8 = 0;
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v12);
  return v8;
}

- (BOOL)isAllWhitespaceInRange:(_NSRange)a3
{
  return -[NSMutableString isAllWhitespaceInRange:](self->_string, "isAllWhitespaceInRange:", a3.location, a3.length);
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPStorage whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", a3, 1);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)whiteSpaceRangeAtCharIndex:(unint64_t)a3 includingBreaks:(BOOL)a4
{
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  char v13;
  unint64_t v14;
  uint64_t v15;
  char v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  v7 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  v9 = v8;
  if (-[TSWPStorage length](self, "length") > a3
    && IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", a3)))
  {
    v10 = a3;
    if (v7 < a3)
    {
      v10 = a3;
      while (1)
      {
        v11 = v10 - 1;
        v12 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v10 - 1);
        if (!IsWhitespaceCharacter(v12))
          break;
        if (!a4)
        {
          v13 = IsParagraphBreakingCharacter(v12);
          if ((_DWORD)v12 == 8232 || (v13 & 1) != 0)
            break;
        }
        --v10;
        if (v11 <= v7)
        {
          v10 = v7;
          break;
        }
      }
    }
    v14 = v7 + v9;
    if (v14 > a3)
    {
      while (1)
      {
        v15 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", a3);
        if (!IsWhitespaceCharacter(v15))
          break;
        if (!a4)
        {
          v16 = IsParagraphBreakingCharacter(v15);
          if ((_DWORD)v15 == 8232 || (v16 & 1) != 0)
            break;
        }
        if (v14 == ++a3)
        {
          a3 = v14;
          break;
        }
      }
    }
    v17 = a3 - v10;
  }
  else
  {
    v17 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
  v18 = v10;
  result.length = v17;
  result.location = v18;
  return result;
}

- (_NSRange)rangeForSelectionWithInsertionSelection:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  if (!objc_msgSend(a3, "isValid") || (objc_msgSend(a3, "isInsertionPoint") & 1) == 0)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage rangeForSelectionWithInsertionSelection:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1692, CFSTR("Invalid selection parameter passed in"));
  }
  if (objc_msgSend(a3, "isValid") && objc_msgSend(a3, "start"))
    v7 = objc_msgSend(a3, "start") - 1;
  else
    v7 = 0;
  if (objc_msgSend(a3, "isValid"))
    v8 = objc_msgSend(a3, "start");
  else
    v8 = 0;
  v9 = -[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:](self, "p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:", v7, v8, 1);
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPStorage rangeByExtendingRangeToWhitespace:skipVisibleDeleted:](self, "rangeByExtendingRangeToWhitespace:skipVisibleDeleted:", a3.location, a3.length, 0);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)rangeByExtendingRangeToWhitespace:(_NSRange)a3 skipVisibleDeleted:(BOOL)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPStorage *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  TSWPParagraphEnumerator v17;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  if (self)
    -[TSWPStorage paragraphEnumeratorForCharRange:styleProvider:requireHidden:](self, "paragraphEnumeratorForCharRange:styleProvider:requireHidden:", a3.location, a3.length, 0, !a4);
  else
    memset(&v17, 0, sizeof(v17));
  v7 = self;
  v8 = -[TSWPStorage charRangeMappedFromStorage:](v7, "charRangeMappedFromStorage:", location, length);
  v10 = TSWPRangeByExtendingRangeToWhitespaceForTextSource(v8, v9, v7);
  v12 = -[TSWPStorage charRangeMappedToStorage:](v7, "charRangeMappedToStorage:", v10, v11);
  v14 = v13;

  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v17);
  v15 = v12;
  v16 = v14;
  result.length = v16;
  result.location = v15;
  return result;
}

- (_NSRange)rangeByExtendingRangeToLineBreak:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  uint64_t v10;
  int v11;
  int v12;
  NSUInteger i;
  uint64_t v15;
  int v16;
  char v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  _NSRange result;

  location = a3.location;
  v5 = a3.location + a3.length;
  v6 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  v8 = v7;
  do
  {
    v9 = location;
    if (location <= v6)
      break;
    --location;
    v10 = -[NSMutableString characterAtIndex:](self->_string, "characterAtIndex:", v9 - 1);
    v11 = v10;
    v12 = IsParagraphBreakingCharacter(v10);
  }
  while (v11 != 8232 && v12 == 0);
  for (i = v6 + v8; v5 < i; ++v5)
  {
    v15 = -[NSMutableString characterAtIndex:](self->_string, "characterAtIndex:", v5);
    v16 = v15;
    v17 = IsParagraphBreakingCharacter(v15);
    if (v16 == 8232)
      break;
    if ((v17 & 1) != 0)
      break;
  }
  if (v9 <= v5)
    v18 = v5;
  else
    v18 = v9;
  if (v9 >= v5)
    v19 = v5;
  else
    v19 = v9;
  v20 = v18 - v19;
  result.length = v20;
  result.location = v19;
  return result;
}

- (_NSRange)scanLeftForWordAtCharIndex:(unint64_t)a3
{
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v5 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  v7 = a3;
  if (v5 + v6 > a3)
  {
    v7 = a3;
    if (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", a3)))
    {
      v8 = -[TSWPStorage whiteSpaceRangeAtCharIndex:](self, "whiteSpaceRangeAtCharIndex:", a3);
      if (v8 == 0x7FFFFFFFFFFFFFFFLL)
        v7 = a3;
      else
        v7 = v8;
    }
  }
  v9 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", a3, 1);
  if (v9 == 0x7FFFFFFFFFFFFFFFLL)
    v9 = v7;
  v10 = a3 - v9;
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  _BOOL8 v4;
  NSMutableString *string;
  uint64_t v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a4;
  string = self->_string;
  v7 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  v9 = -[NSMutableString rangeOfWordAtCharacterIndex:range:includePreviousWord:](string, "rangeOfWordAtCharacterIndex:range:includePreviousWord:", a3, v7, v8, v4);
  result.length = v10;
  result.location = v9;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger v7;
  NSUInteger v8;
  unint64_t v9;
  CFIndex v10;
  CFIndex v11;
  NSMutableString *string;
  uint64_t CharacterAtIndex;
  BOOL v14;
  int v15;
  uint64_t v16;
  int v17;
  __CFStringTokenizer *v18;
  __CFStringTokenizer *v19;
  CFIndex location;
  CFIndex length;
  CFRange CurrentTokenRange;
  NSUInteger v24;
  NSUInteger v25;
  _NSRange result;
  CFRange v27;

  v4 = a4;
  v7 = *MEMORY[0x24BEB3BF0];
  v8 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v9 = -[TSWPStorage range](self, "range");
  v11 = v10;
  string = self->_string;
  if (CFStringGetLength((CFStringRef)string) > a3
    && ((CharacterAtIndex = CFStringGetCharacterAtIndex((CFStringRef)string, a3), (_DWORD)CharacterAtIndex)
      ? (v14 = v9 + v11 > a3)
      : (v14 = 0),
        v14))
  {
    v15 = IsWhitespaceCharacter(CharacterAtIndex) ^ 1;
    if (!v4)
      goto LABEL_12;
  }
  else
  {
    v15 = 0;
    if (!v4)
      goto LABEL_12;
  }
  if (v9 < a3)
  {
    v16 = CFStringGetCharacterAtIndex((CFStringRef)string, a3 - 1);
    v17 = IsWhitespaceCharacter(v16);
    v15 |= v17 ^ 1;
    if (!v17)
      --a3;
  }
LABEL_12:
  if (v15)
  {
    if (v11)
    {
      v27.location = v9;
      v27.length = v11;
      v18 = CFStringTokenizerCreate(0, (CFStringRef)string, v27, 4uLL, 0);
      if (v18)
      {
        v19 = v18;
        if (CFStringTokenizerGoToTokenAtIndex(v18, a3))
        {
          CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v19);
          length = CurrentTokenRange.length;
          location = CurrentTokenRange.location;
        }
        else
        {
          length = 0;
          location = -1;
        }
        if (location != -1 && length != 0)
        {
          v7 = location;
          v8 = length;
        }
        CFRelease(v19);
      }
    }
  }
  v24 = v7;
  v25 = v8;
  result.length = v25;
  result.location = v24;
  return result;
}

- (_NSRange)rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:](self, "p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:", a3, a4, 1);
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)p_rangeForSelectionAtCharIndex:(unint64_t)a3 caretIndex:(unint64_t)a4 handleNextWordWhitespace:(BOOL)a5
{
  _BOOL4 v5;
  unint64_t v7;
  unint64_t v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSUInteger v30;
  NSUInteger v31;
  _NSRange result;

  v5 = a5;
  v7 = a3;
  v9 = a4 - 1;
  if (a3 != a4 && v9 != a3)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1883, CFSTR("Precondition: caretIndex is either equal to the given charIndex or one past"));
  }
  v12 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:", a4);
  v14 = v12;
  v15 = v13;
  if (v12 > v7)
    v7 = v12;
  if (v13 - 1 < v7 - v12)
  {
    v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage p_rangeForSelectionAtCharIndex:caretIndex:handleNextWordWhitespace:]");
    objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 1893, CFSTR("Character index should be inside allowable selection range."));
  }
  v18 = v14 + v15;
  if (v7 >= v14 + v15)
    v19 = 0;
  else
    v19 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v7);
  if (!IsSpecialCharacter(v19))
  {
    v21 = 0;
    goto LABEL_18;
  }
  v20 = -[TSWPStorage attachmentOrFootnoteAtCharIndex:](self, "attachmentOrFootnoteAtCharIndex:", v7);
  v21 = (uint64_t)v20;
  if (!v20)
  {
LABEL_18:
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_22;
  }
  if (objc_msgSend(v20, "isDrawable") && objc_msgSend((id)v21, "isAnchored"))
  {
    if (v18 <= a4)
      v19 = 0;
    else
      v19 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", a4);
    v21 = 0;
    v22 = 0x7FFFFFFFFFFFFFFFLL;
    v7 = a4;
  }
  else
  {
    v21 = 1;
    v22 = v7;
  }
LABEL_22:
  if (IsSpecialCharacter(v19))
    goto LABEL_45;
  if (v5 && IsWhitespaceCharacter(v19))
  {
    if (v7 != a4 || !v7 || v7 <= v14)
    {
      if (v18 <= a4)
        v23 = v7;
      else
        v23 = a4;
      if (v7 + 1 == a4)
        v9 = v23;
      else
        v9 = v7;
    }
    v24 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v9);
    v25 = v24;
    if ((IsWhitespaceCharacter(v24) & 1) == 0 && !IsSpecialCharacter(v25))
      goto LABEL_38;
    v22 = -[TSWPStorage whiteSpaceRangeAtCharIndex:includingBreaks:](self, "whiteSpaceRangeAtCharIndex:includingBreaks:", v7, 0);
    v21 = v26;
  }
  v9 = v7;
LABEL_38:
  if (v22 == 0x7FFFFFFFFFFFFFFFLL || !v21)
  {
    v27 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", v9, 0);
    v21 = v28;
    if (v27 == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v9 >= v18)
      {
        v22 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else
      {
        v22 = objc_msgSend(-[TSWPStorage string](self, "string"), "rangeOfComposedCharacterSequenceAtIndex:", v9);
        v21 = v29;
      }
    }
    else
    {
      v22 = v27;
    }
  }
LABEL_45:
  v30 = v22;
  v31 = v21;
  result.length = v31;
  result.location = v30;
  return result;
}

- (_NSRange)nextWordFromIndex:(unint64_t)a3 forward:(BOOL)a4
{
  _BOOL4 v4;
  CFIndex length;
  NSUInteger v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFIndex v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSMutableString *string;
  CFStringTokenizerRef v20;
  __CFStringTokenizer *v21;
  uint64_t v22;
  unint64_t v23;
  CFStringTokenizerTokenType v24;
  uint64_t v25;
  unint64_t v26;
  CFIndex location;
  CFRange CurrentTokenRange;
  CFStringTokenizerRef v29;
  unint64_t v30;
  CFRange v31;
  NSUInteger v32;
  NSUInteger v33;
  _NSRange result;
  CFRange v35;
  CFRange v36;

  v4 = a4;
  v8 = *MEMORY[0x24BEB3BF0];
  length = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v9 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:");
  v11 = v10;
  v12 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:", a3);
  v14 = v13;
  v15 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:", a3);
  v16 = v15;
  v18 = v17;
  string = self->_string;
  if (v4)
  {
    v12 += v14;
    v35.length = v12 - v15;
    v35.location = v15;
    v20 = CFStringTokenizerCreate(0, (CFStringRef)string, v35, 0, 0);
    if (v20)
    {
      v21 = v20;
      v22 = 0;
      do
      {
        v23 = a3 + v22;
        v24 = CFStringTokenizerGoToTokenAtIndex(v21, a3 + v22--);
      }
      while (!v24 && v23 > v16 && v12 == a3);
      v25 = -v22;
      v26 = a3 + v22;
      do
      {
        ++v26;
        --v25;
      }
      while (!CFStringTokenizerGoToTokenAtIndex(v21, v26) && v26 < v12);
      location = CFStringTokenizerGetCurrentTokenRange(v21).location;
      if (v9 + v11 == location || v25 && location == v26 || CFStringTokenizerAdvanceToNextToken(v21))
      {
        CurrentTokenRange = CFStringTokenizerGetCurrentTokenRange(v21);
        if (CurrentTokenRange.location < 0)
        {
          length = 0;
        }
        else
        {
          v12 = CurrentTokenRange.location;
          length = CurrentTokenRange.length;
        }
      }
      else
      {
LABEL_28:
        length = 0;
      }
LABEL_30:
      CFRelease(v21);
      v8 = v12;
    }
  }
  else
  {
    v36.length = v18 - v12 + v15;
    v36.location = v12;
    v29 = CFStringTokenizerCreate(0, (CFStringRef)string, v36, 0, 0);
    if (v29)
    {
      v21 = v29;
      v30 = a3;
      while (1)
      {
        while (!CFStringTokenizerGoToTokenAtIndex(v21, v30))
        {
          if (v30 <= v12)
            goto LABEL_28;
          --v30;
        }
        v31 = CFStringTokenizerGetCurrentTokenRange(v21);
        length = v31.length;
        if (v31.location + v31.length < a3 || v31.location + v31.length == v9)
          break;
        if (v31.location <= v12)
          goto LABEL_28;
        if (v31.location - 1 >= v30 - 1)
          --v30;
        else
          v30 = v31.location - 1;
      }
      v12 = v31.location;
      goto LABEL_30;
    }
  }
  v32 = v8;
  v33 = length;
  result.length = v33;
  result.location = v32;
  return result;
}

- (_NSRange)rangeByExpandingToIncludePartialWords:(_NSRange)a3
{
  NSUInteger location;
  NSUInteger v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  location = a3.location;
  v5 = a3.location + a3.length;
  v6 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:");
  if (location > v6
    && location < v6 + v7
    && (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", location)) & 1) == 0)
  {
    v8 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", location - 1, 0);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      location = v8;
  }
  if (v5 > location
    && (IsWhitespaceCharacter(-[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v5 - 1)) & 1) == 0)
  {
    v9 = -[TSWPStorage wordAtCharIndex:includePreviousWord:](self, "wordAtCharIndex:includePreviousWord:", v5, 0);
    if (v9 != 0x7FFFFFFFFFFFFFFFLL)
      v5 = v9 + v10;
  }
  if (location <= v5)
    v11 = v5;
  else
    v11 = location;
  if (location >= v5)
    v12 = v5;
  else
    v12 = location;
  v13 = v11 - v12;
  result.length = v13;
  result.location = v12;
  return result;
}

- (_NSRange)rangeByTrimmingRange:(_NSRange)a3 withBlock:(id)a4
{
  NSUInteger location;
  NSUInteger length;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v15;
  _NSRange result;

  location = a3.location;
  if (a3.length)
  {
    length = a3.length;
    v8 = -a3.length;
    v9 = a3.location;
    while ((*((unsigned int (**)(id, _QWORD))a4 + 2))(a4, -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v9)))
    {
      ++v9;
      if (__CFADD__(v8++, 1))
      {
LABEL_12:
        v11 = 0;
        goto LABEL_14;
      }
    }
    v12 = 0;
    v13 = length + location - 1;
    while ((*((unsigned int (**)(id, _QWORD))a4 + 2))(a4, -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v13 + v12)))
    {
      if (v8 + 1 == v12--)
        goto LABEL_12;
    }
    v11 = v12 - v8;
LABEL_14:
    location = v9;
  }
  else
  {
    v11 = 0;
  }
  v15 = location;
  result.length = v11;
  result.location = v15;
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  void *v6;
  TSWPAttributeArray *v7;
  TSWPAttributeArray *v8;
  unint64_t v9;
  NSUInteger v10;

  v6 = (void *)a3;
  if (a5)
    *a5 = (_NSRange)xmmword_217C27470;
  if (a3)
  {
    v7 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", *(_QWORD *)&a4);
    if (v7
      && (v8 = v7,
          v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, (unint64_t)v6 - 1),
          v9 < v8->var2))
    {
      v6 = (void *)*((_QWORD *)v8->var4 + 2 * v9 + 1);
      if (a5)
      {
        a5->location = TSWPAttributeArray::rangeForAttributeIndex(v8, v9);
        a5->length = v10;
      }
    }
    else
    {
      return 0;
    }
  }
  return v6;
}

- (id)objectAtLocationAtExactCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4
{
  uint64_t v4;
  id result;
  _QWORD *v8;
  unint64_t v9;

  v4 = *(_QWORD *)&a4;
  if (-[TSWPStorage length](self, "length") <= a3)
    return 0;
  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v4);
  if (!result)
    return result;
  v8 = result;
  v9 = TSWPAttributeArray::exactAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
  if (v9 >= v8[2])
    return 0;
  else
    return *(id *)(v8[4] + 16 * v9 + 8);
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.location, a4.length, a5, a6);
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage hyphenationLocationBeforeIndex:inRange:locale:hyphenChar:]");
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2175, CFSTR("notreached"));
  return -1;
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  return -[TSWPStorage charIndexMappedToStorage:](self, "charIndexMappedToStorage:", -[TSWPStorage charIndexMappedFromStorage:](self, "charIndexMappedFromStorage:", a3));
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  return 0;
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  return 1.0;
}

- (_NSRange)p_RelocateNonSelectedAnchorsInRange:(_NSRange)a3 selectionInfos:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _BOOL8 v15;
  id v16;
  NSUInteger v17;
  NSUInteger v18;
  uint64_t v19;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  if (a3.length >= 2)
  {
    v10 = -[TSWPStorage attachmentIndexRangeForTextRange:](self, "attachmentIndexRangeForTextRange:", a3.location, a3.length);
    if (v10 < v10 + v11)
    {
      v12 = v10;
      v13 = v11;
      do
      {
        v19 = 0x7FFFFFFFFFFFFFFFLL;
        objc_opt_class();
        -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v12, &v19);
        v14 = (void *)TSUDynamicCast();
        if (objc_msgSend(v14, "isAnchored")
          && (objc_msgSend(a4, "containsObject:", objc_msgSend(v14, "drawable")) & 1) == 0)
        {
          v15 = -[TSWPStorage setDOLCSuppressed:](self, "setDOLCSuppressed:", 1);
          v16 = v14;
          -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self, "replaceCharactersInRange:withString:undoTransaction:", v19, 1, 0, a5);
          -[TSWPStorage insertAttachmentOrFootnote:range:dolcContext:undoTransaction:changeSession:](self, "insertAttachmentOrFootnote:range:dolcContext:undoTransaction:changeSession:", v14, location++, 0, 0, a5, 0);
          --length;

          -[TSWPStorage setDOLCSuppressed:](self, "setDOLCSuppressed:", v15);
        }
        ++v12;
        --v13;
      }
      while (v13);
    }
  }
  v17 = location;
  v18 = length;
  result.length = v18;
  result.location = v17;
  return result;
}

- (id)extendSelectionForTopicChildren:(id)a3
{
  TSWPSelection *v3;
  unint64_t v5;
  char v6;
  char v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  TSWPParagraphEnumerator v15;

  v3 = (TSWPSelection *)a3;
  if (objc_msgSend(a3, "type") == 2)
  {
    TSWPParagraphEnumerator::TSWPParagraphEnumerator((uint64_t)&v15, (uint64_t)self, 0, -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", -[TSWPSelection range](v3, "range")), -[TSWPStorage paragraphCount](self, "paragraphCount"), 1);
    v5 = TSWPParagraphEnumerator::paragraphLevel(&v15);
    v6 = 0;
    while (1)
    {
      v7 = v6;
      if (TSWPParagraphEnumerator::isLastParagraph(&v15))
        break;
      TSWPParagraphEnumerator::operator++(&v15);
      v8 = TSWPParagraphEnumerator::paragraphLevel(&v15);
      v6 = 1;
      if (v8 <= v5)
      {
        TSWPParagraphEnumerator::operator--(&v15);
        break;
      }
    }
    if ((v7 & 1) != 0)
    {
      v9 = -[TSWPSelection range](v3, "range");
      v10 = TSWPParagraphEnumerator::paragraphTextRange(&v15);
      if (v9 <= v10 + v11)
        v12 = v10 + v11;
      else
        v12 = v9;
      if (v9 >= v10 + v11)
        v13 = v10 + v11;
      else
        v13 = v9;
      v3 = +[TSWPSelection selectionWithRange:type:leadingEdge:storage:](TSWPSelection, "selectionWithRange:type:leadingEdge:storage:", v13, v12 - v13, 2, 1, 0);
    }
    TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v15);
  }
  return v3;
}

- (id)substringWithRange:(_NSRange)a3
{
  return (id)-[NSMutableString substringWithRange:](self->_string, "substringWithRange:", a3.location, a3.length);
}

- (id)substringWithSelection:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFString *v9;
  uint64_t i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(a3, "type"))
  {
    if (objc_msgSend(a3, "type") != 7)
      return &stru_24D82FEB0;
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (void *)objc_msgSend(a3, "visualRangesArray", 0);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (!v6)
      return &stru_24D82FEB0;
    v7 = v6;
    v8 = *(_QWORD *)v17;
    v9 = &stru_24D82FEB0;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v17 != v8)
          objc_enumerationMutation(v5);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * i), "rangeValue");
        v9 = (__CFString *)-[__CFString stringByAppendingString:](v9, "stringByAppendingString:", -[TSWPStorage substringWithRange:](self, "substringWithRange:", v11, v12));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v7);
    return v9;
  }
  else
  {
    v14 = objc_msgSend(a3, "range");
    return -[TSWPStorage substringWithRange:](self, "substringWithRange:", v14, v15);
  }
}

- (void)deleteRange:(_NSRange)a3 undoTransaction:(TSWPStorageTransaction *)a4
{
  -[TSWPStorage replaceCharactersInRange:withString:undoTransaction:](self, "replaceCharactersInRange:withString:undoTransaction:", a3.location, a3.length, 0, a4);
}

- (void)insertStorage:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  -[TSWPStorage replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:](self, "replaceCharactersInRange:withStorage:usePasteRules:dolcContext:undoTransaction:", a4, 0, a3, 0, a5, a6);
}

- (void)willBeAddedToDocumentRoot:(id)a3 dolcContext:(id)a4
{
  uint64_t v7;
  TSWPAttributeArray *v8;

  -[TSWPStorage setDocumentRoot:](self, "setDocumentRoot:");
  v7 = 0;
  do
  {
    v8 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v7);
    if (v8)
      (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 13))(v8, a3, a4);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 19);
}

- (void)wasAddedToDocumentRoot:(id)a3 dolcContext:(id)a4
{
  uint64_t v7;
  TSWPAttributeArray *v8;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("kObjectWasAddedToDocumentNotification"), a3, 0);
  v7 = 0;
  do
  {
    v8 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v7);
    if (v8)
      (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 14))(v8, a3, a4);
    v7 = (v7 + 1);
  }
  while ((_DWORD)v7 != 19);
}

- (void)willBeRemovedFromDocumentRoot:(id)a3
{
  uint64_t v5;
  TSWPAttributeArray *v6;

  v5 = 0;
  do
  {
    v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v5);
    if (v6)
      (*((void (**)(TSWPAttributeArray *, id))v6->var0 + 15))(v6, a3);
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 19);
}

- (void)wasRemovedFromDocumentRoot:(id)a3
{
  uint64_t v5;
  TSWPAttributeArray *v6;

  objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("kObjectWasRemovedFromDocumentNotification"), a3, 0);
  v5 = 0;
  do
  {
    v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v5);
    if (v6)
      (*((void (**)(TSWPAttributeArray *, id))v6->var0 + 16))(v6, a3);
    v5 = (v5 + 1);
  }
  while ((_DWORD)v5 != 19);
  -[TSWPStorage setDocumentRoot:](self, "setDocumentRoot:", 0);
}

- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 updatingSearchRange:(_NSRange *)a5
{
  NSUInteger v5;
  NSUInteger v6;
  _NSRange result;

  v5 = -[NSMutableString rangeOfString:searchOptions:updatingSearchRange:](self->_string, "rangeOfString:searchOptions:updatingSearchRange:", a3, a4, a5);
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)rangeOfString:(id)a3 searchOptions:(unint64_t)a4 range:(_NSRange)a5
{
  NSUInteger v5;
  NSUInteger v6;
  _NSRange v7;
  _NSRange result;

  v7 = a5;
  v5 = -[NSMutableString rangeOfString:searchOptions:updatingSearchRange:](self->_string, "rangeOfString:searchOptions:updatingSearchRange:", a3, a4, &v7);
  result.length = v6;
  result.location = v5;
  return result;
}

- (_NSRange)rangeOfParagraphBreakingCharacter:(unsigned __int16)a3 backwards:(BOOL)a4 range:(_NSRange)a5
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v7;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  unsigned __int16 v16;
  _NSRange result;

  length = a5.length;
  location = a5.location;
  v7 = a4;
  if ((IsParagraphBreakingCharacter(a3) & 1) == 0)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage rangeOfParagraphBreakingCharacter:backwards:range:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2682, CFSTR("invalid character"));
  }
  v16 = a3;
  v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCharacters:length:", &v16, 1);
  if (v7)
    v13 = 6;
  else
    v13 = 2;
  v14 = -[NSMutableString rangeOfString:options:range:](self->_string, "rangeOfString:options:range:", v12, v13, location, length);
  result.length = v15;
  result.location = v14;
  return result;
}

- (id)childEnumerator
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage range](self, "range");
  return -[TSWPStorage childEnumeratorForRange:](self, "childEnumeratorForRange:", v3, v4);
}

- (void)acceptVisitor:(id)a3
{
  objc_msgSend(a3, "visitTSWPStorage:", self);
}

- (_NSRange)rangeOfAnnotationWithOptions:(unint64_t)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  char v6;
  NSUInteger v8;
  NSUInteger v9;
  char v10;
  NSUInteger v11;
  NSUInteger v12;
  _NSRange v13;
  id v14[6];
  _NSRange result;

  length = a4.length;
  location = a4.location;
  v6 = a3;
  v8 = *MEMORY[0x24BEB3BF0];
  v9 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v14, self, a4.location, a4.length, 15);
  v10 = 0;
  while (TSWPAttributeEnumerator::nextAttributeIndex(v14, &v13))
  {
    objc_opt_class();
    if (TSUDynamicCast() && v13.location >= location && v13.location - location < length)
    {
      if ((v6 & 4) == 0)
      {
        if ((v10 & (v13.location >= v8)) == 0)
        {
          v8 = v13.location;
          v9 = v13.length;
        }
        v10 = 1;
        break;
      }
      if ((v10 & (v13.location <= v8)) == 0)
      {
        v8 = v13.location;
        v9 = v13.length;
      }
      v10 = 1;
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v14);
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v14, self, location, length, 16);
  while (TSWPAttributeEnumerator::nextAttributeIndex(v14, &v13))
  {
    objc_opt_class();
    if (TSUDynamicCast() && v13.location >= location && v13.location - location < length)
    {
      if ((v6 & 4) == 0)
      {
        if ((v10 & (v13.location >= v8)) == 0)
        {
          v8 = v13.location;
          v9 = v13.length;
        }
        break;
      }
      if ((v10 & (v13.location <= v8)) == 0)
      {
        v8 = v13.location;
        v9 = v13.length;
      }
      v10 = 1;
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v14);
  v11 = v8;
  v12 = v9;
  result.length = v12;
  result.location = v11;
  return result;
}

- (void)findChangesInRange:(_NSRange)a3 onHit:(id)a4
{
  NSUInteger length;
  NSUInteger location;

  length = a3.length;
  location = a3.location;
  -[TSWPStorage p_findChangesInRange:onHit:withAttributeKind:](self, "p_findChangesInRange:onHit:withAttributeKind:", a3.location, a3.length, a4, 15);
  -[TSWPStorage p_findChangesInRange:onHit:withAttributeKind:](self, "p_findChangesInRange:onHit:withAttributeKind:", location, length, a4, 16);
}

- (_NSRange)rangeForHighlight:(id)a3
{
  uint64_t v4;
  NSUInteger v5;
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  unint64_t Object;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  _NSRange result;

  v4 = *MEMORY[0x24BEB3BF0];
  v5 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 17);
  if (v6)
  {
    v7 = v6;
    Object = TSWPAttributeArray::findObject(v6, (objc_object *)a3, 0);
    if (Object == 0x7FFFFFFFFFFFFFFFLL)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage rangeForHighlight:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2887, CFSTR("Expected to find highlight in storage"));
    }
    else
    {
      v4 = TSWPAttributeArray::rangeForAttributeIndex(v7, Object);
      v5 = v11;
    }
  }
  v12 = v4;
  v13 = v5;
  result.length = v13;
  result.location = v12;
  return result;
}

- (id)searchForString:(id)a3 options:(unint64_t)a4 onHit:(id)a5
{
  uint64_t v10;
  uint64_t v11;

  if (-[TSWPStorage wpKind](self, "wpKind") == 7)
    return 0;
  v10 = -[TSWPStorage range](self, "range");
  return -[TSWPStorage searchInRange:forString:options:onHit:](self, "searchInRange:forString:options:onHit:", v10, v11, a3, a4, a5);
}

- (id)searchInRange:(_NSRange)a3 forString:(id)a4 options:(unint64_t)a5 onHit:(id)a6
{
  TSWPSearch *v7;
  TSWPSearch *v8;

  v7 = -[TSWPSearch initWithString:options:hitBlock:storage:range:]([TSWPSearch alloc], "initWithString:options:hitBlock:storage:range:", a4, a5, a6, self, a3.location, a3.length);
  -[TSWPStorage continueSearch:](self, "continueSearch:", v7);
  if (-[TSWPSearch isComplete](v7, "isComplete"))
  {

    return 0;
  }
  else
  {
    v8 = v7;
  }
  return v7;
}

- (id)searchForAnnotationsWithHitBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = -[TSWPStorage range](self, "range");
  -[TSWPStorage findCommentsInRange:onHit:](self, "findCommentsInRange:onHit:", v5, v6, a3);
  v7 = -[TSWPStorage range](self, "range");
  -[TSWPStorage findChangesInRange:onHit:](self, "findChangesInRange:onHit:", v7, v8, a3);
  return 0;
}

- (void)continueSearch:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage continueSearch:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 2930, CFSTR("invalid nil value for '%s'"), "search");
  }
  v10 = objc_msgSend(a3, "range");
  v11 = v7;
  if (v7 && -[TSWPStorage wpKind](self, "wpKind") != 7)
  {
    v8 = objc_msgSend((id)objc_msgSend(a3, "searchedString"), "rangeOfString:searchOptions:updatingSearchRange:", objc_msgSend(a3, "string"), objc_msgSend(a3, "options"), &v10);
    if (v8 != 0x7FFFFFFFFFFFFFFFLL)
      objc_msgSend(a3, "foundHitWithRange:", v8, v9);
    objc_msgSend(a3, "setRange:", v10, v11);
  }
}

- (BOOL)canUserReplaceText
{
  TSDContainerInfo *v4;
  TSDContainerInfo *v5;
  void *v6;

  if (-[TSWPStorage wpKind](self, "wpKind") == 7)
    return 0;
  v4 = -[TSWPStorage parentInfo](self, "parentInfo");
  if (v4)
  {
    v5 = v4;
    while (1)
    {
      objc_opt_class();
      v6 = (void *)TSUDynamicCast();
      if (v6)
      {
        if ((objc_msgSend(v6, "isLocked") & 1) != 0)
          break;
      }
      v5 = -[TSDContainerInfo parentInfo](v5, "parentInfo");
      if (!v5)
        return 1;
    }
    return 0;
  }
  return 1;
}

- (_NSRange)replaceAllOccurrencesOfStyle:(id)a3 withStyle:(id)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v9;
  NSUInteger v10;
  uint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  NSUInteger v14;
  _NSRange result;

  v9 = *MEMORY[0x24BEB3BF0];
  v10 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = 0;
LABEL_7:
    v9 = -[TSWPStorage replaceAllOccurrencesOfObject:withObject:forKind:undoTransaction:](self, "replaceAllOccurrencesOfObject:withObject:forKind:undoTransaction:", a3, a4, v11, a5);
    v10 = v12;
    goto LABEL_8;
  }
  if ((objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()) & 1) != 0)
  {
    v11 = 2;
    goto LABEL_7;
  }
  if (objc_msgSend(a3, "isMemberOfClass:", objc_opt_class()))
  {
    v11 = 3;
    goto LABEL_7;
  }
LABEL_8:
  v13 = v9;
  v14 = v10;
  result.length = v14;
  result.location = v13;
  return result;
}

- (BOOL)styleOverridesAppliedToRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t AttributeIndex;
  BOOL v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v12[6];
  id v13[6];

  length = a3.length;
  location = a3.location;
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v13, self, a3.location, a3.length, 3);
  while (1)
  {
    AttributeIndex = TSWPAttributeEnumerator::nextAttributeIndex(v13, 0);
    if (!AttributeIndex)
      break;
    if (*(_QWORD *)(AttributeIndex + 8))
    {
      objc_opt_class();
      if ((objc_msgSend((id)TSUDynamicCast(), "overridesAnyProperty") & 1) != 0)
      {
        v7 = 1;
        goto LABEL_13;
      }
    }
  }
  TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v12, self, location, length, 0);
  while (1)
  {
    v8 = TSWPAttributeEnumerator::nextAttributeIndex(v12, 0);
    v7 = v8 != 0;
    if (!v8)
      break;
    if (*(_QWORD *)(v8 + 8))
    {
      objc_opt_class();
      v9 = (void *)TSUDynamicCast();
      v10 = v9;
      if (v9)
      {
        if (objc_msgSend(v9, "parent") && (objc_msgSend(v10, "overridesAnyProperty") & 1) != 0)
          break;
      }
    }
  }
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v12);
LABEL_13:
  TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v13);
  return v7;
}

- (void)adoptStylesheet:(id)a3 withMapper:(id)a4
{
  uint64_t v7;
  TSWPAttributeArray *v8;
  id v9;

  if (self->_stylesheet != a3)
  {
    objc_msgSend(a4, "pushMappingContext:", self);
    v7 = 0;
    do
    {
      v8 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v7);
      if (v8)
        (*((void (**)(TSWPAttributeArray *, id, id))v8->var0 + 12))(v8, a3, a4);
      v7 = (v7 + 1);
    }
    while ((_DWORD)v7 != 19);
    v9 = a3;

    self->_stylesheet = (TSSStylesheet *)a3;
    objc_msgSend(a4, "popMappingContext:", self);
  }
}

- (_NSRange)textRangeForListsInCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = -[TSWPStorage textRangeForListAtCharIndex:](self, "textRangeForListAtCharIndex:");
  v8 = location + length;
  if (v8 > v7 + v6)
  {
    v9 = -[TSWPStorage length](self, "length");
    if (v8 < v9)
      v9 = -[TSWPStorage listEndAtCharIndex:](self, "listEndAtCharIndex:", v8 - 1);
    v6 = v9 - v7;
  }
  v10 = v7;
  result.length = v6;
  result.location = v10;
  return result;
}

- (unint64_t)listEndAtCharIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage textRangeForListAtCharIndex:](self, "textRangeForListAtCharIndex:", a3);
  return v3 + v4;
}

- (_NSRange)textRangeForListAtCharIndex:(unint64_t)a3
{
  void *length;
  uint64_t v4;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v8;
  NSUInteger v9;
  NSRange v10;
  void *v11;
  uint64_t v12;
  NSUInteger v13;
  NSRange v14;
  NSUInteger v15;
  NSUInteger v16;
  TSWPParagraphEnumerator v17;
  TSWPParagraphEnumerator v18;
  NSRange v19;
  NSRange v20;
  _NSRange result;
  NSRange v22;
  NSRange v23;

  if (self)
    -[TSWPStorage paragraphEnumeratorAtCharIndex:styleProvider:](self, "paragraphEnumeratorAtCharIndex:styleProvider:", a3, 0);
  else
    memset(&v18, 0, sizeof(v18));
  length = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v18);
  v4 = TSWPParagraphEnumerator::paragraphLevel(&v18);
  if (!length)
    goto LABEL_17;
  if (!objc_msgSend(length, "labelTypeForLevel:", v4))
  {
    length = 0;
LABEL_17:
    location = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_18;
  }
  location = TSWPParagraphEnumerator::paragraphTextRange(&v18);
  length = v6;
  TSWPParagraphEnumerator::TSWPParagraphEnumerator(&v17, &v18);
  while (!TSWPParagraphEnumerator::isLastParagraph(&v17))
  {
    TSWPParagraphEnumerator::operator++(&v17);
    v7 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v17);
    v8 = TSWPParagraphEnumerator::paragraphLevel(&v18);
    if (!v7 || !objc_msgSend(v7, "labelTypeForLevel:", v8))
      break;
    v22.location = TSWPParagraphEnumerator::paragraphTextRange(&v17);
    v22.length = v9;
    v19.location = location;
    v19.length = (NSUInteger)length;
    v10 = NSUnionRange(v19, v22);
    location = v10.location;
    length = (void *)v10.length;
  }
  while (!TSWPParagraphEnumerator::isFirstParagraph(&v18))
  {
    TSWPParagraphEnumerator::operator--(&v18);
    v11 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v18);
    v12 = TSWPParagraphEnumerator::paragraphLevel(&v18);
    if (!v11 || !objc_msgSend(v11, "labelTypeForLevel:", v12))
      break;
    v23.location = TSWPParagraphEnumerator::paragraphTextRange(&v18);
    v23.length = v13;
    v20.location = location;
    v20.length = (NSUInteger)length;
    v14 = NSUnionRange(v20, v23);
    location = v14.location;
    length = (void *)v14.length;
  }
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v17);
LABEL_18:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v18);
  v15 = location;
  v16 = (NSUInteger)length;
  result.length = v16;
  result.location = v15;
  return result;
}

- (_NSRange)textRangeForParagraphsInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  void *v9;
  uint64_t v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  uint64_t v15;
  NSRange v16;
  NSUInteger v17;
  NSUInteger v18;
  NSRange v19;
  _NSRange result;
  NSRange v21;

  length = a3.length;
  location = a3.location;
  v6 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:");
  v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage textRangeForParagraphsInRange:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3224, CFSTR("bogus first paragraph text range"));
  }
  if (length)
  {
    if (length == 1)
    {
      length = v8;
    }
    else
    {
      v11 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", length + location - 1);
      v13 = v12;
      if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage textRangeForParagraphsInRange:]");
        objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3233, CFSTR("bogus first paragraph text range"));
      }
      v19.location = v6;
      v19.length = v8;
      v21.location = v11;
      v21.length = v13;
      v16 = NSUnionRange(v19, v21);
      v6 = v16.location;
      length = v16.length;
    }
  }
  v17 = v6;
  v18 = length;
  result.length = v18;
  result.location = v17;
  return result;
}

- (_NSRange)textRangeForParagraphAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (!v5)
  {
    v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage textRangeForParagraphAtCharIndex:]");
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3246, CFSTR("textRangeForParagraphAtCharIndex: no paragraph table."));
  }
  v8 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v5, a3));
  result.length = v9;
  result.location = v8;
  return result;
}

- (unint64_t)paragraphEndAtCharIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:", a3);
  return v3 + v4;
}

- (_NSRange)textRangeForParagraphsInCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v7 = -[TSWPStorage textRangeForParagraphAtCharIndex:](self, "textRangeForParagraphAtCharIndex:");
  v8 = location + length;
  if (v8 > v7 + v6)
  {
    v9 = -[TSWPStorage length](self, "length");
    if (v8 < v9)
      v9 = -[TSWPStorage paragraphEndAtCharIndex:](self, "paragraphEndAtCharIndex:", v8 - 1);
    v6 = v9 - v7;
  }
  v10 = v7;
  result.length = v6;
  result.location = v10;
  return result;
}

- (_NSRange)paragraphIndexRangeForCharRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  unint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  length = a3.length;
  location = a3.location;
  v6 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:");
  if (length)
    v7 = -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", length + location - 1) - v6 + 1;
  else
    v7 = 1;
  v8 = v6;
  result.length = v7;
  result.location = v8;
  return result;
}

- (BOOL)paragraphHasListLabelAtCharIndex:(unint64_t)a3
{
  id v5;

  v5 = -[TSWPStorage listStyleAtCharIndex:effectiveRange:](self, "listStyleAtCharIndex:effectiveRange:", a3, 0);
  if (v5)
    LOBYTE(v5) = objc_msgSend(v5, "labelTypeForLevel:", -[TSWPStorage paragraphLevelAtCharIndex:](self, "paragraphLevelAtCharIndex:", a3)) != 0;
  return (char)v5;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage isWritingDirectionRightToLeftForParagraphAtParIndex:](self, "isWritingDirectionRightToLeftForParagraphAtParIndex:", -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3));
}

- (void)setParagraphWritingDirection:(int)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v6 = *(_QWORD *)&a3;
  v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", a4.location, a4.length);
  if (v9)
    -[TSWPStorage applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:](self, "applyWritingDirection:toParagraphIndexRange:forKind:undoTransaction:", v6, v8, v9, 18, a5);
}

- (void)setLanguage:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v10;
  TSWPAttributeArray *v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;

  length = a4.length;
  location = a4.location;
  v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 13);
  if (!v10
    || (v11 = v10, v12 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v10, location), v12 == v11->var2)
    || (v13 = (id)*((_QWORD *)v11->var4 + 2 * v12 + 1),
        v14 = TSWPAttributeArray::rangeForAttributeIndex(v11, v12),
        v14 > location)
    || v14 + v15 < location + length
    || v13 != a3 && (!a3 || !v13 || (objc_msgSend(v13, "isEqualToString:", a3) & 1) == 0))
  {
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, location, length, 13, 0, a5);
  }
}

- (id)bestCharacterLanguageForTextRange:(_NSRange)a3
{
  NSUInteger location;
  id result;
  TSWPAttributeArray *v6;
  unint64_t v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger length;
  void *v11;
  NSRange v12;
  NSUInteger v13;
  BOOL v14;
  unint64_t v15;
  char *v16;
  uint64_t v17;
  void *v18;
  unint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  uint64_t v22;
  int v23;
  _QWORD *v24;
  uint64_t v25;
  uint64_t v26;
  int v27;
  unint64_t *v28;
  unint64_t v29;
  uint64_t v30;
  unint64_t v31;
  unint64_t v32;
  _BOOL4 v34;
  BOOL v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  unint64_t v39;
  TSWPAttributeArray *v40;
  NSUInteger v41;
  unint64_t var2;
  unint64_t range2;
  NSUInteger v44;
  _OWORD v45[4];
  uint64_t v46;
  NSRange v47;
  NSRange v48;

  range2 = a3.length;
  location = a3.location;
  v46 = *MEMORY[0x24BDAC8D0];
  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 13);
  if (result)
  {
    v6 = (TSWPAttributeArray *)result;
    v45[1] = xmmword_217C2AC80;
    v45[0] = xmmword_217C2AC80;
    v45[3] = xmmword_217C2AC80;
    v45[2] = xmmword_217C2AC80;
    v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, location);
    var2 = v6->var2;
    if (v7 < var2)
    {
      v8 = v7;
      v44 = location + range2;
      v38 = (char *)v45 + 8;
      v39 = 0;
      v40 = v6;
      v41 = location;
      while (1)
      {
        v47.location = TSWPAttributeArray::rangeForAttributeIndex(v6, v8);
        v9 = v47.location;
        length = v47.length;
        v11 = (void *)*((_QWORD *)v6->var4 + 2 * v8 + 1);
        v48.location = location;
        v48.length = range2;
        v12 = NSIntersectionRange(v47, v48);
        if (v11)
          break;
        if (v9 + length >= v44)
          v20 = v44;
        else
          v20 = v9 + length;
        if (v9 < v20)
        {
          v13 = v12.length;
          v14 = 1;
          v21 = v9;
          do
          {
            v22 = -[TSWPStorage characterAtIndex:](self, "characterAtIndex:", v21, v38);
            if (!IsSpecialCharacter(v22))
            {
              v23 = IsParagraphBreakingCharacter(v22);
              if ((_DWORD)v22 != 8232 && !v23)
                break;
            }
            v14 = ++v21 < v20;
          }
          while (v20 != v21);
          goto LABEL_6;
        }
LABEL_32:
        if (++v8 >= var2 || v9 + length >= v44)
          goto LABEL_34;
      }
      v13 = v12.length;
      v14 = 1;
LABEL_6:
      if (v13 && v14)
      {
        v15 = 0;
        v16 = v38;
        do
        {
          v17 = *(_QWORD *)v16;
          if (*(_QWORD *)v16 != 0x7FFFFFFFFFFFFFFFLL)
          {
            v18 = (void *)*((_QWORD *)v16 - 1);
            if (v18 == v11 || (objc_msgSend(v18, "isEqualToString:", v11) & 1) != 0)
            {
              v19 = v39;
              if (v39 <= v15)
                v19 = v15 + 1;
              goto LABEL_27;
            }
          }
          ++v15;
          v16 += 16;
        }
        while (v15 != 4);
        v15 = v39;
        if (v39 > 3)
          return 0;
        v19 = v39 + 1;
        v17 = *((_QWORD *)&v45[v39] + 1);
LABEL_27:
        v24 = &v45[v15];
        if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          v25 = 0;
        else
          v25 = v17;
        *v24 = v11;
        v24[1] = v25 + v13;
        v39 = v19;
      }
      v6 = v40;
      location = v41;
      goto LABEL_32;
    }
LABEL_34:
    v26 = 0;
    v27 = 0;
    v28 = (unint64_t *)v45 + 1;
    v29 = 0x7FFFFFFFFFFFFFFFLL;
    v30 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v32 = *v28;
      v28 += 2;
      v31 = v32;
      v34 = v29 == 0x7FFFFFFFFFFFFFFFLL || v31 > v29;
      v35 = !v34;
      if (v34)
        v36 = v26;
      else
        v36 = v30;
      if (v35)
        v37 = v29;
      else
        v37 = v31;
      if (v31 != 0x7FFFFFFFFFFFFFFFLL)
      {
        v30 = v36;
        ++v27;
        v29 = v37;
      }
      ++v26;
    }
    while (v26 != 4);
    if (v30 != 0x7FFFFFFFFFFFFFFFLL
      && (v27 == 1 || (double)*((unint64_t *)&v45[v30] + 1) / (double)range2 >= 0.75))
    {
      return *(id *)&v45[v30];
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)dictationAndAutocorrectionKeyAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result;
  TSWPAttributeArray *v7;
  unint64_t v8;
  unint64_t v9;
  NSUInteger v10;

  if (a4)
  {
    a4->location = 0;
    a4->length = 0;
  }
  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 14);
  if (result)
  {
    v7 = (TSWPAttributeArray *)result;
    v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
    if (v8 >= v7->var2)
    {
      return 0;
    }
    else
    {
      v9 = v8;
      if (a4)
      {
        a4->location = TSWPAttributeArray::rangeForAttributeIndex(v7, v8);
        a4->length = v10;
      }
      return (id)*((_QWORD *)v7->var4 + 2 * v9 + 1);
    }
  }
  return result;
}

- (void)addAllDictationAndAutocorrectionKeyRangesInRange:(_NSRange)a3 toRanges:(void *)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v7;
  TSWPAttributeArray *v8;
  unint64_t v9;
  unint64_t var2;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;
  uint64_t v14;
  unint64_t v15;
  NSUInteger *v16;
  _QWORD *v17;
  NSUInteger *v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char *v23;
  NSUInteger *v24;
  NSUInteger *v25;
  NSRange v26;
  NSRange v27;

  length = a3.length;
  location = a3.location;
  v7 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 14);
  if (v7)
  {
    v8 = v7;
    v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, location);
    var2 = v8->var2;
    if (v9 < var2)
    {
      v11 = v9;
      do
      {
        v26.location = TSWPAttributeArray::rangeForAttributeIndex(v8, v11);
        v12 = v26.location;
        v13 = v26.length;
        v14 = *((_QWORD *)v8->var4 + 2 * v11 + 1);
        v27.location = location;
        v27.length = length;
        if (NSIntersectionRange(v26, v27).length && v14)
        {
          v16 = (NSUInteger *)*((_QWORD *)a4 + 1);
          v15 = *((_QWORD *)a4 + 2);
          if ((unint64_t)v16 >= v15)
          {
            v18 = *(NSUInteger **)a4;
            v19 = ((uint64_t)v16 - *(_QWORD *)a4) >> 4;
            v20 = v19 + 1;
            if ((unint64_t)(v19 + 1) >> 60)
              abort();
            v21 = v15 - (_QWORD)v18;
            if (v21 >> 3 > v20)
              v20 = v21 >> 3;
            if ((unint64_t)v21 >= 0x7FFFFFFFFFFFFFF0)
              v22 = 0xFFFFFFFFFFFFFFFLL;
            else
              v22 = v20;
            if (v22)
            {
              v23 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)a4 + 16, v22);
              v18 = *(NSUInteger **)a4;
              v16 = (NSUInteger *)*((_QWORD *)a4 + 1);
            }
            else
            {
              v23 = 0;
            }
            v24 = (NSUInteger *)&v23[16 * v19];
            *v24 = v12;
            v24[1] = v13;
            v25 = v24;
            if (v16 != v18)
            {
              do
              {
                *((_OWORD *)v25 - 1) = *((_OWORD *)v16 - 1);
                v25 -= 2;
                v16 -= 2;
              }
              while (v16 != v18);
              v18 = *(NSUInteger **)a4;
            }
            v17 = v24 + 2;
            *(_QWORD *)a4 = v25;
            *((_QWORD *)a4 + 1) = v24 + 2;
            *((_QWORD *)a4 + 2) = &v23[16 * v22];
            if (v18)
              operator delete(v18);
          }
          else
          {
            *v16 = v12;
            v16[1] = v13;
            v17 = v16 + 2;
          }
          *((_QWORD *)a4 + 1) = v17;
        }
        ++v11;
      }
      while (v11 < var2 && v12 + v13 < location + length);
    }
  }
}

- (void)setDictationAndAutocorrection:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v10;
  TSWPAttributeArray *v11;
  unint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v15;

  length = a4.length;
  location = a4.location;
  v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 14);
  if (!v10
    || (v11 = v10, v12 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v10, location), v12 == v11->var2)
    || (v13 = (id)*((_QWORD *)v11->var4 + 2 * v12 + 1),
        v14 = TSWPAttributeArray::rangeForAttributeIndex(v11, v12),
        v14 > location)
    || v14 + v15 < location + length
    || v13 != a3 && (!a3 || !v13 || (objc_msgSend(v13, "isEqualToString:", a3) & 1) == 0))
  {
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, location, length, 14, 0, a5);
  }
}

- (void)setParagraphStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", a3, a4, 1, 0, a5);
}

- (unint64_t)findNextParagraphStyleChange:(unint64_t)a3 maxCharIndex:(unint64_t)a4
{
  TSWPAttributeArray *v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t var2;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (!v6)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage findNextParagraphStyleChange:maxCharIndex:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3835, CFSTR("findNextParagraphStyleChange: no paragraph table."));
  }
  v9 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v6, a3);
  var2 = v6->var2;
  v11 = *((_QWORD *)v6->var4 + 2 * v9 + 1);
  v12 = 16 * v9 + 24;
  while (++v9 < var2 && TSWPAttributeArray::charIndexForAttributeIndex(v6, v9) < a4)
  {
    v13 = *(_QWORD *)((char *)v6->var4 + v12);
    v12 += 16;
    if (v13 != v11)
      return TSWPAttributeArray::charIndexForAttributeIndex(v6, v9);
  }
  return a4;
}

- (void)enumerateParagraphsIntersectingTextRange:(_NSRange)a3 usingBlock:(id)a4
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  id v15;
  BOOL v16;
  _QWORD v17[2];
  char v18;
  _NSRange v19;

  length = a3.length;
  location = a3.location;
  v8 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 0);
  if (!v8)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage enumerateParagraphsIntersectingTextRange:usingBlock:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 3867, CFSTR("enumerateParagraphsIntersectingTextRange:usingBlock: no paragraph table."));
  }
  v19.location = location;
  v19.length = length;
  v11 = TSWPAttributeArray::calculateAttributeRangeForCharacterRange(v8, v19);
  v18 = 0;
  v13 = v11 + v12;
  if (v11 < v11 + v12)
  {
    v14 = v11;
    do
    {
      v15 = -[TSWPStorage paragraphStyleAtParIndex:effectiveRange:](self, "paragraphStyleAtParIndex:effectiveRange:", v14, v17);
      (*((void (**)(id, unint64_t, _QWORD, _QWORD, id, char *))a4 + 2))(a4, v14++, v17[0], v17[1], v15, &v18);
      if (v18)
        v16 = 1;
      else
        v16 = v14 >= v13;
    }
    while (!v16);
  }
}

- (BOOL)supportsListStyles
{
  return 1;
}

- (unint64_t)listStyleCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 2);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (void)setListStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphsInCharRange:forKind:undoTransaction:](self, "applyObject:toParagraphsInCharRange:forKind:undoTransaction:", a3, a4.location, a4.length, 2, a5);
}

- (void)setListStyle:(id)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphIndexRange:forKind:undoTransaction:](self, "applyObject:toParagraphIndexRange:forKind:undoTransaction:", a3, a4, 1, 2, a5);
}

- (unint64_t)listNumberForParagraphIndex:(unint64_t)a3 numberingData:(id *)a4
{
  unint64_t v6;
  TSWPParagraphEnumerator v8;

  if (self)
    -[TSWPStorage paragraphEnumeratorAtParIndex:styleProvider:](self, "paragraphEnumeratorAtParIndex:styleProvider:", a3, 0);
  else
    memset(&v8, 0, sizeof(v8));
  v6 = -[TSWPStorage listNumberForParagraphEnumerator:numberingData:](self, "listNumberForParagraphEnumerator:numberingData:", &v8, a4);
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v8);
  return v6;
}

- (unint64_t)listNumberForParagraphEnumerator:(const TSWPParagraphEnumerator *)a3 numberingData:(id *)a4
{
  void *v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t i;
  void *v15;
  unint64_t v16;
  int v17;
  NSUInteger v18;
  uint64_t v19;
  char v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v26;
  _QWORD v27[6];
  TSWPParagraphEnumerator v28;

  v7 = (void *)TSWPParagraphEnumerator::paragraphListStyle((TSWPParagraphEnumerator *)a3);
  v8 = TSWPParagraphEnumerator::paragraphLevel((TSWPParagraphEnumerator *)a3);
  if (!v7)
  {
    objc_msgSend(0, "baseStyleForTopicNumbers");
    v9 = 0;
    goto LABEL_6;
  }
  v9 = objc_msgSend(v7, "labelTypeForLevel:", v8);
  v10 = objc_msgSend(v7, "baseStyleForTopicNumbers");
  if (v9 != 3)
  {
LABEL_6:
    v13 = 0;
    goto LABEL_29;
  }
  v11 = (void *)v10;
  v12 = TSWPParagraphEnumerator::paragraphListStart((TSWPParagraphEnumerator *)a3);
  if (v12)
  {
    v13 = v12;
    goto LABEL_28;
  }
  TSWPParagraphEnumerator::TSWPParagraphEnumerator(&v28, a3);
  v26 = 0;
  for (i = 1; ; i = v13 + 1)
  {
    if (TSWPParagraphEnumerator::isFirstParagraph(&v28))
    {
      TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v28);
      v13 = i + (v26 & 1);
      goto LABEL_28;
    }
    TSWPParagraphEnumerator::operator--(&v28);
    v15 = (void *)TSWPParagraphEnumerator::paragraphListStyle(&v28);
    v16 = TSWPParagraphEnumerator::paragraphLevel(&v28);
    if (v15)
      v17 = objc_msgSend(v15, "labelTypeForLevel:", v16);
    else
      v17 = 0;
    v18 = TSWPParagraphEnumerator::paragraphTextRange(&v28);
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke;
    v27[3] = &__block_descriptor_48_e26_B16__0___TSWPTextSource__8l;
    v27[4] = v18;
    v27[5] = v19;
    v20 = __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke((uint64_t)v27, self);
    if (v17 == 3)
      v21 = v20;
    else
      v21 = 1;
    if ((v21 & 1) != 0
      || (v22 = objc_msgSend(v15, "baseStyleForTopicNumbers"), v22 != objc_msgSend(v11, "baseStyleForTopicNumbers")))
    {
      v13 = i - 1;
      continue;
    }
    if (v16 < v8)
      break;
    if (v16 > v8)
    {
      v13 = i - 1;
      v26 = 1;
    }
    else
    {
      v23 = TSWPParagraphEnumerator::paragraphListStart(&v28);
      v13 = v23 + i;
      if (v23)
        goto LABEL_27;
      v26 = 0;
    }
  }
  v13 = i + (v26 & 1);
LABEL_27:
  TSWPParagraphEnumerator::~TSWPParagraphEnumerator(&v28);
LABEL_28:
  v9 = 3;
LABEL_29:
  v24 = TSWPParagraphEnumerator::paragraphListStart((TSWPParagraphEnumerator *)a3);
  if (a4)
  {
    a4->var0 = v9;
    a4->var1 = v8;
    a4->var2 = v24 == 0;
  }
  return v13;
}

uint64_t __62__TSWPStorage_listNumberForParagraphEnumerator_numberingData___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;

  v3 = objc_msgSend(a2, "charIndexMappedFromStorage:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(a2, "length") && objc_msgSend(a2, "characterAtIndex:", v3) == 65532)
    return objc_msgSend((id)objc_msgSend(a2, "attachmentAtCharIndex:", v3), "isPartitioned");
  else
    return 0;
}

- (void)setListStart:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  v8 = -[TSWPStorage paragraphIndexRangeForCharRange:](self, "paragraphIndexRangeForCharRange:", a4.location, a4.length);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    if (HIDWORD(a3))
    {
      v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage setListStart:forCharRange:undoTransaction:]");
      objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4073, CFSTR("Out-of-bounds type assignment was clamped to max"));
      a3 = 0xFFFFFFFFLL;
    }
    -[TSWPStorage applyDataValue:toParagraphIndexRange:forKind:undoTransaction:](self, "applyDataValue:toParagraphIndexRange:forKind:undoTransaction:", a3, v10, v11, 11, a5);
  }
}

- (unint64_t)listStartAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 11);
  if (v4)
  {
    v5 = v4;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    if (v4->var2)
    {
      v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
      if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage listStartAtCharIndex:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4086, CFSTR("paragraphStartAtCharIndex: no paragraph table."));
      }
      return *((unsigned int *)v5->var4 + 4 * v7 + 2);
    }
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage listStartAtCharIndex:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4081, CFSTR("paragraphLevelAtCharIndex: no paragraph table."));
    return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v6;
}

- (void)paragraphFlags:(unsigned __int16 *)a3 andLevel:(unint64_t *)a4 atCharIndex:(unint64_t)a5
{
  TSWPAttributeArray *v8;
  TSWPAttributeArray *v9;
  unint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unsigned __int16 v15;

  v8 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 1);
  if (v8)
  {
    v9 = v8;
    v10 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v8, a5);
    if (v10 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v12 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphFlags:andLevel:atCharIndex:]");
      objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4107, CFSTR("paragraphFlagsAtCharIndex: no paragraph table."));
    }
    v13 = (uint64_t)v9->var4 + 16 * v10;
    v14 = *(unsigned __int16 *)(v13 + 8);
    v15 = *(_WORD *)(v13 + 10);
    if (a3)
      goto LABEL_5;
  }
  else
  {
    v15 = 0;
    v14 = 0;
    if (a3)
LABEL_5:
      *a3 = v15;
  }
  if (a4)
    *a4 = v14;
}

- (unsigned)paragraphFlagsAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v10;
  uint64_t v11;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 1);
  if (v4)
  {
    v5 = v4;
    v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphFlagsAtCharIndex:]");
      objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4128, CFSTR("paragraphFlagsAtCharIndex: no paragraph table."));
    }
    return *((_WORD *)v5->var4 + 8 * v6 + 5);
  }
  else
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage paragraphFlagsAtCharIndex:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4123, CFSTR("paragraphFlagsAtCharIndex: no paragraph table."));
    return 0;
  }
}

- (void)setParagraphFlags:(unsigned __int16)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", a3, -[TSWPStorage paragraphLevelAtCharIndex:](self, "paragraphLevelAtCharIndex:", a4.location), a4.location, a4.length, a5);
}

- (void)setParagraphLevel:(unint64_t)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", -[TSWPStorage paragraphFlagsAtCharIndex:](self, "paragraphFlagsAtCharIndex:", a4.location), a3, a4.location, a4.length, a5);
}

- (void)setParagraphLevel:(unint64_t)a3 atParIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  uint64_t v8;
  uint64_t v9;

  v8 = -[TSWPStorage textRangeForParagraphAtIndex:](self, "textRangeForParagraphAtIndex:", a4);
  -[TSWPStorage applyFlags:level:toParagraphsInCharRange:undoTransaction:](self, "applyFlags:level:toParagraphsInCharRange:undoTransaction:", -[TSWPStorage paragraphFlagsAtCharIndex:](self, "paragraphFlagsAtCharIndex:", v8), a3, v8, v9, a5);
}

- (unint64_t)characterStyleAttributeCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 3);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (id)valueForProperty:(int)a3 atCharIndex:(unint64_t)a4 effectiveRange:(_NSRange *)a5
{
  uint64_t v7;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v15;
  uint64_t v16;

  v7 = *(_QWORD *)&a3;
  v9 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", a4, 0);
  if (v9)
  {
    v10 = v9;
    if (objc_msgSend(v9, "definesProperty:", v7))
    {
      v11 = v10;
LABEL_6:
      v12 = objc_msgSend(v11, "boxedValueForProperty:", v7);
LABEL_7:
      v13 = (void *)v12;
      goto LABEL_8;
    }
  }
  if (objc_msgSend(+[TSWPParagraphStyle properties](TSWPParagraphStyle, "properties"), "containsProperty:", v7))
  {
    v11 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", a4, a5);
    goto LABEL_6;
  }
  if (objc_msgSend(+[TSWPColumnStyle properties](TSWPColumnStyle, "properties"), "containsProperty:", v7))
  {
    v12 = objc_msgSend(-[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self, "columnStyleAtCharIndex:effectiveRange:", a4, a5), "valueForProperty:", v7);
    goto LABEL_7;
  }
  v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage valueForProperty:atCharIndex:effectiveRange:]");
  objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4268, CFSTR("Bad property sent to storage: %@"), String(v7));
  v13 = 0;
LABEL_8:
  if (v13 == (void *)objc_msgSend(MEMORY[0x24BDBCEF8], "null"))
    return 0;
  else
    return v13;
}

- (unint64_t)columnStyleCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 9);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v5;

  LODWORD(v5) = -[TSWPStorage supportsColumnStyles](self, "supportsColumnStyles");
  if ((_DWORD)v5)
  {
    v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 9);
    if (v5)
      LOBYTE(v5) = TSWPAttributeArray::exactAttributeIndexForCharIndex(v5, a3 + 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  return (char)v5;
}

- (id)columnStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPAttributeArray *v7;
  unint64_t v8;

  v7 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 9);
  if (v7 && (v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, a3), v8 != 0x7FFFFFFFFFFFFFFFLL))
    return -[TSWPStorage columnStyleAtColumnStyleIndex:effectiveRange:](self, "columnStyleAtColumnStyleIndex:effectiveRange:", v8, a4);
  else
    return 0;
}

- (id)columnStyleAtColumnStyleIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result;
  TSWPAttributeArray *v7;
  unint64_t var2;
  void *v9;
  uint64_t v10;
  NSUInteger v11;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 9);
  if (result)
  {
    v7 = (TSWPAttributeArray *)result;
    var2 = *((_QWORD *)result + 2);
    if (var2 <= a3)
    {
      v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage columnStyleAtColumnStyleIndex:effectiveRange:]");
      objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4350, CFSTR("Bad columnStyleIndex"));
      var2 = v7->var2;
    }
    if (var2 <= a3)
    {
      return 0;
    }
    else
    {
      if (a4)
      {
        a4->location = TSWPAttributeArray::rangeForAttributeIndex(v7, a3);
        a4->length = v11;
      }
      return (id)*((_QWORD *)v7->var4 + 2 * a3 + 1);
    }
  }
  return result;
}

- (void)setColumnStyle:(id)a3 forCharRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphsInCharRange:forKind:undoTransaction:](self, "applyObject:toParagraphsInCharRange:forKind:undoTransaction:", a3, a4.location, a4.length, 9, a5);
}

- (void)styleDidChangeInRange:(_NSRange)a3
{
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", a3.location, a3.length, 0, 0);
}

- (void)invalidateForStyle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TSWPAttributeArray *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(&unk_24D8FA398, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(&unk_24D8FA398);
        v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "unsignedIntegerValue"));
        if (v10)
        {
          v11[0] = v8;
          v11[1] = 3221225472;
          v11[2] = __34__TSWPStorage_invalidateForStyle___block_invoke;
          v11[3] = &unk_24D82DFE8;
          v11[4] = a3;
          v11[5] = self;
          TSWPAttributeArray::enumerateObjectAttributes(v10, (uint64_t)v11);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(&unk_24D8FA398, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

uint64_t __34__TSWPStorage_invalidateForStyle___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t result;

  if (*(void **)(a1 + 32) == a2)
    return objc_msgSend(*(id *)(a1 + 40), "styleDidChangeInRange:", a4, a5);
  result = objc_msgSend((id)objc_msgSend(a2, "referencedStyles"), "containsObject:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 40), "styleDidChangeInRange:", a4, a5);
  return result;
}

- (BOOL)supportsSectionCopying
{
  return 0;
}

- (unint64_t)sectionCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (BOOL)hasSectionForParagraphBreakAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v3;

  if (self->_WPKind)
  {
    LOBYTE(v3) = 0;
  }
  else
  {
    v3 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
    if (v3)
      LOBYTE(v3) = TSWPAttributeArray::exactAttributeIndexForCharIndex(v3, a3 + 1) != 0x7FFFFFFFFFFFFFFFLL;
  }
  return (char)v3;
}

- (id)sectionAtSectionIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result;
  _QWORD *v7;
  NSUInteger v8;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (result)
  {
    v7 = result;
    if (a4)
    {
      a4->location = TSWPAttributeArray::rangeForAttributeIndex((TSWPAttributeArray *)result, a3);
      a4->length = v8;
    }
    return *(id *)(v7[4] + 16 * a3 + 8);
  }
  return result;
}

- (void)replaceSectionAtSectionIndex:(unint64_t)a3 withSection:(id)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  TSWPAttributeArray *v10;

  v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (v10)
  {
    if (v10->var2 > a3)
      TSWPAttributeArray::replaceObjectForAttributeIndex(v10, (objc_object *)a4, a3, (TSKAddedToDocumentContext *)a5, a6);
  }
}

- (unint64_t)sectionIndexForCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (v4)
    return TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)sectionIndexForSection:(id)a3
{
  TSWPAttributeArray *v4;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (v4)
    return TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)sectionAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPAttributeArray *v7;
  unint64_t v8;

  v7 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 8);
  if (v7 && (v8 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v7, a3), v8 != 0x7FFFFFFFFFFFFFFFLL))
    return -[TSWPStorage sectionAtSectionIndex:effectiveRange:](self, "sectionAtSectionIndex:effectiveRange:", v8, a4);
  else
    return 0;
}

- (_NSRange)insertSection:(id)a3 atCharIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7
{
  TSWPAttributeArray *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  void *v18;
  uint64_t v19;
  NSUInteger v20;
  NSUInteger v21;
  _NSRange result;

  -[TSWPStorage splitSmartFieldAtCharIndex:lengthToInsert:dolcContext:undoTransaction:](self, "splitSmartFieldAtCharIndex:lengthToInsert:dolcContext:undoTransaction:", a4, 1);
  -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", 4, a3, 8, a4, 0, a5, a6, a7);
  v13 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 8, 1, a6);
  if (!v13)
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage insertSection:atCharIndex:dolcContext:undoTransaction:changeSession:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4520, CFSTR("insertSection: bad attribute array."));
  }
  v16 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v13, a4 + 1);
  v17 = v16;
  if (v16 == 0x7FFFFFFFFFFFFFFFLL || *((id *)v13->var4 + 2 * v16 + 1) != a3)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage insertSection:atCharIndex:dolcContext:undoTransaction:changeSession:]");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4523, CFSTR("insertSection: bad insertion object."));
  }
  v20 = TSWPAttributeArray::rangeForAttributeIndex(v13, v17);
  result.length = v21;
  result.location = v20;
  return result;
}

- (void)appendSection:(id)a3 charIndex:(unint64_t)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toParagraphsInCharRange:forKind:undoTransaction:](self, "applyObject:toParagraphsInCharRange:forKind:undoTransaction:", a3, a4, -[TSWPStorage length](self, "length") - a4, 8, a5);
}

- (unint64_t)footnoteCount
{
  unint64_t result;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

- (unint64_t)footnoteIndexForCharIndex:(unint64_t)a3
{
  unint64_t result;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (result)
  {
    v5 = (TSWPAttributeArray *)result;
    if (*(_QWORD *)(result + 16)
      && (v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3),
          v6 != 0x7FFFFFFFFFFFFFFFLL))
    {
      v7 = v6;
      if (TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) == a3)
        return v7;
      else
        return v7 + 1;
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (id)footnoteMarkAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (!v4)
    return 0;
  v5 = v4;
  if (!v4->var2)
    return 0;
  v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) != a3)
    return 0;
  objc_opt_class();
  return (id)TSUDynamicCast();
}

- (id)footnoteAtFootnoteIndex:(unint64_t)a3 outCharIndex:(unint64_t *)a4
{
  TSWPAttributeArray *v6;
  void *v7;

  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (!v6 || v6->var2 <= a3)
    return 0;
  v7 = (void *)*((_QWORD *)v6->var4 + 2 * a3 + 1);
  if (a4)
    *a4 = TSWPAttributeArray::charIndexForAttributeIndex(v6, a3);
  return v7;
}

- (_NSRange)footnoteRangeForTextRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPAttributeArray *v5;
  NSUInteger v6;
  _NSRange result;
  _NSRange v8;

  length = a3.length;
  location = a3.location;
  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (v5)
  {
    v8.location = location;
    v8.length = length;
    v5 = (TSWPAttributeArray *)TSWPAttributeArray::calculateAttributeRangeForCharacterRange(v5, v8);
  }
  else
  {
    v6 = 0;
  }
  result.length = v6;
  result.location = (NSUInteger)v5;
  return result;
}

- (unint64_t)autoNumberFootnoteCountForRange:(_NSRange)a3
{
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;

  v4 = -[TSWPStorage footnoteRangeForTextRange:](self, "footnoteRangeForTextRange:", a3.location, a3.length);
  if (v4 >= v4 + v5)
    return 0;
  v6 = v4;
  v7 = v5;
  v8 = 0;
  do
  {
    if (!objc_msgSend(-[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", v6, 0), "customMarkString"))++v8;
    ++v6;
    --v7;
  }
  while (v7);
  return v8;
}

- (unint64_t)footnoteIndexForFootnote:(id)a3
{
  TSWPAttributeArray *v4;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (v4)
    return TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0);
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)footnoteIndexForFootnoteStorage:(id)a3
{
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  if (!a3)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage footnoteIndexForFootnoteStorage:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4706, CFSTR("invalid nil value for '%s'"), "footnoteStorage");
  }
  if (objc_msgSend(a3, "wpKind") != 2)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage footnoteIndexForFootnoteStorage:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4707, CFSTR("This isn't a footnote storage"));
  }
  objc_opt_class();
  objc_msgSend(a3, "owningAttachment");
  v9 = TSUDynamicCast();
  if (!v9)
  {
    v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage footnoteIndexForFootnoteStorage:]");
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4710, CFSTR("invalid nil value for '%s'"), "footnoteAttachment");
  }
  return -[TSWPStorage footnoteIndexForFootnote:](self, "footnoteIndexForFootnote:", v9);
}

- (id)footnoteStorages
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  uint64_t v9;

  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v4 = -[TSWPStorage footnoteCount](self, "footnoteCount");
  if (v4)
  {
    v5 = v4;
    for (i = 0; i != v5; ++i)
    {
      v7 = objc_msgSend(-[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", i, 0), "containedStorage");
      if (v7)
      {
        objc_msgSend(v3, "addObject:", v7);
      }
      else
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage footnoteStorages]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4726, CFSTR("invalid nil value for '%s'"), "footnoteStorage");
      }
    }
  }
  return v3;
}

- (unint64_t)findCharIndexForFootnoteAttachment:(id)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t Object;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (v4
    && (v5 = v4, Object = TSWPAttributeArray::findObject(v4, (objc_object *)a3, 0), Object != 0x7FFFFFFFFFFFFFFFLL))
  {
    return TSWPAttributeArray::charIndexForAttributeIndex(v5, Object);
  }
  else
  {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (void)invalidateFootnoteAttachmentCharIndexes
{
  TSWPAttributeArray *v3;
  TSWPAttributeArray *v4;
  unint64_t var2;
  unint64_t i;

  v3 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (v3)
  {
    v4 = v3;
    var2 = v3->var2;
    if (var2)
    {
      for (i = 0; i != var2; ++i)
        -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, TSWPAttributeArray::charIndexForAttributeIndex(v4, i), 1, 0, 1);
    }
  }
}

- (void)invalidatePageCountAttachmentCharIndexes:(BOOL)a3
{
  _BOOL4 v3;
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  unint64_t var2;
  unint64_t i;
  id v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  int v14;

  v3 = a3;
  v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (v5)
  {
    v6 = v5;
    var2 = v5->var2;
    if (var2)
    {
      for (i = 0; i != var2; ++i)
      {
        v9 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", i, 0);
        if (objc_msgSend(v9, "changesWithPageCount"))
        {
          v10 = (void *)objc_msgSend(v9, "stringEquivalent");
          if (objc_msgSend(v10, "length"))
          {
            v11 = objc_msgSend(v10, "intValue");
            if (v11 == 0x7FFFFFFF)
            {
              v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
              v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage invalidatePageCountAttachmentCharIndexes:]");
              objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 4803, CFSTR("Invalid page count."));
            }
            else
            {
              v14 = 10;
              if (v11 >= 11)
              {
                do
                  v14 *= 10;
                while (v14 < v11);
              }
              if (v14 == v11 + !v3)
                -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, TSWPAttributeArray::charIndexForAttributeIndex(v6, i), 1, 0, 1);
            }
          }
        }
      }
    }
  }
}

- (void)invalidateCharIndexForAttachment:(id)a3
{
  uint64_t v4;

  v4 = objc_msgSend(a3, "findCharIndex");
  if (v4 != 0x7FFFFFFFFFFFFFFFLL)
    -[TSWPStorageBroadcaster broadcastStorage:didChangeRange:delta:broadcastKind:](self->_broadcaster, "broadcastStorage:didChangeRange:delta:broadcastKind:", self, v4, 1, 0, 1);
}

- (_NSRange)insertAttachmentOrFootnote:(id)a3 range:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6 changeSession:(id)a7
{
  NSUInteger length;
  NSUInteger location;
  char isKindOfClass;
  uint64_t v15;
  uint64_t v16;
  NSUInteger v17;
  NSUInteger v18;
  _NSRange result;

  length = a4.length;
  location = a4.location;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if ((isKindOfClass & 1) != 0)
    v15 = 5;
  else
    v15 = 4;
  if ((isKindOfClass & 1) != 0)
    v16 = 14;
  else
    v16 = 65532;
  v17 = -[TSWPStorage insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:](self, "insertSpecialCharacter:object:kind:range:dolcContext:undoTransaction:changeSession:", v16, a3, v15, location, length, a5, a6, a7);
  result.length = v18;
  result.location = v17;
  return result;
}

- (unint64_t)findCharacterIndexForContainedInfo:(id)a3
{
  id v3;
  TSWPStorage *v5;
  _BOOL4 v6;
  TSWPStorage *v7;
  TSWPStorage *v8;
  TSWPAttributeArray *v9;
  TSWPAttributeArray *v10;
  unint64_t v11;
  uint64_t i;
  void *v13;

  v3 = a3;
  v5 = (TSWPStorage *)objc_msgSend(a3, "parentInfo");
  v6 = v5 != 0;
  if (v5)
  {
    v7 = v5;
    if (v5 != self)
    {
      do
      {
        v8 = -[TSWPStorage parentInfo](v7, "parentInfo");
        if (v8 == self)
          v3 = v7;
        v6 = v8 != 0;
        if (!v8)
          break;
        v7 = v8;
      }
      while (v8 != self);
    }
  }
  if (!v6)
    return 0x7FFFFFFFFFFFFFFFLL;
  v9 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (!v9)
    return 0x7FFFFFFFFFFFFFFFLL;
  v10 = v9;
  if (!v9->var2)
    return 0x7FFFFFFFFFFFFFFFLL;
  v11 = 0;
  for (i = 8; ; i += 16)
  {
    v13 = *(void **)((char *)v10->var4 + i);
    if (objc_msgSend(v13, "isDrawable"))
    {
      if ((id)objc_msgSend(v13, "drawable") == v3)
        break;
    }
    if (++v11 >= v10->var2)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return TSWPAttributeArray::charIndexForAttributeIndex(v10, v11);
}

- (unint64_t)attachmentIndexAtCharIndex:(unint64_t)a3
{
  TSWPAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;

  v4 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (!v4)
    return 0x7FFFFFFFFFFFFFFFLL;
  v5 = v4;
  v6 = 0x7FFFFFFFFFFFFFFFLL;
  if (v4->var2)
  {
    v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v4, a3);
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = v7;
      if (TSWPAttributeArray::charIndexForAttributeIndex(v5, v7) == a3)
        return v8;
      else
        return 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  return v6;
}

- (void)replaceWithAttachment:(id)a3 forAttachmentIndex:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  TSWPAttributeArray *v10;

  v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (v10)
  {
    if (v10->var2 > a4)
      TSWPAttributeArray::replaceObjectForAttributeIndex(v10, (objc_object *)a3, a4, (TSKAddedToDocumentContext *)a5, a6);
  }
}

- (unint64_t)attachmentIndexForInsertionAtCharIndex:(unint64_t)a3
{
  unint64_t result;
  TSWPAttributeArray *v5;
  unint64_t v6;

  result = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (result)
  {
    v5 = (TSWPAttributeArray *)result;
    v6 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)result, a3);
    if (v6 >= v5->var2 || TSWPAttributeArray::charIndexForAttributeIndex(v5, v6) >= a3)
    {
      if (v6 == 0x7FFFFFFFFFFFFFFFLL)
        return 0;
      else
        return v6;
    }
    else
    {
      return v6 + 1;
    }
  }
  return result;
}

- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = -[TSWPStorage attachmentRangeForCharIndex:forwards:attributeKind:](self, "attachmentRangeForCharIndex:forwards:attributeKind:", a3, a4, 4);
  result.length = v5;
  result.location = v4;
  return result;
}

- (_NSRange)attachmentRangeForCharIndex:(unint64_t)a3 forwards:(BOOL)a4 attributeKind:(unsigned int)a5
{
  uint64_t v5;
  _BOOL4 v6;
  void *v9;
  uint64_t v10;
  TSWPAttributeArray *v11;
  TSWPAttributeArray *v12;
  unint64_t v13;
  TSWPAttributeArray *v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSUInteger v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSUInteger v22;
  unint64_t v23;
  _NSRange result;

  v5 = *(_QWORD *)&a5;
  v6 = a4;
  if ((a5 & 0xFFFFFFFE) != 4)
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage attachmentRangeForCharIndex:forwards:attributeKind:]");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5077, CFSTR("Bad attribute kind passed into attachmentRangeForCharIndex::: method."));
  }
  v11 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v5);
  if (!v11 || (v12 = v11, !v11->var2))
  {
    if (!v6)
      goto LABEL_20;
    goto LABEL_10;
  }
  v13 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v11, a3);
  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v6)
    {
      v14 = v12;
      v15 = 0;
LABEL_8:
      v16 = TSWPAttributeArray::charIndexForAttributeIndex(v14, v15);
LABEL_11:
      v17 = v16;
      v18 = a3;
      a3 = v17 - a3;
      goto LABEL_21;
    }
LABEL_20:
    v18 = 0;
    goto LABEL_21;
  }
  v19 = v13;
  v20 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v13);
  if (v6)
  {
    if (v20 == a3)
    {
      v18 = a3;
      goto LABEL_19;
    }
    v15 = v19 + 1;
    if (v19 + 1 < v12->var2)
    {
      v14 = v12;
      goto LABEL_8;
    }
LABEL_10:
    v16 = -[TSWPStorage length](self, "length");
    goto LABEL_11;
  }
  if (v20 == a3)
  {
    if (!v19)
      goto LABEL_20;
    v21 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v19 - 1);
    v18 = a3 - 1;
    if (v21 != a3 - 1)
    {
      v18 = v21 + 1;
      a3 -= v21 + 1;
      goto LABEL_21;
    }
LABEL_19:
    a3 = 1;
    goto LABEL_21;
  }
  v18 = TSWPAttributeArray::charIndexForAttributeIndex(v12, v19);
  v23 = a3 - (v18 + 1);
  if (v18 == a3 - 1)
  {
    a3 = 1;
  }
  else
  {
    ++v18;
    a3 = v23;
  }
LABEL_21:
  v22 = a3;
  result.length = v22;
  result.location = v18;
  return result;
}

- (BOOL)anchoredDrawableAttachmentCharacterAtCharIndex:(unint64_t)a3
{
  id v5;

  if (-[TSWPStorage characterAtIndex:](self, "characterAtIndex:") == 65532
    && (v5 = -[TSWPStorage attachmentAtCharIndex:](self, "attachmentAtCharIndex:", a3),
        objc_msgSend(v5, "isDrawable")))
  {
    return objc_msgSend(v5, "isAnchored");
  }
  else
  {
    return 0;
  }
}

- (_NSRange)p_extendRangeToIncludeSmartFields:(_NSRange)a3
{
  NSUInteger length;
  unint64_t location;
  id v6;
  NSUInteger v7;
  id v8;
  id v9;
  NSRange v10;
  NSRange v11;
  NSRange v12;
  NSRange v13;
  NSRange v14;
  __int128 range2;
  NSRange v16;
  NSRange v17;

  length = a3.length;
  location = a3.location;
  range2 = 0uLL;
  v6 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3.location, 6, &range2);
  v7 = location + length;
  v14.location = 0;
  v14.length = 0;
  if (length)
  {
    v8 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", v7 - 1, 6, &v14);
    if (v6 != v8)
    {
      v9 = v8;
      if (v6
        && (v10.location = range2, (unint64_t)range2 < location)
        && (v10.length = *((_QWORD *)&range2 + 1), location < *((_QWORD *)&range2 + 1) + (_QWORD)range2))
      {
        v16.location = location;
        v16.length = length;
        v11 = NSUnionRange(v16, v10);
      }
      else
      {
        v11.location = location;
        v11.length = length;
      }
      if (!v9)
        goto LABEL_21;
      goto LABEL_18;
    }
  }
  else
  {
    v14 = (NSRange)range2;
  }
  if (!v6 || (objc_msgSend(v6, "allowsEditing") & 1) != 0)
  {
    v11.location = location;
    v11.length = length;
    goto LABEL_21;
  }
  v12.location = range2;
  if ((unint64_t)range2 >= location
    || (v12.length = *((_QWORD *)&range2 + 1), location >= *((_QWORD *)&range2 + 1) + (_QWORD)range2))
  {
    v11.location = location;
    v11.length = length;
  }
  else
  {
    v17.location = location;
    v17.length = length;
    v11 = NSUnionRange(v17, v12);
  }
LABEL_18:
  v13.location = v14.location;
  if (v14.location < v7)
  {
    v13.length = v14.length;
    if (v7 < v14.length + v14.location)
      v11 = NSUnionRange(v11, v13);
  }
LABEL_21:
  if (v11.location == location && v11.length == length)
  {
    v11.location = location;
    v11.length = length;
  }
  return v11;
}

- (id)extendSelectionToIncludeSmartFields:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  if (!objc_msgSend(a3, "isValid"))
    return a3;
  v5 = objc_msgSend(a3, "range");
  v7 = v6;
  for (i = objc_msgSend(a3, "range");
        ;
        i = -[TSWPStorage textRangeForParagraphsInCharRange:](self, "textRangeForParagraphsInCharRange:", v12, v13))
  {
    v10 = -[TSWPStorage p_extendRangeToIncludeSmartFields:](self, "p_extendRangeToIncludeSmartFields:", i, v9);
    v12 = v10;
    v13 = v11;
    if (v10 == v5 && v11 == v7)
      break;
    v7 = v11;
    v5 = v10;
    if (objc_msgSend(a3, "type") != 2)
      break;
  }
  if (v5 == objc_msgSend(a3, "range") && v7 == v14)
    return a3;
  else
    return (id)objc_msgSend(a3, "copyWithNewType:range:", 0, v12, v13);
}

- (id)editableSmartFieldAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  id result;
  id v5;

  result = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, 6, 0);
  if (result)
  {
    v5 = result;
    if (objc_msgSend(result, "allowsEditing"))
      return v5;
    else
      return 0;
  }
  return result;
}

- (void)addSmartField:(id)a3 toRange:(_NSRange)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", a3, a4.location, a4.length, objc_msgSend(a3, "styleAttributeArrayKind"), a5, a6);
}

- (void)removeSmartField:(id)a3 fromRange:(_NSRange)a4 undoTransaction:(TSWPStorageTransaction *)a5
{
  -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, a4.location, a4.length, objc_msgSend(a3, "styleAttributeArrayKind"), 0, a5);
}

- (void)enumerateWithAttributeKind:(unsigned int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v10;
  uint64_t v11;
  NSUInteger v12;
  NSRange v13;
  char v14;
  _NSRange v15;
  id v16[6];
  NSRange v17;
  NSRange v18;
  NSRange v19;

  length = a4.length;
  location = a4.location;
  if (self->_attributesTable[a3])
  {
    TSWPAttributeEnumerator::TSWPAttributeEnumerator((uint64_t)v16, self, a4.location, a4.length, *(uint64_t *)&a3);
    v15.location = 0;
    v15.length = 0;
    v14 = 0;
    while (1)
    {
      v10 = TSWPAttributeEnumerator::nextAttributeIndex(v16, &v15);
      if (!v10)
        break;
      if ((v11 = *(_QWORD *)(v10 + 8),
            v17.location = location,
            v17.length = length,
            NSIntersectionRange(v17, v15).length)
        || a3 <= 0x12
        && ((1 << a3) & 0x40307) != 0
        && (v12 = v15.location, v12 == -[TSWPStorage length](self, "length"))
        || !length && TSWPInsertionPointInRangeWithOptions(location, 0, v15.location, v15.length, 0))
      {
        (*((void (**)(id, uint64_t, NSUInteger, NSUInteger, char *))a5 + 2))(a5, v11, v15.location, v15.length, &v14);
        if (v14)
          break;
      }
    }
    TSWPAttributeEnumerator::~TSWPAttributeEnumerator((TSWPAttributeEnumerator *)v16);
  }
  else
  {
    LOBYTE(v16[0]) = 0;
    v18.location = -[TSWPStorage range](self, "range");
    v19.location = location;
    v19.length = length;
    v13 = NSIntersectionRange(v18, v19);
    (*((void (**)(id, _QWORD, NSUInteger, NSUInteger, id *))a5 + 2))(a5, 0, v13.location, v13.length, v16);
  }
}

uint64_t __74__TSWPStorage_smartFieldsWithAttributeKind_intersectingRange_passingTest___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v7;
  uint64_t result;
  void *v9;

  v7 = *(_QWORD *)(a1 + 32);
  if (!v7 || (result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a5), (_DWORD)result))
  {
    v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    if (!v9)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) = objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
    }
    return objc_msgSend(v9, "addObject:", a2);
  }
  return result;
}

- (void)smartFieldDidChange:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if ((TSWPStorage *)objc_msgSend(a3, "parentStorage") != self)
  {
    v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage smartFieldDidChange:]");
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5439, CFSTR("smart field doesn't belong to this storage"));
  }
  v7 = objc_msgSend(a3, "range");
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v7, v8, 0, 0);
}

- (void)autoUpdateField:(id)a3 withRange:(_NSRange)a4 documentRoot:(id)a5 returningInsertedRange:(_NSRange *)a6
{
  void *v6;
  uint64_t v7;

  v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.location, a4.length, a5, a6);
  v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage autoUpdateField:withRange:documentRoot:returningInsertedRange:]");
  objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5448, CFSTR("unimplemented"));
}

- (void)autoUpdateSmartFieldsWithDocumentRoot:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage autoUpdateSmartFieldsWithDocumentRoot:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5455, CFSTR("unimplemented"));
}

- (void)addGlyphVariantData:(id)a3 toRange:(_NSRange)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4.location, a4.length);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage addGlyphVariantData:toRange:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5463, CFSTR("unimplemented"));
}

- (void)removeGlyphVariantDataFromRange:(_NSRange)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.location, a3.length);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage removeGlyphVariantDataFromRange:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5470, CFSTR("unimplemented"));
}

- (id)glyphVariantDataAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v4;
  uint64_t v5;

  v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3, a4);
  v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage glyphVariantDataAtCharIndex:effectiveRange:]");
  objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5476, CFSTR("unimplemented"));
  return 0;
}

- (void)fixGlyphVariantFontsForRange:(_NSRange)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3.location, a3.length);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage fixGlyphVariantFontsForRange:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5483, CFSTR("unimplemented"));
}

- (id)fontNameAtCharIndex:(unint64_t)a3 size:(double *)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  __CTFont *v7;
  __CFString *v8;

  v7 = -[TSWPStorage createFontAtCharIndex:scaleTextPercent:effectiveRange:styleProvider:](self, "createFontAtCharIndex:scaleTextPercent:effectiveRange:styleProvider:", a3, 100, a5, a6);
  v8 = (__CFString *)CTFontCopyPostScriptName(v7);
  if (a4)
    *a4 = CTFontGetSize(v7);
  CFRelease(v7);
  return v8;
}

- (BOOL)autoListRecognition
{
  return 1;
}

- (BOOL)autoListTermination
{
  return 1;
}

- (BOOL)textIsVertical
{
  return objc_msgSend((id)TSUProtocolCast(), "textIsVertical");
}

- (int64_t)contentWritingDirection
{
  void *v2;

  v2 = (void *)TSUProtocolCast();
  if (v2)
    return objc_msgSend(v2, "contentWritingDirection");
  else
    return -1;
}

- (TSDInfoGeometry)geometry
{
  return 0;
}

- (void)setGeometry:(id)a3
{
  void *v3;
  uint64_t v4;

  v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler", a3);
  v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage setGeometry:]");
  objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5537, CFSTR("can't set geometry on a storage"));
}

- (void)clearBackPointerToParentInfoIfNeeded:(id)a3
{
  if (self->_parentInfo == a3)
    self->_parentInfo = 0;
}

- (TSDOwningAttachment)owningAttachmentNoRecurse
{
  return self->_owningAttachment;
}

- (BOOL)isFloatingAboveText
{
  return 0;
}

- (BOOL)isAnchoredToText
{
  return 0;
}

- (BOOL)isInlineWithText
{
  return 0;
}

- (BOOL)isAttachedToBodyText
{
  return 0;
}

- (Class)layoutClass
{
  return (Class)objc_opt_class();
}

- (Class)repClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isThemeContent
{
  return -[TSDContainerInfo isThemeContent](-[TSWPStorage parentInfo](self, "parentInfo"), "isThemeContent");
}

- (id)copyWithContext:(id)a3
{
  uint64_t v5;
  uint64_t v6;

  v5 = -[TSWPStorage range](self, "range");
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", v5, v6, a3, a3, 1, -[TSWPStorage wpKind](self, "wpKind"));
}

- (id)childInfos
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  TSWPAttributeArray *v6;
  TSWPAttributeArray *v7;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  TSWPAttributeArray *v12;
  TSWPAttributeArray *v13;
  unint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;

  v3 = -[TSWPStorage attachmentCount](self, "attachmentCount");
  v4 = -[TSWPStorage footnoteCount](self, "footnoteCount");
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v4 + v3);
  v6 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 4);
  if (v6)
  {
    v7 = v6;
    if (v6->var2)
    {
      v8 = 0;
      v9 = 8;
      do
      {
        objc_opt_class();
        v10 = (void *)TSUDynamicCast();
        if (v10)
        {
          v11 = objc_msgSend(v10, "drawable");
          if (v11)
            objc_msgSend(v5, "addObject:", v11);
        }
        ++v8;
        v9 += 16;
      }
      while (v8 < v7->var2);
    }
  }
  v12 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 5);
  if (v12)
  {
    v13 = v12;
    if (v12->var2)
    {
      v14 = 0;
      v15 = 8;
      do
      {
        objc_opt_class();
        v16 = (void *)TSUDynamicCast();
        if (v16)
        {
          v17 = objc_msgSend(v16, "containedStorage");
          if (v17)
            objc_msgSend(v5, "addObject:", v17);
        }
        ++v14;
        v15 += 16;
      }
      while (v14 < v13->var2);
    }
  }
  return v5;
}

- (id)childCommandForApplyThemeCommand:(id)a3
{
  return 0;
}

- (id)referencedStylesOfClass:(Class)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  TSWPAttributeArray *v9;
  TSWPAttributeArray *v10;
  unint64_t var2;
  unint64_t v12;
  uint64_t v13;

  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  if ((Class)objc_opt_class() == a3)
  {
    v8 = 0;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    v8 = 2;
  }
  else if ((Class)objc_opt_class() == a3)
  {
    v8 = 3;
  }
  else
  {
    if ((Class)objc_opt_class() != a3)
    {
      v6 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v7 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage referencedStylesOfClass:]");
      objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 5674, CFSTR("Unknown style class."));
      return v5;
    }
    v8 = 9;
  }
  v9 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v8);
  if (v9)
  {
    v10 = v9;
    var2 = v9->var2;
    if (var2)
    {
      v12 = 0;
      v13 = 8;
      do
      {
        if (*(_QWORD *)((char *)v10->var4 + v13))
        {
          objc_msgSend(v5, "addObject:");
          var2 = v10->var2;
        }
        ++v12;
        v13 += 16;
      }
      while (v12 < var2);
    }
  }
  return v5;
}

- (id)referencedStyles
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _QWORD v14[4];
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14[0] = objc_opt_class();
  v14[1] = objc_opt_class();
  v14[2] = objc_opt_class();
  v14[3] = objc_opt_class();
  v4 = (void *)objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 4, 0);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "unionSet:", -[TSWPStorage referencedStylesOfClass:](self, "referencedStylesOfClass:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++)));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }
  return v3;
}

- (void)replaceReferencedStylesUsingBlock:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  TSWPAttributeArray *v10;
  _QWORD v11[6];
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = objc_msgSend(&unk_24D8FA3B0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    v8 = MEMORY[0x24BDAC760];
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(&unk_24D8FA3B0);
        v10 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "unsignedIntegerValue"));
        if (v10)
        {
          v11[0] = v8;
          v11[1] = 3221225472;
          v11[2] = __49__TSWPStorage_replaceReferencedStylesUsingBlock___block_invoke;
          v11[3] = &unk_24D82E088;
          v11[4] = a3;
          v11[5] = v10;
          TSWPAttributeArray::enumerateObjectAttributes(v10, (uint64_t)v11);
        }
        ++v9;
      }
      while (v6 != v9);
      v6 = objc_msgSend(&unk_24D8FA3B0, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }
}

void __49__TSWPStorage_replaceReferencedStylesUsingBlock___block_invoke(uint64_t a1, objc_object *a2, uint64_t a3)
{
  objc_object *v6;

  if (a2)
  {
    v6 = (objc_object *)(*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6 != a2)
      TSWPAttributeArray::replaceObjectForAttributeIndex(*(TSWPAttributeArray **)(a1 + 40), v6, a3, 0, 0);
  }
}

- (BOOL)hasVisibleText
{
  unint64_t v3;
  BOOL v4;
  uint64_t v5;
  uint64_t i;
  unsigned int v7;
  unint64_t v9;
  unint64_t v10;
  uint64_t j;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  _WORD v21[8];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = -[TSWPStorage length](self, "length");
  if (v3)
  {
    v4 = v3 > 8;
    if (v3 >= 8)
      v5 = 8;
    else
      v5 = v3;
    -[NSMutableString getCharacters:range:](self->_string, "getCharacters:range:", v21, 0, v5);
    for (i = 0; i != v5; ++i)
    {
      while (1)
      {
        v7 = (unsigned __int16)v21[i];
        if (v7 < 0x20)
          break;
        if (v7 < 0x7F)
          goto LABEL_32;
        v4 = 1;
        if (v5 - 1 == i++)
          goto LABEL_14;
      }
    }
    if (!v4)
    {
LABEL_31:
      LOBYTE(v3) = 0;
      return v3;
    }
LABEL_14:
    if (-[NSMutableString rangeOfCharacterFromSet:options:](self->_string, "rangeOfCharacterFromSet:options:", objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD14A8], "invisibleCharacterSet"), "invertedSet"), 2) != 0x7FFFFFFFFFFFFFFFLL)
    {
LABEL_32:
      LOBYTE(v3) = 1;
      return v3;
    }
    v9 = -[TSWPStorage attachmentCount](self, "attachmentCount");
    if (v9)
    {
      v10 = v9;
      for (j = 0; v10 != j; ++j)
      {
        v12 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", j, 0);
        if (v12)
        {
          v13 = v12;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v14 = (void *)objc_msgSend(v13, "stringEquivalent");
            if (v14 && objc_msgSend(v14, "length"))
              goto LABEL_32;
          }
          else
          {
            objc_opt_class();
            v15 = (void *)TSUDynamicCast();
            if (v15 && !objc_msgSend(v15, "isAnchored"))
              goto LABEL_32;
          }
        }
      }
    }
    v3 = -[TSWPStorage footnoteCount](self, "footnoteCount");
    if (v3)
    {
      v16 = v3;
      v17 = 0;
      while (1)
      {
        v18 = -[TSWPStorage footnoteAtFootnoteIndex:outCharIndex:](self, "footnoteAtFootnoteIndex:outCharIndex:", v17, 0);
        if (v18)
        {
          v19 = (void *)objc_msgSend(v18, "stringEquivalent");
          if (v19)
          {
            if (objc_msgSend(v19, "length"))
              goto LABEL_32;
          }
        }
        if (v16 == ++v17)
          goto LABEL_31;
      }
    }
  }
  return v3;
}

- (BOOL)p_hasGoodAttributesForPlainTextPaste
{
  unint64_t v3;
  BOOL v4;
  TSWPAttributeArray *v5;

  v3 = 0;
  v4 = 0;
  do
  {
    v5 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", dword_217C2B1DC[v3], 0, 0);
    if (v5 && v5->var2)
      break;
    v4 = v3++ > 5;
  }
  while (v3 != 7);
  return v4;
}

- (BOOL)canPasteAsPlainText
{
  TSWPAttributeArray *v3;

  v3 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 0, 0);
  return (!v3 || v3->var2 <= 1)
      && -[TSWPStorage p_hasGoodAttributesForPlainTextPaste](self, "p_hasGoodAttributesForPlainTextPaste");
}

- (BOOL)canPasteAsPlainTextWithUniformParagraphs
{
  TSWPAttributeArray *v3;
  unint64_t var2;
  TSWPAttributeRecord *var4;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  TSWPAttributeArray *v10;

  v3 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 0, 0, 0);
  if (v3)
  {
    var2 = v3->var2;
    if (var2 >= 2)
    {
      var4 = v3->var4;
      v6 = *((_QWORD *)var4 + 1);
      if (*((_QWORD *)var4 + 3) != v6)
        return 0;
      v7 = (uint64_t *)((char *)var4 + 40);
      v8 = 2;
      while (var2 != v8)
      {
        v9 = *v7;
        v7 += 2;
        ++v8;
        if (v9 != v6)
        {
          if (v8 - 1 < var2)
            return 0;
          break;
        }
      }
    }
  }
  v10 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 18, 0, 0);
  if (!v10 || v10->var2 <= 1)
    return -[TSWPStorage p_hasGoodAttributesForPlainTextPaste](self, "p_hasGoodAttributesForPlainTextPaste");
  return 0;
}

- (unint64_t)selectionRangeMaxForCharIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage selectionRangeForCharIndex:](self, "selectionRangeForCharIndex:", a3);
  return v3 + v4;
}

- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5
{
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:", a3.location, a3.length, a4, a4, *(_QWORD *)&a5);
}

- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6
{
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", a3.location, a3.length, a4, a5, *(_QWORD *)&a6, -[TSWPStorage wpKind](self, "wpKind"));
}

- (id)newSubstorageWithRange:(_NSRange)a3 context:(id)a4 flags:(unsigned int)a5 kind:(int)a6
{
  return -[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:](self, "newSubstorageWithRange:storageContext:objectsContext:flags:kind:", a3.location, a3.length, a4, a4, *(_QWORD *)&a5, *(_QWORD *)&a6);
}

- (id)newSubstorageWithRange:(_NSRange)a3 storageContext:(id)a4 objectsContext:(id)a5 flags:(unsigned int)a6 kind:(int)a7
{
  NSUInteger length;
  NSUInteger location;
  id v12;
  id v13;
  id v14;
  int v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  TSWPAttributeArray *v20;
  void *v21;
  uint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  unsigned __int16 v30;
  uint64_t v31;

  length = a3.length;
  location = a3.location;
  if (a3.length)
    v26 = -[NSMutableString substringWithRange:](self->_string, "substringWithRange:", a3.location, a3.length);
  else
    v26 = 0;
  v12 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", location, 0);
  v13 = -[TSWPStorage listStyleAtCharIndex:effectiveRange:](self, "listStyleAtCharIndex:effectiveRange:", location, 0);
  v14 = -[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self, "columnStyleAtCharIndex:effectiveRange:", location, 0);
  v15 = -[TSWPStorage writingDirectionForParagraphAtCharIndex:](self, "writingDirectionForParagraphAtCharIndex:", location);
  v16 = 0;
  v31 = 0;
  v30 = 0;
  if ((a6 & 4) != 0)
  {
    if (-[TSWPStorage supportsSections](self, "supportsSections") && -[TSWPStorage sectionCount](self, "sectionCount"))
      v16 = (id)objc_msgSend(-[TSWPStorage sectionAtCharIndex:effectiveRange:](self, "sectionAtCharIndex:effectiveRange:", location, 0), "copyWithContext:", a4);
    else
      v16 = 0;
  }
  -[TSWPStorage paragraphFlags:andLevel:atCharIndex:](self, "paragraphFlags:andLevel:atCharIndex:", &v30, &v31, location);
  v27 = -[TSWPStorage listStartAtCharIndex:](self, "listStartAtCharIndex:", location);
  LODWORD(v25) = v15;
  v17 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithContext:string:kind:stylesheet:paragraphStyle:listStyle:section:columnStyle:paragraphDirection:", a4, v26, a7, self->_stylesheet, v12, v13, v16, v14, v25);
  objc_msgSend(v17, "setParagraphFlags:level:forCharRange:undoTransaction:", v30, v31, 0, objc_msgSend(v17, "length"), 0);
  if (v27 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v17, "setListStart:forCharRange:undoTransaction:", v27, 0, objc_msgSend(v17, "length"), 0);
  if (objc_msgSend(v17, "supportsSections") && objc_msgSend(v17, "sectionCount"))
    v16 = (id)objc_msgSend(v17, "sectionAtSectionIndex:effectiveRange:", 0, 0);
  objc_msgSend(v17, "filterSectionBreaksFromStorage:undoTransaction:", v17, 0);
  v18 = 0;
  if ((a6 & 8) != 0)
    v18 = +[TSKAddedToDocumentContext changeTrackingSubstorageForCopyContext](TSKAddedToDocumentContext, "changeTrackingSubstorageForCopyContext");
  v19 = 0;
  do
  {
    v20 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v19);
    if (v20)
    {
      LODWORD(v24) = a6;
      -[TSWPStorage transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:](self, "transferAttributeArraySource:forSourceRange:toDestStorage:objectContext:dolcContext:flags:", v20, location, length, v17, a5, v18, v24);
    }
    v19 = (v19 + 1);
  }
  while ((_DWORD)v19 != 19);
  if ((objc_msgSend(v17, "supportsSections") & 1) != 0)
  {
    if (!v16)
      v16 = (id)objc_msgSend(v17, "pDefaultSectionForContext:", objc_msgSend(v17, "context"));
    if (objc_msgSend(v17, "sectionCount"))
    {
      if (v16)
      {
LABEL_25:
        objc_msgSend(v16, "i_ensureHeaderFooterStoragesExistWithStylesheet:", -[TSWPStorage stylesheet](self, "stylesheet"));
        goto LABEL_28;
      }
    }
    else
    {
      objc_msgSend(v17, "insertObject:charIndex:attributeArray:attributeIndex:dolcContext:undoTransaction:", v16, 0, objc_msgSend(v17, "attributeArrayForKind:withCreate:undoTransaction:", 8, 1, 0), 0, v18, 0);
      if (v16)
        goto LABEL_25;
    }
    v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage newSubstorageWithRange:storageContext:objectsContext:flags:kind:]");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage.mm"), 6123, CFSTR("No default section in storage."));
  }
LABEL_28:

  return v17;
}

- (int)compareRange:(_NSRange)a3 otherStorage:(id)a4 otherRange:(_NSRange)a5 options:(unint64_t)a6
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v10;
  NSUInteger v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  int result;
  uint64_t v19;
  TSWPAttributeArray *v20;

  length = a5.length;
  location = a5.location;
  v10 = a3.length;
  v11 = a3.location;
  v13 = objc_msgSend(a4, "range");
  v15 = v14;
  v16 = (void *)objc_msgSend(a4, "string");
  v17 = (uint64_t)v16;
  if (location != v13 || length != v15)
    v17 = objc_msgSend(v16, "substringWithRange:", location, length);
  result = -[NSMutableString compare:options:range:](self->_string, "compare:options:range:", v17, a6, v11, v10);
  if (!result)
  {
    v19 = 0;
    while (1)
    {
      if (v19 < 0xA || v19 <= 0x12 && ((1 << v19) & 0x43800) != 0)
      {
        v20 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v19);
        if (v20)
        {
          result = -[TSWPStorage compareAttributeArray:range:otherStorage:otherRange:](self, "compareAttributeArray:range:otherStorage:otherRange:", v20, v11, v10, a4, location, length);
          if (result)
            break;
        }
      }
      v19 = (v19 + 1);
      if ((_DWORD)v19 == 19)
        return 0;
    }
  }
  return result;
}

- (NSString)debugDescription
{
  id v3;
  uint64_t v4;
  TSWPAttributeArray *v5;
  void *v6;

  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  objc_msgSend(v3, "appendFormat:", CFSTR("%@ Text: '"), -[TSWPStorage description](self, "description"));
  objc_msgSend(v3, "appendString:", self->_string);
  objc_msgSend(v3, "appendString:", CFSTR("'\n"));
  objc_msgSend(v3, "appendString:", CFSTR("Attribute tables:\n"));
  v4 = 0;
  do
  {
    v5 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", v4);
    if (v5)
      v6 = (void *)(*((uint64_t (**)(TSWPAttributeArray *))v5->var0 + 17))(v5);
    else
      v6 = 0;
    if (objc_msgSend(v6, "length"))
      objc_msgSend(v3, "appendString:", v6);
    v4 = (v4 + 1);
  }
  while ((_DWORD)v4 != 19);
  return (NSString *)v3;
}

- (NSString)description
{
  uint64_t WPKind;
  __CFString *v4;

  WPKind = self->_WPKind;
  if ((int)WPKind > 7)
    v4 = (__CFString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("*#$! Unknown WP kind: %d"), WPKind);
  else
    v4 = -[TSWPStorage description]::kinds[WPKind];
  return (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(%@*) %p (length:%lu) kind: %@"), objc_opt_class(), self, -[TSWPStorage characterCount](self, "characterCount"), v4);
}

- (unint64_t)changeCount
{
  return self->_changeCount;
}

- (void)setParentInfo:(id)a3
{
  self->_parentInfo = (TSDContainerInfo *)a3;
}

- (TSDOwningAttachment)owningAttachment
{
  return self->_owningAttachment;
}

- (void)setOwningAttachment:(id)a3
{
  self->_owningAttachment = (TSDOwningAttachment *)a3;
}

- (BOOL)ignoreContentsChangedNotifications
{
  return self->_ignoreContentsChangedNotifications;
}

- (void)setIgnoreContentsChangedNotifications:(BOOL)a3
{
  self->_ignoreContentsChangedNotifications = a3;
}

- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 attributeKind:(unsigned int)a5 dolcContext:(id)a6 undoTransaction:(TSWPStorageTransaction *)a7
{
  id v11;
  uint64_t v12;
  uint64_t v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;

  v11 = -[TSWPStorage smartFieldAtCharIndex:attributeKind:effectiveRange:](self, "smartFieldAtCharIndex:attributeKind:effectiveRange:", a3, *(_QWORD *)&a5, &v16);
  if (v11 && a3 > v16)
  {
    v12 = v17 + v16;
    if (a3 - v16 != v17 && v12 != a3)
    {
      v14 = v12 - a3;
      v15 = (void *)objc_msgSend(v11, "copyWithContext:", -[TSPObject context](self, "context"));
      -[TSWPStorage addSmartField:toRange:dolcContext:undoTransaction:](self, "addSmartField:toRange:dolcContext:undoTransaction:", v15, a3, v14, a6, a7);

    }
  }
}

- (void)splitSmartFieldAtCharIndex:(unint64_t)a3 lengthToInsert:(unint64_t)a4 dolcContext:(id)a5 undoTransaction:(TSWPStorageTransaction *)a6
{
  -[TSWPStorage splitSmartFieldAtCharIndex:lengthToInsert:attributeKind:dolcContext:undoTransaction:](self, "splitSmartFieldAtCharIndex:lengthToInsert:attributeKind:dolcContext:undoTransaction:", a3, a4, 6, a5, a6);
  -[TSWPStorage splitSmartFieldAtCharIndex:lengthToInsert:attributeKind:dolcContext:undoTransaction:](self, "splitSmartFieldAtCharIndex:lengthToInsert:attributeKind:dolcContext:undoTransaction:", a3, a4, 12, a5, a6);
}

- (__CTFont)createFontAtCharIndex:(unint64_t)a3 scaleTextPercent:(unint64_t)a4 effectiveRange:(_NSRange *)a5 styleProvider:(id)a6
{
  return TSWPFastCreateFontForStyle((uint64_t)-[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", a3, 0, 0), (void *)objc_msgSend(a6, "paragraphStyleAtParIndex:effectiveRange:", -[TSWPStorage paragraphIndexAtCharIndex:](self, "paragraphIndexAtCharIndex:", a3), a5), a4);
}

- (void)replaceCharactersInRange:(_NSRange)a3 withString:(id)a4 options:(unint64_t)a5 changedRange:(_NSRange *)a6 changeDelta:(int64_t *)a7 undoTransaction:(TSWPStorageTransaction *)a8 changeSession:(id)a9
{
  NSUInteger length;
  NSUInteger location;
  __CFString *v14;
  void *v15;
  unint64_t v16;

  length = a3.length;
  location = a3.location;
  if (a4)
    v14 = (__CFString *)a4;
  else
    v14 = &stru_24D82FEB0;
  v15 = (void *)-[__CFString stringByCapitalizingToMatchString:range:searchOptions:](v14, "stringByCapitalizingToMatchString:range:searchOptions:", -[TSWPStorage string](self, "string"), a3.location, a3.length, a5);
  v16 = -[TSWPStorage length](self, "length");
  -[TSWPStorage replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:](self, "replaceCharactersInSelection:withString:withFlags:replaceTextData:changeSession:undoTransaction:outInsertedRange:", +[TSWPSelection selectionWithRange:](TSWPSelection, "selectionWithRange:", location, length), v15, 1, 0, a9, a8, 0);
  if (a7)
    *a7 = -[TSWPStorage length](self, "length") - v16;
  if (a6)
  {
    a6->location = location;
    a6->length = objc_msgSend(v15, "length");
  }
}

- (id)valueForBIUProperties:(id)a3 selection:(id)a4 insertionStyle:(id)a5
{
  uint64_t v9;
  id v10;
  id v11;
  unint64_t v12;
  id *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  int v20;
  uint64_t v21;
  int v22;
  void *v25;
  int v26;
  uint64_t v27;
  uint64_t v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v30 = (id)objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v9 = objc_msgSend(a4, "superRange");
  v10 = -[TSWPStorage characterStyleAtCharIndex:left:effectiveRange:](self, "characterStyleAtCharIndex:left:effectiveRange:", v9, objc_msgSend(a4, "isInsertionPoint"), 0);
  v11 = -[TSWPStorage paragraphStyleAtCharIndex:effectiveRange:](self, "paragraphStyleAtCharIndex:effectiveRange:", v9, 0);
  if (a5)
    v12 = 3;
  else
    v12 = 2;
  v13 = (id *)((char *)&v29 - ((8 * (_BYTE)v12 + 15) & 0x30));
  if (a5)
  {
    v13[2] = v11;
  }
  else
  {
    a5 = v10;
    v10 = v11;
  }
  *v13 = a5;
  v13[1] = v10;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v14 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(a3);
        v19 = objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v18), "unsignedIntValue");
        v20 = 8226;
        v21 = 19;
        switch(v19)
        {
          case 0:
            goto LABEL_25;
          case 1:
            v21 = 20;
            goto LABEL_25;
          case 2:
          case 6:
            v22 = TSWPResolveIntPropertyForStyles((uint64_t)&v29 - ((8 * (_BYTE)v12 + 15) & 0x30), v12, 22, 0x80000000);
            if ((v22 & 0x7FFFFFFF) == 0)
              break;
            if ((v19 != 2 || v22 != 1) && (v19 != 6 || v22 != 3))
              break;
            goto LABEL_26;
          case 3:
            v21 = 26;
LABEL_25:
            if ((TSWPResolveIntPropertyForStyles((uint64_t)&v29 - ((8 * (_BYTE)v12 + 15) & 0x30), v12, v21, 0x80000000) & 0x7FFFFFFF) != 0)goto LABEL_26;
            break;
          case 4:
            goto LABEL_30;
          case 5:
            v20 = 65093;
LABEL_30:
            v25 = (void *)TSWPResolvePropertyForStyles((uint64_t)&v29 - ((8 * (_BYTE)v12 + 15) & 0x30), v12, 45, 1);
            if (objc_msgSend(v25, "length") == 1)
              v26 = objc_msgSend(v25, "characterAtIndex:", 0);
            else
              v26 = 0;
            if (v20 == v26)
LABEL_26:
              objc_msgSend(v30, "addIndex:", v16 + v18);
            break;
          default:
            break;
        }
        ++v18;
      }
      while (v15 != v18);
      v27 = objc_msgSend(a3, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
      v15 = v27;
      v16 += v18;
    }
    while (v27);
  }
  return v30;
}

- (BOOL)p_passesExtraTablesChecksForStoringInAStringValueCell
{
  id v4;

  if (-[TSWPStorage paragraphLevelAtCharIndex:](self, "paragraphLevelAtCharIndex:", 0)
    || -[TSWPStorage listStyleCount](self, "listStyleCount") > 1)
  {
    return 0;
  }
  if (-[TSWPStorage listStyleCount](self, "listStyleCount"))
  {
    v4 = -[TSWPStorage listStyleAtCharIndex:effectiveRange:](self, "listStyleAtCharIndex:effectiveRange:", 0, 0);
    if (v4)
      return objc_msgSend(v4, "firstLabelType") == 0;
  }
  return 1;
}

- (BOOL)canBeStoredInAStringValueCell
{
  _BOOL4 v3;

  v3 = -[TSWPStorage canPasteAsPlainTextWithUniformParagraphs](self, "canPasteAsPlainTextWithUniformParagraphs");
  if (v3)
    LOBYTE(v3) = -[TSWPStorage p_passesExtraTablesChecksForStoringInAStringValueCell](self, "p_passesExtraTablesChecksForStoringInAStringValueCell");
  return v3;
}

- (id)valueForBIUProperties:(id)a3
{
  TSWPSelection *v5;
  uint64_t v6;
  uint64_t v7;
  TSWPSelection *v8;
  id v9;

  v5 = [TSWPSelection alloc];
  v6 = -[TSWPStorage range](self, "range");
  v8 = -[TSWPSelection initWithRange:](v5, "initWithRange:", v6, v7);
  v9 = -[TSWPStorage valueForBIUProperties:selection:insertionStyle:](self, "valueForBIUProperties:selection:insertionStyle:", a3, v8, 0);

  return v9;
}

- (_NSRange)rangeForChange:(id)a3
{
  NSUInteger v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _BYTE v10[64];
  _NSRange result;
  _NSRange v12;

  v12.length = -[TSWPStorage length](self, "length");
  v12.location = 0;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v10, self, v12);
  while (1)
  {
    if (!TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v10))
    {
      v5 = 0;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      goto LABEL_7;
    }
    if (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v10) == a3)
      break;
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v10);
  }
  v6 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v10);
  v5 = v7;
LABEL_7:
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v10);
  v8 = v6;
  v9 = v5;
  result.length = v9;
  result.location = v8;
  return result;
}

- (id)changeAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  TSWPAttributeArray *v6;
  unint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  void *v10;

  v6 = self->_attributesTable[a4];
  if (!v6 || !v6->var2)
  {
    if (a5)
    {
      v9 = -[TSWPStorage range](self, "range", a3);
      goto LABEL_8;
    }
    return 0;
  }
  v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(self->_attributesTable[a4], a3);
  if (v7 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v10 = (void *)*((_QWORD *)v6->var4 + 2 * v7 + 1);
    if (!a5)
      return v10;
    v9 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
    goto LABEL_9;
  }
  if (!a5)
    return 0;
  v8 = TSWPAttributeArray::charIndexForAttributeIndex(v6, 0);
  v9 = 0;
LABEL_8:
  v10 = 0;
LABEL_9:
  a5->location = v9;
  a5->length = v8;
  return v10;
}

- (id)changeAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  id result;

  result = -[TSWPStorage changeAtCharIndex:attributeKind:effectiveRange:](self, "changeAtCharIndex:attributeKind:effectiveRange:", a3, 15, a4);
  if (!result)
    return -[TSWPStorage changeAtCharIndex:attributeKind:effectiveRange:](self, "changeAtCharIndex:attributeKind:effectiveRange:", a3, 16, a4);
  return result;
}

- (TSWPRangeVector)deletedRangeVectorInRange:(SEL)a3
{
  NSUInteger length;
  NSUInteger location;
  __compressed_pair<_NSRange *, std::allocator<_NSRange>> *p_end_cap;
  NSRange v8;
  _NSRange *value;
  _NSRange *end;
  _NSRange *v11;
  _NSRange *begin;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  NSRange *v18;
  _NSRange *v19;
  TSWPRangeVector *result;
  _BYTE v21[64];
  NSRange v22;
  NSRange v23;

  length = a4.length;
  location = a4.location;
  retstr->__begin_ = 0;
  retstr->__end_ = 0;
  retstr->__end_cap_.__value_ = 0;
  p_end_cap = &retstr->__end_cap_;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, a4);
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21))
  {
    if (TSWPChangeEnumerator::changeIsDeletion((TSWPChangeEnumerator *)v21))
    {
      v22.location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
      v23.location = location;
      v23.length = length;
      v8 = NSIntersectionRange(v22, v23);
      if (v8.length)
      {
        end = retstr->__end_;
        value = retstr->__end_cap_.__value_;
        if (end >= value)
        {
          begin = retstr->__begin_;
          v13 = end - retstr->__begin_;
          v14 = v13 + 1;
          if ((unint64_t)(v13 + 1) >> 60)
            abort();
          v15 = (char *)value - (char *)begin;
          if (v15 >> 3 > v14)
            v14 = v15 >> 3;
          if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF0)
            v16 = 0xFFFFFFFFFFFFFFFLL;
          else
            v16 = v14;
          if (v16)
          {
            v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLength>>((uint64_t)p_end_cap, v16);
            begin = retstr->__begin_;
            end = retstr->__end_;
          }
          else
          {
            v17 = 0;
          }
          v18 = (NSRange *)&v17[16 * v13];
          *v18 = v8;
          v19 = v18;
          if (end != begin)
          {
            do
            {
              v19[-1] = end[-1];
              --v19;
              --end;
            }
            while (end != begin);
            begin = retstr->__begin_;
          }
          v11 = v18 + 1;
          retstr->__begin_ = v19;
          retstr->__end_ = v18 + 1;
          retstr->__end_cap_.__value_ = (_NSRange *)&v17[16 * v16];
          if (begin)
            operator delete(begin);
        }
        else
        {
          *end = v8;
          v11 = end + 1;
        }
        retstr->__end_ = v11;
      }
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v21);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  return result;
}

- (id)deletedRangesInRange:(_NSRange)a3
{
  void *v3;
  TSWPRangeArray *v4;
  void *v6;
  void *v7;

  if (!self)
    return 0;
  -[TSWPStorage deletedRangeVectorInRange:](self, "deletedRangeVectorInRange:", a3.location, a3.length);
  v3 = v6;
  if (v7 != v6)
  {
    v4 = -[TSWPRangeArray initWithRangeVector:]([TSWPRangeArray alloc], "initWithRangeVector:", &v6);
    v3 = v6;
    if (!v6)
      return v4;
    goto LABEL_7;
  }
  v4 = 0;
  if (v6)
  {
LABEL_7:
    v7 = v3;
    operator delete(v3);
  }
  return v4;
}

- (id)hiddenRangesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPRangeArray *v5;
  NSRange v6;
  _BYTE v8[64];
  NSRange v9;
  NSRange v10;

  length = a3.length;
  location = a3.location;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v8, self, a3);
  v5 = 0;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v8))
  {
    if (TSWPChangeEnumerator::changeIsHidden((TSWPChangeEnumerator *)v8))
    {
      v9.location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v8);
      v10.location = location;
      v10.length = length;
      v6 = NSIntersectionRange(v9, v10);
      if (v6.length)
      {
        if (!v5)
          v5 = objc_alloc_init(TSWPRangeArray);
        -[TSWPRangeArray addRange:](v5, "addRange:", v6.location, v6.length);
      }
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v8);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v8);
  return v5;
}

- (id)visibleRangesInRange:(_NSRange)a3
{
  NSUInteger v4;
  TSWPRangeArray *v5;
  _NSRange v7;
  _BYTE v8[64];
  TSWPRangeVector v9;
  _NSRange v10;

  v10 = a3;
  TSWPRangeVector::TSWPRangeVector(&v9, &v10);
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v8, self, v10);
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v8))
  {
    if (TSWPChangeEnumerator::changeIsHidden((TSWPChangeEnumerator *)v8))
    {
      v7.location = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v8);
      v7.length = v4;
      TSWPRangeVector::removeRange(&v9, &v7);
    }
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v8);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v8);
  v5 = -[TSWPRangeArray initWithRangeVector:]([TSWPRangeArray alloc], "initWithRangeVector:", &v9);
  if (v9.__begin_)
  {
    v9.__end_ = v9.__begin_;
    operator delete(v9.__begin_);
  }
  return v5;
}

- (BOOL)p_hasDeletedTextAtCharIndex:(unint64_t)a3 requireHidden:(BOOL)a4 range:(_NSRange *)a5
{
  _BOOL4 v6;
  TSWPChangeAttributeArray *v8;
  TSWPAttributeArray *v9;
  unint64_t v10;
  unint64_t v11;
  NSUInteger v12;
  NSUInteger v13;

  v6 = a4;
  v8 = -[TSWPStorage deletionChangesTable](self, "deletionChangesTable");
  if (v8)
  {
    v9 = (TSWPAttributeArray *)v8;
    v10 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)v8, a3);
    if (v10 > 0x7FFFFFFFFFFFFFFELL)
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v11 = v10;
      v8 = (TSWPChangeAttributeArray *)*((_QWORD *)v9->var4 + 2 * v10 + 1);
      if (v8)
      {
        if (!v6 || (LODWORD(v8) = -[TSWPChangeAttributeArray isHidden](v8, "isHidden"), (_DWORD)v8))
        {
          v13 = TSWPAttributeArray::rangeForAttributeIndex(v9, v11);
          LODWORD(v8) = a3 >= v13 && a3 - v13 < v12;
          if (a5 && (_DWORD)v8)
          {
            a5->location = v13;
            a5->length = v12;
            LOBYTE(v8) = 1;
          }
        }
      }
    }
  }
  return (char)v8;
}

- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3
{
  return -[TSWPStorage p_hasDeletedTextAtCharIndex:requireHidden:range:](self, "p_hasDeletedTextAtCharIndex:requireHidden:range:", a3, 1, 0);
}

- (BOOL)hasHiddenTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  return -[TSWPStorage p_hasDeletedTextAtCharIndex:requireHidden:range:](self, "p_hasDeletedTextAtCharIndex:requireHidden:range:", a3, 1, a4);
}

- (BOOL)hasDeletedTextAtCharIndex:(unint64_t)a3 range:(_NSRange *)a4
{
  return -[TSWPStorage p_hasDeletedTextAtCharIndex:requireHidden:range:](self, "p_hasDeletedTextAtCharIndex:requireHidden:range:", a3, 0, a4);
}

- (BOOL)hasVisibleTextAtCharIndex:(unint64_t)a3
{
  return !-[TSWPStorage hasHiddenTextAtCharIndex:](self, "hasHiddenTextAtCharIndex:", a3);
}

- (unint64_t)p_indexOfFirstNonDeletedCharInRange:(_NSRange)a3 requireVisible:(BOOL)a4
{
  _BOOL4 v4;
  NSUInteger location;
  TSWPChangeAttributeArray *v6;
  TSWPAttributeArray *v7;
  unint64_t v8;
  uint64_t v9;
  TSWPAttributeArray *v10;
  NSUInteger v11;
  TSWPAttributeArray *v13;
  uint64_t v14;
  TSWPAttributeArray *v15;
  unint64_t v16;
  _NSRange v17;

  v4 = a4;
  location = a3.location;
  v17 = a3;
  v6 = -[TSWPStorage deletionChangesTable](self, "deletionChangesTable");
  if (v6)
  {
    v7 = (TSWPAttributeArray *)v6;
    TSWPAttributeArray::begin((TSWPAttributeArray *)v6, &v17, &v15);
    TSWPAttributeArray::end(v7, &v17, &v13);
    v8 = v16;
    v9 = v14;
    if (v16 != v14)
    {
      while (1)
      {
        v10 = v15;
        if (!*((_QWORD *)v15->var4 + 2 * v8 + 1))
          break;
        if (v4)
        {
          if ((objc_msgSend(*((id *)v15->var4 + 2 * v8 + 1), "isHidden") & 1) == 0)
          {
            v10 = v15;
            v8 = v16;
            break;
          }
          v8 = v16;
          v9 = v14;
        }
        v16 = ++v8;
        if (v8 == v9)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      v11 = v17.location;
      if (v11 <= TSWPAttributeArray::rangeForAttributeIndex(v10, v8))
        return TSWPAttributeArray::rangeForAttributeIndex(v15, v16);
      else
        return v17.location;
    }
  }
  return location;
}

- (unint64_t)indexOfFirstVisibleCharInRange:(_NSRange)a3
{
  return -[TSWPStorage p_indexOfFirstNonDeletedCharInRange:requireVisible:](self, "p_indexOfFirstNonDeletedCharInRange:requireVisible:", a3.location, a3.length, 1);
}

- (unint64_t)indexOfFirstNonDeletedCharInRange:(_NSRange)a3
{
  return -[TSWPStorage p_indexOfFirstNonDeletedCharInRange:requireVisible:](self, "p_indexOfFirstNonDeletedCharInRange:requireVisible:", a3.location, a3.length, 0);
}

- (unint64_t)indexAfterLastVisibleCharInRange:(_NSRange)a3
{
  unint64_t v3;
  TSWPChangeAttributeArray *v4;
  TSWPAttributeArray *v5;
  unint64_t v6;
  unint64_t v7;
  TSWPAttributeArray *v8;
  uint64_t v9;
  uint64_t v10;
  TSWPAttributeArray *v12;
  uint64_t v13;
  TSWPAttributeArray *v14;
  unint64_t v15;
  _NSRange v16;

  v16 = a3;
  v3 = a3.length + a3.location;
  v4 = -[TSWPStorage deletionChangesTable](self, "deletionChangesTable");
  if (v4)
  {
    v5 = (TSWPAttributeArray *)v4;
    TSWPAttributeArray::end((TSWPAttributeArray *)v4, &v16, &v14);
    TSWPAttributeArray::begin(v5, &v16, &v12);
    v6 = v15;
    if (v15 != v13)
    {
      while (1)
      {
        if (v6)
        {
          v7 = v6 - 1;
          v15 = v6 - 1;
        }
        else
        {
          v7 = 0;
        }
        v8 = v14;
        if (!*((_QWORD *)v14->var4 + 2 * v7 + 1))
          break;
        if ((objc_msgSend(*((id *)v14->var4 + 2 * v7 + 1), "isHidden") & 1) == 0)
        {
          v8 = v14;
          v7 = v15;
          break;
        }
        v6 = v15;
        if (v15 == v13)
          return 0x7FFFFFFFFFFFFFFFLL;
      }
      v3 = v16.length + v16.location;
      v9 = TSWPAttributeArray::rangeForAttributeIndex(v8, v7);
      if (v9 + v10 < v3)
        return v9 + v10;
    }
  }
  return v3;
}

- (BOOL)hasDeletionInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  TSWPChangeAttributeArray *v5;
  TSWPAttributeArray *v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v9;

  length = a3.length;
  location = a3.location;
  v5 = -[TSWPStorage deletionChangesTable](self, "deletionChangesTable");
  if (v5)
  {
    v6 = (TSWPAttributeArray *)v5;
    v7 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex((TSWPAttributeArray *)v5, location);
    if (*((_QWORD *)v6->var4 + 2 * v7 + 1))
    {
      LOBYTE(v5) = 1;
    }
    else
    {
      v8 = TSWPAttributeArray::rangeForAttributeIndex(v6, v7);
      LOBYTE(v5) = v8 > location || v8 + v9 < location + length;
    }
  }
  return (char)v5;
}

- (void)applyChange:(id)a3 changeRange:(_NSRange)a4 accept:(BOOL)a5 undoTransaction:(void *)a6
{
  _BOOL4 v7;
  NSUInteger length;
  NSUInteger location;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  v7 = a5;
  length = a4.length;
  location = a4.location;
  if ((objc_msgSend(a3, "isInsertion") & 1) == 0 && (objc_msgSend(a3, "isDeletion") & 1) == 0)
  {
    v12 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) applyChange:changeRange:accept:undoTransaction:]");
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 361, CFSTR("unknown change kind"));
  }
  if ((objc_msgSend(a3, "isInsertion") & 1) != 0 || objc_msgSend(a3, "isDeletion"))
  {
    if (objc_msgSend(a3, "isInsertion"))
      v14 = 15;
    else
      v14 = 16;
    -[TSWPStorage applyObject:toCharRange:forKind:dolcContext:undoTransaction:](self, "applyObject:toCharRange:forKind:dolcContext:undoTransaction:", 0, location, length, v14, 0, a6);
    if (v7)
    {
      if ((objc_msgSend(a3, "isInsertion") & 1) != 0 || (objc_msgSend(a3, "isDeletion") & 1) == 0)
        return;
LABEL_15:
      -[TSWPStorage deleteRange:undoTransaction:](self, "deleteRange:undoTransaction:", location, length, a6);
      return;
    }
    if ((objc_msgSend(a3, "isDeletion") & 1) == 0 && objc_msgSend(a3, "isInsertion"))
      goto LABEL_15;
  }
}

- (void)applyChanges:(BOOL)a3 inRange:(_NSRange)a4 inSelectionRange:(_NSRange)a5 outChangedRange:(_NSRange *)a6 outSelectionRange:(_NSRange *)a7 undoTransaction:(void *)a8 forceAll:(BOOL)a9
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v11;
  NSUInteger v12;
  _BOOL8 v13;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  NSUInteger v18;
  NSUInteger v19;
  NSUInteger v20;
  TSWPAttributeArray **v21;
  TSWPAttributeArray **v22;
  NSUInteger v23;
  NSUInteger v24;
  NSUInteger v25;
  NSUInteger v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t j;
  void *v36;
  uint64_t v37;
  unint64_t v38;
  NSUInteger v39;
  NSUInteger v40;
  void *v41;
  uint64_t v42;
  NSUInteger v43;
  NSUInteger v44;
  NSUInteger v45;
  NSUInteger v46;
  NSUInteger v47;
  NSUInteger v48;
  _NSRange *v49;
  NSUInteger *v50;
  NSUInteger v51;
  NSUInteger v52;
  TSWPAttributeArray **v53;
  NSUInteger range1;
  TSWPAttributeArray **v55;
  NSUInteger range2;
  NSUInteger v57;
  _BYTE v58[12];
  uint64_t v59;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[64];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;
  NSRange v73;
  NSRange v74;
  NSRange v75;
  NSRange v76;
  NSRange v77;
  NSRange v78;
  NSRange v79;
  NSRange v80;
  _NSRange v81;
  NSRange v82;
  NSRange v83;
  NSRange v84;
  NSRange v85;
  NSRange v86;
  NSRange v87;
  NSRange v88;
  NSRange v89;
  NSRange v90;

  length = a5.length;
  location = a5.location;
  v11 = a4.length;
  v12 = a4.location;
  v13 = a3;
  v72 = *MEMORY[0x24BDAC8D0];
  *a6 = a4;
  *a7 = a5;
  v49 = a7;
  v15 = *MEMORY[0x24BEB3BF0];
  v16 = *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8);
  v17 = (void *)objc_opt_new();
  v81.location = v12;
  v81.length = v11;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v69, self, v81);
  v53 = 0;
  v55 = 0;
  *(_DWORD *)&v58[8] = 0;
  v59 = 0;
  *(_QWORD *)v58 = a9;
  range2 = length;
  v57 = location + length;
  v51 = v16;
  v52 = v15;
  range1 = v16;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v69))
  {
    v18 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v69);
    v20 = v19;
    v82.location = v18;
    v82.length = v19;
    *a6 = NSUnionRange(*a6, v82);
    v21 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v69);
    v22 = v21;
    if (v13)
    {
      if ((objc_msgSend(v21, "isDeletion") & 1) == 0)
        goto LABEL_8;
LABEL_7:
      v73.location = v18;
      v73.length = v20;
      v83.location = 0;
      v83.length = location;
      v23 = NSIntersectionRange(v73, v83).length;
      v74.location = v18;
      v74.length = v20;
      v84.location = location;
      v84.length = range2;
      v59 -= v23;
      *(_QWORD *)&v58[4] -= NSIntersectionRange(v74, v84).length;
      goto LABEL_8;
    }
    if (objc_msgSend(v21, "isInsertion"))
      goto LABEL_7;
LABEL_8:
    if (!a9 && v18 <= location && v18 + v20 >= v57)
    {
      if (objc_msgSend(v22, "isDeletion"))
      {
        v55 = v22;
        v15 = v18;
        range1 = v20;
      }
      else if (objc_msgSend(v22, "isInsertion"))
      {
        v53 = v22;
        v51 = v20;
        v52 = v18;
      }
    }
    objc_msgSend(v17, "addObject:", v22, v49);
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v69);
  }
  if (v55)
  {
    a6->location = v15;
    a6->length = range1;
    if (v13)
    {
      v75.location = v15;
      v75.length = range1;
      v85.location = 0;
      v85.length = location;
      v24 = NSIntersectionRange(v75, v85).length;
      v76.location = v15;
      v76.length = range1;
      v86.location = location;
      v86.length = range2;
      v59 = -(uint64_t)v24;
      *(_QWORD *)&v58[4] = -(uint64_t)NSIntersectionRange(v76, v86).length;
    }
    else
    {
      *(_QWORD *)&v58[4] = 0;
      v59 = 0;
    }
    objc_msgSend(v17, "removeAllObjects", v49);
    objc_msgSend(v17, "addObject:", v55);
  }
  else if (v53)
  {
    a6->location = v52;
    a6->length = v51;
    if (v13)
    {
      *(_QWORD *)&v58[4] = 0;
      v59 = 0;
    }
    else
    {
      v77.location = v52;
      v77.length = v51;
      v87.location = 0;
      v87.length = location;
      v25 = NSIntersectionRange(v77, v87).length;
      v78.location = v52;
      v78.length = v51;
      v88.location = location;
      v88.length = range2;
      v59 = -(uint64_t)v25;
      *(_QWORD *)&v58[4] = -(uint64_t)NSIntersectionRange(v78, v88).length;
    }
    objc_msgSend(v17, "removeAllObjects", v49);
    objc_msgSend(v17, "addObject:", v53);
  }

  if (v49->location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v26 = v49->length + *(_QWORD *)&v58[4];
    v49->location += v59;
    v49->length = v26;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v71, 16, v49);
  if (v27)
  {
    v28 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v27; ++i)
      {
        if (*(_QWORD *)v66 != v28)
          objc_enumerationMutation(v17);
        v30 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        if (objc_msgSend(v30, "isInsertion"))
        {
          v31 = -[TSWPStorage rangeForChange:](self, "rangeForChange:", v30);
          -[TSWPStorage applyChange:changeRange:accept:undoTransaction:](self, "applyChange:changeRange:accept:undoTransaction:", v30, v31, v32, v13, a8);
        }
      }
      v27 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v27);
  }
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
  if (v33)
  {
    v34 = *(_QWORD *)v62;
    do
    {
      for (j = 0; j != v33; ++j)
      {
        if (*(_QWORD *)v62 != v34)
          objc_enumerationMutation(v17);
        v36 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * j);
        if (objc_msgSend(v36, "isDeletion"))
        {
          v38 = -[TSWPStorage rangeForChange:](self, "rangeForChange:", v36);
          if (v38 <= 0x7FFFFFFFFFFFFFFELL)
            -[TSWPStorage applyChange:changeRange:accept:undoTransaction:](self, "applyChange:changeRange:accept:undoTransaction:", v36, v38, v37, v13, a8);
        }
      }
      v33 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
    }
    while (v33);
  }
  if (*v50 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v40 = v50[1];
    v39 = *v50;
    if (v40 + v39 > -[TSWPStorage length](self, "length"))
    {
      v41 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v42 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) applyChanges:inRange:inSelectionRange:outChangedRange:outSelectionRange:undoTransaction:forceAll:]");
      objc_msgSend(v41, "handleFailureInFunction:file:lineNumber:description:", v42, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 491, CFSTR("bad selection range"));
      v43 = *v50;
      v44 = v50[1];
      v89.location = -[TSWPStorage range](self, "range");
      v89.length = v45;
      v79.location = v43;
      v79.length = v44;
      *(NSRange *)v50 = NSIntersectionRange(v79, v89);
    }
  }
  v46 = a6->location;
  if (a6->location != 0x7FFFFFFFFFFFFFFFLL)
  {
    v47 = a6->length;
    v90.location = -[TSWPStorage range](self, "range");
    v90.length = v48;
    v80.location = v46;
    v80.length = v47;
    *a6 = NSIntersectionRange(v80, v90);
  }

  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v69);
}

- (id)nextChangeFromCharIndex:(unint64_t)a3 afterChange:(id)a4 changeRange:(_NSRange *)a5
{
  NSUInteger v9;
  unint64_t v10;
  _NSRange v11;
  NSUInteger v12;
  TSWPAttributeArray **v13;
  NSUInteger v14;
  BOOL v15;
  BOOL v16;
  NSUInteger v17;
  NSUInteger v18;
  NSUInteger v19;
  _BYTE v21[64];
  _NSRange v22;

  v9 = -[TSWPStorage length](self, "length");
  if (v9 <= a3)
    v10 = a3;
  else
    v10 = v9;
  if (v9 >= a3)
    v11.location = a3;
  else
    v11.location = v9;
  v11.length = v10 - v11.location;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, v11);
  v12 = 0;
  v13 = 0;
  v14 = 0x7FFFFFFFFFFFFFFFLL;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21))
  {
    v15 = !a4 || v13 == a4;
    v16 = !v15;
    v13 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21);
    v14 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
    v12 = v17;
    if (!v16)
      break;
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v21);
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  if (v13 == a4)
  {
    v22.location = -[TSWPStorage range](self, "range");
    v22.length = v18;
    TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v21, self, v22);
    v13 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v21);
    v14 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v21);
    v12 = v19;
    TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v21);
  }
  if (a5)
  {
    a5->location = v14;
    a5->length = v12;
  }
  return v13;
}

- (id)previousChangeFromCharIndex:(unint64_t)a3 beforeChange:(id)a4 changeRange:(_NSRange *)a5
{
  NSUInteger v9;
  TSWPAttributeArray **v10;
  NSUInteger v11;
  TSWPAttributeArray **v12;
  unint64_t v13;
  NSUInteger v14;
  NSUInteger v15;
  NSUInteger v16;
  NSUInteger v17;
  NSUInteger v18;
  _BYTE v20[64];
  _NSRange v21;
  _NSRange v22;

  v21.location = 0;
  v21.length = a3;
  TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v20, self, v21);
  v9 = 0;
  v10 = 0;
  v11 = 0x7FFFFFFFFFFFFFFFLL;
  while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20))
  {
    v12 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20);
    v13 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v20);
    if (v12 == a4)
      break;
    v15 = v13;
    if (v13 > a3)
      break;
    v16 = v14;
    TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v20);
    v9 = v16;
    v11 = v15;
    v10 = v12;
  }
  TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v20);
  if (!v10)
  {
    v22.location = -[TSWPStorage range](self, "range");
    v22.length = v17;
    TSWPChangeEnumerator::TSWPChangeEnumerator((TSWPChangeEnumerator *)v20, self, v22);
    while (TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20))
    {
      v10 = TSWPChangeEnumerator::change((TSWPChangeEnumerator *)v20);
      v11 = TSWPChangeEnumerator::changeRange((TSWPChangeEnumerator *)v20);
      v9 = v18;
      TSWPChangeEnumerator::operator++((TSWPChangeEnumerator *)v20);
    }
    TSWPChangeEnumerator::~TSWPChangeEnumerator((TSWPChangeEnumerator *)v20);
  }
  if (a5)
  {
    a5->location = v11;
    a5->length = v9;
  }
  return v10;
}

- (id)changeDetailsAtCharIndex:(unint64_t)a3 outRange:(_NSRange *)a4
{
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSRange v13;

  if (-[TSWPStorage range](self, "range") > a3 || (v7 = -[TSWPStorage range](self, "range"), v7 + v8 < a3))
  {
    v9 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v10 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) changeDetailsAtCharIndex:outRange:]");
    v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm");
    v13.location = -[TSWPStorage range](self, "range");
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, v11, 592, CFSTR("charIndex %lu not within storage range %@"), a3, NSStringFromRange(v13));
  }
  return -[TSWPStorage changeDetailsForChange:withRange:](self, "changeDetailsForChange:withRange:", -[TSWPStorage changeAtCharIndex:outRange:](self, "changeAtCharIndex:outRange:", a3, a4), a4->location, a4->length);
}

- (id)changeDetailsForChange:(id)a3 withRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  const __CFString *v24;
  uint64_t v25;

  length = a4.length;
  location = a4.location;
  if (a3)
  {
    if (a4.length)
      goto LABEL_3;
  }
  else
  {
    v14 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v15 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]");
    objc_msgSend(v14, "handleFailureInFunction:file:lineNumber:description:", v15, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 602, CFSTR("invalid nil value for '%s'"), "change");
    if (length)
      goto LABEL_3;
  }
  v16 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v17 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]");
  objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 603, CFSTR("Should have a change range greater than 0"));
LABEL_3:
  v8 = -[TSWPStorage substringWithRange:](self, "substringWithRange:", location, length);
  v9 = objc_msgSend(v8, "length");
  if (!v9)
  {
    v18 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v19 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(ChangeTracking) changeDetailsForChange:withRange:]");
    objc_msgSend(v18, "handleFailureInFunction:file:lineNumber:description:", v19, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPStorage_changeTracking.mm"), 609, CFSTR("change text length should be greater than 0"));
    v20 = TSWPFullNameForCharacter(0, 0);
    goto LABEL_21;
  }
  v10 = v9;
  v11 = objc_msgSend(v8, "characterAtIndex:", 0);
  v12 = v10 != 1;
  if (v10 == 1)
  {
    v12 = 0;
LABEL_13:
    v21 = TSWPFullNameForCharacter(v11, v12);
    if (v11 != 10)
      goto LABEL_22;
    v22 = -[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self, "columnStyleAtCharIndex:effectiveRange:", location, 0);
    if (v22 == -[TSWPStorage columnStyleAtCharIndex:effectiveRange:](self, "columnStyleAtCharIndex:effectiveRange:", location + 1, 0))goto LABEL_22;
    v23 = (void *)TSWPBundle();
    if (v12)
      v24 = CFSTR("Layout Breaks");
    else
      v24 = CFSTR("Layout Break");
    v20 = objc_msgSend(v23, "localizedStringForKey:value:table:", v24, &stru_24D82FEB0, CFSTR("TSText"));
LABEL_21:
    v21 = v20;
LABEL_22:
    if ((objc_msgSend(a3, "isInsertion") & 1) == 0)
      goto LABEL_25;
    if (v21)
    {
      v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Added: %@"), &stru_24D82FEB0, CFSTR("TSText")), v21);
      return -[TSWPChangeDetails initWithChange:changeString:]([TSWPChangeDetails alloc], "initWithChange:changeString:", a3, v25);
    }
LABEL_29:
    v25 = objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Added Text"), &stru_24D82FEB0, CFSTR("TSText"));
    return -[TSWPChangeDetails initWithChange:changeString:]([TSWPChangeDetails alloc], "initWithChange:changeString:", a3, v25);
  }
  v13 = 1;
  while (v11 == objc_msgSend(v8, "characterAtIndex:", v13))
  {
    if (v10 == ++v13)
      goto LABEL_13;
  }
  if ((objc_msgSend(a3, "isInsertion") & 1) != 0)
    goto LABEL_29;
  v21 = 0;
LABEL_25:
  if (v21)
    v8 = (id)v21;
  v25 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", objc_msgSend((id)TSWPBundle(), "localizedStringForKey:value:table:", CFSTR("Deleted: %@"), &stru_24D82FEB0, CFSTR("TSText")), v8);
  return -[TSWPChangeDetails initWithChange:changeString:]([TSWPChangeDetails alloc], "initWithChange:changeString:", a3, v25);
}

- (_NSRange)rangeForTrackedChanges:(id)a3
{
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  v5 = objc_msgSend(a3, "range");
  v7 = v6;
  if (objc_msgSend(a3, "isInsertionPoint"))
  {
    v8 = -[TSWPStorage rangeForSelectionWithInsertionSelection:](self, "rangeForSelectionWithInsertionSelection:", a3);
    if (objc_msgSend(a3, "start") == v8 + v9)
    {
      if (objc_msgSend(a3, "start"))
        v5 = objc_msgSend(a3, "start") - 1;
      else
        v5 = 0;
    }
  }
  v10 = v5;
  v11 = v7;
  result.length = v11;
  result.location = v10;
  return result;
}

- (BOOL)selectionContainsVisibleTrackedChanges:(id)a3
{
  int v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  id v9;
  id v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v5 = objc_msgSend(a3, "isValid");
  if (v5)
  {
    v5 = -[TSWPStorage hasTrackedChanges](self, "hasTrackedChanges");
    if (v5)
    {
      v6 = -[TSWPStorage rangeForTrackedChanges:](self, "rangeForTrackedChanges:", a3);
      v8 = v6 + v7;
      while (1)
      {
        v9 = -[TSWPStorage changeAtCharIndex:attributeKind:effectiveRange:](self, "changeAtCharIndex:attributeKind:effectiveRange:", v6, 15, &v14);
        v10 = -[TSWPStorage changeAtCharIndex:attributeKind:effectiveRange:](self, "changeAtCharIndex:attributeKind:effectiveRange:", v6, 16, &v12);
        if (v9)
        {
          if ((objc_msgSend(v9, "isHidden") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
          }
        }
        if (v10)
        {
          if ((objc_msgSend(v10, "isHidden") & 1) == 0)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              break;
          }
        }
        if (v13 + v12 >= (unint64_t)(v15 + v14))
          v6 = v15 + v14;
        else
          v6 = v13 + v12;
        if (v6 >= v8)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
      }
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)changeViewSettingsDidChange
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[TSWPStorage range](self, "range");
  -[TSWPStorage p_didChangeRange:delta:broadcastKind:](self, "p_didChangeRange:delta:broadcastKind:", v3, v4, 0, 0);
}

- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4
{
  return -[TSWPStorage firstHighlightForSelectionRange:outRange:requireComment:](self, "firstHighlightForSelectionRange:outRange:requireComment:", a3.location, a3.length, a4, 0);
}

- (id)firstHighlightForSelectionRange:(_NSRange)a3 outRange:(_NSRange *)a4 requireComment:(BOOL)a5
{
  return 0;
}

- (BOOL)highlightsAllowed
{
  unsigned int v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  TSKDocumentRoot *documentRoot;

  v3 = -[TSWPStorage wpKind](self, "wpKind");
  LOBYTE(v4) = (v3 & 0xFFFFFFFD) == 0 || v3 == 3;
  if (v3 <= 3 && v3 != 1)
  {
    objc_opt_class();
    -[TSWPStorage parentInfo](self, "parentInfo");
    v5 = (void *)TSUDynamicCast();
    if (v5)
    {
      v6 = v5;
      if (objc_msgSend(v5, "supportsAttachedComments"))
      {
        documentRoot = self->_documentRoot;
        if (documentRoot)
          return !-[TSKDocumentRoot documentDisallowsHighlightsOnStorage:](documentRoot, "documentDisallowsHighlightsOnStorage:", v6);
        else
          LOBYTE(v4) = 1;
      }
      else
      {
        LOBYTE(v4) = 0;
      }
    }
  }
  return v4;
}

- (id)editableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 selectionIsOnEdge:(BOOL *)a6
{
  return 0;
}

- (BOOL)p_shouldInsertionSplitChange:(id)a3 changeSession:(id)a4
{
  if (a4)
    return objc_msgSend(a3, "canMergeWithKind:session:", 1) ^ 1;
  else
    return 1;
}

- (void)stashBroadcaster
{
  if (!objc_getAssociatedObject(self, "TSTStorageBroadcaster_Key"))
  {
    objc_setAssociatedObject(self, "TSTStorageBroadcaster_Key", self->_broadcaster, (void *)0x301);
    self->_broadcaster = 0;
  }
}

- (void)unstashBroadcaster
{
  TSWPStorageBroadcaster *AssociatedObject;
  TSWPStorageBroadcaster *v4;
  void *v5;
  uint64_t v6;
  TSWPStorageBroadcaster *broadcaster;

  AssociatedObject = (TSWPStorageBroadcaster *)objc_getAssociatedObject(self, "TSTStorageBroadcaster_Key");
  if (AssociatedObject)
  {
    v4 = AssociatedObject;
    if (self->_broadcaster)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TablesAdditions) unstashBroadcaster]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 82, CFSTR("swapping in the stashed broadcaster, so the real one should be nil!"));
      broadcaster = self->_broadcaster;
      if (broadcaster)

    }
    self->_broadcaster = v4;
    objc_setAssociatedObject(self, "TSTStorageBroadcaster_Key", 0, (void *)0x301);
  }
}

- ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)hyperlinkCellID
{
  TSWPAttributeArray *v2;
  TSWPAttributeArray *v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  void *v10;
  uint64_t v11;

  v2 = -[TSWPStorage attributeArrayForKind:](self, "attributeArrayForKind:", 10);
  if (v2)
  {
    v3 = v2;
    v4 = TSWPAttributeArray::effectiveAttributeIndexForCharIndex(v2, 0);
    if (v4 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v5 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v6 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TablesAdditions) hyperlinkCellID]");
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 101, CFSTR("cell attribute array should not be empty"));
    }
    v7 = (uint64_t)v3->var4 + 16 * v4;
    v8 = *(unsigned __int16 *)(v7 + 8);
    v9 = *(unsigned __int16 *)(v7 + 10);
    if (v9 >= 0x100)
    {
      v10 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
      v11 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPStorage(TablesAdditions) hyperlinkCellID]");
      objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/tables/TSWPStorage_TablesAdditions.mm"), 105, CFSTR("Out-of-bounds type assignment was clamped to max"));
      LOBYTE(v9) = -1;
    }
  }
  else
  {
    LOBYTE(v9) = -1;
    v8 = 0xFFFF;
  }
  return ($2F2D2FE54C0B9D2AA4EBD8788136C7D0)(v8 & 0xFF00FFFF | (v9 << 16));
}

- (void)setHyperlinkCellID:(id)a3
{
  int v4;
  TSWPAttributeArray *v5;
  TSWPAttributeArray *v6;
  uint64_t v7;
  int v8;

  v4 = *(_DWORD *)&a3 & 0xFFFFFF;
  if ((-[TSWPStorage hyperlinkCellID](self, "hyperlinkCellID") & 0xFFFFFF) != (*(_DWORD *)&a3 & 0xFFFFFF))
  {
    v5 = -[TSWPStorage attributeArrayForKind:withCreate:undoTransaction:](self, "attributeArrayForKind:withCreate:undoTransaction:", 10, 1, 0);
    if (v5)
    {
      v6 = v5;
      (*((void (**)(TSWPAttributeArray *, _QWORD, unint64_t, _QWORD))v5->var0 + 7))(v5, 0, v5->var2, 0);
      v7 = 0;
      v8 = v4;
      TSWPAttributeArray::insertAttribute(v6, (const TSWPAttributeRecord *)&v7, 0, 0, 0);
    }
  }
}

- (BOOL)changesWithPageCount
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  unint64_t v6;
  int v7;

  v3 = -[TSWPStorage attachmentCount](self, "attachmentCount");
  if (v3)
  {
    v4 = v3;
    if ((objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", 0, 0), "changesWithPageCount") & 1) != 0)
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      v5 = 1;
      do
      {
        v6 = v5;
        if (v4 == v5)
          break;
        v7 = objc_msgSend(-[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v5, 0), "changesWithPageCount");
        v5 = v6 + 1;
      }
      while (!v7);
      LOBYTE(v3) = v6 < v4;
    }
  }
  return v3;
}

- (BOOL)hasAttachmentsThatChangeWithPageNumberOrPageCount
{
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  id v6;

  v3 = -[TSWPStorage attachmentCount](self, "attachmentCount");
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      v6 = -[TSWPStorage attachmentAtAttachmentIndex:outCharIndex:](self, "attachmentAtAttachmentIndex:outCharIndex:", v5, 0);
      if ((objc_msgSend(v6, "changesWithPageNumber") & 1) != 0
        || objc_msgSend(v6, "changesWithPageCount"))
      {
        break;
      }
      if (v4 == ++v5)
      {
        LOBYTE(v3) = 0;
        return v3;
      }
    }
    LOBYTE(v3) = 1;
  }
  return v3;
}

@end
