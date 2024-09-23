@implementation PXStoryTransitionTimeline

- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3
{
  id v5;
  void *v6;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTransitionTimeline.m"), 53, CFSTR("%s is not available as initializer"), "-[PXStoryTransitionTimeline initWithOriginalTimeline:]");

  abort();
}

- (PXStoryTransitionTimeline)initWithOriginalTimeline:(id)a3 transitionInfo:(id)a4
{
  int64_t var1;
  int64_t var0;
  PXStoryTransitionTimeline *v6;
  NSMutableIndexSet *v7;
  NSMutableIndexSet *clipIdentifiersInTransition;
  uint64_t v9;
  PXCArrayStore *segmentTimeRanges;
  uint64_t v11;
  PXCArrayStore *segmentInfos;
  uint64_t v13;
  PXCArrayStore *clipTimeRanges;
  uint64_t v15;
  PXCArrayStore *clipFrames;
  uint64_t v17;
  PXCArrayStore *clipInfos;
  NSMutableDictionary *v19;
  NSMutableDictionary *originalClipIdentifiersByDuplicateClipIdentifiers;
  NSMutableDictionary *v21;
  NSMutableDictionary *duplicateClipIdentifiersByOriginalClipIdentifiers;
  objc_super v24;

  var1 = a4.var1;
  var0 = a4.var0;
  v24.receiver = self;
  v24.super_class = (Class)PXStoryTransitionTimeline;
  v6 = -[PXStoryDerivedTimeline initWithOriginalTimeline:](&v24, sel_initWithOriginalTimeline_, a3);
  if (v6)
  {
    v7 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    clipIdentifiersInTransition = v6->_clipIdentifiersInTransition;
    v6->_clipIdentifiersInTransition = v7;

    v9 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 48);
    segmentTimeRanges = v6->_segmentTimeRanges;
    v6->_segmentTimeRanges = (PXCArrayStore *)v9;

    v11 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 200);
    segmentInfos = v6->_segmentInfos;
    v6->_segmentInfos = (PXCArrayStore *)v11;

    v13 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 48);
    clipTimeRanges = v6->_clipTimeRanges;
    v6->_clipTimeRanges = (PXCArrayStore *)v13;

    v15 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 32);
    clipFrames = v6->_clipFrames;
    v6->_clipFrames = (PXCArrayStore *)v15;

    v17 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 768);
    clipInfos = v6->_clipInfos;
    v6->_clipInfos = (PXCArrayStore *)v17;

    v6->_transitionInfo.fromSegmentIdentifier = var0;
    v6->_transitionInfo.toSegmentIdentifier = var1;
    v6->_duplicateSegmentIdentifier = 0;
    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    originalClipIdentifiersByDuplicateClipIdentifiers = v6->_originalClipIdentifiersByDuplicateClipIdentifiers;
    v6->_originalClipIdentifiersByDuplicateClipIdentifiers = v19;

    v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    duplicateClipIdentifiersByOriginalClipIdentifiers = v6->_duplicateClipIdentifiersByOriginalClipIdentifiers;
    v6->_duplicateClipIdentifiersByOriginalClipIdentifiers = v21;

    -[PXStoryTransitionTimeline _prepareForTransitionInfo:](v6, "_prepareForTransitionInfo:", var0, var1);
  }
  return v6;
}

