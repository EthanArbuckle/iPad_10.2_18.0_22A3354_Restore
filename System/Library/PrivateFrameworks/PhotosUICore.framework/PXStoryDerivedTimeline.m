@implementation PXStoryDerivedTimeline

- (PXStoryDerivedTimeline)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryDerivedTimeline.m"), 14, CFSTR("%s is not available as initializer"), "-[PXStoryDerivedTimeline init]");

  abort();
}

- (PXStoryDerivedTimeline)initWithOriginalTimeline:(id)a3
{
  id v5;
  PXStoryDerivedTimeline *v6;
  PXStoryDerivedTimeline *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PXStoryDerivedTimeline;
  v6 = -[PXStoryDerivedTimeline init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originalTimeline, a3);

  return v7;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRange
{
  void *v4;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v6;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v6 = v4;
    objc_msgSend(v4, "timeRange");
    v4 = v6;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (CGSize)size
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "size");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (CGSize)originalSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "originalSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
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
  _OWORD v14[3];

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a5;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = *(_OWORD *)&a3->var0.var3;
  v14[0] = *(_OWORD *)&a3->var0.var0;
  v14[1] = v13;
  v14[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v12, "enumerateClipsInTimeRange:rect:usingBlock:", v14, v11, x, y, width, height);

}

- (id)clipWithIdentifier:(int64_t)a3
{
  void *v4;
  void *v5;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clipWithIdentifier:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSegments
{
  void *v2;
  int64_t v3;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "numberOfSegments");

  return v3;
}

- (void)enumerateSegmentsInTimeRange:(id *)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  __int128 v8;
  _OWORD v9[3];

  v6 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_OWORD *)&a3->var0.var3;
  v9[0] = *(_OWORD *)&a3->var0.var0;
  v9[1] = v8;
  v9[2] = *(_OWORD *)&a3->var1.var1;
  objc_msgSend(v7, "enumerateSegmentsInTimeRange:usingBlock:", v9, v6);

}

- (CGRect)frameForSegmentWithIdentifier:(int64_t)a3
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frameForSegmentWithIdentifier:", a3);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (int64_t)indexOfSegmentWithIdentifier:(int64_t)a3
{
  void *v4;
  int64_t v5;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "indexOfSegmentWithIdentifier:", a3);

  return v5;
}

- ($DEC141BA10DB957F4DDC414EFF8F1C09)timeRangeForSegmentWithIdentifier:(SEL)a3
{
  void *v6;
  $DEC141BA10DB957F4DDC414EFF8F1C09 *result;
  void *v8;

  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v8 = v6;
    objc_msgSend(v6, "timeRangeForSegmentWithIdentifier:", a4);
    v6 = v8;
  }
  else
  {
    *(_OWORD *)&retstr->var0.var3 = 0u;
    *(_OWORD *)&retstr->var1.var1 = 0u;
    *(_OWORD *)&retstr->var0.var0 = 0u;
  }

  return result;
}

- (id)indexesOfResourcesWithKind:(int64_t)a3 inResourcesDataSource:(id)a4 forClipsInSegmentWithIdentifier:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;

  v8 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "indexesOfResourcesWithKind:inResourcesDataSource:forClipsInSegmentWithIdentifier:", a3, v8, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)indexOfResourceForClipWithIdentifier:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  int64_t v10;

  v8 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "indexOfResourceForClipWithIdentifier:inResourcesDataSource:resourceKind:", a3, v8, a5);

  return v10;
}

- (int64_t)identifierOfFirstClipContainingResourceAtIndex:(int64_t)a3 inResourcesDataSource:(id)a4 resourceKind:(int64_t)a5
{
  id v8;
  void *v9;
  int64_t v10;

  v8 = a4;
  -[PXStoryDerivedTimeline originalTimeline](self, "originalTimeline");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "identifierOfFirstClipContainingResourceAtIndex:inResourcesDataSource:resourceKind:", a3, v8, a5);

  return v10;
}

- (PXStoryTimeline)originalTimeline
{
  return self->_originalTimeline;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_originalTimeline, 0);
}

@end
