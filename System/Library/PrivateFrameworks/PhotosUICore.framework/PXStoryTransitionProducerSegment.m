@implementation PXStoryTransitionProducerSegment

- (PXStoryTransitionProducerSegment)initWithSegmentInfo:(id *)a3
{
  char *v4;
  PXStoryTransitionProducerSegment *v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  NSMutableArray *v15;
  NSMutableArray *clipLayouts;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PXStoryTransitionProducerSegment;
  v4 = -[PXStoryTransitionProducerSegment init](&v18, sel_init);
  v5 = (PXStoryTransitionProducerSegment *)v4;
  if (v4)
  {
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&a3->var0;
    v6 = *(_OWORD *)&a3->var1.var1;
    v7 = *(_OWORD *)&a3->var1.var3;
    v8 = *(_OWORD *)&a3->var2.var0;
    *(_OWORD *)(v4 + 104) = *(_OWORD *)&a3->var2.var2.var1;
    *(_OWORD *)(v4 + 88) = v8;
    *(_OWORD *)(v4 + 72) = v7;
    *(_OWORD *)(v4 + 56) = v6;
    v9 = *(_OWORD *)&a3->var2.var3;
    v10 = *(_OWORD *)&a3->var3.var0.var0;
    v11 = *(_OWORD *)&a3->var3.var0.var3;
    *(_OWORD *)(v4 + 168) = *(_OWORD *)&a3->var3.var1.var1;
    *(_OWORD *)(v4 + 152) = v11;
    *(_OWORD *)(v4 + 136) = v10;
    *(_OWORD *)(v4 + 120) = v9;
    v12 = *(_OWORD *)&a3->var3.var2.var0;
    v13 = *(_OWORD *)&a3->var3.var2.var3;
    v14 = *(_OWORD *)&a3->var3.var3.var0.var1;
    *((_QWORD *)v4 + 29) = a3->var3.var3.var1;
    *(_OWORD *)(v4 + 216) = v14;
    *(_OWORD *)(v4 + 200) = v13;
    *(_OWORD *)(v4 + 184) = v12;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    clipLayouts = v5->_clipLayouts;
    v5->_clipLayouts = v15;

  }
  return v5;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_infos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryTransitionProducerSegment;
  -[PXStoryTransitionProducerSegment dealloc](&v3, sel_dealloc);
}

- (NSArray)clipLayouts
{
  return (NSArray *)(id)-[NSMutableArray copy](self->_clipLayouts, "copy");
}

- (void)addClipWithIdentifier:(int64_t)a3 layout:(id)a4 info:(id *)a5
{
  int64_t capacity;
  int64_t count;
  int64_t v9;

  -[NSMutableArray addObject:](self->_clipLayouts, "addObject:", a4);
  capacity = self->_capacity;
  count = self->_count;
  self->_count = count + 1;
  v9 = capacity;
  _PXGArrayCapacityResizeToCount();
  self->_capacity = v9;
  memcpy((char *)self->_infos + 768 * count, a5, 0x300uLL);
}

- (void)enumerateClipsUsingBlock:(id)a3
{
  int64_t count;
  uint64_t v5;
  uint64_t v6;
  int64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void (*v13)(_QWORD *, int64_t, int64_t, uint64_t, _BYTE *, void *, char *);
  _QWORD *v14;
  uint64_t v15;
  _BYTE __dst[775];
  char v17[9];

  v14 = a3;
  v17[0] = 0;
  count = self->_count;
  if (count >= 1)
  {
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = v14;
    do
    {
      v9 = (int64_t *)((char *)&self->_infos->var0 + v5);
      v10 = v9[1];
      v11 = 0x7FFFFFFFFFFFFFFFLL;
      if (v10 == 1)
        v11 = v6;
      v15 = v11;
      -[NSMutableArray objectAtIndexedSubscript:](self->_clipLayouts, "objectAtIndexedSubscript:", v7, v14);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void (*)(_QWORD *, int64_t, int64_t, uint64_t, _BYTE *, void *, char *))v8[2];
      memcpy(__dst, v9, 0x300uLL);
      v13(v8, count, v7, v15, __dst, v12, v17);

      if (v17[0])
        break;
      if (v10 == 1)
        ++v6;
      ++v7;
      count = self->_count;
      v5 += 768;
    }
    while (v7 < count);
  }

}

- ($09F85D15C0ED9C1985B34302C6989F26)segmentInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->var3.var3.var0.var3;
  v4 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)&self->var3.var4;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = v4;
  retstr->var3.var3.var1 = self[1].var1.var2;
  v5 = *(_OWORD *)&self->var3.var1.var0;
  v6 = *(_OWORD *)&self->var3.var2.var1;
  *(_OWORD *)&retstr->var3.var0.var0 = *(_OWORD *)&self->var3.var1.var3;
  *(_OWORD *)&retstr->var3.var0.var3 = v6;
  *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)&self->var3.var3.var0.var0;
  *(_OWORD *)&retstr->var3.var2.var0 = v3;
  v7 = *(_OWORD *)&self->var2.var2.var0;
  v8 = *(_OWORD *)&self->var2.var5.var0;
  *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)&self->var2.var2.var3;
  *(_OWORD *)&retstr->var2.var0 = v8;
  *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)&self->var3.var0.var1;
  *(_OWORD *)&retstr->var2.var3 = v5;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var4;
  *(_OWORD *)&retstr->var1.var1 = v7;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipLayouts, 0);
}

@end
