@implementation PXStoryBaseTimeline

- (int64_t)dataSourceIdentifier
{
  return *(_QWORD *)off_1E50B7E98;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a3, self, CFSTR("PXStoryBaseTimeline.m"), 67, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline timeRange]", v7);

  abort();
}

- (CGSize)size
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBaseTimeline.m"), 71, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline size]", v6);

  abort();
}

- (int64_t)numberOfClipsWithResourceKind:(int64_t)a3
{
  int64_t v5;
  _QWORD v7[6];
  _BYTE v8[48];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;

  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  -[PXStoryBaseTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __53__PXStoryBaseTimeline_numberOfClipsWithResourceKind___block_invoke;
  v7[3] = &unk_1E5137C00;
  v7[4] = &v9;
  v7[5] = a3;
  -[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v8, v7);
  v5 = v10[3];
  _Block_object_dispose(&v9, 8);
  return v5;
}

- (void)enumerateClipsInTimeRange:(id *)a3 rect:(CGRect)a4 usingBlock:(id)a5
{
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;

  v7 = a5;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBaseTimeline.m"), 87, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:]", v10);

  abort();
}

- (id)clipWithResourceKind:(int64_t)a3 afterClipIdentifier:(int64_t)a4
{
  id v7;
  _QWORD v9[9];
  _BYTE v10[48];
  _QWORD v11[3];
  BOOL v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;

  v13 = 0;
  v14 = &v13;
  v15 = 0x3032000000;
  v16 = __Block_byref_object_copy__94582;
  v17 = __Block_byref_object_dispose__94583;
  v18 = 0;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x2020000000;
  v12 = a4 == 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  -[PXStoryBaseTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __64__PXStoryBaseTimeline_clipWithResourceKind_afterClipIdentifier___block_invoke;
  v9[3] = &unk_1E5125238;
  v9[6] = &v13;
  v9[7] = a3;
  v9[4] = self;
  v9[5] = v11;
  v9[8] = a4;
  -[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v10, v9);
  v7 = (id)v14[5];
  _Block_object_dispose(v11, 8);
  _Block_object_dispose(&v13, 8);

  return v7;
}

- (id)clipWithIdentifier:(int64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBaseTimeline.m"), 109, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline clipWithIdentifier:]", v7);

  abort();
}

- (int64_t)numberOfSegments
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBaseTimeline.m"), 113, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline numberOfSegments]", v6);

  abort();
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  objc_class *v8;
  void *v9;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryBaseTimeline.m"), 117, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:]", v9);

  abort();
}

