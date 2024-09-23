@implementation PXAnchorInsertingOrRemovingVisualPositionsChangeDetails

- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  uint64_t v9;

  LOBYTE(v9) = 0;
  return -[PXAnchorInsertingOrRemovingVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:](self, "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorInserted:relativePosition:", a3, a4, a5, a6, a7, a8, v9, 0);
}

- (PXAnchorInsertingOrRemovingVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorInserted:(BOOL)a9 relativePosition:(int64_t)a10
{
  PXAnchorInsertingOrRemovingVisualPositionsChangeDetails *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXAnchorInsertingOrRemovingVisualPositionsChangeDetails;
  result = -[PXVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:](&v11, sel_initWithCountBeforeChanges_anchorIndexBeforeChanges_headerIndexesBeforeChanges_countAfterChanges_anchorIndexAfterChanges_headerIndexesAfterChanges_, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    result->_anchorInserted = a9;
    result->_anchorRelativePosition = a10;
  }
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  char *v9;
  int64_t anchorRelativePosition;
  _BOOL4 anchorInserted;
  int64_t v12;

  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  v9 = (char *)result + a4 - v7;
  anchorRelativePosition = self->_anchorRelativePosition;
  retstr->var0 = (int64_t)v9;
  anchorInserted = self->_anchorInserted;
  if (anchorRelativePosition == 1)
  {
    if (self->_anchorInserted)
      --v9;
    else
      ++v9;
    retstr->var0 = (int64_t)v9;
  }
  if (anchorInserted)
  {
    if (anchorRelativePosition == 1)
    {
      ++v7;
    }
    else if (anchorRelativePosition)
    {
      v7 = 0;
    }
    if (v7 <= a4)
    {
      v12 = (int64_t)(v9 + 1);
LABEL_19:
      retstr->var0 = v12;
    }
  }
  else
  {
    if (a4 != v7)
    {
      if (a4 < v7)
        return result;
      v12 = (int64_t)(v9 - 1);
      goto LABEL_19;
    }
    if (anchorRelativePosition == 1)
      retstr->var0 = (int64_t)(v9 - 1);
    retstr->var1 = 1;
    retstr->var2 = 0;
  }
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  char *v9;
  int64_t anchorRelativePosition;
  _BOOL4 anchorInserted;
  int64_t v12;

  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  v9 = (char *)result + a4 - v7;
  anchorRelativePosition = self->_anchorRelativePosition;
  retstr->var0 = (int64_t)v9;
  anchorInserted = self->_anchorInserted;
  if (anchorRelativePosition == 1)
  {
    if (self->_anchorInserted)
      ++v9;
    else
      --v9;
    retstr->var0 = (int64_t)v9;
  }
  if (anchorInserted)
  {
    if (a4 == v7)
    {
      if (anchorRelativePosition == 1)
        retstr->var0 = (int64_t)(v9 - 1);
      retstr->var1 = 1;
      retstr->var2 = 0;
      return result;
    }
    if (a4 < v7)
      return result;
    v12 = (int64_t)(v9 - 1);
LABEL_19:
    retstr->var0 = v12;
    return result;
  }
  if (anchorRelativePosition == 1)
  {
    ++v7;
  }
  else if (anchorRelativePosition)
  {
    v7 = 0;
  }
  if (v7 <= a4)
  {
    v12 = (int64_t)(v9 + 1);
    goto LABEL_19;
  }
  return result;
}

@end
