void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1D1287650(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1288424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D128BEFC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 128));
  _Unwind_Resume(a1);
}

void sub_1D128C11C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D128C24C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D128C60C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 152));
  _Unwind_Resume(a1);
}

void sub_1D128C934(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1D128D544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D128E00C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1D1293444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12935B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id UIViewForPLPillContentItem(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  UILabelForPLPillContentItem(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v3, "attributedText");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      objc_msgSend(v4, "setText:", CFSTR(" "));
      v7 = 0;
      goto LABEL_5;
    }
  }
  v7 = 1;
LABEL_5:
  objc_msgSend(v3, "accessoryView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8
    && ((objc_msgSend(v3, "accessoryView"), (v8 = (void *)objc_claimAutoreleasedReturnValue()) != 0)
      ? (v9 = v7)
      : (v9 = 0),
        v9 == 1))
  {
    if (objc_msgSend(v4, "_shouldReverseLayoutDirection"))
      v10 = 0;
    else
      v10 = 2;
    objc_msgSend(v4, "setTextAlignment:", v10);
    v11 = objc_alloc(MEMORY[0x1E0CEA9E0]);
    v21[0] = v4;
    v21[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v11, "initWithArrangedSubviews:", v12);

    objc_msgSend(v13, "setAxis:", 0);
    objc_msgSend(v13, "setAlignment:", 3);
    objc_msgSend(v13, "setDistribution:", 1);
    objc_msgSend(v13, "setSpacing:", 4.0);
  }
  else
  {
    if (v7)
    {
      v14 = v4;
    }
    else
    {
      objc_msgSend(v4, "intrinsicContentSize");
      v16 = v15;
      objc_msgSend(v8, "intrinsicContentSize");
      if (v16 < v17)
        v16 = v17;
      objc_msgSend(v8, "heightAnchor");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "constraintEqualToConstant:", v16);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "setActive:", 1);

      v14 = v8;
      v8 = v14;
    }
    v13 = v14;
  }

  return v13;
}

void sub_1D1293F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
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

void PLConfigureUILabelWithPLPillContentItemStyle(void *a1, uint64_t a2, uint64_t a3, void *a4)
{
  NSString *v7;
  id *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;

  v17 = a1;
  v7 = a4;
  v8 = (id *)MEMORY[0x1E0CEB538];
  if (a2 != 7)
    v8 = (id *)MEMORY[0x1E0CEB558];
  v9 = (void *)MEMORY[0x1E0D01928];
  v10 = *v8;
  objc_msgSend(v9, "preferredFontProvider");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredFontForTextStyle:hiFontStyle:contentSizeCategory:", v10, 12, v7);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setFont:", v12);
  v13 = 1;
  objc_msgSend(v17, "setTextAlignment:", 1);
  objc_msgSend(v17, "setLineBreakMode:", 0);
  objc_msgSend(v17, "setMarqueeEnabled:", a3);
  if ((a3 & 1) == 0)
  {
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3D8], v7) == NSOrderedAscending)
      v14 = 3;
    else
      v14 = 2;
    if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)*MEMORY[0x1E0CEB3C8], v7) == NSOrderedAscending)
      v13 = 4;
    else
      v13 = v14;
  }
  objc_msgSend(v17, "setNumberOfLines:", v13);
  switch(a2)
  {
    case 0:
    case 1:
    case 6:
    case 7:
      objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 2:
      objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 3:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemOrangeColor");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 4:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemRedColor");
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    case 5:
      objc_msgSend(MEMORY[0x1E0CEA478], "systemBlueColor");
      v15 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v16 = (void *)v15;
      objc_msgSend(v17, "setTextColor:", v15);

      break;
    default:
      break;
  }

}

id UILabelForPLPillContentItem(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = a1;
  v4 = (objc_class *)MEMORY[0x1E0CEA700];
  v5 = a2;
  v6 = objc_alloc_init(v4);
  PLConfigureUILabelWithPLPillContentItemStyle(v6, objc_msgSend(v3, "style"), objc_msgSend(v3, "isSolo") ^ 1, v5);

  objc_msgSend(v3, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v6, "setAttributedText:", 0);
    objc_msgSend(v3, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v8);

  }
  objc_msgSend(v3, "attributedText");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v6, "setText:", 0);
    objc_msgSend(v3, "attributedText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributedText:", v10);

  }
  return v6;
}