- (int64_t)firstSegmentIdentifier
{
  if (-[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments") < 1)
    return 0;
  else
    return -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", 0);
}

- (int64_t)lastSegmentIdentifier
{
  if (-[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments") < 1)
    return 0;
  else
    return -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", -[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments") - 1);
}

- (int64_t)identifierForSegmentAtIndex:(int64_t)a3
{
  int64_t v5;
  _QWORD v7[7];
  _BYTE v8[48];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __51__PXStoryBaseTimeline_identifierForSegmentAtIndex___block_invoke;
  v7[3] = &unk_1E5125260;
  v7[5] = &v10;
  v7[6] = a3;
  v7[4] = v9;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", v8, v7);
  v5 = v11[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  int64_t v5;
  _QWORD v7[7];
  _BYTE v8[48];
  _QWORD v9[4];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0x7FFFFFFFFFFFFFFFLL;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v9[3] = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PXStoryBaseTimeline_indexOfSegmentWithIdentifier___block_invoke;
  v7[3] = &unk_1E5125260;
  v7[5] = v9;
  v7[6] = a3;
  v7[4] = &v10;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", v8, v7);
  v5 = v11[3];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v10, 8);
  return v5;
}

- (int64_t)identifierForSegmentWithOffset:(id *)a3 fromEndOfSegmentWithIdentifier:(int64_t)a4 timeIntoSegment:(id *)a5
{
  int64_t v6;
  int64_t v9;
  int64_t v10;
  int64_t v11;
  CMTime v13;
  __int128 v14;
  CMTimeEpoch v15;
  __int128 v16;
  CMTimeEpoch v17;
  CMTime v18;
  CMTime v19;
  CMTime time2;
  CMTime time1;

  v6 = a4;
  v9 = -[PXStoryBaseTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", a4);
  v19 = *(CMTime *)a3;
  if (v9 >= -[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments") - 1)
  {
    -[PXStoryBaseTimeline timeRangeForSegmentWithIdentifier:](self, "timeRangeForSegmentWithIdentifier:", v6);
    v19 = v13;
  }
  else
  {
    v10 = -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", v9 + 1);
    v11 = -[PXStoryBaseTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", v6) + 1;
    -[PXStoryBaseTimeline timeRangeForSegmentWithIdentifier:](self, "timeRangeForSegmentWithIdentifier:", v10);
    *(_OWORD *)&v18.value = v16;
    v18.epoch = v17;
    v6 = v10;
    while (1)
    {
      time1 = v19;
      time2 = v18;
      if (CMTimeCompare(&time1, &time2) < 1)
        break;
      if (v11 < -[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments") - 1)
      {
        time1 = v19;
        time2 = v18;
        CMTimeSubtract(&v19, &time1, &time2);
        v6 = -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", ++v11);
        -[PXStoryBaseTimeline timeRangeForSegmentWithIdentifier:](self, "timeRangeForSegmentWithIdentifier:", v6);
        *(_OWORD *)&v18.value = v14;
        v18.epoch = v15;
      }
      else
      {
        v19 = v18;
      }
    }
  }
  *(CMTime *)a5 = v19;
  return v6;
}

- (int64_t)identifierOfFirstSegmentContainingAsset:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int64_t v15;
  _QWORD v17[5];
  id v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  SEL v24;
  _BYTE v25[48];
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t v29;

  v5 = a3;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  -[PXStoryBaseTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke;
  v17[3] = &unk_1E51252B0;
  v17[4] = self;
  v20 = v7;
  v21 = v9;
  v22 = v11;
  v23 = v13;
  v24 = a2;
  v14 = v5;
  v18 = v14;
  v19 = &v26;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", v25, v17);
  v15 = v27[3];

  _Block_object_dispose(&v26, 8);
  return v15;
}

- (BOOL)containsSegmentWithIdentifier:(int64_t)a3
{
  return -[PXStoryBaseTimeline indexOfSegmentWithIdentifier:](self, "indexOfSegmentWithIdentifier:", a3) != 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)containsAllSegmentsWithIdentifiers:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v8 = 0;
    v9 = &v8;
    v10 = 0x2020000000;
    v11 = 1;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__PXStoryBaseTimeline_containsAllSegmentsWithIdentifiers___block_invoke;
    v7[3] = &unk_1E5136440;
    v7[4] = self;
    v7[5] = &v8;
    objc_msgSend(v4, "enumerateIndexesUsingBlock:", v7);
    v5 = *((_BYTE *)v9 + 24) != 0;
    _Block_object_dispose(&v8, 8);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  *(_OWORD *)&retstr->var0.var3 = 0u;
  *(_OWORD *)&retstr->var1.var1 = 0u;
  *(_OWORD *)&retstr->var0.var0 = 0u;
  return ($DEC141BA10DB957F4DDC414EFF8F1C09 *)-[PXStoryBaseTimeline _findSegmentMatchingIdentifier:timeRange:info:](self, "_findSegmentMatchingIdentifier:timeRange:info:", a4, retstr, 0);
}

- ($09F85D15C0ED9C1985B34302C6989F26)infoForSegmentWithIdentifier:(SEL)a3
{
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
  return ($09F85D15C0ED9C1985B34302C6989F26 *)-[PXStoryBaseTimeline _findSegmentMatchingIdentifier:timeRange:info:](self, "_findSegmentMatchingIdentifier:timeRange:info:", a4, 0, retstr);
}

- (void)_findSegmentMatchingIdentifier:(int64_t)a3 timeRange:(id *)a4 info:(id *)a5
{
  __int128 v9;
  __int128 v10;
  uint64_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[7];
  _BYTE v22[48];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v40 = 0;
  v41 = &v40;
  v42 = 0x5010000000;
  v43 = &unk_1A7E74EE7;
  v44 = 0u;
  v45 = 0u;
  v46 = 0u;
  v23 = 0;
  v24 = &v23;
  v25 = 0xE810000000;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v26 = &unk_1A7E74EE7;
  v39 = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __69__PXStoryBaseTimeline__findSegmentMatchingIdentifier_timeRange_info___block_invoke;
  v21[3] = &unk_1E5125260;
  v21[5] = &v23;
  v21[6] = a3;
  v21[4] = &v40;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", v22, v21);
  if (a4)
  {
    v10 = *((_OWORD *)v41 + 3);
    v9 = *((_OWORD *)v41 + 4);
    *(_OWORD *)&a4->var0.var0 = *((_OWORD *)v41 + 2);
    *(_OWORD *)&a4->var0.var3 = v10;
    *(_OWORD *)&a4->var1.var1 = v9;
  }
  if (a5)
  {
    v11 = v24;
    *(_OWORD *)&a5->var0 = *((_OWORD *)v24 + 2);
    v12 = *((_OWORD *)v11 + 6);
    v14 = *((_OWORD *)v11 + 3);
    v13 = *((_OWORD *)v11 + 4);
    *(_OWORD *)&a5->var2.var0 = *((_OWORD *)v11 + 5);
    *(_OWORD *)&a5->var2.var2.var1 = v12;
    *(_OWORD *)&a5->var1.var1 = v14;
    *(_OWORD *)&a5->var1.var3 = v13;
    v15 = *((_OWORD *)v11 + 10);
    v17 = *((_OWORD *)v11 + 7);
    v16 = *((_OWORD *)v11 + 8);
    *(_OWORD *)&a5->var3.var0.var3 = *((_OWORD *)v11 + 9);
    *(_OWORD *)&a5->var3.var1.var1 = v15;
    *(_OWORD *)&a5->var2.var3 = v17;
    *(_OWORD *)&a5->var3.var0.var0 = v16;
    v19 = *((_OWORD *)v11 + 12);
    v18 = *((_OWORD *)v11 + 13);
    v20 = *((_OWORD *)v11 + 11);
    a5->var3.var3.var1 = v11[28];
    *(_OWORD *)&a5->var3.var2.var3 = v19;
    *(_OWORD *)&a5->var3.var3.var0.var1 = v18;
    *(_OWORD *)&a5->var3.var2.var0 = v20;
  }
  _Block_object_dispose(&v23, 8);
  _Block_object_dispose(&v40, 8);
}

- (int64_t)identifierOfSegmentClosestToSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;

  if (!a4 || !a3)
    return -[PXStoryBaseTimeline firstSegmentIdentifier](self, "firstSegmentIdentifier", a3);
  AnchorableResourceIdentifiersInTimelineSegment(a4, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments");
  if (v6 < 1)
  {
    v9 = 0;
  }
  else
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0x8000000000000001;
    do
    {
      v11 = -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", v8);
      AnchorableResourceIdentifiersInTimelineSegment(self, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MatchingScoreBetweenResourceIdentifierSets(v12, v5);
      if (v13 > v10)
      {
        v10 = v13;
        v9 = v11;
      }

      ++v8;
    }
    while (v7 != v8);
  }

  return v9;
}

- (id)identifiersOfSegmentsMatchingSegmentWithIdentifier:(int64_t)a3 inTimeline:(id)a4
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;

  if (a4)
  {
    AnchorableResourceIdentifiersInTimelineSegment(a4, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v7 = -[PXStoryBaseTimeline numberOfSegments](self, "numberOfSegments");
    if (v7 >= 1)
    {
      v8 = v7;
      for (i = 0; i != v8; ++i)
      {
        v10 = -[PXStoryBaseTimeline identifierForSegmentAtIndex:](self, "identifierForSegmentAtIndex:", i);
        AnchorableResourceIdentifiersInTimelineSegment(self, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (MatchingScoreBetweenResourceIdentifierSets(v11, v5) >= 1)
          objc_msgSend(v6, "addIndex:", v10);

      }
    }
    v12 = (void *)objc_msgSend(v6, "copy");

  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[PXStoryBaseTimeline size](self, "size", a3);
  PXRectWithOriginAndSize();
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (id)segmentIdentifiersInTimeRange:(id *)a3 rect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  __int128 v11;
  id v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t, uint64_t, uint64_t *);
  void *v21;
  PXStoryBaseTimeline *v22;
  id v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __58__PXStoryBaseTimeline_segmentIdentifiersInTimeRange_rect___block_invoke;
  v21 = &unk_1E51252D8;
  v24 = x;
  v25 = y;
  v26 = width;
  v27 = height;
  v22 = self;
  v23 = v10;
  v11 = *(_OWORD *)&a3->var0.var3;
  v15 = *(_OWORD *)&a3->var0.var0;
  v16 = v11;
  v17 = *(_OWORD *)&a3->var1.var1;
  v12 = v10;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", &v15, &v18);
  v13 = (void *)objc_msgSend(v12, "copy", v15, v16, v17, v18, v19, v20, v21, v22);

  return v13;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  return 0;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  return 0;
}

- (NSString)diagnosticDescription
{
  id v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  id v18;
  id v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  id v28;
  void *v29;
  _QWORD v31[5];
  id v32;
  uint64_t *v33;
  _BYTE v34[48];
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  _BYTE v38[48];
  _QWORD v39[4];
  id v40;
  uint64_t *v41;
  _BYTE v42[48];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  _BYTE v47[48];
  CGSize v48;

  v3 = objc_alloc(MEMORY[0x1E0CB37A0]);
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  PXStoryTimeRangeDescription((uint64_t)v47);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryBaseTimeline size](self, "size");
  NSStringFromCGSize(v48);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@: %p, timeRange=%@, size=%@\n"), v5, self, v6, v7);

  objc_msgSend(v8, "appendFormat:", CFSTR("== Clips ==\n"));
  v43 = 0;
  v44 = &v43;
  v45 = 0x2020000000;
  v46 = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  -[PXStoryBaseTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v17 = MEMORY[0x1E0C809B0];
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke;
  v39[3] = &unk_1E513EA30;
  v18 = v8;
  v40 = v18;
  v41 = &v43;
  -[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v42, v39, v10, v12, v14, v16);
  objc_msgSend(v18, "appendFormat:", CFSTR("== Segments ==\n"));
  v44[3] = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  v35[0] = v17;
  v35[1] = 3221225472;
  v35[2] = __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_2;
  v35[3] = &unk_1E5125300;
  v19 = v18;
  v36 = v19;
  v37 = &v43;
  -[PXStoryBaseTimeline enumerateSegmentsInTimeRange:usingBlock:](self, "enumerateSegmentsInTimeRange:usingBlock:", v38, v35);
  objc_msgSend(v19, "appendFormat:", CFSTR("== Clip Details ==\n"));
  v44[3] = 0;
  -[PXStoryBaseTimeline timeRange](self, "timeRange");
  -[PXStoryBaseTimeline size](self, "size");
  PXRectWithOriginAndSize();
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;
  v31[0] = v17;
  v31[1] = 3221225472;
  v31[2] = __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_3;
  v31[3] = &unk_1E5125328;
  v31[4] = self;
  v28 = v19;
  v32 = v28;
  v33 = &v43;
  -[PXStoryBaseTimeline enumerateClipsInTimeRange:rect:usingBlock:](self, "enumerateClipsInTimeRange:rect:usingBlock:", v34, v31, v21, v23, v25, v27);
  objc_msgSend(v28, "appendString:", CFSTR(">"));
  v29 = (void *)objc_msgSend(v28, "copy");

  _Block_object_dispose(&v43, 8);
  return (NSString *)v29;
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke(uint64_t a1, uint64_t a2, _OWORD *a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;
  uint64_t v10;
  unint64_t *v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;
  __int128 v15;
  void *v16;
  void *v17;
  __CFString *v18;
  __CFString *v19;
  void *v20;
  _OWORD v21[3];
  uint64_t v22;
  uint64_t v23;

  if (a2 >= 1)
  {
    v22 = v5;
    v23 = v6;
    v8 = a2;
    v10 = a4 + 16;
    v11 = (unint64_t *)(a5 + 8);
    do
    {
      v12 = *(v11 - 1);
      v13 = *v11;
      v20 = *(void **)(a1 + 32);
      v14 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v15 = a3[1];
      v21[0] = *a3;
      v21[1] = v15;
      v21[2] = a3[2];
      PXStoryTimeRangeDescription((uint64_t)v21);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromCGRect(*(CGRect *)(v10 - 16));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = CFSTR("??");
      if (v13 <= 5)
        v18 = off_1E5135F60[v13];
      v11 += 96;
      v19 = v18;
      objc_msgSend(v20, "appendFormat:", CFSTR("\t%li: %@ frame=%@ id=%li kind=%@\n"), v14, v16, v17, v12, v19);

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v10 += 32;
      a3 += 3;
      --v8;
    }
    while (v8);
  }
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_2(uint64_t a1, uint64_t a2, __int128 *a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v7;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  __int128 v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  __int128 v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  if (a2 >= 1)
  {
    v27 = v4;
    v28 = v5;
    v7 = a2;
    v9 = a4 + 48;
    do
    {
      v10 = *(void **)(a1 + 32);
      v11 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v12 = a3[1];
      v20 = *a3;
      v21 = v12;
      v22 = a3[2];
      PXStoryTimeRangeDescription((uint64_t)&v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = *(_OWORD *)(v9 + 88);
      v15 = *(_OWORD *)(v9 + 120);
      v24 = *(_OWORD *)(v9 + 104);
      v25 = v15;
      v26 = *(_OWORD *)(v9 + 136);
      v16 = *(_OWORD *)(v9 + 56);
      v20 = *(_OWORD *)(v9 + 40);
      v21 = v16;
      v22 = *(_OWORD *)(v9 + 72);
      v23 = v14;
      PXStoryDurationInfoDescription(&v20);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_OWORD *)(v9 + 16);
      v20 = *(_OWORD *)v9;
      v21 = v18;
      *(_QWORD *)&v22 = *(_QWORD *)(v9 + 32);
      PXStoryTransitionInfoDescription((unsigned __int8 *)&v20);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "appendFormat:", CFSTR("\t%li: %@ %@ %@ id=%li\n"), v11, v13, v17, v19, *(_QWORD *)(v9 - 48));

      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
      v9 += 200;
      a3 += 3;
      --v7;
    }
    while (v7);
  }
}

void __44__PXStoryBaseTimeline_diagnosticDescription__block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  _OWORD v49[6];
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint64_t v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  _QWORD __dst[46];
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  uint64_t v89;

  if (a2 >= 1)
  {
    v88 = v5;
    v89 = v6;
    do
    {
      v10 = *a5;
      v9 = a5[1];
      v47 = a5[4];
      v48 = a2;
      v11 = *(_OWORD *)(a5 + 11);
      v12 = *(_OWORD *)(a5 + 15);
      v85 = *(_OWORD *)(a5 + 13);
      v86 = v12;
      v87 = *(_OWORD *)(a5 + 17);
      v13 = *(_OWORD *)(a5 + 7);
      v81 = *(_OWORD *)(a5 + 5);
      v82 = v13;
      v83 = *(_OWORD *)(a5 + 9);
      v84 = v11;
      v46 = a5[19];
      v14 = *((_OWORD *)a5 + 13);
      v74 = *((_OWORD *)a5 + 12);
      v75 = v14;
      v15 = *((_OWORD *)a5 + 11);
      v72 = *((_OWORD *)a5 + 10);
      v73 = v15;
      v16 = *((_OWORD *)a5 + 18);
      v17 = *((_OWORD *)a5 + 16);
      v79 = *((_OWORD *)a5 + 17);
      v80 = v16;
      v18 = *((_OWORD *)a5 + 15);
      v76 = *((_OWORD *)a5 + 14);
      v77 = v18;
      v78 = v17;
      memcpy(__dst, a5 + 38, sizeof(__dst));
      v19 = *((_OWORD *)a5 + 43);
      v68 = *((_OWORD *)a5 + 42);
      v69 = v19;
      v70 = a5[88];
      v20 = *(_OWORD *)(a5 + 91);
      v64 = *(_OWORD *)(a5 + 89);
      v65 = v20;
      v66 = *(_OWORD *)(a5 + 93);
      v67 = a5[95];
      objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", v10);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = *(void **)(a1 + 40);
      v23 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
      objc_msgSend(v21, "resource");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "px_storyResourceIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "appendFormat:", CFSTR("\t%li (id=%li): resourceID=%@\n"), v23, v10, v25);

      if (v9 == 1)
      {
        v26 = *(void **)(a1 + 40);
        v59 = v85;
        v60 = v86;
        v61 = v87;
        v55 = v81;
        v56 = v82;
        v57 = v83;
        v58 = v84;
        PXStoryDurationInfoDescription(&v55);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "appendFormat:", CFSTR("\t\tDuration=%@\n"), v27);

        v28 = *(void **)(a1 + 40);
        PXDisplayAssetPlaybackStyleDescription();
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "appendFormat:", CFSTR("\t\tPlayback Style=%@\n"), v29);

        v30 = *(void **)(a1 + 40);
        v61 = v78;
        v62 = v79;
        v63 = v80;
        v57 = v74;
        v58 = v75;
        v59 = v76;
        v60 = v77;
        v55 = v72;
        v56 = v73;
        PXStoryAssetContentInfoDescription((double *)&v55);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "appendFormat:", CFSTR("\t\tAsset Content: %@\n"), v31);

        v32 = *(void **)(a1 + 40);
        v51 = *(_OWORD *)&__dst[39];
        v52 = *(_OWORD *)&__dst[41];
        v53 = *(_OWORD *)&__dst[43];
        v54 = __dst[45];
        v49[3] = *(_OWORD *)&__dst[31];
        v49[4] = *(_OWORD *)&__dst[33];
        v49[5] = *(_OWORD *)&__dst[35];
        v50 = *(_OWORD *)&__dst[37];
        v33 = objc_alloc(MEMORY[0x1E0CB3940]);
        v59 = *(_OWORD *)&__dst[39];
        v60 = *(_OWORD *)&__dst[41];
        v61 = *(_OWORD *)&__dst[43];
        *(_QWORD *)&v62 = __dst[45];
        v55 = *(_OWORD *)&__dst[31];
        v56 = *(_OWORD *)&__dst[33];
        v57 = *(_OWORD *)&__dst[35];
        v58 = *(_OWORD *)&__dst[37];
        v34 = off_1E512A620[PXStoryClipKenBurnsAnimationInfoGetMovementType(&v55)];
        v55 = *(_OWORD *)&__dst[31];
        v56 = *(_OWORD *)&__dst[33];
        v57 = *(_OWORD *)&__dst[35];
        PXStoryRectDescription();
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v50;
        v56 = v51;
        v57 = v52;
        PXStoryRectDescription();
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = (void *)objc_msgSend(v33, "initWithFormat:", CFSTR("%@ %@ -> %@"), v34, v35, v36);

        objc_msgSend(v32, "appendFormat:", CFSTR("\t\tKen Burns: %@\n"), v37);
        v38 = *(void **)(a1 + 40);
        v55 = v68;
        v56 = v69;
        *(_QWORD *)&v57 = v70;
        PXStoryTransitionInfoDescription((unsigned __int8 *)&v55);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "appendFormat:", CFSTR("\t\tTransition: %@\n"), v39);

        v40 = *(void **)(a1 + 40);
        v55 = v64;
        v56 = v65;
        v57 = v66;
        *(_QWORD *)&v58 = v67;
        PXStoryClipAudioInfoDescription((uint64_t)&v55);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "appendFormat:", CFSTR("\t\tAudio: %@\n"), v41);

        if (v46 == 4)
        {
          v42 = *(void **)(a1 + 40);
          if (v21)
            objc_msgSend(v21, "videoTimeRange");
          else
            memset(v49, 0, 48);
          PXStoryTimeRangeDescription((uint64_t)v49);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "appendFormat:", CFSTR("\t\tVideo range: %@\n"), v43);

        }
        v44 = *(void **)(a1 + 40);
        PXStoryClipOptionsDescription(v47);
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "appendFormat:", CFSTR("\t\tOptions: %@\n"), v45);

      }
      a5 += 96;
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      a2 = v48 - 1;
    }
    while (v48 != 1);
  }
}

uint64_t __58__PXStoryBaseTimeline_segmentIdentifiersInTimeRange_rect___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t *a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGRect v25;

  if (a2 >= 1)
  {
    v19 = v7;
    v20 = v6;
    v21 = v5;
    v22 = v4;
    v23 = v8;
    v24 = v9;
    v11 = a2;
    v12 = result;
    do
    {
      v14 = *a4;
      a4 += 25;
      v13 = v14;
      objc_msgSend(*(id *)(v12 + 32), "frameForSegmentWithIdentifier:", v14, v19, v20, v21, v22, v23, v24);
      v25.origin.x = v15;
      v25.origin.y = v16;
      v25.size.width = v17;
      v25.size.height = v18;
      result = CGRectIntersectsRect(*(CGRect *)(v12 + 48), v25);
      if ((_DWORD)result)
        result = objc_msgSend(*(id *)(v12 + 40), "addIndex:", v13);
      --v11;
    }
    while (v11);
  }
  return result;
}

