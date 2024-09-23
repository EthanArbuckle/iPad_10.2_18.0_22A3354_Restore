@implementation _PXStoryConcreteCompanionTimelineSegment

- (_PXStoryConcreteCompanionTimelineSegment)initWithTimeline:(id)a3 segmentIndex:(int64_t)a4
{
  id v7;
  _PXStoryConcreteCompanionTimelineSegment *v8;
  _PXStoryConcreteCompanionTimelineSegment *v9;
  uint64_t v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  int64_t v24;
  objc_super v25;

  v7 = a3;
  v25.receiver = self;
  v25.super_class = (Class)_PXStoryConcreteCompanionTimelineSegment;
  v8 = -[_PXStoryConcreteCompanionTimelineSegment init](&v25, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_timeline, a3);
    v10 = objc_msgSend(v7, "identifierForSegmentAtIndex:", a4);
    if (v7)
    {
      objc_msgSend(v7, "infoForSegmentWithIdentifier:", v10);
    }
    else
    {
      v24 = 0;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      v18 = 0u;
      v19 = 0u;
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v12 = 0u;
      v13 = 0u;
    }
    *(_OWORD *)&v9->_segmentInfo.durationInfo.maximumDuration.epoch = v22;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.preferredCue.time.timescale = v23;
    v9->_segmentInfo.durationInfo.preferredCue.rank = v24;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.minimumDuration.value = v18;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.minimumDuration.epoch = v19;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.preferredDuration.timescale = v20;
    *(_OWORD *)&v9->_segmentInfo.durationInfo.maximumDuration.value = v21;
    *(_OWORD *)&v9->_segmentInfo.compositionInfo.mainDividerSplitRatio = v14;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.orderOutTransition = v15;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.duration.timescale = v16;
    *(_OWORD *)&v9->_segmentInfo.transitionInfo.fallbackFromTransitionKind = v17;
    *(_OWORD *)&v9->_segmentInfo.identifier = v12;
    *(_OWORD *)&v9->_segmentInfo.compositionInfo.clipFramesExtendToBounds = v13;
  }

  return v9;
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)preferredDuration
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE *result;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  result = -[_PXStoryConcreteCompanionTimelineSegment segmentInfo](self, "segmentInfo");
  *retstr = v5;
  return result;
}

- (NSArray)assets
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  id v13;
  id v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[4];
  id v21;
  id v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;

  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 3);
  -[_PXStoryConcreteCompanionTimelineSegment timeline](self, "timeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0u;
  v26 = 0u;
  v24 = 0u;
  -[_PXStoryConcreteCompanionTimelineSegment segmentInfo](self, "segmentInfo");
  if (v4)
  {
    objc_msgSend(v4, "timeRangeForSegmentWithIdentifier:", v23);
  }
  else
  {
    v25 = 0u;
    v26 = 0u;
    v24 = 0u;
  }
  objc_msgSend(v4, "size");
  PXRectWithOriginAndSize();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __50___PXStoryConcreteCompanionTimelineSegment_assets__block_invoke;
  v20[3] = &unk_1E512D058;
  v21 = v4;
  v22 = v3;
  v17 = v24;
  v18 = v25;
  v19 = v26;
  v13 = v3;
  v14 = v4;
  objc_msgSend(v14, "enumerateClipsInTimeRange:rect:usingBlock:", &v17, v20, v6, v8, v10, v12);
  v15 = (void *)objc_msgSend(v13, "copy", v17, v18, v19);

  return (NSArray *)v15;
}

- (PXStoryCompanionTimelineSegmentTransition)orderOutTransition
{
  _PXStoryConcreteCompanionTimelineSegmentTransition *v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  _OWORD v8[2];
  uint64_t v9;

  v3 = [_PXStoryConcreteCompanionTimelineSegmentTransition alloc];
  -[_PXStoryConcreteCompanionTimelineSegment segmentInfo](self, "segmentInfo");
  v8[0] = v5;
  v8[1] = v6;
  v9 = v7;
  return (PXStoryCompanionTimelineSegmentTransition *)-[_PXStoryConcreteCompanionTimelineSegmentTransition initWithTransitionInfo:](v3, "initWithTransitionInfo:", v8);
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- ($09F85D15C0ED9C1985B34302C6989F26)segmentInfo
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;

  v3 = *(_OWORD *)&self->var3.var3.var1;
  *(_OWORD *)&retstr->var3.var2.var3 = *(_OWORD *)&self->var3.var3.var0.var1;
  *(_OWORD *)&retstr->var3.var3.var0.var1 = v3;
  retstr->var3.var3.var1 = self[1].var0;
  v4 = *(_OWORD *)&self->var3.var1.var1;
  *(_OWORD *)&retstr->var3.var0.var0 = *(_OWORD *)&self->var3.var0.var3;
  *(_OWORD *)&retstr->var3.var0.var3 = v4;
  v5 = *(_OWORD *)&self->var3.var2.var3;
  *(_OWORD *)&retstr->var3.var1.var1 = *(_OWORD *)&self->var3.var2.var0;
  *(_OWORD *)&retstr->var3.var2.var0 = v5;
  v6 = *(_OWORD *)&self->var2.var2.var1;
  *(_OWORD *)&retstr->var1.var3 = *(_OWORD *)&self->var2.var0;
  *(_OWORD *)&retstr->var2.var0 = v6;
  v7 = *(_OWORD *)&self->var3.var0.var0;
  *(_OWORD *)&retstr->var2.var2.var1 = *(_OWORD *)&self->var2.var3;
  *(_OWORD *)&retstr->var2.var3 = v7;
  v8 = *(_OWORD *)&self->var1.var3;
  *(_OWORD *)&retstr->var0 = *(_OWORD *)&self->var1.var1;
  *(_OWORD *)&retstr->var1.var1 = v8;
  return self;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
