@implementation TSWPSelection

- (_NSRange)range
{
  _NSRange *p_leadingCharIndex;
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  if (-[TSWPSelection isVisual](self, "isVisual")
    && -[TSWPSelection isInsertionPoint](self, "isInsertionPoint")
    && !self->_leadingEdge)
  {
    length = 0;
    p_leadingCharIndex = (_NSRange *)&self->_leadingCharIndex;
  }
  else
  {
    p_leadingCharIndex = &self->_range;
    length = self->_range.length;
  }
  location = p_leadingCharIndex->location;
  result.length = length;
  result.location = location;
  return result;
}

- (BOOL)isVisual
{
  return self->_type == 7;
}

- (int)styleInsertionBehavior
{
  return self->_styleInsertionBehavior;
}

- (id).cxx_construct
{
  *((_QWORD *)self + 13) = 0;
  *((_QWORD *)self + 14) = 0;
  *((_QWORD *)self + 12) = 0;
  return self;
}

- (void).cxx_destruct
{
  TSWPRangeVector *p_visualRanges;
  _NSRange *begin;

  p_visualRanges = &self->_visualRanges;
  begin = self->_visualRanges.__begin_;
  if (begin)
  {
    p_visualRanges->__end_ = begin;
    operator delete(begin);
  }
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)TSWPSelection;
  -[TSWPSelection dealloc](&v2, sel_dealloc);
}

- (TSWPSelection)initWithRange:(_NSRange)a3
{
  uint64_t v4;

  LOBYTE(v4) = 1;
  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", 0, a3.location, a3.length, 0, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v4, 0);
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 storage:(id)a9
{
  uint64_t v9;
  uint64_t v10;
  NSUInteger length;
  NSUInteger location;
  uint64_t v13;
  void *v15;
  uint64_t v16;

  v9 = *(_QWORD *)&a6;
  v10 = *(_QWORD *)&a5;
  length = a4.length;
  location = a4.location;
  v13 = *(_QWORD *)&a3;
  if (a3 != 7 || a9 || a8)
  {
    if (a3 == 7 && a9 && !a8)
      objc_msgSend(a9, "nextCharacterIndex:", a4.location);
  }
  else
  {
    v15 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v16 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:]");
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 122, CFSTR("Selection has a leading edge but no storage to get the leading char"));
  }
  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v13, location, length, v10, v9);
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6 smartFieldRange:(_NSRange)a7 leadingEdge:(BOOL)a8 leadingCharIndex:(unint64_t)a9
{
  NSUInteger length;
  NSUInteger location;
  TSWPSelection *v14;
  TSWPSelection *v15;
  _NSRange *v16;
  void *v17;
  uint64_t v18;
  objc_super v20;
  _NSRange v21;

  length = a4.length;
  location = a4.location;
  v21 = a7;
  v20.receiver = self;
  v20.super_class = (Class)TSWPSelection;
  v14 = -[TSWPSelection init](&v20, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_type = a3;
    v14->_range.location = location;
    v14->_range.length = length;
    v14->_leadingEdge = a8;
    v14->_leadingCharIndex = a9;
    v14->_styleInsertionBehavior = a5;
    v14->_caretAffinity = a6;
    if (a3 == 6)
    {
      v16 = &v21;
    }
    else
    {
      v16 = (_NSRange *)MEMORY[0x24BEB3BF0];
      if (a7.location != *MEMORY[0x24BEB3BF0] || a7.length != *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8))
      {
        v17 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
        v18 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:]");
        objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 105, CFSTR("Non smartfield selection has smartField range"));
        v16 = (_NSRange *)MEMORY[0x24BEB3BF0];
      }
    }
    v15->_smartFieldRange = *v16;
    v15->_validVisualRanges = 0;
    v15->_headChar = 0x7FFFFFFFFFFFFFFFLL;
    v15->_tailChar = 0x7FFFFFFFFFFFFFFFLL;
  }
  return v15;
}

