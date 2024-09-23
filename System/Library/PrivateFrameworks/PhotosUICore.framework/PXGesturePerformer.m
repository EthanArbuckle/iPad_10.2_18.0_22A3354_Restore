@implementation PXGesturePerformer

+ (BOOL)isAvailable
{
  if (isAvailable_onceToken != -1)
    dispatch_once(&isAvailable_onceToken, &__block_literal_global_267833);
  return isAvailable_supportsRPT;
}

+ (void)performOscillatingInScrollView:(id)a3 rect:(CGRect)a4 speed:(unint64_t)a5 direction:(int64_t)a6 completionHandler:(id)a7
{
  double height;
  double width;
  double y;
  double x;
  id v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  double v22;
  double v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v15 = a7;
  objc_msgSend(a1, "_rptPlatformScrollViewFromPXScrollView:", a3);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(a1, "_rptDirection:", a6);
  objc_msgSend(a1, "_rectInWindowCoordinateSpaceFromRect:inView:", v16, x, y, width, height);
  if (v17 > 1)
    v22 = CGRectGetWidth(*(CGRect *)&v18);
  else
    v22 = CGRectGetHeight(*(CGRect *)&v18);
  v23 = v22;
  v24 = objc_alloc(MEMORY[0x1E0D83C68]);
  if (v16)
  {
    v25 = (void *)objc_msgSend(v24, "initWithTestName:scrollView:completionHandler:", CFSTR("oscillating"), v16, 0);
    objc_msgSend(v25, "setDirection:", objc_msgSend(a1, "_UIAccessibilityDirection:", a6));
    objc_msgSend(v25, "setShouldFlick:", 1);
    objc_msgSend(v25, "setScrollingContentLength:", v23);
  }
  else
  {
    v25 = (void *)objc_msgSend(v24, "initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:", CFSTR("oscillating"), v17, 0, x, y, width, height, v23);
  }
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __92__PXGesturePerformer_performOscillatingInScrollView_rect_speed_direction_completionHandler___block_invoke;
  v30 = &unk_1E51423E0;
  v31 = v15;
  v32 = a1;
  v26 = v15;
  objc_msgSend(v25, "setCompletionHandler:", &v27);
  objc_msgSend(a1, "_amplitudeFactorBySpeed:", a5, v27, v28, v29, v30);
  objc_msgSend(v25, "setAmplitudeFactor:");
  objc_msgSend(MEMORY[0x1E0D83C80], "runTestWithParameters:", v25);

}

+ (void)performSwipingInScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7 roundTrip:(BOOL)a8 completionHandler:(id)a9
{
  _BOOL4 v10;
  double height;
  double width;
  double y;
  double x;
  id v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t);
  void *v30;
  id v31;
  id v32;

  v10 = a8;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v19 = a3;
  v20 = a9;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_swipeParametersForScrollView:rect:count:speed:direction:", v19, a5, a6, a7, x, y, width, height);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addObject:", v22);
  if (v10)
  {
    objc_msgSend(a1, "_swipeParametersForScrollView:rect:count:speed:direction:", v19, a5, a6, objc_msgSend(a1, "_oppositeDirection:", a7), x, y, width, height);
    v23 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v21, "addObject:", v23);
    v22 = (void *)v23;
  }
  v24 = (void *)MEMORY[0x1E0D83C58];
  v27 = MEMORY[0x1E0C809B0];
  v28 = 3221225472;
  v29 = __104__PXGesturePerformer_performSwipingInScrollView_rect_count_speed_direction_roundTrip_completionHandler___block_invoke;
  v30 = &unk_1E51423E0;
  v31 = v20;
  v32 = a1;
  v25 = v20;
  v26 = (void *)objc_msgSend(v24, "newWithTestName:parameters:completionHandler:", CFSTR("swipe"), v21, &v27);
  objc_msgSend(MEMORY[0x1E0D83C80], "runTestWithParameters:", v26, v27, v28, v29, v30);

}

+ (void)_handleResult:(id)a3 success:(BOOL)a4 error:(id)a5
{
  if (a3)
    (*((void (**)(id, BOOL, id))a3 + 2))(a3, a4, a5);
}

+ (int64_t)_UIAccessibilityDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 3)
    return 4;
  else
    return 4 - a3;
}