__n128 __69__PXStoryBaseTimeline__findSegmentMatchingIdentifier_timeRange_info___block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  _OWORD *v6;
  __int128 *v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __n128 result;

  if (a2 >= 1)
  {
    v5 = 0;
    while (*(_QWORD *)a4 != a1[6])
    {
      ++v5;
      a4 += 200;
      if (a2 == v5)
        return result;
    }
    v6 = *(_OWORD **)(a1[4] + 8);
    v7 = (__int128 *)(a3 + 48 * v5);
    v8 = *v7;
    v9 = v7[2];
    v6[3] = v7[1];
    v6[4] = v9;
    v6[2] = v8;
    v10 = *(_QWORD *)(a1[5] + 8);
    v11 = *(_OWORD *)(a4 + 64);
    v13 = *(_OWORD *)(a4 + 16);
    v12 = *(_OWORD *)(a4 + 32);
    *(_OWORD *)(v10 + 80) = *(_OWORD *)(a4 + 48);
    *(_OWORD *)(v10 + 96) = v11;
    *(_OWORD *)(v10 + 48) = v13;
    *(_OWORD *)(v10 + 64) = v12;
    v14 = *(_OWORD *)(a4 + 128);
    v16 = *(_OWORD *)(a4 + 80);
    v15 = *(_OWORD *)(a4 + 96);
    *(_OWORD *)(v10 + 144) = *(_OWORD *)(a4 + 112);
    *(_OWORD *)(v10 + 160) = v14;
    *(_OWORD *)(v10 + 112) = v16;
    *(_OWORD *)(v10 + 128) = v15;
    v18 = *(_OWORD *)(a4 + 160);
    v17 = *(_OWORD *)(a4 + 176);
    v19 = *(_OWORD *)(a4 + 144);
    *(_QWORD *)(v10 + 224) = *(_QWORD *)(a4 + 192);
    *(_OWORD *)(v10 + 192) = v18;
    *(_OWORD *)(v10 + 208) = v17;
    *(_OWORD *)(v10 + 176) = v19;
    result = *(__n128 *)a4;
    *(_OWORD *)(v10 + 32) = *(_OWORD *)a4;
    *a5 = 1;
  }
  return result;
}

