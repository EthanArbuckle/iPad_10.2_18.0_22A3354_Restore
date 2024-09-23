@implementation EDPivotAreaReference

- (EDPivotAreaReference)init
{
  EDPivotAreaReference *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotAreaReference;
  result = -[EDPivotAreaReference init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->mByPosition = 0;
    result->mSelected = 0;
    result->mFieldId = 0;
    result->mCount = 0;
  }
  return result;
}

+ (id)pivotAreaReference
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)byPosition
{
  return self->mByPosition;
}

- (void)setByPosition:(BOOL)a3
{
  self->mByPosition = a3;
}

- (BOOL)relative
{
  return self->mRelative;
}

- (void)setRelative:(BOOL)a3
{
  self->mRelative = a3;
}

- (BOOL)selected
{
  return self->mSelected;
}

- (void)setSelected:(BOOL)a3
{
  self->mSelected = a3;
}

- (unint64_t)fieldId
{
  return self->mFieldId;
}

- (void)setFieldId:(unint64_t)a3
{
  self->mFieldId = a3;
}

- (unint64_t)count
{
  return self->mCount;
}

- (void)setCount:(unint64_t)a3
{
  self->mCount = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotAreaReference;
  -[EDPivotAreaReference description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