- (void)_prepareForTransitionInfo:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $EB79B37EDD75B660E5EC336E3C45010D *p_fromSegmentTimeRange;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  CGFloat v20;
  CGFloat v21;
  _QWORD v22[5];
  __int128 v23;
  __int128 v24;
  __int128 v25;

  if (a3.var0 | a3.var1)
  {
    -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[PXStoryTransitionTimeline transitionInfo](self, "transitionInfo");
    v7 = v6;
    objc_msgSend(v4, "frameForSegmentWithIdentifier:", v5);
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
    p_fromSegmentTimeRange = &self->_fromSegmentTimeRange;
    if (v4)
    {
      objc_msgSend(v4, "timeRangeForSegmentWithIdentifier:", v5);
    }
    else
    {
      v24 = 0u;
      v25 = 0u;
      v23 = 0u;
    }
    v17 = v24;
    *(_OWORD *)&p_fromSegmentTimeRange->start.value = v23;
    *(_OWORD *)&self->_fromSegmentTimeRange.start.epoch = v17;
    v18 = MEMORY[0x1E0C809B0];
    *(_OWORD *)&self->_fromSegmentTimeRange.duration.timescale = v25;
    v22[0] = v18;
    v22[1] = 3221225472;
    v22[2] = __55__PXStoryTransitionTimeline__prepareForTransitionInfo___block_invoke;
    v22[3] = &unk_1E512E1F0;
    v22[4] = self;
    v19 = *(_OWORD *)&self->_fromSegmentTimeRange.start.epoch;
    v23 = *(_OWORD *)&p_fromSegmentTimeRange->start.value;
    v24 = v19;
    v25 = *(_OWORD *)&self->_fromSegmentTimeRange.duration.timescale;
    objc_msgSend(v4, "enumerateClipsInTimeRange:rect:usingBlock:", &v23, v22, v9, v11, v13, v15);
    -[PXStoryTransitionTimeline _offsetBetweenSegmentWithIdentifier:andSegmentWithIdentifier:](self, "_offsetBetweenSegmentWithIdentifier:andSegmentWithIdentifier:", v5, v7);
    self->_fromSegmentClipOffset.x = v20;
    self->_fromSegmentClipOffset.y = v21;
    self->_duplicateSegmentIdentifier = v5 + 1000000;

  }
}

- (CGPoint)_offsetBetweenSegmentWithIdentifier:(int64_t)a3 andSegmentWithIdentifier:(int64_t)a4
{
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGPoint result;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frameForSegmentWithIdentifier:", a3);
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  objc_msgSend(v6, "frameForSegmentWithIdentifier:", a4);
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v30.origin.x = v8;
  v30.origin.y = v10;
  v30.size.width = v12;
  v30.size.height = v14;
  CGRectGetMinX(v30);
  v31.origin.x = v8;
  v31.origin.y = v10;
  v31.size.width = v12;
  v31.size.height = v14;
  CGRectGetMinY(v31);
  v32.origin.x = v16;
  v32.origin.y = v18;
  v32.size.width = v20;
  v32.size.height = v22;
  CGRectGetMinX(v32);
  v33.origin.x = v16;
  v33.origin.y = v18;
  v33.size.width = v20;
  v33.size.height = v22;
  CGRectGetMinY(v33);
  PXPointSubtract();
  v24 = v23;
  v26 = v25;

  v27 = v24;
  v28 = v26;
  result.y = v28;
  result.x = v27;
  return result;
}

- (void)_modifySegmentsIfNeeded:(id *)a3 infos:(id *)a4 count:(int64_t)a5 resultHandler:(id)a6
{
  id v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[5];
  id v15;
  int64_t v16;
  int64_t v17;
  const $09F85D15C0ED9C1985B34302C6989F26 *v18;
  const $DEC141BA10DB957F4DDC414EFF8F1C09 *v19;
  uint64_t v20;

  v10 = a6;
  v11 = -[PXStoryTransitionTimeline transitionInfo](self, "transitionInfo");
  -[PXStoryTransitionTimeline segmentTimeRanges](self, "segmentTimeRanges");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke;
  v14[3] = &unk_1E511FE40;
  v16 = a5 + 1;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = v11;
  v14[4] = self;
  v15 = v10;
  v13 = v10;
  objc_msgSend(v12, "accessArrayWithElementsCount:accessBlock:", a5 + 1, v14);

}

- (void)_modifyClipsIfNeeded:(id *)a3 frames:(const CGRect *)a4 infos:(id *)a5 count:(int64_t)a6 resultHandler:(id)a7
{
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  int64_t v19;
  const $C99EDD0FAA5CC172DE20AC79C6A499CF *v20;
  const CGRect *v21;
  const $DEC141BA10DB957F4DDC414EFF8F1C09 *v22;

  v12 = a7;
  v13 = -[NSMutableIndexSet count](self->_clipIdentifiersInTransition, "count") + a6;
  -[PXStoryTransitionTimeline clipTimeRanges](self, "clipTimeRanges");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke;
  v16[3] = &unk_1E511FE40;
  v18 = v13;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v16[4] = self;
  v17 = v12;
  v15 = v12;
  objc_msgSend(v14, "accessArrayWithElementsCount:accessBlock:", v13, v16);

}

