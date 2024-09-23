@implementation TSWPRubyTextSource

- (id).cxx_construct
{
  *(_OWORD *)((char *)self + 40) = 0u;
  *(_OWORD *)((char *)self + 24) = 0u;
  *(_OWORD *)((char *)self + 8) = 0u;
  return self;
}

- (unint64_t)length
{
  return self->_length;
}

- (_NSRange)charRangeMappedToStorage:(_NSRange)a3
{
  TSWPTextSource *source;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  source = self->_source;
  v4 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3.location, a3.length);
  v6 = -[TSWPTextSource charRangeMappedToStorage:](source, "charRangeMappedToStorage:", v4, v5);
  result.length = v7;
  result.location = v6;
  return result;
}

- (TSWPRubyTextSource)initWithSource:(id)a3 subRange:(_NSRange)a4
{
  TSWPRubyTextSource *v4;
  TSWPTextSource *v5;
  NSUInteger location;
  NSUInteger v8;
  uint64_t v9;
  void *v10;
  int v11;
  uint64_t v12;
  void *v13;
  NSUInteger v14;
  NSUInteger v15;
  _BOOL4 v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;
  uint64_t v21;
  NSUInteger v22;
  unint64_t *value;
  unint64_t *end;
  unint64_t *v25;
  unint64_t *begin;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  unint64_t v30;
  char *v31;
  unint64_t *v32;
  unint64_t v33;
  void *v34;
  uint64_t v35;
  vector<unsigned long, std::allocator<unsigned long>> *p_bidiCharIndexes;
  unint64_t **v37;
  _BOOL4 v38;
  TSWPRangeMap *v39;
  uint64_t v40;
  NSUInteger v41;
  unint64_t **p_end;
  unsigned __int8 v46;
  NSUInteger v47;
  NSUInteger v48;
  uint64_t v49;
  uint64_t v50;
  void (*v51)(_QWORD *, uint64_t, unint64_t, uint64_t);
  void *v52;
  TSWPRubyTextSource *v53;
  _NSRange v54;
  objc_super v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint64_t v65;
  uint64_t v66;
  _BYTE v67[11];
  uint64_t v68;

  v68 = *MEMORY[0x24BDAC8D0];
  v55.receiver = self;
  v55.super_class = (Class)TSWPRubyTextSource;
  v4 = -[TSWPRubyTextSource init](&v55, sel_init);
  if (v4)
  {
    v5 = (TSWPTextSource *)a3;
    v4->_source = v5;
    v49 = MEMORY[0x24BDAC760];
    v50 = 3221225472;
    v51 = __46__TSWPRubyTextSource_initWithSource_subRange___block_invoke;
    v52 = &unk_24D82D058;
    v54 = a4;
    v53 = v4;
    -[TSWPTextSource enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](v5, "enumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 7);
    p_end = &v4->_spaceCharIndexes.__end_;
    if (v4->_spaceCharIndexes.__begin_ == v4->_spaceCharIndexes.__end_ && a4.length >= 2)
    {
      v66 = 0x1000000;
      *(_QWORD *)v67 = 0x10000000000;
      *(_DWORD *)&v67[7] = 0;
      v65 = 0;
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      location = a4.location;
      v8 = a4.location + a4.length;
      v59 = 0u;
      v60 = 0u;
      v57 = 0u;
      v58 = 0u;
      v56 = 0u;
      v9 = *MEMORY[0x24BEB3E88];
      do
      {
        -[TSWPTextSource attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](v4->_source, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", location, &v66, &v56, &v47, p_end);
        v10 = (void *)*((_QWORD *)&v57 + 1);
        if (*((_QWORD *)&v57 + 1))
        {
          v11 = objc_msgSend(*((id *)&v57 + 1), "writingDirection");
          if (objc_msgSend(v10, "containsProperty:", 39))
            objc_msgSend(v10, "objectForProperty:", 39);
        }
        else
        {
          v11 = -1;
        }
        objc_opt_class();
        v12 = TSUDynamicCast();
        v13 = (void *)v12;
        if (v11 == -1 && v12)
          v11 = objc_msgSend(MEMORY[0x24BDBCEA0], "characterDirectionForLanguage:", v12) == 2;
        v14 = v48 + v47;
        if (v8 < v48 + v47)
          v14 = a4.location + a4.length;
        if (v47 > location)
          location = v47;
        v15 = v14 - location;
        v47 = location;
        v48 = v14 - location;
        if (v11 == 1 && v14 > location)
        {
          v16 = 0;
          do
          {
            v46 = 0;
            v17 = objc_msgSend(v13, "isEqualToString:", v9);
            v18 = -[TSWPRubyTextSource composedCharacterAtCharIndex:isSurrogatePair:](v4, "composedCharacterAtCharIndex:isSurrogatePair:", location, &v46);
            v19 = TSWPGetBidiClass();
            v20 = v19;
            if (v18 == 9 || v19 == 6 || !v16 && v19 == 4 || v19 == 5 && (v17 & v16 & 1) == 0)
            {
              if (v46)
                v21 = 2;
              else
                v21 = 1;
              v22 = v21 + location;
              end = v4->_bidiCharIndexes.__end_;
              value = v4->_bidiCharIndexes.__end_cap_.__value_;
              if (end >= value)
              {
                begin = v4->_bidiCharIndexes.__begin_;
                v27 = end - begin;
                v28 = v27 + 1;
                if ((unint64_t)(v27 + 1) >> 61)
                  abort();
                v29 = (char *)value - (char *)begin;
                if (v29 >> 2 > v28)
                  v28 = v29 >> 2;
                if ((unint64_t)v29 >= 0x7FFFFFFFFFFFFFF8)
                  v30 = 0x1FFFFFFFFFFFFFFFLL;
                else
                  v30 = v28;
                if (v30)
                {
                  v31 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)&v4->_bidiCharIndexes.__end_cap_, v30);
                  begin = v4->_bidiCharIndexes.__begin_;
                  end = v4->_bidiCharIndexes.__end_;
                }
                else
                {
                  v31 = 0;
                }
                v32 = (unint64_t *)&v31[8 * v27];
                *v32 = v22;
                v25 = v32 + 1;
                while (end != begin)
                {
                  v33 = *--end;
                  *--v32 = v33;
                }
                v4->_bidiCharIndexes.__begin_ = v32;
                v4->_bidiCharIndexes.__end_ = v25;
                v4->_bidiCharIndexes.__end_cap_.__value_ = (unint64_t *)&v31[8 * v30];
                if (begin)
                  operator delete(begin);
              }
              else
              {
                *end = v22;
                v25 = end + 1;
              }
              v4->_bidiCharIndexes.__end_ = v25;
            }
            v16 = v20 == 3;
            location += v46 + 1;
            v15 = v48;
          }
          while (location < v48 + v47);
          location = v47;
        }
        location += v15;
        if (location > v8)
        {
          v34 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
          v35 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRubyTextSource initWithSource:subRange:]");
          objc_msgSend(v34, "handleFailureInFunction:file:lineNumber:description:", v35, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRubyTextSource.mm"), 125, CFSTR("Bad curCharIndex"));
        }
      }
      while (location < v8);
    }
    p_bidiCharIndexes = &v4->_bidiCharIndexes;
    v37 = &v4->_bidiCharIndexes.__end_;
    v38 = v4->_bidiCharIndexes.__begin_ == v4->_bidiCharIndexes.__end_;
    v39 = [TSWPRangeMap alloc];
    if (v38)
    {
      v40 = -[TSWPRangeMap initWithSubRange:unmappedPairIndexes:](v39, "initWithSubRange:unmappedPairIndexes:", a4.location, a4.length, &v4->_spaceCharIndexes);
      v37 = p_end;
      p_bidiCharIndexes = &v4->_spaceCharIndexes;
    }
    else
    {
      v40 = -[TSWPRangeMap initWithSubRange:unmappedIndexes:affinity:](v39, "initWithSubRange:unmappedIndexes:affinity:", a4.location, a4.length, &v4->_bidiCharIndexes, 1);
    }
    v41 = a4.length + *v37 - p_bidiCharIndexes->__begin_;
    v4->_rangeMap = (TSWPRangeMap *)v40;
    v4->_length = v41;
    v4->_storageLength = objc_msgSend(a3, "storageLength", p_end);
  }
  return v4;
}

