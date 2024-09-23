@implementation NSCountableTextRange

- (_NSRange)range
{
  NSUInteger v2;
  NSUInteger v3;
  _QWORD v4[2];
  _NSRange result;

  objc_copyStruct(v4, &self->_range, 16, 1, 0);
  v2 = v4[0];
  v3 = v4[1];
  result.length = v3;
  result.location = v2;
  return result;
}

- (BOOL)isNotEmpty
{
  return self->_range.length != 0;
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (NSCountableTextRange)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSCountableTextLocation *v9;
  NSCountableTextLocation *v10;
  NSCountableTextLocation *v11;
  NSCountableTextRange *v12;
  NSCountableTextRange *v13;
  objc_super v15;
  NSRange v16;

  length = a3.length;
  location = a3.location;
  if (a3.location >= 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = (void *)MEMORY[0x1E0C99DA0];
    v7 = *MEMORY[0x1E0C99778];
    v8 = objc_opt_class();
    v16.location = location;
    v16.length = length;
    objc_msgSend(v6, "raise:format:", v7, CFSTR("-[%@ initWithRange:] initialized with invalid range %@"), v8, NSStringFromRange(v16));
  }
  v9 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", location);
  if (length)
  {
    if (length < 0x7FFFFFFFFFFFFFFFLL)
      v10 = -[NSCountableTextLocation initWithIndex:]([NSCountableTextLocation alloc], "initWithIndex:", location + length);
    else
      v10 = +[NSCountableTextLocation endOfDocumentLocation](NSCountableTextLocation, "endOfDocumentLocation");
    v11 = v10;
  }
  else
  {
    v11 = 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)NSCountableTextRange;
  v12 = -[NSTextRange initWithLocation:endLocation:](&v15, sel_initWithLocation_endLocation_, v9, v11);
  v13 = v12;
  if (v12)
  {
    v12->_range.location = location;
    v12->_range.length = length;
  }

  return v13;
}

- (BOOL)containsLocation:(id)a3
{
  void *v5;
  unint64_t v6;
  _BOOL4 v7;
  NSUInteger location;
  NSUInteger v10;
  BOOL v11;
  objc_super v12;

  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)objc_msgSend(a3, "type"),
        objc_msgSend(v5, "isEqualToString:", NSTextLocationTypeCountable)))
  {
    v6 = objc_msgSend(a3, "characterIndex");
    v7 = -[NSCountableTextRange isEndingAtEOD](self, "isEndingAtEOD");
    location = self->_range.location;
    if (v7)
    {
      return v6 >= location;
    }
    else
    {
      v11 = v6 >= location;
      v10 = v6 - location;
      v11 = !v11 || v10 >= self->_range.length;
      return !v11;
    }
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)NSCountableTextRange;
    return -[NSTextRange containsLocation:](&v12, sel_containsLocation_, a3);
  }
}

- (BOOL)isEndingAtEOD
{
  return self->_range.length > 0x7FFFFFFFFFFFFFFELL;
}

- (id)textRangeByIntersectingWithTextRange:(id)a3
{
  void *v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  int v9;
  NSUInteger location;
  void *v11;
  NSCountableTextRange *v12;
  NSRange v14;
  NSUInteger v15;
  NSUInteger length;
  uint64_t v18;
  objc_super v20;
  NSRange v21;

  if (__NSBaseClassDebugging
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v5 = (void *)objc_msgSend(a3, "type"),
        !objc_msgSend(v5, "isEqualToString:", NSTextLocationTypeCountable)))
  {
    v20.receiver = self;
    v20.super_class = (Class)NSCountableTextRange;
    return -[NSTextRange textRangeByIntersectingWithTextRange:](&v20, sel_textRangeByIntersectingWithTextRange_, a3);
  }
  v6 = objc_msgSend(a3, "range");
  v8 = v7;
  if (-[NSCountableTextRange isEndingAtEOD](self, "isEndingAtEOD"))
  {
    v9 = objc_msgSend(a3, "isEndingAtEOD");
    location = self->_range.location;
    if (v9)
    {
      if (location <= v6)
        v11 = a3;
      else
        v11 = self;
      v12 = v11;
      return v12;
    }
    if (location <= v6)
      goto LABEL_26;
    length = v6 + v8 - location;
    v15 = self->_range.location;
  }
  else
  {
    v21.location = v6;
    v21.length = v8;
    v14 = NSIntersectionRange(self->_range, v21);
    v15 = v14.location;
    length = v14.length;
    location = self->_range.location;
  }
  if (location == v15 && self->_range.length == length)
  {
    v12 = self;
    return v12;
  }
  if (objc_msgSend(a3, "range") == v15 && v18 == length)
  {
LABEL_26:
    v12 = (NSCountableTextRange *)a3;
    return v12;
  }
  if (length)
  {
    v12 = (NSCountableTextRange *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v15, length);
    return v12;
  }
  return 0;
}