+ (int64_t)_rptDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 1;
  else
    return qword_1A7C0B808[a3 - 1];
}

+ (int64_t)_oppositeDirection:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 1;
  else
    return qword_1A7C0B808[a3 - 1];
}

+ (id)swipeSpeedFactor:(unint64_t)a3
{
  void *v3;

  v3 = &unk_1E53EFF10;
  if (a3 == 1)
    v3 = &unk_1E53EFF20;
  if (a3 == 2)
    return &unk_1E53EFF30;
  else
    return v3;
}

+ (double)_amplitudeFactorBySpeed:(unint64_t)a3
{
  double result;

  result = 1.0;
  if (a3 == 1)
    result = 3.0;
  if (a3 == 2)
    return 5.0;
  return result;
}

+ (CGRect)_frameInScreenSpaceForRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  objc_msgSend(a1, "_rptPlatformViewFromPXView:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x1E0D83C48];
  objc_msgSend(v9, "screen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "converterFromWindow:toScreen:", v9, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "convertRect:", x, y, width, height);
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = v14;
  v22 = v16;
  v23 = v18;
  v24 = v20;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

+ (CGRect)_viewFrameInScreenSpace:(id)a3
{
  void *v3;
  double v4;
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
  CGRect result;

  objc_msgSend(a1, "_rptPlatformViewFromPXView:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  RPTViewFrameInScreenSpace();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

+ (id)_rptPlatformScrollViewFromPXScrollView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (id)_rptPlatformViewFromPXView:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

+ (CGRect)_rectInWindowCoordinateSpaceFromRect:(CGRect)a3 inView:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGRect v18;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = a4;
  objc_msgSend(v8, "superview");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    v18.origin.x = x;
    v18.origin.y = y;
    v18.size.width = width;
    v18.size.height = height;
    if (CGRectIsNull(v18))
    {
      objc_msgSend(v8, "frame");
      PXEdgeInsetsMake();
      PXEdgeInsetsInsetRect();
    }
    else
    {
      objc_msgSend(v8, "convertRect:toView:", v9, x, y, width, height);
    }
    objc_msgSend(v9, "convertRect:toView:", 0);
    x = v10;
    y = v11;
    width = v12;
    height = v13;
  }

  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

+ (id)_swipeParametersForScrollView:(id)a3 rect:(CGRect)a4 count:(int64_t)a5 speed:(unint64_t)a6 direction:(int64_t)a7
{
  double height;
  double width;
  double y;
  double x;
  void *v15;
  id v16;
  void *v17;
  void *v18;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  objc_msgSend(a1, "_rptPlatformScrollViewFromPXScrollView:", a3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_alloc(MEMORY[0x1E0D83C50]);
  if (v15)
  {
    v17 = (void *)objc_msgSend(v16, "initWithTestName:scrollView:completionHandler:", CFSTR("swipe"), v15, 0);
    objc_msgSend(v17, "setSwipeCount:", a5);
    objc_msgSend(v17, "setDirection:", objc_msgSend(a1, "_UIAccessibilityDirection:", a7));
    objc_msgSend(a1, "_rectInWindowCoordinateSpaceFromRect:inView:", v15, x, y, width, height);
    objc_msgSend(v17, "setScrollingBounds:");
  }
  else
  {
    v17 = (void *)objc_msgSend(v16, "initWithTestName:scrollingBounds:swipeCount:direction:completionHandler:", CFSTR("swipe"), a5, objc_msgSend(a1, "_UIAccessibilityDirection:", a7), 0, x, y, width, height);
  }
  objc_msgSend(a1, "swipeSpeedFactor:", a6);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSwipeSpeedFactor:", v18);

  objc_msgSend(v17, "setShouldFlick:", 1);
  return v17;
}

uint64_t __104__PXGesturePerformer_performSwipingInScrollView_rect_count_speed_direction_roundTrip_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_handleResult:success:error:", *(_QWORD *)(a1 + 32), 1, 0);
}

uint64_t __92__PXGesturePerformer_performOscillatingInScrollView_rect_speed_direction_completionHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 40), "_handleResult:success:error:", *(_QWORD *)(a1 + 32), 1, 0);
}

uint64_t __33__PXGesturePerformer_isAvailable__block_invoke()
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D83C80], "isRecapAvailable");
  isAvailable_supportsRPT = result;
  return result;
}

@end
