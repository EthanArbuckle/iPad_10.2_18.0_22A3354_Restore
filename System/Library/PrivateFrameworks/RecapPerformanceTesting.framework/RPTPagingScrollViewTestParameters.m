@implementation RPTPagingScrollViewTestParameters

- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  id v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  const __CFString *v20;
  _BOOL8 v21;
  NSObject *v22;
  RPTPagingScrollViewTestParameters *v23;
  uint64_t v24;
  NSString *testName;
  uint64_t v26;
  id completionHandler;
  uint64_t v28;
  RPTCoordinateSpaceConverter *conversion;
  uint64_t v30;
  CAMediaTimingFunction *curveFunction;
  objc_super v33;
  uint8_t buf[4];
  id v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  double v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  const __CFString *v43;
  uint64_t v44;
  CGRect v45;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v44 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  RPTLogTestRunning();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v45.origin.x = x;
    v45.origin.y = y;
    v45.size.width = width;
    v45.size.height = height;
    _RPTStringFromCGRect(v45);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    *(_DWORD *)buf = 138544386;
    v20 = CFSTR("YES");
    v35 = v15;
    v36 = 2114;
    if (!v16)
      v20 = CFSTR("NULL");
    v37 = v18;
    v38 = 2048;
    v39 = a5;
    v40 = 2050;
    v41 = a6;
    v42 = 2114;
    v43 = v20;
    _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTPagingScrollViewTestParameters initWithTestName: %{public}@ scrollBounds: %{public}@ scrollContentLength: %f direction: %{public}ld completionHandler: %{public}@]", buf, 0x34u);

  }
  v21 = _RPTAxisFromScrollDirection(a6);
  if (RPTSizeAlongAxis(v21, width, height) * 1.5 > a5)
  {
    RPTLogTestRunning();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:].cold.1(v22, x, y, width, height, a5);

  }
  v33.receiver = self;
  v33.super_class = (Class)RPTPagingScrollViewTestParameters;
  v23 = -[RPTPagingScrollViewTestParameters init](&v33, sel_init);
  if (v23)
  {
    v24 = objc_msgSend(v15, "copy");
    testName = v23->_testName;
    v23->_testName = (NSString *)v24;

    v23->_scrollingBounds.origin.x = x;
    v23->_scrollingBounds.origin.y = y;
    v23->_scrollingBounds.size.width = width;
    v23->_scrollingBounds.size.height = height;
    v23->_scrollingContentLength = a5;
    v23->_direction = _UIScrollDirectionFromRPTScrollDirection(a6);
    v26 = MEMORY[0x1B5E1F6E0](v16);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = (id)v26;

    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v28 = objc_claimAutoreleasedReturnValue();
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v28;

    objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
    v30 = objc_claimAutoreleasedReturnValue();
    curveFunction = v23->_curveFunction;
    v23->_curveFunction = (CAMediaTimingFunction *)v30;

    v23->_iterationDurationFactor = 1.0;
  }

  return v23;
}

- (RPTPagingScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  RPTPagingScrollViewTestParameters *v14;
  void *v15;
  void *v16;
  int v18;
  id v19;
  __int16 v20;
  id v21;
  __int16 v22;
  const __CFString *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  RPTLogTestRunning();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("YES");
    v18 = 138543874;
    v19 = v8;
    v20 = 2114;
    if (!v10)
      v12 = CFSTR("NULL");
    v21 = v9;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1B1773000, v11, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTPagingScrollViewTestParameters initWithTestName: %{public}@ scrollView: %{public}@ completionHandler: %{public}@]", (uint8_t *)&v18, 0x20u);
  }

  v13 = RPTDefaultScrollDirection(v9);
  RPTContentSizeInDirection(v9, v13);
  v14 = -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](self, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v8, v13, v10, RPTGetBoundsForView(v9));
  if (v14)
  {
    objc_msgSend(v9, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPTPagingScrollViewTestParameters setConversion:](v14, "setConversion:", v16);

  }
  return v14;
}

- (id)composerBlock
{
  NSObject *v3;
  _QWORD v5[5];
  uint8_t buf[16];

  RPTLogTestRunning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1773000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters composerBlock", buf, 2u);
  }

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __50__RPTPagingScrollViewTestParameters_composerBlock__block_invoke;
  v5[3] = &unk_1E635D210;
  v5[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v5);
}

