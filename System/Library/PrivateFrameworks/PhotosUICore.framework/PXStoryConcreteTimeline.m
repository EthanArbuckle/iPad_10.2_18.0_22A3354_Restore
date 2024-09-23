@implementation PXStoryConcreteTimeline

- (PXStoryConcreteTimeline)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 72, CFSTR("%s is not available as initializer"), "-[PXStoryConcreteTimeline init]");

  abort();
}

- (PXStoryConcreteTimeline)initWithSize:(CGSize)a3 resourcesDataSource:(id)a4
{
  CGFloat height;
  CGFloat width;
  id v8;
  PXStoryConcreteTimeline *v9;
  PXStoryConcreteTimeline *v10;
  __int128 v11;
  __int128 v12;
  CMTimeRange v14;
  objc_super v15;
  CMTime duration;
  CMTime start;

  height = a3.height;
  width = a3.width;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryConcreteTimeline;
  v9 = -[PXStoryConcreteTimeline init](&v15, sel_init);
  v10 = v9;
  if (v9)
  {
    v9->_size.width = width;
    v9->_size.height = height;
    objc_storeStrong((id *)&v9->_resourcesDataSource, a4);
    *(_OWORD *)&start.value = PXStoryTimeZero;
    start.epoch = 0;
    *(_OWORD *)&duration.value = PXStoryTimeZero;
    duration.epoch = 0;
    CMTimeRangeMake(&v14, &start, &duration);
    v11 = *(_OWORD *)&v14.start.value;
    v12 = *(_OWORD *)&v14.duration.timescale;
    *(_OWORD *)&v10->_timeRange.start.epoch = *(_OWORD *)&v14.start.epoch;
    *(_OWORD *)&v10->_timeRange.duration.timescale = v12;
    *(_OWORD *)&v10->_timeRange.start.value = v11;
  }

  return v10;
}

- (PXStoryConcreteTimeline)initWithTimeline:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  PXStoryConcreteTimeline *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  v4 = a3;
  objc_msgSend(v4, "size");
  v6 = v5;
  v8 = v7;
  objc_msgSend(v4, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PXStoryConcreteTimeline initWithSize:resourcesDataSource:](self, "initWithSize:resourcesDataSource:", v9, v6, v8);

  if (v10)
  {
    -[PXStoryConcreteTimeline setNumberOfClips:](v10, "setNumberOfClips:", objc_msgSend(v4, "numberOfClips"));
    -[PXStoryConcreteTimeline numberOfClips](v10, "numberOfClips");
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    -[PXStoryConcreteTimeline setNumberOfSegments:](v10, "setNumberOfSegments:", objc_msgSend(v4, "numberOfSegments"));
    -[PXStoryConcreteTimeline numberOfSegments](v10, "numberOfSegments");
    _PXGArrayCopyRangeToArray();
    _PXGArrayCopyRangeToArray();
    objc_msgSend(v4, "timeRange");
    *(_OWORD *)&v10->_timeRange.start.epoch = v13;
    *(_OWORD *)&v10->_timeRange.duration.timescale = v14;
    *(_OWORD *)&v10->_timeRange.start.value = v12;
  }

  return v10;
}

- (id)description
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _BYTE v10[48];
  CGSize v11;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTimeline size](self, "size");
  NSStringFromCGSize(v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryConcreteTimeline timeRange](self, "timeRange");
  PXStoryTimeRangeDescription((uint64_t)v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; Size: %@; Time Range: %@>"), v5, self, v6, v7);

  return v8;
}

