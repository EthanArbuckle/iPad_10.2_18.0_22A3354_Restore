@implementation RPTScrollViewTestParameters

- (void)setConversion:(id)a3
{
  objc_storeStrong((id *)&self->_conversion, a3);
}

- (void)setIterationDurationFactor:(double)a3
{
  self->_iterationDurationFactor = a3;
}

- (void)setDirection:(int64_t)a3
{
  self->_direction = a3;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 96);
}

- (void)setTestName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (RPTCoordinateSpaceConverter)conversion
{
  return self->_conversion;
}

- (NSString)testName
{
  return self->_testName;
}

- (int64_t)direction
{
  return self->_direction;
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

- (double)iterationDurationFactor
{
  return self->_iterationDurationFactor;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_testName, 0);
  objc_storeStrong((id *)&self->_curveFunction, 0);
  objc_storeStrong((id *)&self->_conversion, 0);
  objc_destroyWeak((id *)&self->_scrollView);
}

- (void)setScrollingContentLength:(double)a3
{
  id WeakRetained;
  NSObject *v6;
  uint64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    RPTLogTestRunning();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[RPTScrollViewTestParameters setScrollingContentLength:].cold.1((uint64_t)self, v6, v7, a3);

  }
  self->_scrollingContentLength = a3;
}

- (void)setScrollingBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id WeakRetained;
  NSObject *v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    RPTLogTestRunning();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      -[RPTScrollViewTestParameters setScrollingBounds:].cold.1((uint64_t)self, v9, x, y, width, height);

  }
  self->_scrollingBounds.origin.x = x;
  self->_scrollingBounds.origin.y = y;
  self->_scrollingBounds.size.width = width;
  self->_scrollingBounds.size.height = height;
}

- (unint64_t)effectiveVersion
{
  unint64_t v3;
  unint64_t forceMinVersion;
  unint64_t forceMaxVersion;
  unint64_t v6;
  unint64_t v7;

  if (_RPTScrollViewTestParametersDefaultVersion_onceToken != -1)
    dispatch_once(&_RPTScrollViewTestParametersDefaultVersion_onceToken, &__block_literal_global_3);
  v3 = _RPTScrollViewTestParametersDefaultVersion_version;
  forceMinVersion = self->_forceMinVersion;
  forceMaxVersion = self->_forceMaxVersion;
  if (forceMinVersion <= _RPTScrollViewTestParametersDefaultVersion_version)
    v6 = _RPTScrollViewTestParametersDefaultVersion_version;
  else
    v6 = self->_forceMinVersion;
  if (forceMinVersion)
    v3 = v6;
  if (forceMaxVersion >= v3)
    v7 = v3;
  else
    v7 = self->_forceMaxVersion;
  if (forceMaxVersion)
    return v7;
  else
    return v3;
}

+ (id)newWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  id v16;
  void *v17;
  void *v18;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = RPTDefaultScrollDirection(v8);
  v11 = RPTContentSizeInDirection(v8, v10);
  v12 = RPTGetBoundsForView(v8);
  v16 = +[RPTScrollViewTestParameters newWithTestName:scrollBounds:amplitude:direction:completionHandler:](RPTScrollViewTestParameters, "newWithTestName:scrollBounds:amplitude:direction:completionHandler:", v9, _UIScrollDirectionFromRPTScrollDirection(v10), v7, v12, v13, v14, v15, v11);

  objc_msgSend(v8, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConversion:", v18);

  return v16;
}

+ (id)newWithTestName:(id)a3 scrollBounds:(CGRect)a4 amplitude:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v14 = a7;
  v15 = a3;
  v16 = (void *)objc_opt_new();
  objc_msgSend(v16, "setTestName:", v15);

  objc_msgSend(v16, "setScrollingBounds:", x, y, width, height);
  objc_msgSend(v16, "setAmplitude:", a5);
  objc_msgSend(v16, "setAmplitudeFactor:", 1.0);
  objc_msgSend(v16, "setDirection:", a6);
  objc_msgSend(v16, "setCompletionHandler:", v14);

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isiOSAppOnMac");

  if (v18)
  {
    objc_msgSend(v16, "setPreventSheetDismissal:", 0);
    objc_msgSend(v16, "setShouldFlick:", 0);
  }
  objc_msgSend(v16, "setIterationDurationFactor:", 1.0);
  +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setConversion:", v19);

  return v16;
}

- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollView:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  const __CFString *v12;
  uint64_t v13;
  RPTScrollViewTestParameters *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  _BYTE v20[22];
  __int16 v21;
  const __CFString *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  RPTLogTestRunning();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = CFSTR("YES");
    *(_DWORD *)v20 = 138543874;
    *(_QWORD *)&v20[4] = v8;
    *(_WORD *)&v20[12] = 2114;
    if (!v10)
      v12 = CFSTR("NULL");
    *(_QWORD *)&v20[14] = v9;
    v21 = 2114;
    v22 = v12;
    _os_log_impl(&dword_1B1773000, v11, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTScrollViewTestParameters initWithTestName: %{public}@ scrollView: %{public}@ completionHandler: %{public}@]", v20, 0x20u);
  }

  v13 = RPTDefaultScrollDirection(v9);
  RPTContentSizeInDirection(v9, v13);
  v14 = -[RPTScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:](self, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", v8, v13, v10, RPTGetBoundsForView(v9));
  objc_msgSend(v9, "window");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  +[RPTCoordinateSpaceConverter converterFromWindow:](RPTCoordinateSpaceConverter, "converterFromWindow:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[RPTScrollViewTestParameters setConversion:](v14, "setConversion:", v16);
  objc_storeWeak((id *)&v14->_scrollView, v9);
  if (-[RPTScrollViewTestParameters effectiveVersion](v14, "effectiveVersion") > 2
    || -[RPTScrollViewTestParameters effectiveVersion](v14, "effectiveVersion") >= 2)
  {
    -[RPTScrollViewTestParameters setShouldFlick:](v14, "setShouldFlick:", 1, *(_OWORD *)v20);
  }
  RPTLogTestRunning();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = -[RPTScrollViewTestParameters shouldFlick](v14, "shouldFlick");
    *(_DWORD *)v20 = 67109120;
    *(_DWORD *)&v20[4] = v18;
    _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters shouldFlick: %{BOOL}u", v20, 8u);
  }

  return v14;
}

- (RPTScrollViewTestParameters)initWithTestName:(id)a3 scrollBounds:(CGRect)a4 scrollContentLength:(double)a5 direction:(int64_t)a6 completionHandler:(id)a7
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
  RPTScrollViewTestParameters *v23;
  uint64_t v24;
  NSString *testName;
  uint64_t v26;
  id completionHandler;
  uint64_t v28;
  CAMediaTimingFunction *curveFunction;
  uint64_t v30;
  RPTCoordinateSpaceConverter *conversion;
  NSObject *v32;
  void *v33;
  _BYTE v35[22];
  __int16 v36;
  double v37;
  __int16 v38;
  int64_t v39;
  __int16 v40;
  const __CFString *v41;
  uint64_t v42;
  CGRect v43;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v42 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  v16 = a7;
  RPTLogTestRunning();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    _RPTStringFromCGRect(v43);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v18;
    *(_DWORD *)v35 = 138544386;
    v20 = CFSTR("YES");
    *(_QWORD *)&v35[4] = v15;
    *(_WORD *)&v35[12] = 2114;
    if (!v16)
      v20 = CFSTR("NULL");
    *(_QWORD *)&v35[14] = v18;
    v36 = 2048;
    v37 = a5;
    v38 = 2050;
    v39 = a6;
    v40 = 2114;
    v41 = v20;
    _os_log_impl(&dword_1B1773000, v17, OS_LOG_TYPE_DEFAULT, "RPT: -[RPTScrollViewTestParameters initWithTestName: %{public}@ scrollBounds: %{public}@ scrollContentLength: %f direction: %{public}ld completionHandler: %{public}@]", v35, 0x34u);

  }
  v21 = _RPTAxisFromScrollDirection(a6);
  if (RPTSizeAlongAxis(v21, width, height) * 2.5 > a5)
  {
    RPTLogTestRunning();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      -[RPTScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:].cold.1(v22, x, y, width, height, a5);

  }
  v23 = -[RPTScrollViewTestParameters init](self, "init", *(_OWORD *)v35);
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
    v23->_amplitudeFactor = 1.0;
    v23->_direction = _UIScrollDirectionFromRPTScrollDirection(a6);
    v26 = MEMORY[0x1B5E1F6E0](v16);
    completionHandler = v23->_completionHandler;
    v23->_completionHandler = (id)v26;

    v23->_iterationDurationFactor = 1.0;
    v23->_shouldFlick = 0;
    if (-[RPTScrollViewTestParameters effectiveVersion](v23, "effectiveVersion") >= 3)
    {
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
      v28 = objc_claimAutoreleasedReturnValue();
      curveFunction = v23->_curveFunction;
      v23->_curveFunction = (CAMediaTimingFunction *)v28;

    }
    v23->_preventSheetDismissal = 0;
    +[RPTCoordinateSpaceConverter identityConverter](RPTCoordinateSpaceConverter, "identityConverter");
    v30 = objc_claimAutoreleasedReturnValue();
    conversion = v23->_conversion;
    v23->_conversion = (RPTCoordinateSpaceConverter *)v30;

  }
  RPTLogTestRunning();
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    -[RPTScrollViewTestParameters curveFunction](v23, "curveFunction");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v35 = 138543362;
    *(_QWORD *)&v35[4] = v33;
    _os_log_impl(&dword_1B1773000, v32, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters curveFunction: %{public}@", v35, 0xCu);

  }
  return v23;
}

