void sub_1CFE32B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE33990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE39E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
  _Block_object_dispose(&a33, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE3CF00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id location;
  id *v66;

  objc_destroyWeak(v66);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double _avoidanceFrameInLocalCoordinateSpace(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGAffineTransform v13;
  CGAffineTransform v14;
  CGAffineTransform v15;
  CGRect v16;

  v1 = a1;
  objc_msgSend(v1, "statusBar");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "statusBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "avoidanceFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  memset(&v15, 0, sizeof(v15));
  if (v2)
    objc_msgSend(v2, "_effectiveScaleTransform");
  v14 = v15;
  if (!CGAffineTransformIsIdentity(&v14))
  {
    v13 = v15;
    CGAffineTransformInvert(&v14, &v13);
    v15 = v14;
    v16.origin.x = v5;
    v16.origin.y = v7;
    v16.size.width = v9;
    v16.size.height = v11;
    *(_QWORD *)&v5 = (unint64_t)CGRectApplyAffineTransform(v16, &v14);
  }

  return v5;
}

void sub_1CFE3E31C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE409DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

void *STUIStatusBarGetPriorityComparator()
{
  if (STUIStatusBarGetPriorityComparator_onceToken != -1)
    dispatch_once(&STUIStatusBarGetPriorityComparator_onceToken, &__block_literal_global_14);
  return _Block_copy((const void *)STUIStatusBarGetPriorityComparator_priorityComparator);
}

id STUIStatusBarGetVisualProviderClassForScreen(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  int v6;
  void *NativeVisualProviderClassForScreenWithVisualProviderInfo;
  void *v8;
  void *v9;
  NSString *v10;
  Class v11;
  objc_class *Superclass;
  CGFloat Width;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  id v20;
  uint8_t buf[4];
  NSString *v23;
  uint64_t v24;
  CGRect v25;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "_isEmbeddedScreen");
  v6 = v5;
  if (v5)
  {
    NativeVisualProviderClassForScreenWithVisualProviderInfo = (void *)STUIStatusBarMainVisualProviderClass;
    if (STUIStatusBarMainVisualProviderClass)
      goto LABEL_18;
  }
  if (v5)
  {
    +[STUIStatusBarSettingsDomain rootSettings](STUIStatusBarSettingsDomain, "rootSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "visualProviderSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "visualProviderClassName");
    v10 = (NSString *)objc_claimAutoreleasedReturnValue();

    if (-[NSString length](v10, "length"))
    {
      v11 = NSClassFromString(v10);
      if (v11)
      {
        NativeVisualProviderClassForScreenWithVisualProviderInfo = v11;
        Superclass = v11;
        while (!class_conformsToProtocol(Superclass, (Protocol *)&unk_1EFC159B0))
        {
          Superclass = class_getSuperclass(Superclass);
          if (!Superclass)
            goto LABEL_9;
        }
        NSLog(CFSTR("WARNING: Using overridden status bar visual provider class: %@"), NativeVisualProviderClassForScreenWithVisualProviderInfo);
        goto LABEL_15;
      }
    }
LABEL_9:

  }
  NativeVisualProviderClassForScreenWithVisualProviderInfo = STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo(v3, v4);
  if (NativeVisualProviderClassForScreenWithVisualProviderInfo)
    goto LABEL_16;
  objc_msgSend(v3, "_unjailedReferenceBounds");
  Width = CGRectGetWidth(v25);
  objc_msgSend(v3, "_nativeScale");
  v15 = v14;
  objc_msgSend(v3, "traitCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  objc_msgSend(v3, "_displayCornerRadius");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No status bar visual provider for screen %@ (width: %.2f, scale: %.2f, idiom: %ld, cornerRadius: %.2f). Please see rdar://45025538."), v3, *(_QWORD *)&Width, v15, v17, v18);
  v10 = (NSString *)objc_claimAutoreleasedReturnValue();
  _STUIStatusBar_Log();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v10;
    _os_log_impl(&dword_1CFE2E000, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
  }

  NativeVisualProviderClassForScreenWithVisualProviderInfo = (void *)objc_opt_class();
LABEL_15:

LABEL_16:
  if (v6)
    STUIStatusBarMainVisualProviderClass = (uint64_t)NativeVisualProviderClassForScreenWithVisualProviderInfo;
LABEL_18:
  v20 = NativeVisualProviderClassForScreenWithVisualProviderInfo;

  return v20;
}

uint64_t _updateSquishyRegionForDynamicValues(void *a1, uint64_t a2, double a3)
{
  id v5;
  double v6;
  uint64_t v7;

  v5 = a1;
  if (objc_msgSend(v5, "maxNumberOfVisibleItems") == a2
    && (objc_msgSend(v5, "itemDynamicScale"), vabdd_f64(a3, v6) <= 0.0001))
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "setMaxNumberOfVisibleItems:", a2);
    objc_msgSend(v5, "setItemDynamicScale:", a3);
    v7 = 1;
  }

  return v7;
}

id STUIStatusBarAddLumaView(void *a1, void *a2, void *a3, uint64_t a4, double a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;

  v9 = a1;
  v10 = a2;
  v11 = a3;
  v12 = objc_alloc(MEMORY[0x1E0DC4280]);
  v13 = (void *)objc_msgSend(v12, "initWithTransitionBoundaries:delegate:frame:", 0, 0.4, 0.7, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v13, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  if (a4 == 2)
  {
    objc_msgSend(v13, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v15 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (a4 == 1)
    {
      objc_msgSend(v13, "leadingAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "leadingAnchor");
    }
    else
    {
      objc_msgSend(v13, "centerXAnchor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "centerXAnchor");
    }
    v15 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v15;
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v17);

  objc_msgSend(v13, "topAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToAnchor:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v20);

  objc_msgSend(v13, "centerYAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "centerYAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintEqualToAnchor:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v24) = 1144750080;
  objc_msgSend(v23, "setPriority:", v24);
  objc_msgSend(v10, "addObject:", v23);
  objc_msgSend(v13, "layer");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v26 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v25, "scale");
    v28 = v27;
    objc_msgSend(v9, "_currentScreenScale");
    if (v29 > 0.0)
    {
      v30 = v29;
      if (v28 * (v29 * a5) < 32.0)
      {
        objc_msgSend(v25, "setScale:", 1.0);
        v26 = 32.0 / v30;
      }
    }
  }
  objc_msgSend(v13, "widthAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = v31;
  if (v26 >= a5)
    a5 = v26;
  objc_msgSend(v31, "constraintEqualToConstant:", a5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v33);

  objc_msgSend(v13, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "constraintEqualToConstant:", a5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObject:", v35);

  objc_msgSend(v9, "insertSubview:atIndex:", v13, 0);
  return v13;
}

void sub_1CFE48160(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE4C8E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE4CC78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE4CE78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void scaleForWidth(void *a1)
{
  void *v1;

  objc_msgSend(a1, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "doubleValue");

}

void sub_1CFE4DC84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 208), 8);
  _Unwind_Resume(a1);
}

uint64_t numberOfItemsForWidth(void *a1, double a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  double v6;
  double v7;

  v3 = a1;
  if (objc_msgSend(v3, "count"))
  {
    v4 = 0;
    while (1)
    {
      objc_msgSend(v3, "objectAtIndexedSubscript:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "doubleValue");
      v7 = v6 * 0.846;

      if (v7 >= a2)
        break;
      if (++v4 >= (unint64_t)objc_msgSend(v3, "count"))
        goto LABEL_5;
    }
  }
  else
  {
LABEL_5:
    v4 = objc_msgSend(v3, "count");
  }

  return v4;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1CFE50CC0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 96));
  _Unwind_Resume(a1);
}

void sub_1CFE50E20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE51660(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30)
{
  uint64_t v30;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose((const void *)(v30 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1CFE52190(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void STUIStatusBarDynamicSplitPerformBaseAnimation(void *a1, int a2, char a3, int a4, void *a5, double a6, double a7, double a8)
{
  id v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  id v30;
  _QWORD v32[4];
  id v33;
  double v34;
  char v35;
  char v36;

  v14 = a1;
  v15 = (void *)MEMORY[0x1E0CD2710];
  v16 = a5;
  objc_msgSend(v15, "animationWithKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "presentationLayer");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "valueForKeyPath:", CFSTR("filters.gaussianBlur.inputRadius"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (a2)
  {
    if (v21)
      v22 = v21;
    else
      v22 = &unk_1E8D80520;
    v23 = &unk_1E8D80530;
  }
  else if (v21)
  {
    objc_msgSend(v21, "doubleValue");
    if (v24 == 0.0)
      v22 = &unk_1E8D80530;
    else
      v22 = v21;
    v23 = &unk_1E8D80520;
  }
  else
  {
    v23 = &unk_1E8D80520;
    v22 = &unk_1E8D80530;
  }
  objc_msgSend(v17, "setFromValue:", v22);
  objc_msgSend(v17, "setToValue:", v23);
  objc_msgSend(v17, "setDuration:", a7);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3048]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setTimingFunction:", v25);

  objc_msgSend(v17, "setBeginTimeMode:", CFSTR("relative"));
  objc_msgSend(v17, "setBeginTime:", a8);
  objc_msgSend(v14, "view");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "layer");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "addAnimation:forKey:", v17, CFSTR("blur"));

  if (a4)
    v28 = 4;
  else
    v28 = 0;
  v29 = (void *)MEMORY[0x1E0DC3F10];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __STUIStatusBarDynamicSplitPerformBaseAnimation_block_invoke;
  v32[3] = &unk_1E8D63368;
  v35 = a2;
  v36 = a3;
  v33 = v14;
  v34 = a6;
  v30 = v14;
  objc_msgSend(v29, "animateWithDuration:delay:options:animations:completion:", v28, v32, v16, a7, a8);

}

id _STUIStatusBar_Log()
{
  if (_STUIStatusBar_Log_onceToken != -1)
    dispatch_once(&_STUIStatusBar_Log_onceToken, &__block_literal_global_6);
  return (id)_STUIStatusBar_Log___StatusBar_LOG;
}

void sub_1CFE53710(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE54BAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,char a42)
{
  _Block_object_dispose(&a42, 8);
  _Unwind_Resume(a1);
}

id STUIStatusBarDefaultRepositionAnimation(void *a1, void *a2, void *a3, double a4, double a5)
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[6];

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __STUIStatusBarDefaultRepositionAnimation_block_invoke;
  v13[3] = &__block_descriptor_48_e24_v24__0___v___8___v__B_16l;
  *(double *)&v13[4] = a4;
  *(double *)&v13[5] = a5;
  v7 = a3;
  v8 = a2;
  v9 = a1;
  v10 = _Block_copy(v13);
  STUIStatusBarInternalRepositionAnimation(v9, 1, v10, v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id STUIStatusBarInternalRepositionAnimation(void *a1, char a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD *v23;
  char v24;
  _QWORD v25[4];
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[5];
  id v30;

  v9 = a1;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x3032000000;
  v29[3] = __Block_byref_object_copy__3;
  v29[4] = __Block_byref_object_dispose__3;
  v30 = 0;
  v13 = MEMORY[0x1E0C809B0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke;
  v25[3] = &unk_1E8D63660;
  v14 = v11;
  v26 = v14;
  v28 = v29;
  v15 = v10;
  v27 = v15;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v25);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v13;
  v20[1] = 3221225472;
  v20[2] = __STUIStatusBarInternalRepositionAnimation_block_invoke_5;
  v20[3] = &unk_1E8D63688;
  v17 = v9;
  v24 = a2;
  v21 = v17;
  v23 = v29;
  v18 = v12;
  v22 = v18;
  objc_msgSend(v16, "setPrepareBlock:", v20);

  _Block_object_dispose(v29, 8);
  return v16;
}

void sub_1CFE57D1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STUIStatusBarDynamicSplitDefaultAnimation(void *a1, void *a2)
{
  id v3;
  id v4;
  __int128 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[5];
  _QWORD v13[5];
  _QWORD v14[6];
  _QWORD v15[4];
  __int128 v16;
  __int128 v17;
  _QWORD v18[5];
  id v19;

  v3 = a1;
  v4 = a2;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x3032000000;
  v18[3] = __Block_byref_object_copy__2;
  v18[4] = __Block_byref_object_dispose__2;
  v19 = 0;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x4010000000;
  v15[3] = "";
  v5 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v16 = *MEMORY[0x1E0C9D648];
  v17 = v5;
  v6 = MEMORY[0x1E0C809B0];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke;
  v14[3] = &unk_1E8D62AA8;
  v14[4] = v18;
  v14[5] = v15;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v14);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v6;
  v13[1] = 3221225472;
  v13[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_2;
  v13[3] = &unk_1E8D631A8;
  v13[4] = v15;
  objc_msgSend(v7, "setPrepareBlock:", v13);
  objc_msgSend(v7, "setDelaysAnimatingItems:", 1);
  v12[0] = v6;
  v12[1] = 3221225472;
  v12[2] = __STUIStatusBarDynamicSplitDefaultAnimation_block_invoke_3;
  v12[3] = &unk_1E8D63390;
  v12[4] = v18;
  STUIStatusBarAddDefaultAnimationReposition(v3, v7, v4, v12);
  v8 = (void *)MEMORY[0x1E0C99E60];
  objc_msgSend(v3, "orderedDisplayItemPlacementsInRegionWithIdentifier:", CFSTR("systemUpdates"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWithArray:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDelayedDisplayItemPlacements:", v10);

  objc_msgSend(v7, "setPriority:", -100);
  _Block_object_dispose(v15, 8);
  _Block_object_dispose(v18, 8);

  return v7;
}

void sub_1CFE57F14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  uint64_t v17;
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v17 - 112), 8);
  _Unwind_Resume(a1);
}

void STUIStatusBarAddDefaultAnimationReposition(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id obj;
  void *v27;
  id v28;
  id v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v7 = a1;
  v29 = a2;
  v8 = a3;
  v28 = a4;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "statusBar");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v8;
  objc_msgSend(v9, "stateForDisplayItemWithIdentifier:", v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "potentialPlacementRegionIdentifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v12;
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v36;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v36 != v15)
          objc_enumerationMutation(obj);
        v17 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v16);
        objc_msgSend(v7, "statusBar");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "regions");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKeyedSubscript:", v17);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        STUIStatusBarDefaultRepositionAnimation(v20, v28, 0, 100.0, 20.0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setIdentifier:", CFSTR("defaultAnimationReposition"));
        objc_msgSend(v21, "setPriority:", -200);
        objc_msgSend(v7, "statusBar");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v39, 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "displayItemIdentifiersInRegionsWithIdentifiers:", v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = MEMORY[0x1E0C809B0];
        v30[1] = 3221225472;
        v30[2] = __STUIStatusBarAddDefaultAnimationReposition_block_invoke;
        v30[3] = &unk_1E8D635C0;
        v31 = v10;
        v32 = v27;
        v33 = v29;
        v34 = v21;
        v25 = v21;
        objc_msgSend(v24, "enumerateObjectsUsingBlock:", v30);

        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v14);
  }

}

void sub_1CFE58FAC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE59680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  id a66;

  _Block_object_dispose(&a57, 8);
  objc_destroyWeak(location);
  objc_destroyWeak(&a66);
  _Unwind_Resume(a1);
}

uint64_t STUIStyleOverridesForBackgroundActivityIdentifiers(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v9;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v1);
        v4 |= STUIStyleOverrideForBackgroundActivityIdentifier(*(void **)(*((_QWORD *)&v8 + 1) + 8 * i));
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17DE4AC]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1CFE5A59C(uint64_t a1)
{
  swift_retain();
  return a1;
}

uint64_t sub_1CFE5A5C4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  __int128 v6;
  char v7;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB50);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v6 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = *(_OWORD *)(v0 + 40);
  v7 = *(_BYTE *)(v0 + 56);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB48);
  sub_1CFEB3BD4();
  swift_retain();
  swift_retain();
  *(_QWORD *)v3 = sub_1CFEB39AC();
  *((_QWORD *)v3 + 1) = 0;
  v3[16] = 1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB58);
  sub_1CFE5AB5C((uint64_t *)v0, (uint64_t)&v3[*(int *)(v4 + 44)]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB60);
  sub_1CFE66DB4(&qword_1EFBFEB68, &qword_1EFBFEB50, MEMORY[0x1E0CDFB10]);
  sub_1CFE5AF70();
  sub_1CFE66DB4(&qword_1EFBFEB78, &qword_1EFBFEB60, MEMORY[0x1E0CE0680]);
  sub_1CFEB3B8C();
  swift_release();
  return swift_release();
}

uint64_t sub_1CFE5A758@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;

  sub_1CFEB39E8();
  v2 = sub_1CFEB3A84();
  v22 = v4;
  v23 = v3;
  v6 = v5 & 1;
  sub_1CFEB39E8();
  v7 = sub_1CFEB3A84();
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  sub_1CFEB39E8();
  v14 = sub_1CFEB3A84();
  v16 = v15;
  v17 = v2;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v23;
  LOBYTE(v2) = v18 & 1;
  *(_BYTE *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v22;
  *(_WORD *)(a1 + 32) = 0;
  *(_QWORD *)(a1 + 40) = v7;
  *(_QWORD *)(a1 + 48) = v9;
  *(_BYTE *)(a1 + 56) = v13;
  *(_QWORD *)(a1 + 64) = v11;
  *(_WORD *)(a1 + 72) = 257;
  *(_QWORD *)(a1 + 80) = v14;
  *(_QWORD *)(a1 + 88) = v15;
  *(_BYTE *)(a1 + 96) = v18 & 1;
  *(_QWORD *)(a1 + 104) = v19;
  *(_WORD *)(a1 + 112) = 514;
  v20 = v17;
  sub_1CFE66B44(v17, v23, v6);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v14, v16, v2);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v14, v16, v2);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v20, v23, v6);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5A930@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  void (*v6)(uint64_t, uint64_t, uint64_t);
  int *v7;
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v4 = *a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE18);
  v6 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16);
  v6(a2, v4, v5);
  v7 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE80);
  v6(a2 + v7[12], a1[1], v5);
  v8 = a2 + v7[16];
  v9 = a1[2];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 16))(v8, v9, v10);
  v11 = a2 + v7[20];
  v12 = a1[3];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE08);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 16))(v11, v12, v13);
  v14 = a2 + v7[24];
  v15 = a1[4];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE00);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v14, v15, v16);
  v17 = a2 + v7[28];
  v18 = a1[5];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDF8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 16))(v17, v18, v19);
  v20 = a2 + v7[32];
  v21 = a1[6];
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v22 - 8) + 16))(v20, v21, v22);
  v23 = a2 + v7[36];
  v24 = a1[7];
  v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDE8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 16))(v23, v24, v25);
  v26 = a2 + v7[40];
  v27 = a1[8];
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDE0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v28 - 8) + 16))(v26, v27, v28);
  v29 = a2 + v7[44];
  v30 = a1[9];
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDD8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v31 - 8) + 16))(v29, v30, v31);
  v32 = a2 + v7[48];
  v33 = a1[10];
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDD0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 16))(v32, v33, v34);
}

uint64_t sub_1CFE5AB5C@<X0>(uint64_t *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  char v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47[8];
  _BYTE v48[16];
  _QWORD v49[2];
  uint64_t v50;

  v4 = sub_1CFEB3940();
  v39 = *(_QWORD *)(v4 - 8);
  v40 = v4;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v6 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0C0);
  v41 = *(_QWORD *)(v7 - 8);
  v42 = v7;
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v9 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0C8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v11 = (char *)&v35 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0D0);
  v43 = *(_QWORD *)(v12 - 8);
  ((void (*)(void))MEMORY[0x1E0C80A78])();
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0D8);
  v15 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v17 = (char *)&v35 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v35 - v18;
  sub_1CFE672B8((uint64_t)(a1 + 2), (uint64_t)v48, &qword_1EFBFF0E0);
  sub_1CFE672B8((uint64_t)v48, (uint64_t)v49, &qword_1EFBFF0E0);
  v44 = a2;
  if (v49[1]
    && (v37 = v49[0],
        sub_1CFE672B8((uint64_t)(a1 + 4), (uint64_t)v47, &qword_1EFBFF0F8),
        sub_1CFE672B8((uint64_t)v47, (uint64_t)&v50, &qword_1EFBFF0F8),
        v50))
  {
    v36 = v50;
    sub_1CFE67210((uint64_t)v48);
    sub_1CFE5A59C((uint64_t)v47);
    v45 = sub_1CFEB3B50();
    sub_1CFEB3934();
    sub_1CFEB3AB4();
    (*(void (**)(char *, uint64_t))(v39 + 8))(v6, v40);
    swift_release();
    v20 = sub_1CFEB3B2C();
    v22 = v41;
    v21 = v42;
    (*(void (**)(char *, char *, uint64_t))(v41 + 16))(v11, v9, v42);
    *(_QWORD *)&v11[*(int *)(v38 + 36)] = v20;
    (*(void (**)(char *, uint64_t))(v22 + 8))(v9, v21);
    sub_1CFE67238((uint64_t)v11, (uint64_t)v14, &qword_1EFBFF0C8);
    *(_QWORD *)&v14[*(int *)(v12 + 36)] = v36;
    sub_1CFE6727C((uint64_t)v11, &qword_1EFBFF0C8);
    sub_1CFE672B8((uint64_t)v14, (uint64_t)v19, &qword_1EFBFF0D0);
    v23 = 0;
  }
  else
  {
    v23 = 1;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v43 + 56))(v19, v23, 1, v12);
  v24 = a1[1];
  v45 = *a1;
  v46 = v24;
  sub_1CFE671CC();
  swift_bridgeObjectRetain();
  v25 = sub_1CFEB3A90();
  v27 = v26;
  v29 = v28;
  v31 = v30 & 1;
  sub_1CFE67238((uint64_t)v19, (uint64_t)v17, &qword_1EFBFF0D8);
  v32 = v44;
  sub_1CFE67238((uint64_t)v17, v44, &qword_1EFBFF0D8);
  v33 = v32 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0F0) + 48);
  *(_QWORD *)v33 = v25;
  *(_QWORD *)(v33 + 8) = v27;
  *(_BYTE *)(v33 + 16) = v31;
  *(_QWORD *)(v33 + 24) = v29;
  sub_1CFE66B44(v25, v27, v31);
  swift_bridgeObjectRetain();
  sub_1CFE6727C((uint64_t)v19, &qword_1EFBFF0D8);
  sub_1CFE66B54(v25, v27, v31);
  swift_bridgeObjectRelease();
  return sub_1CFE6727C((uint64_t)v17, &qword_1EFBFF0D8);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1D17DE4B8](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1CFE5AF70()
{
  unint64_t result;

  result = qword_1EFBFEB70;
  if (!qword_1EFBFEB70)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE660, &type metadata for StatusBarOverride);
    atomic_store(result, (unint64_t *)&qword_1EFBFEB70);
  }
  return result;
}

uint64_t sub_1CFE5AFBC()
{
  return sub_1CFEB3AC0();
}

uint64_t sub_1CFE5AFD4()
{
  return sub_1CFE5A5C4();
}

uint64_t sub_1CFE5B014@<X0>(_QWORD *a1@<X8>)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  uint64_t v12;
  __int128 v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  char v21;
  __int128 v22;
  __int128 v23;
  char v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  __int128 v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _QWORD *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[32];
  __int128 v53;
  __int128 v54;

  v2 = v1;
  v45 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB88);
  MEMORY[0x1E0C80A78](v3);
  v36 = (char *)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB90);
  v42 = *(_QWORD *)(v41 - 8);
  MEMORY[0x1E0C80A78](v41);
  v35 = (uint64_t)&v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB98);
  v7 = MEMORY[0x1E0C80A78](v6);
  v44 = (uint64_t)&v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v40 = (char *)&v34 - v9;
  v43 = sub_1CFEB3B20();
  v10 = v1[3];
  v48 = v1[2];
  v49 = v10;
  v50 = v1[4];
  v11 = v1[1];
  v46 = *v1;
  v47 = v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB80);
  sub_1CFEB3BD4();
  v13 = v51;
  v39 = v51;
  v14 = v52[0];
  v38 = *(_OWORD *)&v52[8];
  v15 = *(_QWORD *)&v52[24];
  v16 = *((_QWORD *)&v53 + 1);
  v37 = v53;
  v17 = v54;
  swift_getKeyPath();
  v51 = v13;
  v52[0] = v14;
  *(_OWORD *)&v52[8] = v38;
  *(_QWORD *)&v52[24] = v15;
  *(_QWORD *)&v53 = v37;
  v18 = v41;
  *((_QWORD *)&v53 + 1) = v16;
  v54 = v17;
  sub_1CFEB3BC8();
  v19 = (uint64_t)v40;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v20 = v46;
  v21 = v47;
  v22 = v2[3];
  *(_OWORD *)&v52[16] = v2[2];
  v53 = v22;
  v54 = v2[4];
  v23 = v2[1];
  v51 = *v2;
  *(_OWORD *)v52 = v23;
  MEMORY[0x1D17DDA74](&v46, v12);
  v24 = v46;
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v25 = 1;
  if (sub_1CFE6731C(v24, 1))
  {
    v26 = v36;
    sub_1CFE5B43C(v2, v36);
    v27 = sub_1CFEB3A60();
    v28 = v35;
    sub_1CFE67238((uint64_t)v26, v35, &qword_1EFBFEB88);
    v29 = v28 + *(int *)(v18 + 36);
    *(_BYTE *)v29 = v27;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(_BYTE *)(v29 + 40) = 1;
    sub_1CFE6727C((uint64_t)v26, &qword_1EFBFEB88);
    sub_1CFE672B8(v28, v19, &qword_1EFBFEB90);
    v25 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v42 + 56))(v19, v25, 1, v18);
  v30 = v44;
  sub_1CFE67238(v19, v44, &qword_1EFBFEB98);
  v31 = v45;
  *v45 = 0x656469727265764FLL;
  v31[1] = 0xE800000000000000;
  v31[2] = 0xD000000000000021;
  v31[3] = 0x80000001CFEC2B20;
  v31[4] = v43;
  *(_OWORD *)(v31 + 5) = v20;
  *((_BYTE *)v31 + 56) = v21;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBA0);
  sub_1CFE67238(v30, (uint64_t)v31 + *(int *)(v32 + 48), &qword_1EFBFEB98);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C(v19, &qword_1EFBFEB98);
  sub_1CFE6727C(v30, &qword_1EFBFEB98);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5B43C@<X0>(__int128 *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _OWORD *v45;
  __int128 v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t v51;
  int v52;
  char *v53;
  __int128 v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char *v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  char *v66;
  int v67;
  uint64_t v68;
  __int128 v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  char *v75;
  char *v76;
  void (*v77)(char *, char *, uint64_t);
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  void (*v81)(char *, char *, uint64_t);
  char *v82;
  char *v83;
  uint64_t v84;
  char *v85;
  int *v86;
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  void (*v89)(char *, uint64_t);
  __int128 v91;
  int v92;
  __int128 v93;
  uint64_t v94;
  void (*v95)(char *, char *, uint64_t);
  char *v96;
  uint64_t v97;
  __int128 v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char *v102;
  uint64_t v103;
  char *v104;
  char *v105;
  uint64_t v106;
  char *v107;
  char *v108;
  uint64_t v109;
  char *v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;

  v104 = a2;
  v103 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF080);
  v111 = *(_QWORD *)(v103 - 8);
  v3 = MEMORY[0x1E0C80A78](v103);
  v102 = (char *)&v91 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v110 = (char *)&v91 - v5;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA0);
  v6 = MEMORY[0x1E0C80A78](v100);
  v107 = (char *)&v91 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v114 = (uint64_t)&v91 - v8;
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC78);
  v99 = *(_QWORD *)(v106 - 8);
  MEMORY[0x1E0C80A78](v106);
  v105 = (char *)&v91 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF088);
  MEMORY[0x1E0C80A78](v97);
  v96 = (char *)&v91 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *(_QWORD *)&v98 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF090);
  v11 = MEMORY[0x1E0C80A78](v98);
  v112 = (uint64_t)&v91 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v115 = (uint64_t)&v91 - v13;
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF008);
  v109 = *(_QWORD *)(v101 - 8);
  v14 = MEMORY[0x1E0C80A78](v101);
  v108 = (char *)&v91 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v113 = (char *)&v91 - v16;
  v17 = sub_1CFEB39E8();
  v94 = v18;
  v95 = (void (*)(char *, char *, uint64_t))v17;
  v92 = v19;
  *(_QWORD *)&v93 = v20;
  v21 = a1[1];
  v22 = a1[3];
  v135 = a1[2];
  v136 = v22;
  v23 = a1[3];
  v137 = a1[4];
  v24 = a1[1];
  v133 = *a1;
  v134 = v24;
  v119 = v135;
  v120 = v23;
  v121 = a1[4];
  v117 = v133;
  v118 = v21;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEB80);
  sub_1CFEB3BD4();
  v25 = v122;
  LOBYTE(a1) = v123;
  v91 = v124;
  v26 = v125;
  v27 = v126;
  v29 = v127;
  v28 = v128;
  v30 = v129;
  swift_getKeyPath();
  v122 = v25;
  LOBYTE(v123) = (_BYTE)a1;
  v124 = v91;
  v125 = v26;
  v126 = v27;
  v127 = v29;
  v128 = v28;
  v129 = v30;
  sub_1CFEB3BC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v122 = v117;
  v123 = v118;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF010);
  sub_1CFE66C48();
  sub_1CFEB3B98();
  v31 = sub_1CFEB39E8();
  v94 = v32;
  v95 = (void (*)(char *, char *, uint64_t))v31;
  v92 = v33;
  *(_QWORD *)&v93 = v34;
  v119 = v135;
  v120 = v136;
  v121 = v137;
  v117 = v133;
  v118 = v134;
  sub_1CFEB3BD4();
  v35 = v122;
  LOBYTE(a1) = v123;
  v91 = v124;
  v36 = v125;
  v37 = v126;
  v38 = v127;
  v39 = v128;
  v40 = v129;
  swift_getKeyPath();
  v122 = v35;
  LOBYTE(v123) = (_BYTE)a1;
  v124 = v91;
  v125 = v36;
  v126 = v37;
  v127 = v38;
  v128 = v39;
  v129 = v40;
  sub_1CFEB3BC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v41 = v105;
  sub_1CFEB3C28();
  sub_1CFEB3C1C();
  sub_1CFEB391C();
  v42 = v99;
  v95 = *(void (**)(char *, char *, uint64_t))(v99 + 16);
  v43 = (uint64_t)v96;
  v44 = v106;
  v95(v96, v41, v106);
  v45 = (_OWORD *)(v43 + *(int *)(v97 + 36));
  v46 = v131;
  *v45 = v130;
  v45[1] = v46;
  v45[2] = v132;
  v99 = *(_QWORD *)(v42 + 8);
  ((void (*)(char *, uint64_t))v99)(v41, v44);
  v47 = sub_1CFEB3A00();
  v48 = v112;
  sub_1CFE67238(v43, v112, &qword_1EFBFF088);
  v49 = (uint64_t *)(v48 + *(int *)(v98 + 36));
  *v49 = v47;
  v49[1] = (uint64_t)sub_1CFE67318;
  v49[2] = 0;
  sub_1CFE6727C(v43, &qword_1EFBFF088);
  sub_1CFE672B8(v48, v115, &qword_1EFBFF090);
  v50 = sub_1CFEB39E8();
  v97 = v51;
  *(_QWORD *)&v98 = v50;
  LODWORD(v94) = v52;
  v96 = v53;
  v119 = v135;
  v120 = v136;
  v121 = v137;
  v117 = v133;
  v118 = v134;
  sub_1CFEB3BD4();
  v54 = v122;
  LOBYTE(v47) = v123;
  v93 = v124;
  v55 = v125;
  v56 = v126;
  v58 = v127;
  v57 = v128;
  v59 = v129;
  swift_getKeyPath();
  v122 = v54;
  LOBYTE(v123) = v47;
  v124 = v93;
  v125 = v55;
  v126 = v56;
  v127 = v58;
  v128 = v57;
  v129 = v59;
  sub_1CFEB3BC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v60 = v105;
  sub_1CFEB3C28();
  v61 = sub_1CFEB3A00();
  v63 = v106;
  v62 = (uint64_t)v107;
  v95(v107, v60, v106);
  v64 = (uint64_t *)(v62 + *(int *)(v100 + 36));
  *v64 = v61;
  v64[1] = (uint64_t)sub_1CFE67318;
  v64[2] = 0;
  ((void (*)(char *, uint64_t))v99)(v60, v63);
  sub_1CFE672B8(v62, v114, &qword_1EFBFECA0);
  v65 = sub_1CFEB39E8();
  v105 = v66;
  v106 = v65;
  LODWORD(v99) = v67;
  v100 = v68;
  v119 = v135;
  v120 = v136;
  v121 = v137;
  v117 = v133;
  v118 = v134;
  sub_1CFEB3BD4();
  v69 = v122;
  LOBYTE(v61) = v123;
  v98 = v124;
  v70 = v125;
  v71 = v126;
  v73 = v127;
  v72 = v128;
  v74 = v129;
  swift_getKeyPath();
  v122 = v69;
  LOBYTE(v123) = v61;
  v124 = v98;
  v125 = v70;
  v126 = v71;
  v127 = v73;
  v128 = v72;
  v129 = v74;
  sub_1CFEB3BC8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v122 = v117;
  v123 = v118;
  type metadata accessor for STStatusBarDataCellularType(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF098);
  sub_1CFE663D8(&qword_1EFBFF0A0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarDataCellularType, (uint64_t)&unk_1CFEBDE5C);
  sub_1CFE66DB4(&qword_1EFBFF0A8, &qword_1EFBFF098, MEMORY[0x1E0CE0680]);
  v75 = v110;
  sub_1CFEB3B98();
  v76 = v108;
  v77 = *(void (**)(char *, char *, uint64_t))(v109 + 16);
  v78 = v101;
  v77(v108, v113, v101);
  v79 = v112;
  sub_1CFE67238(v115, v112, &qword_1EFBFF090);
  v80 = (uint64_t)v107;
  sub_1CFE67238(v114, (uint64_t)v107, &qword_1EFBFECA0);
  v81 = *(void (**)(char *, char *, uint64_t))(v111 + 16);
  v82 = v102;
  v83 = v75;
  v84 = v103;
  v81(v102, v83, v103);
  v85 = v104;
  v77(v104, v76, v78);
  v86 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0B0);
  sub_1CFE67238(v79, (uint64_t)&v85[v86[12]], &qword_1EFBFF090);
  v87 = v80;
  sub_1CFE67238(v80, (uint64_t)&v85[v86[16]], &qword_1EFBFECA0);
  v81(&v85[v86[20]], v82, v84);
  v88 = *(void (**)(char *, uint64_t))(v111 + 8);
  v88(v110, v84);
  sub_1CFE6727C(v114, &qword_1EFBFECA0);
  sub_1CFE6727C(v115, &qword_1EFBFF090);
  v89 = *(void (**)(char *, uint64_t))(v109 + 8);
  v89(v113, v78);
  v88(v82, v84);
  sub_1CFE6727C(v87, &qword_1EFBFECA0);
  sub_1CFE6727C(v112, &qword_1EFBFF090);
  return ((uint64_t (*)(char *, uint64_t))v89)(v108, v78);
}

uint64_t sub_1CFE5BE38()
{
  return sub_1CFE5E08C();
}

uint64_t sub_1CFE5BE4C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  int v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char v35;
  int v36;
  char v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  char v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  uint64_t v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  char v66;
  char v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  char v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  int v88;
  char v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  void (*v93)(char *, char *, uint64_t);
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  unsigned __int8 v98;
  char v99;
  char v100;
  uint64_t v101;
  _QWORD *v102;
  uint64_t v103;
  int *v104;
  uint64_t v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  _OWORD *v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  char *v122;
  char *v123;
  _OWORD *v124;
  uint64_t v125;
  uint64_t v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  void (*v136)(char *, uint64_t);
  int v138;
  int v139;
  uint64_t v140;
  uint64_t v141;
  _QWORD *v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  uint64_t v146;
  uint64_t v147;
  int v148;
  int v149;
  int v150;
  char *v151;
  char *v152;
  int v153;
  uint64_t v154;
  int v155;
  int v156;
  int v157;
  int v158;
  uint64_t v159;
  uint64_t v160;
  char *v161;
  uint64_t v162;
  int v163;
  char *v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  char *v171;
  char *v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  _DWORD v188[2];
  _DWORD v189[2];
  int v190;
  __int16 v191;
  _DWORD v192[2];
  _DWORD v193[2];
  int v194;
  __int16 v195;
  char v196[8];
  char v197[8];
  int v198;
  __int16 v199;
  char v200[8];
  char v201[8];
  _DWORD v202[2];
  _DWORD v203[2];
  int v204;
  __int16 v205;
  _DWORD v206[2];
  _DWORD v207[2];
  int v208;
  __int16 v209;
  _DWORD v210[2];
  _DWORD v211[2];
  int v212;
  __int16 v213;
  _DWORD v214[2];
  _DWORD v215[2];
  int v216;
  __int16 v217;
  _DWORD v218[2];
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  __int128 v226;
  __int128 v227;
  __int128 v228;
  __int128 v229;
  __int128 v230;
  __int128 v231;
  __int128 v232;
  _BYTE v233[26];
  char v234;
  char v235;
  unsigned __int8 v236;
  _DWORD v237[2];
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  __int128 v248;
  __int128 v249;
  __int128 v250;
  __int128 v251;
  _OWORD v252[2];
  _DWORD v253[2];
  _DWORD v254[2];
  int v255;
  __int16 v256;
  _DWORD v257[2];
  _DWORD v258[2];
  int v259;
  __int16 v260;
  _DWORD v261[2];
  _DWORD v262[2];
  int v263;
  __int16 v264;
  _DWORD v265[2];
  _DWORD v266[2];
  int v267;
  __int16 v268;
  _DWORD v269[2];
  _DWORD v270[2];
  _DWORD v271[2];
  char v272[8];
  int v273;
  __int16 v274;
  char v275[8];
  char v276[8];
  int v277;
  __int16 v278;
  _DWORD v279[2];
  _DWORD v280[2];
  int v281;
  __int16 v282;
  _DWORD v283[2];
  _DWORD v284[2];
  _OWORD v285[14];
  _OWORD v286[2];
  _QWORD v287[40];
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  _OWORD v302[2];
  _QWORD v303[2];
  char v304;
  _BYTE v305[7];
  uint64_t v306;
  uint64_t v307;
  char v308;
  _BYTE v309[7];
  uint64_t v310;
  __int16 v311;
  int v312;
  __int16 v313;
  uint64_t v314;
  uint64_t v315;
  char v316;
  _BYTE v317[7];
  uint64_t v318;
  uint64_t v319;
  char v320;
  _BYTE v321[7];
  uint64_t v322;
  __int16 v323;
  int v324;
  __int16 v325;
  uint64_t v326;
  uint64_t v327;
  char v328;
  _BYTE v329[7];
  uint64_t v330;
  uint64_t v331;
  char v332;
  _BYTE v333[7];
  uint64_t v334;
  __int16 v335;
  int v336;
  __int16 v337;
  uint64_t v338;
  uint64_t v339;
  char v340;
  _BYTE v341[7];
  uint64_t v342;
  uint64_t v343;
  char v344;
  _BYTE v345[7];
  uint64_t v346;
  __int16 v347;
  _QWORD v348[2];
  char v349;
  _BYTE v350[7];
  uint64_t v351;
  uint64_t v352;
  char v353;
  _BYTE v354[7];
  uint64_t v355;
  __int16 v356;
  int v357;
  __int16 v358;
  uint64_t v359;
  uint64_t v360;
  char v361;
  _BYTE v362[7];
  uint64_t v363;
  uint64_t v364;
  char v365;
  _BYTE v366[7];
  uint64_t v367;
  __int16 v368;
  int v369;
  __int16 v370;
  uint64_t v371;
  uint64_t v372;
  char v373;
  _BYTE v374[7];
  uint64_t v375;
  uint64_t v376;
  char v377;
  _BYTE v378[7];
  uint64_t v379;
  __int16 v380;
  int v381;
  __int16 v382;
  uint64_t v383;
  uint64_t v384;
  char v385;
  _BYTE v386[7];
  uint64_t v387;
  uint64_t v388;
  char v389;
  _BYTE v390[7];
  uint64_t v391;
  __int16 v392;
  int v393;
  __int16 v394;
  uint64_t v395;
  uint64_t v396;
  char v397;
  _BYTE v398[7];
  uint64_t v399;
  uint64_t v400;
  char v401;
  _BYTE v402[7];
  uint64_t v403;
  __int16 v404;
  _OWORD v405[14];
  _OWORD v406[4];

  v142 = a1;
  v140 = sub_1CFEB3BF8();
  v165 = *(_QWORD *)(v140 - 8);
  v1 = MEMORY[0x1E0C80A78](v140);
  v161 = (char *)&v138 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = MEMORY[0x1E0C80A78](v1);
  v152 = (char *)&v138 - v4;
  v5 = MEMORY[0x1E0C80A78](v3);
  v151 = (char *)&v138 - v6;
  v7 = MEMORY[0x1E0C80A78](v5);
  v172 = (char *)&v138 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v171 = (char *)&v138 - v10;
  MEMORY[0x1E0C80A78](v9);
  v164 = (char *)&v138 - v11;
  sub_1CFEB39E8();
  v160 = sub_1CFEB3A84();
  v141 = v12;
  v162 = v13;
  v163 = v14 & 1;
  sub_1CFEB3BEC();
  sub_1CFEB39E8();
  v15 = sub_1CFEB3A84();
  v176 = v16;
  v177 = v15;
  v17 = v16;
  v187 = v18;
  v20 = v19 & 1;
  sub_1CFEB39E8();
  v21 = sub_1CFEB3A84();
  v23 = v22;
  v186 = v24;
  v26 = v25 & 1;
  sub_1CFEB39E8();
  v184 = sub_1CFEB3A84();
  v185 = v27;
  v178 = v28;
  v30 = v29 & 1;
  sub_1CFEB39E8();
  v31 = sub_1CFEB3A84();
  v33 = v32;
  v175 = v34;
  v276[0] = v20;
  v275[0] = v26;
  v36 = v35 & 1;
  v272[0] = v30;
  LOBYTE(v348[0]) = v20;
  v37 = v20;
  LODWORD(v179) = v20;
  LOBYTE(v287[0]) = 0;
  LOBYTE(v405[0]) = 0;
  LOBYTE(v303[0]) = v26;
  LOBYTE(v20) = v26;
  LODWORD(v180) = v26;
  LOBYTE(v288) = 0;
  LOBYTE(v285[0]) = 0;
  LOBYTE(v238) = v30;
  LOBYTE(v26) = v30;
  LODWORD(v181) = v30;
  LOBYTE(v219) = 0;
  LOBYTE(v284[0]) = 0;
  LOBYTE(v283[0]) = v36;
  v38 = v36;
  LOBYTE(v280[0]) = 0;
  LOBYTE(v279[0]) = 0;
  sub_1CFE66B44(v15, v17, v37);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v21, v23, v20);
  swift_bridgeObjectRetain();
  v39 = v184;
  v40 = v178;
  sub_1CFE66B44(v184, v178, v26);
  swift_bridgeObjectRetain();
  v41 = v33;
  v183 = v33;
  LODWORD(v182) = v38;
  sub_1CFE66B44(v31, v33, v38);
  v42 = v175;
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v31, v41, v38);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v39, v40, v272[0]);
  swift_bridgeObjectRelease();
  v43 = v21;
  sub_1CFE66B54(v21, v23, v275[0]);
  v44 = v186;
  swift_bridgeObjectRelease();
  v46 = v176;
  v45 = v177;
  sub_1CFE66B54(v177, v176, v276[0]);
  v47 = v187;
  swift_bridgeObjectRelease();
  *(_QWORD *)&v238 = v45;
  *((_QWORD *)&v238 + 1) = v46;
  LOBYTE(v239) = v179;
  DWORD1(v239) = *(_DWORD *)((char *)v348 + 3);
  *(_DWORD *)((char *)&v239 + 1) = v348[0];
  *((_QWORD *)&v239 + 1) = v47;
  *(_QWORD *)&v240 = 1;
  BYTE8(v240) = 0;
  HIDWORD(v240) = *(_DWORD *)((char *)v287 + 3);
  *(_DWORD *)((char *)&v240 + 9) = v287[0];
  *(_QWORD *)&v241 = 1;
  WORD4(v241) = 0;
  HIWORD(v241) = v283[1];
  *(_DWORD *)((char *)&v241 + 10) = v283[0];
  *(_QWORD *)&v242 = v43;
  *((_QWORD *)&v242 + 1) = v23;
  LOBYTE(v243) = v180;
  DWORD1(v243) = *(_DWORD *)((char *)v405 + 3);
  *(_DWORD *)((char *)&v243 + 1) = v405[0];
  *((_QWORD *)&v243 + 1) = v44;
  *(_QWORD *)&v244 = 2;
  BYTE8(v244) = 0;
  HIDWORD(v244) = *(_DWORD *)((char *)v303 + 3);
  *(_DWORD *)((char *)&v244 + 9) = v303[0];
  *(_QWORD *)&v245 = 2;
  WORD4(v245) = 0;
  HIWORD(v245) = v280[1];
  *(_DWORD *)((char *)&v245 + 10) = v280[0];
  *(_QWORD *)&v246 = v184;
  *((_QWORD *)&v246 + 1) = v40;
  LOBYTE(v247) = v181;
  DWORD1(v247) = *(_DWORD *)((char *)&v288 + 3);
  *(_DWORD *)((char *)&v247 + 1) = v288;
  *((_QWORD *)&v247 + 1) = v185;
  *(_QWORD *)&v248 = 3;
  BYTE8(v248) = 0;
  HIDWORD(v248) = *(_DWORD *)((char *)v285 + 3);
  *(_DWORD *)((char *)&v248 + 9) = v285[0];
  *(_QWORD *)&v249 = 3;
  WORD4(v249) = 0;
  HIWORD(v249) = v279[1];
  *(_DWORD *)((char *)&v249 + 10) = v279[0];
  *(_QWORD *)&v250 = v31;
  *((_QWORD *)&v250 + 1) = v183;
  LOBYTE(v251) = v182;
  DWORD1(v251) = *(_DWORD *)((char *)&v219 + 3);
  *(_DWORD *)((char *)&v251 + 1) = v219;
  *((_QWORD *)&v251 + 1) = v42;
  *(_QWORD *)&v252[0] = 4;
  BYTE8(v252[0]) = 0;
  HIDWORD(v252[0]) = *(_DWORD *)((char *)v284 + 3);
  *(_DWORD *)((char *)v252 + 9) = v284[0];
  *(_QWORD *)&v252[1] = 4;
  WORD4(v252[1]) = 0;
  sub_1CFEB3BEC();
  sub_1CFEB39E8();
  v48 = sub_1CFEB3A84();
  v183 = v49;
  v184 = v48;
  v178 = v50;
  LODWORD(v40) = v51 & 1;
  sub_1CFEB39E8();
  v185 = sub_1CFEB3A84();
  v186 = v52;
  v54 = v53;
  LODWORD(v45) = v55 & 1;
  sub_1CFEB39E8();
  v174 = sub_1CFEB3A84();
  v175 = v56;
  v187 = v57;
  LODWORD(v42) = v58 & 1;
  sub_1CFEB39E8();
  v59 = sub_1CFEB3A84();
  v176 = v60;
  v177 = v61;
  LODWORD(v44) = v62 & 1;
  sub_1CFEB39E8();
  v63 = sub_1CFEB3A84();
  v179 = v64;
  v180 = v65;
  v201[0] = v40;
  v200[0] = v45;
  LODWORD(v46) = v66 & 1;
  v197[0] = v42;
  v196[0] = v44;
  LOBYTE(v266[0]) = v40;
  v67 = v40;
  v153 = v40;
  LOBYTE(v265[0]) = 0;
  LOBYTE(v262[0]) = 0;
  LOBYTE(v261[0]) = v45;
  v155 = v45;
  v156 = v42;
  LOBYTE(v258[0]) = 0;
  LOBYTE(v257[0]) = 0;
  LOBYTE(v254[0]) = v42;
  LOBYTE(v253[0]) = 0;
  LOBYTE(v214[0]) = 0;
  LOBYTE(v211[0]) = v44;
  LOBYTE(v40) = v44;
  v157 = v44;
  LOBYTE(v210[0]) = 0;
  LOBYTE(v207[0]) = 0;
  LOBYTE(v206[0]) = v46;
  LOBYTE(v203[0]) = 0;
  LOBYTE(v202[0]) = 0;
  *(_DWORD *)((char *)v284 + 3) = *(_DWORD *)((char *)v348 + 3);
  v284[0] = v348[0];
  LOWORD(v237[1]) = v271[1];
  v237[0] = v271[0];
  *(_DWORD *)((char *)v283 + 3) = *(_DWORD *)((char *)v287 + 3);
  v283[0] = v287[0];
  *(_DWORD *)((char *)v280 + 3) = *(_DWORD *)((char *)v405 + 3);
  v280[0] = v405[0];
  LOWORD(v218[1]) = v270[1];
  v218[0] = v270[0];
  *(_DWORD *)((char *)v279 + 3) = *(_DWORD *)((char *)v303 + 3);
  v279[0] = v303[0];
  *(_DWORD *)&v276[3] = *(_DWORD *)((char *)&v288 + 3);
  *(_DWORD *)v276 = v288;
  LOWORD(v215[1]) = v269[1];
  v215[0] = v269[0];
  *(_DWORD *)&v275[3] = *(_DWORD *)((char *)v285 + 3);
  *(_DWORD *)v275 = v285[0];
  *(_DWORD *)&v272[3] = *(_DWORD *)((char *)&v219 + 3);
  *(_DWORD *)v272 = v219;
  sub_1CFE66B44(v184, v183, v67);
  swift_bridgeObjectRetain();
  v173 = v54;
  sub_1CFE66B44(v185, v54, v45);
  swift_bridgeObjectRetain();
  v68 = v174;
  sub_1CFE66B44(v174, v187, v42);
  swift_bridgeObjectRetain();
  v154 = v59;
  v69 = v176;
  sub_1CFE66B44(v59, v176, v40);
  swift_bridgeObjectRetain();
  v159 = v63;
  v70 = v179;
  v158 = v46;
  sub_1CFE66B44(v63, v179, v46);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v63, v70, v46);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v59, v69, v196[0]);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v68, v187, v197[0]);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v185, v173, v200[0]);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v184, v183, v201[0]);
  swift_bridgeObjectRelease();
  *(_DWORD *)((char *)v270 + 3) = *(_DWORD *)((char *)v348 + 3);
  v270[0] = v348[0];
  *(_DWORD *)((char *)v269 + 3) = *(_DWORD *)((char *)v287 + 3);
  v269[0] = v287[0];
  v268 = WORD2(v303[0]);
  v267 = v303[0];
  *(_DWORD *)((char *)v266 + 3) = *(_DWORD *)((char *)v405 + 3);
  v266[0] = v405[0];
  *(_DWORD *)((char *)v265 + 3) = *(_DWORD *)((char *)v284 + 3);
  v265[0] = v284[0];
  v264 = v237[1];
  v263 = v237[0];
  *(_DWORD *)((char *)v262 + 3) = *(_DWORD *)((char *)v283 + 3);
  v262[0] = v283[0];
  *(_DWORD *)((char *)v261 + 3) = *(_DWORD *)((char *)v280 + 3);
  v261[0] = v280[0];
  v260 = v218[1];
  v259 = v218[0];
  *(_DWORD *)((char *)v258 + 3) = *(_DWORD *)((char *)v279 + 3);
  v258[0] = v279[0];
  *(_DWORD *)((char *)v257 + 3) = *(_DWORD *)&v276[3];
  v257[0] = *(_DWORD *)v276;
  v256 = v215[1];
  v255 = v215[0];
  *(_DWORD *)((char *)v254 + 3) = *(_DWORD *)&v275[3];
  v254[0] = *(_DWORD *)v275;
  *(_DWORD *)((char *)v253 + 3) = *(_DWORD *)&v272[3];
  v253[0] = *(_DWORD *)v272;
  sub_1CFEB3BEC();
  sub_1CFEB39E8();
  v181 = sub_1CFEB3A84();
  v182 = v71;
  v73 = v72;
  LODWORD(v40) = v74 & 1;
  sub_1CFEB39E8();
  v75 = sub_1CFEB3A84();
  v77 = v76;
  v79 = v78;
  LODWORD(v46) = v80 & 1;
  sub_1CFEB39E8();
  v81 = sub_1CFEB3A84();
  v169 = v82;
  v170 = v83;
  LODWORD(v59) = v84 & 1;
  sub_1CFEB39E8();
  v166 = sub_1CFEB3A84();
  v143 = v85;
  v144 = v86;
  v275[0] = v40;
  v272[0] = v46;
  v88 = v87 & 1;
  LOBYTE(v63) = v59;
  LOBYTE(v271[0]) = v59;
  LOBYTE(v348[0]) = v40;
  v89 = v40;
  v148 = v40;
  v149 = v46;
  LOBYTE(v287[0]) = 0;
  LOBYTE(v405[0]) = 0;
  LOBYTE(v303[0]) = v46;
  LOBYTE(v40) = v46;
  LOBYTE(v288) = 0;
  LOBYTE(v285[0]) = 0;
  LOBYTE(v219) = v59;
  v150 = v59;
  LOBYTE(v284[0]) = 0;
  LOBYTE(v283[0]) = 0;
  LOBYTE(v280[0]) = v88;
  LODWORD(v46) = v88;
  LOBYTE(v279[0]) = 0;
  v276[0] = 0;
  v167 = v73;
  sub_1CFE66B44(v181, v73, v89);
  swift_bridgeObjectRetain();
  v145 = v77;
  v146 = v75;
  sub_1CFE66B44(v75, v77, v40);
  v168 = v79;
  swift_bridgeObjectRetain();
  v147 = v81;
  v90 = v169;
  sub_1CFE66B44(v81, v169, v63);
  swift_bridgeObjectRetain();
  v91 = v166;
  v92 = v143;
  v139 = v46;
  sub_1CFE66B44(v166, v143, v46);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v91, v92, v46);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v81, v90, v271[0]);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v75, v77, v272[0]);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v181, v167, v275[0]);
  swift_bridgeObjectRelease();
  v284[0] = v348[0];
  *(_DWORD *)((char *)v284 + 3) = *(_DWORD *)((char *)v348 + 3);
  *(_DWORD *)((char *)v283 + 3) = *(_DWORD *)((char *)v287 + 3);
  v283[0] = v287[0];
  v282 = v218[1];
  v281 = v218[0];
  *(_DWORD *)((char *)v280 + 3) = *(_DWORD *)((char *)v405 + 3);
  v280[0] = v405[0];
  *(_DWORD *)((char *)v279 + 3) = *(_DWORD *)((char *)v303 + 3);
  v279[0] = v303[0];
  v278 = v215[1];
  v277 = v215[0];
  *(_DWORD *)&v276[3] = *(_DWORD *)((char *)&v288 + 3);
  *(_DWORD *)v276 = v288;
  *(_DWORD *)&v275[3] = *(_DWORD *)((char *)v285 + 3);
  *(_DWORD *)v275 = v285[0];
  v274 = v214[1];
  v273 = v214[0];
  *(_DWORD *)&v272[3] = *(_DWORD *)((char *)&v219 + 3);
  *(_DWORD *)v272 = v219;
  *(_DWORD *)((char *)v271 + 3) = *(_DWORD *)((char *)v237 + 3);
  v271[0] = v237[0];
  v236 = v163;
  v235 = 0;
  v234 = 0;
  v93 = *(void (**)(char *, char *, uint64_t))(v165 + 16);
  v94 = v151;
  v95 = v140;
  v93(v151, v164, v140);
  v231 = v250;
  v232 = v251;
  *(_OWORD *)v233 = v252[0];
  *(_OWORD *)&v233[10] = *(_OWORD *)((char *)v252 + 10);
  v227 = v246;
  v228 = v247;
  v229 = v248;
  v230 = v249;
  v223 = v242;
  v224 = v243;
  v225 = v244;
  v226 = v245;
  v219 = v238;
  v220 = v239;
  v221 = v240;
  v222 = v241;
  v96 = v152;
  v93(v152, v171, v95);
  v237[0] = v270[0];
  *(_DWORD *)((char *)v237 + 3) = *(_DWORD *)((char *)v270 + 3);
  *(_DWORD *)((char *)v218 + 3) = *(_DWORD *)((char *)v269 + 3);
  v218[0] = v269[0];
  v217 = v268;
  v216 = v267;
  *(_DWORD *)((char *)v215 + 3) = *(_DWORD *)((char *)v266 + 3);
  v215[0] = v266[0];
  *(_DWORD *)((char *)v214 + 3) = *(_DWORD *)((char *)v265 + 3);
  v214[0] = v265[0];
  v213 = v264;
  v212 = v263;
  *(_DWORD *)((char *)v211 + 3) = *(_DWORD *)((char *)v262 + 3);
  v211[0] = v262[0];
  *(_DWORD *)((char *)v210 + 3) = *(_DWORD *)((char *)v261 + 3);
  v210[0] = v261[0];
  v209 = v260;
  v208 = v259;
  *(_DWORD *)((char *)v207 + 3) = *(_DWORD *)((char *)v258 + 3);
  v207[0] = v258[0];
  *(_DWORD *)((char *)v206 + 3) = *(_DWORD *)((char *)v257 + 3);
  v206[0] = v257[0];
  v205 = v256;
  v204 = v255;
  *(_DWORD *)((char *)v203 + 3) = *(_DWORD *)((char *)v254 + 3);
  v203[0] = v254[0];
  *(_DWORD *)((char *)v202 + 3) = *(_DWORD *)((char *)v253 + 3);
  v202[0] = v253[0];
  v97 = v161;
  v93(v161, v172, v95);
  *(_DWORD *)v201 = v284[0];
  *(_DWORD *)&v201[3] = *(_DWORD *)((char *)v284 + 3);
  *(_DWORD *)v200 = v283[0];
  *(_DWORD *)&v200[3] = *(_DWORD *)((char *)v283 + 3);
  v199 = v282;
  v198 = v281;
  *(_DWORD *)&v197[3] = *(_DWORD *)((char *)v280 + 3);
  *(_DWORD *)v197 = v280[0];
  *(_DWORD *)&v196[3] = *(_DWORD *)((char *)v279 + 3);
  *(_DWORD *)v196 = v279[0];
  v195 = v278;
  v194 = v277;
  *(_DWORD *)((char *)v193 + 3) = *(_DWORD *)&v276[3];
  v193[0] = *(_DWORD *)v276;
  *(_DWORD *)((char *)v192 + 3) = *(_DWORD *)&v275[3];
  v192[0] = *(_DWORD *)v275;
  v191 = v274;
  v190 = v273;
  *(_DWORD *)((char *)v189 + 3) = *(_DWORD *)&v272[3];
  v189[0] = *(_DWORD *)v272;
  *(_DWORD *)((char *)v188 + 3) = *(_DWORD *)((char *)v271 + 3);
  v188[0] = v271[0];
  v98 = v236;
  v138 = v236;
  v99 = v235;
  v100 = v234;
  v101 = v160;
  v103 = v141;
  v102 = v142;
  *v142 = v160;
  v102[1] = v103;
  *((_BYTE *)v102 + 16) = v98;
  v102[3] = v162;
  v102[4] = 0;
  *((_BYTE *)v102 + 40) = v99;
  v102[6] = 0;
  *((_BYTE *)v102 + 56) = 0;
  *((_BYTE *)v102 + 57) = v100;
  v104 = (int *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF0B8);
  v93((char *)v102 + v104[12], v94, v95);
  v105 = v104[16];
  v106 = v232;
  v285[12] = v231;
  v285[13] = v232;
  v107 = *(_OWORD *)v233;
  v286[0] = *(_OWORD *)v233;
  *(_OWORD *)((char *)v286 + 10) = *(_OWORD *)&v233[10];
  v108 = v227;
  v109 = v228;
  v285[8] = v227;
  v285[9] = v228;
  v110 = v229;
  v111 = v230;
  v285[10] = v229;
  v285[11] = v230;
  v112 = v223;
  v113 = v224;
  v285[4] = v223;
  v285[5] = v224;
  v114 = v225;
  v115 = v226;
  v285[6] = v225;
  v285[7] = v226;
  v116 = v219;
  v117 = v220;
  v285[0] = v219;
  v285[1] = v220;
  v118 = (_OWORD *)((char *)v102 + v105);
  v118[12] = v231;
  v118[13] = v106;
  v118[14] = v107;
  *(_OWORD *)((char *)v118 + 234) = *(_OWORD *)&v233[10];
  v118[8] = v108;
  v118[9] = v109;
  v118[10] = v110;
  v118[11] = v111;
  v118[4] = v112;
  v118[5] = v113;
  v118[6] = v114;
  v118[7] = v115;
  *v118 = v116;
  v118[1] = v117;
  v119 = v221;
  v120 = v222;
  v121 = v222;
  v118[2] = v221;
  v118[3] = v121;
  v122 = (char *)v102 + v104[20];
  v285[2] = v119;
  v285[3] = v120;
  v93(v122, v96, v95);
  v123 = (char *)v102 + v104[24];
  v287[0] = v184;
  v287[1] = v183;
  LOBYTE(v287[2]) = v153;
  *(_DWORD *)((char *)&v287[2] + 1) = v237[0];
  HIDWORD(v287[2]) = *(_DWORD *)((char *)v237 + 3);
  v287[3] = v178;
  v287[4] = 5;
  LOBYTE(v287[5]) = 0;
  *(_DWORD *)((char *)&v287[5] + 1) = v218[0];
  HIDWORD(v287[5]) = *(_DWORD *)((char *)v218 + 3);
  v287[6] = 5;
  LOWORD(v287[7]) = 0;
  HIWORD(v287[7]) = v217;
  *(_DWORD *)((char *)&v287[7] + 2) = v216;
  v287[8] = v185;
  v287[9] = v173;
  LOBYTE(v287[10]) = v155;
  HIDWORD(v287[10]) = *(_DWORD *)((char *)v215 + 3);
  *(_DWORD *)((char *)&v287[10] + 1) = v215[0];
  v287[11] = v186;
  v287[12] = 6;
  LOBYTE(v287[13]) = 0;
  HIDWORD(v287[13]) = *(_DWORD *)((char *)v214 + 3);
  *(_DWORD *)((char *)&v287[13] + 1) = v214[0];
  v287[14] = 6;
  LOWORD(v287[15]) = 0;
  HIWORD(v287[15]) = v213;
  *(_DWORD *)((char *)&v287[15] + 2) = v212;
  v287[16] = v174;
  v287[17] = v187;
  LOBYTE(v287[18]) = v156;
  *(_DWORD *)((char *)&v287[18] + 1) = v211[0];
  HIDWORD(v287[18]) = *(_DWORD *)((char *)v211 + 3);
  *(_DWORD *)((char *)&v287[34] + 1) = v203[0];
  v287[19] = v175;
  v287[20] = 7;
  LOBYTE(v287[21]) = 0;
  HIDWORD(v287[21]) = *(_DWORD *)((char *)v210 + 3);
  *(_DWORD *)((char *)&v287[21] + 1) = v210[0];
  v287[22] = 7;
  LOWORD(v287[23]) = 0;
  HIWORD(v287[23]) = v209;
  *(_DWORD *)((char *)&v287[23] + 2) = v208;
  v287[24] = v154;
  v287[25] = v176;
  LOBYTE(v287[26]) = v157;
  HIDWORD(v287[26]) = *(_DWORD *)((char *)v207 + 3);
  *(_DWORD *)((char *)&v287[26] + 1) = v207[0];
  *(_DWORD *)((char *)&v287[29] + 1) = v206[0];
  *(_DWORD *)((char *)&v287[31] + 2) = v204;
  *(_DWORD *)((char *)&v287[37] + 1) = v202[0];
  v287[27] = v177;
  v287[28] = 8;
  LOBYTE(v287[29]) = 0;
  HIDWORD(v287[29]) = *(_DWORD *)((char *)v206 + 3);
  v287[30] = 8;
  LOWORD(v287[31]) = 0;
  HIWORD(v287[31]) = v205;
  v287[32] = v159;
  v287[33] = v179;
  LOBYTE(v287[34]) = v158;
  HIDWORD(v287[34]) = *(_DWORD *)((char *)v203 + 3);
  HIDWORD(v287[37]) = *(_DWORD *)((char *)v202 + 3);
  v287[35] = v180;
  v287[36] = 9;
  LOBYTE(v287[37]) = 0;
  v287[38] = 9;
  LOWORD(v287[39]) = 0;
  memcpy(v123, v287, 0x13AuLL);
  v93((char *)v102 + v104[28], v97, v95);
  v124 = (_OWORD *)((char *)v102 + v104[32]);
  *(_QWORD *)&v288 = v181;
  *((_QWORD *)&v288 + 1) = v167;
  LOBYTE(v289) = v148;
  *(_DWORD *)((char *)&v289 + 1) = *(_DWORD *)v201;
  DWORD1(v289) = *(_DWORD *)&v201[3];
  *((_QWORD *)&v289 + 1) = v182;
  *(_QWORD *)&v290 = 10;
  BYTE8(v290) = 0;
  *(_DWORD *)((char *)&v290 + 9) = *(_DWORD *)v200;
  HIDWORD(v290) = *(_DWORD *)&v200[3];
  *(_QWORD *)&v291 = 10;
  WORD4(v291) = 0;
  HIWORD(v291) = v199;
  *(_DWORD *)((char *)&v291 + 10) = v198;
  *(_QWORD *)&v292 = v146;
  *((_QWORD *)&v292 + 1) = v145;
  LOBYTE(v293) = v149;
  DWORD1(v293) = *(_DWORD *)&v197[3];
  *(_DWORD *)((char *)&v293 + 1) = *(_DWORD *)v197;
  *((_QWORD *)&v293 + 1) = v168;
  *(_QWORD *)&v294 = 11;
  BYTE8(v294) = 0;
  HIDWORD(v294) = *(_DWORD *)&v196[3];
  *(_DWORD *)((char *)&v294 + 9) = *(_DWORD *)v196;
  *(_QWORD *)&v295 = 11;
  WORD4(v295) = 0;
  HIWORD(v295) = v195;
  *(_DWORD *)((char *)&v295 + 10) = v194;
  *(_QWORD *)&v296 = v147;
  *((_QWORD *)&v296 + 1) = v169;
  LOBYTE(v297) = v150;
  *(_DWORD *)((char *)&v297 + 1) = v193[0];
  DWORD1(v297) = *(_DWORD *)((char *)v193 + 3);
  *((_QWORD *)&v297 + 1) = v170;
  *(_QWORD *)&v298 = 12;
  BYTE8(v298) = 0;
  HIDWORD(v298) = *(_DWORD *)((char *)v192 + 3);
  *(_DWORD *)((char *)&v298 + 9) = v192[0];
  *(_QWORD *)&v299 = 12;
  WORD4(v299) = 0;
  HIWORD(v299) = v191;
  *(_DWORD *)((char *)&v299 + 10) = v190;
  *(_QWORD *)&v300 = v166;
  v126 = v143;
  v125 = v144;
  *((_QWORD *)&v300 + 1) = v143;
  LOBYTE(v102) = v139;
  LOBYTE(v301) = v139;
  *(_DWORD *)((char *)&v301 + 1) = v189[0];
  DWORD1(v301) = *(_DWORD *)((char *)v189 + 3);
  *((_QWORD *)&v301 + 1) = v144;
  *(_QWORD *)&v302[0] = 13;
  BYTE8(v302[0]) = 0;
  HIDWORD(v302[0]) = *(_DWORD *)((char *)v188 + 3);
  *(_DWORD *)((char *)v302 + 9) = v188[0];
  *(_QWORD *)&v302[1] = 13;
  WORD4(v302[1]) = 0;
  v127 = v297;
  v124[8] = v296;
  v124[9] = v127;
  v128 = v299;
  v124[10] = v298;
  v124[11] = v128;
  v129 = v293;
  v124[4] = v292;
  v124[5] = v129;
  v130 = v295;
  v124[6] = v294;
  v124[7] = v130;
  v131 = v289;
  *v124 = v288;
  v124[1] = v131;
  v132 = v291;
  v124[2] = v290;
  v124[3] = v132;
  v133 = v300;
  v134 = v301;
  v135 = v302[0];
  *(_OWORD *)((char *)v124 + 234) = *(_OWORD *)((char *)v302 + 10);
  v124[13] = v134;
  v124[14] = v135;
  v124[12] = v133;
  sub_1CFE66B44(v101, v103, v138);
  swift_bridgeObjectRetain();
  sub_1CFE66DF4((uint64_t)v285);
  sub_1CFE66ED0((uint64_t)v287);
  sub_1CFE66DF4((uint64_t)&v288);
  LOBYTE(v94) = v163;
  sub_1CFE66B44(v101, v103, v163);
  swift_bridgeObjectRetain();
  sub_1CFE66DF4((uint64_t)&v238);
  v136 = *(void (**)(char *, uint64_t))(v165 + 8);
  v136(v172, v95);
  v136(v171, v95);
  sub_1CFE66FE0((uint64_t)&v238);
  v136(v164, v95);
  sub_1CFE66B54(v101, v103, (char)v94);
  swift_bridgeObjectRelease();
  v303[0] = v181;
  v303[1] = v167;
  v304 = v148;
  *(_DWORD *)v305 = *(_DWORD *)v201;
  *(_DWORD *)&v305[3] = *(_DWORD *)&v201[3];
  v306 = v182;
  v307 = 10;
  v308 = 0;
  *(_DWORD *)v309 = *(_DWORD *)v200;
  *(_DWORD *)&v309[3] = *(_DWORD *)&v200[3];
  v310 = 10;
  v311 = 0;
  v313 = v199;
  v312 = v198;
  v314 = v146;
  v315 = v145;
  v316 = v149;
  *(_DWORD *)&v317[3] = *(_DWORD *)&v197[3];
  *(_DWORD *)v317 = *(_DWORD *)v197;
  v318 = v168;
  v319 = 11;
  v320 = 0;
  *(_DWORD *)&v321[3] = *(_DWORD *)&v196[3];
  *(_DWORD *)v321 = *(_DWORD *)v196;
  v322 = 11;
  v323 = 0;
  v325 = v195;
  v324 = v194;
  v326 = v147;
  v327 = v169;
  v328 = v150;
  *(_DWORD *)&v329[3] = *(_DWORD *)((char *)v193 + 3);
  *(_DWORD *)v329 = v193[0];
  v330 = v170;
  v331 = 12;
  v332 = 0;
  *(_DWORD *)v333 = v192[0];
  *(_DWORD *)&v333[3] = *(_DWORD *)((char *)v192 + 3);
  v334 = 12;
  v335 = 0;
  v337 = v191;
  v336 = v190;
  v338 = v166;
  v339 = v126;
  v340 = (char)v102;
  *(_DWORD *)v341 = v189[0];
  *(_DWORD *)&v341[3] = *(_DWORD *)((char *)v189 + 3);
  v342 = v125;
  v343 = 13;
  v344 = 0;
  *(_DWORD *)&v345[3] = *(_DWORD *)((char *)v188 + 3);
  *(_DWORD *)v345 = v188[0];
  v346 = 13;
  v347 = 0;
  sub_1CFE66FE0((uint64_t)v303);
  v136(v161, v95);
  v348[0] = v184;
  v348[1] = v183;
  v349 = v153;
  *(_DWORD *)v350 = v237[0];
  *(_DWORD *)&v350[3] = *(_DWORD *)((char *)v237 + 3);
  v351 = v178;
  v352 = 5;
  v353 = 0;
  *(_DWORD *)v354 = v218[0];
  *(_DWORD *)&v354[3] = *(_DWORD *)((char *)v218 + 3);
  v355 = 5;
  v356 = 0;
  v358 = v217;
  v357 = v216;
  v359 = v185;
  v360 = v173;
  v361 = v155;
  *(_DWORD *)&v362[3] = *(_DWORD *)((char *)v215 + 3);
  *(_DWORD *)v362 = v215[0];
  v363 = v186;
  v364 = 6;
  v365 = 0;
  *(_DWORD *)&v366[3] = *(_DWORD *)((char *)v214 + 3);
  *(_DWORD *)v366 = v214[0];
  v367 = 6;
  v368 = 0;
  v370 = v213;
  v369 = v212;
  v371 = v174;
  v372 = v187;
  v373 = v156;
  *(_DWORD *)&v374[3] = *(_DWORD *)((char *)v211 + 3);
  *(_DWORD *)v374 = v211[0];
  v375 = v175;
  v376 = 7;
  v377 = 0;
  *(_DWORD *)v378 = v210[0];
  *(_DWORD *)&v378[3] = *(_DWORD *)((char *)v210 + 3);
  v379 = 7;
  v380 = 0;
  v382 = v209;
  v381 = v208;
  v383 = v154;
  v384 = v176;
  v385 = v157;
  *(_DWORD *)v386 = v207[0];
  *(_DWORD *)&v386[3] = *(_DWORD *)((char *)v207 + 3);
  v387 = v177;
  v388 = 8;
  v389 = 0;
  *(_DWORD *)&v390[3] = *(_DWORD *)((char *)v206 + 3);
  *(_DWORD *)v390 = v206[0];
  v391 = 8;
  v392 = 0;
  v394 = v205;
  v393 = v204;
  v395 = v159;
  v396 = v179;
  v397 = v158;
  *(_DWORD *)v398 = v203[0];
  *(_DWORD *)&v398[3] = *(_DWORD *)((char *)v203 + 3);
  v399 = v180;
  v400 = 9;
  v401 = 0;
  *(_DWORD *)v402 = v202[0];
  *(_DWORD *)&v402[3] = *(_DWORD *)((char *)v202 + 3);
  v403 = 9;
  v404 = 0;
  sub_1CFE670BC((uint64_t)v348);
  v136(v152, v95);
  v405[12] = v231;
  v405[13] = v232;
  v406[0] = *(_OWORD *)v233;
  *(_OWORD *)((char *)v406 + 10) = *(_OWORD *)&v233[10];
  v405[8] = v227;
  v405[9] = v228;
  v405[10] = v229;
  v405[11] = v230;
  v405[4] = v223;
  v405[5] = v224;
  v405[6] = v225;
  v405[7] = v226;
  v405[0] = v219;
  v405[1] = v220;
  v405[2] = v221;
  v405[3] = v222;
  sub_1CFE66FE0((uint64_t)v405);
  v136(v151, v95);
  sub_1CFE66B54(v160, v103, v236);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5D8A0@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  __int128 *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  char v20;
  __int128 v21;
  uint64_t v22;
  char *v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v30;
  char *v31;
  __int128 v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[32];

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBB0);
  MEMORY[0x1E0C80A78](v4);
  v31 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBB8);
  v33 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v30 = (uint64_t)&v30 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBC0);
  v9 = MEMORY[0x1E0C80A78](v8);
  v34 = (uint64_t)&v30 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v30 - v11;
  v35 = sub_1CFEB3AE4();
  v13 = v1[1];
  v36 = *v1;
  v37 = v13;
  v38 = v1[2];
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBA8);
  sub_1CFEB3BD4();
  v15 = v39;
  v16 = v40[0];
  v32 = *(_OWORD *)&v40[8];
  v17 = *(_QWORD *)&v40[24];
  swift_getKeyPath();
  v39 = v15;
  v40[0] = v16;
  *(_OWORD *)&v40[8] = v32;
  *(_QWORD *)&v40[24] = v17;
  v18 = v6;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v19 = v36;
  v20 = v37;
  v21 = v2[1];
  v39 = *v2;
  *(_OWORD *)v40 = v21;
  *(_OWORD *)&v40[16] = v2[2];
  MEMORY[0x1D17DDA74](&v36, v14);
  v22 = 1;
  if (sub_1CFE6731C(v36, 1))
  {
    v23 = v31;
    sub_1CFE5DBF4(v2, v31);
    v24 = sub_1CFEB3A60();
    v25 = v30;
    sub_1CFE67238((uint64_t)v23, v30, &qword_1EFBFEBB0);
    v26 = v25 + *(int *)(v18 + 36);
    *(_BYTE *)v26 = v24;
    *(_OWORD *)(v26 + 8) = 0u;
    *(_OWORD *)(v26 + 24) = 0u;
    *(_BYTE *)(v26 + 40) = 1;
    sub_1CFE6727C((uint64_t)v23, &qword_1EFBFEBB0);
    sub_1CFE672B8(v25, (uint64_t)v12, &qword_1EFBFEBB8);
    v22 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v12, v22, 1, v18);
  v27 = v34;
  sub_1CFE67238((uint64_t)v12, v34, &qword_1EFBFEBC0);
  *(_QWORD *)a1 = 0x69462D6957;
  *(_QWORD *)(a1 + 8) = 0xE500000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_1CFEBD6C0;
  *(_QWORD *)(a1 + 32) = v35;
  *(_OWORD *)(a1 + 40) = v19;
  *(_BYTE *)(a1 + 56) = v20;
  v28 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBC8);
  sub_1CFE67238(v27, a1 + *(int *)(v28 + 48), &qword_1EFBFEBC0);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C((uint64_t)v12, &qword_1EFBFEBC0);
  sub_1CFE6727C(v27, &qword_1EFBFEBC0);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5DBF4@<X0>(__int128 *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  void (*v24)(char *, char *, uint64_t);
  char *v25;
  uint64_t v26;
  void (*v27)(char *, char *, uint64_t);
  char *v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  void (*v32)(char *, uint64_t);
  void (*v33)(char *, uint64_t);
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char *v40;
  uint64_t v41;
  char *v42;
  uint64_t v43;
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  __int128 v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v44 = a2;
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF000);
  v43 = *(_QWORD *)(v39 - 8);
  v3 = MEMORY[0x1E0C80A78](v39);
  v42 = (char *)&v35 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v45 = (char *)&v35 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF008);
  v41 = *(_QWORD *)(v6 - 8);
  v7 = MEMORY[0x1E0C80A78](v6);
  v40 = (char *)&v35 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v35 - v9;
  v38 = sub_1CFEB39E8();
  v37 = v11;
  *(_QWORD *)&v36 = v12;
  v13 = a1[1];
  v53 = *a1;
  v54 = v13;
  v15 = *a1;
  v14 = a1[1];
  v55 = a1[2];
  v46 = v15;
  v47 = v14;
  v48 = a1[2];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBA8);
  sub_1CFEB3BD4();
  v16 = v49;
  LOBYTE(a1) = v50;
  v35 = v51;
  v17 = v52;
  swift_getKeyPath();
  v49 = v16;
  LOBYTE(v50) = (_BYTE)a1;
  v51 = v35;
  v52 = v17;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v49 = v46;
  v50 = v47;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF010);
  sub_1CFE66C48();
  sub_1CFEB3B98();
  sub_1CFEB39E8();
  v38 = v18;
  v37 = v19;
  v46 = v53;
  v47 = v54;
  v48 = v55;
  sub_1CFEB3BD4();
  v20 = v49;
  LOBYTE(a1) = v50;
  v36 = v51;
  v21 = v52;
  swift_getKeyPath();
  v49 = v20;
  LOBYTE(v50) = (_BYTE)a1;
  v51 = v36;
  v52 = v21;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v49 = v46;
  v50 = v47;
  type metadata accessor for STStatusBarDataWifiType(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF060);
  sub_1CFE663D8(&qword_1EFBFF068, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarDataWifiType, (uint64_t)&unk_1CFEBDECC);
  sub_1CFE66DB4(&qword_1EFBFF070, &qword_1EFBFF060, MEMORY[0x1E0CE0680]);
  v22 = v45;
  sub_1CFEB3B98();
  v23 = v41;
  v24 = *(void (**)(char *, char *, uint64_t))(v41 + 16);
  v25 = v40;
  v24(v40, v10, v6);
  v26 = v43;
  v27 = *(void (**)(char *, char *, uint64_t))(v43 + 16);
  v28 = v42;
  v29 = v39;
  v27(v42, v22, v39);
  v30 = v44;
  v24(v44, v25, v6);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF078);
  v27(&v30[*(int *)(v31 + 48)], v28, v29);
  v32 = *(void (**)(char *, uint64_t))(v26 + 8);
  v32(v45, v29);
  v33 = *(void (**)(char *, uint64_t))(v23 + 8);
  v33(v10, v6);
  v32(v28, v29);
  return ((uint64_t (*)(char *, uint64_t))v33)(v25, v6);
}

uint64_t sub_1CFE5E07C()
{
  return sub_1CFE5E08C();
}

uint64_t sub_1CFE5E08C()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF028);
  sub_1CFE66CAC();
  return sub_1CFEB3C04();
}

uint64_t sub_1CFE5E0E8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v4 = sub_1CFEB39DC();
  MEMORY[0x1E0C80A78](v4);
  sub_1CFEB39D0();
  sub_1CFEB39C4();
  sub_1CFEB39B8();
  sub_1CFEB39C4();
  sub_1CFEB39F4();
  result = sub_1CFEB3A84();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  *(_QWORD *)(a2 + 32) = a1;
  *(_BYTE *)(a2 + 40) = 0;
  *(_QWORD *)(a2 + 48) = a1;
  *(_WORD *)(a2 + 56) = 0;
  return result;
}

uint64_t sub_1CFE5E1F4@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFE5F934(a1);
}

uint64_t sub_1CFE5E220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _DWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v42 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBD8);
  MEMORY[0x1E0C80A78](v9);
  v41 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBE0);
  v44 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v40 = (uint64_t)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBE8);
  v13 = MEMORY[0x1E0C80A78](v12);
  v46 = (uint64_t)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v48 = (uint64_t)v37 - v15;
  v45 = sub_1CFEB3AE4();
  *(_QWORD *)&v49 = a1;
  *((_QWORD *)&v49 + 1) = a2;
  LOBYTE(v50) = a3;
  v51 = a4;
  v16 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBD0);
  sub_1CFEB3BD4();
  v18 = v52;
  LOBYTE(a4) = v53;
  v19 = v54;
  swift_getKeyPath();
  v52 = v18;
  LOBYTE(v53) = a4;
  v54 = v19;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v20 = v49;
  v43 = v50;
  *(_QWORD *)&v52 = a1;
  *((_QWORD *)&v52 + 1) = a2;
  LOBYTE(v53) = a3;
  v54 = v16;
  MEMORY[0x1D17DDA74](&v49, v17);
  v21 = 1;
  if (sub_1CFE6731C(v49, 1))
  {
    sub_1CFEB39E8();
    v38 = v23;
    v39 = v22;
    v37[3] = v24;
    *(_QWORD *)&v49 = a1;
    *((_QWORD *)&v49 + 1) = a2;
    LOBYTE(v50) = a3;
    v51 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBD0);
    sub_1CFEB3BD4();
    v25 = v52;
    v26 = v53;
    v27 = v54;
    swift_getKeyPath();
    v52 = v25;
    LOBYTE(v53) = v26;
    v54 = v27;
    sub_1CFEB3BC8();
    swift_release();
    swift_release();
    swift_release();
    v52 = v49;
    v53 = v50;
    type metadata accessor for STStatusBarLocationType(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFE8);
    sub_1CFE663D8(&qword_1EFBFEFF0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarLocationType, (uint64_t)&unk_1CFEBDF3C);
    sub_1CFE66DB4(&qword_1EFBFEFF8, &qword_1EFBFEFE8, MEMORY[0x1E0CE0680]);
    v28 = (uint64_t)v41;
    sub_1CFEB3B98();
    v29 = sub_1CFEB3A60();
    v30 = v40;
    sub_1CFE67238(v28, v40, &qword_1EFBFEBD8);
    v31 = v30 + *(int *)(v47 + 36);
    *(_BYTE *)v31 = v29;
    *(_OWORD *)(v31 + 8) = 0u;
    *(_OWORD *)(v31 + 24) = 0u;
    *(_BYTE *)(v31 + 40) = 1;
    sub_1CFE6727C(v28, &qword_1EFBFEBD8);
    sub_1CFE672B8(v30, v48, &qword_1EFBFEBE0);
    v21 = 0;
  }
  v32 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v48, v21, 1, v47);
  v33 = v46;
  sub_1CFE67238(v32, v46, &qword_1EFBFEBE8);
  v34 = v42;
  *v42 = 0x6E6F697461636F4CLL;
  v34[1] = 0xE800000000000000;
  *((_OWORD *)v34 + 1) = xmmword_1CFEBD6D0;
  v34[4] = v45;
  *(_OWORD *)(v34 + 5) = v20;
  *((_BYTE *)v34 + 56) = v43;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBF0);
  sub_1CFE67238(v33, (uint64_t)v34 + *(int *)(v35 + 48), &qword_1EFBFEBE8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1CFE6727C(v32, &qword_1EFBFEBE8);
  sub_1CFE6727C(v33, &qword_1EFBFEBE8);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1CFE5E6B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char v24;

  sub_1CFEB39E8();
  v2 = sub_1CFEB3A84();
  v22 = v4;
  v23 = v3;
  v6 = v5 & 1;
  sub_1CFEB39E8();
  v7 = sub_1CFEB3A84();
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  sub_1CFEB39E8();
  v14 = sub_1CFEB3A84();
  v16 = v15;
  v17 = v6;
  v24 = v6;
  v19 = v18 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v17;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = 2;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 2;
  *(_WORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = 0;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 0;
  *(_WORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = v14;
  *(_QWORD *)(a1 + 136) = v15;
  *(_BYTE *)(a1 + 144) = v18 & 1;
  *(_QWORD *)(a1 + 152) = v20;
  *(_QWORD *)(a1 + 160) = 1;
  *(_BYTE *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 1;
  *(_WORD *)(a1 + 184) = 0;
  sub_1CFE66B44(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5E8E8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE5E220(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1CFE5E8F8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;
  __int128 *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  __int128 v15;
  uint64_t v16;
  __int128 v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  char v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  char v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  char v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD *v40;
  uint64_t v41;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  _QWORD *v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  _OWORD v54[2];
  __int128 v55;
  _BYTE v56[26];

  v2 = (__int128 *)v1;
  v50 = a1;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC00);
  MEMORY[0x1E0C80A78](v3);
  v44 = (uint64_t)&v43 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC08);
  v6 = *(_QWORD *)(v5 - 8);
  v48 = v5;
  v49 = v6;
  v7 = MEMORY[0x1E0C80A78](v5);
  v46 = (uint64_t)&v43 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v7);
  v45 = (uint64_t)&v43 - v9;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC10);
  v11 = MEMORY[0x1E0C80A78](v10);
  v52 = (uint64_t)&v43 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v43 - v13;
  v47 = *(unsigned __int8 *)(v1 + 42);
  v51 = sub_1CFEB3B20();
  v15 = *(_OWORD *)(v1 + 16);
  v53 = *(_OWORD *)v1;
  v54[0] = v15;
  *(_OWORD *)((char *)v54 + 10) = *(_OWORD *)(v1 + 26);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBF8);
  sub_1CFEB3BD4();
  v17 = v55;
  v18 = v56[0];
  v19 = *(_QWORD *)&v56[8];
  v20 = *(_QWORD *)&v56[16];
  v21 = v56[24];
  v22 = v56[25];
  swift_getKeyPath();
  v55 = v17;
  v56[0] = v18;
  *(_QWORD *)&v56[8] = v19;
  v23 = (uint64_t)v14;
  v24 = v48;
  *(_QWORD *)&v56[16] = v20;
  v56[24] = v21;
  v56[25] = v22;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v25 = v53;
  v26 = v54[0];
  v27 = v2[1];
  v55 = *v2;
  *(_OWORD *)v56 = v27;
  *(_OWORD *)&v56[10] = *(__int128 *)((char *)v2 + 26);
  v28 = v16;
  v29 = v47;
  MEMORY[0x1D17DDA74](&v53, v28);
  v30 = 1;
  if (sub_1CFE6731C(v53, 1))
  {
    v31 = v44;
    sub_1CFE5ECFC(v2, v44);
    if ((v29 & 1) != 0)
      v32 = sub_1CFEB3A60();
    else
      v32 = sub_1CFEB3A6C();
    v33 = v32;
    v34 = v46;
    sub_1CFE67238(v31, v46, &qword_1EFBFEC00);
    v35 = v34 + *(int *)(v24 + 36);
    *(_BYTE *)v35 = v33;
    *(_OWORD *)(v35 + 8) = 0u;
    *(_OWORD *)(v35 + 24) = 0u;
    *(_BYTE *)(v35 + 40) = 1;
    sub_1CFE6727C(v31, &qword_1EFBFEC00);
    v36 = v45;
    sub_1CFE672B8(v34, v45, &qword_1EFBFEC08);
    sub_1CFE672B8(v36, v23, &qword_1EFBFEC08);
    v30 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v49 + 56))(v23, v30, 1, v24);
  if ((v29 & 1) != 0)
    v37 = 0xEB00000000303031;
  else
    v37 = 0;
  if ((v29 & 1) != 0)
    v38 = 0x2E79726574746162;
  else
    v38 = 0;
  v39 = v52;
  sub_1CFE67238(v23, v52, &qword_1EFBFEC10);
  v40 = v50;
  *v50 = 0x79726574746142;
  v40[1] = 0xE700000000000000;
  v40[2] = v38;
  v40[3] = v37;
  v40[4] = v51;
  *(_OWORD *)(v40 + 5) = v25;
  *((_BYTE *)v40 + 56) = v26;
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC18);
  sub_1CFE67238(v39, (uint64_t)v40 + *(int *)(v41 + 48), &qword_1EFBFEC10);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C(v23, &qword_1EFBFEC10);
  sub_1CFE6727C(v39, &qword_1EFBFEC10);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5ECFC@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  char v32;
  char *v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  uint64_t KeyPath;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  char v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  char v57;
  uint64_t v58;
  __int128 v59;
  char v60;
  uint64_t v61;
  uint64_t v62;
  char v63;
  char v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t *v71;
  uint64_t v72;
  uint64_t v73;
  int v74;
  uint64_t v75;
  __int128 v76;
  uint64_t v77;
  uint64_t v78;
  void (*v79)(char *, char *, uint64_t);
  char *v80;
  uint64_t v81;
  uint64_t v82;
  char *v83;
  char *v84;
  uint64_t v85;
  void (*v86)(uint64_t, char *, uint64_t);
  uint64_t v87;
  void (*v88)(char *, uint64_t);
  void (*v89)(char *, uint64_t);
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  _QWORD v96[2];
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  char *v105;
  uint64_t v106;
  _QWORD *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  char *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  char *v115;
  uint64_t v116;
  char *v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  _OWORD v121[2];
  __int128 v122;
  _BYTE v123[26];
  __int128 v124;
  _BYTE v125[26];

  v116 = a2;
  v113 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF78);
  v98 = *(_QWORD *)(v113 - 8);
  v3 = MEMORY[0x1E0C80A78](v113);
  v101 = (char *)v96 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v111 = (char *)v96 - v5;
  v97 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF80);
  v6 = MEMORY[0x1E0C80A78](v97);
  v112 = (uint64_t)v96 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v109 = (uint64_t)v96 - v8;
  v100 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF88);
  v108 = *(_QWORD *)(v100 - 8);
  v9 = MEMORY[0x1E0C80A78](v100);
  v99 = (char *)v96 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v117 = (char *)v96 - v11;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF90);
  v13 = MEMORY[0x1E0C80A78](v12);
  v115 = (char *)v96 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v114 = (uint64_t)v96 - v15;
  v107 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF98);
  v106 = *(v107 - 1);
  MEMORY[0x1E0C80A78](v107);
  v17 = (char *)v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v102 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFA0);
  MEMORY[0x1E0C80A78](v102);
  v105 = (char *)v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v104 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFA8);
  v19 = MEMORY[0x1E0C80A78](v104);
  v110 = (uint64_t)v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = MEMORY[0x1E0C80A78](v19);
  v103 = (uint64_t)v96 - v22;
  MEMORY[0x1E0C80A78](v21);
  v118 = (uint64_t)v96 - v23;
  v24 = a1[1];
  v122 = *a1;
  *(_OWORD *)v123 = v24;
  *(_OWORD *)&v123[10] = *(__int128 *)((char *)a1 + 26);
  v25 = a1[1];
  v120 = *a1;
  v121[0] = v25;
  *(_OWORD *)((char *)v121 + 10) = *(__int128 *)((char *)a1 + 26);
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBF8);
  sub_1CFEB3BD4();
  v27 = v124;
  v28 = v125[0];
  v29 = *(_QWORD *)&v125[8];
  v30 = *(_QWORD *)&v125[16];
  v31 = v125[24];
  v32 = v125[25];
  swift_getKeyPath();
  v124 = v27;
  v125[0] = v28;
  *(_QWORD *)&v125[8] = v29;
  *(_QWORD *)&v125[16] = v30;
  v125[24] = v31;
  v125[25] = v32;
  v96[1] = v26;
  sub_1CFEB3BC8();
  swift_release();
  v33 = v17;
  swift_release();
  swift_release();
  v124 = v120;
  *(_QWORD *)v125 = *(_QWORD *)&v121[0];
  v119 = xmmword_1CFEBD6E0;
  sub_1CFE66B64();
  sub_1CFEB3BA4();
  v34 = a1[1];
  v124 = *a1;
  *(_OWORD *)v125 = v34;
  *(_OWORD *)&v125[10] = *(__int128 *)((char *)a1 + 26);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEBF8);
  MEMORY[0x1D17DDA74](&v120);
  if (BYTE8(v121[0]) == 1)
  {
    v36 = sub_1CFEB3B44();
  }
  else
  {
    v37 = a1[1];
    v124 = *a1;
    *(_OWORD *)v125 = v37;
    *(_OWORD *)&v125[10] = *(__int128 *)((char *)a1 + 26);
    MEMORY[0x1D17DDA74](&v120, v35);
    if (*(double *)v121 >= 0.2)
      v36 = sub_1CFEB3B20();
    else
      v36 = sub_1CFEB3AD8();
  }
  v38 = v36;
  KeyPath = swift_getKeyPath();
  if (v38)
  {
    *(_QWORD *)&v124 = v38;
    swift_retain();
    v40 = sub_1CFEB3928();
  }
  else
  {
    v40 = 0;
  }
  v41 = v106;
  v42 = (uint64_t)v105;
  v43 = v107;
  (*(void (**)(char *, char *, _QWORD *))(v106 + 16))(v105, v33, v107);
  swift_release();
  v44 = (uint64_t *)(v42 + *(int *)(v102 + 36));
  *v44 = KeyPath;
  v44[1] = v40;
  (*(void (**)(char *, _QWORD *))(v41 + 8))(v33, v43);
  v45 = sub_1CFEB3A00();
  v46 = v103;
  sub_1CFE67238(v42, v103, &qword_1EFBFEFA0);
  v47 = (uint64_t *)(v46 + *(int *)(v104 + 36));
  *v47 = v45;
  v47[1] = (uint64_t)sub_1CFE67318;
  v47[2] = 0;
  sub_1CFE6727C(v42, &qword_1EFBFEFA0);
  sub_1CFE672B8(v46, v118, &qword_1EFBFEFA8);
  if ((*((_BYTE *)a1 + 42) & 1) != 0)
  {
    v107 = (_QWORD *)sub_1CFEB39E8();
    v106 = v51;
    v120 = v122;
    v121[0] = *(_OWORD *)v123;
    *(_OWORD *)((char *)v121 + 10) = *(_OWORD *)&v123[10];
    sub_1CFEB3BD4();
    v52 = v124;
    v53 = v125[0];
    v54 = *(_QWORD *)&v125[8];
    v55 = *(_QWORD *)&v125[16];
    v56 = v125[24];
    v57 = v125[25];
    swift_getKeyPath();
    v124 = v52;
    v125[0] = v53;
    *(_QWORD *)&v125[8] = v54;
    *(_QWORD *)&v125[16] = v55;
    v125[24] = v56;
    v125[25] = v57;
    sub_1CFEB3BC8();
    swift_release();
    swift_release();
    swift_release();
    v124 = v120;
    *(_QWORD *)v125 = *(_QWORD *)&v121[0];
    type metadata accessor for STStatusBarBatteryState(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFC8);
    sub_1CFE663D8(&qword_1EFBFEFD0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarBatteryState, (uint64_t)&unk_1CFEBDFAC);
    sub_1CFE66DB4(&qword_1EFBFEFD8, &qword_1EFBFEFC8, MEMORY[0x1E0CE0680]);
    sub_1CFEB3B98();
    v107 = (_QWORD *)sub_1CFEB39E8();
    v106 = v58;
    v120 = v122;
    v121[0] = *(_OWORD *)v123;
    *(_OWORD *)((char *)v121 + 10) = *(_OWORD *)&v123[10];
    sub_1CFEB3BD4();
    v59 = v124;
    v60 = v125[0];
    v61 = *(_QWORD *)&v125[8];
    v62 = *(_QWORD *)&v125[16];
    v63 = v125[24];
    v64 = v125[25];
    swift_getKeyPath();
    v124 = v59;
    v125[0] = v60;
    *(_QWORD *)&v125[8] = v61;
    *(_QWORD *)&v125[16] = v62;
    v125[24] = v63;
    v125[25] = v64;
    sub_1CFEB3BC8();
    swift_release();
    swift_release();
    swift_release();
    v65 = v111;
    sub_1CFEB3BB0();
    v66 = sub_1CFEB3B44();
    v67 = swift_getKeyPath();
    v68 = v98;
    v106 = *(_QWORD *)(v98 + 16);
    v69 = v112;
    v70 = v113;
    ((void (*)(uint64_t, char *, uint64_t))v106)(v112, v65, v113);
    v71 = (uint64_t *)(v69 + *(int *)(v97 + 36));
    *v71 = v67;
    v71[1] = v66;
    v107 = *(_QWORD **)(v68 + 8);
    ((void (*)(char *, uint64_t))v107)(v65, v70);
    v72 = v109;
    sub_1CFE672B8(v69, v109, &qword_1EFBFEF80);
    v105 = (char *)sub_1CFEB39E8();
    v104 = v73;
    LODWORD(v102) = v74;
    v103 = v75;
    v120 = v122;
    v121[0] = *(_OWORD *)v123;
    *(_OWORD *)((char *)v121 + 10) = *(_OWORD *)&v123[10];
    sub_1CFEB3BD4();
    v76 = v124;
    LOBYTE(v67) = v125[0];
    v77 = *(_QWORD *)&v125[8];
    v78 = *(_QWORD *)&v125[16];
    LOBYTE(v68) = v125[24];
    LOBYTE(v69) = v125[25];
    swift_getKeyPath();
    v124 = v76;
    v125[0] = v67;
    *(_QWORD *)&v125[8] = v77;
    *(_QWORD *)&v125[16] = v78;
    v125[24] = v68;
    v125[25] = v69;
    sub_1CFEB3BC8();
    swift_release();
    swift_release();
    swift_release();
    sub_1CFEB3BB0();
    v79 = *(void (**)(char *, char *, uint64_t))(v108 + 16);
    v80 = v99;
    v81 = v100;
    v79(v99, v117, v100);
    v82 = v112;
    sub_1CFE67238(v72, v112, &qword_1EFBFEF80);
    v83 = v101;
    v84 = v65;
    v85 = v113;
    v86 = (void (*)(uint64_t, char *, uint64_t))v106;
    ((void (*)(char *, char *, uint64_t))v106)(v101, v84, v113);
    v50 = (uint64_t)v115;
    v79(v115, v80, v81);
    v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFE0);
    sub_1CFE67238(v82, v50 + *(int *)(v87 + 48), &qword_1EFBFEF80);
    v86(v50 + *(int *)(v87 + 64), v83, v85);
    v88 = (void (*)(char *, uint64_t))v107;
    ((void (*)(char *, uint64_t))v107)(v111, v85);
    sub_1CFE6727C(v109, &qword_1EFBFEF80);
    v89 = *(void (**)(char *, uint64_t))(v108 + 8);
    v89(v117, v81);
    v88(v83, v85);
    sub_1CFE6727C(v82, &qword_1EFBFEF80);
    v89(v80, v81);
    v90 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFB8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v90 - 8) + 56))(v50, 0, 1, v90);
    v49 = v114;
    sub_1CFE672B8(v50, v114, &qword_1EFBFEF90);
  }
  else
  {
    v48 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFB8);
    v49 = v114;
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v48 - 8) + 56))(v114, 1, 1, v48);
    v50 = (uint64_t)v115;
  }
  v91 = v118;
  v92 = v110;
  sub_1CFE67238(v118, v110, &qword_1EFBFEFA8);
  sub_1CFE67238(v49, v50, &qword_1EFBFEF90);
  v93 = v116;
  sub_1CFE67238(v92, v116, &qword_1EFBFEFA8);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEFC0);
  sub_1CFE67238(v50, v93 + *(int *)(v94 + 48), &qword_1EFBFEF90);
  sub_1CFE6727C(v49, &qword_1EFBFEF90);
  sub_1CFE6727C(v91, &qword_1EFBFEFA8);
  sub_1CFE6727C(v50, &qword_1EFBFEF90);
  return sub_1CFE6727C(v92, &qword_1EFBFEFA8);
}

uint64_t sub_1CFE5F90C@<X0>(uint64_t a1@<X8>)
{
  return sub_1CFE5F934(a1);
}

uint64_t sub_1CFE5F934@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;

  sub_1CFEB39E8();
  v2 = sub_1CFEB3A84();
  v4 = v3;
  v6 = v5;
  v8 = v7 & 1;
  sub_1CFEB39E8();
  v9 = sub_1CFEB3A84();
  v11 = v10;
  v13 = v12 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v4;
  *(_BYTE *)(a1 + 16) = v8;
  *(_QWORD *)(a1 + 24) = v6;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v9;
  *(_QWORD *)(a1 + 72) = v10;
  *(_BYTE *)(a1 + 80) = v12 & 1;
  *(_QWORD *)(a1 + 88) = v14;
  *(_QWORD *)(a1 + 96) = 1;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  sub_1CFE66B44(v2, v4, v8);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v9, v11, v13);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v9, v11, v13);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v4, v8);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE5FAA0@<X0>(_QWORD *a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  __int128 *v21;
  __int128 v22;
  char v23;
  __int128 v24;
  uint64_t v25;
  char *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  __int128 *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  __int128 v44;
  __int128 v45;
  _OWORD v46[2];
  __int128 v47;
  __int128 v48;
  _BYTE v49[26];

  v43 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC28);
  MEMORY[0x1E0C80A78](v2);
  v36 = (char *)&v34 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC30);
  v40 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v35 = (uint64_t)&v34 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC38);
  v6 = MEMORY[0x1E0C80A78](v5);
  v42 = (uint64_t)&v34 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v38 = (char *)&v34 - v8;
  v41 = sub_1CFEB3AE4();
  v37 = v1;
  v9 = v1[1];
  v44 = *v1;
  v45 = v9;
  v46[0] = v1[2];
  *(_OWORD *)((char *)v46 + 10) = *(__int128 *)((char *)v1 + 42);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC20);
  sub_1CFEB3BD4();
  v11 = v47;
  v12 = v48;
  v13 = *((_QWORD *)&v48 + 1);
  v14 = v49[0];
  v15 = *(_QWORD *)&v49[8];
  v16 = *(_QWORD *)&v49[16];
  v17 = v49[24];
  v18 = v49[25];
  swift_getKeyPath();
  v47 = v11;
  LOBYTE(v48) = v12;
  *((_QWORD *)&v48 + 1) = v13;
  v49[0] = v14;
  *(_QWORD *)&v49[8] = v15;
  v19 = (uint64_t)v38;
  *(_QWORD *)&v49[16] = v16;
  v49[24] = v17;
  v20 = v39;
  v49[25] = v18;
  v21 = v37;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v22 = v44;
  v23 = v45;
  v24 = v21[1];
  v47 = *v21;
  v48 = v24;
  *(_OWORD *)v49 = v21[2];
  *(_OWORD *)&v49[10] = *(__int128 *)((char *)v21 + 42);
  MEMORY[0x1D17DDA74](&v44, v10);
  v25 = 1;
  if (sub_1CFE6731C(v44, 1))
  {
    v26 = v36;
    sub_1CFE5FE78(v21, v36);
    v27 = sub_1CFEB3A60();
    v28 = v35;
    sub_1CFE67238((uint64_t)v26, v35, &qword_1EFBFEC28);
    v29 = v28 + *(int *)(v20 + 36);
    *(_BYTE *)v29 = v27;
    *(_OWORD *)(v29 + 8) = 0u;
    *(_OWORD *)(v29 + 24) = 0u;
    *(_BYTE *)(v29 + 40) = 1;
    sub_1CFE6727C((uint64_t)v26, &qword_1EFBFEC28);
    sub_1CFE672B8(v28, v19, &qword_1EFBFEC30);
    v25 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v40 + 56))(v19, v25, 1, v20);
  v30 = v42;
  sub_1CFE67238(v19, v42, &qword_1EFBFEC38);
  v31 = v43;
  *v43 = 0x746F6F7465756C42;
  v31[1] = 0xE900000000000068;
  *((_OWORD *)v31 + 1) = xmmword_1CFEBD6F0;
  v31[4] = v41;
  *(_OWORD *)(v31 + 5) = v22;
  *((_BYTE *)v31 + 56) = v23;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC40);
  sub_1CFE67238(v30, (uint64_t)v31 + *(int *)(v32 + 48), &qword_1EFBFEC38);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  sub_1CFE6727C(v19, &qword_1EFBFEC38);
  sub_1CFE6727C(v30, &qword_1EFBFEC38);
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease_n();
}

uint64_t sub_1CFE5FE78@<X0>(__int128 *a1@<X0>, char *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  __int128 v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  __int128 v25;
  uint64_t v26;
  char v27;
  uint64_t v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  char *v31;
  uint64_t v32;
  char *v33;
  char *v34;
  void (*v35)(char *, uint64_t);
  _DWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[2];
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  char v55;
  char v56;
  __int128 v57;
  __int128 v58;
  _BYTE v59[26];

  v44 = a2;
  v43 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF50);
  v42 = *(_QWORD *)(v43 - 8);
  v3 = MEMORY[0x1E0C80A78](v43);
  v41 = (char *)v37 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v45 = (char *)v37 - v5;
  v40 = sub_1CFEB39E8();
  v39 = v6;
  v37[3] = v7;
  v38 = v8;
  v9 = a1[1];
  v57 = *a1;
  v58 = v9;
  v11 = *a1;
  v10 = a1[1];
  *(_OWORD *)v59 = a1[2];
  *(_OWORD *)&v59[10] = *(__int128 *)((char *)a1 + 42);
  v46 = v11;
  v47 = v10;
  v48[0] = a1[2];
  *(_OWORD *)((char *)v48 + 10) = *(__int128 *)((char *)a1 + 42);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC20);
  sub_1CFEB3BD4();
  v12 = v49;
  LOBYTE(a1) = v50;
  v13 = v51;
  v14 = v52;
  v15 = v53;
  v16 = v54;
  v17 = v55;
  v18 = v56;
  swift_getKeyPath();
  v49 = v12;
  LOBYTE(v50) = (_BYTE)a1;
  v51 = v13;
  v52 = v14;
  v53 = v15;
  v54 = v16;
  v55 = v17;
  v56 = v18;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v49 = v46;
  v50 = v47;
  type metadata accessor for STStatusBarBluetoothState(0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF58);
  sub_1CFE663D8(&qword_1EFBFEF60, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarBluetoothState, (uint64_t)&unk_1CFEBE01C);
  sub_1CFE66DB4(&qword_1EFBFEF68, &qword_1EFBFEF58, MEMORY[0x1E0CE0680]);
  sub_1CFEB3B98();
  v46 = v57;
  v47 = v58;
  v48[0] = *(_OWORD *)v59;
  *(_OWORD *)((char *)v48 + 10) = *(_OWORD *)&v59[10];
  sub_1CFEB3BD4();
  v19 = v49;
  v20 = v50;
  v21 = v51;
  LOBYTE(v15) = v52;
  v22 = v53;
  v23 = v54;
  v24 = v55;
  LOBYTE(v13) = v56;
  swift_getKeyPath();
  v49 = v19;
  LOBYTE(v50) = v20;
  v51 = v21;
  v52 = v15;
  v53 = v22;
  v54 = v23;
  v55 = v24;
  v56 = v13;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v25 = v46;
  LODWORD(v40) = v47;
  v39 = *((_QWORD *)&v47 + 1);
  v26 = *(_QWORD *)&v48[0];
  LOBYTE(v22) = BYTE8(v48[0]);
  v27 = BYTE9(v48[0]);
  v28 = v42;
  v29 = *(void (**)(char *, char *, uint64_t))(v42 + 16);
  v30 = v41;
  v31 = v45;
  v32 = v43;
  v29(v41, v45, v43);
  v33 = v44;
  v29(v44, v30, v32);
  v34 = &v33[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF70) + 48)];
  *(_OWORD *)v34 = v25;
  v34[16] = v40;
  *((_QWORD *)v34 + 3) = v39;
  *((_QWORD *)v34 + 4) = v26;
  v34[40] = v22;
  v34[41] = v27;
  v34[42] = 0;
  v35 = *(void (**)(char *, uint64_t))(v28 + 8);
  swift_retain();
  swift_retain();
  v35(v31, v32);
  swift_release();
  swift_release();
  return ((uint64_t (*)(char *, uint64_t))v35)(v30, v32);
}

uint64_t sub_1CFE602E0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char v24;

  sub_1CFEB39E8();
  v2 = sub_1CFEB3A84();
  v22 = v4;
  v23 = v3;
  v6 = v5 & 1;
  sub_1CFEB39E8();
  v7 = sub_1CFEB3A84();
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  sub_1CFEB39E8();
  v14 = sub_1CFEB3A84();
  v16 = v15;
  v17 = v6;
  v24 = v6;
  v19 = v18 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v17;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = 1;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = v14;
  *(_QWORD *)(a1 + 136) = v15;
  *(_BYTE *)(a1 + 144) = v18 & 1;
  *(_QWORD *)(a1 + 152) = v20;
  *(_QWORD *)(a1 + 160) = 2;
  *(_BYTE *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 2;
  *(_WORD *)(a1 + 184) = 0;
  sub_1CFE66B44(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE60524@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  uint64_t v19;
  __int128 v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  __int128 v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  uint64_t v35;
  _DWORD v37[4];
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  char *v41;
  _QWORD *v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v42 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC50);
  MEMORY[0x1E0C80A78](v9);
  v41 = (char *)v37 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC58);
  v44 = *(_QWORD *)(v47 - 8);
  MEMORY[0x1E0C80A78](v47);
  v40 = (uint64_t)v37 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC60);
  v13 = MEMORY[0x1E0C80A78](v12);
  v46 = (uint64_t)v37 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v48 = (uint64_t)v37 - v15;
  v45 = sub_1CFEB3AD8();
  *(_QWORD *)&v49 = a1;
  *((_QWORD *)&v49 + 1) = a2;
  LOBYTE(v50) = a3;
  v51 = a4;
  v16 = a4;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC48);
  sub_1CFEB3BD4();
  v18 = v52;
  LOBYTE(a4) = v53;
  v19 = v54;
  swift_getKeyPath();
  v52 = v18;
  LOBYTE(v53) = a4;
  v54 = v19;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  v20 = v49;
  v43 = v50;
  *(_QWORD *)&v52 = a1;
  *((_QWORD *)&v52 + 1) = a2;
  LOBYTE(v53) = a3;
  v54 = v16;
  MEMORY[0x1D17DDA74](&v49, v17);
  v21 = 1;
  if (sub_1CFE6731C(v49, 1))
  {
    sub_1CFEB39E8();
    v38 = v23;
    v39 = v22;
    v37[3] = v24;
    *(_QWORD *)&v49 = a1;
    *((_QWORD *)&v49 + 1) = a2;
    LOBYTE(v50) = a3;
    v51 = v16;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC48);
    sub_1CFEB3BD4();
    v25 = v52;
    v26 = v53;
    v27 = v54;
    swift_getKeyPath();
    v52 = v25;
    LOBYTE(v53) = v26;
    v54 = v27;
    sub_1CFEB3BC8();
    swift_release();
    swift_release();
    swift_release();
    v52 = v49;
    v53 = v50;
    type metadata accessor for STStatusBarVoiceControlType(0);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF38);
    sub_1CFE663D8(&qword_1EFBFEF40, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarVoiceControlType, (uint64_t)&unk_1CFEBE08C);
    sub_1CFE66DB4(&qword_1EFBFEF48, &qword_1EFBFEF38, MEMORY[0x1E0CE0680]);
    v28 = (uint64_t)v41;
    sub_1CFEB3B98();
    v29 = sub_1CFEB3A60();
    v30 = v40;
    sub_1CFE67238(v28, v40, &qword_1EFBFEC50);
    v31 = v30 + *(int *)(v47 + 36);
    *(_BYTE *)v31 = v29;
    *(_OWORD *)(v31 + 8) = 0u;
    *(_OWORD *)(v31 + 24) = 0u;
    *(_BYTE *)(v31 + 40) = 1;
    sub_1CFE6727C(v28, &qword_1EFBFEC50);
    sub_1CFE672B8(v30, v48, &qword_1EFBFEC58);
    v21 = 0;
  }
  v32 = v48;
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v44 + 56))(v48, v21, 1, v47);
  v33 = v46;
  sub_1CFE67238(v32, v46, &qword_1EFBFEC60);
  v34 = v42;
  *v42 = 0x6F43206563696F56;
  v34[1] = 0xED00006C6F72746ELL;
  *((_OWORD *)v34 + 1) = xmmword_1CFEBD700;
  v34[4] = v45;
  *(_OWORD *)(v34 + 5) = v20;
  *((_BYTE *)v34 + 56) = v43;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC68);
  sub_1CFE67238(v33, (uint64_t)v34 + *(int *)(v35 + 48), &qword_1EFBFEC60);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C(v32, &qword_1EFBFEC60);
  sub_1CFE6727C(v33, &qword_1EFBFEC60);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE609E8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  char v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v17;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v22;
  uint64_t v23;
  char v24;

  sub_1CFEB39E8();
  v2 = sub_1CFEB3A84();
  v22 = v4;
  v23 = v3;
  v6 = v5 & 1;
  sub_1CFEB39E8();
  v7 = sub_1CFEB3A84();
  v9 = v8;
  v11 = v10;
  v13 = v12 & 1;
  sub_1CFEB39E8();
  v14 = sub_1CFEB3A84();
  v16 = v15;
  v17 = v6;
  v24 = v6;
  v19 = v18 & 1;
  *(_QWORD *)a1 = v2;
  *(_QWORD *)(a1 + 8) = v23;
  *(_BYTE *)(a1 + 16) = v17;
  *(_QWORD *)(a1 + 24) = v22;
  *(_QWORD *)(a1 + 32) = 0;
  *(_BYTE *)(a1 + 40) = 0;
  *(_QWORD *)(a1 + 48) = 0;
  *(_WORD *)(a1 + 56) = 0;
  *(_QWORD *)(a1 + 64) = v7;
  *(_QWORD *)(a1 + 72) = v9;
  *(_BYTE *)(a1 + 80) = v13;
  *(_QWORD *)(a1 + 88) = v11;
  *(_QWORD *)(a1 + 96) = 1;
  *(_BYTE *)(a1 + 104) = 0;
  *(_QWORD *)(a1 + 112) = 1;
  *(_WORD *)(a1 + 120) = 0;
  *(_QWORD *)(a1 + 128) = v14;
  *(_QWORD *)(a1 + 136) = v15;
  *(_BYTE *)(a1 + 144) = v18 & 1;
  *(_QWORD *)(a1 + 152) = v20;
  *(_QWORD *)(a1 + 160) = 2;
  *(_BYTE *)(a1 + 168) = 0;
  *(_QWORD *)(a1 + 176) = 2;
  *(_WORD *)(a1 + 184) = 0;
  sub_1CFE66B44(v2, v23, v17);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v7, v9, v13);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v14, v16, v19);
  swift_bridgeObjectRetain();
  sub_1CFE66B54(v14, v16, v19);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v7, v9, v13);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v23, v24);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE60C18@<X0>(_QWORD *a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE60524(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(_BYTE *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1CFE60C28@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  __int128 v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  __int128 v24;
  char v25;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  char v32;
  unint64_t v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  _DWORD v51[4];
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  char *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unsigned __int128 v66;
  __int128 v67;
  uint64_t v68;
  unsigned __int128 v69;
  __int128 v70;
  uint64_t v71;

  v2 = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC78);
  v60 = *(_QWORD *)(v4 - 8);
  v61 = v4;
  MEMORY[0x1E0C80A78](v4);
  v58 = (char *)v51 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC80);
  MEMORY[0x1E0C80A78](v6);
  v59 = (char *)v51 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC88);
  v62 = *(_QWORD *)(v65 - 8);
  MEMORY[0x1E0C80A78](v65);
  v57 = (uint64_t)v51 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC90);
  v10 = MEMORY[0x1E0C80A78](v9);
  v64 = (uint64_t)v51 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)v51 - v12;
  v63 = sub_1CFEB3B08();
  v14 = *(_OWORD *)(v1 + 16);
  v66 = *(_OWORD *)v1;
  v67 = v14;
  v68 = *(_QWORD *)(v1 + 32);
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC70);
  sub_1CFEB3BD4();
  v17 = *((_QWORD *)&v69 + 1);
  v16 = v69;
  v18 = v70;
  v19 = *((_QWORD *)&v70 + 1);
  v20 = v71;
  swift_getKeyPath();
  v69 = __PAIR128__(v17, v16);
  LOBYTE(v70) = v18;
  *((_QWORD *)&v70 + 1) = v19;
  v71 = v20;
  sub_1CFEB3BC8();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  v22 = *((_QWORD *)&v66 + 1);
  v21 = v66;
  v23 = v67;
  v24 = *(_OWORD *)(v2 + 16);
  v69 = *(_OWORD *)v2;
  v70 = v24;
  v71 = *(_QWORD *)(v2 + 32);
  MEMORY[0x1D17DDA74](&v66, v15);
  v25 = v66;
  swift_bridgeObjectRelease();
  v26 = 1;
  if (sub_1CFE6731C(v25, 1))
  {
    v54 = sub_1CFEB39E8();
    v53 = v27;
    v51[3] = v28;
    v52 = v29;
    v30 = *(_OWORD *)(v2 + 16);
    v66 = *(_OWORD *)v2;
    v67 = v30;
    v68 = *(_QWORD *)(v2 + 32);
    sub_1CFEB3BD4();
    v31 = (uint64_t)v13;
    v32 = v23;
    v34 = *((_QWORD *)&v69 + 1);
    v33 = v69;
    v35 = v70;
    v56 = v21;
    v55 = v22;
    v36 = *((_QWORD *)&v70 + 1);
    v37 = v71;
    swift_getKeyPath();
    v69 = __PAIR128__(v34, v33);
    LOBYTE(v70) = v35;
    *((_QWORD *)&v70 + 1) = v36;
    v71 = v37;
    sub_1CFEB3BC8();
    swift_bridgeObjectRelease();
    v23 = v32;
    v13 = (char *)v31;
    swift_release();
    swift_release();
    swift_release();
    v38 = v58;
    sub_1CFEB3C28();
    v39 = sub_1CFEB3A00();
    v41 = (uint64_t)v59;
    v40 = v60;
    v42 = v61;
    (*(void (**)(char *, char *, uint64_t))(v60 + 16))(v59, v38, v61);
    v43 = (uint64_t *)(v41 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA0) + 36));
    *v43 = v39;
    v43[1] = (uint64_t)sub_1CFE61130;
    v43[2] = 0;
    v44 = v38;
    v22 = v55;
    (*(void (**)(char *, uint64_t))(v40 + 8))(v44, v42);
    LOBYTE(v39) = sub_1CFEB3A60();
    v45 = v57;
    sub_1CFE67238(v41, v57, &qword_1EFBFEC80);
    v46 = v45 + *(int *)(v65 + 36);
    *(_BYTE *)v46 = v39;
    *(_OWORD *)(v46 + 8) = 0u;
    *(_OWORD *)(v46 + 24) = 0u;
    *(_BYTE *)(v46 + 40) = 1;
    v47 = v41;
    v21 = v56;
    sub_1CFE6727C(v47, &qword_1EFBFEC80);
    sub_1CFE672B8(v45, v31, &qword_1EFBFEC88);
    v26 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v62 + 56))(v13, v26, 1, v65);
  v48 = v64;
  sub_1CFE67238((uint64_t)v13, v64, &qword_1EFBFEC90);
  *(_QWORD *)a1 = 1919251285;
  *(_QWORD *)(a1 + 8) = 0xE400000000000000;
  *(_OWORD *)(a1 + 16) = xmmword_1CFEBD710;
  *(_QWORD *)(a1 + 32) = v63;
  *(_QWORD *)(a1 + 40) = v21;
  *(_QWORD *)(a1 + 48) = v22;
  *(_BYTE *)(a1 + 56) = v23;
  v49 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEC98);
  sub_1CFE67238(v48, a1 + *(int *)(v49 + 48), &qword_1EFBFEC90);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C((uint64_t)v13, &qword_1EFBFEC90);
  sub_1CFE6727C(v48, &qword_1EFBFEC90);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE61130()
{
  uint64_t v0;

  v0 = sub_1CFEB3A0C();
  return MEMORY[0x1D17DD804](v0);
}

uint64_t sub_1CFE61158()
{
  uint64_t v1;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B68();
  return v1;
}

uint64_t sub_1CFE61198@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  _QWORD *v16;
  _QWORD v18[12];

  v18[1] = a5;
  v18[0] = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1E0C80A78](v18[0]);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECB0);
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)v18 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18[4] = a1;
  v18[5] = a2;
  v18[6] = a3;
  v18[7] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECB8);
  sub_1CFE66DB4(&qword_1EFBFECC0, &qword_1EFBFECB8, MEMORY[0x1E0CE0680]);
  sub_1CFEB3A78();
  v18[9] = a1;
  v18[10] = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  v15 = sub_1CFEB3B68();
  (*(void (**)(uint64_t))(*(_QWORD *)v18[11] + 120))(v15);
  swift_release();
  v16 = (_QWORD *)swift_allocObject();
  v16[2] = a1;
  v16[3] = a2;
  v16[4] = a3;
  v16[5] = a4;
  swift_retain();
  swift_retain();
  sub_1CFE64D3C(a3);
  sub_1CFE66DB4(&qword_1EFBFECC8, &qword_1EFBFECB0, MEMORY[0x1E0CDD898]);
  sub_1CFE663D8(&qword_1EFBFECD0, type metadata accessor for StatusBarOverrides, (uint64_t)&unk_1CFEBE8C0);
  sub_1CFEB3ACC();
  swift_release();
  sub_1CFE64D98((uint64_t)v10);
  return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
}

uint64_t sub_1CFE613AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, void (*a5)(char *, uint64_t)@<X8>)
{
  uint64_t v9;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char *v46;
  char v47;
  char *v48;
  char *v49;
  char v50;
  char *v51;
  char *v52;
  char v53;
  char *v54;
  uint64_t v55;
  char *v56;
  char v57;
  char *v58;
  char *v59;
  char v60;
  char *v61;
  char *v62;
  char v63;
  char *v64;
  char *v65;
  char v66;
  char *v67;
  char *v68;
  char v69;
  char *v70;
  char *v71;
  char v72;
  char *v73;
  char *v74;
  char v75;
  char *v76;
  _QWORD *v77;
  void (*v78)(char *, char *, uint64_t);
  uint64_t v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  char *v85;
  char *v86;
  char *v87;
  uint64_t v88;
  char *v89;
  uint64_t v90;
  uint64_t v91;
  char *v92;
  uint64_t v93;
  char *v94;
  uint64_t v95;
  char *v96;
  char *v97;
  uint64_t v98;
  uint64_t v99;
  void (*v100)(char *, uint64_t);
  uint64_t v101;
  uint64_t v102;
  void (*v103)(char *, uint64_t);
  uint64_t v104;
  void (*v105)(char *, uint64_t);
  void (*v106)(char *, uint64_t);
  uint64_t v107;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  void (*v112)(char *, uint64_t);
  char *v113;
  char *v114;
  char *v115;
  uint64_t v116;
  char *v117;
  char *v118;
  char *v119;
  char *v120;
  char *v121;
  char *v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  char *v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  char *v139;
  uint64_t v140;
  uint64_t v141;
  char *v142;
  char *v143;
  uint64_t v144;
  char *v145;
  char *v146;
  char *v147;
  char *v148;
  char *v149;
  char *v150;
  uint64_t v151;
  char *v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  uint64_t v167;
  uint64_t v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  uint64_t v187;
  uint64_t v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  char *v194;
  char *v195;
  char *v196;
  char *v197;
  char *v198;
  char *v199;
  char *v200;
  char *v201;
  char *v202;
  char *v203;

  v112 = a5;
  v144 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDD0);
  v111 = *(_QWORD *)(v144 - 8);
  v9 = MEMORY[0x1E0C80A78](v144);
  v143 = (char *)&v109 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v142 = (char *)&v109 - v11;
  v140 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDD8);
  v110 = *(_QWORD *)(v140 - 8);
  v12 = MEMORY[0x1E0C80A78](v140);
  v139 = (char *)&v109 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v121 = (char *)&v109 - v14;
  v136 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDE0);
  v141 = *(_QWORD *)(v136 - 8);
  v15 = MEMORY[0x1E0C80A78](v136);
  v135 = (char *)&v109 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v15);
  v149 = (char *)&v109 - v17;
  v131 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDE8);
  v138 = *(_QWORD *)(v131 - 8);
  v18 = MEMORY[0x1E0C80A78](v131);
  v129 = (char *)&v109 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v148 = (char *)&v109 - v20;
  v151 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDF0);
  v137 = *(_QWORD *)(v151 - 8);
  v21 = MEMORY[0x1E0C80A78](v151);
  v124 = (char *)&v109 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v146 = (char *)&v109 - v23;
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEDF8);
  v133 = *(_QWORD *)(v24 - 8);
  v134 = v24;
  v25 = MEMORY[0x1E0C80A78](v24);
  v122 = (char *)&v109 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v25);
  v145 = (char *)&v109 - v27;
  v132 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE00);
  v130 = *(_QWORD *)(v132 - 8);
  v28 = MEMORY[0x1E0C80A78](v132);
  v120 = (char *)&v109 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v28);
  v152 = (char *)&v109 - v30;
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE08);
  v127 = *(_QWORD *)(v31 - 8);
  v128 = v31;
  v32 = MEMORY[0x1E0C80A78](v31);
  v118 = (char *)&v109 - ((v33 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v32);
  v150 = (char *)&v109 - v34;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE10);
  v125 = *(_QWORD *)(v35 - 8);
  v126 = v35;
  v36 = MEMORY[0x1E0C80A78](v35);
  v117 = (char *)&v109 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36);
  v147 = (char *)&v109 - v38;
  v116 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE18);
  v123 = *(_QWORD *)(v116 - 8);
  v39 = MEMORY[0x1E0C80A78](v116);
  v114 = (char *)&v109 - ((v40 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = MEMORY[0x1E0C80A78](v39);
  v113 = (char *)&v109 - v42;
  v43 = MEMORY[0x1E0C80A78](v41);
  v115 = (char *)&v109 - v44;
  MEMORY[0x1E0C80A78](v43);
  v119 = (char *)&v109 - v45;
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v46;
  LOBYTE(v195) = v47 & 1;
  v196 = v48;
  v189 = a1;
  v190 = a2;
  v191 = a3;
  v192 = a4;
  sub_1CFE66558();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v49;
  LOBYTE(v195) = v50 & 1;
  v196 = v51;
  v185 = a1;
  v186 = a2;
  v187 = a3;
  v188 = a4;
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v52;
  LOBYTE(v195) = v53 & 1;
  v196 = v54;
  v181 = a1;
  v182 = a2;
  v183 = a3;
  v184 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE28);
  v55 = MEMORY[0x1E0CE0680];
  sub_1CFE66DB4(&qword_1EFBFEE30, &qword_1EFBFEE28, MEMORY[0x1E0CE0680]);
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v56;
  LOBYTE(v195) = v57 & 1;
  v196 = v58;
  v177 = a1;
  v178 = a2;
  v179 = a3;
  v180 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE38);
  sub_1CFE66DB4(&qword_1EFBFEE40, &qword_1EFBFEE38, v55);
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v59;
  LOBYTE(v195) = v60 & 1;
  v196 = v61;
  v173 = a1;
  v174 = a2;
  v175 = a3;
  v176 = a4;
  sub_1CFE665F0();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v62;
  LOBYTE(v195) = v63 & 1;
  v196 = v64;
  v169 = a1;
  v170 = a2;
  v171 = a3;
  v172 = a4;
  sub_1CFE6663C();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v65;
  LOBYTE(v195) = v66 & 1;
  v196 = v67;
  v165 = a1;
  v166 = a2;
  v167 = a3;
  v168 = a4;
  sub_1CFE66688();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v68;
  LOBYTE(v195) = v69 & 1;
  v196 = v70;
  v161 = a1;
  v162 = a2;
  v163 = a3;
  v164 = a4;
  sub_1CFE666EC();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v71;
  LOBYTE(v195) = v72 & 1;
  v196 = v73;
  v157 = a1;
  v158 = a2;
  v159 = a3;
  v160 = a4;
  sub_1CFE66738();
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v193 = sub_1CFEB3A84();
  v194 = v74;
  LOBYTE(v195) = v75 & 1;
  v196 = v76;
  v153 = a1;
  v154 = a2;
  v155 = a3;
  v156 = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE70);
  sub_1CFE66DB4(&qword_1EFBFEE78, &qword_1EFBFEE70, MEMORY[0x1E0CE0680]);
  sub_1CFEB3C10();
  sub_1CFEB39E8();
  v77 = (_QWORD *)swift_allocObject();
  v77[2] = a1;
  v77[3] = a2;
  v77[4] = a3;
  v77[5] = a4;
  swift_retain();
  swift_retain();
  sub_1CFE64D3C(a3);
  sub_1CFEB3B80();
  v78 = *(void (**)(char *, char *, uint64_t))(v123 + 16);
  v79 = (uint64_t)v113;
  v80 = v116;
  v78(v113, v119, v116);
  v193 = v79;
  v81 = v114;
  v78(v114, v115, v80);
  v194 = v81;
  v82 = v117;
  (*(void (**)(char *, char *, uint64_t))(v125 + 16))(v117, v147, v126);
  v195 = v82;
  v83 = v118;
  (*(void (**)(char *, char *, uint64_t))(v127 + 16))(v118, v150, v128);
  v196 = v83;
  v84 = v120;
  (*(void (**)(char *, char *, uint64_t))(v130 + 16))(v120, v152, v132);
  v197 = v84;
  v85 = v122;
  (*(void (**)(char *, char *, uint64_t))(v133 + 16))(v122, v145, v134);
  v198 = v85;
  v86 = v124;
  (*(void (**)(char *, char *, uint64_t))(v137 + 16))(v124, v146, v151);
  v199 = v86;
  v87 = v129;
  v88 = v131;
  (*(void (**)(char *, char *, uint64_t))(v138 + 16))(v129, v148, v131);
  v200 = v87;
  v89 = v135;
  v90 = v136;
  (*(void (**)(char *, char *, uint64_t))(v141 + 16))(v135, v149, v136);
  v201 = v89;
  v91 = v110;
  v92 = v139;
  v93 = v140;
  v94 = v121;
  (*(void (**)(char *, char *, uint64_t))(v110 + 16))(v139, v121, v140);
  v202 = v92;
  v95 = v111;
  v97 = v142;
  v96 = v143;
  v98 = v144;
  (*(void (**)(char *, char *, uint64_t))(v111 + 16))(v143, v142, v144);
  v203 = v96;
  sub_1CFE5A930(&v193, (uint64_t)v112);
  v112 = *(void (**)(char *, uint64_t))(v95 + 8);
  v112(v97, v98);
  v142 = *(char **)(v91 + 8);
  ((void (*)(char *, uint64_t))v142)(v94, v93);
  v141 = *(_QWORD *)(v141 + 8);
  ((void (*)(char *, uint64_t))v141)(v149, v90);
  v149 = *(char **)(v138 + 8);
  ((void (*)(char *, uint64_t))v149)(v148, v88);
  v148 = *(char **)(v137 + 8);
  ((void (*)(char *, uint64_t))v148)(v146, v151);
  v99 = v134;
  v146 = *(char **)(v133 + 8);
  ((void (*)(char *, uint64_t))v146)(v145, v134);
  v100 = *(void (**)(char *, uint64_t))(v130 + 8);
  v101 = v132;
  v100(v152, v132);
  v102 = v128;
  v103 = *(void (**)(char *, uint64_t))(v127 + 8);
  v103(v150, v128);
  v104 = v126;
  v105 = *(void (**)(char *, uint64_t))(v125 + 8);
  v105(v147, v126);
  v106 = *(void (**)(char *, uint64_t))(v123 + 8);
  v107 = v116;
  v106(v115, v116);
  v106(v119, v107);
  v112(v143, v144);
  ((void (*)(char *, uint64_t))v142)(v139, v140);
  ((void (*)(char *, uint64_t))v141)(v135, v136);
  ((void (*)(char *, uint64_t))v149)(v129, v131);
  ((void (*)(char *, uint64_t))v148)(v124, v151);
  ((void (*)(char *, uint64_t))v146)(v122, v99);
  v100(v120, v101);
  v103(v118, v102);
  v105(v117, v104);
  v106(v114, v107);
  return ((uint64_t (*)(char *, uint64_t))v106)(v113, v107);
}

uint64_t sub_1CFE621D8(uint64_t a1)
{
  return (*(uint64_t (**)(void))(**(_QWORD **)a1 + 120))();
}

uint64_t sub_1CFE62200(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v4 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v8 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFE6681C(a1, (uint64_t)v6);
  return (*(uint64_t (**)(char *))(**(_QWORD **)a2 + 128))(v6);
}

__n128 sub_1CFE62280@<Q0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  __n128 result;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __n128 v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v18;
  v10 = v19;
  v11 = v20;
  swift_getKeyPath();
  v18 = v9;
  v19 = v10;
  v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v12 = v19;
  v13 = v20;
  result = v23;
  v15 = v24;
  v16 = v21;
  v17 = v22;
  *(_QWORD *)a3 = v18;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13;
  *(_OWORD *)(a3 + 24) = v16;
  *(_OWORD *)(a3 + 40) = v17;
  *(__n128 *)(a3 + 56) = result;
  *(_QWORD *)(a3 + 72) = v15;
  return result;
}

uint64_t sub_1CFE623EC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
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
  char v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v26;
  uint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v27 = a2;
  v36 = a1;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v26);
  v7 = (char *)&v26 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = sub_1CFEB3B38();
  v42 = a1;
  v43 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v37;
  v8 = v38;
  v10 = v39;
  swift_getKeyPath();
  v37 = v9;
  v38 = v8;
  v39 = v10;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v7, &qword_1EFBFEE88);
  v31 = v37;
  v33 = v38;
  v32 = v39;
  v34 = sub_1CFEB3AE4();
  v11 = v27;
  v42 = v36;
  v43 = v27;
  sub_1CFEB3B74();
  v12 = v37;
  v13 = v38;
  v14 = v39;
  swift_getKeyPath();
  v37 = v12;
  v38 = v13;
  v39 = v14;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v7, &qword_1EFBFEE88);
  v29 = v38;
  v30 = v37;
  v28 = v39;
  v42 = v36;
  v43 = v11;
  sub_1CFEB3B74();
  v15 = v37;
  v16 = v38;
  v17 = v39;
  swift_getKeyPath();
  v37 = v15;
  v38 = v16;
  v39 = v17;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v7, &qword_1EFBFEE88);
  v18 = v37;
  v19 = v38;
  v20 = v39;
  v21 = v41;
  v22 = v40;
  strcpy((char *)a3, "Airplane Mode");
  *(_WORD *)(a3 + 14) = -4864;
  *(_OWORD *)(a3 + 16) = xmmword_1CFEBD720;
  v23 = v31;
  *(_QWORD *)(a3 + 32) = v35;
  *(_QWORD *)(a3 + 40) = v23;
  *(_QWORD *)(a3 + 48) = v33;
  *(_BYTE *)(a3 + 56) = v32;
  *(_QWORD *)(a3 + 64) = 5132374;
  *(_QWORD *)(a3 + 72) = 0xE300000000000000;
  *(_QWORD *)(a3 + 80) = 0xD00000000000001FLL;
  *(_QWORD *)(a3 + 88) = 0x80000001CFEC2BD0;
  v24 = v30;
  *(_QWORD *)(a3 + 96) = v34;
  *(_QWORD *)(a3 + 104) = v24;
  *(_QWORD *)(a3 + 112) = v29;
  *(_BYTE *)(a3 + 120) = v28;
  *(_QWORD *)(a3 + 128) = v18;
  *(_QWORD *)(a3 + 136) = v19;
  *(_BYTE *)(a3 + 144) = v20;
  *(_OWORD *)(a3 + 152) = v22;
  *(_QWORD *)(a3 + 168) = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE627C8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, _QWORD *a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
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
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;
  BOOL v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  _QWORD *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  char *v87;
  uint64_t v88;
  uint64_t v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  char *v99;
  uint64_t v100;
  uint64_t v101;
  int v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  _QWORD *v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;

  v86 = a4;
  v85 = a3;
  v98 = a2;
  v109 = a5;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE98);
  MEMORY[0x1E0C80A78](v96);
  v97 = (uint64_t)&v84 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v88 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEA0);
  MEMORY[0x1E0C80A78](v88);
  v89 = (uint64_t)&v84 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v95 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEA8);
  MEMORY[0x1E0C80A78](v95);
  v90 = (char *)&v84 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEB0);
  MEMORY[0x1E0C80A78](v10);
  v92 = (uint64_t)&v84 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v93 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEB8);
  v12 = MEMORY[0x1E0C80A78](v93);
  v91 = (uint64_t)&v84 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v94 = (uint64_t)&v84 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEC0);
  MEMORY[0x1E0C80A78](v15);
  v87 = (char *)&v84 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v100 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1E0C80A78](v100);
  v99 = (char *)&v84 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEC8);
  v19 = MEMORY[0x1E0C80A78](v18);
  v108 = (char *)&v84 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v107 = (uint64_t)&v84 - v21;
  v111 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEED0);
  MEMORY[0x1E0C80A78](v111);
  v23 = (char *)&v84 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v101 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v101);
  v25 = (char *)&v84 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = sub_1CFEB3AF0();
  v112 = a1;
  v113 = a2;
  v110 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v27 = v114;
  v26 = v115;
  v28 = v116;
  swift_getKeyPath();
  v114 = v27;
  v115 = v26;
  v116 = v28;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v25, &qword_1EFBFEE88);
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v23, &qword_1EFBFEED0);
  v103 = v115;
  v104 = v114;
  v102 = v116;
  v105 = sub_1CFEB3AD8();
  v29 = v98;
  v112 = a1;
  v113 = v98;
  sub_1CFEB3B74();
  v30 = v114;
  v31 = v115;
  v32 = v116;
  swift_getKeyPath();
  v114 = v30;
  v115 = v31;
  v116 = v32;
  v33 = (uint64_t)v99;
  sub_1CFEB3BC8();
  swift_release();
  v34 = v100;
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  v35 = (uint64_t)v25;
  v36 = a1;
  sub_1CFE6727C(v35, &qword_1EFBFEE88);
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v23, &qword_1EFBFEED0);
  v37 = v114;
  v101 = v115;
  LODWORD(v111) = v116;
  v114 = a1;
  v115 = v29;
  v38 = sub_1CFEB3B68();
  (*(void (**)(uint64_t))(*(_QWORD *)v112 + 120))(v38);
  swift_release();
  LOBYTE(v30) = *(_BYTE *)(v33 + *(int *)(v34 + 40));
  sub_1CFE64D98(v33);
  if (sub_1CFE6731C(v30, 1)
    && (v114 = a1,
        v115 = v29,
        v39 = sub_1CFEB3B68(),
        (*(void (**)(uint64_t))(*(_QWORD *)v112 + 120))(v39),
        swift_release(),
        v40 = *(_BYTE *)(v33 + *(int *)(v34 + 36)),
        sub_1CFE64D98(v33),
        sub_1CFE6731C(v40, 1)))
  {
    sub_1CFEB3CB8();
    swift_retain();
    swift_retain();
    v41 = v85;
    v42 = v86;
    sub_1CFE64D3C(v85);
    v43 = sub_1CFEB3CAC();
    v44 = (_QWORD *)swift_allocObject();
    v45 = MEMORY[0x1E0DF06E8];
    v44[2] = v43;
    v44[3] = v45;
    v44[4] = v36;
    v44[5] = v29;
    v44[6] = v41;
    v44[7] = v42;
    swift_retain();
    swift_retain();
    sub_1CFE64D3C(v41);
    v46 = sub_1CFEB3CAC();
    v47 = (_QWORD *)swift_allocObject();
    v47[2] = v46;
    v47[3] = v45;
    v47[4] = v36;
    v47[5] = v29;
    v47[6] = v41;
    v47[7] = v42;
    sub_1CFEB385C();
    v48 = v37;
    v49 = (uint64_t)v87;
    sub_1CFEB3BE0();
    v50 = v92;
    sub_1CFE637D4(v49, v92);
    LOBYTE(v46) = sub_1CFEB3A60();
    v51 = v91;
    sub_1CFE67238(v50, v91, &qword_1EFBFEEB0);
    v52 = v51 + *(int *)(v93 + 36);
    *(_BYTE *)v52 = v46;
    *(_OWORD *)(v52 + 8) = 0u;
    *(_OWORD *)(v52 + 24) = 0u;
    *(_BYTE *)(v52 + 40) = 1;
    sub_1CFE6727C(v50, &qword_1EFBFEEB0);
    v53 = v94;
    sub_1CFE672B8(v51, v94, &qword_1EFBFEEB8);
    sub_1CFE67238(v53, v89, &qword_1EFBFEEB8);
    swift_storeEnumTagMultiPayload();
    sub_1CFE668C4();
    v54 = (uint64_t)v90;
    sub_1CFEB3A30();
    sub_1CFE67238(v54, v97, &qword_1EFBFEEA8);
    swift_storeEnumTagMultiPayload();
    sub_1CFE66860();
    v55 = (uint64_t)v108;
    sub_1CFEB3A30();
    sub_1CFE6727C(v54, &qword_1EFBFEEA8);
    sub_1CFE6727C(v53, &qword_1EFBFEEB8);
    v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEED8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v56 - 8) + 56))(v55, 0, 1, v56);
    v57 = v107;
    sub_1CFE672B8(v55, v107, &qword_1EFBFEEC8);
    v58 = v49;
    v37 = v48;
    sub_1CFE6727C(v58, &qword_1EFBFEEC0);
  }
  else
  {
    v114 = a1;
    v115 = v29;
    v59 = sub_1CFEB3B68();
    (*(void (**)(uint64_t))(*(_QWORD *)v112 + 120))(v59);
    swift_release();
    v60 = *(_BYTE *)(v33 + *(int *)(v34 + 36));
    sub_1CFE64D98(v33);
    if (sub_1CFE6731C(v60, 1))
    {
      v61 = v92;
      sub_1CFE639A4(a1, v29, (uint64_t)&unk_1CFEBE288, (void (*)(void))MEMORY[0x1E0CDB938], v92);
      v62 = sub_1CFEB3A60();
      v63 = v91;
      sub_1CFE67238(v61, v91, &qword_1EFBFEEB0);
      v64 = v63 + *(int *)(v93 + 36);
      *(_BYTE *)v64 = v62;
      *(_OWORD *)(v64 + 8) = 0u;
      *(_OWORD *)(v64 + 24) = 0u;
      *(_BYTE *)(v64 + 40) = 1;
      sub_1CFE6727C(v61, &qword_1EFBFEEB0);
      v65 = v94;
      sub_1CFE672B8(v63, v94, &qword_1EFBFEEB8);
      sub_1CFE67238(v65, v89, &qword_1EFBFEEB8);
      swift_storeEnumTagMultiPayload();
      sub_1CFE668C4();
      v66 = (uint64_t)v90;
      sub_1CFEB3A30();
      sub_1CFE67238(v66, v97, &qword_1EFBFEEA8);
      swift_storeEnumTagMultiPayload();
      sub_1CFE66860();
      v55 = (uint64_t)v108;
      sub_1CFEB3A30();
      sub_1CFE6727C(v66, &qword_1EFBFEEA8);
      v67 = v65;
    }
    else
    {
      v114 = a1;
      v115 = v29;
      v68 = sub_1CFEB3B68();
      (*(void (**)(uint64_t))(*(_QWORD *)v112 + 120))(v68);
      swift_release();
      v69 = *(_BYTE *)(v33 + *(int *)(v34 + 40));
      sub_1CFE64D98(v33);
      v70 = sub_1CFE6731C(v69, 1);
      v55 = (uint64_t)v108;
      if (!v70)
      {
        v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEED8);
        v57 = v107;
        (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v77 - 8) + 56))(v107, 1, 1, v77);
        goto LABEL_10;
      }
      v71 = v92;
      sub_1CFE639A4(a1, v29, (uint64_t)&unk_1CFEBE2C8, (void (*)(void))MEMORY[0x1E0CDB948], v92);
      v72 = sub_1CFEB3A60();
      v73 = v91;
      sub_1CFE67238(v71, v91, &qword_1EFBFEEB0);
      v74 = v73 + *(int *)(v93 + 36);
      *(_BYTE *)v74 = v72;
      *(_OWORD *)(v74 + 8) = 0u;
      *(_OWORD *)(v74 + 24) = 0u;
      *(_BYTE *)(v74 + 40) = 1;
      sub_1CFE6727C(v71, &qword_1EFBFEEB0);
      v75 = v94;
      sub_1CFE672B8(v73, v94, &qword_1EFBFEEB8);
      sub_1CFE67238(v75, v97, &qword_1EFBFEEB8);
      swift_storeEnumTagMultiPayload();
      sub_1CFE66860();
      sub_1CFE668C4();
      sub_1CFEB3A30();
      v67 = v75;
    }
    sub_1CFE6727C(v67, &qword_1EFBFEEB8);
    v76 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEED8);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v76 - 8) + 56))(v55, 0, 1, v76);
    v57 = v107;
    sub_1CFE672B8(v55, v107, &qword_1EFBFEEC8);
  }
LABEL_10:
  sub_1CFE67238(v57, v55, &qword_1EFBFEEC8);
  v78 = v109;
  *v109 = 0x656469727265764FLL;
  v78[1] = 0xED0000656D695420;
  *((_OWORD *)v78 + 1) = xmmword_1CFEBD730;
  v79 = v105;
  v81 = v103;
  v80 = v104;
  v78[4] = v106;
  v78[5] = v80;
  v78[6] = v81;
  *((_BYTE *)v78 + 56) = v102;
  strcpy((char *)v78 + 64, "Override Date");
  *((_WORD *)v78 + 39) = -4864;
  *((_OWORD *)v78 + 5) = xmmword_1CFEBD740;
  v78[12] = v79;
  v78[13] = v37;
  v78[14] = v101;
  *((_BYTE *)v78 + 120) = v111;
  v82 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEE0);
  sub_1CFE67238(v55, (uint64_t)v78 + *(int *)(v82 + 64), &qword_1EFBFEEC8);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_1CFE6727C(v57, &qword_1EFBFEEC8);
  sub_1CFE6727C(v55, &qword_1EFBFEEC8);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE63568@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  int *v16;
  char *v17;
  char *v18;
  void (*v19)(char *, uint64_t);
  uint64_t v20;
  uint64_t v22;
  void (*v23)(char *, char *, uint64_t);
  uint64_t v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v26 = a3;
  v5 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v22 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1CFEB385C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v22 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = a1;
  v25 = a2;
  v27 = a1;
  v28 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  v15 = sub_1CFEB3B68();
  (*(void (**)(uint64_t))(*(_QWORD *)v29 + 120))(v15);
  swift_release();
  v16 = (int *)(v12 + 36);
  v17 = &v14[*(int *)(v12 + 36) + (uint64_t)*(int *)(v5 + 20)];
  v23 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v23(v11, v17, v8);
  sub_1CFE64D98((uint64_t)v14);
  sub_1CFE67614(v7);
  v18 = &v7[*(int *)(v5 + 20)];
  sub_1CFE663D8(&qword_1EFBFEF30, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB0870], MEMORY[0x1E0CB08B8]);
  LOBYTE(a2) = sub_1CFEB3C58();
  v19 = *(void (**)(char *, uint64_t))(v9 + 8);
  v19(v11, v8);
  v19(v18, v8);
  v27 = v24;
  v28 = v25;
  v20 = sub_1CFEB3B68();
  (*(void (**)(uint64_t))(*(_QWORD *)v29 + 120))(v20);
  swift_release();
  if ((a2 & 1) != 0)
    v16 = (int *)(v12 + 40);
  v23(v26, &v14[*v16 + (uint64_t)*(int *)(v5 + 20)], v8);
  return sub_1CFE64D98((uint64_t)v14);
}

uint64_t sub_1CFE637D4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  _QWORD v9[4];

  v9[2] = a2;
  v3 = sub_1CFEB3A54();
  MEMORY[0x1E0C80A78](v3);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEC0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9[1] = sub_1CFEB39E8();
  sub_1CFE67238(a1, (uint64_t)v6, &qword_1EFBFEEC0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF10);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1CFEBD750;
  sub_1CFEB3A48();
  sub_1CFEB3A3C();
  v9[3] = v7;
  sub_1CFE663D8(&qword_1EFBFEF18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDB958], MEMORY[0x1E0CDB970]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF20);
  sub_1CFE66DB4(&qword_1EFBFEF28, &qword_1EFBFEF20, MEMORY[0x1E0DEAF38]);
  sub_1CFEB3CE8();
  return sub_1CFEB3910();
}

uint64_t sub_1CFE639A4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X3>, void (*a4)(void)@<X4>, uint64_t a5@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD v25[3];
  int v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(void);
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;

  v30 = a4;
  v25[2] = a3;
  v33 = a5;
  v32 = sub_1CFEB3A54();
  MEMORY[0x1E0C80A78](v32);
  v31 = (char *)v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEEC0);
  MEMORY[0x1E0C80A78](v8);
  v25[1] = (char *)v25 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEED0);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)v25 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)v25 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = sub_1CFEB39E8();
  v28 = v17;
  v29 = v16;
  v26 = v18;
  v27 = v19;
  v34 = a1;
  v35 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v20 = v36;
  v21 = v37;
  v22 = v38;
  swift_getKeyPath();
  v36 = v20;
  v37 = v21;
  v38 = v22;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v15, &qword_1EFBFEE88);
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v12, &qword_1EFBFEED0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF10);
  v23 = swift_allocObject();
  *(_OWORD *)(v23 + 16) = xmmword_1CFEBD760;
  v30();
  v36 = v23;
  sub_1CFE663D8(&qword_1EFBFEF18, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDB958], MEMORY[0x1E0CDB970]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEF20);
  sub_1CFE66DB4(&qword_1EFBFEF28, &qword_1EFBFEF20, MEMORY[0x1E0DEAF38]);
  sub_1CFEB3CE8();
  return sub_1CFEB3910();
}

double sub_1CFE63CC4@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  double result;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t v26;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v25 = a1;
  v26 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v18;
  v10 = v19;
  v11 = v20;
  swift_getKeyPath();
  v18 = v9;
  v19 = v10;
  v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v12 = v19;
  v13 = v20;
  v14 = v21;
  result = v22;
  v16 = v23;
  v17 = v24;
  *(_QWORD *)a3 = v18;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13;
  *(_QWORD *)(a3 + 24) = v14;
  *(double *)(a3 + 32) = result;
  *(_BYTE *)(a3 + 40) = v16;
  *(_BYTE *)(a3 + 41) = v17;
  *(_BYTE *)(a3 + 42) = 1;
  return result;
}

double sub_1CFE63E38@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  double result;
  char v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char v24;
  uint64_t v25;
  double v26;
  char v27;
  char v28;
  uint64_t v29;
  uint64_t v30;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v20 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = a1;
  v30 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v20;
  v10 = v21;
  v11 = v22;
  swift_getKeyPath();
  v20 = v9;
  v21 = v10;
  v22 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v12 = v21;
  v13 = v22;
  v14 = v23;
  v15 = v24;
  v16 = v25;
  result = v26;
  v18 = v27;
  v19 = v28;
  *(_QWORD *)a3 = v20;
  *(_QWORD *)(a3 + 8) = v12;
  *(_BYTE *)(a3 + 16) = v13;
  *(_QWORD *)(a3 + 24) = v14;
  *(_BYTE *)(a3 + 32) = v15;
  *(_QWORD *)(a3 + 40) = v16;
  *(double *)(a3 + 48) = result;
  *(_BYTE *)(a3 + 56) = v18;
  *(_BYTE *)(a3 + 57) = v19;
  return result;
}

uint64_t sub_1CFE63FB4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = a1;
  v21 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v16;
  v10 = v17;
  v11 = v18;
  swift_getKeyPath();
  v16 = v9;
  v17 = v10;
  v18 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  result = sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v13 = v17;
  v14 = v18;
  v15 = v19;
  *(_QWORD *)a3 = v16;
  *(_QWORD *)(a3 + 8) = v13;
  *(_BYTE *)(a3 + 16) = v14;
  *(_QWORD *)(a3 + 24) = v15;
  return result;
}

uint64_t sub_1CFE64108@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t result;
  uint64_t v13;
  char v14;
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

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = a1;
  v24 = a2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v9 = v18;
  v10 = v19;
  v11 = v20;
  swift_getKeyPath();
  v18 = v9;
  v19 = v10;
  v20 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  result = sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v13 = v19;
  v14 = v20;
  v15 = v21;
  v16 = v22;
  *(_QWORD *)a3 = v18;
  *(_QWORD *)(a3 + 8) = v13;
  *(_BYTE *)(a3 + 16) = v14;
  *(_QWORD *)(a3 + 24) = v15;
  *(_QWORD *)(a3 + 32) = v16;
  return result;
}

uint64_t sub_1CFE6425C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  char v31;
  int v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v38;
  int v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  uint64_t v44;
  uint64_t v45;
  int v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  _BYTE v70[7];
  _BYTE v71[7];
  _BYTE v72[7];

  v64 = a2;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE88);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v38 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = sub_1CFEB3AFC();
  v65 = a1;
  v66 = a2;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B74();
  v10 = v67;
  v11 = v68;
  v12 = v69;
  swift_getKeyPath();
  v67 = v10;
  v68 = v11;
  v69 = v12;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFEE90);
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  v55 = v6;
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v52 = v67;
  v51 = v68;
  v53 = v69;
  v62 = sub_1CFEB3B38();
  v65 = a1;
  v66 = v64;
  v56 = v9;
  sub_1CFEB3B74();
  v13 = v67;
  v14 = v68;
  v15 = v69;
  swift_getKeyPath();
  v67 = v13;
  v68 = v14;
  v69 = v15;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v49 = v67;
  v48 = v68;
  v50 = v69;
  v60 = sub_1CFEB3B14();
  v57 = a1;
  v65 = a1;
  v66 = v64;
  sub_1CFEB3B74();
  v16 = v67;
  v17 = v68;
  v18 = v69;
  swift_getKeyPath();
  v67 = v16;
  v68 = v17;
  v69 = v18;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v45 = v67;
  v61 = v68;
  v46 = v69;
  v47 = sub_1CFEB3AE4();
  v65 = a1;
  v66 = v64;
  sub_1CFEB3B74();
  v19 = v67;
  v20 = v68;
  v21 = v69;
  swift_getKeyPath();
  v67 = v19;
  v68 = v20;
  v69 = v21;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v58 = v67;
  v59 = v68;
  v43 = v69;
  v44 = sub_1CFEB3B20();
  v22 = v64;
  v65 = v57;
  v66 = v64;
  sub_1CFEB3B74();
  v23 = v67;
  v24 = v68;
  v25 = v69;
  swift_getKeyPath();
  v67 = v23;
  v68 = v24;
  v69 = v25;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v41 = v67;
  v40 = v68;
  v39 = v69;
  v42 = sub_1CFEB3B44();
  v65 = v57;
  v66 = v22;
  sub_1CFEB3B74();
  v26 = v67;
  v27 = v68;
  v28 = v69;
  swift_getKeyPath();
  v67 = v26;
  v68 = v27;
  v69 = v28;
  sub_1CFEB3BC8();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_getKeyPath();
  sub_1CFEB3BC8();
  swift_release();
  sub_1CFE6727C((uint64_t)v8, &qword_1EFBFEE88);
  v29 = v67;
  v30 = v68;
  v31 = v69;
  *(_DWORD *)(a3 + 57) = v67;
  *(_DWORD *)(a3 + 60) = *(_DWORD *)((char *)&v67 + 3);
  *(_DWORD *)(a3 + 121) = v65;
  *(_DWORD *)(a3 + 124) = *(_DWORD *)((char *)&v65 + 3);
  *(_DWORD *)(a3 + 185) = *(_DWORD *)v72;
  *(_DWORD *)(a3 + 188) = *(_DWORD *)&v72[3];
  *(_DWORD *)(a3 + 252) = *(_DWORD *)&v71[3];
  *(_DWORD *)(a3 + 249) = *(_DWORD *)v71;
  v32 = *(_DWORD *)v70;
  *(_DWORD *)(a3 + 316) = *(_DWORD *)&v70[3];
  *(_DWORD *)(a3 + 313) = v32;
  strcpy((char *)a3, "Rotation Lock");
  *(_WORD *)(a3 + 14) = -4864;
  *(_OWORD *)(a3 + 16) = xmmword_1CFEBD770;
  v33 = v52;
  *(_QWORD *)(a3 + 32) = v54;
  *(_QWORD *)(a3 + 40) = v33;
  *(_QWORD *)(a3 + 48) = v51;
  *(_BYTE *)(a3 + 56) = v53;
  *(_QWORD *)(a3 + 64) = 0x6D72616C41;
  *(_QWORD *)(a3 + 72) = 0xE500000000000000;
  *(_OWORD *)(a3 + 80) = xmmword_1CFEBD780;
  v34 = v49;
  *(_QWORD *)(a3 + 96) = v62;
  *(_QWORD *)(a3 + 104) = v34;
  *(_QWORD *)(a3 + 112) = v48;
  *(_BYTE *)(a3 + 120) = v50;
  *(_QWORD *)(a3 + 128) = 0x746E6564757453;
  *(_QWORD *)(a3 + 136) = 0xE700000000000000;
  *(_OWORD *)(a3 + 144) = xmmword_1CFEBD790;
  v35 = v45;
  *(_QWORD *)(a3 + 160) = v60;
  *(_QWORD *)(a3 + 168) = v35;
  *(_QWORD *)(a3 + 176) = v61;
  *(_BYTE *)(a3 + 184) = v46;
  *(_QWORD *)(a3 + 192) = 0x79616C50726941;
  *(_QWORD *)(a3 + 200) = 0xE700000000000000;
  *(_OWORD *)(a3 + 208) = xmmword_1CFEBD7A0;
  v36 = v58;
  *(_QWORD *)(a3 + 224) = v47;
  *(_QWORD *)(a3 + 232) = v36;
  *(_QWORD *)(a3 + 240) = v59;
  *(_BYTE *)(a3 + 248) = v43;
  *(_QWORD *)(a3 + 256) = 0x79616C50726143;
  *(_QWORD *)(a3 + 264) = 0xE700000000000000;
  *(_OWORD *)(a3 + 272) = xmmword_1CFEBD7B0;
  *(_QWORD *)(a3 + 288) = v44;
  *(_QWORD *)(a3 + 296) = v41;
  *(_QWORD *)(a3 + 304) = v40;
  *(_BYTE *)(a3 + 312) = v39;
  *(_QWORD *)(a3 + 320) = 0xD000000000000010;
  *(_QWORD *)(a3 + 328) = 0x80000001CFEC2BB0;
  *(_OWORD *)(a3 + 336) = xmmword_1CFEBD7C0;
  *(_QWORD *)(a3 + 352) = v42;
  *(_QWORD *)(a3 + 360) = v29;
  *(_QWORD *)(a3 + 368) = v30;
  *(_BYTE *)(a3 + 376) = v31;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain_n();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease_n();
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE64B30()
{
  uint64_t v1;

  type metadata accessor for StatusBarOverrideData(0);
  sub_1CFEB3B5C();
  return v1;
}

uint64_t sub_1CFE64B80@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1CFE61198(*v1, v1[1], v1[2], v1[3], a1);
}

uint64_t sub_1CFE64B8C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;

  type metadata accessor for StatusBarOverrideData(0);
  sub_1CFE69FD0();
  result = sub_1CFEB3B5C();
  *a1 = v3;
  a1[1] = v4;
  a1[2] = 0;
  a1[3] = 0;
  return result;
}

uint64_t sub_1CFE64BE4()
{
  sub_1CFE664F4();
  return sub_1CFEB3970();
}

uint64_t sub_1CFE64C1C()
{
  sub_1CFE664F4();
  return sub_1CFEB3964();
}

uint64_t sub_1CFE64C5C()
{
  return sub_1CFEB3D24();
}

uint64_t sub_1CFE64C84()
{
  sub_1CFEB3D18();
  sub_1CFEB3D24();
  return sub_1CFEB3D30();
}

uint64_t sub_1CFE64CC8()
{
  sub_1CFEB3D18();
  sub_1CFEB3D24();
  return sub_1CFEB3D30();
}

BOOL sub_1CFE64D08(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

_QWORD *sub_1CFE64D1C@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

void sub_1CFE64D2C(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1CFE64D3C(uint64_t result)
{
  if (result)
    return swift_retain();
  return result;
}

uint64_t sub_1CFE64D4C(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1CFE64D5C@<X0>(void (*a1)(char *, uint64_t)@<X8>)
{
  uint64_t *v1;

  return sub_1CFE613AC(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1CFE64D6C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t result;

  v3 = *(uint64_t (**)(uint64_t))(v2 + 32);
  if (v3)
    return v3(a2);
  return result;
}

uint64_t sub_1CFE64D98(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1CFE64DD4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64DE4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64DF4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E04()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E14()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E24()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E34()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E44()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1CFE64E54()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1CFE64E68()
{
  unint64_t result;

  result = qword_1EFBFECD8;
  if (!qword_1EFBFECD8)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDBF4, &type metadata for StatusBarDataOverridesView_Previews);
    atomic_store(result, (unint64_t *)&qword_1EFBFECD8);
  }
  return result;
}

uint64_t sub_1CFE64EAC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t initializeBufferWithCopyOfBuffer for StatusBarOverrideToggle(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
}

uint64_t destroy for StatusBarOverrideToggle()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v4;
  v5 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v5;
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_retain();
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

__n128 __swift_memcpy57_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 41) = *(_OWORD *)(a2 + 41);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarOverrideToggle(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  swift_release();
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  swift_release();
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrideToggle(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 57))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrideToggle(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 57) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 57) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrideToggle()
{
  return &type metadata for StatusBarOverrideToggle;
}

uint64_t destroy for StatusBarCellularOverrideView()
{
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  v4 = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = v4;
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy80_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  *(_OWORD *)a1 = *(_OWORD *)a2;
  result = *(__n128 *)(a2 + 16);
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 64) = v4;
  *(__n128 *)(a1 + 16) = result;
  *(_OWORD *)(a1 + 32) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarCellularOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarCellularOverrideView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 80))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarCellularOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 72) = 0;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 80) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 80) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarCellularOverrideView()
{
  return &type metadata for StatusBarCellularOverrideView;
}

uint64_t destroy for StatusBarWiFiOverrideView()
{
  swift_release();
  return swift_release();
}

uint64_t initializeWithCopy for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

__n128 __swift_memcpy48_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v3;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarWiFiOverrideView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarWiFiOverrideView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 48))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarWiFiOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 48) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarWiFiOverrideView()
{
  return &type metadata for StatusBarWiFiOverrideView;
}

__n128 __swift_memcpy32_8(_OWORD *a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *a1 = *(_OWORD *)a2;
  a1[1] = v3;
  return result;
}

ValueMetadata *type metadata accessor for StatusBarLocationOverrideView()
{
  return &type metadata for StatusBarLocationOverrideView;
}

uint64_t initializeWithCopy for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  return a1;
}

__n128 __swift_memcpy43_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 27) = *(_OWORD *)(a2 + 27);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarBatteryOverrideView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_BYTE *)(a1 + 40) = *(_BYTE *)(a2 + 40);
  *(_BYTE *)(a1 + 41) = *(_BYTE *)(a2 + 41);
  *(_BYTE *)(a1 + 42) = *(_BYTE *)(a2 + 42);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarBatteryOverrideView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 43))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarBatteryOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 42) = 0;
    *(_WORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 43) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 43) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarBatteryOverrideView()
{
  return &type metadata for StatusBarBatteryOverrideView;
}

uint64_t initializeWithCopy for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __int128 v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 32) = v4;
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

__n128 __swift_memcpy58_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 42) = *(_OWORD *)(a2 + 42);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarBluetoothOverrideView(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_BYTE *)(a1 + 56) = *(_BYTE *)(a2 + 56);
  *(_BYTE *)(a1 + 57) = *(_BYTE *)(a2 + 57);
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarBluetoothOverrideView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 58))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarBluetoothOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 56) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 58) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 58) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarBluetoothOverrideView()
{
  return &type metadata for StatusBarBluetoothOverrideView;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwcp_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
  swift_retain();
  swift_retain();
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwca_0(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwta_0(uint64_t a1, uint64_t a2)
{
  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  return a1;
}

uint64_t _s14SystemStatusUI29StatusBarLocationOverrideViewVwet_0(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t sub_1CFE65BA8(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarVoiceControlOverrideView()
{
  return &type metadata for StatusBarVoiceControlOverrideView;
}

uint64_t destroy for StatusBarUserOverrideView()
{
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_retain();
  swift_retain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_retain();
  swift_release();
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy40_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarUserOverrideView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarUserOverrideView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 40))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarUserOverrideView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 8) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 40) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 40) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarUserOverrideView()
{
  return &type metadata for StatusBarUserOverrideView;
}

uint64_t destroy for StatusBarDataOverridesView(uint64_t a1)
{
  uint64_t result;

  swift_release();
  result = swift_release();
  if (*(_QWORD *)(a1 + 16))
    return swift_release();
  return result;
}

_QWORD *initializeWithCopy for StatusBarDataOverridesView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  _OWORD *v6;
  uint64_t v7;

  v4 = a2[1];
  *a1 = *a2;
  a1[1] = v4;
  v6 = a2 + 2;
  v5 = a2[2];
  swift_retain();
  swift_retain();
  if (v5)
  {
    v7 = a2[3];
    a1[2] = v5;
    a1[3] = v7;
    swift_retain();
  }
  else
  {
    *((_OWORD *)a1 + 1) = *v6;
  }
  return a1;
}

_QWORD *assignWithCopy for StatusBarDataOverridesView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = *a2;
  swift_retain();
  swift_release();
  a1[1] = a2[1];
  swift_retain();
  swift_release();
  v4 = a2[2];
  if (!a1[2])
  {
    if (v4)
    {
      v6 = a2[3];
      a1[2] = v4;
      a1[3] = v6;
      swift_retain();
      return a1;
    }
LABEL_7:
    *((_OWORD *)a1 + 1) = *((_OWORD *)a2 + 1);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = a2[3];
  a1[2] = v4;
  a1[3] = v5;
  swift_retain();
  swift_release();
  return a1;
}

uint64_t assignWithTake for StatusBarDataOverridesView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  if (!*(_QWORD *)(a1 + 16))
  {
    if (v4)
    {
      v6 = *(_QWORD *)(a2 + 24);
      *(_QWORD *)(a1 + 16) = v4;
      *(_QWORD *)(a1 + 24) = v6;
      return a1;
    }
LABEL_7:
    *(_OWORD *)(a1 + 16) = *(_OWORD *)(a2 + 16);
    return a1;
  }
  if (!v4)
  {
    swift_release();
    goto LABEL_7;
  }
  v5 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarDataOverridesView(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 32))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarDataOverridesView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)result = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 32) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarDataOverridesView()
{
  return &type metadata for StatusBarDataOverridesView;
}

ValueMetadata *type metadata accessor for StatusBarDataOverridesView_Previews()
{
  return &type metadata for StatusBarDataOverridesView_Previews;
}

uint64_t sub_1CFE660A8()
{
  return sub_1CFE66DB4(&qword_1EFBFECE0, &qword_1EFBFECE8, MEMORY[0x1E0CDFBB8]);
}

uint64_t sub_1CFE660D4()
{
  return sub_1CFE66DB4(&qword_1EFBFECF0, &qword_1EFBFECF8, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE66100()
{
  return sub_1CFE66DB4(&qword_1EFBFED00, &qword_1EFBFED08, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE6612C()
{
  return sub_1CFE66DB4(&qword_1EFBFED10, &qword_1EFBFED18, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE66158()
{
  return sub_1CFE66DB4(&qword_1EFBFED20, &qword_1EFBFED28, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE66184()
{
  return sub_1CFE66DB4(&qword_1EFBFED30, &qword_1EFBFED38, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE661B0()
{
  return sub_1CFE66DB4(&qword_1EFBFED40, &qword_1EFBFED48, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE661DC()
{
  return sub_1CFE66DB4(&qword_1EFBFED50, &qword_1EFBFED58, MEMORY[0x1E0CE0680]);
}

uint64_t sub_1CFE66208()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFECB0);
  type metadata accessor for StatusBarOverrides(255);
  sub_1CFE66DB4(&qword_1EFBFECC8, &qword_1EFBFECB0, MEMORY[0x1E0CDD898]);
  sub_1CFE663D8(&qword_1EFBFECD0, type metadata accessor for StatusBarOverrides, (uint64_t)&unk_1CFEBE8C0);
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_1CFE662AC()
{
  unint64_t result;

  result = qword_1EFBFED60;
  if (!qword_1EFBFED60)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDB5C, &type metadata for StatusBarDataOverridesView);
    atomic_store(result, (unint64_t *)&qword_1EFBFED60);
  }
  return result;
}

void type metadata accessor for STStatusBarVoiceControlType(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED68);
}

void type metadata accessor for STStatusBarBluetoothState(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED70);
}

void type metadata accessor for STStatusBarBatteryState(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED78);
}

void type metadata accessor for STStatusBarLocationType(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED80);
}

void type metadata accessor for STStatusBarDataWifiType(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED88);
}

void type metadata accessor for STStatusBarDataCellularType(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFED90);
}

void sub_1CFE66368(uint64_t a1, unint64_t *a2)
{
  unint64_t ForeignTypeMetadata;
  uint64_t v4;

  if (!*a2)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v4)
      atomic_store(ForeignTypeMetadata, a2);
  }
}

uint64_t sub_1CFE663AC()
{
  return sub_1CFE663D8(&qword_1EFBFED98, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarDataCellularType, (uint64_t)&unk_1CFEBDE9C);
}

uint64_t sub_1CFE663D8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1D17DE4C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CFE66418()
{
  return sub_1CFE663D8(&qword_1EFBFEDA0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarDataWifiType, (uint64_t)&unk_1CFEBDF0C);
}

uint64_t sub_1CFE66444()
{
  return sub_1CFE663D8(&qword_1EFBFEDA8, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarLocationType, (uint64_t)&unk_1CFEBDF7C);
}

uint64_t sub_1CFE66470()
{
  return sub_1CFE663D8(&qword_1EFBFEDB0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarBatteryState, (uint64_t)&unk_1CFEBDFEC);
}

uint64_t sub_1CFE6649C()
{
  return sub_1CFE663D8(&qword_1EFBFEDB8, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarBluetoothState, (uint64_t)&unk_1CFEBE05C);
}

uint64_t sub_1CFE664C8()
{
  return sub_1CFE663D8(&qword_1EFBFEDC0, (uint64_t (*)(uint64_t))type metadata accessor for STStatusBarVoiceControlType, (uint64_t)&unk_1CFEBE0CC);
}

unint64_t sub_1CFE664F4()
{
  unint64_t result;

  result = qword_1EFBFEDC8;
  if (!qword_1EFBFEDC8)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDBAC, &type metadata for StatusBarDataOverridesView_Previews);
    atomic_store(result, (unint64_t *)&qword_1EFBFEDC8);
  }
  return result;
}

double sub_1CFE66538@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_1CFE62280(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1).n128_u64[0];
  return result;
}

unint64_t sub_1CFE66558()
{
  unint64_t result;

  result = qword_1EFBFEE20;
  if (!qword_1EFBFEE20)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBD92C, &type metadata for StatusBarCellularOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE20);
  }
  return result;
}

double sub_1CFE6659C@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  double result;

  *(_QWORD *)&result = sub_1CFE62280(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1).n128_u64[0];
  return result;
}

uint64_t sub_1CFE665BC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE623EC(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t sub_1CFE665C4@<X0>(_QWORD *a1@<X8>)
{
  uint64_t *v1;

  return sub_1CFE627C8(v1[2], v1[3], v1[4], v1[5], a1);
}

uint64_t sub_1CFE665D0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE63FB4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CFE665F0()
{
  unint64_t result;

  result = qword_1EFBFEE48;
  if (!qword_1EFBFEE48)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBD9CC, &type metadata for StatusBarLocationOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE48);
  }
  return result;
}

double sub_1CFE66634@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE63CC4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CFE6663C()
{
  unint64_t result;

  result = qword_1EFBFEE50;
  if (!qword_1EFBFEE50)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDA1C, &type metadata for StatusBarBatteryOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE50);
  }
  return result;
}

double sub_1CFE66680@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE63E38(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CFE66688()
{
  unint64_t result;

  result = qword_1EFBFEE58;
  if (!qword_1EFBFEE58)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDA6C, &type metadata for StatusBarBluetoothOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE58);
  }
  return result;
}

uint64_t sub_1CFE666CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE63FB4(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CFE666EC()
{
  unint64_t result;

  result = qword_1EFBFEE60;
  if (!qword_1EFBFEE60)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDABC, &type metadata for StatusBarVoiceControlOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE60);
  }
  return result;
}

uint64_t sub_1CFE66730@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE64108(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1CFE66738()
{
  unint64_t result;

  result = qword_1EFBFEE68;
  if (!qword_1EFBFEE68)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBDB0C, &type metadata for StatusBarUserOverrideView);
    atomic_store(result, (unint64_t *)&qword_1EFBFEE68);
  }
  return result;
}

uint64_t sub_1CFE6677C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE6425C(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

uint64_t objectdestroyTm()
{
  uint64_t v0;

  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 32))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFE667C4()
{
  uint64_t v0;
  uint64_t v2;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  v0 = sub_1CFEB3B68();
  (*(void (**)(uint64_t))(*(_QWORD *)v2 + 152))(v0);
  return swift_release();
}

uint64_t sub_1CFE6681C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

unint64_t sub_1CFE66860()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EFBFEEE8;
  if (!qword_1EFBFEEE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFEEA8);
    v2[0] = sub_1CFE668C4();
    v2[1] = v2[0];
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EFBFEEE8);
  }
  return result;
}

unint64_t sub_1CFE668C4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EFBFEEF0;
  if (!qword_1EFBFEEF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFEEB8);
    v2[0] = sub_1CFE66930();
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EFBFEEF0);
  }
  return result;
}

unint64_t sub_1CFE66930()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;

  result = qword_1EFBFEEF8;
  if (!qword_1EFBFEEF8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFEEB0);
    v2 = sub_1CFE66DB4(&qword_1EFBFEF00, &qword_1EFBFEF08, MEMORY[0x1E0CD8390]);
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CDF690], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EFBFEEF8);
  }
  return result;
}

uint64_t sub_1CFE669B0@<X0>(char *a1@<X8>)
{
  uint64_t v1;

  return sub_1CFE63568(*(_QWORD *)(v1 + 32), *(_QWORD *)(v1 + 40), a1);
}

uint64_t objectdestroy_59Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();
  swift_release();
  swift_release();
  if (*(_QWORD *)(v0 + 48))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1CFE66A00(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void (*v4)(uint64_t *, _QWORD);
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t, uint64_t);
  void (*v13)(uint64_t *, _QWORD);
  uint64_t v14;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;

  v3 = *(_QWORD *)(v1 + 40);
  v17 = *(_QWORD *)(v1 + 32);
  v2 = v17;
  v18 = v3;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFECA8);
  sub_1CFEB3B68();
  v4 = (void (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))(*(_QWORD *)v19 + 136))(&v17);
  v6 = v5;
  v7 = type metadata accessor for StatusBarOverrides(0);
  v8 = *(int *)(v7 + 36);
  v9 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v10 = v6 + v8 + *(int *)(v9 + 20);
  v11 = sub_1CFEB385C();
  v12 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 24);
  v12(v10, a1, v11);
  v4(&v17, 0);
  swift_release();
  v17 = v2;
  v18 = v3;
  sub_1CFEB3B68();
  v13 = (void (*)(uint64_t *, _QWORD))(*(uint64_t (**)(uint64_t *))(*(_QWORD *)v19 + 136))(&v17);
  v12(v14 + *(int *)(v7 + 40) + (uint64_t)*(int *)(v9 + 20), a1, v11);
  v13(&v17, 0);
  return swift_release();
}

uint64_t sub_1CFE66B44(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_retain();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1CFE66B54(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

unint64_t sub_1CFE66B64()
{
  unint64_t result;

  result = qword_1EFBFEFB0;
  if (!qword_1EFBFEFB0)
  {
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0DEB078], MEMORY[0x1E0DEB070]);
    atomic_store(result, (unint64_t *)&qword_1EFBFEFB0);
  }
  return result;
}

uint64_t sub_1CFE66BA8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1CFEB397C();
  *a1 = result;
  return result;
}

uint64_t sub_1CFE66BD0()
{
  swift_retain();
  return sub_1CFEB3988();
}

uint64_t sub_1CFE66BF8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1CFEB3994();
  *a1 = result;
  return result;
}

uint64_t sub_1CFE66C20()
{
  swift_retain();
  return sub_1CFEB39A0();
}

unint64_t sub_1CFE66C48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1EFBFF018;
  if (!qword_1EFBFF018)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFF010);
    v2 = sub_1CFE66CAC();
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CDFEE8], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1EFBFF018);
  }
  return result;
}

unint64_t sub_1CFE66CAC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EFBFF020;
  if (!qword_1EFBFF020)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFF028);
    v2[0] = sub_1CFE66D30();
    v2[1] = sub_1CFE66DB4(&qword_1EFBFF050, &qword_1EFBFF058, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EFBFF020);
  }
  return result;
}

unint64_t sub_1CFE66D30()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EFBFF030;
  if (!qword_1EFBFF030)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFF038);
    v2 = sub_1CFE66DB4(&qword_1EFBFF040, &qword_1EFBFF048, MEMORY[0x1E0CDBEF0]);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EFBFF030);
  }
  return result;
}

uint64_t sub_1CFE66DB4(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1D17DE4C4](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1CFE66DF4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 144);
  v10 = *(_QWORD *)(a1 + 200);
  v11 = *(_QWORD *)(a1 + 192);
  v9 = *(_BYTE *)(a1 + 208);
  sub_1CFE66B44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v11, v10, v9);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CFE66ED0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 144);
  v10 = *(_QWORD *)(a1 + 200);
  v11 = *(_QWORD *)(a1 + 192);
  v9 = *(_BYTE *)(a1 + 208);
  v13 = *(_QWORD *)(a1 + 264);
  v14 = *(_QWORD *)(a1 + 256);
  v12 = *(_BYTE *)(a1 + 272);
  sub_1CFE66B44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v2, v3, v4);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v5, v6, v7);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v11, v10, v9);
  swift_bridgeObjectRetain();
  sub_1CFE66B44(v14, v13, v12);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CFE66FE0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 144);
  v10 = *(_QWORD *)(a1 + 200);
  v11 = *(_QWORD *)(a1 + 192);
  v9 = *(_BYTE *)(a1 + 208);
  sub_1CFE66B54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v11, v10, v9);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1CFE670BC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;

  v2 = *(_QWORD *)(a1 + 64);
  v3 = *(_QWORD *)(a1 + 72);
  v4 = *(_BYTE *)(a1 + 80);
  v5 = *(_QWORD *)(a1 + 128);
  v6 = *(_QWORD *)(a1 + 136);
  v7 = *(_BYTE *)(a1 + 144);
  v10 = *(_QWORD *)(a1 + 200);
  v11 = *(_QWORD *)(a1 + 192);
  v9 = *(_BYTE *)(a1 + 208);
  v13 = *(_QWORD *)(a1 + 264);
  v14 = *(_QWORD *)(a1 + 256);
  v12 = *(_BYTE *)(a1 + 272);
  sub_1CFE66B54(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_BYTE *)(a1 + 16));
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v2, v3, v4);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v5, v6, v7);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v11, v10, v9);
  swift_bridgeObjectRelease();
  sub_1CFE66B54(v14, v13, v12);
  swift_bridgeObjectRelease();
  return a1;
}

unint64_t sub_1CFE671CC()
{
  unint64_t result;

  result = qword_1EFBFF0E8;
  if (!qword_1EFBFF0E8)
  {
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EFBFF0E8);
  }
  return result;
}

uint64_t sub_1CFE67210(uint64_t a1)
{
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CFE67238(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CFE6727C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1CFE672B8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

BOOL sub_1CFE6731C(char a1, char a2)
{
  return a1 == a2;
}

BOOL sub_1CFE6732C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2;
}

uint64_t sub_1CFE67340()
{
  sub_1CFEB3D18();
  sub_1CFEB3D24();
  return sub_1CFEB3D30();
}

uint64_t sub_1CFE67384()
{
  return sub_1CFEB3D24();
}

uint64_t sub_1CFE673AC()
{
  sub_1CFEB3D18();
  sub_1CFEB3D24();
  return sub_1CFEB3D30();
}

uint64_t sub_1CFE673EC(uint64_t a1, unint64_t a2)
{
  uint64_t v2;

  v2 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
    return sub_1CFEB3C88();
  else
    return 0;
}

uint64_t sub_1CFE6742C(_QWORD *a1, id a2)
{
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id v9;
  void *v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t result;

  a1[1] = objc_msgSend(a2, sel_status);
  a1[2] = objc_msgSend(a2, sel_displayValue);
  a1[3] = objc_msgSend(a2, sel_type);
  v4 = objc_msgSend(a2, sel_string);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1CFEB3C70();
    v8 = v7;

  }
  else
  {
    v6 = 0;
    v8 = 0xE000000000000000;
  }
  swift_bridgeObjectRelease();
  a1[4] = v6;
  a1[5] = v8;
  v9 = objc_msgSend(a2, sel_badgeString);
  if (v9)
  {
    v10 = v9;
    v11 = sub_1CFEB3C70();
    v13 = v12;

  }
  else
  {
    v11 = 0;
    v13 = 0xE000000000000000;
  }
  result = swift_bridgeObjectRelease();
  a1[6] = v11;
  a1[7] = v13;
  return result;
}

uint64_t sub_1CFE67528()
{
  unsigned __int8 *v0;

  return *v0;
}

uint64_t sub_1CFE67530(uint64_t result)
{
  _BYTE *v1;

  *v1 = result;
  return result;
}

uint64_t (*sub_1CFE67538())()
{
  return nullsub_1;
}

double sub_1CFE67548@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1CFEBE5D0;
  *(_QWORD *)&result = 10;
  *(_OWORD *)(a1 + 24) = xmmword_1CFEBE5E0;
  *(_QWORD *)(a1 + 40) = 0xE700000000000000;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0xE000000000000000;
  return result;
}

uint64_t sub_1CFE67578(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  _OWORD v7[4];
  _OWORD v8[4];

  v2 = a1[1];
  v7[0] = *a1;
  v7[1] = v2;
  v3 = a1[3];
  v7[2] = a1[2];
  v7[3] = v3;
  v4 = a2[1];
  v8[0] = *a2;
  v8[1] = v4;
  v5 = a2[3];
  v8[2] = a2[2];
  v8[3] = v5;
  return sub_1CFE6A020(v7, v8) & 1;
}

double sub_1CFE675C0@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_BYTE *)a1 = 0;
  *(_QWORD *)&result = 5;
  *(_OWORD *)(a1 + 8) = xmmword_1CFEBE5F0;
  *(_QWORD *)(a1 + 24) = 0;
  return result;
}

BOOL sub_1CFE675D8(_QWORD *a1, _QWORD *a2)
{
  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2)
    return 0;
  return a1[1] == a2[1] && a1[2] == a2[2] && a1[3] == a2[3];
}

uint64_t sub_1CFE67614@<X0>(_BYTE *a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t);
  uint64_t v27;
  char *v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char *v37;
  _BYTE *v38;

  v2 = sub_1CFEB388C();
  v35 = *(_QWORD *)(v2 - 8);
  v36 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v31 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1CFEB38B0();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF110);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = sub_1CFEB385C();
  v12 = *(_QWORD *)(v34 - 8);
  MEMORY[0x1E0C80A78](v34);
  v37 = (char *)&v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF118);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v31 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF120);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v31 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = sub_1CFEB3820();
  v32 = *(_QWORD *)(v20 - 8);
  v33 = v20;
  MEMORY[0x1E0C80A78](v20);
  v22 = (char *)&v31 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = a1;
  *a1 = 0;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v6 + 56))(v19, 1, 1, v5);
  v23 = sub_1CFEB38BC();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 56))(v16, 1, 1, v23);
  sub_1CFEB3814();
  sub_1CFEB37FC();
  sub_1CFEB37D8();
  sub_1CFEB37F0();
  sub_1CFEB37E4();
  sub_1CFEB3808();
  v25 = v35;
  v24 = v36;
  (*(void (**)(char *, _QWORD, uint64_t))(v35 + 104))(v4, *MEMORY[0x1E0CB0EF8], v36);
  sub_1CFEB3898();
  (*(void (**)(char *, uint64_t))(v25 + 8))(v4, v24);
  sub_1CFEB38A4();
  v26 = *(void (**)(char *, uint64_t))(v6 + 8);
  v27 = v34;
  v26(v8, v5);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v11, 1, v27) == 1)
  {
    v28 = v37;
    sub_1CFEB3850();
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v33);
    sub_1CFE6A0F4((uint64_t)v11);
  }
  else
  {
    (*(void (**)(char *, uint64_t))(v32 + 8))(v22, v33);
    v28 = v37;
    (*(void (**)(char *, char *, uint64_t))(v12 + 32))(v37, v11, v27);
  }
  v29 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  return (*(uint64_t (**)(_BYTE *, char *, uint64_t))(v12 + 32))(&v38[*(int *)(v29 + 20)], v28, v27);
}

id sub_1CFE679E4()
{
  id v0;
  id result;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  objc_msgSend(v0, sel_setDateStyle_, 0);
  result = objc_msgSend(v0, sel_setTimeStyle_, 1);
  qword_1EFC01D20 = (uint64_t)v0;
  return result;
}

id sub_1CFE67A44()
{
  id result;

  result = sub_1CFE67A60();
  qword_1EFC01D28 = (uint64_t)result;
  return result;
}

id sub_1CFE67A60()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  void (*v17)(char *, uint64_t);
  uint64_t v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  id v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v29;
  id v30;

  v29 = sub_1CFEB37CC();
  v0 = *(_QWORD *)(v29 - 8);
  MEMORY[0x1E0C80A78](v29);
  v2 = (char *)&v29 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_1CFEB3880();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v30 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB3578]), sel_init);
  v7 = (void *)objc_opt_self();
  v8 = (void *)sub_1CFEB3C64();
  v9 = objc_msgSend((id)objc_opt_self(), sel_currentLocale);
  sub_1CFEB3874();

  v10 = (void *)sub_1CFEB3868();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  v11 = objc_msgSend(v7, sel_dateFormatFromTemplate_options_locale_, v8, 0, v10);

  if (v11)
  {
    sub_1CFEB3C70();

  }
  v12 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
  v13 = (void *)sub_1CFEB3C64();
  swift_bridgeObjectRelease();
  v14 = objc_msgSend(v12, sel_initWithString_, v13);

  v15 = v14;
  sub_1CFEB37C0();
  v16 = (void *)sub_1CFEB37B4();
  v17 = *(void (**)(char *, uint64_t))(v0 + 8);
  v18 = v29;
  v17(v2, v29);
  while (1)
  {
    v19 = objc_msgSend(v15, sel_rangeOfCharacterFromSet_, v16, v29);
    v21 = v20;

    if (v19 == (id)sub_1CFEB37A8())
      break;
    v22 = (void *)sub_1CFEB3C64();
    v23 = objc_msgSend(v15, sel_stringByReplacingCharactersInRange_withString_, v19, v21, v22);

    sub_1CFEB3C70();
    v24 = objc_allocWithZone(MEMORY[0x1E0CB3940]);
    v25 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
    v26 = objc_msgSend(v24, sel_initWithString_, v25);

    v15 = v26;
    sub_1CFEB37C0();
    v16 = (void *)sub_1CFEB37B4();
    v17(v2, v18);
  }
  v27 = v30;
  objc_msgSend(v30, sel_setDateFormat_, v15);

  return v27;
}

id sub_1CFE67D80(SEL *a1)
{
  unsigned __int8 *v1;
  unsigned __int8 *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  int v7;
  uint64_t (*v8)(_QWORD);
  id v9;
  void *v10;
  uint64_t v12;

  v3 = v1;
  v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = *v3;
  sub_1CFE6A8D4((uint64_t)v3, (uint64_t)v6, v8);
  if (v7 == 2)
  {
    sub_1CFE6A980((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
    sub_1CFE6A4A8(0, &qword_1EFBFF128);
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (v7)
  {
    v10 = (void *)sub_1CFEB382C();
    v9 = objc_msgSend((id)objc_opt_self(), *a1, v10);

    sub_1CFE6A980((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
  }
  else
  {
    sub_1CFE6A980((uint64_t)v6, type metadata accessor for StatusBarOverrides.TimeAndDate);
    return 0;
  }
  return v9;
}

uint64_t sub_1CFE67EBC(uint64_t a1, void *a2, _QWORD *a3, void **a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *v25;
  id v26;
  char *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void (*v31)(char *, char *, uint64_t);
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;

  v34 = a5;
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF110);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v33 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1CFEB385C();
  v13 = *(_QWORD *)(v12 - 8);
  v14 = MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v33 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v33 - v17;
  objc_opt_self();
  v19 = swift_dynamicCastObjCClass();
  if (v19)
  {
    v20 = (void *)v19;
    v21 = a2;
    v22 = objc_msgSend(v20, sel_dateValue);
    sub_1CFEB3844();

    v23 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v13 + 40))(a1 + *(int *)(v23 + 20), v16, v12);
  }
  v33 = v13;
  if (*a3 != -1)
    swift_once();
  v25 = *a4;
  v26 = objc_msgSend(a2, sel_stringValue, v33, v34);
  v27 = v18;
  v28 = v12;
  if (!v26)
  {
    sub_1CFEB3C70();
    v26 = (id)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
  }
  v29 = objc_msgSend(v25, sel_dateFromString_, v26);

  v30 = v33;
  if (v29)
  {
    sub_1CFEB3844();

    v31 = *(void (**)(char *, char *, uint64_t))(v30 + 32);
    v31(v11, v16, v28);
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v30 + 56))(v11, 0, 1, v28);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v30 + 48))(v11, 1, v28) != 1)
    {
      v31(v27, v11, v28);
      v32 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
      return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v30 + 40))(a1 + *(int *)(v32 + 20), v27, v28);
    }
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v33 + 56))(v11, 1, 1, v28);
  }
  return sub_1CFE6A0F4((uint64_t)v11);
}

uint64_t sub_1CFE68158(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 == *a2)
    return sub_1CFEB3838();
  else
    return 0;
}

void sub_1CFE68180(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 24) = 0;
}

uint64_t sub_1CFE68194(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  if (*((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1) || *((double *)a1 + 2) != *((double *)a2 + 2))
    return 0;
  if (((a2[24] ^ a1[24]) & 1) != 0)
    return 0;
  return a1[25] ^ a2[25] ^ 1u;
}

id sub_1CFE681F0()
{
  unsigned __int8 *v0;
  id v1;
  void *v2;
  id v3;

  v1 = (id)*v0;
  if ((_DWORD)v1 == 2)
  {
    sub_1CFE6A4A8(0, &qword_1EFBFF140);
    return objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*v0)
  {
    if (v0[16] == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF138);
      v3 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      if (!v0[16])
      {
        v2 = 0;
LABEL_10:
        v1 = objc_msgSend((id)objc_opt_self(), sel_entryWithState_batteryEntry_, *((_QWORD *)v0 + 1), v2);

        return v1;
      }
      v3 = sub_1CFE6A18C(*((id *)v0 + 3), v0[40] & 1, v0[41] & 1, *((double *)v0 + 4));
    }
    v2 = v3;
    goto LABEL_10;
  }
  return v1;
}

void sub_1CFE682FC(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 1;
  *(_BYTE *)(a1 + 16) = 0;
  *(_QWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 32) = 0x3FF0000000000000;
  *(_WORD *)(a1 + 40) = 0;
}

BOOL sub_1CFE6831C(__int128 *a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v5;
  _OWORD v6[2];
  __int128 v7;
  _OWORD v8[2];

  v2 = a1[1];
  v5 = *a1;
  v6[0] = v2;
  *(_OWORD *)((char *)v6 + 10) = *(__int128 *)((char *)a1 + 26);
  v3 = a2[1];
  v7 = *a2;
  v8[0] = v3;
  *(_OWORD *)((char *)v8 + 10) = *(__int128 *)((char *)a2 + 26);
  return sub_1CFE6A420((unsigned __int8 *)&v5, (unsigned __int8 *)&v7);
}

void sub_1CFE68364(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
}

BOOL sub_1CFE68370(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2 && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1);
}

void sub_1CFE6839C(uint64_t a1@<X8>)
{
  *(_BYTE *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_QWORD *)(a1 + 16) = 0xE000000000000000;
}

uint64_t sub_1CFE683AC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  if (*a1 != *a2)
    return 0;
  if (*((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1) && *((_QWORD *)a1 + 2) == *((_QWORD *)a2 + 2))
    return 1;
  else
    return sub_1CFEB3D0C();
}

id sub_1CFE683F4()
{
  uint64_t v0;
  uint64_t v1;
  char **v2;
  id v3;
  id v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  id v27;
  int *v28;
  id v29;
  id v30;
  id v31;
  uint64_t v32;
  id v33;
  id v34;
  uint64_t v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  id v40;
  id v41;
  id v42;
  void *v43;
  id v44;
  void *v45;
  id v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  id v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;

  v1 = v0;
  v2 = &selRef_bluetoothEntry;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB0950]), sel_init);
  if (*(_BYTE *)v0 == 2)
  {
    sub_1CFE6A4A8(0, &qword_1EFBFF100);
    v4 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*(_BYTE *)v0)
  {
    v5 = *(_QWORD *)(v0 + 8);
    v61 = *(_QWORD *)(v0 + 16);
    v7 = *(_QWORD *)(v0 + 48);
    v6 = *(_QWORD *)(v0 + 56);
    v8 = *(_QWORD *)(v0 + 24);
    swift_bridgeObjectRetain_n();
    swift_bridgeObjectRetain();
    sub_1CFE673EC(v7, v6);
    v10 = v9;
    swift_bridgeObjectRelease();
    swift_bridgeObjectRetain();
    v11 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
    if (v10)
    {
      v12 = (void *)sub_1CFEB3C64();
      swift_bridgeObjectRelease();
    }
    else
    {
      v12 = 0;
    }
    v2 = &selRef_bluetoothEntry;
    LOBYTE(v60) = 0;
    LOBYTE(v59) = 0;
    BYTE2(v58) = 0;
    LOWORD(v58) = 0;
    v4 = objc_msgSend((id)objc_opt_self(), sel_entryWithType_stringValue_crossfadeStringValue_badgeStringValue_wifiCalling_callForwarding_showsSOSWhenDisabled_sosAvailable_isBootstrapCellular_status_lowDataMode_rawValue_displayValue_displayRawValue_, v8, v11, 0, v12, 0, 0, v58, v5, v59, 0, v61, v60);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

  }
  else
  {
    v4 = 0;
  }
  objc_msgSend(v3, sel_setCellularEntry_, v4);

  if (*(_BYTE *)(v0 + 64))
  {
    if (*(_BYTE *)(v0 + 64) == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF100);
      v13 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      v14 = *(_QWORD *)(v0 + 72);
      v62 = *(_QWORD *)(v0 + 80);
      v16 = *(_QWORD *)(v0 + 112);
      v15 = *(_QWORD *)(v0 + 120);
      v17 = *(_QWORD *)(v0 + 88);
      swift_bridgeObjectRetain_n();
      swift_bridgeObjectRetain();
      sub_1CFE673EC(v16, v15);
      v19 = v18;
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v20 = (void *)sub_1CFEB3C64();
      swift_bridgeObjectRelease();
      if (v19)
      {
        v21 = (void *)sub_1CFEB3C64();
        swift_bridgeObjectRelease();
      }
      else
      {
        v21 = 0;
      }
      v2 = &selRef_bluetoothEntry;
      LOBYTE(v60) = 0;
      LOBYTE(v59) = 0;
      BYTE2(v58) = 0;
      LOWORD(v58) = 0;
      v13 = objc_msgSend((id)objc_opt_self(), sel_entryWithType_stringValue_crossfadeStringValue_badgeStringValue_wifiCalling_callForwarding_showsSOSWhenDisabled_sosAvailable_isBootstrapCellular_status_lowDataMode_rawValue_displayValue_displayRawValue_, v17, v20, 0, v21, 0, 0, v58, v14, v59, 0, v62, v60);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();

    }
  }
  else
  {
    v13 = 0;
  }
  objc_msgSend(v3, sel_setSecondaryCellularEntry_, v13);

  if (*(_BYTE *)(v0 + 128))
  {
    if (*(_BYTE *)(v0 + 128) == 2)
      v22 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v23 = v22;
  }
  else
  {
    v23 = 0;
  }
  objc_msgSend(v3, sel_setAirplaneModeEntry_, v23);

  if (*(_BYTE *)(v1 + 129))
  {
    if (*(_BYTE *)(v1 + 129) == 2)
      v24 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v24 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v25 = v24;
  }
  else
  {
    v25 = 0;
  }
  objc_msgSend(v3, sel_setVpnEntry_, v25);

  if (*(_BYTE *)(v1 + 136))
  {
    if (*(_BYTE *)(v1 + 136) == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF108);
      v26 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      v26 = objc_msgSend((id)objc_opt_self(), sel_entryWithType_status_lowDataMode_rawValue_displayValue_displayRawValue_, *(_QWORD *)(v1 + 160), *(_QWORD *)(v1 + 144), 0, 0, *(_QWORD *)(v1 + 152), 0);
    }
    v27 = v26;
  }
  else
  {
    v27 = 0;
  }
  objc_msgSend(v3, sel_setWifiEntry_, v27);

  v28 = (int *)type metadata accessor for StatusBarOverrides(0);
  v29 = sub_1CFE67D80((SEL *)&selRef_entryForTimeWithDateValue_);
  objc_msgSend(v3, sel_setTimeEntry_, v29);

  v30 = sub_1CFE67D80((SEL *)&selRef_entryForShortTimeWithDateValue_);
  objc_msgSend(v3, sel_setShortTimeEntry_, v30);

  v31 = sub_1CFE67D80((SEL *)&selRef_entryForDateWithDateValue_);
  objc_msgSend(v3, sel_setDateEntry_, v31);

  v32 = v1 + v28[11];
  if (*(_BYTE *)v32)
  {
    if (*(_BYTE *)v32 == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF130);
      v33 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      v33 = objc_msgSend((id)objc_opt_self(), sel_entryWithType_, *(_QWORD *)(v32 + 8));
    }
    v34 = v33;
  }
  else
  {
    v34 = 0;
  }
  objc_msgSend(v3, sel_setLocationEntry_, v34);

  v35 = v1 + v28[12];
  if (*(_BYTE *)v35)
  {
    if (*(_BYTE *)v35 == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF138);
      v36 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      v36 = sub_1CFE6A18C(*(id *)(v35 + 8), *(_BYTE *)(v35 + 24), *(_BYTE *)(v35 + 25), *(double *)(v35 + 16));
    }
    v37 = v36;
  }
  else
  {
    v37 = 0;
  }
  objc_msgSend(v3, sel_setMainBatteryEntry_, v37);

  v38 = sub_1CFE681F0();
  objc_msgSend(v3, sel_setBluetoothEntry_, v38);

  v39 = v1 + v28[14];
  if (*(_BYTE *)v39)
  {
    if (*(_BYTE *)v39 == 2)
    {
      sub_1CFE6A4A8(0, &qword_1EFBFF148);
      v40 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
    }
    else
    {
      v40 = objc_msgSend((id)objc_opt_self(), sel_entryWithType_, *(_QWORD *)(v39 + 8));
    }
    v41 = v40;
  }
  else
  {
    v41 = 0;
  }
  objc_msgSend(v3, sel_setVoiceControlEntry_, v41);

  if (*(_BYTE *)(v1 + v28[15]) == 2)
  {
    sub_1CFE6A4A8(0, &qword_1EFBFF128);
    v42 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_disabledEntry);
  }
  else if (*(_BYTE *)(v1 + v28[15]))
  {
    swift_bridgeObjectRetain();
    v43 = (void *)sub_1CFEB3C64();
    v42 = objc_msgSend((id)objc_opt_self(), sel_entryWithStringValue_, v43);
    swift_bridgeObjectRelease();

  }
  else
  {
    v42 = 0;
  }
  objc_msgSend(v3, sel_setPersonNameEntry_, v42);

  if (*(_BYTE *)(v1 + v28[16]))
  {
    if (*(_BYTE *)(v1 + v28[16]) == 2)
      v44 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v44 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v45 = v44;
  }
  else
  {
    v45 = 0;
  }
  objc_msgSend(v3, sel_setRotationLockEntry_, v45);

  if (*(_BYTE *)(v1 + v28[17]))
  {
    if (*(_BYTE *)(v1 + v28[17]) == 2)
      v46 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v46 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v47 = v46;
  }
  else
  {
    v47 = 0;
  }
  objc_msgSend(v3, sel_setAlarmEntry_, v47);

  if (*(_BYTE *)(v1 + v28[18]))
  {
    if (*(_BYTE *)(v1 + v28[18]) == 2)
      v48 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v48 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v49 = v48;
  }
  else
  {
    v49 = 0;
  }
  objc_msgSend(v3, sel_setStudentEntry_, v49);

  if (*(_BYTE *)(v1 + v28[19]))
  {
    if (*(_BYTE *)(v1 + v28[19]) == 2)
      v50 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v50 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v51 = v50;
  }
  else
  {
    v51 = 0;
  }
  objc_msgSend(v3, sel_setAirPlayEntry_, v51);

  if (*(_BYTE *)(v1 + v28[20]))
  {
    if (*(_BYTE *)(v1 + v28[20]) == 2)
      v52 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v52 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v53 = v52;
  }
  else
  {
    v53 = 0;
  }
  objc_msgSend(v3, sel_setCarPlayEntry_, v53);

  if (*(_BYTE *)(v1 + v28[21]))
  {
    if (*(_BYTE *)(v1 + v28[21]) == 2)
      v54 = objc_msgSend((id)objc_opt_self(), sel_disabledEntry);
    else
      v54 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB09B8]), v2[387]);
    v55 = v54;
  }
  else
  {
    v55 = 0;
  }
  objc_msgSend(v3, sel_setLiquidDetectionEntry_, v55);

  v56 = objc_msgSend(v3, sel_immutableCopy);
  return v56;
}

void sub_1CFE68E90(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  int *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  id v20;
  __int128 v21;
  __int128 v22;
  unint64_t v23;
  void *v24;
  char v25;
  id v26;
  char v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  id v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  char v35;
  id v36;
  char v37;
  uint64_t v38;
  id v39;
  void *v40;
  unsigned int v41;
  char v42;
  id v43;
  void *v44;
  unsigned int v45;
  char v46;
  id v47;
  id v48;
  char v49;
  id v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  char *v54;
  char v55;
  id v56;
  uint64_t v57;
  uint64_t v58;
  id v59;
  char *v60;
  char v61;
  id v62;
  uint64_t v63;
  uint64_t v64;
  id v65;
  void *v66;
  char v67;
  id v68;
  char *v69;
  id v70;
  id v71;
  char v72;
  id v73;
  double v74;
  unsigned __int8 v75;
  unsigned __int8 v76;
  id v77;
  __int128 v78;
  _OWORD *v79;
  id v80;
  void *v81;
  char v82;
  id v83;
  char *v84;
  id v85;
  void *v86;
  char v87;
  id v88;
  id v89;
  unint64_t v90;
  unint64_t v91;
  uint64_t v92;
  id v93;
  void *v94;
  unsigned int v95;
  char v96;
  id v97;
  void *v98;
  unsigned int v99;
  char v100;
  id v101;
  void *v102;
  unsigned int v103;
  char v104;
  id v105;
  void *v106;
  unsigned int v107;
  char v108;
  id v109;
  void *v110;
  unsigned int v111;
  char v112;
  id v113;
  void *v114;
  unsigned int v115;
  char v116;
  __int128 v117;
  __int128 v118;
  char *v119;
  _BYTE *v120;
  uint64_t v121;
  _BYTE *v122;
  char *v123;
  uint64_t v124;
  char *v125;
  _OWORD *v126;
  char *v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  _BYTE v135[48];
  uint64_t v136;
  unint64_t v137;

  v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v123 = (char *)&v117 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = MEMORY[0x1E0C80A78](v5);
  v124 = (uint64_t)&v117 - v8;
  v9 = MEMORY[0x1E0C80A78](v7);
  v11 = (char *)&v117 - v10;
  MEMORY[0x1E0C80A78](v9);
  v121 = (uint64_t)&v117 - v12;
  v13 = (int *)type metadata accessor for StatusBarOverrides(0);
  v120 = (_BYTE *)(a2 + v13[9]);
  sub_1CFE67614(v120);
  v122 = (_BYTE *)(a2 + v13[10]);
  sub_1CFE67614(v122);
  v14 = a2 + v13[11];
  *(_BYTE *)v14 = 0;
  v125 = (char *)v14;
  *(_QWORD *)(v14 + 8) = 0;
  v15 = a2 + v13[12];
  *(_BYTE *)v15 = 0;
  *(_QWORD *)(v15 + 8) = 0;
  *(_QWORD *)(v15 + 16) = 0x3FF0000000000000;
  *(_WORD *)(v15 + 24) = 0;
  v16 = a2 + v13[13];
  *(_BYTE *)v16 = 0;
  *(_QWORD *)(v16 + 8) = 1;
  *(_BYTE *)(v16 + 16) = 0;
  *(_QWORD *)(v16 + 24) = 0;
  *(_QWORD *)(v16 + 32) = 0x3FF0000000000000;
  *(_WORD *)(v16 + 40) = 0;
  v17 = a2 + v13[14];
  *(_BYTE *)v17 = 0;
  v126 = (_OWORD *)v16;
  v127 = (char *)v17;
  *(_QWORD *)(v17 + 8) = 0;
  v18 = a2 + v13[15];
  *(_BYTE *)v18 = 0;
  v19 = 0xE000000000000000;
  *(_QWORD *)(v18 + 8) = 0;
  *(_QWORD *)(v18 + 16) = 0xE000000000000000;
  v128 = v18;
  v129 = v13[16];
  *(_BYTE *)(a2 + v129) = 0;
  v130 = v13[17];
  *(_BYTE *)(a2 + v130) = 0;
  v131 = v13[18];
  *(_BYTE *)(a2 + v131) = 0;
  v132 = v13[19];
  *(_BYTE *)(a2 + v132) = 0;
  v133 = v13[20];
  *(_BYTE *)(a2 + v133) = 0;
  v134 = v13[21];
  *(_BYTE *)(a2 + v134) = 0;
  v20 = objc_msgSend(a1, sel_cellularEntry);
  v21 = xmmword_1CFEBE5D0;
  v22 = xmmword_1CFEBE5E0;
  *(_OWORD *)&v135[8] = xmmword_1CFEBE5D0;
  *(_OWORD *)&v135[24] = xmmword_1CFEBE5E0;
  v23 = 0xE700000000000000;
  *(_QWORD *)&v135[40] = 0xE700000000000000;
  v136 = 0;
  v137 = 0xE000000000000000;
  v118 = xmmword_1CFEBE5D0;
  v117 = xmmword_1CFEBE5E0;
  if (v20)
  {
    v24 = v20;
    if (objc_msgSend(v20, sel_isEnabled))
      v25 = 1;
    else
      v25 = 2;
    v135[0] = v25;
    v26 = v24;
    sub_1CFE6742C(v135, v26);

    v27 = v135[0];
    v21 = *(_OWORD *)&v135[8];
    v22 = *(_OWORD *)&v135[24];
    v29 = *(_QWORD *)&v135[40];
    v28 = v136;
    v30 = v137;
  }
  else
  {
    v28 = 0;
    v27 = 0;
    v30 = 0xE000000000000000;
    v29 = 0xE700000000000000;
  }
  *(_BYTE *)a2 = v27;
  *(_OWORD *)(a2 + 8) = v21;
  *(_OWORD *)(a2 + 24) = v22;
  *(_QWORD *)(a2 + 40) = v29;
  *(_QWORD *)(a2 + 48) = v28;
  *(_QWORD *)(a2 + 56) = v30;
  v31 = objc_msgSend(a1, sel_secondaryCellularEntry, (_QWORD)v117, *((_QWORD *)&v117 + 1), (_QWORD)v118, *((_QWORD *)&v118 + 1));
  v32 = v118;
  v33 = v117;
  *(_OWORD *)&v135[8] = v118;
  *(_OWORD *)&v135[24] = v117;
  *(_QWORD *)&v135[40] = 0xE700000000000000;
  v136 = 0;
  v137 = 0xE000000000000000;
  if (v31)
  {
    v34 = v31;
    if (objc_msgSend(v31, sel_isEnabled))
      v35 = 1;
    else
      v35 = 2;
    v135[0] = v35;
    v36 = v34;
    sub_1CFE6742C(v135, v36);

    v37 = v135[0];
    v32 = *(_OWORD *)&v135[8];
    v33 = *(_OWORD *)&v135[24];
    v23 = *(_QWORD *)&v135[40];
    v38 = v136;
    v19 = v137;
  }
  else
  {
    v38 = 0;
    v37 = 0;
  }
  *(_BYTE *)(a2 + 64) = v37;
  *(_OWORD *)(a2 + 72) = v32;
  *(_OWORD *)(a2 + 88) = v33;
  *(_QWORD *)(a2 + 104) = v23;
  *(_QWORD *)(a2 + 112) = v38;
  *(_QWORD *)(a2 + 120) = v19;
  v39 = objc_msgSend(a1, sel_airplaneModeEntry);
  if (v39)
  {
    v40 = v39;
    v41 = objc_msgSend(v39, sel_isEnabled);

    if (v41)
      v42 = 1;
    else
      v42 = 2;
  }
  else
  {
    v42 = 0;
  }
  *(_BYTE *)(a2 + 128) = v42;
  v43 = objc_msgSend(a1, sel_vpnEntry);
  v119 = v11;
  if (v43)
  {
    v44 = v43;
    v45 = objc_msgSend(v43, sel_isEnabled);

    if (v45)
      v46 = 1;
    else
      v46 = 2;
  }
  else
  {
    v46 = 0;
  }
  *(_BYTE *)(a2 + 129) = v46;
  v47 = objc_msgSend(a1, sel_wifiEntry);
  v48 = v47;
  if (v47)
  {
    if (objc_msgSend(v47, sel_isEnabled))
      v49 = 1;
    else
      v49 = 2;
    v50 = v48;
    v51 = (uint64_t)objc_msgSend(v50, sel_status);
    v52 = (uint64_t)objc_msgSend(v50, sel_displayValue);
    v48 = objc_msgSend(v50, sel_type);

  }
  else
  {
    v49 = 0;
    v51 = 5;
    v52 = 3;
  }
  *(_BYTE *)(a2 + 136) = v49;
  *(_QWORD *)(a2 + 144) = v51;
  *(_QWORD *)(a2 + 152) = v52;
  *(_QWORD *)(a2 + 160) = v48;
  v53 = objc_msgSend(a1, sel_timeEntry);
  v54 = v119;
  sub_1CFE67614(v119);
  if (v53)
  {
    if (objc_msgSend(v53, (SEL)&selRef_forwardNavigationEntry))
      v55 = 1;
    else
      v55 = 2;
    *v54 = v55;
    v56 = v53;
    sub_1CFE67EBC((uint64_t)v54, v56, &qword_1EFC00E70, (void **)&qword_1EFC01D20, (uint64_t)sub_1CFE679E4);

  }
  else
  {
    *v54 = 0;
  }
  v57 = (uint64_t)v54;
  v58 = v121;
  sub_1CFE6AA04(v57, v121, type metadata accessor for StatusBarOverrides.TimeAndDate);

  sub_1CFE6A148(v58, (uint64_t)v120);
  v59 = objc_msgSend(a1, sel_dateEntry);
  v60 = v123;
  sub_1CFE67614(v123);
  if (v59)
  {
    if (objc_msgSend(v59, (SEL)&selRef_forwardNavigationEntry))
      v61 = 1;
    else
      v61 = 2;
    *v60 = v61;
    v62 = v59;
    sub_1CFE67EBC((uint64_t)v60, v62, qword_1EFC00E78, (void **)&qword_1EFC01D28, (uint64_t)sub_1CFE67A44);

  }
  else
  {
    *v60 = 0;
  }
  v63 = (uint64_t)v60;
  v64 = v124;
  sub_1CFE6AA04(v63, v124, type metadata accessor for StatusBarOverrides.TimeAndDate);

  sub_1CFE6A148(v64, (uint64_t)v122);
  v65 = objc_msgSend(a1, sel_locationEntry);
  if (v65)
  {
    v66 = v65;
    if (objc_msgSend(v65, (SEL)&selRef_forwardNavigationEntry))
      v67 = 1;
    else
      v67 = 2;
    v68 = objc_msgSend(v66, sel_type);

  }
  else
  {
    v68 = 0;
    v67 = 0;
  }
  v69 = v125;
  *v125 = v67;
  *((_QWORD *)v69 + 1) = v68;
  v70 = objc_msgSend(a1, sel_mainBatteryEntry);
  v71 = v70;
  if (v70)
  {
    if (objc_msgSend(v70, (SEL)&selRef_forwardNavigationEntry))
      v72 = 1;
    else
      v72 = 2;
    v73 = v71;
    v71 = objc_msgSend(v73, sel_state);
    v74 = (double)(uint64_t)objc_msgSend(v73, sel_capacity) / 100.0;
    v75 = objc_msgSend(v73, sel_saverModeActive);
    v76 = objc_msgSend(v73, sel_prominentlyShowsDetailString);

  }
  else
  {
    v76 = 0;
    v75 = 0;
    v72 = 0;
    v74 = 1.0;
  }
  *(_BYTE *)v15 = v72;
  *(_QWORD *)(v15 + 8) = v71;
  *(double *)(v15 + 16) = v74;
  *(_BYTE *)(v15 + 24) = v75;
  *(_BYTE *)(v15 + 25) = v76;
  v77 = objc_msgSend(a1, sel_bluetoothEntry);
  sub_1CFE6A2B4(v77, (uint64_t)v135);

  v78 = *(_OWORD *)&v135[16];
  v79 = v126;
  *v126 = *(_OWORD *)v135;
  v79[1] = v78;
  *(_OWORD *)((char *)v79 + 26) = *(_OWORD *)&v135[26];
  v80 = objc_msgSend(a1, sel_voiceControlEntry);
  if (v80)
  {
    v81 = v80;
    if (objc_msgSend(v80, (SEL)&selRef_forwardNavigationEntry))
      v82 = 1;
    else
      v82 = 2;
    v83 = objc_msgSend(v81, sel_type);

  }
  else
  {
    v83 = 0;
    v82 = 0;
  }
  v84 = v127;
  *v127 = v82;
  *((_QWORD *)v84 + 1) = v83;
  v85 = objc_msgSend(a1, sel_personNameEntry);
  v86 = v85;
  if (v85)
  {
    if (objc_msgSend(v85, (SEL)&selRef_forwardNavigationEntry))
      v87 = 1;
    else
      v87 = 2;
    v88 = v86;
    v89 = objc_msgSend(v88, sel_stringValue);
    v86 = (void *)sub_1CFEB3C70();
    v91 = v90;

  }
  else
  {
    v87 = 0;
    v91 = 0xE000000000000000;
  }
  v92 = v128;
  swift_bridgeObjectRelease();
  *(_BYTE *)v92 = v87;
  *(_QWORD *)(v92 + 8) = v86;
  *(_QWORD *)(v92 + 16) = v91;
  v93 = objc_msgSend(a1, sel_rotationLockEntry);
  if (v93)
  {
    v94 = v93;
    v95 = objc_msgSend(v93, (SEL)&selRef_forwardNavigationEntry);

    if (v95)
      v96 = 1;
    else
      v96 = 2;
  }
  else
  {
    v96 = 0;
  }
  *(_BYTE *)(a2 + v129) = v96;
  v97 = objc_msgSend(a1, sel_alarmEntry);
  if (v97)
  {
    v98 = v97;
    v99 = objc_msgSend(v97, (SEL)&selRef_forwardNavigationEntry);

    if (v99)
      v100 = 1;
    else
      v100 = 2;
  }
  else
  {
    v100 = 0;
  }
  *(_BYTE *)(a2 + v130) = v100;
  v101 = objc_msgSend(a1, sel_studentEntry);
  if (v101)
  {
    v102 = v101;
    v103 = objc_msgSend(v101, (SEL)&selRef_forwardNavigationEntry);

    if (v103)
      v104 = 1;
    else
      v104 = 2;
  }
  else
  {
    v104 = 0;
  }
  *(_BYTE *)(a2 + v131) = v104;
  v105 = objc_msgSend(a1, sel_airPlayEntry);
  if (v105)
  {
    v106 = v105;
    v107 = objc_msgSend(v105, (SEL)&selRef_forwardNavigationEntry);

    if (v107)
      v108 = 1;
    else
      v108 = 2;
  }
  else
  {
    v108 = 0;
  }
  *(_BYTE *)(a2 + v132) = v108;
  v109 = objc_msgSend(a1, sel_carPlayEntry);
  if (v109)
  {
    v110 = v109;
    v111 = objc_msgSend(v109, (SEL)&selRef_forwardNavigationEntry);

    if (v111)
      v112 = 1;
    else
      v112 = 2;
  }
  else
  {
    v112 = 0;
  }
  *(_BYTE *)(a2 + v133) = v112;
  v113 = objc_msgSend(a1, sel_liquidDetectionEntry);
  if (v113)
  {
    v114 = v113;
    v115 = objc_msgSend(v113, (SEL)&selRef_forwardNavigationEntry);

    if (v115)
      v116 = 1;
    else
      v116 = 2;
  }
  else
  {
    v116 = 0;
  }
  *(_BYTE *)(a2 + v134) = v116;
}

uint64_t sub_1CFE69894@<X0>(uint64_t a1@<X8>)
{
  int *v2;
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  *(_BYTE *)a1 = 0;
  *(_OWORD *)(a1 + 8) = xmmword_1CFEBE5D0;
  *(_OWORD *)(a1 + 24) = xmmword_1CFEBE5E0;
  *(_QWORD *)(a1 + 40) = 0xE700000000000000;
  *(_QWORD *)(a1 + 48) = 0;
  *(_QWORD *)(a1 + 56) = 0xE000000000000000;
  *(_BYTE *)(a1 + 64) = 0;
  *(_OWORD *)(a1 + 72) = xmmword_1CFEBE5D0;
  *(_OWORD *)(a1 + 88) = xmmword_1CFEBE5E0;
  *(_QWORD *)(a1 + 104) = 0xE700000000000000;
  *(_QWORD *)(a1 + 112) = 0;
  *(_QWORD *)(a1 + 120) = 0xE000000000000000;
  *(_WORD *)(a1 + 128) = 0;
  *(_BYTE *)(a1 + 136) = 0;
  *(_OWORD *)(a1 + 144) = xmmword_1CFEBE5F0;
  *(_QWORD *)(a1 + 160) = 0;
  v2 = (int *)type metadata accessor for StatusBarOverrides(0);
  sub_1CFE67614((_BYTE *)(a1 + v2[9]));
  result = sub_1CFE67614((_BYTE *)(a1 + v2[10]));
  v4 = a1 + v2[11];
  *(_BYTE *)v4 = 0;
  *(_QWORD *)(v4 + 8) = 0;
  v5 = a1 + v2[12];
  *(_BYTE *)v5 = 0;
  *(_QWORD *)(v5 + 8) = 0;
  *(_QWORD *)(v5 + 16) = 0x3FF0000000000000;
  *(_WORD *)(v5 + 24) = 0;
  v6 = a1 + v2[13];
  *(_BYTE *)v6 = 0;
  *(_QWORD *)(v6 + 8) = 1;
  *(_BYTE *)(v6 + 16) = 0;
  *(_QWORD *)(v6 + 24) = 0;
  *(_QWORD *)(v6 + 32) = 0x3FF0000000000000;
  *(_WORD *)(v6 + 40) = 0;
  v7 = a1 + v2[14];
  *(_BYTE *)v7 = 0;
  *(_QWORD *)(v7 + 8) = 0;
  v8 = a1 + v2[15];
  *(_BYTE *)v8 = 0;
  *(_QWORD *)(v8 + 8) = 0;
  *(_QWORD *)(v8 + 16) = 0xE000000000000000;
  *(_BYTE *)(a1 + v2[16]) = 0;
  *(_BYTE *)(a1 + v2[17]) = 0;
  *(_BYTE *)(a1 + v2[18]) = 0;
  *(_BYTE *)(a1 + v2[19]) = 0;
  *(_BYTE *)(a1 + v2[20]) = 0;
  *(_BYTE *)(a1 + v2[21]) = 0;
  return result;
}

uint64_t (*sub_1CFE699D0())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

uint64_t sub_1CFE69A18@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v1 + 160))();
  swift_release();
  v3 = v1 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides;
  swift_beginAccess();
  return sub_1CFE6A8D4(v3, a1, type metadata accessor for StatusBarOverrides);
}

uint64_t sub_1CFE69A9C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v4;
  uint64_t v5;

  swift_getKeyPath();
  v4 = v1;
  v5 = a1;
  (*(void (**)(void))(*(_QWORD *)v1 + 168))();
  swift_release();
  return sub_1CFE6A980(a1, type metadata accessor for StatusBarOverrides);
}

void (*sub_1CFE69B1C(_QWORD *a1))(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;

  v2 = v1;
  v4 = malloc(0x40uLL);
  *a1 = v4;
  v4[4] = v2;
  swift_getKeyPath();
  (*(void (**)(void))(*(_QWORD *)v2 + 160))();
  swift_release();
  v4[5] = OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData___observationRegistrar;
  *v4 = v2;
  swift_getKeyPath();
  v4[6] = sub_1CFE663D8(&qword_1EFBFF150, type metadata accessor for StatusBarOverrideData, (uint64_t)&unk_1CFEBE8E8);
  sub_1CFEB38EC();
  swift_release();
  v4[7] = sub_1CFE699D0();
  return sub_1CFE69BFC;
}

void sub_1CFE69BFC(_QWORD *a1)
{
  _QWORD *v1;

  v1 = (_QWORD *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 56))(*a1, 0);
  *v1 = v1[4];
  swift_getKeyPath();
  sub_1CFEB38E0();
  swift_release();
  free(v1);
}

uint64_t sub_1CFE69C6C(void *a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v7;

  v3 = type metadata accessor for StatusBarOverrides(0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFE68E90(a1, (uint64_t)v5);
  return (*(uint64_t (**)(char *))(*(_QWORD *)v1 + 128))(v5);
}

uint64_t sub_1CFE69CE4()
{
  uint64_t v0;
  int *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  char *v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v11;

  v1 = (int *)type metadata accessor for StatusBarOverrides(0);
  v2 = MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v11 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v4 = 0;
  *(_OWORD *)(v4 + 8) = xmmword_1CFEBE5D0;
  *(_OWORD *)(v4 + 24) = xmmword_1CFEBE5E0;
  *((_QWORD *)v4 + 5) = 0xE700000000000000;
  *((_QWORD *)v4 + 6) = 0;
  *((_QWORD *)v4 + 7) = 0xE000000000000000;
  v4[64] = 0;
  *(_OWORD *)(v4 + 72) = xmmword_1CFEBE5D0;
  *(_OWORD *)(v4 + 88) = xmmword_1CFEBE5E0;
  *((_QWORD *)v4 + 13) = 0xE700000000000000;
  *((_QWORD *)v4 + 14) = 0;
  *((_QWORD *)v4 + 15) = 0xE000000000000000;
  *((_WORD *)v4 + 64) = 0;
  v4[136] = 0;
  *((_OWORD *)v4 + 9) = xmmword_1CFEBE5F0;
  *((_QWORD *)v4 + 20) = 0;
  sub_1CFE67614(&v4[*(int *)(v2 + 36)]);
  sub_1CFE67614(&v4[v1[10]]);
  v5 = &v4[v1[11]];
  *v5 = 0;
  *((_QWORD *)v5 + 1) = 0;
  v6 = &v4[v1[12]];
  *v6 = 0;
  *((_QWORD *)v6 + 1) = 0;
  *((_QWORD *)v6 + 2) = 0x3FF0000000000000;
  *((_WORD *)v6 + 12) = 0;
  v7 = &v4[v1[13]];
  *v7 = 0;
  *((_QWORD *)v7 + 1) = 1;
  v7[16] = 0;
  *((_QWORD *)v7 + 3) = 0;
  *((_QWORD *)v7 + 4) = 0x3FF0000000000000;
  *((_WORD *)v7 + 20) = 0;
  v8 = &v4[v1[14]];
  *v8 = 0;
  *((_QWORD *)v8 + 1) = 0;
  v9 = &v4[v1[15]];
  *v9 = 0;
  *((_QWORD *)v9 + 1) = 0;
  *((_QWORD *)v9 + 2) = 0xE000000000000000;
  v4[v1[16]] = 0;
  v4[v1[17]] = 0;
  v4[v1[18]] = 0;
  v4[v1[19]] = 0;
  v4[v1[20]] = 0;
  v4[v1[21]] = 0;
  return (*(uint64_t (**)(char *))(*(_QWORD *)v0 + 128))(v4);
}

uint64_t sub_1CFE69E58()
{
  sub_1CFE663D8(&qword_1EFBFF150, type metadata accessor for StatusBarOverrideData, (uint64_t)&unk_1CFEBE8E8);
  return sub_1CFEB38D4();
}

uint64_t sub_1CFE69EC4()
{
  sub_1CFE663D8(&qword_1EFBFF150, type metadata accessor for StatusBarOverrideData, (uint64_t)&unk_1CFEBE8E8);
  return sub_1CFEB38C8();
}

uint64_t sub_1CFE69F68()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1CFE6A980(v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides, type metadata accessor for StatusBarOverrides);
  v1 = v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData___observationRegistrar;
  v2 = sub_1CFEB3904();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1CFE69FD0()
{
  uint64_t v0;

  v0 = swift_allocObject();
  sub_1CFE69894(v0 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides);
  sub_1CFEB38F8();
  return v0;
}

uint64_t sub_1CFE6A020(_QWORD *a1, _QWORD *a2)
{
  char v4;
  uint64_t result;

  if (*(unsigned __int8 *)a1 != *(unsigned __int8 *)a2 || a1[1] != a2[1] || a1[2] != a2[2] || a1[3] != a2[3])
    return 0;
  if (a1[4] == a2[4] && a1[5] == a2[5] || (v4 = sub_1CFEB3D0C(), result = 0, (v4 & 1) != 0))
  {
    if (a1[6] == a2[6] && a1[7] == a2[7])
      return 1;
    else
      return sub_1CFEB3D0C();
  }
  return result;
}

uint64_t type metadata accessor for StatusBarOverrides.TimeAndDate(uint64_t a1)
{
  return sub_1CFE6A9D0(a1, (uint64_t *)&unk_1EFC018B0);
}

uint64_t sub_1CFE6A0F4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF110);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t type metadata accessor for StatusBarOverrides(uint64_t a1)
{
  return sub_1CFE6A9D0(a1, (uint64_t *)&unk_1EFC018A0);
}

uint64_t sub_1CFE6A148(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

id sub_1CFE6A18C(id result, char a2, char a3, double a4)
{
  double v4;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a4 * 100.0;
  if ((~*(_QWORD *)&v4 & 0x7FF0000000000000) == 0)
  {
    __break(1u);
    goto LABEL_6;
  }
  if (v4 <= -9.22337204e18)
  {
LABEL_6:
    __break(1u);
    goto LABEL_7;
  }
  if (v4 < 9.22337204e18)
  {
    v7 = result;
    v8 = (uint64_t)v4;
    v12 = sub_1CFEB3CF4();
    v13 = v9;
    swift_bridgeObjectRetain();
    sub_1CFEB3C7C();
    swift_bridgeObjectRelease();
    v10 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
    v11 = objc_msgSend((id)objc_opt_self(), sel_entryWithCapacity_state_saverMode_prominentlyShowsDetailString_detailString_, v8, v7, a2 & 1, a3 & 1, v10, v12, v13);

    return v11;
  }
LABEL_7:
  __break(1u);
  return result;
}

void sub_1CFE6A2B4(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char v5;
  id v6;
  id v7;
  id v8;
  char v9;
  id v10;
  double v11;
  unsigned __int8 v12;
  unsigned __int8 v13;

  v3 = 1;
  if (a1)
  {
    if (objc_msgSend(a1, sel_isEnabled))
      v5 = 1;
    else
      v5 = 2;
    v6 = a1;
    v3 = (uint64_t)objc_msgSend(v6, sel_state);
    v7 = objc_msgSend(v6, sel_batteryEntry);
    v8 = v7;
    if (v7)
    {
      if (objc_msgSend(v7, sel_isEnabled))
        v9 = 1;
      else
        v9 = 2;
      v10 = v8;
      v8 = objc_msgSend(v10, sel_state);
      v11 = (double)(uint64_t)objc_msgSend(v10, sel_capacity) / 100.0;
      v12 = objc_msgSend(v10, sel_saverModeActive);
      v13 = objc_msgSend(v10, sel_prominentlyShowsDetailString);

      v6 = v10;
    }
    else
    {
      v13 = 0;
      v12 = 0;
      v9 = 0;
      v11 = 1.0;
    }

  }
  else
  {
    v13 = 0;
    v12 = 0;
    v8 = 0;
    v9 = 0;
    v5 = 0;
    v11 = 1.0;
  }
  *(_BYTE *)a2 = v5;
  *(_QWORD *)(a2 + 8) = v3;
  *(_BYTE *)(a2 + 16) = v9;
  *(_QWORD *)(a2 + 24) = v8;
  *(double *)(a2 + 32) = v11;
  *(_BYTE *)(a2 + 40) = v12;
  *(_BYTE *)(a2 + 41) = v13;
}

BOOL sub_1CFE6A420(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return *a1 == *a2
      && *((_QWORD *)a1 + 1) == *((_QWORD *)a2 + 1)
      && a1[16] == a2[16]
      && *((_QWORD *)a1 + 3) == *((_QWORD *)a2 + 3)
      && *((double *)a1 + 4) == *((double *)a2 + 4)
      && ((a1[40] ^ a2[40]) & 1) == 0
      && (a1[41] & 1) == (a2[41] & 1);
}

uint64_t sub_1CFE6A4A8(uint64_t a1, unint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, a2);
  }
  return result;
}

BOOL sub_1CFE6A4E0(unsigned __int8 *a1, unsigned __int8 *a2)
{
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  char v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  int *v16;
  uint64_t v17;
  unsigned __int8 *v18;
  int v19;
  unsigned __int8 *v20;
  uint64_t v21;
  unsigned __int8 *v22;
  int v23;
  unsigned __int8 *v24;
  uint64_t v25;
  unsigned __int8 *v26;
  int v27;
  unsigned __int8 *v28;
  uint64_t v29;
  unsigned __int8 *v30;
  int v31;
  unsigned __int8 *v32;
  uint64_t v33;
  unsigned __int8 *v34;
  int v35;
  unsigned __int8 *v36;
  char v37;
  _OWORD v38[4];
  _OWORD v39[4];

  if (*a1 != *a2)
    return 0;
  result = 0;
  if (*((_QWORD *)a1 + 1) != *((_QWORD *)a2 + 1)
    || *((_QWORD *)a1 + 2) != *((_QWORD *)a2 + 2)
    || *((_QWORD *)a1 + 3) != *((_QWORD *)a2 + 3))
  {
    return result;
  }
  v5 = *((_QWORD *)a1 + 6);
  v6 = *((_QWORD *)a1 + 7);
  v7 = *((_QWORD *)a2 + 6);
  v8 = *((_QWORD *)a2 + 7);
  if (*((_QWORD *)a1 + 4) != *((_QWORD *)a2 + 4) || *((_QWORD *)a1 + 5) != *((_QWORD *)a2 + 5))
  {
    v9 = sub_1CFEB3D0C();
    result = 0;
    if ((v9 & 1) == 0)
      return result;
  }
  if (v5 != v7 || v6 != v8)
  {
    v10 = sub_1CFEB3D0C();
    result = 0;
    if ((v10 & 1) == 0)
      return result;
  }
  v11 = *((_OWORD *)a1 + 5);
  v38[0] = *((_OWORD *)a1 + 4);
  v38[1] = v11;
  v12 = *((_OWORD *)a1 + 7);
  v38[2] = *((_OWORD *)a1 + 6);
  v38[3] = v12;
  v13 = *((_OWORD *)a2 + 5);
  v39[0] = *((_OWORD *)a2 + 4);
  v39[1] = v13;
  v14 = *((_OWORD *)a2 + 7);
  v39[2] = *((_OWORD *)a2 + 6);
  v39[3] = v14;
  if ((sub_1CFE6A020(v38, v39) & 1) == 0 || a1[128] != a2[128] || a1[129] != a2[129] || a1[136] != a2[136])
    return 0;
  result = 0;
  if (*((_QWORD *)a1 + 18) != *((_QWORD *)a2 + 18)
    || *((_QWORD *)a1 + 19) != *((_QWORD *)a2 + 19)
    || *((_QWORD *)a1 + 20) != *((_QWORD *)a2 + 20))
  {
    return result;
  }
  v15 = type metadata accessor for StatusBarOverrides(0);
  if (a1[*(int *)(v15 + 36)] != a2[*(int *)(v15 + 36)])
    return 0;
  v16 = (int *)v15;
  type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  if ((sub_1CFEB3838() & 1) == 0)
    return 0;
  if (a1[v16[10]] != a2[v16[10]])
    return 0;
  if ((sub_1CFEB3838() & 1) == 0)
    return 0;
  v17 = v16[11];
  v18 = &a1[v17];
  v19 = a1[v17];
  v20 = &a2[v17];
  if (v19 != *v20)
    return 0;
  if (*((_QWORD *)v18 + 1) != *((_QWORD *)v20 + 1))
    return 0;
  v21 = v16[12];
  v22 = &a1[v21];
  v23 = a1[v21];
  v24 = &a2[v21];
  if (v23 != *v24)
    return 0;
  result = 0;
  if (*((_QWORD *)v22 + 1) != *((_QWORD *)v24 + 1)
    || *((double *)v22 + 2) != *((double *)v24 + 2)
    || ((v24[24] ^ v22[24]) & 1) != 0
    || ((v24[25] ^ v22[25]) & 1) != 0)
  {
    return result;
  }
  v25 = v16[13];
  v26 = &a1[v25];
  v27 = a1[v25];
  v28 = &a2[v25];
  if (v27 != *v28)
    return 0;
  result = 0;
  if (*((_QWORD *)v26 + 1) != *((_QWORD *)v28 + 1))
    return result;
  if (v26[16] != v28[16])
    return result;
  result = 0;
  if (*((_QWORD *)v26 + 3) != *((_QWORD *)v28 + 3)
    || *((double *)v26 + 4) != *((double *)v28 + 4)
    || ((v26[40] ^ v28[40]) & 1) != 0
    || ((v26[41] ^ v28[41]) & 1) != 0)
  {
    return result;
  }
  v29 = v16[14];
  v30 = &a1[v29];
  v31 = a1[v29];
  v32 = &a2[v29];
  if (v31 != *v32)
    return 0;
  if (*((_QWORD *)v30 + 1) != *((_QWORD *)v32 + 1))
    return 0;
  v33 = v16[15];
  v34 = &a1[v33];
  v35 = a1[v33];
  v36 = &a2[v33];
  if (v35 != *v36)
    return 0;
  if (*((_QWORD *)v34 + 1) == *((_QWORD *)v36 + 1) && *((_QWORD *)v34 + 2) == *((_QWORD *)v36 + 2)
    || (v37 = sub_1CFEB3D0C(), result = 0, (v37 & 1) != 0))
  {
    if (a1[v16[16]] == a2[v16[16]]
      && a1[v16[17]] == a2[v16[17]]
      && a1[v16[18]] == a2[v16[18]]
      && a1[v16[19]] == a2[v16[19]]
      && a1[v16[20]] == a2[v16[20]])
    {
      return a1[v16[21]] == a2[v16[21]];
    }
    return 0;
  }
  return result;
}

uint64_t sub_1CFE6A8D4(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1CFE6A918()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 24);
  v3 = v1 + OBJC_IVAR____TtC14SystemStatusUI21StatusBarOverrideData__overrides;
  swift_beginAccess();
  sub_1CFE6C714(v2, v3);
  return swift_endAccess();
}

uint64_t sub_1CFE6A980(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t type metadata accessor for StatusBarOverrideData(uint64_t a1)
{
  return sub_1CFE6A9D0(a1, qword_1EFC018C0);
}

uint64_t sub_1CFE6A9D0(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1CFE6AA04(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_1CFE6AA4C()
{
  unint64_t result;

  result = qword_1EFBFF158;
  if (!qword_1EFBFF158)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE638, &type metadata for StatusBarOverride);
    atomic_store(result, (unint64_t *)&qword_1EFBFF158);
  }
  return result;
}

unint64_t sub_1CFE6AA90(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6AAB4();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AAB4()
{
  unint64_t result;

  result = qword_1EFBFF160;
  if (!qword_1EFBFF160)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE6BC, &type metadata for StatusBarOverrides.Cellular);
    atomic_store(result, (unint64_t *)&qword_1EFBFF160);
  }
  return result;
}

unint64_t sub_1CFE6AAF8(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6AB1C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AB1C()
{
  unint64_t result;

  result = qword_1EFBFF168;
  if (!qword_1EFBFF168)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE700, &type metadata for StatusBarOverrides.WiFi);
    atomic_store(result, (unint64_t *)&qword_1EFBFF168);
  }
  return result;
}

uint64_t sub_1CFE6AB60(uint64_t a1)
{
  uint64_t result;

  result = sub_1CFE663D8(&qword_1EFBFF170, type metadata accessor for StatusBarOverrides.TimeAndDate, (uint64_t)&unk_1CFEBE744);
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AB9C(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6ABC0();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6ABC0()
{
  unint64_t result;

  result = qword_1EFBFF178;
  if (!qword_1EFBFF178)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE788, &type metadata for StatusBarOverrides.Location);
    atomic_store(result, (unint64_t *)&qword_1EFBFF178);
  }
  return result;
}

unint64_t sub_1CFE6AC04(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6AC28();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AC28()
{
  unint64_t result;

  result = qword_1EFBFF180;
  if (!qword_1EFBFF180)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE7CC, &type metadata for StatusBarOverrides.Battery);
    atomic_store(result, (unint64_t *)&qword_1EFBFF180);
  }
  return result;
}

unint64_t sub_1CFE6AC6C(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6AC90();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AC90()
{
  unint64_t result;

  result = qword_1EFBFF188;
  if (!qword_1EFBFF188)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE810, &type metadata for StatusBarOverrides.Bluetooth);
    atomic_store(result, (unint64_t *)&qword_1EFBFF188);
  }
  return result;
}

unint64_t sub_1CFE6ACD4(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6ACF8();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6ACF8()
{
  unint64_t result;

  result = qword_1EFBFF190;
  if (!qword_1EFBFF190)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE854, &type metadata for StatusBarOverrides.VoiceControl);
    atomic_store(result, (unint64_t *)&qword_1EFBFF190);
  }
  return result;
}

unint64_t sub_1CFE6AD3C(uint64_t a1)
{
  unint64_t result;

  result = sub_1CFE6AD60();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1CFE6AD60()
{
  unint64_t result;

  result = qword_1EFBFF198;
  if (!qword_1EFBFF198)
  {
    result = MEMORY[0x1D17DE4C4](&unk_1CFEBE898, &type metadata for StatusBarOverrides.User);
    atomic_store(result, (unint64_t *)&qword_1EFBFF198);
  }
  return result;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverride(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFE)
    goto LABEL_17;
  if (a2 + 2 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 2) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 2;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 2;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 2;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 3;
  v8 = v6 - 3;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverride(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 2 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 2) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFE)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFD)
    return ((uint64_t (*)(void))((char *)&loc_1CFE6AE90 + 4 * byte_1CFEBE605[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1CFE6AEC4 + 4 * byte_1CFEBE600[v4]))();
}

uint64_t sub_1CFE6AEC4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFE6AECC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1CFE6AED4);
  return result;
}

uint64_t sub_1CFE6AEE0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1CFE6AEE8);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1CFE6AEEC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFE6AEF4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1CFE6AF00(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1CFE6AF08(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverride()
{
  return &type metadata for StatusBarOverride;
}

_QWORD *sub_1CFE6AF20(uint64_t a1, uint64_t *a2, int *a3)
{
  _QWORD *v4;
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, uint64_t, uint64_t);
  uint64_t v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t v19;
  _OWORD *v20;
  _OWORD *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  _OWORD *v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v36;
  uint64_t v37;

  v4 = (_QWORD *)a1;
  v5 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v34 = *a2;
    *v4 = *a2;
    v4 = (_QWORD *)(v34 + ((v5 + 16) & ~(unint64_t)v5));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 1);
    *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 3);
    v7 = a2[6];
    *(_QWORD *)(a1 + 40) = a2[5];
    *(_QWORD *)(a1 + 48) = v7;
    *(_QWORD *)(a1 + 56) = a2[7];
    *(_BYTE *)(a1 + 64) = *((_BYTE *)a2 + 64);
    *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 9);
    *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 11);
    v8 = a2[14];
    *(_QWORD *)(a1 + 104) = a2[13];
    *(_QWORD *)(a1 + 112) = v8;
    *(_QWORD *)(a1 + 120) = a2[15];
    *(_WORD *)(a1 + 128) = *((_WORD *)a2 + 64);
    *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 17);
    *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 19);
    v9 = a3[9];
    v10 = a1 + v9;
    v11 = (uint64_t)a2 + v9;
    *(_BYTE *)(a1 + v9) = *((_BYTE *)a2 + v9);
    v12 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    v13 = *(int *)(v12 + 20);
    v36 = v11 + v13;
    v37 = v10 + v13;
    v14 = sub_1CFEB385C();
    v15 = *(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15(v37, v36, v14);
    v16 = a3[10];
    v17 = (char *)v4 + v16;
    v18 = (char *)a2 + v16;
    *v17 = *v18;
    v15((uint64_t)&v17[*(int *)(v12 + 20)], (uint64_t)&v18[*(int *)(v12 + 20)], v14);
    v19 = a3[12];
    *(_OWORD *)((char *)v4 + a3[11]) = *(_OWORD *)((char *)a2 + a3[11]);
    v20 = (_OWORD *)((char *)v4 + v19);
    v21 = (_OWORD *)((char *)a2 + v19);
    *v20 = *v21;
    *(_OWORD *)((char *)v20 + 10) = *(_OWORD *)((char *)v21 + 10);
    v22 = a3[13];
    v23 = a3[14];
    v24 = (_OWORD *)((char *)v4 + v22);
    v25 = (_OWORD *)((char *)a2 + v22);
    v26 = v25[1];
    *v24 = *v25;
    v24[1] = v26;
    *(_OWORD *)((char *)v24 + 26) = *(_OWORD *)((char *)v25 + 26);
    *(_OWORD *)((char *)v4 + v23) = *(_OWORD *)((char *)a2 + v23);
    v27 = a3[15];
    v28 = a3[16];
    v29 = (char *)v4 + v27;
    v30 = (char *)a2 + v27;
    *v29 = *v30;
    v31 = *((_QWORD *)v30 + 2);
    *((_QWORD *)v29 + 1) = *((_QWORD *)v30 + 1);
    *((_QWORD *)v29 + 2) = v31;
    *((_BYTE *)v4 + v28) = *((_BYTE *)a2 + v28);
    v32 = a3[18];
    *((_BYTE *)v4 + a3[17]) = *((_BYTE *)a2 + a3[17]);
    *((_BYTE *)v4 + v32) = *((_BYTE *)a2 + v32);
    v33 = a3[20];
    *((_BYTE *)v4 + a3[19]) = *((_BYTE *)a2 + a3[19]);
    *((_BYTE *)v4 + v33) = *((_BYTE *)a2 + v33);
    *((_BYTE *)v4 + a3[21]) = *((_BYTE *)a2 + a3[21]);
    swift_bridgeObjectRetain();
  }
  return v4;
}

uint64_t sub_1CFE6B140(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 36);
  v5 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v6 = v4 + *(int *)(v5 + 20);
  v7 = sub_1CFEB385C();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(a1 + *(int *)(a2 + 40) + *(int *)(v5 + 20), v7);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1CFE6B1F0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
  uint64_t v18;
  _OWORD *v19;
  _OWORD *v20;
  uint64_t v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  __int128 v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v34;
  _BYTE *v35;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  v7 = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = v7;
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v11 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v12 = *(int *)(v11 + 20);
  v34 = (_BYTE *)(v10 + v12);
  v35 = (_BYTE *)(v9 + v12);
  v13 = sub_1CFEB385C();
  v14 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14(v35, v34, v13);
  v15 = a3[10];
  v16 = (_BYTE *)(a1 + v15);
  v17 = (_BYTE *)(a2 + v15);
  *v16 = *v17;
  v14(&v16[*(int *)(v11 + 20)], &v17[*(int *)(v11 + 20)], v13);
  v18 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  v19 = (_OWORD *)(a1 + v18);
  v20 = (_OWORD *)(a2 + v18);
  *v19 = *v20;
  *(_OWORD *)((char *)v19 + 10) = *(_OWORD *)((char *)v20 + 10);
  v21 = a3[13];
  v22 = a3[14];
  v23 = (_OWORD *)(a1 + v21);
  v24 = (_OWORD *)(a2 + v21);
  v25 = v24[1];
  *v23 = *v24;
  v23[1] = v25;
  *(_OWORD *)((char *)v23 + 26) = *(_OWORD *)((char *)v24 + 26);
  *(_OWORD *)(a1 + v22) = *(_OWORD *)(a2 + v22);
  v26 = a3[15];
  v27 = a3[16];
  v28 = a1 + v26;
  v29 = a2 + v26;
  *(_BYTE *)v28 = *(_BYTE *)v29;
  v30 = *(_QWORD *)(v29 + 16);
  *(_QWORD *)(v28 + 8) = *(_QWORD *)(v29 + 8);
  *(_QWORD *)(v28 + 16) = v30;
  *(_BYTE *)(a1 + v27) = *(_BYTE *)(a2 + v27);
  v31 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v31) = *(_BYTE *)(a2 + v31);
  v32 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v32) = *(_BYTE *)(a2 + v32);
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1CFE6B3E4(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  _BYTE *v12;
  uint64_t v13;
  void (*v14)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v15;
  _BYTE *v16;
  _BYTE *v17;
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
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_QWORD *)(a1 + 144) = *(_QWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v6 = a3[9];
  v7 = a1 + v6;
  v8 = a2 + v6;
  *(_BYTE *)(a1 + v6) = *(_BYTE *)(a2 + v6);
  v9 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v10 = *(int *)(v9 + 20);
  v11 = (_BYTE *)(v7 + v10);
  v12 = (_BYTE *)(v8 + v10);
  v13 = sub_1CFEB385C();
  v14 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v13 - 8) + 24);
  v14(v11, v12, v13);
  v15 = a3[10];
  v16 = (_BYTE *)(a1 + v15);
  v17 = (_BYTE *)(a2 + v15);
  *v16 = *v17;
  v14(&v16[*(int *)(v9 + 20)], &v17[*(int *)(v9 + 20)], v13);
  v18 = a3[11];
  v19 = a1 + v18;
  v20 = a2 + v18;
  *(_BYTE *)v19 = *(_BYTE *)v20;
  *(_QWORD *)(v19 + 8) = *(_QWORD *)(v20 + 8);
  v21 = a3[12];
  v22 = a1 + v21;
  v23 = a2 + v21;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  *(_QWORD *)(v22 + 16) = *(_QWORD *)(v23 + 16);
  *(_BYTE *)(v22 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v22 + 25) = *(_BYTE *)(v23 + 25);
  v24 = a3[13];
  v25 = a1 + v24;
  v26 = a2 + v24;
  *(_BYTE *)v25 = *(_BYTE *)v26;
  *(_QWORD *)(v25 + 8) = *(_QWORD *)(v26 + 8);
  *(_BYTE *)(v25 + 16) = *(_BYTE *)(v26 + 16);
  *(_QWORD *)(v25 + 24) = *(_QWORD *)(v26 + 24);
  *(_QWORD *)(v25 + 32) = *(_QWORD *)(v26 + 32);
  *(_BYTE *)(v25 + 40) = *(_BYTE *)(v26 + 40);
  *(_BYTE *)(v25 + 41) = *(_BYTE *)(v26 + 41);
  v27 = a3[14];
  v28 = a1 + v27;
  v29 = a2 + v27;
  *(_BYTE *)v28 = *(_BYTE *)v29;
  *(_QWORD *)(v28 + 8) = *(_QWORD *)(v29 + 8);
  v30 = a3[15];
  v31 = a1 + v30;
  v32 = a2 + v30;
  *(_BYTE *)v31 = *(_BYTE *)v32;
  *(_QWORD *)(v31 + 8) = *(_QWORD *)(v32 + 8);
  *(_QWORD *)(v31 + 16) = *(_QWORD *)(v32 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + a3[20]) = *(_BYTE *)(a2 + a3[20]);
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1CFE6B6B8(uint64_t a1, uint64_t a2, int *a3)
{
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE *v15;
  _BYTE *v16;
  uint64_t v17;
  void (*v18)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v19;
  _BYTE *v20;
  _BYTE *v21;
  uint64_t v22;
  _OWORD *v23;
  _OWORD *v24;
  uint64_t v25;
  uint64_t v26;
  _OWORD *v27;
  _OWORD *v28;
  __int128 v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_BYTE *)(a1 + 128) = *(_BYTE *)(a2 + 128);
  *(_BYTE *)(a1 + 129) = *(_BYTE *)(a2 + 129);
  *(_OWORD *)(a1 + 136) = *(_OWORD *)(a2 + 136);
  *(_OWORD *)(a1 + 152) = *(_OWORD *)(a2 + 152);
  v10 = a3[9];
  v11 = a1 + v10;
  v12 = a2 + v10;
  *(_BYTE *)(a1 + v10) = *(_BYTE *)(a2 + v10);
  v13 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v14 = *(int *)(v13 + 20);
  v15 = (_BYTE *)(v11 + v14);
  v16 = (_BYTE *)(v12 + v14);
  v17 = sub_1CFEB385C();
  v18 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v17 - 8) + 32);
  v18(v15, v16, v17);
  v19 = a3[10];
  v20 = (_BYTE *)(a1 + v19);
  v21 = (_BYTE *)(a2 + v19);
  *v20 = *v21;
  v18(&v20[*(int *)(v13 + 20)], &v21[*(int *)(v13 + 20)], v17);
  v22 = a3[12];
  *(_OWORD *)(a1 + a3[11]) = *(_OWORD *)(a2 + a3[11]);
  v23 = (_OWORD *)(a1 + v22);
  v24 = (_OWORD *)(a2 + v22);
  *v23 = *v24;
  *(_OWORD *)((char *)v23 + 10) = *(_OWORD *)((char *)v24 + 10);
  v25 = a3[13];
  v26 = a3[14];
  v27 = (_OWORD *)(a1 + v25);
  v28 = (_OWORD *)(a2 + v25);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  *(_OWORD *)((char *)v27 + 26) = *(_OWORD *)((char *)v28 + 26);
  *(_OWORD *)(a1 + v26) = *(_OWORD *)(a2 + v26);
  v30 = a3[15];
  v31 = a3[16];
  v32 = a1 + v30;
  v33 = a2 + v30;
  *(_OWORD *)v32 = *(_OWORD *)v33;
  *(_QWORD *)(v32 + 16) = *(_QWORD *)(v33 + 16);
  *(_BYTE *)(a1 + v31) = *(_BYTE *)(a2 + v31);
  v34 = a3[18];
  *(_BYTE *)(a1 + a3[17]) = *(_BYTE *)(a2 + a3[17]);
  *(_BYTE *)(a1 + v34) = *(_BYTE *)(a2 + v34);
  v35 = a3[20];
  *(_BYTE *)(a1 + a3[19]) = *(_BYTE *)(a2 + a3[19]);
  *(_BYTE *)(a1 + v35) = *(_BYTE *)(a2 + v35);
  *(_BYTE *)(a1 + a3[21]) = *(_BYTE *)(a2 + a3[21]);
  return a1;
}

uint64_t sub_1CFE6B850(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  _BYTE *v14;
  uint64_t v15;
  void (*v16)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v17;
  _BYTE *v18;
  _BYTE *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v6;
  swift_bridgeObjectRelease();
  *(_BYTE *)(a1 + 64) = *(_BYTE *)(a2 + 64);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = v7;
  swift_bridgeObjectRelease();
  *(_WORD *)(a1 + 128) = *(_WORD *)(a2 + 128);
  *(_BYTE *)(a1 + 136) = *(_BYTE *)(a2 + 136);
  *(_OWORD *)(a1 + 144) = *(_OWORD *)(a2 + 144);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  v8 = a3[9];
  v9 = a1 + v8;
  v10 = a2 + v8;
  *(_BYTE *)(a1 + v8) = *(_BYTE *)(a2 + v8);
  v11 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v12 = *(int *)(v11 + 20);
  v13 = (_BYTE *)(v9 + v12);
  v14 = (_BYTE *)(v10 + v12);
  v15 = sub_1CFEB385C();
  v16 = *(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v15 - 8) + 40);
  v16(v13, v14, v15);
  v17 = a3[10];
  v18 = (_BYTE *)(a1 + v17);
  v19 = (_BYTE *)(a2 + v17);
  *v18 = *v19;
  v16(&v18[*(int *)(v11 + 20)], &v19[*(int *)(v11 + 20)], v15);
  v20 = a3[11];
  v21 = a3[12];
  v22 = a1 + v20;
  v23 = a2 + v20;
  *(_BYTE *)v22 = *(_BYTE *)v23;
  *(_QWORD *)(v22 + 8) = *(_QWORD *)(v23 + 8);
  v24 = a1 + v21;
  v25 = a2 + v21;
  *(_BYTE *)v24 = *(_BYTE *)v25;
  *(_QWORD *)(v24 + 8) = *(_QWORD *)(v25 + 8);
  *(_QWORD *)(v24 + 16) = *(_QWORD *)(v25 + 16);
  *(_BYTE *)(v24 + 24) = *(_BYTE *)(v25 + 24);
  *(_BYTE *)(v24 + 25) = *(_BYTE *)(v25 + 25);
  v26 = a3[13];
  v27 = a3[14];
  v28 = a1 + v26;
  v29 = a2 + v26;
  *(_BYTE *)v28 = *(_BYTE *)v29;
  *(_QWORD *)(v28 + 8) = *(_QWORD *)(v29 + 8);
  *(_BYTE *)(v28 + 16) = *(_BYTE *)(v29 + 16);
  *(_QWORD *)(v28 + 24) = *(_QWORD *)(v29 + 24);
  *(_QWORD *)(v28 + 32) = *(_QWORD *)(v29 + 32);
  *(_BYTE *)(v28 + 40) = *(_BYTE *)(v29 + 40);
  *(_BYTE *)(v28 + 41) = *(_BYTE *)(v29 + 41);
  v30 = a1 + v27;
  v31 = a2 + v27;
  *(_BYTE *)v30 = *(_BYTE *)v31;
  *(_QWORD *)(v30 + 8) = *(_QWORD *)(v31 + 8);
  v32 = a3[15];
  v33 = a1 + v32;
  v34 = a2 + v32;
  *(_BYTE *)v33 = *(_BYTE *)v34;
  v36 = *(_QWORD *)(v34 + 8);
  v35 = *(_QWORD *)(v34 + 16);
  *(_QWORD *)(v33 + 8) = v36;
  *(_QWORD *)(v33 + 16) = v35;
  swift_bridgeObjectRelease();
  v37 = a3[17];
  *(_BYTE *)(a1 + a3[16]) = *(_BYTE *)(a2 + a3[16]);
  *(_BYTE *)(a1 + v37) = *(_BYTE *)(a2 + v37);
  v38 = a3[19];
  *(_BYTE *)(a1 + a3[18]) = *(_BYTE *)(a2 + a3[18]);
  *(_BYTE *)(a1 + v38) = *(_BYTE *)(a2 + v38);
  v39 = a3[21];
  *(_BYTE *)(a1 + a3[20]) = *(_BYTE *)(a2 + a3[20]);
  *(_BYTE *)(a1 + v39) = *(_BYTE *)(a2 + v39);
  return a1;
}

uint64_t sub_1CFE6BAA0()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CFE6BAAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 40);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_1CFE6BB28()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CFE6BB34(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 40) = (a2 - 1);
  }
  else
  {
    v7 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t sub_1CFE6BBA8()
{
  uint64_t result;
  unint64_t v1;

  result = type metadata accessor for StatusBarOverrides.TimeAndDate(319);
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t destroy for StatusBarOverrides.Cellular()
{
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  v3 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v3;
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy64_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v4;
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t assignWithTake for StatusBarOverrides.Cellular(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v4 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v4;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Cellular(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 64))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 40);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Cellular(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 56) = 0;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 64) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 40) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 64) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Cellular()
{
  return &type metadata for StatusBarOverrides.Cellular;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.WiFi(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[32])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.WiFi(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 32) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 32) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.WiFi()
{
  return &type metadata for StatusBarOverrides.WiFi;
}

uint64_t *sub_1CFE6BF24(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t *v3;
  int v4;
  uint64_t v5;
  _BYTE *v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v4 & 0x20000) != 0)
  {
    v9 = *a2;
    *v3 = *a2;
    v3 = (uint64_t *)(v9 + ((v4 + 16) & ~(unint64_t)v4));
    swift_retain();
  }
  else
  {
    *(_BYTE *)a1 = *(_BYTE *)a2;
    v5 = *(int *)(a3 + 20);
    v6 = (char *)a1 + v5;
    v7 = (char *)a2 + v5;
    v8 = sub_1CFEB385C();
    (*(void (**)(_BYTE *, char *, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(v6, v7, v8);
  }
  return v3;
}

uint64_t sub_1CFE6BFAC(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = a1 + *(int *)(a2 + 20);
  v3 = sub_1CFEB385C();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
}

_BYTE *sub_1CFE6BFE4(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CFEB385C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(v5, v6, v7);
  return a1;
}

_BYTE *sub_1CFE6C040(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CFEB385C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 24))(v5, v6, v7);
  return a1;
}

_BYTE *sub_1CFE6C09C(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CFEB385C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(v5, v6, v7);
  return a1;
}

_BYTE *sub_1CFE6C0F8(_BYTE *a1, _BYTE *a2, uint64_t a3)
{
  uint64_t v4;
  _BYTE *v5;
  _BYTE *v6;
  uint64_t v7;

  *a1 = *a2;
  v4 = *(int *)(a3 + 20);
  v5 = &a1[v4];
  v6 = &a2[v4];
  v7 = sub_1CFEB385C();
  (*(void (**)(_BYTE *, _BYTE *, uint64_t))(*(_QWORD *)(v7 - 8) + 40))(v5, v6, v7);
  return a1;
}

uint64_t sub_1CFE6C154()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1CFE6C160(unsigned __int8 *a1, uint64_t a2, uint64_t a3)
{
  unsigned int v4;
  uint64_t v8;

  if ((_DWORD)a2 == 253)
  {
    v4 = *a1;
    if (v4 >= 3)
      return v4 - 2;
    else
      return 0;
  }
  else
  {
    v8 = sub_1CFEB385C();
    return (*(uint64_t (**)(unsigned __int8 *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(&a1[*(int *)(a3 + 20)], a2, v8);
  }
}

uint64_t sub_1CFE6C1D4()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

_BYTE *sub_1CFE6C1E0(_BYTE *result, uint64_t a2, int a3, uint64_t a4)
{
  _BYTE *v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 253)
  {
    *result = a2 + 2;
  }
  else
  {
    v7 = sub_1CFEB385C();
    return (_BYTE *)(*(uint64_t (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(&v5[*(int *)(a4 + 20)], a2, a2, v7);
  }
  return result;
}

uint64_t sub_1CFE6C250()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1CFEB385C();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Location()
{
  return &type metadata for StatusBarOverrides.Location;
}

__n128 __swift_memcpy26_8(uint64_t a1, uint64_t a2)
{
  __n128 result;

  result = *(__n128 *)a2;
  *(_OWORD *)(a1 + 10) = *(_OWORD *)(a2 + 10);
  *(__n128 *)a1 = result;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Battery(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 26))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 24);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Battery(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_WORD *)(result + 24) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 26) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 26) = 0;
    if (a2)
      *(_BYTE *)(result + 24) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Battery()
{
  return &type metadata for StatusBarOverrides.Battery;
}

__n128 __swift_memcpy42_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)(a1 + 26) = *(_OWORD *)(a2 + 26);
  *(__n128 *)a1 = result;
  *(_OWORD *)(a1 + 16) = v3;
  return result;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.Bluetooth(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 42))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 40);
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.Bluetooth(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 40) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 42) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 42) = 0;
    if (a2)
      *(_BYTE *)(result + 40) = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.Bluetooth()
{
  return &type metadata for StatusBarOverrides.Bluetooth;
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV8LocationVwet_0(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && a1[16])
    return (*(_DWORD *)a1 + 254);
  v3 = *a1;
  v4 = v3 >= 3;
  v5 = v3 - 3;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV8LocationVwst_0(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_QWORD *)result = a2 - 254;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 2;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.VoiceControl()
{
  return &type metadata for StatusBarOverrides.VoiceControl;
}

uint64_t destroy for StatusBarOverrides.User()
{
  return swift_bridgeObjectRelease();
}

uint64_t _s14SystemStatusUI18StatusBarOverridesV4UserVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for StatusBarOverrides.User(uint64_t a1, uint64_t a2)
{
  *(_BYTE *)a1 = *(_BYTE *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

__n128 __swift_memcpy24_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u64[0] = a2[1].n128_u64[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for StatusBarOverrides.User(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  *(_BYTE *)a1 = *(_BYTE *)a2;
  v3 = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for StatusBarOverrides.User(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 24))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 16);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for StatusBarOverrides.User(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 8) = 0;
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 24) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_QWORD *)(result + 16) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 24) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for StatusBarOverrides.User()
{
  return &type metadata for StatusBarOverrides.User;
}

uint64_t sub_1CFE6C670()
{
  return type metadata accessor for StatusBarOverrideData(0);
}

uint64_t sub_1CFE6C678()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = type metadata accessor for StatusBarOverrides(319);
  if (v1 <= 0x3F)
  {
    result = sub_1CFEB3904();
    if (v2 <= 0x3F)
    {
      result = swift_updateClassMetadata2();
      if (!result)
        return 0;
    }
  }
  return result;
}

void type metadata accessor for STStatusBarDataNetworkStatus(uint64_t a1)
{
  sub_1CFE66368(a1, &qword_1EFBFF3D8);
}

uint64_t sub_1CFE6C714(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a2, a1, v4);
  return a2;
}

uint64_t variable initialization expression of STUIStatusBarDataOverridesViewController.overridesController()
{
  return 0;
}

id variable initialization expression of STUIStatusBarDataOverridesViewController.statusBarOverridesStatusDomain()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB0A18]), sel_init);
}

id variable initialization expression of STUIStatusBarDataOverridesViewController.statusBarOverridesStatusDomainPublisher()
{
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB0A28]), sel_init);
}

Swift::Void __swiftcall STUIStatusBarDataOverridesViewController.viewDidLoad()()
{
  char *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  uint64_t aBlock;
  uint64_t v43;
  void (*v44)(uint64_t, void *);
  void *v45;
  uint64_t (*v46)(void *);
  uint64_t v47;
  objc_super v48;

  v1 = v0;
  v48.receiver = v0;
  v48.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  objc_msgSendSuper2(&v48, sel_viewDidLoad);
  type metadata accessor for StatusBarOverrideData(0);
  v2 = sub_1CFE69FD0();
  v3 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  v4 = *(void **)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain];
  v5 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v46 = sub_1CFE6CF78;
  v47 = v5;
  aBlock = MEMORY[0x1E0C809B0];
  v43 = 1107296256;
  v44 = sub_1CFE6CFAC;
  v45 = &block_descriptor;
  v6 = _Block_copy(&aBlock);
  v7 = v4;
  swift_release();
  objc_msgSend(v7, sel_observeDataWithBlock_, v6);
  _Block_release(v6);

  v8 = objc_msgSend(*(id *)&v0[v3], sel_data);
  if (v8)
  {
    v9 = v8;
    v10 = objc_msgSend(v8, sel_customOverrides);

    if (v10)
    {
      (*(void (**)(id))(*(_QWORD *)v2 + 144))(v10);

    }
  }
  swift_allocObject();
  swift_unknownObjectWeakInit();
  swift_retain();
  v11 = sub_1CFE64B30();
  v13 = (uint64_t)v12;
  aBlock = v11;
  v43 = v14;
  v44 = v12;
  v45 = v15;
  v16 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF3E8));
  swift_retain();
  swift_retain();
  v39 = v13;
  sub_1CFE64D3C(v13);
  v17 = (void *)sub_1CFEB3A18();
  v18 = *(void **)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController];
  *(_QWORD *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = v17;
  v19 = v17;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF3F8);
  v20 = swift_allocObject();
  *(_OWORD *)(v20 + 16) = xmmword_1CFEBEC20;
  v21 = objc_msgSend(v19, sel_view);
  if (!v21)
  {
    __break(1u);
LABEL_25:
    __break(1u);
LABEL_26:
    __break(1u);
LABEL_27:
    __break(1u);
LABEL_28:
    __break(1u);
    goto LABEL_29;
  }
  v22 = (uint64_t)v21;
  v23 = sub_1CFE6A4A8(0, &qword_1EFBFF400);
  v45 = (void *)v23;
  aBlock = v22;
  v24 = objc_msgSend(v1, sel_view);
  if (v24)
  {
    *((_QWORD *)&v41 + 1) = v23;
    *(_QWORD *)&v40 = v24;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  sub_1CFE6A4A8(0, &qword_1EFBFF408);
  *(_QWORD *)(v20 + 32) = sub_1CFE6D214(&aBlock, 3, 0, &v40, 3, 1.0, 0.0);
  v25 = objc_msgSend(v19, sel_view);
  if (!v25)
    goto LABEL_25;
  v45 = (void *)v23;
  aBlock = (uint64_t)v25;
  v26 = objc_msgSend(v1, sel_view);
  if (v26)
  {
    *((_QWORD *)&v41 + 1) = v23;
    *(_QWORD *)&v40 = v26;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  *(_QWORD *)(v20 + 40) = sub_1CFE6D214(&aBlock, 5, 0, &v40, 5, 1.0, 0.0);
  v27 = objc_msgSend(v19, sel_view);
  if (!v27)
    goto LABEL_26;
  v45 = (void *)v23;
  aBlock = (uint64_t)v27;
  v28 = objc_msgSend(v1, sel_view);
  if (v28)
  {
    *((_QWORD *)&v41 + 1) = v23;
    *(_QWORD *)&v40 = v28;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  *(_QWORD *)(v20 + 48) = sub_1CFE6D214(&aBlock, 6, 0, &v40, 6, 1.0, 0.0);
  v29 = objc_msgSend(v19, sel_view);
  if (!v29)
    goto LABEL_27;
  v45 = (void *)v23;
  aBlock = (uint64_t)v29;
  v30 = objc_msgSend(v1, sel_view);
  if (v30)
  {
    *((_QWORD *)&v41 + 1) = v23;
    *(_QWORD *)&v40 = v30;
  }
  else
  {
    v40 = 0u;
    v41 = 0u;
  }
  *(_QWORD *)(v20 + 56) = sub_1CFE6D214(&aBlock, 4, 0, &v40, 4, 1.0, 0.0);
  aBlock = v20;
  sub_1CFEB3CA0();
  v31 = objc_msgSend(v19, sel_view);
  if (!v31)
    goto LABEL_28;
  v32 = v31;
  objc_msgSend(v31, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);

  v33 = objc_msgSend(v1, sel_view);
  if (!v33)
  {
LABEL_29:
    __break(1u);
    goto LABEL_30;
  }
  v34 = v33;
  v35 = objc_msgSend(v19, sel_view);
  if (v35)
  {
    v36 = v35;
    objc_msgSend(v34, sel_addSubview_, v35);

    objc_msgSend(v1, sel_addChildViewController_, v19);
    objc_msgSend(v19, sel_didMoveToParentViewController_, v1);
    v37 = (void *)objc_opt_self();
    v38 = (void *)sub_1CFEB3C94();
    swift_bridgeObjectRelease();
    objc_msgSend(v37, sel_activateConstraints_, v38);
    swift_release();
    swift_release();

    sub_1CFE64D4C(v39);
    swift_release();
    return;
  }
LABEL_30:
  __break(1u);
}

uint64_t type metadata accessor for STUIStatusBarDataOverridesViewController()
{
  return objc_opt_self();
}

uint64_t sub_1CFE6CD68()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

uint64_t sub_1CFE6CD8C(void *a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  _QWORD aBlock[6];

  v4 = sub_1CFEB3C34();
  v17 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v16 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1CFEB3C4C();
  v8 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1CFE6A4A8(0, &qword_1EFBFF440);
  v11 = (void *)sub_1CFEB3CD0();
  v12 = swift_allocObject();
  *(_QWORD *)(v12 + 16) = a2;
  *(_QWORD *)(v12 + 24) = a1;
  aBlock[4] = sub_1CFE6DC30;
  aBlock[5] = v12;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1CFE6CF80;
  aBlock[3] = &block_descriptor_16;
  v13 = _Block_copy(aBlock);
  v14 = a1;
  swift_retain();
  swift_release();
  sub_1CFEB3C40();
  aBlock[0] = MEMORY[0x1E0DEE9D8];
  sub_1CFE6DD48();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EFBFF450);
  sub_1CFE6DD90();
  sub_1CFEB3CE8();
  MEMORY[0x1D17DDB94](0, v10, v6, v13);
  _Block_release(v13);

  (*(void (**)(char *, uint64_t))(v17 + 8))(v6, v4);
  return (*(uint64_t (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

uint64_t sub_1CFE6CF78(void *a1)
{
  uint64_t v1;

  return sub_1CFE6CD8C(a1, v1);
}

uint64_t sub_1CFE6CF80(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = swift_retain();
  v1(v2);
  return swift_release();
}

void sub_1CFE6CFAC(uint64_t a1, void *a2)
{
  void (*v3)(void *);
  id v4;

  v3 = *(void (**)(void *))(a1 + 32);
  swift_retain();
  v4 = a2;
  v3(a2);
  swift_release();

}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return swift_retain();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1CFE6D018(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  void *v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;
  _QWORD aBlock[6];

  v4 = type metadata accessor for StatusBarOverrides(0);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_QWORD *)(v5 + 64);
  MEMORY[0x1E0C80A78](v4);
  swift_beginAccess();
  result = MEMORY[0x1D17DE548](a2 + 16);
  if (result)
  {
    v8 = (void *)result;
    v9 = *(void **)(result
                  + OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher);
    sub_1CFE6681C(a1, (uint64_t)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
    v10 = (*(unsigned __int8 *)(v5 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v11 = swift_allocObject();
    sub_1CFE6D908((uint64_t)&aBlock[-1] - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0), v11 + v10);
    v12 = swift_allocObject();
    *(_QWORD *)(v12 + 16) = sub_1CFE6D94C;
    *(_QWORD *)(v12 + 24) = v11;
    aBlock[4] = sub_1CFE6DBE4;
    aBlock[5] = v12;
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 1107296256;
    aBlock[2] = sub_1CFE6D1E0;
    aBlock[3] = &block_descriptor_10;
    v13 = _Block_copy(aBlock);
    v14 = v9;
    swift_retain();
    swift_release();
    objc_msgSend(v14, sel_updateDataWithBlock_, v13);

    _Block_release(v13);
    LOBYTE(v8) = swift_isEscapingClosureAtFileLocation();
    swift_release();
    result = swift_release();
    if ((v8 & 1) != 0)
      __break(1u);
  }
  return result;
}

uint64_t sub_1CFE6D1D8(uint64_t a1)
{
  uint64_t v1;

  return sub_1CFE6D018(a1, v1);
}

void sub_1CFE6D1E0(uint64_t a1, void *a2)
{
  void (*v2)(void);
  id v3;

  v2 = *(void (**)(void))(a1 + 32);
  v3 = a2;
  v2();

}

id sub_1CFE6D214(_QWORD *a1, uint64_t a2, uint64_t a3, _QWORD *a4, uint64_t a5, double a6, double a7)
{
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  id v23;
  uint64_t v25;
  uint64_t v26;

  __swift_project_boxed_opaque_existential_0(a1, a1[3]);
  v14 = sub_1CFEB3D00();
  v15 = a4[3];
  if (v15)
  {
    v16 = __swift_project_boxed_opaque_existential_0(a4, a4[3]);
    v25 = a5;
    v26 = a2;
    v17 = a3;
    v18 = *(_QWORD *)(v15 - 8);
    MEMORY[0x1E0C80A78](v16);
    v20 = (char *)&v25 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v18 + 16))(v20);
    v21 = sub_1CFEB3D00();
    v22 = *(void (**)(char *, uint64_t))(v18 + 8);
    a3 = v17;
    v22(v20, v15);
    a5 = v25;
    a2 = v26;
    __swift_destroy_boxed_opaque_existential_0((uint64_t)a4);
  }
  else
  {
    v21 = 0;
  }
  v23 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_constraintWithItem_attribute_relatedBy_toItem_attribute_multiplier_constant_, v14, a2, a3, v21, a5, a6, a7);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_0((uint64_t)a1);
  return v23;
}

id STUIStatusBarDataOverridesViewController.__deallocating_deinit()
{
  char *v0;
  objc_super v2;

  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain], sel_invalidate);
  objc_msgSend(*(id *)&v0[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher], sel_invalidate);
  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id STUIStatusBarDataOverridesViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

id STUIStatusBarDataOverridesViewController.init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  char *v3;
  uint64_t v6;
  id v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  objc_super v13;

  *(_QWORD *)&v3[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = 0;
  v6 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  v7 = objc_allocWithZone(MEMORY[0x1E0DB0A18]);
  v8 = v3;
  *(_QWORD *)&v3[v6] = objc_msgSend(v7, sel_init);
  v9 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher;
  *(_QWORD *)&v8[v9] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB0A28]), sel_init);

  if (a2)
  {
    v10 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }
  v13.receiver = v8;
  v13.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  v11 = objc_msgSendSuper2(&v13, sel_initWithNibName_bundle_, v10, a3);

  return v11;
}

id STUIStatusBarDataOverridesViewController.__allocating_init(coder:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(v1), sel_initWithCoder_, a1);

  return v3;
}

id STUIStatusBarDataOverridesViewController.init(coder:)(void *a1)
{
  char *v1;
  uint64_t v3;
  id v4;
  char *v5;
  uint64_t v6;
  id v7;
  objc_super v9;

  *(_QWORD *)&v1[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController] = 0;
  v3 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomain;
  v4 = objc_allocWithZone(MEMORY[0x1E0DB0A18]);
  v5 = v1;
  *(_QWORD *)&v1[v3] = objc_msgSend(v4, sel_init);
  v6 = OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_statusBarOverridesStatusDomainPublisher;
  *(_QWORD *)&v5[v6] = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DB0A28]), sel_init);

  v9.receiver = v5;
  v9.super_class = (Class)type metadata accessor for STUIStatusBarDataOverridesViewController();
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

_QWORD *__swift_project_boxed_opaque_existential_0(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

uint64_t __swift_destroy_boxed_opaque_existential_0(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t sub_1CFE6D814()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t, uint64_t);

  v1 = type metadata accessor for StatusBarOverrides(0);
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = v0 + ((v2 + 16) & ~v2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v4 = *(int *)(v1 + 36);
  v5 = type metadata accessor for StatusBarOverrides.TimeAndDate(0);
  v6 = v3 + v4 + *(int *)(v5 + 20);
  v7 = sub_1CFEB385C();
  v8 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 8);
  v8(v6, v7);
  v8(v3 + *(int *)(v1 + 40) + (uint64_t)*(int *)(v5 + 20), v7);
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1CFE6D908(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for StatusBarOverrides(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

void sub_1CFE6D94C(void *a1)
{
  id v2;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int64_t v8;
  int64_t v9;
  uint64_t v10;
  int64_t v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  id v17;

  type metadata accessor for StatusBarOverrides(0);
  v17 = sub_1CFE683F4();
  v2 = objc_msgSend((id)objc_opt_self(), sel_entryKeys);
  v3 = sub_1CFEB3CC4();

  v4 = 0;
  v16 = v3 + 56;
  v5 = 1 << *(_BYTE *)(v3 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & *(_QWORD *)(v3 + 56);
  v8 = (unint64_t)(v5 + 63) >> 6;
  while (1)
  {
    if (v7)
    {
      v7 &= v7 - 1;
      goto LABEL_24;
    }
    v9 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v9 >= v8)
      goto LABEL_28;
    v10 = *(_QWORD *)(v16 + 8 * v9);
    ++v4;
    if (!v10)
    {
      v4 = v9 + 1;
      if (v9 + 1 >= v8)
        goto LABEL_28;
      v10 = *(_QWORD *)(v16 + 8 * v4);
      if (!v10)
      {
        v4 = v9 + 2;
        if (v9 + 2 >= v8)
          goto LABEL_28;
        v10 = *(_QWORD *)(v16 + 8 * v4);
        if (!v10)
          break;
      }
    }
LABEL_23:
    v7 = (v10 - 1) & v10;
LABEL_24:
    swift_bridgeObjectRetain();
    v12 = (void *)sub_1CFEB3C64();
    swift_bridgeObjectRelease();
    v13 = objc_msgSend(v17, sel_entryForKey_, v12);
    v14 = objc_msgSend(a1, sel_customOverrides);
    v15 = objc_msgSend(v14, sel_entryForKey_, v12);

    if (v13)
    {
      if (v15 && objc_msgSend(v15, sel_isEqual_, v13))
        goto LABEL_6;
    }
    else if (!v15)
    {
      goto LABEL_7;
    }
    objc_msgSend(a1, sel_setEntry_forKey_, v13, v12, v16);
LABEL_6:

LABEL_7:
  }
  v11 = v9 + 3;
  if (v11 >= v8)
  {
LABEL_28:
    swift_release();

    return;
  }
  v10 = *(_QWORD *)(v16 + 8 * v11);
  if (v10)
  {
    v4 = v11;
    goto LABEL_23;
  }
  while (1)
  {
    v4 = v11 + 1;
    if (__OFADD__(v11, 1))
      break;
    if (v4 >= v8)
      goto LABEL_28;
    v10 = *(_QWORD *)(v16 + 8 * v4);
    ++v11;
    if (v10)
      goto LABEL_23;
  }
LABEL_30:
  __break(1u);
}

uint64_t sub_1CFE6DBD4()
{
  return swift_deallocObject();
}

uint64_t sub_1CFE6DBE4()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1CFE6DC04()
{
  uint64_t v0;

  swift_release();

  return swift_deallocObject();
}

void sub_1CFE6DC30()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;

  v1 = *(_QWORD *)(v0 + 16);
  v2 = *(void **)(v0 + 24);
  v3 = v1 + 16;
  swift_beginAccess();
  v4 = MEMORY[0x1D17DE548](v3);
  if (v4)
  {
    v5 = (char *)v4;
    if (v2)
    {
      v6 = objc_msgSend(v2, sel_customOverrides);
      if (v6)
      {
        v7 = v6;
        v8 = *(void **)&v5[OBJC_IVAR____TtC14SystemStatusUI40STUIStatusBarDataOverridesViewController_overridesController];
        if (v8)
        {
          v9 = v8;
          sub_1CFEB3A24();

          v10 = sub_1CFE61158();
          swift_release();
          swift_release();
          sub_1CFE64D4C(v11);
          (*(void (**)(void *))(*(_QWORD *)v10 + 144))(v7);

          swift_release();
          return;
        }

      }
    }

  }
}

unint64_t sub_1CFE6DD48()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBFF448;
  if (!qword_1EFBFF448)
  {
    v1 = sub_1CFEB3C34();
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0DEF510], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBFF448);
  }
  return result;
}

unint64_t sub_1CFE6DD90()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EFBFF458;
  if (!qword_1EFBFF458)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EFBFF450);
    result = MEMORY[0x1D17DE4C4](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EFBFF458);
  }
  return result;
}

id STUIBackgroundActivityIdentifierForStyleOverride(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id *v4;
  uint64_t v5;

  v2 = 0;
  if (a1 >= 0x200000)
  {
    if (a1 <= 0x7FFFFFFF)
    {
      if (a1 <= 0x3FFFFFF)
      {
        if (a1 < 0x800000)
        {
          if (a1 == 0x200000)
          {
            v4 = (id *)MEMORY[0x1E0DB0B70];
            goto LABEL_93;
          }
          if (a1 == 0x400000)
          {
            v4 = (id *)MEMORY[0x1E0DB0AE8];
            goto LABEL_93;
          }
          return v2;
        }
        if (a1 == 0x800000)
        {
          v4 = (id *)MEMORY[0x1E0DB0AE0];
          goto LABEL_93;
        }
        if (a1 == 0x1000000)
        {
          v4 = (id *)MEMORY[0x1E0DB0C10];
          goto LABEL_93;
        }
        if (a1 != 0x2000000)
          return v2;
        v4 = (id *)MEMORY[0x1E0DB0B40];
        goto LABEL_93;
      }
      if (a1 <= 0xFFFFFFF)
      {
        if (a1 == 0x4000000)
        {
          v4 = (id *)MEMORY[0x1E0DB0B38];
          goto LABEL_93;
        }
        if (a1 == 0x8000000)
        {
          v4 = (id *)MEMORY[0x1E0DB0B00];
          goto LABEL_93;
        }
        return v2;
      }
      if (a1 == 0x10000000)
      {
        v4 = (id *)MEMORY[0x1E0DB0C00];
        goto LABEL_93;
      }
      if (a1 == 0x20000000)
      {
        v4 = (id *)MEMORY[0x1E0DB0BA8];
        goto LABEL_93;
      }
      v5 = 0x40000000;
    }
    else
    {
      if (a1 > 0xFFFFFFFFFLL)
      {
        if (a1 > 0x7FFFFFFFFFLL)
        {
          switch(a1)
          {
            case 0x8000000000:
              v4 = (id *)MEMORY[0x1E0DB0BF8];
              goto LABEL_93;
            case 0x10000000000:
              v4 = (id *)MEMORY[0x1E0DB0BD8];
              goto LABEL_93;
            case 0x20000000000:
              v4 = (id *)MEMORY[0x1E0DB0B90];
              goto LABEL_93;
          }
          return v2;
        }
        if (a1 == 0x1000000000)
        {
          v4 = (id *)MEMORY[0x1E0DB0AC8];
          goto LABEL_93;
        }
        if (a1 == 0x2000000000)
        {
          v4 = (id *)MEMORY[0x1E0DB0B50];
          goto LABEL_93;
        }
        if (a1 != 0x4000000000)
          return v2;
        v4 = (id *)MEMORY[0x1E0DB0AF8];
        goto LABEL_93;
      }
      if (a1 > 0x1FFFFFFFFLL)
      {
        if (a1 != 0x200000000)
        {
          if (a1 == 0x400000000)
          {
            v4 = (id *)MEMORY[0x1E0DB0B98];
            goto LABEL_93;
          }
          if (a1 == 0x800000000)
          {
            v4 = (id *)MEMORY[0x1E0DB0BB0];
            goto LABEL_93;
          }
          return v2;
        }
LABEL_63:
        v4 = (id *)MEMORY[0x1E0DB0BD0];
        goto LABEL_93;
      }
      if (a1 == 0x80000000)
      {
        v4 = (id *)MEMORY[0x1E0DB0BE0];
        goto LABEL_93;
      }
      v5 = 0x100000000;
    }
    if (a1 != v5)
      return v2;
    goto LABEL_63;
  }
  if (a1 > 2047)
  {
    if (a1 >= 0x10000)
    {
      if (a1 < 0x40000)
      {
        if (a1 == 0x10000)
        {
          v4 = (id *)MEMORY[0x1E0DB0B18];
          goto LABEL_93;
        }
        if (a1 == 0x20000)
        {
          v4 = (id *)MEMORY[0x1E0DB0C18];
          goto LABEL_93;
        }
      }
      else
      {
        switch(a1)
        {
          case 0x40000:
            v4 = (id *)MEMORY[0x1E0DB0AD0];
            goto LABEL_93;
          case 0x80000:
            v4 = (id *)MEMORY[0x1E0DB0B28];
            goto LABEL_93;
          case 0x100000:
            v4 = (id *)MEMORY[0x1E0DB0BB8];
            goto LABEL_93;
        }
      }
      return v2;
    }
    if (a1 < 0x2000)
    {
      if (a1 == 2048)
      {
        v4 = (id *)MEMORY[0x1E0DB0AF0];
        goto LABEL_93;
      }
      if (a1 == 4096)
      {
        v4 = (id *)MEMORY[0x1E0DB0B10];
        goto LABEL_93;
      }
      return v2;
    }
    if (a1 == 0x2000)
    {
      v4 = (id *)MEMORY[0x1E0DB0BE8];
      goto LABEL_93;
    }
    if (a1 == 0x4000)
    {
      v4 = (id *)MEMORY[0x1E0DB0BC8];
      goto LABEL_93;
    }
    if (a1 != 0x8000)
      return v2;
    v4 = (id *)MEMORY[0x1E0DB0B30];
LABEL_93:
    v2 = *v4;
    return v2;
  }
  if (a1 <= 63)
  {
    v3 = a1 - 1;
    v4 = (id *)MEMORY[0x1E0DB0B58];
    switch(v3)
    {
      case 0:
        goto LABEL_93;
      case 1:
        v4 = (id *)MEMORY[0x1E0DB0B68];
        goto LABEL_93;
      case 2:
      case 4:
      case 5:
      case 6:
        return v2;
      case 3:
        v4 = (id *)MEMORY[0x1E0DB0BA0];
        goto LABEL_93;
      case 7:
        v4 = (id *)MEMORY[0x1E0DB0BF0];
        goto LABEL_93;
      default:
        if (MEMORY[0x1E0DB0B58] == 16)
        {
          v4 = (id *)MEMORY[0x1E0DB0B60];
        }
        else
        {
          if (MEMORY[0x1E0DB0B58] != 32)
            return v2;
          v4 = (id *)MEMORY[0x1E0DB0BC0];
        }
        break;
    }
    goto LABEL_93;
  }
  if (a1 <= 255)
  {
    if (a1 == 64 || a1 == 128)
    {
      v4 = (id *)MEMORY[0x1E0DB0B78];
      goto LABEL_93;
    }
  }
  else
  {
    switch(a1)
    {
      case 256:
        v4 = (id *)MEMORY[0x1E0DB0AD8];
        goto LABEL_93;
      case 512:
        v4 = (id *)MEMORY[0x1E0DB0C08];
        goto LABEL_93;
      case 1024:
        v4 = (id *)MEMORY[0x1E0DB0B48];
        goto LABEL_93;
    }
  }
  return v2;
}

uint64_t STUIStyleOverrideForBackgroundActivityIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B58]) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B68]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BA0]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BF0]) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B60]) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BC0]) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B78]) & 1) != 0)
  {
    v2 = 128;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AD8]) & 1) != 0)
  {
    v2 = 256;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0C08]) & 1) != 0)
  {
    v2 = 512;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B48]) & 1) != 0)
  {
    v2 = 1024;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AF0]) & 1) != 0)
  {
    v2 = 2048;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B10]) & 1) != 0)
  {
    v2 = 4096;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BE8]) & 1) != 0)
  {
    v2 = 0x2000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BC8]) & 1) != 0)
  {
    v2 = 0x4000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B30]) & 1) != 0)
  {
    v2 = 0x8000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B18]) & 1) != 0)
  {
    v2 = 0x10000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0C18]) & 1) != 0)
  {
    v2 = 0x20000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AD0]) & 1) != 0)
  {
    v2 = 0x40000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B28]) & 1) != 0)
  {
    v2 = 0x80000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BB8]) & 1) != 0)
  {
    v2 = 0x100000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B70]) & 1) != 0)
  {
    v2 = 0x200000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AE8]) & 1) != 0)
  {
    v2 = 0x400000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AE0]) & 1) != 0)
  {
    v2 = 0x800000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0C10]) & 1) != 0)
  {
    v2 = 0x1000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B40]) & 1) != 0)
  {
    v2 = 0x2000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B38]) & 1) != 0)
  {
    v2 = 0x4000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B00]) & 1) != 0)
  {
    v2 = 0x8000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0C00]) & 1) != 0)
  {
    v2 = 0x10000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BA8]) & 1) != 0)
  {
    v2 = 0x20000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BD0]) & 1) != 0)
  {
    v2 = 0x40000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BE0]) & 1) != 0)
  {
    v2 = 0x80000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B98]) & 1) != 0)
  {
    v2 = 0x400000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BB0]) & 1) != 0)
  {
    v2 = 0x800000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AC8]) & 1) != 0)
  {
    v2 = 0x1000000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B50]) & 1) != 0)
  {
    v2 = 0x2000000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0AF8]) & 1) != 0)
  {
    v2 = 0x4000000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BF8]) & 1) != 0)
  {
    v2 = 0x8000000000;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0BD8]) & 1) != 0)
  {
    v2 = 0x10000000000;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0DB0B90]))
  {
    v2 = 0x20000000000;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id STUIBackgroundActivityIdentifiersForStyleOverrides(uint64_t a1)
{
  void *v2;
  id v3;
  _QWORD *v4;
  uint8x8_t v5;
  int v6;
  unint64_t v7;
  _QWORD v9[2];
  void (*v10)(uint64_t, uint64_t);
  void *v11;
  id v12;
  char v13;

  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v10 = __STUIBackgroundActivityIdentifiersForStyleOverrides_block_invoke;
  v11 = &unk_1E8D62898;
  v3 = v2;
  v12 = v3;
  v4 = v9;
  if (a1)
  {
    v13 = 0;
    v5 = (uint8x8_t)vcnt_s8((int8x8_t)a1);
    v5.i16[0] = vaddlv_u8(v5);
    v6 = v5.i32[0];
    if (v5.i32[0])
    {
      v7 = 0;
      do
      {
        if (((1 << v7) & a1) != 0)
        {
          ((void (*)(_QWORD *))v10)(v4);
          if (v13)
            break;
          --v6;
        }
        if (v7 > 0x3E)
          break;
        ++v7;
      }
      while (v6 > 0);
    }
  }

  return v3;
}

BOOL STUIBackgroundActivityIdentiferRepresentsStyleOverride(void *a1)
{
  return STUIStyleOverrideForBackgroundActivityIdentifier(a1) != 0;
}

void _UIDebugShowLayoutItem(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "_ui_view");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v3;
  if ((id)v5 == v3
    || (v7 = (void *)v5,
        objc_getAssociatedObject(v3, &_UIDebugView),
        v6 = (id)objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    if (v4)
    {
LABEL_4:
      objc_msgSend(v4, "alphaComponent");
      objc_msgSend(v4, "colorWithAlphaComponent:", v8 * 0.25);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setBackgroundColor:", v9);

      objc_msgSend(v6, "_currentScreenScale");
      v11 = 1.0 / v10;
      objc_msgSend(v6, "layer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setBorderWidth:", v11);

      v13 = objc_msgSend(objc_retainAutorelease(v4), "CGColor");
      objc_msgSend(v6, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setBorderColor:", v13);

      goto LABEL_9;
    }
  }
  else
  {
    v6 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v6, "setUserInteractionEnabled:", 0);
    objc_setAssociatedObject(v3, &_UIDebugView, v6, 0);
    objc_msgSend(v6, "topAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "topAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "constraintEqualToAnchor:", v28);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v27;
    objc_msgSend(v6, "leftAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leftAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:", v25);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v24;
    objc_msgSend(v6, "rightAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "rightAnchor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "constraintEqualToAnchor:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v17;
    objc_msgSend(v6, "bottomAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bottomAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "_ui_superview");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "addSubview:", v6);

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v21);
    if (v4)
      goto LABEL_4;
  }
  if (v6 == v3)
  {
    objc_msgSend(v3, "setBackgroundColor:", 0);
    objc_msgSend(v3, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setBorderColor:", 0);

  }
  else
  {
    objc_msgSend(v6, "removeFromSuperview");
    objc_setAssociatedObject(v3, &_UIDebugView, 0, 0);
  }
LABEL_9:

}

id __UIKitUserDefaults()
{
  if (qword_1EDBEE040 != -1)
    dispatch_once(&qword_1EDBEE040, &__block_literal_global_0);
  return (id)qword_1EDBEE038;
}

id _reorderedPlacementsFromGroupForLegacyLayout(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  char v11;

  v5 = a3;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = ___reorderedPlacementsFromGroupForLegacyLayout_block_invoke;
  v9[3] = &unk_1E8D62B48;
  v10 = v5;
  v11 = a2;
  v6 = v5;
  objc_msgSend(a1, "sortedArrayUsingComparator:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void sub_1CFE78E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE79718(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,char a55)
{
  uint64_t v55;

  _Block_object_dispose(&a47, 8);
  _Block_object_dispose(&a55, 8);
  _Block_object_dispose((const void *)(v55 - 240), 8);
  _Block_object_dispose((const void *)(v55 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t ___reorderedPlacementsFromGroupForLegacyLayout_block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v13;
  uint64_t v14;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  objc_msgSend(a2, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "indexOfObject:", v7);

  v9 = *(void **)(a1 + 32);
  objc_msgSend(v6, "identifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v9, "indexOfObject:", v10);
  if (v8 == 0x7FFFFFFFFFFFFFFFLL && v11 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v13 = 1;
  if (*(_BYTE *)(a1 + 40))
    v13 = -1;
  v14 = -1;
  if (*(_BYTE *)(a1 + 40))
    v14 = 1;
  if (v8 < v11)
    return v14;
  else
    return v13;
}

void sub_1CFE7FBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

const __CFString *STUIStatusBarDisplayItemEnabilityStatusDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E8D62F40[a1];
}

const __CFString *STUIStatusBarDisplayItemVisibilityStatusDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E8D62F60[a1];
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1CFE82854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,uint64_t a62,uint64_t a63)
{
  char a66;
  char a72;

  _Block_object_dispose(&a66, 8);
  _Block_object_dispose(&a72, 8);
  _Block_object_dispose(&STACK[0x218], 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1CFE83740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void sub_1CFE85180(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2050000000;
  v17 = 0;
  v18[0] = objc_opt_class();
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __STUIStatusBarGetNativeVisualProviderClassForScreenWithVisualProviderInfo_block_invoke;
  v10[3] = &unk_1E8D63598;
  v13 = &v14;
  v6 = v3;
  v11 = v6;
  v7 = v4;
  v12 = v7;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = (id)v15[3];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void sub_1CFE8726C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id STUIStatusBarGetVisualProviderSubclassForScreenWithVisualProviderInfo(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  Class Superclass;
  objc_class *v8;
  objc_method *ClassMethod;
  id v10;
  void *v11;

  v5 = a2;
  v6 = a3;
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (Superclass = class_getSuperclass((Class)a1)) != 0
    && (v8 = Superclass,
        ClassMethod = class_getClassMethod((Class)a1, sel_visualProviderSubclassForScreen_visualProviderInfo_),
        ClassMethod == class_getClassMethod(v8, sel_visualProviderSubclassForScreen_visualProviderInfo_)))
  {
    v10 = a1;
  }
  else
  {
    objc_msgSend(a1, "visualProviderSubclassForScreen:visualProviderInfo:", v5, v6);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;

  return v11;
}

id STUIStatusBarDefaultAnimation(void *a1, void *a2, __int128 *a3, double a4, double a5, double a6)
{
  id v11;
  id v12;
  __int128 v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  _QWORD v19[5];
  _QWORD v20[5];
  _QWORD v21[6];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  double v25;
  double v26;
  double v27;
  _QWORD v28[4];
  __int128 v29;
  __int128 v30;
  _QWORD v31[5];
  id v32;

  v11 = a1;
  v12 = a2;
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x3032000000;
  v31[3] = __Block_byref_object_copy__3;
  v31[4] = __Block_byref_object_dispose__3;
  v32 = 0;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x4010000000;
  v28[3] = "";
  v13 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v29 = *MEMORY[0x1E0C9D648];
  v30 = v13;
  v14 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __STUIStatusBarDefaultAnimation_block_invoke;
  v21[3] = &unk_1E8D63610;
  v21[4] = v31;
  v21[5] = v28;
  v15 = *a3;
  v16 = a3[1];
  v24 = a3[2];
  v23 = v16;
  v22 = v15;
  v25 = a4;
  v26 = a5;
  v27 = a6;
  +[STUIStatusBarAnimation animationWithBlock:](STUIStatusBarAnimation, "animationWithBlock:", v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v14;
  v20[1] = 3221225472;
  v20[2] = __STUIStatusBarDefaultAnimation_block_invoke_3;
  v20[3] = &unk_1E8D631A8;
  v20[4] = v28;
  objc_msgSend(v17, "setPrepareBlock:", v20);
  v19[0] = v14;
  v19[1] = 3221225472;
  v19[2] = __STUIStatusBarDefaultAnimation_block_invoke_4;
  v19[3] = &unk_1E8D63390;
  v19[4] = v31;
  STUIStatusBarAddDefaultAnimationReposition(v11, v17, v12, v19);
  objc_msgSend(v17, "setDelaysAnimatingItems:", 1);
  objc_msgSend(v17, "setPriority:", -100);
  _Block_object_dispose(v28, 8);
  _Block_object_dispose(v31, 8);

  return v17;
}

void sub_1CFE87560(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

id STUIStatusBarDefaultScaleAnimation(void *a1, void *a2, CGFloat a3)
{
  id v5;
  id v6;
  void *v7;
  CGAffineTransform v9;

  v5 = a2;
  v6 = a1;
  CGAffineTransformMakeScale(&v9, a3, a3);
  STUIStatusBarDefaultAnimation(v6, v5, (__int128 *)&v9, 0.15, 0.1, 0.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id STUIStatusBarBSSettingsRepositionAnimation(void *a1, void *a2, char a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  char v19;

  v9 = a2;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __STUIStatusBarBSSettingsRepositionAnimation_block_invoke;
  v17[3] = &unk_1E8D636F8;
  v18 = v9;
  v19 = a3;
  v10 = v9;
  v11 = a5;
  v12 = a4;
  v13 = a1;
  v14 = _Block_copy(v17);
  STUIStatusBarInternalRepositionAnimation(v13, a3, v14, v12, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

id _STUIStatusBar_BackgroundActivity_Log()
{
  if (_STUIStatusBar_BackgroundActivity_Log_onceToken != -1)
    dispatch_once(&_STUIStatusBar_BackgroundActivity_Log_onceToken, &__block_literal_global_3);
  return (id)_STUIStatusBar_BackgroundActivity_Log___StatusBarBackground_LOG;
}

id UIStatusBarCreateHUDDualSignalView(void *a1, void *a2, double a3, double a4, CGFloat a5)
{
  id v9;
  id v10;
  double v11;
  double v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  CGSize v32;

  v9 = a2;
  v10 = a1;
  objc_msgSend(v10, "size");
  v12 = v11;
  objc_msgSend(v9, "size");
  if (v12 >= v13)
    v13 = v12;
  v14 = v13 * 3.0;
  objc_msgSend(v10, "size");
  v16 = v15;
  objc_msgSend(v9, "size");
  v32.height = (v16 + v17 + 3.0) * 3.0;
  v32.width = v14;
  UIGraphicsBeginImageContextWithOptions(v32, 0, a5);
  objc_msgSend(v10, "size");
  v19 = (v14 - v18 * 3.0) * 0.5;
  objc_msgSend(v10, "size");
  v21 = v20 * 3.0;
  objc_msgSend(v10, "size");
  objc_msgSend(v10, "drawInRect:blendMode:alpha:", 0, v19, 0.0, v21, v22 * 3.0, a3);
  objc_msgSend(v9, "size");
  v24 = (v14 - v23 * 3.0) * 0.5;
  objc_msgSend(v10, "size");
  v26 = v25;

  objc_msgSend(v9, "size");
  v28 = v27 * 3.0;
  objc_msgSend(v9, "size");
  objc_msgSend(v9, "drawInRect:blendMode:alpha:", 0, v24, (v26 + 3.0) * 3.0, v28, v29 * 3.0, a4);

  UIGraphicsGetImageFromCurrentImageContext();
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v30;
}

id DashBoardFrameworkBundle()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 8uLL, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectAtIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)GSSystemRootDirectory(), "stringByAppendingPathComponent:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks/DashBoard.framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id STUILegacyDataFromData(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = objc_alloc_init(MEMORY[0x1E0DC4388]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v1, "existingEntryKeys", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * i);
        objc_msgSend(v1, "valueForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        STUILegacyDataEntryFromDataEntry(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setValue:forKey:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

id STUILegacyDataEntryFromDataEntry(void *a1)
{
  id v1;
  id v2;
  id v3;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  void *v16;

  v1 = a1;
  if (v1)
  {
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v2 = objc_alloc_init(MEMORY[0x1E0DC43C8]);
LABEL_7:
      v3 = v2;
LABEL_8:
      objc_msgSend(v3, "setEnabled:", objc_msgSend(v1, "isEnabled"));
      goto LABEL_9;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      objc_msgSend(MEMORY[0x1E0DC43B0], "entryWithBoolValue:", objc_msgSend(v1, "BOOLValue"));
      v2 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v5 = (void *)MEMORY[0x1E0DC43F8];
      objc_msgSend(v1, "stringValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "entryWithStringValue:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
LABEL_18:
      v3 = (id)v7;
LABEL_19:

      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC43D8]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v8 = (void *)MEMORY[0x1E0DC43D0];
      objc_msgSend(v1, "imageName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "entryWithImageNamed:", v6);
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v9 = (void *)MEMORY[0x1E0DC43B8];
      objc_msgSend(v1, "imageName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "entryWithImageNamed:BOOLValue:", v6, objc_msgSend(v1, "BOOLValue"));
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_18;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v10 = (void *)MEMORY[0x1E0DC43F0];
      objc_msgSend(v1, "focusName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v1, "imageName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "entryWithFocusName:imageNamed:BOOLValue:", v6, v11, objc_msgSend(v1, "BOOLValue"));
      v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_22:

      goto LABEL_19;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC43C0]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      objc_msgSend(v3, "setStatus:", objc_msgSend(v1, "status"));
      objc_msgSend(v3, "setLowDataModeActive:", objc_msgSend(v1, "lowDataModeActive"));
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      objc_msgSend(v1, "string");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setString:", v12);

      objc_msgSend(v1, "crossfadeString");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setCrossfadeString:", v13);

      objc_msgSend(v1, "badgeString");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBadgeString:", v14);

      objc_msgSend(v3, "setWifiCallingEnabled:", objc_msgSend(v1, "wifiCallingEnabled"));
      objc_msgSend(v3, "setCallForwardingEnabled:", objc_msgSend(v1, "callForwardingEnabled"));
      objc_msgSend(v3, "setShowsSOSWhenDisabled:", objc_msgSend(v1, "showsSOSWhenDisabled"));
      objc_msgSend(v3, "setSosAvailable:", objc_msgSend(v1, "sosAvailable"));
      objc_msgSend(v3, "setIsBootstrapCellular:", objc_msgSend(v1, "isBootstrapCellular"));
      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC4418]);
      objc_msgSend(v3, "setRawValue:", objc_msgSend(v1, "rawValue"));
      objc_msgSend(v3, "setDisplayValue:", objc_msgSend(v1, "displayValue"));
      objc_msgSend(v3, "setDisplayRawValue:", objc_msgSend(v1, "displayRawValue"));
      objc_msgSend(v3, "setStatus:", objc_msgSend(v1, "status"));
      objc_msgSend(v3, "setLowDataModeActive:", objc_msgSend(v1, "lowDataModeActive"));
LABEL_27:
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC43A0]);
      objc_msgSend(v3, "setCapacity:", objc_msgSend(v1, "capacity"));
      objc_msgSend(v3, "setState:", objc_msgSend(v1, "state"));
      objc_msgSend(v3, "setSaverModeActive:", objc_msgSend(v1, "saverModeActive"));
      objc_msgSend(v3, "setProminentlyShowsDetailString:", objc_msgSend(v1, "prominentlyShowsDetailString"));
LABEL_30:
      objc_msgSend(v1, "detailString");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDetailString:", v6);
      goto LABEL_19;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC43A8]);
      objc_msgSend(v3, "setState:", objc_msgSend(v1, "state"));
      objc_msgSend(v1, "batteryEntry");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      STUILegacyDataEntryFromDataEntry();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setBatteryEntry:", v11);
      goto LABEL_22;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC4408]);
      objc_msgSend(v3, "setColor:", objc_msgSend(v1, "color"));
      objc_msgSend(v3, "setSunlightMode:", objc_msgSend(v1, "sunlightMode"));
      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC4390]);
      objc_msgSend(v3, "setType:", objc_msgSend(v1, "type"));
      objc_msgSend(v1, "displayId");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setDisplayId:", v6);
      goto LABEL_19;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v3 = objc_alloc_init(MEMORY[0x1E0DC4400]);
      objc_msgSend(v3, "setConnectionCount:", objc_msgSend(v1, "connectionCount"));
      goto LABEL_8;
    }
    if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
    {
      v15 = (objc_class *)MEMORY[0x1E0DC43E0];
    }
    else
    {
      if (!objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
      {
        if (objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
        {
          v3 = objc_alloc_init(MEMORY[0x1E0DC43E8]);
          objc_msgSend(v3, "setUnlockFailureCount:", objc_msgSend(v1, "unlockFailureCount"));
          goto LABEL_8;
        }
        if (!objc_msgSend(v1, "isMemberOfClass:", objc_opt_class()))
        {
          v3 = 0;
          goto LABEL_8;
        }
        v3 = objc_alloc_init(MEMORY[0x1E0DC4398]);
        objc_msgSend(v1, "backgroundActivityIdentifier");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setType:", STUILegacyBackgroundActivityTypeFromBackgroundActivityIdentifier(v16));

        objc_msgSend(v1, "displayStartDate");
        objc_msgSend(v3, "setDisplayStartDate:");
        goto LABEL_30;
      }
      v15 = (objc_class *)MEMORY[0x1E0DC4410];
    }
    v3 = objc_alloc_init(v15);
    goto LABEL_27;
  }
  v3 = 0;
LABEL_9:

  return v3;
}

uint64_t STUILegacyBackgroundActivityTypeFromBackgroundActivityIdentifier(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend((id)*MEMORY[0x1E0DB0BA8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BB0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B00], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0C00], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AF8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BF8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 5;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B58], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 6;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B60], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 7;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AC8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B50], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 9;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0C18], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 10;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0C10], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 11;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B40], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 12;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B38], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 13;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B78], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 14;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AF0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 15;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B90], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BA0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 17;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B48], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 18;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BD0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 19;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BE0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 20;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BD8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 21;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B98], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 22;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0C08], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 23;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BC0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 24;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BC8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 25;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BB8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 26;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AE8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 27;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AE0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 28;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BE8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 29;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B30], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 30;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B70], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 31;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B10], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AD8], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 33;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0BF0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 34;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0AD0], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 35;
  }
  else if ((objc_msgSend((id)*MEMORY[0x1E0DB0B18], "isEqualToString:", v1) & 1) != 0)
  {
    v2 = 36;
  }
  else if (objc_msgSend((id)*MEMORY[0x1E0DB0B28], "isEqualToString:", v1))
  {
    v2 = 37;
  }
  else
  {
    v2 = 30;
  }

  return v2;
}

void sub_1CFE92938(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE92C28(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *_STUIStatusBarCycleAnimationStateDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E8D63B38[a1];
}

void sub_1CFE96868(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,char a49)
{
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a49, 8);
  _Unwind_Resume(a1);
}

void sub_1CFE98754(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE988B8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1CFE98FD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE9BA14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

const __CFString *_STUIStatusBarAnimationTypeDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E8D63E90[a1];
}

id STUIStatusBarRunningAnimations()
{
  return (id)_statusBarRunningAnimations;
}

void sub_1CFE9D600(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFE9E01C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

id STUIStatusBarDelayedDataEntryKeys()
{
  return (id)_statusBarDelayedDataEntryKeys;
}

void sub_1CFE9F590(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double centerOfRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  double MinX;
  double v9;
  CGRect v11;
  CGRect v12;
  CGRect v13;

  MinX = CGRectGetMinX(*(CGRect *)&a1);
  v11.origin.x = a1;
  v11.origin.y = a2;
  v11.size.width = a3;
  v11.size.height = a4;
  v9 = MinX + CGRectGetWidth(v11) * 0.5;
  v12.origin.x = a1;
  v12.origin.y = a2;
  v12.size.width = a3;
  v12.size.height = a4;
  CGRectGetMinY(v12);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  CGRectGetHeight(v13);
  return v9;
}

void sub_1CFEA1CD8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFEA26CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1CFEA301C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a54, 8);
  _Unwind_Resume(a1);
}

void sub_1CFEA34B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1CFEA3AA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1CFEA4EF0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 248));
  _Unwind_Resume(a1);
}

void sub_1CFEA547C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

const __CFString *STUIStatusBarFontStyleDescription(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown)");
  else
    return off_1E8D643D8[a1];
}

const __CFString *STUIStatusBarModeDescription(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown)");
  else
    return off_1E8D648B0[a1];
}

const __CFString *_UIStatusBarResolvedStyleDescription(uint64_t a1)
{
  const __CFString *result;

  result = CFSTR("default");
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = CFSTR("lightContent");
      break;
    case 2:
      result = CFSTR("darkContent");
      break;
    case 3:
      goto LABEL_6;
    case 4:
      result = CFSTR("inherited");
      break;
    default:
      if (a1 == 64)
      {
        result = CFSTR("automaticLightBias");
      }
      else if (a1 == 128)
      {
        result = CFSTR("automaticDarkBias");
      }
      else
      {
LABEL_6:
        result = CFSTR("(unknown)");
      }
      break;
  }
  return result;
}

__CFString *sensorActivityScreenIdentifier(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;

  v1 = a1;
  v2 = v1;
  if (!v1 || (objc_msgSend(v1, "_isEmbeddedScreen") & 1) != 0 || (objc_msgSend(v2, "_isCarScreen") & 1) != 0)
  {
    v3 = &stru_1E8D64C18;
  }
  else
  {
    objc_msgSend(v2, "_displayID");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
}

void *STUIStatusBarActionGestureDefaultAllowedTouchTypes()
{
  return &unk_1E8D803A8;
}

uint64_t _UIBackgroundLuminanceLevelForStyle(uint64_t a1)
{
  if (a1 >> 6 == 2)
    return 1;
  else
    return 2 * (a1 >> 6 == 1);
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1CFEAE24C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void *STUIStatusBarActionGestureTouchTypesIncludingIndirectPointer()
{
  return &unk_1E8D803C0;
}

id STUIStatusBarGetLowestPrioritizedItem(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v14;
    v6 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v14 != v5)
          objc_enumerationMutation(v1);
        v8 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(v8, "priority");
        if (v9 < v6)
        {
          v10 = v9;
          v11 = v8;

          v4 = v11;
          v6 = v10;
        }
      }
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v3);
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void ___privateFrameworksHaveModifications_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  BSPathForSystemDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("Frameworks"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fileURLWithPath:isDirectory:", v2, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("PrivateFrameworks"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:isDirectory:", v5, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v7 = objc_msgSend(&unk_1E8D803D8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v20 != v9)
        objc_enumerationMutation(&unk_1E8D803D8);
      byte_1EDBEDFC9 = checkFramework(v3, *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v10));
      if ((byte_1EDBEDFC9 & 1) != 0)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(&unk_1E8D803D8, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
        if (v8)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    if (!byte_1EDBEDFC9)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v11 = objc_msgSend(&unk_1E8D803F0, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
LABEL_13:
        v14 = 0;
        while (1)
        {
          if (*(_QWORD *)v16 != v13)
            objc_enumerationMutation(&unk_1E8D803F0);
          byte_1EDBEDFC9 = checkFramework(v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v14));
          if ((byte_1EDBEDFC9 & 1) != 0)
            break;
          if (v12 == ++v14)
          {
            v12 = objc_msgSend(&unk_1E8D803F0, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
            if (v12)
              goto LABEL_13;
            break;
          }
        }
      }
    }
  }

}

BOOL checkFramework(void *a1, uint64_t a2)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;
  _BOOL8 v13;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "URLByAppendingPathComponent:", a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathExtension:", CFSTR("framework"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0C998D0];
  v15[0] = *MEMORY[0x1E0C998E8];
  v4 = v15[0];
  v15[1] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "resourceValuesForKeys:error:", v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8)
    v11 = v9 == 0;
  else
    v11 = 1;
  if (v11)
  {
    v13 = 0;
  }
  else
  {
    objc_msgSend(v9, "timeIntervalSinceDate:", v8);
    v13 = v12 > 60.0;
  }

  return v13;
}

void sub_1CFEB1E7C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

__CFString *_STUIStringFromUILegibilityStyle(unint64_t a1)
{
  if (a1 < 3)
    return *(&off_1E8D64A20 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown _UILegibilityStyle #%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *_STUIStringFromStatusBarLegacyStyle(unint64_t a1)
{
  if (a1 < 4)
    return *(&off_1E8D64A38 + a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown UIStatusBarStyle #%ld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t sub_1CFEB37A8()
{
  return MEMORY[0x1E0CADE58]();
}

uint64_t sub_1CFEB37B4()
{
  return MEMORY[0x1E0CAE410]();
}

uint64_t sub_1CFEB37C0()
{
  return MEMORY[0x1E0CAE418]();
}

uint64_t sub_1CFEB37CC()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_1CFEB37D8()
{
  return MEMORY[0x1E0CAE9D0]();
}

uint64_t sub_1CFEB37E4()
{
  return MEMORY[0x1E0CAEA00]();
}

uint64_t sub_1CFEB37F0()
{
  return MEMORY[0x1E0CAEA18]();
}

uint64_t sub_1CFEB37FC()
{
  return MEMORY[0x1E0CAEA28]();
}

uint64_t sub_1CFEB3808()
{
  return MEMORY[0x1E0CAEA40]();
}

uint64_t sub_1CFEB3814()
{
  return MEMORY[0x1E0CAEA80]();
}

uint64_t sub_1CFEB3820()
{
  return MEMORY[0x1E0CAEAB0]();
}

uint64_t sub_1CFEB382C()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_1CFEB3838()
{
  return MEMORY[0x1E0CB07C8]();
}

uint64_t sub_1CFEB3844()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1CFEB3850()
{
  return MEMORY[0x1E0CB0860]();
}

uint64_t sub_1CFEB385C()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1CFEB3868()
{
  return MEMORY[0x1E0CB0BE0]();
}

uint64_t sub_1CFEB3874()
{
  return MEMORY[0x1E0CB0C30]();
}

uint64_t sub_1CFEB3880()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1CFEB388C()
{
  return MEMORY[0x1E0CB0F00]();
}

uint64_t sub_1CFEB3898()
{
  return MEMORY[0x1E0CB0F20]();
}

uint64_t sub_1CFEB38A4()
{
  return MEMORY[0x1E0CB1060]();
}

uint64_t sub_1CFEB38B0()
{
  return MEMORY[0x1E0CB11F0]();
}

uint64_t sub_1CFEB38BC()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1CFEB38C8()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1CFEB38D4()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1CFEB38E0()
{
  return MEMORY[0x1E0DEFD68]();
}

uint64_t sub_1CFEB38EC()
{
  return MEMORY[0x1E0DEFD70]();
}

uint64_t sub_1CFEB38F8()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1CFEB3904()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1CFEB3910()
{
  return MEMORY[0x1E0CD8350]();
}

uint64_t sub_1CFEB391C()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1CFEB3928()
{
  return MEMORY[0x1E0CD8DE8]();
}

uint64_t sub_1CFEB3934()
{
  return MEMORY[0x1E0CD9668]();
}

uint64_t sub_1CFEB3940()
{
  return MEMORY[0x1E0CD9678]();
}

uint64_t sub_1CFEB394C()
{
  return MEMORY[0x1E0CD96D8]();
}

uint64_t sub_1CFEB3958()
{
  return MEMORY[0x1E0CD9C78]();
}

uint64_t sub_1CFEB3964()
{
  return MEMORY[0x1E0CD9C80]();
}

uint64_t sub_1CFEB3970()
{
  return MEMORY[0x1E0CD9C88]();
}

uint64_t sub_1CFEB397C()
{
  return MEMORY[0x1E0CDA8F8]();
}

uint64_t sub_1CFEB3988()
{
  return MEMORY[0x1E0CDA908]();
}

uint64_t sub_1CFEB3994()
{
  return MEMORY[0x1E0CDA9F0]();
}

uint64_t sub_1CFEB39A0()
{
  return MEMORY[0x1E0CDA9F8]();
}

uint64_t sub_1CFEB39AC()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1CFEB39B8()
{
  return MEMORY[0x1E0CDAF90]();
}

uint64_t sub_1CFEB39C4()
{
  return MEMORY[0x1E0CDAFC8]();
}

uint64_t sub_1CFEB39D0()
{
  return MEMORY[0x1E0CDAFD0]();
}

uint64_t sub_1CFEB39DC()
{
  return MEMORY[0x1E0CDAFE0]();
}

uint64_t sub_1CFEB39E8()
{
  return MEMORY[0x1E0CDAFF8]();
}

uint64_t sub_1CFEB39F4()
{
  return MEMORY[0x1E0CDB000]();
}

uint64_t sub_1CFEB3A00()
{
  return MEMORY[0x1E0CDB400]();
}

uint64_t sub_1CFEB3A0C()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1CFEB3A18()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1CFEB3A24()
{
  return MEMORY[0x1E0CDB618]();
}

uint64_t sub_1CFEB3A30()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1CFEB3A3C()
{
  return MEMORY[0x1E0CDB938]();
}

uint64_t sub_1CFEB3A48()
{
  return MEMORY[0x1E0CDB948]();
}

uint64_t sub_1CFEB3A54()
{
  return MEMORY[0x1E0CDB958]();
}

uint64_t sub_1CFEB3A60()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1CFEB3A6C()
{
  return MEMORY[0x1E0CDD3A0]();
}

uint64_t sub_1CFEB3A78()
{
  return MEMORY[0x1E0CDD878]();
}

uint64_t sub_1CFEB3A84()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1CFEB3A90()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1CFEB3A9C()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1CFEB3AA8()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1CFEB3AB4()
{
  return MEMORY[0x1E0CDE358]();
}

uint64_t sub_1CFEB3AC0()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1CFEB3ACC()
{
  return MEMORY[0x1E0CDF138]();
}

uint64_t sub_1CFEB3AD8()
{
  return MEMORY[0x1E0CDF438]();
}

uint64_t sub_1CFEB3AE4()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_1CFEB3AF0()
{
  return MEMORY[0x1E0CDF450]();
}

uint64_t sub_1CFEB3AFC()
{
  return MEMORY[0x1E0CDF458]();
}

uint64_t sub_1CFEB3B08()
{
  return MEMORY[0x1E0CDF488]();
}

uint64_t sub_1CFEB3B14()
{
  return MEMORY[0x1E0CDF4A0]();
}

uint64_t sub_1CFEB3B20()
{
  return MEMORY[0x1E0CDF4B8]();
}

uint64_t sub_1CFEB3B2C()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_1CFEB3B38()
{
  return MEMORY[0x1E0CDF4E8]();
}

uint64_t sub_1CFEB3B44()
{
  return MEMORY[0x1E0CDF508]();
}

uint64_t sub_1CFEB3B50()
{
  return MEMORY[0x1E0CDF748]();
}

uint64_t sub_1CFEB3B5C()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1CFEB3B68()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1CFEB3B74()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1CFEB3B80()
{
  return MEMORY[0x1E0CDFA20]();
}

uint64_t sub_1CFEB3B8C()
{
  return MEMORY[0x1E0CDFB78]();
}

uint64_t sub_1CFEB3B98()
{
  return MEMORY[0x1E0CDFB80]();
}

uint64_t sub_1CFEB3BA4()
{
  return MEMORY[0x1E0CDFBC0]();
}

uint64_t sub_1CFEB3BB0()
{
  return MEMORY[0x1E0CDFC48]();
}

uint64_t sub_1CFEB3BBC()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1CFEB3BC8()
{
  return MEMORY[0x1E0CDFD58]();
}

uint64_t sub_1CFEB3BD4()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1CFEB3BE0()
{
  return MEMORY[0x1E0CDFD80]();
}

uint64_t sub_1CFEB3BEC()
{
  return MEMORY[0x1E0CDFE48]();
}

uint64_t sub_1CFEB3BF8()
{
  return MEMORY[0x1E0CDFE58]();
}

uint64_t sub_1CFEB3C04()
{
  return MEMORY[0x1E0CDFEB8]();
}

uint64_t sub_1CFEB3C10()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1CFEB3C1C()
{
  return MEMORY[0x1E0CE0238]();
}

uint64_t sub_1CFEB3C28()
{
  return MEMORY[0x1E0CE05E0]();
}

uint64_t sub_1CFEB3C34()
{
  return MEMORY[0x1E0DEF4F8]();
}

uint64_t sub_1CFEB3C40()
{
  return MEMORY[0x1E0DEF578]();
}

uint64_t sub_1CFEB3C4C()
{
  return MEMORY[0x1E0DEF5B0]();
}

uint64_t sub_1CFEB3C58()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1CFEB3C64()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1CFEB3C70()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1CFEB3C7C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1CFEB3C88()
{
  return MEMORY[0x1E0DEAA08]();
}

uint64_t sub_1CFEB3C94()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1CFEB3CA0()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1CFEB3CAC()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1CFEB3CB8()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1CFEB3CC4()
{
  return MEMORY[0x1E0CB1BD8]();
}

uint64_t sub_1CFEB3CD0()
{
  return MEMORY[0x1E0DEF8E8]();
}

uint64_t sub_1CFEB3CDC()
{
  return MEMORY[0x1E0DEF900]();
}

uint64_t sub_1CFEB3CE8()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1CFEB3CF4()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1CFEB3D00()
{
  return MEMORY[0x1E0DED5F0]();
}

uint64_t sub_1CFEB3D0C()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1CFEB3D18()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1CFEB3D24()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1CFEB3D30()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatGreaterThanFloat()
{
  return MEMORY[0x1E0D012E0]();
}

uint64_t BSInterfaceOrientationDescription()
{
  return MEMORY[0x1E0D01340]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPathForSystemDirectory()
{
  return MEMORY[0x1E0D01478]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x1E0CD23D0](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2648](retstr, tx, ty, tz);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
}

BOOL CGAffineTransformEqualToTransform(CGAffineTransform *t1, CGAffineTransform *t2)
{
  return MEMORY[0x1E0C9BAA0](t1, t2);
}

CGAffineTransform *__cdecl CGAffineTransformInvert(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAB0](retstr, t);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformMakeTranslation(CGAffineTransform *__return_ptr retstr, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAE0](retstr, tx, ty);
}

CGAffineTransform *__cdecl CGAffineTransformScale(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAF8](retstr, t, sx, sy);
}

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x1E0C9C480](c, width);
}

void CGPathAddArc(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, BOOL clockwise)
{
  MEMORY[0x1E0C9D280](path, m, clockwise, x, y, radius, startAngle, endAngle);
}

void CGPathAddLineToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D2A8](path, m, x, y);
}

void CGPathAddPath(CGMutablePathRef path1, const CGAffineTransform *m, CGPathRef path2)
{
  MEMORY[0x1E0C9D2B8](path1, m, path2);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

void CGPathMoveToPoint(CGMutablePathRef path, const CGAffineTransform *m, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9D490](path, m, x, y);
}

void CGPathRelease(CGPathRef path)
{
  MEMORY[0x1E0C9D498](path);
}

CGRect CGRectApplyAffineTransform(CGRect rect, CGAffineTransform *t)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D548](t, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectContainsPoint(CGRect rect, CGPoint point)
{
  return MEMORY[0x1E0C9D550]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, (__n128)point, *(__n128 *)&point.y);
}

BOOL CGRectContainsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D558]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D570]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x1E0C9D618]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0C9D640]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

uint64_t CTFontCreateCopyOfSystemUIFontWithGrade()
{
  return MEMORY[0x1E0CA7A28]();
}

uint64_t CTFontGetUIFontDesign()
{
  return MEMORY[0x1E0CA7C88]();
}

uint64_t GSSystemRootDirectory()
{
  return MEMORY[0x1E0D27C80]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t STSystemStatusLogBundleLoading()
{
  return MEMORY[0x1E0DB0EB8]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0DC4880]();
}

uint64_t UIEdgeInsetsAdd()
{
  return MEMORY[0x1E0DC49A0]();
}

void UIGraphicsBeginImageContext(CGSize size)
{
  MEMORY[0x1E0DC4BB8]((__n128)size, *(__n128 *)&size.height);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0DC4BC0](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x1E0DC4BD8]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0DC4BE8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0DC4BF0]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0DC52B8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0DC52E8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x1E0C80928](aBlock);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x1E0C80958](aBlock);
}

uint64_t _StatusBar_UIBlockBasedCAAction()
{
  return MEMORY[0x1E0DC56A0]();
}

uint64_t _StatusBar_UIGetAnimationCurveSpline()
{
  return MEMORY[0x1E0DC56A8]();
}

uint64_t _StatusBar_UIGetDurationOfSpringAnimation()
{
  return MEMORY[0x1E0DC56B0]();
}

uint64_t _StatusBar_UITimeSizeForLabel()
{
  return MEMORY[0x1E0DC56B8]();
}

uint64_t _UIStatusBarHostedInSpringBoard()
{
  return MEMORY[0x1E0DC59E8]();
}

uint64_t _UIStatusBarResolvedStyleFromStyle()
{
  return MEMORY[0x1E0DC5A18]();
}

uint64_t _UIStatusBarStyleFromLegibilityStyle()
{
  return MEMORY[0x1E0DC5A20]();
}

uint64_t _UIStatusBarStyleFromResolvedStyle()
{
  return MEMORY[0x1E0DC5A28]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x1E0C80BC8](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

long double acos(long double __x)
{
  long double result;

  MEMORY[0x1E0C81500](__x);
  return result;
}

long double atan(long double __x)
{
  long double result;

  MEMORY[0x1E0C81618](__x);
  return result;
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x1E0DE7BB0](a1);
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

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D20](a1, a2);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
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

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x1E0C855C0](__s1, __n);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_beginAccess()
{
  return MEMORY[0x1E0DEEAF8]();
}

uint64_t swift_bridgeObjectRelease()
{
  return MEMORY[0x1E0DEEB08]();
}

uint64_t swift_bridgeObjectRelease_n()
{
  return MEMORY[0x1E0DEEB10]();
}

uint64_t swift_bridgeObjectRetain()
{
  return MEMORY[0x1E0DEEB18]();
}

uint64_t swift_bridgeObjectRetain_n()
{
  return MEMORY[0x1E0DEEB20]();
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x1E0DEEB50]();
}

uint64_t swift_deallocObject()
{
  return MEMORY[0x1E0DEEB60]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_getTypeByMangledNameInContextInMetadataState2()
{
  return MEMORY[0x1E0DEED40]();
}

uint64_t swift_getWitnessTable()
{
  return MEMORY[0x1E0DEED50]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isEscapingClosureAtFileLocation()
{
  return MEMORY[0x1E0DEED98]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectWeakDestroy()
{
  return MEMORY[0x1E0DEEF38]();
}

uint64_t swift_unknownObjectWeakInit()
{
  return MEMORY[0x1E0DEEF40]();
}

uint64_t swift_unknownObjectWeakLoadStrong()
{
  return MEMORY[0x1E0DEEF48]();
}

uint64_t swift_updateClassMetadata2()
{
  return MEMORY[0x1E0DEEF78]();
}