void sub_1D1297540(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1297BF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D12996F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1299B64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1299D04(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D1299E90(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D129A154(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D129A39C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D129B490(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1D129C6F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

double PLMainScreenScale()
{
  if (PLMainScreenScale___once != -1)
    dispatch_once(&PLMainScreenScale___once, &__block_literal_global_1);
  return *(double *)&PLMainScreenScale___cachedScale;
}

id PlatterKitFrameworkBundle()
{
  if (PlatterKitFrameworkBundle___once != -1)
    dispatch_once(&PlatterKitFrameworkBundle___once, &__block_literal_global_1);
  return (id)PlatterKitFrameworkBundle___bundle;
}

uint64_t BSUIDateFormatStyleFromPLDateFormatStyle(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;

  v1 = a1;
  if ((unint64_t)(a1 + 1) >= 3)
  {
    v2 = PLLogGeneral;
    if (os_log_type_enabled((os_log_t)PLLogGeneral, OS_LOG_TYPE_ERROR))
      BSUIDateFormatStyleFromPLDateFormatStyle_cold_1(v1, v2);
    return -1;
  }
  return v1;
}

double PLContentViewHeightForContentSizeCategory(void *a1, unint64_t a2, double a3)
{
  uint64_t v5;
  id v6;
  int v7;
  void *v8;
  id v9;
  double v10;
  BOOL v11;
  uint64_t v12;
  double v13;
  double v14;

  v5 = *MEMORY[0x1E0CEB440];
  v6 = a1;
  v7 = objc_msgSend(v6, "isEqualToString:", v5);
  v8 = (void *)*MEMORY[0x1E0CEB420];
  if (!v7)
    v8 = v6;
  v9 = v8;

  if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB408]))
  {
    v10 = 50.0;
    if (a3 != 0.0)
      v10 = 56.0;
    v11 = a2 >= 2;
    v12 = 0x404D000000000000;
  }
  else
  {
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB400]))
    {
      v10 = 50.0;
      v13 = 62.0;
      if (a3 != 0.0)
        v10 = 62.0;
      v11 = a2 >= 2;
      goto LABEL_30;
    }
    if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3F8]))
    {
      v10 = 50.0;
      if (a3 != 0.0)
        v10 = 65.0;
      v11 = a2 >= 2;
      v12 = 0x4051000000000000;
    }
    else
    {
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3E0]))
      {
        v10 = 50.0;
        if (a3 != 0.0)
          v10 = 76.0;
        v11 = a2 >= 2;
        v13 = 78.0;
        goto LABEL_30;
      }
      if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3D8]))
      {
        v10 = 53.0;
        if (a3 != 0.0)
          v10 = 84.0;
        v11 = a2 >= 2;
        v12 = 0x4056000000000000;
      }
      else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3D0]))
      {
        v10 = dbl_1D12ABD10[a3 != 0.0];
        v11 = a2 >= 2;
        v12 = 0x4059000000000000;
      }
      else if (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3C8]))
      {
        v10 = dbl_1D12ABD00[a3 != 0.0];
        v11 = a2 >= 2;
        v12 = 0x405C000000000000;
      }
      else
      {
        if (!objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0CEB3C0]))
        {
          v14 = 50.0;
          goto LABEL_33;
        }
        v10 = dbl_1D12ABCF0[a3 != 0.0];
        v11 = a2 >= 2;
        v12 = 0x4060000000000000;
      }
    }
  }
  v13 = *(double *)&v12;
LABEL_30:
  if (v11)
    v14 = v13;
  else
    v14 = v10;
LABEL_33:

  return v14;
}

void sub_1D12A19AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  char v11;
  char v12;
  id *v13;
  uint64_t v14;

  if ((v11 & 4) != 0)
    objc_destroyWeak(v13);
  if ((v12 & 2) != 0)
    objc_destroyWeak(location);
  objc_destroyWeak((id *)(v14 - 112));
  _Unwind_Resume(a1);
}

void sub_1D12A25C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PLViewAnimationOptionsForAnimationCurve(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) >= 3)
    return 0;
  else
    return ((a1 - 1) << 16) + 0x10000;
}

