@implementation AnchoredValuePair

- (double)size
{
  return self->_size;
}

+ (AnchoredValuePair)pairWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5
{
  return (AnchoredValuePair *)objc_msgSend(objc_alloc((Class)objc_opt_class(a1)), "initWithValue:size:layoutShift:", a5, a3, a4);
}

- (AnchoredValuePair)initWithValue:(double)a3 size:(double)a4 layoutShift:(BOOL)a5
{
  AnchoredValuePair *result;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AnchoredValuePair;
  result = -[AnchoredValuePair init](&v9, "init");
  if (result)
  {
    result->_value = a3;
    result->_size = a4;
    result->_layoutShift = a5;
  }
  return result;
}

- (double)value
{
  return self->_value;
}

- (id)description
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_opt_class(self);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_value));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", self->_size));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", self->_layoutShift));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("<%@: %p\t Value: %@\t Size: %@\t LayoutShift: %@>"), v3, self, v4, v5, v6));

  return v7;
}

- (void)setValue:(double)a3
{
  self->_value = a3;
}

- (void)setSize:(double)a3
{
  self->_size = a3;
}

- (BOOL)layoutShift
{
  return self->_layoutShift;
}

- (void)setLayoutShift:(BOOL)a3
{
  self->_layoutShift = a3;
}

@end
