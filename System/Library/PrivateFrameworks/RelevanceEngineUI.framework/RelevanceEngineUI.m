void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_213277FB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_2132789E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id REUIActionsAlertProviderServerInterface()
{
  if (REUIActionsAlertProviderServerInterface_onceToken != -1)
    dispatch_once(&REUIActionsAlertProviderServerInterface_onceToken, &__block_literal_global_0);
  return (id)REUIActionsAlertProviderServerInterface_interface;
}

id REUIActionsAlertProviderClientInterface()
{
  if (REUIActionsAlertProviderClientInterface_onceToken != -1)
    dispatch_once(&REUIActionsAlertProviderClientInterface_onceToken, &__block_literal_global_48);
  return (id)REUIActionsAlertProviderClientInterface_interface;
}

uint64_t REUINowPlayingPlaceholderAlbumArtwork()
{
  return 0;
}

id REUISampleRelevanceProviderForPosition(double a1)
{
  NSObject *v2;
  float v3;
  uint8_t v5[16];

  RELogForDomain();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_213276000, v2, OS_LOG_TYPE_DEFAULT, "WARNING: Please consider using the new alternative method when generating a Sample Content RERelevanceProvider with position.", v5, 2u);
  }

  v3 = a1;
  softRESampleRelevanceProviderForPosition(v3);
  return (id)objc_claimAutoreleasedReturnValue();
}

id softRESampleRelevanceProviderForPosition(float a1)
{
  void (*v2)(float);
  _Unwind_Exception *v4;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  void *v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v2 = (void (*)(float))getRESampleRelevanceProviderForPositionSymbolLoc_ptr;
  v9 = getRESampleRelevanceProviderForPositionSymbolLoc_ptr;
  if (!getRESampleRelevanceProviderForPositionSymbolLoc_ptr)
  {
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 3221225472;
    v5[2] = __getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke;
    v5[3] = &unk_24CF79D88;
    v5[4] = &v6;
    __getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke((uint64_t)v5);
    v2 = (void (*)(float))v7[3];
  }
  _Block_object_dispose(&v6, 8);
  if (!v2)
  {
    v4 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v6, 8);
    _Unwind_Resume(v4);
  }
  v2(a1);
  return (id)objc_claimAutoreleasedReturnValue();
}

id REUISampleRelevanceProviderForSamplePosition(unint64_t a1)
{
  return REUISampleRelevanceProviderForSamplePositionWithPercentage(a1, 0.0);
}

id REUISampleRelevanceProviderForSamplePositionWithPercentage(unint64_t a1, double a2)
{
  double v4;
  double v5;
  NSObject *v6;
  float v7;
  int v9;
  double v10;
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = fmin(a2, 1.0);
  if (v4 < 0.0)
    v4 = 0.0;
  if (v4 == 1.0)
    v5 = 0.99;
  else
    v5 = v4;
  if (v5 != a2)
  {
    RELogForDomain();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134218240;
      v10 = a2;
      v11 = 2048;
      v12 = v5;
      _os_log_impl(&dword_213276000, v6, OS_LOG_TYPE_DEFAULT, "WARNING: Your given percentage of %f is being clamped to %f; please stay within your bounds.",
        (uint8_t *)&v9,
        0x16u);
    }

  }
  v7 = v5 + (double)a1;
  softRESampleRelevanceProviderForPosition(v7);
  return (id)objc_claimAutoreleasedReturnValue();
}

void *__getRESampleRelevanceProviderForPositionSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (RelevanceEngineLibraryCore_frameworkLibrary)
  {
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
  }
  else
  {
    RelevanceEngineLibraryCore_frameworkLibrary = _sl_dlopen();
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary;
    if (!RelevanceEngineLibraryCore_frameworkLibrary)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "RESampleRelevanceProviderForPosition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getRESampleRelevanceProviderForPositionSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double ClippingRadiusForDevice(void *a1)
{
  id v1;
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  double v9;

  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&ClippingRadiusForDevice___lock);
  WeakRetained = objc_loadWeakRetained(&ClippingRadiusForDevice___cachedDevice);
  if (!WeakRetained)
    goto LABEL_5;
  v3 = WeakRetained;
  v4 = objc_loadWeakRetained(&ClippingRadiusForDevice___cachedDevice);
  if (v4 != v1)
  {

LABEL_5:
    v7 = objc_storeWeak(&ClippingRadiusForDevice___cachedDevice, v1);
    ClippingRadiusForDevice___previousCLKDeviceVersion = objc_msgSend(v1, "version");

    __ClippingRadiusForDevice_block_invoke(v8, (uint64_t)v1);
    goto LABEL_6;
  }
  v5 = objc_msgSend(v1, "version");
  v6 = ClippingRadiusForDevice___previousCLKDeviceVersion;

  if (v5 != v6)
    goto LABEL_5;
LABEL_6:
  os_unfair_lock_unlock((os_unfair_lock_t)&ClippingRadiusForDevice___lock);
  v9 = *(double *)&ClippingRadiusForDevice__clippingRadius;

  return v9;
}

