@implementation RPTPagingScrollTestParameters

- (RPTPagingScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 amplitude:(double)a6 direction:(int64_t)a7 iterationDuration:(double)a8 useFlicks:(BOOL)a9 completionHandler:(id)a10
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v21;
  id v22;
  RPTPagingScrollTestParameters *v23;
  uint64_t v24;
  NSString *testName;
  uint64_t v26;
  id completionHandler;
  uint64_t v28;
  RPTCoordinateSpaceConverter *conversion;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  RPTCoordinateSpaceConverter *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  objc_super v39;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v21 = a3;
  v22 = a10;
  v39.receiver = self;
  v39.super_class = (Class)RPTPagingScrollTestParameters;
  v23 = -[RPTPagingScrollTestParameters init](&v39, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v21, "copy");
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_iterations = a4;
    v23->_scrollingBounds.origin.x = x;
    v23->_scrollingBounds.origin.y = y;
    v23->_scrollingBounds.size.width = width;
    v23->_scrollingBounds.size.height = height;
    v23->_amplitude = a6;
    v23->_useFlicks = a9;
    v23->_direction = a7;
    v23->_iterationDuration = a8;
    v26 = MEMORY[0x1B5E1F6E0](v22);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = (id)v26;

    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v28 = objc_claimAutoreleasedReturnValue();
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v28;

    objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "windows");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v32);
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v33;

    if (a7 == 6 || a7 == 5)
    {
      objc_msgSend(MEMORY[0x1E0CEA2F8], "sharedApplication");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "userInterfaceLayoutDirection");
      v37 = 1;
      if (v36)
        v37 = 2;
      v23->_realDirection = v37;

    }
    else
    {
      v23->_realDirection = a7;
    }

  }
  return v23;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __46__RPTPagingScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D1C0;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

void __46__RPTPagingScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t i;
  void *v12;
  double v13;
  id v14;

  v14 = a2;
  objc_msgSend(*(id *)(a1 + 32), "initialAndFinalPositions");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  for (i = 1; i <= objc_msgSend(*(id *)(a1 + 32), "iterations"); ++i)
  {
    v12 = *(void **)(a1 + 32);
    objc_msgSend(v12, "iterationDuration");
    objc_msgSend(v12, "scrollWithComposer:fromPoint:toPoint:duration:", v14, v4, v6, v8, v10, v13);
  }

}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  void *v12;
  char v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  id v30;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v30 = a3;
  if (-[RPTPagingScrollTestParameters useFlicks](self, "useFlicks")
    && (objc_msgSend(v30, "interactionOptions"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "prefersPointer"),
        v12,
        (v13 & 1) == 0))
  {
    -[RPTPagingScrollTestParameters conversion](self, "conversion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:", v10, v9);
    v24 = v23;
    v26 = v25;
    -[RPTPagingScrollTestParameters conversion](self, "conversion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertPoint:", x, y);
    objc_msgSend(v30, "sendFlickWithStartPoint:endPoint:duration:", v24, v26, v28, v29, 0.5);

    objc_msgSend(v30, "advanceTime:", a6 + -0.5);
  }
  else
  {
    -[RPTPagingScrollTestParameters conversion](self, "conversion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:", v10, v9);
    v16 = v15;
    v18 = v17;
    -[RPTPagingScrollTestParameters conversion](self, "conversion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertVector:", x - v10, y - v9);
    objc_msgSend(v30, "pointerOrFingerScrollAt:byDelta:duration:", v16, v18, v20, v21, a6);

    objc_msgSend(v30, "advanceTime:", 0.2);
  }

}

- (pair<CGPoint,)initialAndFinalPositions
{
  CGFloat v3;
  CGFloat v4;
  CGFloat v5;
  CGFloat v6;
  double Midpoint;
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
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  pair<CGPoint, CGPoint> result;

  -[RPTPagingScrollTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  switch(-[RPTPagingScrollTestParameters realDirection](self, "realDirection"))
  {
    case 2:
      -[RPTPagingScrollTestParameters scrollingBounds](self, "scrollingBounds");
      Midpoint = CGRectGetMinX(v19) + 1.5;
      -[RPTPagingScrollTestParameters amplitude](self, "amplitude");
      v11 = Midpoint + v12;
      goto LABEL_4;
    case 3:
      -[RPTPagingScrollTestParameters scrollingBounds](self, "scrollingBounds");
      v9 = CGRectGetMaxY(v20) + -1.5;
      -[RPTPagingScrollTestParameters amplitude](self, "amplitude");
      v13 = v9 - v14;
      goto LABEL_7;
    case 4:
      -[RPTPagingScrollTestParameters scrollingBounds](self, "scrollingBounds");
      v9 = CGRectGetMinY(v21) + 1.5;
      -[RPTPagingScrollTestParameters amplitude](self, "amplitude");
      v13 = v9 + v15;
LABEL_7:
      v11 = Midpoint;
      break;
    default:
      -[RPTPagingScrollTestParameters scrollingBounds](self, "scrollingBounds");
      Midpoint = CGRectGetMaxX(v18) + -1.5;
      -[RPTPagingScrollTestParameters amplitude](self, "amplitude");
      v11 = Midpoint - v10;
LABEL_4:
      v13 = v9;
      break;
  }
  v16 = Midpoint;
  v17 = v9;
  result.var1.y = v13;
  result.var1.x = v11;
  result.var0.y = v17;
  result.var0.x = v16;
  return result;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (CGRect)scrollingBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_scrollingBounds.origin.x;
  y = self->_scrollingBounds.origin.y;
  width = self->_scrollingBounds.size.width;
  height = self->_scrollingBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (double)amplitude
{
  return self->_amplitude;
}

- (void)setAmplitude:(double)a3
{
  self->_amplitude = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

- (BOOL)useFlicks
{
  return self->_useFlicks;
}

- (void)setUseFlicks:(BOOL)a3
{
  self->_useFlicks = a3;
}

- (int64_t)realDirection
{
  return self->_realDirection;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
}

@end
