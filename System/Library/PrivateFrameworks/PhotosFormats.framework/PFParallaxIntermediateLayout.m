@implementation PFParallaxIntermediateLayout

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9 cropScore:(double)a10 layoutScore:(double)a11 timeBottomOverlap:(double)a12 timeTopOverlap:(double)a13 unsafeAreaOverlap:(double)a14 uninflatedUnsafeAreaOverlap:(double)a15 hasTopEdgeContact:(BOOL)a16
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  PFParallaxIntermediateLayout *result;
  CGFloat height;
  objc_super v31;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v25 = a3.size.height;
  v26 = a3.size.width;
  v27 = a3.origin.y;
  v28 = a3.origin.x;
  v31.receiver = self;
  v31.super_class = (Class)PFParallaxIntermediateLayout;
  result = -[PFParallaxIntermediateLayout init](&v31, sel_init);
  result->_visibleRect.origin.x = v28;
  result->_visibleRect.origin.y = v27;
  result->_visibleRect.size.width = v26;
  result->_visibleRect.size.height = v25;
  result->_inactiveRect.origin.x = x;
  result->_inactiveRect.origin.y = y;
  result->_inactiveRect.size.width = width;
  result->_inactiveRect.size.height = height;
  result->_zoomStrategy = a5;
  result->_overlapStrategy = a6;
  result->_parallaxStrategy = a7;
  result->_inactiveStrategy = a8;
  result->_headroomStrategy = a9;
  *(_OWORD *)&result->_cropScore = *(_OWORD *)&a10;
  *(_OWORD *)&result->_timeBottomOverlap = *(_OWORD *)&a12;
  result->_unsafeAreaOverlap = a14;
  result->_uninflatedUnsafeAreaOverlap = a15;
  result->_hasTopEdgeContact = a16;
  return result;
}

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3 inactiveRect:(CGRect)a4 zoomStrategy:(unint64_t)a5 overlapStrategy:(unint64_t)a6 parallaxStrategy:(unint64_t)a7 inactiveStrategy:(unint64_t)a8 headroomStrategy:(unint64_t)a9
{
  return -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:](self, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:cropScore:layoutScore:timeBottomOverlap:timeTopOverlap:unsafeAreaOverlap:uninflatedUnsafeAreaOverlap:hasTopEdgeContact:", a5, a6, a7, a8, a9, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a4.origin.x, a4.origin.y, a4.size.width, a4.size.height, 0, 0,
           0,
           0,
           0,
           0);
}