void sub_2132809D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void sub_213281E5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t RelevanceEngineLibrary()
{
  uint64_t v0;
  void *v2;

  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
    RelevanceEngineLibraryCore_frameworkLibrary_0 = _sl_dlopen();
  v0 = RelevanceEngineLibraryCore_frameworkLibrary_0;
  if (!RelevanceEngineLibraryCore_frameworkLibrary_0)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

Class __getREAppNameCacheClass_block_invoke(uint64_t a1)
{
  Class result;

  RelevanceEngineLibrary();
  result = objc_getClass("REAppNameCache");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREAppNameCacheClass_block_invoke_cold_1();
  getREAppNameCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

Class __getREAppIconCacheClass_block_invoke(uint64_t a1)
{
  Class result;

  RelevanceEngineLibrary();
  result = objc_getClass("REAppIconCache");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    __getREAppIconCacheClass_block_invoke_cold_1();
  getREAppIconCacheClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_213284948(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id REEncodeImage(void *a1)
{
  UIImage *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[7];
  _QWORD v16[8];

  v16[7] = *MEMORY[0x24BDAC8D0];
  if (!a1)
    return 0;
  v15[0] = CFSTR("data");
  v1 = a1;
  UIImagePNGRepresentation(v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v2;
  v15[1] = CFSTR("scale");
  v3 = (void *)MEMORY[0x24BDD16E0];
  -[UIImage scale](v1, "scale");
  objc_msgSend(v3, "numberWithDouble:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  v15[2] = CFSTR("orientation");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UIImage imageOrientation](v1, "imageOrientation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  v15[3] = CFSTR("template");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UIImage renderingMode](v1, "renderingMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  v15[4] = CFSTR("capInsets");
  v7 = (void *)MEMORY[0x24BDD1968];
  -[UIImage capInsets](v1, "capInsets");
  objc_msgSend(v7, "valueWithUIEdgeInsets:");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v8;
  v15[5] = CFSTR("resizingMode");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[UIImage resizingMode](v1, "resizingMode"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v9;
  v15[6] = CFSTR("supressHairline");
  v10 = (void *)MEMORY[0x24BDD16E0];
  v11 = -[UIImage _suppressesAccessibilityHairlineThickening](v1, "_suppressesAccessibilityHairlineThickening");

  objc_msgSend(v10, "numberWithBool:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v12;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v16, v15, 7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id REDecodeImage(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  double v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("data"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("scale"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "doubleValue");
    v5 = v4;

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("orientation"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntegerValue");

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("template"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "unsignedIntegerValue");

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("capInsets"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "UIEdgeInsetsValue");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("resizingMode"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "unsignedIntegerValue");

    objc_msgSend(MEMORY[0x24BDF6AC8], "imageWithData:", v2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = (void *)MEMORY[0x24BDF6AC8];
    v23 = objc_retainAutorelease(v21);
    objc_msgSend(v22, "imageWithCGImage:scale:orientation:", objc_msgSend(v23, "CGImage"), v7, v5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "resizableImageWithCapInsets:resizingMode:", v20, v12, v14, v16, v18);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("supressHairline"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v1) = objc_msgSend(v26, "BOOLValue");
    if ((_DWORD)v1)
    {
      objc_msgSend(v25, "_imageThatSuppressesAccessibilityHairlineThickening");
      v27 = objc_claimAutoreleasedReturnValue();

      v25 = (void *)v27;
    }
    objc_msgSend(v25, "imageWithRenderingMode:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v28 = 0;
  }
  return v28;
}

id REImageNamedFromBundle(void *a1, void *a2)
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDB8780];
  v4 = a2;
  v5 = a1;
  objc_msgSend(v3, "sharedRenderingContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "device");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  CLKUIImageNamedFromBundleForDevice();
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id REUILocalizedString(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v1 = REUILocalizedString_onceToken;
  v2 = a1;
  if (v1 != -1)
    dispatch_once(&REUILocalizedString_onceToken, &__block_literal_global_4);
  objc_msgSend((id)REUILocalizedString_Bundle, "localizedStringForKey:value:table:", v2, &stru_24CF7A2B0, CFSTR("RelevanceEngineUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t REApplicationTintColor()
{
  return 0;
}

id RELegibilityColorForContentColor(void *a1)
{
  double v1;

  objc_msgSend(a1, "_luminance");
  if (v1 <= 0.7)
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
  else
    objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

double RESuggestedHeaderImageSizeForStyle(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr;
  v11 = getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr;
  if (!getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr)
  {
    v4 = (void *)NanoTimeKitLibrary();
    v3 = dlsym(v4, "NTKSuggestedHeaderImageSizeForStyle");
    v9[3] = (uint64_t)v3;
    getNTKSuggestedHeaderImageSizeForStyleSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = ((double (*)(uint64_t, id))v3)(a1, v2);

  return v5;
}

double RESuggestedBodyImageSizeForStyle(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  double v5;
  _Unwind_Exception *v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(MEMORY[0x24BDB8730], "currentDevice");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v3 = getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr;
  v11 = getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr;
  if (!getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr)
  {
    v4 = (void *)NanoTimeKitLibrary();
    v3 = dlsym(v4, "NTKSuggestedBodyImageSizeForStyle");
    v9[3] = (uint64_t)v3;
    getNTKSuggestedBodyImageSizeForStyleSymbolLoc_ptr = v3;
  }
  _Block_object_dispose(&v8, 8);
  if (!v3)
  {
    v7 = (_Unwind_Exception *)softRESampleRelevanceProviderForPosition_cold_1();
    _Block_object_dispose(&v8, 8);
    _Unwind_Resume(v7);
  }
  v5 = ((double (*)(uint64_t, id))v3)(a1, v2);

  return v5;
}

uint64_t REUIScaledFullColorImageProviderWithImage()
{
  return 0;
}

uint64_t REUIGraphicCircularTemplateForAppWithIdentifier()
{
  return 0;
}

uint64_t NanoTimeKitLibrary()
{
  uint64_t v0;
  void *v2;

  if (!NanoTimeKitLibraryCore_frameworkLibrary)
    NanoTimeKitLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = NanoTimeKitLibraryCore_frameworkLibrary;
  if (!NanoTimeKitLibraryCore_frameworkLibrary)
  {
    v2 = (void *)abort_report_np();
    free(v2);
  }
  return v0;
}

double REUpNextUnitRectForFrameInBounds(double a1, double a2, double a3, double a4, CGFloat a5, CGFloat a6, CGFloat a7, CGFloat a8)
{
  double v13;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;

  v15.origin.x = a5;
  v15.origin.y = a6;
  v15.size.width = a7;
  v15.size.height = a8;
  CGRectGetMinY(v15);
  v16.origin.x = a5;
  v16.origin.y = a6;
  v16.size.width = a7;
  v16.size.height = a8;
  CGRectGetHeight(v16);
  v17.origin.x = a5;
  v17.origin.y = a6;
  v17.size.width = a7;
  v17.size.height = a8;
  v13 = a1 / CGRectGetWidth(v17);
  v18.origin.x = a5;
  v18.origin.y = a6;
  v18.size.width = a7;
  v18.size.height = a8;
  CGRectGetHeight(v18);
  v19.origin.x = a5;
  v19.origin.y = a6;
  v19.size.width = a7;
  v19.size.height = a8;
  CGRectGetWidth(v19);
  return v13;
}

uint64_t soft_RETrainingSimulationIsCurrentlyActive()
{
  uint64_t (*v0)(uint64_t);
  uint64_t v1;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  void *(*v8)(uint64_t);
  void *v9;
  uint64_t *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    v7 = xmmword_24CF7A178;
    v8 = 0;
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
  }
  if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    return 0;
  v3 = 0;
  v4 = &v3;
  v5 = 0x2020000000;
  v0 = (uint64_t (*)(uint64_t))getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr;
  v6 = getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr;
  if (!getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr)
  {
    *(_QWORD *)&v7 = MEMORY[0x24BDAC760];
    *((_QWORD *)&v7 + 1) = 3221225472;
    v8 = __getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke;
    v9 = &unk_24CF79D88;
    v10 = &v3;
    __getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke((uint64_t)&v7);
    v0 = (uint64_t (*)(uint64_t))v4[3];
  }
  _Block_object_dispose(&v3, 8);
  if (!v0)
  {
    softRESampleRelevanceProviderForPosition_cold_1();
    __break(1u);
  }
  return v0(v1);
}

void sub_21328A3D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

void *__getRETrainingSimulationIsCurrentlyActiveSymbolLoc_block_invoke(uint64_t a1)
{
  void *v2;
  void *result;
  void *v4;

  if (RelevanceEngineLibraryCore_frameworkLibrary_1)
  {
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary_1;
  }
  else
  {
    RelevanceEngineLibraryCore_frameworkLibrary_1 = _sl_dlopen();
    v2 = (void *)RelevanceEngineLibraryCore_frameworkLibrary_1;
    if (!RelevanceEngineLibraryCore_frameworkLibrary_1)
    {
      v4 = (void *)abort_report_np();
      free(v4);
    }
  }
  result = dlsym(v2, "RETrainingSimulationIsCurrentlyActive");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  getRETrainingSimulationIsCurrentlyActiveSymbolLoc_ptr = *(_UNKNOWN **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

double NTKInterpolateBetweenFloatsClipped(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * fmin(fmax(a3, 0.0), 1.0);
}

uint64_t softRESampleRelevanceProviderForPosition_cold_1()
{
  NSObject *v0;

  dlerror();
  v0 = abort_report_np();
  return -[REUIDonatedElementProperties _loadContentForRelevantShortcut:completion:].cold.1(v0);
}

void __getREAppNameCacheClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  __getREAppIconCacheClass_block_invoke_cold_1(v0);
}

void __getREAppIconCacheClass_block_invoke_cold_1()
{
  CGAffineTransform *v0;
  CGFloat v1;
  CGFloat v2;

  abort_report_np();
  CGAffineTransformMakeScale(v0, v1, v2);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x24BDBDCE0](c, path);
}

void CGContextClip(CGContextRef c)
{
  MEMORY[0x24BDBDD28](c);
}

void CGContextSetInterpolationQuality(CGContextRef c, CGInterpolationQuality quality)
{
  MEMORY[0x24BDBE018](c, *(_QWORD *)&quality);
}

BOOL CGRectEqualToRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBEFE0]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

CGFloat CGRectGetHeight(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFE8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMaxY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF000]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMidY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF008]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetMinY(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF018]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGRect CGRectInset(CGRect rect, CGFloat dx, CGFloat dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  MEMORY[0x24BDBF030]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

uint64_t CLKUIImageNamedFromBundleForDevice()
{
  return MEMORY[0x24BE16EE0]();
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t REApplicationGetType()
{
  return MEMORY[0x24BE7D0A8]();
}

uint64_t REDiffOperationTypeDescription()
{
  return MEMORY[0x24BE7D0C0]();
}

uint64_t REEnumerateTrainingStateForDate()
{
  return MEMORY[0x24BE7D0E0]();
}

uint64_t REIsCurrentLocaleCJK()
{
  return MEMORY[0x24BE7D0E8]();
}

uint64_t RELogForDomain()
{
  return MEMORY[0x24BE7D0F0]();
}

uint64_t RERaiseInternalException()
{
  return MEMORY[0x24BE7D0F8]();
}

uint64_t REStringForSectionPath()
{
  return MEMORY[0x24BE7D108]();
}

uint64_t RESupergreenSuggestedImageDonationWidth()
{
  return MEMORY[0x24BE7D110]();
}

NSData *__cdecl UIImagePNGRepresentation(UIImage *image)
{
  return (NSData *)MEMORY[0x24BDF7928](image);
}

uint64_t UIRectGetCenter()
{
  return MEMORY[0x24BDF7CD8]();
}

uint64_t UIRoundToViewScale()
{
  return MEMORY[0x24BDF7D08]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x24BEAE670]();
}

uint64_t abort_report_np()
{
  return MEMORY[0x24BDAD010]();
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x24BDAE068]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x24BDAE088](__handle, __symbol);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x24BEDD088](name);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x24BEDD138]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x24BEDD148]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x24BEDD160]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