- (int64_t)numberOfSegments
{
  void *v3;
  int64_t v4;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "numberOfSegments");

  if (self->_duplicateSegmentIdentifier)
    return v4 + 1;
  else
    return v4;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  id v9;
  _OWORD v10[3];
  _QWORD v11[5];
  id v12;

  v6 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke;
  v11[3] = &unk_1E511FEB8;
  v11[4] = self;
  v12 = v6;
  v8 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  v9 = v6;
  objc_msgSend(v7, "enumerateSegmentsInTimeRange:usingBlock:", v10, v11);

}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  void *v12;
  __int128 v13;
  id v14;
  _OWORD v15[3];
  _QWORD v16[5];
  id v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v16[3] = &unk_1E5129870;
  v16[4] = self;
  v17 = v11;
  v13 = *(_OWORD *)&a3->var0.var3;
  v15[0] = *(_OWORD *)&a3->var0.var0;
  v15[1] = v13;
  v15[2] = *(_OWORD *)&a3->var1.var1;
  v14 = v11;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v15, v16, x, y, width, height);

}

- (id)clipWithIdentifier:(int64_t)a3
{
  NSMutableDictionary *originalClipIdentifiersByDuplicateClipIdentifiers;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PXStoryTransitionClip *v10;
  PXStoryTransitionClip *v11;
  objc_super v13;
  _BYTE __dst[768];
  _BYTE v15[768];
  objc_super __src[48];
  objc_super v17;

  originalClipIdentifiersByDuplicateClipIdentifiers = self->_originalClipIdentifiersByDuplicateClipIdentifiers;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](originalClipIdentifiersByDuplicateClipIdentifiers, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v17.receiver = self;
    v17.super_class = (Class)PXStoryTransitionTimeline;
    -[PXStoryDerivedTimeline clipWithIdentifier:](&v17, sel_clipWithIdentifier_, objc_msgSend(v7, "integerValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    memset(__src, 0, 512);
    if (v8)
      objc_msgSend(v8, "info");
    else
      bzero(v15, 0x300uLL);
    -[PXStoryTransitionTimeline _transitionClipInfoWithIdentifier:fromOriginalClipInfo:](self, "_transitionClipInfoWithIdentifier:fromOriginalClipInfo:", a3, v15);
    v11 = [PXStoryTransitionClip alloc];
    memcpy(__dst, __src, sizeof(__dst));
    v10 = -[PXStoryTransitionClip initWithClipInfo:originalClip:](v11, "initWithClipInfo:originalClip:", __dst, v9);

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PXStoryTransitionTimeline;
    -[PXStoryDerivedTimeline clipWithIdentifier:](&v13, sel_clipWithIdentifier_, a3);
    v10 = (PXStoryTransitionClip *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

- ($C99EDD0FAA5CC172DE20AC79C6A499CF)_transitionClipInfoWithIdentifier:(SEL)a3 fromOriginalClipInfo:(int64_t)a4
{
  int64_t var5;
  $C99EDD0FAA5CC172DE20AC79C6A499CF *result;

  if ((unint64_t)(a5->var5 - 3) < 3)
    var5 = 1;
  else
    var5 = a5->var5;
  result = ($C99EDD0FAA5CC172DE20AC79C6A499CF *)memcpy(retstr, a5, 0x300uLL);
  retstr->var0 = a4;
  retstr->var5 = var5;
  return result;
}

- ($0AC6E346AE4835514AAA8AC86D8F4844)transitionInfo
{
  $8C9244E3D42D84E0B7FD6D08D56F93FB *p_transitionInfo;
  int64_t fromSegmentIdentifier;
  int64_t toSegmentIdentifier;
  $0AC6E346AE4835514AAA8AC86D8F4844 result;

  p_transitionInfo = &self->_transitionInfo;
  fromSegmentIdentifier = self->_transitionInfo.fromSegmentIdentifier;
  toSegmentIdentifier = p_transitionInfo->toSegmentIdentifier;
  result.var1 = toSegmentIdentifier;
  result.var0 = fromSegmentIdentifier;
  return result;
}

- (PXCArrayStore)segmentTimeRanges
{
  return self->_segmentTimeRanges;
}

- (PXCArrayStore)segmentInfos
{
  return self->_segmentInfos;
}

- (PXCArrayStore)clipTimeRanges
{
  return self->_clipTimeRanges;
}

- (PXCArrayStore)clipFrames
{
  return self->_clipFrames;
}

- (PXCArrayStore)clipInfos
{
  return self->_clipInfos;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clipInfos, 0);
  objc_storeStrong((id *)&self->_clipFrames, 0);
  objc_storeStrong((id *)&self->_clipTimeRanges, 0);
  objc_storeStrong((id *)&self->_segmentInfos, 0);
  objc_storeStrong((id *)&self->_segmentTimeRanges, 0);
  objc_storeStrong((id *)&self->_duplicateClipIdentifiersByOriginalClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_originalClipIdentifiersByDuplicateClipIdentifiers, 0);
  objc_storeStrong((id *)&self->_clipIdentifiersInTransition, 0);
}

void __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v12[3] = &unk_1E511FEE0;
  v11 = *(void **)(a1 + 32);
  v13 = *(id *)(a1 + 40);
  v14 = a6;
  objc_msgSend(v11, "_modifyClipsIfNeeded:frames:infos:count:resultHandler:", a3, a4, a5, a2, v12);

}

uint64_t __71__PXStoryTransitionTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a5, a2, a3, a4, *(_QWORD *)(a1 + 40));
}