void PLSetViewFrameMaintainingTransform(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _QWORD v21[4];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v9 = a1;
  v10 = v9;
  v24 = 0u;
  v25 = 0u;
  v23 = 0u;
  if (v9)
    objc_msgSend(v9, "transform");
  v11 = (void *)MEMORY[0x1E0CEABB0];
  v12 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __PLSetViewFrameMaintainingTransform_block_invoke;
  v21[3] = &unk_1E91D3160;
  v13 = v10;
  v22 = v13;
  objc_msgSend(v11, "performWithoutAnimation:", v21);
  objc_msgSend(v13, "setFrame:", a2, a3, a4, a5);
  v14 = (void *)MEMORY[0x1E0CEABB0];
  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __PLSetViewFrameMaintainingTransform_block_invoke_2;
  v16[3] = &unk_1E91D3858;
  v17 = v13;
  v18 = v23;
  v19 = v24;
  v20 = v25;
  v15 = v13;
  objc_msgSend(v14, "performWithoutAnimation:", v16);

}

id PLCAMediaTimingFunctionForViewAnimationCurve(unint64_t a1, double a2, double a3, double a4, double a5)
{
  unint64_t v5;
  void *v6;
  _QWORD *v7;
  void *v8;

  if (a1 <= 5)
    v5 = a1;
  else
    v5 = 0;
  switch(v5)
  {
    case 1uLL:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      v7 = (_QWORD *)MEMORY[0x1E0CD3040];
      goto LABEL_11;
    case 2uLL:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      v7 = (_QWORD *)MEMORY[0x1E0CD3050];
      goto LABEL_11;
    case 3uLL:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      v7 = (_QWORD *)MEMORY[0x1E0CD3058];
      goto LABEL_11;
    case 4uLL:
      LODWORD(a2) = 1059648963;
      LODWORD(a4) = 1051260355;
      LODWORD(a3) = 0;
      LODWORD(a5) = 1.0;
      objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", a2, a3, a4, a5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
    case 5uLL:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      v7 = (_QWORD *)MEMORY[0x1E0CD3038];
      goto LABEL_11;
    default:
      v6 = (void *)MEMORY[0x1E0CD27D0];
      v7 = (_QWORD *)MEMORY[0x1E0CD3048];
LABEL_11:
      objc_msgSend(v6, "functionWithName:", *v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      return v8;
  }
}

void PLRegisterPlatterKitLogging()
{
  if (PLRegisterPlatterKitLogging_onceToken != -1)
    dispatch_once(&PLRegisterPlatterKitLogging_onceToken, &__block_literal_global_3);
}

void BSUIDateFormatStyleFromPLDateFormatStyle_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 134349056;
  v3 = a1;
  _os_log_error_impl(&dword_1D1285000, a2, OS_LOG_TYPE_ERROR, "Undefined date format style: %{public}ld", (uint8_t *)&v2, 0xCu);
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSIntervalMap()
{
  return MEMORY[0x1E0D01388]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

CFLocaleRef CFLocaleCopyCurrent(void)
{
  return (CFLocaleRef)MEMORY[0x1E0C98770]();
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x1E0C99208](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x1E0C99220](alloc, string, range.location, range.length, options, locale);
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
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

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t MTIsUIBlurEffectStyleDynamic()
{
  return MEMORY[0x1E0D47460]();
}

uint64_t MTMaterialRecipeForUIBlurEffectStyle()
{
  return MEMORY[0x1E0D47468]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

BOOL UIAccessibilityIsReduceMotionEnabled(void)
{
  return MEMORY[0x1E0CEB028]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0CEB030]();
}

NSComparisonResult UIContentSizeCategoryCompareToCategory(UIContentSizeCategory lhs, UIContentSizeCategory rhs)
{
  return MEMORY[0x1E0CEB3E8](lhs, rhs);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0CEB418](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x1E0CEB630](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x1E0CEB640]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x1E0CEB648]();
}

uint64_t UIRectCenteredAboutPoint()
{
  return MEMORY[0x1E0CEBA70]();
}

uint64_t UIRectCenteredIntegralRect()
{
  return MEMORY[0x1E0CEBA80]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0CEBA88]();
}

uint64_t UIRectCenteredXInRect()
{
  return MEMORY[0x1E0CEBA98]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0CEBAA8]();
}

uint64_t UIRectContainInRect()
{
  return MEMORY[0x1E0CEBAB8]();
}

uint64_t UIRectInset()
{
  return MEMORY[0x1E0CEBAE8]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0CEBAF8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x1E0CEBB20]();
}

uint64_t UISizeRoundToScale()
{
  return MEMORY[0x1E0CEBBC0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
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

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

