@implementation RPTOscillationScrollTestParameters

- (id)composerBlock
{
  _QWORD v3[5];

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__RPTOscillationScrollTestParameters_composerBlock__block_invoke;
  v3[3] = &unk_1E635D210;
  v3[4] = self;
  return (id)MEMORY[0x1B5E1F6E0](v3, a2);
}

- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12
{
  return -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:](self, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:completionHandler:", a3, a4, a6, a7, a10, a12, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height, a8, a9, a11, 0);
}

- (RPTOscillationScrollTestParameters)initWithTestName:(id)a3 iterations:(unint64_t)a4 scrollingBounds:(CGRect)a5 useFlicks:(BOOL)a6 preventDismissalGestures:(BOOL)a7 initialAmplitude:(double)a8 amplitudeVariationPerIteration:(double)a9 initialDirection:(int64_t)a10 iterationDuration:(double)a11 finishWithHalfIteration:(BOOL)a12 completionHandler:(id)a13
{
  _BOOL4 v13;
  _BOOL4 v15;
  _BOOL4 v16;
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v26;
  id v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  const __CFString *v31;
  RPTOscillationScrollTestParameters *v32;
  uint64_t v33;
  NSString *testName;
  uint64_t v35;
  id completionHandler;
  uint64_t v37;
  RPTCoordinateSpaceConverter *conversion;
  objc_super v40;
  uint8_t buf[4];
  id v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  uint64_t v46;
  __int16 v47;
  _BOOL4 v48;
  __int16 v49;
  _BOOL4 v50;
  __int16 v51;
  double v52;
  __int16 v53;
  double v54;
  __int16 v55;
  int64_t v56;
  __int16 v57;
  double v58;
  __int16 v59;
  _BOOL4 v60;
  __int16 v61;
  const __CFString *v62;
  uint64_t v63;
  CGRect v64;

  v13 = a12;
  v15 = a7;
  v16 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v63 = *MEMORY[0x1E0C80C00];
  v26 = a3;
  v27 = a13;
  RPTLogTestRunning();
  v28 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    _RPTStringFromCGRect(v64);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)v29;
    v31 = CFSTR("YES");
    *(_DWORD *)buf = 138545922;
    v42 = v26;
    v43 = 2050;
    if (!v27)
      v31 = CFSTR("NULL");
    v44 = a4;
    v45 = 2114;
    v46 = v29;
    v47 = 1024;
    v48 = v16;
    v49 = 1024;
    v50 = v15;
    v51 = 2048;
    v52 = a8;
    v53 = 2048;
    v54 = a9;
    v55 = 2050;
    v56 = a10;
    v57 = 2048;
    v58 = a11;
    v59 = 1024;
    v60 = v13;
    v61 = 2114;
    v62 = v31;
    _os_log_impl(&dword_1B1773000, v28, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTOscillationScrollTestParameters initWithTestName: %{public}@ iterations: %{public}lul scrollingBounds: %{public}@ useFlicks: %{BOOL}u preventDismissalGestures: %{BOOL}u initialAmplitude: %f amplitudeVariationPerIteration: %f initialDirection: %{public}ld iterationDuration: %f finishWithHalfIteration: %{BOOL}u completionHandler: %{public}@]", buf, 0x64u);

  }
  v40.receiver = self;
  v40.super_class = (Class)RPTOscillationScrollTestParameters;
  v32 = -[RPTOscillationScrollTestParameters init](&v40, sel_init);
  if (v32)
  {
    v33 = objc_msgSend(v26, "copy");
    testName = v32->_testName;
    v32->_testName = (NSString *)v33;

    v32->_iterations = a4;
    v32->_scrollingBounds.origin.y = y;
    v32->_scrollingBounds.size.width = width;
    v32->_scrollingBounds.size.height = height;
    v32->_shouldFlick = v16;
    v32->_useDefaultDurationForFlick = 1.0;
    v32->_preventDismissalGestures = v15;
    v32->_amplitudeVariationPerIteration = a9;
    v32->_initialAmplitude = a8;
    v32->_initialDirection = a10;
    v32->_iterationDuration = a11;
    v32->_scrollingBounds.origin.x = x;
    v32->_finishWithHalfIteration = v13;
    v35 = MEMORY[0x1B5E1F6E0](v27);
    completionHandler = v32->_completionHandler;
    v32->_completionHandler = (id)v35;

    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v37 = objc_claimAutoreleasedReturnValue();
    conversion = v32->_conversion;
    v32->_conversion = (RPTCoordinateSpaceConverter *)v37;

  }
  return v32;
}

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (unint64_t)iterations
{
  return self->_iterations;
}

