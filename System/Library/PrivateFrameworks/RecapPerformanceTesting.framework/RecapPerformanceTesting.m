id getRCPSyntheticEventStreamClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPSyntheticEventStreamClass_softClass;
  v7 = getRCPSyntheticEventStreamClass_softClass;
  if (!getRCPSyntheticEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRCPSyntheticEventStreamClass_block_invoke;
    v3[3] = &unk_1E635D198;
    v3[4] = &v4;
    __getRCPSyntheticEventStreamClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B17754B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RecapLibraryCore()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = RecapLibraryCore_frameworkLibrary;
  v6 = RecapLibraryCore_frameworkLibrary;
  if (!RecapLibraryCore_frameworkLibrary)
  {
    v7 = xmmword_1E635D170;
    v8 = *(_OWORD *)&off_1E635D180;
    v1 = _sl_dlopen();
    v4[3] = v1;
    RecapLibraryCore_frameworkLibrary = v1;
    v0 = v1;
  }
  _Block_object_dispose(&v3, 8);
  return v0;
}

void sub_1B177557C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t _UIScrollDirectionFromRPTScrollDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
    return 4;
  else
    return 4 - a1;
}

uint64_t RPTPredominantAxisOfContentOf(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  uint64_t v9;

  v1 = a1;
  if (!objc_msgSend(v1, "_contentScrollsAlongXAxis")
    || (objc_msgSend(v1, "_contentScrollsAlongYAxis") & 1) == 0)
  {
    if (objc_msgSend(v1, "_contentScrollsAlongXAxis")
      && !objc_msgSend(v1, "_contentScrollsAlongYAxis"))
    {
      v9 = 1;
      goto LABEL_14;
    }
    if (objc_msgSend(v1, "_contentScrollsAlongYAxis")
      && !objc_msgSend(v1, "_contentScrollsAlongXAxis"))
    {
      v9 = 0;
      goto LABEL_14;
    }
  }
  objc_msgSend(v1, "contentSize");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "bounds");
  v8 = v3 - v6 > 0.0;
  if (v5 - v7 > 0.0)
    v8 = 1;
  v9 = v3 - v6 > v5 - v7 && v8;
LABEL_14:

  return v9;
}

double RPTGetBoundsForView(void *a1)
{
  id v1;
  double x;
  double v3;
  CGFloat y;
  double v5;
  CGFloat width;
  double v7;
  CGFloat height;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  void *v26;
  void *v27;
  double v28;
  CGFloat r1;
  double v31;
  double v32;
  double v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;

  v1 = a1;
  x = _RPTGetSafeBoundsForView(v1, 1);
  y = v3;
  width = v5;
  height = v7;
  v9 = v1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "adjustedContentInset");
    v32 = v10;
    v33 = v11;
    v13 = v12;
    v31 = v14;
    objc_msgSend(v9, "superview");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    objc_msgSend(v15, "convertRect:toView:", 0);
    v17 = v16;
    v19 = v18;
    v20 = x;
    v22 = v21;
    r1 = height;
    v23 = y;
    v25 = v24;

    v36.origin.x = v13 + v17;
    v36.origin.y = v32 + v19;
    v36.size.width = v22 - (v13 + v31);
    v36.size.height = v25 - (v32 + v33);
    v34.origin.x = v20;
    v34.origin.y = v23;
    v34.size.width = width;
    v34.size.height = r1;
    v35 = CGRectIntersection(v34, v36);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
  }

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = RPTExcludeSystemRegionsFromRect(v26, v27, x, y, width, height);

  return v28 + 5.0;
}

