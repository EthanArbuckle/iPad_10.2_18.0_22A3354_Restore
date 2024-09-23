@implementation EDPivotFieldItem

+ (id)pivotFieldItem
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPivotFieldItem)init
{
  EDPivotFieldItem *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotFieldItem;
  result = -[EDPivotFieldItem init](&v3, sel_init);
  if (result)
  {
    *(_WORD *)&result->mHidden = 0;
    *(_DWORD *)&result->mChildItems = 0;
    result->mType = 1;
    result->mItemIndex = 0;
  }
  return result;
}

- (void)setChildItems:(BOOL)a3
{
  self->mChildItems = a3;
}

- (void)setExpanded:(BOOL)a3
{
  self->mExpanded = a3;
}

- (void)setCalculatedMember:(BOOL)a3
{
  self->mCalculatedMember = a3;
}

- (void)setMissed:(BOOL)a3
{
  self->mMissed = a3;
}

- (void)setHidden:(BOOL)a3
{
  self->mHidden = a3;
}

- (void)setDetailsHidden:(BOOL)a3
{
  self->mDetailsHidden = a3;
}

- (void)setItemIndex:(unint64_t)a3
{
  self->mItemIndex = a3;
}

- (void)setType:(int)a3
{
  self->mType = a3;
}

- (BOOL)childItems
{
  return self->mChildItems;
}

- (BOOL)expanded
{
  return self->mExpanded;
}

- (BOOL)calculatedMember
{
  return self->mCalculatedMember;
}

- (BOOL)missed
{
  return self->mMissed;
}

- (BOOL)hidden
{
  return self->mHidden;
}

- (BOOL)detailsHidden
{
  return self->mDetailsHidden;
}

- (unint64_t)itemIndex
{
  return self->mItemIndex;
}

- (int)type
{
  return self->mType;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotFieldItem;
  -[EDPivotFieldItem description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

@end