- (BOOL)isRange
{
  return self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (unint64_t)visualRangeCount
{
  return self->_visualRanges.__end_ - self->_visualRanges.__begin_;
}

+ (TSWPSelection)selectionWithRange:(_NSRange)a3
{
  return (TSWPSelection *)(id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
}

- (unint64_t)insertionChar
{
  return self->_range.location;
}

- (TSWPSelection)initWithType:(int)a3 range:(_NSRange)a4 styleInsertionBehavior:(int)a5 caretAffinity:(int)a6
{
  uint64_t v7;

  LOBYTE(v7) = 1;
  return -[TSWPSelection initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:](self, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", *(_QWORD *)&a3, a4.location, a4.length, *(_QWORD *)&a5, *(_QWORD *)&a6, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v7, 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  LOBYTE(v6) = self->_leadingEdge;
  return (id)objc_msgSend(v4, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v6, self->_leadingCharIndex);
}

+ (Class)archivedSelectionClass
{
  return (Class)objc_opt_class();
}

+ (TSWPSelection)selectionWithRange:(_NSRange)a3 type:(int)a4 leadingEdge:(BOOL)a5 storage:(id)a6
{
  uint64_t v8;
  NSUInteger length;
  NSUInteger location;
  id v11;
  uint64_t v13;

  v8 = *(_QWORD *)&a4;
  length = a3.length;
  location = a3.location;
  v11 = objc_alloc((Class)a1);
  LOBYTE(v13) = a5;
  return (TSWPSelection *)(id)objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:storage:", v8, location, length, 0, 0, *MEMORY[0x24BEB3BF0], *(_QWORD *)(MEMORY[0x24BEB3BF0] + 8), v13, a6);
}

- (BOOL)isEqual:(id)a3
{
  BOOL v5;
  BOOL v6;
  BOOL result;

  if (a3 == self)
    return 1;
  objc_opt_class();
  result = (objc_opt_isKindOfClass() & 1) != 0
        && (self->_range.location == *((_QWORD *)a3 + 2) ? (v5 = self->_range.length == *((_QWORD *)a3 + 3)) : (v5 = 0),
            v5
         && self->_type == *((_DWORD *)a3 + 2)
         && self->_styleInsertionBehavior == *((_DWORD *)a3 + 17)
         && self->_caretAffinity == *((_DWORD *)a3 + 18)
         && (self->_smartFieldRange.location == *((_QWORD *)a3 + 10)
           ? (v6 = self->_smartFieldRange.length == *((_QWORD *)a3 + 11))
           : (v6 = 0),
             v6))
        && self->_leadingEdge == *((unsigned __int8 *)a3 + 48);
  return result;
}

- (int64_t)compare:(id)a3
{
  int64_t result;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;

  objc_opt_class();
  result = TSUDynamicCast();
  if (result)
  {
    v5 = (void *)result;
    if (-[TSWPSelection isValid](self, "isValid") && objc_msgSend(v5, "isValid"))
    {
      v6 = -[TSWPSelection range](self, "range");
      if (v6 < objc_msgSend(v5, "range"))
        return -1;
      v7 = -[TSWPSelection range](self, "range");
      if (v7 <= objc_msgSend(v5, "range"))
      {
        -[TSWPSelection range](self, "range");
        v9 = v8;
        objc_msgSend(v5, "range");
        if (v9 < v10)
          return -1;
        -[TSWPSelection range](self, "range");
        v12 = v11;
        objc_msgSend(v5, "range");
        return v12 > v13;
      }
      else
      {
        return 1;
      }
    }
    else
    {
      return 0;
    }
  }
  return result;
}

- (BOOL)isInsertionPoint
{
  return !self->_range.length && self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isValid
{
  return self->_range.location != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)isEmpty
{
  return !-[TSWPSelection isValid](self, "isValid");
}

- (BOOL)isEquivalentForInsertionStyle:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL result;

  if (a3 == self)
    return 1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 0;
  v5 = -[TSWPSelection range](self, "range");
  v7 = v6;
  v9 = objc_msgSend(a3, "range");
  result = 0;
  if (v5 == v9 && v7 == v8)
    return self->_type == *((_DWORD *)a3 + 2);
  return result;
}

- (id)copyWithNewType:(int)a3 smartFieldRange:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  id v8;
  uint64_t v10;

  length = a4.length;
  location = a4.location;
  v6 = *(_QWORD *)&a3;
  v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return (id)objc_msgSend(v8, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v6, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v10, self->_leadingCharIndex);
}

- (id)copyWithNewType:(int)a3 range:(_NSRange)a4
{
  NSUInteger length;
  NSUInteger location;
  uint64_t v6;
  _NSRange *p_smartFieldRange;
  NSUInteger v9;
  NSUInteger v10;
  id v11;
  uint64_t v13;

  length = a4.length;
  location = a4.location;
  v6 = *(_QWORD *)&a3;
  if (a3 == 6)
    p_smartFieldRange = &self->_smartFieldRange;
  else
    p_smartFieldRange = (_NSRange *)MEMORY[0x24BEB3BF0];
  v9 = p_smartFieldRange->location;
  v10 = p_smartFieldRange->length;
  v11 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  return (id)objc_msgSend(v11, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v6, location, length, self->_styleInsertionBehavior, self->_caretAffinity, v9, v10, v13, self->_leadingCharIndex);
}

- (id)copyWithNewVisualTypeRange:(_NSRange)a3 head:(unint64_t)a4 tail:(unint64_t)a5
{
  NSUInteger length;
  NSUInteger location;
  id v10;
  void *v11;
  uint64_t v13;

  length = a3.length;
  location = a3.location;
  v10 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v13) = self->_leadingEdge;
  v11 = (void *)objc_msgSend(v10, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, location, length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v13, self->_leadingCharIndex);
  objc_msgSend(v11, "setHeadChar:tailChar:", a4, a5);
  return v11;
}

- (id)copyWithNewType:(int)a3
{
  uint64_t v3;
  _NSRange *p_smartFieldRange;
  NSUInteger location;
  NSUInteger length;
  id v8;
  uint64_t v10;

  v3 = *(_QWORD *)&a3;
  if (a3 == 6)
    p_smartFieldRange = &self->_smartFieldRange;
  else
    p_smartFieldRange = (_NSRange *)MEMORY[0x24BEB3BF0];
  location = p_smartFieldRange->location;
  length = p_smartFieldRange->length;
  v8 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v10) = self->_leadingEdge;
  return (id)objc_msgSend(v8, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", v3, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, location, length, v10, self->_leadingCharIndex);
}

- (id)copyWithNewRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  void *v7;
  uint64_t v10;

  length = a3.length;
  location = a3.location;
  LOBYTE(v10) = 1;
  v6 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, location, a3.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v10, location);
  v7 = v6;
  if (self->_type == 7
    && self->_validVisualRanges
    && location == self->_range.location
    && length == self->_range.length)
  {
    objc_msgSend(v6, "i_setVisualRanges:", &self->_visualRanges);
  }
  return v7;
}