- (id)debugDescription
{
  id v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;
  uint64_t v10[25];

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  -[PXStoryConcreteTimeline description](self, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  if (-[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments") >= 1)
  {
    v6 = 0;
    do
    {
      -[PXStoryConcreteTimeline infoForSegmentWithIdentifier:](self, "infoForSegmentWithIdentifier:", -[PXStoryConcreteTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", v6));
      PXStorySegmentInfoDescription(v10);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "appendFormat:", CFSTR("\n\t%@"), v7);

      ++v6;
    }
    while (v6 < -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments"));
  }
  v8 = (void *)objc_msgSend(v5, "copy");

  return v8;
}

- (void)dealloc
{
  objc_super v3;

  free(self->_clipTimeRanges);
  free(self->_clipIndicesSortedByTimeRangeEnd);
  free(self->_clipFrames);
  free(self->_clipInfos);
  free(self->_clipResourceKinds);
  free(self->_clipResourceIndexes);
  free(self->_segmentTimeRanges);
  free(self->_segmentInfos);
  v3.receiver = self;
  v3.super_class = (Class)PXStoryConcreteTimeline;
  -[PXStoryConcreteTimeline dealloc](&v3, sel_dealloc);
}

- (void)setNumberOfClips:(int64_t)a3
{
  int v4;
  int64_t clipCapacity;

  if (self->_numberOfClips != a3)
  {
    self->_numberOfClips = a3;
    clipCapacity = self->_clipCapacity;
    v4 = _PXGArrayCapacityResizeToCount();
    self->_clipCapacity = clipCapacity;
    if (v4)
    {
      _PXGArrayResize();
      _PXGArrayResize();
      _PXGArrayResize();
      _PXGArrayResize();
      _PXGArrayResize();
    }
  }
}

- (void)setNumberOfSegments:(int64_t)a3
{
  int v4;
  int64_t segmentCapacity;

  if (self->_numberOfSegments != a3)
  {
    self->_numberOfSegments = a3;
    segmentCapacity = self->_segmentCapacity;
    v4 = _PXGArrayCapacityResizeToCount();
    self->_segmentCapacity = segmentCapacity;
    if (v4)
      _PXGArrayResize();
  }
}

- (_NSRange)_smallestRangeOfClipsPotentiallyIntersectingTimeRange:(id *)a3
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  int64_t v9;
  __int128 v10;
  uint64_t v11;
  NSUInteger v12;
  CMTime v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, uint64_t);
  void *v17;
  PXStoryConcreteTimeline *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTimeRange range;
  _NSRange result;

  -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  v14 = MEMORY[0x1E0C809B0];
  v5 = *(_OWORD *)&a3->var0.var3;
  v19 = *(_OWORD *)&a3->var0.var0;
  v15 = 3221225472;
  v16 = __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke;
  v17 = &unk_1E512ED40;
  v18 = self;
  v20 = v5;
  v21 = *(_OWORD *)&a3->var1.var1;
  v6 = PXFirstIndexInSortedRangePassingTest();
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = self->_clipIndicesSortedByTimeRangeEnd[v6];
    memset(&v13, 0, sizeof(v13));
    v10 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v10;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v13, &range);
    v11 = PXLastIndexInSortedRangePassingTest();
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v11 - v9 + 1;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = v9;
  }
  v12 = v7;
  result.length = v8;
  result.location = v12;
  return result;
}

- (_NSRange)_smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:(id *)a3
{
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  NSUInteger v8;
  uint64_t v9;
  __int128 v10;
  uint64_t v11;
  NSUInteger v12;
  CMTime v13;
  uint64_t v14;
  uint64_t v15;
  BOOL (*v16)(uint64_t, uint64_t);
  void *v17;
  PXStoryConcreteTimeline *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  CMTimeRange range;
  _NSRange result;

  -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments");
  v14 = MEMORY[0x1E0C809B0];
  v5 = *(_OWORD *)&a3->var0.var3;
  v19 = *(_OWORD *)&a3->var0.var0;
  v15 = 3221225472;
  v16 = __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke;
  v17 = &unk_1E512ED40;
  v18 = self;
  v20 = v5;
  v21 = *(_OWORD *)&a3->var1.var1;
  v6 = PXFirstIndexInSortedRangePassingTest();
  v7 = 0x7FFFFFFFFFFFFFFFLL;
  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v6;
    memset(&v13, 0, sizeof(v13));
    v10 = *(_OWORD *)&a3->var0.var3;
    *(_OWORD *)&range.start.value = *(_OWORD *)&a3->var0.var0;
    *(_OWORD *)&range.start.epoch = v10;
    *(_OWORD *)&range.duration.timescale = *(_OWORD *)&a3->var1.var1;
    CMTimeRangeGetEnd(&v13, &range);
    v11 = PXLastIndexInSortedRangePassingTest();
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v8 = 0;
    else
      v8 = v11 - v9 + 1;
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
      v7 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v7 = v9;
  }
  v12 = v7;
  result.length = v8;
  result.location = v12;
  return result;
}

