@implementation TLKGridImageItem

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  CGRect v9;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)TLKGridImageItem;
  -[TLKGridImageItem description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TLKGridImageItem frame](self, "frame");
  NSStringFromCGRect(v9);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ frame - %@"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (CGRect)frame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->frame.origin.x;
  y = self->frame.origin.y;
  width = self->frame.size.width;
  height = self->frame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  self->frame = a3;
}

- (_NSRange)columnRange
{
  _NSRange *p_columnRange;
  NSUInteger location;
  NSUInteger length;
  _NSRange result;

  p_columnRange = &self->columnRange;
  location = self->columnRange.location;
  length = p_columnRange->length;
  result.length = length;
  result.location = location;
  return result;
}

- (void)setColumnRange:(_NSRange)a3
{
  self->columnRange = a3;
}

- (unint64_t)row
{
  return self->row;
}

- (void)setRow:(unint64_t)a3
{
  self->row = a3;
}

- (double)horizontalHuggingPriority
{
  return self->horizontalHuggingPriority;
}

- (void)setHorizontalHuggingPriority:(double)a3
{
  self->horizontalHuggingPriority = a3;
}

- (double)horizontalCompressionResistance
{
  return self->horizontalCompressionResistance;
}

- (void)setHorizontalCompressionResistance:(double)a3
{
  self->horizontalCompressionResistance = a3;
}

- (NUISizeCache)sizeCache
{
  return self->sizeCache;
}

- (void)setSizeCache:(id)a3
{
  objc_storeStrong((id *)&self->sizeCache, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->sizeCache, 0);
}

@end