uint64_t __58__PXStoryBaseTimeline_containsAllSegmentsWithIdentifiers___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsSegmentWithIdentifier:", a2);
  if ((result & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 0;
    *a3 = 1;
  }
  return result;
}

void __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v11;
  __int128 v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  _OWORD v21[3];
  _QWORD v22[4];
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  if (a2 >= 1)
  {
    v32 = v7;
    v33 = v6;
    v34 = v4;
    v35 = v5;
    v11 = 0;
    v12 = 0uLL;
    v13 = MEMORY[0x1E0C809B0];
    do
    {
      v30 = v12;
      v31 = v12;
      v29 = v12;
      v14 = *(void **)(a1 + 32);
      v15 = objc_msgSend(v14, "identifierForSegmentAtIndex:", v11);
      if (v14)
      {
        objc_msgSend(v14, "timeRangeForSegmentWithIdentifier:", v15);
      }
      else
      {
        v30 = 0u;
        v31 = 0u;
        v29 = 0u;
      }
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke_2;
      v22[3] = &unk_1E5125288;
      v16 = *(_QWORD *)(a1 + 88);
      v17 = *(void **)(a1 + 40);
      v23 = *(void **)(a1 + 32);
      v18 = v23;
      v26 = v16;
      v19 = v17;
      v20 = *(_QWORD *)(a1 + 48);
      v24 = v19;
      v25 = v20;
      v27 = a4;
      v28 = v11;
      v21[0] = v29;
      v21[1] = v30;
      v21[2] = v31;
      objc_msgSend(v18, "enumerateClipsInTimeRange:rect:usingBlock:", v21, v22, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

      ++v11;
      v12 = 0uLL;
    }
    while (a2 != v11);
  }
}