- (id)_clipResourceIndexesOfKind:(int64_t)a3 inSegmentAtIndex:(int64_t)a4
{
  id v7;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v16;
  void *v17;
  _OWORD v19[3];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v7 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v8 = &self->_segmentTimeRanges[a4];
  v9 = *(_OWORD *)&v8->var1.var1;
  v10 = *(_OWORD *)&v8->var0.var0;
  v24 = *(_OWORD *)&v8->var0.var3;
  v25 = v9;
  v23 = v10;
  v20 = v10;
  v21 = v24;
  v22 = v9;
  v11 = -[PXStoryConcreteTimeline _smallestRangeOfClipsPotentiallyIntersectingTimeRange:](self, "_smallestRangeOfClipsPotentiallyIntersectingTimeRange:", &v20);
  if (v12)
  {
    v13 = v12;
    v14 = v11;
    v15 = v11;
    do
    {
      if (self->_clipResourceKinds[v14] == a3)
      {
        v16 = &self->_clipTimeRanges[v15];
        v20 = *(_OWORD *)&v16->var0.var0;
        v21 = *(_OWORD *)&v16->var0.var3;
        v22 = *(_OWORD *)&v16->var1.var1;
        v19[0] = v23;
        v19[1] = v24;
        v19[2] = v25;
        if (PXStoryTimeRangeIntersectsTimeRange(&v20, v19))
          objc_msgSend(v7, "addIndex:", self->_clipResourceIndexes[v14]);
      }
      ++v14;
      ++v15;
      --v13;
    }
    while (v13);
  }
  v17 = (void *)objc_msgSend(v7, "copy");

  return v17;
}

- (id)_indexesOfSegmentsContainingClipsWithResourceKind:(int64_t)a3 indexes:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);
  void *v15;
  PXStoryConcreteTimeline *v16;
  id v17;

  v6 = (objc_class *)MEMORY[0x1E0CB3788];
  v7 = a4;
  v8 = objc_alloc_init(v6);
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke;
  v15 = &unk_1E5147A40;
  v16 = self;
  v17 = v8;
  v9 = v8;
  -[PXStoryConcreteTimeline _enumerateClipsWithResourceKind:indexes:usingBlock:](self, "_enumerateClipsWithResourceKind:indexes:usingBlock:", a3, v7, &v12);

  v10 = (void *)objc_msgSend(v9, "copy", v12, v13, v14, v15, v16);
  return v10;
}

- (void)_enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v13;
  __int128 v14;
  _OWORD v15[3];
  __int128 v16;
  __int128 v17;
  __int128 v18;

  v6 = (void (**)(id, _QWORD))a4;
  v7 = *(_OWORD *)&a3->var0.var3;
  v16 = *(_OWORD *)&a3->var0.var0;
  v17 = v7;
  v18 = *(_OWORD *)&a3->var1.var1;
  v8 = -[PXStoryConcreteTimeline _smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:](self, "_smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:", &v16);
  if (v9)
  {
    v10 = v8;
    v11 = v9;
    v12 = v8;
    do
    {
      v13 = &self->_segmentTimeRanges[v12];
      v16 = *(_OWORD *)&v13->var0.var0;
      v17 = *(_OWORD *)&v13->var0.var3;
      v18 = *(_OWORD *)&v13->var1.var1;
      v14 = *(_OWORD *)&a3->var0.var3;
      v15[0] = *(_OWORD *)&a3->var0.var0;
      v15[1] = v14;
      v15[2] = *(_OWORD *)&a3->var1.var1;
      if (PXStoryTimeRangeIntersectsTimeRange(&v16, v15))
        v6[2](v6, v10);
      ++v10;
      ++v12;
      --v11;
    }
    while (v11);
  }

}

- (void)_enumerateClipsWithResourceKind:(int64_t)a3 indexes:(id)a4 usingBlock:(id)a5
{
  void (**v8)(id, int64_t);
  int64_t v9;
  id v10;

  v10 = a4;
  v8 = (void (**)(id, int64_t))a5;
  if (self->_numberOfClips >= 1)
  {
    v9 = 0;
    do
    {
      if (self->_clipResourceKinds[v9] == a3
        && objc_msgSend(v10, "containsIndex:", self->_clipResourceIndexes[v9]))
      {
        v8[2](v8, v9);
      }
      ++v9;
    }
    while (v9 < self->_numberOfClips);
  }

}

