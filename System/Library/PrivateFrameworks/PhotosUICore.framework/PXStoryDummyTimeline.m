@implementation PXStoryDummyTimeline

- (PXStoryDummyTimeline)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDummyTimeline.m"), 40, CFSTR("%s is not available as initializer"), "-[PXStoryDummyTimeline init]");

  abort();
}

- (PXStoryDummyTimeline)initWithSize:(CGSize)a3
{
  CGFloat height;
  CGFloat width;
  char *v5;
  PXStoryDummyTimeline *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *clipsByIdentifier;
  NSCountedSet *v9;
  NSCountedSet *resourceOccurrenceCounts;
  objc_super v12;

  height = a3.height;
  width = a3.width;
  v12.receiver = self;
  v12.super_class = (Class)PXStoryDummyTimeline;
  v5 = -[PXStoryDummyTimeline init](&v12, sel_init);
  v6 = (PXStoryDummyTimeline *)v5;
  if (v5)
  {
    *(_OWORD *)(v5 + 8) = 0u;
    *(_OWORD *)(v5 + 24) = 0u;
    *(_OWORD *)(v5 + 40) = 0u;
    *((CGFloat *)v5 + 18) = width;
    *((CGFloat *)v5 + 19) = height;
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    clipsByIdentifier = v6->_clipsByIdentifier;
    v6->_clipsByIdentifier = v7;

    v9 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    resourceOccurrenceCounts = v6->_resourceOccurrenceCounts;
    v6->_resourceOccurrenceCounts = v9;

  }
  return v6;
}

- (PXStoryDummyTimeline)initWithTimeline:(id)a3
{
  char *v4;
  PXStoryDummyTimeline *v5;
  PXStoryDummyTimeline *v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  NSCountedSet *resourceOccurrenceCounts;

  v4 = (char *)a3;
  objc_msgSend(v4, "size");
  v5 = -[PXStoryDummyTimeline initWithSize:](self, "initWithSize:");
  v6 = v5;
  if (v5)
  {
    v8 = *(_OWORD *)(v4 + 24);
    v7 = *(_OWORD *)(v4 + 40);
    *(_OWORD *)&v5->_timeRange.start.value = *(_OWORD *)(v4 + 8);
    *(_OWORD *)&v5->_timeRange.start.epoch = v8;
    *(_OWORD *)&v5->_timeRange.duration.timescale = v7;
    v9 = objc_msgSend(v4, "numberOfClips");
    -[PXStoryDummyTimeline setNumberOfClips:](v6, "setNumberOfClips:", v9);
    if (v9 >= 1)
    {
      memcpy(v6->_clipTimeRanges, *((const void **)v4 + 8), 48 * v9);
      memcpy(v6->_clipFrames, *((const void **)v4 + 9), 32 * v9);
      memcpy(v6->_clipInfos, *((const void **)v4 + 10), 768 * v9);
    }
    v10 = objc_msgSend(v4, "numberOfSegments");
    -[PXStoryDummyTimeline setNumberOfSegments:](v6, "setNumberOfSegments:", v10);
    if (v10 >= 1)
    {
      memcpy(v6->_segmentTimeRanges, *((const void **)v4 + 12), 48 * v10);
      memcpy(v6->_segmentInfos, *((const void **)v4 + 13), 200 * v10);
    }
    -[NSMutableDictionary setDictionary:](v6->_clipsByIdentifier, "setDictionary:", *((_QWORD *)v4 + 14));
    v11 = objc_msgSend(*((id *)v4 + 15), "copy");
    resourceOccurrenceCounts = v6->_resourceOccurrenceCounts;
    v6->_resourceOccurrenceCounts = (NSCountedSet *)v11;

  }
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_clipTimeRanges);
  free(self->_clipFrames);
  free(self->_clipInfos);
  free(self->_segmentTimeRanges);
  free(self->_segmentInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryDummyTimeline;
  -[PXStoryDummyTimeline dealloc](&v3, sel_dealloc);
}