- (CGPoint)initialFingerPosition
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
  CGPoint result;

  -[RPTOscillationScrollTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  -[RPTOscillationScrollTestParameters initialAmplitude](self, "initialAmplitude");
  v11 = RPTCGPointAdvanceInDirectionByAmount(-[RPTOscillationScrollTestParameters initialDirection](self, "initialDirection"), Midpoint, v9, v10 * 0.5);
  result.y = v12;
  result.x = v11;
  return result;
}

- (CGPoint)finalFingerPosition
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
  uint64_t v12;
  double v13;
  double v14;
  CGPoint result;

  -[RPTOscillationScrollTestParameters scrollingBounds](self, "scrollingBounds");
  Midpoint = RPTCGRectGetMidpoint(v3, v4, v5, v6);
  v9 = v8;
  -[RPTOscillationScrollTestParameters initialAmplitude](self, "initialAmplitude");
  v11 = v10 * 0.5;
  v12 = RPTOppositeDirectionFrom(-[RPTOscillationScrollTestParameters initialDirection](self, "initialDirection"));
  v13 = RPTCGPointAdvanceInDirectionByAmount(v12, Midpoint, v9, v11);
  result.y = v14;
  result.x = v13;
  return result;
}

- (double)initialAmplitude
{
  return self->_initialAmplitude;
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

- (BOOL)finishWithHalfIteration
{
  return self->_finishWithHalfIteration;
}

- (BOOL)preventDismissalGestures
{
  return self->_preventDismissalGestures;
}

- (double)iterationDuration
{
  return self->_iterationDuration;
}

- (int64_t)initialDirection
{
  return self->_initialDirection;
}

- (double)amplitudeVariationPerIteration
{
  return self->_amplitudeVariationPerIteration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
}

- (CGPoint)_incrementPoint:(CGPoint)a3 final:(BOOL)a4
{
  double y;
  double x;
  double v6;
  int64_t initialDirection;
  double v9;
  _BOOL8 v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGPoint result;

  y = a3.y;
  x = a3.x;
  v6 = -(self->_amplitudeVariationPerIteration * 0.5);
  if (a4)
    v6 = self->_amplitudeVariationPerIteration * 0.5;
  initialDirection = self->_initialDirection;
  if (initialDirection == 3 || initialDirection == 0)
    v9 = -v6;
  else
    v9 = v6;
  v10 = _RPTAxisFromScrollDirection(initialDirection);
  v11 = -0.0;
  if (v10)
    v12 = v9;
  else
    v12 = -0.0;
  v13 = x + v12;
  if (!v10)
    v11 = v9;
  v14 = y + v11;
  result.y = v14;
  result.x = v13;
  return result;
}

void __51__RPTOscillationScrollTestParameters_composerBlock__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD *v4;
  char v5;
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
  uint64_t v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  unint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  char v28;
  void *v29;

  v3 = a2;
  v4 = *(_QWORD **)(a1 + 32);
  v29 = v3;
  if (v4[6])
  {
    objc_msgSend(v3, "setTouchCurveFunction:");
    v5 = objc_opt_respondsToSelector();
    v4 = *(_QWORD **)(a1 + 32);
    if ((v5 & 1) != 0)
    {
      objc_msgSend(v29, "setValue:forKey:", v4[6], CFSTR("pointerCurveFunction"));
      v4 = *(_QWORD **)(a1 + 32);
    }
  }
  objc_msgSend(v4, "iterationDuration");
  v7 = v6;
  objc_msgSend(*(id *)(a1 + 32), "initialFingerPosition");
  v9 = v8;
  v11 = v10;
  objc_msgSend(*(id *)(a1 + 32), "finalFingerPosition");
  v13 = v12;
  v15 = v14;
  if (objc_msgSend(*(id *)(a1 + 32), "preventDismissalGestures"))
  {
    v16 = RPTOppositeDirectionFrom(objc_msgSend(*(id *)(a1 + 32), "initialDirection"));
    v17 = RPTCGPointAdvanceInDirectionByAmount(v16, v9, v11, 75.0);
    objc_msgSend(v29, "dragWithStartPoint:endPoint:duration:", v9, v11, v17, v18, 0.3);
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldFlick") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversion");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertPoint:", v9, v11);
    objc_msgSend(v29, "touchDown:");

  }
  v20 = v7 * 0.5;
  if (objc_msgSend(*(id *)(a1 + 32), "iterations"))
  {
    v21 = 1;
    do
    {
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v29, v9, v11, v13, v15, v20);
      objc_msgSend(*(id *)(a1 + 32), "_incrementPoint:final:", 0, v9, v11);
      v9 = v22;
      v11 = v23;
      objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v29, v13, v15, v22, v23, v20);
      objc_msgSend(*(id *)(a1 + 32), "_incrementPoint:final:", 1, v13, v15);
      v13 = v24;
      v15 = v25;
      ++v21;
    }
    while (v21 <= objc_msgSend(*(id *)(a1 + 32), "iterations"));
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "finishWithHalfIteration") & 1) != 0)
    objc_msgSend(*(id *)(a1 + 32), "scrollWithComposer:fromPoint:toPoint:duration:", v29, v9, v11, v13, v15, v20);
  if ((objc_msgSend(*(id *)(a1 + 32), "shouldFlick") & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "conversion");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "convertPoint:", v13, v15);
    objc_msgSend(v29, "liftUp:");

  }
  v27 = v29;
  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 48))
  {
    objc_msgSend(v29, "setTouchCurveFunction:", 0);
    v28 = objc_opt_respondsToSelector();
    v27 = v29;
    if ((v28 & 1) != 0)
    {
      objc_msgSend(v29, "setValue:forKey:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 48), CFSTR("pointerCurveFunction"));
      v27 = v29;
    }
  }

}