- (void)_assertConsistency
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *v13;
  NSObject *v14;
  NSObject *v15;
  CMTime v16;
  CMTime v17;
  CMTime v18;
  $DEC141BA10DB957F4DDC414EFF8F1C09 time2;
  CMTime v20;
  __int128 v21;
  CMTimeEpoch v22;
  __int128 v23;
  CMTimeEpoch var3;
  $DEC141BA10DB957F4DDC414EFF8F1C09 time1;

  v3 = -[PXStoryConcreteTimeline numberOfClips](self, "numberOfClips");
  if (v3 >= 2)
  {
    v4 = 0;
    v5 = 0;
    v6 = v3 - 1;
    do
    {
      v7 = &self->_clipTimeRanges[v4];
      v23 = *(_OWORD *)&v7->var0.var0;
      var3 = v7->var0.var3;
      v21 = *(_OWORD *)&v7[1].var0.var0;
      v22 = v7[1].var0.var3;
      *(_OWORD *)&time1.var0.var0 = v23;
      time1.var0.var3 = var3;
      *(_OWORD *)&time2.var0.var0 = v21;
      time2.var0.var3 = v22;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1)
      {
        PXAssertGetLog();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
        {
          LOWORD(time1.var0.var0) = 0;
          _os_log_fault_impl(&dword_1A6789000, v8, OS_LOG_TYPE_FAULT, "clip time range starts aren't monotonic", (uint8_t *)&time1, 2u);
        }

      }
      time2 = self->_clipTimeRanges[self->_clipIndicesSortedByTimeRangeEnd[v5]];
      time1 = time2;
      CMTimeRangeGetEnd(&v20, (CMTimeRange *)&time1);
      time2 = self->_clipTimeRanges[self->_clipIndicesSortedByTimeRangeEnd[v5 + 1]];
      time1 = time2;
      CMTimeRangeGetEnd(&v18, (CMTimeRange *)&time1);
      time1.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v20;
      time2.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v18;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1)
      {
        PXAssertGetLog();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
        {
          LOWORD(time1.var0.var0) = 0;
          _os_log_fault_impl(&dword_1A6789000, v9, OS_LOG_TYPE_FAULT, "clip indices aren't sorted by time range end", (uint8_t *)&time1, 2u);
        }

      }
      ++v5;
      ++v4;
    }
    while (v6 != v5);
  }
  v10 = -[PXStoryConcreteTimeline numberOfSegments](self, "numberOfSegments");
  if (v10 >= 2)
  {
    v11 = 0;
    v12 = v10 - 1;
    do
    {
      v13 = &self->_segmentTimeRanges[v11];
      v23 = *(_OWORD *)&v13->var0.var0;
      var3 = v13->var0.var3;
      v21 = *(_OWORD *)&v13[1].var0.var0;
      v22 = v13[1].var0.var3;
      *(_OWORD *)&time1.var0.var0 = v23;
      time1.var0.var3 = var3;
      *(_OWORD *)&time2.var0.var0 = v21;
      time2.var0.var3 = v22;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1)
      {
        PXAssertGetLog();
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          LOWORD(time1.var0.var0) = 0;
          _os_log_fault_impl(&dword_1A6789000, v14, OS_LOG_TYPE_FAULT, "segment time range starts aren't monotonic", (uint8_t *)&time1, 2u);
        }

      }
      time2 = self->_segmentTimeRanges[v11];
      time1 = time2;
      CMTimeRangeGetEnd(&v17, (CMTimeRange *)&time1);
      time2 = self->_segmentTimeRanges[v11 + 1];
      time1 = time2;
      CMTimeRangeGetEnd(&v16, (CMTimeRange *)&time1);
      time1.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v17;
      time2.var0 = ($3CC8671D27C23BF42ADDB32F2B5E48AE)v16;
      if (CMTimeCompare((CMTime *)&time1, (CMTime *)&time2) >= 1)
      {
        PXAssertGetLog();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          LOWORD(time1.var0.var0) = 0;
          _os_log_fault_impl(&dword_1A6789000, v15, OS_LOG_TYPE_FAULT, "segment time range ends aren't monotonic", (uint8_t *)&time1, 2u);
        }

      }
      ++v11;
      --v12;
    }
    while (v12);
  }
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  double height;
  double width;
  double y;
  double x;
  id v11;
  __int128 v12;
  id v13;
  _OWORD v14[3];
  _QWORD v15[4];
  id v16;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __69__PXStoryConcreteTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke;
  v15[3] = &unk_1E512ED68;
  v16 = v11;
  v12 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v12;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  v13 = v11;
  -[PXStoryConcreteTimeline enumerateConcreteClipsInTimeRange:rect:usingBlock:](self, "enumerateConcreteClipsInTimeRange:rect:usingBlock:", v14, v15, x, y, width, height);

}

- (void)enumerateConcreteClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v7;
  __int128 v8;
  id v9;
  _OWORD v10[3];

  v7 = a5;
  v8 = *(_OWORD *)&a3->var0.var3;
  v10[0] = *(_OWORD *)&a3->var0.var0;
  v10[1] = v8;
  v10[2] = *(_OWORD *)&a3->var1.var1;
  -[PXStoryConcreteTimeline _smallestRangeOfClipsPotentiallyIntersectingTimeRange:](self, "_smallestRangeOfClipsPotentiallyIntersectingTimeRange:", v10);
  v9 = v7;
  PXEnumerateSubrangesMatchingTestUsingBlock();

}

