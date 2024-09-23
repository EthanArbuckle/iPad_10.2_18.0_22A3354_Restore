@implementation PXReloadingVisualPositionsChangeDetails

- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[PXReloadingVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:](self, "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:reloadAllIncludingAnchor:", a3, a4, a5, a6, a7, a8, v9);
}

- (PXReloadingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 reloadAllIncludingAnchor:(BOOL)a9
{
  PXReloadingVisualPositionsChangeDetails *result;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXReloadingVisualPositionsChangeDetails;
  result = -[PXVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:](&v10, sel_initWithCountBeforeChanges_anchorIndexBeforeChanges_headerIndexesBeforeChanges_countAfterChanges_anchorIndexAfterChanges_headerIndexesAfterChanges_, a3, a4, a5, a6, a7, a8);
  if (result)
    result->_reloadAnchor = a9;
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  int64_t v10;

  retstr->var0 = 0;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  v10 = self->_reloadAnchor || a4 != v7;
  retstr->var0 = (int64_t)result + a4 - v7;
  retstr->var1 = v10;
  retstr->var2 = v10 ^ 1;
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  int64_t v10;

  retstr->var0 = 0;
  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  v10 = self->_reloadAnchor || a4 != v7;
  retstr->var0 = (int64_t)result + a4 - v7;
  retstr->var1 = v10;
  retstr->var2 = v10 ^ 1;
  return result;
}

@end