- (id)composerBlock
{
  unint64_t v3;
  void *v4;

  v3 = -[RPTScrollViewTestParameters effectiveVersion](self, "effectiveVersion");
  if (v3 - 3 < 2)
  {
    -[RPTScrollViewTestParameters _v3_4_composerBlock](self, "_v3_4_composerBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 2)
  {
    -[RPTScrollViewTestParameters _v2_composerBlock](self, "_v2_composerBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 1)
  {
    -[RPTScrollViewTestParameters _v1_composerBlock](self, "_v1_composerBlock");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Unknown RPTScrollViewTestParametersForceVersion specified: %ld"), v3);
    v4 = 0;
  }
  return v4;
}

- (void)waitForPostEventStreamDelayWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  id WeakRetained;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  void (**v19)(_QWORD);
  __int128 *p_buf;
  __int128 buf;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  CGPoint v27;

  v26 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(_QWORD))a3;
  if (-[RPTScrollViewTestParameters effectiveVersion](self, "effectiveVersion") < 3)
    goto LABEL_12;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);

  if (WeakRetained)
  {
    RPTLogTestRunning();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = objc_loadWeakRetained((id *)&self->_scrollView);
      v27.x = RPTContentOffsetOf();
      _RPTStringFromCGPoint(v27);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(buf) = 138543362;
      *(_QWORD *)((char *)&buf + 4) = v8;
      _os_log_impl(&dword_1B1773000, v6, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView offset end: %{public}@", (uint8_t *)&buf, 0xCu);

    }
  }
  if (self->_shouldFlick
    && (v9 = objc_loadWeakRetained((id *)&self->_scrollView), v9, v9)
    && (v10 = objc_loadWeakRetained((id *)&self->_scrollView),
        v11 = objc_msgSend(v10, "isDecelerating"),
        v10,
        v11))
  {
    v12 = *MEMORY[0x1E0CEC170];
    RPTLogTestRunning();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1B1773000, v13, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView is decelerating", (uint8_t *)&buf, 2u);
    }

    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v22 = 0x3032000000;
    v23 = __Block_byref_object_copy_;
    v24 = __Block_byref_object_dispose_;
    v25 = 0;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_loadWeakRetained((id *)&self->_scrollView);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __70__RPTScrollViewTestParameters_waitForPostEventStreamDelayWithHandler___block_invoke;
    v18[3] = &unk_1E635D2B8;
    p_buf = &buf;
    v18[4] = self;
    v19 = v4;
    objc_msgSend(v14, "addObserverForName:object:queue:usingBlock:", v12, v15, 0, v18);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v16;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
LABEL_12:
    v4[2](v4);
  }

}

