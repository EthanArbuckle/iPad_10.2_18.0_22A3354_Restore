void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t OUTLINED_FUNCTION_2()
{
  return swift_slowAlloc();
}

uint64_t OUTLINED_FUNCTION_0_1()
{
  return sub_1BBEA0928();
}

uint64_t OUTLINED_FUNCTION_0_2()
{
  _QWORD *v0;
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = *v0;
  *(_QWORD *)(v1 - 8) = *v0;
  return swift_task_dealloc();
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_1_1()
{
  JUMPOUT(0x1BCCE70E4);
}

void std::vector<double>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  uint64_t v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 3)
  {
    if (a2 >> 61)
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFF8];
    v9 = &v6[8 * v8];
    v10 = (char *)*a1;
    v11 = (char *)a1[1];
    v12 = v7;
    if (v11 != *a1)
    {
      v12 = v7;
      do
      {
        v13 = *((_QWORD *)v11 - 1);
        v11 -= 8;
        *((_QWORD *)v12 - 1) = v13;
        v12 -= 8;
      }
      while (v11 != v10);
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

void sub_1BBB8F378(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBB91A18(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBB926A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBB9298C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBB92C34(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBB93348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id a25)
{
  id *v25;
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a25);
  _Unwind_Resume(a1);
}

const __CFString *SKUIMediaQueryNetworkTypeString(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIMediaQueryNetworkTypeString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = CFSTR("none");
  v11 = CFSTR("wifi");
  if (a1 != 1000)
    v11 = 0;
  if (a1)
    v10 = v11;
  if ((unint64_t)(a1 - 1) >= 8)
    return v10;
  else
    return CFSTR("cellular");
}

void sub_1BBB982A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBB983DC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBB9AA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void sub_1BBB9B51C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBB9E0DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBB9E20C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
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

void sub_1BBB9E394(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIAppearanceStyleBarButtonItem(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIAppearanceStyleBarButtonItem_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  SUBarButtonItemApplyStyling();

}

void SKUIAppearanceStyleNavigationBar(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIAppearanceStyleNavigationBar_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  SUNavigationBarApplyStyling();

}

id SKUITintedImage(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  void *v22;
  CGSize v24;
  CGRect v25;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUITintedImage_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v7, "size");
  v17 = v16;
  v19 = v18;
  objc_msgSend(v7, "scale");
  v21 = v20;
  v24.width = v17;
  v24.height = v19;
  UIGraphicsBeginImageContextWithOptions(v24, 0, v21);
  objc_msgSend(v5, "set");

  v25.origin.x = 0.0;
  v25.origin.y = 0.0;
  v25.size.width = v17;
  v25.size.height = v19;
  UIRectFill(v25);
  objc_msgSend(v7, "drawInRect:blendMode:alpha:", 22, 0.0, 0.0, v17, v19, 1.0);

  objc_msgSend(v6, "drawInRect:", 0.0, 0.0, v17, v19);
  UIGraphicsGetImageFromCurrentImageContext();
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  return v22;
}

id SKUIBundle()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v0)
        SKUIBundle_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.ios.StoreKitUI"));
  return (id)objc_claimAutoreleasedReturnValue();
}

BOOL SKUIAllowsLandscapePhone()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  void *v9;
  double v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v0)
        SKUIAllowsLandscapePhone_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  v8 = SKUIAllowsLandscapePhone_sValue;
  if (SKUIAllowsLandscapePhone_sValue == 255)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_referenceBounds");
    SKUIAllowsLandscapePhone_sValue = v10 == 736.0;

    v8 = SKUIAllowsLandscapePhone_sValue;
  }
  return v8 != 0;
}

BOOL SKUIImageExistsWithResourceName(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  unint64_t v12;
  void **v13;
  void *v14;
  char v15;
  unint64_t v16;
  void **v17;
  void *v18;
  int v19;
  void *v20;
  _BOOL8 v21;
  void *v23;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIImageExistsWithResourceName_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (!SKUIImageExistsWithResourceName_sBundle)
  {
    SKUIBundle();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)SKUIImageExistsWithResourceName_sBundle;
    SKUIImageExistsWithResourceName_sBundle = v10;

  }
  v12 = 0;
  v13 = (void **)__StoreKitUIResources;
  do
  {
    v14 = *v13;
    v13 += 3;
    v15 = objc_msgSend(v14, "isEqualToString:", v1);
    if (v12 > 0x94)
      break;
    ++v12;
  }
  while ((v15 & 1) == 0);
  if ((v15 & 1) != 0)
    goto LABEL_16;
  v16 = 0;
  v17 = (void **)__UIKitResources;
  do
  {
    v18 = *v17;
    v17 += 3;
    v19 = objc_msgSend(v18, "isEqualToString:", v1);
    if (v16 > 2)
      break;
    ++v16;
  }
  while (!v19);
  if ((v19 & 1) != 0
    || (objc_msgSend((id)__ExternalResources, "objectForKey:", v1),
        v20 = (void *)objc_claimAutoreleasedReturnValue(),
        v20,
        v20))
  {
LABEL_16:
    v21 = 1;
  }
  else
  {
    objc_msgSend((id)__ExternalResourceManager, "imageForResourceName:", v1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v23 != 0;

  }
  return v21;
}

id SKUIImageWithResourceName(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t i;
  int v14;
  int v15;
  __CFString **v16;
  BOOL v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
      {
        SKUIImageWithResourceName_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
        if (v1)
          goto LABEL_5;
LABEL_40:
        v30 = 0;
        goto LABEL_41;
      }
    }
  }
  if (!v1)
    goto LABEL_40;
LABEL_5:
  objc_msgSend(0, "objectForKey:", v1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    if (!SKUIImageWithResourceName_sBundle)
    {
      SKUIBundle();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)SKUIImageWithResourceName_sBundle;
      SKUIImageWithResourceName_sBundle = v11;

    }
    for (i = 0; i != 450; i += 3)
    {
      if ((-[__CFString isEqualToString:](__StoreKitUIResources[i], "isEqualToString:", v1) & 1) != 0)
      {
        v16 = &__StoreKitUIResources[i];
        v17 = LOBYTE(__StoreKitUIResources[i + 2]) == 0;
        v15 = LOBYTE(__StoreKitUIResources[i + 2]) != 0;
        v14 = v17;
        objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v16[1], SKUIImageWithResourceName_sBundle);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v10)
          goto LABEL_16;
        goto LABEL_24;
      }
    }
    v14 = 0;
    v15 = 1;
LABEL_16:
    v18 = 0;
    while ((-[__CFString isEqualToString:](__UIKitResources[v18], "isEqualToString:", v1) & 1) == 0)
    {
      v18 += 3;
      if (v18 == 12)
        goto LABEL_22;
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", __UIKitResources[v18 + 1]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
      goto LABEL_25;
    v14 = 0;
    v15 = 1;
LABEL_22:
    objc_msgSend((id)__ExternalResources, "objectForKey:", v1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      v20 = v19;
      v15 = objc_msgSend(v19, "alwaysTemplate");
      v14 = v15 ^ 1;
      v21 = (void *)MEMORY[0x1E0DC3870];
      objc_msgSend(v20, "imageName");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "bundle");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "imageNamed:inBundle:", v22, v23);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
LABEL_24:
        if ((v15 & 1) != 0)
        {
LABEL_25:
          v24 = v10;
          v25 = 2;
LABEL_30:
          objc_msgSend(v24, "imageWithRenderingMode:", v25);
          v27 = objc_claimAutoreleasedReturnValue();

          v10 = (void *)v27;
          goto LABEL_31;
        }
LABEL_28:
        if (!v14)
          goto LABEL_31;
        v24 = v10;
        v25 = 1;
        goto LABEL_30;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", v1, SKUIImageWithResourceName_sBundle);
    v26 = objc_claimAutoreleasedReturnValue();
    if (v26
      || (objc_msgSend((id)__ExternalResourceManager, "imageForResourceName:", v1),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v10 = (void *)v26;
      if (v15)
        goto LABEL_25;
      goto LABEL_28;
    }
LABEL_31:
    v28 = 0;
    while (!-[__CFString isEqualToString:](__SKImagesThatFlip[v28], "isEqualToString:", v1))
    {
      if (++v28 == 3)
        goto LABEL_36;
    }
    objc_msgSend(v10, "imageFlippedForRightToLeftLayoutDirection");
    v29 = objc_claimAutoreleasedReturnValue();

    v10 = (void *)v29;
  }
LABEL_36:
  v30 = v10;

LABEL_41:
  return v30;
}

void SKUIResourceImageSetRegisterWithBundle(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        SKUIResourceImageSetRegisterWithBundle_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  SKUIResourceImageSetRegisterWithBundleAlwaysTemplate(v3, v4, 0);

}

void SKUIResourceImageSetRegisterWithBundleAlwaysTemplate(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  char v20;

  v5 = a1;
  v6 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v7)
        SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = objc_msgSend(v5, "count");
  if (v6 && v15)
  {
    if (!__ExternalResources)
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      v17 = (void *)__ExternalResources;
      __ExternalResources = (uint64_t)v16;

    }
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_block_invoke;
    v18[3] = &unk_1E73A11B0;
    v19 = v6;
    v20 = a3;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v18);

  }
}

void SKUISetExternalResourceManager(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUISetExternalResourceManager_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = (void *)__ExternalResourceManager;
  __ExternalResourceManager = (uint64_t)v1;

}

id SKUILinkArrowImage(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUILinkArrowImage_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUITintedImage(v13, 0, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id SKUILinkArrowButton(void *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;

  v9 = a1;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  v13 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v14)
        SKUILinkArrowButton_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("ChevronSeeAll"), v9);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setTitle:forState:", v13, 0);

  objc_msgSend(v23, "titleLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setFont:", v10);

  objc_msgSend(v23, "setTitleColor:forState:", v12, 0);
  objc_msgSend(v23, "setTitleColor:forState:", v11, 1);
  objc_msgSend(v22, "_flatImageWithColor:", v12);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setImage:forState:", v25, 0);
  objc_msgSend(v22, "_flatImageWithColor:", v11);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setImage:forState:", v26, 1);
  objc_msgSend(v22, "size");
  objc_msgSend(v23, "setTitleEdgeInsets:", 0.0, -(v27 + 5.0), 0.0, 0.0);
  objc_msgSend(v23, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v29 = v28;
  v31 = v30;
  objc_msgSend(v23, "titleRectForContentRect:", 0.0, 0.0, v28, v30);
  objc_msgSend(v23, "setImageEdgeInsets:", 1.0, v32 + 5.0, 0.0, 0.0);
  objc_msgSend(v23, "setFrame:", 0.0, 0.0, v29 + 5.0, v31);

  return v23;
}

id SKUIMoreDisclosureImage(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIMoreDisclosureImage_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("MoreDisclosureTriangleMask"), v3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUITintedImage(v13, 0, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

id SKUISearchNoResultsImage(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUISearchNoResultsImage_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3870], "imageNamed:inBundle:", CFSTR("ProxyGraphicSearch"), v1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void SKUIRangesForFormatString(void *a1, void *a2, void *a3, unint64_t *a4, unint64_t *a5)
{
  id v9;
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;
  BOOL v29;
  unint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  unint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;

  v9 = a2;
  v10 = a3;
  v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v12)
        SKUIRangesForFormatString_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v20 = objc_msgSend(v11, "rangeOfString:", CFSTR("%1$@"));
  v22 = v21;
  v23 = objc_msgSend(v11, "rangeOfString:", CFSTR("%2$@"));
  v25 = v24;

  v26 = v9;
  v27 = v10;
  v28 = v27;
  v29 = v20 > v23;
  if (v20 > v23)
    v30 = v23;
  else
    v30 = v20;
  if (v20 > v23)
    v23 = v20;
  else
    v25 = v22;
  if (v29)
    v31 = v27;
  else
    v31 = v26;
  if (v29)
    v32 = v26;
  else
    v32 = v27;
  v33 = objc_msgSend(v31, "length");
  v34 = v23 - v25 + v33;
  v35 = objc_msgSend(v32, "length");
  if (v31 == v26)
    v36 = v30;
  else
    v36 = v34;
  if (v31 == v26)
    v37 = v33;
  else
    v37 = v35;
  if (v31 == v26)
    v38 = v34;
  else
    v38 = v30;
  *a4 = v36;
  a4[1] = v37;
  if (v31 == v26)
    v39 = v35;
  else
    v39 = v33;
  *a5 = v38;
  a5[1] = v39;

}

void sub_1BBBA18AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBA2724(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1BBBA2A00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void _telephonyNotification(uint64_t a1, const void *a2, uint64_t a3, void *a4)
{
  void *v6;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const __CFString *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v15[4];
  id v16;
  __CFString *v17;

  v6 = (void *)SKUICoreTelephonyFramework();
  v7 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationOperatorNameChangedNotification", v6);
  v8 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationDisplayStatusChangedNotification", v6);
  v9 = *(const void **)SKUIWeakLinkedSymbolForString("kCTRegistrationStatusChangedNotification", v6);
  v10 = *(const void **)SKUIWeakLinkedSymbolForString("kCTSettingPhoneNumberChangedNotification", v6);
  if (CFEqual(a2, v7))
  {
    v11 = CFSTR("onOperatorChange");
LABEL_6:
    v12 = a4;
    objc_msgSend(v12, "appContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___telephonyNotification_block_invoke;
    v15[3] = &unk_1E73A1280;
    v16 = v12;
    v17 = (__CFString *)v11;
    v14 = v12;
    objc_msgSend(v13, "evaluate:completionBlock:", v15, 0);

    return;
  }
  if (CFEqual(a2, v9) || CFEqual(a2, v8))
  {
    v11 = CFSTR("onRegistrationChange");
    goto LABEL_6;
  }
  if (CFEqual(a2, v10))
  {
    v11 = CFSTR("onPhoneNumberChange");
    goto LABEL_6;
  }
}

id ___telephonyNotification_block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "invokeMethod:withArguments:", *(_QWORD *)(a1 + 40), 0);
}

void sub_1BBBA3A80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void sub_1BBBA4BC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void SKUIStoreAssetResourceLoaderConfigureWithDelegate(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = a2;
  v4 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIStoreAssetResourceLoaderConfigureWithDelegate_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "setDelegate:queue:", v3, MEMORY[0x1E0C80D38]);
  objc_setAssociatedObject(v4, (const void *)_SKUIStoreAssetResourceLoaderDelegateAssociatedObjectKeyStrongDelegate, v3, (void *)1);

}

void sub_1BBBA7CD8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, id a17)
{
  id *v17;
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a17);
  _Unwind_Resume(a1);
}

void sub_1BBBA81B0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBA8890(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBA8F30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBA9000(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

id SKUICacheCodingDecodeArray(void *a1, objc_class *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        SKUICacheCodingDecodeArray_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v13 = v3;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17);
        v19 = [a2 alloc];
        v20 = (void *)objc_msgSend(v19, "initWithCacheRepresentation:", v18, (_QWORD)v22);
        if (v20)
          objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }

  return v12;
}

id SKUICacheCodingEncodeArray(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUICacheCodingEncodeArray_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = v1;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v15), "cacheRepresentation", (_QWORD)v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v10, "addObject:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v13);
  }

  return v10;
}

uint64_t __SoftwareLibraryChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadSoftwareLibrary");
}

void sub_1BBBB1E04(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

SKUILibraryItem *SKUILibraryItemForStoreIdentifier(void *a1)
{
  id v1;
  SKUILibraryItem *v2;

  v1 = a1;
  v2 = objc_alloc_init(SKUILibraryItem);
  -[SKUILibraryItem setStoreIdentifier:](v2, "setStoreIdentifier:", v1);

  return v2;
}

BOOL SKUIItemStateCenterUseAppstoredPurchases(void *a1)
{
  id v1;
  _BOOL8 v2;

  v1 = a1;
  if (SKUIItemStateCenterUseAppstorePurchasesSwitchEnabled())
    v2 = objc_msgSend(v1, "itemKind") == 12 || objc_msgSend(v1, "itemKind") == 17;
  else
    v2 = 0;

  return v2;
}

void sub_1BBBB3CD4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

{

}

void sub_1BBBBB684(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBBBB58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __PurchaseHistoryChangeNotification(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadPurchaseHistory");
}

void sub_1BBBBBE7C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBBBFA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBBC0EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBBC924(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BBBBCC44(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBBCFD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIItemStateCenterUseAppstorePurchasesSwitchEnabled()
{
  void *v0;
  void *v1;
  int AppBooleanValue;
  BOOL v3;
  uint64_t v4;
  Boolean keyExistsAndHasValidFormat;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0
    || objc_msgSend(v1, "isEqualToString:", CFSTR("com.apple.ios.StoreKitUIService")))
  {
    keyExistsAndHasValidFormat = 0;
    AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("UseAppstoredPurchases"), CFSTR("com.apple.AppStore"), &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat)
      v3 = AppBooleanValue == 0;
    else
      v3 = 0;
    v4 = !v3;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t SKUIItemKindForString(uint64_t a1)
{
  uint64_t v2;

  v2 = 0;
  while (!objc_msgSend((id)qword_1E73A1B20[v2 + 1], "isEqualToString:", a1))
  {
    v2 += 2;
    if (v2 == 50)
      return 0;
  }
  return qword_1E73A1B20[v2];
}

BOOL SKUIItemKindIsSoftwareKind(uint64_t a1)
{
  return a1 == 12 || a1 == 17;
}

uint64_t SKUIItemDeviceFamilyIsUniversal(unsigned __int8 a1)
{
  return a1 & ((a1 & 6) != 0);
}

BOOL SKUIItemDeviceFamilyIsTVOnly(char a1)
{
  return (a1 & 0xF) == 8;
}

BOOL SKUIItemKindIsToneKind(uint64_t a1)
{
  return a1 == 11 || a1 == 16;
}

id SKUIItemScreenshotsForDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  id v22;
  SKUIScreenshot *v23;
  SKUIArtwork *v24;
  SKUIScreenshot *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  SKUIArtwork *v34;
  uint64_t v35;
  uint64_t v36;
  void *v38;
  id v39;
  void *v40;
  uint64_t v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0DAFBA0]);
  v3 = objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v40 = (void *)v3;
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_48;
  v39 = v1;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "scale");
  v6 = (uint64_t)v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8 == 1)
  {
    objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0DAFB88]);
    v9 = objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0DAFB98]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v49 = -320 * v6;
      v47 = -196 * v6;
      v1 = v39;
      if (v10)
      {
        v48 = -568 * v6;
        v15 = -348;
      }
      else
      {
        objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0DAFB90]);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = -480 * v6;
        v15 = -294;
      }
      v46 = v6 * v15;
      goto LABEL_14;
    }
    v10 = (void *)v9;
    v46 = -300 * v6;
    v47 = -225 * v6;
    v48 = -1024 * v6;
    v49 = -768 * v6;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "bounds");
  v13 = v12;

  if (v13 <= 480.0
    || (objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0DAFB98]), (v14 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v40, "objectForKey:", *MEMORY[0x1E0DAFB90]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = -480 * v6;
    v49 = -320 * v6;
    v46 = -294 * v6;
    v47 = -196 * v6;
LABEL_9:
    v1 = v39;
    goto LABEL_14;
  }
  v48 = -568 * v6;
  v49 = -320 * v6;
  v46 = -348 * v6;
  v47 = -196 * v6;
  v1 = v39;
  v10 = (void *)v14;
LABEL_14:
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_47;
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v38 = v10;
  v16 = v10;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (!v17)
    goto LABEL_46;
  v18 = v17;
  v19 = *(_QWORD *)v55;
  v42 = v16;
  v43 = v2;
  v41 = *(_QWORD *)v55;
  do
  {
    v20 = 0;
    v44 = v18;
    do
    {
      if (*(_QWORD *)v55 != v19)
        objc_enumerationMutation(v16);
      v21 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v20);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v20;
        v22 = v21;
        v23 = objc_alloc_init(SKUIScreenshot);
        v24 = -[SKUIArtwork initWithArtworkDictionary:]([SKUIArtwork alloc], "initWithArtworkDictionary:", v22);

        -[SKUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v24, CFSTR("high-dpi"));
        -[SKUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v24, CFSTR("low-dpi"));
        v25 = v23;
        goto LABEL_42;
      }
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v45 = v20;
        v26 = v21;
        v23 = objc_alloc_init(SKUIScreenshot);
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v25 = (SKUIScreenshot *)v26;
        v27 = -[SKUIScreenshot countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
        if (!v27)
          goto LABEL_41;
        v28 = v27;
        v29 = *(_QWORD *)v51;
        v30 = 0x7FFFFFFFFFFFFFFFLL;
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        while (1)
        {
          for (i = 0; i != v28; ++i)
          {
            if (*(_QWORD *)v51 != v29)
              objc_enumerationMutation(v25);
            v33 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * i);
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              v34 = -[SKUIArtwork initWithArtworkDictionary:]([SKUIArtwork alloc], "initWithArtworkDictionary:", v33);
              v35 = -[SKUIArtwork width](v34, "width");
              if (v35 >= -[SKUIArtwork height](v34, "height"))
              {
                if (SKUIArtworkSizeDeltaIsBetter(v35 + v48, v30))
                {
                  -[SKUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("high-dpi"));
                  v30 = v35 + v48;
                }
                v36 = v35 + v46;
                if (!SKUIArtworkSizeDeltaIsBetter(v36, v31))
                  goto LABEL_38;
              }
              else
              {
                if (SKUIArtworkSizeDeltaIsBetter(v35 + v49, v30))
                {
                  -[SKUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("high-dpi"));
                  v30 = v35 + v49;
                }
                v36 = v35 + v47;
                if ((SKUIArtworkSizeDeltaIsBetter(v36, v31) & 1) == 0)
                  goto LABEL_38;
              }
              -[SKUIScreenshot setArtwork:forVariant:](v23, "setArtwork:forVariant:", v34, CFSTR("low-dpi"), v38);
              v31 = v36;
LABEL_38:

              continue;
            }
          }
          v28 = -[SKUIScreenshot countByEnumeratingWithState:objects:count:](v25, "countByEnumeratingWithState:objects:count:", &v50, v58, 16);
          if (!v28)
          {
LABEL_41:

            v24 = (SKUIArtwork *)v23;
            v16 = v42;
            v2 = v43;
            v19 = v41;
            v18 = v44;
            if (-[SKUIScreenshot numberOfVariants](v23, "numberOfVariants") >= 1)
            {
LABEL_42:
              objc_msgSend(v2, "addObject:", v23, v38);
              v23 = (SKUIScreenshot *)v24;
            }

            v20 = v45;
            break;
          }
        }
      }
      ++v20;
    }
    while (v20 != v18);
    v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  }
  while (v18);
LABEL_46:

  v10 = v38;
  v1 = v39;
LABEL_47:

LABEL_48:
  return v2;
}

void sub_1BBBC5C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBC6060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIColorWithHTMLCode(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIColorWithHTMLCode_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_msgSend(v1, "length");
  v11 = v10;
  if (v10 == 8 || v10 == 6)
  {
    objc_msgSend(v1, "substringWithRange:", 0, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = SKUIHexValueWithString(v12);

    objc_msgSend(v1, "substringWithRange:", 2, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = SKUIHexValueWithString(v14);

    objc_msgSend(v1, "substringWithRange:", 4, 2);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = SKUIHexValueWithString(v16);

    if (v11 == 8)
    {
      objc_msgSend(v1, "substringWithRange:", 6, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = SKUIHexValueWithString(v18);

    }
    else
    {
      v19 = 255;
    }
    v20 = 0;
    if ((unint64_t)v13 <= 0xFF
      && (unint64_t)v17 <= 0xFF
      && (unint64_t)v15 <= 0xFF
      && (unint64_t)v19 <= 0xFF)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", (double)v13 / 255.0, (double)v15 / 255.0, (double)v17 / 255.0, (double)v19 / 255.0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

BOOL SKUIColorSchemeStyleForColor(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  int v11;
  uint64_t v12;
  double v14;
  uint64_t v15;
  uint64_t v16;
  double v17;

  v1 = a1;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !(v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG)))
  {
    if (v1)
      goto LABEL_5;
LABEL_13:
    v10 = 0;
    goto LABEL_14;
  }
  SKUIColorSchemeStyleForColor_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
  if (!v1)
    goto LABEL_13;
LABEL_5:
  v16 = 0;
  v17 = 0.0;
  v15 = 0;
  if (objc_msgSend(v1, "getHue:saturation:brightness:alpha:", &v16, &v15, &v17, 0))
  {
    v10 = v17 < 0.5;
  }
  else
  {
    v14 = 0.0;
    v11 = objc_msgSend(v1, "getWhite:alpha:", &v14, 0);
    v12 = 2;
    if (v14 < 0.5)
      v12 = 3;
    if (v11)
      v10 = v12;
    else
      v10 = 0;
  }
LABEL_14:

  return v10;
}

id SKUIBorderColorWithBackgroundColor(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *v11;

  v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && (v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT)))
  {
    SKUIBorderColorWithBackgroundColor_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    if (v1)
    {
LABEL_5:
      v10 = (char *)&loc_1BBBC99E4 + 4 * byte_1BBED1080[SKUIColorSchemeStyleForColor(v1)];
      __asm { BR              X9 }
    }
  }
  else if (v1)
  {
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

id SKUIColorForStyleWithBrightness(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v12)
        SKUIColorForStyleWithBrightness_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      break;
    default:
      a6 = 0.0;
      break;
  }
  SKUIColorByAdjustingBrightness(v11, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id SKUIColorByAdjustingBrightness(void *a1, float a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIColorByAdjustingBrightness_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v18 = 0.0;
  v19 = 0.0;
  v16 = 0.0;
  v17 = 0.0;
  if (!objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v19, &v18, &v17, &v16)
    || (objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v19, v18, v17 + a2, v16),
        (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = 0.0;
    v15 = 0.0;
    if ((objc_msgSend(v3, "getWhite:alpha:", &v15, &v14) & 1) == 0
      || (objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v15 + a2, v14),
          (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12 = v3;
    }
  }

  return v12;
}

id SKUIColorForStyleWithAlpha(void *a1, uint64_t a2, float a3, float a4, float a5, float a6)
{
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;

  v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v12)
        SKUIColorForStyleWithAlpha_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  switch(a2)
  {
    case 0:
      a6 = a3;
      break;
    case 1:
      a6 = a4;
      break;
    case 2:
      a6 = a5;
      break;
    case 3:
      break;
    default:
      a6 = 0.0;
      break;
  }
  SKUIColorWithAlpha(v11, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

id SKUIColorWithAlpha(void *a1, float a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  double v14;
  double v15;
  double v16;
  double v17;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        SKUIColorWithAlpha_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v16 = 0.0;
  v17 = 0.0;
  v15 = 0.0;
  if (!objc_msgSend(v3, "getHue:saturation:brightness:alpha:", &v17, &v16, &v15, 0)
    || (objc_msgSend(MEMORY[0x1E0DC3658], "colorWithHue:saturation:brightness:alpha:", v17, v16, v15, a2),
        (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v14 = 0.0;
    if ((objc_msgSend(v3, "getWhite:alpha:", &v14, 0) & 1) == 0
      || (objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", v14, a2),
          (v12 = (id)objc_claimAutoreleasedReturnValue()) == 0))
    {
      v12 = v3;
    }
  }

  return v12;
}

uint64_t SKUIHexValueWithString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  int v11;
  unsigned int v13;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIHexValueWithString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v13 = 0;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3900]), "initWithString:", v1);

  v11 = objc_msgSend(v10, "scanHexInt:", &v13);
  if (v11)
    return v13;
  else
    return 0x7FFFFFFFFFFFFFFFLL;
}

id SKUITableViewGroupedBackgroundColor()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        SKUITableViewGroupedBackgroundColor_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGroupedBackgroundColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

void SKUIGetImagesFromView(void *a1, _QWORD *a2, _QWORD *a3, double a4)
{
  id v7;
  CGFloat v8;
  CGFloat v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  id v14;
  CGImage *v15;
  double v16;
  CGImage *v17;
  void *v18;
  CGImage *v19;
  double v20;
  CGFloat v21;
  double v22;
  CGImage *v23;
  void *v24;
  id v25;
  CGSize v26;
  CGRect v27;
  CGRect v28;

  v7 = a1;
  objc_msgSend(v7, "bounds");
  v26.width = v8;
  v26.height = v9;
  UIGraphicsBeginImageContextWithOptions(v26, 1, 0.0);
  objc_msgSend(v7, "layer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "renderInContext:", UIGraphicsGetCurrentContext());
  UIGraphicsGetImageFromCurrentImageContext();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  objc_msgSend(v11, "scale");
  v13 = v12;
  v14 = objc_retainAutorelease(v11);
  v15 = (CGImage *)objc_msgSend(v14, "CGImage");
  objc_msgSend(v14, "size");
  v27.size.width = v13 * v16;
  v27.origin.x = 0.0;
  v27.origin.y = 0.0;
  v27.size.height = v13 * a4;
  v17 = CGImageCreateWithImageInRect(v15, v27);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v17, objc_msgSend(v14, "imageOrientation"), v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v17);
  if (a2)
    *a2 = objc_retainAutorelease(v18);
  v25 = objc_retainAutorelease(v14);
  v19 = (CGImage *)objc_msgSend(v25, "CGImage");
  objc_msgSend(v25, "size");
  v21 = v13 * v20;
  objc_msgSend(v25, "size");
  v28.size.height = v13 * (v22 - a4);
  v28.origin.x = 0.0;
  v28.origin.y = v13 * a4;
  v28.size.width = v21;
  v23 = CGImageCreateWithImageInRect(v19, v28);
  objc_msgSend(MEMORY[0x1E0DC3870], "imageWithCGImage:scale:orientation:", v23, objc_msgSend(v25, "imageOrientation"), v13);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  CGImageRelease(v23);
  if (a3)
    *a3 = objc_retainAutorelease(v24);

}

id SKUINavigationItemsShallowCopy(void *a1)
{
  id v1;
  void *v2;
  unint64_t v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v3 = 0;
    do
    {
      objc_msgSend(v1, "objectAtIndex:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_alloc_init(MEMORY[0x1E0DC3A48]);
      objc_msgSend(v4, "title");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setTitle:", v6);

      objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v4, "hidesBackButton"));
      objc_msgSend(v4, "prompt");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "setPrompt:", v7);

      objc_msgSend(v5, "setLeftItemsSupplementBackButton:", objc_msgSend(v4, "leftItemsSupplementBackButton"));
      objc_msgSend(v2, "addObject:", v5);

      ++v3;
    }
    while (v3 < objc_msgSend(v1, "count"));
  }

  return v2;
}

id SKUIStackedBarSpringAnimationForExpandCollapse(void *a1, double a2, double a3)
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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v5 = a1;
  objc_msgSend(v5, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "position");
  v8 = v7;
  v10 = v9;

  objc_msgSend(v5, "frame");
  v12 = v8 + a2 - v11;
  objc_msgSend(v5, "frame");
  v14 = v10 + a3 - v13;
  objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("position"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setDamping:", 26.0);
  objc_msgSend(v15, "setDuration:", 1.0);
  objc_msgSend(v15, "setFillMode:", *MEMORY[0x1E0CD2B50]);
  objc_msgSend(v15, "setMass:", 1.0);
  objc_msgSend(v15, "setStiffness:", 250.0);
  objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3058]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTimingFunction:", v16);

  objc_msgSend(v15, "setVelocity:", 0.0);
  v17 = (void *)MEMORY[0x1E0CB3B18];
  objc_msgSend(v5, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "position");
  objc_msgSend(v17, "valueWithCGPoint:");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFromValue:", v19);

  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCGPoint:", v12, v14);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setToValue:", v20);

  objc_msgSend(v5, "layer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "addAnimation:forKey:", v15, CFSTR("ExpandCollapse"));

  objc_msgSend(v5, "layer");
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "setPosition:", v12, v14);
  return v15;
}

uint64_t SKUIArtworkSizeDeltaIsBetter(uint64_t a1, uint64_t a2)
{
  _BOOL4 v3;
  int v4;
  unsigned int v5;

  v3 = a1 > 0 && a1 < a2;
  if (a2 < 0)
    v3 = a1 > a2;
  if (a1)
    v4 = v3;
  else
    v4 = 1;
  if (a2 == 0x7FFFFFFFFFFFFFFFLL)
    v5 = 1;
  else
    v5 = v4;
  if (a2)
    return v5;
  else
    return 0;
}

void sub_1BBBCFC80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBD02E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

{

}

void sub_1BBBD1098(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id location)
{
  id *v29;

  objc_destroyWeak(v29);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBD13C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBD1AA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIIconColorsForColorScheme(void *a1, _QWORD *a2, _QWORD *a3, _QWORD *a4)
{
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v7 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v8)
        SKUIIconColorsForColorScheme_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v7, "backgroundColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    SKUIColorForStyleWithBrightness(v16, objc_msgSend(v7, "schemeStyle"), -0.05, 0.25, -0.05, 0.25);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIColorForStyleWithBrightness(v16, objc_msgSend(v7, "schemeStyle"), -0.2, 0.0, -0.2, 0.05);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIColorForStyleWithBrightness(v16, objc_msgSend(v7, "schemeStyle"), -0.7, -0.2, -0.7, 0.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIColorForStyleWithAlpha(v19, objc_msgSend(v7, "schemeStyle"), 0.3, 1.0, 0.3, 0.3);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (!a2)
      goto LABEL_8;
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.95, 1.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.8, 1.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.3, 0.3);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (a2)
LABEL_7:
    *a2 = objc_retainAutorelease(v17);
LABEL_8:
  if (a3)
    *a3 = objc_retainAutorelease(v18);
  if (a4)
    *a4 = objc_retainAutorelease(v20);

}

void SKUIIconFrameForIconSize(double *a1, double *a2, double a3, double a4, double a5, double a6, double a7)
{
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v23;
  double v24;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v14 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v14)
        SKUIIconFrameForIconSize_cold_1(v14, v15, v16, v17, v18, v19, v20, v21);
    }
  }
  if (a5 != *MEMORY[0x1E0C9D820] || a6 != *(double *)(MEMORY[0x1E0C9D820] + 8))
  {
    v23 = a5 / a3;
    if (a5 / a3 >= a6 / a4)
      v23 = a6 / a4;
    a3 = ceil(a3 * v23);
    a4 = ceil(a4 * v23);
  }
  v24 = 0.0;
  if (a7 > 0.0)
    v24 = 1.0;
  if (a1)
  {
    *a1 = a3 + a7 * 2.0;
    a1[1] = a4 + a7 * 2.0;
  }
  if (a2)
  {
    *a2 = a7;
    a2[1] = v24;
    a2[2] = a3;
    a2[3] = a4;
  }
}

void sub_1BBBD591C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__7(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7(uint64_t a1)
{

}

{

}

void sub_1BBBD60CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBD678C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id getCNComposeRecipientViewDidChangeNotification()
{
  id *v0;
  _Unwind_Exception *v2;
  _QWORD v3[5];
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v0 = (id *)getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  v7 = getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr;
  if (!getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke;
    v3[3] = &unk_1E73A20C8;
    v3[4] = &v4;
    __getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke((uint64_t)v3);
    v0 = (id *)v5[3];
  }
  _Block_object_dispose(&v4, 8);
  if (!v0)
  {
    v2 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v4, 8);
    _Unwind_Resume(v2);
  }
  return *v0;
}

void sub_1BBBD9374(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBBDB3C0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__getCNComposeRecipientViewDidChangeNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (ContactsAutocompleteUILibraryCore_frameworkLibrary)
  {
    v2 = (void *)ContactsAutocompleteUILibraryCore_frameworkLibrary;
  }
  else
  {
    ContactsAutocompleteUILibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)ContactsAutocompleteUILibraryCore_frameworkLibrary;
    if (!ContactsAutocompleteUILibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "CNComposeRecipientViewDidChangeNotification");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getCNComposeRecipientViewDidChangeNotificationSymbolLoc_ptr = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                          + 24);
  return result;
}

void sub_1BBBDBD28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1BBBDCBA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__9(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__9(uint64_t a1)
{

}

{

}

uint64_t SKUIImageTreatmentForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIImageTreatmentForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("app")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artist-circle")) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("brick")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("evergreen")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("left-to-right-linear-gradient")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("parallax")) & 1) != 0)
  {
    v10 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("product")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("radio")) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("radial-gradient")) & 1) != 0)
  {
    v10 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("tint")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uber")) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("uber-banner")) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watch-app")) & 1) != 0)
  {
    v10 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("watch-product")) & 1) != 0)
  {
    v10 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("voyager-app")) & 1) != 0)
  {
    v10 = 15;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tv-app")))
  {
    v10 = 16;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1BBBDF374(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

id SKUIErrorDocumentTitle(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIErrorDocumentTitle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "bundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.AppStore")) & 1) != 0)
  {
    v12 = CFSTR("CANNOT_CONNECT_TO_APP_STORE");
    if (!v1)
      goto LABEL_15;
  }
  else if ((objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.iBooks")) & 1) != 0)
  {
    v12 = CFSTR("CANNOT_CONNECT_TO_IBOOKS_STORE");
    if (!v1)
    {
LABEL_15:
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", v12, 0);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
  else
  {
    if (objc_msgSend(v11, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
      v12 = CFSTR("CANNOT_CONNECT_TO_IMESSAGE_STORE");
    else
      v12 = CFSTR("CANNOT_CONNECT_TO_ITUNES_STORE");
    if (!v1)
      goto LABEL_15;
  }
  objc_msgSend(v1, "localizedStringForKey:", v12);
  v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
  v14 = (void *)v13;

  return v14;
}

void sub_1BBBE16C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBE1DB4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

void sub_1BBBE31EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__10(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__10(uint64_t a1)
{

}

id SKUIPageComponentClassForComponentType(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIPageComponentClassForComponentType_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((unint64_t)(a1 - 1) > 0x1A)
    v10 = 0;
  else
    v10 = (void *)objc_opt_class();
  return v10;
}

uint64_t SKUIPageComponentTypeForBlockType(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIPageComponentTypeForBlockType_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("accountButtons")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("counter")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("divider")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("expand")) & 1) != 0)
  {
    v10 = 19;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("flowcase")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("gallery")) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("grid")) & 1) != 0)
  {
    v10 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("lockup")) & 1) != 0)
  {
    v10 = 9;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("media")) & 1) != 0)
  {
    v10 = 10;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("popup")) & 1) != 0)
  {
    v10 = 11;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("quicklinks")) & 1) != 0)
  {
    v10 = 12;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("row")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("showcase")) & 1) != 0)
  {
    v10 = 13;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("spacer")) & 1) != 0)
  {
    v10 = 14;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("swoosh")) & 1) != 0)
  {
    v10 = 15;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tabs")))
  {
    v10 = 11;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

uint64_t SKUIPageComponentTypeForFeaturedContentKind(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIPageComponentTypeForFeaturedContentKind_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  result = 15;
  switch(a1)
  {
    case 257:
      result = 10;
      break;
    case 258:
      result = 18;
      break;
    case 259:
    case 262:
    case 263:
    case 264:
    case 265:
    case 267:
      goto LABEL_8;
    case 260:
    case 261:
    case 268:
      return result;
    case 266:
      result = 12;
      break;
    default:
      if ((unint64_t)(a1 - 304) >= 2)
LABEL_8:
        result = 0;
      break;
  }
  return result;
}

uint64_t SKUIPageComponentFontWeightForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIPageComponentFontWeightForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("light")) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("medium")))
  {
    v10 = 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id SKUIStorePageItemsWithStorePlatformDictionary(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t v23;

  v5 = a1;
  v6 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v7)
        SKUIStorePageItemsWithStorePlatformDictionary_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    }
  }
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (!v6 || (objc_msgSend(v5, "objectForKey:", v6), (v16 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(v5, "objectForKey:", CFSTR("lockup"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
      objc_msgSend(v5, "allKeys");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "count") == 1)
      {
        objc_msgSend(v17, "objectAtIndex:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "objectForKey:", v18);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v16 = 0;
      }

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v16, "objectForKey:", *MEMORY[0x1E0DAFB80]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v21[0] = MEMORY[0x1E0C809B0];
      v21[1] = 3221225472;
      v21[2] = __SKUIStorePageItemsWithStorePlatformDictionary_block_invoke;
      v21[3] = &unk_1E73A2400;
      v23 = a3;
      v22 = v15;
      objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", v21);

    }
  }

  return v15;
}

uint64_t SKUIStorePageTypeIsProductPage(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIStorePageTypeIsProductPage_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("software")) & 1) != 0)
    v10 = 1;
  else
    v10 = objc_msgSend(v1, "isEqualToString:", CFSTR("mobileSoftwareBundle"));

  return v10;
}

void sub_1BBBE8CD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__11(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__11(uint64_t a1)
{

}

void sub_1BBBE8FDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBEB148(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBEB3D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBEC1A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBEF61C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBF03E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

id SKUIBadgeImageFromText(void *a1, void *a2, char a3)
{
  id v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t *v13;
  char v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v5 = a1;
  v6 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIBadgeImageFromText_cold_1();
  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__12;
  v19 = __Block_byref_object_dispose__12;
  v20 = 0;
  if (SKUIBadgeImageFromText_sOnce != -1)
    dispatch_once(&SKUIBadgeImageFromText_sOnce, &__block_literal_global_6);
  if (objc_msgSend(v5, "length"))
  {
    v7 = SKUIBadgeImageFromText_sBadgeImageQueue;
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __SKUIBadgeImageFromText_block_invoke_2;
    v10[3] = &unk_1E73A27C0;
    v11 = v5;
    v12 = v6;
    v13 = &v15;
    v14 = a3;
    dispatch_sync(v7, v10);

  }
  v8 = (id)v16[5];
  _Block_object_dispose(&v15, 8);

  return v8;
}

void sub_1BBBF17BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__12(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__12(uint64_t a1)
{

}

void sub_1BBBF2274(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__13(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__13(uint64_t a1)
{

}

void sub_1BBBF23C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBF278C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBF2E98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBF4A6C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  _Block_object_dispose((const void *)(v2 - 120), 8);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BBBF4BD8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBF52D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBBF54BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBF84F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;
  id *v18;
  uint64_t v19;

  objc_destroyWeak(v18);
  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  objc_destroyWeak((id *)(v19 - 56));
  _Unwind_Resume(a1);
}

void sub_1BBBF86EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBF893C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 64));
  objc_destroyWeak((id *)(v3 - 56));
  _Unwind_Resume(a1);
}

void sub_1BBBF8B78(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBBFB288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBBFB634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIGiftAmountButtonsWithAmounts(void *a1)
{
  id v1;
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  SKUIGiftAmountButton *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = v1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v7);
        v9 = objc_alloc_init(SKUIGiftAmountButton);
        objc_msgSend(v8, "displayLabel", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[SKUIGiftAmountButton setTitle:forState:](v9, "setTitle:forState:", v10, 0);

        -[SKUIGiftAmountButton sizeToFit](v9, "sizeToFit");
        objc_msgSend(v2, "addObject:", v9);

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

void sub_1BBBFCAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__14(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__14(uint64_t a1)
{

}

void sub_1BBBFD8C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

void sub_1BBC0093C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC00CA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC03A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC06774(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__16(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__16(uint64_t a1)
{

}

{

}

void sub_1BBC0993C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__17(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__17(uint64_t a1)
{

}

void sub_1BBC09A90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC0CEE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC0D660(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC0D92C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBC0F734(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC11920(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC12134(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC14784(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__18(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__18(uint64_t a1)
{

}

void sub_1BBC14C1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__19(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__19(uint64_t a1)
{

}

uint64_t SKUITrackListColumnIdentifierForViewElement(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUITrackListColumnIdentifierForViewElement_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_msgSend(v1, "elementType");
  v11 = 2;
  if (v10 > 79)
  {
    if (v10 > 137)
    {
      if (v10 != 138)
      {
        if (v10 != 141)
          goto LABEL_26;
        goto LABEL_21;
      }
      if ((objc_msgSend(v1, "labelViewStyle") & 0xFFFFFFFFFFFFFFFELL) == 4)
        v11 = 4;
      else
        v11 = 2;
    }
    else if (v10 == 80)
    {
      v11 = 5;
    }
    else if (v10 == 90)
    {
      objc_msgSend(v1, "flattenedChildren");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = SKUITrackListColumnIdentifierForViewElement();

    }
  }
  else
  {
    if (v10 > 11)
    {
      if ((unint64_t)(v10 - 12) >= 2 && v10 != 50)
        goto LABEL_26;
LABEL_21:
      v11 = 1;
      goto LABEL_26;
    }
    v14 = 3;
    if (v10 != 9)
      v14 = 2;
    if (v10 == 8)
      v11 = 0;
    else
      v11 = v14;
  }
LABEL_26:

  return v11;
}

void sub_1BBC154E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC1572C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC15E28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__20(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__20(uint64_t a1)
{

}

void sub_1BBC17738(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBC1870C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__21(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__21(uint64_t a1)
{

}

void sub_1BBC18914(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC19648(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC1AB5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__22(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__22(uint64_t a1)
{

}

void sub_1BBC1BA78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC1BDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC1D950(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC1EEC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC1F29C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIViewElementDateWithString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIViewElementDateWithString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (!SKUIViewElementDateWithString_sInputFormatter1)
  {
    v10 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v11 = (void *)SKUIViewElementDateWithString_sInputFormatter1;
    SKUIViewElementDateWithString_sInputFormatter1 = (uint64_t)v10;

    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter1, "setDateFormat:", CFSTR("yyyy-MM-dd"));
    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter1, "setLenient:", 1);
    v12 = (void *)SKUIViewElementDateWithString_sInputFormatter1;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setLocale:", v13);

  }
  if (!SKUIViewElementDateWithString_sInputFormatter2)
  {
    v14 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v15 = (void *)SKUIViewElementDateWithString_sInputFormatter2;
    SKUIViewElementDateWithString_sInputFormatter2 = (uint64_t)v14;

    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter2, "setDateFormat:", CFSTR("yyyy-MM-dd'T'HH:mm:ss'Z'"));
    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter2, "setLenient:", 1);
    v16 = (void *)SKUIViewElementDateWithString_sInputFormatter2;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLocale:", v17);

  }
  if (!SKUIViewElementDateWithString_sInputFormatter3)
  {
    v18 = objc_alloc_init(MEMORY[0x1E0CB3578]);
    v19 = (void *)SKUIViewElementDateWithString_sInputFormatter3;
    SKUIViewElementDateWithString_sInputFormatter3 = (uint64_t)v18;

    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter3, "setDateFormat:", CFSTR("yyyy-MM-dd'T'hh:mm:ss'Z'"));
    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter3, "setLenient:", 1);
    v20 = (void *)SKUIViewElementDateWithString_sInputFormatter3;
    objc_msgSend(MEMORY[0x1E0C99DC8], "localeWithLocaleIdentifier:", CFSTR("en_US"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLocale:", v21);

  }
  objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter1, "dateFromString:", v1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v22)
  {
    objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter2, "dateFromString:", v1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v22)
    {
      objc_msgSend((id)SKUIViewElementDateWithString_sInputFormatter3, "dateFromString:", v1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v22;
}

void SKUIViewElementTextDeadlockFix(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id *v14;
  id v15;
  NSObject *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        SKUIViewElementTextDeadlockFix_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __SKUIViewElementTextDeadlockFix_block_invoke;
    v20[3] = &unk_1E73A2BE0;
    v14 = &v21;
    v21 = v3;
    v15 = v3;
    objc_msgSend(v13, "evaluate:completionBlock:", v20, 0);
  }
  else
  {
    dispatch_get_global_queue(-32768, 0);
    v16 = objc_claimAutoreleasedReturnValue();
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __SKUIViewElementTextDeadlockFix_block_invoke_2;
    v18[3] = &unk_1E739FD38;
    v14 = &v19;
    v19 = v3;
    v17 = v3;
    dispatch_async(v16, v18);

  }
}

uint64_t SKUIGraphicsDeviceHasASTCSupport()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        SKUIGraphicsDeviceHasASTCSupport_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  if (SKUIGraphicsDeviceHasASTCSupport_onceToken != -1)
    dispatch_once(&SKUIGraphicsDeviceHasASTCSupport_onceToken, &__block_literal_global_11);
  return SKUIGraphicsDeviceHasASTCSupport_supportsASTC;
}

double SKUIGraphicsMatchViewBorderToStroke(void *a1, double a2)
{
  id v3;
  double v4;
  double v5;

  v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    SKUIGraphicsMatchViewBorderToStroke_cold_1();
  }
  objc_msgSend(v3, "contentScaleFactor");
  v5 = round(a2 * 0.5 * v4) / v4;

  return v5;
}

CFMutableDataRef SKUIGraphicsCreateASTCDataFromImage(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  CFMutableDataRef Mutable;
  uint64_t v19;
  const void *v20;
  void *v21;
  char v22;
  _QWORD v24[2];
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIGraphicsCreateASTCDataFromImage_cold_2(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        SKUIGraphicsCreateASTCDataFromImage_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  if (SoftLinkImageIO_onceToken != -1)
    dispatch_once(&SoftLinkImageIO_onceToken, &__block_literal_global_53);
  Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v19 = weak_CGImageDestinationCreateWithData(Mutable, CFSTR("org.khronos.ktx"), 1, 0);
  if (v19)
  {
    v20 = (const void *)v19;
    v24[0] = weak_kCGImagePropertyEncoder;
    v24[1] = weak_kCGImagePropertyASTCBlockSize;
    v25[0] = weak_kCGImagePropertyASTCEncoder;
    v25[1] = &unk_1E749B4C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    weak_CGImageDestinationAddImage(v20, a1, v21);
    v22 = weak_CGImageDestinationFinalize(v20);
    CFRelease(v20);
    if ((v22 & 1) == 0)
    {
      NSLog(CFSTR("%s could not convert to ASTC"), "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
      CFRelease(Mutable);
      Mutable = 0;
    }

  }
  else
  {
    NSLog(CFSTR("%s could not create CGImageDestination, bailing out"), "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromImage(CGImageRef _Nonnull)");
    CFRelease(Mutable);
    return 0;
  }
  return Mutable;
}

CFMutableDataRef SKUIGraphicsCreateASTCDataFromBitmapContext(CGContext *a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGImageRef Image;
  CGImage *v11;
  CFMutableDataRef ASTCDataFromImage;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIGraphicsCreateASTCDataFromBitmapContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  Image = CGBitmapContextCreateImage(a1);
  if (Image)
  {
    v11 = Image;
    ASTCDataFromImage = SKUIGraphicsCreateASTCDataFromImage((uint64_t)Image);
    CGImageRelease(v11);
  }
  else
  {
    NSLog(CFSTR("%s could not create bitmap context image, bailing out"), "CFDataRef  _Nullable SKUIGraphicsCreateASTCDataFromBitmapContext(CGContextRef _Nonnull)");
    return 0;
  }
  return ASTCDataFromImage;
}

SKUICompressedImage *SKUIGraphicsGetASTCImageFromCurrentImageContext(double a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  CGContext *CurrentContext;
  CFMutableDataRef ASTCDataFromBitmapContext;
  CFMutableDataRef v12;
  void *v13;
  double v14;
  SKUICompressedImage *v15;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIGraphicsGetASTCImageFromCurrentImageContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  CurrentContext = UIGraphicsGetCurrentContext();
  if (CurrentContext
    && (ASTCDataFromBitmapContext = SKUIGraphicsCreateASTCDataFromBitmapContext(CurrentContext)) != 0)
  {
    v12 = ASTCDataFromBitmapContext;
    if (fabs(a1) < 2.22044605e-16)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "scale");
      a1 = v14;

    }
    v15 = -[SKUICompressedImage initWithData:scale:]([SKUICompressedImage alloc], "initWithData:scale:", v12, a1);

  }
  else
  {
    v15 = 0;
  }
  return v15;
}

void sub_1BBC29184(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC2FAA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  uint64_t v37;

  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose((const void *)(v37 - 192), 8);
  _Block_object_dispose((const void *)(v37 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC31EDC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location)
{
  uint64_t v10;

  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1BBC324A4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location)
{
  id *v9;
  uint64_t v10;

  objc_destroyWeak(v9);
  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v10 - 112));
  _Unwind_Resume(a1);
}

void sub_1BBC34768(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIResourceLoaderGetNameForObject(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIResourceLoaderGetNameForObject_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@:%p"), v12, v1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

BOOL SKUIResourceLoadCountMapClear(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIResourceLoadCountMapClear_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = 2;
  if (a2 != 1)
    v12 = a2 == 0;
  v13 = *(_QWORD *)(a1 + 8 * v12);
  if (v13 >= 1)
    *(_QWORD *)(a1 + 8 * v12) = 0;
  return v13 > 0;
}

uint64_t SKUIResourceLoadCountMapDecrement(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIResourceLoadCountMapDecrement_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = a2 == 0;
  if (a2 == 1)
    v12 = 2;
  result = *(_QWORD *)(a1 + 8 * v12);
  if (result >= 1)
    *(_QWORD *)(a1 + 8 * v12) = --result;
  return result;
}

uint64_t SKUIResourceLoadCountMapGet(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIResourceLoadCountMapGet_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = a2 == 0;
  if (a2 == 1)
    v12 = 2;
  return *(_QWORD *)(a1 + 8 * v12);
}

void sub_1BBC36BCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC36CE8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void SKUIResourceLoadCountMapIncrement(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIResourceLoadCountMapIncrement_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  v12 = a2 == 0;
  if (a2 == 1)
    v12 = 2;
  ++*(_QWORD *)(a1 + 8 * v12);
}

void SKUIEditorialStyleForDictionary(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v3 = a1;
  *(_OWORD *)a2 = xmmword_1BBED1380;
  *(_QWORD *)(a2 + 16) = 0x4120000041600000;
  *(_QWORD *)(a2 + 24) = 2;
  *(_QWORD *)(a2 + 32) = 0x40A0000041880000;
  v13 = v3;
  objc_msgSend(v3, "objectForKey:", CFSTR("align"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)a2 = SKUIPageComponentAlignmentForString(v4);
  objc_msgSend(v13, "objectForKey:", CFSTR("bodySize"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)(a2 + 16) = SKUIEditorialBodySizeForString(v5);
    *(_QWORD *)(a2 + 8) = 1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "floatValue");
    *(_DWORD *)(a2 + 16) = v6;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("bodyWeight"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(a2 + 8) = SKUIPageComponentFontWeightForString(v7);
  objc_msgSend(v13, "objectForKey:", CFSTR("titleSize"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    *(float *)(a2 + 20) = SKUIEditorialLinkSpacingForString(v8);
    *(float *)(a2 + 32) = SKUIEditorialTitleSizeForString(v8);
    *(_QWORD *)(a2 + 24) = SKUIEditorialTitleWeightForString(v8);
    *(float *)(a2 + 36) = SKUIEditorialTitleSpacingForString(v8);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "floatValue");
    *(_DWORD *)(a2 + 32) = v9;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("titleSpacing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v10, "floatValue");
    *(_DWORD *)(a2 + 36) = v11;
  }
  objc_msgSend(v13, "objectForKey:", CFSTR("titleWeight"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    *(_QWORD *)(a2 + 24) = SKUIPageComponentFontWeightForString(v12);

}

uint64_t SKUICTTextAlignmentForPageComponentAlignment(unint64_t a1)
{
  unsigned int v1;

  v1 = 0x1020000u >> (8 * a1);
  if (a1 >= 4)
    LOBYTE(v1) = 2;
  return v1 & 3;
}

float SKUIEditorialBodySizeForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 11.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 12.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 17.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v2 = 24.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SKUIEditorialBodyWeightForString()
{
  return 1;
}

double SKUIEditorialStyleDefault@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_OWORD *)a1 = xmmword_1BBED1380;
  *(_QWORD *)(a1 + 16) = 0x4120000041600000;
  *(_QWORD *)(a1 + 24) = 2;
  result = 2048.0005;
  *(_QWORD *)(a1 + 32) = 0x40A0000041880000;
  return result;
}

uint64_t SKUIPageComponentAlignmentForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("left")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("right")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("center")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

float SKUIEditorialLinkSpacingForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 10.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 9.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 12.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v2 = 14.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

float SKUIEditorialTitleSizeForString(void *a1)
{
  id v1;
  float v2;
  float v3;

  v1 = a1;
  v2 = 14.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 17.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v2 = 25.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) != 0)
        {
          v2 = 42.0;
        }
        else
        {
          objc_msgSend(v1, "floatValue");
          v2 = v3;
        }
      }
    }
  }

  return v2;
}

uint64_t SKUIEditorialTitleWeightForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("M")))
  {
    v2 = 1;
  }
  else
  {
    v2 = 2;
  }

  return v2;
}

float SKUIEditorialTitleSpacingForString(void *a1)
{
  id v1;
  float v2;

  v1 = a1;
  v2 = 2.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v2 = 13.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
    {
      if (objc_msgSend(v1, "isEqualToString:", CFSTR("L")))
        v2 = 18.0;
      else
        v2 = 5.0;
    }
  }

  return v2;
}

double SKUITextLayoutSizeForCTFrame(const __CTFrame *a1, CFIndex a2)
{
  const CGPath *Path;
  double width;
  const __CFArray *Lines;
  CFIndex Count;
  CFIndex v8;
  const __CTLine *ValueAtIndex;
  float v10;
  CGPoint v12;
  CGPoint origins;
  CFRange v14;
  CFRange v15;
  CGRect BoundingBox;

  Path = CTFrameGetPath(a1);
  BoundingBox = CGPathGetBoundingBox(Path);
  width = BoundingBox.size.width;
  Lines = CTFrameGetLines(a1);
  Count = CFArrayGetCount(Lines);
  if (a2 && Count > a2)
  {
    origins.x = 0.0;
    origins.y = 0.0;
    v12.x = 0.0;
    v12.y = 0.0;
    v14.location = 0;
    v14.length = 1;
    CTFrameGetLineOrigins(a1, v14, &v12);
    v8 = a2 - 1;
    v15.location = v8;
    v15.length = 1;
    CTFrameGetLineOrigins(a1, v15, &origins);
    ValueAtIndex = (const __CTLine *)CFArrayGetValueAtIndex(Lines, v8);
    CTLineGetBoundsWithOptions(ValueAtIndex, 0x14uLL);
  }
  v10 = width;
  return ceilf(v10);
}

void sub_1BBC3A5E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC3AA1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC3AC60(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC3B97C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC3FEB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC400F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC404D4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BBC42A94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__23(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__23(uint64_t a1)
{

}

void sub_1BBC43E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__24(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__24(uint64_t a1)
{

}

void sub_1BBC44264(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC44C38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC49224(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC498E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC4C5C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC4CA0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC4CF80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1BBC4D3CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

Class __getAMSURLParserClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary)
  {
    AppleMediaServicesLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!AppleMediaServicesLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("AMSURLParser");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getAMSURLParserClass_block_invoke_cold_1();
    free(v3);
  }
  getAMSURLParserClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void __getAMSUIDynamicViewControllerClass_block_invoke(uint64_t a1)
{
  AppleMediaServicesUILibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AMSUIDynamicViewController");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSUIDynamicViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSUIDynamicViewControllerClass_block_invoke_cold_1();
    AppleMediaServicesUILibrary();
  }
}

void AppleMediaServicesUILibrary()
{
  void *v0;

  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
    AppleMediaServicesUILibraryCore_frameworkLibrary = _sl_dlopen();
  if (!AppleMediaServicesUILibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

SKUIRedeemInputViewController *__getAMSUIWebViewControllerClass_block_invoke(uint64_t a1)
{
  SKUIRedeemInputViewController *result;
  SKUIRedeemInputViewController *v3;
  SEL v4;
  int64_t v5;

  AppleMediaServicesUILibrary();
  result = (SKUIRedeemInputViewController *)objc_getClass("AMSUIWebViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSUIWebViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SKUIRedeemInputViewController *)__getAMSUIWebViewControllerClass_block_invoke_cold_1();
    return -[SKUIRedeemInputViewController initWithRedeemCategory:](v3, v4, v5);
  }
  return result;
}

uint64_t __Block_byref_object_copy__25(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__25(uint64_t a1)
{

}

void sub_1BBC511EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__26(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__26(uint64_t a1)
{

}

void sub_1BBC5137C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC52AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__27(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__27(uint64_t a1)
{

}

void sub_1BBC52C84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC54448(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC54D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC5641C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUIChartGetTitle(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v5 = a1;
  v6 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIChartGetTitle_cold_1();
  }
  v7 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
  if (!SKUIChartGetTitle_sChartIndexFormatter)
  {
    v8 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
    v9 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
    SKUIChartGetTitle_sChartIndexFormatter = (uint64_t)v8;

    objc_msgSend((id)SKUIChartGetTitle_sChartIndexFormatter, "setNumberStyle:", 1);
    objc_msgSend((id)SKUIChartGetTitle_sChartIndexFormatter, "setUsesGroupingSeparator:", 0);
    v7 = (void *)SKUIChartGetTitle_sChartIndexFormatter;
  }
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", a3);
  objc_msgSend(v7, "stringFromNumber:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    objc_msgSend(v5, "localizedStringForKey:", CFSTR("CHART_ITEM_TITLE_FORMAT"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("CHART_ITEM_TITLE_FORMAT"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v12, CFSTR("%@%@"), 0, v11, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void sub_1BBC56DFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC57744(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BBC57998(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC59504(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC5EF80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIZoomingShelfMenuBarGetValidationInfoForViewElement(void *a1@<X0>, uint64_t a2@<X8>)
{
  BOOL v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  __int128 v14;
  id v15;

  v15 = a1;
  *(_OWORD *)a2 = xmmword_1BBED14D0;
  *(_QWORD *)(a2 + 16) = 0x7FFFFFFFFFFFFFFFLL;
  v3 = objc_msgSend(v15, "elementType") == 72;
  v4 = v15;
  if (v3)
  {
    objc_msgSend(v15, "children");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count") != 2)
    {
LABEL_11:

      v4 = v15;
      goto LABEL_12;
    }
    objc_msgSend(v5, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "attributes");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("type"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("product"));

    objc_msgSend(v5, "lastObject");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributes");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("type"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqualToString:", CFSTR("product"));

    if (!v9 || v13)
    {
      if (((v9 | v13 ^ 1) & 1) != 0)
      {
LABEL_10:

        goto LABEL_11;
      }
      v14 = xmmword_1BBED14E0;
    }
    else
    {
      v14 = xmmword_1BBED1380;
    }
    *(_BYTE *)a2 = 1;
    *(_OWORD *)(a2 + 8) = v14;
    goto LABEL_10;
  }
LABEL_12:

}

void sub_1BBC64AF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL SKUIEditorialLayoutOrientationForInterfaceOrientation(uint64_t a1)
{
  return (unint64_t)(a1 - 3) < 2;
}

BOOL SKUIEditorialLayoutOrientationForView(void *a1)
{
  double v1;
  double v2;

  objc_msgSend(a1, "bounds");
  return v1 > v2;
}

void sub_1BBC67730(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC67ACC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__28(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__28(uint64_t a1)
{

}

void sub_1BBC682A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC692FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__29(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__29(uint64_t a1)
{

}

void SKUILockupStyleForDictionary(void *a1@<X0>, void *a2@<X1>, uint64_t a3@<X8>)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  *(_OWORD *)a3 = xmmword_1BBED1590;
  *(_QWORD *)(a3 + 16) = 2142;
  objc_msgSend(v5, "objectForKey:", CFSTR("orientation"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v8 = SKUILockupLayoutStyleForString(v7);
    *(_QWORD *)(a3 + 8) = v8;
    v9 = v8 & 2;
  }
  else
  {
    v9 = 0;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("artworkSize"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v11 = SKUILockupSizeForString(v10);
    *(_QWORD *)a3 = v11;
  }
  else
  {
    v11 = 2;
  }
  objc_msgSend(v5, "objectForKey:", CFSTR("fields"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v20 = v11;
    v21 = v10;
    v22 = v9;
    v23 = v6;
    *(_QWORD *)(a3 + 16) = 0;
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v14)
    {
      v15 = v14;
      v16 = 0;
      v17 = *(_QWORD *)v25;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v13);
          v19 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v18);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v16 |= SKUILockupFieldForString(v19);
            *(_QWORD *)(a3 + 16) = v16;
          }
          ++v18;
        }
        while (v15 != v18);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v15);
    }

    v9 = v22;
    v6 = v23;
    v11 = v20;
    v10 = v21;
  }
  if (!objc_msgSend(v6, "layoutStyle", v20, v21, v22, v23, (_QWORD)v24))
  {
    if (v11 != 4)
    {
      if (v11 != 5)
        goto LABEL_19;
      *(_QWORD *)a3 = 4;
    }
    if (v9)
      *(_QWORD *)(a3 + 8) = 0;
  }
LABEL_19:

}

uint64_t SKUILockupFieldForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artistName")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("artwork")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buyButton")) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("genreName")) & 1) != 0)
  {
    v2 = 8;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("itemCount")) & 1) != 0)
  {
    v2 = 128;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("name")) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("releaseDate")) & 1) != 0)
  {
    v2 = 32;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("userRating")))
  {
    v2 = 64;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SKUILockupItemCountString(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "itemKind") == 17)
  {
    if (SKUILockupItemCountString_sFormatter)
    {
      if (v4)
      {
LABEL_4:
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("APP_BUNDLE_LOCKUP_APP_COUNT"));
        v5 = objc_claimAutoreleasedReturnValue();
LABEL_8:
        v9 = (void *)v5;
        v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithInteger:", objc_msgSend(v3, "numberOfChildItems"));
        v11 = (void *)MEMORY[0x1E0CB3940];
        objc_msgSend((id)SKUILockupItemCountString_sFormatter, "stringFromNumber:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringWithValidatedFormat:validFormatSpecifiers:error:", v9, CFSTR("%@"), 0, v12);
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
      v8 = (void *)SKUILockupItemCountString_sFormatter;
      SKUILockupItemCountString_sFormatter = (uint64_t)v7;

      objc_msgSend((id)SKUILockupItemCountString_sFormatter, "setNumberStyle:", 1);
      if (v4)
        goto LABEL_4;
    }
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("APP_BUNDLE_LOCKUP_APP_COUNT"), 0);
    v5 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v6 = 0;
LABEL_9:

  return v6;
}

uint64_t SKUILockupLayoutStyleForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("V2")) & 1) != 0)
  {
    v2 = 3;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("H2"));
  }

  return v2;
}

uint64_t SKUILockupSizeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) != 0)
  {
    v2 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XL")) & 1) != 0)
  {
    v2 = 4;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("XXL")))
  {
    v2 = 5;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

double SKUILockupStyleDefault@<D0>(uint64_t a1@<X8>)
{
  double result;

  *(_QWORD *)&result = 2;
  *(_OWORD *)a1 = xmmword_1BBED1590;
  *(_QWORD *)(a1 + 16) = 2142;
  return result;
}

BOOL SKUILockupStyleEqualToLockupStyle(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2 && a1[1] == a2[1] && a1[2] == a2[2];
}

BOOL SKUILockupLayoutStyleIsHorizontal(uint64_t a1)
{
  return (a1 & 0xFFFFFFFFFFFFFFFELL) != 2;
}

void sub_1BBC6B0AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id SKUICollectionViewCellForView(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
      else
        v3 = 0;
      objc_msgSend(v2, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v2 = v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }

  return v3;
}

id SKUICollectionViewForView(void *a1)
{
  uint64_t v1;
  void *v2;
  id v3;
  void *v4;

  objc_msgSend(a1, "superview");
  v1 = objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    v2 = (void *)v1;
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v3 = v2;
      else
        v3 = 0;
      objc_msgSend(v2, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (v3)
        break;
      v2 = v4;
    }
    while (v4);
  }
  else
  {
    v3 = 0;
    v4 = 0;
  }

  return v3;
}

void sub_1BBC6D174(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC6D6F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC6DD04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC6DF10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC6E5AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 144), 8);
  _Block_object_dispose((const void *)(v13 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC6F2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__30(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__30(uint64_t a1)
{

}

void sub_1BBC70AEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CGFloat CGRectWithFlippedOriginRelativeToBoundingRect(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v14;
  CGRect v16;
  CGRect v17;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    CGRectWithFlippedOriginRelativeToBoundingRect_cold_1();
  }
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  v14 = a1 - CGRectGetMinX(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  return CGRectGetMaxX(v17) - v14 - a3;
}

id SKUIStackedBarNavAnimationController(void *a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  int v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  void *v28;
  __objc2_class **v29;
  void *v30;

  v7 = a1;
  v8 = a3;
  v9 = a4;
  v10 = (id)objc_msgSend(v8, "view");
  v11 = (id)objc_msgSend(v9, "view");
  objc_msgSend(v9, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layoutSubviews");

  objc_msgSend(v8, "SKUIStackedBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "SKUIStackedBar");
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v16 = 0;
  if (v13 && v14)
  {
    objc_msgSend(v13, "_resetNewOffset");
    objc_msgSend(v15, "_resetNewOffset");
    SKUINavigationControllerGetItemsForViewController(v7, v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setItems:", v17);

    objc_msgSend(v13, "sizeToFit");
    objc_msgSend(v8, "contentScrollView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (v18)
    {
      v19 = objc_msgSend(v13, "splitViewStyle");
      objc_msgSend(v13, "frame");
      if (v19)
        v21 = v20;
      else
        v21 = v20 + -20.0;
      objc_msgSend(v8, "contentScrollView");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIScrollViewSetContentInsets(v22, "com.apple.StoreKitUI.stackedBarInset", v21, 0.0, 0.0, 0.0);

    }
    SKUINavigationControllerGetItemsForViewController(v7, v9);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setItems:", v23);

    objc_msgSend(v15, "sizeToFit");
    objc_msgSend(v9, "contentScrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      v25 = objc_msgSend(v15, "splitViewStyle");
      objc_msgSend(v15, "frame");
      if (v25)
        v27 = v26;
      else
        v27 = v26 + -20.0;
      objc_msgSend(v9, "contentScrollView");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIScrollViewSetContentInsets(v28, "com.apple.StoreKitUI.stackedBarInset", v27, 0.0, 0.0, 0.0);

    }
    if (a2 == 1)
    {
      v29 = off_1E739E5C8;
      v30 = v8;
    }
    else
    {
      if (a2 != 2)
      {
        v16 = 0;
        goto LABEL_19;
      }
      v29 = off_1E739E5C0;
      v30 = v9;
    }
    v16 = objc_alloc_init(*v29);
    objc_msgSend(v16, "setFromBar:", v13);
    objc_msgSend(v16, "setToBar:", v15);
    objc_msgSend(v30, "SKUIStackedBarSplit");
    objc_msgSend(v16, "setSplit:");
  }
LABEL_19:

  return v16;
}

id SKUINavigationControllerGetItemsForViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "viewControllers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v9)
        objc_enumerationMutation(v6);
      v11 = *(id *)(*((_QWORD *)&v17 + 1) + 8 * v10);
      objc_msgSend(v11, "navigationItem");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "addObject:", v12);

      if (v11 == v4)
        break;
      if (v8 == ++v10)
      {
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v8)
          goto LABEL_3;
        break;
      }
    }
  }

  objc_msgSend(v3, "viewControllers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "containsObject:", v4);

  if ((v14 & 1) == 0)
  {
    objc_msgSend(v4, "navigationItem");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v15);

  }
  return v5;
}

void SKUIStackedBarNavDidShow(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  id v12;
  CGRect v13;

  v12 = a1;
  v3 = a2;
  objc_msgSend(v3, "SKUIStackedBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SKUINavigationControllerGetItemsForViewController(v12, v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setItems:", v5);

    objc_msgSend(v4, "frame");
    if (CGRectGetHeight(v13) == 0.0)
      objc_msgSend(v4, "sizeToFit");
    objc_msgSend(v3, "contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v8 = v7;
      if (objc_msgSend(v4, "splitViewStyle"))
      {
        objc_msgSend(v4, "frame");
        v10 = v9;
      }
      else
      {
        v10 = v8 + -20.0;
      }
      objc_msgSend(v3, "contentScrollView");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      SKUIScrollViewSetContentInsets(v11, "com.apple.StoreKitUI.stackedBarInset", v10, 0.0, 0.0, 0.0);

    }
  }

}

void SKUIScrollViewSetContentInsets(void *a1, const void *a2, double a3, double a4, double a5, double a6)
{
  void *v7;
  void *v8;
  double v9;
  double v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  id object;

  object = a1;
  objc_getAssociatedObject(object, a2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "UIEdgeInsetsValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
  }
  else
  {
    v10 = *MEMORY[0x1E0DC49E8];
    v12 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v14 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(object, "contentInset");
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v24 = v23;
  objc_msgSend(object, "scrollIndicatorInsets");
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v32 = v31;
  if (v12 != a4 || v10 != a3 || v16 != a6 || v14 != a5)
  {
    v36 = a3 - v10;
    v37 = v36 + v18;
    v38 = a4 - v12;
    v39 = a4 - v12 + v20;
    v40 = a5 - v14;
    v41 = a5 - v14 + v22;
    v42 = a6 - v16;
    v43 = a6 - v16 + v24;
    v44 = v26;
    v45 = v28;
    v46 = v30;
    v47 = v32;
    objc_msgSend(object, "setContentInset:", v37, v39, v41, v43);
    objc_msgSend(object, "setScrollIndicatorInsets:", v36 + v44, v38 + v45, v40 + v46, v42 + v47);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", a3, a4, a5, a6);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, a2, v48, (void *)1);

  }
}

void SKUIImageRectForBounds()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIImageRectForBounds_cold_1();
  }
  SKUIImageRectForBoundsAndPadding();
}

void SKUIImageRectForBoundsAndPadding()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content() && _os_feature_enabled_impl())
  {
    v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
    if (v0)
      SKUIImageRectForBoundsAndPadding_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
  }
}

void SKUIViewSetBottomBorderColor(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIViewSetBottomBorderColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "viewWithTag:", 1397441090);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = 1.0 / v16;

      objc_msgSend(v3, "bounds");
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, v18 - v17, v19, v17);
      objc_msgSend(v14, "setAutoresizingMask:", 10);
      objc_msgSend(v14, "setTag:", 1397441090);
      objc_msgSend(v3, "addSubview:", v14);
    }
    objc_msgSend(v14, "setBackgroundColor:", v4);
  }
  else
  {
    objc_msgSend(v13, "removeFromSuperview");
  }

}

void SKUIViewSetTopBorderColor(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIViewSetTopBorderColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "viewWithTag:", 1397445698);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "scale");
      v17 = 1.0 / v16;

      objc_msgSend(v3, "bounds");
      v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", 0.0, 0.0, v18, v17);
      objc_msgSend(v14, "setAutoresizingMask:", 2);
      objc_msgSend(v14, "setTag:", 1397445698);
      objc_msgSend(v3, "addSubview:", v14);
    }
    objc_msgSend(v14, "setBackgroundColor:", v4);
  }
  else
  {
    objc_msgSend(v13, "removeFromSuperview");
  }

}

double SKUILockupImageSizeForLockupSize(unint64_t a1, uint64_t a2)
{
  double *v2;

  if (a2 == 2 || a2 == 6)
  {
    if (a1 < 6)
    {
      v2 = (double *)&unk_1BBED1690;
      return v2[a1];
    }
    return 120.0;
  }
  else if (a2 == 8)
  {
    if (a1 < 6)
    {
      v2 = (double *)&unk_1BBED1630;
      return v2[a1];
    }
    return 175.0;
  }
  else
  {
    if (a1 <= 5)
    {
      v2 = (double *)&unk_1BBED16C0;
      return v2[a1];
    }
    return 125.0;
  }
}

uint64_t SKUILockupImageStyleForItemKind(uint64_t a1)
{
  if ((unint64_t)(a1 - 2) > 6)
    return 0;
  else
    return qword_1BBED16F0[a1 - 2];
}

void sub_1BBC7BD6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBC7BF60(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7DAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62)
{
  uint64_t v62;

  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&STACK[0x348], 8);
  _Block_object_dispose((const void *)(v62 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7ECD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7F010(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7F410(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__31(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__31(uint64_t a1)
{

}

void sub_1BBC7F66C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7F990(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC7FEB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUILockupViewTypeForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUILockupViewTypeForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("grid")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("list")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("shelf")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("product")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("brick")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v10 = 6;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("caption")) & 1) != 0)
  {
    v10 = 7;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("tabular")))
  {
    v10 = 8;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1BBC835AC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBC839F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIFacebookViewElementTypeForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIFacebookViewElementTypeForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_msgSend(v1, "isEqualToString:", CFSTR("large"));

  return v10;
}

void sub_1BBC87948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__32(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__32(uint64_t a1)
{

}

void sub_1BBC87F74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC882F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC88440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v13 = v4;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v20;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v20 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v19 + 1) + 8 * v17), "personalizationLibraryItems", (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v3, "unionSet:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v15);
  }

}

void sub_1BBC88D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 64), 8);
  _Unwind_Resume(a1);
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChild(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIViewElementAccumulatePersonalizationLibraryItemsForChild_cold_1();
  }
  objc_msgSend(v4, "personalizationLibraryItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    objc_msgSend(v3, "unionSet:", v5);

}

uint64_t SKUIViewElementAlignmentForStyle(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIViewElementAlignmentForStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = objc_msgSend(v1, "textAlignment");
  if (!v10)
  {
    v10 = objc_msgSend(v1, "elementAlignment");
    if (!v10)
    {
      v11 = objc_msgSend(v1, "elementPosition");
      if ((unint64_t)(v11 - 1) > 8)
        v10 = 0;
      else
        v10 = qword_1BBED19A0[v11 - 1];
    }
  }

  return v10;
}

id SKUIViewElementFontWithStyle(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  double *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t *v35;
  uint64_t *v36;
  int v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v47;
  void *value;
  _QWORD v49[2];
  _QWORD v50[2];
  void *v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  _QWORD v60[2];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIViewElementFontWithStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "textStyle");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (SKUIViewElementFontWithStyle_sOnce != -1)
      dispatch_once(&SKUIViewElementFontWithStyle_sOnce, &__block_literal_global_18);
    value = 0;
    if (NSMapMember((NSMapTable *)SKUIViewElementFontWithStyle_sTextStyleMap, v10, 0, &value))
    {
      objc_msgSend(v1, "textScale");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v11;
      if (v11)
      {
        if (objc_msgSend(v11, "isEqualToString:", CFSTR("none")))
        {
          SKUIFontForTextStyle((uint64_t)value);
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_16:
          v16 = (void *)v13;
          objc_msgSend(v1, "fontWeight");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = v17;
          if (!v16 || !v17)
            goto LABEL_28;
          if (objc_msgSend(v17, "isEqualToString:", CFSTR("medium")))
          {
            v60[0] = *MEMORY[0x1E0DC1378];
            objc_msgSend(v16, "familyName");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v60[1] = *MEMORY[0x1E0DC1388];
            v61[0] = v19;
            v61[1] = CFSTR("Medium");
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_20:
            objc_msgSend(v16, "fontDescriptor");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "fontDescriptorByAddingAttributes:", v20);
            v22 = (void *)objc_claimAutoreleasedReturnValue();

            goto LABEL_26;
          }
          if (objc_msgSend(v18, "isEqualToString:", CFSTR("bold")))
          {
            objc_msgSend(v16, "fontDescriptor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v23;
            v24 = 2;
          }
          else
          {
            if (!objc_msgSend(v18, "isEqualToString:", CFSTR("condensed-bold")))
            {
              if (objc_msgSend(v18, "isEqualToString:", CFSTR("light")))
              {
                v58 = *MEMORY[0x1E0DC13B8];
                v59 = *MEMORY[0x1E0CA8290];
                v34 = (void *)MEMORY[0x1E0C99D80];
                v35 = &v59;
                v36 = &v58;
              }
              else if (objc_msgSend(v18, "isEqualToString:", CFSTR("ultra-light")))
              {
                v56 = *MEMORY[0x1E0DC13B8];
                v57 = *MEMORY[0x1E0CA82C0];
                v34 = (void *)MEMORY[0x1E0C99D80];
                v35 = &v57;
                v36 = &v56;
              }
              else
              {
                if (!objc_msgSend(v18, "isEqualToString:", CFSTR("thin")))
                  goto LABEL_28;
                v54 = *MEMORY[0x1E0DC13B8];
                v55 = *MEMORY[0x1E0CA82B0];
                v34 = (void *)MEMORY[0x1E0C99D80];
                v35 = &v55;
                v36 = &v54;
              }
              objc_msgSend(v34, "dictionaryWithObjects:forKeys:count:", v35, v36, 1);
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              goto LABEL_20;
            }
            objc_msgSend(v16, "fontDescriptor");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v23;
            v24 = 66;
          }
          objc_msgSend(v23, "fontDescriptorWithSymbolicTraits:", v24);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

          if (v22)
          {
            objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v22, 0.0);
            v25 = objc_claimAutoreleasedReturnValue();

            v16 = (void *)v25;
          }
LABEL_28:

          if (v16)
            goto LABEL_48;
          goto LABEL_29;
        }
        v47 = 0;
        v15 = NSMapMember((NSMapTable *)SKUIViewElementFontWithStyle_sTextScaleMap, v12, 0, &v47);
        v14 = value;
        if (v15)
        {
          SKUIFontLimitedPreferredFontForTextStyle((uint64_t)value, (uint64_t)v47);
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_16;
        }
      }
      else
      {
        v14 = value;
      }
      SKUIFontPreferredFontForTextStyle((uint64_t)v14);
      v13 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
  }
LABEL_29:
  objc_msgSend(v1, "fontSize");
  v27 = v26;
  if (v26 > 0.00000011920929)
  {
    objc_msgSend(v1, "fontWeight");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v28, "isEqualToString:", CFSTR("medium")))
    {
      v29 = (void *)MEMORY[0x1E0DC1350];
      v30 = (double *)MEMORY[0x1E0DC1438];
    }
    else if (objc_msgSend(v28, "isEqualToString:", CFSTR("bold")))
    {
      v29 = (void *)MEMORY[0x1E0DC1350];
      v30 = (double *)MEMORY[0x1E0DC1420];
    }
    else
    {
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("condensed-bold")))
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:weight:", v27, *MEMORY[0x1E0DC1420]);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "fontDescriptor");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v32, "fontDescriptorWithSymbolicTraits:", 66);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v33, 0.0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_47:
        goto LABEL_48;
      }
      if (objc_msgSend(v28, "isEqualToString:", CFSTR("light")))
      {
        v29 = (void *)MEMORY[0x1E0DC1350];
        v30 = (double *)MEMORY[0x1E0DC1430];
      }
      else if (objc_msgSend(v28, "isEqualToString:", CFSTR("ultra-light")))
      {
        v29 = (void *)MEMORY[0x1E0DC1350];
        v30 = (double *)MEMORY[0x1E0DC1460];
      }
      else
      {
        v37 = objc_msgSend(v28, "isEqualToString:", CFSTR("thin"));
        v29 = (void *)MEMORY[0x1E0DC1350];
        if (!v37)
        {
          objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", v27);
          v38 = objc_claimAutoreleasedReturnValue();
          goto LABEL_46;
        }
        v30 = (double *)MEMORY[0x1E0DC1450];
      }
    }
    objc_msgSend(v29, "systemFontOfSize:weight:", v27, *v30);
    v38 = objc_claimAutoreleasedReturnValue();
LABEL_46:
    v16 = (void *)v38;
    goto LABEL_47;
  }
  v16 = 0;
LABEL_48:
  objc_msgSend(v16, "fontDescriptor");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = *MEMORY[0x1E0DC1380];
  v40 = *MEMORY[0x1E0DC13D0];
  v49[0] = *MEMORY[0x1E0DC13D8];
  v49[1] = v40;
  v50[0] = &unk_1E749B558;
  v50[1] = &unk_1E749B570;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v41;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v51, 1);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v42;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "fontDescriptorByAddingAttributes:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v44, 0.0);
  v45 = (void *)objc_claimAutoreleasedReturnValue();

  return v45;
}

id SKUIViewElementPlainColorWithIKColor(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        SKUIViewElementPlainColorWithIKColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  if (objc_msgSend(v3, "colorType") == 1)
  {
    v13 = v4;
  }
  else
  {
    objc_msgSend(v3, "color");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;

  return v14;
}

id SKUIViewElementPlainColorWithStyle(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v5)
        SKUIViewElementPlainColorWithStyle_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithIKColor(v13, v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

uint64_t SKUIViewElementNSTextAlignmentForIKElementAlignment(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIViewElementNSTextAlignmentForIKElementAlignment_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((unint64_t)(a1 - 2) >= 4)
    return 0;
  else
    return a1 - 1;
}

double SKUIViewElementMarginForStyle(void *a1, char *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  char v15;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIViewElementMarginForStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "valueForStyle:", *MEMORY[0x1E0D3A5A8]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v3, "valueForStyle:", CFSTR("itml-margin"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v15 = 0;
      v14 = *MEMORY[0x1E0DC49E8];
      if (!a2)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  objc_msgSend(v12, "UIEdgeInsetsValue");
  v14 = v13;

  v15 = 1;
  if (a2)
LABEL_8:
    *a2 = v15;
LABEL_9:

  return v14;
}

double SKUIViewElementPaddingForStyle(void *a1, char *a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  char v15;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIViewElementPaddingForStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "valueForStyle:", *MEMORY[0x1E0D3A5B0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    objc_msgSend(v3, "valueForStyle:", CFSTR("itml-padding"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v12)
    {
      v15 = 0;
      v14 = *MEMORY[0x1E0DC49E8];
      if (!a2)
        goto LABEL_9;
      goto LABEL_8;
    }
  }
  objc_msgSend(v12, "UIEdgeInsetsValue");
  v14 = v13;

  v15 = 1;
  if (a2)
LABEL_8:
    *a2 = v15;
LABEL_9:

  return v14;
}

void sub_1BBC8CBB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__33(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__33(uint64_t a1)
{

}

void sub_1BBC8CD20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC8D030(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC8D250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1BBC8FD88(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void SKUIConsoleLogFormat(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id v11;
  _BOOL8 v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t *v24;

  v10 = a2;
  v11 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v12 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v12)
        SKUIConsoleLogFormat_cold_1(v12, v13, v14, v15, v16, v17, v18, v19);
    }
  }
  v24 = &a9;
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v10, &a9);

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __SKUIConsoleLogFormat_block_invoke;
  v22[3] = &unk_1E73A2BE0;
  v23 = v20;
  v21 = v20;
  objc_msgSend(v11, "evaluate:completionBlock:", v22, 0);

}

void SKUIConsoleLogObjects(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIConsoleLogObjects_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __SKUIConsoleLogObjects_block_invoke;
  v14[3] = &unk_1E73A2BE0;
  v15 = v4;
  v13 = v4;
  objc_msgSend(v3, "evaluate:completionBlock:", v14, 0);

}

void sub_1BBC9B374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9B744(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9BA0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9C06C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__34(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__34(uint64_t a1)
{

}

void sub_1BBC9C680(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9D0AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9D278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9DD34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,char a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  uint64_t v44;

  _Block_object_dispose(&a32, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a44, 8);
  _Block_object_dispose((const void *)(v44 - 248), 8);
  _Block_object_dispose((const void *)(v44 - 216), 8);
  _Unwind_Resume(a1);
}

void sub_1BBC9E550(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBCA1938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__35(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__35(uint64_t a1)
{

}

void sub_1BBCA39A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBCA3A84(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCA3BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__36(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__36(uint64_t a1)
{

}

void sub_1BBCA3D50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA7F54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCA9788(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v10;
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v10 - 136), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__37(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__37(uint64_t a1)
{

}

void sub_1BBCA99F8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCA9F08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCAEF5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__38(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__38(uint64_t a1)
{

}

void sub_1BBCAF1E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAFCB0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCAFF44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCB0298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__39(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__39(uint64_t a1)
{

}

void sub_1BBCB50F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a25, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void SKUIInitializeDOMFeatureFactory()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v0)
        SKUIInitializeDOMFeatureFactory_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  if (SKUIInitializeDOMFeatureFactory_sOnce != -1)
    dispatch_once(&SKUIInitializeDOMFeatureFactory_sOnce, &__block_literal_global_23);
}

void SKUIRegisterDOMFeatureFactory(void *a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIRegisterDOMFeatureFactory_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "possibleFeatureNames");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v17 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(MEMORY[0x1E0D3A668], "registerClass:forFeatureName:", a1, *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v12);
    }
  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) == 0)
      return;
    v15 = (void *)MEMORY[0x1E0D3A668];
    objc_msgSend(a1, "featureName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "registerClass:forFeatureName:", a1, v10);
  }

}

void sub_1BBCB6740(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCBAFCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,char a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a66;

  _Block_object_dispose(&a50, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a66, 8);
  _Unwind_Resume(a1);
}

void SKUIScrollViewLayoutTopBackgroundColor(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIScrollViewLayoutTopBackgroundColor_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "viewWithTag:", 1095975495);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    __LayoutTopBackgroundColor(v1, v10);

}

void __LayoutTopBackgroundColor(void *a1, void *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  id v10;

  v10 = a2;
  objc_msgSend(a1, "bounds");
  v4 = v3;
  v6 = v5;
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  objc_msgSend(v10, "setFrame:", v4, -v9, v6, v9);
}

void SKUIScrollViewLayoutTopBackgroundColorForProductPage(void *a1, double a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        SKUIScrollViewLayoutTopBackgroundColorForProductPage_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(v3, "viewWithTag:", 1095975495);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {
    objc_msgSend(v3, "bounds");
    v14 = v13;
    v16 = v15;
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "bounds");
    v19 = v18 + v18;

    objc_msgSend(v12, "setFrame:", v14, a2 - v19, v16, v19);
  }

}

void SKUIScrollViewSetTopBackgroundColor(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIScrollViewSetTopBackgroundColor_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "viewWithTag:", 1095975495);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v4)
  {
    if (!v13)
    {
      v14 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
      objc_msgSend(v14, "setAutoresizingMask:", 2);
      objc_msgSend(v14, "setTag:", 1095975495);
      objc_msgSend(v3, "_addContentSubview:atBack:", v14, 1);
    }
    objc_msgSend(v14, "setBackgroundColor:", v4);
    __LayoutTopBackgroundColor(v3, v14);
  }
  else
  {
    objc_msgSend(v13, "removeFromSuperview");
  }

}

void sub_1BBCC14B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCC1728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCC17EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCC1A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCC1B44(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBCC1DCC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC2048(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__40(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__40(uint64_t a1)
{

}

void sub_1BBCC22B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC29B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC3FF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,char a54,uint64_t a55,uint64_t a56,uint64_t a57,char a58)
{
  uint64_t v58;

  _Block_object_dispose(&a46, 8);
  _Block_object_dispose(&a54, 8);
  _Block_object_dispose(&a58, 8);
  _Block_object_dispose((const void *)(v58 - 232), 8);
  _Block_object_dispose((const void *)(v58 - 200), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC4498(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC4FA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC55C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC5B0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC5E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC6BBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC6E38(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCC7A10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCCA110(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__41(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__41(uint64_t a1)
{

}

void sub_1BBCCD32C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__42(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__42(uint64_t a1)
{

}

double *__SK_RGBtoHSV(double *result, double *a2, double *a3, double a4, double a5, double a6)
{
  double v6;
  float v7;
  double v8;
  double v9;
  float v10;
  float v11;
  double v12;
  double v13;
  BOOL v14;
  double v15;
  double v16;

  if (a4 >= a5)
    v6 = a4;
  else
    v6 = a5;
  if (v6 < a6)
    v6 = a6;
  v7 = v6;
  v8 = v7;
  *a3 = v7;
  if (v7 == 0.0)
  {
    *result = NAN;
    *a2 = 0.0;
    *a3 = 0.0;
  }
  else
  {
    if (a4 <= a5)
      v9 = a4;
    else
      v9 = a5;
    if (v9 > a6)
      v9 = a6;
    v10 = v9;
    v11 = v7 - v10;
    *a2 = (float)(v11 / v7);
    v12 = v11;
    if (v8 == a4)
    {
      v13 = (a5 - a6) / v12;
    }
    else
    {
      v14 = v8 == a5;
      v15 = (a4 - a5) / v12 + 4.0;
      v13 = (a6 - a4) / v12 + 2.0;
      if (!v14)
        v13 = v15;
    }
    v16 = v13 * 60.0;
    if (v16 < 0.0)
      v16 = v16 + 360.0;
    *result = v16;
  }
  return result;
}

void sub_1BBCD5ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCD6158(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCD73F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__43(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__43(uint64_t a1)
{

}

void sub_1BBCD8A64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void _SKUIOffscreenRenderOperationPopRenderingContext(_QWORD *a1, _QWORD *a2)
{
  NSObject *v4;
  id *v5;
  void *v6;
  id v7;
  uint64_t v8;
  id *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  _QWORD block[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15;
  v31 = __Block_byref_object_dispose__16;
  v32 = 0;
  v21 = 0;
  v22 = &v21;
  v23 = 0x3032000000;
  v24 = __Block_byref_object_copy__15;
  v25 = __Block_byref_object_dispose__16;
  v26 = 0;
  _SKUIOffscreenRenderOperationGetRendererStackAccessQueue();
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___SKUIOffscreenRenderOperationPopRenderingContext_block_invoke;
  block[3] = &unk_1E73A5580;
  block[4] = &v27;
  block[5] = &v21;
  dispatch_barrier_sync(v4, block);
  if (!v28[5] || !v22[5])
  {
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v5 = (id *)getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
    v36 = getkEAGLContextPropertyAcceleratedSymbolLoc_ptr;
    if (!getkEAGLContextPropertyAcceleratedSymbolLoc_ptr)
    {
      v6 = (void *)OpenGLESLibrary();
      v5 = (id *)dlsym(v6, "kEAGLContextPropertyAccelerated");
      v34[3] = (uint64_t)v5;
      getkEAGLContextPropertyAcceleratedSymbolLoc_ptr = (uint64_t)v5;
    }
    _Block_object_dispose(&v33, 8);
    if (!v5)
      goto LABEL_17;
    v7 = *v5;
    v37[0] = v7;
    v8 = MEMORY[0x1E0C9AAB0];
    v38[0] = MEMORY[0x1E0C9AAB0];
    v33 = 0;
    v34 = &v33;
    v35 = 0x2020000000;
    v9 = (id *)getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
    v36 = getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr;
    if (!getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr)
    {
      v10 = (void *)OpenGLESLibrary();
      v9 = (id *)dlsym(v10, "kEAGLContextPropertyClientRetainRelease");
      v34[3] = (uint64_t)v9;
      getkEAGLContextPropertyClientRetainReleaseSymbolLoc_ptr = (uint64_t)v9;
    }
    _Block_object_dispose(&v33, 8);
    if (!v9)
    {
LABEL_17:
      dlerror();
      abort_report_np();
      __break(1u);
    }
    v11 = *v9;
    v37[1] = v11;
    v38[1] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(objc_alloc((Class)getEAGLContextClass()), "initWithAPI:properties:", 3, v12);
    v14 = (void *)v22[5];
    v22[5] = v13;

    v15 = v22[5];
    if (!v15)
    {
      v16 = objc_msgSend(objc_alloc((Class)getEAGLContextClass()), "initWithAPI:properties:", 2, v12);
      v17 = (void *)v22[5];
      v22[5] = v16;

      v15 = v22[5];
    }
    objc_msgSend(MEMORY[0x1E0CD2820], "rendererWithEAGLContext:options:", v15, 0);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)v28[5];
    v28[5] = v18;

  }
  if (a2)
    *a2 = objc_retainAutorelease((id)v22[5]);
  if (a1)
    *a1 = objc_retainAutorelease((id)v28[5]);

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);

}

void sub_1BBCD8DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a16, 8);
  _Block_object_dispose(&a22, 8);
  _Unwind_Resume(a1);
}

id getEAGLContextClass()
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
  v0 = (void *)getEAGLContextClass_softClass;
  v7 = getEAGLContextClass_softClass;
  if (!getEAGLContextClass_softClass)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getEAGLContextClass_block_invoke;
    v3[3] = &unk_1E73A20C8;
    v3[4] = &v4;
    __getEAGLContextClass_block_invoke((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BBCD8EB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _SKUIglGetError()
{
  void *v0;
  void *v1;
  uint64_t v2;
  _Unwind_Exception *v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  void *v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v0 = getglGetErrorSymbolLoc_ptr;
  v8 = getglGetErrorSymbolLoc_ptr;
  if (!getglGetErrorSymbolLoc_ptr)
  {
    v1 = (void *)OpenGLESLibrary();
    v0 = dlsym(v1, "glGetError");
    v6[3] = (uint64_t)v0;
    getglGetErrorSymbolLoc_ptr = v0;
  }
  _Block_object_dispose(&v5, 8);
  if (!v0)
  {
    v4 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v5, 8);
    _Unwind_Resume(v4);
  }
  return ((uint64_t (*)(uint64_t))v0)(v2);
}

uint64_t _SKUIglBindFramebuffer(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getglBindFramebufferSymbolLoc_ptr;
  v9 = getglBindFramebufferSymbolLoc_ptr;
  if (!getglBindFramebufferSymbolLoc_ptr)
  {
    v3 = (void *)OpenGLESLibrary();
    v2 = dlsym(v3, "glBindFramebuffer");
    v7[3] = (uint64_t)v2;
    getglBindFramebufferSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(36160, a1);
}

void _SKUIOffscreenRenderOperationPushRenderingContext(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  NSObject *v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3 && v4)
  {
    _SKUIOffscreenRenderOperationGetRendererStackAccessQueue();
    v6 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = ___SKUIOffscreenRenderOperationPushRenderingContext_block_invoke;
    v7[3] = &unk_1E739FD10;
    v8 = v3;
    v9 = v5;
    dispatch_barrier_async(v6, v7);

  }
}

void *__Block_byref_object_copy__44(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__44(uint64_t a1)
{

}

uint64_t IOSurfaceLibrary()
{
  uint64_t v0;
  void *v2;

  if (!IOSurfaceLibraryCore_frameworkLibrary)
    IOSurfaceLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = IOSurfaceLibraryCore_frameworkLibrary;
  if (!IOSurfaceLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

uint64_t OpenGLESLibrary()
{
  uint64_t v0;
  void *v2;

  if (!OpenGLESLibraryCore_frameworkLibrary)
    OpenGLESLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = OpenGLESLibraryCore_frameworkLibrary;
  if (!OpenGLESLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getEAGLContextClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  OpenGLESLibrary();
  result = objc_getClass("EAGLContext");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getEAGLContextClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getEAGLContextClass_block_invoke_cold_1();
    return (Class)_SKUIglBindTexture(v3);
  }
  return result;
}

uint64_t _SKUIglBindTexture(uint64_t a1)
{
  void *v2;
  void *v3;
  _Unwind_Exception *v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = getglBindTextureSymbolLoc_ptr;
  v9 = getglBindTextureSymbolLoc_ptr;
  if (!getglBindTextureSymbolLoc_ptr)
  {
    v3 = (void *)OpenGLESLibrary();
    v2 = dlsym(v3, "glBindTexture");
    v7[3] = (uint64_t)v2;
    getglBindTextureSymbolLoc_ptr = v2;
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v5 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v5);
  }
  return ((uint64_t (*)(uint64_t, uint64_t))v2)(3553, a1);
}

uint64_t _SKUIglTexParameteri(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v4 = getglTexParameteriSymbolLoc_ptr;
  v11 = getglTexParameteriSymbolLoc_ptr;
  if (!getglTexParameteriSymbolLoc_ptr)
  {
    v5 = (void *)OpenGLESLibrary();
    v4 = dlsym(v5, "glTexParameteri");
    v9[3] = (uint64_t)v4;
    getglTexParameteriSymbolLoc_ptr = v4;
  }
  _Block_object_dispose(&v8, 8);
  if (!v4)
  {
    v7 = (_Unwind_Exception *)getCNComposeRecipientViewDidChangeNotification_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))v4)(3553, a1, a2);
}

id _SKUIOffscreenRenderOperationGetRendererStackAccessQueue()
{
  if (_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken != -1)
    dispatch_once(&_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sOnceToken, &__block_literal_global_78);
  return (id)_SKUIOffscreenRenderOperationGetRendererStackAccessQueue_sRendererStacAccessQueue;
}

void sub_1BBCDB954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,char a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,char a57)
{
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose(&a45, 8);
  _Block_object_dispose(&a51, 8);
  _Block_object_dispose(&a57, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__45(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__45(uint64_t a1)
{

}

void SKUINavigationBarController_SetTitleView(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  objc_method *InstanceMethod;
  IMP Implementation;
  id v7;

  v3 = a2;
  v7 = a1;
  v4 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v4, sel_setTitleView_);
  Implementation = method_getImplementation(InstanceMethod);
  ((void (*)(id, char *, id))Implementation)(v7, sel_setTitleView_, v3);

}

void sub_1BBCDFFC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__n128 _SKUIIndexBarControlInitialization(void *a1)
{
  id v1;
  void *v2;
  __n128 result;

  v1 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    _SKUIIndexBarControlInitialization_cold_1();
  }
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBackgroundColor:", v2);

  objc_msgSend(v1, "setContentMode:", 3);
  objc_msgSend(v1, "setDeliversTouchesForGesturesToSuperview:", 0);
  objc_msgSend(v1, "setExclusiveTouch:", 1);
  *((_OWORD *)v1 + 37) = xmmword_1BBED1E70;
  *((_OWORD *)v1 + 38) = xmmword_1BBED1E70;
  *((_BYTE *)v1 + 489) = 1;
  *((_BYTE *)v1 + 490) = 1;
  *((_BYTE *)v1 + 491) = 1;
  *((_BYTE *)v1 + 492) = 1;
  __asm { FMOV            V0.2D, #-3.0 }
  *((_OWORD *)v1 + 39) = _Q0;
  *((_OWORD *)v1 + 40) = _Q0;

  return result;
}

void sub_1BBCE21C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE24D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__46(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{

}

void sub_1BBCE2654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE2EBC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE3710(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE388C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE3A20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE3BB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE3E08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCE9DDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__47(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__47(uint64_t a1)
{

}

void sub_1BBCEA378(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIGetFamilyMemberImage(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  BOOL v19;
  int v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v11 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v11)
        SKUIGetFamilyMemberImage_cold_1(v11, v12, v13, v14, v15, v16, v17, v18);
    }
  }
  if (v7)
    v19 = v8 == 0;
  else
    v19 = 1;
  v20 = !v19;
  if (v19 && !v9 && !v10)
    goto LABEL_17;
  v21 = SKUIAppleAccountUIFramework();
  v22 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("AAUIProfilePictureStore"), v21));
  objc_msgSend(v22, "setPictureStyle:", 0);
  objc_msgSend(v22, "setPictureDiameter:", 60.0);
  if (!v22)
    goto LABEL_17;
  v23 = SKUIAppleAccountFramework();
  v24 = objc_alloc_init((Class)SKUIWeakLinkedClassForString(CFSTR("AAFamilyMember"), v23));
  objc_msgSend(v24, "setFirstName:", v7);
  objc_msgSend(v24, "setLastName:", v8);
  objc_msgSend(v24, "setPersonID:", v10);
  objc_msgSend(v24, "setAppleID:", v9);
  objc_msgSend(v22, "profilePictureForFamilyMember:", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v25)
  {
LABEL_17:
    v26 = SKUIContactsUIFramework();
    v27 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("CNMonogrammer"), v26)), "initWithStyle:diameter:", 0, 60.0);
    v28 = v27;
    if (v20)
      objc_msgSend(v27, "monogramForPersonWithFirstName:lastName:", v7, v8);
    else
      objc_msgSend(v27, "silhouetteMonogram");
    v25 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v25;
}

void sub_1BBCED3F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCEE5F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BBCEF7A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCF05AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCF295C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBCF2B50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF2D34(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF304C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF3578(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__48(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__48(uint64_t a1)
{

}

void sub_1BBCF4440(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBCF4C44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id __RequestImage(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "resourceName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    objc_msgSend(v4, "requestIdentifierForViewElement:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend(v4, "resourceLoader");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "cachedResourceForRequestIdentifier:", objc_msgSend(v9, "unsignedIntegerValue"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v12 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(v4, "transientRequestIdentifierForViewElement:", v3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v4, "resourceLoader");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "cachedResourceForRequestIdentifier:", objc_msgSend(v14, "unsignedIntegerValue"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v7 = 0;
      }
      objc_msgSend(v4, "dataConsumerForImageElement:", v3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "loadImageForImageElement:reason:dataConsumer:", v3, 1, v12);

      if (v7)
        goto LABEL_20;
      if (v12)
        goto LABEL_16;
    }
    objc_msgSend(v4, "dataConsumerForImageElement:", v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_16:
    objc_msgSend(v4, "loadImageForImageElement:reason:dataConsumer:", v3, 1, v12);
    objc_msgSend(v3, "style");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "imageTreatment");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = SKUIImageTreatmentForString(v17);

    if (v18 == 7 || !objc_msgSend(v12, "isImagePlaceholderAvailable"))
    {
      objc_msgSend(v4, "placeholderImageForImageElement:dataConsumer:", v3, v12);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v3, "style");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "imagePlaceholderBackgroundColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "color");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v12, "imagePlaceholderForColor:", v21);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_20;
  }
  SKUIImageWithResourceName(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "style");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "imageMaskColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "color");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v9, "color");
    else
      objc_msgSend(v4, "tintColor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_flatImageWithColor:", v12);
    v13 = objc_claimAutoreleasedReturnValue();

    v7 = (void *)v13;
    goto LABEL_20;
  }
LABEL_21:

  return v7;
}

void sub_1BBD01F78(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD02DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id a23)
{
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_destroyWeak(location);
  objc_destroyWeak(&a23);
  objc_destroyWeak((id *)(v24 - 160));
  _Unwind_Resume(a1);
}

void sub_1BBD02FD0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBD03BB0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void SKUIConfigureDownloadsCellView(void *a1, void *a2, void *a3, unsigned int a4, void *a5)
{
  id v8;
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v43[2];
  _QWORD v44[2];
  uint64_t v45;
  uint64_t v46;
  _QWORD v47[3];

  v47[2] = *MEMORY[0x1E0C80C00];
  v8 = a2;
  v40 = a5;
  v41 = a3;
  v9 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        SKUIConfigureDownloadsCellView_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  v45 = *MEMORY[0x1E0DC1138];
  v18 = v45;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v47[0] = v19;
  v46 = *MEMORY[0x1E0DC1140];
  v20 = v46;
  objc_msgSend(MEMORY[0x1E0DC3658], "_labelColor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v47[1] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v47, &v45, 2);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  v43[0] = v18;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 12.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v20;
  v44[0] = v23;
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v24;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, v43, 2);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = objc_alloc_init(MEMORY[0x1E0CB3778]);
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF9F8]);
  v27 = objc_claimAutoreleasedReturnValue();
  if (v27)
  {
    v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v27, v22);
    objc_msgSend(v26, "appendAttributedString:", v28);

  }
  v39 = (void *)v27;
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF8D8]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  if (v29)
  {
    v30 = objc_alloc(MEMORY[0x1E0CB3498]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" – %@"), v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = (void *)objc_msgSend(v30, "initWithString:attributes:", v31, v25);
    objc_msgSend(v26, "appendAttributedString:", v32);

  }
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF928]);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForProperty:", *MEMORY[0x1E0DAF910]);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v34, "BOOLValue"))
    v35 = objc_msgSend(v33, "isEqual:", *MEMORY[0x1E0DAF890]);
  else
    v35 = 0;

  if ((objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0DAF8A0]) & 1) != 0)
  {
    v36 = 2;
  }
  else if (objc_msgSend(v33, "isEqualToString:", *MEMORY[0x1E0DAF8C0]))
  {
    v36 = 2;
  }
  else
  {
    v36 = v35;
  }
  objc_msgSend(v9, "setAttributedTitle:", v26);
  SKUIDownloadsStatusString(v8, v40);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "setSubtitle:", v37);
  objc_msgSend(v8, "valueForExternalProperty:", *MEMORY[0x1E0DAF7F0]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "doubleValue");
  objc_msgSend(v9, "setProgress:");

  objc_msgSend(v9, "setImage:", v41);
  objc_msgSend(v9, "setButtonType:", v36);
  objc_msgSend(v9, "setIsPad:", a4);

}

id SKUIDownloadsStatusString(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  const __CFString *v14;
  void *v15;
  int v16;
  const __CFString *v17;
  uint64_t v18;
  void *v19;
  id v20;
  void *v21;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  double v28;
  double v29;
  BOOL v30;
  const __CFString *v31;
  const __CFString *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  const __CFString *v45;
  uint64_t v46;
  void *v47;
  const __CFString *v48;
  void *v49;
  void *v50;
  void *v51;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIDownloadsStatusString_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0DAF928]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF8A0]))
  {
    objc_msgSend(v3, "valueForProperty:", *MEMORY[0x1E0DAF940]);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "BOOLValue");

    if (v16)
    {
      if (v4)
      {
        v14 = CFSTR("RESTRICTED");
        goto LABEL_18;
      }
      v17 = CFSTR("RESTRICTED");
LABEL_24:
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v17, 0, CFSTR("Download"));
      v18 = objc_claimAutoreleasedReturnValue();
      goto LABEL_25;
    }
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF8C0]))
    {
      if (v4)
      {
        v14 = CFSTR("TAP_TO_RESUME");
        goto LABEL_18;
      }
      v17 = CFSTR("TAP_TO_RESUME");
      goto LABEL_24;
    }
    if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF8D0]))
    {
      if (v4)
      {
        v14 = CFSTR("WAITING");
        goto LABEL_18;
      }
      v17 = CFSTR("WAITING");
      goto LABEL_24;
    }
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x1E0DAF7F8]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      v20 = v19;
LABEL_47:
      v21 = v20;
LABEL_48:

      goto LABEL_26;
    }
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0DAF890]) & 1) == 0)
      goto LABEL_38;
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x1E0DAF7D8]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = objc_msgSend(v23, "longLongValue");

    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x1E0DAF7E0]);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v25, "longLongValue");

    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x1E0DAF7F0]);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "doubleValue");
    v29 = v28;

    v30 = v24 < 1 || v26 < 1;
    if (v30 && v29 < 0.01)
    {
      if (v4)
      {
        v31 = CFSTR("UNKNOWN_PROGRESS");
LABEL_40:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v31, CFSTR("Download"));
        v20 = (id)objc_claimAutoreleasedReturnValue();
        goto LABEL_47;
      }
      v32 = CFSTR("UNKNOWN_PROGRESS");
      goto LABEL_46;
    }
    if (v24 >= v26 && v29 >= 1.0)
    {
LABEL_38:
      if (v4)
      {
        v31 = CFSTR("PROCESSING_DOWNLOAD");
        goto LABEL_40;
      }
      v32 = CFSTR("PROCESSING_DOWNLOAD");
LABEL_46:
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v32, 0, CFSTR("Download"));
      v20 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_47;
    }
    objc_msgSend(v3, "valueForExternalProperty:", *MEMORY[0x1E0DAF7E8]);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "doubleValue");
    v35 = v34;

    if (v35 < 0.0)
    {
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v24, 1);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v26, 0);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("DATA_PROGRESS"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("DATA_PROGRESS"), 0, CFSTR("Download"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v40, CFSTR("%@%@"), 0, v36, v37);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_48;
    }
    v38 = v24 & ~(v24 >> 63);
    if (v38 <= v26)
      v39 = v26;
    else
      v39 = v24 & ~(v24 >> 63);
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("TIME_FORMAT"), CFSTR("Download"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("TIME_FORMAT"), 0, CFSTR("Download"));
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v41, CFSTR("%d%d"), 0, v35 / 0x3CuLL, v35 % 0x3C);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    if (v24 < 1 || !v39)
    {
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:inTable:", CFSTR("PERCENTAGE_PROGRESS"), CFSTR("Download"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("PERCENTAGE_PROGRESS"), 0, CFSTR("Download"));
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v47, CFSTR("%ld%@"), 0, (uint64_t)(v29 * 100.0), v42);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_73;
    }
    v51 = v41;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = objc_msgSend(v43, "userInterfaceIdiom");

    if ((v44 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      if (v4)
      {
        v45 = CFSTR("TIME_PROGRESS_LONG");
LABEL_66:
        objc_msgSend(v4, "localizedStringForKey:inTable:", v45, CFSTR("Download"));
        v46 = objc_claimAutoreleasedReturnValue();
LABEL_72:
        v47 = (void *)v46;
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v38, 1);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB34E8], "stringFromByteCount:countStyle:", v39, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v47, CFSTR("%@%@%@"), 0, v49, v50, v42);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        v41 = v51;
LABEL_73:

        goto LABEL_48;
      }
      v48 = CFSTR("TIME_PROGRESS_LONG");
    }
    else
    {
      if (v4)
      {
        v45 = CFSTR("TIME_PROGRESS");
        goto LABEL_66;
      }
      v48 = CFSTR("TIME_PROGRESS");
    }
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", v48, 0, CFSTR("Download"));
    v46 = objc_claimAutoreleasedReturnValue();
    goto LABEL_72;
  }
  if (!v4)
  {
    v17 = CFSTR("DOWNLOAD_ERROR");
    goto LABEL_24;
  }
  v14 = CFSTR("DOWNLOAD_ERROR");
LABEL_18:
  objc_msgSend(v4, "localizedStringForKey:inTable:", v14, CFSTR("Download"));
  v18 = objc_claimAutoreleasedReturnValue();
LABEL_25:
  v21 = (void *)v18;
LABEL_26:

  return v21;
}

void sub_1BBD07B60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD07DD4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__49(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__49(uint64_t a1)
{

}

void *__Block_byref_object_copy__50(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__50(uint64_t a1)
{

}

void sub_1BBD0DCC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD0E3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD0E764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD0E968(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__51(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__51(uint64_t a1)
{

}

id SKUIReuseIdentifierForView(void *a1)
{
  return objc_getAssociatedObject(a1, "com.apple.StoreKitUI.viewReuse.ID");
}

void sub_1BBD0FEFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD143BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD14898(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD15634(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD15B4C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 80), 8);
  _Unwind_Resume(a1);
}

id SKUIFontForTextStyle(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIFontForTextStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  _SKUIFontDescriptorGetFontForTextStyle(a1, (void *)*MEMORY[0x1E0DC4918]);
  return (id)objc_claimAutoreleasedReturnValue();
}

id _SKUIFontDescriptorGetFontForTextStyle(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  double v6;
  char v7;
  uint64_t *v8;
  uint64_t v9;
  id v10;
  _SKUIFontDescriptorCacheKey *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  float v22;
  float v23;
  void *v24;
  _QWORD v26[2];
  _QWORD v27[2];
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1 - 1;
  v5 = 0;
  v6 = 1.0;
  v7 = 1;
  v8 = (uint64_t *)MEMORY[0x1E0CA8620];
  switch(v4)
  {
    case 0:
      goto LABEL_34;
    case 1:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8660];
      goto LABEL_34;
    case 2:
      v5 = 0;
      goto LABEL_7;
    case 3:
      v7 = 0;
      v5 = 0x8000;
LABEL_7:
      v8 = (uint64_t *)MEMORY[0x1E0CA8628];
      goto LABEL_34;
    case 4:
      v5 = 0;
      goto LABEL_10;
    case 5:
      v7 = 0;
      v5 = 0x8000;
LABEL_10:
      v8 = (uint64_t *)MEMORY[0x1E0CA8630];
      goto LABEL_34;
    case 6:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8668];
      goto LABEL_34;
    case 7:
      v5 = 0;
      goto LABEL_14;
    case 8:
      v7 = 0;
      v5 = 0x8000;
LABEL_14:
      v8 = (uint64_t *)MEMORY[0x1E0CA8638];
      goto LABEL_34;
    case 9:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8638];
      v6 = 0.909090909;
      goto LABEL_34;
    case 10:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8640];
      goto LABEL_34;
    case 11:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8670];
      goto LABEL_34;
    case 12:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      goto LABEL_34;
    case 13:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8678];
      goto LABEL_34;
    case 14:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8698];
      goto LABEL_34;
    case 15:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8688];
      goto LABEL_34;
    case 16:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8680];
      goto LABEL_34;
    case 17:
      v5 = 0;
      goto LABEL_25;
    case 18:
    case 19:
      v7 = 0;
      v5 = 0x8000;
      goto LABEL_25;
    case 20:
      v7 = 0;
      v5 = 0x10000;
LABEL_25:
      v8 = (uint64_t *)MEMORY[0x1E0CA8688];
      v6 = 0.933333333;
      goto LABEL_34;
    case 21:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      v6 = 2.05882353;
      goto LABEL_34;
    case 22:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      v6 = 1.35294118;
      goto LABEL_34;
    case 23:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      v6 = 1.29411765;
      goto LABEL_34;
    case 24:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      v6 = 1.17647059;
      goto LABEL_34;
    case 25:
      v5 = 0;
      goto LABEL_31;
    case 26:
    case 27:
      v7 = 0;
      v5 = 0x8000;
LABEL_31:
      v8 = (uint64_t *)MEMORY[0x1E0CA8650];
      v6 = 1.05882353;
      goto LABEL_34;
    case 28:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA86A8];
      goto LABEL_34;
    case 29:
      v5 = 0;
      v8 = (uint64_t *)MEMORY[0x1E0CA86B0];
LABEL_34:
      v9 = *v8;
      if (!*v8)
        goto LABEL_44;
      if (_SKUIFontDescriptorGetCache_onceToken != -1)
        dispatch_once(&_SKUIFontDescriptorGetCache_onceToken, &__block_literal_global_34);
      v10 = (id)_SKUIFontDescriptorGetCache_fontDescriptorCache;
      v11 = -[_SKUIFontDescriptorCacheKey initWithTextStyle:sizeCategory:]([_SKUIFontDescriptorCacheKey alloc], "initWithTextStyle:sizeCategory:", v9, v3);
      objc_msgSend(v10, "objectForKey:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v12)
      {
        v13 = (void *)CTFontDescriptorCreateWithTextStyle();
        v14 = v13;
        if ((v7 & 1) == 0)
        {
          objc_msgSend(v13, "fontDescriptorWithSymbolicTraits:", v5);
          v15 = objc_claimAutoreleasedReturnValue();

          v14 = (void *)v15;
        }
        v29 = *MEMORY[0x1E0DC1380];
        v16 = *MEMORY[0x1E0DC13D0];
        v26[0] = *MEMORY[0x1E0DC13D8];
        v26[1] = v16;
        v27[0] = &unk_1E749B660;
        v27[1] = &unk_1E749B678;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v28, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v30[0] = v18;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "fontDescriptorByAddingAttributes:", v19);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v10, "setObject:forKey:", v12, v11);
      }
      v20 = 0.0;
      if (fabs(v6) >= 2.22044605e-16)
      {
        objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0DC1390]);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "floatValue");
        v23 = v6 * v22;
        v20 = ceilf(v23);

      }
      objc_msgSend(MEMORY[0x1E0DC1350], "fontWithDescriptor:size:", v12, v20);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
LABEL_44:
      v24 = 0;
      break;
  }

  return v24;
}

id SKUIFontLimitedPreferredFontForTextStyle(uint64_t a1, uint64_t a2)
{
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  char v16;
  id *v17;
  uint64_t v18;
  id v19;
  uint64_t i;
  void *v21;
  _QWORD v23[14];

  v23[13] = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v4)
        SKUIFontLimitedPreferredFontForTextStyle_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "preferredContentSizeCategory");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v13;
  v15 = (void *)*MEMORY[0x1E0DC4918];
  v16 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC4918]);
  v17 = (id *)MEMORY[0x1E0DC4920];
  if ((v16 & 1) != 0)
  {
    v18 = 4;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC4920]) & 1) != 0)
  {
    v18 = 3;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC4900]) & 1) != 0)
  {
    v18 = 5;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC4930]) & 1) != 0)
  {
    v18 = 2;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48F8]) & 1) != 0)
  {
    v18 = 6;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48F0]) & 1) != 0)
  {
    v18 = 7;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC4908]) & 1) != 0)
  {
    v18 = 1;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48D8]) & 1) != 0)
  {
    v18 = 8;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48D0]) & 1) != 0)
  {
    v18 = 9;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48C8]) & 1) != 0)
  {
    v18 = 10;
  }
  else if ((objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48C0]) & 1) != 0)
  {
    v18 = 11;
  }
  else if (objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0DC48B8]))
  {
    v18 = 12;
  }
  else
  {
    v18 = 4;
  }

  if (v18 <= a2)
  {
    v19 = v14;
  }
  else
  {
    v23[0] = 0;
    v23[1] = (id)*MEMORY[0x1E0DC4908];
    v23[2] = (id)*MEMORY[0x1E0DC4930];
    v23[3] = *v17;
    v23[4] = v15;
    v23[5] = (id)*MEMORY[0x1E0DC4900];
    v23[6] = (id)*MEMORY[0x1E0DC48F8];
    v23[7] = (id)*MEMORY[0x1E0DC48F0];
    v23[8] = (id)*MEMORY[0x1E0DC48D8];
    v23[9] = (id)*MEMORY[0x1E0DC48D0];
    v23[10] = (id)*MEMORY[0x1E0DC48C8];
    v23[11] = (id)*MEMORY[0x1E0DC48C0];
    v23[12] = (id)*MEMORY[0x1E0DC48B8];
    v19 = (id)v23[a2];
    for (i = 12; i != -1; --i)

  }
  _SKUIFontDescriptorGetFontForTextStyle(a1, v19);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  return v21;
}

id SKUIFontPreferredFontForTextStyle(uint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIFontPreferredFontForTextStyle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  _SKUIFontDescriptorGetFontForTextStyle(a1, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void sub_1BBD1B340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__52(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__52(uint64_t a1)
{

}

void sub_1BBD1C234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUIButtonViewTypeForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIButtonViewTypeForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("buy")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("download")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("link")) & 1) != 0)
  {
    v10 = 7;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("image")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("imagetext")) & 1) != 0)
  {
    v10 = 6;
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("textonly")) & 1) != 0)
      goto LABEL_16;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("done")) & 1) != 0)
    {
      v10 = 8;
      goto LABEL_33;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("sample")) & 1) != 0)
    {
      v10 = 4;
      goto LABEL_33;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("back")) & 1) != 0)
    {
      v10 = 1;
      goto LABEL_33;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("cancel")) & 1) != 0)
    {
      v10 = 10;
      goto LABEL_33;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("destructive")) & 1) != 0)
    {
      v10 = 11;
      goto LABEL_33;
    }
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("disabled")) & 1) != 0)
    {
LABEL_16:
      v10 = 9;
    }
    else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("play")) & 1) != 0)
    {
      v10 = 12;
    }
    else if (objc_msgSend(v1, "isEqualToString:", CFSTR("thin")))
    {
      v10 = 13;
    }
    else
    {
      v10 = 0;
    }
  }
LABEL_33:

  return v10;
}

void sub_1BBD1C654(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v7;
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v7 - 48), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__53(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__53(uint64_t a1)
{

}

BOOL SKUIIKViewElementTypeIsButton(unint64_t a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BOOL8 result;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIIKViewElementTypeIsButton_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  result = 1;
  if (a1 > 0x32 || ((1 << a1) & 0x4000000003000) == 0)
    return a1 == 141;
  return result;
}

void sub_1BBD1D56C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD21C9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD224EC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD22ABC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD2390C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__54(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__54(uint64_t a1)
{

}

void SKUIInitializeViewElementStyleFactory()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    SKUIInitializeViewElementStyleFactory_cold_1();
  }
  if (SKUIInitializeViewElementStyleFactory___onceToken != -1)
    dispatch_once(&SKUIInitializeViewElementStyleFactory___onceToken, &__block_literal_global_36);
}

void sub_1BBD25160(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__55(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__55(uint64_t a1)
{

}

void sub_1BBD28688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_1BBD29B3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  uint64_t v8;
  va_list va;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a7);
  va_start(va, a7);
  v8 = va_arg(va1, _QWORD);
  v10 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__56(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__56(uint64_t a1)
{

}

void sub_1BBD2AC54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD2B14C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__57(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__57(uint64_t a1)
{

}

void sub_1BBD2B284(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD2B3E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD30854(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIWishlistItemPropertiesWithItem(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIWishlistItemPropertiesWithItem_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "cacheRepresentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB36D8], "dataWithJSONObject:options:error:", v10, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v11, *MEMORY[0x1E0DAFDB8]);
    v13 = objc_msgSend(v1, "itemIdentifier");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKey:", v14, *MEMORY[0x1E0DAFDC0]);

    objc_msgSend(v1, "itemKindString");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
      objc_msgSend(v12, "setObject:forKey:", v15, *MEMORY[0x1E0DAFDC8]);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

id SKUIWishlistOperationQueue()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        SKUIWishlistOperationQueue_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  v8 = (void *)SKUIWishlistOperationQueue_sQueue;
  if (!SKUIWishlistOperationQueue_sQueue)
  {
    v9 = objc_alloc_init(MEMORY[0x1E0CB3828]);
    v10 = (void *)SKUIWishlistOperationQueue_sQueue;
    SKUIWishlistOperationQueue_sQueue = (uint64_t)v9;

    objc_msgSend((id)SKUIWishlistOperationQueue_sQueue, "setMaxConcurrentOperationCount:", 1);
    objc_msgSend((id)SKUIWishlistOperationQueue_sQueue, "setName:", CFSTR("com.apple.StoreKitUI.SSWishlist"));
    v8 = (void *)SKUIWishlistOperationQueue_sQueue;
  }
  return v8;
}

void sub_1BBD30CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD31D74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,id location)
{
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD33250(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD33314(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBD33618(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD33704(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBD339C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUITracklistAttributedStringForButton(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v4 = a2;
  v5 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v6 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v6)
        SKUITracklistAttributedStringForButton_cold_1(v6, v7, v8, v9, v10, v11, v12, v13);
    }
  }
  objc_msgSend(v4, "buttonTitleStyle");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v14)
  {
    v16 = v14;
  }
  else
  {
    objc_msgSend(v4, "style");
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }
  v17 = v16;

  SKUIViewElementFontWithStyle(v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "fontWithName:size:", CFSTR("HelveticaNeue-Medium"), 9.0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v5, "tintColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementPlainColorWithStyle(v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v4, "buttonText");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "attributedStringWithDefaultFont:foregroundColor:textAlignment:style:", v18, v20, 1, v17);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

id SKUITracklistAttributedStringForLabel(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUITracklistAttributedStringForLabel_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v6, "style");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  SKUIViewElementFontWithStyle(v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "tintColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  SKUIViewElementPlainColorWithStyle(v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 && !v19)
  {
    if ((objc_msgSend(v5, "isEnabled") & 1) != 0)
    {
      v19 = 0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.5);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  v20 = objc_msgSend(v6, "labelViewStyle");
  if (v20 > 5)
    goto LABEL_25;
  if (((1 << v20) & 0xB) != 0)
  {
    if (!v17)
    {
      SKUIFontPreferredFontForTextStyle(5);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v19)
        goto LABEL_18;
      goto LABEL_25;
    }
  }
  else
  {
    if (((1 << v20) & 0x24) == 0)
    {
      if (!v17)
      {
        SKUIFontPreferredFontForTextStyle(5);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (!v19)
      {
        objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.8);
        v21 = objc_claimAutoreleasedReturnValue();
        goto LABEL_19;
      }
      goto LABEL_25;
    }
    if (!v17)
    {
      SKUIFontForTextStyle(21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = (void *)MEMORY[0x1E0DC1350];
      objc_msgSend(v22, "pointSize");
      objc_msgSend(v23, "fontWithName:size:", CFSTR("HelveticaNeue-Medium"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v19)
        goto LABEL_25;
      goto LABEL_18;
    }
  }
  if (!v19)
  {
LABEL_18:
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v21 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v19 = (void *)v21;
  }
LABEL_25:
  objc_msgSend(v6, "text");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "attributedStringWithDefaultFont:foregroundColor:style:", v17, v19, v16);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

void sub_1BBD34334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD3511C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__58(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__58(uint64_t a1)
{

}

void sub_1BBD35360(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD35644(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  uint64_t v15;
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD35A6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD36674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUITabBarControllerGetActiveNavigationController(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  id v9;
  void *v10;
  char isKindOfClass;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  void *v24;

  v1 = a1;
  objc_msgSend(v1, "selectedViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "transientViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    if (!v2)
    {
      v9 = 0;
      goto LABEL_22;
    }
    SKUITabBarControllerGetMoreNavigationController(v1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "allViewControllers");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v5
      && (v8 = objc_msgSend(v6, "indexOfObjectIdenticalTo:", v2), v8 >= objc_msgSend(v7, "indexOfObjectIdenticalTo:", v5)))
    {
      v21 = v5;
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v9 = v2;
        objc_msgSend(v9, "visibleViewController");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) != 0)
        {
          objc_msgSend(v9, "visibleViewController");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "childViewController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_opt_class();
          v14 = objc_opt_isKindOfClass();

          if ((v14 & 1) != 0)
          {
            objc_msgSend(v12, "childViewController");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "leftNavigationDocumentController");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "navigationController");
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v15, "rightNavigationDocumentController");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "navigationController");
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            v19 = v18;
            if (v18 || (v19 = v24) != 0)
            {
              v20 = v19;

              v9 = v20;
            }

          }
        }
        goto LABEL_21;
      }
      objc_msgSend(v2, "navigationController");
      v21 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v21;
LABEL_21:

    goto LABEL_22;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(v3, "navigationController");
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v4;
LABEL_22:
  v22 = v9;

  return v22;
}

id SKUITabBarControllerGetMoreNavigationController(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "moreNavigationController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SKUITabBarControllerGetFloatingOverlayViewController(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v1, "floatingOverlayViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void SKUITabBarControllerSetFloatingOverlayViewControllerAnimated(void *a1, void *a2, uint64_t a3)
{
  id v5;
  id v6;

  v6 = a1;
  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "setFloatingOverlayViewController:animated:", v5, a3);
  }
  else if (v6 && v5)
  {
    NSLog(CFSTR("Error: trying to set a floating overlay view controller on a type of tab bar controller that doesn't support it: %@"), v6);
  }

}

void sub_1BBD3D1E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD3F3EC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD3FB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__59(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__59(uint64_t a1)
{

}

void sub_1BBD42298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, char a17)
{
  _Unwind_Resume(exception_object);
}

uint64_t __Block_byref_object_copy__60(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__60(uint64_t a1)
{

}

void sub_1BBD43208(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD43974(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_1BBD43AD4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void AnalyzedImageColors::AnalyzedImageColors(AnalyzedImageColors *this)
{
  ITColor *v2;

  ITColor::ITColor((ITColor *)this);
  ITColor::ITColor(v2 + 1);
  ITColor::ITColor((ITColor *)this + 2);
  ITColor::ITColor((ITColor *)this + 3);
  ITColor::ITColor((ITColor *)this + 4);
  ITColor::ITColor((ITColor *)this + 5);
  ITColor::ITColor((ITColor *)this + 6);
  ITColor::ITColor((ITColor *)this + 7);
  ITColor::ITColor((ITColor *)this + 8);
  *(_QWORD *)((char *)this + 293) = 0;
  *((_QWORD *)this + 36) = 0;
}

void sub_1BBD44748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__61(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__61(uint64_t a1)
{

}

void sub_1BBD4489C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

__CFString *SKUIShareSheetActivityTypeForUIActivityType(void *a1)
{
  id v1;
  __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB1B0]) & 1) != 0)
  {
    v2 = CFSTR("airdrop");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB1F0]) & 1) != 0)
  {
    v2 = CFSTR("facebook");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB1D0]) & 1) != 0)
  {
    v2 = CFSTR("mail");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB1E0]) & 1) != 0)
  {
    v2 = CFSTR("message");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB1C0]) & 1) != 0)
  {
    v2 = CFSTR("pasteboard");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB218]) & 1) != 0)
  {
    v2 = CFSTR("sina-weibo");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0CEB200]) & 1) != 0)
  {
    v2 = CFSTR("tencent-weibo");
  }
  else
  {
    v2 = (__CFString *)v1;
  }

  return v2;
}

void sub_1BBD4758C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD479FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD48DE4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD49044(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD4B8B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__62(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__62(uint64_t a1)
{

}

void sub_1BBD4DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,char a43)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a43, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__63(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__63(uint64_t a1)
{

}

void sub_1BBD4E11C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD4E6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD4E9B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

id SKUIStringFromProductLockupLayoutSizing(CGSize *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIStringFromProductLockupLayoutSizing_cold_1();
  }
  v2 = (void *)MEMORY[0x1E0CB3940];
  NSStringFromCGSize(a1[3]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[4]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[2]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(*a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromCGSize(a1[1]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("{ Top-Left: %@, Top-Right: %@, Middle-Left: %@, Bottom-Left: %@, Bottom-Right: %@ }"), v3, v4, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1BBD4F4A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD4F714(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BBD4FF3C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD50418(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BBD52A30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD531F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__64(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__64(uint64_t a1)
{

}

void sub_1BBD547D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD54A14(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD54E38(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

void sub_1BBD550A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD5554C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD55728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIViewControllerIsVisible(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "isViewLoaded"))
  {
    objc_msgSend(v1, "view");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = objc_msgSend(v2, "isHidden") ^ 1;
  else
    v4 = 0;

  return v4;
}

id SKUIViewControllerGetAncestorTabBarController(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "tabBarController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "conformsToProtocol:", &unk_1EF468608))
  {
    v3 = v2;
  }
  else
  {
    v3 = v1;
    do
    {
      v4 = v3;
      objc_msgSend(v3, "parentViewController");
      v3 = (id)objc_claimAutoreleasedReturnValue();

    }
    while (v3 && !objc_msgSend(v3, "conformsToProtocol:", &unk_1EF468608));
  }

  return v3;
}

id SKUIViewControllerGetTopMostViewController(void *a1)
{
  id i;
  uint64_t v2;

  for (i = a1; ; i = (id)v2)
  {
    objc_msgSend(i, "presentedViewController");
    v2 = objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0
        || (objc_msgSend(i, "topViewController"), (v2 = objc_claimAutoreleasedReturnValue()) == 0))
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
          break;
        objc_msgSend(i, "focusedViewController");
        v2 = objc_claimAutoreleasedReturnValue();
        if (!v2)
          break;
      }
    }

  }
  return i;
}

BOOL SKUIViewControllerIsDescendent(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = v5;
  v7 = v5;
  if (v5)
  {
    v7 = v5;
    if (v5 != v4)
    {
      v7 = v5;
      do
      {
        v8 = v7;
        objc_msgSend(v7, "parentViewController");
        v7 = (id)objc_claimAutoreleasedReturnValue();

      }
      while (v7 && v7 != v4);
    }
  }

  return v7 == v4;
}

void sub_1BBD5A3A4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD5B22C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD5BBE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  uint64_t v15;
  va_list va;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  va_list va1;

  va_start(va1, a13);
  va_start(va, a13);
  v15 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  v19 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__65(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__65(uint64_t a1)
{

}

void sub_1BBD5BFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD5C304(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD5F8D4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD61A80(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD6252C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__66(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__66(uint64_t a1)
{

}

void sub_1BBD628C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD62D20(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD638C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__67(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__67(uint64_t a1)
{

}

void sub_1BBD65FFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

uint64_t __Block_byref_object_copy__5_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6_0(uint64_t a1)
{

}

void sub_1BBD66470(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD6A424(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD6BFD8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 168));
  _Unwind_Resume(a1);
}

void sub_1BBD6CB54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__68(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__68(uint64_t a1)
{

}

void sub_1BBD6D598(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD6D864(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBD6FBBC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD70140(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

BOOL SKUINearMeIsEnabledForAuthorizationStatus(int a1)
{
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUINearMeIsEnabledForAuthorizationStatus_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  return (a1 - 3) < 2;
}

BOOL SKUILocationIsAccurate(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  _BOOL8 v13;
  double v14;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUILocationIsAccurate_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "horizontalAccuracy");
  v11 = v10;
  objc_msgSend(v1, "timestamp");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v11 > 0.00000011920929 && v11 <= 5000.0)
  {
    if (v12)
    {
      objc_msgSend(v12, "timeIntervalSinceNow");
      v13 = v14 >= -30.0;
    }
    else
    {
      v13 = 1;
    }
  }

  return v13;
}

void sub_1BBD71DC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIItemCollectionItemPageRangeForCollectionView(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v5 = a1;
  objc_msgSend(v5, "indexPathForItemAtPoint:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(v5, "collectionViewLayout");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "itemSize");
    objc_msgSend(v5, "bounds");
    objc_msgSend(v7, "itemSize");
    v8 = objc_msgSend(v6, "item");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

uint64_t SKUIItemCollectionItemPageRangeForTableView(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  double v10;

  v5 = a1;
  objc_msgSend(v5, "indexPathForRowAtPoint:", a2, a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = objc_msgSend(v6, "item");
    v9 = v8 & ~(v8 >> 63);
    objc_msgSend(v5, "rowHeight");
    if (v10 > 0.0)
    {
      objc_msgSend(v5, "bounds");
      objc_msgSend(v5, "rowHeight");
    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

uint64_t SKUIItemCollectionVisibleItemRangeForCollectionView(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexPathsForVisibleItems");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "item", (_QWORD)v10);
          if (v6 >= v8)
            v6 = v8;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    objc_msgSend(v2, "count");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t SKUIItemCollectionVisibleItemRangeForTableView(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "indexPathsForVisibleRows");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v1, "count"))
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v2 = v1;
    v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v3)
    {
      v4 = v3;
      v5 = *(_QWORD *)v11;
      v6 = 0x7FFFFFFFFFFFFFFFLL;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v11 != v5)
            objc_enumerationMutation(v2);
          v8 = objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * i), "row", (_QWORD)v10);
          if (v6 >= v8)
            v6 = v8;
        }
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v4);
    }
    else
    {
      v6 = 0x7FFFFFFFFFFFFFFFLL;
    }

    objc_msgSend(v2, "count");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void sub_1BBD75024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD751D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__69(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__69(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__70(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__70(uint64_t a1)
{

}

void *__Block_byref_object_copy__5_1(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__6_1(uint64_t a1)
{

}

void sub_1BBD75EC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,char a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  uint64_t v36;

  _Block_object_dispose(&a30, 8);
  _Block_object_dispose(&a36, 8);
  _Block_object_dispose((const void *)(v36 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD78858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD78930(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBD79130(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__71(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__71(uint64_t a1)
{

}

void sub_1BBD79518(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD7976C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBD7A6FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD7B7C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD7BA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD7E7CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD7F21C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD80750(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  _Block_object_dispose(&a21, 8);
  _Unwind_Resume(a1);
}

id getAMSURLParserClass()
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
  v0 = (void *)getAMSURLParserClass_softClass_0;
  v7 = getAMSURLParserClass_softClass_0;
  if (!getAMSURLParserClass_softClass_0)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __getAMSURLParserClass_block_invoke_0;
    v3[3] = &unk_1E73A20C8;
    v3[4] = &v4;
    __getAMSURLParserClass_block_invoke_0((uint64_t)v3);
    v0 = (void *)v5[3];
  }
  v1 = v0;
  _Block_object_dispose(&v4, 8);
  return v1;
}

void sub_1BBD80820(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getAMSURLParserClass_block_invoke_0(uint64_t a1)
{
  AppleMediaServicesLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("AMSURLParser");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSURLParserClass_softClass_0 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getAMSURLParserClass_block_invoke_cold_1();
    AppleMediaServicesLibrary();
  }
}

void AppleMediaServicesLibrary()
{
  void *v0;

  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
    AppleMediaServicesLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  if (!AppleMediaServicesLibraryCore_frameworkLibrary_0)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

SKUIWishlistViewController *__getAMSBagClass_block_invoke(uint64_t a1)
{
  SKUIWishlistViewController *result;
  SKUIWishlistViewController *v3;
  SEL v4;
  id v5;
  id v6;

  AppleMediaServicesLibrary();
  result = (SKUIWishlistViewController *)objc_getClass("AMSBag");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getAMSBagClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (SKUIWishlistViewController *)__getAMSBagClass_block_invoke_cold_1();
    return -[SKUIWishlistViewController initWithNibName:bundle:](v3, v4, v5, v6);
  }
  return result;
}

void __AccountsChanged(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ____AccountsChanged_block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void sub_1BBD82A9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD82EE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD83CC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD84598(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__72(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__72(uint64_t a1)
{

}

void sub_1BBD8601C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD87604(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1BBD88B8C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD88DB4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD89D70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__73(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__73(uint64_t a1)
{

}

id SKUIRequiredVisibilitySetForLocalizedIndexedCollation()
{
  _BOOL8 v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t i;
  uint64_t v17;
  int v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  int v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v0 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v0)
        SKUIRequiredVisibilitySetForLocalizedIndexedCollation_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
    }
  }
  objc_msgSend(MEMORY[0x1E0DC39C0], "currentCollation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sectionIndexTitles");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", 3);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v11 = v9;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v12)
  {
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v33 != v15)
          objc_enumerationMutation(v11);
        v17 = *(_QWORD *)(*((_QWORD *)&v32 + 1) + 8 * i);
        v18 = objc_msgSend(&unk_1E749BB30, "containsObject:", v17);
        if ((v18 & 1) != 0 || ((v14 ^ 1) & 1) != 0)
        {
          v14 |= v18 ^ 1;
          objc_msgSend(v10, "addObject:", v17);
        }
        else
        {
          v14 = 1;
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v13);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v11, "reverseObjectEnumerator", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = 0;
    v23 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v29 != v23)
          objc_enumerationMutation(v19);
        v25 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        v26 = objc_msgSend(&unk_1E749BB30, "containsObject:", v25);
        if ((v26 & 1) != 0 || ((v22 ^ 1) & 1) != 0)
        {
          v22 |= v26 ^ 1;
          objc_msgSend(v10, "addObject:", v25);
        }
        else
        {
          v22 = 1;
        }
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  return v10;
}

id SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("systemBucketID-%@"), v1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

void sub_1BBD8B96C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIInitializeViewElementFactory()
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    SKUIInitializeViewElementFactory_cold_1();
  }
  if (SKUIInitializeViewElementFactory_sOnce != -1)
    dispatch_once(&SKUIInitializeViewElementFactory_sOnce, &__block_literal_global_44);
}

void sub_1BBD8F970(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBD91368(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__74(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__74(uint64_t a1)
{

}

void sub_1BBD92068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD924E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD92F68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD93314(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,char a39)
{
  uint64_t v39;

  _Block_object_dispose(&a33, 8);
  _Block_object_dispose(&a39, 8);
  _Block_object_dispose((const void *)(v39 - 192), 8);
  _Block_object_dispose((const void *)(v39 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__75(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__75(uint64_t a1)
{

}

SKUIMessageBanner *SKUIFamilyAlertMessageBanner(void *a1, void *a2, uint64_t *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  int v34;
  NSObject *v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  uint64_t v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  SKUIMessageBanner *v57;
  void *v58;
  void *v59;
  uint64_t v61;
  void *v62;
  unsigned int v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v70;
  id v71;
  void *v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  _QWORD v77[3];
  _QWORD v78[3];
  _QWORD v79[3];
  _QWORD v80[3];
  int v81;
  void *v82;
  __int16 v83;
  void *v84;
  __int16 v85;
  uint64_t v86;
  __int16 v87;
  void *v88;
  __int16 v89;
  void *v90;
  __int16 v91;
  void *v92;
  __int16 v93;
  uint64_t v94;
  __int16 v95;
  uint64_t v96;
  _BYTE v97[128];
  uint64_t v98;

  v98 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v71 = a2;
  +[SKUIFamilyCircleController sharedController](SKUIFamilyCircleController, "sharedController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iCloudFamily");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v66 = v5;
  objc_msgSend(v5, "familyCircle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DAF460], "defaultStore");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "activeAccount");
  v72 = (void *)objc_claimAutoreleasedReturnValue();

  v75 = 0u;
  v76 = 0u;
  v73 = 0u;
  v74 = 0u;
  objc_msgSend(v6, "members");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
  if (v10)
  {
    v11 = v10;
    v12 = 0;
    v13 = *(_QWORD *)v74;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v74 != v13)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v73 + 1) + 8 * i);
        if (objc_msgSend(v15, "isMe"))
        {
          v16 = v15;

          v12 = v16;
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v73, v97, 16);
    }
    while (v11);
  }
  else
  {
    v12 = 0;
  }

  *a3 = 0;
  v67 = v4;
  if (!v7)
  {
    objc_msgSend(v6, "members");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count");

    if (!v22)
      goto LABEL_21;
    objc_msgSend(v12, "iTunesAccountDSID");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "uniqueIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v23, "isEqual:", v24);

    if ((v25 & 1) == 0)
    {
      *a3 = 1;
LABEL_36:
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH"), 0);
      v29 = objc_claimAutoreleasedReturnValue();
      if (v4)
        objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"));
      else
        +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_HIGHLIGHT"), 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v68);
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0;
      goto LABEL_48;
    }
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "BOOLForKey:", CFSTR("SKUIHideFamilyBanner"));

    if ((v27 & 1) != 0)
      goto LABEL_21;
    goto LABEL_27;
  }
  if (!v6 || !v12)
    goto LABEL_21;
  objc_msgSend(v12, "iTunesAccountDSID");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v17)
  {
LABEL_27:
    *a3 = 3;
    goto LABEL_28;
  }
  objc_msgSend(v12, "iTunesAccountDSID");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v72, "uniqueIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v18, "isEqual:", v19);

  if ((v20 & 1) == 0)
  {
    *a3 = 2;
LABEL_25:
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2"), 0);
    v29 = objc_claimAutoreleasedReturnValue();
    if (v4)
      objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"));
    else
      +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_ACCOUNT_MISMATCH_2_HIGHLIGHT"), 0);
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v12, "appleID");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = (void *)v30;
    objc_msgSend(v31, "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@%@"), 0, v32, v30);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    v63 = 0;
    *a3 = 2;
    goto LABEL_48;
  }
LABEL_21:
  v28 = *a3;
  if (*a3 != 3)
  {
    if (v28 == 2)
      goto LABEL_25;
    if (v28 != 1)
    {
      v63 = 0;
      v64 = 0;
      v68 = 0;
      v29 = 0;
      goto LABEL_48;
    }
    goto LABEL_36;
  }
LABEL_28:
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE"), 0);
  v29 = objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(v4, "localizedStringForKey:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:](SKUIClientContext, "localizedStringForKey:inBundles:", CFSTR("PURCHASED_FAMILY_SETUP_INCOMPLETE_HIGHLIGHT"), 0);
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v29, CFSTR("%@"), 0, v68);
  v64 = (void *)objc_claimAutoreleasedReturnValue();
  *a3 = 3;
  v63 = 1;
LABEL_48:
  objc_msgSend(MEMORY[0x1E0DAF538], "sharedConfig");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = objc_msgSend(v33, "shouldLog");
  if (objc_msgSend(v33, "shouldLogToDisk"))
    v34 |= 2u;
  objc_msgSend(v33, "OSLogObject");
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    v36 = v34;
  else
    v36 = v34 & 2;
  v65 = v6;
  if (v36)
  {
    objc_msgSend(v6, "members");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v29;
    v38 = objc_msgSend(v62, "count");
    objc_msgSend(v12, "iTunesAccountDSID");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v72, "uniqueIdentifier");
    v40 = objc_claimAutoreleasedReturnValue();
    v41 = *a3;
    v81 = 138414082;
    v82 = v7;
    v83 = 2112;
    v84 = v6;
    v85 = 2048;
    v86 = v38;
    v29 = v37;
    v87 = 2112;
    v88 = v12;
    v89 = 2112;
    v90 = v39;
    v91 = 2112;
    v92 = v72;
    v93 = 2112;
    v94 = v40;
    v42 = (void *)v40;
    v95 = 2048;
    v96 = v41;
    LODWORD(v61) = 82;
    v43 = (void *)_os_log_send_and_compose_impl();

    if (!v43)
      goto LABEL_57;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", v43, 4, &v81, v61);
    v35 = objc_claimAutoreleasedReturnValue();
    free(v43);
    SSFileLog();
  }

LABEL_57:
  v70 = (void *)v29;
  if (v29)
  {
    v44 = objc_alloc_init(MEMORY[0x1E0DC1288]);
    objc_msgSend(v44, "setAlignment:", 1);
    objc_msgSend(v44, "setLineBreakMode:", 4);
    v79[0] = *MEMORY[0x1E0DC1138];
    v45 = v79[0];
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = *MEMORY[0x1E0DC1140];
    v80[0] = v46;
    v80[1] = v71;
    v48 = *MEMORY[0x1E0DC1178];
    v79[1] = v47;
    v79[2] = v48;
    v80[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v80, v79, 3);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v77[0] = v45;
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    v78[0] = v50;
    v77[1] = v47;
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v77[2] = v48;
    v78[1] = v51;
    v78[2] = v44;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 3);
    v52 = (void *)objc_claimAutoreleasedReturnValue();

    v53 = v64;
    v54 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v64, v52);
    v55 = objc_msgSend(v64, "rangeOfString:", v68);
    objc_msgSend(v54, "setAttributes:range:", v49, v55, v56);

    if (v54)
    {
      v57 = objc_alloc_init(SKUIMessageBanner);
      -[SKUIMessageBanner setAttributedMessage:](v57, "setAttributedMessage:", v54);
      -[SKUIMessageBanner setShowsClearButton:](v57, "setShowsClearButton:", v63);
    }
    else
    {
      v57 = 0;
    }
    v58 = v67;
    v59 = v65;
  }
  else
  {
    v54 = 0;
    v57 = 0;
    v58 = v67;
    v53 = v64;
    v59 = v65;
  }

  return v57;
}

void sub_1BBD9457C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 72));
  _Unwind_Resume(a1);
}

void sub_1BBD94D0C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD9563C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD95824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD9631C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__76(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__76(uint64_t a1)
{

}

void sub_1BBD96C64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBD97BD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__77(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__77(uint64_t a1)
{

}

void sub_1BBD97E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBD999A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, ...)
{
  va_list va;

  va_start(va, a12);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t SKUIPageForCollectionView(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;

  v1 = a1;
  objc_msgSend(v1, "contentOffset");
  v3 = v2;
  objc_msgSend(v1, "frame");
  v5 = v4;

  return llround(v3 / v5);
}

void sub_1BBDA0384(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDA0944(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDA15A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__78(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__78(uint64_t a1)
{

}

void sub_1BBDA26F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDA40B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDA4BA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__79(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__79(uint64_t a1)
{

}

void sub_1BBDA6038(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDA6244(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDA6554(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDA6CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__80(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__80(uint64_t a1)
{

}

id SKUIPopoverBackdropViewForView(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  void *v5;

  v1 = a1;
  if (!os_variant_has_internal_content()
    || !_os_feature_enabled_impl()
    || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    if (v1)
      goto LABEL_5;
LABEL_9:
    v3 = 0;
    goto LABEL_10;
  }
  SKUIPopoverBackdropViewForView_cold_1();
  if (!v1)
    goto LABEL_9;
LABEL_5:
  v2 = 0;
  do
  {
    v3 = v1;

    objc_msgSend(v3, "superview");
    v1 = (id)objc_claimAutoreleasedReturnValue();

    v2 = v3;
  }
  while (v1);
LABEL_10:
  objc_opt_class();
  __ChildViewWithClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __ChildViewWithClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id __ChildViewWithClass(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend(a1, "subviews");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");

  v3 = objc_msgSend(v2, "count");
  if (v3 < 1)
  {
LABEL_7:
    v6 = 0;
  }
  else
  {
    v4 = v3;
    v5 = 0;
    while (1)
    {
      objc_msgSend(v2, "objectAtIndex:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v6, "subviews");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
      {
        objc_msgSend(v2, "addObjectsFromArray:", v7);
        v4 = objc_msgSend(v2, "count");
      }

      if (++v5 >= v4)
        goto LABEL_7;
    }
  }

  return v6;
}

void sub_1BBDA96E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location, id a16)
{
  id *v16;
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void SKUIPhysicalCircleConstantsWithTraitCollection(void *a1@<X0>, uint64_t a2@<X8>)
{
  id v3;
  uint64_t v4;
  double v5;

  v3 = a1;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIPhysicalCircleConstantsWithTraitCollection_cold_1();
  }
  *(_OWORD *)a2 = xmmword_1BBED24A0;
  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = xmmword_1BBED24B0;
  *(_OWORD *)(a2 + 48) = 0u;
  *(_QWORD *)(a2 + 48) = 0x4000000000000000;
  v4 = objc_msgSend(v3, "horizontalSizeClass");
  v5 = 10.0;
  if (v4 == 2)
    v5 = 12.0;
  *(double *)(a2 + 56) = v5;

}

uint64_t SKUIStatusBarAlertStyleFromString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("information")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("success")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("failure")) & 1) != 0)
  {
    v2 = 2;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("other")))
  {
    v2 = 3;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id SKUIStatusBarAlertStyleGetColor(void *a1)
{
  uint64_t v1;
  uint64_t v2;

  switch((unint64_t)a1)
  {
    case 0uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemGreenColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3uLL:
      objc_msgSend(MEMORY[0x1E0DC3658], "systemPurpleColor", v1, v2);
      a1 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return a1;
  }
  return a1;
}

void sub_1BBDB013C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDB0B20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__81(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__81(uint64_t a1)
{

}

void sub_1BBDB0D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__82(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__82(uint64_t a1)
{

}

void sub_1BBDB2F64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 48), 8);
  _Unwind_Resume(a1);
}

void sub_1BBDB30F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDB457C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__83(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__83(uint64_t a1)
{

}

void sub_1BBDB4704(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDB4EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location)
{
  id *v13;
  uint64_t v14;

  objc_destroyWeak(v13);
  objc_destroyWeak((id *)(v14 - 96));
  _Unwind_Resume(a1);
}

void sub_1BBDB564C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDB5DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDB711C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDB777C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id *a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id location)
{
  id *v40;
  uint64_t v41;

  objc_destroyWeak(v40);
  objc_destroyWeak((id *)(v41 - 248));
  _Unwind_Resume(a1);
}

id SKUIMessageBannerAttributedString(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  _QWORD v29[3];
  _QWORD v30[3];
  _QWORD v31[3];
  _QWORD v32[4];

  v32[3] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIMessageBannerAttributedString_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_alloc_init(MEMORY[0x1E0DC1288]);
  objc_msgSend(v13, "setAlignment:", 1);
  objc_msgSend(v13, "setLineBreakMode:", 4);
  v31[0] = *MEMORY[0x1E0DC1138];
  v14 = v31[0];
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *MEMORY[0x1E0DC1140];
  v32[0] = v15;
  v32[1] = v4;
  v17 = *MEMORY[0x1E0DC1178];
  v31[1] = v16;
  v31[2] = v17;
  v32[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, v31, 3);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v29[0] = v14;
  objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 14.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v19;
  v29[1] = v16;
  objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v29[2] = v17;
  v30[1] = v20;
  v30[2] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 3);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("ASK_PERMISSION_MESSAGE"), CFSTR("ProductPage"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ASK_PERMISSION_MESSAGE"), 0, CFSTR("ProductPage"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    objc_msgSend(v3, "localizedStringForKey:inTable:", CFSTR("ASK_PERMISSION_MESSAGE_HIGHLIGHT"), CFSTR("ProductPage"));
  else
    +[SKUIClientContext localizedStringForKey:inBundles:inTable:](SKUIClientContext, "localizedStringForKey:inBundles:inTable:", CFSTR("ASK_PERMISSION_MESSAGE_HIGHLIGHT"), 0, CFSTR("ProductPage"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithValidatedFormat:validFormatSpecifiers:error:", v22, CFSTR("%@"), 0, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3778]), "initWithString:attributes:", v24, v21);
  v26 = objc_msgSend(v24, "rangeOfString:", v23);
  objc_msgSend(v25, "setAttributes:range:", v18, v26, v27);

  return v25;
}

void sub_1BBDBA984(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBDBB240(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__84(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__84(uint64_t a1)
{

}

void sub_1BBDC0B28(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDC17C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__85(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__85(uint64_t a1)
{

}

void sub_1BBDC1AAC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ToggleImageColorUtilitiesTempFileCommand()
{
  sUseImageColorUtilitiesTempFile ^= 1u;
  return 1;
}

uint64_t GetToggleImageColorUtilitiesTempFileState()
{
  return sUseImageColorUtilitiesTempFile;
}

void ImageAnalyzer::ImageAnalyzer(ImageAnalyzer *this)
{
  ITColor::ITColor((ITColor *)this + 1);
  ITColor::ITColor((ITColor *)this + 2);
  ITColor::ITColor((ITColor *)this + 3);
  ITColor::ITColor((ITColor *)this + 4);
  ITColor::ITColor((ITColor *)this + 5);
  ITColor::ITColor((ITColor *)this + 6);
  ITColor::ITColor((ITColor *)this + 7);
  ITColor::ITColor((ITColor *)this + 8);
  ITColor::ITColor((ITColor *)this + 9);
  *(_QWORD *)this = 0;
  *((_QWORD *)this + 1) = 0;
  *((_OWORD *)this + 20) = 0u;
  *((_OWORD *)this + 21) = 0u;
  *((_OWORD *)this + 22) = 0u;
  *((_OWORD *)this + 23) = 0u;
}

void ImageAnalyzer::~ImageAnalyzer(ImageAnalyzer *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(_QWORD *)this = 0;
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    free(v3);
    *((_QWORD *)this + 1) = 0;
  }
  v4 = (void *)*((_QWORD *)this + 43);
  if (v4)
  {
    *((_QWORD *)this + 44) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 40);
  if (v5)
  {
    *((_QWORD *)this + 41) = v5;
    operator delete(v5);
  }
}

uint64_t ImageAnalyzer::AnalyzeImage(ImageAnalyzer *this, CGContext *a2)
{
  uint64_t result;

  if (!a2)
    return 0;
  result = ImageAnalyzer::GenerateColorMaps(this, a2);
  if ((_DWORD)result)
  {
    result = ImageAnalyzer::QuantizeColorMaps(this);
    if ((_DWORD)result)
    {
      ImageAnalyzer::PickBackgroundColor((ITColor *)this);
      ImageAnalyzer::PickTextColors((ITColor *)this);
      ImageAnalyzer::DoPostImageAnalysis((ITColor *)this);
      return 1;
    }
  }
  return result;
}

uint64_t ImageAnalyzer::GenerateColorMaps(ImageAnalyzer *this, CGContextRef context)
{
  int Width;
  int Height;
  uint64_t result;
  __int16 BitmapInfo;
  double v8;
  double v9;
  unint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  double HSVColor;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  size_t BytesPerRow;
  uint64_t v31;
  ITColor v32;
  ITColor v33;

  if (!context)
    return 0;
  BytesPerRow = CGBitmapContextGetBytesPerRow(context);
  Width = CGBitmapContextGetWidth(context);
  Height = CGBitmapContextGetHeight(context);
  result = 0;
  if (Height == 22 && Width == 22)
  {
    ITColor::ITColor(&v32);
    BitmapInfo = CGBitmapContextGetBitmapInfo(context);
    result = (uint64_t)CGBitmapContextGetData(context);
    v29 = result;
    if (result)
    {
      result = (uint64_t)malloc_type_calloc((22 * Width), 0x20uLL, 0x1000040E0EAB150uLL);
      *(_QWORD *)this = result;
      if (result)
      {
        v11 = 0;
        v12 = BitmapInfo & 0x3000;
        v13 = 1;
        v14 = 24;
        do
        {
          v15 = 0;
          v31 = v14;
          do
          {
            v16 = v29 + BytesPerRow * v13 + v15;
            if (v12)
              v17 = 6;
            else
              v17 = 5;
            if (v12)
              v18 = 5;
            else
              v18 = 6;
            if (v12)
              v19 = 4;
            else
              v19 = 7;
            LOBYTE(v8) = *(_BYTE *)(v16 + v17);
            LOBYTE(v9) = *(_BYTE *)(v16 + v18);
            LOBYTE(v10) = *(_BYTE *)(v16 + v19);
            ITColor::ITColor(&v33, (double)*(unint64_t *)&v8 / 255.0, (double)*(unint64_t *)&v9 / 255.0, (double)v10 / 255.0, 1.0);
            v32 = v33;
            HSVColor = ITColor::GetHSVColor(&v33);
            v22 = v21;
            v24 = v23;
            ITColor::GetLuminance(&v33);
            v25 = *(_QWORD *)this;
            v26 = (double *)(*(_QWORD *)this + v14);
            *(v26 - 3) = HSVColor;
            v27 = v25 + v11 + 8 * v15;
            *(_QWORD *)(v27 + 8) = v22;
            *(_QWORD *)(v27 + 16) = v24;
            *v26 = v28;
            v9 = *((double *)this + 47);
            v8 = v28 + v9;
            *((double *)this + 47) = v8;
            v15 += 4;
            v14 += 32;
          }
          while ((_DWORD)v15 != 80);
          ++v13;
          v14 = v31 + 640;
          v11 += 640;
        }
        while (v13 != 21);
        *((double *)this + 47) = v8 / 400.0;
        return 1;
      }
    }
  }
  return result;
}

uint64_t ImageAnalyzer::QuantizeColorMaps(ImageAnalyzer *this)
{
  uint64_t result;
  _BYTE *v3;
  uint64_t v4;
  double *v5;
  unint64_t v6;
  uint64_t v7;
  double *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  double *v17;
  uint64_t v18;
  double *v19;
  char *v20;
  double *v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  _QWORD *v26;
  unsigned int (*v27)(_QWORD, _QWORD);
  unsigned int (*v28)(_QWORD, _QWORD);
  unsigned int (*v29)(_QWORD, _QWORD);
  unsigned int (*v30)(_QWORD, _QWORD);
  _BOOL8 v31;
  double v32;
  uint64_t v33;
  uint64_t v34;
  double v35;
  unint64_t v36;
  double *v37;
  unint64_t v38;
  uint64_t v39;
  double v40;
  _OWORD *v41;
  __int128 v42;
  _OWORD *v43;
  unsigned int (*v44[4])(_QWORD, _QWORD);
  int v45;
  double v46;
  void *__p;
  double *v48;
  double *v49;

  result = (uint64_t)malloc_type_calloc(0x190uLL, 8uLL, 0x100004000313F17uLL);
  *((_QWORD *)this + 1) = result;
  if (result)
  {
    result = (uint64_t)malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
    if (result)
    {
      v3 = (_BYTE *)result;
      v4 = 0;
      v5 = 0;
      v6 = 0;
      __p = 0;
      v48 = 0;
      v49 = 0;
      v7 = 1;
      do
      {
        if (!v3[v6])
        {
          v8 = (double *)(*(_QWORD *)this + 32 * v6);
          v9 = *v8;
          v10 = v8[1];
          v11 = v8[2];
          v12 = v8[3];
          v13 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)result, v6 - 20 * ((unsigned __int16)v6 / 0x14u), (unsigned __int16)v6 / 0x14u);
          v14 = v13;
          v48 = v5;
          if (v5 >= v49)
          {
            v15 = 0x5555555555555556 * (((char *)v49 - (char *)v5) >> 4);
            if (v15 <= 1)
              v15 = 1;
            if (0xAAAAAAAAAAAAAAABLL * (((char *)v49 - (char *)v5) >> 4) >= 0x2AAAAAAAAAAAAAALL)
              v16 = 0x555555555555555;
            else
              v16 = v15;
            v17 = (double *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)&v49, v16);
            *v17 = v9;
            v17[1] = v10;
            v17[2] = v11;
            v17[3] = v12;
            *((_DWORD *)v17 + 8) = v6;
            v17[5] = v14;
            v20 = (char *)__p;
            v19 = v48;
            v21 = v17;
            if (v48 != __p)
            {
              do
              {
                v22 = *((_OWORD *)v19 - 3);
                v23 = *((_OWORD *)v19 - 1);
                *((_OWORD *)v21 - 2) = *((_OWORD *)v19 - 2);
                *((_OWORD *)v21 - 1) = v23;
                *((_OWORD *)v21 - 3) = v22;
                v21 -= 6;
                v19 -= 6;
              }
              while (v19 != (double *)v20);
              v19 = (double *)v20;
            }
            v5 = v17 + 6;
            __p = v21;
            v48 = v17 + 6;
            v49 = &v17[6 * v18];
            if (v19)
              operator delete(v19);
          }
          else
          {
            *v5 = v9;
            v5[1] = v10;
            v5[2] = v11;
            v5[3] = v12;
            *((_DWORD *)v5 + 8) = v6;
            v5[5] = v13;
            v5 += 6;
          }
          v48 = v5;
          *(double *)(*((_QWORD *)this + 1) + 8 * v6) = v14;
          v3[v6] = 1;
          if (v6 <= 0x18E)
          {
            v24 = v4;
            v25 = v7;
            do
            {
              if (!v3[v25])
              {
                v26 = (_QWORD *)(*(_QWORD *)this + v24);
                v27 = (unsigned int (*)(_QWORD, _QWORD))v26[4];
                v28 = (unsigned int (*)(_QWORD, _QWORD))v26[5];
                v29 = (unsigned int (*)(_QWORD, _QWORD))v26[6];
                v30 = (unsigned int (*)(_QWORD, _QWORD))v26[7];
                v31 = isCloseToColor(0, v9, v10, v11, v12, *(double *)&v27, *(double *)&v28, *(double *)&v29, *(double *)&v30, 0.0799999982);
                if (v31)
                {
                  v32 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)v31, v25 - 20 * ((unsigned __int16)v25 / 0x14u), (unsigned __int16)v25 / 0x14u);
                  v44[0] = v27;
                  v44[1] = v28;
                  v44[2] = v29;
                  v44[3] = v30;
                  v45 = v25;
                  v46 = v32;
                  ImageAnalyzer::AddQuantizeColorEntryToSet(v33, (double *)v44, &__p);
                  v3[v25] = 1;
                }
              }
              ++v25;
              v24 += 32;
            }
            while (v25 != 400);
            v5 = v48;
          }
          result = (uint64_t)__p;
          if (v5 != __p)
          {
            v44[0] = (unsigned int (*)(_QWORD, _QWORD))CompareQuantizeSortcolor;
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>((__int128 *)__p, (__int128 *)v5, v44, 126 - 2 * __clz(0xAAAAAAAAAAAAAAABLL * (((char *)v5 - (_BYTE *)__p) >> 4)), 1);
            v5 = (double *)__p;
            v34 = *((unsigned int *)__p + 8);
            v35 = *((double *)__p + 5);
            v36 = 0xAAAAAAAAAAAAAAABLL * (((char *)v48 - (_BYTE *)__p) >> 4);
            if (v36 >= 2)
            {
              v37 = (double *)((char *)__p + 88);
              v38 = v36 - 1;
              do
              {
                v39 = *((unsigned int *)v37 - 2);
                v40 = *v37;
                if (!v3[v39])
                  v3[v39] = 1;
                v35 = v35 + v40;
                v37 += 6;
                v41 = (_OWORD *)(*(_QWORD *)this + 32 * v34);
                v42 = v41[1];
                v43 = (_OWORD *)(*(_QWORD *)this + 32 * v39);
                *v43 = *v41;
                v43[1] = v42;
                --v38;
              }
              while (v38);
            }
            *(double *)(*((_QWORD *)this + 1) + 8 * v34) = v35;
          }
        }
        ++v6;
        ++v7;
        v4 += 32;
      }
      while (v6 != 400);
      free(v3);
      if (__p)
      {
        v48 = (double *)__p;
        operator delete(__p);
      }
      return 1;
    }
  }
  return result;
}

void sub_1BBDC25C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::PickBackgroundColor(ITColor *this)
{
  double var3;
  void **v3;
  __int128 v4;
  __int128 v5;
  double ContrastWithLuminance;
  unint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t i;
  double *v11;
  double v12;
  double v13;
  double v14;
  _OWORD *v15;
  __int128 v16;
  __int128 v17;
  double HSVColor;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  ITColor v31;

  var3 = this[11].var3;
  v3 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  v4 = *((_OWORD *)*v3 + 1);
  *(_OWORD *)&this[1].var0 = *(_OWORD *)*v3;
  *(_OWORD *)&this[1].var2 = v4;
  v5 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v5;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    ContrastWithLuminance = ITColor::GetContrastWithLuminance(this + 1, 0.180000007);
    v7 = (unint64_t)((_BYTE *)v3[1] - (_BYTE *)*v3) >> 5;
    if ((int)v7 >= 2)
    {
      v8 = ContrastWithLuminance;
      if ((_DWORD)v7 == 2)
        v9 = 2;
      else
        v9 = 3;
      for (i = 1; i != v9; ++i)
      {
        v11 = *(double **)&this[10].var3;
        v12 = v11[i];
        if (v12 <= 0.0)
          break;
        v13 = *v11 / v12;
        if (v13 <= 0.9 || v13 >= 1.112)
          break;
        v14 = ITColor::GetContrastWithLuminance((ITColor *)*v3 + i, 0.180000007);
        if (v14 > v8)
        {
          v15 = (char *)*v3 + 32 * i;
          v16 = v15[1];
          *(_OWORD *)&this[1].var0 = *v15;
          *(_OWORD *)&this[1].var2 = v16;
          v8 = v14;
        }
      }
    }
  }
  v17 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v31.var2 = v17;
  if (ITColor::GetContrastWithLuminance(&v31, 0.180000007) < 1.29999995)
  {
    HSVColor = ITColor::GetHSVColor(this + 1);
    v20 = v19;
    v22 = v21;
    v28 = HSVColor;
    v29 = v19;
    v30 = v21;
    if (var3 < 0.180000007
      || (v23 = *(_OWORD *)&this[1].var2,
          *(_OWORD *)&v31.var0 = *(_OWORD *)&this[1].var0,
          *(_OWORD *)&v31.var2 = v23,
          ITColor::GetLuminance(&v31),
          v24 < 0.180000007))
    {
      v29 = v20 * 1.10000002;
      v30 = v22 * 0.800000012;
    }
    this[1].var0 = ITColor::CreateFromHSVColor(&v28);
    this[1].var1 = v25;
    this[1].var2 = v26;
    this[1].var3 = v27;
  }
}

void ImageAnalyzer::PickTextColors(ITColor *this)
{
  void **v2;
  unint64_t v3;
  unint64_t v4;
  double *v5;
  void **v6;
  double ContrastWithColor;
  uint64_t v8;
  int v9;
  unint64_t v10;
  int v11;
  unsigned int v12;
  double v13;
  _OWORD *v14;
  __int128 v15;
  double var0;
  double var1;
  double var2;
  double var3;
  double v20;
  _BOOL4 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  double *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  int v36;
  double v37;
  double v38;
  double v39;
  double v40;
  BOOL v41;
  char v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  __int128 v51;
  __int128 *v52;
  double v53;
  double v54;
  double v55;
  __int128 *v56;
  double v57;
  double v58;
  double v59;
  __int128 v60;
  double v61;
  double v62;
  __int128 v63;
  double v64;
  __int128 v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  __int128 *v71;
  double BlendedColorWithFraction;
  double v73;
  double v74;
  double v75;
  __int128 *v76;
  __int128 v77;
  double v78;
  double v79;
  double v80;
  double v81;
  double v82;
  __int128 *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  __int128 *v88;
  double v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  unsigned int v93;
  unsigned int v94;
  unsigned int v95;
  ITColor v96;
  ITColor v97;
  ITColor v98;
  ITColor v99;
  ITColor v100;
  ITColor v101;
  ITColor v102;
  ITColor v103;

  v2 = ImageAnalyzer::DominantColors((ImageAnalyzer *)this);
  v3 = (_BYTE *)v2[1] - (_BYTE *)*v2;
  v4 = v3 >> 5;
  v5 = (double *)&qword_1BBED1FE0[4];
  if ((v3 >> 5) < 2)
  {
    v41 = 0;
    v42 = 0;
    goto LABEL_29;
  }
  v6 = v2;
  ContrastWithColor = ITColor::GetContrastWithColor((ITColor *)*v2 + 1, this + 1);
  v8 = 0;
  v9 = 0;
  v10 = (v3 >> 5);
  v11 = 1;
  v93 = v4;
  v94 = v4;
  v12 = 1;
  v95 = 1;
  v13 = ContrastWithColor;
  do
  {
    v14 = (char *)*v6 + v8;
    v15 = v14[1];
    *(_OWORD *)&v96.var0 = *v14;
    *(_OWORD *)&v96.var2 = v15;
    if ((v9 & 1) == 0)
    {
      var0 = this[1].var0;
      var1 = this[1].var1;
      var2 = this[1].var2;
      var3 = this[1].var3;
      v98 = v96;
      v97.var0 = var0;
      v97.var1 = var1;
      v97.var2 = var2;
      v97.var3 = var3;
      v99 = v96;
      ITColor::GetLuminance(&v99);
      v21 = v20 >= 0.180000007;
      v99.var0 = var0;
      v99.var1 = var1;
      v99.var2 = var2;
      v99.var3 = var3;
      ITColor::GetLuminance(&v99);
      if (((v21 ^ (v22 >= 0.180000007)) & 1) != 0 && ITColor::GetContrastWithColor(&v98, &v97) >= 4.5999999)
      {
        ImageAnalyzer::EnhanceContrastWithColor(v96, this[1], 0.449999988);
        this[2].var0 = v23;
        this[2].var1 = v24;
        this[2].var2 = v25;
        this[2].var3 = v26;
        v9 = 1;
        v94 = v11;
      }
    }
    v27 = ITColor::GetContrastWithColor(&v96, this + 1);
    if (v27 > v13)
    {
      if (v27 <= ContrastWithColor)
      {
        v13 = v27;
        v95 = v11 - 1;
      }
      else
      {
        v13 = ContrastWithColor;
        ContrastWithColor = v27;
        v95 = v12;
        v12 = v11 - 1;
      }
    }
    ++v11;
    v8 += 32;
  }
  while (32 * v10 != v8);
  if (v94 >= v93)
  {
LABEL_16:
    ITColor::ITColor(&v99);
    v36 = 0;
    if ((v9 & 1) != 0)
    {
      LODWORD(v4) = v93;
      v5 = (double *)(qword_1BBED1FE0 + 32);
      goto LABEL_25;
    }
    LOBYTE(v28) = 1;
    goto LABEL_18;
  }
  v28 = 0;
  v29 = 32 * v94;
  v30 = v94;
  while (1)
  {
    v31 = (double *)((char *)*v6 + v29);
    v32 = *v31;
    v33 = v31[1];
    v34 = v31[2];
    v35 = v31[3];
    v100.var0 = *v31;
    v100.var1 = v33;
    v100.var2 = v34;
    v100.var3 = v35;
    if (contrastsEnoughWithColor(v100, this[1]))
      break;
    v28 = ++v30 >= v10;
    v29 += 32;
    if (v10 == v30)
      goto LABEL_16;
  }
  v102.var0 = v32;
  v102.var1 = v33;
  v102.var2 = v34;
  v102.var3 = v35;
  ImageAnalyzer::EnhanceContrastWithColor(v102, this[1], 0.449999988);
  this[3].var0 = v43;
  this[3].var1 = v44;
  this[3].var2 = v45;
  this[3].var3 = v46;
  if ((v9 & ~v28 & 1) != 0)
  {
    v42 = 1;
    v36 = 1;
    LODWORD(v4) = v93;
    v5 = (double *)(qword_1BBED1FE0 + 32);
    goto LABEL_28;
  }
  ITColor::ITColor(&v99);
  v36 = 1;
  if ((v9 & 1) == 0)
  {
LABEL_18:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v12), this[1], 0.200000003);
    v99 = v101;
    if (contrastsEnoughWithColor(v101, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[2].var0 = v37;
      this[2].var1 = v38;
      this[2].var2 = v39;
      this[2].var3 = v40;
      LOBYTE(v9) = 1;
    }
  }
  LODWORD(v4) = v93;
  v5 = (double *)&qword_1BBED1FE0[4];
  if ((v28 & 1) != 0)
  {
LABEL_25:
    ImageAnalyzer::EnhanceContrastWithColor(*((ITColor *)*v6 + v95), this[1], 0.200000003);
    v99 = v103;
    if (contrastsEnoughWithColor(v103, this[1]))
    {
      ImageAnalyzer::EnhanceContrastWithColor(v99, this[1], 0.449999988);
      this[3].var0 = v47;
      this[3].var1 = v48;
      this[3].var2 = v49;
      this[3].var3 = v50;
      v36 = 1;
    }
  }
  v42 = v9;
LABEL_28:
  v41 = v36 != 0;
LABEL_29:
  v51 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.var2 = v51;
  ITColor::GetLuminance(&v99);
  v52 = (__int128 *)&this[2];
  v54 = this[2].var1;
  v53 = this[2].var2;
  v55 = this[2].var3;
  v56 = (__int128 *)&this[3];
  v57 = v5[164];
  if (v58 >= v57)
  {
    v99.var0 = this[2].var0;
    v99.var1 = v54;
    v99.var2 = v53;
    v99.var3 = v55;
    ITColor::GetLuminance(&v99);
    if (v59 >= v57)
      v42 = 0;
    v60 = *(_OWORD *)&this[3].var2;
    *(_OWORD *)&v99.var0 = *(_OWORD *)&this[3].var0;
    *(_OWORD *)&v99.var2 = v60;
    ITColor::GetLuminance(&v99);
    if (v61 >= v57)
      v41 = 0;
    if ((v42 & 1) != 0)
      goto LABEL_51;
LABEL_41:
    v65 = *(_OWORD *)&this[1].var2;
    *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
    *(_OWORD *)&v99.var2 = v65;
    ITColor::GetLuminance(&v99);
    if (v66 < v57)
    {
      if ((_DWORD)v4)
      {
        v67 = this[1].var0;
        v68 = this[1].var1;
        v69 = this[1].var2;
        v70 = this[1].var3;
        v71 = &ITColor::kWhite;
        goto LABEL_46;
      }
      v76 = &ITColor::kWhite;
    }
    else
    {
      if ((_DWORD)v4)
      {
        v67 = this[1].var0;
        v68 = this[1].var1;
        v69 = this[1].var2;
        v70 = this[1].var3;
        v71 = &ITColor::kBlack;
LABEL_46:
        BlendedColorWithFraction = ITColor::CreateBlendedColorWithFraction((ITColor *)v71, 0.0500000007, *(ITColor *)&v67);
LABEL_50:
        this[2].var0 = BlendedColorWithFraction;
        this[2].var1 = v73;
        this[2].var2 = v74;
        this[2].var3 = v75;
        goto LABEL_51;
      }
      v76 = &ITColor::kBlack;
    }
    BlendedColorWithFraction = *(double *)v76;
    v73 = *((double *)v76 + 1);
    v74 = *((double *)v76 + 2);
    v75 = *((double *)v76 + 3);
    goto LABEL_50;
  }
  v99.var0 = this[2].var0;
  v99.var1 = v54;
  v99.var2 = v53;
  v99.var3 = v55;
  ITColor::GetLuminance(&v99);
  if (v62 < v57)
    v42 = 0;
  v63 = *(_OWORD *)&this[3].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[3].var0;
  *(_OWORD *)&v99.var2 = v63;
  ITColor::GetLuminance(&v99);
  if (v64 < v57)
    v41 = 0;
  if ((v42 & 1) == 0)
    goto LABEL_41;
LABEL_51:
  if (v41)
    goto LABEL_62;
  v77 = *(_OWORD *)&this[1].var2;
  *(_OWORD *)&v99.var0 = *(_OWORD *)&this[1].var0;
  *(_OWORD *)&v99.var2 = v77;
  ITColor::GetLuminance(&v99);
  if (v78 < v57)
  {
    if ((_DWORD)v4)
    {
      v79 = this[1].var0;
      v80 = this[1].var1;
      v81 = this[1].var2;
      v82 = this[1].var3;
      v83 = &ITColor::kWhite;
      goto LABEL_57;
    }
    v88 = &ITColor::kWhite;
LABEL_60:
    v84 = *(double *)v88;
    v85 = *((double *)v88 + 1);
    v86 = *((double *)v88 + 2);
    v87 = *((double *)v88 + 3);
    goto LABEL_61;
  }
  if (!(_DWORD)v4)
  {
    v88 = &ITColor::kBlack;
    goto LABEL_60;
  }
  v79 = this[1].var0;
  v80 = this[1].var1;
  v81 = this[1].var2;
  v82 = this[1].var3;
  v83 = &ITColor::kBlack;
LABEL_57:
  v84 = ITColor::CreateBlendedColorWithFraction((ITColor *)v83, 0.100000001, *(ITColor *)&v79);
LABEL_61:
  this[3].var0 = v84;
  this[3].var1 = v85;
  this[3].var2 = v86;
  this[3].var3 = v87;
LABEL_62:
  v89 = ITColor::GetContrastWithColor(this + 2, this + 1);
  if (ITColor::GetContrastWithColor(this + 3, this + 1) > v89)
  {
    v91 = *v52;
    v90 = *(_OWORD *)&this[2].var2;
    v92 = *(_OWORD *)&this[3].var2;
    *v52 = *v56;
    *(_OWORD *)&this[2].var2 = v92;
    *v56 = v91;
    *(_OWORD *)&this[3].var2 = v90;
  }
}

void ImageAnalyzer::DoPostImageAnalysis(ITColor *this)
{
  ITColor *v1;
  ITColor *v2;
  ITColor *v3;
  ITColor *v4;
  double v5;
  double v6;
  double v7;
  ITColor *v8;
  double v9;
  double v10;
  double v11;
  ImageAnalyzer *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  ImageAnalyzer *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  ImageAnalyzer *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  ImageAnalyzer *v27;
  double v28;
  double v29;
  double v30;
  double v31;

  v1 = this;
  v2 = this + 2;
  v3 = this + 1;
  this[4].var0 = ITColor::CreateBlendedColorWithFraction(this + 2, 0.200000003, this[1]);
  v4 = v1 + 4;
  v1[4].var1 = v5;
  v1[4].var2 = v6;
  v1[4].var3 = v7;
  v8 = v1 + 3;
  v1[5].var0 = ITColor::CreateBlendedColorWithFraction(v1 + 3, 0.200000003, *v3);
  v1[5].var1 = v9;
  v1 += 5;
  v1->var2 = v10;
  v1->var3 = v11;
  ImageAnalyzer::CalculateOneShadowColor(v12, v2, v3);
  v1[1].var0 = v13;
  v1[1].var1 = v14;
  v1[1].var2 = v15;
  v1[1].var3 = v16;
  ImageAnalyzer::CalculateOneShadowColor(v17, v8, v3);
  v1[3].var0 = v18;
  v1[3].var1 = v19;
  v1[3].var2 = v20;
  v1[3].var3 = v21;
  ImageAnalyzer::CalculateOneShadowColor(v22, v4, v3);
  v1[2].var0 = v23;
  v1[2].var1 = v24;
  v1[2].var2 = v25;
  v1[2].var3 = v26;
  ImageAnalyzer::CalculateOneShadowColor(v27, v1, v3);
  v1[4].var0 = v28;
  v1[4].var1 = v29;
  v1[4].var2 = v30;
  v1[4].var3 = v31;
}

void ImageAnalyzer::AddQuantizeColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  _BYTE *v5;
  uint64_t v6;
  unint64_t v7;
  _OWORD *v8;
  unint64_t v9;
  __int128 v10;
  __int128 v11;
  _OWORD *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  __int128 v20;
  __int128 v21;
  char *v22;
  char *v23;
  __int128 v24;
  __int128 v25;

  v5 = a3[1];
  if (v5 == *a3)
  {
    v8 = a3[1];
LABEL_7:
    v9 = (unint64_t)a3[2];
    if ((unint64_t)v8 >= v9)
    {
      v13 = 0xAAAAAAAAAAAAAAABLL * (((char *)v8 - v5) >> 4);
      v14 = v13 + 1;
      if (v13 + 1 > 0x555555555555555)
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      v15 = 0xAAAAAAAAAAAAAAABLL * ((uint64_t)(v9 - (_QWORD)v5) >> 4);
      if (2 * v15 > v14)
        v14 = 2 * v15;
      if (v15 >= 0x2AAAAAAAAAAAAAALL)
        v16 = 0x555555555555555;
      else
        v16 = v14;
      if (v16)
        v17 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>((uint64_t)(a3 + 2), v16);
      else
        v17 = 0;
      v18 = &v17[48 * v13];
      v19 = &v17[48 * v16];
      v20 = *(_OWORD *)a2;
      v21 = *((_OWORD *)a2 + 2);
      *((_OWORD *)v18 + 1) = *((_OWORD *)a2 + 1);
      *((_OWORD *)v18 + 2) = v21;
      *(_OWORD *)v18 = v20;
      v12 = v18 + 48;
      v23 = (char *)*a3;
      v22 = (char *)a3[1];
      if (v22 != *a3)
      {
        do
        {
          v24 = *((_OWORD *)v22 - 3);
          v25 = *((_OWORD *)v22 - 1);
          *((_OWORD *)v18 - 2) = *((_OWORD *)v22 - 2);
          *((_OWORD *)v18 - 1) = v25;
          *((_OWORD *)v18 - 3) = v24;
          v18 -= 48;
          v22 -= 48;
        }
        while (v22 != v23);
        v22 = (char *)*a3;
      }
      *a3 = v18;
      a3[1] = v12;
      a3[2] = v19;
      if (v22)
        operator delete(v22);
    }
    else
    {
      v10 = *(_OWORD *)a2;
      v11 = *((_OWORD *)a2 + 2);
      v8[1] = *((_OWORD *)a2 + 1);
      v8[2] = v11;
      *v8 = v10;
      v12 = v8 + 3;
    }
    a3[1] = v12;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = *a3;
    while (!isCloseToColor(0, *a2, a2[1], a2[2], a2[3], *(double *)&v5[v6], *(double *)&v5[v6 + 8], *(double *)&v5[v6 + 16], *(double *)&v5[v6 + 24], 0.0799999982))
    {
      ++v7;
      v5 = *a3;
      v8 = a3[1];
      v6 += 48;
      if (0xAAAAAAAAAAAAAAABLL * (((char *)v8 - (_BYTE *)*a3) >> 4) <= v7)
        goto LABEL_7;
    }
    *(double *)((char *)*a3 + v6 + 40) = a2[5] + *(double *)((char *)*a3 + v6 + 40);
  }
}

BOOL isCloseToColor(ITColor *a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9, double a10)
{
  double v23;
  double v24;
  double v25;
  ITColor *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  ITColor v33;
  ITColor v34;

  if ((_DWORD)a1 && (a3 < 0.0500000007 && a7 < 0.0500000007 || a5 < 0.0149999997 && a9 < 0.0149999997))
  {
    v34.var0 = ITColor::CreateFromHSVDoubles(a1, a2, a3, a4);
    v34.var1 = v23;
    v34.var2 = v24;
    v34.var3 = v25;
    v33.var0 = ITColor::CreateFromHSVDoubles(v26, a6, a7, a8);
    v33.var1 = v27;
    v33.var2 = v28;
    v33.var3 = v29;
    if (ITColor::GetContrastWithColor(&v34, &v33) <= 1.65999997)
      return 1;
  }
  if (vabdd_f64(a3, a7) > a10 || vabdd_f64(a4, a8) > a10)
    return 0;
  if (vabdd_f64(a2, a6) <= a10)
    return 1;
  v30 = a2 + 1.0;
  if (a2 >= a10)
    v30 = a2;
  v31 = a6 + 1.0;
  if (a6 >= a10)
    v31 = a6;
  return vabdd_f64(v30, v31) <= a10;
}

double ImageAnalyzer::WeightForPointOnEdge(ImageAnalyzer *this, unsigned int a2, unsigned int a3)
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double result;

  v3 = (double)a2;
  if (a2 <= 4 && a3 <= 4)
  {
    v4 = (double)a3;
    v5 = 4.00000006 - v3;
    goto LABEL_4;
  }
  if (a2 > 4)
  {
    if (a2 >= 0x10 && a3 <= 4)
    {
      v4 = (double)a3;
      v5 = 15.9999999 - v3;
LABEL_4:
      v6 = 4.00000006 - v4;
      if (v5 >= 1.0)
        v7 = v5 * 0.75;
      else
        v7 = 0.75;
      if (v6 >= 1.0)
        v8 = v6 * 0.75;
      else
        v8 = 0.75;
      if (v8 <= v7)
        v8 = v7;
      goto LABEL_22;
    }
    v8 = 1.0;
    if (a2 < 0x10)
      goto LABEL_22;
    v9 = 15.9999999;
  }
  else
  {
    v9 = 4.00000006;
  }
  v10 = v9 - v3;
  v8 = 0.75;
  if (v10 >= 1.0)
    v8 = v10 * 0.75;
LABEL_22:
  result = 1.0;
  if (v8 >= 1.0)
    return v8;
  return result;
}

BOOL CompareQuantizeSortcolor(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 40) > *(double *)(a2 + 40);
}

void **ImageAnalyzer::DominantColors(ImageAnalyzer *this)
{
  void **v1;
  ITColor *v3;
  uint64_t v4;
  uint64_t i;
  double v6;
  double v7;
  double v8;
  uint64_t v9;
  __int128 *v10;
  void **v11;
  unint64_t v12;
  __int128 *v13;
  char *v14;
  unint64_t v15;
  __int128 v16;
  _OWORD *v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  unint64_t v21;
  char *v22;
  __int128 *v23;
  __int128 v24;
  char *v25;
  char *v26;
  __int128 *v27;
  __int128 v28;
  __int128 *v29;
  unint64_t v30;
  char *v31;
  _QWORD *v32;
  char *v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  unint64_t v37;
  char *v38;
  char *v39;
  uint64_t v40;
  double v42[2];
  ITColor v43;
  uint64_t v44;
  __int128 *v45;
  __int128 *v46;
  uint64_t v47;
  BOOL (*v48)(double *, double *);

  v1 = (void **)((char *)this + 320);
  if (*((_QWORD *)this + 41) == *((_QWORD *)this + 40))
  {
    v45 = 0;
    v46 = 0;
    v47 = 0;
    ITColor::ITColor(&v43);
    v4 = 0;
    for (i = 0; i != 3200; i += 8)
    {
      if (*(double *)(*((_QWORD *)this + 1) + i) >= 1.0)
      {
        v42[0] = *(double *)(*((_QWORD *)this + 1) + i);
        v43.var0 = ITColor::CreateFromHSVDoubles(v3, *(double *)(*(_QWORD *)this + v4), *(double *)(*(_QWORD *)this + v4 + 8), *(double *)(*(_QWORD *)this + v4 + 16));
        v43.var1 = v6;
        v43.var2 = v7;
        v43.var3 = v8;
        v44 = *(_QWORD *)(*(_QWORD *)this + v4 + 24);
        ImageAnalyzer::AddDominantColorEntryToSet(v9, v42, (void **)&v45);
      }
      v4 += 32;
    }
    v10 = v46;
    if (v46 != v45)
    {
      v48 = CompareSortColor;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(v45, v46, (unsigned int (**)(_QWORD, _QWORD))&v48, 126 - 2 * __clz(((char *)v46 - (char *)v45) >> 6), 1);
      std::vector<ITColor>::reserve(v1, ((char *)v46 - (char *)v45) >> 6);
      v11 = (void **)((char *)this + 344);
      std::vector<double>::reserve((void **)this + 43, ((char *)v46 - (char *)v45) >> 6);
      v10 = v46;
      if (v46 != v45)
      {
        v12 = 0;
        v10 = v45;
        do
        {
          v13 = &v10[4 * v12 + 1];
          v14 = (char *)*((_QWORD *)this + 41);
          v15 = *((_QWORD *)this + 42);
          if ((unint64_t)v14 >= v15)
          {
            v18 = (v14 - (_BYTE *)*v1) >> 5;
            v19 = v18 + 1;
            if ((unint64_t)(v18 + 1) >> 59)
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            v20 = v15 - (_QWORD)*v1;
            if (v20 >> 4 > v19)
              v19 = v20 >> 4;
            if ((unint64_t)v20 >= 0x7FFFFFFFFFFFFFE0)
              v21 = 0x7FFFFFFFFFFFFFFLL;
            else
              v21 = v19;
            if (v21)
              v22 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>((uint64_t)this + 336, v21);
            else
              v22 = 0;
            v23 = (__int128 *)&v22[32 * v18];
            v24 = v13[1];
            *v23 = *v13;
            v23[1] = v24;
            v26 = (char *)*((_QWORD *)this + 40);
            v25 = (char *)*((_QWORD *)this + 41);
            v27 = v23;
            if (v25 != v26)
            {
              do
              {
                v28 = *((_OWORD *)v25 - 1);
                *(v27 - 2) = *((_OWORD *)v25 - 2);
                *(v27 - 1) = v28;
                v27 -= 2;
                v25 -= 32;
              }
              while (v25 != v26);
              v25 = (char *)*v1;
            }
            v17 = v23 + 2;
            *((_QWORD *)this + 40) = v27;
            *((_QWORD *)this + 41) = v23 + 2;
            *((_QWORD *)this + 42) = &v22[32 * v21];
            if (v25)
              operator delete(v25);
          }
          else
          {
            v16 = v10[4 * v12 + 2];
            *(_OWORD *)v14 = *v13;
            *((_OWORD *)v14 + 1) = v16;
            v17 = v14 + 32;
          }
          *((_QWORD *)this + 41) = v17;
          v29 = &v45[4 * v12];
          v31 = (char *)*((_QWORD *)this + 44);
          v30 = *((_QWORD *)this + 45);
          if ((unint64_t)v31 >= v30)
          {
            v33 = (char *)*v11;
            v34 = (v31 - (_BYTE *)*v11) >> 3;
            v35 = v34 + 1;
            if ((unint64_t)(v34 + 1) >> 61)
              std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
            v36 = v30 - (_QWORD)v33;
            if (v36 >> 2 > v35)
              v35 = v36 >> 2;
            if ((unint64_t)v36 >= 0x7FFFFFFFFFFFFFF8)
              v37 = 0x1FFFFFFFFFFFFFFFLL;
            else
              v37 = v35;
            if (v37)
            {
              v38 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>((uint64_t)this + 360, v37);
              v33 = (char *)*((_QWORD *)this + 43);
              v31 = (char *)*((_QWORD *)this + 44);
            }
            else
            {
              v38 = 0;
            }
            v39 = &v38[8 * v34];
            *(_QWORD *)v39 = *(_QWORD *)v29;
            v32 = v39 + 8;
            while (v31 != v33)
            {
              v40 = *((_QWORD *)v31 - 1);
              v31 -= 8;
              *((_QWORD *)v39 - 1) = v40;
              v39 -= 8;
            }
            *((_QWORD *)this + 43) = v39;
            *((_QWORD *)this + 44) = v32;
            *((_QWORD *)this + 45) = &v38[8 * v37];
            if (v33)
              operator delete(v33);
          }
          else
          {
            *(_QWORD *)v31 = *(_QWORD *)v29;
            v32 = v31 + 8;
          }
          *((_QWORD *)this + 44) = v32;
          ++v12;
          v10 = v45;
        }
        while (v12 < ((char *)v46 - (char *)v45) >> 6);
      }
    }
    if (v10)
    {
      v46 = v10;
      operator delete(v10);
    }
  }
  return v1;
}

void sub_1BBDC34F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, void *__p, uint64_t a18)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

BOOL IsLightColor(_OWORD *a1)
{
  __int128 v1;
  double v2;
  ITColor v4;

  v1 = a1[1];
  *(_OWORD *)&v4.var0 = *a1;
  *(_OWORD *)&v4.var2 = v1;
  ITColor::GetLuminance(&v4);
  return v2 >= 0.180000007;
}

void ImageAnalyzer::EnhanceContrastWithColor(ITColor a1, ITColor a2, double a3)
{
  double var2;
  double var1;
  double var0;
  double HSVColor;
  double v8;
  double v9;
  double v10;
  double v11;
  ITColor *v12;
  double v13;
  double v14;
  double var3;
  ITColor v16;

  var3 = a2.var3;
  var2 = a2.var2;
  var1 = a2.var1;
  var0 = a2.var0;
  v16 = a1;
  HSVColor = ITColor::GetHSVColor(&v16);
  v9 = v8;
  v11 = v10;
  ITColor::GetLuminance(&v16);
  v16.var0 = var0;
  v16.var1 = var1;
  v16.var2 = var2;
  v16.var3 = var3;
  ITColor::GetLuminance(&v16);
  v13 = 1.0 - (1.0 - v11) * a3;
  if (v14 >= 0.180000007)
    v13 = v11 * a3;
  ITColor::CreateFromHSVDoubles(v12, HSVColor, v9, v13);
}

BOOL contrastsEnoughWithColor(ITColor a1, ITColor a2)
{
  double var3;
  double var2;
  double var1;
  double var0;
  double v6;
  _BOOL4 v7;
  double v8;
  ITColor v10;
  ITColor v11;
  ITColor v12;

  var3 = a2.var3;
  var2 = a2.var2;
  var1 = a2.var1;
  var0 = a2.var0;
  v11 = a1;
  v10 = a2;
  v12 = a1;
  ITColor::GetLuminance(&v12);
  v7 = v6 >= 0.180000007;
  v12.var0 = var0;
  v12.var1 = var1;
  v12.var2 = var2;
  v12.var3 = var3;
  ITColor::GetLuminance(&v12);
  return v7 != v8 >= 0.180000007 && ITColor::GetContrastWithColor(&v11, &v10) >= 3.0999999;
}

BOOL ImageAnalyzer::GetColorLuminanceTypeOfColor(ImageAnalyzer *this, ITColor a2)
{
  double v2;
  ITColor v4;

  v4 = a2;
  ITColor::GetLuminance(&v4);
  return v2 < 0.180000007;
}

double ImageAnalyzer::CalculateAlternateTextColorForColor(ITColor *this, ITColor *a2)
{
  return ITColor::CreateBlendedColorWithFraction(a2, 0.200000003, this[1]);
}

void ImageAnalyzer::CalculateOneShadowColor(ImageAnalyzer *this, ITColor *a2, ITColor *a3)
{
  double v5;
  double v6;
  double v7;
  __int128 *v8;
  __int128 v9;
  double v10;
  double v11;
  double v12;
  double v13;
  ITColor v14;

  ITColor::ITColor(&v14);
  ITColor::GetLuminance(a2);
  v6 = v5;
  ITColor::GetLuminance(a3);
  if (v6 >= v7)
    v8 = &ITColor::kBlack;
  else
    v8 = &ITColor::kWhite;
  v9 = v8[1];
  *(_OWORD *)&v14.var0 = *v8;
  *(_OWORD *)&v14.var2 = v9;
  ITColor::GetLuminance(&v14);
  v11 = v10;
  ITColor::GetLuminance(a3);
  v13 = vabdd_f64(v11, v12);
  ITColor::CreateBlendedColorWithFraction(&v14, 1.0 - ((v13 + v13) * -0.599999994 + 1.0), *a3);
}

double ImageAnalyzer::GetBorderMarginInPercentage(ImageAnalyzer *this)
{
  return *((double *)this + 46);
}

double ImageAnalyzer::GetBorderMarginInPixels(ImageAnalyzer *this)
{
  double v1;

  v1 = *((double *)this + 3);
  if (v1 <= *((double *)this + 2))
    v1 = *((double *)this + 2);
  return ceil(v1 * *((double *)this + 46));
}

double ImageAnalyzer::MakeDesaturatedTextColorFor(ImageAnalyzer *this, ITColor a2)
{
  double HSVColor;
  double v3;
  double v4;
  double v6[3];
  ITColor v7;

  v7 = a2;
  HSVColor = ITColor::GetHSVColor(&v7);
  v6[2] = v3;
  v6[0] = HSVColor;
  v6[1] = v4 * 0.800000012;
  return ITColor::CreateFromHSVColor(v6);
}

void ImageAnalyzer::AddDominantColorEntryToSet(uint64_t a1, double *a2, void **a3)
{
  _BYTE *v5;
  uint64_t v6;
  unint64_t v7;
  double *v8;
  double v9;
  double v10;
  __int128 v11;
  double HSVColor;
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
  _OWORD *v25;
  unint64_t v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _OWORD *v30;
  uint64_t v31;
  unint64_t v32;
  uint64_t v33;
  unint64_t v34;
  char *v35;
  char *v36;
  char *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  char *v41;
  char *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  ITColor v47;

  v5 = a3[1];
  if (v5 == *a3)
  {
    v25 = a3[1];
LABEL_7:
    v26 = (unint64_t)a3[2];
    if ((unint64_t)v25 >= v26)
    {
      v31 = ((char *)v25 - v5) >> 6;
      v32 = v31 + 1;
      if ((unint64_t)(v31 + 1) >> 58)
        std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
      v33 = v26 - (_QWORD)v5;
      if (v33 >> 5 > v32)
        v32 = v33 >> 5;
      if ((unint64_t)v33 >= 0x7FFFFFFFFFFFFFC0)
        v34 = 0x3FFFFFFFFFFFFFFLL;
      else
        v34 = v32;
      if (v34)
        v35 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>((uint64_t)(a3 + 2), v34);
      else
        v35 = 0;
      v36 = &v35[64 * v31];
      v37 = &v35[64 * v34];
      v38 = *(_OWORD *)a2;
      v39 = *((_OWORD *)a2 + 1);
      v40 = *((_OWORD *)a2 + 3);
      *((_OWORD *)v36 + 2) = *((_OWORD *)a2 + 2);
      *((_OWORD *)v36 + 3) = v40;
      *(_OWORD *)v36 = v38;
      *((_OWORD *)v36 + 1) = v39;
      v30 = v36 + 64;
      v42 = (char *)*a3;
      v41 = (char *)a3[1];
      if (v41 != *a3)
      {
        do
        {
          v43 = *((_OWORD *)v41 - 4);
          v44 = *((_OWORD *)v41 - 3);
          v45 = *((_OWORD *)v41 - 1);
          *((_OWORD *)v36 - 2) = *((_OWORD *)v41 - 2);
          *((_OWORD *)v36 - 1) = v45;
          *((_OWORD *)v36 - 4) = v43;
          *((_OWORD *)v36 - 3) = v44;
          v36 -= 64;
          v41 -= 64;
        }
        while (v41 != v42);
        v41 = (char *)*a3;
      }
      *a3 = v36;
      a3[1] = v30;
      a3[2] = v37;
      if (v41)
        operator delete(v41);
    }
    else
    {
      v27 = *(_OWORD *)a2;
      v28 = *((_OWORD *)a2 + 1);
      v29 = *((_OWORD *)a2 + 3);
      v25[2] = *((_OWORD *)a2 + 2);
      v25[3] = v29;
      *v25 = v27;
      v25[1] = v28;
      v30 = v25 + 4;
    }
    a3[1] = v30;
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v5 = *a3;
    while (1)
    {
      v8 = (double *)&v5[v6];
      v9 = v8[4];
      v10 = v8[5];
      v11 = *((_OWORD *)a2 + 2);
      v46 = *((_OWORD *)v8 + 1);
      *(_OWORD *)&v47.var0 = *((_OWORD *)a2 + 1);
      *(_OWORD *)&v47.var2 = v11;
      HSVColor = ITColor::GetHSVColor(&v47);
      v14 = v13;
      v16 = v15;
      ITColor::GetLuminance(&v47);
      v18 = v17;
      *(_OWORD *)&v47.var0 = v46;
      v47.var2 = v9;
      v47.var3 = v10;
      v19 = ITColor::GetHSVColor(&v47);
      v21 = v20;
      v23 = v22;
      ITColor::GetLuminance(&v47);
      if (isCloseToColor((ITColor *)1, HSVColor, v14, v16, v18, v19, v21, v23, v24, 0.0700000003))
        break;
      ++v7;
      v5 = *a3;
      v25 = a3[1];
      v6 += 64;
      if (v7 >= ((char *)v25 - (_BYTE *)*a3) >> 6)
        goto LABEL_7;
    }
    *(double *)((char *)*a3 + v6) = *a2 + *(double *)((char *)*a3 + v6);
  }
}

BOOL CompareSortColor(double *a1, double *a2)
{
  return *a1 > *a2;
}

void std::vector<ITColor>::reserve(void **a1, unint64_t a2)
{
  uint64_t v3;
  _BYTE *v4;
  int64_t v5;
  char *v6;
  char *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  char *v11;
  char *v12;
  __int128 v13;

  v4 = a1[2];
  v3 = (uint64_t)(a1 + 2);
  if (a2 > (v4 - (_BYTE *)*a1) >> 5)
  {
    if (a2 >> 59)
      std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]();
    v5 = (_BYTE *)a1[1] - (_BYTE *)*a1;
    v6 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v3, a2);
    v7 = &v6[v5 & 0xFFFFFFFFFFFFFFE0];
    v9 = &v6[32 * v8];
    v11 = (char *)*a1;
    v10 = (char *)a1[1];
    v12 = v7;
    if (v10 != *a1)
    {
      do
      {
        v13 = *((_OWORD *)v10 - 1);
        *((_OWORD *)v12 - 2) = *((_OWORD *)v10 - 2);
        *((_OWORD *)v12 - 1) = v13;
        v12 -= 32;
        v10 -= 32;
      }
      while (v10 != v11);
      v10 = (char *)*a1;
    }
    *a1 = v12;
    a1[1] = v7;
    a1[2] = v9;
    if (v10)
      operator delete(v10);
  }
}

BOOL AnalyzeImagePlease(_BOOL8 result, uint64_t a2)
{
  CGContext *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  double v12;
  __int128 v13;
  double v14;
  __int128 v15;
  double v16;
  double v17;
  _BYTE v18[32];
  double v19;
  double v20;
  double v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  double v39;
  ITColor v40;

  if (result)
  {
    v3 = (CGContext *)result;
    ImageAnalyzer::ImageAnalyzer((ImageAnalyzer *)v18);
    if (ImageAnalyzer::AnalyzeImage((ImageAnalyzer *)v18, v3))
    {
      v4 = v19;
      v5 = v20;
      v6 = v21;
      *(double *)a2 = v19;
      *(double *)(a2 + 8) = v5;
      *(double *)(a2 + 16) = v6;
      v7 = *(double *)&v22;
      *(_OWORD *)(a2 + 24) = v22;
      *(_OWORD *)(a2 + 40) = v23;
      *(_OWORD *)(a2 + 56) = v24;
      *(_OWORD *)(a2 + 72) = v25;
      *(_OWORD *)(a2 + 88) = v26;
      *(_OWORD *)(a2 + 104) = v27;
      *(_OWORD *)(a2 + 120) = v28;
      *(_OWORD *)(a2 + 136) = v29;
      v8 = v32;
      *(_OWORD *)(a2 + 152) = v30;
      *(_OWORD *)(a2 + 168) = v31;
      *(_QWORD *)(a2 + 184) = v8;
      v9 = v34;
      *(_OWORD *)(a2 + 224) = v33;
      *(_OWORD *)(a2 + 240) = v9;
      v10 = v36;
      *(_OWORD *)(a2 + 192) = v35;
      *(_OWORD *)(a2 + 208) = v10;
      v11 = v38;
      *(_OWORD *)(a2 + 256) = v37;
      *(_OWORD *)(a2 + 272) = v11;
      *(_BYTE *)(a2 + 296) = 1;
      v40.var0 = v4;
      v40.var1 = v5;
      v40.var2 = v6;
      v40.var3 = v7;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 297) = v12 >= 0.180000007;
      v13 = *(_OWORD *)(a2 + 48);
      *(_OWORD *)&v40.var0 = *(_OWORD *)(a2 + 32);
      *(_OWORD *)&v40.var2 = v13;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 298) = v14 >= 0.180000007;
      v15 = *(_OWORD *)(a2 + 80);
      *(_OWORD *)&v40.var0 = *(_OWORD *)(a2 + 64);
      *(_OWORD *)&v40.var2 = v15;
      ITColor::GetLuminance(&v40);
      *(_BYTE *)(a2 + 299) = v16 >= 0.180000007;
      v17 = v39;
      *(_BYTE *)(a2 + 300) = v39 > 0.0;
      *(double *)(a2 + 288) = v17;
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return *(_BYTE *)(a2 + 296) != 0;
    }
    else
    {
      ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v18);
      return 0;
    }
  }
  return result;
}

void sub_1BBDC3C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a9);
  _Unwind_Resume(a1);
}

double AnalyzedImageColors::GetSelectionColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  __int128 *v4;
  double v5;

  if (!*((_BYTE *)this + 296))
    return 0.333;
  if (a2 && a3)
    return *((double *)this + 8);
  if ((a2 & 1) != 0)
  {
    if (*((_BYTE *)this + 297))
      v4 = &ITColor::kBlack;
    else
      v4 = &ITColor::kWhite;
    v5 = 0.25;
  }
  else
  {
    if (*((_BYTE *)this + 297))
      v4 = &ITColor::kBlack;
    else
      v4 = &ITColor::kWhite;
    v5 = 0.150000006;
  }
  return ITColor::ColorWithAlphaComponent((ITColor *)v4, v5);
}

double ITColor::ColorWithAlphaComponent(ITColor *this, double a2)
{
  ITColor v3;

  ITColor::ITColor(&v3, this->var0, this->var1, this->var2, a2);
  return v3.var0;
}

double AnalyzedImageColors::GetSelectedRowTextColorForState(AnalyzedImageColors *this, int a2, int a3)
{
  __int128 v3;
  double v4;
  __int128 *v5;
  ITColor v7;

  if (*((_BYTE *)this + 296))
  {
    if (a2 && a3)
    {
      v3 = *((_OWORD *)this + 5);
      *(_OWORD *)&v7.var0 = *((_OWORD *)this + 4);
      *(_OWORD *)&v7.var2 = v3;
      ITColor::GetLuminance(&v7);
      if (v4 < 0.180000007)
        v5 = &ITColor::kWhite;
      else
        v5 = &ITColor::kBlack;
    }
    else if (*((_BYTE *)this + 297))
    {
      v5 = &ITColor::kBlack;
    }
    else
    {
      v5 = &ITColor::kWhite;
    }
  }
  else
  {
    v5 = &ITColor::kWhite;
  }
  return *(double *)v5;
}

BOOL IsLightLuminance(double a1)
{
  return a1 >= 0.180000007;
}

void std::vector<sortQuantizeColorEntry>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E739F5C0, MEMORY[0x1E0DE42D0]);
}

void sub_1BBDC3E98(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >= 0x555555555555556)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(48 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __n128 *v12;
  _OWORD *v13;
  _OWORD *v14;
  unsigned int (*v15)(_OWORD *, _OWORD *);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  int64_t v23;
  __n128 *v24;
  __n128 v25;
  __n128 *v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  _OWORD v33[3];
  _OWORD v34[6];
  __n128 v35;
  __n128 v36;
  __n128 v37;

  if ((_OWORD *)a1 != a2)
  {
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) / 48;
    if ((uint64_t)a2 - a1 >= 49)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (__n128 *)(a1 + 48 * v10);
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, v12);
        v12 -= 3;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        v16 = v14[1];
        v34[0] = *v14;
        v34[1] = v16;
        v34[2] = v14[2];
        v17 = *(_OWORD *)(a1 + 16);
        v33[0] = *(_OWORD *)a1;
        v33[1] = v17;
        v33[2] = *(_OWORD *)(a1 + 32);
        if (v15(v34, v33))
        {
          v18 = *v14;
          v19 = v14[1];
          v20 = v14[2];
          v22 = *(_OWORD *)(a1 + 16);
          v21 = *(_OWORD *)(a1 + 32);
          *v14 = *(_OWORD *)a1;
          v14[1] = v22;
          v14[2] = v21;
          *(_OWORD *)(a1 + 16) = v19;
          *(_OWORD *)(a1 + 32) = v20;
          *(_OWORD *)a1 = v18;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 3;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 49)
    {
      v23 = v8 / 0x30uLL;
      v24 = (__n128 *)(a2 - 3);
      do
      {
        v25 = *(__n128 *)(a1 + 16);
        v35 = *(__n128 *)a1;
        v36 = v25;
        v37 = *(__n128 *)(a1 + 32);
        v26 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v23);
        if (v24 == v26)
        {
          v30 = v36;
          *v26 = v35;
          v26[1] = v30;
          v26[2] = v37;
        }
        else
        {
          v27 = *v24;
          v28 = v24[2];
          v26[1] = v24[1];
          v26[2] = v28;
          *v26 = v27;
          v29 = v36;
          *v24 = v35;
          v24[1] = v29;
          v24[2] = v37;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (uint64_t)&v26[3], a4, 0xAAAAAAAAAAAAAAABLL * (((uint64_t)&v26[3] - a1) >> 4));
        }
        v24 -= 3;
      }
      while (v23-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  uint64_t v9;
  uint64_t v12;
  __n128 *v13;
  uint64_t v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  unsigned int (*v20)(_QWORD, _QWORD);
  __n128 v21;
  __n128 v22;
  __n128 result;
  __n128 v24;
  __n128 *v25;
  __n128 v26;
  __n128 v27;
  uint64_t v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  unsigned int (*v34)(_QWORD, _QWORD);
  __n128 v35;
  __n128 v36;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  __n128 v41;
  __n128 v42;
  __n128 v43;
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[4];
  uint64_t v48;
  uint64_t v49;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v48 = v4;
    v49 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= (uint64_t)(0xAAAAAAAAAAAAAAABLL * (((uint64_t)a4 - a1) >> 4)))
    {
      v12 = (0x5555555555555556 * (((uint64_t)a4 - a1) >> 4)) | 1;
      v13 = (__n128 *)(a1 + 48 * v12);
      v14 = 0x5555555555555556 * (((uint64_t)a4 - a1) >> 4) + 2;
      if (v14 < a3)
      {
        v15 = *a2;
        v16 = v13[1];
        v47[0] = *v13;
        v47[1] = v16;
        v17 = v13[3];
        v47[2] = v13[2];
        v18 = v13[4];
        v19 = v13[5];
        v46[0] = v17;
        v46[1] = v18;
        v46[2] = v19;
        if (v15(v47, v46))
        {
          v13 += 3;
          v12 = v14;
        }
      }
      v20 = *a2;
      v21 = v13[1];
      v45[0] = *v13;
      v45[1] = v21;
      v45[2] = v13[2];
      v22 = v7[1];
      v44[0] = *v7;
      v44[1] = v22;
      v44[2] = v7[2];
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v20)(v45, v44) & 1) == 0)
      {
        v24 = v7[1];
        v41 = *v7;
        v42 = v24;
        v43 = v7[2];
        do
        {
          v25 = v13;
          v26 = *v13;
          v27 = v13[2];
          v7[1] = v13[1];
          v7[2] = v27;
          *v7 = v26;
          if (v9 < v12)
            break;
          v28 = (2 * v12) | 1;
          v13 = (__n128 *)(a1 + 48 * v28);
          if (2 * v12 + 2 < a3)
          {
            v29 = *a2;
            v30 = v13[1];
            v40[0] = *v13;
            v40[1] = v30;
            v31 = v13[3];
            v40[2] = v13[2];
            v32 = v13[4];
            v33 = v13[5];
            v39[0] = v31;
            v39[1] = v32;
            v39[2] = v33;
            if (v29(v40, v39))
            {
              v13 += 3;
              v28 = 2 * v12 + 2;
            }
          }
          v34 = *a2;
          v35 = v13[1];
          v38[0] = *v13;
          v38[1] = v35;
          v38[2] = v13[2];
          v37[0] = v41;
          v37[1] = v42;
          v37[2] = v43;
          v7 = v25;
          v12 = v28;
        }
        while (!v34(v38, v37));
        result = v41;
        v36 = v43;
        v25[1] = v42;
        v25[2] = v36;
        *v25 = result;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_OWORD *, _OWORD *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v20[3];
  _OWORD v21[3];

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[3 * v6 + 3];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      v12 = *a2;
      v14 = v9[1];
      v13 = v9[2];
      v21[0] = *v9;
      v21[1] = v14;
      v21[2] = v13;
      v15 = v9[3];
      v16 = v9[5];
      v20[1] = v9[4];
      v20[2] = v16;
      v20[0] = v15;
      if (v12(v21, v20))
      {
        v9 += 3;
        v10 = v11;
      }
    }
    v17 = *v9;
    v18 = v9[2];
    a1[1] = v9[1];
    a1[2] = v18;
    *a1 = v17;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v9;
  unsigned int (*v10)(_QWORD, _QWORD);
  _OWORD *v11;
  __int128 v12;
  __int128 v13;
  double result;
  _OWORD *v15;
  __int128 v16;
  _OWORD *v17;
  __int128 v18;
  __int128 v19;
  unsigned int (*v20)(_QWORD, _QWORD);
  __int128 v21;
  char v22;
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  if (a4 >= 2)
  {
    v31 = v4;
    v32 = v5;
    v9 = (unint64_t)(a4 - 2) >> 1;
    v10 = *a3;
    v11 = (_OWORD *)(a1 + 48 * v9);
    v12 = v11[1];
    v30[0] = *v11;
    v30[1] = v12;
    v30[2] = v11[2];
    v13 = *(_OWORD *)(a2 - 32);
    v29[0] = *(_OWORD *)(a2 - 48);
    v29[1] = v13;
    v29[2] = *(_OWORD *)(a2 - 16);
    if (v10(v30, v29))
    {
      v15 = (_OWORD *)(a2 - 48);
      v16 = *(_OWORD *)(a2 - 32);
      v26 = *(_OWORD *)(a2 - 48);
      v27 = v16;
      v28 = *(_OWORD *)(a2 - 16);
      do
      {
        v17 = v11;
        v18 = *v11;
        v19 = v11[2];
        v15[1] = v11[1];
        v15[2] = v19;
        *v15 = v18;
        if (!v9)
          break;
        v9 = (v9 - 1) >> 1;
        v20 = *a3;
        v11 = (_OWORD *)(a1 + 48 * v9);
        v21 = v11[1];
        v25[0] = *v11;
        v25[1] = v21;
        v25[2] = v11[2];
        v24[0] = v26;
        v24[1] = v27;
        v24[2] = v28;
        v22 = v20(v25, v24);
        v15 = v17;
      }
      while ((v22 & 1) != 0);
      v23 = v27;
      *v17 = v26;
      v17[1] = v23;
      result = *(double *)&v28;
      v17[2] = v28;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(__int128 *a1, __int128 *a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4, char a5)
{
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  uint64_t v17;
  __int128 *v18;
  _OWORD *v19;
  __int128 *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  unsigned int (*v27)(_QWORD, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __n128 *v32;
  char v33;
  BOOL v34;
  unsigned int (*v35)(_QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[3];
  _OWORD v48[3];
  __int128 v49;
  __int128 v50;
  __int128 v51;

LABEL_1:
  v9 = a2 - 3;
  v10 = a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = 0xAAAAAAAAAAAAAAABLL * (a2 - v10);
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v35 = *a3;
        v37 = *(a2 - 2);
        v36 = *(a2 - 1);
        v48[0] = *(a2 - 3);
        v48[1] = v37;
        v48[2] = v36;
        v38 = *v10;
        v39 = v10[2];
        v47[1] = v10[1];
        v47[2] = v39;
        v47[0] = v38;
        if (v35(v48, v47))
        {
          v40 = *v10;
          v41 = v10[2];
          v50 = v10[1];
          v51 = v41;
          v49 = v40;
          v42 = *v9;
          v43 = *(a2 - 1);
          v10[1] = *(a2 - 2);
          v10[2] = v43;
          *v10 = v42;
          v44 = v50;
          *v9 = v49;
          *(a2 - 2) = v44;
          *(a2 - 1) = v51;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10, v10 + 3, a2 - 3, a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v10, (__n128 *)v10 + 3, (__n128 *)v10 + 6, (__n128 *)a2 - 3, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)v10, (__n128 *)v10 + 3, (__n128 *)v10 + 6, (__n128 *)v10 + 9, (__n128 *)a2 - 3, a3);
        return;
      default:
        if (v13 <= 1151)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = &v10[3 * (v14 >> 1)];
          if ((unint64_t)v13 < 0x1801)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v16, v10, a2 - 3, a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10, v16, a2 - 3, a3);
            v17 = 3 * v15;
            v18 = &v10[3 * v15 - 3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v10 + 3, v18, a2 - 6, a3);
            v19 = v10 + 6;
            v20 = &v10[v17 + 3];
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v19, v20, a2 - 9, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v18, v16, v20, a3);
            v21 = *a1;
            v22 = a1[2];
            v50 = a1[1];
            v51 = v22;
            v49 = v21;
            v23 = *v16;
            v24 = v16[2];
            a1[1] = v16[1];
            a1[2] = v24;
            *a1 = v23;
            v25 = v49;
            v26 = v51;
            v16[1] = v50;
            v16[2] = v26;
            *v16 = v25;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          v27 = *a3;
          v29 = *(a1 - 2);
          v28 = *(a1 - 1);
          v46[0] = *(a1 - 3);
          v46[1] = v29;
          v46[2] = v28;
          v30 = *a1;
          v31 = a1[2];
          v45[1] = a1[1];
          v45[2] = v31;
          v45[0] = v30;
          if ((((uint64_t (*)(_OWORD *, _OWORD *))v27)(v46, v45) & 1) == 0)
          {
            v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
            goto LABEL_16;
          }
LABEL_11:
          v32 = (__n128 *)std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(a1, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          if ((v33 & 1) == 0)
            goto LABEL_14;
          v34 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, v32, a3);
          v10 = (__int128 *)&v32[3];
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v32 + 3, (__n128 *)a2, a3))
          {
            v11 = v12 + 1;
            if (v34)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(a1, v32, a3, -v12, a5 & 1);
            v10 = (__int128 *)&v32[3];
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = (__int128 *)v32;
          if (v34)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,sortQuantizeColorEntry*>((uint64_t)v10, a2, a2, a3);
        return;
    }
  }
}

  v9 = a2 - 4;
  v10 = a1;
LABEL_2:
  v11 = 1 - a4;
  while (2)
  {
    a1 = v10;
    v12 = v11;
    v13 = (char *)a2 - (char *)v10;
    v14 = ((char *)a2 - (char *)v10) >> 6;
    switch(v14)
    {
      case 0uLL:
      case 1uLL:
        return;
      case 2uLL:
        v36 = *a3;
        v37 = *(a2 - 1);
        v39 = *(a2 - 4);
        v38 = *(a2 - 3);
        v54[2] = *(a2 - 2);
        v54[3] = v37;
        v54[0] = v39;
        v54[1] = v38;
        v40 = v10[3];
        v42 = *v10;
        v41 = v10[1];
        v53[2] = v10[2];
        v53[3] = v40;
        v53[0] = v42;
        v53[1] = v41;
        if (v36(v54, v53))
        {
          v43 = *v10;
          v44 = v10[1];
          v45 = v10[3];
          v57 = v10[2];
          v58 = v45;
          v55 = v43;
          v56 = v44;
          v46 = *v9;
          v47 = *(a2 - 3);
          v48 = *(a2 - 1);
          v10[2] = *(a2 - 2);
          v10[3] = v48;
          *v10 = v46;
          v10[1] = v47;
          v49 = v56;
          *v9 = v55;
          *(a2 - 3) = v49;
          v50 = v58;
          *(a2 - 2) = v57;
          *(a2 - 1) = v50;
        }
        return;
      case 3uLL:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10, v10 + 4, a2 - 4, a3);
        return;
      case 4uLL:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)v10, (__n128 *)v10 + 4, (__n128 *)v10 + 8, (__n128 *)a2 - 4, a3);
        return;
      case 5uLL:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, (__n128 *)v10 + 4, (__n128 *)v10 + 8, (__n128 *)v10 + 12, (__n128 *)a2 - 4, a3);
        return;
      default:
        if (v13 <= 1535)
        {
          if ((a5 & 1) != 0)
            std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          else
            std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          return;
        }
        if (v12 != 1)
        {
          v15 = v14 >> 1;
          v16 = &v10[4 * (v14 >> 1)];
          if ((unint64_t)v13 <= 0x2000)
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(&v10[4 * (v14 >> 1)], v10, a2 - 4, a3);
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          else
          {
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10, &v10[4 * (v14 >> 1)], a2 - 4, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10 + 4, v16 - 4, a2 - 8, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v10 + 8, &v10[4 * v15 + 4], a2 - 12, a3);
            std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v16 - 4, v16, &v10[4 * v15 + 4], a3);
            v17 = *v10;
            v18 = v10[1];
            v19 = v10[3];
            v57 = v10[2];
            v58 = v19;
            v55 = v17;
            v56 = v18;
            v20 = *v16;
            v21 = v16[1];
            v22 = v16[3];
            v10[2] = v16[2];
            v10[3] = v22;
            *v10 = v20;
            v10[1] = v21;
            v23 = v55;
            v24 = v56;
            v25 = v58;
            v16[2] = v57;
            v16[3] = v25;
            *v16 = v23;
            v16[1] = v24;
            if ((a5 & 1) != 0)
              goto LABEL_11;
          }
          v26 = *a3;
          v27 = *(v10 - 1);
          v29 = *(v10 - 4);
          v28 = *(v10 - 3);
          v52[2] = *(v10 - 2);
          v52[3] = v27;
          v52[0] = v29;
          v52[1] = v28;
          v30 = v10[3];
          v32 = *v10;
          v31 = v10[1];
          v51[2] = v10[2];
          v51[3] = v30;
          v51[0] = v32;
          v51[1] = v31;
          if ((((uint64_t (*)(_OWORD *, _OWORD *))v26)(v52, v51) & 1) == 0)
          {
            v10 = std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
            goto LABEL_16;
          }
LABEL_11:
          v33 = std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(v10, a2, (uint64_t (**)(_QWORD, _QWORD))a3);
          if ((v34 & 1) == 0)
            goto LABEL_14;
          v35 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)v10, (__n128 *)v33, a3);
          v10 = v33 + 4;
          if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)(v33 + 4), (__n128 *)a2, a3))
          {
            v11 = v12 + 1;
            if (v35)
              continue;
LABEL_14:
            std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(a1, v33, a3, -v12, a5 & 1);
            v10 = v33 + 4;
LABEL_16:
            a5 = 0;
            a4 = -v12;
            goto LABEL_2;
          }
          a4 = -v12;
          a2 = v33;
          if (v35)
            return;
          goto LABEL_1;
        }
        if (v10 != a2)
          std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>((uint64_t)v10, a2, a2, a3);
        return;
    }
  }
}

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  _OWORD *v6;
  __int128 *v7;
  uint64_t v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  _OWORD *v18;
  __int128 v19;
  uint64_t (*v20)(_QWORD, _QWORD);
  __int128 v21;
  _OWORD *v22;
  __int128 v23;
  _OWORD v24[3];
  _OWORD v25[3];
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _OWORD v29[3];
  _OWORD v30[3];
  uint64_t v31;
  uint64_t v32;

  if ((__int128 *)result != a2)
  {
    v31 = v3;
    v32 = v4;
    v6 = (_OWORD *)result;
    v7 = (__int128 *)(result + 48);
    if ((__int128 *)(result + 48) != a2)
    {
      v9 = 0;
      v10 = (__int128 *)result;
      do
      {
        v11 = v10;
        v10 = v7;
        v12 = *a3;
        v13 = v10[1];
        v30[0] = *v10;
        v30[1] = v13;
        v30[2] = v10[2];
        v14 = *v11;
        v15 = v11[2];
        v29[1] = v11[1];
        v29[2] = v15;
        v29[0] = v14;
        result = v12(v30, v29);
        if ((_DWORD)result)
        {
          v16 = v10[1];
          v26 = *v10;
          v27 = v16;
          v28 = v10[2];
          v17 = v9;
          while (1)
          {
            v18 = (_OWORD *)((char *)v6 + v17);
            v19 = *(_OWORD *)((char *)v6 + v17 + 16);
            v18[3] = *(_OWORD *)((char *)v6 + v17);
            v18[4] = v19;
            v18[5] = *(_OWORD *)((char *)v6 + v17 + 32);
            if (!v17)
              break;
            v20 = *a3;
            v25[0] = v26;
            v25[1] = v27;
            v25[2] = v28;
            v21 = *(v18 - 2);
            v24[0] = *(v18 - 3);
            v24[1] = v21;
            v24[2] = *(v18 - 1);
            result = v20(v25, v24);
            v17 -= 48;
            if ((result & 1) == 0)
            {
              v22 = (_OWORD *)((char *)v6 + v17 + 48);
              goto LABEL_10;
            }
          }
          v22 = v6;
LABEL_10:
          v23 = v27;
          *v22 = v26;
          v22[1] = v23;
          v22[2] = v28;
        }
        v7 = v10 + 3;
        v9 += 48;
      }
      while (v10 + 3 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v6;
  __int128 *i;
  __int128 *v9;
  uint64_t (*v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 *v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t (*v20)(_QWORD, _QWORD);
  __int128 v21;
  __int128 v22;
  _OWORD v23[3];
  _OWORD v24[3];
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[3];
  _OWORD v29[3];
  uint64_t v30;
  uint64_t v31;

  if ((__int128 *)result != a2)
  {
    v30 = v3;
    v31 = v4;
    v6 = (__int128 *)result;
    for (i = (__int128 *)(result + 48); v6 + 3 != a2; i = v6 + 3)
    {
      v9 = v6;
      v6 = i;
      v10 = *a3;
      v11 = v6[1];
      v29[0] = *v6;
      v29[1] = v11;
      v29[2] = v6[2];
      v12 = *v9;
      v13 = v9[2];
      v28[1] = v9[1];
      v28[2] = v13;
      v28[0] = v12;
      result = v10(v29, v28);
      if ((_DWORD)result)
      {
        v14 = v6[1];
        v25 = *v6;
        v26 = v14;
        v27 = v6[2];
        v15 = v6;
        do
        {
          v16 = v15 - 3;
          v17 = *(v15 - 2);
          v18 = *(v15 - 1);
          v19 = *(v15 - 4);
          *v15 = *(v15 - 3);
          v15[1] = v17;
          v15[2] = v18;
          v20 = *a3;
          v24[0] = v25;
          v24[1] = v26;
          v24[2] = v27;
          v21 = *(v15 - 6);
          v23[1] = *(v15 - 5);
          v23[2] = v19;
          v23[0] = v21;
          result = v20(v24, v23);
          v15 = v16;
        }
        while ((result & 1) != 0);
        v22 = v26;
        *v16 = v25;
        v16[1] = v22;
        v16[2] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  unsigned int (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  char v11;
  unsigned int (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t result;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  unsigned int (*v28)(_QWORD, _QWORD);
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  unsigned int (*v43)(_QWORD, _QWORD);
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[3];
  _OWORD v52[3];
  _OWORD v53[3];
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[3];
  _OWORD v58[3];
  _OWORD v59[3];
  _OWORD v60[18];

  v8 = *a4;
  v9 = a2[1];
  v60[0] = *a2;
  v60[1] = v9;
  v60[2] = a2[2];
  v10 = a1[1];
  v59[0] = *a1;
  v59[1] = v10;
  v59[2] = a1[2];
  v11 = v8(v60, v59);
  v12 = *a4;
  if ((v11 & 1) != 0)
  {
    v13 = a3[1];
    v54[0] = *a3;
    v54[1] = v13;
    v54[2] = a3[2];
    v14 = a2[1];
    v53[0] = *a2;
    v53[1] = v14;
    v53[2] = a2[2];
    if (v12(v54, v53))
    {
      v15 = *a1;
      v16 = a1[1];
      v17 = a1[2];
      v19 = a3[1];
      v18 = a3[2];
      *a1 = *a3;
      a1[1] = v19;
      a1[2] = v18;
      a3[2] = v17;
      result = 1;
LABEL_9:
      *a3 = v15;
      a3[1] = v16;
      return result;
    }
    v38 = *a1;
    v39 = a1[1];
    v40 = a1[2];
    v42 = a2[1];
    v41 = a2[2];
    *a1 = *a2;
    a1[1] = v42;
    a1[2] = v41;
    a2[1] = v39;
    a2[2] = v40;
    *a2 = v38;
    v43 = *a4;
    v44 = *a3;
    v45 = a3[2];
    v52[1] = a3[1];
    v52[2] = v45;
    v46 = *a2;
    v47 = a2[1];
    v51[2] = a2[2];
    v52[0] = v44;
    v51[0] = v46;
    v51[1] = v47;
    if (v43(v52, v51))
    {
      v15 = *a2;
      v16 = a2[1];
      v48 = a2[2];
      v50 = a3[1];
      v49 = a3[2];
      *a2 = *a3;
      a2[1] = v50;
      a2[2] = v49;
      a3[2] = v48;
      result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    v21 = a3[1];
    v58[0] = *a3;
    v58[1] = v21;
    v58[2] = a3[2];
    v22 = a2[1];
    v57[0] = *a2;
    v57[1] = v22;
    v57[2] = a2[2];
    result = ((uint64_t (*)(_OWORD *, _OWORD *))v12)(v58, v57);
    if (!(_DWORD)result)
      return result;
    v23 = *a2;
    v24 = a2[1];
    v25 = a2[2];
    v27 = a3[1];
    v26 = a3[2];
    *a2 = *a3;
    a2[1] = v27;
    a2[2] = v26;
    a3[1] = v24;
    a3[2] = v25;
    *a3 = v23;
    v28 = *a4;
    v29 = *a2;
    v30 = a2[2];
    v56[1] = a2[1];
    v56[2] = v30;
    v31 = *a1;
    v32 = a1[1];
    v55[2] = a1[2];
    v56[0] = v29;
    v55[0] = v31;
    v55[1] = v32;
    if (v28(v56, v55))
    {
      v33 = *a1;
      v34 = a1[1];
      v35 = a1[2];
      v37 = a2[1];
      v36 = a2[2];
      *a1 = *a2;
      a1[1] = v37;
      a1[2] = v36;
      a2[1] = v34;
      a2[2] = v35;
      result = 2;
      *a2 = v33;
      return result;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  __int128 *v4;
  __int128 v6;
  uint64_t (*v7)(_QWORD, _QWORD);
  __int128 v8;
  __int128 *v9;
  __int128 *v10;
  uint64_t (*v11)(_QWORD, _QWORD);
  __int128 v12;
  char v13;
  __int128 *v14;
  uint64_t (*v15)(_QWORD, _QWORD);
  __int128 v16;
  int v17;
  __int128 *v18;
  uint64_t (*v19)(_QWORD, _QWORD);
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  unsigned int (*v30)(_QWORD, _QWORD);
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t (*v34)(_QWORD, _QWORD);
  __int128 *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[3];
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  _OWORD v47[3];
  _OWORD v48[3];
  _OWORD v49[3];
  _OWORD v50[3];
  _OWORD v51[3];
  _OWORD v52[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

  v4 = a2;
  v6 = a1[1];
  v53 = *a1;
  v54 = v6;
  v55 = a1[2];
  v7 = *a3;
  v52[0] = v53;
  v52[1] = v6;
  v52[2] = v55;
  v8 = *(a2 - 2);
  v51[0] = *(a2 - 3);
  v51[1] = v8;
  v51[2] = *(a2 - 1);
  if ((v7(v52, v51) & 1) != 0)
  {
    v9 = a1;
    do
    {
      v10 = v9 + 3;
      v11 = *a3;
      v50[0] = v53;
      v50[1] = v54;
      v50[2] = v55;
      v12 = v9[4];
      v49[0] = v9[3];
      v49[1] = v12;
      v49[2] = v9[5];
      v13 = v11(v50, v49);
      v9 = v10;
    }
    while ((v13 & 1) == 0);
  }
  else
  {
    v14 = a1 + 3;
    do
    {
      v10 = v14;
      if (v14 >= v4)
        break;
      v15 = *a3;
      v48[0] = v53;
      v48[1] = v54;
      v48[2] = v55;
      v16 = v10[1];
      v47[0] = *v10;
      v47[1] = v16;
      v47[2] = v10[2];
      v17 = v15(v48, v47);
      v14 = v10 + 3;
    }
    while (!v17);
  }
  if (v10 >= v4)
  {
    v18 = v4;
  }
  else
  {
    do
    {
      v18 = v4 - 3;
      v19 = *a3;
      v46[0] = v53;
      v46[1] = v54;
      v46[2] = v55;
      v20 = *(v4 - 2);
      v45[0] = *(v4 - 3);
      v45[1] = v20;
      v45[2] = *(v4 - 1);
      v4 -= 3;
    }
    while ((v19(v46, v45) & 1) != 0);
  }
  while (v10 < v18)
  {
    v21 = *v10;
    v22 = v10[2];
    v57 = v10[1];
    v58 = v22;
    v56 = v21;
    v23 = *v18;
    v24 = v18[2];
    v10[1] = v18[1];
    v10[2] = v24;
    *v10 = v23;
    v25 = v56;
    v26 = v58;
    v18[1] = v57;
    v18[2] = v26;
    *v18 = v25;
    do
    {
      v44[0] = v53;
      v44[1] = v54;
      v44[2] = v55;
      v28 = v10[3];
      v27 = v10[4];
      v29 = v10[5];
      v10 += 3;
      v30 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v43[1] = v27;
      v43[2] = v29;
      v43[0] = v28;
    }
    while (!v30(v44, v43));
    do
    {
      v42[0] = v53;
      v42[1] = v54;
      v42[2] = v55;
      v32 = *(v18 - 3);
      v31 = *(v18 - 2);
      v33 = *(v18 - 1);
      v18 -= 3;
      v34 = *a3;
      v41[1] = v31;
      v41[2] = v33;
      v41[0] = v32;
    }
    while ((v34(v42, v41) & 1) != 0);
  }
  v35 = v10 - 3;
  if (v10 - 3 != a1)
  {
    v36 = *v35;
    v37 = *(v10 - 1);
    a1[1] = *(v10 - 2);
    a1[2] = v37;
    *a1 = v36;
  }
  v38 = v53;
  v39 = v55;
  *(v10 - 2) = v54;
  *(v10 - 1) = v39;
  *v35 = v38;
  return v10;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortQuantizeColorEntry *,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  __int128 v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 *v10;
  __int128 *v11;
  __int128 *v12;
  unsigned int (*v13)(_QWORD, _QWORD);
  __int128 v14;
  uint64_t (*v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 *v17;
  __int128 *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t (*v27)(_QWORD, _QWORD);
  __int128 v28;
  __int128 v29;
  __int128 v30;
  unsigned int (*v31)(_QWORD, _QWORD);
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v37[3];
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[3];
  _OWORD v44[3];
  _OWORD v45[3];
  _OWORD v46[3];
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;

  v6 = 0;
  v7 = a1[1];
  v47 = *a1;
  v48 = v7;
  v49 = a1[2];
  do
  {
    v8 = *a3;
    v9 = a1[v6 + 4];
    v46[0] = a1[v6 + 3];
    v46[1] = v9;
    v46[2] = a1[v6 + 5];
    v45[0] = v47;
    v45[1] = v48;
    v45[2] = v49;
    v6 += 3;
  }
  while ((v8(v46, v45) & 1) != 0);
  v10 = &a1[v6];
  v11 = &a1[v6 - 3];
  if (v6 == 3)
  {
    while (v10 < a2)
    {
      v15 = *a3;
      v12 = a2 - 3;
      v16 = *(a2 - 2);
      v44[0] = *(a2 - 3);
      v44[1] = v16;
      v44[2] = *(a2 - 1);
      v43[0] = v47;
      v43[1] = v48;
      v43[2] = v49;
      a2 -= 3;
      if ((v15(v44, v43) & 1) != 0)
        goto LABEL_9;
    }
    v12 = a2;
  }
  else
  {
    do
    {
      v12 = a2 - 3;
      v13 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v14 = *(a2 - 2);
      v42[0] = *(a2 - 3);
      v42[1] = v14;
      v42[2] = *(a2 - 1);
      v41[0] = v47;
      v41[1] = v48;
      v41[2] = v49;
      a2 -= 3;
    }
    while (!v13(v42, v41));
  }
LABEL_9:
  if (v10 < v12)
  {
    v17 = v10;
    v18 = v12;
    do
    {
      v20 = v17[1];
      v50 = *v17;
      v19 = v50;
      v51 = v20;
      v52 = v17[2];
      v21 = v52;
      v22 = *v18;
      v23 = v18[2];
      v17[1] = v18[1];
      v17[2] = v23;
      *v17 = v22;
      v18[1] = v20;
      v18[2] = v21;
      *v18 = v19;
      do
      {
        v25 = v17[4];
        v24 = v17[5];
        v26 = v17[3];
        v17 += 3;
        v27 = *a3;
        v40[0] = v26;
        v40[1] = v25;
        v40[2] = v24;
        v39[1] = v48;
        v39[2] = v49;
        v39[0] = v47;
      }
      while ((v27(v40, v39) & 1) != 0);
      do
      {
        v29 = *(v18 - 2);
        v28 = *(v18 - 1);
        v30 = *(v18 - 3);
        v18 -= 3;
        v31 = (unsigned int (*)(_QWORD, _QWORD))*a3;
        v38[0] = v30;
        v38[1] = v29;
        v38[2] = v28;
        v37[1] = v48;
        v37[2] = v49;
        v37[0] = v47;
      }
      while (!v31(v38, v37));
    }
    while (v17 < v18);
    v11 = v17 - 3;
  }
  if (v11 != a1)
  {
    v32 = *v11;
    v33 = v11[2];
    a1[1] = v11[1];
    a1[2] = v33;
    *a1 = v32;
  }
  v34 = v47;
  v35 = v49;
  v11[1] = v48;
  v11[2] = v35;
  *v11 = v34;
  return v11;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, unsigned int (**a3)(_QWORD, _QWORD))
{
  unint64_t v6;
  _BOOL8 result;
  unsigned int (*v8)(_QWORD, _QWORD);
  __n128 v9;
  __n128 v10;
  __n128 *v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 *v17;
  __n128 *v18;
  uint64_t v19;
  int v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  uint64_t v26;
  _OWORD *v27;
  __int128 v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __int128 v30;
  __n128 *v31;
  __n128 v32;
  _OWORD v33[3];
  _OWORD v34[3];
  __n128 v35;
  __n128 v36;
  __n128 v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[6];

  v6 = 0xAAAAAAAAAAAAAAABLL * (a2 - a1);
  result = 1;
  switch(v6)
  {
    case 0uLL:
    case 1uLL:
      return result;
    case 2uLL:
      v8 = *a3;
      v9 = a2[-2];
      v41[0] = a2[-3];
      v41[1] = v9;
      v41[2] = a2[-1];
      v10 = a1[1];
      v40[0] = *a1;
      v40[1] = v10;
      v40[2] = a1[2];
      if (v8(v41, v40))
      {
        v11 = a2 - 3;
        v12 = *a1;
        v13 = a1[1];
        v14 = a1[2];
        v16 = a2[-2];
        v15 = a2[-1];
        *a1 = a2[-3];
        a1[1] = v16;
        a1[2] = v15;
        v11[1] = v13;
        v11[2] = v14;
        *v11 = v12;
      }
      return 1;
    case 3uLL:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a2[-3].n128_u64, a3);
      return 1;
    case 4uLL:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a2 - 3, a3);
      return 1;
    case 5uLL:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 3, a1 + 6, a1 + 9, a2 - 3, a3);
      return 1;
    default:
      v17 = a1 + 6;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, (__n128 *)a1[3].n128_u64, (__n128 *)a1[6].n128_u64, a3);
      v18 = a1 + 9;
      if (&a1[9] == a2)
        return 1;
      v19 = 0;
      v20 = 0;
      break;
  }
  while (1)
  {
    v21 = *a3;
    v22 = v18[1];
    v39[0] = *v18;
    v39[1] = v22;
    v39[2] = v18[2];
    v23 = *v17;
    v24 = v17[2];
    v38[1] = v17[1];
    v38[2] = v24;
    v38[0] = v23;
    if (v21(v39, v38))
    {
      v25 = v18[1];
      v35 = *v18;
      v36 = v25;
      v37 = v18[2];
      v26 = v19;
      while (1)
      {
        v27 = (_OWORD *)((char *)a1->n128_u64 + v26);
        v28 = *(__int128 *)((char *)&a1[7] + v26);
        v27[9] = *(__n128 *)((char *)&a1[6] + v26);
        v27[10] = v28;
        v27[11] = *(__n128 *)((char *)&a1[8] + v26);
        if (v26 == -96)
          break;
        v29 = *a3;
        v34[0] = v35;
        v34[1] = v36;
        v34[2] = v37;
        v30 = v27[4];
        v33[0] = v27[3];
        v33[1] = v30;
        v33[2] = v27[5];
        v26 -= 48;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v29)(v34, v33) & 1) == 0)
        {
          v31 = (__n128 *)((char *)a1 + v26 + 144);
          goto LABEL_12;
        }
      }
      v31 = a1;
LABEL_12:
      v32 = v36;
      *v31 = v35;
      v31[1] = v32;
      v31[2] = v37;
      if (++v20 == 8)
        return &v18[3] == a2;
    }
    v17 = v18;
    v19 += 48;
    v18 += 3;
    if (v18 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(_QWORD, _QWORD))
{
  unsigned int (*v10)(_QWORD, _QWORD);
  __n128 v11;
  __n128 v12;
  __n128 result;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  unsigned int (*v19)(_QWORD, _QWORD);
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  unsigned int (*v29)(_QWORD, _QWORD);
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  _OWORD v38[3];
  _OWORD v39[3];
  _OWORD v40[3];
  _OWORD v41[3];
  _OWORD v42[3];
  _OWORD v43[12];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a2, a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v43[0] = *a4;
  v43[1] = v11;
  v43[2] = a4[2];
  v12 = a3[1];
  v42[0] = *a3;
  v42[1] = v12;
  v42[2] = a3[2];
  if (v10(v43, v42))
  {
    v14 = *a3;
    v15 = a3[1];
    v16 = a3[2];
    v18 = a4[1];
    v17 = a4[2];
    *a3 = *a4;
    a3[1] = v18;
    a3[2] = v17;
    a4[1] = v15;
    a4[2] = v16;
    *a4 = v14;
    v19 = *a5;
    v20 = *a3;
    v21 = a3[2];
    v41[1] = a3[1];
    v41[2] = v21;
    v22 = *a2;
    v23 = a2[1];
    v40[2] = a2[2];
    v41[0] = v20;
    v40[0] = v22;
    v40[1] = v23;
    if (v19(v41, v40))
    {
      v24 = *a2;
      v25 = a2[1];
      v26 = a2[2];
      v28 = a3[1];
      v27 = a3[2];
      *a2 = *a3;
      a2[1] = v28;
      a2[2] = v27;
      a3[1] = v25;
      a3[2] = v26;
      *a3 = v24;
      v29 = *a5;
      v30 = *a2;
      v31 = a2[2];
      v39[1] = a2[1];
      v39[2] = v31;
      v32 = *a1;
      v33 = a1[1];
      v38[2] = a1[2];
      v39[0] = v30;
      v38[0] = v32;
      v38[1] = v33;
      if (v29(v39, v38))
      {
        result = *a1;
        v34 = a1[1];
        v35 = a1[2];
        v37 = a2[1];
        v36 = a2[2];
        *a1 = *a2;
        a1[1] = v37;
        a1[2] = v36;
        a2[1] = v34;
        a2[2] = v35;
        *a2 = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(_QWORD, _QWORD))
{
  unsigned int (*v12)(_QWORD, _QWORD);
  __n128 v13;
  __n128 v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  unsigned int (*v31)(_QWORD, _QWORD);
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 v40;
  unsigned int (*v41)(_QWORD, _QWORD);
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __int128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  _OWORD v50[3];
  _OWORD v51[3];
  _OWORD v52[3];
  _OWORD v53[3];
  _OWORD v54[3];
  _OWORD v55[3];
  _OWORD v56[3];
  _OWORD v57[15];

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v57[0] = *a5;
  v57[1] = v13;
  v57[2] = a5[2];
  v14 = a4[1];
  v56[0] = *a4;
  v56[1] = v14;
  v56[2] = a4[2];
  if (v12(v57, v56))
  {
    v16 = *a4;
    v17 = a4[1];
    v18 = a4[2];
    v20 = a5[1];
    v19 = a5[2];
    *a4 = *a5;
    a4[1] = v20;
    a4[2] = v19;
    a5[1] = v17;
    a5[2] = v18;
    *a5 = v16;
    v21 = *a6;
    v22 = *a4;
    v23 = a4[2];
    v55[1] = a4[1];
    v55[2] = v23;
    v24 = *a3;
    v25 = a3[1];
    v54[2] = a3[2];
    v55[0] = v22;
    v54[0] = v24;
    v54[1] = v25;
    if (v21(v55, v54))
    {
      v26 = *a3;
      v27 = a3[1];
      v28 = a3[2];
      v30 = a4[1];
      v29 = a4[2];
      *a3 = *a4;
      a3[1] = v30;
      a3[2] = v29;
      a4[1] = v27;
      a4[2] = v28;
      *a4 = v26;
      v31 = *a6;
      v32 = *a3;
      v33 = a3[2];
      v53[1] = a3[1];
      v53[2] = v33;
      v34 = *a2;
      v35 = a2[1];
      v52[2] = a2[2];
      v53[0] = v32;
      v52[0] = v34;
      v52[1] = v35;
      if (v31(v53, v52))
      {
        v36 = *a2;
        v37 = a2[1];
        v38 = a2[2];
        v40 = a3[1];
        v39 = a3[2];
        *a2 = *a3;
        a2[1] = v40;
        a2[2] = v39;
        a3[1] = v37;
        a3[2] = v38;
        *a3 = v36;
        v41 = *a6;
        v42 = *a2;
        v43 = a2[2];
        v51[1] = a2[1];
        v51[2] = v43;
        v44 = *(__n128 *)a1;
        v45 = *(_OWORD *)(a1 + 16);
        v50[2] = *(_OWORD *)(a1 + 32);
        v51[0] = v42;
        v50[0] = v44;
        v50[1] = v45;
        if (v41(v51, v50))
        {
          result = *(__n128 *)a1;
          v46 = *(__n128 *)(a1 + 16);
          v47 = *(__n128 *)(a1 + 32);
          v49 = a2[1];
          v48 = a2[2];
          *(__n128 *)a1 = *a2;
          *(__n128 *)(a1 + 16) = v49;
          *(__n128 *)(a1 + 32) = v48;
          a2[1] = v46;
          a2[2] = v47;
          *a2 = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortColorEntry>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 58)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(a2 << 6);
}

_OWORD *std::__partial_sort_impl[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,sortColorEntry*>(uint64_t a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  __n128 *v12;
  _OWORD *v13;
  _OWORD *v14;
  unsigned int (*v15)(_OWORD *, _OWORD *);
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __n128 *v28;
  __n128 v29;
  __n128 v30;
  __n128 *v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  _OWORD v41[4];
  _OWORD v42[8];
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;

  if ((_OWORD *)a1 != a2)
  {
    v8 = (uint64_t)a2 - a1;
    v9 = ((uint64_t)a2 - a1) >> 6;
    if ((uint64_t)a2 - a1 >= 65)
    {
      v10 = (unint64_t)(v9 - 2) >> 1;
      v11 = v10 + 1;
      v12 = (__n128 *)(a1 + (v10 << 6));
      do
      {
        std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, v12);
        v12 -= 4;
        --v11;
      }
      while (v11);
    }
    v13 = a2;
    if (a2 != a3)
    {
      v14 = a2;
      do
      {
        v15 = (unsigned int (*)(_OWORD *, _OWORD *))*a4;
        v16 = v14[1];
        v42[0] = *v14;
        v42[1] = v16;
        v17 = v14[3];
        v42[2] = v14[2];
        v42[3] = v17;
        v18 = *(_OWORD *)(a1 + 16);
        v41[0] = *(_OWORD *)a1;
        v41[1] = v18;
        v19 = *(_OWORD *)(a1 + 48);
        v41[2] = *(_OWORD *)(a1 + 32);
        v41[3] = v19;
        if (v15(v42, v41))
        {
          v21 = v14[2];
          v20 = v14[3];
          v23 = *v14;
          v22 = v14[1];
          v24 = *(_OWORD *)(a1 + 48);
          v26 = *(_OWORD *)a1;
          v25 = *(_OWORD *)(a1 + 16);
          v14[2] = *(_OWORD *)(a1 + 32);
          v14[3] = v24;
          *v14 = v26;
          v14[1] = v25;
          *(_OWORD *)a1 = v23;
          *(_OWORD *)(a1 + 16) = v22;
          *(_OWORD *)(a1 + 32) = v21;
          *(_OWORD *)(a1 + 48) = v20;
          std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a4, v9, (__n128 *)a1);
        }
        v14 += 4;
      }
      while (v14 != a3);
      v13 = a3;
    }
    if (v8 >= 65)
    {
      v27 = (unint64_t)v8 >> 6;
      v28 = (__n128 *)(a2 - 4);
      do
      {
        v29 = *(__n128 *)(a1 + 16);
        v43 = *(__n128 *)a1;
        v44 = v29;
        v30 = *(__n128 *)(a1 + 48);
        v45 = *(__n128 *)(a1 + 32);
        v46 = v30;
        v31 = (__n128 *)std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (unsigned int (**)(_OWORD *, _OWORD *))a4, v27);
        if (v28 == v31)
        {
          v37 = v44;
          *v31 = v43;
          v31[1] = v37;
          v38 = v46;
          v31[2] = v45;
          v31[3] = v38;
        }
        else
        {
          v32 = *v28;
          v33 = v28[1];
          v34 = v28[3];
          v31[2] = v28[2];
          v31[3] = v34;
          *v31 = v32;
          v31[1] = v33;
          v35 = v44;
          *v28 = v43;
          v28[1] = v35;
          v36 = v46;
          v28[2] = v45;
          v28[3] = v36;
          std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (uint64_t)&v31[4], a4, ((uint64_t)&v31[4] - a1) >> 6);
        }
        v28 -= 4;
      }
      while (v27-- > 2);
    }
    return v13;
  }
  return a3;
}

__n128 std::__sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, unsigned int (**a2)(_QWORD, _QWORD), uint64_t a3, __n128 *a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  __n128 *v7;
  int64_t v9;
  uint64_t v12;
  uint64_t v13;
  __n128 *v14;
  uint64_t v15;
  unsigned int (*v16)(_QWORD, _QWORD);
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  unsigned int (*v21)(_QWORD, _QWORD);
  __n128 v22;
  __n128 v23;
  __n128 v24;
  __n128 v25;
  __n128 result;
  __n128 v27;
  __n128 v28;
  __n128 *v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  unsigned int (*v34)(_QWORD, _QWORD);
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  _OWORD v44[4];
  _OWORD v45[4];
  _OWORD v46[4];
  _OWORD v47[4];
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[4];
  uint64_t v56;
  uint64_t v57;

  v6 = a3 - 2;
  if (a3 >= 2)
  {
    v56 = v4;
    v57 = v5;
    v7 = a4;
    v9 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) >= ((uint64_t)a4 - a1) >> 6)
    {
      v12 = ((uint64_t)a4 - a1) >> 5;
      v13 = v12 + 1;
      v14 = (__n128 *)(a1 + ((v12 + 1) << 6));
      v15 = v12 + 2;
      if (v12 + 2 < a3)
      {
        v16 = *a2;
        v17 = v14[1];
        v55[0] = *v14;
        v55[1] = v17;
        v18 = v14[3];
        v55[2] = v14[2];
        v55[3] = v18;
        v19 = v14[5];
        v54[0] = v14[4];
        v54[1] = v19;
        v20 = v14[7];
        v54[2] = v14[6];
        v54[3] = v20;
        if (v16(v55, v54))
        {
          v14 += 4;
          v13 = v15;
        }
      }
      v21 = *a2;
      v22 = v14[1];
      v53[0] = *v14;
      v53[1] = v22;
      v23 = v14[3];
      v53[2] = v14[2];
      v53[3] = v23;
      v24 = v7[1];
      v52[0] = *v7;
      v52[1] = v24;
      v25 = v7[3];
      v52[2] = v7[2];
      v52[3] = v25;
      if ((((uint64_t (*)(_OWORD *, _OWORD *))v21)(v53, v52) & 1) == 0)
      {
        v27 = v7[1];
        v48 = *v7;
        v49 = v27;
        v28 = v7[3];
        v50 = v7[2];
        v51 = v28;
        do
        {
          v29 = v14;
          v30 = *v14;
          v31 = v14[1];
          v32 = v14[3];
          v7[2] = v14[2];
          v7[3] = v32;
          *v7 = v30;
          v7[1] = v31;
          if (v9 < v13)
            break;
          v33 = (2 * v13) | 1;
          v14 = (__n128 *)(a1 + (v33 << 6));
          if (2 * v13 + 2 < a3)
          {
            v34 = *a2;
            v35 = v14[1];
            v47[0] = *v14;
            v47[1] = v35;
            v36 = v14[3];
            v47[2] = v14[2];
            v47[3] = v36;
            v37 = v14[5];
            v46[0] = v14[4];
            v46[1] = v37;
            v38 = v14[7];
            v46[2] = v14[6];
            v46[3] = v38;
            if (v34(v47, v46))
            {
              v14 += 4;
              v33 = 2 * v13 + 2;
            }
          }
          v39 = *a2;
          v40 = v14[1];
          v45[0] = *v14;
          v45[1] = v40;
          v41 = v14[3];
          v45[2] = v14[2];
          v45[3] = v41;
          v44[0] = v48;
          v44[1] = v49;
          v44[2] = v50;
          v44[3] = v51;
          v7 = v29;
          v13 = v33;
        }
        while (!v39(v45, v44));
        result = v48;
        v42 = v49;
        v43 = v51;
        v29[2] = v50;
        v29[3] = v43;
        *v29 = result;
        v29[1] = v42;
      }
    }
  }
  return result;
}

_OWORD *std::__floyd_sift_down[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, unsigned int (**a2)(_OWORD *, _OWORD *), uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _OWORD *v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int (*v12)(_OWORD *, _OWORD *);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _OWORD v23[4];
  _OWORD v24[4];

  v6 = 0;
  v7 = a3 - 2;
  if (a3 < 2)
    v7 = a3 - 1;
  v8 = v7 >> 1;
  do
  {
    v9 = &a1[4 * v6 + 4];
    v10 = (2 * v6) | 1;
    v11 = 2 * v6 + 2;
    if (v11 < a3)
    {
      v12 = *a2;
      v13 = v9[3];
      v15 = *v9;
      v14 = v9[1];
      v24[2] = v9[2];
      v24[3] = v13;
      v24[0] = v15;
      v24[1] = v14;
      v16 = v9[7];
      v18 = v9[4];
      v17 = v9[5];
      v23[2] = v9[6];
      v23[3] = v16;
      v23[0] = v18;
      v23[1] = v17;
      if (v12(v24, v23))
      {
        v9 += 4;
        v10 = v11;
      }
    }
    v19 = *v9;
    v20 = v9[1];
    v21 = v9[3];
    a1[2] = v9[2];
    a1[3] = v21;
    *a1 = v19;
    a1[1] = v20;
    a1 = v9;
    v6 = v10;
  }
  while (v10 <= v8);
  return v9;
}

double std::__sift_up[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, uint64_t a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unsigned int (*v10)(_QWORD, _QWORD);
  unint64_t v11;
  _OWORD *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  double result;
  _OWORD *v18;
  __int128 v19;
  __int128 v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __int128 v26;
  __int128 v27;
  char v28;
  __int128 v29;
  __int128 v30;
  _OWORD v31[4];
  _OWORD v32[4];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _OWORD v37[4];
  _OWORD v38[4];
  uint64_t v39;
  uint64_t v40;

  v6 = a4 - 2;
  if (a4 >= 2)
  {
    v39 = v4;
    v40 = v5;
    v10 = *a3;
    v11 = v6 >> 1;
    v12 = (_OWORD *)(a1 + (v6 >> 1 << 6));
    v13 = v12[1];
    v38[0] = *v12;
    v38[1] = v13;
    v14 = v12[3];
    v38[2] = v12[2];
    v38[3] = v14;
    v15 = *(_OWORD *)(a2 - 48);
    v37[0] = *(_OWORD *)(a2 - 64);
    v37[1] = v15;
    v16 = *(_OWORD *)(a2 - 16);
    v37[2] = *(_OWORD *)(a2 - 32);
    v37[3] = v16;
    if (v10(v38, v37))
    {
      v18 = (_OWORD *)(a2 - 64);
      v19 = *(_OWORD *)(a2 - 48);
      v33 = *(_OWORD *)(a2 - 64);
      v34 = v19;
      v20 = *(_OWORD *)(a2 - 16);
      v35 = *(_OWORD *)(a2 - 32);
      v36 = v20;
      do
      {
        v21 = v12;
        v22 = *v12;
        v23 = v12[1];
        v24 = v12[3];
        v18[2] = v12[2];
        v18[3] = v24;
        *v18 = v22;
        v18[1] = v23;
        if (!v11)
          break;
        v25 = *a3;
        v11 = (v11 - 1) >> 1;
        v12 = (_OWORD *)(a1 + (v11 << 6));
        v26 = v12[1];
        v32[0] = *v12;
        v32[1] = v26;
        v27 = v12[3];
        v32[2] = v12[2];
        v32[3] = v27;
        v31[0] = v33;
        v31[1] = v34;
        v31[2] = v35;
        v31[3] = v36;
        v28 = v25(v32, v31);
        v18 = v21;
      }
      while ((v28 & 1) != 0);
      v29 = v34;
      *v21 = v33;
      v21[1] = v29;
      result = *(double *)&v35;
      v30 = v36;
      v21[2] = v35;
      v21[3] = v30;
    }
  }
  return result;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(__int128 *a1, __int128 *a2, unsigned int (**a3)(_QWORD, _QWORD), uint64_t a4, char a5)
{
  __int128 *v9;
  __int128 *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  __int128 *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  unsigned int (*v26)(_QWORD, _QWORD);
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 *v33;
  char v34;
  BOOL v35;
  unsigned int (*v36)(_QWORD, _QWORD);
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;

uint64_t std::__insertion_sort[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  _OWORD *v6;
  __int128 *v7;
  uint64_t v9;
  __int128 *v10;
  __int128 *v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  _OWORD *v21;
  __int128 v22;
  __int128 v23;
  uint64_t (*v24)(_QWORD, _QWORD);
  __int128 v25;
  __int128 v26;
  _OWORD *v27;
  __int128 v28;
  __int128 v29;
  _OWORD v30[4];
  _OWORD v31[4];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[4];
  _OWORD v37[4];
  uint64_t v38;
  uint64_t v39;

  if ((__int128 *)result != a2)
  {
    v38 = v3;
    v39 = v4;
    v6 = (_OWORD *)result;
    v7 = (__int128 *)(result + 64);
    if ((__int128 *)(result + 64) != a2)
    {
      v9 = 0;
      v10 = (__int128 *)result;
      do
      {
        v11 = v10;
        v10 = v7;
        v12 = *a3;
        v13 = v10[1];
        v37[0] = *v10;
        v37[1] = v13;
        v14 = v10[3];
        v37[2] = v10[2];
        v37[3] = v14;
        v15 = v11[3];
        v17 = *v11;
        v16 = v11[1];
        v36[2] = v11[2];
        v36[3] = v15;
        v36[0] = v17;
        v36[1] = v16;
        result = v12(v37, v36);
        if ((_DWORD)result)
        {
          v18 = v10[1];
          v32 = *v10;
          v33 = v18;
          v19 = v10[3];
          v34 = v10[2];
          v35 = v19;
          v20 = v9;
          while (1)
          {
            v21 = (_OWORD *)((char *)v6 + v20);
            v22 = *(_OWORD *)((char *)v6 + v20 + 16);
            v21[4] = *(_OWORD *)((char *)v6 + v20);
            v21[5] = v22;
            v23 = *(_OWORD *)((char *)v6 + v20 + 48);
            v21[6] = *(_OWORD *)((char *)v6 + v20 + 32);
            v21[7] = v23;
            if (!v20)
              break;
            v24 = *a3;
            v31[0] = v32;
            v31[1] = v33;
            v31[2] = v34;
            v31[3] = v35;
            v25 = *(v21 - 3);
            v30[0] = *(v21 - 4);
            v30[1] = v25;
            v26 = *(v21 - 1);
            v30[2] = *(v21 - 2);
            v30[3] = v26;
            result = v24(v31, v30);
            v20 -= 64;
            if ((result & 1) == 0)
            {
              v27 = (_OWORD *)((char *)v6 + v20 + 64);
              goto LABEL_10;
            }
          }
          v27 = v6;
LABEL_10:
          v28 = v33;
          *v27 = v32;
          v27[1] = v28;
          v29 = v35;
          v27[2] = v34;
          v27[3] = v29;
        }
        v7 = v10 + 4;
        v9 += 64;
      }
      while (v10 + 4 != a2);
    }
  }
  return result;
}

uint64_t std::__insertion_sort_unguarded[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t result, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v3;
  uint64_t v4;
  __int128 *v6;
  __int128 *i;
  __int128 *v9;
  uint64_t (*v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 *v18;
  __int128 *v19;
  __int128 v20;
  __int128 v21;
  uint64_t (*v22)(_QWORD, _QWORD);
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _OWORD v28[4];
  _OWORD v29[4];
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _OWORD v34[4];
  _OWORD v35[4];
  uint64_t v36;
  uint64_t v37;

  if ((__int128 *)result != a2)
  {
    v36 = v3;
    v37 = v4;
    v6 = (__int128 *)result;
    for (i = (__int128 *)(result + 64); v6 + 4 != a2; i = v6 + 4)
    {
      v9 = v6;
      v6 = i;
      v10 = *a3;
      v11 = v6[1];
      v35[0] = *v6;
      v35[1] = v11;
      v12 = v6[3];
      v35[2] = v6[2];
      v35[3] = v12;
      v13 = v9[3];
      v15 = *v9;
      v14 = v9[1];
      v34[2] = v9[2];
      v34[3] = v13;
      v34[0] = v15;
      v34[1] = v14;
      result = v10(v35, v34);
      if ((_DWORD)result)
      {
        v16 = v6[1];
        v30 = *v6;
        v31 = v16;
        v17 = v6[3];
        v32 = v6[2];
        v33 = v17;
        v18 = v6;
        do
        {
          v19 = v18 - 4;
          v20 = *(v18 - 3);
          *v18 = *(v18 - 4);
          v18[1] = v20;
          v21 = *(v18 - 1);
          v18[2] = *(v18 - 2);
          v18[3] = v21;
          v22 = *a3;
          v29[0] = v30;
          v29[1] = v31;
          v29[2] = v32;
          v29[3] = v33;
          v23 = *(v18 - 8);
          v24 = *(v18 - 7);
          v25 = *(v18 - 5);
          v28[2] = *(v18 - 6);
          v28[3] = v25;
          v28[0] = v23;
          v28[1] = v24;
          result = v22(v29, v28);
          v18 = v19;
        }
        while ((result & 1) != 0);
        v26 = v31;
        *v19 = v30;
        v19[1] = v26;
        v27 = v33;
        v19[2] = v32;
        v19[3] = v27;
      }
    }
  }
  return result;
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, unsigned int (**a4)(_QWORD, _QWORD))
{
  unsigned int (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  unsigned int (*v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t result;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  unsigned int (*v38)(_QWORD, _QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  unsigned int (*v59)(_QWORD, _QWORD);
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[4];
  _OWORD v74[4];
  _OWORD v75[4];
  _OWORD v76[4];
  _OWORD v77[4];
  _OWORD v78[4];
  _OWORD v79[4];
  _OWORD v80[24];

  v8 = *a4;
  v9 = a2[1];
  v80[0] = *a2;
  v80[1] = v9;
  v10 = a2[3];
  v80[2] = a2[2];
  v80[3] = v10;
  v11 = a1[1];
  v79[0] = *a1;
  v79[1] = v11;
  v12 = a1[3];
  v79[2] = a1[2];
  v79[3] = v12;
  v13 = v8(v80, v79);
  v14 = *a4;
  if ((v13 & 1) != 0)
  {
    v15 = a3[1];
    v74[0] = *a3;
    v74[1] = v15;
    v16 = a3[3];
    v74[2] = a3[2];
    v74[3] = v16;
    v17 = a2[1];
    v73[0] = *a2;
    v73[1] = v17;
    v18 = a2[3];
    v73[2] = a2[2];
    v73[3] = v18;
    if (v14(v74, v73))
    {
      v20 = a1[2];
      v19 = a1[3];
      v22 = *a1;
      v21 = a1[1];
      v23 = a3[3];
      v25 = *a3;
      v24 = a3[1];
      a1[2] = a3[2];
      a1[3] = v23;
      *a1 = v25;
      a1[1] = v24;
      *a3 = v22;
      a3[1] = v21;
      result = 1;
LABEL_9:
      a3[2] = v20;
      a3[3] = v19;
      return result;
    }
    v53 = a1[2];
    v52 = a1[3];
    v55 = *a1;
    v54 = a1[1];
    v56 = a2[3];
    v58 = *a2;
    v57 = a2[1];
    a1[2] = a2[2];
    a1[3] = v56;
    *a1 = v58;
    a1[1] = v57;
    *a2 = v55;
    a2[1] = v54;
    a2[2] = v53;
    a2[3] = v52;
    v59 = *a4;
    v60 = *a3;
    v61 = a3[1];
    v62 = a3[3];
    v72[2] = a3[2];
    v72[3] = v62;
    v72[0] = v60;
    v72[1] = v61;
    v63 = *a2;
    v64 = a2[1];
    v65 = a2[3];
    v71[2] = a2[2];
    v71[3] = v65;
    v71[0] = v63;
    v71[1] = v64;
    if (v59(v72, v71))
    {
      v20 = a2[2];
      v19 = a2[3];
      v67 = *a2;
      v66 = a2[1];
      v68 = a3[3];
      v70 = *a3;
      v69 = a3[1];
      a2[2] = a3[2];
      a2[3] = v68;
      *a2 = v70;
      a2[1] = v69;
      *a3 = v67;
      a3[1] = v66;
      result = 2;
      goto LABEL_9;
    }
  }
  else
  {
    v27 = a3[1];
    v78[0] = *a3;
    v78[1] = v27;
    v28 = a3[3];
    v78[2] = a3[2];
    v78[3] = v28;
    v29 = a2[1];
    v77[0] = *a2;
    v77[1] = v29;
    v30 = a2[3];
    v77[2] = a2[2];
    v77[3] = v30;
    result = ((uint64_t (*)(_OWORD *, _OWORD *))v14)(v78, v77);
    if (!(_DWORD)result)
      return result;
    v32 = a2[2];
    v31 = a2[3];
    v34 = *a2;
    v33 = a2[1];
    v35 = a3[3];
    v37 = *a3;
    v36 = a3[1];
    a2[2] = a3[2];
    a2[3] = v35;
    *a2 = v37;
    a2[1] = v36;
    *a3 = v34;
    a3[1] = v33;
    a3[2] = v32;
    a3[3] = v31;
    v38 = *a4;
    v39 = *a2;
    v40 = a2[1];
    v41 = a2[3];
    v76[2] = a2[2];
    v76[3] = v41;
    v76[0] = v39;
    v76[1] = v40;
    v42 = *a1;
    v43 = a1[1];
    v44 = a1[3];
    v75[2] = a1[2];
    v75[3] = v44;
    v75[0] = v42;
    v75[1] = v43;
    if (v38(v76, v75))
    {
      v46 = a1[2];
      v45 = a1[3];
      v48 = *a1;
      v47 = a1[1];
      v49 = a2[3];
      v51 = *a2;
      v50 = a2[1];
      a1[2] = a2[2];
      a1[3] = v49;
      *a1 = v51;
      a1[1] = v50;
      *a2 = v48;
      a2[1] = v47;
      result = 2;
      a2[2] = v46;
      a2[3] = v45;
      return result;
    }
  }
  return 1;
}

__int128 *std::__partition_with_equals_on_left[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  __int128 *v4;
  __int128 v6;
  __int128 v7;
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;
  uint64_t (*v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  char v17;
  __int128 *v18;
  uint64_t (*v19)(_QWORD, _QWORD);
  __int128 v20;
  __int128 v21;
  int v22;
  __int128 *v23;
  uint64_t (*v24)(_QWORD, _QWORD);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  unsigned int (*v40)(_QWORD, _QWORD);
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint64_t (*v45)(_QWORD, _QWORD);
  __int128 *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _OWORD v54[4];
  _OWORD v55[4];
  _OWORD v56[4];
  _OWORD v57[4];
  _OWORD v58[4];
  _OWORD v59[4];
  _OWORD v60[4];
  _OWORD v61[4];
  _OWORD v62[4];
  _OWORD v63[4];
  _OWORD v64[4];
  _OWORD v65[4];
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;

  v4 = a2;
  v6 = a1[1];
  v66 = *a1;
  v67 = v6;
  v7 = a1[3];
  v68 = a1[2];
  v69 = v7;
  v8 = *a3;
  v65[0] = v66;
  v65[1] = v6;
  v65[2] = v68;
  v65[3] = v7;
  v9 = *(a2 - 4);
  v10 = *(a2 - 3);
  v11 = *(a2 - 1);
  v64[2] = *(a2 - 2);
  v64[3] = v11;
  v64[0] = v9;
  v64[1] = v10;
  if ((v8(v65, v64) & 1) != 0)
  {
    v12 = a1;
    do
    {
      v13 = v12 + 4;
      v14 = *a3;
      v63[0] = v66;
      v63[1] = v67;
      v63[2] = v68;
      v63[3] = v69;
      v15 = v12[5];
      v62[0] = v12[4];
      v62[1] = v15;
      v16 = v12[7];
      v62[2] = v12[6];
      v62[3] = v16;
      v17 = v14(v63, v62);
      v12 = v13;
    }
    while ((v17 & 1) == 0);
  }
  else
  {
    v18 = a1 + 4;
    do
    {
      v13 = v18;
      if (v18 >= v4)
        break;
      v19 = *a3;
      v61[0] = v66;
      v61[1] = v67;
      v61[2] = v68;
      v61[3] = v69;
      v20 = v13[1];
      v60[0] = *v13;
      v60[1] = v20;
      v21 = v13[3];
      v60[2] = v13[2];
      v60[3] = v21;
      v22 = v19(v61, v60);
      v18 = v13 + 4;
    }
    while (!v22);
  }
  if (v13 >= v4)
  {
    v23 = v4;
  }
  else
  {
    do
    {
      v23 = v4 - 4;
      v24 = *a3;
      v59[0] = v66;
      v59[1] = v67;
      v59[2] = v68;
      v59[3] = v69;
      v25 = *(v4 - 3);
      v58[0] = *(v4 - 4);
      v58[1] = v25;
      v26 = *(v4 - 1);
      v58[2] = *(v4 - 2);
      v58[3] = v26;
      v4 -= 4;
    }
    while ((v24(v59, v58) & 1) != 0);
  }
  while (v13 < v23)
  {
    v27 = *v13;
    v28 = v13[1];
    v29 = v13[3];
    v72 = v13[2];
    v73 = v29;
    v70 = v27;
    v71 = v28;
    v30 = *v23;
    v31 = v23[1];
    v32 = v23[3];
    v13[2] = v23[2];
    v13[3] = v32;
    *v13 = v30;
    v13[1] = v31;
    v33 = v70;
    v34 = v71;
    v35 = v73;
    v23[2] = v72;
    v23[3] = v35;
    *v23 = v33;
    v23[1] = v34;
    do
    {
      v57[0] = v66;
      v57[1] = v67;
      v57[2] = v68;
      v57[3] = v69;
      v36 = v13[6];
      v37 = v13[7];
      v39 = v13[4];
      v38 = v13[5];
      v13 += 4;
      v40 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v56[2] = v36;
      v56[3] = v37;
      v56[0] = v39;
      v56[1] = v38;
    }
    while (!v40(v57, v56));
    do
    {
      v55[0] = v66;
      v55[1] = v67;
      v55[2] = v68;
      v55[3] = v69;
      v41 = *(v23 - 2);
      v42 = *(v23 - 1);
      v44 = *(v23 - 4);
      v43 = *(v23 - 3);
      v23 -= 4;
      v45 = *a3;
      v54[2] = v41;
      v54[3] = v42;
      v54[0] = v44;
      v54[1] = v43;
    }
    while ((v45(v55, v54) & 1) != 0);
  }
  v46 = v13 - 4;
  if (v13 - 4 != a1)
  {
    v47 = *v46;
    v48 = *(v13 - 3);
    v49 = *(v13 - 1);
    a1[2] = *(v13 - 2);
    a1[3] = v49;
    *a1 = v47;
    a1[1] = v48;
  }
  v50 = v66;
  v51 = v67;
  v52 = v69;
  *(v13 - 2) = v68;
  *(v13 - 1) = v52;
  *v46 = v50;
  *(v13 - 3) = v51;
  return v13;
}

__int128 *std::__partition_with_equals_on_right[abi:ne180100]<std::_ClassicAlgPolicy,sortColorEntry *,BOOL (*&)(sortColorEntry,sortColorEntry)>(__int128 *a1, __int128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  uint64_t (*v9)(_QWORD, _QWORD);
  __int128 v10;
  __int128 v11;
  __int128 *v12;
  __int128 *v13;
  __int128 *v14;
  unsigned int (*v15)(_QWORD, _QWORD);
  __int128 v16;
  __int128 v17;
  uint64_t (*v18)(_QWORD, _QWORD);
  __int128 v19;
  __int128 v20;
  __int128 *v21;
  __int128 *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t (*v34)(_QWORD, _QWORD);
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  _OWORD v47[4];
  _OWORD v48[4];
  _OWORD v49[4];
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[4];
  _OWORD v56[4];
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;

  v6 = 0;
  v7 = a1[1];
  v57 = *a1;
  v58 = v7;
  v8 = a1[3];
  v59 = a1[2];
  v60 = v8;
  do
  {
    v9 = *a3;
    v10 = a1[v6 + 5];
    v56[0] = a1[v6 + 4];
    v56[1] = v10;
    v11 = a1[v6 + 7];
    v56[2] = a1[v6 + 6];
    v56[3] = v11;
    v55[0] = v57;
    v55[1] = v58;
    v55[2] = v59;
    v55[3] = v60;
    v6 += 4;
  }
  while ((v9(v56, v55) & 1) != 0);
  v12 = &a1[v6];
  v13 = &a1[v6 - 4];
  if (v6 == 4)
  {
    while (v12 < a2)
    {
      v18 = *a3;
      v14 = a2 - 4;
      v19 = *(a2 - 3);
      v54[0] = *(a2 - 4);
      v54[1] = v19;
      v20 = *(a2 - 1);
      v54[2] = *(a2 - 2);
      v54[3] = v20;
      v53[0] = v57;
      v53[1] = v58;
      v53[2] = v59;
      v53[3] = v60;
      a2 -= 4;
      if ((v18(v54, v53) & 1) != 0)
        goto LABEL_9;
    }
    v14 = a2;
  }
  else
  {
    do
    {
      v14 = a2 - 4;
      v15 = (unsigned int (*)(_QWORD, _QWORD))*a3;
      v16 = *(a2 - 3);
      v52[0] = *(a2 - 4);
      v52[1] = v16;
      v17 = *(a2 - 1);
      v52[2] = *(a2 - 2);
      v52[3] = v17;
      v51[0] = v57;
      v51[1] = v58;
      v51[2] = v59;
      v51[3] = v60;
      a2 -= 4;
    }
    while (!v15(v52, v51));
  }
LABEL_9:
  if (v12 < v14)
  {
    v21 = v12;
    v22 = v14;
    do
    {
      v24 = v21[1];
      v61 = *v21;
      v23 = v61;
      v62 = v24;
      v26 = v21[3];
      v63 = v21[2];
      v25 = v63;
      v64 = v26;
      v28 = v22[2];
      v27 = v22[3];
      v29 = v22[1];
      *v21 = *v22;
      v21[1] = v29;
      v21[2] = v28;
      v21[3] = v27;
      v22[2] = v25;
      v22[3] = v26;
      *v22 = v23;
      v22[1] = v24;
      do
      {
        v30 = v21[6];
        v31 = v21[7];
        v33 = v21[4];
        v32 = v21[5];
        v21 += 4;
        v34 = *a3;
        v50[2] = v30;
        v50[3] = v31;
        v50[0] = v33;
        v50[1] = v32;
        v49[0] = v57;
        v49[1] = v58;
        v49[2] = v59;
        v49[3] = v60;
      }
      while ((v34(v50, v49) & 1) != 0);
      do
      {
        v35 = *(v22 - 2);
        v36 = *(v22 - 1);
        v38 = *(v22 - 4);
        v37 = *(v22 - 3);
        v22 -= 4;
        v39 = (unsigned int (*)(_QWORD, _QWORD))*a3;
        v48[2] = v35;
        v48[3] = v36;
        v48[0] = v38;
        v48[1] = v37;
        v47[0] = v57;
        v47[1] = v58;
        v47[2] = v59;
        v47[3] = v60;
      }
      while (!v39(v48, v47));
    }
    while (v21 < v22);
    v13 = v21 - 4;
  }
  if (v13 != a1)
  {
    v40 = *v13;
    v41 = v13[1];
    v42 = v13[3];
    a1[2] = v13[2];
    a1[3] = v42;
    *a1 = v40;
    a1[1] = v41;
  }
  v43 = v57;
  v44 = v58;
  v45 = v60;
  v13[2] = v59;
  v13[3] = v45;
  *v13 = v43;
  v13[1] = v44;
  return v13;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, unsigned int (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  unsigned int (*v8)(_QWORD, _QWORD);
  __n128 v9;
  __n128 v10;
  __int128 v11;
  __int128 v12;
  __n128 *v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 *v21;
  __n128 *v22;
  uint64_t v23;
  int v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  unsigned int (*v37)(_QWORD, _QWORD);
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  __n128 v41;
  __n128 v42;
  _OWORD v43[4];
  _OWORD v44[4];
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  _OWORD v49[4];
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[8];

  v6 = ((uint64_t)a2 - a1) >> 6;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v9 = a2[-3];
      v52[0] = a2[-4];
      v52[1] = v9;
      v10 = a2[-1];
      v52[2] = a2[-2];
      v52[3] = v10;
      v11 = *(_OWORD *)(a1 + 16);
      v51[0] = *(_OWORD *)a1;
      v51[1] = v11;
      v12 = *(_OWORD *)(a1 + 48);
      v51[2] = *(_OWORD *)(a1 + 32);
      v51[3] = v12;
      if (!v8(v52, v51))
        return 1;
      v13 = a2 - 4;
      v15 = *(__n128 *)(a1 + 32);
      v14 = *(__n128 *)(a1 + 48);
      v17 = *(__n128 *)a1;
      v16 = *(__n128 *)(a1 + 16);
      v18 = a2[-1];
      v20 = a2[-4];
      v19 = a2[-3];
      *(__n128 *)(a1 + 32) = a2[-2];
      *(__n128 *)(a1 + 48) = v18;
      *(__n128 *)a1 = v20;
      *(__n128 *)(a1 + 16) = v19;
      *v13 = v17;
      v13[1] = v16;
      result = 1;
      v13[2] = v15;
      v13[3] = v14;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (__n128 *)a2[-4].n128_u64, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), a2 - 4, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), a2 - 4, a3);
      return 1;
    default:
      v21 = (__n128 *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (_OWORD *)(a1 + 128), a3);
      v22 = (__n128 *)(a1 + 192);
      if ((__n128 *)(a1 + 192) == a2)
        return 1;
      v23 = 0;
      v24 = 0;
      break;
  }
  while (1)
  {
    v25 = *a3;
    v26 = v22[1];
    v50[0] = *v22;
    v50[1] = v26;
    v27 = v22[3];
    v50[2] = v22[2];
    v50[3] = v27;
    v28 = v21[3];
    v30 = *v21;
    v29 = v21[1];
    v49[2] = v21[2];
    v49[3] = v28;
    v49[0] = v30;
    v49[1] = v29;
    if (v25(v50, v49))
    {
      v31 = v22[1];
      v45 = *v22;
      v46 = v31;
      v32 = v22[3];
      v47 = v22[2];
      v48 = v32;
      v33 = v23;
      while (1)
      {
        v34 = (_OWORD *)(a1 + v33);
        v35 = *(_OWORD *)(a1 + v33 + 144);
        v34[12] = *(_OWORD *)(a1 + v33 + 128);
        v34[13] = v35;
        v36 = *(_OWORD *)(a1 + v33 + 176);
        v34[14] = *(_OWORD *)(a1 + v33 + 160);
        v34[15] = v36;
        if (v33 == -128)
          break;
        v37 = *a3;
        v44[0] = v45;
        v44[1] = v46;
        v44[2] = v47;
        v44[3] = v48;
        v38 = v34[5];
        v43[0] = v34[4];
        v43[1] = v38;
        v39 = v34[7];
        v43[2] = v34[6];
        v43[3] = v39;
        v33 -= 64;
        if ((((uint64_t (*)(_OWORD *, _OWORD *))v37)(v44, v43) & 1) == 0)
        {
          v40 = (_OWORD *)(a1 + v33 + 192);
          goto LABEL_12;
        }
      }
      v40 = (_OWORD *)a1;
LABEL_12:
      v41 = v46;
      *v40 = v45;
      v40[1] = v41;
      v42 = v48;
      v40[2] = v47;
      v40[3] = v42;
      if (++v24 == 8)
        return &v22[4] == a2;
    }
    v21 = v22;
    v23 += 64;
    v22 += 4;
    if (v22 == a2)
      return 1;
  }
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, unsigned int (**a5)(_QWORD, _QWORD))
{
  unsigned int (*v10)(_QWORD, _QWORD);
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  unsigned int (*v23)(_QWORD, _QWORD);
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  unsigned int (*v37)(_QWORD, _QWORD);
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[16];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a2, a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v55[0] = *a4;
  v55[1] = v11;
  v12 = a4[3];
  v55[2] = a4[2];
  v55[3] = v12;
  v13 = a3[1];
  v54[0] = *a3;
  v54[1] = v13;
  v14 = a3[3];
  v54[2] = a3[2];
  v54[3] = v14;
  if (v10(v55, v54))
  {
    v17 = a3[2];
    v16 = a3[3];
    v19 = *a3;
    v18 = a3[1];
    v20 = a4[3];
    v22 = *a4;
    v21 = a4[1];
    a3[2] = a4[2];
    a3[3] = v20;
    *a3 = v22;
    a3[1] = v21;
    *a4 = v19;
    a4[1] = v18;
    a4[2] = v17;
    a4[3] = v16;
    v23 = *a5;
    v24 = *a3;
    v25 = a3[1];
    v26 = a3[3];
    v53[2] = a3[2];
    v53[3] = v26;
    v53[0] = v24;
    v53[1] = v25;
    v27 = *a2;
    v28 = a2[1];
    v29 = a2[3];
    v52[2] = a2[2];
    v52[3] = v29;
    v52[0] = v27;
    v52[1] = v28;
    if (v23(v53, v52))
    {
      v31 = a2[2];
      v30 = a2[3];
      v33 = *a2;
      v32 = a2[1];
      v34 = a3[3];
      v36 = *a3;
      v35 = a3[1];
      a2[2] = a3[2];
      a2[3] = v34;
      *a2 = v36;
      a2[1] = v35;
      *a3 = v33;
      a3[1] = v32;
      a3[2] = v31;
      a3[3] = v30;
      v37 = *a5;
      v38 = *a2;
      v39 = a2[1];
      v40 = a2[3];
      v51[2] = a2[2];
      v51[3] = v40;
      v51[0] = v38;
      v51[1] = v39;
      v41 = *a1;
      v42 = a1[1];
      v43 = a1[3];
      v50[2] = a1[2];
      v50[3] = v43;
      v50[0] = v41;
      v50[1] = v42;
      if (v37(v51, v50))
      {
        v44 = a1[2];
        result = a1[3];
        v46 = *a1;
        v45 = a1[1];
        v47 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        a1[2] = a2[2];
        a1[3] = v47;
        *a1 = v49;
        a1[1] = v48;
        *a2 = v46;
        a2[1] = v45;
        a2[2] = v44;
        a2[3] = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, unsigned int (**a6)(_QWORD, _QWORD))
{
  unsigned int (*v12)(_QWORD, _QWORD);
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 result;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  unsigned int (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  unsigned int (*v39)(_QWORD, _QWORD);
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  __n128 v52;
  unsigned int (*v53)(_QWORD, _QWORD);
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __int128 v58;
  __int128 v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  __n128 v65;
  _OWORD v66[4];
  _OWORD v67[4];
  _OWORD v68[4];
  _OWORD v69[4];
  _OWORD v70[4];
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[20];

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v73[0] = *a5;
  v73[1] = v13;
  v14 = a5[3];
  v73[2] = a5[2];
  v73[3] = v14;
  v15 = a4[1];
  v72[0] = *a4;
  v72[1] = v15;
  v16 = a4[3];
  v72[2] = a4[2];
  v72[3] = v16;
  if (v12(v73, v72))
  {
    v19 = a4[2];
    v18 = a4[3];
    v21 = *a4;
    v20 = a4[1];
    v22 = a5[3];
    v24 = *a5;
    v23 = a5[1];
    a4[2] = a5[2];
    a4[3] = v22;
    *a4 = v24;
    a4[1] = v23;
    *a5 = v21;
    a5[1] = v20;
    a5[2] = v19;
    a5[3] = v18;
    v25 = *a6;
    v26 = *a4;
    v27 = a4[1];
    v28 = a4[3];
    v71[2] = a4[2];
    v71[3] = v28;
    v71[0] = v26;
    v71[1] = v27;
    v29 = *a3;
    v30 = a3[1];
    v31 = a3[3];
    v70[2] = a3[2];
    v70[3] = v31;
    v70[0] = v29;
    v70[1] = v30;
    if (v25(v71, v70))
    {
      v33 = a3[2];
      v32 = a3[3];
      v35 = *a3;
      v34 = a3[1];
      v36 = a4[3];
      v38 = *a4;
      v37 = a4[1];
      a3[2] = a4[2];
      a3[3] = v36;
      *a3 = v38;
      a3[1] = v37;
      *a4 = v35;
      a4[1] = v34;
      a4[2] = v33;
      a4[3] = v32;
      v39 = *a6;
      v40 = *a3;
      v41 = a3[1];
      v42 = a3[3];
      v69[2] = a3[2];
      v69[3] = v42;
      v69[0] = v40;
      v69[1] = v41;
      v43 = *a2;
      v44 = a2[1];
      v45 = a2[3];
      v68[2] = a2[2];
      v68[3] = v45;
      v68[0] = v43;
      v68[1] = v44;
      if (v39(v69, v68))
      {
        v47 = a2[2];
        v46 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        v50 = a3[3];
        v52 = *a3;
        v51 = a3[1];
        a2[2] = a3[2];
        a2[3] = v50;
        *a2 = v52;
        a2[1] = v51;
        *a3 = v49;
        a3[1] = v48;
        a3[2] = v47;
        a3[3] = v46;
        v53 = *a6;
        v54 = *a2;
        v55 = a2[1];
        v56 = a2[3];
        v67[2] = a2[2];
        v67[3] = v56;
        v67[0] = v54;
        v67[1] = v55;
        v57 = *(__n128 *)a1;
        v58 = *(_OWORD *)(a1 + 16);
        v59 = *(_OWORD *)(a1 + 48);
        v66[2] = *(_OWORD *)(a1 + 32);
        v66[3] = v59;
        v66[0] = v57;
        v66[1] = v58;
        if (v53(v67, v66))
        {
          v60 = *(__n128 *)(a1 + 32);
          result = *(__n128 *)(a1 + 48);
          v62 = *(__n128 *)a1;
          v61 = *(__n128 *)(a1 + 16);
          v63 = a2[3];
          v65 = *a2;
          v64 = a2[1];
          *(__n128 *)(a1 + 32) = a2[2];
          *(__n128 *)(a1 + 48) = v63;
          *(__n128 *)a1 = v65;
          *(__n128 *)(a1 + 16) = v64;
          *a2 = v62;
          a2[1] = v61;
          a2[2] = v60;
          a2[3] = result;
        }
      }
    }
  }
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a2);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a2);
}

void sub_1BBDC83E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDCB2CC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDCFD24(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBDD4014(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__86(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__86(uint64_t a1)
{

}

uint64_t SKUICardElementTypeForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUICardElementTypeForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("activity")) & 1) != 0)
  {
    v10 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("billboard")) & 1) != 0)
  {
    v10 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("editorial")) & 1) != 0)
  {
    v10 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("programmed")))
  {
    v10 = 4;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1BBDD59E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__87(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__87(uint64_t a1)
{

}

void sub_1BBDD5FF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDD8CC4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t SKUIAccountsFramework()
{
  if (SKUIAccountsFramework_sOnce != -1)
    dispatch_once(&SKUIAccountsFramework_sOnce, &__block_literal_global_52);
  return SKUIAccountsFramework_sHandle;
}

uint64_t SKUIAccountsUIFramework()
{
  if (SKUIAccountsUIFramework_sOnce != -1)
    dispatch_once(&SKUIAccountsUIFramework_sOnce, &__block_literal_global_2);
  return SKUIAccountsUIFramework_sHandle;
}

uint64_t SKUIAppleAccountFramework()
{
  if (SKUIAppleAccountFramework_sOnce != -1)
    dispatch_once(&SKUIAppleAccountFramework_sOnce, &__block_literal_global_4);
  return SKUIAppleAccountFramework_sHandle;
}

uint64_t SKUIAppleAccountUIFramework()
{
  if (SKUIAppleAccountUIFramework_sOnce != -1)
    dispatch_once(&SKUIAppleAccountUIFramework_sOnce, &__block_literal_global_6);
  return SKUIAppleAccountUIFramework_sHandle;
}

uint64_t SKUIAskPermissionFramework()
{
  if (SKUIAskPermissionFramework_sOnce != -1)
    dispatch_once(&SKUIAskPermissionFramework_sOnce, &__block_literal_global_8);
  return SKUIAskPermissionFramework_sHandle;
}

uint64_t SKUIAudioToolboxFramework()
{
  if (SKUIAudioToolboxFramework_sOnce != -1)
    dispatch_once(&SKUIAudioToolboxFramework_sOnce, &__block_literal_global_10_0);
  return SKUIAudioToolboxFramework_sHandle;
}

uint64_t SKUIAVFoundationFramework()
{
  if (SKUIAVFoundationFramework_sOnce != -1)
    dispatch_once(&SKUIAVFoundationFramework_sOnce, &__block_literal_global_12_0);
  return SKUIAVFoundationFramework_sHandle;
}

uint64_t SKUIContactsAutocompleteUIFramework()
{
  if (SKUIContactsAutocompleteUIFramework_sOnce != -1)
    dispatch_once(&SKUIContactsAutocompleteUIFramework_sOnce, &__block_literal_global_14_0);
  return SKUIContactsAutocompleteUIFramework_sHandle;
}

uint64_t SKUIContactsFramework()
{
  if (SKUIContactsFramework_sOnce != -1)
    dispatch_once(&SKUIContactsFramework_sOnce, &__block_literal_global_16);
  return SKUIContactsFramework_sHandle;
}

uint64_t SKUIContactsUIFramework()
{
  if (SKUIContactsUIFramework_sOnce != -1)
    dispatch_once(&SKUIContactsUIFramework_sOnce, &__block_literal_global_18);
  return SKUIContactsUIFramework_sHandle;
}

uint64_t SKUICoreImageFramework()
{
  if (SKUICoreImageFramework_sOnce != -1)
    dispatch_once(&SKUICoreImageFramework_sOnce, &__block_literal_global_20);
  return SKUICoreImageFramework_sHandle;
}

uint64_t SKUICoreTelephonyFramework()
{
  if (SKUICoreTelephonyFramework_sOnce != -1)
    dispatch_once(&SKUICoreTelephonyFramework_sOnce, &__block_literal_global_22_0);
  return SKUICoreTelephonyFramework_sHandle;
}

uint64_t SKUIFamilyCircleFramework()
{
  if (SKUIFamilyCircleFramework_sOnce != -1)
    dispatch_once(&SKUIFamilyCircleFramework_sOnce, &__block_literal_global_24_0);
  return SKUIFamilyCircleFramework_sHandle;
}

uint64_t SKUIIAdFramework()
{
  if (SKUIIAdFramework_sOnce != -1)
    dispatch_once(&SKUIIAdFramework_sOnce, &__block_literal_global_26);
  return SKUIIAdFramework_sHandle;
}

uint64_t SKUIMediaPlayerFramework()
{
  if (SKUIMediaPlayerFramework_sOnce != -1)
    dispatch_once(&SKUIMediaPlayerFramework_sOnce, &__block_literal_global_28);
  return SKUIMediaPlayerFramework_sHandle;
}

uint64_t SKUIMediaPlayerUIFramework()
{
  if (SKUIMediaPlayerUIFramework_sOnce != -1)
    dispatch_once(&SKUIMediaPlayerUIFramework_sOnce, &__block_literal_global_30_0);
  return SKUIMediaPlayerUIFramework_sHandle;
}

uint64_t SKUIMobileCoreServicesFramework()
{
  if (SKUIMobileCoreServicesFramework_sOnce != -1)
    dispatch_once(&SKUIMobileCoreServicesFramework_sOnce, &__block_literal_global_32);
  return SKUIMobileCoreServicesFramework_sHandle;
}

uint64_t SKUIMPUFoundationFramework()
{
  if (SKUIMPUFoundationFramework_sOnce != -1)
    dispatch_once(&SKUIMPUFoundationFramework_sOnce, &__block_literal_global_34);
  return SKUIMPUFoundationFramework_sHandle;
}

uint64_t SKUIPassKitCoreFramework()
{
  if (SKUIPassKitCoreFramework_sOnce != -1)
    dispatch_once(&SKUIPassKitCoreFramework_sOnce, &__block_literal_global_36);
  return SKUIPassKitCoreFramework_sHandle;
}

uint64_t SKUIPassKitUIFramework()
{
  if (SKUIPassKitUIFramework_sOnce != -1)
    dispatch_once(&SKUIPassKitUIFramework_sOnce, &__block_literal_global_38);
  return SKUIPassKitUIFramework_sHandle;
}

uint64_t SKUIPhysicsKitFramework()
{
  if (SKUIPhysicsKitFramework_sOnce != -1)
    dispatch_once(&SKUIPhysicsKitFramework_sOnce, &__block_literal_global_40_0);
  return SKUIPhysicsKitFramework_sHandle;
}

uint64_t SKUISocialFramework()
{
  if (SKUISocialFramework_sOnce != -1)
    dispatch_once(&SKUISocialFramework_sOnce, &__block_literal_global_42);
  return SKUISocialFramework_sHandle;
}

uint64_t SKUISpringBoardServicesFramework()
{
  if (SKUISpringBoardServicesFramework_sOnce != -1)
    dispatch_once(&SKUISpringBoardServicesFramework_sOnce, &__block_literal_global_44);
  return SKUISpringBoardServicesFramework_sHandle;
}

uint64_t SKUIWebCoreFramework()
{
  if (SKUIWebCoreFramework_sOnce != -1)
    dispatch_once(&SKUIWebCoreFramework_sOnce, &__block_literal_global_46);
  return SKUIWebCoreFramework_sHandle;
}

uint64_t SKUIImageIOFramework()
{
  if (SKUIImageIOFramework_sOnce != -1)
    dispatch_once(&SKUIImageIOFramework_sOnce, &__block_literal_global_48);
  return SKUIImageIOFramework_sHandle;
}

uint64_t SKUICoreLocationFramework()
{
  if (SKUICoreLocationFramework_sOnce != -1)
    dispatch_once(&SKUICoreLocationFramework_sOnce, &__block_literal_global_50);
  return SKUICoreLocationFramework_sHandle;
}

uint64_t SKUICoreMediaFramework()
{
  if (SKUICoreMediaFramework_sOnce != -1)
    dispatch_once(&SKUICoreMediaFramework_sOnce, &__block_literal_global_52);
  return SKUICoreMediaFramework_sHandle;
}

uint64_t SKUICelestialFramework()
{
  if (SKUICelestialFramework_sOnce != -1)
    dispatch_once(&SKUICelestialFramework_sOnce, &__block_literal_global_54);
  return SKUICelestialFramework_sHandle;
}

uint64_t SKUIVideoSubscriberAccountFramework()
{
  if (SKUIVideoSubscriberAccountFramework_sOnce != -1)
    dispatch_once(&SKUIVideoSubscriberAccountFramework_sOnce, &__block_literal_global_56);
  return SKUIVideoSubscriberAccountFramework_sHandle;
}

void *SKUIWeakLinkedSymbolForString(char *__symbol, void *__handle)
{
  if (__handle)
    return dlsym(__handle, __symbol);
  else
    return 0;
}

id SKUIWeakLinkedClassForString(NSString *a1, uint64_t a2)
{
  if (!a2)
    return 0;
  NSClassFromString(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

void ITColor::ITColor(ITColor *this)
{
  this->var0 = 0.0;
  this->var1 = 0.0;
  this->var2 = 0.0;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4)
{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3, double a4, double a5)
{
  this->var0 = a2;
  this->var1 = a3;
  this->var2 = a4;
  this->var3 = a5;
}

void ITColor::ITColor(ITColor *this, CGColorRef color)
{
  const CGFloat *Components;
  double v5;
  CGColorSpace *ColorSpace;
  CGColorSpace *SRGB;
  double v8;
  double v9;
  double v10;

  this->var0 = 0.0;
  this->var1 = 0.0;
  this->var2 = 0.0;
  this->var3 = 1.0;
  Components = CGColorGetComponents(color);
  switch(CGColorGetNumberOfComponents(color))
  {
    case 1uLL:
      goto LABEL_3;
    case 2uLL:
      this->var3 = Components[1];
LABEL_3:
      v5 = *Components;
      this->var1 = *Components;
      this->var2 = v5;
      this->var0 = v5;
      break;
    case 3uLL:
      goto LABEL_5;
    case 4uLL:
      this->var3 = Components[3];
LABEL_5:
      this->var0 = *Components;
      this->var1 = Components[1];
      this->var2 = Components[2];
      break;
    default:
      break;
  }
  ColorSpace = CGColorGetColorSpace(color);
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  this->var0 = ITColor::ConvertColorSpace(this, ColorSpace, SRGB);
  this->var1 = v8;
  this->var2 = v9;
  this->var3 = v10;
}

double ITColor::ConvertColorSpace(ITColor *this, CGColorSpaceRef space, CGColorSpace *cf2)
{
  double v6;
  __int128 v7;
  CGColor *v8;
  CGContext *v9;
  CGContext *v10;
  unint64_t v11;
  int data;
  CGFloat components[2];
  __int128 v15;
  uint64_t v16;
  CGRect v17;

  v16 = *MEMORY[0x1E0C80C00];
  data = 0;
  if (!space || !cf2 || !CFEqual(space, cf2))
  {
    v7 = *(_OWORD *)&this->var2;
    *(_OWORD *)components = *(_OWORD *)&this->var0;
    v15 = v7;
    v8 = CGColorCreate(space, components);
    if (v8)
    {
      v9 = CGBitmapContextCreate(&data, 1uLL, 1uLL, 8uLL, 4uLL, cf2, 0x4002u);
      v10 = v9;
      if (v9)
      {
        CGContextSetFillColorWithColor(v9, v8);
        v17.origin.x = 0.0;
        v17.origin.y = 0.0;
        v17.size.width = 1.0;
        v17.size.height = 1.0;
        CGContextFillRect(v10, v17);
        LOBYTE(v11) = BYTE1(data);
        v6 = (double)v11 / 255.0;
LABEL_10:
        CGColorRelease(v8);
        CGContextRelease(v10);
        return v6;
      }
    }
    else
    {
      v10 = 0;
    }
    v6 = 0.0;
    goto LABEL_10;
  }
  return this->var0;
}

void ITColor::ITColor(ITColor *this, const RGBColor *a2, double a3, double a4, double a5)
{
  double v5;

  LOWORD(a3) = a2->red;
  v5 = (double)*(unint64_t *)&a3 / 65535.0;
  LOWORD(a5) = a2->green;
  this->var0 = v5;
  this->var1 = (double)*(unint64_t *)&a5 / 65535.0;
  LOWORD(v5) = a2->blue;
  this->var2 = (double)*(unint64_t *)&v5 / 65535.0;
  this->var3 = 1.0;
}

void ITColor::ITColor(ITColor *this, double a2, double a3)
{
  this->var0 = a2;
  this->var1 = a2;
  this->var2 = a2;
  this->var3 = a3;
}

uint64_t ITColor::GetARGBBits(ITColor *this)
{
  uint32x2_t v1;

  v1 = vshl_u32((uint32x2_t)vmovn_s64((int64x2_t)vcvtq_u64_f64(vmulq_f64(*(float64x2_t *)&this->var0, (float64x2_t)vdupq_n_s64(0x406FE00000000000uLL)))), (uint32x2_t)0x800000010);
  return v1.i32[0] | (this->var2 * 255.0) | v1.i32[1] | ((this->var3 * 255.0) << 24);
}

unint64_t ITColor::operator RGBColor(uint64_t a1)
{
  int32x2_t v1;
  uint64x2_t v2;
  int64x2_t v3;

  v1 = vmovn_s64(vcvtq_s64_f64(vmulq_f64(*(float64x2_t *)(a1 + 8), (float64x2_t)vdupq_n_s64(0x40EFFFE000000000uLL))));
  v2.i64[0] = v1.u32[0];
  v2.i64[1] = v1.u32[1];
  v3 = (int64x2_t)vshlq_u64(v2, (uint64x2_t)xmmword_1BBED2920);
  return vorrq_s8((int8x16_t)vdupq_laneq_s64(v3, 1), (int8x16_t)v3).u64[0] | (int)(*(double *)a1 * 65535.0);
}

BOOL ITColor::operator==(double *a1, double *a2)
{
  return *a2 == *a1 && a2[1] == a1[1] && a2[2] == a1[2] && a2[3] == a1[3];
}

BOOL ITColor::operator!=(double *a1, double *a2)
{
  return *a2 != *a1 || a2[1] != a1[1] || a2[2] != a1[2] || a2[3] != a1[3];
}

CGColorRef ITColor::CreateCGColor(ITColor *this)
{
  __int128 v1;
  CGColorSpace *SRGB;
  _OWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v1 = *(_OWORD *)&this->var2;
  v4[0] = *(_OWORD *)&this->var0;
  v4[1] = v1;
  SRGB = (CGColorSpace *)CGColorSpaceGetSRGB();
  return CGColorCreate(SRGB, (const CGFloat *)v4);
}

double ITColor::CreateFromHSVColor(double *a1)
{
  double v2;
  double v3;
  double v4;

  v4 = 0.0;
  v2 = 0.0;
  v3 = 0.0;
  HSV2RGB(*a1, a1[1], a1[2], &v4, &v3, &v2);
  return v4;
}

double *HSV2RGB(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  BOOL v20;

  if (a2 > 1.0)
    a2 = 1.0;
  if (a2 >= 0.0)
    v6 = a2;
  else
    v6 = 0.0;
  if (a3 <= 1.0)
    v7 = a3;
  else
    v7 = 1.0;
  if (v7 < 0.0)
    v7 = 0.0;
  if (v6 == 0.0)
  {
    *result = v7;
    *a5 = v7;
  }
  else
  {
    if (a1 > 1.0)
      a1 = 1.0;
    if (a1 >= 0.0)
      v8 = a1 * 6.0;
    else
      v8 = 0.0;
    v9 = (int)v8;
    v10 = v6 * v7 * (v8 - (double)(int)v8);
    v11 = v7 - v6 * v7;
    v12 = v11 + v10;
    if (v11 + v10 > 1.0)
      v12 = 1.0;
    v13 = v7 - v10;
    if (v13 > 1.0)
      v13 = 1.0;
    v14 = v11;
    if ((v9 & 1) != 0)
      v15 = v13;
    else
      v15 = v12;
    if (v14 <= 1.0)
      v16 = v14;
    else
      v16 = 1.0;
    v17 = v7;
    switch(v9)
    {
      case 0:
      case 5:
        break;
      case 1:
      case 4:
        v17 = v15;
        break;
      default:
        v17 = v16;
        break;
    }
    *result = v17;
    v18 = v7;
    if ((v9 - 1) >= 2)
    {
      v19 = v9 == 3 || v9 == 0;
      v18 = v15;
      if (!v19)
        v18 = v16;
    }
    *a5 = v18;
    if ((v9 - 3) >= 2)
    {
      v20 = v9 == 5 || v9 == 2;
      v7 = v15;
      if (!v20)
        v7 = v16;
    }
  }
  *a6 = v7;
  return result;
}

double ITColor::CreateFromHSVDoubles(ITColor *this, double a2, double a3, double a4)
{
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  HSV2RGB(a2, a3, a4, &v7, &v6, &v5);
  return v7;
}

double ITColor::GetHSVColor(ITColor *this)
{
  double v2;
  uint64_t v3;
  uint64_t v4;

  RGB2HSV(this->var0, this->var1, this->var2, &v2, (double *)&v3, (double *)&v4);
  return v2;
}

double *RGB2HSV(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
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
  double v16;
  double v17;
  double v18;

  if (a1 >= 1.0)
    a1 = 1.0;
  v6 = 0.0;
  if (a1 < 0.0)
    a1 = 0.0;
  if (a2 >= 1.0)
    a2 = 1.0;
  if (a2 < 0.0)
    a2 = 0.0;
  if (a3 >= 1.0)
    a3 = 1.0;
  if (a3 >= 0.0)
    v7 = a3;
  else
    v7 = 0.0;
  if (a2 <= a1)
    v8 = a1;
  else
    v8 = a2;
  if (a2 >= a1)
    v9 = a1;
  else
    v9 = a2;
  if (v7 <= a1)
    v10 = a1;
  else
    v10 = v7;
  if (v7 >= a1)
    v11 = a1;
  else
    v11 = v7;
  if (a2 <= v7)
    v8 = v10;
  if (a2 >= v7)
    v9 = v11;
  if (v8 <= 1.0)
    v12 = v8;
  else
    v12 = 1.0;
  *a6 = v12;
  if (v8 == 0.0)
  {
    *a5 = 0.0;
  }
  else
  {
    v13 = v8 - v9;
    v14 = v13 / v8;
    if (v13 / v8 <= 1.0)
    {
      *a5 = v14;
      if (v14 == 0.0)
        goto LABEL_51;
    }
    else
    {
      *a5 = 1.0;
    }
    if (v13 == 0.0)
    {
      v15 = 0.0;
      v16 = 0.0;
    }
    else
    {
      v6 = (v8 - a1) / v13;
      v15 = (v8 - a2) / v13;
      v16 = (v8 - v7) / v13;
    }
    if (a1 == v8)
    {
      v17 = v16 - v15;
    }
    else if (a2 == v8)
    {
      v17 = v6 + 2.0 - v16;
    }
    else
    {
      v17 = v15 + 4.0 - v6;
    }
    v18 = v17 / 6.0;
    if (v18 < 0.0)
      v18 = v18 + 1.0;
    if (v18 <= 1.0)
      v6 = v18;
    else
      v6 = 1.0;
  }
LABEL_51:
  *result = v6;
  return result;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, double a2, double a3, double a4)
{
  double v5;
  uint64_t v6;
  uint64_t v7;

  RGB2HSV(a2, a3, a4, &v5, (double *)&v6, (double *)&v7);
  return v5;
}

double ITColor::GetHSVColorForRGBValues(ITColor *this, unsigned int a2, unsigned int a3)
{
  double v4;
  uint64_t v5;
  uint64_t v6;

  RGB2HSV((double)this / 255.0, (double)a2 / 255.0, (double)a3 / 255.0, &v4, (double *)&v5, (double *)&v6);
  return v4;
}

void ITColor::GetLuminance(ITColor *this)
{
  uint64_t v1;
  double v2;
  double v3;
  __int128 v4;
  double var2;
  uint64_t v6;

  v1 = 0;
  v6 = *MEMORY[0x1E0C80C00];
  v4 = *(_OWORD *)&this->var0;
  var2 = this->var2;
  do
  {
    v2 = *(double *)((char *)&v4 + v1);
    if (v2 <= 0.0392800011)
      v3 = v2 / 12.9200001;
    else
      v3 = pow((v2 + 0.0549999997) / 1.05499995, 2.4);
    *(double *)((char *)&v4 + v1) = v3;
    v1 += 8;
  }
  while (v1 != 24);
}

double ITColor::GetContrastWithColor(ITColor *this, ITColor *a2)
{
  double v3;
  double v4;
  double v5;
  double v6;

  ITColor::GetLuminance(a2);
  v4 = v3;
  ITColor::GetLuminance(this);
  if (v5 <= v4)
    v6 = v4;
  else
    v6 = v5;
  if (v5 > v4)
    v5 = v4;
  return (v6 + 0.0500000007) / (v5 + 0.0500000007);
}

double ITColor::GetContrastWithLuminance(ITColor *this, double a2)
{
  double v3;
  double v4;

  ITColor::GetLuminance(this);
  if (v3 <= a2)
    v4 = a2;
  else
    v4 = v3;
  if (v3 > a2)
    v3 = a2;
  return (v4 + 0.0500000007) / (v3 + 0.0500000007);
}

double ITColor::GetHueDistanceFromColor(double *a1, double *a2)
{
  double v2;
  double v3;
  double result;

  v2 = *a1;
  v3 = *a2;
  result = vabdd_f64(*a1, *a2);
  if (result > 0.5)
  {
    result = v3 + 1.0 - v2;
    if (v2 <= v3)
      return v2 + 1.0 - v3;
  }
  return result;
}

BOOL ITColor::IsCloseToColor(ITColor *this, ITColor *a2, double a3)
{
  double HSVColor;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (a3 <= 0.0 || a3 >= 1.0)
    return 0;
  HSVColor = ITColor::GetHSVColor(this);
  v8 = v7;
  v10 = v9;
  v11 = ITColor::GetHSVColor(a2);
  if (vabdd_f64(v8, v13) > a3 || vabdd_f64(v10, v12) > a3)
    return 0;
  if (vabdd_f64(HSVColor, v11) <= a3)
    return 1;
  v14 = HSVColor + 1.0;
  if (HSVColor >= a3)
    v14 = HSVColor;
  if (v11 < a3)
    v11 = v11 + 1.0;
  return vabdd_f64(v14, v11) <= a3;
}

double ITColor::CreateBlendedColorWithFraction(ITColor *this, double a2, ITColor a3)
{
  if (a2 < 1.0)
  {
    if (a2 <= 0.0)
      a3.var0 = this->var0;
    else
      a3.var0 = (1.0 - a2) * this->var0 + a3.var0 * a2;
  }
  return a3.var0;
}

void sub_1BBDDD428(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDDD674(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBDDD804(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBDDDA9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDDE6D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,id location)
{
  id *v28;

  objc_destroyWeak(v28);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDDEB84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDDF584(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDE7208(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBDE780C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BBDE7D58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDE95F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDEBAE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDEBBF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__88(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__88(uint64_t a1)
{

}

void sub_1BBDEBE28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id SKUIMetricsMediaEventTypeForPlaybackState(unint64_t a1)
{
  uint64_t has_internal_content;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  has_internal_content = os_variant_has_internal_content();
  if ((_DWORD)has_internal_content)
  {
    has_internal_content = _os_feature_enabled_impl();
    if ((_DWORD)has_internal_content)
    {
      has_internal_content = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if ((_DWORD)has_internal_content)
        SKUIMetricsMediaEventTypeForPlaybackState_cold_1(has_internal_content, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (a1 <= 2)
    has_internal_content = (uint64_t)**((id **)&unk_1E73A8950 + a1);
  return (id)has_internal_content;
}

void sub_1BBDEF144(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDEFA40(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDF0D2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDF12B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDF16D8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 176), 8);
  _Block_object_dispose((const void *)(v27 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__89(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__89(uint64_t a1)
{

}

void sub_1BBDFB240(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDFC040(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBDFC28C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

id SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  SKUIArtwork *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  SKUIArtwork *v23;
  void *v24;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v4, "style");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v4, "elementType");
  if (v14 == 49)
  {
    objc_msgSend(v4, "resourceName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v21;
    if (v21)
    {
      SKUIImageWithResourceName(v21);
      v17 = (SKUIArtwork *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {
        v20 = 0;
        goto LABEL_15;
      }
      +[SKUIIndexBarEntryDescriptor entryDescriptorWithImage:](SKUIIndexBarEntryDescriptor, "entryDescriptorWithImage:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = [SKUIArtwork alloc];
      objc_msgSend(v4, "URL");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "size");
      v17 = -[SKUIArtwork initWithURL:size:](v23, "initWithURL:size:", v24);

      +[SKUIIndexBarEntryDescriptor entryDescriptorWithArtwork:](SKUIIndexBarEntryDescriptor, "entryDescriptorWithArtwork:", v17);
      v22 = objc_claimAutoreleasedReturnValue();
    }
    v20 = (void *)v22;
LABEL_15:

    goto LABEL_16;
  }
  if (v14 == 138)
  {
    objc_msgSend(v4, "style");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementPlainColorWithStyle(v15, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
    v17 = (SKUIArtwork *)objc_claimAutoreleasedReturnValue();
    SKUIViewElementFontWithStyle(v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SKUIArtwork attributedStringWithDefaultFont:foregroundColor:](v17, "attributedStringWithDefaultFont:foregroundColor:", v18, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[SKUIIndexBarEntryDescriptor entryDescriptorWithAttributedString:](SKUIIndexBarEntryDescriptor, "entryDescriptorWithAttributedString:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_15;
  }
  v20 = 0;
LABEL_16:
  objc_msgSend(v20, "setVisibilityPriority:", objc_msgSend(v3, "visibilityPriority"));

  return v20;
}

void sub_1BBDFDC40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDFE3B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBDFE768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__90(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__90(uint64_t a1)
{

}

void sub_1BBE00224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE00464(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE0171C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__91(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__91(uint64_t a1)
{

}

uint64_t storeShouldReverseLayoutDirection()
{
  if (didSetAtLeastOnce != -1)
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
  return shouldFlipForRTL;
}

void __storeShouldReverseLayoutDirection_block_invoke()
{
  id v0;

  +[SKUIClientContext defaultContext](SKUIClientContext, "defaultContext");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  _SKUISetShouldReverseLayoutDirectionWithContext(v0);

}

void _SKUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v16 = a1;
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "BOOLForKey:", CFSTR("SKForceRightToLeftWritingDirection"));

  if (v2)
  {
    shouldFlipForRTL = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "infoDictionary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("SKRespectClientUserInterfaceLayoutDirection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "keyWindow");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "semanticContentAttribute");

      shouldFlipForRTL = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", v9) == 1;
    }
    else
    {
      v10 = (void *)MEMORY[0x1E0C99DC8];
      objc_msgSend(v16, "valueForConfigurationKey:", CFSTR("locale"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "localeWithLocaleIdentifier:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = (void *)MEMORY[0x1E0DC1290];
      objc_msgSend(v12, "objectForKey:", *MEMORY[0x1E0C997E8]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "defaultWritingDirectionForLanguage:", v14);

      if (v15 == 1)
        shouldFlipForRTL = 1;

    }
  }

}

uint64_t storeSemanticContentAttribute()
{
  if (didSetAtLeastOnce != -1)
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
  if (shouldFlipForRTL)
    return 4;
  else
    return 3;
}

void SKUISetShouldReverseLayoutDirectionWithContext(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUISetShouldReverseLayoutDirectionWithContext_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if (didSetAtLeastOnce != -1)
    dispatch_once(&didSetAtLeastOnce, &__block_literal_global_4_0);
  _SKUISetShouldReverseLayoutDirectionWithContext(v1);

}

void SKUIRectByApplyingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v16)
        SKUIRectByApplyingUserInterfaceLayoutDirectionInRect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  double v18;
  double v19;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  if (a1)
  {
    if (didSetAtLeastOnce != -1)
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
    if (shouldFlipForRTL)
    {
LABEL_5:
      v21.origin.x = a6;
      v21.origin.y = a7;
      v21.size.width = a8;
      v21.size.height = a9;
      MaxX = CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.width = a4;
      v22.size.height = a5;
      v18 = MaxX - CGRectGetMinX(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      v19 = v18 - CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      CGRectGetMinY(v24);
      v25.origin.x = a2;
      v25.origin.y = a3;
      v25.size.width = a4;
      v25.size.height = a5;
      CGRectGetWidth(v25);
      v26.origin.x = a2;
      v26.origin.y = a3;
      v26.size.width = a4;
      v26.size.height = a5;
      CGRectGetHeight(v26);
      return v19;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1)
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_14_1);
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1)
      goto LABEL_5;
  }
  return a2;
}

void SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  _BOOL8 v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v16 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v16)
        SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect_cold_1(v16, v17, v18, v19, v20, v21, v22, v23);
    }
  }
  _SKUIRectByApplyingUserInterfaceLayoutDirectionDependentOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

void SKUIRectByRemovingUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUIRectByRemovingUserInterfaceLayoutDirectionInRect_cold_1();
  }
  _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(0, a1, a2, a3, a4, a5, a6, a7, a8);
}

CGFloat _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(int a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8, CGFloat a9)
{
  double MaxX;
  double v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;

  if (a1)
  {
    if (didSetAtLeastOnce != -1)
      dispatch_once(&didSetAtLeastOnce, &__block_literal_global_57);
    if (shouldFlipForRTL)
    {
LABEL_5:
      v20.origin.x = a6;
      v20.origin.y = a7;
      v20.size.width = a8;
      v20.size.height = a9;
      MaxX = CGRectGetMaxX(v20);
      v21.origin.x = a2;
      v21.origin.y = a3;
      v21.size.width = a4;
      v21.size.height = a5;
      v18 = MaxX - CGRectGetMaxX(v21);
      v22.origin.x = a2;
      v22.origin.y = a3;
      v22.size.width = a4;
      v22.size.height = a5;
      CGRectGetMinY(v22);
      v23.origin.x = a2;
      v23.origin.y = a3;
      v23.size.width = a4;
      v23.size.height = a5;
      CGRectGetWidth(v23);
      v24.origin.x = a2;
      v24.origin.y = a3;
      v24.size.width = a4;
      v24.size.height = a5;
      CGRectGetHeight(v24);
      return v18;
    }
  }
  else
  {
    if (shouldReverseLayoutDirection_onceToken != -1)
      dispatch_once(&shouldReverseLayoutDirection_onceToken, &__block_literal_global_14_1);
    if (shouldReverseLayoutDirection_shouldFlipForRTL == 1)
      goto LABEL_5;
  }
  return a2;
}

CGFloat SKUIRectByRemovingStoreUserInterfaceLayoutDirectionInRect(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  return _SKUIRectByRemovingUserInterfaceLayoutDirectionInRectDependendOnStore(1, a1, a2, a3, a4, a5, a6, a7, a8);
}

uint64_t __shouldReverseLayoutDirection_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t result;

  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "keyWindow");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "semanticContentAttribute");

  result = objc_msgSend(MEMORY[0x1E0DC3F10], "userInterfaceLayoutDirectionForSemanticContentAttribute:", v2);
  if (result == 1)
    shouldReverseLayoutDirection_shouldFlipForRTL = 1;
  return result;
}

void sub_1BBE048D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__92(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__92(uint64_t a1)
{

}

double SKUISpacePageComponentHeightForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  float v11;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUISpacePageComponentHeightForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = 1.0;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XS")) & 1) == 0)
  {
    v10 = 5.0;
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("S")) & 1) == 0)
    {
      v10 = 7.0;
      if ((objc_msgSend(v1, "isEqualToString:", CFSTR("M")) & 1) == 0)
      {
        v10 = 10.0;
        if ((objc_msgSend(v1, "isEqualToString:", CFSTR("L")) & 1) == 0)
        {
          v10 = 25.0;
          if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XL")) & 1) == 0)
          {
            if ((objc_msgSend(v1, "isEqualToString:", CFSTR("XXL")) & 1) != 0)
            {
              v10 = 100.0;
            }
            else
            {
              objc_msgSend(v1, "floatValue");
              v10 = v11;
            }
          }
        }
      }
    }
  }

  return v10;
}

void sub_1BBE088C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE08D88(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE098BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41,uint64_t a42,uint64_t a43,uint64_t a44,char a45)
{
  _Block_object_dispose(&a37, 8);
  _Block_object_dispose(&a41, 8);
  _Block_object_dispose(&a45, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE09CEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a9);
  va_start(va, a9);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE0B84C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__93(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__93(uint64_t a1)
{

}

void sub_1BBE0D2C4(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__94(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__94(uint64_t a1)
{

}

double SKUIBrickItemSize()
{
  void *v0;
  uint64_t v1;
  double v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
    v2 = 210.0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "bounds");
    v5 = v4;

    if (v5 <= 375.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "bounds");
      v8 = v7;

      v2 = dbl_1BBED1950[v8 > 320.0];
    }
    else
    {
      v2 = 175.0;
    }
  }
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scale");
  v11 = v10;

  return v2 * v11;
}

void sub_1BBE0DD9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__95(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__95(uint64_t a1)
{

}

void sub_1BBE0E780(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, id a19)
{
  id *v19;
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a19);
  _Unwind_Resume(a1);
}

void sub_1BBE10574(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE14604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE1583C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE15E4C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 192), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE18E50(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE192BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void *__Block_byref_object_copy__96(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__96(uint64_t a1)
{

}

void sub_1BBE19EF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE1A9B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double SKUIAttributedStringGetLineHeight(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  _QWORD v14[5];
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUIAttributedStringGetLineHeight_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v15 = 0;
  v16 = (double *)&v15;
  v17 = 0x2020000000;
  v18 = 0;
  v10 = objc_msgSend(v1, "length");
  v11 = *MEMORY[0x1E0DC1138];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __SKUIAttributedStringGetLineHeight_block_invoke;
  v14[3] = &unk_1E73A8F90;
  v14[4] = &v15;
  objc_msgSend(v1, "enumerateAttribute:inRange:options:usingBlock:", v11, 0, v10, 0, v14);
  v12 = v16[3];
  _Block_object_dispose(&v15, 8);

  return v12;
}

void sub_1BBE1AD30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUIGetLayoutProperties(uint64_t a1, uint64_t a2, _QWORD *a3, double *a4)
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUIGetLayoutProperties_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if (a2 < 1)
  {
    v18 = 0.0;
  }
  else
  {
    v16 = 0;
    v17 = a1 + 24;
    v18 = 0.0;
    v19 = 0.0;
    do
    {
      if ((*(_BYTE *)(v17 + 16) & 1) != 0)
      {
        v20 = v19 + v18;
        v21 = *(double *)v17;
        v19 = *(double *)(v17 + 8);
        v23 = *(double *)(v17 - 16);
        v22 = *(double *)(v17 - 8);
        *(double *)(*a3 + 8 * v16) = v20 - v22;
        v18 = v20 + v23 - v21 - v22;
      }
      v17 += 48;
      ++v16;
    }
    while (a2 != v16);
  }
  *a4 = v18;
}

double SKUIScaleSizeToFit(double a1, double a2, double a3, double a4)
{
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  double v16;

  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUIScaleSizeToFit_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = a2 / a4;
  if (a1 / a3 < a2 / a4)
    v16 = a1 / a3;
  return ceil(a3 * v16);
}

void sub_1BBE1DC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE1DF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE1F46C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE1FDF8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t CGColorSpaceGetSRGB()
{
  if (CGColorSpaceGetSRGB::sOnceToken != -1)
    dispatch_once(&CGColorSpaceGetSRGB::sOnceToken, &__block_literal_global_61);
  return CGColorSpaceGetSRGB::sSpace;
}

void sub_1BBE203C8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

uint64_t ColorSyncLibrary(void)
{
  unsigned __int8 v0;
  uint64_t v1;
  void *v3;

  {
    ColorSyncLibraryCore(char **)::frameworkLibrary = 0;
  }
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
    ColorSyncLibraryCore(char **)::frameworkLibrary = _sl_dlopen();
  v1 = ColorSyncLibraryCore(char **)::frameworkLibrary;
  if (!ColorSyncLibraryCore(char **)::frameworkLibrary)
  {
    v3 = (void *)abort_report_np();
    free(v3);
  }
  return v1;
}

void sub_1BBE2142C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE21B00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  uint64_t v13;
  va_list va;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v13 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v11 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE22020(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE22334(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE239BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE23F04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE24B94(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 128), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__97(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__97(uint64_t a1)
{

}

uint64_t SKUIProductPageFragmentWithURL(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIProductPageFragmentWithURL_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "fragment");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "isEqualToString:", CFSTR("reviews")) & 1) != 0)
  {
    v11 = 1;
  }
  else if (objc_msgSend(v10, "isEqualToString:", CFSTR("related")))
  {
    v11 = 2;
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

void sub_1BBE27514(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1BBE27D54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__98(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__98(uint64_t a1)
{

}

void sub_1BBE2C17C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE2CEB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE2D6D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUIUserInterfaceIdiom(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (!v1 || (v3 = objc_msgSend(v1, "userInterfaceIdiomOverride"), v3 == 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "userInterfaceIdiom");

  }
  return v3;
}

double SKUICompactThreshold()
{
  if (SKUICompactThreshold_onceToken != -1)
    dispatch_once(&SKUICompactThreshold_onceToken, &__block_literal_global_450);
  return *(double *)&SKUICompactThreshold_threshold;
}

id SKUIXEventSearchDictionary(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("search"), CFSTR("type"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "setObject:forKey:", v3, CFSTR("term"));
  if (v4)
    objc_msgSend(v6, "setObject:forKey:", v4, CFSTR("url"));

  return v6;
}

uint64_t SKUIXEventSidepackDictionary(uint64_t a1)
{
  return objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithObjectsAndKeys:", CFSTR("sidePack"), CFSTR("type"), a1, CFSTR("sidePackData"), 0);
}

void sub_1BBE32E8C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBE3306C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBE34604(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE34A68(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBE352CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE35FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__99(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__99(uint64_t a1)
{

}

void sub_1BBE3723C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE37988(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE3939C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__100(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__100(uint64_t a1)
{

}

void sub_1BBE3E4A0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_1BBE3E700(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE3E974(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE3EFB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE3F1D0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBE3F370(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE3F4FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBE404C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE408C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__101(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__101(uint64_t a1)
{

}

void sub_1BBE41570(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE42AC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  _Unwind_Resume(exception_object);
}

void sub_1BBE43A24(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBE45238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE45340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__102(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__102(uint64_t a1)
{

}

void sub_1BBE45604(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE458CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  uint64_t v13;
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

id SKUIVideoPreviewPlayPlayableVideoWithAsset(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  _BOOL8 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  id v34;
  uint64_t v35;
  id v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  id v48;
  id v49;
  _BOOL8 v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  Float64 v58;
  void *v59;
  uint64_t v60;
  void *v61;
  id v62;
  id v64;
  id v65;
  const __CFString *v66;
  CMTime v67;
  CMTime v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  v16 = v5;
  v17 = v6;
  v18 = v7;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v19 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v19)
        SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_2(v19, v20, v21, v22, v23, v24, v25, v26);
    }
  }
  objc_msgSend(v17, "contentURL");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v27)
  {
    v38 = 0;
    goto LABEL_22;
  }
  v28 = (void *)SKUIAVFoundationFramework();
  v29 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetInheritURIQueryComponentFromReferencingURIKey", v28);
  v67.value = (CMTimeValue)v29;
  v68.value = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v68, &v67, 1);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16 && objc_msgSend(v16, "kind"))
  {
    v31 = (void *)SKUIAVFoundationFramework();
    v32 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationOptionsKey", v31);
    v33 = (void *)SKUIAVFoundationFramework();
    v34 = *(id *)SKUIWeakLinkedSymbolForString("AVURLAssetAlternativeConfigurationServiceIdentifierKey", v33);
    v35 = objc_msgSend(v16, "kind");
    if (v35 == 1)
    {
      v64 = v18;
      v36 = v34;
      v37 = CFSTR("com.apple.itunesstore.movies.preview.cloud");
    }
    else
    {
      if (v35 != 2)
      {
LABEL_18:

        goto LABEL_19;
      }
      v64 = v18;
      v36 = v34;
      v37 = CFSTR("com.apple.itunesstore.tvshows.preview.cloud");
    }
    v39 = (void *)objc_msgSend(v30, "mutableCopy");
    v65 = v36;
    v66 = v37;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v66, &v65, 1);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setObject:forKey:", v40, v32);
    v41 = objc_msgSend(v39, "copy");

    v34 = v36;
    v30 = (void *)v41;
    v18 = v64;
    goto LABEL_18;
  }
LABEL_19:
  v42 = SKUIAVFoundationFramework();
  v38 = (void *)objc_msgSend(objc_alloc((Class)SKUIWeakLinkedClassForString(CFSTR("AVURLAsset"), v42)), "initWithURL:options:", v27, v30);
  +[SKUIStoreAssetResourceLoaderDelegate storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:](SKUIStoreAssetResourceLoaderDelegate, "storeAssetResourceLoaderDelegateForPlayableAsset:clientContext:", v17, v18);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  if (v43)
  {
    objc_msgSend(v38, "resourceLoader");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    SKUIStoreAssetResourceLoaderConfigureWithDelegate(v44, v43);

  }
LABEL_22:

  if (v38)
  {
    v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B300]), "initWithAsset:", v38);
    v46 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C8B2E8]), "initWithPlayerItem:", v45);
    v47 = objc_alloc_init(MEMORY[0x1E0C8B448]);
    objc_msgSend(v47, "setPlayer:", v46);
    objc_msgSend(v47, "setExitsFullScreenWhenPlaybackEnds:", 1);
    v48 = v46;
    v49 = v17;
    if (os_variant_has_internal_content())
    {
      if (_os_feature_enabled_impl())
      {
        v50 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
        if (v50)
          SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_1(v50, v51, v52, v53, v54, v55, v56, v57);
      }
    }
    objc_msgSend(v49, "initialPlaybackTime");
    memset(&v68, 0, sizeof(v68));
    CMTimeMakeWithSeconds(&v68, v58, 1000000);
    v67 = v68;
    objc_msgSend(v48, "seekToTime:", &v67);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "postNotificationName:object:", CFSTR("SKUIVideoPreviewDidStartNotification"), 0);

    v60 = objc_msgSend(v49, "storeItemIdentifier");
    SKUIVideoPreviewObservePlayer(v48, v60);
    objc_msgSend(MEMORY[0x1E0DDC1E8], "sessionManager");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = (id)objc_msgSend(v61, "stopAllAudioPlayerSessions");

    objc_msgSend(v48, "play");
  }
  else
  {
    v47 = 0;
  }

  return v47;
}

id SKUIVideoPreviewPlayPlayableAsset(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUIVideoPreviewPlayPlayableAsset_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  SKUIVideoPreviewPlayPlayableVideoWithAsset(0, v3, v4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

void SKUIVideoPreviewDismissOnEnterBackground(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _SKUIVideoPreviewNotificationObserver *v19;
  void *v20;
  _SKUIVideoPreviewNotificationObserver *v21;
  _QWORD aBlock[4];
  id v23;
  id location;
  _QWORD v25[3];

  v25[2] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUIVideoPreviewDismissOnEnterBackground_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_getAssociatedObject(v1, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10 == 0;

  if (v11)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, v1);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __SKUIVideoPreviewDismissOnEnterBackground_block_invoke;
    aBlock[3] = &unk_1E73A9848;
    objc_copyWeak(&v23, &location);
    v13 = _Block_copy(aBlock);
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", *MEMORY[0x1E0DC4768], v14, v15, v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3828], "mainQueue");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserverForName:object:queue:usingBlock:", CFSTR("SKUIVideoPreviewDismissNotification"), 0, v17, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = [_SKUIVideoPreviewNotificationObserver alloc];
    v25[0] = v16;
    v25[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[_SKUIVideoPreviewNotificationObserver initWithObservers:](v19, "initWithObservers:", v20);

    objc_setAssociatedObject(v1, "com.apple.StoreKitUI.MoviePlayer.BackgroundObserver", v21, (void *)1);
    objc_destroyWeak(&v23);
    objc_destroyWeak(&location);

  }
}

void sub_1BBE46C70(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SKUIVideoPreviewObservePlayer(void *a1, uint64_t a2)
{
  id v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD block[4];
  id v16;

  v3 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v4 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v4)
        SKUIVideoPreviewObservePlayer_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    }
  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __SKUIVideoPreviewObservePlayer_block_invoke_3;
  block[3] = &unk_1E73A1618;
  v16 = &__block_literal_global_64;
  if (SKUIVideoPreviewObservePlayer_sOnce != -1)
  {
    dispatch_once(&SKUIVideoPreviewObservePlayer_sOnce, block);
    if (!a2)
      goto LABEL_8;
    goto LABEL_7;
  }
  if (a2)
  {
LABEL_7:
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithLongLong:", a2);
    objc_msgSend(v3, "currentItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(v13, "com.apple.StoreKitUI.MoviePlayerItemID", v12, (void *)1);

  }
LABEL_8:
  objc_msgSend(v3, "currentItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(v14, "com.apple.StoreKitUI.MoviePlayerTrackingKey", MEMORY[0x1E0C9AAB0], (void *)1);

}

void sub_1BBE46FC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void SKUICollectionViewUpdatePerspectiveCells(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat MidX;
  CGFloat MidY;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[6];
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;

  v38 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
  {
    SKUICollectionViewUpdatePerspectiveCells_cold_1();
    if (v4)
      goto LABEL_5;
LABEL_18:
    objc_msgSend(v3, "visibleCells");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (!v4)
    goto LABEL_18;
LABEL_5:
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "indexPathsForVisibleItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v33 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        if (objc_msgSend(v4, "containsIndex:", objc_msgSend(v11, "section")))
        {
          objc_msgSend(v3, "cellForItemAtIndexPath:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v8);
  }

LABEL_19:
  objc_msgSend(v3, "bounds");
  x = v39.origin.x;
  y = v39.origin.y;
  width = v39.size.width;
  height = v39.size.height;
  MidX = CGRectGetMidX(v39);
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  MidY = CGRectGetMidY(v40);
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __SKUICollectionViewUpdatePerspectiveCells_block_invoke;
  v31[3] = &__block_descriptor_48_e55_q24__0__UICollectionViewCell_8__UICollectionViewCell_16l;
  *(CGFloat *)&v31[4] = MidX;
  *(CGFloat *)&v31[5] = MidY;
  objc_msgSend(v5, "sortedArrayWithOptions:usingComparator:", 0, v31);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v20 = v19;
  v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v22; ++j)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v20);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
        if (objc_msgSend(v25, "conformsToProtocol:", &unk_1EF42F8D8, (_QWORD)v27))
        {
          objc_msgSend(v25, "updateForChangedDistanceFromVanishingPoint");
          objc_msgSend(v25, "superview");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "sendSubviewToBack:", v25);

        }
      }
      v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v27, v36, 16);
    }
    while (v22);
  }

}

void sub_1BBE4CDA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE4CFF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1BBE4D534(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,char a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34,uint64_t a35,uint64_t a36,uint64_t a37,char a38)
{
  uint64_t v38;

  _Block_object_dispose(&a24, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose(&a38, 8);
  _Block_object_dispose((const void *)(v38 - 232), 8);
  _Block_object_dispose((const void *)(v38 - 200), 8);
  _Block_object_dispose((const void *)(v38 - 168), 8);
  _Unwind_Resume(a1);
}

void sub_1BBE4DBFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  uint64_t v31;

  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a27, 8);
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose((const void *)(v31 - 144), 8);
  _Block_object_dispose((const void *)(v31 - 112), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__103(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__103(uint64_t a1)
{

}

id _SKUIErrorFromError(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  v1 = a1;
  objc_msgSend(v1, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SKUIMacErrorDomain"));

  if (v3)
  {
    v4 = objc_msgSend(v1, "code");
    if (v4 == 2)
      v5 = 7;
    else
      v5 = 4 * (v4 == 1);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v1, *MEMORY[0x1E0CB3388]);
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SKUIErrorDomain"), v5, v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = v1;
  }

  return v7;
}

void sub_1BBE5326C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1BBE534B0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1BBE53640(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1BBE538D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SKUIDecodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
        SKUIDecodeRestorableStateWithCoder_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  objc_msgSend(v7, "decodeObjectOfClass:forKey:", objc_opt_class(), v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3710]), "initForReadingFromData:error:", v16, 0);
    objc_msgSend(v5, "decodeRestorableStateWithCoder:", v17);
    objc_msgSend(v17, "finishDecoding");

  }
}

void SKUIEncodeRestorableStateWithCoder(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v8)
      {
        SKUIEncodeRestorableStateWithCoder_cold_1(v8, v9, v10, v11, v12, v13, v14, v15);
        if (!v7)
          goto LABEL_6;
        goto LABEL_5;
      }
    }
  }
  if (v7)
  {
LABEL_5:
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36F8]), "initRequiringSecureCoding:", 1);
    objc_msgSend(v7, "encodeRestorableStateWithCoder:", v16);
    objc_msgSend(v16, "encodedData");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "encodeObject:forKey:", v17, v6);

  }
LABEL_6:

}

void *__Block_byref_object_copy__104(uint64_t a1, uint64_t a2)
{
  void *result;

  result = _Block_copy(*(const void **)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__104(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__6_0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__7_0(uint64_t a1)
{

}

void sub_1BBE55310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v12;
  va_list va;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  va_list va1;

  va_start(va1, a11);
  va_start(va, a11);
  v12 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  v18 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t (*SKUIMetricsLaunchApplicationWithIdentifier(uint64_t a1, uint64_t a2))(uint64_t, uint64_t)
{
  void *v4;
  uint64_t (*result)(uint64_t, uint64_t);

  v4 = (void *)SKUISpringBoardServicesFramework();
  result = (uint64_t (*)(uint64_t, uint64_t))SKUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifier", v4);
  if (result)
    return (uint64_t (*)(uint64_t, uint64_t))result(a1, a2);
  return result;
}

uint64_t (*SKUIMetricsLaunchApplicationWithIdentifierAndURLAndLaunchOptions(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5))(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t)
{
  void *v10;
  uint64_t (*result)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v10 = (void *)SKUISpringBoardServicesFramework();
  result = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))SKUIWeakLinkedSymbolForString("SBSLaunchApplicationWithIdentifierAndURLAndLaunchOptions", v10);
  if (result)
    return (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))result(a1, a2, a3, a4, a5);
  return result;
}

id SKUIMetricsNavigationTypeFromNavigationControllerOperation(uint64_t a1)
{
  id *v1;

  if (a1 == 1)
  {
    v1 = (id *)MEMORY[0x1E0DAFC80];
  }
  else
  {
    if (a1 != 2)
      return 0;
    v1 = (id *)MEMORY[0x1E0DAFC78];
  }
  return *v1;
}

void SKUIMetricsOpenSensitiveURL(void *a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a1;
  v3 = (void *)MEMORY[0x1E0DC3470];
  v4 = a2;
  objc_msgSend(v3, "sharedApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "application:recordExitMetricsEventWithURL:", v5, v9);
  v7 = SKUIMobileCoreServicesFramework();
  objc_msgSend(SKUIWeakLinkedClassForString(CFSTR("LSApplicationWorkspace"), v7), "defaultWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "openSensitiveURL:withOptions:", v9, v4);

}

void SKUIMetricsOpenURL(void *a1)
{
  void *v1;
  void *v2;
  id v3;

  v3 = a1;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v2, "application:recordExitMetricsEventWithURL:", v1, v3);
  objc_msgSend(v1, "openURL:options:completionHandler:", v3, MEMORY[0x1E0C9AA70], 0);

}

void SKUIMetricsSetClickEventPositionWithPoint(void *a1, double a2, double a3)
{
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  v5 = (void *)MEMORY[0x1E0DC3BF8];
  v6 = a1;
  objc_msgSend(v5, "mainScreen");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "scale");
  v9 = v8;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(a2 * v9));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPositionX:", v10);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", (uint64_t)(a3 * v9));
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPositionY:", v11);

}

void SKUIMetricsSetClickEventPositionWithView(void *a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;

  if (a2)
  {
    v3 = a2;
    v8 = a1;
    objc_msgSend(v3, "bounds");
    objc_msgSend(v3, "convertRect:toView:", 0);
    v5 = v4;
    v7 = v6;

    SKUIMetricsSetClickEventPositionWithPoint(v8, v5, v7);
  }
}

__CFString *SKUIMetricsWindowOrientationForInterfaceOrientation(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return 0;
  else
    return off_1E73A9B10[a1 - 1];
}

void sub_1BBE57BA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v9;
  va_list va;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v9 = va_arg(va1, _QWORD);
  v11 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__105(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__105(uint64_t a1)
{

}

void SKUINavigationControllerWillShowViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUINavigationControllerWillShowViewController_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  v13 = objc_msgSend(v3, "lastOperation");
  if (v13 == 2)
  {
    objc_msgSend(v3, "disappearingViewController");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = v4;
  }
  else
  {
    if (v13 != 1)
    {
      v14 = v4;
      v16 = 0;
      goto LABEL_11;
    }
    v14 = v4;
    objc_msgSend(v3, "disappearingViewController");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
LABEL_11:
  objc_msgSend(v3, "navigationBar");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_backdropViewLayerGroupName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "SKUIPinnedHeaderView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setGroupName:", v18);

  objc_msgSend(v16, "SKUIPinnedHeaderView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setGroupName:", 0);

}

void SKUINavigationControllerDidShowViewController(void *a1, void *a2)
{
  id v3;
  id v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;

  v3 = a1;
  v4 = a2;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v5 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v5)
        SKUINavigationControllerDidShowViewController_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
  objc_msgSend(v3, "navigationBar");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "_backdropViewLayerGroupName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "SKUIPinnedHeaderView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setGroupName:", v14);
}

void SKUIScrollViewSetPinnedHeaderContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        SKUIScrollViewSetPinnedHeaderContentInsets_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  __SKUIScrollViewSetKeyedContentInsets(v9, "com.apple.iTunesStoreUI.pinnedHeaderInset", 0, a2, a3, a4, a5);

}

void __SKUIScrollViewSetKeyedContentInsets(void *a1, const void *a2, int a3, double a4, double a5, double a6, double a7)
{
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
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  id object;

  object = a1;
  objc_getAssociatedObject(object, a2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "UIEdgeInsetsValue");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
  }
  else
  {
    v14 = *MEMORY[0x1E0DC49E8];
    v16 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v18 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v20 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  objc_msgSend(object, "contentInset");
  if (v16 != a5 || v14 != a4 || v20 != a7 || v18 != a6)
  {
    v39 = v23;
    v40 = v24;
    v37 = v18;
    v38 = v22;
    v28 = v16;
    v29 = v21;
    objc_msgSend(object, "contentOffset");
    v35 = v31;
    v36 = v30;
    v41 = a4;
    v42 = a5;
    v32 = a4 - v14;
    v33 = a5 - v28 + v38;
    objc_msgSend(object, "setContentInset:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    objc_msgSend(object, "setScrollIndicatorInsets:", v32 + v29, v33, a6 - v37 + v39, a7 - v20 + v40);
    if (a3)
      objc_msgSend(object, "setContentOffset:", v36, v35 - v32);
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithUIEdgeInsets:", v41, v42, a6, a7);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_setAssociatedObject(object, a2, v34, (void *)1);

  }
}

void SKUIScrollViewSetDefaultContentInsets(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  _BOOL8 v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;

  v9 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v10 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v10)
        SKUIScrollViewSetDefaultContentInsets_cold_1(v10, v11, v12, v13, v14, v15, v16, v17);
    }
  }
  __SKUIScrollViewSetKeyedContentInsets(v9, "com.apple.iTunesStoreUI.defaultHeaderInset", 1, a2, a3, a4, a5);

}

double SKUILayoutGuideInsets(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  double v15;
  double v16;
  void *v17;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT);
      if (v2)
        SKUILayoutGuideInsets_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  v10 = v1;
  objc_msgSend(v10, "parentViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v12 = v10;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      v13 = v11;

      objc_msgSend(v13, "parentViewController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = v13;
      if (!v11)
        goto LABEL_13;
    }
    v13 = v12;
  }
  else
  {
    v13 = v10;
  }
LABEL_13:
  objc_msgSend(v13, "topLayoutGuide");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "length");
  v16 = v15;
  objc_msgSend(v13, "bottomLayoutGuide");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "length");

  return v16;
}

void sub_1BBE5B404(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SKUILabelViewStyleForString(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUILabelViewStyleForString_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("title")) & 1) != 0)
  {
    v10 = 5;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("subtitle")) & 1) != 0)
  {
    v10 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("notice")) & 1) != 0)
  {
    v10 = 3;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("description")) & 1) != 0)
  {
    v10 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("navigationTitle")))
  {
    v10 = 2;
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void sub_1BBE5D30C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__106(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__106(uint64_t a1)
{

}

id SKUILabelStringAttributesWithSpanElement(void *a1)
{
  id v1;
  _BOOL8 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v1 = a1;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      v2 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG);
      if (v2)
        SKUILabelStringAttributesWithSpanElement_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    }
  }
  objc_msgSend(v1, "style");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  SKUIViewElementFontWithStyle(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "setObject:forKey:", v12, *MEMORY[0x1E0DC1138]);
  objc_msgSend(v10, "ikColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "color");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
    objc_msgSend(v11, "setObject:forKey:", v14, *MEMORY[0x1E0DC1140]);
  if (!objc_msgSend(v11, "count"))
  {

    v11 = 0;
  }

  return v11;
}

BOOL _SKUIScrollViewIsCompetingWithScrollView(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  int v6;
  int v7;
  void *v8;
  int v9;
  int CanScrollVertically;
  _BOOL8 v12;

  v3 = a1;
  v4 = a2;
  objc_msgSend(v3, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SKUIScrollViewCanScrollHorizontally(v3))
    v6 = objc_msgSend(v5, "_canPanHorizontally");
  else
    v6 = 0;
  if (_SKUIScrollViewCanScrollVertically(v3))
    v7 = objc_msgSend(v5, "_canPanVertically");
  else
    v7 = 0;
  objc_msgSend(v4, "panGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (_SKUIScrollViewCanScrollHorizontally(v4))
    v9 = objc_msgSend(v8, "_canPanHorizontally");
  else
    v9 = 0;
  CanScrollVertically = _SKUIScrollViewCanScrollVertically(v4);
  if (CanScrollVertically)
    CanScrollVertically = objc_msgSend(v8, "_canPanVertically");
  v12 = v6 != v9 && v7 != CanScrollVertically;

  return v12;
}

uint64_t _SKUIScrollViewWantsToBeginTrackingImmediately(void *a1)
{
  id v1;
  id v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
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
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  BOOL v37;
  uint64_t v38;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;

  v1 = a1;
  if ((objc_msgSend(v1, "isDecelerating") & 1) == 0)
  {
    v2 = v1;
    if ((objc_msgSend(v2, "isDecelerating") & 1) == 0
      && (objc_msgSend(v2, "isDragging") & 1) == 0
      && (objc_msgSend(v2, "isTracking") & 1) == 0)
    {

LABEL_29:
      v38 = 0;
      goto LABEL_22;
    }
    objc_msgSend(v2, "contentOffset");
    v43 = v4;
    v44 = v3;
    objc_msgSend(v2, "traitCollection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayScale");
    v7 = v6;

    if (v7 < 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "scale");
      v7 = v9;

    }
    objc_msgSend(v2, "contentInset");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    objc_msgSend(v2, "contentSize");
    v20 = -v13;
    if (v7 == 1.0 || v7 == 0.0)
    {
      v22 = round(v20);
      v24 = round(-v11);
      v26 = round(v17 + v18);
      v42 = round(v15 + v19);
      v30 = round(v17 + v13 + v18);
      v33 = round(v15 + v11 + v19);
    }
    else
    {
      v21 = floor(v20);
      v22 = v21 + round(v7 * (v20 - v21)) / v7;
      v23 = floor(-v11);
      v24 = v23 + round(v7 * (-v11 - v23)) / v7;
      v25 = floor(v17 + v18);
      v26 = v25 + round(v7 * (v17 + v18 - v25)) / v7;
      v27 = floor(v15 + v19);
      v42 = v27 + round(v7 * (v15 + v19 - v27)) / v7;
      v28 = v17 + v13 + v18;
      v29 = floor(v28);
      v30 = v29 + round(v7 * (v28 - v29)) / v7;
      v31 = v15 + v11 + v19;
      v32 = floor(v31);
      v33 = v32 + round(v7 * (v31 - v32)) / v7;
    }
    objc_msgSend(v2, "bounds");
    if (v44 < v22 || (v34 >= v30 ? (v36 = v30) : (v36 = v34), v44 <= v26 - v36 ? (v37 = v43 < v24) : (v37 = 1), v37))
    {

    }
    else
    {
      if (v35 >= v33)
        v40 = v33;
      else
        v40 = v35;
      v41 = v42 - v40;

      if (v43 <= v41)
        goto LABEL_29;
    }
  }
  v38 = objc_msgSend(v1, "tracksImmediatelyWhileDecelerating");
LABEL_22:

  return v38;
}

void sub_1BBE5EC48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t _SKUIScrollViewCanScrollHorizontally(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "contentSize");
  v7 = v6;
  objc_msgSend(v1, "bounds");
  if (v5 + v3 + v7 <= v8)
  {
    if (objc_msgSend(v1, "alwaysBounceHorizontal"))
      v9 = objc_msgSend(v1, "bouncesHorizontally");
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t _SKUIScrollViewCanScrollVertically(void *a1)
{
  id v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  uint64_t v9;

  v1 = a1;
  objc_msgSend(v1, "contentInset");
  v3 = v2;
  v5 = v4;
  objc_msgSend(v1, "contentSize");
  v7 = v6;
  objc_msgSend(v1, "bounds");
  if (v5 + v3 + v7 <= v8)
  {
    if (objc_msgSend(v1, "alwaysBounceVertical"))
      v9 = objc_msgSend(v1, "bouncesVertically");
    else
      v9 = 0;
  }
  else
  {
    v9 = 1;
  }

  return v9;
}

uint64_t sub_1BBE5EF1C()
{
  uint64_t v0;

  v0 = type metadata accessor for SKLogger();
  __swift_allocate_value_buffer(v0, qword_1EF3ED870);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EF3ED870);
  return sub_1BBEA091C();
}

uint64_t *__swift_allocate_value_buffer(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  if ((*(_DWORD *)(*(_QWORD *)(a1 - 8) + 80) & 0x20000) != 0)
  {
    v3 = swift_slowAlloc();
    *a2 = v3;
    return (uint64_t *)v3;
  }
  return a2;
}

uint64_t type metadata accessor for SKLogger()
{
  uint64_t result;

  result = qword_1EF3ECED0;
  if (!qword_1EF3ECED0)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for SKUIReviewInAppControllerResult()
{
  unint64_t ForeignTypeMetadata;
  uint64_t v1;

  if (!qword_1EF3ECE70)
  {
    ForeignTypeMetadata = swift_getForeignTypeMetadata();
    if (!v1)
      atomic_store(ForeignTypeMetadata, (unint64_t *)&qword_1EF3ECE70);
  }
}

uint64_t sub_1BBE5F068(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBEA0928();
  return (**(uint64_t (***)(uint64_t, uint64_t, uint64_t))(v4 - 8))(a1, a2, v4);
}

uint64_t sub_1BBE5F0A4(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1BBEA0928();
  return (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
}

uint64_t sub_1BBE5F0D8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBEA0928();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BBE5F11C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBEA0928();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 24))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BBE5F160(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBEA0928();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BBE5F1A4(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1BBEA0928();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a1, a2, v4);
  return a1;
}

uint64_t sub_1BBE5F1E8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BBE5F1F4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_1();
  return __swift_getEnumTagSinglePayload(v1, v0, v2);
}

uint64_t __swift_getEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a3 - 8) + 48))();
}

uint64_t sub_1BBE5F228()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1BBE5F234()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v2 = OUTLINED_FUNCTION_0_1();
  return __swift_storeEnumTagSinglePayload(v1, v0, v0, v2);
}

uint64_t __swift_storeEnumTagSinglePayload(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a4 - 8) + 56))();
}

uint64_t sub_1BBE5F26C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1BBEA0928();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

void sub_1BBE5F2D4(void *a1, uint64_t a2, uint64_t a3, void *a4, void (**a5)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  os_log_type_t v34;
  NSObject *v35;
  os_log_type_t v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  id v43;
  id v44;
  uint64_t v45;
  os_log_type_t v46;
  NSObject *v47;
  os_log_type_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;

  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF08);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = type metadata accessor for SKLogger();
  v13 = MEMORY[0x1E0C80A78](v12);
  v15 = (char *)&v53 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v53 - v16;
  v18 = swift_allocObject();
  *(_QWORD *)(v18 + 16) = a5;
  if (!a3)
  {
    v29 = sub_1BBEA094C();
    v31 = v30;
    objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    _Block_copy(a5);
    v32 = sub_1BBE607E0(v29, v31, 7, 0);
    if (qword_1EF3ECE68 != -1)
      swift_once();
    v33 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF3ED870);
    sub_1BBE6088C(v33, (uint64_t)v17);
    v34 = sub_1BBEA09A0();
    v35 = sub_1BBEA0910();
    v36 = v34;
    if (os_log_type_enabled(v35, v34))
    {
      v37 = swift_slowAlloc();
      v38 = swift_slowAlloc();
      v54 = v38;
      *(_DWORD *)v37 = 136446466;
      v53 = sub_1BBE60998(0, 0xE000000000000000, &v54);
      sub_1BBEA09AC();
      *(_WORD *)(v37 + 12) = 2082;
      v53 = sub_1BBE60998(0xD000000000000037, 0x80000001BBF06C50, &v54);
      sub_1BBEA09AC();
      _os_log_impl(&dword_1BBB8C000, v35, v36, "%{public}s%{public}s", (uint8_t *)v37, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCE70E4](v38, -1, -1);
      MEMORY[0x1BCCE70E4](v37, -1, -1);
    }

    sub_1BBE608D0((uint64_t)v17);
    v39 = v32;
    goto LABEL_19;
  }
  if (!a1)
  {
    _Block_copy(a5);
LABEL_14:
    v40 = sub_1BBEA094C();
    v42 = v41;
    v43 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
    v44 = sub_1BBE607E0(v40, v42, 0, 0);
    if (qword_1EF3ECE68 != -1)
      swift_once();
    v45 = __swift_project_value_buffer(v12, (uint64_t)qword_1EF3ED870);
    sub_1BBE6088C(v45, (uint64_t)v15);
    v46 = sub_1BBEA09A0();
    v47 = sub_1BBEA0910();
    v48 = v46;
    if (os_log_type_enabled(v47, v46))
    {
      v49 = swift_slowAlloc();
      v50 = swift_slowAlloc();
      v54 = v50;
      *(_DWORD *)v49 = 136446466;
      v53 = sub_1BBE60998(0, 0xE000000000000000, &v54);
      sub_1BBEA09AC();
      *(_WORD *)(v49 + 12) = 2082;
      v53 = sub_1BBE60998(0xD00000000000002BLL, 0x80000001BBF06C90, &v54);
      sub_1BBEA09AC();
      _os_log_impl(&dword_1BBB8C000, v47, v48, "%{public}s%{public}s", (uint8_t *)v49, 0x16u);
      swift_arrayDestroy();
      MEMORY[0x1BCCE70E4](v50, -1, -1);
      MEMORY[0x1BCCE70E4](v49, -1, -1);
    }

    sub_1BBE608D0((uint64_t)v15);
    v39 = v44;
LABEL_19:
    v51 = v39;
    v52 = (void *)sub_1BBEA08C8();
    ((void (**)(_QWORD, _QWORD, void *))a5)[2](a5, 0, v52);
    swift_release();

    goto LABEL_20;
  }
  _Block_copy(a5);
  swift_bridgeObjectRetain();
  v19 = objc_msgSend(a1, sel_view);
  if (v19)
  {
    v20 = v19;
    v21 = objc_msgSend(v19, sel_window);

    if (v21)
    {
      v22 = objc_msgSend(v21, sel_windowScene);

      if (v22)
      {
        v23 = objc_msgSend((id)objc_opt_self(), sel_currentProcess);
        v24 = objc_allocWithZone((Class)sub_1BBEA08EC());
        v25 = sub_1BBEA08E0();
        v26 = sub_1BBEA0988();
        __swift_storeEnumTagSinglePayload((uint64_t)v11, 1, 1, v26);
        v27 = (_QWORD *)swift_allocObject();
        v27[2] = 0;
        v27[3] = 0;
        v27[4] = a4;
        v27[5] = v25;
        v27[6] = v22;
        v27[7] = sub_1BBE60748;
        v27[8] = v18;
        v28 = a4;
        swift_retain();
        sub_1BBE604B0((uint64_t)v11, (uint64_t)&unk_1EF3ECF18, (uint64_t)v27);
        swift_release();
        swift_release();
LABEL_20:
        _Block_release(a5);
        return;
      }
    }
    swift_bridgeObjectRelease();
    goto LABEL_14;
  }
  _Block_release(a5);
  __break(1u);
}

uint64_t sub_1BBE5F910(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v8;
  _QWORD *v13;

  v13 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v8 + 16) = v13;
  *v13 = v8;
  v13[1] = sub_1BBE61398;
  return sub_1BBE5F98C(a5, a6, a7, a8);
}

uint64_t sub_1BBE5F98C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  uint64_t v5;

  v4[22] = a3;
  v4[23] = a4;
  v4[20] = a1;
  v4[21] = a2;
  v4[24] = type metadata accessor for SKLogger();
  v4[25] = swift_task_alloc();
  v4[26] = swift_task_alloc();
  v4[27] = swift_task_alloc();
  v4[28] = swift_task_alloc();
  v5 = sub_1BBEA08D4();
  v4[29] = v5;
  v4[30] = *(_QWORD *)(v5 - 8);
  v4[31] = swift_task_alloc();
  v4[32] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1BBE5FA4C()
{
  _QWORD *v0;
  id v1;
  _QWORD *v2;
  uint64_t (*v4)(_QWORD, _QWORD, _QWORD, id);

  sub_1BBEA0904();
  swift_allocObject();
  v0[33] = sub_1BBEA08F8();
  sub_1BBE612FC();
  v1 = sub_1BBE60750();
  v0[34] = v1;
  v4 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, id))((int)*MEMORY[0x1E0CFDD58] + MEMORY[0x1E0CFDD58]);
  v2 = (_QWORD *)swift_task_alloc();
  v0[35] = v2;
  *v2 = v0;
  v2[1] = sub_1BBE5FB14;
  return v4(v0[32], v0[21], v0[20], v1);
}

uint64_t sub_1BBE5FB14()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 288) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1BBE5FB78()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  uint64_t v5;
  os_log_type_t v6;
  NSObject *v7;
  os_log_type_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  id *v18;
  id v19;
  uint64_t v20;
  id *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  uint64_t v25;
  os_log_type_t v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  os_log_type_t v33;
  NSObject *v34;
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
  id v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t v54;

  if (qword_1EF3ECE68 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 224);
  v2 = __swift_project_value_buffer(*(_QWORD *)(v0 + 192), (uint64_t)qword_1EF3ED870);
  sub_1BBE6088C(v2, v1);
  OUTLINED_FUNCTION_11();
  sub_1BBEA09C4();
  v3 = v54;
  *(_QWORD *)(v0 + 64) = v53;
  *(_QWORD *)(v0 + 72) = v3;
  sub_1BBEA0958();
  sub_1BBEA09E8();
  v5 = *(_QWORD *)(v0 + 64);
  v4 = *(_QWORD *)(v0 + 72);
  v6 = sub_1BBEA0994();
  OUTLINED_FUNCTION_6();
  v7 = sub_1BBEA0910();
  v8 = v6;
  if (os_log_type_enabled(v7, v6))
  {
    v9 = OUTLINED_FUNCTION_2();
    v10 = OUTLINED_FUNCTION_2();
    v53 = v10;
    *(_DWORD *)v9 = 136446466;
    *(_QWORD *)(v0 + 144) = OUTLINED_FUNCTION_4(v10, v11, v12);
    OUTLINED_FUNCTION_12();
    *(_WORD *)(v9 + 12) = 2082;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 152) = sub_1BBE60998(v5, v4, &v53);
    OUTLINED_FUNCTION_12();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_10(&dword_1BBB8C000, v7, v8, "%{public}s%{public}s", (uint8_t *)v9);
    OUTLINED_FUNCTION_15();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_3();

  v13 = *(_QWORD *)(v0 + 248);
  v14 = *(_QWORD *)(v0 + 256);
  v15 = *(_QWORD *)(v0 + 232);
  v16 = *(_QWORD *)(v0 + 240);
  sub_1BBE608D0(*(_QWORD *)(v0 + 224));
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v16 + 16))(v13, v14, v15);
  v17 = (*(uint64_t (**)(uint64_t, uint64_t))(v16 + 88))(v13, v15);
  if (v17 != *MEMORY[0x1E0CFDCE0])
  {
    if (v17 == *MEMORY[0x1E0CFDCD8])
    {
      v21 = *(id **)(v0 + 248);
      v22 = *(_QWORD *)(v0 + 216);
      OUTLINED_FUNCTION_16(*(_QWORD *)(v0 + 240));
      v19 = *v21;
      sub_1BBE6088C(v2, v22);
      OUTLINED_FUNCTION_11();
      sub_1BBEA09C4();
      v23 = v54;
      *(_QWORD *)(v0 + 32) = v53;
      *(_QWORD *)(v0 + 40) = v23;
      OUTLINED_FUNCTION_9();
      *(_QWORD *)(v0 + 120) = v19;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF40);
      sub_1BBEA09E8();
      v25 = *(_QWORD *)(v0 + 32);
      v24 = *(_QWORD *)(v0 + 40);
      v26 = sub_1BBEA09A0();
      OUTLINED_FUNCTION_6();
      v27 = sub_1BBEA0910();
      if (os_log_type_enabled(v27, v26))
      {
        v28 = OUTLINED_FUNCTION_2();
        v29 = OUTLINED_FUNCTION_2();
        v53 = v29;
        *(_DWORD *)v28 = 136446466;
        *(_QWORD *)(v0 + 128) = OUTLINED_FUNCTION_4(v29, v30, v31);
        sub_1BBEA09AC();
        *(_WORD *)(v28 + 12) = 2082;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 136) = sub_1BBE60998(v25, v24, &v53);
        OUTLINED_FUNCTION_12();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_10(&dword_1BBB8C000, v27, v26, "%{public}s%{public}s", (uint8_t *)v28);
        OUTLINED_FUNCTION_15();
        OUTLINED_FUNCTION_1_1();
      }
      OUTLINED_FUNCTION_3();

      sub_1BBE608D0(*(_QWORD *)(v0 + 216));
    }
    else
    {
      if (v17 == *MEMORY[0x1E0CFDCE8])
      {
        v19 = 0;
        v20 = 1;
        goto LABEL_17;
      }
      sub_1BBE6088C(v2, *(_QWORD *)(v0 + 208));
      OUTLINED_FUNCTION_11();
      sub_1BBEA09C4();
      v32 = v54;
      *(_QWORD *)(v0 + 48) = v53;
      *(_QWORD *)(v0 + 56) = v32;
      OUTLINED_FUNCTION_9();
      sub_1BBEA09E8();
      v33 = sub_1BBEA09A0();
      OUTLINED_FUNCTION_6();
      v34 = sub_1BBEA0910();
      if (os_log_type_enabled(v34, v33))
      {
        v35 = OUTLINED_FUNCTION_2();
        v36 = OUTLINED_FUNCTION_2();
        v53 = v36;
        *(_DWORD *)v35 = 136446466;
        *(_QWORD *)(v0 + 96) = OUTLINED_FUNCTION_4(v36, v37, v38);
        OUTLINED_FUNCTION_14();
        *(_WORD *)(v35 + 12) = 2082;
        v39 = swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 104) = OUTLINED_FUNCTION_13(v39, v40, &v53);
        sub_1BBEA09AC();
        OUTLINED_FUNCTION_3();
        OUTLINED_FUNCTION_10(&dword_1BBB8C000, v34, v33, "%{public}s%{public}s", (uint8_t *)v35);
        OUTLINED_FUNCTION_7();
        OUTLINED_FUNCTION_1_1();
      }
      OUTLINED_FUNCTION_3();

      v42 = *(_QWORD *)(v0 + 240);
      v41 = *(_QWORD *)(v0 + 248);
      v43 = *(_QWORD *)(v0 + 232);
      sub_1BBE608D0(*(_QWORD *)(v0 + 208));
      v44 = sub_1BBEA094C();
      v46 = v45;
      v47 = objc_allocWithZone(MEMORY[0x1E0CB35C8]);
      v19 = sub_1BBE607E0(v44, v46, 0, 0);
      (*(void (**)(uint64_t, uint64_t))(v42 + 8))(v41, v43);
    }
    v20 = 0;
    goto LABEL_17;
  }
  v18 = *(id **)(v0 + 248);
  OUTLINED_FUNCTION_16(*(_QWORD *)(v0 + 240));

  v19 = 0;
  v20 = 3;
LABEL_17:
  v48 = *(void **)(v0 + 272);
  v49 = *(_QWORD *)(v0 + 256);
  v50 = *(_QWORD *)(v0 + 232);
  v51 = *(_QWORD *)(v0 + 240);
  (*(void (**)(uint64_t, id))(v0 + 176))(v20, v19);
  swift_release();

  (*(void (**)(uint64_t, uint64_t))(v51 + 8))(v49, v50);
  OUTLINED_FUNCTION_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BBE60218()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  os_log_type_t v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (*v10)(_QWORD, void *);
  id v11;
  uint64_t v13[2];

  if (qword_1EF3ECE68 != -1)
    swift_once();
  v1 = *(_QWORD *)(v0 + 288);
  v2 = *(_QWORD *)(v0 + 200);
  v3 = __swift_project_value_buffer(*(_QWORD *)(v0 + 192), (uint64_t)qword_1EF3ED870);
  sub_1BBE6088C(v3, v2);
  v13[0] = 0;
  v13[1] = 0xE000000000000000;
  sub_1BBEA09C4();
  *(_QWORD *)(v0 + 16) = 0;
  *(_QWORD *)(v0 + 24) = 0xE000000000000000;
  sub_1BBEA0958();
  *(_QWORD *)(v0 + 112) = v1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF40);
  sub_1BBEA09E8();
  sub_1BBEA0958();
  v4 = sub_1BBEA09A0();
  OUTLINED_FUNCTION_6();
  v5 = sub_1BBEA0910();
  if (os_log_type_enabled(v5, v4))
  {
    v6 = OUTLINED_FUNCTION_2();
    v13[0] = OUTLINED_FUNCTION_2();
    *(_DWORD *)v6 = 136446466;
    *(_QWORD *)(v0 + 88) = sub_1BBE60998(0, 0xE000000000000000, v13);
    OUTLINED_FUNCTION_14();
    *(_WORD *)(v6 + 12) = 2082;
    v7 = swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 80) = OUTLINED_FUNCTION_13(v7, v8, v13);
    OUTLINED_FUNCTION_14();
    OUTLINED_FUNCTION_3();
    OUTLINED_FUNCTION_10(&dword_1BBB8C000, v5, v4, "%{public}s%{public}s", (uint8_t *)v6);
    OUTLINED_FUNCTION_7();
    OUTLINED_FUNCTION_1_1();
  }
  OUTLINED_FUNCTION_3();

  v9 = *(void **)(v0 + 288);
  v10 = *(void (**)(_QWORD, void *))(v0 + 176);
  sub_1BBE608D0(*(_QWORD *)(v0 + 200));
  v11 = v9;
  v10(0, v9);
  swift_release();

  OUTLINED_FUNCTION_8();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BBE604B0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;

  v6 = sub_1BBEA0988();
  if (__swift_getEnumTagSinglePayload(a1, 1, v6) == 1)
  {
    sub_1BBE61204(a1);
  }
  else
  {
    sub_1BBEA097C();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(a1, v6);
  }
  if (*(_QWORD *)(a3 + 16))
  {
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1BBEA0970();
    swift_unknownObjectRelease();
  }
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = a2;
  *(_QWORD *)(v7 + 24) = a3;
  return swift_task_create();
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1BCCE7090]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

void sub_1BBE606CC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  id v6;

  if (a2)
    v5 = sub_1BBEA08C8();
  else
    v5 = 0;
  v6 = (id)v5;
  (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, a1);

}

uint64_t sub_1BBE60724()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1BBE60748(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  sub_1BBE606CC(a1, a2, *(_QWORD *)(v2 + 16));
}

id sub_1BBE60750()
{
  void *v0;
  void *v1;
  id v2;

  v0 = (void *)sub_1BBEA0940();
  swift_bridgeObjectRelease();
  v1 = (void *)sub_1BBEA0940();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend((id)swift_getObjCClassFromMetadata(), sel_bagForProfile_profileVersion_, v0, v1);

  return v2;
}

id sub_1BBE607E0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v4;
  void *v7;
  void *v8;
  id v9;

  v7 = (void *)sub_1BBEA0940();
  swift_bridgeObjectRelease();
  if (a4)
  {
    v8 = (void *)sub_1BBEA0934();
    swift_bridgeObjectRelease();
  }
  else
  {
    v8 = 0;
  }
  v9 = objc_msgSend(v4, sel_initWithDomain_code_userInfo_, v7, a3, v8);

  return v9;
}

uint64_t sub_1BBE6088C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1BBE608D0(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SKLogger();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBE6090C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1BBE60970;
  return v6(a1);
}

uint64_t sub_1BBE60970()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

uint64_t sub_1BBE60998(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[3];
  uint64_t ObjectType;

  v6 = sub_1BBE60A68(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1BBE61358((uint64_t)v12, *a3);
      *a3 = v9 + 32;
    }
  }
  else
  {
    ObjectType = MEMORY[0x1E0DEC2B8];
    v12[0] = a1;
    v12[1] = a2;
    v10 = *a3;
    if (*a3)
    {
      sub_1BBE61358((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1BBE60A68(_QWORD *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0 && __dst && a3 - (uint64_t)__dst > (uint64_t)(HIBYTE(a6) & 0xF))
    {
      __src[0] = a5;
      __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
      sub_1BBE60BBC((char *)__src, HIBYTE(a6) & 0xF, __dst);
      sub_1BBEA09B8();
      result = 0;
      *a1 = __dst;
      return result;
    }
    goto LABEL_11;
  }
  if ((a6 & 0x1000000000000000) != 0)
  {
LABEL_11:
    result = sub_1BBE60C80(a5, a6);
    *a1 = v11;
    return result;
  }
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
  }
  else
  {
    v8 = sub_1BBEA09DC();
    if (!v8)
    {
      result = sub_1BBEA09F4();
      __break(1u);
      return result;
    }
  }
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

void *sub_1BBE60BBC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1BBEA0A00();
  __break(1u);
  return result;
}

uint64_t sub_1BBE60C80(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1BBE60D14(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = (uint64_t)sub_1BBE60EE8(0, *(_QWORD *)(v2 + 16) + 1, 1, v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = (uint64_t)sub_1BBE60EE8((char *)(v3 > 1), v4 + 1, 1, v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1BBE60D14(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
  {
    v2 = sub_1BBEA0964();
    if (v2)
      goto LABEL_6;
    return MEMORY[0x1E0DEE9D8];
  }
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
LABEL_6:
  v3 = sub_1BBE60E84(v2, 0);
  if ((v2 & 0x8000000000000000) == 0)
  {
    v4 = v3;
    v5 = sub_1BBEA09D0();
    if ((v6 & 1) != 0 || v5 != v2)
      goto LABEL_14;
    return (uint64_t)v4;
  }
  sub_1BBEA0A00();
  __break(1u);
LABEL_14:
  result = sub_1BBEA09F4();
  __break(1u);
  return result;
}

_QWORD *sub_1BBE60E84(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  size_t v5;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF48);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

char *sub_1BBE60EE8(char *result, int64_t a2, char a3, uint64_t a4)
{
  char v5;
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;

  v5 = (char)result;
  if ((a3 & 1) != 0)
  {
    v6 = *(_QWORD *)(a4 + 24);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        return result;
      }
      v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
      if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
        v7 = a2;
    }
  }
  else
  {
    v7 = a2;
  }
  v8 = *(_QWORD *)(a4 + 16);
  if (v7 <= v8)
    v9 = *(_QWORD *)(a4 + 16);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF48);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * v11 - 64;
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v12 = v10 + 32;
  v13 = (char *)(a4 + 32);
  if ((v5 & 1) != 0)
  {
    sub_1BBE61080(v13, v8, v12);
    *(_QWORD *)(a4 + 16) = 0;
  }
  else
  {
    sub_1BBE60FBC(v13, v8, v12);
  }
  swift_bridgeObjectRelease();
  return v10;
}

void *sub_1BBE60FBC(char *__src, size_t __n, char *__dst)
{
  void *result;

  if ((__n & 0x8000000000000000) == 0 && (&__dst[__n] <= __src || &__src[__n] <= __dst))
    return memcpy(__dst, __src, __n);
  result = (void *)sub_1BBEA0A00();
  __break(1u);
  return result;
}

char *sub_1BBE61080(char *__src, size_t __len, char *__dst)
{
  if ((__len & 0x8000000000000000) != 0)
  {
    __src = (char *)sub_1BBEA0A00();
    __break(1u);
  }
  else if (__dst != __src || &__src[__len] <= __dst)
  {
    return (char *)memmove(__dst, __src, __len);
  }
  return __src;
}

uint64_t sub_1BBE61100()
{
  id *v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BBE61144(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = v1[5];
  v8 = v1[6];
  v9 = v1[7];
  v10 = v1[8];
  v11 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v11;
  *v11 = v2;
  v11[1] = sub_1BBE611D8;
  return sub_1BBE5F910(a1, v4, v5, v6, v7, v8, v9, v10);
}

uint64_t sub_1BBE611D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1BBE61204(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EF3ECF08);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1BBE61244()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1BBE61268(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1BBE612D8;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1EF3ECF20 + dword_1EF3ECF20))(a1, v4);
}

uint64_t sub_1BBE612D8()
{
  uint64_t v0;

  OUTLINED_FUNCTION_0_2();
  return OUTLINED_FUNCTION_5(*(uint64_t (**)(void))(v0 + 8));
}

unint64_t sub_1BBE612FC()
{
  unint64_t result;

  result = qword_1EF3ECF38;
  if (!qword_1EF3ECF38)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EF3ECF38);
  }
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

uint64_t sub_1BBE61358(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t OUTLINED_FUNCTION_3()
{
  return swift_bridgeObjectRelease_n();
}

uint64_t OUTLINED_FUNCTION_4(uint64_t a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  return sub_1BBE60998(0, 0xE000000000000000, (uint64_t *)va);
}

uint64_t OUTLINED_FUNCTION_5(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t OUTLINED_FUNCTION_6()
{
  return swift_bridgeObjectRetain_n();
}

uint64_t OUTLINED_FUNCTION_7()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_8()
{
  return swift_task_dealloc();
}

uint64_t OUTLINED_FUNCTION_9()
{
  return sub_1BBEA0958();
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_impl(a1, a2, a3, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_12()
{
  return sub_1BBEA09AC();
}

uint64_t OUTLINED_FUNCTION_13(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  unint64_t v3;
  uint64_t v4;

  return sub_1BBE60998(v4, v3, a3);
}

uint64_t OUTLINED_FUNCTION_14()
{
  return sub_1BBEA09AC();
}

uint64_t OUTLINED_FUNCTION_15()
{
  return swift_arrayDestroy();
}

uint64_t OUTLINED_FUNCTION_16@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return (*(uint64_t (**)(uint64_t))(a1 + 96))(v1);
}

uint64_t sub_1BBE61444()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void SKUIMediaQueryNetworkTypeString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIAppearanceStyleBarButtonItem_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIAppearanceStyleNavigationBar_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUITintedImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIBundle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIAllowsLandscapePhone_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIImageExistsWithResourceName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIImageWithResourceName_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceImageSetRegisterWithBundle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceImageSetRegisterWithBundleAlwaysTemplate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUISetExternalResourceManager_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILinkArrowImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILinkArrowButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIMoreDisclosureImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUISearchNoResultsImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIRangesForFormatString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIStoreAssetResourceLoaderConfigureWithDelegate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUICacheCodingDecodeArray_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUICacheCodingEncodeArray_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIColorWithHTMLCode_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIColorSchemeStyleForColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIBorderColorWithBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIColorForStyleWithBrightness_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIColorByAdjustingBrightness_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIColorForStyleWithAlpha_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIColorWithAlpha_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIHexValueWithString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUITableViewGroupedBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIIconColorsForColorScheme_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIIconFrameForIconSize_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

uint64_t getCNComposeRecipientViewDidChangeNotification_cold_1()
{
  uint64_t v0;

  dlerror();
  v0 = abort_report_np();
  return -[SKUIURLResolverDataConsumer objectForData:response:error:].cold.1(v0);
}

void SKUIImageTreatmentForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIErrorDocumentTitle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIPageComponentClassForComponentType_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIPageComponentTypeForBlockType_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIPageComponentTypeForFeaturedContentKind_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIPageComponentFontWeightForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIStorePageItemsWithStorePlatformDictionary_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIStorePageTypeIsProductPage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIBadgeImageFromText_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIBadgeImageFromText";
}

void SKUITrackListColumnIdentifierForViewElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementDateWithString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementTextDeadlockFix_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsDeviceHasASTCSupport_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsMatchViewBorderToStroke_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIGraphicsMatchViewBorderToStroke";
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsCreateASTCDataFromImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsCreateASTCDataFromImage_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsCreateASTCDataFromBitmapContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIGraphicsGetASTCImageFromCurrentImageContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceLoaderGetNameForObject_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceLoadCountMapClear_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceLoadCountMapDecrement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceLoadCountMapGet_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIResourceLoadCountMapIncrement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

uint64_t __getAMSURLParserClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAMSUIDynamicViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIDynamicViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getAMSUIWebViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getAMSUIWebViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SKUIRedeemInputViewController initWithRedeemCategory:].cold.1(v0);
}

void SKUIChartGetTitle_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIChartGetTitle";
}

void CGRectWithFlippedOriginRelativeToBoundingRect_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "CGRectWithFlippedOriginRelativeToBoundingRect";
}

void SKUIImageRectForBounds_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIImageRectForBounds";
  OUTLINED_FUNCTION_1();
}

void SKUIImageRectForBoundsAndPadding_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewSetBottomBorderColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewSetTopBorderColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILockupViewTypeForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIFacebookViewElementTypeForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChildren_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementAccumulatePersonalizationLibraryItemsForChild_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIViewElementAccumulatePersonalizationLibraryItemsForChild";
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementAlignmentForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementFontWithStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementPlainColorWithIKColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementPlainColorWithStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementNSTextAlignmentForIKElementAlignment_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementMarginForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIViewElementPaddingForStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIConsoleLogFormat_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIConsoleLogObjects_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIInitializeDOMFeatureFactory_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIRegisterDOMFeatureFactory_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScrollViewLayoutTopBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIScrollViewLayoutTopBackgroundColorForProductPage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIScrollViewSetTopBackgroundColor_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

uint64_t __getEAGLContextClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return +[SKUIProductPageAction actionWithType:].cold.1(v0);
}

void _SKUIIndexBarControlInitialization_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "_SKUIIndexBarControlInitialization";
}

void SKUIGetFamilyMemberImage_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIConfigureDownloadsCellView_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIDownloadsStatusString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIFontLimitedPreferredFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIFontPreferredFontForTextStyle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIButtonViewTypeForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIIKViewElementTypeIsButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIInitializeViewElementStyleFactory_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIInitializeViewElementStyleFactory";
}

void SKUIWishlistItemPropertiesWithItem_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIWishlistOperationQueue_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUITracklistAttributedStringForButton_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUITracklistAttributedStringForLabel_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIStringFromProductLockupLayoutSizing_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIStringFromProductLockupLayoutSizing";
}

void SKUINearMeIsEnabledForAuthorizationStatus_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILocationIsAccurate_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

uint64_t __getAMSBagClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SKUIWishlistViewController initWithNibName:bundle:].cold.1(v0);
}

void SKUIRequiredVisibilitySetForLocalizedIndexedCollation_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIIndexBarIDForLocaleStandardIndexBarEntrySectionTitle_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIInitializeViewElementFactory_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIInitializeViewElementFactory";
}

void SKUIPopoverBackdropViewForView_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIPopoverBackdropViewForView";
}

void SKUIPhysicalCircleConstantsWithTraitCollection_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIPhysicalCircleConstantsWithTraitCollection";
}

void SKUIMessageBannerAttributedString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUICardElementTypeForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIMetricsMediaEventTypeForPlaybackState_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIIndexBarEntryDescriptorForIndexBarEntryViewElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUISetShouldReverseLayoutDirectionWithContext_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIRectByApplyingUserInterfaceLayoutDirectionInRect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIRectByApplyingStoreUserInterfaceLayoutDirectionInRect_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIRectByRemovingUserInterfaceLayoutDirectionInRect_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUIRectByRemovingUserInterfaceLayoutDirectionInRect";
  OUTLINED_FUNCTION_1();
}

void SKUISpacePageComponentHeightForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIAttributedStringGetLineHeight_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIGetLayoutProperties_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIScaleSizeToFit_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIProductPageFragmentWithURL_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIVideoPreviewPlayPlayableVideoWithAsset_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIVideoPreviewPlayPlayableAsset_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIVideoPreviewDismissOnEnterBackground_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIVideoPreviewObservePlayer_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUICollectionViewUpdatePerspectiveCells_cold_1()
{
  int v0;
  const char *v1;
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v0 = 136446210;
  v1 = "SKUICollectionViewUpdatePerspectiveCells";
}

void SKUIDecodeRestorableStateWithCoder_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIEncodeRestorableStateWithCoder_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUINavigationControllerWillShowViewController_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUINavigationControllerDidShowViewController_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIScrollViewSetPinnedHeaderContentInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUIScrollViewSetDefaultContentInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILayoutGuideInsets_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILabelViewStyleForString_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

void SKUILabelStringAttributesWithSpanElement_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1();
}

uint64_t sub_1BBEA08C8()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1BBEA08D4()
{
  return MEMORY[0x1E0CFDCF0]();
}

uint64_t sub_1BBEA08E0()
{
  return MEMORY[0x1E0CFDD18]();
}

uint64_t sub_1BBEA08EC()
{
  return MEMORY[0x1E0CFDD20]();
}

uint64_t sub_1BBEA08F8()
{
  return MEMORY[0x1E0CFDD60]();
}

uint64_t sub_1BBEA0904()
{
  return MEMORY[0x1E0CFDD68]();
}

uint64_t sub_1BBEA0910()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1BBEA091C()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1BBEA0928()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1BBEA0934()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_1BBEA0940()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1BBEA094C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1BBEA0958()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1BBEA0964()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1BBEA0970()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1BBEA097C()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1BBEA0988()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1BBEA0994()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_1BBEA09A0()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1BBEA09AC()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1BBEA09B8()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1BBEA09C4()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1BBEA09D0()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1BBEA09DC()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1BBEA09E8()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_1BBEA09F4()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1BBEA0A00()
{
  return MEMORY[0x1E0DECD70]();
}

CFTimeInterval CACurrentMediaTime(void)
{
  CFTimeInterval result;

  MEMORY[0x1E0CD2388]();
  return result;
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2640](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DRotate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2658](retstr, t, angle, x, y, z);
}

CATransform3D *__cdecl CATransform3DScale(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2668](retstr, t, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DTranslate(CATransform3D *__return_ptr retstr, CATransform3D *t, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x1E0CD2678](retstr, t, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFArrayRef CFArrayCreate(CFAllocatorRef allocator, const void **values, CFIndex numValues, const CFArrayCallBacks *callBacks)
{
  return (CFArrayRef)MEMORY[0x1E0C97D20](allocator, values, numValues, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFAttributedStringRef CFAttributedStringCreate(CFAllocatorRef alloc, CFStringRef str, CFDictionaryRef attributes)
{
  return (CFAttributedStringRef)MEMORY[0x1E0C97DF0](alloc, str, attributes);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

CFNotificationCenterRef CFNotificationCenterGetDistributedCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988C8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x1E0C98A70](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BE8](rl, observer, mode);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

CFRunLoopObserverRef CFRunLoopObserverCreateWithHandler(CFAllocatorRef allocator, CFOptionFlags activities, Boolean repeats, CFIndex order, void *block)
{
  return (CFRunLoopObserverRef)MEMORY[0x1E0C98C68](allocator, activities, repeats, order, block);
}

void CFRunLoopRemoveObserver(CFRunLoopRef rl, CFRunLoopObserverRef observer, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C88](rl, observer, mode);
}

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

uint64_t CFURLCacheRemoveAllCachedResponses()
{
  return MEMORY[0x1E0C92910]();
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

CGAffineTransform *__cdecl CGAffineTransformMakeRotation(CGAffineTransform *__return_ptr retstr, CGFloat angle)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD0](retstr, angle);
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

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1E0C9BB48](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGFloat CGColorGetAlpha(CGColorRef color)
{
  CGFloat result;

  MEMORY[0x1E0C9BCF8](color);
  return result;
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorRef CGColorRetain(CGColorRef color)
{
  return (CGColorRef)MEMORY[0x1E0C9BD68](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCProfile(CFDataRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE48](data);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextAddArc(CGContextRef c, CGFloat x, CGFloat y, CGFloat radius, CGFloat startAngle, CGFloat endAngle, int clockwise)
{
  MEMORY[0x1E0C9BFB0](c, *(_QWORD *)&clockwise, x, y, radius, startAngle, endAngle);
}

void CGContextAddEllipseInRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFC8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9BFD0](c, x, y);
}

void CGContextBeginPath(CGContextRef c)
{
  MEMORY[0x1E0C9C000](c);
}

void CGContextBeginTransparencyLayer(CGContextRef c, CFDictionaryRef auxiliaryInfo)
{
  MEMORY[0x1E0C9C008](c, auxiliaryInfo);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x1E0C9C028](c);
}

void CGContextClipToRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C038](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextClosePath(CGContextRef c)
{
  MEMORY[0x1E0C9C048](c);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawLinearGradient(CGContextRef c, CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C198](c, gradient, *(_QWORD *)&options, (__n128)startPoint, *(__n128 *)&startPoint.y, (__n128)endPoint, *(__n128 *)&endPoint.y);
}

void CGContextDrawRadialGradient(CGContextRef c, CGGradientRef gradient, CGPoint startCenter, CGFloat startRadius, CGPoint endCenter, CGFloat endRadius, CGGradientDrawingOptions options)
{
  MEMORY[0x1E0C9C1D0](c, gradient, *(_QWORD *)&options, (__n128)startCenter, *(__n128 *)&startCenter.y, startRadius, (__n128)endCenter, *(__n128 *)&endCenter.y, endRadius);
}

void CGContextEndTransparencyLayer(CGContextRef c)
{
  MEMORY[0x1E0C9C200](c);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C330](c, x, y);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextRestoreGState(CGContextRef c)
{
  MEMORY[0x1E0C9C370](c);
}

void CGContextSaveGState(CGContextRef c)
{
  MEMORY[0x1E0C9C388](c);
}

void CGContextScaleCTM(CGContextRef c, CGFloat sx, CGFloat sy)
{
  MEMORY[0x1E0C9C390](c, sx, sy);
}

void CGContextSetBlendMode(CGContextRef c, CGBlendMode mode)
{
  MEMORY[0x1E0C9C3C8](c, *(_QWORD *)&mode);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x1E0C9C458](c, *(_QWORD *)&quality);
}

void CGContextSetShadowWithColor(CGContextRef c, CGSize offset, CGFloat blur, CGColorRef color)
{
  MEMORY[0x1E0C9C4C0](c, color, (__n128)offset, *(__n128 *)&offset.height, blur);
}

void CGContextSetTextMatrix(CGContextRef c, CGAffineTransform *t)
{
  MEMORY[0x1E0C9C530](c, t);
}

void CGContextSetTextPosition(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x1E0C9C538](c, x, y);
}

void CGContextTranslateCTM(CGContextRef c, CGFloat tx, CGFloat ty)
{
  MEMORY[0x1E0C9C588](c, tx, ty);
}

CGGradientRef CGGradientCreateWithColorComponents(CGColorSpaceRef space, const CGFloat *components, const CGFloat *locations, size_t count)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA80](space, components, locations, count);
}

CGGradientRef CGGradientCreateWithColors(CGColorSpaceRef space, CFArrayRef colors, const CGFloat *locations)
{
  return (CGGradientRef)MEMORY[0x1E0C9CA90](space, colors, locations);
}

void CGGradientRelease(CGGradientRef gradient)
{
  MEMORY[0x1E0C9CAC0](gradient);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

CGImageRef CGImageCreateWithImageInRect(CGImageRef image, CGRect rect)
{
  return (CGImageRef)MEMORY[0x1E0C9CBA8](image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

void CGPathAddRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2C8](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGPathRef CGPathCreateWithEllipseInRect(CGRect rect, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D3C0](transform, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGPathGetBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D3F0](path);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
  return result;
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

CGRect CGRectIntegral(CGRect rect)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D5F0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  result.size.height = v4;
  result.size.width = v3;
  result.origin.y = v2;
  result.origin.x = v1;
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

CGRect CGRectOffset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x1E0C9D630]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
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

CMTime *__cdecl CMTimeMakeWithSeconds(CMTime *__return_ptr retstr, Float64 seconds, int32_t preferredTimescale)
{
  return (CMTime *)MEMORY[0x1E0C9F330](retstr, *(_QWORD *)&preferredTimescale, seconds);
}

uint64_t CPPhoneNumberCopyActiveCountryCode()
{
  return MEMORY[0x1E0CFA330]();
}

uint64_t CPPhoneNumberCopyFormattedStringForTextMessage()
{
  return MEMORY[0x1E0CFA350]();
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

CTFontRef CTFontCreateWithName(CFStringRef name, CGFloat size, const CGAffineTransform *matrix)
{
  return (CTFontRef)MEMORY[0x1E0CA7A88](name, matrix, size);
}

uint64_t CTFontDescriptorCreateWithTextStyle()
{
  return MEMORY[0x1E0CA7B18]();
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

void CTFrameGetLineOrigins(CTFrameRef frame, CFRange range, CGPoint *origins)
{
  MEMORY[0x1E0CA7DA8](frame, range.location, range.length, origins);
}

CFArrayRef CTFrameGetLines(CTFrameRef frame)
{
  return (CFArrayRef)MEMORY[0x1E0CA7DB0](frame);
}

CGPathRef CTFrameGetPath(CTFrameRef frame)
{
  return (CGPathRef)MEMORY[0x1E0CA7DB8](frame);
}

CFRange CTFrameGetVisibleStringRange(CTFrameRef frame)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA7DC8](frame);
  result.length = v2;
  result.location = v1;
  return result;
}

CTFrameRef CTFramesetterCreateFrame(CTFramesetterRef framesetter, CFRange stringRange, CGPathRef path, CFDictionaryRef frameAttributes)
{
  return (CTFrameRef)MEMORY[0x1E0CA7DD8](framesetter, stringRange.location, stringRange.length, path, frameAttributes);
}

CTFramesetterRef CTFramesetterCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTFramesetterRef)MEMORY[0x1E0CA7DE0](attrString);
}

CGSize CTFramesetterSuggestFrameSizeWithConstraints(CTFramesetterRef framesetter, CFRange stringRange, CFDictionaryRef frameAttributes, CGSize constraints, CFRange *fitRange)
{
  double v5;
  double v6;
  CGSize result;

  MEMORY[0x1E0CA7DF8](framesetter, stringRange.location, stringRange.length, frameAttributes, fitRange, (__n128)constraints, *(__n128 *)&constraints.height);
  result.height = v6;
  result.width = v5;
  return result;
}

CTLineRef CTLineCreateTruncatedLine(CTLineRef line, double width, CTLineTruncationType truncationType, CTLineRef truncationToken)
{
  return (CTLineRef)MEMORY[0x1E0CA7E70](line, *(_QWORD *)&truncationType, truncationToken, width);
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

void CTLineDraw(CTLineRef line, CGContextRef context)
{
  MEMORY[0x1E0CA7EA8](line, context);
}

CGRect CTLineGetBoundsWithOptions(CTLineRef line, CTLineBoundsOptions options)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x1E0CA7EC0](line, options);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

CFRange CTLineGetStringRange(CTLineRef line)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x1E0CA7F08](line);
  result.length = v2;
  result.location = v1;
  return result;
}

double CTLineGetTrailingWhitespaceWidth(CTLineRef line)
{
  double result;

  MEMORY[0x1E0CA7F10](line);
  return result;
}

uint64_t ISDictionaryValueForCaseInsensitiveString()
{
  return MEMORY[0x1E0DDC118]();
}

uint64_t ISErrorIsEqual()
{
  return MEMORY[0x1E0DDC128]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

NSArray *__cdecl NSAllMapTableKeys(NSMapTable *table)
{
  return (NSArray *)MEMORY[0x1E0CB2850](table);
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

void NSMapInsertKnownAbsent(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DB8](table, key, value);
}

BOOL NSMapMember(NSMapTable *table, const void *key, void **originalKey, void **value)
{
  return MEMORY[0x1E0CB2DC0](table, key, originalKey, value);
}

void NSMapRemove(NSMapTable *table, const void *key)
{
  MEMORY[0x1E0CB2DC8](table, key);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

NSTextAlignment NSTextAlignmentFromCTTextAlignment(CTTextAlignment ctTextAlignment)
{
  return MEMORY[0x1E0DC11C0](ctTextAlignment);
}

uint64_t SKGetRatingStarsImage()
{
  return MEMORY[0x1E0CD80B0]();
}

uint64_t SSDebugFileLevel()
{
  return MEMORY[0x1E0DAF760]();
}

uint64_t SSDebugLevel()
{
  return MEMORY[0x1E0DAF768]();
}

uint64_t SSDebugLog()
{
  return MEMORY[0x1E0DAF770]();
}

uint64_t SSDebugShouldLogNetworkTimingMetrics()
{
  return MEMORY[0x1E0DAF778]();
}

uint64_t SSDialogGetDaemonDialogState()
{
  return MEMORY[0x1E0DAF790]();
}

uint64_t SSDownloadKindIsEBookKind()
{
  return MEMORY[0x1E0DAF818]();
}

uint64_t SSDownloadKindIsSoftwareKind()
{
  return MEMORY[0x1E0DAF820]();
}

uint64_t SSError()
{
  return MEMORY[0x1E0DAFA18]();
}

uint64_t SSFileIsLocalWritable()
{
  return MEMORY[0x1E0DAFA40]();
}

uint64_t SSFileLog()
{
  return MEMORY[0x1E0DAFA48]();
}

uint64_t SSGetStringForNetworkType()
{
  return MEMORY[0x1E0DAFA50]();
}

uint64_t SSVAddMediaSocialHeadersToURLRequest()
{
  return MEMORY[0x1E0DAFD28]();
}

uint64_t SSVAssetResourceLoadingRequestContainsSecureKeyDeliveryRequest()
{
  return MEMORY[0x1E0DAFD30]();
}

uint64_t SSVDefaultUserAgent()
{
  return MEMORY[0x1E0DAFD38]();
}

uint64_t SSVGetMetricsPageDescriptionWithPlatformDictionary()
{
  return MEMORY[0x1E0DAFD48]();
}

uint64_t SSVProtocolRedirectURLForResponse()
{
  return MEMORY[0x1E0DAFD68]();
}

uint64_t SSVStoreFrontIdentifierForAccount()
{
  return MEMORY[0x1E0DAFD80]();
}

uint64_t SUBarButtonItemApplyStyling()
{
  return MEMORY[0x1E0DDC280]();
}

uint64_t SUCreateHTMLForPlainText()
{
  return MEMORY[0x1E0DDC288]();
}

uint64_t SUCreatePreviewHistoryOperation()
{
  return MEMORY[0x1E0DDC290]();
}

uint64_t SUNavigationBarApplyStyling()
{
  return MEMORY[0x1E0DDC298]();
}

uint64_t SUWebScriptNameForSelector2()
{
  return MEMORY[0x1E0DDC2D0]();
}

BOOL UIAccessibilityIsBoldTextEnabled(void)
{
  return MEMORY[0x1E0DC4530]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

uint64_t UIAnimationDragCoefficient()
{
  return MEMORY[0x1E0DC4728]();
}

uint64_t UICeilToViewScale()
{
  return MEMORY[0x1E0DC4888]();
}

uint64_t UIDistanceBetweenPointAndRect()
{
  return MEMORY[0x1E0DC4980]();
}

uint64_t UIDistanceBetweenPoints()
{
  return MEMORY[0x1E0DC4988]();
}

uint64_t UIFloorToViewScale()
{
  return MEMORY[0x1E0DC4A10]();
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

uint64_t UIITunesStoreResolvedURLForHTTPURL()
{
  return MEMORY[0x1E0DC4C10]();
}

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x1E0DC4C60](image);
}

uint64_t UIKeyboardOrderInAutomatic()
{
  return MEMORY[0x1E0DC4F78]();
}

uint64_t UIKeyboardOrderOutAutomatic()
{
  return MEMORY[0x1E0DC4F88]();
}

uint64_t UIRectCenteredAboutPointScale()
{
  return MEMORY[0x1E0DC5240]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectCenteredXInRectScale()
{
  return MEMORY[0x1E0DC5268]();
}

uint64_t UIRectCenteredYInRect()
{
  return MEMORY[0x1E0DC5270]();
}

uint64_t UIRectCenteredYInRectScale()
{
  return MEMORY[0x1E0DC5278]();
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void UIRectFillUsingBlendMode(CGRect rect, CGBlendMode blendMode)
{
  MEMORY[0x1E0DC52A0](*(_QWORD *)&blendMode, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x1E0DC52B0]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x1E0DC52F8]();
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

NSDictionary *_NSDictionaryOfVariableBindings(NSString *commaSeparatedKeysString, id firstValue, ...)
{
  return (NSDictionary *)MEMORY[0x1E0CB3BC8](commaSeparatedKeysString, firstValue);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void operator delete(void *__p)
{
  off_1E739F5D8(__p);
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E739F5E0(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

int __cxa_guard_acquire(__guard *a1)
{
  return MEMORY[0x1E0DE50B8](a1);
}

void __cxa_guard_release(__guard *a1)
{
  MEMORY[0x1E0DE50C0](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_log_send_and_compose_impl()
{
  return MEMORY[0x1E0C81068]();
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x1E0C813B0]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

BOOL class_conformsToProtocol(Class cls, Protocol *protocol)
{
  return MEMORY[0x1E0DE7A68](cls, protocol);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BF8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

void dispatch_barrier_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C48](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x1E0C82F08](object, queue);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

double drand48(void)
{
  double result;

  MEMORY[0x1E0C83070]();
  return result;
}

long double exp(long double __x)
{
  long double result;

  MEMORY[0x1E0C83280](__x);
  return result;
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
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

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F90](self, _cmd, newValue, offset);
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

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int rand(void)
{
  return MEMORY[0x1E0C84FB0]();
}

void srand48(uint64_t a1)
{
  MEMORY[0x1E0C85480](a1);
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
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

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x1E0DEECC8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTypeByMangledNameInContext2()
{
  return MEMORY[0x1E0DEED38]();
}

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
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

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEEA0]();
}

uint64_t swift_task_alloc()
{
  return MEMORY[0x1E0DF1000]();
}

uint64_t swift_task_create()
{
  return MEMORY[0x1E0DF1008]();
}

uint64_t swift_task_dealloc()
{
  return MEMORY[0x1E0DF1010]();
}

uint64_t swift_task_switch()
{
  return MEMORY[0x1E0DF1050]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

