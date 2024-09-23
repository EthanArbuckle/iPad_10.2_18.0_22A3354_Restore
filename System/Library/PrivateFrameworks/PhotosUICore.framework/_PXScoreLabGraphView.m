@implementation _PXScoreLabGraphView

- (_PXScoreLabGraphView)initWithFrame:(CGRect)a3
{
  _PXScoreLabGraphView *v3;
  _PXScoreLabGraphView *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *serialQueue;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)_PXScoreLabGraphView;
  v3 = -[_PXScoreLabGraphView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    v3->_leftMargin = 20.0;
    v3->_rightMargin = 20.0;
    v3->_topMargin = 20.0;
    v3->_bottomMargin = 20.0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AA0]), "initWithTarget:action:", v3, sel_panned_);
    -[_PXScoreLabGraphView addGestureRecognizer:](v4, "addGestureRecognizer:", v5);
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3AE8]), "initWithTarget:action:", v4, sel_pinched_);
    -[_PXScoreLabGraphView addGestureRecognizer:](v4, "addGestureRecognizer:", v6);
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v7 = objc_claimAutoreleasedReturnValue();
    dispatch_queue_attr_make_with_qos_class(v7, QOS_CLASS_USER_INITIATED, 0);
    v8 = objc_claimAutoreleasedReturnValue();

    v9 = dispatch_queue_create("com.apple.scoreLabGraphViewReloadQueue", v8);
    serialQueue = v4->_serialQueue;
    v4->_serialQueue = (OS_dispatch_queue *)v9;

  }
  return v4;
}

- (void)startGestureAtLocation:(CGPoint)a3
{
  self->_locationAtBeginningOfGesture = a3;
  self->_minXValueAtBeginningOfGesture = self->_minXValue;
  self->_maxXValueAtBeginningOfGesture = self->_maxXValue;
  self->_minYValueAtBeginningOfGesture = self->_minYValue;
  self->_maxYValueAtBeginningOfGesture = self->_maxYValue;
}

- (void)cancelGesture
{
  self->_minXValue = self->_minXValueAtBeginningOfGesture;
  self->_maxXValue = self->_maxXValueAtBeginningOfGesture;
  self->_minYValue = self->_minYValueAtBeginningOfGesture;
  self->_maxYValue = self->_maxYValueAtBeginningOfGesture;
}

- (void)updateGestureWithLocation:(CGPoint)a3 scale:(double)a4
{
  double minXValueAtBeginningOfGesture;
  double v5;
  double leftMargin;
  double graphWidth;
  double v8;
  double minYValueAtBeginningOfGesture;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double baseMinXValue;
  double v18;
  double v19;
  double baseMaxXValue;
  double v21;
  double baseMinYValue;
  double v23;
  double baseMaxYValue;

  minXValueAtBeginningOfGesture = self->_minXValueAtBeginningOfGesture;
  v5 = self->_maxXValueAtBeginningOfGesture - minXValueAtBeginningOfGesture;
  leftMargin = self->_leftMargin;
  graphWidth = self->_graphWidth;
  v8 = minXValueAtBeginningOfGesture + v5 * (self->_locationAtBeginningOfGesture.x - leftMargin) / graphWidth;
  minYValueAtBeginningOfGesture = self->_minYValueAtBeginningOfGesture;
  v10 = self->_maxYValueAtBeginningOfGesture - minYValueAtBeginningOfGesture;
  v11 = 1.0 - (self->_locationAtBeginningOfGesture.y - self->_topMargin) / self->_graphHeight;
  v12 = v5 / a4;
  v13 = self->_baseMaxXValue - self->_baseMinXValue;
  v14 = v5 / v13;
  if (v12 > v13)
  {
    v15 = self->_baseMaxXValue - self->_baseMinXValue;
  }
  else
  {
    v14 = a4;
    v15 = v12;
  }
  v16 = v8 - (a3.x - leftMargin) * v15 / graphWidth;
  self->_minXValue = v16;
  baseMinXValue = self->_baseMinXValue;
  if (v16 < baseMinXValue)
  {
    self->_minXValue = baseMinXValue;
    v16 = baseMinXValue;
  }
  v18 = minYValueAtBeginningOfGesture + v10 * v11;
  v19 = v10 / v14;
  self->_maxXValue = v15 + v16;
  baseMaxXValue = self->_baseMaxXValue;
  if (v15 + v16 > baseMaxXValue)
  {
    self->_maxXValue = baseMaxXValue;
    self->_minXValue = baseMaxXValue - v15;
  }
  v21 = v18 - v19 * (1.0 - (a3.y - self->_topMargin) / self->_graphHeight);
  self->_minYValue = v21;
  baseMinYValue = self->_baseMinYValue;
  if (v21 < baseMinYValue)
  {
    self->_minYValue = baseMinYValue;
    v21 = baseMinYValue;
  }
  v23 = v19 + v21;
  self->_maxYValue = v19 + v21;
  baseMaxYValue = self->_baseMaxYValue;
  if (v23 > baseMaxYValue)
  {
    self->_maxYValue = baseMaxYValue;
    self->_minYValue = baseMaxYValue - v19;
  }
  -[_PXScoreLabGraphView setNeedsDisplay](self, "setNeedsDisplay");
}

