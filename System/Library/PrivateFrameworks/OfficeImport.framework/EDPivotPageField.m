@implementation EDPivotPageField

- (EDPivotPageField)init
{
  EDPivotPageField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotPageField;
  result = -[EDPivotPageField init](&v3, sel_init);
  if (result)
    result->mFieldId = 0;
  return result;
}

+ (id)pivotPageField
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (unint64_t)fieldId
{
  return self->mFieldId;
}

- (void)setFieldId:(unint64_t)a3
{
  self->mFieldId = a3;
}

- (id)name
{
  return self->mName;
}

- (void)setName:(id)a3
{
  NSString *v5;
  NSString **p_mName;
  NSString *mName;
  NSString *v8;

  v5 = (NSString *)a3;
  mName = self->mName;
  p_mName = &self->mName;
  if (mName != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mName, a3);
    v5 = v8;
  }

}

- (id)cap
{
  return self->mCap;
}

- (void)setCap:(id)a3
{
  NSString *v5;
  NSString **p_mCap;
  NSString *mCap;
  NSString *v8;

  v5 = (NSString *)a3;
  mCap = self->mCap;
  p_mCap = &self->mCap;
  if (mCap != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mCap, a3);
    v5 = v8;
  }

}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotPageField;
  -[EDPivotPageField description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
  objc_storeStrong((id *)&self->mCap, 0);
}

@end