void __70__RPTScrollViewTestParameters_waitForPostEventStreamDelayWithHandler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  id WeakRetained;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;
  CGPoint v11;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObserver:", *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40));

  (*(void (**)(void))(a1[5] + 16))();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = 0;

  RPTLogTestRunning();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 8));
    v11.x = RPTContentOffsetOf();
    _RPTStringFromCGPoint(v11);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138543362;
    v9 = v7;
    _os_log_impl(&dword_1B1773000, v5, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters ScrollView offset at complete end: %{public}@", (uint8_t *)&v8, 0xCu);

  }
}

- (id)_v3_4_composerBlock
{
  NSObject *v3;
  id WeakRetained;
  NSObject *v5;
  _BOOL8 v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  NSObject *v21;
  double *v22;
  double *v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t i;
  float v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  RPTOscillationScrollTestParameters *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  _BOOL8 preventSheetDismissal;
  uint64_t v43;
  _BOOL8 v44;
  double v45;
  double v46;
  double v47;
  RPTOscillationScrollTestParameters *v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v55;
  uint8_t v56[4];
  double v57;
  _OWORD v58[3];
  __int128 buf;
  double v60;
  double v61;
  double v62;
  uint64_t v63;
  __int128 v64;
  unint64_t v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl(&dword_1B1773000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v3 composerBlock", (uint8_t *)&buf, 2u);
  }

  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  if (WeakRetained)
  {
    RPTLogTestRunning();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      -[RPTScrollViewTestParameters _v3_4_composerBlock].cold.1((id *)&self->_scrollView, v5);

  }
  v6 = RPTAxisFromScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
  -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  if (v6)
    v9 = v7;
  else
    v9 = v8;
  RPTLogTestRunning();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(double *)((char *)&buf + 4) = v9;
    _os_log_impl(&dword_1B1773000, v10, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters pageLength %f", (uint8_t *)&buf, 0xCu);
  }

  v11 = 0;
  v64 = xmmword_1B1783500;
  v65 = 0xBF0000003F000000;
  *(_QWORD *)&buf = 0x4046000000000000;
  *((_QWORD *)&buf + 1) = floor(v9 * 0.4);
  v60 = floor(v9 * 0.8);
  v61 = v60;
  v62 = v60;
  v63 = *((_QWORD *)&buf + 1);
  v58[0] = xmmword_1B17834D0;
  v58[1] = xmmword_1B17834E0;
  v58[2] = xmmword_1B17834F0;
  if (self->_shouldFlick)
    v12 = 6;
  else
    v12 = 5;
  v13 = 0.0;
  v14 = 0.0;
  do
  {
    v15 = *((double *)&buf + v11);
    v16 = v14 + v15;
    if (v16 >= v13)
      v13 = v16;
    if (*((float *)&v64 + v11) != (float)(int)*((float *)&v64 + v11))
      v15 = 0.0;
    v14 = v16 - v15;
    ++v11;
  }
  while (v12 != v11);
  -[RPTScrollViewTestParameters scrollingContentLength](self, "scrollingContentLength");
  v18 = v17 - v9;
  if (v9 * 0.3 >= v18)
    v19 = v9 * 0.3;
  else
    v19 = v18;
  if (v19 < v13)
  {
    v20 = v19 / v13;
    RPTLogTestRunning();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v56 = 134217984;
      v57 = v20;
      _os_log_impl(&dword_1B1773000, v21, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters capOffset scale %f", v56, 0xCu);
    }

    v22 = (double *)v58 + 1;
    v23 = (double *)&buf + 1;
    v24 = v12 - 1;
    do
    {
      *v23 = floor(v20 * *v23);
      ++v23;
      *v22 = (1.0 - (1.0 - v20) * (1.0 - v20)) * *v22;
      ++v22;
      --v24;
    }
    while (v24);
  }
  RPTLogTestRunning();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)v56 = 134217984;
    v57 = v19;
    _os_log_impl(&dword_1B1773000, v25, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters capOffset %f", v56, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  for (i = 0; i != v12; ++i)
  {
    v27 = *((float *)&v64 + i);
    if (v27 != 0.0 && (i != 5 || self->_shouldFlick))
    {
      v28 = *((double *)&buf + i);
      v29 = *((double *)v58 + i);
      v30 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
      v31 = v30;
      if (v27 < 0.0)
      {
        v31 = RPTOppositeDirectionFrom(v30);
        v27 = -v27;
        *((float *)&v64 + i) = v27;
      }
      v32 = [RPTOscillationScrollTestParameters alloc];
      -[RPTScrollViewTestParameters testName](self, "testName");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
      v35 = v34;
      v37 = v36;
      v39 = v38;
      v41 = v40;
      if (i)
        preventSheetDismissal = 0;
      else
        preventSheetDismissal = self->_preventSheetDismissal;
      v43 = (int)v27;
      v44 = v27 != (float)(int)v27;
      -[RPTScrollViewTestParameters _effectiveAmplitudeFactor](self, "_effectiveAmplitudeFactor");
      v46 = v28 * v45;
      -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
      v48 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v32, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v33, v43, i == 5, preventSheetDismissal, v31, v44, v35, v37, v39, v41, v46, 0.0, v28 / v29 * v47);

      -[RPTScrollViewTestParameters conversion](self, "conversion");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPTOscillationScrollTestParameters setConversion:](v48, "setConversion:", v49);

      -[RPTOscillationScrollTestParameters setUseDefaultDurationForFlick:](v48, "setUseDefaultDurationForFlick:", 0.0);
      if (i == 5)
      {
        -[CAMediaTimingFunction rcp_functionWithLinearEnd](self->_curveFunction, "rcp_functionWithLinearEnd");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        -[RPTOscillationScrollTestParameters setCurveFunction:](v48, "setCurveFunction:", v50);

      }
      else
      {
        -[RPTOscillationScrollTestParameters setCurveFunction:](v48, "setCurveFunction:", self->_curveFunction);
      }
      objc_msgSend(v55, "addObject:", v48);

    }
  }
  -[RPTScrollViewTestParameters testName](self, "testName");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v51, v55, 0);

  objc_msgSend(v52, "composerBlock");
  v53 = (void *)objc_claimAutoreleasedReturnValue();

  return v53;
}