- (PFParallaxIntermediateLayout)initWithVisibleRect:(CGRect)a3
{
  return -[PFParallaxIntermediateLayout initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:](self, "initWithVisibleRect:inactiveRect:zoomStrategy:overlapStrategy:parallaxStrategy:inactiveStrategy:headroomStrategy:", 0, 0, 0, 0, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (BOOL)clockOverlapAcceptableForLayoutConfiguration:(id)a3
{
  double v3;

  -[PFParallaxIntermediateLayout clockOverlapAcceptabilityForLayoutConfiguration:inflated:](self, "clockOverlapAcceptabilityForLayoutConfiguration:inflated:", a3, 1);
  return v3 > 0.5;
}

- (double)clockOverlapAcceptabilityForLayoutConfiguration:(id)a3 inflated:(BOOL)a4
{
  _BOOL4 v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;
  double result;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;

  v4 = a4;
  objc_msgSend(a3, "timeOverlapCheckTop");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[PFParallaxIntermediateLayout visibleRect](self, "visibleRect");
  +[PFParallaxLayoutUtilities timeOverlapCheckThresholdForTopRect:isInteractive:](PFParallaxLayoutUtilities, "timeOverlapCheckThresholdForTopRect:isInteractive:", 0, v14 + v7 * v15, v16 + v9 * v17, v11 * v15, v13 * v17);
  v19 = v18;
  if (v4)
    -[PFParallaxIntermediateLayout unsafeAreaOverlap](self, "unsafeAreaOverlap");
  else
    -[PFParallaxIntermediateLayout uninflatedUnsafeAreaOverlap](self, "uninflatedUnsafeAreaOverlap");
  v21 = v20;
  v22 = -[PFParallaxIntermediateLayout overlapStrategy](self, "overlapStrategy");
  result = 0.0;
  switch(v22)
  {
    case 0uLL:
      return result;
    case 1uLL:
    case 3uLL:
    case 4uLL:
      goto LABEL_5;
    case 2uLL:
      -[PFParallaxIntermediateLayout timeBottomOverlap](self, "timeBottomOverlap", 0.0);
      if (v24 <= 0.0)
        goto LABEL_5;
      -[PFParallaxIntermediateLayout timeBottomOverlap](self, "timeBottomOverlap");
      v26 = v25;
      +[PFParallaxLayoutTextOverlapParameters systemParameters](PFParallaxLayoutTextOverlapParameters, "systemParameters");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "maxBottomOverlap");
      if (v26 >= v28)
      {

      }
      else
      {
        -[PFParallaxIntermediateLayout timeTopOverlap](self, "timeTopOverlap");
        v30 = v29;

        result = 1.0;
        if (v30 < v19)
          return result;
      }
LABEL_5:
      result = 0.75;
      if (v21 >= 0.01)
        return fmax(((v21 + -0.01) / -0.99 + 1.0) * 0.5, 0.0);
      return result;
    default:
      return fmax(((v21 + -0.01) / -0.99 + 1.0) * 0.5, 0.0);
  }
}

- (NSString)debugStub
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  operator||(-[PFParallaxIntermediateLayout zoomStrategy](self, "zoomStrategy"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OverlapStrategyDescription(-[PFParallaxIntermediateLayout overlapStrategy](self, "overlapStrategy"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ParallaxStrategyDescription(-[PFParallaxIntermediateLayout parallaxStrategy](self, "parallaxStrategy"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  InactiveStrategyDescription(-[PFParallaxIntermediateLayout inactiveStrategy](self, "inactiveStrategy"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@%@%@"), v3, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)debugDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v30;
  objc_super v31;

  operator||(-[PFParallaxIntermediateLayout zoomStrategy](self, "zoomStrategy"), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OverlapStrategyDescription(-[PFParallaxIntermediateLayout overlapStrategy](self, "overlapStrategy"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  ParallaxStrategyDescription(-[PFParallaxIntermediateLayout parallaxStrategy](self, "parallaxStrategy"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  InactiveStrategyDescription(-[PFParallaxIntermediateLayout inactiveStrategy](self, "inactiveStrategy"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxIntermediateLayout debugStub](self, "debugStub");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  v31.receiver = self;
  v31.super_class = (Class)PFParallaxIntermediateLayout;
  -[PFParallaxIntermediateLayout debugDescription](&v31, sel_debugDescription);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PFParallaxIntermediateLayout visibleRect](self, "visibleRect");
  v30 = v10;
  -[PFParallaxIntermediateLayout visibleRect](self, "visibleRect");
  v12 = v11;
  -[PFParallaxIntermediateLayout visibleRect](self, "visibleRect");
  v14 = v13;
  -[PFParallaxIntermediateLayout visibleRect](self, "visibleRect");
  v16 = v15;
  -[PFParallaxIntermediateLayout cropScore](self, "cropScore");
  v18 = v17;
  -[PFParallaxIntermediateLayout layoutScore](self, "layoutScore");
  v20 = v19;
  -[PFParallaxIntermediateLayout timeBottomOverlap](self, "timeBottomOverlap");
  v22 = v21;
  -[PFParallaxIntermediateLayout timeTopOverlap](self, "timeTopOverlap");
  v24 = v23;
  -[PFParallaxIntermediateLayout unsafeAreaOverlap](self, "unsafeAreaOverlap");
  v26 = v25;
  -[PFParallaxIntermediateLayout uninflatedUnsafeAreaOverlap](self, "uninflatedUnsafeAreaOverlap");
  objc_msgSend(v8, "stringWithFormat:", CFSTR("%@ vis:%.0f,%.0f %.0fx%.0f stub:%@ z:%@ o:%@ p:%@ i:%@ scores, crop:%.2f layout:%.2f bot:%.2f top:%.2f unsafe:%.2f uninfunsafe:%.2f"), v9, v30, v12, v14, v16, v7, v3, v4, v5, v6, v18, v20, v22, v24, v26, v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  return v28;
}

- (CGRect)visibleRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_visibleRect.origin.x;
  y = self->_visibleRect.origin.y;
  width = self->_visibleRect.size.width;
  height = self->_visibleRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (CGRect)inactiveRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_inactiveRect.origin.x;
  y = self->_inactiveRect.origin.y;
  width = self->_inactiveRect.size.width;
  height = self->_inactiveRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (unint64_t)zoomStrategy
{
  return self->_zoomStrategy;
}

- (unint64_t)overlapStrategy
{
  return self->_overlapStrategy;
}

- (unint64_t)parallaxStrategy
{
  return self->_parallaxStrategy;
}

- (unint64_t)inactiveStrategy
{
  return self->_inactiveStrategy;
}

- (unint64_t)headroomStrategy
{
  return self->_headroomStrategy;
}

- (double)cropScore
{
  return self->_cropScore;
}

- (double)layoutScore
{
  return self->_layoutScore;
}

- (double)timeBottomOverlap
{
  return self->_timeBottomOverlap;
}

- (double)timeTopOverlap
{
  return self->_timeTopOverlap;
}

- (double)unsafeAreaOverlap
{
  return self->_unsafeAreaOverlap;
}

- (double)uninflatedUnsafeAreaOverlap
{
  return self->_uninflatedUnsafeAreaOverlap;
}

- (BOOL)hasTopEdgeContact
{
  return self->_hasTopEdgeContact;
}

@end