double _RPTGetSafeBoundsForView(void *a1, int a2)
{
  id v3;
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
  double x;
  double v15;
  double y;
  double v17;
  double width;
  double v19;
  double height;
  void *v21;
  void *v22;
  void *v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  NSObject *v27;
  void *v28;
  void *v29;
  int v31;
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  id v36;
  uint64_t v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;

  v37 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  objc_msgSend(v4, "convertRect:toView:", 0);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  objc_msgSend(v3, "safeAreaInsets");
  x = v6 + v13;
  y = v8 + v15;
  width = v10 - (v13 + v17);
  height = v12 - (v15 + v19);
  objc_msgSend(v3, "superview");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "superview");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
    objc_msgSend(v3, "superview");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v42.origin.x = _RPTGetSafeBoundsForView(v23, 0);
    v42.origin.y = v24;
    v42.size.width = v25;
    v42.size.height = v26;
    v38.origin.x = x;
    v38.origin.y = y;
    v38.size.width = width;
    v38.size.height = height;
    v39 = CGRectIntersection(v38, v42);
    x = v39.origin.x;
    y = v39.origin.y;
    width = v39.size.width;
    height = v39.size.height;

  }
  if (a2)
  {
    RPTLogTestRunning();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v40.origin.x = x;
      v40.origin.y = y;
      v40.size.width = width;
      v40.size.height = height;
      _RPTStringFromCGRect(v40);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v41.origin.x = v6;
      v41.origin.y = v8;
      v41.size.width = v10;
      v41.size.height = v12;
      _RPTStringFromCGRect(v41);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = 138543874;
      v32 = v28;
      v33 = 2114;
      v34 = v29;
      v35 = 2114;
      v36 = v3;
      _os_log_impl(&dword_1B1773000, v27, OS_LOG_TYPE_DEFAULT, "RPT: Safe window bounds %{public}@ (%{public}@) for view %{public}@.", (uint8_t *)&v31, 0x20u);

    }
  }

  return x;
}

uint64_t _RPTScrollDirectionFromUIScrollDirection(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 5)
    return 1;
  else
    return qword_1B1783448[a1 - 1];
}

BOOL _RPTAxisFromScrollDirection(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

id getRCPInlinePlayerClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPInlinePlayerClass_softClass;
  v7 = getRCPInlinePlayerClass_softClass;
  if (!getRCPInlinePlayerClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRCPInlinePlayerClass_block_invoke;
    v3[3] = &unk_1E635D198;
    v3[4] = &v4;
    __getRCPInlinePlayerClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B1775EB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RPTExcludeSystemRegionsFromRect(void *a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v10;
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
  double result;
  CGRect v24;
  CGRect v25;

  v10 = a1;
  objc_msgSend(a2, "safeAreaInsets");
  v12 = v11;
  objc_msgSend(v10, "bounds");
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v20 = v19;

  v21 = 44.0;
  if (v12 <= 0.0)
    v21 = 88.0;
  v25.size.height = v20 - v21;
  v24.origin.x = a3;
  v24.origin.y = a4;
  v24.size.width = a5;
  v24.size.height = a6;
  v25.origin.x = v14 + 10.0;
  v25.origin.y = v16 + 44.0;
  v25.size.width = v18 + -20.0;
  *(_QWORD *)&result = (unint64_t)CGRectIntersection(v24, v25);
  return result;
}

uint64_t RPTOppositeDirectionFrom(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return 1;
  else
    return qword_1B1783430[a1 - 1];
}

id RPTLogTestRunning()
{
  if (RPTLogTestRunning_onceToken != -1)
    dispatch_once(&RPTLogTestRunning_onceToken, &__block_literal_global_0);
  return (id)RPTLogTestRunning___logObj;
}

id getRCPPlayerPlaybackOptionsClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPPlayerPlaybackOptionsClass_softClass;
  v7 = getRCPPlayerPlaybackOptionsClass_softClass;
  if (!getRCPPlayerPlaybackOptionsClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRCPPlayerPlaybackOptionsClass_block_invoke;
    v3[3] = &unk_1E635D198;
    v3[4] = &v4;
    __getRCPPlayerPlaybackOptionsClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B1776090(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double RPTAmplitudeFromPagesOfView(void *a1, uint64_t a2, unint64_t a3)
{
  return _RPTAmplitudeFromPagesOfView(a1, a2 == 1, a3);
}

uint64_t RecapLibrary()
{
  uint64_t v0;
  void *v2;

  v0 = RecapLibraryCore();
  if (!v0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getRCPInlinePlayerClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPInlinePlayer");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPInlinePlayerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPInlinePlayerClass_block_invoke_cold_1();
    return (Class)getRCPEventStreamClass(v3);
  }
  return result;
}

id getRCPEventStreamClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPEventStreamClass_softClass;
  v7 = getRCPEventStreamClass_softClass;
  if (!getRCPEventStreamClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventStreamClass_block_invoke;
    v3[3] = &unk_1E635D198;
    v3[4] = &v4;
    __getRCPEventStreamClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B17762C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getRCPEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPEventStreamClass_block_invoke_cold_1();
    return __getRCPSyntheticEventStreamClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPSyntheticEventStreamClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  RecapLibrary();
  result = objc_getClass("RCPSyntheticEventStream");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPSyntheticEventStreamClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
    return (Class)__getRCPPlayerPlaybackOptionsClass_block_invoke(v3);
  }
  return result;
}

Class __getRCPPlayerPlaybackOptionsClass_block_invoke(uint64_t a1)
{
  Class result;

  RecapLibrary();
  result = objc_getClass("RCPPlayerPlaybackOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPPlayerPlaybackOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1();
    return (Class)getRCPEventSenderPropertiesClass();
  }
  return result;
}

id getRCPEventSenderPropertiesClass()
{
  void *v0;
  id v1;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2050000000;
  v0 = (void *)getRCPEventSenderPropertiesClass_softClass;
  v7 = getRCPEventSenderPropertiesClass_softClass;
  if (!getRCPEventSenderPropertiesClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getRCPEventSenderPropertiesClass_block_invoke;
    v3[3] = &unk_1E635D198;
    v3[4] = &v4;
    __getRCPEventSenderPropertiesClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1B1776478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getRCPEventSenderPropertiesClass_block_invoke(uint64_t a1)
{
  RPTResizeTestParameters *v2;
  SEL v3;
  id v4;

  RecapLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("RCPEventSenderProperties");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getRCPEventSenderPropertiesClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v2 = (RPTResizeTestParameters *)__getRCPEventSenderPropertiesClass_block_invoke_cold_1();
    -[RPTResizeTestParameters prepareWithComposer:](v2, v3, v4);
  }
}

void sub_1B1776528(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B177664C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_1B1776844(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;

  _Unwind_Resume(a1);
}

void sub_1B177714C(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1B1777144);
}

void sub_1B17771E0(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1B17771D8);
}

double RPTExcludeSystemRegionsFromView(void *a1)
{
  id v1;
  void *v2;
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;

  v1 = a1;
  objc_msgSend(v1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "frame");
  objc_msgSend(v2, "convertRect:toView:", 0);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  objc_msgSend(v1, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "screen");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = RPTExcludeSystemRegionsFromRect(v12, v13, v4, v6, v8, v10);
  return v14;
}

double RPTConvertPointInViewToScreenSpace(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;

  v5 = a1;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "screen");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fixedCoordinateSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertPoint:toCoordinateSpace:", v9, a2, a3);
    a2 = v10;

  }
  return a2;
}

double RPTViewFrameInScreenSpace(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(v1, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    objc_msgSend(v1, "window");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "screen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fixedCoordinateSpace");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "convertRect:toCoordinateSpace:", v13, v4, v6, v8, v10);
    v15 = v14;

  }
  else
  {
    objc_msgSend(v1, "frame");
    v15 = v16;
  }

  return v15;
}

