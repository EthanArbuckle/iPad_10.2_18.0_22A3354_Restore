@implementation TSTTableDataStore

- (TSTTableDataStore)initWithOwner:(id)a3
{
  TSTTableDataStore *v4;
  uint64_t v5;
  TSTTableTile *v6;
  uint64_t mNextRowStripID;
  TSTTableRBTreeNode_s *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)TSTTableDataStore;
  v4 = -[TSPContainedObject initWithOwner:](&v10, sel_initWithOwner_);
  if (v4)
  {
    v5 = objc_msgSend(a3, "context");
    v4->mStorageVersion = 3;
    v4->mNextRowStripID = 0;
    v4->mNextColumnStripID = 0;
    v4->mCellCount = 0;
    v4->mCellCountValid = 1;
    v4->mTileStorage = -[TSTTileIDKeyDict initWithOwner:]([TSTTileIDKeyDict alloc], "initWithOwner:", a3);
    v4->mRowHeaderStorage = -[TSTTableHeaderStorage initWithOwner:]([TSTTableHeaderStorage alloc], "initWithOwner:", a3);
    v4->mColumnHeaderStorageReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableHeaderStorageBucket initWithContext:]([TSTTableHeaderStorageBucket alloc], "initWithContext:", v5));
    v4->mRowTileIndex = 0;
    v4->mColumnTileIndex = 0;
    v6 = -[TSTTableTile initWithContext:]([TSTTableTile alloc], "initWithContext:", v5);
    mNextRowStripID = v4->mNextRowStripID;
    v4->mNextRowStripID = mNextRowStripID + 1;
    -[TSTTileIDKeyDict setTile:forID:](v4->mTileStorage, "setTile:forID:", v6, mNextRowStripID);
    v8 = (TSTTableRBTreeNode_s *)TSTTableRBTreeNewNode(0, mNextRowStripID);
    v4->mRowTileIndex = TSTTableRBTreeInsert(v4->mRowTileIndex, v8);
    v4->mStringTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 1, v5));
    v4->mStyleTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 4, v5));
    v4->mConditionalStyleSetTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 9, v5));
    v4->mFormatTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 2, v5));
    v4->mFormulaTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 3, v5));
    v4->mFormulaErrorTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 5, v5));
    v4->mRichTextPayloadTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 8, v5));
    v4->mCommentStorageTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 10, v5));
    v4->mMultipleChoiceListFormatTableReference = -[TSPLazyReference initWithTSPObject:]([TSPLazyReference alloc], "initWithTSPObject:", -[TSTTableDataList initWithType:context:]([TSTTableDataList alloc], "initWithType:context:", 7, v5));
    v4->mPasteboardCustomFormatList = 0;
    v4->mMergedCellRanges = 0;
    v4->mDrawableIsBeingCopied = 0;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  self->mTileStorage = 0;
  self->mRowHeaderStorage = 0;

  self->mColumnHeaderStorageReference = 0;
  self->mStringTableReference = 0;

  self->mStyleTableReference = 0;
  self->mFormatTableReference = 0;

  self->mFormulaTableReference = 0;
  self->mRichTextPayloadTableReference = 0;

  self->mCommentStorageTableReference = 0;
  self->mMultipleChoiceListFormatTableReference = 0;

  self->mPasteboardCustomFormatList = 0;
  self->mMergedCellRanges = 0;

  self->mFormulaErrorTableReference = 0;
  self->mConditionalStyleSetTableReference = 0;
  TSTTableRBTreeFree((void **)self->mRowTileIndex);
  TSTTableRBTreeFree((void **)self->mColumnTileIndex);
  v3.receiver = self;
  v3.super_class = (Class)TSTTableDataStore;
  -[TSTTableDataStore dealloc](&v3, sel_dealloc);
}

- (void)setDrawableIsBeingCopied:(BOOL)a3
{
  self->mDrawableIsBeingCopied = a3;
}

- (void)p_updateTileStorageToCurrentVersion
{
  -[TSTTileIDKeyDict applyFunction:withState:](self->mTileStorage, "applyFunction:withState:", p_upgradeTileRowInfos, self);
}

- (BOOL)needToUpgradeCellStorage
{
  return self->mStorageVersion < 3;
}

- (void)upgradeDataStoreCellStorage
{
  -[TSTTableDataStore p_updateTileStorageToCurrentVersion](self, "p_updateTileStorageToCurrentVersion");
  self->mStorageVersion = 3;
}

- (void)debugDump
{
  TSTTableRBTreeApply((uint64_t)self->mRowTileIndex, (uint64_t (*)(_QWORD, _QWORD, uint64_t))privateDumpTile, (uint64_t)self);
}

- (void)validate
{
  -[TSTTileIDKeyDict applyFunction:withState:](self->mTileStorage, "applyFunction:withState:", privateValidateTile, 0);
  TSTTableRBTreeValidate((uint64_t)self->mRowTileIndex);
  TSTTableRBTreeApply((uint64_t)self->mRowTileIndex, (uint64_t (*)(_QWORD, _QWORD, uint64_t))p_validateTileCB, (uint64_t)self);
}

@end