- (id)_v2_composerBlock
{
  NSObject *v3;
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  RPTOscillationScrollTestParameters *v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  _BOOL8 preventSheetDismissal;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  uint64_t v33;
  double v34;
  double v35;
  RPTOscillationScrollTestParameters *v36;
  RPTOscillationScrollTestParameters *v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  _BOOL8 v47;
  double v48;
  double v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  double v53;
  RPTOscillationScrollTestParameters *v54;
  void *v55;
  uint64_t v56;
  id v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  void *v66;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _BYTE v72[128];
  RPTOscillationScrollTestParameters *v73;
  uint8_t buf[8];
  double v75;
  double v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1773000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v2 composerBlock", buf, 2u);
  }

  v4 = RPTAxisFromScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
  -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  if (v4)
    v7 = v5;
  else
    v7 = v6;
  *(_QWORD *)buf = 0x4046000000000000;
  v8 = floor(v7 * 0.8);
  v75 = floor(v7 * 0.4);
  v76 = v8;
  -[RPTScrollViewTestParameters scrollingContentLength](self, "scrollingContentLength");
  v10 = v9 - v7;
  if (v7 * 0.3 >= v10)
    v10 = v7 * 0.3;
  if (v10 < v8)
  {
    v11 = 0;
    v12 = v10 / v8;
    do
    {
      *(double *)&buf[v11] = v12 * *(double *)&buf[v11];
      v11 += 8;
    }
    while (v11 != 24);
  }
  v13 = 0;
  v14 = (void *)MEMORY[0x1E0C9AA60];
  do
  {
    v15 = v14;
    v16 = [RPTOscillationScrollTestParameters alloc];
    -[RPTScrollViewTestParameters testName](self, "testName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = qword_1B1783518[v13];
    -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
    preventSheetDismissal = self->_preventSheetDismissal;
    v28 = *(double *)&buf[v13 * 8];
    -[RPTScrollViewTestParameters _effectiveAmplitudeFactor](self, "_effectiveAmplitudeFactor");
    v30 = v28 * v29;
    -[RPTScrollViewTestParameters _effectiveAmplitudeFactor](self, "_effectiveAmplitudeFactor");
    v32 = v28 * v31 * -0.2;
    v33 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
    v34 = *(double *)&qword_1B1783530[v13];
    -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
    v36 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v16, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v17, v18, 0, preventSheetDismissal, v33, 1, v20, v22, v24, v26, v30, v32, v34 * v35);
    objc_msgSend(v15, "arrayByAddingObject:", v36);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    ++v13;
  }
  while (v13 != 3);
  if (self->_shouldFlick)
  {
    v37 = [RPTOscillationScrollTestParameters alloc];
    -[RPTScrollViewTestParameters testName](self, "testName");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    v46 = v45;
    v47 = self->_preventSheetDismissal;
    v48 = v75;
    -[RPTScrollViewTestParameters _effectiveAmplitudeFactor](self, "_effectiveAmplitudeFactor");
    v50 = v48 * v49;
    v51 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
    v52 = RPTOppositeDirectionFrom(v51);
    -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
    v54 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v37, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v38, 2, 1, v47, v52, 1, v40, v42, v44, v46, v50, 0.0, v53 * 1.875);
    v73 = v54;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v73, 1);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "arrayByAddingObjectsFromArray:", v55);
    v56 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v56;
  }
  v70 = 0u;
  v71 = 0u;
  v68 = 0u;
  v69 = 0u;
  v57 = v14;
  v58 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
  if (v58)
  {
    v59 = v58;
    v60 = *(_QWORD *)v69;
    do
    {
      v61 = 0;
      do
      {
        if (*(_QWORD *)v69 != v60)
          objc_enumerationMutation(v57);
        v62 = *(void **)(*((_QWORD *)&v68 + 1) + 8 * v61);
        -[RPTScrollViewTestParameters conversion](self, "conversion", (_QWORD)v68);
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setConversion:", v63);

        ++v61;
      }
      while (v59 != v61);
      v59 = objc_msgSend(v57, "countByEnumeratingWithState:objects:count:", &v68, v72, 16);
    }
    while (v59);
  }

  -[RPTScrollViewTestParameters testName](self, "testName");
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v64, v57, 0);

  objc_msgSend(v65, "composerBlock");
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  return v66;
}