- (void)setNumberOfClips:(int64_t)a3
{
  int64_t clipCapacity;

  if (self->_numberOfClips != a3)
  {
    self->_numberOfClips = a3;
    clipCapacity = self->_clipCapacity;
    if (clipCapacity < a3)
    {
      if (clipCapacity)
      {
        do
        {
          clipCapacity *= 2;
          self->_clipCapacity = clipCapacity;
        }
        while (clipCapacity < self->_numberOfClips);
      }
      else
      {
        self->_clipCapacity = a3;
      }
      _PXGArrayResize();
      _PXGArrayResize();
      _PXGArrayResize();
    }
  }
}

- (void)setNumberOfSegments:(int64_t)a3
{
  int64_t segmentCapacity;

  if (self->_numberOfSegments != a3)
  {
    self->_numberOfSegments = a3;
    segmentCapacity = self->_segmentCapacity;
    if (segmentCapacity < a3)
    {
      if (segmentCapacity)
      {
        do
        {
          segmentCapacity *= 2;
          self->_segmentCapacity = segmentCapacity;
        }
        while (segmentCapacity < self->_numberOfSegments);
      }
      else
      {
        self->_segmentCapacity = a3;
      }
      _PXGArrayResize();
      _PXGArrayResize();
    }
  }
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v6;
  id v7;

  v6 = a5;
  -[PXStoryDummyTimeline numberOfClips](self, "numberOfClips");
  v7 = v6;
  PXEnumerateSubrangesMatchingTestUsingBlock();

}

- (id)clipWithIdentifier:(int64_t)a3
{
  NSMutableDictionary *clipsByIdentifier;
  void *v4;
  void *v5;

  clipsByIdentifier = self->_clipsByIdentifier;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](clipsByIdentifier, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[PXStoryDummyTimeline numberOfSegments](self, "numberOfSegments");
  v6 = v5;
  PXEnumerateSubrangesMatchingTestUsingBlock();

}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PXStoryDummyTimeline initWithTimeline:]([PXStoryMutableDummyTimeline alloc], "initWithTimeline:", self);
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self->var1.var0;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self->var0.var1;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self->var1.var3;
  return self;
}

- (CGSize)size
{
  double width;
  double height;
  CGSize result;

  width = self->_size.width;
  height = self->_size.height;
  result.height = height;
  result.width = width;
  return result;
}

- (int64_t)numberOfSegments
{
  return self->_numberOfSegments;
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourceOccurrenceCounts, 0);
  objc_storeStrong((id *)&self->_clipsByIdentifier, 0);
}

BOOL __64__PXStoryDummyTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];

  v2 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 48 * a2);
  v3 = *(_OWORD *)(a1 + 56);
  v7[0] = *(_OWORD *)(a1 + 40);
  v7[1] = v3;
  v7[2] = *(_OWORD *)(a1 + 72);
  v4 = v2[1];
  v6[0] = *v2;
  v6[1] = v4;
  v6[2] = v2[2];
  return PXStoryTimeRangeIntersectsTimeRange(v7, v6);
}

uint64_t __64__PXStoryDummyTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 96) + 48 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 200 * a2, a4);
}

BOOL __66__PXStoryDummyTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _OWORD *v4;
  __int128 v5;
  __int128 v6;
  _BOOL8 result;
  _OWORD v8[3];
  _OWORD v9[3];

  v4 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 48 * a2);
  v5 = v4[1];
  v9[0] = *v4;
  v9[1] = v5;
  v9[2] = v4[2];
  v6 = *(_OWORD *)(a1 + 88);
  v8[0] = *(_OWORD *)(a1 + 72);
  v8[1] = v6;
  v8[2] = *(_OWORD *)(a1 + 104);
  result = PXStoryTimeRangeIntersectsTimeRange(v9, v8);
  if (result)
    return CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 32 * a2), *(CGRect *)(a1 + 40));
  return result;
}

uint64_t __66__PXStoryDummyTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 48 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 32 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 768 * a2, a4);
}

@end