- (void)panned:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_msgSend(v7, "state");
  if (v4 == 4)
  {
    -[_PXScoreLabGraphView cancelGesture](self, "cancelGesture");
  }
  else if (v4 == 2)
  {
    objc_msgSend(v7, "locationInView:", self);
    -[_PXScoreLabGraphView updateGestureWithLocation:scale:](self, "updateGestureWithLocation:scale:");
  }
  else
  {
    v5 = v4 == 1;
    v6 = v7;
    if (!v5)
      goto LABEL_9;
    objc_msgSend(v7, "locationInView:", self);
    -[_PXScoreLabGraphView startGestureAtLocation:](self, "startGestureAtLocation:");
  }
  v6 = v7;
LABEL_9:

}

- (void)pinched:(id)a3
{
  uint64_t v4;
  BOOL v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  v12 = a3;
  v4 = objc_msgSend(v12, "state");
  if (v4 == 4)
  {
    -[_PXScoreLabGraphView cancelGesture](self, "cancelGesture");
  }
  else if (v4 == 2)
  {
    objc_msgSend(v12, "locationInView:", self);
    v8 = v7;
    v10 = v9;
    objc_msgSend(v12, "scale");
    -[_PXScoreLabGraphView updateGestureWithLocation:scale:](self, "updateGestureWithLocation:scale:", v8, v10, v11);
  }
  else
  {
    v5 = v4 == 1;
    v6 = v12;
    if (!v5)
      goto LABEL_9;
    objc_msgSend(v12, "locationInView:", self);
    -[_PXScoreLabGraphView startGestureAtLocation:](self, "startGestureAtLocation:");
  }
  v6 = v12;
LABEL_9:

}

- (void)enumerateAssetsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  double Current;
  id WeakRetained;
  void *v26;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _QWORD v33[5];

  v33[3] = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "setChunkSizeForFetch:", 1000);
  v7 = *MEMORY[0x1E0CD19F0];
  v33[0] = *MEMORY[0x1E0CD1938];
  v33[1] = v7;
  v33[2] = *MEMORY[0x1E0CD1A50];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setFetchPropertySets:", v8);

  -[_PXScoreLabGraphView assetPredicate](self, "assetPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v9);

  v26 = v6;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v10;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = 0;
    v16 = *(_QWORD *)v29;
    v17 = (double)v11;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(obj);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i);
        v22 = (void *)MEMORY[0x1A85CE17C]();
        v4[2](v4, v21);
        v23 = v14 + i + 1;
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v18 > 1.0
          || (double)(unint64_t)v23 / v17 - v19 >= 1.0
          || (unint64_t)(v23 - v15) >= 0x64)
        {
          WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          objc_msgSend(WeakRetained, "scoreLabGraphView:reloadProgressed:", self, (double)(unint64_t)v23 / v17);

          v18 = Current;
          v19 = (double)(unint64_t)v23 / v17;
          v15 = v14 + i + 1;
        }
        objc_autoreleasePoolPop(v22);
      }
      v14 += i;
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v13);
  }

}