- (id)_v1_composerBlock
{
  NSObject *v3;
  _BOOL8 v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  RPTOscillationScrollTestParameters *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  RPTOscillationScrollTestParameters *v20;
  RPTOscillationScrollTestParameters *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _BOOL8 preventSheetDismissal;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  RPTOscillationScrollTestParameters *v36;
  void *v37;
  double v38;
  RPTOscillationScrollTestParameters *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  RPTOscillationScrollTestParameters *v47;
  RPTOscillationScrollTestParameters *v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  _BOOL8 v58;
  uint64_t v59;
  double v60;
  double v61;
  RPTOscillationScrollTestParameters *v62;
  void *v63;
  void *v64;
  RPTOscillationScrollTestParameters *v65;
  void *v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  double v72;
  double v73;
  double v74;
  _BOOL8 v75;
  uint64_t v76;
  uint64_t v77;
  double v78;
  RPTOscillationScrollTestParameters *v79;
  void *v80;
  uint64_t v81;
  id v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t i;
  void *v87;
  void *v88;
  void *v89;
  id v90;
  void *v91;
  double v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[8];
  _BYTE v99[128];
  RPTOscillationScrollTestParameters *v100;
  _QWORD v101[2];
  _QWORD v102[4];

  v102[2] = *MEMORY[0x1E0C80C00];
  RPTLogTestRunning();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B1773000, v3, OS_LOG_TYPE_DEFAULT, "RPT: RPTScrollViewTestParameters v1 composerBlock", buf, 2u);
  }

  v4 = RPTAxisFromScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
  -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  if (v4)
    v7 = v5;
  else
    v7 = v6;
  -[RPTScrollViewTestParameters scrollingContentLength](self, "scrollingContentLength");
  v9 = floor(v8 / v7);
  -[RPTScrollViewTestParameters scrollingContentLength](self, "scrollingContentLength");
  if (v7 >= v10)
    v7 = v10;
  v11 = v7 / 10.0;
  -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
  v13 = v12 * 0.3125;
  v14 = [RPTOscillationScrollTestParameters alloc];
  -[RPTScrollViewTestParameters testName](self, "testName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  v20 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v14, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v15, 6, 0, self->_preventSheetDismissal, _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction")), 0, v16, v17, v18, v19, v7 / 10.0);
  v102[0] = v20;
  v21 = [RPTOscillationScrollTestParameters alloc];
  -[RPTScrollViewTestParameters testName](self, "testName");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  preventSheetDismissal = self->_preventSheetDismissal;
  v32 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
  -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
  v34 = v26;
  v35 = v7;
  v36 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v21, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v22, 3, 0, preventSheetDismissal, v32, 1, v24, v34, v28, v30, v7, 0.0, v33 * 1.25);
  v102[1] = v36;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 2);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 <= 1.0)
  {
    v64 = v37;
  }
  else
  {
    v38 = 1.0;
    v93 = v11;
    do
    {
      v39 = [RPTOscillationScrollTestParameters alloc];
      -[RPTScrollViewTestParameters testName](self, "testName");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
      v41 = v9;
      v42 = v35;
      v47 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v39, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v40, 6, 0, self->_preventSheetDismissal, _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction")), 0, v43, v44, v45, v46, v93, 0.015, v13);
      v101[0] = v47;
      v48 = [RPTOscillationScrollTestParameters alloc];
      -[RPTScrollViewTestParameters testName](self, "testName");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
      v51 = v50;
      v53 = v52;
      v55 = v54;
      v57 = v56;
      v58 = self->_preventSheetDismissal;
      v59 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
      -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
      v61 = v53;
      v35 = v42;
      v9 = v41;
      v62 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v48, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v49, 3, 0, v58, v59, 1, v51, v61, v55, v57, v35, 0.0, v60 * 1.25);
      v101[1] = v62;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v101, 2);
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "arrayByAddingObjectsFromArray:", v63);
      v64 = (void *)objc_claimAutoreleasedReturnValue();

      v38 = v38 + 1.0;
      v37 = v64;
    }
    while (v38 < v41);
  }
  if (self->_shouldFlick)
  {
    v65 = [RPTOscillationScrollTestParameters alloc];
    -[RPTScrollViewTestParameters testName](self, "testName");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[RPTScrollViewTestParameters scrollingBounds](self, "scrollingBounds");
    v68 = v67;
    v70 = v69;
    v72 = v71;
    v74 = v73;
    v75 = self->_preventSheetDismissal;
    v76 = _RPTScrollDirectionFromUIScrollDirection(-[RPTScrollViewTestParameters direction](self, "direction"));
    v77 = RPTOppositeDirectionFrom(v76);
    -[RPTScrollViewTestParameters iterationDurationFactor](self, "iterationDurationFactor");
    v79 = -[RPTOscillationScrollTestParameters initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:](v65, "initWithTestName:iterations:scrollingBounds:useFlicks:preventDismissalGestures:initialAmplitude:amplitudeVariationPerIteration:initialDirection:iterationDuration:finishWithHalfIteration:", v66, 6, 1, v75, v77, 1, v68, v70, v72, v74, v35, 0.0, v78 * 1.875);
    v100 = v79;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v100, 1);
    v80 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v64, "arrayByAddingObjectsFromArray:", v80);
    v81 = objc_claimAutoreleasedReturnValue();

    v64 = (void *)v81;
  }
  v96 = 0u;
  v97 = 0u;
  v94 = 0u;
  v95 = 0u;
  v82 = v64;
  v83 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
  if (v83)
  {
    v84 = v83;
    v85 = *(_QWORD *)v95;
    do
    {
      for (i = 0; i != v84; ++i)
      {
        if (*(_QWORD *)v95 != v85)
          objc_enumerationMutation(v82);
        v87 = *(void **)(*((_QWORD *)&v94 + 1) + 8 * i);
        -[RPTScrollViewTestParameters conversion](self, "conversion");
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "setConversion:", v88);

      }
      v84 = objc_msgSend(v82, "countByEnumeratingWithState:objects:count:", &v94, v99, 16);
    }
    while (v84);
  }

  -[RPTScrollViewTestParameters testName](self, "testName");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  v90 = +[RPTGroupScrollTestParameters newWithTestName:parameters:completionHandler:](RPTGroupScrollTestParameters, "newWithTestName:parameters:completionHandler:", v89, v82, 0);

  objc_msgSend(v90, "composerBlock");
  v91 = (void *)objc_claimAutoreleasedReturnValue();

  return v91;
}

