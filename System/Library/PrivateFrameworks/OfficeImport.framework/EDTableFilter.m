@implementation EDTableFilter

+ (id)edTableFilter
{
  return objc_alloc_init(EDTableFilter);
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (double)filterValue
{
  return self->mFilterValue;
}

- (void)setFilterValue:(double)a3
{
  self->mFilterValue = a3;
}

- (int)scale
{
  return self->mScale;
}

- (void)setScale:(int)a3
{
  self->mScale = a3;
}

- (int)operatorType
{
  return self->mOperator;
}

- (void)setOperatorType:(int)a3
{
  self->mOperator = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDTableFilter;
  -[EDTableFilter description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