- (int64_t)lastClipIdentifier
{
  int64_t numberOfClips;
  int64_t *v3;

  numberOfClips = self->_numberOfClips;
  if (numberOfClips < 1)
    v3 = &PXStoryClipIdentifierNull;
  else
    v3 = (int64_t *)((char *)self->_clipInfos + 768 * numberOfClips - 768);
  return *v3;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  int64_t numberOfClips;
  uint64_t v5;
  $C99EDD0FAA5CC172DE20AC79C6A499CF *i;
  void *v8;
  int64_t *clipResourceKinds;
  int64_t v10;
  int64_t *clipResourceIndexes;
  int64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXStoryConcreteClip *v15;
  PXStoryConcreteClip *v16;
  _BYTE v17[768];

  numberOfClips = self->_numberOfClips;
  if (numberOfClips < 1)
    return 0;
  v5 = 0;
  for (i = self->_clipInfos; i->var0 != a3; i = ($C99EDD0FAA5CC172DE20AC79C6A499CF *)((char *)i + 768))
  {
    if (numberOfClips == ++v5)
      return 0;
  }
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  clipResourceKinds = self->_clipResourceKinds;
  v10 = clipResourceKinds[v5];
  clipResourceIndexes = self->_clipResourceIndexes;
  v12 = clipResourceIndexes[v5];
  if (v5)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      if (clipResourceIndexes[v13] == v12 && clipResourceKinds[v13] == v10)
        ++v14;
      ++v13;
    }
    while (v5 != v13);
  }
  else
  {
    v14 = 0;
  }
  v15 = [PXStoryConcreteClip alloc];
  memcpy(v17, (char *)self->_clipInfos + 768 * v5, sizeof(v17));
  v16 = -[PXStoryConcreteClip initWithInfo:resourceKind:resourceIndex:resourceOccurrenceIndex:resourcesDataSource:](v15, "initWithInfo:resourceKind:resourceIndex:resourceOccurrenceIndex:resourcesDataSource:", v17, v10, v12, v14, v8);

  return v16;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6;
  __int128 v7;
  id v8;
  _OWORD v9[3];

  v6 = a4;
  v7 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v7;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  -[PXStoryConcreteTimeline _smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:](self, "_smallestRangeOfSegmentsPotentiallyIntersectingTimeRange:", v9);
  v8 = v6;
  PXEnumerateSubrangesMatchingTestUsingBlock();

}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  void *v7;

  if (a3 < 0 || self->_numberOfSegments <= a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryConcreteTimeline.m"), 313, CFSTR("segment index %ti out of bounds 0 ..< %ti"), a3, self->_numberOfSegments);

  }
  return *(&self->_segmentInfos->var0 + 25 * a3);
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  int64_t numberOfSegments;
  int64_t result;
  $09F85D15C0ED9C1985B34302C6989F26 *segmentInfos;
  int64_t var0;

  numberOfSegments = self->_numberOfSegments;
  if (numberOfSegments < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  result = 0;
  segmentInfos = self->_segmentInfos;
  while (1)
  {
    var0 = segmentInfos->var0;
    segmentInfos = ($09F85D15C0ED9C1985B34302C6989F26 *)((char *)segmentInfos + 200);
    if (var0 == a3)
      break;
    if (numberOfSegments == ++result)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  int64_t var0;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  _OWORD *v8;
  __int128 v9;

  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  var0 = self[3].var0.var0;
  if (var0 >= 1)
  {
    v5 = 0;
    v6 = *(uint64_t **)&self[2].var1.var1;
    while (1)
    {
      v7 = *v6;
      v6 += 25;
      if (v7 == a4)
        break;
      if (var0 == ++v5)
        return self;
    }
    v8 = (_OWORD *)(self[2].var1.var0 + 48 * v5);
    v9 = v8[1];
    *(_OWORD *)&retstr->var0.var0 = *v8;
    *(_OWORD *)&retstr->var0.var3 = v9;
    *(_OWORD *)&retstr->var1.var1 = v8[2];
  }
  return self;
}

- ($09F85D15C0ED9C1985B34302C6989F26)infoForSegmentWithIdentifier:(SEL)a3
{
  int64_t var0;
  uint64_t i;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  retstr->var3.var3.var1 = 0;
  *(_OWORD *)&retstr->var3.var2.var3 = 0u;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = 0u;
  *(_OWORD *)&retstr->var3.var1.var1 = 0u;
  *(_OWORD *)&retstr->var3.var2.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var0 = 0u;
  *(_OWORD *)&retstr->var3.var0.var3 = 0u;
  *(_OWORD *)&retstr->var2.var2.var1 = 0u;
  *(_OWORD *)&retstr->var2.var3 = 0u;
  *(_OWORD *)&retstr->var1.var3 = 0u;
  *(_OWORD *)&retstr->var2.var0 = 0u;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  var0 = self->var3.var2.var0;
  if (var0 >= 1)
  {
    for (i = *(_QWORD *)&self->var3.var1.var1; *(_QWORD *)i != a4; i += 200)
    {
      if (!--var0)
        return self;
    }
    v6 = *(_OWORD *)(i + 176);
    *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)(i + 160);
    *(_OWORD *)&retstr->var3.var3.var0.var1 = v6;
    retstr->var3.var3.var1 = *(_QWORD *)(i + 192);
    v7 = *(_OWORD *)(i + 112);
    *(_OWORD *)&retstr->var3.var0.var0 = *(_OWORD *)(i + 96);
    *(_OWORD *)&retstr->var3.var0.var3 = v7;
    v8 = *(_OWORD *)(i + 144);
    *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)(i + 128);
    *(_OWORD *)&retstr->var3.var2.var0 = v8;
    v9 = *(_OWORD *)(i + 48);
    *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)(i + 32);
    *(_OWORD *)&retstr->var2.var0 = v9;
    v10 = *(_OWORD *)(i + 80);
    *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)(i + 64);
    *(_OWORD *)&retstr->var2.var3 = v10;
    v11 = *(_OWORD *)(i + 16);
    *(_OWORD *)&retstr->var0 = *(_OWORD *)i;
    *(_OWORD *)&retstr->var1.var1 = v11;
  }
  return self;
}

- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  id v14;
  uint64_t (**v15)(void *, uint64_t);
  uint64_t v16;
  uint64_t v17;
  BOOL v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  uint64_t v24;
  uint64_t *v25;
  void *v27;
  objc_super v28;
  _QWORD aBlock[4];
  id v30;
  id v31;
  id v32;
  uint64_t v33;
  _QWORD v34[5];
  id v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  unint64_t v51;

  v6 = a4;
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", 1, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[PXStoryConcreteTimeline _indexesOfSegmentsContainingClipsWithResourceKind:indexes:](self, "_indexesOfSegmentsContainingClipsWithResourceKind:indexes:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = 0;
    v49 = &v48;
    v50 = 0x2020000000;
    v51 = 0x8000000000000001;
    v44 = 0;
    v45 = &v44;
    v46 = 0x2020000000;
    v47 = 0x7FFFFFFFFFFFFFFFLL;
    v40 = 0;
    v41 = &v40;
    v42 = 0x2020000000;
    v43 = 0x7FFFFFFFFFFFFFFFLL;
    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke;
    v34[3] = &unk_1E512ED90;
    v34[4] = self;
    v39 = 1;
    v27 = v8;
    v10 = v8;
    v35 = v10;
    v36 = &v48;
    v37 = &v40;
    v38 = &v44;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v34);
    v11 = v45[3];
    if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v12 = 0;
    }
    else
    {
      if (v41[3] > v49[3])
      {
        v13 = objc_msgSend(v6, "indexOfSegmentWithIdentifier:", a3);
        aBlock[0] = MEMORY[0x1E0C809B0];
        aBlock[1] = 3221225472;
        aBlock[2] = __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke_2;
        aBlock[3] = &unk_1E512EDB8;
        v14 = v6;
        v30 = v14;
        v33 = 1;
        v31 = v7;
        v32 = v10;
        v15 = (uint64_t (**)(void *, uint64_t))_Block_copy(aBlock);
        v16 = v13;
        do
        {
          v17 = v16;
          v18 = v16-- < 1;
        }
        while (!v18 && (v15[2](v15, v16) & 1) != 0);
        v19 = objc_msgSend(v14, "numberOfSegments", v8);
        if (v13 <= v19 - 1)
          v20 = v19 - 1;
        else
          v20 = v13;
        v21 = v13;
        while (v20 != v21)
        {
          if ((v15[2](v15, ++v21) & 1) == 0)
          {
            v20 = v21 - 1;
            break;
          }
        }
        if (v17 < v20)
        {
          PXFloatNormalize();
          v22 = v45[3];
          PXFloatDenormalize();
          v24 = (uint64_t)v23;
          v25 = v45;
          v45[3] = (uint64_t)v23;
          if (v22 > (uint64_t)v23)
            v24 = v22;
          if (v24 >= v41[3])
            v24 = v41[3];
          v25[3] = v24;
        }

        v11 = v45[3];
      }
      v12 = -[PXStoryConcreteTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", v11, v27);
    }
    v8 = v27;

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v44, 8);
    _Block_object_dispose(&v48, 8);

  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)PXStoryConcreteTimeline;
    v12 = -[PXStoryBaseTimeline identifierOfSegmentClosestToSegmentWithIdentifier:inTimeline:](&v28, sel_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline_, a3, v6);
  }

  return (int64_t)v12;
}

- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  objc_super v14;
  _QWORD v15[4];
  id v16;
  PXStoryConcreteTimeline *v17;

  v6 = a4;
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", 1, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[PXStoryConcreteTimeline _indexesOfSegmentsContainingClipsWithResourceKind:indexes:](self, "_indexesOfSegmentsContainingClipsWithResourceKind:indexes:", 1, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __89__PXStoryConcreteTimeline_identifiersOfSegmentsMatchingSegmentWithIdentifier_inTimeline___block_invoke;
    v15[3] = &unk_1E51460E8;
    v16 = v10;
    v17 = self;
    v11 = v10;
    objc_msgSend(v9, "enumerateIndexesUsingBlock:", v15);
    v12 = (void *)objc_msgSend(v11, "copy");

  }
  else
  {
    v14.receiver = self;
    v14.super_class = (Class)PXStoryConcreteTimeline;
    -[PXStoryBaseTimeline identifiersOfSegmentsMatchingSegmentWithIdentifier:inTimeline:](&v14, sel_identifiersOfSegmentsMatchingSegmentWithIdentifier_inTimeline_, a3, v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  int64_t v11;

  v8 = a4;
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hasSameResourcesOfKind:as:", a3, v9);

  if (!v10)
    return 0;
  v11 = -[PXStoryConcreteTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", a5);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  -[PXStoryConcreteTimeline _clipResourceIndexesOfKind:inSegmentAtIndex:](self, "_clipResourceIndexesOfKind:inSegmentAtIndex:", a3, v11);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  int64_t numberOfClips;
  uint64_t v11;
  $C99EDD0FAA5CC172DE20AC79C6A499CF *clipInfos;
  int64_t v13;

  v8 = a4;
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a5) = objc_msgSend(v8, "hasSameResourcesOfKind:as:", a5, v9);

  if ((_DWORD)a5 && (numberOfClips = self->_numberOfClips, numberOfClips >= 1))
  {
    v11 = 0;
    clipInfos = self->_clipInfos;
    while (clipInfos->var0 != a3)
    {
      clipInfos = ($C99EDD0FAA5CC172DE20AC79C6A499CF *)((char *)clipInfos + 768);
      if (numberOfClips == ++v11)
        goto LABEL_6;
    }
    v13 = self->_clipResourceIndexes[v11];
  }
  else
  {
LABEL_6:
    v13 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v13;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  int v10;
  int64_t numberOfClips;
  uint64_t v12;
  uint64_t v13;
  $C99EDD0FAA5CC172DE20AC79C6A499CF *clipInfos;
  int64_t v15;

  v8 = a4;
  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "hasSameResourcesOfKind:as:", a5, v9);

  if (v10 && (numberOfClips = self->_numberOfClips, numberOfClips >= 1))
  {
    v12 = 0;
    v13 = 8;
    while (1)
    {
      if (self->_clipResourceIndexes[v12] == a3)
      {
        clipInfos = self->_clipInfos;
        if (*(int64_t *)((char *)&clipInfos->var0 + v13) == a5)
          break;
      }
      ++v12;
      v13 += 768;
      if (numberOfClips == v12)
        goto LABEL_7;
    }
    v15 = *(&clipInfos->var0 + 96 * v12);
  }
  else
  {
LABEL_7:
    v15 = 0;
  }

  return v15;
}

- (int64_t)dataSourceIdentifier
{
  void *v2;
  int64_t v3;

  -[PXStoryConcreteTimeline resourcesDataSource](self, "resourcesDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "identifier");

  return v3;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  return -[PXStoryConcreteTimeline initWithTimeline:]([PXStoryMutableConcreteTimeline alloc], "initWithTimeline:", self);
}

- (int64_t)numberOfClips
{
  return self->_numberOfClips;
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

- (PXStoryResourcesDataSource)resourcesDataSource
{
  return self->_resourcesDataSource;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_resourcesDataSource, 0);
}

uint64_t __89__PXStoryConcreteTimeline_identifiersOfSegmentsMatchingSegmentWithIdentifier_inTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(*(id *)(a1 + 40), "identifierForSegmentAtIndex:", a2));
}