- (CAMediaTimingFunction)curveFunction
{
  return self->_curveFunction;
}

- (void)setCurveFunction:(id)a3
{
  objc_storeStrong((id *)&self->_curveFunction, a3);
}

- (unint64_t)forceMinVersion
{
  return self->_forceMinVersion;
}

- (void)setForceMinVersion:(unint64_t)a3
{
  self->_forceMinVersion = a3;
}

- (unint64_t)forceMaxVersion
{
  return self->_forceMaxVersion;
}

- (void)setForceMaxVersion:(unint64_t)a3
{
  self->_forceMaxVersion = a3;
}

- (double)scrollingContentLength
{
  return self->_scrollingContentLength;
}

- (double)amplitudeFactor
{
  return self->_amplitudeFactor;
}

- (void)setAmplitudeFactor:(double)a3
{
  self->_amplitudeFactor = a3;
}

- (BOOL)preventSheetDismissal
{
  return self->_preventSheetDismissal;
}

- (void)setPreventSheetDismissal:(BOOL)a3
{
  self->_preventSheetDismissal = a3;
}

- (BOOL)shouldFlick
{
  return self->_shouldFlick;
}

- (void)setShouldFlick:(BOOL)a3
{
  self->_shouldFlick = a3;
}

- (void)setScrollingContentLength:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  double v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 56);
  v5 = 134218240;
  v6 = v4;
  v7 = 2048;
  v8 = a4;
  OUTLINED_FUNCTION_0(&dword_1B1773000, a2, a3, "Overriding default amplitude %.1f pts with %.1f pts. This may have undefined behaviour and should be avoided, when target scroll view is known.", (uint8_t *)&v5);
}

