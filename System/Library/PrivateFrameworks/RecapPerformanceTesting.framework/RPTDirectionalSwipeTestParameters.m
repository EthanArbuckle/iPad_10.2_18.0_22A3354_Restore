@implementation RPTDirectionalSwipeTestParameters

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  RPTDirectionalSwipeTestParameters *v17;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a7;
  v16 = a3;
  v17 = -[RPTDirectionalSwipeTestParameters initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:](self, "initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:", v16, a5, 0, _RPTScrollDirectionFromUIScrollDirection(a6), v15, x, y, width, height);

  return v17;
}

void __50__RPTDirectionalSwipeTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  double MidX;
  double MidY;
  double v6;
  double v7;
  double v8;
  double v9;
  _BOOL8 v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  char v26;
  uint64_t v27;
  double v28;
  id v29;
  CGRect v30;
  CGRect v31;

  v29 = a2;
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setTouchCurveFunction:", v3);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v29, "setValue:forKey:", v3, CFSTR("pointerCurveFunction"));
  objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
  MidX = CGRectGetMidX(v30);
  objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
  MidY = CGRectGetMidY(v31);
  objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
  v7 = v6;
  v9 = v8;
  v10 = RPTAxisFromScrollDirection(objc_msgSend(*(id *)(a1 + 32), "direction"));
  v11 = RPTSizeAlongAxis(v10, v7, v9);
  objc_msgSend(*(id *)(a1 + 32), "swipeSpeedFactor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "doubleValue");
  v14 = v11 / 600.0 * v13;

  v15 = _RPTScrollDirectionFromUIScrollDirection(objc_msgSend(*(id *)(a1 + 32), "direction"));
  v16 = v11 * 0.5 + 1.0;
  v17 = RPTCGPointAdvanceInDirectionByAmount(v15, MidX, MidY, v16);
  v19 = v18;
  v20 = RPTOppositeDirectionFrom(v15);
  v21 = RPTCGPointAdvanceInDirectionByAmount(v20, MidX, MidY, v16);
  v23 = v22;
  if (objc_msgSend(*(id *)(a1 + 32), "swipeCount") < 1)
  {
    v26 = 0;
  }
  else
  {
    v24 = 0;
    do
    {
      if ((v24 & 1) != 0)
        v25 = 0.6666;
      else
        v25 = 1.25;
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:swipeDuration:", v29, v17, v19, v21, v23, v14 * v25);
      ++v24;
    }
    while (v24 < objc_msgSend(*(id *)(a1 + 32), "swipeCount"));
    v26 = v24 & 1;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "reverse") && objc_msgSend(*(id *)(a1 + 32), "swipeCount") >= 1)
  {
    v27 = 0;
    do
    {
      if ((v26 & 1) != 0)
        v28 = 0.6666;
      else
        v28 = 1.5;
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:swipeDuration:", v29, v21, v23, v17, v19, v14 * v28);
      v26 ^= 1u;
      ++v27;
    }
    while (v27 < objc_msgSend(*(id *)(a1 + 32), "swipeCount"));
  }

}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 testType:(unint64_t)a4 scrollView:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  double v14;
  double x;
  double v16;
  double y;
  double v18;
  double width;
  double v20;
  double height;
  uint64_t v22;
  _BOOL8 v23;
  double v24;
  uint64_t v25;
  uint64_t v26;
  _BOOL8 v27;
  double v28;
  double v29;
  uint64_t v30;
  _BOOL8 v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  RPTDirectionalSwipeTestParameters *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  CGRect v44;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = RPTDefaultScrollDirection(v11);
  v14 = RPTContentSizeInDirection(v11, v13);
  x = RPTGetBoundsForView(v11);
  y = v16;
  width = v18;
  height = v20;
  if (a4 == 2)
  {
    v22 = 1;
LABEL_8:
    v26 = _UIScrollDirectionFromRPTScrollDirection(v13);
    v27 = RPTAxisFromScrollDirection(v26);
    v28 = RPTSizeAlongAxis(v27, width, height);
    v25 = vcvtpd_s64_f64(v14 / v28);
    v29 = floor(v28 - v14 / (double)(uint64_t)ceil(v14 / v28));
    v30 = _UIScrollDirectionFromRPTScrollDirection(v13);
    v31 = RPTAxisFromScrollDirection(v30);
    if (v31)
    {
      if (!v31)
        goto LABEL_14;
      v32 = 0.0;
      v33 = x;
      v34 = y;
      v35 = width;
      v36 = height;
      v37 = v29;
    }
    else
    {
      v37 = 0.0;
      v33 = x;
      v34 = y;
      v35 = width;
      v36 = height;
      v32 = v29;
    }
    v44 = CGRectInset(*(CGRect *)&v33, v37, v32);
    x = v44.origin.x;
    y = v44.origin.y;
    width = v44.size.width;
    height = v44.size.height;
    goto LABEL_14;
  }
  v22 = 0;
  if (a4 == 1)
    goto LABEL_8;
  if (a4)
  {
    v25 = 1;
  }
  else
  {
    v23 = _RPTAxisFromScrollDirection(v13);
    v22 = 0;
    v24 = ceil(v14 / RPTSizeAlongAxis(v23, width, height));
    if (v24 < 1.0)
      v24 = 1.0;
    v25 = (uint64_t)v24;
  }
