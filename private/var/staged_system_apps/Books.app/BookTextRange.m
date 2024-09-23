@implementation BookTextRange

+ (id)textRangeWithRange:(_NSRange)a3
{
  return objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
}

+ (id)textRangeWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  _BOOL8 v8;
  NSUInteger length;
  NSUInteger location;
  id v11;
  double v12;
  double v13;

  v8 = a4;
  length = a3.length;
  location = a3.location;
  v11 = objc_alloc((Class)a1);
  *(float *)&v12 = a5;
  *(float *)&v13 = a6;
  return objc_msgSend(v11, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", location, length, v8, v12, v13);
}

- (BookTextRange)initWithRange:(_NSRange)a3
{
  double v3;
  double v4;

  LODWORD(v3) = 2143289344;
  LODWORD(v4) = 2143289344;
  return -[BookTextRange initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](self, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", a3.location, a3.length, 0, v3, v4);
}

- (BookTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  NSUInteger length;
  NSUInteger location;
  BookTextRange *result;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)BookTextRange;
  result = -[BookTextRange init](&v12, "init");
  if (result)
  {
    result->_range.location = location;
    result->_range.length = length;
    result->_eolAffinity = a4;
    result->_preferredStartPosition = a5;
    result->_preferredEndPosition = a6;
  }
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  double v5;
  double v6;

  v4 = objc_msgSend((id)objc_opt_class(self), "allocWithZone:", a3);
  *(float *)&v5 = self->_preferredStartPosition;
  *(float *)&v6 = self->_preferredEndPosition;
  return objc_msgSend(v4, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", self->_range.location, self->_range.length, self->_eolAffinity, v5, v6);
}

- (id)start
{
  double v2;
  void *v3;

  if (self->_range.location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BookTextPosition textPositionWithCharIndex:](BookTextPosition, "textPositionWithCharIndex:", 0));
  }
  else
  {
    *(float *)&v2 = self->_preferredStartPosition;
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[BookTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](BookTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v2));
  }
  return v3;
}

- (id)end
{
  double v2;
  NSUInteger location;
  void *v4;
  NSUInteger length;
  NSUInteger v6;
  _BOOL8 eolAffinity;

  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BookTextPosition textPositionWithCharIndex:](BookTextPosition, "textPositionWithCharIndex:", 0));
  }
  else
  {
    length = self->_range.length;
    v6 = length + location;
    if (length)
      eolAffinity = 0;
    else
      eolAffinity = self->_eolAffinity;
    *(float *)&v2 = self->_preferredEndPosition;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BookTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](BookTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v6, eolAffinity, 0, v2));
  }
  return v4;
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger length;
  BOOL v9;
  BOOL v10;
  char v12;

  v4 = a3;
  v12 = 0;
  v5 = objc_opt_class(BookTextRange);
  v6 = __IMAccessibilityCastAsClass(v5, v4, 1, &v12);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (v12)
    abort();
  if (v7
    && ((length = self->_range.length, self->_range.location == *(_QWORD *)(v7 + 8))
      ? (v9 = length == *(_QWORD *)(v7 + 16))
      : (v9 = 0),
        v9))
  {
    if (length)
      v10 = 1;
    else
      v10 = self->_eolAffinity == *(unsigned __int8 *)(v7 + 24);
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)description
{
  uint64_t v3;
  NSString *v4;
  void *v5;
  void *v6;
  NSRange v8;

  v3 = objc_opt_class(self);
  v8.location = (NSUInteger)-[BookTextRange range](self, "range");
  v4 = NSStringFromRange(v8);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@ %p %@>"), v3, self, v5));

  return v6;
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

- (BOOL)isAtEndOfLine
{
  return self->_eolAffinity;
}

- (void)setIsAtEndOfLine:(BOOL)a3
{
  self->_eolAffinity = a3;
}

- (float)preferredStartPosition
{
  return self->_preferredStartPosition;
}

- (float)preferredEndPosition
{
  return self->_preferredEndPosition;
}

@end
