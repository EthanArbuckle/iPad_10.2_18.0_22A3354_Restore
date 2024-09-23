@implementation TSWPFilteredString

- (TSWPFilteredString)initWithString:(id)a3 subrange:(_NSRange)a4 removeRanges:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  TSWPFilteredString *v9;
  TSWPDeletionRangeMap *v10;
  unint64_t v11;
  objc_super v13;

  length = a4.length;
  location = a4.location;
  v13.receiver = self;
  v13.super_class = (Class)TSWPFilteredString;
  v9 = -[TSWPFilteredString init](&v13, sel_init);
  if (v9)
  {
    v9->_sourceString = (NSString *)a3;
    v10 = -[TSWPDeletionRangeMap initWithSubRange:removeRanges:]([TSWPDeletionRangeMap alloc], "initWithSubRange:removeRanges:", location, length, a5);
    v9->_rangeMap = v10;
    v9->_sourceRanges = (TSWPRangeArray *)-[TSWPDeletionRangeMap inverseRangesInStorageRange:](v10, "inverseRangesInStorageRange:", location, length);
    -[TSWPDeletionRangeMap mappedCharRange:](v9->_rangeMap, "mappedCharRange:", location, length);
    v9->_length = v11;
  }
  return v9;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPFilteredString;
  -[TSWPFilteredString dealloc](&v3, sel_dealloc);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[NSString characterAtIndex:](-[TSWPFilteredString sourceString](self, "sourceString"), "characterAtIndex:", -[TSWPDeletionRangeMap unmappedCharIndex:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "unmappedCharIndex:", a3));
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TSWPRangeArray *v9;
  _QWORD v10[7];
  _QWORD v11[4];

  v6 = -[TSWPDeletionRangeMap unmappedCharRange:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "unmappedCharRange:", a4.location, a4.length);
  v8 = v7;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v11[3] = 0;
  v9 = -[TSWPFilteredString sourceRanges](self, "sourceRanges");
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __42__TSWPFilteredString_getCharacters_range___block_invoke;
  v10[3] = &unk_24D82D628;
  v10[5] = v11;
  v10[6] = a3;
  v10[4] = self;
  -[TSWPRangeArray enumerateRangesInRange:usingBlock:](v9, "enumerateRangesInRange:usingBlock:", v6, v8, v10);
  _Block_object_dispose(v11, 8);
}

uint64_t __42__TSWPFilteredString_getCharacters_range___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  result = objc_msgSend((id)objc_msgSend(*(id *)(a1 + 32), "sourceString"), "getCharacters:range:", *(_QWORD *)(a1 + 48) + 2 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24), a2, a3);
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += a3;
  return result;
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return -[TSWPDeletionRangeMap unmappedCharIndex:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "unmappedCharIndex:", a3);
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return -[TSWPDeletionRangeMap mappedCharIndex:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "mappedCharIndex:", a3);
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPDeletionRangeMap unmappedCharRange:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "unmappedCharRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  NSUInteger v3;
  NSUInteger v4;
  _NSRange result;

  v3 = -[TSWPDeletionRangeMap mappedCharRange:](-[TSWPFilteredString rangeMap](self, "rangeMap"), "mappedCharRange:", a3.location, a3.length);
  result.length = v4;
  result.location = v3;
  return result;
}

- (unint64_t)length
{
  return self->_length;
}

- (NSString)sourceString
{
  return self->_sourceString;
}

- (void)setSourceString:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 16);
}

- (TSWPDeletionRangeMap)rangeMap
{
  return self->_rangeMap;
}

- (void)setRangeMap:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (TSWPRangeArray)sourceRanges
{
  return self->_sourceRanges;
}

@end