- (void).cxx_destruct
{
  unint64_t *begin;
  unint64_t *v4;

  begin = self->_bidiCharIndexes.__begin_;
  if (begin)
  {
    self->_bidiCharIndexes.__end_ = begin;
    operator delete(begin);
  }
  v4 = self->_spaceCharIndexes.__begin_;
  if (v4)
  {
    self->_spaceCharIndexes.__end_ = v4;
    operator delete(v4);
  }
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSWPRubyTextSource;
  -[TSWPRubyTextSource dealloc](&v3, sel_dealloc);
}

- (unsigned)characterAtIndex:(unint64_t)a3
{
  return -[TSWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (unint64_t)charIndexMappedToStorage:(unint64_t)a3
{
  return -[TSWPTextSource charIndexMappedToStorage:](self->_source, "charIndexMappedToStorage:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)attachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  return (id)-[TSWPTextSource attachmentOrFootnoteAtCharIndex:](self->_source, "attachmentOrFootnoteAtCharIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (id)footnoteReferenceAtCharIndex:(unint64_t)a3
{
  return (id)-[TSWPTextSource footnoteReferenceAtCharIndex:](self->_source, "footnoteReferenceAtCharIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (unint64_t)charIndexRemappedFromStorage:(unint64_t)a3
{
  return -[TSWPRubyTextSource charIndexMappedToStorage:](self, "charIndexMappedToStorage:", -[TSWPRubyTextSource charIndexMappedFromStorage:](self, "charIndexMappedFromStorage:", a3));
}

- (_NSRange)charRangeMappedFromStorage:(_NSRange)a3
{
  TSWPRangeMap *rangeMap;
  uint64_t v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  rangeMap = self->_rangeMap;
  v4 = -[TSWPTextSource charRangeMappedFromStorage:](self->_source, "charRangeMappedFromStorage:", a3.location, a3.length);
  v6 = -[TSWPRangeMap mappedCharRange:](rangeMap, "mappedCharRange:", v4, v5);
  result.length = v7;
  result.location = v6;
  return result;
}

- (unint64_t)charIndexMappedFromStorage:(unint64_t)a3
{
  return -[TSWPRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", -[TSWPTextSource charIndexMappedFromStorage:](self->_source, "charIndexMappedFromStorage:", a3));
}

- (__CFDictionary)createFilteredCoreTextAttributes:(__CFDictionary *)a3 effectiveRange:(_NSRange *)a4 filterDelegate:(id)a5
{
  uint64_t v9;
  NSUInteger v10;
  uint64_t v12;
  uint64_t v13;

  if (a4)
  {
    v12 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4->location, a4->length);
    v13 = v9;
    a3 = (__CFDictionary *)-[TSWPTextSource createFilteredCoreTextAttributes:effectiveRange:filterDelegate:](self->_source, "createFilteredCoreTextAttributes:effectiveRange:filterDelegate:", a3, &v12, a5);
    a4->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12, v13);
    a4->length = v10;
  }
  return a3;
}

- (void)attributesAtCharIndex:(unint64_t)a3 attributesOfInterest:(BOOL)a4[19] attributesTable:(id)a5[19] effectiveRange:(_NSRange *)a6
{
  NSUInteger v8;
  __int128 v9;

  v9 = xmmword_217C27470;
  -[TSWPTextSource attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:](self->_source, "attributesAtCharIndex:attributesOfInterest:attributesTable:effectiveRange:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4, a5, &v9);
  if (a6)
  {
    a6->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v9);
    a6->length = v8;
  }
}

- (id)smartFieldsWithAttributeKind:(unsigned int)a3 intersectingRange:(_NSRange)a4
{
  uint64_t v4;
  TSWPTextSource *source;
  uint64_t v6;
  uint64_t v7;

  v4 = *(_QWORD *)&a3;
  source = self->_source;
  v6 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  return (id)-[TSWPTextSource smartFieldsWithAttributeKind:intersectingRange:](source, "smartFieldsWithAttributeKind:intersectingRange:", v4, v6, v7);
}

- (BOOL)hasColumnBreakAtCharIndex:(unint64_t)a3
{
  return -[TSWPTextSource hasColumnBreakAtCharIndex:](self->_source, "hasColumnBreakAtCharIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (void)getCharacters:(unsigned __int16 *)a3 range:(_NSRange)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t *end;
  unint64_t *begin;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  unsigned __int16 *v19;
  unint64_t *v20;
  unint64_t *v21;
  unint64_t v22;
  unint64_t v23;
  BOOL v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unsigned __int16 *v28;
  unint64_t v29;
  unint64_t v30;

  v6 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a4.location, a4.length);
  v7 = v6;
  v9 = v8;
  begin = self->_spaceCharIndexes.__begin_;
  end = self->_spaceCharIndexes.__end_;
  if (end == begin)
  {
    v21 = self->_bidiCharIndexes.__begin_;
    v20 = self->_bidiCharIndexes.__end_;
    if (v20 == v21)
    {
      v13 = v6;
    }
    else
    {
      v22 = v6;
      do
      {
        v23 = *v21++;
        v13 = v23;
        v24 = v22 >= v23;
        if (v22 <= v23)
          v25 = v13;
        else
          v25 = v22;
        if (v24)
          v26 = v13;
        else
          v26 = v22;
        v27 = v25 - v26;
        -[TSWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3);
        v28 = &a3[v27];
        *v28 = 8207;
        a3 = v28 + 1;
        v22 = v13;
      }
      while (v21 != v20);
    }
  }
  else
  {
    v12 = v6;
    do
    {
      v14 = *begin++;
      v13 = v14;
      v15 = v12 >= v14;
      if (v12 <= v14)
        v16 = v13;
      else
        v16 = v12;
      if (v15)
        v17 = v13;
      else
        v17 = v12;
      v18 = v16 - v17;
      -[TSWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3);
      v19 = &a3[v18];
      *v19 = 8209;
      a3 = v19 + 1;
      v12 = v13;
    }
    while (begin != end);
  }
  if (v13 <= v7 + v9)
    v29 = v7 + v9;
  else
    v29 = v13;
  if (v13 >= v7 + v9)
    v30 = v7 + v9;
  else
    v30 = v13;
  -[TSWPTextSource getCharacters:range:](self->_source, "getCharacters:range:", a3, v30, v29 - v30);
}

- (id)smartFieldAtCharIndex:(unint64_t)a3 attributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  void *v8;
  unint64_t length;
  unint64_t location;
  _NSRange v13;

  v13 = (_NSRange)xmmword_217C27470;
  v8 = (void *)-[TSWPTextSource smartFieldAtCharIndex:attributeKind:effectiveRange:](self->_source, "smartFieldAtCharIndex:attributeKind:effectiveRange:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:"), *(_QWORD *)&a4, &v13);
  length = v13.length;
  location = v13.location;
  if (v8)
  {
    location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v13);
    v13.location = location;
    v13.length = length;
  }
  if (a3 < location || a3 - location >= length)
  {
    v8 = 0;
    v13 = (_NSRange)xmmword_217C27470;
  }
  if (a5)
    *a5 = v13;
  return v8;
}

- (id)attachmentAtCharIndex:(unint64_t)a3
{
  return (id)-[TSWPTextSource attachmentAtCharIndex:](self->_source, "attachmentAtCharIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

void __46__TSWPRubyTextSource_initWithSource_subRange___block_invoke(_QWORD *a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v7;
  _QWORD *v8;
  char *v9;
  unint64_t v10;
  _QWORD *v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  uint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  uint64_t v20;
  _QWORD *v21;
  char *v22;
  unint64_t v23;
  _QWORD *v24;
  char *v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t v28;
  unint64_t v29;
  char *v30;
  char *v31;
  char *v32;
  uint64_t v33;

  v4 = a1[5];
  if (v4 <= a3)
  {
    v7 = a3 + a4;
    if (a1[6] + v4 >= a3 + a4)
    {
      v8 = (_QWORD *)a1[4];
      v9 = (char *)v8[2];
      v10 = v8[3];
      if ((unint64_t)v9 >= v10)
      {
        v12 = (char *)v8[1];
        v13 = (v9 - v12) >> 3;
        v14 = v13 + 1;
        if ((unint64_t)(v13 + 1) >> 61)
          goto LABEL_37;
        v15 = v10 - (_QWORD)v12;
        if (v15 >> 2 > v14)
          v14 = v15 >> 2;
        if ((unint64_t)v15 >= 0x7FFFFFFFFFFFFFF8)
          v16 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v16 = v14;
        if (v16)
        {
          v17 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)(v8 + 3), v16);
          v12 = (char *)v8[1];
          v9 = (char *)v8[2];
        }
        else
        {
          v17 = 0;
        }
        v18 = &v17[8 * v13];
        v19 = &v17[8 * v16];
        *(_QWORD *)v18 = a3;
        v11 = v18 + 8;
        while (v9 != v12)
        {
          v20 = *((_QWORD *)v9 - 1);
          v9 -= 8;
          *((_QWORD *)v18 - 1) = v20;
          v18 -= 8;
        }
        v8[1] = v18;
        v8[2] = v11;
        v8[3] = v19;
        if (v12)
          operator delete(v12);
      }
      else
      {
        *(_QWORD *)v9 = a3;
        v11 = v9 + 8;
      }
      v8[2] = v11;
      v21 = (_QWORD *)a1[4];
      v22 = (char *)v21[2];
      v23 = v21[3];
      if ((unint64_t)v22 < v23)
      {
        *(_QWORD *)v22 = v7;
        v24 = v22 + 8;
LABEL_35:
        v21[2] = v24;
        return;
      }
      v25 = (char *)v21[1];
      v26 = (v22 - v25) >> 3;
      v27 = v26 + 1;
      if (!((unint64_t)(v26 + 1) >> 61))
      {
        v28 = v23 - (_QWORD)v25;
        if (v28 >> 2 > v27)
          v27 = v28 >> 2;
        if ((unint64_t)v28 >= 0x7FFFFFFFFFFFFFF8)
          v29 = 0x1FFFFFFFFFFFFFFFLL;
        else
          v29 = v27;
        if (v29)
        {
          v30 = (char *)std::__allocate_at_least[abi:nn180100]<std::allocator<EQKitLayoutContext *>>((uint64_t)(v21 + 3), v29);
          v25 = (char *)v21[1];
          v22 = (char *)v21[2];
        }
        else
        {
          v30 = 0;
        }
        v31 = &v30[8 * v26];
        v32 = &v30[8 * v29];
        *(_QWORD *)v31 = v7;
        v24 = v31 + 8;
        while (v22 != v25)
        {
          v33 = *((_QWORD *)v22 - 1);
          v22 -= 8;
          *((_QWORD *)v31 - 1) = v33;
          v31 -= 8;
        }
        v21[1] = v31;
        v21[2] = v24;
        v21[3] = v32;
        if (v25)
          operator delete(v25);
        goto LABEL_35;
      }
LABEL_37:
      abort();
    }
  }
}

- (unsigned)composedCharacterAtCharIndex:(unint64_t)a3 isSurrogatePair:(BOOL *)a4
{
  unint64_t v7;
  unsigned int v8;
  unint64_t v9;
  unint64_t v10;
  int v11;
  int v12;

  *a4 = 0;
  v7 = -[TSWPTextSource length](self->_source, "length");
  v8 = 0;
  if (v7 > a3)
  {
    v9 = v7;
    v8 = -[TSWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", a3);
    v10 = a3 + 1;
    if (a3 + 1 < v9)
    {
      v11 = -[TSWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", a3);
      v12 = -[TSWPTextSource characterAtIndex:](self->_source, "characterAtIndex:", v10);
      if ((v11 & 0xFC00) == 0xD800 && (v12 & 0xFC00) == 56320)
      {
        *a4 = 1;
        return v12 + (v11 << 10) - 56613888;
      }
    }
  }
  return v8;
}

- (BOOL)adjustRangesByDelta:(int64_t)a3
{
  char v5;
  unint64_t storageLength;
  unint64_t v7;
  void *v8;
  uint64_t v9;

  v5 = -[TSWPTextSource adjustRangesByDelta:](self->_source, "adjustRangesByDelta:");
  if (a3)
  {
    storageLength = self->_storageLength;
    if (storageLength != -[TSWPTextSource storageLength](self->_source, "storageLength"))
    {
      v7 = self->_storageLength + a3;
      if (v7 != -[TSWPTextSource storageLength](self->_source, "storageLength"))
      {
        v8 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v9 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPRubyTextSource adjustRangesByDelta:]");
        objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPRubyTextSource.mm"), 187, CFSTR("delta mismatch"));
      }
      self->_storageLength = -[TSWPTextSource storageLength](self->_source, "storageLength");
      if ((v5 & 1) == 0)
        -[TSWPRangeMap adjustByDelta:](self->_rangeMap, "adjustByDelta:", a3);
      return 1;
    }
  }
  return v5;
}

- (id)string
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  unint64_t *begin;
  unint64_t *end;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  BOOL v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t *v16;
  unint64_t *v17;
  unint64_t v18;
  unint64_t v19;
  BOOL v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;

  v3 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", 0, self->_length);
  v5 = v3;
  v6 = v4;
  if (self->_spaceCharIndexes.__end_ != self->_spaceCharIndexes.__begin_)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
    begin = self->_spaceCharIndexes.__begin_;
    end = self->_spaceCharIndexes.__end_;
    if (begin != end)
    {
      v10 = v5;
      do
      {
        v11 = v10;
        v12 = *begin++;
        v10 = v12;
        v13 = v11 >= v12;
        if (v11 <= v12)
          v14 = v10;
        else
          v14 = v11;
        if (v13)
          v15 = v10;
        else
          v15 = v11;
        objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v15, v14 - v15));
        objc_msgSend(v7, "appendFormat:", CFSTR("%C"), 8209);
      }
      while (begin != end);
      goto LABEL_24;
    }
LABEL_23:
    v10 = v5;
    goto LABEL_24;
  }
  if (self->_bidiCharIndexes.__end_ == self->_bidiCharIndexes.__begin_)
  {
    if (v3 || v4 != objc_msgSend((id)-[TSWPTextSource string](self->_source, "string"), "length"))
      return (id)-[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v5, v6);
    else
      return (id)-[TSWPTextSource string](self->_source, "string");
  }
  v7 = (void *)objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v16 = self->_bidiCharIndexes.__begin_;
  v17 = self->_bidiCharIndexes.__end_;
  if (v16 == v17)
    goto LABEL_23;
  v10 = v5;
  do
  {
    v18 = v10;
    v19 = *v16++;
    v10 = v19;
    v20 = v18 >= v19;
    if (v18 <= v19)
      v21 = v10;
    else
      v21 = v18;
    if (v20)
      v22 = v10;
    else
      v22 = v18;
    objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v22, v21 - v22));
    objc_msgSend(v7, "appendFormat:", CFSTR("%C"), 8207);
  }
  while (v16 != v17);
