@implementation EDPivotField

+ (id)pivotField
{
  return objc_alloc_init((Class)objc_opt_class());
}

- (EDPivotField)init
{
  EDPivotField *v2;
  EDPivotField *v3;
  EDCollection *v4;
  EDCollection *mPivotFieldItems;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)EDPivotField;
  v2 = -[EDPivotField init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->mOutlineItems = 0;
    *(_QWORD *)&v2->mAxis = 3;
    v2->mNumFmtId = 0;
    v4 = objc_alloc_init(EDCollection);
    mPivotFieldItems = v3->mPivotFieldItems;
    v3->mPivotFieldItems = v4;

  }
  return v3;
}

- (void)setNumFmtId:(unint64_t)a3
{
  self->mNumFmtId = a3;
}

- (void)setAxis:(int)a3
{
  self->mAxis = a3;
}

- (void)setCompact:(BOOL)a3
{
  self->mCompact = a3;
}

- (void)setDataField:(BOOL)a3
{
  self->mDataField = a3;
}

- (void)setShowDefaultSubTotal:(BOOL)a3
{
  self->mShowDefaultSubTotal = a3;
}

- (void)setInsertBlankRow:(BOOL)a3
{
  self->mInsertBlankRow = a3;
}

- (void)setOutlineItems:(BOOL)a3
{
  self->mOutlineItems = a3;
}

- (void)setShowAllItems:(BOOL)a3
{
  self->mShowAllItems = a3;
}

- (void)setSubtotalTop:(BOOL)a3
{
  self->mSubtotalTop = a3;
}

- (id)pivotFieldItems
{
  return self->mPivotFieldItems;
}

- (BOOL)compact
{
  return self->mCompact;
}

- (BOOL)dataField
{
  return self->mDataField;
}

- (BOOL)showDefaultSubTotal
{
  return self->mShowDefaultSubTotal;
}

- (BOOL)insertBlankRow
{
  return self->mInsertBlankRow;
}

- (BOOL)outlineItems
{
  return self->mOutlineItems;
}

- (BOOL)showAllItems
{
  return self->mShowAllItems;
}

- (BOOL)subtotalTop
{
  return self->mSubtotalTop;
}

- (unint64_t)numFmtId
{
  return self->mNumFmtId;
}

- (int)axis
{
  return self->mAxis;
}

- (id)description
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)EDPivotField;
  -[EDPivotField description](&v3, sel_description);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mPivotFieldItems, 0);
}

@end