- (void)setScrollingBounds:(CGFloat)a3 .cold.1(uint64_t a1, NSObject *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  void *v11;
  void *v12;
  uint64_t v13;
  int v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;
  CGRect v19;

  v18 = *MEMORY[0x1E0C80C00];
  _RPTStringFromCGRect(*(CGRect *)(a1 + 104));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v19.origin.x = a3;
  v19.origin.y = a4;
  v19.size.width = a5;
  v19.size.height = a6;
  _RPTStringFromCGRect(v19);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 138412546;
  v15 = v11;
  v16 = 2112;
  v17 = v12;
  OUTLINED_FUNCTION_0(&dword_1B1773000, a2, v13, "Overriding default amplitude %@ pts with %@ pts. This may have undefined behaviour and should be avoided, when target scroll view is known.", (uint8_t *)&v14);

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
  _os_log_error_impl(&dword_1B1773000, a1, OS_LOG_TYPE_ERROR, "RPT: RPTScrollViewTestParameters scrollContentLength: %f too short for scrollBounds %{public}@ for a meaningful test.", (uint8_t *)&v9, 0x16u);

}

- (void)_v3_4_composerBlock
{
  id WeakRetained;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;
  CGPoint v8;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained(a1);
  v8.x = RPTContentOffsetOf();
  _RPTStringFromCGPoint(v8);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_1B1773000, a2, OS_LOG_TYPE_DEBUG, "RPT: RPTScrollViewTestParameters ScrollView offset start: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end
