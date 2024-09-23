@implementation PXStoryRecombinedTimeline

- (PXStoryRecombinedTimeline)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryRecombinedTimeline.m"), 131, CFSTR("%s is not available as initializer"), "-[PXStoryRecombinedTimeline init]");

  abort();
}

- (PXStoryRecombinedTimeline)initWithSourceTimeline:(id)a3 upToSegmentIndex:(int64_t)a4 targetTimeline:(id)a5 fromSegmentIndex:(int64_t)a6
{
  id v11;
  id v12;
  PXStoryRecombinedTimeline *v13;
  PXStoryRecombinedTimeline *v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  CMTimeEpoch epoch;
  __int128 v22;
  __int128 v23;
  CMTimeEpoch v24;
  __int128 v25;
  CMTimeEpoch v26;
  __int128 v27;
  uint64_t v28;
  PXCArrayStore *shiftedTimeRangesStore;
  __int128 v31;
  CMTime v32;
  CMTimeRange v33;
  CMTime v34;
  CMTimeRange v35;
  CMTimeRange duration;
  CMTimeRange start;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  CMTimeRange v41;
  CMTimeRange v42;
  objc_super v43;
  CMTime v44;
  CMTimeRange range;

  v11 = a3;
  v12 = a5;
  v43.receiver = self;
  v43.super_class = (Class)PXStoryRecombinedTimeline;
  v13 = -[PXStoryRecombinedTimeline init](&v43, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_sourceTimeline, a3);
    v14->_lastSourceSegmentIndex = a4;
    objc_storeStrong((id *)&v14->_targetTimeline, a5);
    v14->_firstTargetSegmentIndex = a6;
    v15 = objc_msgSend(v11, "identifierForSegmentAtIndex:", a4);
    memset(&v42, 0, sizeof(v42));
    if (v11)
    {
      objc_msgSend(v11, "timeRangeForSegmentWithIdentifier:", v15);
      objc_msgSend(v11, "timeRange");
    }
    else
    {
      v38 = 0uLL;
      v39 = 0uLL;
      v40 = 0uLL;
    }
    *(_OWORD *)&start.start.value = v38;
    start.start.epoch = v39;
    *(_OWORD *)&duration.start.value = PXStoryTimeZero;
    duration.start.epoch = 0;
    CMTimeRangeMake(&v41, &start.start, &duration.start);
    start = v42;
    PXStoryTimeRangeUnion(&v41, (uint64_t)&start, (uint64_t)&range);
    v16 = *(_OWORD *)&range.start.value;
    v17 = *(_OWORD *)&range.duration.timescale;
    *(_OWORD *)&v14->_sourceTimeRange.start.epoch = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&v14->_sourceTimeRange.duration.timescale = v17;
    *(_OWORD *)&v14->_sourceTimeRange.start.value = v16;
    v18 = objc_msgSend(v12, "identifierForSegmentAtIndex:", a6);
    memset(&start, 0, sizeof(start));
    if (v12)
    {
      objc_msgSend(v12, "timeRangeForSegmentWithIdentifier:", v18);
      objc_msgSend(v12, "timeRange");
    }
    else
    {
      memset(&v33, 0, sizeof(v33));
    }
    range = v33;
    CMTimeRangeGetEnd(&v34, &range);
    range.start = v34;
    *(_OWORD *)&v44.value = PXStoryTimeZero;
    v44.epoch = 0;
    CMTimeRangeMake(&v35, &range.start, &v44);
    range = start;
    PXStoryTimeRangeUnion(&range, (uint64_t)&v35, (uint64_t)&duration);
    v19 = *(_OWORD *)&duration.start.value;
    v20 = *(_OWORD *)&duration.duration.timescale;
    *(_OWORD *)&v14->_targetTimeRange.start.epoch = *(_OWORD *)&duration.start.epoch;
    *(_OWORD *)&v14->_targetTimeRange.duration.timescale = v20;
    *(_OWORD *)&v14->_targetTimeRange.start.value = v19;
    duration = (CMTimeRange)v14->_sourceTimeRange;
    range = duration;
    CMTimeRangeGetEnd(&v32, &range);
    v31 = *(_OWORD *)&v14->_targetTimeRange.duration.value;
    epoch = v14->_targetTimeRange.duration.epoch;
    duration.start = v32;
    *(_OWORD *)&v44.value = v31;
    v44.epoch = epoch;
    CMTimeRangeMake(&range, &duration.start, &v44);
    v22 = *(_OWORD *)&range.start.value;
    v23 = *(_OWORD *)&range.duration.timescale;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.epoch = *(_OWORD *)&range.start.epoch;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.duration.timescale = v23;
    *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.value = v22;
    v24 = v14->_targetTimeRangeInSourceTime.start.epoch;
    v25 = *(_OWORD *)&v14->_targetTimeRange.start.value;
    v26 = v14->_targetTimeRange.start.epoch;
    *(_OWORD *)&range.start.value = *(_OWORD *)&v14->_targetTimeRangeInSourceTime.start.value;
    range.start.epoch = v24;
    *(_OWORD *)&duration.start.value = v25;
    duration.start.epoch = v26;
    CMTimeSubtract(&v44, &range.start, &duration.start);
    v27 = *(_OWORD *)&v44.value;
    v14->_targetTimeOffset.epoch = v44.epoch;
    *(_OWORD *)&v14->_targetTimeOffset.value = v27;
    v28 = objc_msgSend(objc_alloc((Class)off_1E50B1868), "initWithElementSize:", 48);
    shiftedTimeRangesStore = v14->_shiftedTimeRangesStore;
    v14->_shiftedTimeRangesStore = (PXCArrayStore *)v28;

  }
  return v14;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  uint64_t v6;
  CMTimeRange v7;

  -[PXStoryRecombinedTimeline sourceTimeRange](self, "sourceTimeRange");
  -[PXStoryRecombinedTimeline targetTimeRangeInSourceTime](self, "targetTimeRangeInSourceTime");
  return ($DEC141BA10DB957F4DDC414EFF8F1C09 *)PXStoryTimeRangeUnion(&v7, (uint64_t)&v6, (uint64_t)retstr);
}