- (void)scrollWithComposer:(id)a3 fromPoint:(CGPoint)a4 toPoint:(CGPoint)a5 duration:(double)a6
{
  double y;
  double x;
  double v9;
  double v10;
  id v12;
  NSObject *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  _BOOL4 v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  int v28;
  id v29;
  __int16 v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  double v35;
  uint64_t v36;
  CGPoint v37;
  CGPoint v38;

  y = a5.y;
  x = a5.x;
  v9 = a4.y;
  v10 = a4.x;
  v36 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  RPTLogTestRunning();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v37.x = v10;
    v37.y = v9;
    _RPTStringFromCGPoint(v37);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v38.x = x;
    v38.y = y;
    _RPTStringFromCGPoint(v38);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 138544130;
    v29 = v12;
    v30 = 2114;
    v31 = v14;
    v32 = 2114;
    v33 = v15;
    v34 = 2048;
    v35 = a6;
    _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTOscillationScrollTestParameters scrollWithComposer: %{public}@ fromPoint: %{public}@ toPoint: %{public}@ duration: %f]", (uint8_t *)&v28, 0x2Au);

  }
  v16 = x - v10;
  v17 = y - v9;
  v18 = -[RPTOscillationScrollTestParameters shouldFlick](self, "shouldFlick");
  -[RPTOscillationScrollTestParameters conversion](self, "conversion");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "convertPoint:", v10, v9);
  v21 = v20;
  v23 = v22;
  -[RPTOscillationScrollTestParameters conversion](self, "conversion");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "convertVector:", v16, v17);
  if (v18)
  {
    if (self->_useDefaultDurationForFlick == 0.0)
      v27 = a6;
    else
      v27 = 0.5;
    objc_msgSend(v12, "_pointerOrFingerFlickAt:byDelta:duration:", v21, v23, v25, v26, v27);
  }
  else
  {
    objc_msgSend(v12, "_pointerOrFingerScrollAt:byDelta:duration:touchDownAndLift:", 0, v21, v23, v25, v26, a6);
  }

}

- (NSString)testName
{
  return self->_testName;
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void)setIterations:(unint64_t)a3
{
  self->_iterations = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  self->_scrollingBounds = a3;
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_curveFunction, a3);
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (double)useDefaultDurationForFlick
{
  return self->_useDefaultDurationForFlick;
}

- (void)setUseDefaultDurationForFlick:(double)a3
{
  self->_useDefaultDurationForFlick = a3;
}

- (void)setPreventDismissalGestures:(BOOL)a3
{
  self->_preventDismissalGestures = a3;
}

- (void)setFinishWithHalfIteration:(BOOL)a3
{
  self->_finishWithHalfIteration = a3;
}

- (void)setAmplitudeVariationPerIteration:(double)a3
{
  self->_amplitudeVariationPerIteration = a3;
}

- (void)setInitialAmplitude:(double)a3
{
  self->_initialAmplitude = a3;
}

- (void)setInitialDirection:(int64_t)a3
{
  self->_initialDirection = a3;
}

- (void)setIterationDuration:(double)a3
{
  self->_iterationDuration = a3;
}

@end
