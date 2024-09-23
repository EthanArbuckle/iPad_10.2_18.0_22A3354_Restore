@implementation PXStoryTransitionModel

- (PXStoryTransitionModel)initWithSegmentTransitionInfo:(id)a3 orderOutCompositionInfo:(id *)a4 orderInCompositionInfo:(id *)a5 transitionInfo:(id *)a6
{
  int64_t var1;
  int64_t var0;
  PXStoryTransitionModel *result;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;

  var1 = a3.var1;
  var0 = a3.var0;
  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransitionModel;
  result = -[PXStoryTransitionModel init](&v18, sel_init);
  if (result)
  {
    result->_segmentTransitionInfo.fromSegmentIdentifier = var0;
    result->_segmentTransitionInfo.toSegmentIdentifier = var1;
    v12 = *(_OWORD *)&a6->var0;
    v13 = *(_OWORD *)&a6->var2.var1;
    *(_QWORD *)&result->_transitionInfo.fallbackFromTransitionKind = *(_QWORD *)&a6->var3;
    *(_OWORD *)&result->_transitionInfo.orderOutTransition = v12;
    *(_OWORD *)&result->_transitionInfo.duration.timescale = v13;
    v14 = *(_OWORD *)&a4->var0;
    v15 = *(_OWORD *)&a4->var2;
    *(_QWORD *)&result->_orderOutCompositionInfo.mainDividerSplitRatio = a4->var4;
    *(_OWORD *)&result->_orderOutCompositionInfo.clipFramesExtendToBounds = v15;
    *(_OWORD *)&result->_transitionInfo.var1.scaleRelativeFactor = v14;
    v16 = *(_OWORD *)&a5->var0;
    v17 = *(_OWORD *)&a5->var2;
    *(_QWORD *)&result->_orderInCompositionInfo.mainDividerSplitRatio = a5->var4;
    *(_OWORD *)&result->_orderOutCompositionInfo.numberOfAssets = v16;
    *(_OWORD *)&result->_orderInCompositionInfo.clipFramesExtendToBounds = v17;
  }
  return result;
}

- (void)addClipWithIdentifier:(int64_t)a3 info:(id *)a4 event:(int64_t)a5
{
  int64_t capacity;
  int64_t count;
  int64_t *v11;
  _BYTE __dst[768];
  int64_t v13;

  capacity = self->_capacity;
  count = self->_count;
  self->_count = count + 1;
  v13 = capacity;
  _PXGArrayCapacityResizeToCount();
  self->_capacity = v13;
  v11 = &self->_clipInfos->var0 + 98 * count;
  memcpy(__dst, a4, sizeof(__dst));
  *v11 = a3;
  memcpy(v11 + 1, __dst, 0x300uLL);
  v11[97] = a5;
}

- (void)enumerateClipIdentifiersUsingBlock:(id)a3
{
  int64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(id, uint64_t, _BYTE *, uint64_t, char *);
  _BYTE v11[768];
  _BYTE __dst[768];
  char v13;

  v13 = 0;
  if (self->_count >= 1)
  {
    v5 = 0;
    v6 = 776;
    do
    {
      v7 = (int64_t *)((char *)&self->_clipInfos->var0 + v6);
      v8 = *(v7 - 97);
      memcpy(__dst, v7 - 96, sizeof(__dst));
      v9 = *v7;
      v10 = (void (*)(id, uint64_t, _BYTE *, uint64_t, char *))*((_QWORD *)a3 + 2);
      memcpy(v11, __dst, sizeof(v11));
      v10(a3, v8, v11, v9, &v13);
      if (v13)
        break;
      ++v5;
      v6 += 784;
    }
    while (v5 < self->_count);
  }
}

- (void)dealloc
{
  objc_super v3;

  free(self->_clipInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionModel;
  -[PXStoryTransitionModel dealloc](&v3, sel_dealloc);
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)segmentTransitionInfo
{
  int64_t toSegmentIdentifier;
  int64_t fromSegmentIdentifier;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  toSegmentIdentifier = self->_segmentTransitionInfo.toSegmentIdentifier;
  fromSegmentIdentifier = self->_segmentTransitionInfo.fromSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- ($C63E51281545771083DD8F52DBD4F646)transitionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var2.var1;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[1].var0;
  *(_OWORD *)&retstr->var2.var1 = v3;
  *(_QWORD *)&retstr->var3 = *(_QWORD *)&self[1].var3;
  return self;
}

- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderOutCompositionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[2].var1;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[3].var0;
  return self;
}

- ($5A4ED22E2CF2C812F70E33C35343ABA3)orderInCompositionInfo
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self[3].var1;
  *(_OWORD *)&retstr->var2 = v3;
  retstr->var4 = self[4].var0;
  return self;
}

@end