- (CGSize)size
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "size");
  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");
  PXSizeMax();
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
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
  void *v14;
  __int128 v15;
  id v16;
  _QWORD v17[5];
  id v18;
  CMTime v19;
  _OWORD v20[3];
  __int128 v21;
  uint64_t v22;
  CMTime v23;
  CMTimeRange v24;
  CMTime v25;
  CMTime v26;
  _BYTE lhs[32];
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  CMTime v31;
  CMTime rhs;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecombinedTimeline sourceTimeRange](self, "sourceTimeRange");
  v13 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v13;
  v28 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v29, v30);
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v30, v11, x, y, width, height);

  memset(&v26, 0, sizeof(v26));
  -[PXStoryRecombinedTimeline targetTimeOffset](self, "targetTimeOffset");
  memset(&v25, 0, sizeof(v25));
  rhs = v26;
  *(_OWORD *)lhs = PXStoryTimeZero;
  *(_QWORD *)&lhs[16] = 0;
  CMTimeSubtract(&v25, (CMTime *)lhs, &rhs);
  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecombinedTimeline targetTimeRangeInSourceTime](self, "targetTimeRangeInSourceTime");
  v15 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v15;
  v28 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v20, &v21);
  rhs = v25;
  *(_OWORD *)lhs = v21;
  *(_QWORD *)&lhs[16] = v22;
  CMTimeAdd(&v31, (CMTime *)lhs, &rhs);
  rhs = v23;
  *(CMTime *)lhs = v31;
  CMTimeRangeMake(&v24, (CMTime *)lhs, &rhs);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v17[3] = &unk_1E5119FF0;
  v19 = v26;
  v17[4] = self;
  v18 = v11;
  v16 = v11;
  objc_msgSend(v14, "enumerateClipsInTimeRange:rect:usingBlock:", &v24, v17, x, y, width, height);

}

- (id)clipWithIdentifier:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "clipWithIdentifier:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "clipWithIdentifier:", a3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v8;
}