void __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2;
  v10[3] = &unk_1E511FE90;
  v9 = *(void **)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = a5;
  objc_msgSend(v9, "_modifySegmentsIfNeeded:infos:count:resultHandler:", a3, a4, a2, v10);

}

uint64_t __69__PXStoryTransitionTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), a4, a2, a3, *(_QWORD *)(a1 + 40));
}

void __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "clipFrames");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_2;
  v8[3] = &unk_1E511FE68;
  v5 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[1] = 3221225472;
  v6 = *(_OWORD *)(a1 + 64);
  v10 = *(_OWORD *)(a1 + 48);
  v11 = v6;
  v7 = *(_QWORD *)(a1 + 80);
  v12 = a2;
  v13 = v7;
  v9 = v5;
  objc_msgSend(v4, "accessArrayWithElementsCount:accessBlock:", (_QWORD)v10, v8);

}

void __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  __int128 v14;

  objc_msgSend(*(id *)(a1 + 32), "clipInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = 3221225472;
  v5 = *(_OWORD *)(a1 + 80);
  v12 = *(_OWORD *)(a1 + 64);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[2] = __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_3;
  v9[3] = &unk_1E511FE68;
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(a1 + 40);
  v11 = *(_QWORD *)(a1 + 56);
  v9[4] = v7;
  v13 = a2;
  v14 = v5;
  v10 = v8;
  objc_msgSend(v4, "accessArrayWithElementsCount:accessBlock:", v6, v9);

}

