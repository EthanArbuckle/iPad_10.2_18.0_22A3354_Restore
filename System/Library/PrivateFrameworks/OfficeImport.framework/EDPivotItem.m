@implementation EDPivotItem

+ (id)pivotItem
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPivotItem)init
{
  EDPivotItem *v2;
  EDPivotItem *v3;
  EDCollection *v4;
  EDCollection *mItemIndexes;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDPivotItem;
  v2 = -[EDPivotItem init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)&v2->mRepeatedItemCounts = 0x100000000;
    v4 = objc_alloc_init(EDCollection);
    mItemIndexes = v3->mItemIndexes;
    v3->mItemIndexes = v4;

  }
  return v3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (id)itemIndexes
{
  return self->mItemIndexes;
}

- (unsigned)repeatedItemCounts
{
  return self->mRepeatedItemCounts;
}

- (int)type
{
  return self->mType;
}

- (void)setRepeatedItemCounts:(unsigned int)a3
{
  self->mRepeatedItemCounts = a3;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotItem;
  -[EDPivotItem description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mItemIndexes, 0);
}

@end