- (int64_t)numberOfSegments
{
  int64_t v3;
  void *v4;
  int64_t v5;
  int64_t v6;

  v3 = -[PXStoryRecombinedTimeline lastSourceSegmentIndex](self, "lastSourceSegmentIndex");
  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 + objc_msgSend(v4, "numberOfSegments");
  v6 = v5 - -[PXStoryRecombinedTimeline firstTargetSegmentIndex](self, "firstTargetSegmentIndex") + 1;

  return v6;
}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  void *v5;
  int64_t v6;
  int64_t v7;
  void *v8;
  int64_t v9;

  if (-[PXStoryRecombinedTimeline lastSourceSegmentIndex](self, "lastSourceSegmentIndex") >= a3)
  {
    -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v8;
    v7 = a3;
  }
  else
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = ~-[PXStoryRecombinedTimeline lastSourceSegmentIndex](self, "lastSourceSegmentIndex");
    v7 = v6 + a3 + -[PXStoryRecombinedTimeline firstTargetSegmentIndex](self, "firstTargetSegmentIndex");
    v8 = v5;
  }
  v9 = objc_msgSend(v8, "identifierForSegmentAtIndex:", v7);

  return v9;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  void *v5;
  int64_t v6;
  int64_t v7;
  int64_t v8;
  void *v9;
  uint64_t v10;
  int64_t v11;

  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfSegmentWithIdentifier:", a3);
  v7 = -[PXStoryRecombinedTimeline lastSourceSegmentIndex](self, "lastSourceSegmentIndex");
  v8 = v7;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL || v6 > v7)
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfSegmentWithIdentifier:", a3);
    v11 = -[PXStoryRecombinedTimeline firstTargetSegmentIndex](self, "firstTargetSegmentIndex");
    if (v10 < v11 || v10 == 0x7FFFFFFFFFFFFFFFLL)
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v6 = v8 + v10 - v11 + 1;

  }
  return v6;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  void *v9;
  __int128 v10;
  id v11;
  _QWORD v12[5];
  id v13;
  CMTime v14;
  _OWORD v15[3];
  __int128 v16;
  uint64_t v17;
  CMTime v18;
  CMTimeRange v19;
  CMTime v20;
  CMTime v21;
  _BYTE lhs[32];
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[3];
  CMTime v26;
  CMTime rhs;

  v6 = a4;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecombinedTimeline sourceTimeRange](self, "sourceTimeRange");
  v8 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v8;
  v23 = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v7, "enumerateSegmentsInTimeRange:usingBlock:", v25, v6, PXStoryTimeRangeIntersection(lhs, v24, v25));

  memset(&v21, 0, sizeof(v21));
  -[PXStoryRecombinedTimeline targetTimeOffset](self, "targetTimeOffset");
  memset(&v20, 0, sizeof(v20));
  rhs = v21;
  *(_OWORD *)lhs = PXStoryTimeZero;
  *(_QWORD *)&lhs[16] = 0;
  CMTimeSubtract(&v20, (CMTime *)lhs, &rhs);
  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryRecombinedTimeline targetTimeRangeInSourceTime](self, "targetTimeRangeInSourceTime");
  v10 = *(_OWORD *)&a3->var0.var3;
  *(_OWORD *)lhs = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&lhs[16] = v10;
  v23 = *(_OWORD *)&a3->var1.var1;
  PXStoryTimeRangeIntersection(lhs, v15, &v16);
  rhs = v20;
  *(_OWORD *)lhs = v16;
  *(_QWORD *)&lhs[16] = v17;
  CMTimeAdd(&v26, (CMTime *)lhs, &rhs);
  rhs = v18;
  *(CMTime *)lhs = v26;
  CMTimeRangeMake(&v19, (CMTime *)lhs, &rhs);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke;
  v12[3] = &unk_1E511A040;
  v14 = v21;
  v12[4] = self;
  v13 = v6;
  v11 = v6;
  objc_msgSend(v9, "enumerateSegmentsInTimeRange:usingBlock:", &v19, v12);

}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect result;

  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsSegmentWithIdentifier:", a3))
  {
    objc_msgSend(v5, "frameForSegmentWithIdentifier:", a3);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
  }
  else
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "frameForSegmentWithIdentifier:", a3);
    v7 = v15;
    v9 = v16;
    v11 = v17;
    v13 = v18;

  }
  v19 = v7;
  v20 = v9;
  v21 = v11;
  v22 = v13;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  CMTime v14;
  __int128 v15;
  _QWORD v16[4];
  CMTimeRange lhs;
  CMTime v18;
  CMTime duration;
  CMTime rhs;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "indexOfSegmentWithIdentifier:", a4);
  if (v8 <= -[PXStoryRecombinedTimeline lastSourceSegmentIndex](self, "lastSourceSegmentIndex"))
  {
    if (v7)
      objc_msgSend(v7, "timeRangeForSegmentWithIdentifier:", a4);
    else
      memset(&lhs, 0, sizeof(lhs));
    v11 = *(_OWORD *)&lhs.start.epoch;
    *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&lhs.start.value;
    *(_OWORD *)&retstr->var0.var3 = v11;
    *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&lhs.duration.timescale;
  }
  else
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "indexOfSegmentWithIdentifier:", a4);
    if (v10 >= -[PXStoryRecombinedTimeline firstTargetSegmentIndex](self, "firstTargetSegmentIndex"))
    {
      if (v9)
      {
        objc_msgSend(v9, "timeRangeForSegmentWithIdentifier:", a4);
      }
      else
      {
        memset(v16, 0, sizeof(v16));
        v15 = 0u;
      }
      -[PXStoryRecombinedTimeline targetTimeOffset](self, "targetTimeOffset");
      *(_OWORD *)&lhs.start.value = v15;
      lhs.start.epoch = v16[0];
      rhs = v14;
      CMTimeAdd(&v18, &lhs.start, &rhs);
      duration = *(CMTime *)&v16[1];
      rhs = v18;
      CMTimeRangeMake(&lhs, &rhs, &duration);
      v12 = *(_OWORD *)&lhs.start.epoch;
      *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&lhs.start.value;
      *(_OWORD *)&retstr->var0.var3 = v12;
      *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&lhs.duration.timescale;
    }

  }
  return result;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;

  v8 = a4;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", a3, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = v10;
  }
  else
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", a3, v8, a5);
    v12 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v12;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  int64_t v10;
  void *v11;

  v8 = a4;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfResourceForClipWithIdentifier:inResourcesDataSource:resourceKind:", a3, v8, a5);

  if (v10 == 0x7FFFFFFFFFFFFFFFLL)
  {
    -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v11, "indexOfResourceForClipWithIdentifier:inResourcesDataSource:resourceKind:", a3, v8, a5);

  }
  return v10;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int64_t v13;
  _QWORD v15[7];
  _BYTE v16[48];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;

  v8 = a4;
  -[PXStoryRecombinedTimeline sourceTimeline](self, "sourceTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", a3, v8, a5);

  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", a3, v8, a5);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  -[PXStoryRecombinedTimeline timeRange](self, "timeRange");
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __111__PXStoryRecombinedTimeline_identifierOfFirstClipContainingResourceAtIndex_inResourcesDataSource_resourceKind___block_invoke;
  v15[3] = &unk_1E511A068;
  v15[4] = &v17;
  v15[5] = v10;
  v15[6] = v12;
  -[PXStoryRecombinedTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v16, v15, *MEMORY[0x1E0C9D5E0], *(double *)(MEMORY[0x1E0C9D5E0] + 8), *(double *)(MEMORY[0x1E0C9D5E0] + 16), *(double *)(MEMORY[0x1E0C9D5E0] + 24));
  v13 = v18[3];
  _Block_object_dispose(&v17, 8);

  return v13;
}

