@implementation _UIEditMenuListPage

- (_UIEditMenuListPage)initWithStartIndex:(int64_t)a3
{
  _UIEditMenuListPage *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIEditMenuListPage;
  result = -[_UIEditMenuListPage init](&v5, sel_init);
  if (result)
  {
    result->_range.location = a3;
    result->_range.length = 0;
    result->_width = 0.0;
    result->_itemSpacing = 0.0;
    result->_numberOfItemsUsingItemSpacing = 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- (double)width
{
  double width;

  if (!self->_range.length)
    return 0.0;
  width = self->_width;
  return width
       + self->_itemSpacing
       * (double)-[_UIEditMenuListPage _resolvedNumberOfPagesForItemSpacing](self, "_resolvedNumberOfPagesForItemSpacing");
}

- (void)appendItemWithWidth:(double)a3
{
  self->_width = self->_width + a3;
  ++self->_range.length;
}

- (void)prependItemWithWidth:(double)a3
{
  --self->_range.location;
  -[_UIEditMenuListPage appendItemWithWidth:](self, "appendItemWithWidth:", a3);
}

- (void)removeLastItemWithWidth:(double)a3
{
  self->_width = self->_width - a3;
  --self->_range.length;
}

- (void)enforceMinimumWidth:(double)a3
{
  self->_width = fmax(a3, self->_width);
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSRange v10;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10.location = -[_UIEditMenuListPage range](self, "range");
  NSStringFromRange(v10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIEditMenuListPage width](self, "width");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: range: %@, page width %.2f>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (int64_t)_resolvedNumberOfPagesForItemSpacing
{
  int64_t numberOfItemsUsingItemSpacing;
  unint64_t v4;

  numberOfItemsUsingItemSpacing = self->_numberOfItemsUsingItemSpacing;
  if (numberOfItemsUsingItemSpacing == 0x7FFFFFFFFFFFFFFFLL)
    return self->_range.length - 1;
  if (numberOfItemsUsingItemSpacing <= 1)
    numberOfItemsUsingItemSpacing = 1;
  v4 = numberOfItemsUsingItemSpacing - 1;
  if (v4 >= self->_range.length - 1)
    return self->_range.length - 1;
  else
    return v4;
}

- (BOOL)isEqual:(id)a3
{
  _UIEditMenuListPage *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  BOOL v9;
  double v10;
  double v11;
  double v12;

  v4 = (_UIEditMenuListPage *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = -[_UIEditMenuListPage range](v4, "range");
      v7 = v6;
      v9 = 0;
      if (v5 == -[_UIEditMenuListPage range](self, "range") && v7 == v8)
      {
        -[_UIEditMenuListPage width](self, "width");
        v11 = v10;
        -[_UIEditMenuListPage width](v4, "width");
        v9 = v11 == v12;
      }
    }
    else
    {
      v9 = 0;
    }
  }

  return v9;
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

- (double)overlapWidth
{
  return self->_overlapWidth;
}

- (void)setOverlapWidth:(double)a3
{
  self->_overlapWidth = a3;
}

- (double)itemSpacing
{
  return self->_itemSpacing;
}

- (void)setItemSpacing:(double)a3
{
  self->_itemSpacing = a3;
}

- (int64_t)numberOfItemsUsingItemSpacing
{
  return self->_numberOfItemsUsingItemSpacing;
}

- (void)setNumberOfItemsUsingItemSpacing:(int64_t)a3
{
  self->_numberOfItemsUsingItemSpacing = a3;
}

@end