void __50__RPTPagingScrollViewTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  char v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _BOOL8 v11;
  double v12;
  NSObject *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  double v18;
  double v19;
  char v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  uint8_t buf[24];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  if (v4[6])
  {
    objc_msgSend(v3, "setTouchCurveFunction:");
    v5 = objc_opt_respondsToSelector();
    v4 = *(_QWORD **)(a1 + 32);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v3, "setValue:forKey:", v4[6], CFSTR("pointerCurveFunction"));
      v4 = *(_QWORD **)(a1 + 32);
    }
  }
  v6 = _RPTScrollDirectionFromUIScrollDirection(objc_msgSend(v4, "direction"));
  objc_msgSend(*(id *)(a1 + 32), "scrollingBounds");
  v8 = v7;
  v10 = v9;
  v11 = _RPTAxisFromScrollDirection(v6);
  v12 = RPTSizeAlongAxis(v11, v8, v10);
  RPTLogTestRunning();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v12;
    _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters pageLength %f", buf, 0xCu);
  }

  v14 = v12 * 10.0;
  objc_msgSend(*(id *)(a1 + 32), "scrollingContentLength");
  if (v15 >= v12 * 7.0)
    v16 = v12 * 7.0;
  else
    v16 = v15;
  RPTLogTestRunning();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    *(double *)&buf[4] = v12;
    _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters reversalOffset %f", buf, 0xCu);
  }

  if (v14 > 0.0)
  {
    v18 = fmax(v12 / 500.0, 1.5);
    if (v18 <= 0.5)
      v19 = v18;
    else
      v19 = 0.5;
    v20 = 1;
    v21 = 0.0;
    do
    {
      v22 = v19;
      v23 = v6;
      if (((uint64_t)(v21 / v16) & 1) != 0)
      {
        v23 = RPTOppositeDirectionFrom(v6);
        v22 = v19 * 0.5;
      }
      *(_OWORD *)buf = 0uLL;
      v26 = 0.0;
      v27 = 0.0;
      objc_msgSend(*(id *)(a1 + 32), "positionsForDirection:startOut:endOut:", v23, buf, &v26);
      if ((v20 & 1) != 0)
        v22 = v19 + v19;
      v24 = *(void **)(a1 + 32);
      objc_msgSend(v24, "iterationDurationFactor");
      objc_msgSend(v24, "swipeWithComposer:fromPoint:toPoint:duration:", v3, *(_OWORD *)buf, v26, v27, v22 * v25);
      v20 = 0;
      v21 = (double)(unint64_t)(v12 + v21);
    }
    while (v14 > v21);
  }

}

- (void)positionsForDirection:(int64_t)a3 startOut:(CGPoint *)a4 endOut:(CGPoint *)a5
{
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  double Midpoint;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  _BOOL8 v20;
  double v21;
  double v22;
  double v23;

  -[RPTPagingScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = RPTCGRectGetMidpoint(v9, v10, v11, v12);
  v15 = v14;
  -[RPTPagingScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  v17 = v16;
  v19 = v18;
  v20 = _RPTAxisFromScrollDirection(a3);
  v21 = (RPTSizeAlongAxis(v20, v17, v19) + -20.0) * 0.5;
  switch(a3)
  {
    case 0:
      v22 = v15 - v21;
      v15 = v15 + v21;
      goto LABEL_5;
    case 1:
      v22 = v15 + v21;
      v15 = v15 - v21;
LABEL_5:
      v23 = Midpoint;
      break;
    case 2:
      v23 = Midpoint + v21;
      Midpoint = Midpoint - v21;
      goto LABEL_8;
    case 3:
      v23 = Midpoint - v21;
      Midpoint = Midpoint + v21;
LABEL_8:
      v22 = v15;
      break;
    default:
      v15 = 0.0;
      Midpoint = 0.0;
      v22 = 0.0;
      v23 = 0.0;
      break;
  }
  a4->x = v23;
  a4->y = v22;
  a5->x = Midpoint;
  a5->y = v15;
}

- (void)swipeWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  int v24;
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  double v29;
  uint64_t v30;
  CGPoint v31;
  CGPoint v32;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v30 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  RPTLogTestRunning();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v31.x = v10;
    v31.y = v9;
    _RPTStringFromCGPoint(v31);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v32.x = x;
    v32.y = y;
    _RPTStringFromCGPoint(v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 138543874;
    v25 = v14;
    v26 = 2114;
    v27 = v15;
    v28 = 2048;
    v29 = a6;
    _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTPagingScrollViewTestParameters swipeFromPoint: %{public}@ toPoint: %{public}@ duration:%f ", (uint8_t *)&v24, 0x20u);

  }
  -[RPTPagingScrollViewTestParameters conversion](self, "conversion");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "convertPoint:", v10, v9);
  v18 = v17;
  v20 = v19;
  -[RPTPagingScrollViewTestParameters conversion](self, "conversion");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "convertVector:", x - v10, y - v9);
  objc_msgSend(v12, "pointerOrFingerScrollAt:byDelta:duration:", v18, v20, v22, v23, a6);

  objc_msgSend(v12, "advanceTime:", 0.4);
}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
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

- (double)scrollingContentLength
{
  return self->_scrollingContentLength;
}

- (void)setScrollingContentLength:(double)a3
{
  self->_scrollingContentLength = a3;
}

- (int64_t)direction
{
  return self->_direction;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (double)iterationDurationFactor
{
  return self->_iterationDurationFactor;
}

- (void)setIterationDurationFactor:(double)a3
{
  self->_iterationDurationFactor = a3;
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_curveFunction, a3);
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
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

- (void)initWithTestName:(double)a3 scrollBounds:(double)a4 scrollContentLength:(double)a5 direction:(double)a6 completionHandler:.cold.1(NSObject *a1, double a2, double a3, double a4, double a5, double a6)
{
  void *v8;
  int v9;
  double v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _RPTStringFromCGRect(*(CGRect *)&a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 134218242;
  v10 = a6;
  v11 = 2114;
  v12 = v8;
  _os_log_error_impl(&dword_1B1773000, a1, OS_LOG_TYPE_ERROR, "RPT: RPTPagingScrollViewTestParameters scrollContentLength: %f too short for scrollBounds %{public}@ for a meaningful test.", (uint8_t *)&v9, 0x16u);

}

@end
