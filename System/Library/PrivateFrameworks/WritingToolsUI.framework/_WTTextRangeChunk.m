@implementation _WTTextRangeChunk

- (_WTTextRangeChunk)initWithRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  _WTTextRangeChunk *v5;
  _WTTextRangeChunk *v6;
  _WTTextRangeChunk *v7;
  objc_super v9;

  length = a3.length;
  location = a3.location;
  v9.receiver = self;
  v9.super_class = (Class)_WTTextRangeChunk;
  v5 = -[_WTTextChunk init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_WTTextRangeChunk setRange:](v5, "setRange:", location, length);
    v7 = v6;
  }

  return v6;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (void *)objc_opt_new();
  v5 = -[_WTTextRangeChunk range](self, "range");
  objc_msgSend(v4, "setRange:", v5, v6);
  return v4;
}

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

- (void)setRange:(_NSRange)a3
{
  _NSRange v3;

  v3 = a3;
  objc_copyStruct(&self->_range, &v3, 16, 1, 0);
}

@end