- (void)reloadData
{
  NSObject *serialQueue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  serialQueue = self->_serialQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __34___PXScoreLabGraphView_reloadData__block_invoke;
  v4[3] = &unk_1E5148D30;
  objc_copyWeak(&v5, &location);
  dispatch_async(serialQueue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)loadDistributionData
{
  int *v3;
  void *v4;
  id v5;
  id v6;
  NSArray *v7;
  NSArray *allXValues;
  NSArray *v9;
  double v10;
  double minXValue;
  _QWORD v12[5];
  NSArray *v13;
  id v14;

  self->_minXValue = 1.79769313e308;
  self->_maxXValue = -1.79769313e308;
  self->_Ex = 0.0;
  self->_Ex2 = 0.0;
  if (self->_graphType)
    v3 = &OBJC_IVAR____PXScoreLabGraphView__yScoreValueGetter;
  else
    v3 = &OBJC_IVAR____PXScoreLabGraphView__xScoreValueGetter;
  v4 = _Block_copy(*(const void **)((char *)&self->super.super.super.isa + *v3));
  self->_numberOfIgnoredAssets = 0;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __44___PXScoreLabGraphView_loadDistributionData__block_invoke;
  v12[3] = &unk_1E512E6B0;
  v6 = v4;
  v14 = v6;
  v12[4] = self;
  v7 = (NSArray *)v5;
  v13 = v7;
  -[_PXScoreLabGraphView enumerateAssetsUsingBlock:](self, "enumerateAssetsUsingBlock:", v12);
  allXValues = self->_allXValues;
  self->_allXValues = v7;
  v9 = v7;

  self->_minXValue = floor(self->_minXValue * 4.0) * 0.25;
  v10 = ceil(self->_maxXValue * 4.0) * 0.25;
  self->_maxXValue = v10;
  minXValue = self->_minXValue;
  if (minXValue == v10)
  {
    self->_minXValue = minXValue + -0.1;
    self->_maxXValue = self->_maxXValue + 0.1;
    minXValue = self->_minXValue;
  }
  self->_baseMinXValue = minXValue;
  self->_baseMaxXValue = self->_maxXValue;
  self->_Ex = self->_Ex / (double)-[NSArray count](v9, "count");
  self->_Ex2 = self->_Ex2 / (double)-[NSArray count](v9, "count");

}

- (void)loadCorrelationData
{
  id v3;
  id v4;
  id v5;
  NSArray *v6;
  NSArray *allYValues;
  NSArray *v8;
  double v9;
  double minXValue;
  double v11;
  double minYValue;
  uint64_t v13;
  _QWORD v14[5];
  id v15;
  NSArray *v16;

  self->_minXValue = 1.79769313e308;
  self->_maxXValue = -1.79769313e308;
  self->_minYValue = 1.79769313e308;
  self->_maxYValue = -1.79769313e308;
  self->_Ex = 0.0;
  self->_Ex2 = 0.0;
  self->_Ey = 0.0;
  self->_Ey2 = 0.0;
  self->_Exy = 0.0;
  self->_numberOfIgnoredAssets = 0;
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __43___PXScoreLabGraphView_loadCorrelationData__block_invoke;
  v14[3] = &unk_1E512E6D8;
  v14[4] = self;
  v5 = v3;
  v15 = v5;
  v6 = (NSArray *)v4;
  v16 = v6;
  -[_PXScoreLabGraphView enumerateAssetsUsingBlock:](self, "enumerateAssetsUsingBlock:", v14);
  objc_storeStrong((id *)&self->_allXValues, v3);
  allYValues = self->_allYValues;
  self->_allYValues = v6;
  v8 = v6;

  self->_minXValue = floor(self->_minXValue * 4.0) * 0.25;
  v9 = ceil(self->_maxXValue * 4.0) * 0.25;
  self->_maxXValue = v9;
  minXValue = self->_minXValue;
  if (minXValue == v9)
  {
    self->_minXValue = minXValue + -0.1;
    self->_maxXValue = self->_maxXValue + 0.1;
  }
  self->_minYValue = floor(self->_minYValue * 4.0) * 0.25;
  v11 = ceil(self->_maxYValue * 4.0) * 0.25;
  self->_maxYValue = v11;
  minYValue = self->_minYValue;
  if (minYValue == v11)
  {
    self->_minYValue = minYValue + -0.1;
    self->_maxYValue = self->_maxYValue + 0.1;
  }
  self->_baseMinXValue = self->_minXValue;
  self->_baseMaxXValue = self->_maxXValue;
  self->_baseMinYValue = self->_minYValue;
  self->_baseMaxYValue = self->_maxYValue;
  self->_Ex = self->_Ex / (double)(unint64_t)objc_msgSend(v5, "count", 608);
  self->_Ex2 = self->_Ex2 / (double)(unint64_t)objc_msgSend(v5, "count");
  *(double *)((char *)&self->super.super.super.isa + v13) = *(double *)((char *)&self->super.super.super.isa + v13)
                                                          / (double)(unint64_t)objc_msgSend(v5, "count");
  self->_Ey2 = self->_Ey2 / (double)(unint64_t)objc_msgSend(v5, "count");
  self->_Exy = self->_Exy / (double)(unint64_t)objc_msgSend(v5, "count");

}

- (void)drawRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  CGContext *CurrentContext;
  double v9;
  double v10;
  unint64_t graphType;
  _OWORD v12[2];
  uint64_t v13;
  CGRect v14;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v13 = *MEMORY[0x1E0C80C00];
  CurrentContext = UIGraphicsGetCurrentContext();
  v12[0] = xmmword_1A7C09CD0;
  v12[1] = unk_1A7C09CE0;
  CGContextSetFillColor(CurrentContext, (const CGFloat *)v12);
  v14.origin.x = x;
  v14.origin.y = y;
  v14.size.width = width;
  v14.size.height = height;
  CGContextFillRect(CurrentContext, v14);
  -[_PXScoreLabGraphView bounds](self, "bounds");
  self->_graphWidth = v9 - self->_leftMargin - self->_rightMargin;
  -[_PXScoreLabGraphView bounds](self, "bounds");
  self->_graphHeight = v10 - self->_topMargin - self->_bottomMargin;
  graphType = self->_graphType;
  if (graphType >= 2)
  {
    if (graphType == 2)
      -[_PXScoreLabGraphView drawCorrelationInContext:](self, "drawCorrelationInContext:", CurrentContext);
  }
  else
  {
    -[_PXScoreLabGraphView drawDistributionInContext:](self, "drawDistributionInContext:", CurrentContext);
  }
}