uint64_t __83__PXStoryTransitionTimeline__modifyClipsIfNeeded_frames_infos_count_resultHandler___block_invoke_3(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  __int128 v18;
  _OWORD *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  _OWORD *v24;
  __int128 *v25;
  __int128 v26;
  __int128 v27;
  _OWORD *v28;
  _OWORD *v29;
  __int128 v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BYTE __dst[768];
  _BYTE __src[776];

  v2 = a2;
  if ((uint64_t)a1[6] >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    do
    {
      v9 = *(_QWORD *)(a1[7] + v6);
      v10 = objc_msgSend(*(id *)(a1[4] + 16), "containsIndex:", v9);
      if (v10)
      {
        PXRectGetCenter();
        PXPointAdd();
        v11 = (_QWORD *)(a1[9] + 32 * v7);
        PXRectWithCenterAndSize();
        *v11 = v12;
        v11[1] = v13;
        v11[2] = v14;
        v11[3] = v15;
      }
      else
      {
        v16 = (_OWORD *)(a1[9] + 32 * v7);
        v17 = (_OWORD *)(a1[8] + v5);
        v18 = v17[1];
        *v16 = *v17;
        v16[1] = v18;
      }
      v19 = (_OWORD *)(a1[10] + 48 * v7);
      v20 = (__int128 *)(a1[11] + v4);
      v21 = *v20;
      v22 = v20[2];
      v19[1] = v20[1];
      v19[2] = v22;
      *v19 = v21;
      memcpy((void *)(v2 + 768 * v7), (const void *)(a1[7] + v6), 0x300uLL);
      v23 = v7 + 1;
      if (v10)
      {
        v24 = (_OWORD *)(a1[10] + 48 * v23);
        v25 = (__int128 *)(a1[11] + v4);
        v26 = *v25;
        v27 = v25[2];
        v24[1] = v25[1];
        v24[2] = v27;
        *v24 = v26;
        v28 = (_OWORD *)(a1[9] + 32 * v23);
        v29 = (_OWORD *)(a1[8] + v5);
        v30 = v29[1];
        *v28 = *v29;
        v28[1] = v30;
        v31 = *(void **)(a1[4] + 104);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v9);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "objectForKeyedSubscript:", v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "integerValue");

        v35 = (void *)a1[4];
        if (v35)
        {
          memcpy(__dst, (const void *)(a1[7] + v6), sizeof(__dst));
          objc_msgSend(v35, "_transitionClipInfoWithIdentifier:fromOriginalClipInfo:", v34, __dst);
        }
        else
        {
          bzero(__src, 0x300uLL);
        }
        v2 = a2;
        memcpy((void *)(a2 + 768 * v23), __src, 0x300uLL);
        v23 = v7 + 2;
      }
      ++v8;
      v6 += 768;
      v5 += 32;
      v4 += 48;
      v7 = v23;
    }
    while (v8 < a1[6]);
  }
  return (*(uint64_t (**)(void))(a1[5] + 16))();
}

void __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  objc_msgSend(*(id *)(a1 + 32), "segmentInfos");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke_2;
  v11[3] = &unk_1E511FE40;
  v6 = *(_QWORD *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 56);
  v7 = *(_QWORD *)(a1 + 72);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = a2;
  v8 = *(_QWORD *)(a1 + 80);
  v16 = v7;
  v17 = v8;
  v9 = *(_QWORD *)(a1 + 32);
  v10 = *(void **)(a1 + 40);
  v13 = v5;
  v11[4] = v9;
  v12 = v10;
  objc_msgSend(v4, "accessArrayWithElementsCount:accessBlock:", v6, v11);

}