double _RPTAmplitudeFromPagesOfView(void *a1, uint64_t a2, unint64_t a3)
{
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v5 = a1;
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    objc_msgSend(v5, "window");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "convertRect:toView:", v15, v8, v10, v12, v14);
    v17 = v16;
    v19 = v18;

  }
  else
  {
    objc_msgSend(v5, "frame");
    v17 = v20;
    v19 = v21;
  }
  if (a2 == 1)
    v22 = v17;
  else
    v22 = v19;
  v23 = v22 * (double)a3;

  return v23;
}

double RPTSizeAlongAxis(uint64_t a1, double a2, double a3)
{
  double result;

  if (a1 != 1)
    return a3;
  return result;
}

double RPTContentSizeAlongAxis(void *a1, uint64_t a2)
{
  double result;
  double v4;

  objc_msgSend(a1, "contentSize");
  if (a2 != 1)
    return v4;
  return result;
}

double RPTContentSizeInDirection(void *a1, uint64_t a2)
{
  unint64_t v2;
  double result;
  double v4;

  v2 = a2 & 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(a1, "contentSize");
  if (v2 != 2)
    return v4;
  return result;
}

uint64_t RPTDefaultScrollDirection(void *a1)
{
  id v1;
  uint64_t v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  double v14;

  v1 = a1;
  v2 = RPTPredominantAxisOfContentOf(v1);
  objc_msgSend(v1, "contentOffset");
  v4 = v3;
  v6 = v5;
  objc_msgSend(v1, "contentSize");
  v8 = v7;
  v10 = v9;

  v11 = 2;
  v12 = 3;
  if (v2)
  {
    v13 = v8;
  }
  else
  {
    v12 = 0;
    v11 = 1;
    v13 = v10;
  }
  if (v2)
    v14 = v4;
  else
    v14 = v6;
  if (v14 >= v13 * 0.5)
    return v12;
  else
    return v11;
}

BOOL RPTAxisFromScrollDirection(uint64_t a1)
{
  return ((a1 - 1) & 0xFFFFFFFFFFFFFFFALL) == 0;
}

