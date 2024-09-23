@implementation TSDTextRange

+ (id)textRangeWithRange:(_NSRange)a3
{
  return (id)objc_msgSend(objc_alloc((Class)a1), "initWithRange:", a3.location, a3.length);
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
  return (id)objc_msgSend(v11, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", location, length, v8, v12, v13);
}

- (TSDTextRange)initWithRange:(_NSRange)a3
{
  double v3;
  double v4;

  LODWORD(v3) = 2143289344;
  LODWORD(v4) = 2143289344;
  return -[TSDTextRange initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:](self, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", a3.location, a3.length, 0, v3, v4);
}

- (TSDTextRange)initWithRange:(_NSRange)a3 eolAffinity:(BOOL)a4 preferredStartPosition:(float)a5 preferredEndPosition:(float)a6
{
  NSUInteger length;
  NSUInteger location;
  TSDTextRange *result;
  objc_super v12;

  length = a3.length;
  location = a3.location;
  v12.receiver = self;
  v12.super_class = (Class)TSDTextRange;
  result = -[TSDTextRange init](&v12, sel_init);
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
  void *v4;
  double v5;
  double v6;

  v4 = (void *)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3);
  *(float *)&v5 = self->_preferredStartPosition;
  *(float *)&v6 = self->_preferredEndPosition;
  return (id)objc_msgSend(v4, "initWithRange:eolAffinity:preferredStartPosition:preferredEndPosition:", self->_range.location, self->_range.length, self->_eolAffinity, v5, v6);
}

- (id)start
{
  double v2;

  if (self->_range.location == 0x7FFFFFFFFFFFFFFFLL)
    return +[TSDTextPosition textPositionWithCharIndex:](TSDTextPosition, "textPositionWithCharIndex:", 0);
  *(float *)&v2 = self->_preferredStartPosition;
  return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v2);
}

- (id)end
{
  double v2;
  NSUInteger location;
  NSUInteger length;
  NSUInteger v6;
  _BOOL8 eolAffinity;

  location = self->_range.location;
  if (location == 0x7FFFFFFFFFFFFFFFLL)
    return +[TSDTextPosition textPositionWithCharIndex:](TSDTextPosition, "textPositionWithCharIndex:", 0);
  length = self->_range.length;
  v6 = length + location;
  if (length)
    eolAffinity = 0;
  else
    eolAffinity = self->_eolAffinity;
  *(float *)&v2 = self->_preferredEndPosition;
  return +[TSDTextPosition textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:](TSDTextPosition, "textPositionWithCharIndex:eolAffinity:preferredPosition:isPreferredStart:", v6, eolAffinity, 0, v2);
}

- (BOOL)isEmpty
{
  return self->_range.length == 0;
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4;
  NSUInteger length;

  objc_opt_class();
  v4 = TSUDynamicCast();
  if (v4)
  {
    length = self->_range.length;
    if (self->_range.location == *(_QWORD *)(v4 + 16) && length == *(_QWORD *)(v4 + 24))
    {
      if (length)
        LOBYTE(v4) = 1;
      else
        LOBYTE(v4) = self->_eolAffinity == *(unsigned __int8 *)(v4 + 32);
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }
  return v4;
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