- (void)drawAxisInContext:(CGContext *)a3 minXValue:(double)a4 maxXValue:(double)a5 minYValue:(double)a6 maxYValue:(double)a7
{
  void *v12;
  void *v13;
  CGFloat v14;
  CGFloat v15;
  id v16;
  void *v17;
  const __CFAttributedString *v18;
  const __CTLine *v19;
  double leftMargin;
  CGFloat v21;
  id v22;
  void *v23;
  const __CFAttributedString *v24;
  const __CTLine *v25;
  CGAffineTransform v27;
  uint64_t v28;
  void *v29;
  CGFloat components[2];
  __int128 v31;
  uint64_t v32;
  CGRect ImageBounds;
  CGRect v34;

  v32 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)components = xmmword_1A7C09CF0;
  v31 = unk_1A7C09D00;
  CGContextSetStrokeColor(a3, components);
  CGContextSetLineWidth(a3, 1.0);
  CGContextSetTextDrawingMode(a3, kCGTextStroke);
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGContextSetTextMatrix(a3, &v27);
  v28 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 5.0, *MEMORY[0x1E0DC1460]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (a4 < a5)
  {
    do
    {
      CGContextBeginPath(a3);
      v14 = self->_leftMargin + self->_graphWidth * (a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
      v15 = self->_topMargin + self->_graphHeight;
      CGContextMoveToPoint(a3, v14, v15);
      CGContextAddLineToPoint(a3, v14, v15 + 4.0);
      CGContextClosePath(a3);
      CGContextDrawPath(a3, kCGPathStroke);
      v16 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = (const __CFAttributedString *)objc_msgSend(v16, "initWithString:attributes:", v17, v13);
      v19 = CTLineCreateWithAttributedString(v18);

      ImageBounds = CTLineGetImageBounds(v19, a3);
      CGContextSetTextPosition(a3, v14 + ImageBounds.size.width * -0.5, v15 + ImageBounds.size.height + 6.0);
      CTLineDraw(v19, a3);
      CFRelease(v19);
      a4 = a4 + 0.25;
    }
    while (a4 <= a5);
  }
  if (a6 < a7)
  {
    do
    {
      CGContextBeginPath(a3);
      leftMargin = self->_leftMargin;
      v21 = self->_topMargin
          + self->_graphHeight * (1.0 - (a6 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
      CGContextMoveToPoint(a3, leftMargin + -4.0, v21);
      CGContextAddLineToPoint(a3, leftMargin, v21);
      CGContextClosePath(a3);
      CGContextDrawPath(a3, kCGPathStroke);
      v22 = objc_alloc(MEMORY[0x1E0CB3498]);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a6);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = (const __CFAttributedString *)objc_msgSend(v22, "initWithString:attributes:", v23, v13);
      v25 = CTLineCreateWithAttributedString(v24);

      v34 = CTLineGetImageBounds(v25, a3);
      CGContextSetTextPosition(a3, leftMargin + -6.0 - v34.size.width, v21 + v34.size.height * 0.5);
      CTLineDraw(v25, a3);
      CFRelease(v25);
      a6 = a6 + 0.25;
    }
    while (a6 <= a7);
  }

}

- (void)drawXMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5
{
  id v9;
  const CGFloat *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFAttributedString *v19;
  const __CTLine *v20;
  id v21;
  void *v22;
  const __CFAttributedString *v23;
  const __CTLine *v24;
  CGAffineTransform v25;
  uint64_t v26;
  void *v27;
  CGFloat components[2];
  __int128 v29;
  uint64_t v30;
  CGRect ImageBounds;
  CGRect v32;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.6, 1.0, 1.0, 1.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = CGColorGetComponents((CGColorRef)objc_msgSend(v9, "CGColor"));
  CGContextSetStrokeColor(a5, v10);
  CGContextBeginPath(a5);
  v11 = self->_leftMargin + self->_graphWidth * (a3 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  v12 = self->_topMargin + -6.0;
  CGContextMoveToPoint(a5, v11, v12 + -6.0);
  CGContextAddLineToPoint(a5, v11, v12 + 6.0);
  v13 = self->_leftMargin + self->_graphWidth * (a3 - a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  CGContextMoveToPoint(a5, v13, v12 + -3.0);
  CGContextAddLineToPoint(a5, v13, v12 + 3.0);
  v14 = self->_leftMargin + self->_graphWidth * (a3 + a4 - self->_minXValue) / (self->_maxXValue - self->_minXValue);
  CGContextMoveToPoint(a5, v14, v12 + -3.0);
  CGContextAddLineToPoint(a5, v14, v12 + 3.0);
  CGContextMoveToPoint(a5, v13, v12);
  CGContextAddLineToPoint(a5, v14, v12);
  CGContextClosePath(a5);
  CGContextDrawPath(a5, kCGPathStroke);
  *(_OWORD *)components = xmmword_1A7C09CF0;
  v29 = unk_1A7C09D00;
  CGContextSetStrokeColor(a5, components);
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetTextDrawingMode(a5, kCGTextStroke);
  CGAffineTransformMakeScale(&v25, 1.0, -1.0);
  CGContextSetTextMatrix(a5, &v25);
  v26 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 8.0, *MEMORY[0x1E0DC1460]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v27, &v26, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (const __CFAttributedString *)objc_msgSend(v17, "initWithString:attributes:", v18, v16);
  v20 = CTLineCreateWithAttributedString(v19);

  ImageBounds = CTLineGetImageBounds(v20, a5);
  CGContextSetTextPosition(a5, v11 + ImageBounds.size.width * -0.5, v12 + ImageBounds.size.height + 6.0);
  CTLineDraw(v20, a5);
  CFRelease(v20);
  v21 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (const __CFAttributedString *)objc_msgSend(v21, "initWithString:attributes:", v22, v16);
  v24 = CTLineCreateWithAttributedString(v23);

  v32 = CTLineGetImageBounds(v24, a5);
  CGContextSetTextPosition(a5, v14, v12 + v32.size.height + 6.0);
  CTLineDraw(v24, a5);
  CFRelease(v24);

}

- (void)drawYMean:(double)a3 andStddev:(double)a4 inContext:(CGContext *)a5
{
  id v9;
  const CGFloat *v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  const __CFAttributedString *v19;
  const __CTLine *v20;
  id v21;
  void *v22;
  const __CFAttributedString *v23;
  const __CTLine *v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  uint64_t v29;
  void *v30;
  CGFloat components[2];
  __int128 v32;
  uint64_t v33;
  CGRect ImageBounds;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.6, 1.0, 1.0, 1.0);
  v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v10 = CGColorGetComponents((CGColorRef)objc_msgSend(v9, "CGColor"));
  CGContextSetStrokeColor(a5, v10);
  CGContextBeginPath(a5);
  v11 = self->_leftMargin + self->_graphWidth + 6.0;
  v12 = self->_topMargin + self->_graphHeight * (1.0 - (a3 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + -6.0, v12);
  CGContextAddLineToPoint(a5, v11 + 6.0, v12);
  v13 = self->_topMargin
      + self->_graphHeight * (1.0 - (a3 - a4 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + 3.0, v13);
  CGContextAddLineToPoint(a5, v11 + -3.0, v13);
  v14 = self->_topMargin
      + self->_graphHeight * (1.0 - (a3 + a4 - self->_minYValue) / (self->_maxYValue - self->_minYValue));
  CGContextMoveToPoint(a5, v11 + 3.0, v14);
  CGContextAddLineToPoint(a5, v11 + -3.0, v14);
  CGContextMoveToPoint(a5, v11, v13);
  CGContextAddLineToPoint(a5, v11, v14);
  CGContextClosePath(a5);
  CGContextDrawPath(a5, kCGPathStroke);
  *(_OWORD *)components = xmmword_1A7C09CF0;
  v32 = unk_1A7C09D00;
  CGContextSetStrokeColor(a5, components);
  CGContextSetLineWidth(a5, 1.0);
  CGContextSetTextDrawingMode(a5, kCGTextStroke);
  CGAffineTransformMakeScale(&v28, 1.0, -1.0);
  CGContextSetTextMatrix(a5, &v28);
  memset(&v27, 0, sizeof(v27));
  CGContextGetCTM(&v27, a5);
  v25 = v27;
  CGAffineTransformRotate(&v26, &v25, 1.57079633);
  CGContextSetCTM();
  v29 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 8.0, *MEMORY[0x1E0DC1460]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (const __CFAttributedString *)objc_msgSend(v17, "initWithString:attributes:", v18, v16);
  v20 = CTLineCreateWithAttributedString(v19);

  ImageBounds = CTLineGetImageBounds(v20, a5);
  CGContextSetTextPosition(a5, v12 + ImageBounds.size.width * -0.5, -(v11 - ImageBounds.size.height + -6.0));
  CTLineDraw(v20, a5);
  CFRelease(v20);
  v21 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%.2f"), *(_QWORD *)&a4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (const __CFAttributedString *)objc_msgSend(v21, "initWithString:attributes:", v22, v16);
  v24 = CTLineCreateWithAttributedString(v23);

  v35 = CTLineGetImageBounds(v24, a5);
  CGContextSetTextPosition(a5, v35.size.width * -0.5 + (v12 + v13) * 0.5, -(v11 - v35.size.height + -6.0));
  CTLineDraw(v24, a5);
  CFRelease(v24);
  v25 = v27;
  CGContextSetCTM();

}

- (void)drawTextPanelWithNumberOfAssets:(int64_t)a3 numberOfIgnoredAssets:(unint64_t)a4 rho:(double)a5 inContext:(CGContext *)a6
{
  double v11;
  double v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  const __CFAttributedString *v17;
  const __CTLine *v18;
  id v19;
  void *v20;
  const __CFAttributedString *v21;
  const __CTLine *v22;
  id v23;
  void *v24;
  const __CFAttributedString *v25;
  const __CTLine *v26;
  CGAffineTransform v27;
  uint64_t v28;
  void *v29;
  CGFloat components[2];
  __int128 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)components = xmmword_1A7C09CF0;
  v31 = unk_1A7C09D00;
  CGContextSetStrokeColor(a6, components);
  CGContextSetLineWidth(a6, 1.0);
  CGContextSetTextDrawingMode(a6, kCGTextStroke);
  CGAffineTransformMakeScale(&v27, 1.0, -1.0);
  CGContextSetTextMatrix(a6, &v27);
  v11 = self->_leftMargin + 20.0;
  v12 = self->_topMargin + 20.0;
  v28 = *MEMORY[0x1E0DC1138];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", 12.0, *MEMORY[0x1E0DC1450]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if ((a3 & 0x8000000000000000) == 0)
  {
    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("N=%lu"), a3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = (const __CFAttributedString *)objc_msgSend(v15, "initWithString:attributes:", v16, v14);
    v18 = CTLineCreateWithAttributedString(v17);

    CGContextSetTextPosition(a6, v11, v12);
    CTLineDraw(v18, a6);
    CFRelease(v18);
    v12 = v12 + 12.0;
  }
  v19 = objc_alloc(MEMORY[0x1E0CB3498]);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Ñ=%lu"), a4);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (const __CFAttributedString *)objc_msgSend(v19, "initWithString:attributes:", v20, v14);
  v22 = CTLineCreateWithAttributedString(v21);

  CGContextSetTextPosition(a6, v11, v12);
  CTLineDraw(v22, a6);
  CFRelease(v22);
  if (a5 > -1.79769313e308)
  {
    v23 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("R²=%.3f"), a5 * a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (const __CFAttributedString *)objc_msgSend(v23, "initWithString:attributes:", v24, v14);
    v26 = CTLineCreateWithAttributedString(v25);

    CGContextSetTextPosition(a6, v11, v12 + 12.0);
    CTLineDraw(v26, a6);
    CFRelease(v26);
  }

}

- (void)drawDistributionInContext:(CGContext *)a3
{
  size_t v5;
  double *v6;
  NSArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t i;
  double v13;
  double minXValue;
  double maxXValue;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  double *v20;
  double v21;
  unint64_t j;
  CGFloat v23;
  id v24;
  const CGFloat *Components;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = vcvtmd_u64_f64(self->_graphWidth);
  v6 = (double *)malloc_type_calloc(v5, 8uLL, 0x100004000313F17uLL);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v7 = self->_allXValues;
  v8 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v27;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v27 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * i), "doubleValue");
        minXValue = self->_minXValue;
        if (v13 >= minXValue)
        {
          maxXValue = self->_maxXValue;
          if (v13 <= maxXValue)
          {
            v16 = (v13 - minXValue) / (maxXValue - minXValue) * (double)(v5 - 1);
            v17 = v16 - floor(v16);
            v18 = (unint64_t)v16;
            v19 = 1.0 - v17 + v6[(unint64_t)v16];
            v6[v18] = v19;
            if (v19 > v11)
              v11 = v19;
            if (v17 > 0.0)
            {
              v20 = &v6[v18];
              v21 = v17 + v20[1];
              v20[1] = v21;
              if (v21 > v11)
                v11 = v21;
            }
          }
        }
      }
      v9 = -[NSArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v9);
  }
  else
  {
    v11 = 0.0;
  }

  self->_minYValue = 0.0;
  self->_maxYValue = v11;
  -[_PXScoreLabGraphView drawAxisInContext:minXValue:maxXValue:minYValue:maxYValue:](self, "drawAxisInContext:minXValue:maxXValue:minYValue:maxYValue:", a3, self->_minXValue, self->_maxXValue, 0.0, 0.0);
  if (v5)
  {
    for (j = 0; j != v5; ++j)
    {
      CGContextBeginPath(a3);
      v23 = self->_leftMargin + (double)j;
      CGContextMoveToPoint(a3, v23, self->_topMargin + self->_graphHeight);
      CGContextAddLineToPoint(a3, v23, self->_topMargin+ self->_graphHeight * (1.0 - (v6[j] - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
      CGContextClosePath(a3);
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (1.0 - v6[j] / v11) * 0.5, 1.0, (v6[j] / v11 + 1.0) * 0.5, 1.0);
      v24 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      Components = CGColorGetComponents((CGColorRef)objc_msgSend(v24, "CGColor"));
      CGContextSetStrokeColor(a3, Components);
      CGContextDrawPath(a3, kCGPathStroke);

    }
  }
  free(v6);
  -[_PXScoreLabGraphView drawXMean:andStddev:inContext:](self, "drawXMean:andStddev:inContext:", a3, self->_Ex, sqrt(self->_Ex2 - self->_Ex * self->_Ex));
  -[_PXScoreLabGraphView drawTextPanelWithNumberOfAssets:numberOfIgnoredAssets:rho:inContext:](self, "drawTextPanelWithNumberOfAssets:numberOfIgnoredAssets:rho:inContext:", -[NSArray count](self->_allXValues, "count"), self->_numberOfIgnoredAssets, a3, -1.79769313e308);
}

- (void)drawCorrelationInContext:(CGContext *)a3
{
  unint64_t v4;
  unint64_t v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  uint64_t i;
  double v16;
  double minXValue;
  double v18;
  double maxXValue;
  void *v20;
  double v21;
  double minYValue;
  double maxYValue;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  unint64_t v30;
  double v31;
  unint64_t v32;
  double v33;
  double v34;
  unint64_t v35;
  double v36;
  unint64_t v37;
  double v38;
  CGColorSpace *DeviceRGB;
  unint64_t v40;
  CGContext *v41;
  _DWORD *Data;
  size_t BytesPerRow;
  uint64_t v44;
  uint64_t v45;
  double *v46;
  double *v47;
  size_t j;
  double v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGImage *Image;
  const CGFloat *Components;
  double Ex;
  double Ey;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  CGContext *context;
  size_t v70;
  size_t v71;
  _DWORD *v72;
  double *v73;
  id v74;
  uint64_t v75;
  double v76;
  double v77;
  double v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _BYTE v83[128];
  uint64_t v84;
  CGRect v85;

  v84 = *MEMORY[0x1E0C80C00];
  v4 = vcvtmd_u64_f64(self->_graphWidth);
  v5 = vcvtmd_u64_f64(self->_graphHeight);
  v73 = (double *)malloc_type_calloc(v5 * v4, 8uLL, 0x100004000313F17uLL);
  v79 = 0u;
  v80 = 0u;
  v81 = 0u;
  v82 = 0u;
  v6 = self->_allXValues;
  v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
  v70 = v4;
  v71 = v5;
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = (double)(v4 - 1);
    v11 = (double)(v5 - 1);
    v12 = *(_QWORD *)v80;
    v13 = (double)v4;
    v14 = 0.0;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v80 != v12)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v79 + 1) + 8 * i), "doubleValue");
        minXValue = self->_minXValue;
        if (v16 >= minXValue)
        {
          v18 = v16;
          maxXValue = self->_maxXValue;
          if (v16 <= maxXValue)
          {
            -[NSArray objectAtIndexedSubscript:](self->_allYValues, "objectAtIndexedSubscript:", v9 + i);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "doubleValue");
            minYValue = self->_minYValue;
            if (v21 >= minYValue)
            {
              maxYValue = self->_maxYValue;
              if (v21 <= maxYValue)
              {
                v24 = (v18 - minXValue) / (maxXValue - minXValue) * v10;
                v25 = floor(v24);
                v26 = v24 - v25;
                v27 = (v21 - minYValue) / (maxYValue - minYValue) * v11;
                v28 = floor(v27);
                v29 = v27 - v28;
                v30 = (unint64_t)(v25 + v28 * v13);
                v31 = v73[v30] + (1.0 - v26) * (1.0 - v29);
                v73[v30] = v31;
                if (v31 > v14)
                  v14 = v31;
                if (v26 > 0.0)
                {
                  v32 = (unint64_t)(v25 + 1.0 + v28 * v13);
                  v33 = v73[v32] + v26 * (1.0 - v29);
                  v73[v32] = v33;
                  if (v33 > v14)
                    v14 = v33;
                }
                if (v29 > 0.0)
                {
                  v34 = v28 + 1.0;
                  v35 = (unint64_t)(v25 + v34 * v13);
                  v36 = v73[v35] + (1.0 - v26) * v29;
                  v73[v35] = v36;
                  if (v36 > v14)
                    v14 = v36;
                  if (v26 > 0.0)
                  {
                    v37 = (unint64_t)(v25 + 1.0 + v34 * v13);
                    v38 = v73[v37] + v26 * v29;
                    v73[v37] = v38;
                    if (v38 > v14)
                      v14 = v38;
                  }
                }
              }
            }

          }
        }
      }
      v9 += i;
      v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v79, v83, 16);
    }
    while (v8);
  }
  else
  {
    v14 = 0.0;
  }

  -[_PXScoreLabGraphView drawAxisInContext:minXValue:maxXValue:minYValue:maxYValue:](self, "drawAxisInContext:minXValue:maxXValue:minYValue:maxYValue:", a3, self->_minXValue, self->_maxXValue, self->_minYValue, self->_maxYValue);
  DeviceRGB = CGColorSpaceCreateDeviceRGB();
  v40 = v70;
  v41 = CGBitmapContextCreate(0, v70, v71, 8uLL, 0, DeviceRGB, 1u);
  CGColorSpaceRelease(DeviceRGB);
  Data = CGBitmapContextGetData(v41);
  context = v41;
  BytesPerRow = CGBitmapContextGetBytesPerRow(v41);
  if (v70)
  {
    v44 = 0;
    v45 = 4 * (BytesPerRow >> 2);
    v46 = v73;
    do
    {
      v47 = v46;
      v72 = Data;
      for (j = v71; j; --j)
      {
        v49 = *v47 / v14;
        v77 = 0.0;
        v78 = 0.0;
        *(double *)&v75 = 1.0;
        v76 = 0.0;
        if (v49 <= 0.0)
        {
          v52 = 1.0;
          v53 = 0.0;
          v51 = 0.0;
          v54 = 0.0;
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", (1.0 - v49) * 0.5, 1.0, (v49 + 1.0) * 0.5, 1.0);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "getRed:green:blue:alpha:", &v78, &v76, &v77, &v75);

          v52 = *(double *)&v75;
          v51 = v76;
          v54 = v77;
          v53 = v78;
        }
        *Data = ((v54 * 255.0) << 16) | ((v52 * 255.0) << 24) | ((v51 * 255.0) << 8) | (v53 * 255.0);
        Data = (_DWORD *)((char *)Data + v45);
        v47 += v70;
      }
      ++v44;
      Data = v72 + 1;
      ++v46;
      v40 = v70;
    }
    while (v44 != v70);
  }
  Image = CGBitmapContextCreateImage(context);
  v85.origin.x = self->_leftMargin;
  v85.origin.y = self->_topMargin;
  v85.size.width = (double)v40;
  v85.size.height = (double)v71;
  CGContextDrawImage(a3, v85, Image);
  CGImageRelease(Image);
  CGContextRelease(context);
  free(v73);
  -[_PXScoreLabGraphView drawXMean:andStddev:inContext:](self, "drawXMean:andStddev:inContext:", a3, self->_Ex, sqrt(self->_Ex2 - self->_Ex * self->_Ex));
  -[_PXScoreLabGraphView drawYMean:andStddev:inContext:](self, "drawYMean:andStddev:inContext:", a3, self->_Ey, sqrt(self->_Ey2 - self->_Ey * self->_Ey));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", 0.6, 1.0, 1.0, 1.0);
  v74 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  Components = CGColorGetComponents((CGColorRef)objc_msgSend(v74, "CGColor"));
  CGContextSetStrokeColor(a3, Components);
  Ex = self->_Ex;
  Ey = self->_Ey;
  v59 = sqrt(self->_Ex2 - Ex * Ex);
  v60 = sqrt(self->_Ey2 - Ey * Ey);
  v61 = (self->_Exy - Ex * Ey) / (v59 * v60);
  -[_PXScoreLabGraphView drawTextPanelWithNumberOfAssets:numberOfIgnoredAssets:rho:inContext:](self, "drawTextPanelWithNumberOfAssets:numberOfIgnoredAssets:rho:inContext:", -[NSArray count](self->_allXValues, "count"), self->_numberOfIgnoredAssets, a3, v61);
  CGContextBeginPath(a3);
  v62 = v60 * v61 / v59;
  v63 = self->_minXValue;
  CGContextMoveToPoint(a3, self->_leftMargin + (v63 - v63) * self->_graphWidth / (self->_maxXValue - v63), self->_topMargin+ self->_graphHeight* (1.0 - (self->_Ey + v62 * (v63 - self->_Ex) - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
  v64 = self->_maxXValue;
  CGContextAddLineToPoint(a3, self->_leftMargin + self->_graphWidth * (v64 - self->_minXValue) / (v64 - self->_minXValue), self->_topMargin+ self->_graphHeight* (1.0 - (self->_Ey + v62 * (v64 - self->_Ex) - self->_minYValue) / (self->_maxYValue - self->_minYValue)));
  CGContextClosePath(a3);
  CGContextDrawPath(a3, kCGPathStroke);
  CGContextBeginPath(a3);
  v65 = v59 * v61 / v60;
  v66 = self->_minYValue;
  CGContextMoveToPoint(a3, self->_leftMargin+ self->_graphWidth * (self->_Ex + v65 * (v66 - self->_Ey) - self->_minXValue) / (self->_maxXValue - self->_minXValue), self->_topMargin + self->_graphHeight * (1.0 - (v66 - v66) / (self->_maxYValue - v66)));
  v67 = self->_maxYValue;
  CGContextAddLineToPoint(a3, self->_leftMargin+ self->_graphWidth * (self->_Ex + v65 * (v67 - self->_Ey) - self->_minXValue) / (self->_maxXValue - self->_minXValue), self->_topMargin + self->_graphHeight * (1.0 - (v67 - self->_minYValue) / (v67 - self->_minYValue)));
  CGContextClosePath(a3);
  CGContextDrawPath(a3, kCGPathStroke);

}

- (id)xScoreValueGetter
{
  return objc_getProperty(self, a2, 648, 1);
}

- (void)setXScoreValueGetter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 648);
}

- (id)yScoreValueGetter
{
  return objc_getProperty(self, a2, 656, 1);
}

- (void)setYScoreValueGetter:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 656);
}

- (unint64_t)graphType
{
  return self->_graphType;
}

- (void)setGraphType:(unint64_t)a3
{
  self->_graphType = a3;
}

- (NSPredicate)assetPredicate
{
  return (NSPredicate *)objc_getProperty(self, a2, 672, 1);
}

- (void)setAssetPredicate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 672);
}

- (_PXScoreLabGraphViewDelegate)delegate
{
  return (_PXScoreLabGraphViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_assetPredicate, 0);
  objc_storeStrong(&self->_yScoreValueGetter, 0);
  objc_storeStrong(&self->_xScoreValueGetter, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
  objc_storeStrong((id *)&self->_allYValues, 0);
  objc_storeStrong((id *)&self->_allXValues, 0);
}

@end