LABEL_14:
  v38 = -[RPTDirectionalSwipeTestParameters initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:](self, "initWithTestName:scrollingBounds:swipeCount:reverse:direction:completionHandler:", v10, v25, v22, v13, v12, x, y, width, height);
  objc_msgSend(v11, "window");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "window");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "screen");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[RPTCoordinateSpaceConverter converterFromWindow:toScreen:](RPTCoordinateSpaceConverter, "converterFromWindow:toScreen:", v39, v41);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTDirectionalSwipeTestParameters setConversion:](v38, "setConversion:", v42);

  return v38;
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  return -[RPTDirectionalSwipeTestParameters initWithTestName:testType:scrollView:completionHandler:](self, "initWithTestName:testType:scrollView:completionHandler:", a3, 0, a4, a5);
}

- (RPTDirectionalSwipeTestParameters)initWithTestName:(id)a3 scrollingBounds:(CGRect)a4 swipeCount:(int64_t)a5 reverse:(BOOL)a6 direction:(int64_t)a7 completionHandler:(id)a8
{
  _BOOL8 v10;
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  RPTDirectionalSwipeTestParameters *v19;
  RPTDirectionalSwipeTestParameters *v20;
  void *v21;
  objc_super v23;

  v10 = a6;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a3;
  v18 = a8;
  v23.receiver = self;
  v23.super_class = (Class)RPTDirectionalSwipeTestParameters;
  v19 = -[RPTDirectionalSwipeTestParameters init](&v23, sel_init);
  v20 = v19;
  if (v19)
  {
    -[RPTDirectionalSwipeTestParameters setTestName:](v19, "setTestName:", v17);
    -[RPTDirectionalSwipeTestParameters setScrollingBounds:](v20, "setScrollingBounds:", x, y, width, height);
    -[RPTDirectionalSwipeTestParameters setSwipeCount:](v20, "setSwipeCount:", a5);
    -[RPTDirectionalSwipeTestParameters setReverse:](v20, "setReverse:", v10);
    -[RPTDirectionalSwipeTestParameters setDirection:](v20, "setDirection:", _UIScrollDirectionFromRPTScrollDirection(a7));
    -[RPTDirectionalSwipeTestParameters setCompletionHandler:](v20, "setCompletionHandler:", v18);
    -[RPTDirectionalSwipeTestParameters setSwipeSpeedFactor:](v20, "setSwipeSpeedFactor:", &unk_1E6366AF8);
    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPTDirectionalSwipeTestParameters setConversion:](v20, "setConversion:", v21);

  }
  return v20;
}

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __50__RPTDirectionalSwipeTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 swipeDuration:(double)a6
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
  if (self->_shouldFlick
    && (objc_msgSend(v30, "interactionOptions"),
        v12 = (void *)objc_claimAutoreleasedReturnValue(),
        v13 = objc_msgSend(v12, "prefersPointer"),
        v12,
        (v13 & 1) == 0))
  {
    -[RPTDirectionalSwipeTestParameters conversion](self, "conversion");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "convertPoint:", v10, v9);
    v24 = v23;
    v26 = v25;
    -[RPTDirectionalSwipeTestParameters conversion](self, "conversion");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "convertPoint:", x, y);
    objc_msgSend(v30, "sendFlickWithStartPoint:endPoint:duration:", v24, v26, v28, v29, a6 * 0.7);

    objc_msgSend(v30, "advanceTime:", a6 * 0.3);
  }
  else
  {
    -[RPTDirectionalSwipeTestParameters conversion](self, "conversion");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "convertPoint:", v10, v9);
    v16 = v15;
    v18 = v17;
    -[RPTDirectionalSwipeTestParameters conversion](self, "conversion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertVector:", x - v10, y - v9);
    objc_msgSend(v30, "pointerOrFingerScrollAt:byDelta:duration:", v16, v18, v20, v21, a6);

  }
}

- (NSString)testName
{
  return self->_testName;
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

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (int64_t)swipeCount
{
  return self->_swipeCount;
}

- (void)setSwipeCount:(int64_t)a3
{
  self->_swipeCount = a3;
}

- (BOOL)reverse
{
  return self->_reverse;
}

- (void)setReverse:(BOOL)a3
{
  self->_reverse = a3;
}

- (NSNumber)swipeSpeedFactor
{
  return self->_swipeSpeedFactor;
}

- (void)setSwipeSpeedFactor:(id)a3
{
  objc_storeStrong((id *)&self->_swipeSpeedFactor, a3);
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_swipeSpeedFactor, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

@end