void __63__PXStoryBaseTimeline_identifierOfFirstSegmentContainingAsset___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v7;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  id v15;

  if (a2 >= 1)
  {
    v7 = a2;
    v9 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v9 == 1)
      {
        objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(v9 - 1));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "resource");
        v15 = (id)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v15, "px_storyResourceDisplayAsset");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "uuid");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqualToString:", v13);

        if (v14)
        {
          *a6 = 1;
          *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                  + 200 * *(_QWORD *)(a1 + 72));

          return;
        }

      }
      v9 += 96;
      --v7;
    }
    while (v7);
  }
}

_QWORD *__52__PXStoryBaseTimeline_indexOfSegmentWithIdentifier___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t *a4, _BYTE *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 >= 1)
  {
    while (1)
    {
      v5 = *a4;
      a4 += 25;
      v6 = *(_QWORD *)(result[5] + 8);
      v7 = *(_QWORD *)(v6 + 24);
      if (v5 == result[6])
        break;
      *(_QWORD *)(v6 + 24) = v7 + 1;
      if (!--a2)
        return result;
    }
    *(_QWORD *)(*(_QWORD *)(result[4] + 8) + 24) = v7;
    *a5 = 1;
  }
  return result;
}

_QWORD *__51__PXStoryBaseTimeline_identifierForSegmentAtIndex___block_invoke(_QWORD *result, uint64_t a2, uint64_t a3, uint64_t a4, _BYTE *a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (a2 >= 1)
  {
    v5 = 0;
    while (1)
    {
      v6 = *(_QWORD *)(result[4] + 8);
      v7 = *(_QWORD *)(v6 + 24);
      if (v7 == result[6])
        break;
      *(_QWORD *)(v6 + 24) = v7 + 1;
      if (a2 == ++v5)
        return result;
    }
    *(_QWORD *)(*(_QWORD *)(result[5] + 8) + 24) = *(_QWORD *)(a4 + 200 * v5);
    *a5 = 1;
  }
  return result;
}

void __64__PXStoryBaseTimeline_clipWithResourceKind_afterClipIdentifier___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  uint64_t v8;
  _QWORD *i;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  if (a2 >= 1)
  {
    v8 = 0;
    for (i = (_QWORD *)(a5 + 8); ; i += 96)
    {
      v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      if (*(_BYTE *)(v10 + 24))
      {
        if (*i == *(_QWORD *)(a1 + 56))
          break;
      }
      if (*(i - 1) == *(_QWORD *)(a1 + 64))
        *(_BYTE *)(v10 + 24) = 1;
      if (a2 == ++v8)
        return;
    }
    objc_msgSend(*(id *)(a1 + 32), "clipWithIdentifier:", *(_QWORD *)(a5 + 768 * v8));
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    *a6 = 1;
  }
}

uint64_t __53__PXStoryBaseTimeline_numberOfClipsWithResourceKind___block_invoke(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v5;

  if (a2 >= 1)
  {
    v5 = (_QWORD *)(a5 + 8);
    do
    {
      if (*v5 == *(_QWORD *)(result + 40))
        ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24);
      v5 += 96;
      --a2;
    }
    while (a2);
  }
  return result;
}

@end