void __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "_clipResourceIndexesOfKind:inSegmentAtIndex:", *(_QWORD *)(a1 + 72), a2);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v4 = MatchingScoreBetweenClipResourceIndexes(*(void **)(a1 + 40), v7);
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(_QWORD *)(v5 + 24);
  if (v4 >= v6)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = a2;
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v6 = *(_QWORD *)(v5 + 24);
  }
  if (v4 > v6)
  {
    *(_QWORD *)(v5 + 24) = v4;
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = a2;
  }

}

uint64_t __88__PXStoryConcreteTimeline_identifierOfSegmentClosestToSegmentWithIdentifier_inTimeline___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(*(id *)(a1 + 32), "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40), objc_msgSend(*(id *)(a1 + 32), "identifierForSegmentAtIndex:", a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToIndexSet:", *(_QWORD *)(a1 + 48));

  return v4;
}

BOOL __67__PXStoryConcreteTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
{
  _OWORD *v2;
  __int128 v3;
  __int128 v4;
  _OWORD v6[3];
  _OWORD v7[3];

  v2 = (_OWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 48 * a2);
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

uint64_t __67__PXStoryConcreteTimeline_enumerateSegmentsInTimeRange_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 48 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) + 200 * a2, a4);
}

BOOL __77__PXStoryConcreteTimeline_enumerateConcreteClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1, uint64_t a2)
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
    return CGRectIntersectsRect(*(CGRect *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 32 * a2), *(CGRect *)(a1 + 40));
  return result;
}

uint64_t __77__PXStoryConcreteTimeline_enumerateConcreteClipsInTimeRange_rect_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), a3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 48 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 32 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 88) + 768 * a2, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 104) + 8 * a2, a2, a4);
}

uint64_t __69__PXStoryConcreteTimeline_enumerateClipsInTimeRange_rect_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  _QWORD *v3;
  __int128 *v4;
  __int128 v5;
  _OWORD v6[3];
  _QWORD v7[4];
  id v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v3 = *(_QWORD **)(a1 + 32);
  v2 = *(void **)(a1 + 40);
  v4 = (__int128 *)(v3[8] + 48 * a2);
  v5 = v4[1];
  v9 = *v4;
  v10 = v5;
  v11 = v4[2];
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke_2;
  v7[3] = &unk_1E51438B0;
  v8 = v2;
  v6[0] = v9;
  v6[1] = v10;
  v6[2] = v11;
  objc_msgSend(v3, "_enumerateSegmentsInTimeRange:usingBlock:", v6, v7);

}

uint64_t __85__PXStoryConcreteTimeline__indexesOfSegmentsContainingClipsWithResourceKind_indexes___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addIndex:", a2);
}

BOOL __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4;
  CMTime v5;
  CMTimeRange range;

  v4 = *(CMTimeRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 48 * a2);
  range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(_QWORD *)(a1 + 56);
  range.start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

BOOL __84__PXStoryConcreteTimeline__smallestRangeOfSegmentsPotentiallyIntersectingTimeRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CMTime v4;
  CMTime time2;
  CMTime time1;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 120) + 48 * a2;
  *(_OWORD *)&v4.value = *(_OWORD *)v2;
  v4.epoch = *(_QWORD *)(v2 + 16);
  time2 = *(CMTime *)(a1 + 40);
  time1 = v4;
  return CMTimeCompare(&time1, &time2) < 1;
}

BOOL __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke(uint64_t a1, uint64_t a2)
{
  CMTimeRange v4;
  CMTime v5;
  CMTimeRange range;

  v4 = *(CMTimeRange *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 64)
                      + 48 * *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 8 * a2));
  range = v4;
  CMTimeRangeGetEnd(&v5, &range);
  *(_OWORD *)&v4.start.value = *(_OWORD *)(a1 + 40);
  v4.start.epoch = *(_QWORD *)(a1 + 56);
  range.start = v5;
  return CMTimeCompare(&range.start, &v4.start) > 0;
}

uint64_t __81__PXStoryConcreteTimeline__smallestRangeOfClipsPotentiallyIntersectingTimeRange___block_invoke_2(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  CMTime v4;
  CMTime time2;
  CMTime time1;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 64) + 48 * a2;
  *(_OWORD *)&v4.value = *(_OWORD *)v2;
  v4.epoch = *(_QWORD *)(v2 + 16);
  time2 = *(CMTime *)(a1 + 40);
  time1 = v4;
  return CMTimeCompare(&time1, &time2) >> 31;
}

@end
