@implementation EDPivotDataField

+ (id)pivotDataField
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPivotDataField)init
{
  EDPivotDataField *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotDataField;
  result = -[EDPivotDataField init](&v3, sel_init);
  if (result)
  {
    *(_OWORD *)&result->mFieldId = 0u;
    *(_OWORD *)&result->mBaseField = 0u;
    result->mFormat = 9;
  }
  return result;
}

- (void)setBaseField:(int64_t)a3
{
  self->mBaseField = a3;
}

- (void)setBaseItem:(unint64_t)a3
{
  self->mBaseItem = a3;
}

- (void)setFieldId:(unint64_t)a3
{
  self->mFieldId = a3;
}

- (void)setNumFmtId:(unint64_t)a3
{
  self->mNumFmtId = a3;
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

- (void)setShowDataAs:(int)a3
{
  self->mFormat = a3;
}

- (int64_t)baseField
{
  return self->mBaseField;
}

- (unint64_t)baseItem
{
  return self->mBaseItem;
}

- (unint64_t)fieldId
{
  return self->mFieldId;
}

- (unint64_t)numFmtId
{
  return self->mNumFmtId;
}

- (id)name
{
  return self->mName;
}

- (int)showDataAs
{
  return self->mFormat;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotDataField;
  -[EDPivotDataField description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mName, 0);
}

@end
