@implementation ODDShapeAdjustment

- (unsigned)index
{
  return self->mIndex;
}

- (void)setIndex:(unsigned int)a3
{
  self->mIndex = a3;
}

- (double)value
{
  return self->mValue;
}

- (void)setValue:(double)a3
{
  self->mValue = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ODDShapeAdjustment;
  -[ODDShapeAdjustment description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
