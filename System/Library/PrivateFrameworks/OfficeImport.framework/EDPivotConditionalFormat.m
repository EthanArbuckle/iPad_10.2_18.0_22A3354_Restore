@implementation EDPivotConditionalFormat

- (EDPivotConditionalFormat)init
{
  EDPivotConditionalFormat *v2;
  EDPivotConditionalFormat *v3;
  EDCollection *v4;
  EDCollection *mPivotAreas;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDPivotConditionalFormat;
  v2 = -[EDPivotConditionalFormat init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->mPriority = 0;
    *(_QWORD *)&v2->mType = 0x300000004;
    v4 = objc_alloc_init(EDCollection);
    mPivotAreas = v3->mPivotAreas;
    v3->mPivotAreas = v4;

  }
  return v3;
}

+ (id)pivotConditionalFormat
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (unint64_t)priority
{
  return self->mPriority;
}

- (void)setPriority:(unint64_t)a3
{
  self->mPriority = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (int)scope
{
  return self->mScope;
}

- (void)setScope:(int)a3
{
  self->mScope = a3;
}

- (id)pivotAreas
{
  return self->mPivotAreas;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotConditionalFormat;
  -[EDPivotConditionalFormat description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPivotAreas, 0);
}

@end
