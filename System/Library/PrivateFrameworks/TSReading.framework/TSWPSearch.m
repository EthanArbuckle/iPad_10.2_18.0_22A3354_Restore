@implementation TSWPSearch

- (TSWPSearch)initWithString:(id)a3 options:(unint64_t)a4 hitBlock:(id)a5 storage:(id)a6 range:(_NSRange)a7
{
  NSUInteger length;
  NSUInteger location;
  TSWPSearch *v14;
  TSWPSearch *v15;
  _NSRange *p_range;
  id v17;
  uint64_t v18;
  TSWPFilteredString *v19;
  NSUInteger v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  _QWORD v26[5];
  _QWORD v27[7];
  objc_super v28;

  length = a7.length;
  location = a7.location;
  if (a3)
  {
    if (a6)
      goto LABEL_3;
  }
  else
  {
    v21 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v22 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSearch initWithString:options:hitBlock:storage:range:]");
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSearch.mm"), 30, CFSTR("invalid nil value for '%s'"), "string");
    if (a6)
      goto LABEL_3;
  }
  v23 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
  v24 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSearch initWithString:options:hitBlock:storage:range:]");
  objc_msgSend(v23, "handleFailureInFunction:file:lineNumber:description:", v24, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSearch.mm"), 31, CFSTR("invalid nil value for '%s'"), "storage");
LABEL_3:
  v28.receiver = self;
  v28.super_class = (Class)TSWPSearch;
  v14 = -[TSKSearch initWithString:options:hitBlock:](&v28, sel_initWithString_options_hitBlock_, a3, a4, a5);
  v15 = v14;
  if (v14)
  {
    p_range = &v14->_range;
    v14->_range.location = location;
    v14->_range.length = length;
    v14->_storage = (TSWPStorage *)a6;
    v17 = (id)objc_opt_new();
    v18 = MEMORY[0x24BDAC760];
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke;
    v27[3] = &unk_24D82E0F0;
    v27[4] = v17;
    v27[5] = location;
    v27[6] = length;
    objc_msgSend(a6, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, location, length, v27);
    v26[0] = v18;
    v26[1] = 3221225472;
    v26[2] = __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke_2;
    v26[3] = &unk_24D82E118;
    v26[4] = v17;
    objc_msgSend(a6, "enumerateAttachmentsInTextRange:usingBlock:", location, length, v26);
    if (objc_msgSend(v17, "rangeCount"))
    {
      v19 = -[TSWPFilteredString initWithString:subrange:removeRanges:]([TSWPFilteredString alloc], "initWithString:subrange:removeRanges:", objc_msgSend(a6, "string"), location, length, v17);
      v15->_filteredString = v19;
      v15->_searchedString = &v19->super;
      p_range->location = -[TSWPFilteredString charRangeMappedFromStorage:](v15->_filteredString, "charRangeMappedFromStorage:", p_range->location, v15->_range.length);
      v15->_range.length = v20;
    }
    else
    {
      v15->_searchedString = (NSString *)objc_msgSend(a6, "string");
    }
  }
  return v15;
}

uint64_t __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke(uint64_t a1, uint64_t a2, NSUInteger a3, NSUInteger a4)
{
  uint64_t result;
  void *v8;
  NSRange v9;
  NSRange v10;

  objc_opt_class();
  result = TSUDynamicCast();
  if (result)
  {
    v8 = *(void **)(a1 + 32);
    v10.location = a3;
    v10.length = a4;
    v9 = NSIntersectionRange(*(NSRange *)(a1 + 40), v10);
    return objc_msgSend(v8, "addRange:", v9.location, v9.length);
  }
  return result;
}

uint64_t __60__TSWPSearch_initWithString_options_hitBlock_storage_range___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return objc_msgSend(*(id *)(a1 + 32), "addRange:", a4, 1);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPSearch;
  -[TSKSearch dealloc](&v3, sel_dealloc);
}

- (BOOL)isComplete
{
  uint64_t v2;

  -[TSWPSearch range](self, "range");
  return v2 == 0;
}

- (void)foundHitWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void (**v7)(id, TSWPSearchReference *);

  length = a3.length;
  location = a3.location;
  if (-[TSWPSearch filteredString](self, "filteredString"))
  {
    location = -[TSWPFilteredString charRangeMappedToStorage:](-[TSWPSearch filteredString](self, "filteredString"), "charRangeMappedToStorage:", location, length);
    length = v6;
  }
  v7 = -[TSKSearch hitBlock](self, "hitBlock");
  v7[2](v7, +[TSWPSearchReference searchReferenceWithStorage:range:](TSWPSearchReference, "searchReferenceWithStorage:range:", -[TSWPSearch storage](self, "storage"), location, length));
}

- (_NSRange)range
{
  _NSRange *p_range;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_range = &self->_range;
  location = self->_range.location;
  length = p_range->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (NSString)searchedString
{
  return self->_searchedString;
}

- (TSWPFilteredString)filteredString
{
  return self->_filteredString;
}

- (TSWPStorage)storage
{
  return self->_storage;
}

@end
