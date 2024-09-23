@implementation PXFanningVisualPositionsChangeDetails

- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8
{
  return -[PXFanningVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:](self, "initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:anchorFan:anchorReload:", a3, a4, a5, a6, a7, a8, 0, 0);
}

- (PXFanningVisualPositionsChangeDetails)initWithCountBeforeChanges:(int64_t)a3 anchorIndexBeforeChanges:(int64_t)a4 headerIndexesBeforeChanges:(id)a5 countAfterChanges:(int64_t)a6 anchorIndexAfterChanges:(int64_t)a7 headerIndexesAfterChanges:(id)a8 anchorFan:(int64_t)a9 anchorReload:(int64_t)a10
{
  PXFanningVisualPositionsChangeDetails *result;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PXFanningVisualPositionsChangeDetails;
  result = -[PXVisualPositionsChangeDetails initWithCountBeforeChanges:anchorIndexBeforeChanges:headerIndexesBeforeChanges:countAfterChanges:anchorIndexAfterChanges:headerIndexesAfterChanges:](&v11, sel_initWithCountBeforeChanges_anchorIndexBeforeChanges_headerIndexesBeforeChanges_countAfterChanges_anchorIndexAfterChanges_headerIndexesAfterChanges_, a3, a4, a5, a6, a7, a8);
  if (result)
  {
    result->_anchorFan = a9;
    result->_anchorReload = a10;
  }
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterApplyingChangesToBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  int64_t anchorFan;
  char *v10;
  int64_t v11;
  $5E4061BE7C3C8BB942C4587960135C41 *v12;
  char *v13;
  char v14;
  int64_t anchorReload;
  uint64_t v16;
  char *v17;
  int64_t v18;
  BOOL v20;

  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  if (a4 == v7)
  {
    retstr->var0 = (int64_t)result;
    return result;
  }
  anchorFan = self->_anchorFan;
  if ((anchorFan & 0x8000000000000000) == 0)
  {
    v10 = (char *)result + a4;
    if (a4 < v7)
    {
      v11 = v7 + anchorFan;
LABEL_8:
      v12 = ($5E4061BE7C3C8BB942C4587960135C41 *)&v10[-v11];
LABEL_13:
      retstr->var0 = (int64_t)v12;
      v14 = 1;
      goto LABEL_14;
    }
    v13 = &v10[-v7];
LABEL_12:
    v12 = ($5E4061BE7C3C8BB942C4587960135C41 *)&v13[anchorFan];
    goto LABEL_13;
  }
  v11 = anchorFan + v7;
  if (anchorFan + v7 > a4)
  {
    v10 = (char *)result + a4;
    goto LABEL_8;
  }
  if (v7 - anchorFan < a4)
  {
    v13 = (char *)result + a4 - v7;
    goto LABEL_12;
  }
  v14 = 0;
  retstr->var0 = (int64_t)result;
  retstr->var1 = 1;
  retstr->var2 = 0;
  v12 = result;
LABEL_14:
  anchorReload = self->_anchorReload;
  if (anchorReload >= 1)
  {
    v16 = anchorFan & ~(anchorFan >> 63);
    v17 = (char *)((char *)result - (char *)v12 - v16);
    v18 = (char *)v12 - (char *)result - v16;
    if ((uint64_t)v17 <= anchorReload && v18 <= anchorReload)
      v20 = 0;
    else
      v20 = v14;
    retstr->var2 = v20;
  }
  return result;
}

- ($5E4061BE7C3C8BB942C4587960135C41)bodyVisualPositionAfterRevertingChangesFromBodyIndex:(SEL)a3
{
  int64_t v7;
  $5E4061BE7C3C8BB942C4587960135C41 *result;
  int64_t anchorFan;
  int64_t v10;
  int64_t v11;
  char v12;
  int64_t anchorReload;
  uint64_t v14;
  int64_t v15;
  int64_t v16;
  BOOL v18;

  retstr->var1 = 0;
  *(_QWORD *)&retstr->var2 = 0;
  retstr->var0 = 0;
  retstr->var2 = 1;
  v7 = -[PXVisualPositionsChangeDetails anchorBodyIndexBeforeChanges](self, "anchorBodyIndexBeforeChanges");
  result = -[PXVisualPositionsChangeDetails anchorBodyIndexAfterChanges](self, "anchorBodyIndexAfterChanges");
  if (result == ($5E4061BE7C3C8BB942C4587960135C41 *)a4)
  {
    retstr->var0 = v7;
    return result;
  }
  anchorFan = self->_anchorFan;
  if (anchorFan < 0)
  {
    v10 = v7 + a4;
    if ((uint64_t)result <= a4)
    {
      v11 = v10 - ((_QWORD)result + anchorFan);
      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if ((uint64_t)result - anchorFan > a4)
  {
    v10 = v7 + a4;
LABEL_7:
    v11 = v10 - (_QWORD)result + anchorFan;
LABEL_11:
    retstr->var0 = v11;
    v12 = 1;
    goto LABEL_12;
  }
  if ((uint64_t)result + anchorFan < a4)
  {
    v11 = v7 + a4 - ((_QWORD)result + anchorFan);
    goto LABEL_11;
  }
  v12 = 0;
  retstr->var0 = v7;
  retstr->var1 = 1;
  retstr->var2 = 0;
  v11 = v7;
LABEL_12:
  anchorReload = self->_anchorReload;
  if (anchorReload >= 1)
  {
    v14 = anchorFan & (anchorFan >> 63);
    v15 = v14 + v7 - v11;
    v16 = v14 - v7 + v11;
    if (v15 <= anchorReload && v16 <= anchorReload)
      v18 = 0;
    else
      v18 = v12;
    retstr->var2 = v18;
  }
  return result;
}

@end