- (int64_t)dataSourceIdentifier
{
  void *v2;
  int64_t v3;

  -[PXStoryRecombinedTimeline targetTimeline](self, "targetTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "dataSourceIdentifier");

  return v3;
}

- (void)_shiftTimeRanges:(id *)a3 count:(int64_t)a4 byTime:(id *)a5 resultHandler:(id)a6
{
  id v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  int64_t v15;
  const $DEC141BA10DB957F4DDC414EFF8F1C09 *v16;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;

  v10 = a6;
  -[PXStoryRecombinedTimeline shiftedTimeRangesStore](self, "shiftedTimeRangesStore");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __73__PXStoryRecombinedTimeline__shiftTimeRanges_count_byTime_resultHandler___block_invoke;
  v13[3] = &unk_1E511A090;
  v15 = a4;
  v16 = a3;
  v17 = *a5;
  v14 = v10;
  v12 = v10;
  objc_msgSend(v11, "accessArrayWithElementsCount:accessBlock:", a4, v13);

}

- (PXStoryTimeline)sourceTimeline
{
  return self->_sourceTimeline;
}

- (int64_t)lastSourceSegmentIndex
{
  return self->_lastSourceSegmentIndex;
}

- (PXStoryTimeline)targetTimeline
{
  return self->_targetTimeline;
}

- (int64_t)firstTargetSegmentIndex
{
  return self->_firstTargetSegmentIndex;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)sourceTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var1;
  return self;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)targetTimeRangeInSourceTime
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[2].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[3].var0.var1;
  return self;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)targetTimeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].var1.var3;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[3].var1.var0;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[4].var0.var1;
  return self;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)targetTimeOffset
{
  *($95D729B680665BEAEFA1D6FCA8238556 *)retstr = ($95D729B680665BEAEFA1D6FCA8238556)self[2];
  return self;
}

- (PXCArrayStore)shiftedTimeRangesStore
{
  return self->_shiftedTimeRangesStore;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_shiftedTimeRangesStore, 0);
  objc_storeStrong((id *)&self->_targetTimeline, 0);
  objc_storeStrong((id *)&self->_sourceTimeline, 0);
}

uint64_t __73__PXStoryRecombinedTimeline__shiftTimeRanges_count_byTime_resultHandler___block_invoke(_QWORD *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;
  __int128 v8;
  _OWORD *v9;
  __int128 v10;
  _BYTE v12[32];
  CMTimeRange lhs;
  CMTime v14;
  CMTime duration;
  CMTime rhs;

  if ((uint64_t)a1[5] >= 1)
  {
    v4 = 0;
    v5 = 0;
    v6 = a1 + 7;
    do
    {
      v7 = a1[6] + v4;
      *(_OWORD *)v12 = *(_OWORD *)(v7 + 16);
      v8 = *(_OWORD *)(v7 + 32);
      v9 = (_OWORD *)(a2 + v4);
      duration = *(CMTime *)v7;
      *(_OWORD *)&v12[16] = v8;
      lhs.start = duration;
      *(_OWORD *)&rhs.value = *v6;
      rhs.epoch = a1[9];
      CMTimeAdd(&v14, &lhs.start, &rhs);
      duration = *(CMTime *)&v12[8];
      rhs = v14;
      CMTimeRangeMake(&lhs, &rhs, &duration);
      v10 = *(_OWORD *)&lhs.start.epoch;
      *v9 = *(_OWORD *)&lhs.start.value;
      v9[1] = v10;
      v9[2] = *(_OWORD *)&lhs.duration.timescale;
      ++v5;
      v4 += 48;
    }
    while (v5 < a1[5]);
  }
  return (*(uint64_t (**)(void))(a1[4] + 16))();
}

