@implementation SBLineFragment

+ (id)fragmentWithIndex:(unint64_t)a3 length:(unint64_t)a4 lineWidth:(double)a5
{
  SBLineFragment *v8;

  v8 = objc_alloc_init(SBLineFragment);
  -[SBLineFragment setIndex:](v8, "setIndex:", a3);
  -[SBLineFragment setRange:](v8, "setRange:", a3, a4);
  -[SBLineFragment setLineWidth:](v8, "setLineWidth:", a5);
  return v8;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSRange v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  v9.location = -[SBLineFragment range](self, "range");
  NSStringFromRange(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLineFragment lineWidth](self, "lineWidth");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p; range: %@; lineWidth: %.1f>"), v4, self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (unint64_t)index
{
  return self->_index;
}

- (void)setIndex:(unint64_t)a3
{
  self->_index = a3;
}

- (_NSRange)range
{
  NSUInteger length;
  NSUInteger location;
  _NSRange result;

  length = self->_range.length;
  location = self->_range.location;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setRange:(_NSRange)a3
{
  self->_range = a3;
}

- (double)lineWidth
{
  return self->_lineWidth;
}

- (void)setLineWidth:(double)a3
{
  self->_lineWidth = a3;
}

@end
