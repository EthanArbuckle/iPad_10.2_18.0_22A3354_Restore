@implementation PXStoryTimelineLayoutSnapshot

- (PXStoryTimelineLayoutSnapshot)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryTimelineLayoutSnapshot.m"), 14, CFSTR("%s is not available as initializer"), "-[PXStoryTimelineLayoutSnapshot init]");

  abort();
}

- (PXStoryTimelineLayoutSnapshot)initWithTimeline:(id)a3 timelineRect:(CGRect)a4 timeRange:(id *)a5 clipCornerRadius:(id)a6
{
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  float v11;
  float v12;
  float v13;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  PXStoryTimelineLayoutSnapshot *v22;
  PXStoryTimelineLayoutSnapshot *v23;
  __int128 v24;
  __int128 v25;
  objc_super v27;

  v10 = v9;
  v11 = v8;
  v12 = v7;
  v13 = v6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v21 = a3;
  v27.receiver = self;
  v27.super_class = (Class)PXStoryTimelineLayoutSnapshot;
  v22 = -[PXStoryTimelineLayoutSnapshot init](&v27, sel_init);
  v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_timeline, a3);
    v23->_timelineRect.origin.x = x;
    v23->_timelineRect.origin.y = y;
    v23->_timelineRect.size.width = width;
    v23->_timelineRect.size.height = height;
    v24 = *(_OWORD *)&a5->var0.var0;
    v25 = *(_OWORD *)&a5->var1.var1;
    *(_OWORD *)&v23->_timeRange.start.epoch = *(_OWORD *)&a5->var0.var3;
    *(_OWORD *)&v23->_timeRange.duration.timescale = v25;
    *(_OWORD *)&v23->_timeRange.start.value = v24;
    v23->_clipCornerRadius.var0.var0.topLeft = v13;
    v23->_clipCornerRadius.var0.var0.topRight = v12;
    v23->_clipCornerRadius.var0.var0.bottomLeft = v11;
    v23->_clipCornerRadius.var0.var0.bottomRight = v10;
  }

  return v23;
}

- (PXStoryTimeline)timeline
{
  return self->_timeline;
}

- (CGRect)timelineRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_timelineRect.origin.x;
  y = self->_timelineRect.origin.y;
  width = self->_timelineRect.size.width;
  height = self->_timelineRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  __int128 v3;

  v3 = *(_OWORD *)&self[1].var1.var1;
  *(_OWORD *)&retstr->var0.var0 = *(_OWORD *)&self[1].var0.var3;
  *(_OWORD *)&retstr->var0.var3 = v3;
  *(_OWORD *)&retstr->var1.var1 = *(_OWORD *)&self[2].var0.var0;
  return self;
}

- ($6FCFBD36564ECBB6D9D1614A84D6F83D)clipCornerRadius
{
  $6FCFBD36564ECBB6D9D1614A84D6F83D result;

  *(_QWORD *)&result.var0.var1[2] = a2;
  *(_QWORD *)&result.var0.var0.var0 = self;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timeline, 0);
}

@end