_QWORD *__111__PXStoryRecombinedTimeline_identifierOfFirstClipContainingResourceAtIndex_inResourcesDataSource_resourceKind___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5, _BYTE *a6)
{
  uint64_t v6;

  if (a2 >= 1)
  {
    v6 = result[5];
    while (*a5 != v6)
    {
      if (*a5 == result[6])
      {
        v6 = *a5;
        break;
      }
      a5 += 96;
      if (!--a2)
        return result;
    }
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v6;
    *a6 = 1;
  }
  return result;
}

void __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  void *v10;
  __int128 v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2;
  v13[3] = &unk_1E511A018;
  v10 = *(void **)(a1 + 32);
  v14 = *(id *)(a1 + 40);
  v15 = a2;
  v16 = a4;
  v17 = a5;
  v11 = *(_OWORD *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v10, "_shiftTimeRanges:count:byTime:resultHandler:", a3, a2, &v11, v13);

}

uint64_t __69__PXStoryRecombinedTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a2, a1[6], a1[7]);
}

void __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v12;
  __int128 v13;
  uint64_t v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2;
  v15[3] = &unk_1E5119FC8;
  v12 = *(void **)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = a2;
  v18 = a4;
  v19 = a5;
  v20 = a6;
  v13 = *(_OWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  objc_msgSend(v12, "_shiftTimeRanges:count:byTime:resultHandler:", a3, a2, &v13, v15);

}

uint64_t __71__PXStoryRecombinedTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke_2(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t, _QWORD, _QWORD, _QWORD))(a1[4] + 16))(a1[4], a1[5], a2, a1[6], a1[7], a1[8]);
}

+ (id)timelineByRecombiningSourceTimeline:(id)a3 withTargetTimeline:(id)a4 visibleSegmentIdentifiers:(id)a5
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  int v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  _QWORD v34[4];
  id v35;
  uint64_t *v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  _QWORD v41[4];
  id v42;
  uint64_t *v43;
  SEL v44;
  id v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = v10;
  +[PXStorySettings sharedInstance](PXStorySettings, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "allowsTimelineRecombination");
  v15 = objc_msgSend(v11, "count");
  objc_msgSend(v12, "size");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v9, "size");
  v21 = v20;
  v23 = v22;
  v24 = objc_msgSend(v12, "dataSourceIdentifier");
  v25 = objc_msgSend(v9, "dataSourceIdentifier");
  v26 = v12;
  if (v9)
  {
    v26 = v12;
    if (v12 != v9)
    {
      v26 = v12;
      if (v24 == v25)
      {
        v26 = v12;
        if (v17 == v21)
        {
          v26 = v12;
          if (v19 == v23)
          {
            v26 = v12;
            if (v15)
            {
              v26 = v12;
              if (v14)
              {
                v26 = v12;
                if ((objc_msgSend(v12, "containsAllSegmentsWithIdentifiers:", v11) & 1) == 0)
                {
                  v46 = 0;
                  v47 = &v46;
                  v48 = 0x2020000000;
                  v49 = 0x7FFFFFFFFFFFFFFFLL;
                  v41[0] = MEMORY[0x1E0C809B0];
                  v41[1] = 3221225472;
                  v41[2] = __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke;
                  v41[3] = &unk_1E5141158;
                  v27 = v9;
                  v44 = a2;
                  v45 = a1;
                  v42 = v27;
                  v43 = &v46;
                  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v41);
                  v26 = v12;
                  if (v47[3] != 0x7FFFFFFFFFFFFFFFLL)
                  {
                    objc_msgSend(v12, "identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:", objc_msgSend(v27, "identifierForSegmentAtIndex:"), v27);
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v37 = 0;
                    v38 = &v37;
                    v39 = 0x2020000000;
                    v40 = 0x7FFFFFFFFFFFFFFFLL;
                    v34[0] = MEMORY[0x1E0C809B0];
                    v34[1] = 3221225472;
                    v34[2] = __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke_1;
                    v34[3] = &unk_1E5136440;
                    v26 = v12;
                    v35 = v26;
                    v36 = &v37;
                    objc_msgSend(v28, "enumerateIndexesUsingBlock:", v34);
                    v29 = v28;
                    v30 = v38[3];
                    if (v30 != 0x7FFFFFFFFFFFFFFFLL
                      && v30 < objc_msgSend(v26, "numberOfSegments") - 1
                      && ((objc_msgSend(v13, "shouldRecombineTimelineWithSameVisibleSegments") & 1) != 0
                       || objc_msgSend(v11, "count") != 1
                       || (objc_msgSend(a1, "_isSegmentIndex:inTimeline:visuallyEqualToSegmentIndex:inTimeline:", v47[3], v27, v38[3], v26) & 1) == 0))
                    {
                      v31 = objc_alloc((Class)a1);
                      v32 = objc_msgSend(v31, "initWithSourceTimeline:upToSegmentIndex:targetTimeline:fromSegmentIndex:", v27, v47[3], v26, v38[3] + 1);

                      v26 = (id)v32;
                    }

                    _Block_object_dispose(&v37, 8);
                  }

                  _Block_object_dispose(&v46, 8);
                }
              }
            }
          }
        }
      }
    }
  }

  return v26;
}