LABEL_24:
  if (v7)
  {
    if (v10 <= v5 + v6)
      v23 = v5 + v6;
    else
      v23 = v10;
    if (v10 >= v5 + v6)
      v24 = v5 + v6;
    else
      v24 = v10;
    objc_msgSend(v7, "appendString:", -[TSWPTextSource substringWithRange:](self->_source, "substringWithRange:", v24, v23 - v24));
  }
  return v7;
}

- (BOOL)hasColumnStyleForParagraphBreakAtCharIndex:(unint64_t)a3
{
  return -[TSWPTextSource hasColumnStyleForParagraphBreakAtCharIndex:](self->_source, "hasColumnStyleForParagraphBreakAtCharIndex:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3));
}

- (double)filteredCoreTextAttributesFontScaleEffectiveRange:(_NSRange *)a3 filterDelegate:(id)a4
{
  uint64_t v7;
  double v8;
  double v9;
  NSUInteger v10;
  uint64_t v12;
  uint64_t v13;

  if (!a3)
    return 1.0;
  v12 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", a3->location, a3->length);
  v13 = v7;
  -[TSWPTextSource filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:](self->_source, "filteredCoreTextAttributesFontScaleEffectiveRange:filterDelegate:", &v12, a4);
  v9 = v8;
  a3->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12, v13);
  a3->length = v10;
  return v9;
}