- (id)copyWithNewVisualRanges:(const void *)a3
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = objc_alloc((Class)objc_opt_class());
  v6 = *((_QWORD *)a3 + 1);
  if (*(_QWORD *)a3 == v6)
  {
    v7 = 0;
    v8 = 0;
  }
  else
  {
    v7 = **(_QWORD **)a3;
    v8 = *(_QWORD *)(v6 - 8) + *(_QWORD *)(v6 - 16);
  }
  if (v7 <= v8)
    v9 = v8;
  else
    v9 = v7;
  if (v7 >= v8)
    v10 = v8;
  else
    v10 = v7;
  LOBYTE(v13) = self->_leadingEdge;
  v11 = (void *)objc_msgSend(v5, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", 7, v10, v9 - v10, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v13, self->_leadingCharIndex);
  objc_msgSend(v11, "i_setVisualRanges:", a3);
  return v11;
}

- (id)copyWithVisualRanges:(const void *)a3 startChar:(unint64_t)a4 endChar:(unint64_t)a5 rightToLeft:(BOOL)a6 sameLine:(BOOL)a7
{
  _BOOL4 v7;
  _BOOL4 v8;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  uint64_t v21;

  v7 = a7;
  v8 = a6;
  if (self->_type != 7)
  {
    v13 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v14 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSelection copyWithVisualRanges:startChar:endChar:rightToLeft:sameLine:]");
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 339, CFSTR("Selection type must be visual"));
  }
  v15 = objc_alloc((Class)objc_opt_class());
  LOBYTE(v21) = self->_leadingEdge;
  v16 = (void *)objc_msgSend(v15, "initWithType:range:styleInsertionBehavior:caretAffinity:smartFieldRange:leadingEdge:leadingCharIndex:", self->_type, self->_range.location, self->_range.length, self->_styleInsertionBehavior, self->_caretAffinity, self->_smartFieldRange.location, self->_smartFieldRange.length, v21, self->_leadingCharIndex);
  objc_msgSend(v16, "i_setVisualRanges:", a3);
  if (v7 && v8)
  {
    v17 = v16;
    v18 = a5;
    v19 = a4;
  }
  else
  {
    v17 = v16;
    v18 = a4;
    v19 = a5;
  }
  objc_msgSend(v17, "setHeadChar:tailChar:", v18, v19);
  return v16;
}

- (unint64_t)end
{
  return self->_range.length + self->_range.location;
}

- (_NSRange)superRange
{
  _NSRange *end;
  _NSRange *begin;
  NSUInteger location;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  if (self->_type == 7
    && -[TSWPSelection isRange](self, "isRange")
    && (begin = self->_visualRanges.__begin_, end = self->_visualRanges.__end_, end != begin))
  {
    location = begin->location;
    v6 = end[-1].length + end[-1].location;
    if (location <= v6)
      v7 = v6;
    else
      v7 = location;
    if (location >= v6)
      v8 = v6;
    else
      v8 = location;
    v9 = v7 - v8;
  }
  else
  {
    v8 = -[TSWPSelection range](self, "range");
  }
  result.length = v9;
  result.location = v8;
  return result;
}