+ (BOOL)_isSegmentIndex:(int64_t)a3 inTimeline:(id)a4 visuallyEqualToSegmentIndex:(int64_t)a5 inTimeline:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  char v22;
  _OWORD v24[3];
  _QWORD v25[4];
  id v26;
  uint64_t *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;

  v9 = a4;
  v10 = a6;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 1;
  v42 = 0u;
  v43 = 0u;
  v41 = 0u;
  v11 = objc_msgSend(v9, "identifierForSegmentAtIndex:", a3);
  if (v9)
  {
    objc_msgSend(v9, "timeRangeForSegmentWithIdentifier:", v11);
  }
  else
  {
    v42 = 0u;
    v43 = 0u;
    v41 = 0u;
  }
  v39 = 0u;
  v40 = 0u;
  v38 = 0u;
  v12 = objc_msgSend(v10, "identifierForSegmentAtIndex:", a5);
  if (v10)
  {
    objc_msgSend(v10, "timeRangeForSegmentWithIdentifier:", v12);
  }
  else
  {
    v39 = 0u;
    v40 = 0u;
    v38 = 0u;
  }
  objc_msgSend(v9, "size");
  PXRectWithOriginAndSize();
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke;
  v25[3] = &unk_1E5119FA0;
  v21 = v10;
  v32 = v38;
  v33 = v39;
  v34 = v40;
  v35 = v41;
  v36 = v42;
  v37 = v43;
  v24[0] = v41;
  v24[1] = v42;
  v28 = v14;
  v29 = v16;
  v30 = v18;
  v31 = v20;
  v26 = v21;
  v27 = &v44;
  v24[2] = v43;
  objc_msgSend(v9, "enumerateClipsInTimeRange:rect:usingBlock:", v24, v25, v14, v16, v18, v20);
  v22 = *((_BYTE *)v45 + 24);

  _Block_object_dispose(&v44, 8);
  return v22;
}

uint64_t __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _OWORD v14[3];
  _QWORD v15[10];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;

  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke_2;
  v15[3] = &unk_1E5119F78;
  v6 = *(void **)(a1 + 32);
  v15[4] = *(_QWORD *)(a1 + 40);
  v15[5] = a2;
  v15[6] = a4;
  v15[7] = a3;
  v7 = *(_OWORD *)(a1 + 144);
  v8 = *(_OWORD *)(a1 + 160);
  v9 = *(_OWORD *)(a1 + 112);
  v16 = *(_OWORD *)(a1 + 128);
  v17 = v7;
  v10 = *(_OWORD *)(a1 + 80);
  v11 = *(_OWORD *)(a1 + 112);
  v20 = *(_OWORD *)(a1 + 96);
  v21 = v11;
  v12 = *(_OWORD *)(a1 + 80);
  v18 = v8;
  v19 = v12;
  v15[8] = a5;
  v15[9] = a6;
  v14[0] = v10;
  v14[1] = v20;
  v14[2] = v9;
  return objc_msgSend(v6, "enumerateClipsInTimeRange:rect:usingBlock:", v14, v15, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
}