- (id)paragraphStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  void *v6;
  NSUInteger v7;
  __int128 v9;

  v9 = xmmword_217C27470;
  v6 = (void *)-[TSWPTextSource paragraphStyleAtCharIndex:effectiveRange:](self->_source, "paragraphStyleAtCharIndex:effectiveRange:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), &v9);
  if (a4)
  {
    a4->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v9);
    a4->length = v7;
  }
  return v6;
}

- (BOOL)isWritingDirectionRightToLeftForParagraphAtCharIndex:(unint64_t)a3
{
  return 0;
}

- (id)characterStyleAtCharIndex:(unint64_t)a3 effectiveRange:(_NSRange *)a4
{
  TSWPTextSource *source;
  unint64_t v7;
  __int128 *v8;
  void *v9;
  NSUInteger v10;
  __int128 v12;

  v12 = xmmword_217C27470;
  source = self->_source;
  v7 = -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3);
  if (a4)
    v8 = &v12;
  else
    v8 = 0;
  v9 = (void *)-[TSWPTextSource characterStyleAtCharIndex:effectiveRange:](source, "characterStyleAtCharIndex:effectiveRange:", v7, v8);
  if (a4)
  {
    a4->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v12);
    a4->length = v10;
  }
  return v9;
}

- (_NSRange)wordAtCharIndex:(unint64_t)a3 includePreviousWord:(BOOL)a4
{
  uint64_t v5;
  uint64_t v6;
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  v5 = -[TSWPTextSource wordAtCharIndex:includePreviousWord:](self->_source, "wordAtCharIndex:includePreviousWord:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), a4);
  v7 = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", v5, v6);
  result.length = v8;
  result.location = v7;
  return result;
}

- (int64_t)hyphenationLocationBeforeIndex:(int64_t)a3 inRange:(_NSRange)a4 locale:(__CFLocale *)a5 hyphenChar:(unsigned int *)a6
{
  NSUInteger length;
  NSUInteger location;
  CFIndex v12;
  CFIndex v13;
  CFIndex v14;
  CFIndex v15;
  const __CFString *v16;
  int64_t result;
  int64_t v18;
  CFRange v19;

  length = a4.length;
  location = a4.location;
  v12 = -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:");
  v13 = -[TSWPRangeMap unmappedCharRange:](self->_rangeMap, "unmappedCharRange:", location, length);
  v15 = v14;
  v16 = (const __CFString *)-[TSWPTextSource string](self->_source, "string");
  v19.location = v13;
  v19.length = v15;
  result = CFStringGetHyphenationLocationBeforeIndex(v16, v12, v19, 0, a5, a6);
  if (result != -1)
  {
    v18 = result;
    while (a3 > v18)
    {
      if (-[TSWPRubyTextSource characterAtIndex:](self, "characterAtIndex:", --a3) == 173)
      {
        v18 = a3 + 1;
        return -[TSWPRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v18);
      }
    }
    return -[TSWPRangeMap mappedCharIndex:](self->_rangeMap, "mappedCharIndex:", v18);
  }
  return result;
}

- (id)objectAtLocationPriorToMappedCharIndex:(unint64_t)a3 forAttributeKind:(unsigned int)a4 effectiveRange:(_NSRange *)a5
{
  void *v7;
  NSUInteger v8;

  v7 = (void *)-[TSWPTextSource objectAtLocationPriorToMappedCharIndex:forAttributeKind:effectiveRange:](self->_source, "objectAtLocationPriorToMappedCharIndex:forAttributeKind:effectiveRange:", -[TSWPRangeMap unmappedCharIndex:](self->_rangeMap, "unmappedCharIndex:", a3), *(_QWORD *)&a4, a5);
  if (a5)
  {
    a5->location = -[TSWPRangeMap mappedCharRange:](self->_rangeMap, "mappedCharRange:", a5->location, a5->length);
    a5->length = v8;
  }
  return v7;
}

- (unint64_t)storageLength
{
  return self->_storageLength;
}

@end