double RPTCGRectGetMidpoint(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MidX;
  CGRect v10;

  MidX = CGRectGetMidX(*(CGRect *)&a1);
  v10.origin.x = a1;
  v10.origin.y = a2;
  v10.size.width = a3;
  v10.size.height = a4;
  CGRectGetMidY(v10);
  return MidX;
}

double RPTCGPointAdvanceInDirectionByAmount(uint64_t a1, double result, double a3, double a4)
{
  switch(a1)
  {
    case 2:
      result = result + a4;
      break;
    case 3:
      result = result - a4;
      break;
    default:
      return result;
  }
  return result;
}

double RPTCGRectGetMidpointAlongSide(uint64_t a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  double MidX;
  double MinX;
  CGRect v12;
  CGRect v13;
  CGRect v14;

  switch(a1)
  {
    case 0:
      MinX = CGRectGetMinX(*(CGRect *)&a2);
      goto LABEL_6;
    case 1:
      MidX = CGRectGetMidX(*(CGRect *)&a2);
      v12.origin.x = a2;
      v12.origin.y = a3;
      v12.size.width = a4;
      v12.size.height = a5;
      CGRectGetMinY(v12);
      return MidX;
    case 2:
      MinX = CGRectGetMaxX(*(CGRect *)&a2);
      goto LABEL_6;
    case 3:
      MidX = CGRectGetMidX(*(CGRect *)&a2);
      v14.origin.x = a2;
      v14.origin.y = a3;
      v14.size.width = a4;
      v14.size.height = a5;
      CGRectGetMaxY(v14);
      return MidX;
    case 4:
    case 5:
      MinX = CGRectGetMidX(*(CGRect *)&a2);
LABEL_6:
      MidX = MinX;
      v13.origin.x = a2;
      v13.origin.y = a3;
      v13.size.width = a4;
      v13.size.height = a5;
      CGRectGetMidY(v13);
      break;
    default:
      return MidX;
  }
  return MidX;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_1B177E7DC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1B177E92C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B177EACC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_1B177FA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

id makeRCPPlayerPlaybackOptions()
{
  id v0;
  NSObject *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v0 = objc_alloc_init((Class)getRCPPlayerPlaybackOptionsClass());
  if (_RPTTestRunnerEnableEventDeliverySync_onceToken != -1)
    dispatch_once(&_RPTTestRunnerEnableEventDeliverySync_onceToken, &__block_literal_global_4);
  objc_msgSend(v0, "setLinkEventDeliveryToDisplayRefreshRate:", _RPTTestRunnerEnableEventDeliverySync_enable);
  RPTLogTestRunning();
  v1 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("playbackSpeedFactor"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("minDelayBetweenSends"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("useVirtualHIDServices"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("useHIDEventTimestampsForDelivery"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("ignoreSenderProperties"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "valueForKeyPath:", CFSTR("transform"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138544642;
    v10 = v2;
    v11 = 2114;
    v12 = v3;
    v13 = 2114;
    v14 = v4;
    v15 = 2114;
    v16 = v5;
    v17 = 2114;
    v18 = v6;
    v19 = 2114;
    v20 = v7;
    _os_log_impl(&dword_1B1773000, v1, OS_LOG_TYPE_DEFAULT, "RPT: Make RCPPlayerPlaybackOptions\n\tplaybackSpeedFactor: %{public}@\n\tminDelayBetweenSends: %{public}@\n\tuseVirtualHIDServices: %{public}@\n\tuseHIDEventTimestampsForDelivery: %{public}@\n\tignoreSenderProperties: %{public}@transform: %{public}@", (uint8_t *)&v9, 0x3Eu);

  }
  return v0;
}

uint64_t __getRCPInlinePlayerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRCPEventStreamClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPEventStreamClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getRCPSyntheticEventStreamClass_block_invoke_cold_1();
}

uint64_t __getRCPSyntheticEventStreamClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getRCPPlayerPlaybackOptionsClass_block_invoke_cold_1()
{
  abort_report_np();
  return __getRCPEventSenderPropertiesClass_block_invoke_cold_1();
}

uint64_t __getRCPEventSenderPropertiesClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[RPTPagingScrollViewTestParameters initWithTestName:scrollBounds:scrollContentLength:direction:completionHandler:].cold.1(v0);
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D580]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D588]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5A8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5B0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5C8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x1E0C9D5D0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D5E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D5F8]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0CEA108]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0CEA110]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void operator delete(void *__p)
{
  off_1E635CE38(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E635CE40(__sz);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x1E0C849D8]();
}