uint64_t __79__PXStoryTransitionTimeline__modifySegmentsIfNeeded_infos_count_resultHandler___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _OWORD *v7;
  __int128 *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _OWORD *v23;
  __int128 *v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  if ((uint64_t)a1[6] >= 1)
  {
    v2 = 0;
    v3 = 0;
    v4 = 0;
    v5 = 0;
    do
    {
      v6 = *(_QWORD *)(a1[7] + v3);
      v7 = (_OWORD *)(a1[8] + 48 * v5);
      v8 = (__int128 *)(a1[9] + v2);
      v9 = *v8;
      v10 = v8[2];
      v7[1] = v8[1];
      v7[2] = v10;
      *v7 = v9;
      v11 = a2 + 200 * v5;
      v12 = a1[7] + v3;
      *(_OWORD *)v11 = *(_OWORD *)v12;
      v13 = *(_OWORD *)(v12 + 16);
      v14 = *(_OWORD *)(v12 + 32);
      v15 = *(_OWORD *)(v12 + 64);
      *(_OWORD *)(v11 + 48) = *(_OWORD *)(v12 + 48);
      *(_OWORD *)(v11 + 64) = v15;
      *(_OWORD *)(v11 + 16) = v13;
      *(_OWORD *)(v11 + 32) = v14;
      v16 = *(_OWORD *)(v12 + 80);
      v17 = *(_OWORD *)(v12 + 96);
      v18 = *(_OWORD *)(v12 + 128);
      *(_OWORD *)(v11 + 112) = *(_OWORD *)(v12 + 112);
      *(_OWORD *)(v11 + 128) = v18;
      *(_OWORD *)(v11 + 80) = v16;
      *(_OWORD *)(v11 + 96) = v17;
      v19 = *(_OWORD *)(v12 + 144);
      v20 = *(_OWORD *)(v12 + 160);
      v21 = *(_OWORD *)(v12 + 176);
      *(_QWORD *)(v11 + 192) = *(_QWORD *)(v12 + 192);
      *(_OWORD *)(v11 + 160) = v20;
      *(_OWORD *)(v11 + 176) = v21;
      *(_OWORD *)(v11 + 144) = v19;
      v22 = v5 + 1;
      if (v6 == a1[10])
      {
        v23 = (_OWORD *)(a1[8] + 48 * v22);
        v24 = (__int128 *)(a1[9] + v2);
        v25 = *v24;
        v26 = v24[2];
        v23[1] = v24[1];
        v23[2] = v26;
        *v23 = v25;
        v27 = a2 + 200 * v22;
        v28 = a1[7] + v3;
        *(_OWORD *)v27 = *(_OWORD *)v28;
        v29 = *(_OWORD *)(v28 + 16);
        v30 = *(_OWORD *)(v28 + 32);
        v31 = *(_OWORD *)(v28 + 64);
        *(_OWORD *)(v27 + 48) = *(_OWORD *)(v28 + 48);
        *(_OWORD *)(v27 + 64) = v31;
        *(_OWORD *)(v27 + 16) = v29;
        *(_OWORD *)(v27 + 32) = v30;
        v32 = *(_OWORD *)(v28 + 80);
        v33 = *(_OWORD *)(v28 + 96);
        v34 = *(_OWORD *)(v28 + 128);
        *(_OWORD *)(v27 + 112) = *(_OWORD *)(v28 + 112);
        *(_OWORD *)(v27 + 128) = v34;
        *(_OWORD *)(v27 + 80) = v32;
        *(_OWORD *)(v27 + 96) = v33;
        v35 = *(_OWORD *)(v28 + 144);
        v36 = *(_OWORD *)(v28 + 160);
        v37 = *(_OWORD *)(v28 + 176);
        *(_QWORD *)(v27 + 192) = *(_QWORD *)(v28 + 192);
        *(_OWORD *)(v27 + 160) = v36;
        *(_OWORD *)(v27 + 176) = v37;
        *(_OWORD *)(v27 + 144) = v35;
        *(_QWORD *)v27 = *(_QWORD *)(a1[4] + 88);
        v22 = v5 + 2;
      }
      ++v4;
      v3 += 200;
      v2 += 48;
      v5 = v22;
    }
    while (v4 < a1[6]);
  }
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(a1[5] + 16))(a1[5], a1[8], a2);
}

void __55__PXStoryTransitionTimeline__prepareForTransitionInfo___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  if (a2 >= 1)
  {
    v28 = v14;
    v29 = v13;
    v30 = v12;
    v31 = v11;
    v32 = v10;
    v33 = v9;
    v34 = v8;
    v35 = v7;
    v36 = v6;
    v37 = v5;
    v38 = v15;
    v39 = v16;
    v18 = a2;
    do
    {
      v20 = *a5;
      v21 = *a5 + 1000000;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addIndex:", *a5, v28, v29, v30, v31, v32, v33, v34, v35, v36, v37, v38, v39);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = *(void **)(*(_QWORD *)(a1 + 32) + 96);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, v24);

      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v21);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v26 = *(void **)(*(_QWORD *)(a1 + 32) + 104);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v20);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "setObject:forKeyedSubscript:", v25, v27);

      a5 += 96;
      --v18;
    }
    while (v18);
  }
}

@end