- (id)textRangeByFormingUnionWithTextRange:(id)a3
{
  void *v5;
  NSUInteger v6;
  int v7;
  NSUInteger location;
  void *v9;
  NSUInteger v11;
  NSRange v12;
  NSUInteger length;
  uint64_t v15;
  id v17;
  objc_super v18;
  NSRange v19;

  if (__NSBaseClassDebugging
    || (objc_opt_respondsToSelector() & 1) == 0
    || (v5 = (void *)objc_msgSend(a3, "type"),
        !objc_msgSend(v5, "isEqualToString:", NSTextLocationTypeCountable)))
  {
    v18.receiver = self;
    v18.super_class = (Class)NSCountableTextRange;
    return -[NSTextRange textRangeByFormingUnionWithTextRange:](&v18, sel_textRangeByFormingUnionWithTextRange_, a3);
  }
  v6 = objc_msgSend(a3, "range");
  if (-[NSCountableTextRange isEndingAtEOD](self, "isEndingAtEOD"))
  {
    v7 = objc_msgSend(a3, "isEndingAtEOD");
    location = self->_range.location;
    if (v7)
    {
      if (location >= v6)
        v9 = a3;
      else
        v9 = self;
      return v9;
    }
    if (location <= v6)
      return self;
    length = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    v19.location = objc_msgSend(a3, "range");
    v19.length = v11;
    v12 = NSUnionRange(self->_range, v19);
    v6 = v12.location;
    length = v12.length;
    location = self->_range.location;
  }
  if (location == v6 && self->_range.length == length)
    return self;
  if (objc_msgSend(a3, "range") != v6 || v15 != length)
    return (id)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithRange:", v6, length);
  v17 = a3;
  return v17;
}

- (BOOL)isEqualToTextRange:(id)a3
{
  void *v5;
  _NSRange *p_range;
  uint64_t v7;
  objc_super v10;

  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)objc_msgSend(a3, "type"),
        objc_msgSend(v5, "isEqualToString:", NSTextLocationTypeCountable)))
  {
    p_range = &self->_range;
    return p_range->location == objc_msgSend(a3, "range") && p_range->length == v7;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSCountableTextRange;
    return -[NSTextRange isEqualToTextRange:](&v10, sel_isEqualToTextRange_, a3);
  }
}

- (NSString)type
{
  return (NSString *)NSTextLocationTypeCountable;
}

+ (BOOL)isBaseClassTestingMode
{
  return __NSBaseClassDebugging;
}

+ (void)setBaseClassTestingMode:(BOOL)a3
{
  __NSBaseClassDebugging = a3;
}

+ (NSCountableTextRange)documentRange
{
  if (documentRange_onceToken != -1)
    dispatch_once(&documentRange_onceToken, &__block_literal_global_140);
  return (NSCountableTextRange *)documentRange_textRange;
}

NSCountableTextRange *__37__NSCountableTextRange_documentRange__block_invoke()
{
  NSCountableTextRange *result;

  result = -[NSCountableTextRange initWithRange:]([NSCountableTextRange alloc], "initWithRange:", 0, 0x7FFFFFFFFFFFFFFFLL);
  documentRange_textRange = (uint64_t)result;
  return result;
}

- (id)debugDescription
{
  NSUInteger length;
  void *v4;
  uint64_t v5;
  NSRange v6;

  length = self->_range.length;
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6.location = -[NSCountableTextRange range](self, "range");
  if (length > 0x7FFFFFFFFFFFFFFELL)
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: {%lu, <EOD>}"), v5, v6.location);
  else
    return (id)objc_msgSend(v4, "stringWithFormat:", CFSTR("%@: %@"), v5, NSStringFromRange(v6));
}

- (NSCountableTextRange)initWithLocation:(id)a3 endLocation:(id)a4
{
  void *v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7 = (void *)objc_msgSend(a3, "type");
    if (objc_msgSend(v7, "isEqualToString:", NSTextLocationTypeCountable))
    {
      if (!a4)
      {
        v10 = objc_msgSend(a3, "characterIndex");
        goto LABEL_10;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        v8 = (void *)objc_msgSend(a4, "type");
        if (objc_msgSend(v8, "isEqualToString:", NSTextLocationTypeCountable))
        {
          v9 = objc_msgSend(a4, "characterIndex");
          if (v9 >= objc_msgSend(a3, "characterIndex"))
          {
            v10 = objc_msgSend(a3, "characterIndex");
            goto LABEL_8;
          }
        }
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("-[%@ initWithLocation:endLocation:] initialized with locations {%@ %@}"), objc_opt_class(), a3, a4);
  v10 = objc_msgSend(a3, "characterIndex");
  if (a4)
  {
LABEL_8:
    v11 = a4;
    goto LABEL_11;
  }
LABEL_10:
  v11 = a3;
LABEL_11:
  v12 = objc_msgSend(v11, "characterIndex");
  v13 = v12 - v10;
  if (v12 >= 0x7FFFFFFFFFFFFFFFLL)
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 >= v10)
    v14 = v10;
  else
    v14 = 0x7FFFFFFFFFFFFFFFLL;
  if (v12 >= v10)
    v15 = v13;
  else
    v15 = 0;
  return -[NSCountableTextRange initWithRange:](self, "initWithRange:", v14, v15);
}

- (unint64_t)hash
{
  return self->_range.length + self->_range.location;
}

- (BOOL)intersectsWithTextRange:(id)a3
{
  void *v5;
  NSUInteger v7;
  uint64_t v8;
  uint64_t v9;
  objc_super v10;
  NSRange v11;

  if (!__NSBaseClassDebugging
    && (objc_opt_respondsToSelector() & 1) != 0
    && (v5 = (void *)objc_msgSend(a3, "type"),
        objc_msgSend(v5, "isEqualToString:", NSTextLocationTypeCountable)))
  {
    if (-[NSCountableTextRange isEndingAtEOD](self, "isEndingAtEOD"))
    {
      if ((objc_msgSend(a3, "isEndingAtEOD") & 1) != 0)
      {
        return 1;
      }
      else
      {
        v8 = objc_msgSend(a3, "range");
        return v8 + v9 > self->_range.location;
      }
    }
    else
    {
      v11.location = objc_msgSend(a3, "range");
      v11.length = v7;
      return NSIntersectionRange((NSRange)self[24], v11).length != 0;
    }
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)NSCountableTextRange;
    return -[NSTextRange intersectsWithTextRange:](&v10, sel_intersectsWithTextRange_, a3);
  }
}

@end
