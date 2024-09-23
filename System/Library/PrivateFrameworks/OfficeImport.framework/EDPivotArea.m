@implementation EDPivotArea

- (EDPivotArea)init
{
  EDPivotArea *v2;
  EDPivotArea *v3;
  EDCollection *v4;
  EDCollection *mReferences;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDPivotArea;
  v2 = -[EDPivotArea init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mGrandCol = 0;
    v2->mOutline = 0;
    v2->mType = 3;
    v4 = objc_alloc_init(EDCollection);
    mReferences = v3->mReferences;
    v3->mReferences = v4;

  }
  return v3;
}

+ (id)pivotArea
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (BOOL)grandRow
{
  return self->mGrandRow;
}

- (void)setGrandRow:(BOOL)a3
{
  self->mGrandRow = a3;
}

- (BOOL)grandCol
{
  return self->mGrandCol;
}

- (void)setGrandCol:(BOOL)a3
{
  self->mGrandCol = a3;
}

- (BOOL)outline
{
  return self->mOutline;
}

- (void)setOutline:(BOOL)a3
{
  self->mOutline = a3;
}

- (int)type
{
  return self->mType;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)offset
{
  return self->mOffset;
}

- (void)setOffset:(id)a3
{
  EDReference *v5;
  EDReference **p_mOffset;
  EDReference *mOffset;
  EDReference *v8;

  v5 = (EDReference *)a3;
  mOffset = self->mOffset;
  p_mOffset = &self->mOffset;
  if (mOffset != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)p_mOffset, a3);
    v5 = v8;
  }

}

- (id)references
{
  return self->mReferences;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotArea;
  -[EDPivotArea description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mOffset, 0);
  objc_storeStrong((id *)&self->mReferences, 0);
}

@end