- (void)i_setVisualRanges:(const void *)a3
{
  char *p_visualRanges;

  p_visualRanges = (char *)&self->_visualRanges;
  if (p_visualRanges != a3)
    std::vector<EQKitLength>::__assign_with_size[abi:nn180100]<EQKitLength*,EQKitLength*>(p_visualRanges, *(char **)a3, *((_QWORD *)a3 + 1), (uint64_t)(*((_QWORD *)a3 + 1) - *(_QWORD *)a3) >> 4);
  self->_validVisualRanges = 1;
}

- (const)visualRanges
{
  void *v3;
  uint64_t v4;

  if (!self->_validVisualRanges)
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSelection visualRanges]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 394, CFSTR("Visual ranges have not been calculated"));
  }
  return &self->_visualRanges;
}

- (void)i_visualRanges
{
  return &self->_visualRanges;
}

- (id)visualRangesArray
{
  void *v3;
  uint64_t v4;
  TSWPRangeVector *p_visualRanges;
  int64_t v6;
  unint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;

  if (self->_type == 7 && !self->_validVisualRanges && -[TSWPSelection isRange](self, "isRange"))
  {
    v3 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v4 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSWPSelection visualRangesArray]");
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/text/TSWPSelection.mm"), 406, CFSTR("Visual ranges have not been calculated"));
  }
  p_visualRanges = &self->_visualRanges;
  v6 = (char *)self->_visualRanges.__end_ - (char *)self->_visualRanges.__begin_;
  if ((unint64_t)v6 < 0x11)
  {
    v11 = (void *)MEMORY[0x24BDBCEB8];
    v12 = (void *)MEMORY[0x24BDD1968];
    v13 = -[TSWPSelection superRange](self, "superRange");
    return (id)objc_msgSend(v11, "arrayWithObject:", objc_msgSend(v12, "valueWithRange:", v13, v14));
  }
  else
  {
    v7 = v6 >> 4;
    v8 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v6 >> 4);
    v9 = 0;
    if (v7 <= 1)
      v7 = 1;
    do
    {
      objc_msgSend(v8, "addObject:", objc_msgSend(MEMORY[0x24BDD1968], "valueWithRange:", p_visualRanges->__begin_[v9].location, p_visualRanges->__begin_[v9].length));
      ++v9;
      --v7;
    }
    while (v7);
    return v8;
  }
}

- (void)setHeadChar:(unint64_t)a3 tailChar:(unint64_t)a4
{
  self->_headChar = a3;
  self->_tailChar = a4;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3
{
  NSUInteger location;
  NSUInteger v4;
  BOOL v5;

  location = self->_range.location;
  v5 = a3 >= location;
  v4 = a3 - location;
  v5 = !v5 || v4 >= self->_range.length;
  return !v5;
}

- (BOOL)containsCharacterAtIndex:(unint64_t)a3 allowRightEdge:(BOOL)a4
{
  NSUInteger location;
  NSUInteger v6;
  BOOL v7;

  location = self->_range.location;
  if (a4)
    return a3 - location <= self->_range.length;
  v7 = a3 >= location;
  v6 = a3 - location;
  v7 = !v7 || v6 >= self->_range.length;
  return !v7;
}

- (BOOL)intersectsRange:(_NSRange)a3
{
  _NSRange *p_range;
  NSRange v4;
  NSUInteger location;
  BOOL v8;
  BOOL v9;

  p_range = &self->_range;
  v4.length = self->_range.length;
  if (v4.length)
  {
    v4.location = p_range->location;
    return NSIntersectionRange(v4, a3).length != 0;
  }
  else
  {
    location = p_range->location;
    v8 = location >= a3.location && location - a3.location < a3.length;
    v9 = location == a3.location;
    if (a3.length)
      return v8;
    else
      return v9;
  }
}

- (BOOL)isAtEndOfLine
{
  return self->_caretAffinity == 1;
}

- (int)type
{
  return self->_type;
}

- (_NSRange)rawRange
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

- (_NSRange)smartFieldRange
{
  _NSRange *p_smartFieldRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_smartFieldRange = &self->_smartFieldRange;
  location = self->_smartFieldRange.location;
  length = p_smartFieldRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (unint64_t)headChar
{
  return self->_headChar;
}

- (void)setHeadChar:(unint64_t)a3
{
  self->_headChar = a3;
}

- (unint64_t)tailChar
{
  return self->_tailChar;
}

- (void)setTailChar:(unint64_t)a3
{
  self->_tailChar = a3;
}

- (BOOL)leadingEdge
{
  return self->_leadingEdge;
}

- (unint64_t)leadingCharIndex
{
  return self->_leadingCharIndex;
}

- (int)caretAffinity
{
  return self->_caretAffinity;
}

- (BOOL)validVisualRanges
{
  return self->_validVisualRanges;
}

@end