uint64_t __95__PXStoryRecombinedTimeline__isSegmentIndex_inTimeline_visuallyEqualToSegmentIndex_inTimeline___block_invoke_2(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v7;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t v21;
  int32x2_t v22;
  double *v23;
  double *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  double *v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  double *v37;
  double *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  CGFloat v54;
  CGFloat v55;
  CGFloat v56;
  CGFloat v57;
  CGFloat v58;
  CGFloat v59;
  CGFloat v60;
  CGFloat v61;
  CGFloat v62;
  CGFloat v63;
  CGFloat v64;
  CGFloat v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  CMTime v70;
  CMTime v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  CMTime time2;
  _BYTE time1[32];
  __int128 v80;
  __int128 lhs;
  _BYTE lhs_16[32];
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;

  v7 = result;
  if (*(_QWORD *)(result + 40) == a2)
  {
    if (a2 < 1)
      goto LABEL_47;
    v9 = a3;
    v10 = 0;
    v11 = 0;
    v12 = 0;
    v13 = 0;
    v51 = result + 128;
    v52 = result + 80;
    v14 = a4 + 24;
    v49 = a4 + 24;
    while (1)
    {
      result = CGRectEqualToRect(*(CGRect *)(*(_QWORD *)(v7 + 48) + v11), *(CGRect *)(v14 + v11 - 24));
      if ((result & 1) == 0)
        break;
      v53 = v13;
      v15 = a6;
      v16 = (__int128 *)(*(_QWORD *)(v7 + 56) + v10);
      v17 = v16[1];
      v75 = *v16;
      v76 = v17;
      v77 = v16[2];
      v18 = *(_OWORD *)(v9 + v10 + 16);
      v72 = *(_OWORD *)(v9 + v10);
      v73 = v18;
      v20 = *(_OWORD *)(v9 + v10);
      v19 = *(_OWORD *)(v9 + v10 + 16);
      v74 = *(_OWORD *)(v9 + v10 + 32);
      lhs = v75;
      *(_OWORD *)lhs_16 = v16[1];
      *(_OWORD *)&lhs_16[16] = v16[2];
      *(_OWORD *)time1 = *(_OWORD *)&lhs_16[8];
      *(_QWORD *)&time1[16] = *(_QWORD *)&lhs_16[24];
      lhs = v20;
      *(_OWORD *)lhs_16 = v19;
      *(_OWORD *)&lhs_16[16] = *(_OWORD *)(v9 + v10 + 32);
      time2 = *(CMTime *)&lhs_16[8];
      result = CMTimeCompare((CMTime *)time1, &time2);
      if ((_DWORD)result)
        goto LABEL_46;
      lhs = v75;
      *(_QWORD *)lhs_16 = v76;
      *(_OWORD *)time1 = *(_OWORD *)v52;
      *(_QWORD *)&time1[16] = *(_QWORD *)(v52 + 16);
      CMTimeSubtract(&v71, (CMTime *)&lhs, (CMTime *)time1);
      lhs = v72;
      *(_QWORD *)lhs_16 = v73;
      *(_OWORD *)time1 = *(_OWORD *)v51;
      *(_QWORD *)&time1[16] = *(_QWORD *)(v51 + 16);
      CMTimeSubtract(&v70, (CMTime *)&lhs, (CMTime *)time1);
      lhs = *(_OWORD *)&v71.value;
      *(_QWORD *)lhs_16 = v71.epoch;
      *(CMTime *)time1 = v70;
      result = CMTimeCompare((CMTime *)&lhs, (CMTime *)time1);
      if ((_DWORD)result)
        goto LABEL_46;
      v21 = *(_QWORD *)(v7 + 64);
      if (*(_QWORD *)(v21 + v12 + 152) != *(_QWORD *)(a5 + v12 + 152))
        goto LABEL_46;
      v22 = vmovn_s64(vceqq_f64(*(float64x2_t *)(v21 + v12 + 16), *(float64x2_t *)(a5 + v12 + 16)));
      if ((v22.i32[0] & v22.i32[1] & 1) == 0)
        goto LABEL_46;
      v23 = (double *)(v21 + v12);
      v24 = (double *)(a5 + v12);
      if (((*(_DWORD *)(a5 + v12 + 32) ^ *(_DWORD *)(v21 + v12 + 32)) & 0xDLL) != 0)
        goto LABEL_46;
      if (v23[20] != v24[20])
        goto LABEL_46;
      if (v23[21] != v24[21])
        goto LABEL_46;
      v25 = v23[26];
      v26 = v23[27];
      v27 = v23[28];
      v28 = v23[29];
      v68 = v23[31];
      v69 = v23[30];
      v66 = v23[33];
      v67 = v23[32];
      v60 = v23[35];
      v61 = v23[34];
      v58 = v23[37];
      v59 = v23[36];
      v29 = v24[26];
      v30 = v24[27];
      v31 = v24[28];
      v32 = v24[29];
      v64 = v24[31];
      v65 = v24[30];
      v62 = v24[33];
      v63 = v24[32];
      v56 = v24[35];
      v57 = v24[34];
      v54 = v24[37];
      v55 = v24[36];
      result = CGRectEqualToRect(*(CGRect *)(v21 + v12 + 176), *(CGRect *)(a5 + v12 + 176));
      if (!(_DWORD)result)
        goto LABEL_46;
      v83.origin.x = v25;
      v83.origin.y = v26;
      v83.size.width = v27;
      v83.size.height = v28;
      v86.origin.x = v29;
      v86.origin.y = v30;
      v86.size.width = v31;
      v86.size.height = v32;
      result = CGRectEqualToRect(v83, v86);
      if (!(_DWORD)result)
        goto LABEL_46;
      v84.origin.y = v68;
      v84.origin.x = v69;
      v84.size.height = v66;
      v84.size.width = v67;
      v87.origin.y = v64;
      v87.origin.x = v65;
      v87.size.height = v62;
      v87.size.width = v63;
      result = CGRectEqualToRect(v84, v87);
      if (!(_DWORD)result)
        goto LABEL_46;
      v85.origin.y = v60;
      v85.origin.x = v61;
      v85.size.height = v58;
      v85.size.width = v59;
      v88.origin.y = v56;
      v88.origin.x = v57;
      v88.size.height = v54;
      v88.size.width = v55;
      result = CGRectEqualToRect(v85, v88);
      if (!(_DWORD)result)
        goto LABEL_46;
      v33 = (double *)(v21 + v12);
      v34 = (double *)(a5 + v12);
      result = PXEdgeInsetsEqualToEdgeInsets();
      if (!(_DWORD)result)
        goto LABEL_46;
      if (v33[42] != v34[42])
        goto LABEL_46;
      if (v33[43] != v34[43])
        goto LABEL_46;
      if (v33[44] != v34[44])
        goto LABEL_46;
      v35 = a5 + v12;
      v36 = v21 + v12;
      if (*(double *)(v21 + v12 + 360) != *(double *)(a5 + v12 + 360))
        goto LABEL_46;
      if (*(double *)(v36 + 368) != *(double *)(v35 + 368))
        goto LABEL_46;
      if (*(double *)(v36 + 376) != *(double *)(v35 + 376))
        goto LABEL_46;
      if (v33[48] != v34[48])
        goto LABEL_46;
      if (v33[49] != v34[49])
        goto LABEL_46;
      if (v33[50] != v34[50])
        goto LABEL_46;
      if (v33[51] != v34[51])
        goto LABEL_46;
      if (v33[52] != v34[52])
        goto LABEL_46;
      if (v33[53] != v34[53])
        goto LABEL_46;
      v37 = (double *)(v21 + v12);
      v38 = (double *)(a5 + v12);
      if (*(double *)(v21 + v12 + 432) != *(double *)(a5 + v12 + 432))
        goto LABEL_46;
      if (v37[55] != v38[55])
        goto LABEL_46;
      if (v37[56] != v38[56])
        goto LABEL_46;
      v39 = a5 + v12;
      v40 = v21 + v12;
      if (*(double *)(v21 + v12 + 456) != *(double *)(a5 + v12 + 456))
        goto LABEL_46;
      if (*(double *)(v40 + 464) != *(double *)(v39 + 464))
        goto LABEL_46;
      if (*(double *)(v40 + 472) != *(double *)(v39 + 472))
        goto LABEL_46;
      if (v37[60] != v38[60])
        goto LABEL_46;
      if (v37[61] != v38[61])
        goto LABEL_46;
      if (v37[62] != v38[62])
        goto LABEL_46;
      if (v37[63] != v38[63])
        goto LABEL_46;
      if (v37[64] != v38[64])
        goto LABEL_46;
      if (v37[65] != v38[65])
        goto LABEL_46;
      v41 = v21 + v12;
      v42 = a5 + v12;
      v43 = *(_OWORD *)(v21 + v12 + 552);
      v44 = *(_OWORD *)(v21 + v12 + 584);
      *(_OWORD *)lhs_16 = *(_OWORD *)(v21 + v12 + 568);
      *(_OWORD *)&lhs_16[16] = v44;
      v45 = *(_OWORD *)(a5 + v12 + 568);
      *(_OWORD *)time1 = *(_OWORD *)(a5 + v12 + 552);
      *(_OWORD *)&time1[16] = v45;
      v80 = *(_OWORD *)(a5 + v12 + 584);
      lhs = v43;
      result = PXStoryRectEqualToRect();
      if (!(_DWORD)result)
        goto LABEL_46;
      v46 = *(_OWORD *)(v41 + 600);
      v47 = *(_OWORD *)(v41 + 632);
      *(_OWORD *)lhs_16 = *(_OWORD *)(v41 + 616);
      *(_OWORD *)&lhs_16[16] = v47;
      v48 = *(_OWORD *)(v42 + 616);
      *(_OWORD *)time1 = *(_OWORD *)(v42 + 600);
      *(_OWORD *)&time1[16] = v48;
      v80 = *(_OWORD *)(v42 + 632);
      lhs = v46;
      result = PXStoryRectEqualToRect();
      if (!(_DWORD)result)
      {
LABEL_46:
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 8) + 24) = 0;
        a6 = v15;
        goto LABEL_47;
      }
      v13 = v53 + 1;
      v12 += 768;
      v11 += 32;
      v10 += 48;
      a6 = v15;
      v14 = v49;
      v9 = a3;
      if (v53 + 1 >= *(_QWORD *)(v7 + 40))
        goto LABEL_47;
    }
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 8) + 24) = 0;
LABEL_47:
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v7 + 32) + 8) + 24))
  {
    *a6 = 1;
    **(_BYTE **)(v7 + 72) = 1;
  }
  return result;
}

void __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8[16];

  v3 = objc_msgSend(*(id *)(a1 + 32), "indexOfSegmentWithIdentifier:", a2);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    PXAssertGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v8 = 0;
      _os_log_error_impl(&dword_1A6789000, v4, OS_LOG_TYPE_ERROR, "couldn't find visible segment in source timeline", v8, 2u);
    }

  }
  else
  {
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v6 = *(_QWORD *)(v5 + 24);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      *(_QWORD *)(v5 + 24) = v3;
    }
    else
    {
      if (v6 <= v3)
        v7 = v3;
      else
        v7 = *(_QWORD *)(v5 + 24);
      *(_QWORD *)(v5 + 24) = v7;
    }
  }
}

uint64_t __110__PXStoryRecombinedTimeline_timelineByRecombiningSourceTimeline_withTargetTimeline_visibleSegmentIdentifiers___block_invoke_1(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "indexOfSegmentWithIdentifier:", a2);
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(_QWORD *)(v4 + 24);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL || result > v5)
    *(_QWORD *)(v4 + 24) = result;
  return result;
}

@end
