uint64_t PREditingSupportsLiveBlurs()
{
  if (PREditingSupportsLiveBlurs_onceToken != -1)
    dispatch_once(&PREditingSupportsLiveBlurs_onceToken, &__block_literal_global);
  return PREditingSupportsLiveBlurs_supportsLiveBlurs;
}

id PRBundleURLFromReturnAddress()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithFileSystemRepresentation:isDirectory:relativeToURL:", dyld_image_path_containing_address(), 0, 0);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "URLByDeletingLastPathComponent");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

uint64_t PRCSLayoutVariantFromPRLayoutVariant(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 3)
    return 0;
  return result;
}

uint64_t PRCSElementTypeFromPRElementType(unint64_t a1)
{
  return a1 & 0x1F | (((a1 >> 5) & 3) << 6);
}

uint64_t OUTLINED_FUNCTION_9()
{
  return objc_opt_class();
}

void sub_18B63DDD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_18B63E0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t ATXFaceGalleryItemEqualObjects(void *a1, void *a2)
{
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  int v33;
  void *v34;
  void *v35;
  int v36;
  void *v37;
  void *v38;
  int v39;
  void *v40;
  void *v41;
  int v42;
  int v43;
  int v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;

  v3 = a1;
  v4 = a2;
  v5 = (void *)v4;
  if (!(v3 | v4))
  {
LABEL_2:
    v6 = 1;
    goto LABEL_29;
  }
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend((id)v3, "descriptorIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptorIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = BSEqualObjects();

    if (!v9)
      goto LABEL_28;
    objc_msgSend((id)v3, "extensionBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "extensionBundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = BSEqualObjects();

    if (!v12)
      goto LABEL_28;
    objc_msgSend((id)v3, "displayNameLocalizationKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "displayNameLocalizationKey");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = BSEqualObjects();

    if (!v15)
      goto LABEL_28;
    objc_msgSend((id)v3, "spokenNameLocalizationKey");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "spokenNameLocalizationKey");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = BSEqualObjects();

    if (!v18)
      goto LABEL_28;
    objc_msgSend((id)v3, "descriptiveTextLocalizationKey");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "descriptiveTextLocalizationKey");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = BSEqualObjects();

    if (!v21)
      goto LABEL_28;
    objc_msgSend((id)v3, "localizedDisplayName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedDisplayName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = BSEqualObjects();

    if (!v24)
      goto LABEL_28;
    objc_msgSend((id)v3, "localizedSubtitle");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedSubtitle");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = BSEqualObjects();

    if (!v27)
      goto LABEL_28;
    objc_msgSend((id)v3, "titleFontName");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleFontName");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = BSEqualObjects();

    if (!v30)
      goto LABEL_28;
    objc_msgSend((id)v3, "titleColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "titleColor");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = BSEqualObjects();

    if (!v33)
      goto LABEL_28;
    objc_msgSend((id)v3, "subtitleComplication");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "subtitleComplication");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = BSEqualObjects();

    if (!v36)
      goto LABEL_28;
    objc_msgSend((id)v3, "modeSemanticType");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modeSemanticType");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = BSEqualObjects();

    if (!v39)
      goto LABEL_28;
    objc_msgSend((id)v3, "modeUUID");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "modeUUID");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = BSEqualObjects();

    if (!v42)
      goto LABEL_28;
    v43 = objc_msgSend((id)v3, "isBlankTemplate");
    if (v43 != objc_msgSend(v5, "isBlankTemplate"))
      goto LABEL_28;
    v44 = objc_msgSend((id)v3, "shouldShowAsShuffleStack");
    if (v44 != objc_msgSend(v5, "shouldShowAsShuffleStack"))
      goto LABEL_28;
    v45 = objc_msgSend((id)v3, "source");
    if (v45 != objc_msgSend(v5, "source"))
      goto LABEL_28;
    v46 = objc_msgSend((id)v3, "layoutType");
    if (v46 != objc_msgSend(v5, "layoutType"))
      goto LABEL_28;
    objc_msgSend((id)v3, "complications");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = objc_msgSend(v47, "count");
    objc_msgSend(v5, "complications");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = objc_msgSend(v49, "count");

    if (v48 != v50)
    {
LABEL_28:
      v6 = 0;
      goto LABEL_29;
    }
    objc_msgSend((id)v3, "complications");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = objc_msgSend(v51, "count");

    if (!v52)
      goto LABEL_2;
    v53 = 0;
    v54 = v52 - 1;
    do
    {
      objc_msgSend((id)v3, "complications");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "objectAtIndex:", v53);
      v56 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "complications");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "objectAtIndex:", v53);
      v58 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = ATXComplicationEqualObjects((uint64_t)v56, v58);
      if (!(_DWORD)v6)
        break;
    }
    while (v54 != v53++);
  }
LABEL_29:

  return v6;
}

uint64_t ATXComplicationEqualObjects(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;

  v2 = a2;
  CHSWidgetFromATXComplication();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  CHSWidgetFromATXComplication();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = objc_msgSend(v3, "matchesPersonality:", v4);
  return v5;
}

void PREnumerateInterfaceOrientationsForMask(uint64_t a1, void *a2)
{
  void (**v3)(id, uint64_t, char *);
  uint64_t i;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;

  v3 = a2;
  if (v3)
  {
    for (i = 0; i != 4; ++i)
    {
      switch(i)
      {
        case 3:
          v6 = a1 & 8;
          a1 &= ~8uLL;
          if (v6)
            goto LABEL_11;
          break;
        case 2:
          v7 = a1 & 4;
          a1 &= ~4uLL;
          if (v7)
            goto LABEL_11;
          break;
        case 1:
          v5 = a1 & 2;
          a1 &= ~2uLL;
          if (v5)
          {
LABEL_11:
            v8 = 0;
            v3[2](v3, i, &v8);
            if (v8)
              goto LABEL_13;
          }
          break;
      }
    }
  }
LABEL_13:

}

uint64_t PRLockPickIsActive()
{
  if (PRLockPickIsActive_onceToken != -1)
    dispatch_once(&PRLockPickIsActive_onceToken, &__block_literal_global_1);
  return PRLockPickIsActive_lockPickIsActive;
}

uint64_t PRIsLowQualityDevice()
{
  if (PRIsLowQualityDevice_onceToken != -1)
    dispatch_once(&PRIsLowQualityDevice_onceToken, &__block_literal_global_3);
  return PRIsLowQualityDevice_isLowQualityDevice;
}

uint64_t PRIsDepthEffectDisallowed(int a1, int a2, unsigned int a3)
{
  return a1 & a2 | a3;
}

uint64_t PRGetMaximumMemoryUsageForCurrentProcess()
{
  mach_msg_type_number_t task_info_outCnt;
  integer_t task_info_out[4];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  int v25;

  v25 = 0;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  *(_OWORD *)task_info_out = 0u;
  v3 = 0u;
  task_info_outCnt = 93;
  if (task_info(*MEMORY[0x1E0C83DA0], 0x16u, task_info_out, &task_info_outCnt))
    return 0;
  else
    return v11 + v23;
}

uint64_t PRGetMemoryUsageForCurrentProcess()
{
  pid_t v0;
  _OWORD v2[4];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  __int128 v26;
  __int128 v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  v6 = 0u;
  v7 = 0u;
  v4 = 0u;
  v5 = 0u;
  v3 = 0u;
  memset(v2, 0, sizeof(v2));
  v0 = getpid();
  if (proc_pid_rusage(v0, 6, (rusage_info_t *)v2) < 0)
    return 0;
  else
    return *((_QWORD *)&v3 + 1);
}

void sub_18B640840(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6418CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
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

void sub_18B6423A8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_18B6442A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t PRPosterContentsBackgroundTypeForLuminance(double a1)
{
  if (a1 < 0.0 || a1 > 1.0)
    return 0;
  if (a1 > 0.9)
    return 2;
  if (a1 >= 0.1)
    return 1;
  return 3;
}

uint64_t BSUIVibrancyBackgroundTypeForPRPosterContentsBackgroundType(uint64_t a1)
{
  if (a1 == 3)
    return 2;
  else
    return a1 == 2;
}

id PRSharedWidgetDescriptorProvider()
{
  if (PRSharedWidgetDescriptorProvider___once != -1)
    dispatch_once(&PRSharedWidgetDescriptorProvider___once, &__block_literal_global_3);
  return (id)PRSharedWidgetDescriptorProvider___instance;
}

id PRSharedWidgetExtensionProvider()
{
  if (PRSharedWidgetExtensionProvider___once[0] != -1)
    dispatch_once(PRSharedWidgetExtensionProvider___once, &__block_literal_global_1);
  return (id)PRSharedWidgetExtensionProvider___instance;
}

id PRComplicationsSceneWorkspace()
{
  if (PRComplicationsSceneWorkspace_onceToken != -1)
    dispatch_once(&PRComplicationsSceneWorkspace_onceToken, &__block_literal_global_5);
  return (id)PRComplicationsSceneWorkspace_workspace;
}

void sub_18B648D20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, id *a13, id *a14)
{
  uint64_t v14;

  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(a13);
  objc_destroyWeak(a14);
  objc_destroyWeak((id *)(v14 - 168));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_18B64A224(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t PRPosterLevelIsDefinedLevel(unint64_t a1)
{
  int64x2_t v1;

  v1 = vdupq_n_s64(a1);
  return vmaxv_u8((uint8x8_t)vmovn_s16(vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18B73AF90), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18B73AFA0)), (int16x8_t)vuzp1q_s32((int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18B73AFB0), (int32x4_t)vceqq_s64(v1, (int64x2_t)xmmword_18B73AFC0))))) & 1;
}

__CFString *NSStringFromPRPosterLevel(uint64_t a1)
{
  __CFString *v1;

  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
        return CFSTR("PRPosterLevelContentOverlay");
      if (a1 == 3000)
        return CFSTR("PRPosterLevelModal");
    }
    else
    {
      if (!a1)
        return CFSTR("PRPosterLevelTime");
      if (a1 == 1000)
        return CFSTR("PRPosterLevelFloating");
    }
    goto LABEL_22;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
      return CFSTR("PRPosterLevelForeground");
    if (a1 == -500)
      return CFSTR("PRPosterLevelFloatingUnder");
    goto LABEL_22;
  }
  if (a1 == -3000)
    return CFSTR("PRPosterLevelBackdrop");
  if (a1 != -2000)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(Unknown PRPosterLevel; %lu)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("PRPosterLevelBackground");
  return v1;
}

__CFString *ShortNSStringFromPRPosterLevel(uint64_t a1)
{
  __CFString *v1;

  if ((a1 & 0x8000000000000000) == 0)
  {
    if (a1 > 1999)
    {
      if (a1 == 2000)
        return CFSTR("CO6");
      if (a1 == 3000)
        return CFSTR("M7");
    }
    else
    {
      if (!a1)
        return CFSTR("TIME4");
      if (a1 == 1000)
        return CFSTR("FL5");
    }
    goto LABEL_22;
  }
  if (a1 > -1001)
  {
    if (a1 == -1000)
      return CFSTR("FG2");
    if (a1 == -500)
      return CFSTR("FU3");
    goto LABEL_22;
  }
  if (a1 == -3000)
    return CFSTR("BD0");
  if (a1 != -2000)
  {
LABEL_22:
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("(UNK%lu)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("BG1");
  return v1;
}

id PRPosterRoleFromPFPosterRole(void *a1)
{
  return a1;
}

id _PRPosterContentStyleStringForType(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[5];
  _QWORD v7[6];

  v7[5] = *MEMORY[0x1E0C80C00];
  v6[0] = &unk_1E21DC9F8;
  v6[1] = &unk_1E21DCA10;
  v7[0] = CFSTR("OpaqueDiscreteColors");
  v7[1] = CFSTR("Gradient");
  v6[2] = &unk_1E21DCA28;
  v6[3] = &unk_1E21DCA40;
  v7[2] = CFSTR("VibrantMaterial");
  v7[3] = CFSTR("VibrantMonochrome");
  v6[4] = &unk_1E21DCA58;
  v7[4] = CFSTR("LUT");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 5);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

const __CFString *_PRPosterGradientStyleIdentifierStringForGradientType(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("A");
  if (a1 == 1)
    v1 = CFSTR("R");
  if (a1 == 2)
    return CFSTR("C");
  else
    return v1;
}

const __CFString *PRStringForEditingDestination(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("PREditingDestinationUnknown");
  if (a1 == 2)
    v1 = CFSTR("PREditingDestinationUpdate");
  if (a1 == 1)
    return CFSTR("PREditingDestinationNew");
  else
    return v1;
}

uint64_t PREditingDestinationForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(CFSTR("PREditingDestinationNew"), "isEqual:", v1) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(CFSTR("PREditingDestinationUpdate"), "isEqual:", v1))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id PRSystemNumberingSystem()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0D3EFB0];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberingSystemForLocaleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id _PRAllNumberingSystemsMap()
{
  _QWORD v1[16];
  _QWORD v2[17];

  v2[16] = *MEMORY[0x1E0C80C00];
  v1[0] = &unk_1E21DCA70;
  v1[1] = &unk_1E21DCA88;
  v2[0] = CFSTR("latn");
  v2[1] = CFSTR("arab");
  v1[2] = &unk_1E21DCAA0;
  v1[3] = &unk_1E21DCAB8;
  v2[2] = CFSTR("deva");
  v2[3] = CFSTR("khmr");
  v1[4] = &unk_1E21DCAD0;
  v1[5] = &unk_1E21DCAE8;
  v2[4] = CFSTR("mymr");
  v2[5] = CFSTR("beng");
  v1[6] = &unk_1E21DCB00;
  v1[7] = &unk_1E21DCB18;
  v2[6] = CFSTR("guru");
  v2[7] = CFSTR("gujr");
  v1[8] = &unk_1E21DCB30;
  v1[9] = &unk_1E21DCB48;
  v2[8] = CFSTR("taml");
  v2[9] = CFSTR("telu");
  v1[10] = &unk_1E21DCB60;
  v1[11] = &unk_1E21DCB78;
  v2[10] = CFSTR("mlym");
  v2[11] = CFSTR("knda");
  v1[12] = &unk_1E21DCB90;
  v1[13] = &unk_1E21DCBA8;
  v2[12] = CFSTR("orya");
  v2[13] = CFSTR("olck");
  v1[14] = &unk_1E21DCBC0;
  v1[15] = &unk_1E21DCBD8;
  v2[14] = CFSTR("mtei");
  v2[15] = CFSTR("arabext");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v2, v1, 16);
  return (id)objc_claimAutoreleasedReturnValue();
}

id PRAllNumberingSystems()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", &unk_1E21DD110);
  if (_os_feature_enabled_impl())
    objc_msgSend(v0, "addObjectsFromArray:", &unk_1E21DD128);
  objc_msgSend(v0, "sortedArrayUsingComparator:", &__block_literal_global_11);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PRNumberingSystemDisplayNameForType(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v3;
  void *v4;

  switch(a1)
  {
    case 1:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ARABIC_INDIC_NUMBERS");
      break;
    case 2:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("DEVANAGARI_NUMBERS");
      break;
    case 3:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("KHMER_NUMBERS");
      break;
    case 4:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("BURMESE_NUMBERS");
      break;
    case 5:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("BANGLA_NUMBERS");
      break;
    case 6:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("GURMUKHI_NUMBERS");
      break;
    case 7:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("GUJARATI_NUMBERS");
      break;
    case 8:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("TAMIL_NUMBERS");
      break;
    case 9:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("TELUGU_NUMBERS");
      break;
    case 10:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("MALAYALAM_NUMBERS");
      break;
    case 11:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("KANNADA_NUMBERS");
      break;
    case 12:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ODIA_NUMBERS");
      break;
    case 13:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("OLCHIKI_NUMBERS");
      break;
    case 14:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("MEITEI_NUMBERS");
      break;
    case 15:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("URDU_NUMBERS");
      break;
    default:
      PRBundle();
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v1;
      v3 = CFSTR("ARABIC_NUMBERS");
      break;
  }
  objc_msgSend(v1, "localizedStringForKey:value:table:", v3, &stru_1E2186E08, CFSTR("PosterKit"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id PRAllNumberingSystemStrings()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  _PRAllNumberingSystemsMap();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PRAllNumberingSystems();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __PRAllNumberingSystemStrings_block_invoke;
  v5[3] = &unk_1E21840E8;
  v6 = v0;
  v2 = v0;
  objc_msgSend(v1, "bs_compactMap:", v5);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

__CFString *PRNumberingSystemStringForType(uint64_t a1)
{
  void *v2;
  void *v3;
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;

  _PRAllNumberingSystemsMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", v3);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
    v4 = CFSTR("latn");
  v6 = v4;

  return v6;
}

id PRNumberingSystemImageForType(uint64_t a1)
{
  void *v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;

  switch(a1)
  {
    case 1:
    case 15:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.ar");
      goto LABEL_16;
    case 2:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.hi");
      goto LABEL_16;
    case 3:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.km");
      goto LABEL_16;
    case 4:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.my");
      goto LABEL_16;
    case 5:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.bn");
      goto LABEL_16;
    case 6:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.pa");
      goto LABEL_16;
    case 7:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.gu");
      goto LABEL_16;
    case 9:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.te");
      goto LABEL_16;
    case 10:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.ml");
      goto LABEL_16;
    case 11:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.kn");
      goto LABEL_16;
    case 12:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.or");
      goto LABEL_16;
    case 13:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.sat");
      goto LABEL_16;
    case 14:
      v1 = (void *)MEMORY[0x1E0DC3870];
      v2 = CFSTR("textformat.numbers.mni");
LABEL_16:
      objc_msgSend(v1, "systemImageNamed:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = (void *)MEMORY[0x1E0DC3870];
      PRBundle();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "imageNamed:inBundle:withConfiguration:", CFSTR("textformat.12"), v4, 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      break;
  }
  return v5;
}

id PRNumberingSystemDisplayFontForFont(void *a1)
{
  if (a1)
    objc_msgSend(a1, "fontWithSize:", 50.0);
  else
    objc_msgSend(MEMORY[0x1E0DC1350], "systemFontOfSize:", 50.0);
  return (id)objc_claimAutoreleasedReturnValue();
}

const __CFString *NSStringFromPRAmbientCreationBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown creation behavior)");
  if (a1 == 1)
    v1 = CFSTR("Manual");
  if (a1)
    return v1;
  else
    return CFSTR("Auto");
}

const __CFString *NSStringFromPRAmbientDeletionBehavior(unint64_t a1)
{
  if (a1 > 2)
    return CFSTR("(unknown deletion behavior)");
  else
    return off_1E2184238[a1];
}

const __CFString *NSStringFromPRAmbientEditingBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown editing behavior)");
  if (a1 == 1)
    v1 = CFSTR("NotEditable");
  if (a1)
    return v1;
  else
    return CFSTR("Editable");
}

const __CFString *NSStringFromPRAmbientGalleryDisplayBehavior(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("(unknown gallery display behavior)");
  if (a1 == 1)
    v1 = CFSTR("Hidden");
  if (a1)
    return v1;
  else
    return CFSTR("Visible");
}

const __CFString *NSStringFromPRPosterAmbientSupportedDataLayout(unint64_t a1)
{
  if (a1 > 3)
    return CFSTR("(unknown data layout)");
  else
    return off_1E2184218[a1];
}

BOOL PRAmbientCreationBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRAmbientDeletionBehaviorIsValid(unint64_t a1)
{
  return a1 < 3;
}

BOOL PRAmbientEditingBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRAmbientGalleryDisplayBehaviorIsValid(unint64_t a1)
{
  return a1 < 2;
}

BOOL PRPosterAmbientSupportedDataLayoutIsValid(unint64_t a1)
{
  return a1 < 4;
}

void sub_18B660530(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *PRStringForEditingVariant(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E21842A0[a1];
}

uint64_t PREditingVariantForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("home")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("lock")) & 1) != 0)
  {
    v2 = 0;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("ambient")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void sub_18B663728(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B667C08(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B66B81C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B66FE1C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, id *a11, id *location)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak((id *)&STACK[0x288]);
  _Unwind_Resume(a1);
}

void sub_18B673858(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *a11, id *location, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id a21,id a22)
{
  objc_destroyWeak(location);
  objc_destroyWeak(a11);
  objc_destroyWeak(&a21);
  objc_destroyWeak(&a22);
  _Unwind_Resume(a1);
}

void sub_18B677824(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x3Au);
}

void OUTLINED_FUNCTION_9_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_18B67DA68(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

BOOL PRPosterTitleLayoutIsVertical(uint64_t a1)
{
  return a1 == 1;
}

void sub_18B685194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_18B686060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

id PRFindLUTFilterView(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(v1, "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_class();
  LODWORD(v3) = objc_msgSend(v3, "isEqual:", objc_opt_class());

  if ((_DWORD)v3)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v1, "layer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filters");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v25;
      v9 = *MEMORY[0x1E0CD2E30];
      while (2)
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v25 != v8)
            objc_enumerationMutation(v5);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v10), "type");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "isEqual:", v9);

          if (v12)
          {
            v17 = v1;
            goto LABEL_21;
          }
          ++v10;
        }
        while (v7 != v10);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
        if (v7)
          continue;
        break;
      }
    }

  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v1, "subviews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v21;
LABEL_13:
    v16 = 0;
    while (1)
    {
      if (*(_QWORD *)v21 != v15)
        objc_enumerationMutation(v5);
      PRFindLUTFilterView(*(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v16));
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17)
        break;
      if (v14 == ++v16)
      {
        v14 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
        if (v14)
          goto LABEL_13;
        goto LABEL_19;
      }
    }
LABEL_21:
    v18 = v17;
  }
  else
  {
LABEL_19:
    v18 = 0;
  }

  return v18;
}

void sub_18B68F984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B68FAE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PRPosterRoleAttributeForData(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFString *v5;
  void *v6;

  v3 = a1;
  v4 = a2;
  if (!v4)
    goto LABEL_19;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRPosterRoleAttributeTypeSuggestionMetadata")) & 1) == 0)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRPosterRoleAttributeTypeHomeScreenConfiguration")) & 1) != 0)
    {
      v5 = CFSTR("PRPosterHomeScreenConfiguration");
      goto LABEL_18;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRPosterRoleAttributeTypeMetadata")) & 1) != 0)
    {
      v5 = CFSTR("PRPosterMetadata");
      goto LABEL_18;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRPosterRoleAttributeTypeFocusConfiguration")) & 1) != 0)
    {
      v5 = CFSTR("PRPosterFocusConfiguration");
      goto LABEL_18;
    }
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("PRPosterRoleAttributeTypeChildPosterUUID")) & 1) != 0)
    {
      v5 = CFSTR("PRChildPosterAttribute");
      goto LABEL_18;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("PRPosterRoleAttributeTypeUsageMetadata")) & 1) != 0)
    {
      v5 = CFSTR("PRPosterUsageMetadataAttribute");
      goto LABEL_18;
    }
    if ((objc_msgSend(v3, "isEqual:", CFSTR("PRPosterRoleAttributeTypeAmbientConfiguration")) & 1) != 0)
    {
      v5 = CFSTR("PRPosterAmbientConfiguration");
      goto LABEL_18;
    }
    if (objc_msgSend(v3, "isEqual:", CFSTR("PRPosterRoleAttributeTypeAmbientChargerConfiguration")))
    {
      v5 = CFSTR("PRPosterAmbientChargerConfiguration");
      goto LABEL_18;
    }
LABEL_19:
    v6 = 0;
    goto LABEL_20;
  }
  v5 = CFSTR("PRPosterSuggestionMetadata");
LABEL_18:
  -[objc_class decodeObjectWithJSON:](NSClassFromString(&v5->isa), "decodeObjectWithJSON:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_20:

  return v6;
}

id PRLogCommon()
{
  if (PRLogCommon_onceToken != -1)
    dispatch_once(&PRLogCommon_onceToken, &__block_literal_global_25);
  return (id)PRLogCommon___logObj;
}

id PRLogRendering()
{
  if (PRLogRendering_onceToken != -1)
    dispatch_once(&PRLogRendering_onceToken, &__block_literal_global_3_2);
  return (id)PRLogRendering___logObj;
}

id PRLogEditing()
{
  if (PRLogEditing_onceToken != -1)
    dispatch_once(&PRLogEditing_onceToken, &__block_literal_global_5_0);
  return (id)PRLogEditing___logObj;
}

id PRLogTelemetrySignposts()
{
  if (PRLogTelemetrySignposts_onceToken != -1)
    dispatch_once(&PRLogTelemetrySignposts_onceToken, &__block_literal_global_7_0);
  return (id)PRLogTelemetrySignposts___logObj;
}

id PRLogSnapshotter()
{
  if (PRLogSnapshotter_onceToken[0] != -1)
    dispatch_once(PRLogSnapshotter_onceToken, &__block_literal_global_9_0);
  return (id)PRLogSnapshotter___logObj;
}

id PRLogUpdatingService()
{
  if (PRLogUpdatingService_onceToken != -1)
    dispatch_once(&PRLogUpdatingService_onceToken, &__block_literal_global_11);
  return (id)PRLogUpdatingService___logObj;
}

id PRLogModel()
{
  if (PRLogModel_onceToken != -1)
    dispatch_once(&PRLogModel_onceToken, &__block_literal_global_13);
  return (id)PRLogModel___logObj;
}

id PRBundle()
{
  if (PRBundle___onceToken != -1)
    dispatch_once(&PRBundle___onceToken, &__block_literal_global_26);
  return (id)PRBundle___posterKitBundle;
}

uint64_t PRIsPlatformSupported()
{
  if (PRIsPlatformSupported_onceToken != -1)
    dispatch_once(&PRIsPlatformSupported_onceToken, &__block_literal_global_2_0);
  return PRIsPlatformSupported_isPlatformSupported;
}

void sub_18B69D0E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_18B69DA90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_18B69F06C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B69F4CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B69F970(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B69FF84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

uint64_t OUTLINED_FUNCTION_8_0()
{
  return objc_opt_class();
}

void sub_18B6A5C58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

__CFString *NSStringFromPRPosterSnapshotDefinitionLayerSet(unint64_t a1)
{
  __CFString *result;
  void *v2;

  if (a1 < 3)
    return off_1E2185488[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("unsupported layerset value: %ld"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSStringFromPRPosterSnapshotDefinitionLayerSet_cold_1();
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (__CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

id PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];
  void *v8;
  _QWORD v9[5];

  v9[4] = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 2:
      +[PRPosterLevelSet compositeLevelSet](PRPosterLevelSet, "compositeLevelSet");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v7[0] = v2;
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -1000);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v7[1] = v3;
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -2000);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v7[2] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 3);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 1:
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", 1000);
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v2;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v8, 1);
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 0:
      +[PRPosterLevelSet compositeLevelSet](PRPosterLevelSet, "compositeLevelSet");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = v2;
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -1000);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v9[1] = v3;
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", -2000);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9[2] = v4;
      +[PRPosterLevelSet levelSetForLevel:](PRPosterLevelSet, "levelSetForLevel:", 1000);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v9[3] = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 4);
      v1 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
LABEL_8:

      break;
  }
  return v1;
}

uint64_t PRPosterSnapshotDefinitionLayerSetForPRPosterLevelSets(void *a1)
{
  id v1;
  uint64_t v2;
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;

  v1 = a1;
  v2 = 2;
  PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v1, "isEqual:", v3);

  if ((v4 & 1) == 0)
  {
    PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet(1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v1, "isEqual:", v5);

    v2 = v6;
  }

  return v2;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

void sub_18B6A807C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6AC9FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6ACD70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6ACEA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AD19C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AD2D0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AD5C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AD6FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AD9F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6ADB28(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6ADEB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6ADFEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AE2E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AE418(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AE710(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AE844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AEB3C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AEC70(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AEF68(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AF09C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AF394(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AF4C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AF7C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AF8F4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AFBEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6AFD20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B0018(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B014C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B0444(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B0578(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B0870(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B09A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_5(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

void OUTLINED_FUNCTION_1_4(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_debug_impl(a1, a4, OS_LOG_TYPE_DEBUG, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_13(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_18B6B2B50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B2C7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B2E2C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B6B354C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B35B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B361C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B4120(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B41A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B444C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  void *v22;
  id *v23;
  uint64_t v24;

  objc_destroyWeak(v23);
  objc_sync_exit(v22);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak((id *)(v24 - 72));
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

void sub_18B6B4554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_18B6B45E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B6B4830(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_18B6B48C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *NSStringFromPRPosterGalleryPresentationStyle(uint64_t a1)
{
  const __CFString *result;
  void *v2;

  if (!a1)
    return CFSTR("DEFAULT");
  if (a1 == 1)
    return CFSTR("SLIDEUP");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Undefined gallery presentation style %ld"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSStringFromPRPosterGalleryPresentationStyle_cold_1();
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (const __CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

const __CFString *NSStringFromPRPosterGalleryDisplayStyle(uint64_t a1)
{
  const __CFString *result;
  void *v2;

  if (!a1)
    return CFSTR("STATIC");
  if (a1 == 1)
    return CFSTR("LIVE");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Undefined gallery display style %ld"), a1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    NSStringFromPRPosterGalleryDisplayStyle_cold_1();
  objc_msgSend(objc_retainAutorelease(v2), "UTF8String");
  result = (const __CFString *)_bs_set_crash_log_message();
  __break(0);
  return result;
}

uint64_t PRPosterGalleryPresentationStyleFromString(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "uppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("SLIDEUP"));

  return v2;
}

uint64_t PRPosterGalleryDisplayStyleFromString(void *a1)
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "uppercaseString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("LIVE"));

  return v2;
}

id _PRCAGradientLayerTypeFromPRContentStyleGradientType(uint64_t a1)
{
  id *v1;
  id *v2;

  v1 = (id *)MEMORY[0x1E0CD2F50];
  v2 = (id *)MEMORY[0x1E0CD2F58];
  if (a1 != 1)
    v2 = (id *)MEMORY[0x1E0CD2F48];
  if (a1 != 2)
    v1 = v2;
  return *v1;
}

id PersistentIdentifierForPRSWidget(void *a1)
{
  objc_class *v1;
  id v2;
  id v3;
  void *v4;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CGSize v21;

  v1 = (objc_class *)MEMORY[0x1E0D10148];
  v2 = a1;
  v3 = [v1 alloc];
  objc_msgSend(v2, "extensionBundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerBundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kind");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v2, "family");
  objc_msgSend(v2, "intent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v3, "initWithExtensionBundleIdentifier:containerBundleIdentifier:kind:family:intent:", v4, v5, v6, v7, v8);

  +[PRWidgetMetricsProvider sharedInstance](PRWidgetMetricsProvider, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "systemMetricsForWidget:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v2, "extensionBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerBundleIdentifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "kind");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v2, "family"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "size");
  NSStringFromCGSize(v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "intent");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "stringWithFormat:", CFSTR("(WIDGET:%@-%@-%@-%@-%@-%lld)"), v13, v14, v15, v16, v17, objc_msgSend(v18, "_indexingHash"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

void sub_18B6C1A1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6C7364(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 88));
  _Unwind_Resume(a1);
}

void sub_18B6C73A8()
{
  JUMPOUT(0x18B6C7398);
}

void sub_18B6CA908(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 128));
  _Unwind_Resume(a1);
}

void sub_18B6CAB24(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B6CB308(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_18B6CCE8C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6D08A0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id a20)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a20);
  _Unwind_Resume(a1);
}

id _PRCAEditingGradientLayerTypeFromPRContentStyleGradientType(uint64_t a1)
{
  id *v1;
  id *v2;

  v1 = (id *)MEMORY[0x1E0CD2F50];
  v2 = (id *)MEMORY[0x1E0CD2F58];
  if (a1 != 1)
    v2 = (id *)MEMORY[0x1E0CD2F48];
  if (a1 != 2)
    v1 = v2;
  return *v1;
}

void sub_18B6D43E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location)
{
  uint64_t v11;

  objc_destroyWeak(location);
  objc_destroyWeak((id *)(v11 - 232));
  _Unwind_Resume(a1);
}

const __CFString *NSStringForPRSceneSetting(uint64_t a1)
{
  const __CFString *result;
  uint64_t v2;

  switch(a1)
  {
    case 20562:
      result = CFSTR("Case Color");
      break;
    case 20563:
      result = CFSTR("Poster Configurable Options");
      break;
    case 20564:
      result = CFSTR("Poster Configured Properties");
      break;
    case 20565:
      result = CFSTR("Poster Title Style Configuration");
      break;
    case 20566:
      result = CFSTR("Poster Ambient Configuration");
      break;
    case 20567:
      result = CFSTR("Depth Effect Disallowed");
      break;
    case 20568:
      result = CFSTR("Parallax Enabled");
      break;
    case 20569:
      result = CFSTR("Parallax Disallowed");
      break;
    case 20570:
      result = CFSTR("Show Header Elements");
      break;
    case 20571:
      result = CFSTR("Show Complications");
      break;
    case 20572:
      result = CFSTR("Horizontal Title Bounding Rect");
      break;
    case 20573:
      result = CFSTR("Vertical Title Bounding Rect");
      break;
    default:
      v2 = a1 - 20762;
      result = 0;
      switch(v2)
      {
        case 0:
          result = CFSTR("Covered by Modal Presentation");
          break;
        case 1:
        case 4:
        case 5:
        case 6:
        case 7:
        case 9:
        case 10:
          return result;
        case 2:
          result = CFSTR("Editing Variant");
          break;
        case 3:
          result = CFSTR("Editing Context");
          break;
        case 8:
          result = CFSTR("Editing Accept Button Type");
          break;
        case 11:
          result = CFSTR("Title String");
          break;
        case 12:
          result = CFSTR("Override Date");
          break;
        default:
          result = 0;
          break;
      }
      break;
  }
  return result;
}

void sub_18B6DB664(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
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

void OUTLINED_FUNCTION_9_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

__CFString *PRStringForEditingContext(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E2185D10[a1];
}

uint64_t PREditingContextForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("user")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("suggested")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("hero")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

BOOL PREditingContextIsSavedConfiguration(uint64_t a1)
{
  return a1 == 0;
}

void sub_18B6DF108(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_18B6E0DD0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_4_3()
{
  return objc_opt_class();
}

uint64_t OUTLINED_FUNCTION_13_0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;

  *(_QWORD *)(v2 - 40) = a2;
  return *(_QWORD *)(a1 + 80);
}

void OUTLINED_FUNCTION_15_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_20(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_18B6E169C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6E2A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id PRPinViewWithinView(void *a1, void *a2)
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
  void *v13;
  void *v14;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[5];

  v19[4] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  objc_msgSend(v4, "leadingAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintEqualToAnchor:", v17);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v16;
  objc_msgSend(v4, "trailingAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "constraintEqualToAnchor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = v7;
  objc_msgSend(v4, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[2] = v10;
  objc_msgSend(v4, "bottomAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bottomAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[3] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v14);
  return v14;
}

void sub_18B6E3FCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location,id a23)
{
  id *v23;
  id *v24;

  objc_destroyWeak(v24);
  objc_destroyWeak(v23);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a23);
  _Unwind_Resume(a1);
}

void sub_18B6E46F0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void sub_18B6E69E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_18B6E7224(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 176));
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_9_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

id PRDefaultTimeNumberingSystem()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = (void *)MEMORY[0x1E0D3EFB0];
  objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "localeIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "numberingSystemForLocaleID:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t PRTimeNumberingSystemRequiresLanguageTagging(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("deva")) & 1) != 0)
    v2 = 1;
  else
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("arabext"));

  return v2;
}

__CFString *PRTimeNumberingSystemLanguageTag(void *a1)
{
  id v1;
  void *v2;
  __CFString *v3;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("deva")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "preferredLocalizationsFromArray:", &unk_1E21DD188);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "firstObject");
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("arabext")))
  {
    v3 = CFSTR("ur");
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

const __CFString *PRFontNameForTimeFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoftLight")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Light");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRail")) & 1) != 0)
  {
    v2 = CFSTR(".SFRailNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")) & 1) != 0)
  {
    v2 = CFSTR(".NewYorkNumeric-Semibold");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYorkHeavy")) & 1) != 0)
  {
    v2 = CFSTR(".NewYorkNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFArabic")) & 1) != 0)
  {
    v2 = CFSTR(".SFArabic-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFArabicRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFArabicRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFHebrew")) & 1) != 0)
  {
    v2 = CFSTR(".SFHebrew-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFHebrewRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFHebrewRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNovember")) & 1) != 0)
  {
    v2 = CFSTR("NovemberIndia-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNovemberCondensed")) & 1) != 0)
  {
    v2 = CFSTR("NovemberIndia-CondensedMedium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierOctober")) & 1) != 0)
  {
    v2 = CFSTR("OctoberIndia-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFPro")) & 1) != 0)
  {
    v2 = CFSTR(".SFUI-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFUIRounded-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYorkAlpha")) & 1) != 0)
  {
    v2 = CFSTR(".NewYork-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSFCondensed")) & 1) != 0)
  {
    v2 = CFSTR(".SFUI-CondensedMedium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierPrivateSystemSoftHeavy")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierPrivateSystemRoundedHeavy")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Heavy");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierPrivateSystemStencilHeavy")))
  {
    v2 = CFSTR(".SFStencilNumeric-Heavy");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *PRTimeFontIdentifierForFontName(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFRoundedNumeric-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFRoundedNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierPrivateSystemRoundedHeavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFSoftNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSoft");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFSoftNumeric-Light")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSoftLight");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFSoftNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierPrivateSystemSoftHeavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".ADTSlabNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSlab");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFStencilNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierStencil");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFStencilNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierPrivateSystemStencilHeavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFRailNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierRail");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".NewYorkNumeric-Semibold")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierNewYork");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".NewYorkNumeric-Heavy")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierNewYorkHeavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFArabic-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFArabic");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFArabicRounded-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFArabicRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFHebrew-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFHebrew");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFHebrewRounded-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFHebrewRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NovemberIndia-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierNovember");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NovemberIndia-CondensedMedium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierNovemberCondensed");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("OctoberIndia-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierOctober");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFUI-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFPro");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("..SFCompactRounded-Regular")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFRounded");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR(".SFCompact-Medium")) & 1) != 0)
  {
    v2 = CFSTR("PRTimeFontIdentifierSFCondensed");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR(".NewYork-Medium")))
  {
    v2 = CFSTR("PRTimeFontIdentifierNewYorkAlpha");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id PRLocalizedDisplayNameForTimeFontIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  const __CFString *v4;
  void *v5;

  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")))
  {
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_ROUNDED");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")))
  {
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_SOFT");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")))
  {
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_SLAB");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")))
  {
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_STENCIL");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRail")))
  {
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_RAIL");
  }
  else
  {
    if (!objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
    {
      v5 = 0;
      goto LABEL_14;
    }
    PRBundle();
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = v2;
    v4 = CFSTR("TIME_FONT_NEWYORK");
  }
  objc_msgSend(v2, "localizedStringForKey:value:table:", v4, &stru_1E2186E08, CFSTR("PosterKit"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_14:
  return v5;
}

const __CFString *PRMinimumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Thin");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Thin");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Medium");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Thin");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
  {
    v2 = CFSTR(".NewYorkNumeric-Medium");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

const __CFString *PRMaximumVariableFontNameForTimeFontIdentifier(void *a1)
{
  id v1;
  const __CFString *v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierRounded")) & 1) != 0)
  {
    v2 = CFSTR(".SFRoundedNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSoft")) & 1) != 0)
  {
    v2 = CFSTR(".SFSoftNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierSlab")) & 1) != 0)
  {
    v2 = CFSTR(".ADTSlabNumeric-Heavy");
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierStencil")) & 1) != 0)
  {
    v2 = CFSTR(".SFStencilNumeric-Heavy");
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNewYork")))
  {
    v2 = CFSTR(".NewYorkNumeric-Heavy");
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id PRTimeFontIdentifiers(char a1)
{
  id v2;
  void *v3;

  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v3 = v2;
  if ((a1 & 1) == 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("PRTimeFontIdentifierSoft"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierSoftLight"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierRounded"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierStencil"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierNewYork"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierNewYorkHeavy"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierSlab"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierRail"));
  }
  if ((a1 & 2) == 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierPrivateSystemSoftHeavy"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierPrivateSystemRoundedHeavy"));
    objc_msgSend(v3, "addObject:", CFSTR("PRTimeFontIdentifierPrivateSystemStencilHeavy"));
  }
  return v3;
}

uint64_t PRTimeFontIsDownloadable(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNovember")) & 1) != 0
    || (objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierNovemberCondensed")) & 1) != 0)
  {
    v2 = 1;
  }
  else
  {
    v2 = objc_msgSend(v1, "isEqualToString:", CFSTR("PRTimeFontIdentifierOctober"));
  }

  return v2;
}

__CFString *PRStringForEditingAcceptButtonType(unint64_t a1)
{
  if (a1 > 2)
    return 0;
  else
    return off_1E2186298[a1];
}

uint64_t PREditingAcceptButtonTypeForString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("done")) & 1) != 0)
  {
    v2 = 0;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("add")) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("next")))
  {
    v2 = 2;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

void FBSceneSettingsApplyPRSceneSettings(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
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
  id v30;

  v30 = a1;
  v3 = a2;
  objc_msgSend(v30, "pui_role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v30, "pui_role");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_setRole:", v5);

  }
  objc_msgSend(v30, "pui_provider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v30, "pui_provider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_setProvider:", v7);

  }
  objc_msgSend(v30, "pui_previewIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v30, "pui_previewIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_setPreviewIdentifier:", v9);

  }
  objc_msgSend(v30, "pr_caseColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v30, "pr_caseColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setCaseColor:", v11);

  }
  objc_msgSend(v3, "pui_setUserInterfaceStyle:", objc_msgSend(v30, "pui_userInterfaceStyle"));
  objc_msgSend(v3, "pui_setDeviceOrientation:", objc_msgSend(v30, "pui_deviceOrientation"));
  objc_msgSend(v30, "pui_posterContents");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(v30, "pui_posterContents");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_setPosterContents:", v13);

  }
  objc_msgSend(v30, "pr_posterConfigurableOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v30, "pr_posterConfigurableOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterConfigurableOptions:", v15);

  }
  objc_msgSend(v30, "pr_posterConfiguredProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
  {
    objc_msgSend(v30, "pr_posterConfiguredProperties");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterConfiguredProperties:", v17);

  }
  objc_msgSend(v30, "pr_posterTitleStyleConfiguration");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v18)
  {
    objc_msgSend(v30, "pr_posterTitleStyleConfiguration");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterTitleStyleConfiguration:", v19);
  }
  else
  {
    objc_msgSend(v30, "pr_posterConfiguredProperties");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "titleStyleConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = v30;
    if (!v21)
      goto LABEL_20;
    objc_msgSend(v30, "pr_posterConfiguredProperties");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "titleStyleConfiguration");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterTitleStyleConfiguration:", v23);

  }
  v22 = v30;
LABEL_20:
  objc_msgSend(v22, "pr_posterAmbientConfiguration");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    objc_msgSend(v30, "pr_posterAmbientConfiguration");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterAmbientConfiguration:", v25);
LABEL_24:

    v28 = v30;
    goto LABEL_25;
  }
  objc_msgSend(v30, "pr_posterConfiguredProperties");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "ambientConfiguration");
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = v30;
  if (v27)
  {
    objc_msgSend(v30, "pr_posterConfiguredProperties");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "ambientConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pr_setPosterAmbientConfiguration:", v29);

    goto LABEL_24;
  }
LABEL_25:
  objc_msgSend(v3, "pr_setDepthEffectDisallowed:", objc_msgSend(v28, "pr_isDepthEffectDisallowed"));
  objc_msgSend(v3, "pr_setParallaxEnabled:", objc_msgSend(v30, "pr_isParallaxEnabled"));
  objc_msgSend(v3, "pr_setParallaxDisallowed:", objc_msgSend(v30, "pr_isParallaxDisallowed"));
  objc_msgSend(v3, "pui_setInlineComplicationConfigured:", objc_msgSend(v30, "pui_isInlineComplicationConfigured"));
  objc_msgSend(v3, "pui_setComplicationRowConfigured:", objc_msgSend(v30, "pui_isComplicationRowConfigured"));
  objc_msgSend(v3, "pui_setComplicationSidebarConfigured:", objc_msgSend(v30, "pui_isComplicationSidebarConfigured"));
  objc_msgSend(v3, "pr_setAlternateDateEnabled:", objc_msgSend(v30, "pr_isAlternateDateEnabled"));
  objc_msgSend(v3, "pui_setExtensionUserInteractionEnabled:", objc_msgSend(v30, "pui_isExtensionUserInteractionEnabled"));
  objc_msgSend(v3, "pui_setShowsHeaderElements:", objc_msgSend(v30, "pui_showsHeaderElements"));
  objc_msgSend(v3, "pui_setShowsComplications:", objc_msgSend(v30, "pui_showsComplications"));
  objc_msgSend(v3, "pui_setWallpaperObscured:", objc_msgSend(v30, "pui_isWallpaperObscured"));
  objc_msgSend(v3, "pui_setPosterBoundingShape:", objc_msgSend(v30, "pui_posterBoundingShape"));
  objc_msgSend(v30, "pr_horizontalTitleBoundingRect");
  objc_msgSend(v3, "pr_setHorizontalTitleBoundingRect:");
  objc_msgSend(v30, "pr_verticalTitleBoundingRect");
  objc_msgSend(v3, "pr_setVerticalTitleBoundingRect:");

}

void FBSceneSettingsApplyPRRenderingSceneSettings(void *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a1;
  v3 = a2;
  objc_msgSend(v3, "pui_setMode:", objc_msgSend(v7, "pui_mode"));
  objc_msgSend(v3, "pui_setContent:", objc_msgSend(v7, "pui_content"));
  objc_msgSend(v3, "pui_setPreviewContent:", objc_msgSend(v7, "pui_previewContent"));
  objc_msgSend(v3, "pui_setSnapshot:", objc_msgSend(v7, "pui_isSnapshot"));
  objc_msgSend(v3, "pui_setFloatingLayerSnapshot:", objc_msgSend(v7, "pui_isFloatingLayerSnapshot"));
  objc_msgSend(v7, "pr_unlockProgress");
  objc_msgSend(v3, "pr_setUnlockProgress:");
  objc_msgSend(v3, "pr_setWakeSourceIsSwipeToUnlock:", objc_msgSend(v7, "pr_wakeSourceIsSwipeToUnlock"));
  objc_msgSend(v3, "pui_setSignificantEventsCounter:", objc_msgSend(v7, "pui_significantEventsCounter"));
  objc_msgSend(v3, "pr_setTitleAlignment:", objc_msgSend(v7, "pr_titleAlignment"));
  objc_msgSend(v3, "pr_setAdjustedLuminance:", objc_msgSend(v7, "pr_adjustedLuminance"));
  objc_msgSend(v7, "pui_sceneAttachments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    objc_msgSend(v7, "pui_sceneAttachments");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pui_setSceneAttachments:", v6);

  }
  objc_msgSend(v3, "pui_setDeviceOrientation:", objc_msgSend(v7, "pui_deviceOrientation"));

}

void FBSceneSettingsApplyAMUIAmbientPresentationSettings(void *a1, void *a2)
{
  id v3;
  id v4;

  v4 = a1;
  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setAmbientPresented:", objc_msgSend(v4, "isAmbientPresented"));
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setAmbientDisplayStyle:", objc_msgSend(v4, "ambientDisplayStyle"));

}

const __CFString *PRErrorCodeToDebugDescription(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 8)
    return CFSTR("Unknown error.");
  else
    return off_1E2186350[a1 - 1];
}

uint64_t PRWidgetGridSupportsFamily(unint64_t a1)
{
  return (a1 < 0xC) & (0xC02u >> a1);
}

id PRIconGridSizeClassForWidgetFamily(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconGridSizeClassForCHSWidgetFamily:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id PRIconGridSizeClassSetForWidgetFamilyMask(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x1E0DAA488]);
  objc_msgSend(MEMORY[0x1E0DAA480], "pr_widgetDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithCHSWidgetFamilyMask:inDomain:", a1, v3);

  return v4;
}

uint64_t PRWidgetFamilyForIconGridSizeClass(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;

  v1 = (void *)MEMORY[0x1E0DAA480];
  v2 = a1;
  objc_msgSend(v1, "pr_widgetDomain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "chsWidgetFamilyForIconGridSizeClass:", v2);

  return v4;
}

double PRWidgetPlatterCornerRadius()
{
  void *v0;
  uint64_t v1;
  double result;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  result = 10.0;
  if ((v1 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    return 12.0;
  return result;
}

double PRSheetCornerRadius()
{
  return 30.0;
}

double PRSheetGrabberTopSpacing()
{
  return 12.0;
}

double PRDirectionalEdgeInsetsInsetRect(uint64_t a1, double a2, double a3, double a4, double a5, double a6, double a7, double a8, double a9)
{
  if (a1)
    a7 = a9;
  return a2 + a7;
}

void sub_18B6FA584(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

void sub_18B6FB828(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_18B6FCC80()
{
  uint64_t v0;
  id result;

  v0 = sub_18B728FA4();
  __swift_allocate_value_buffer(v0, qword_1EDFDA4D0);
  __swift_project_value_buffer(v0, (uint64_t)qword_1EDFDA4D0);
  result = PRLogCommon();
  if (result)
    return (id)sub_18B728FB0();
  __break(1u);
  return result;
}

void sub_18B6FCCE0(_QWORD *a1@<X8>)
{
  *a1 = 0;
}

_QWORD *sub_18B6FCCE8@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_18B6FCCFC(_QWORD *a1, uint64_t *a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_QWORD *sub_18B6FCD2C(_QWORD *result)
{
  _QWORD *v1;

  *v1 |= *result;
  return result;
}

_QWORD *sub_18B6FCD40(_QWORD *result)
{
  _QWORD *v1;

  *v1 &= *result;
  return result;
}

void sub_18B6FCD54(_DWORD *a1@<X8>)
{
  *a1 = 0;
}

_DWORD *sub_18B6FCD5C@<X0>(_DWORD *result@<X0>, int *a2@<X8>)
{
  _DWORD *v2;

  *a2 = *v2 & *result;
  return result;
}

BOOL sub_18B6FCD70(_DWORD *a1, int *a2)
{
  _DWORD *v2;
  int v3;
  int v4;

  v3 = *a2;
  v4 = *v2 & *a2;
  if (v4 != *a2)
    *v2 |= v3;
  *a1 = v3;
  return v4 != v3;
}

_DWORD *sub_18B6FCDA0(_DWORD *result)
{
  _DWORD *v1;

  *v1 |= *result;
  return result;
}

_DWORD *sub_18B6FCDB4(_DWORD *result)
{
  _DWORD *v1;

  *v1 &= *result;
  return result;
}

uint64_t sub_18B6FCDC8(uint64_t a1, uint64_t a2)
{
  return sub_18B6FCF10(a1, a2, (uint64_t (*)(uint64_t))MEMORY[0x1E0CB1940]);
}

uint64_t sub_18B6FCDD4(uint64_t a1, id *a2)
{
  uint64_t result;

  result = sub_18B729364();
  *a2 = 0;
  return result;
}

uint64_t sub_18B6FCE48(uint64_t a1, id *a2)
{
  char v3;

  v3 = sub_18B729370();
  *a2 = 0;
  return v3 & 1;
}

uint64_t sub_18B6FCEC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  sub_18B72937C();
  v2 = sub_18B729358();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18B6FCF04(uint64_t a1, uint64_t a2)
{
  return sub_18B6FCF10(a1, a2, MEMORY[0x1E0DEA950]);
}

uint64_t sub_18B6FCF10(uint64_t a1, uint64_t a2, uint64_t (*a3)(uint64_t))
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_18B72937C();
  v5 = a3(v4);
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t sub_18B6FCF4C()
{
  sub_18B72937C();
  sub_18B729388();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18B6FCF8C()
{
  uint64_t v0;

  sub_18B72937C();
  sub_18B7295B0();
  sub_18B729388();
  v0 = sub_18B7295D4();
  swift_bridgeObjectRelease();
  return v0;
}

void sub_18B6FCFFC(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

_QWORD *sub_18B6FD008@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

_DWORD *sub_18B6FD014@<X0>(_DWORD *result@<X0>, _DWORD *a2@<X8>)
{
  *a2 = *result;
  return result;
}

uint64_t sub_18B6FD020()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v5;

  v0 = sub_18B72937C();
  v2 = v1;
  if (v0 == sub_18B72937C() && v2 == v3)
    v5 = 1;
  else
    v5 = sub_18B729598();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5 & 1;
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

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

void type metadata accessor for Key(uint64_t a1)
{
  sub_18B6FD3C8(a1, (unint64_t *)&unk_1EDFD55E0);
}

uint64_t initializeBufferWithCopyOfBuffer for VerticalLabelView(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  swift_retain();
  return v3;
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

uint64_t sub_18B6FD154(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_18B6FD174(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)(result + 16) = 0;
    *(_QWORD *)(result + 24) = 0;
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 32) = v3;
  return result;
}

void type metadata accessor for CGRect(uint64_t a1)
{
  sub_18B6FD3C8(a1, &qword_1EDFD8CD8);
}

uint64_t sub_18B6FD1B4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v2;
  uint64_t result;

  v2 = sub_18B729358();
  result = swift_bridgeObjectRelease();
  *a1 = v2;
  return result;
}

uint64_t sub_18B6FD1F8@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18B72937C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_18B6FD220()
{
  sub_18B6FD2D4((unint64_t *)&qword_1EDFD55C8, (uint64_t)&unk_18B73B4A8);
  sub_18B6FD2D4((unint64_t *)&unk_1EDFD8CF0, (uint64_t)&unk_18B73B3FC);
  return sub_18B729574();
}

uint64_t sub_18B6FD28C()
{
  return sub_18B6FD2D4(&qword_1EDFD8CE0, (uint64_t)&unk_18B73B3C0);
}

uint64_t sub_18B6FD2B0()
{
  return sub_18B6FD2D4(&qword_1EDFD8CE8, (uint64_t)&unk_18B73B394);
}

uint64_t sub_18B6FD2D4(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x18D77C8E0](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18B6FD314()
{
  return sub_18B6FD2D4((unint64_t *)&unk_1EDFD55D0, (uint64_t)&unk_18B73B430);
}

void type metadata accessor for CTFont(uint64_t a1)
{
  sub_18B6FD3C8(a1, (unint64_t *)&unk_1EDFD5618);
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

uint64_t sub_18B6FD358(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 16))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_18B6FD378(uint64_t result, int a2, int a3)
{
  char v3;

  if (a2)
  {
    *(_QWORD *)result = (a2 - 1);
    *(_QWORD *)(result + 8) = 0;
    if (!a3)
      return result;
    v3 = 1;
  }
  else
  {
    if (!a3)
      return result;
    v3 = 0;
  }
  *(_BYTE *)(result + 16) = v3;
  return result;
}

void type metadata accessor for CGSize(uint64_t a1)
{
  sub_18B6FD3C8(a1, &qword_1EDFD8D00);
}

void type metadata accessor for CGPoint(uint64_t a1)
{
  sub_18B6FD3C8(a1, &qword_1EDFD8D08);
}

void sub_18B6FD3C8(uint64_t a1, unint64_t *a2)
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

uint64_t AmbientEditingTitledViewController.delegate.getter()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  return MEMORY[0x18D77C9B8](v1);
}

uint64_t AmbientEditingTitledViewController.delegate.setter()
{
  swift_beginAccess();
  swift_unknownObjectWeakAssign();
  return swift_unknownObjectRelease();
}

void (*AmbientEditingTitledViewController.delegate.modify(_QWORD *a1))(void **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  v3[4] = v1;
  v3[5] = v4;
  v5 = v1 + v4;
  swift_beginAccess();
  v3[3] = MEMORY[0x18D77C9B8](v5);
  return sub_18B6FD5C0;
}

void sub_18B6FD5C0(void **a1, char a2)
{
  void *v3;

  v3 = *a1;
  swift_unknownObjectWeakAssign();
  if ((a2 & 1) != 0)
  {
    swift_unknownObjectRelease();
    swift_endAccess();
  }
  else
  {
    swift_endAccess();
    swift_unknownObjectRelease();
  }
  free(v3);
}

uint64_t sub_18B6FD62C()
{
  return sub_18B6FD654();
}

uint64_t sub_18B6FD640()
{
  return sub_18B6FD654();
}

uint64_t sub_18B6FD654()
{
  uint64_t v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B72940C();
  swift_release();
  swift_release();
  return v1;
}

id AmbientEditingTitledViewController.__allocating_init(contentViewController:)(void *a1)
{
  objc_class *v1;
  id v3;

  v3 = objc_allocWithZone(v1);
  return AmbientEditingTitledViewController.init(contentViewController:)(a1);
}

id AmbientEditingTitledViewController.init(contentViewController:)(void *a1)
{
  void *v1;
  void *v2;
  objc_class *ObjectType;
  char *v5;
  id v6;
  id v7;
  double v8;
  double v9;
  double v10;
  BOOL v11;
  double v12;
  id v13;
  id v14;
  objc_super v16;

  v2 = v1;
  ObjectType = (objc_class *)swift_getObjectType();
  swift_unknownObjectWeakInit();
  sub_18B6FEB68(0, &qword_1ED1B9330);
  v5 = v2;
  sub_18B729424();
  sub_18B6FEB68(0, &qword_1ED1B9358);
  sub_18B729424();
  *(_QWORD *)&v5[OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController] = a1;
  v6 = a1;

  v16.receiver = v5;
  v16.super_class = ObjectType;
  v7 = objc_msgSendSuper2(&v16, sel_initWithNibName_bundle_, 0, 0);
  objc_msgSend(v6, sel_preferredContentSize);
  if (v8 <= 100.0)
    v8 = 100.0;
  v10 = v9 + 40.0;
  v11 = v9 > 50.0;
  v12 = 90.0;
  if (v11)
    v12 = v10;
  objc_msgSend(v7, sel_setPreferredContentSize_, v8, v12);
  v13 = v7;
  v14 = objc_msgSend(v6, sel_title);
  objc_msgSend(v13, sel_setTitle_, v14);

  return v13;
}

Swift::Void __swiftcall AmbientEditingTitledViewController.loadView()()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  double v15;
  double v16;
  id v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  uint64_t v24;
  void *v25;
  char *v26;
  void *v27;
  id v28;
  void *v29;
  double v30;
  double v31;
  id v32;
  double v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  id v63;
  id v64;
  id v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  id v73;
  id v74;
  id v75;
  id v76;
  void *v77;
  id v78;
  id v79;
  char *v80;
  id v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v2 = (void *)sub_18B729358();
  v3 = objc_msgSend((id)objc_opt_self(), sel_materialViewWithRecipeNamed_, v2);

  if (!v3)
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F10]), sel_init);
  v4 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v4, sel_setCornerRadius_, 15.0);

  v5 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v5, sel_setCornerCurve_, *MEMORY[0x1E0CD2A68]);

  v6 = objc_msgSend(v3, sel_layer);
  objc_msgSend(v6, sel_setMaskedCorners_, 3);

  objc_msgSend(v3, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, sel_addSubview_, v3);
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  v8 = objc_msgSend(v0, sel_title);
  objc_msgSend(v7, sel_setText_, v8);

  v9 = objc_msgSend((id)objc_opt_self(), sel_preferredFontDescriptorWithTextStyle_, *MEMORY[0x1E0DC4A88]);
  v10 = objc_msgSend(v9, sel_fontDescriptorWithSymbolicTraits_, 2);
  if (!v10)
    v10 = v9;
  v85 = v9;
  v84 = v10;
  v11 = objc_msgSend((id)objc_opt_self(), sel_fontWithDescriptor_size_, v10, 0.0);
  objc_msgSend(v7, sel_setFont_, v11);

  v12 = (void *)objc_opt_self();
  v13 = objc_msgSend(v12, sel_whiteColor);
  objc_msgSend(v7, sel_setTextColor_, v13);

  objc_msgSend(v7, sel_setNumberOfLines_, 1);
  objc_msgSend(v7, sel_setAdjustsFontForContentSizeCategory_, 1);
  v14 = *MEMORY[0x1E0DC48F0];
  objc_msgSend(v7, sel_setMaximumContentSizeCategory_, *MEMORY[0x1E0DC48F0]);
  objc_msgSend(v7, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  LODWORD(v15) = 1148846080;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 1, v15);
  LODWORD(v16) = 1132068864;
  objc_msgSend(v7, sel_setContentCompressionResistancePriority_forAxis_, 0, v16);
  objc_msgSend(v1, sel_addSubview_, v7);
  swift_getKeyPath();
  swift_getKeyPath();
  v17 = v7;
  v18 = v0;
  sub_18B729418();
  v19 = objc_msgSend(v12, sel_whiteColor);
  v20 = objc_msgSend((id)objc_opt_self(), sel_configurationWithHierarchicalColor_, v19);

  v21 = (void *)sub_18B729358();
  v22 = objc_msgSend((id)objc_opt_self(), sel_systemImageNamed_, v21);

  v83 = v20;
  v23 = objc_msgSend(v22, sel_imageByApplyingSymbolConfiguration_, v20);

  sub_18B6FEB68(0, &qword_1ED1B9358);
  sub_18B6FEB68(0, &qword_1EDFD8D80);
  v24 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v82 = v23;
  sub_18B729478();
  v25 = (void *)sub_18B729484();
  objc_msgSend(v25, sel_setMaximumContentSizeCategory_, v14, 0, 0, 0, sub_18B6FEAD8, v24);
  objc_msgSend(v25, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
  objc_msgSend(v1, (SEL)&selRef_complicationsContainerView, v25);
  swift_getKeyPath();
  swift_getKeyPath();
  v26 = (char *)v18;
  v86 = v25;
  sub_18B729418();
  v27 = *(void **)&v26[OBJC_IVAR___PRAmbientEditingTitledViewController_contentViewController];
  objc_msgSend(v27, sel_willMoveToParentViewController_, v26);
  objc_msgSend(v26, sel_addChildViewController_, v27);
  v28 = objc_msgSend(v27, sel_view);
  if (v28)
  {
    v29 = v28;
    objc_msgSend(v28, sel_setTranslatesAutoresizingMaskIntoConstraints_, 0);
    objc_msgSend(v1, (SEL)&selRef_complicationsContainerView, v29);
    objc_msgSend(v27, sel_didMoveToParentViewController_, v26);
    objc_msgSend(v27, sel_preferredContentSize);
    v31 = v30;
    v32 = objc_msgSend(v29, sel_heightAnchor);
    v78 = objc_msgSend(v32, sel_constraintEqualToConstant_, v31);

    LODWORD(v33) = 1144750080;
    objc_msgSend(v78, sel_setPriority_, v33);
    v81 = (id)objc_opt_self();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8D88);
    v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_18B73B520;
    v80 = v26;
    v35 = objc_msgSend(v17, sel_centerXAnchor);
    v36 = objc_msgSend(v1, sel_centerXAnchor);
    v37 = objc_msgSend(v35, sel_constraintEqualToAnchor_, v36);

    *(_QWORD *)(v34 + 32) = v37;
    v38 = objc_msgSend(v17, sel_topAnchor);
    v39 = objc_msgSend(v1, (SEL)&selRef_shouldFixTitleBetweenTransitionFromTitleStyleConfiguration_toTitleStyleConfiguration_extensionBundleURL_+ 4);
    v40 = objc_msgSend(v38, sel_constraintEqualToAnchor_constant_, v39, 12.0);

    *(_QWORD *)(v34 + 40) = v40;
    v41 = objc_msgSend(v17, sel_trailingAnchor);
    v42 = objc_msgSend(v86, sel_leadingAnchor);
    v43 = objc_msgSend(v41, sel_constraintLessThanOrEqualToAnchor_constant_, v42, -8.0);

    *(_QWORD *)(v34 + 48) = v43;
    v44 = objc_msgSend(v17, sel_leadingAnchor);
    v45 = objc_msgSend(v1, sel_leadingAnchor);
    v46 = objc_msgSend(v44, sel_constraintGreaterThanOrEqualToSystemSpacingAfterAnchor_multiplier_, v45, 1.0);

    *(_QWORD *)(v34 + 56) = v46;
    v47 = objc_msgSend(v86, sel_topAnchor);
    v48 = objc_msgSend(v1, sel_topAnchor);
    v49 = objc_msgSend(v47, sel_constraintEqualToSystemSpacingBelowAnchor_multiplier_, v48, 1.0);

    *(_QWORD *)(v34 + 64) = v49;
    v50 = objc_msgSend(v1, sel_trailingAnchor);
    v51 = objc_msgSend(v86, sel_trailingAnchor);
    v52 = objc_msgSend(v50, sel_constraintEqualToSystemSpacingAfterAnchor_multiplier_, v51, 1.0);

    *(_QWORD *)(v34 + 72) = v52;
    *(_QWORD *)(v34 + 80) = v78;
    v79 = v78;
    v53 = objc_msgSend(v29, sel_topAnchor);
    v54 = objc_msgSend(v17, sel_bottomAnchor);
    v55 = objc_msgSend(v53, sel_constraintGreaterThanOrEqualToSystemSpacingBelowAnchor_multiplier_, v54, 1.0);

    *(_QWORD *)(v34 + 88) = v55;
    v56 = objc_msgSend(v29, sel_leftAnchor);
    v57 = objc_msgSend(v1, sel_leftAnchor);
    v58 = objc_msgSend(v56, sel_constraintEqualToAnchor_, v57);

    *(_QWORD *)(v34 + 96) = v58;
    v59 = objc_msgSend(v29, sel_rightAnchor);
    v60 = objc_msgSend(v1, sel_rightAnchor);
    v61 = objc_msgSend(v59, sel_constraintEqualToAnchor_, v60);

    *(_QWORD *)(v34 + 104) = v61;
    v62 = objc_msgSend(v29, sel_bottomAnchor);
    v63 = objc_msgSend(v1, sel_bottomAnchor);
    v64 = objc_msgSend(v62, sel_constraintEqualToAnchor_, v63);

    *(_QWORD *)(v34 + 112) = v64;
    v65 = objc_msgSend(v3, sel_leftAnchor);
    v66 = objc_msgSend(v1, sel_leftAnchor);
    v67 = objc_msgSend(v65, sel_constraintEqualToAnchor_, v66);

    *(_QWORD *)(v34 + 120) = v67;
    v68 = objc_msgSend(v3, sel_rightAnchor);
    v69 = objc_msgSend(v1, sel_rightAnchor);
    v70 = objc_msgSend(v68, sel_constraintEqualToAnchor_, v69);

    *(_QWORD *)(v34 + 128) = v70;
    v71 = objc_msgSend(v3, sel_bottomAnchor);
    v72 = objc_msgSend(v1, sel_bottomAnchor);
    v73 = objc_msgSend(v71, sel_constraintEqualToAnchor_, v72);

    *(_QWORD *)(v34 + 136) = v73;
    v74 = objc_msgSend(v3, sel_topAnchor);
    v75 = objc_msgSend(v1, sel_topAnchor);
    v76 = objc_msgSend(v74, sel_constraintEqualToAnchor_, v75);

    *(_QWORD *)(v34 + 144) = v76;
    sub_18B7293E8();
    sub_18B6FEB68(0, &qword_1EDFD8D90);
    v77 = (void *)sub_18B7293DC();
    swift_bridgeObjectRelease();
    objc_msgSend(v81, sel_activateConstraints_, v77);

    objc_msgSend(v80, sel_setView_, v1);
  }
  else
  {
    sub_18B729538();
    __break(1u);
  }
}

void sub_18B6FE6A8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;

  v2 = a2 + 16;
  swift_beginAccess();
  v3 = MEMORY[0x18D77C9B8](v2);
  if (v3)
  {
    v4 = (void *)v3;
    v5 = v3 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
    swift_beginAccess();
    v6 = (void *)MEMORY[0x18D77C9B8](v5);
    if (v6)
    {
      objc_msgSend(v6, sel_ambientEditingTitledViewControllerWantsToClose_, v4);

      swift_unknownObjectRelease();
    }
    else
    {

    }
  }
}

id AmbientEditingTitledViewController.__allocating_init(nibName:bundle:)(uint64_t a1, uint64_t a2, void *a3)
{
  objc_class *v3;
  objc_class *v4;
  void *v6;
  id v7;

  v4 = v3;
  if (a2)
  {
    v6 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = 0;
  }
  v7 = objc_msgSend(objc_allocWithZone(v4), sel_initWithNibName_bundle_, v6, a3);

  return v7;
}

void AmbientEditingTitledViewController.init(nibName:bundle:)()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id AmbientEditingTitledViewController.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_18B6FE988@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B72940C();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18B6FEA00(void **a1, void **a2)
{
  void *v2;
  void *v3;
  id v4;
  id v5;

  v2 = *a1;
  v3 = *a2;
  swift_getKeyPath();
  swift_getKeyPath();
  v4 = v2;
  v5 = v3;
  return sub_18B729418();
}

uint64_t sub_18B6FEA6C@<X0>(_QWORD *a1@<X8>)
{
  return sub_18B6FE988(a1);
}

uint64_t sub_18B6FEA90(void **a1, void **a2)
{
  return sub_18B6FEA00(a1, a2);
}

uint64_t sub_18B6FEAB4()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_18B6FEAD8(uint64_t a1)
{
  uint64_t v1;

  sub_18B6FE6A8(a1, v1);
}

uint64_t sub_18B6FEAE0@<X0>(_QWORD *a1@<X8>)
{
  return sub_18B6FE988(a1);
}

uint64_t sub_18B6FEB04(void **a1, void **a2)
{
  return sub_18B6FEA00(a1, a2);
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D77C8C8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_18B6FEB68(uint64_t a1, unint64_t *a2)
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

uint64_t sub_18B6FEBA0@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1 + OBJC_IVAR___PRAmbientEditingTitledViewController_delegate;
  swift_beginAccess();
  result = MEMORY[0x18D77C9B8](v3);
  *a2 = result;
  return result;
}

uint64_t sub_18B6FEBF4()
{
  swift_beginAccess();
  return swift_unknownObjectWeakAssign();
}

uint64_t sub_18B6FEC48()
{
  return type metadata accessor for AmbientEditingTitledViewController();
}

uint64_t type metadata accessor for AmbientEditingTitledViewController()
{
  uint64_t result;

  result = qword_1ED1B9320;
  if (!qword_1ED1B9320)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18B6FEC8C()
{
  unint64_t v0;
  unint64_t v1;

  sub_18B6FED6C(319, &qword_1ED1B9338, &qword_1ED1B9330);
  if (v0 <= 0x3F)
  {
    sub_18B6FED6C(319, &qword_1ED1B9350, &qword_1ED1B9358);
    if (v1 <= 0x3F)
      swift_updateClassMetadata2();
  }
}

uint64_t method lookup function for AmbientEditingTitledViewController()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of AmbientEditingTitledViewController.__allocating_init(contentViewController:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

void sub_18B6FED6C(uint64_t a1, unint64_t *a2, unint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    sub_18B6FEB68(255, a3);
    v4 = sub_18B729430();
    if (!v5)
      atomic_store(v4, a2);
  }
}

uint64_t sub_18B6FEDC0(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_18B6FEDE4@<X0>(uint64_t a1@<X8>)
{
  __int128 *v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char v13;
  char v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;

  v21 = a1;
  v2 = sub_18B72922C();
  v19 = *(_QWORD *)(v2 - 8);
  v20 = v2;
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v18 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = *v1;
  v23 = *((_QWORD *)v1 + 2);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E18);
  sub_18B7292D4();
  v22 = v25;
  sub_18B6FFABC();
  v5 = sub_18B72925C();
  v7 = v6;
  v9 = v8 & 1;
  v22 = *(__int128 *)((char *)v1 + 24);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E20);
  sub_18B7292D4();
  sub_18B7291FC();
  v10 = sub_18B729244();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  swift_release();
  sub_18B6FFB00(v5, v7, v9);
  swift_bridgeObjectRelease();
  *(_QWORD *)&v22 = v10;
  *((_QWORD *)&v22 + 1) = v12;
  LOBYTE(v23) = v14 & 1;
  v24 = v16;
  sub_18B729208();
  sub_18B729280();
  (*(void (**)(char *, uint64_t))(v19 + 8))(v4, v20);
  sub_18B6FFB00(v22, *((uint64_t *)&v22 + 1), v23);
  return swift_bridgeObjectRelease();
}

uint64_t sub_18B6FEF8C()
{
  return sub_18B729298();
}

uint64_t sub_18B6FEFA4@<X0>(uint64_t a1@<X8>)
{
  return sub_18B6FEDE4(a1);
}

uint64_t sub_18B6FEFDC()
{
  sub_18B7295B0();
  sub_18B72946C();
  sub_18B7295C8();
  return sub_18B7295D4();
}

uint64_t sub_18B6FF038()
{
  sub_18B72946C();
  return sub_18B7295C8();
}

uint64_t sub_18B6FF078()
{
  sub_18B7295B0();
  sub_18B72946C();
  sub_18B7295C8();
  return sub_18B7295D4();
}

uint64_t sub_18B6FF0D0(uint64_t a1, uint64_t a2)
{
  double v2;
  double v3;

  v2 = *(double *)(a1 + 8);
  v3 = *(double *)(a2 + 8);
  sub_18B6FEB68(0, qword_1EDFD4E40);
  return sub_18B729460() & (v2 == v3);
}

void *sub_18B6FF138()
{
  void *result;

  result = (void *)sub_18B70B104(MEMORY[0x1E0DEE9D8]);
  off_1EDFD4E30 = result;
  return result;
}

id VerticalLabel.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id VerticalLabel.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VerticalLabel();
  return objc_msgSendSuper2(&v2, sel_init);
}

id VerticalLabel.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for VerticalLabel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

id _s9PosterKit13VerticalLabelC17maximumTextLength3forSi12CoreGraphics7CGFloatV_tFZ_0(double a1)
{
  id v2;
  uint64_t v3;
  id v4;
  _QWORD *v5;
  id v6;
  unint64_t v7;
  char v8;
  uint64_t v9;
  id v10;
  char v11;
  uint64_t v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  id v17;
  void *v18;
  id result;
  void *v20;
  void *v21;
  id v22;
  double v23;
  id v24;
  uint64_t v25;
  char isUniquelyReferenced_nonNull_native;
  _QWORD *v27;
  id v28;
  unint64_t v29;
  char v30;
  void *v31;

  v2 = objc_msgSend((id)objc_opt_self(), sel_pr_fontWithTimeFontIdentifier_forRole_, CFSTR("PRTimeFontIdentifierSFPro"), CFSTR("PRPosterRoleIncomingCall"));
  if (!v2)
    return 0;
  v3 = qword_1EDFD4E38;
  v4 = v2;
  if (v3 != -1)
    goto LABEL_29;
LABEL_3:
  swift_beginAccess();
  v5 = off_1EDFD4E30;
  if (*((_QWORD *)off_1EDFD4E30 + 2))
  {
    v6 = v4;
    v7 = sub_18B70E8CC((uint64_t)v6, a1);
    if ((v8 & 1) != 0)
    {
      v9 = *(_QWORD *)(v5[7] + 8 * v7);
      swift_endAccess();

      return (id)v9;
    }

  }
  swift_endAccess();
  while (1)
  {
    swift_beginAccess();
    if (!*((_QWORD *)off_1EDFD4E30 + 2))
      goto LABEL_13;
    v10 = v4;
    sub_18B70E8CC((uint64_t)v10, a1);
    if ((v11 & 1) != 0)
    {
      swift_endAccess();

LABEL_20:
      swift_beginAccess();
      v27 = off_1EDFD4E30;
      if (*((_QWORD *)off_1EDFD4E30 + 2))
      {
        v28 = v4;
        v29 = sub_18B70E8CC((uint64_t)v28, a1);
        if ((v30 & 1) != 0)
        {
          v9 = *(_QWORD *)(v27[7] + 8 * v29);
          swift_endAccess();

LABEL_26:
          swift_bridgeObjectRelease();
          return (id)v9;
        }
        swift_endAccess();

      }
      else
      {
        swift_endAccess();
      }
      v9 = 0;
      goto LABEL_26;
    }

LABEL_13:
    swift_endAccess();
    swift_bridgeObjectRetain();
    v12 = sub_18B729394();
    swift_bridgeObjectRelease();
    if (v12 > 9)
      goto LABEL_20;
    v13 = (void *)objc_opt_self();
    swift_bridgeObjectRetain();
    v14 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
    objc_msgSend(v13, sel_idealEmphasizedFontSizeForName_usingLayout_, v14, 1);
    v16 = v15;

    swift_bridgeObjectRetain();
    objc_msgSend(v4, sel_fontWithSize_, v16);
    sub_18B7292C8();
    sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
    sub_18B7292C8();
    v17 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E10));
    v18 = (void *)sub_18B729130();
    result = objc_msgSend(v18, sel_view);
    if (!result)
      break;
    v20 = result;
    objc_msgSend(result, sel_setNeedsLayout);

    result = objc_msgSend(v18, sel_view);
    if (!result)
      goto LABEL_31;
    v21 = result;
    objc_msgSend(result, sel_layoutIfNeeded);

    v22 = objc_msgSend((id)objc_opt_self(), sel_mainScreen);
    objc_msgSend(v22, sel_bounds);

    sub_18B72910C();
    if (v23 <= a1)
    {
      sub_18B7293A0();

    }
    else
    {
      v24 = v4;
      swift_bridgeObjectRetain();
      v25 = sub_18B729394();
      swift_bridgeObjectRelease();
      if (__OFSUB__(v25, 1))
      {
        __break(1u);
LABEL_29:
        swift_once();
        goto LABEL_3;
      }
      swift_beginAccess();
      isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
      v31 = off_1EDFD4E30;
      off_1EDFD4E30 = (_UNKNOWN *)0x8000000000000000;
      sub_18B70FF4C(v25 - 1, v24, isUniquelyReferenced_nonNull_native, a1);
      off_1EDFD4E30 = v31;

      swift_bridgeObjectRelease();
      swift_endAccess();

    }
  }
  __break(1u);
LABEL_31:
  __break(1u);
  return result;
}

uint64_t type metadata accessor for VerticalLabel()
{
  return objc_opt_self();
}

_QWORD *initializeBufferWithCopyOfBuffer for VerticalLabel.CacheConfig(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v5 = v3;
  return a1;
}

void destroy for VerticalLabel.CacheConfig(id *a1)
{

}

uint64_t assignWithCopy for VerticalLabel.CacheConfig(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  return a1;
}

uint64_t assignWithTake for VerticalLabel.CacheConfig(uint64_t a1, _QWORD *a2)
{
  void *v4;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  *(_QWORD *)(a1 + 8) = a2[1];
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalLabel.CacheConfig(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for VerticalLabel.CacheConfig(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 16) = 1;
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
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for VerticalLabel.CacheConfig()
{
  return &type metadata for VerticalLabel.CacheConfig;
}

uint64_t destroy for VerticalLabelView(uint64_t a1)
{
  swift_bridgeObjectRelease();
  swift_release();

  return swift_release();
}

_QWORD *initializeWithCopy for VerticalLabelView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = (void *)a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_retain();
  v5 = v4;
  swift_retain();
  return a1;
}

_QWORD *assignWithCopy for VerticalLabelView(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  swift_retain();
  swift_release();
  v4 = (void *)a2[3];
  v5 = (void *)a1[3];
  a1[3] = v4;
  v6 = v4;

  a1[4] = a2[4];
  swift_retain();
  swift_release();
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

uint64_t assignWithTake for VerticalLabelView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  swift_release();

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for VerticalLabelView(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for VerticalLabelView(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for VerticalLabelView()
{
  return &type metadata for VerticalLabelView;
}

uint64_t sub_18B6FFA64()
{
  return swift_getOpaqueTypeConformance2();
}

unint64_t sub_18B6FFA78()
{
  unint64_t result;

  result = qword_1EDFD4E28;
  if (!qword_1EDFD4E28)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73B6D4, &type metadata for VerticalLabel.CacheConfig);
    atomic_store(result, (unint64_t *)&qword_1EDFD4E28);
  }
  return result;
}

unint64_t sub_18B6FFABC()
{
  unint64_t result;

  result = qword_1EDFD55A8;
  if (!qword_1EDFD55A8)
  {
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1EDFD55A8);
  }
  return result;
}

uint64_t sub_18B6FFB00(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

uint64_t sub_18B6FFB10()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18B6FFB54(uint64_t a1)
{
  return sub_18B6FFB9C(a1, qword_1ED1B9838);
}

uint64_t sub_18B6FFB78(uint64_t a1)
{
  return sub_18B6FFB9C(a1, qword_1ED1B9820);
}

uint64_t sub_18B6FFB9C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_18B728F80();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_18B728F74();
}

uint64_t PRRenderingConfiguration.role.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18B700178(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAA5B8], a1);
}

uint64_t PRRenderingConfiguration.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = swift_allocObject();
  v5 = OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role;
  if (qword_1ED1B9280 != -1)
    swift_once();
  v6 = sub_18B728F80();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1B9838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v4 + v5, v7, v6);
  v8 = (_QWORD *)(v4 + OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory);
  *v8 = a1;
  v8[1] = a2;
  return v4;
}

uint64_t PRRenderingConfiguration.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role;
  if (qword_1ED1B9280 != -1)
    swift_once();
  v6 = sub_18B728F80();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1B9838);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v2 + v5, v7, v6);
  v8 = (_QWORD *)(v2 + OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory);
  *v8 = a1;
  v8[1] = a2;
  return v2;
}

id sub_18B6FFD74()
{
  return sub_18B6FFF60(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory, (Class *)off_1E2181748);
}

uint64_t PRRenderingConfiguration.deinit()
{
  return sub_18B6FFFCC(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role);
}

uint64_t PRRenderingConfiguration.__deallocating_deinit()
{
  return sub_18B70003C(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role);
}

uint64_t sub_18B6FFDB0@<X0>(uint64_t a1@<X8>)
{
  return sub_18B7000B0(&OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration_role, a1);
}

id sub_18B6FFDBC(uint64_t a1, uint64_t a2)
{
  return sub_18B700108(a1, a2, &OBJC_IVAR____TtC9PosterKit24PRRenderingConfiguration__delegateFactory, (Class *)off_1E2181748);
}

uint64_t PREditingConfiguration.role.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18B700178(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAA5B8], a1);
}

uint64_t PREditingConfiguration.__allocating_init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v4 = swift_allocObject();
  v5 = OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role;
  if (qword_1ED1B9278 != -1)
    swift_once();
  v6 = sub_18B728F80();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1B9820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v4 + v5, v7, v6);
  v8 = (_QWORD *)(v4 + OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory);
  *v8 = a1;
  v8[1] = a2;
  return v4;
}

uint64_t PREditingConfiguration.init(_:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v5 = OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role;
  if (qword_1ED1B9278 != -1)
    swift_once();
  v6 = sub_18B728F80();
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1ED1B9820);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(v2 + v5, v7, v6);
  v8 = (_QWORD *)(v2 + OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory);
  *v8 = a1;
  v8[1] = a2;
  return v2;
}

id sub_18B6FFF4C()
{
  return sub_18B6FFF60(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory, (Class *)off_1E2181338);
}

id sub_18B6FFF60(_QWORD *a1, Class *a2)
{
  uint64_t v2;
  id v3;

  v3 = objc_msgSend(objc_allocWithZone(*a2), sel_initWithDelegate_, (*(uint64_t (**)(void))(v2 + *a1))());
  swift_unknownObjectRelease();
  return v3;
}

uint64_t PREditingConfiguration.deinit()
{
  return sub_18B6FFFCC(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role);
}

uint64_t sub_18B6FFFCC(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1 + *a1;
  v3 = sub_18B728F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  return v1;
}

uint64_t PREditingConfiguration.__deallocating_deinit()
{
  return sub_18B70003C(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role);
}

uint64_t sub_18B70003C(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v2 = v1 + *a1;
  v3 = sub_18B728F80();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(v2, v3);
  swift_release();
  return swift_deallocClassInstance();
}

uint64_t sub_18B7000A4@<X0>(uint64_t a1@<X8>)
{
  return sub_18B7000B0(&OBJC_IVAR____TtC9PosterKit22PREditingConfiguration_role, a1);
}

uint64_t sub_18B7000B0@<X0>(_QWORD *a1@<X2>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2 + *a1;
  v5 = sub_18B728F80();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, v4, v5);
}

id sub_18B7000F4(uint64_t a1, uint64_t a2)
{
  return sub_18B700108(a1, a2, &OBJC_IVAR____TtC9PosterKit22PREditingConfiguration__delegateFactory, (Class *)off_1E2181338);
}

id sub_18B700108(uint64_t a1, uint64_t a2, _QWORD *a3, Class *a4)
{
  _QWORD *v4;
  id v5;

  v5 = objc_msgSend(objc_allocWithZone(*a4), sel_initWithDelegate_, (*(uint64_t (**)(void))(*v4 + *a3))());
  swift_unknownObjectRelease();
  return v5;
}

uint64_t PRProviderConfiguration.content.getter@<X0>(uint64_t a1@<X8>)
{
  return sub_18B700178(&qword_1ED1B9860, (uint64_t (*)(_QWORD))MEMORY[0x1E0CAA580], a1);
}

uint64_t sub_18B700178@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X8>)
{
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;

  v5 = v3 + *a1;
  v6 = a2(0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a3, v5, v6);
}

uint64_t PRProviderConfiguration.__allocating_init(updatingDelegate:content:)(uint64_t a1)
{
  uint64_t v2;

  swift_allocObject();
  v2 = sub_18B700454(a1);
  swift_unknownObjectRelease();
  swift_release();
  return v2;
}

uint64_t PRProviderConfiguration.init(updatingDelegate:content:)(uint64_t a1)
{
  uint64_t v1;

  v1 = sub_18B700454(a1);
  swift_unknownObjectRelease();
  swift_release();
  return v1;
}

uint64_t PRProviderConfiguration.__allocating_init(content:)()
{
  uint64_t v0;

  v0 = swift_allocObject();
  PRProviderConfiguration.init(content:)();
  return v0;
}

uint64_t PRProviderConfiguration.init(content:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v6;

  v1 = sub_18B728F68();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B728F5C();
  (*(void (**)(uint64_t, char *, uint64_t))(v2 + 32))(v0 + qword_1ED1B9860, v4, v1);
  *(_QWORD *)(v0 + qword_1ED1B9410) = 0;
  return v0;
}

id sub_18B700368(uint64_t a1)
{
  uint64_t v1;
  id result;

  result = *(id *)(v1 + qword_1ED1B9410);
  if (result)
    return objc_msgSend(result, sel_shouldAcceptConnection_, a1);
  return result;
}

uint64_t PRProviderConfiguration.deinit()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0 + qword_1ED1B9860;
  v2 = sub_18B728F68();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);

  return v0;
}

uint64_t PRProviderConfiguration.__deallocating_deinit()
{
  PRProviderConfiguration.deinit();
  return swift_deallocClassInstance();
}

unint64_t sub_18B700410(uint64_t a1)
{
  return (unint64_t)sub_18B700368(a1) & 1;
}

uint64_t sub_18B700434@<X0>(uint64_t a1@<X8>)
{
  return PRProviderConfiguration.content.getter(a1);
}

uint64_t sub_18B700454(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v9;

  v3 = sub_18B728F68();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_18B728F5C();
  (*(void (**)(uint64_t, char *, uint64_t))(v4 + 32))(v1 + qword_1ED1B9860, v6, v3);
  v7 = objc_msgSend(objc_allocWithZone((Class)PRUpdater), sel_initWithDelegate_, a1);
  *(_QWORD *)(v1 + qword_1ED1B9410) = v7;
  return v1;
}

uint64_t sub_18B700544(_QWORD *a1, uint64_t a2)
{
  uint64_t result;

  a1[1] = MEMORY[0x18D77C8E0](&protocol conformance descriptor for PRProviderConfiguration<A>);
  a1[2] = MEMORY[0x18D77C8E0](&protocol conformance descriptor for PRProviderConfiguration<A>, a2);
  result = MEMORY[0x18D77C8E0](&protocol conformance descriptor for PRProviderConfiguration<A>, a2);
  a1[3] = result;
  return result;
}

void sub_18B70059C()
{
  JUMPOUT(0x18D77C8E0);
}

uint64_t sub_18B7005AC()
{
  return type metadata accessor for PRRenderingConfiguration(0);
}

uint64_t type metadata accessor for PRRenderingConfiguration(uint64_t a1)
{
  return sub_18B7005F4(a1, qword_1ED1B92B0);
}

uint64_t method lookup function for PRRenderingConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_18B7005D8()
{
  return type metadata accessor for PREditingConfiguration(0);
}

uint64_t type metadata accessor for PREditingConfiguration(uint64_t a1)
{
  return sub_18B7005F4(a1, (uint64_t *)&unk_1ED1B9290);
}

uint64_t sub_18B7005F4(uint64_t a1, uint64_t *a2)
{
  uint64_t result;

  result = *a2;
  if (!*a2)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_18B700628()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18B728F80();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t method lookup function for PREditingConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PREditingConfiguration.__allocating_init(_:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t dispatch thunk of PREditingConfiguration.sceneDelegate.getter()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 104))();
}

uint64_t sub_18B7006C4()
{
  uint64_t result;
  unint64_t v1;

  result = sub_18B728F68();
  if (v1 <= 0x3F)
  {
    result = swift_initClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t type metadata accessor for PRProviderConfiguration(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for PRProviderConfiguration);
}

uint64_t method lookup function for PRProviderConfiguration()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of PRProviderConfiguration.__allocating_init(updatingDelegate:content:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 112))();
}

uint64_t dispatch thunk of PRProviderConfiguration.__allocating_init(content:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 120))();
}

uint64_t dispatch thunk of PRProviderConfiguration.shouldAccept(connection:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)v0 + 128))();
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x18D77C880](a1, v6, a5);
}

void _s13ConfigurationVwxx(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

uint64_t _s13ConfigurationVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  id v10;
  id v11;
  id v12;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v5;
  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  v7 = *(void **)(a2 + 56);
  *(_QWORD *)(a1 + 56) = v7;
  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  swift_bridgeObjectRetain();
  v10 = v4;
  v11 = v5;
  swift_bridgeObjectRetain();
  v12 = v7;
  return a1;
}

uint64_t _s13ConfigurationVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  v7 = *(void **)(a2 + 24);
  v8 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v7;
  v9 = v7;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v10 = *(void **)(a2 + 56);
  v11 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v10;
  v12 = v10;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  return a1;
}

__n128 __swift_memcpy145_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __n128 result;
  __int128 v7;
  __int128 v8;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  v3 = *(_OWORD *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)(a1 + 48) = v4;
  result = *(__n128 *)(a2 + 96);
  v7 = *(_OWORD *)(a2 + 112);
  v8 = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_OWORD *)(a1 + 112) = v7;
  *(_OWORD *)(a1 + 128) = v8;
  *(__n128 *)(a1 + 96) = result;
  return result;
}

uint64_t _s13ConfigurationVwta(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  __int128 v7;
  __int128 v8;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v5 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v6 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  v7 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v7;
  v8 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v8;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  return a1;
}

uint64_t _s13ConfigurationVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 145))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s13ConfigurationVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 136) = 0;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 144) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 145) = 1;
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
    *(_BYTE *)(result + 145) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s13ConfigurationVMa()
{
  return &_s13ConfigurationVN;
}

uint64_t sub_18B700B0C(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  _OWORD v11[9];
  char v12;
  _OWORD v13[9];
  char v14;

  v2 = *(_OWORD *)(a1 + 112);
  v11[6] = *(_OWORD *)(a1 + 96);
  v11[7] = v2;
  v11[8] = *(_OWORD *)(a1 + 128);
  v12 = *(_BYTE *)(a1 + 144);
  v3 = *(_OWORD *)(a1 + 48);
  v11[2] = *(_OWORD *)(a1 + 32);
  v11[3] = v3;
  v4 = *(_OWORD *)(a1 + 80);
  v11[4] = *(_OWORD *)(a1 + 64);
  v11[5] = v4;
  v5 = *(_OWORD *)(a1 + 16);
  v11[0] = *(_OWORD *)a1;
  v11[1] = v5;
  v6 = *(_OWORD *)(a2 + 112);
  v13[6] = *(_OWORD *)(a2 + 96);
  v13[7] = v6;
  v13[8] = *(_OWORD *)(a2 + 128);
  v14 = *(_BYTE *)(a2 + 144);
  v7 = *(_OWORD *)(a2 + 48);
  v13[2] = *(_OWORD *)(a2 + 32);
  v13[3] = v7;
  v8 = *(_OWORD *)(a2 + 80);
  v13[4] = *(_OWORD *)(a2 + 64);
  v13[5] = v8;
  v9 = *(_OWORD *)(a2 + 16);
  v13[0] = *(_OWORD *)a2;
  v13[1] = v9;
  return sub_18B700CA4((uint64_t)v11, (uint64_t)v13) & 1;
}

uint64_t sub_18B700B9C@<X0>(uint64_t a1@<X0>, unint64_t a2@<X1>, void *a3@<X2>, void *a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  id v11;
  _QWORD v13[4];
  char v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  char v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  _BYTE v31[152];

  if (!a2)
    goto LABEL_7;
  v10 = HIBYTE(a2) & 0xF;
  if ((a2 & 0x2000000000000000) == 0)
    v10 = a1 & 0xFFFFFFFFFFFFLL;
  if (!v10)
  {
    swift_bridgeObjectRelease();
LABEL_7:

    sub_18B700DE8((uint64_t)v13);
    goto LABEL_8;
  }
  swift_bridgeObjectRetain();
  v11 = a4;
  sub_18B70A89C(a1, a2, v11, (uint64_t)&v23);
  v13[0] = a1;
  v13[1] = a2;
  v13[2] = a3;
  v13[3] = v11;
  v14 = 0;
  v15 = v23;
  v16 = v24;
  v17 = v25;
  v18 = v26;
  v19 = v27;
  v20 = v28;
  v21 = v29;
  v22 = v30;
  nullsub_1(v13);
LABEL_8:
  sub_18B700E08((uint64_t)v13, (uint64_t)v31);
  return sub_18B700E08((uint64_t)v31, a5);
}

uint64_t sub_18B700CA4(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _OWORD v16[5];
  _BYTE v17[25];
  _OWORD v18[5];
  _OWORD v19[2];

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_18B729598(), v6 = 0, (v5 & 1) != 0))
  {
    sub_18B700DAC();
    if ((sub_18B729460() & 1) != 0
      && (sub_18B729460() & 1) != 0
      && ((*(unsigned __int8 *)(a1 + 32) ^ *(unsigned __int8 *)(a2 + 32)) & 1) == 0)
    {
      v8 = *(_OWORD *)(a1 + 88);
      v9 = *(_OWORD *)(a1 + 120);
      v18[4] = *(_OWORD *)(a1 + 104);
      v19[0] = v9;
      *(_OWORD *)((char *)v19 + 9) = *(_OWORD *)(a1 + 129);
      v10 = *(_OWORD *)(a1 + 56);
      v18[0] = *(_OWORD *)(a1 + 40);
      v18[1] = v10;
      v18[2] = *(_OWORD *)(a1 + 72);
      v18[3] = v8;
      v11 = *(_OWORD *)(a2 + 56);
      v12 = *(_OWORD *)(a2 + 72);
      v16[0] = *(_OWORD *)(a2 + 40);
      v16[1] = v11;
      v13 = *(_OWORD *)(a2 + 88);
      v14 = *(_OWORD *)(a2 + 104);
      *(_OWORD *)&v17[9] = *(_OWORD *)(a2 + 129);
      v15 = *(_OWORD *)(a2 + 120);
      v16[4] = v14;
      *(_OWORD *)v17 = v15;
      v16[2] = v12;
      v16[3] = v13;
      v6 = sub_18B70AF80((uint64_t)v18, (uint64_t)v16);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6 & 1;
}

unint64_t sub_18B700DAC()
{
  unint64_t result;

  result = qword_1EDFD4E40[0];
  if (!qword_1EDFD4E40[0])
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, qword_1EDFD4E40);
  }
  return result;
}

double sub_18B700DE8(uint64_t a1)
{
  double result;

  *(_BYTE *)(a1 + 144) = 0;
  result = 0.0;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)a1 = 0u;
  return result;
}

uint64_t sub_18B700E08(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5510);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t sub_18B700E68(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_18B700E70(_BYTE *result, char a2)
{
  *result = a2 & 1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView.CallState()
{
  return &type metadata for IncomingCallTextView.CallState;
}

uint64_t _s10NameFormatV13NameComponentOwet(unsigned __int8 *a1, unsigned int a2)
{
  int v2;
  int v3;
  int v4;
  unsigned int v6;
  BOOL v7;
  int v8;

  if (!a2)
    return 0;
  if (a2 < 0xFF)
    goto LABEL_17;
  if (a2 + 1 >= 0xFFFF00)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) >> 8 < 0xFF)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
  {
    v4 = *(_DWORD *)(a1 + 1);
    if (v4)
      return (*a1 | (v4 << 8)) - 1;
  }
  else
  {
    if (v3 == 2)
    {
      v4 = *(unsigned __int16 *)(a1 + 1);
      if (!*(_WORD *)(a1 + 1))
        goto LABEL_17;
      return (*a1 | (v4 << 8)) - 1;
    }
    v4 = a1[1];
    if (a1[1])
      return (*a1 | (v4 << 8)) - 1;
  }
LABEL_17:
  v6 = *a1;
  v7 = v6 >= 2;
  v8 = v6 - 2;
  if (!v7)
    v8 = -1;
  return (v8 + 1);
}

uint64_t _s9PosterKit20IncomingCallTextViewV9CallStateOwst_0(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_18B700F68 + 4 * byte_18B73B985[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18B700F9C + 4 * byte_18B73B980[v4]))();
}

uint64_t sub_18B700F9C(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B700FA4(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B700FACLL);
  return result;
}

uint64_t sub_18B700FB8(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B700FC0);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18B700FC4(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B700FCC(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView.Alignment()
{
  return &type metadata for IncomingCallTextView.Alignment;
}

uint64_t destroy for IncomingCallTextView()
{
  return swift_release();
}

uint64_t _s9PosterKit20IncomingCallTextViewVwCP_0(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  swift_retain();
  return a1;
}

uint64_t assignWithCopy for IncomingCallTextView(uint64_t a1, uint64_t a2)
{
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_retain();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

__n128 __swift_memcpy17_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  a1[1].n128_u8[0] = a2[1].n128_u8[0];
  *a1 = result;
  return result;
}

uint64_t assignWithTake for IncomingCallTextView(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v4;
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a2 + 16);
  return a1;
}

uint64_t getEnumTagSinglePayload for IncomingCallTextView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 17))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingCallTextView(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_BYTE *)(result + 16) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    *(_QWORD *)(result + 8) = 0;
    if (a3 < 0)
      *(_BYTE *)(result + 17) = 1;
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
    *(_BYTE *)(result + 17) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallTextView()
{
  return &type metadata for IncomingCallTextView;
}

uint64_t sub_18B701164()
{
  return swift_getOpaqueTypeConformance2();
}

BOOL sub_18B70117C(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return ((*a1 ^ *a2) & 1) == 0;
}

uint64_t sub_18B701194()
{
  sub_18B7295B0();
  sub_18B7295BC();
  return sub_18B7295D4();
}

uint64_t sub_18B7011D8()
{
  return sub_18B7295BC();
}

uint64_t sub_18B701200()
{
  sub_18B7295B0();
  sub_18B7295BC();
  return sub_18B7295D4();
}

double sub_18B701240()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  _BYTE *v6;
  char v7;
  void (*v8)(_BYTE *, uint64_t);
  uint64_t v9;
  double v10;
  double v11;
  uint64_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  int v17;
  _BYTE v19[152];
  _BYTE v20[152];
  _QWORD v21[38];
  _BYTE v22[304];
  _BYTE v23[304];

  v0 = sub_18B72922C();
  v1 = *(_QWORD *)(v0 - 8);
  v2 = MEMORY[0x1E0C80A78](v0);
  v4 = &v19[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v2);
  v6 = &v19[-v5];
  swift_retain();
  sub_18B71A988((uint64_t)v6);
  swift_release();
  sub_18B729214();
  v7 = sub_18B729220();
  v8 = *(void (**)(_BYTE *, uint64_t))(v1 + 8);
  v8(v4, v0);
  v8(v6, v0);
  if ((v7 & 1) == 0)
  {
    if (qword_1EDFD5210 != -1)
      swift_once();
    v12 = sub_18B728FA4();
    __swift_project_value_buffer(v12, (uint64_t)qword_1EDFDA4D0);
    v13 = sub_18B728F98();
    v14 = sub_18B7293F4();
    if (os_log_type_enabled(v13, v14))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_18B634000, v13, v14, "Vertical writing mode is unsupported", v15, 2u);
      MEMORY[0x18D77C964](v15, -1, -1);
    }

    return 0.0;
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v21, v22);
  sub_18B7086A4(v22, v23);
  if (sub_18B7086E0((uint64_t)v23) != 1)
  {
    v16 = sub_18B7086EC((uint64_t)v23);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    sub_18B709750((uint64_t)v19, (uint64_t)v20, &qword_1EDFD5510);
    sub_18B709750((uint64_t)v20, (uint64_t)v21, &qword_1EDFD5510);
    v17 = sub_18B708DD4((uint64_t)v21);
    sub_18B708890((uint64_t)v22);
    if (v17 != 1)
    {
      sub_18B708FA0((uint64_t)v20);
      v10 = *(double *)&v21[17];
      v11 = *(double *)(v16 + 128);
      return round(round(v10 + v11));
    }
    return 0.0;
  }
  v9 = sub_18B7086EC((uint64_t)v23);
  sub_18B708890((uint64_t)v22);
  v10 = *(double *)(v9 + 136);
  v11 = *(double *)(v9 + 280);
  return round(round(v10 + v11));
}

uint64_t sub_18B701530@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  int v27;
  const void *v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  _QWORD v36[2];
  char *v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  uint64_t v49;
  _BYTE v50[304];
  _BYTE v51[304];
  _BYTE v52[312];

  v48 = a3;
  v47 = a1;
  v49 = a4;
  v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5378);
  MEMORY[0x1E0C80A78](v45);
  v40 = (uint64_t)v36 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52C0);
  MEMORY[0x1E0C80A78](v41);
  v43 = (uint64_t)v36 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5408);
  MEMORY[0x1E0C80A78](v42);
  v39 = (_QWORD *)((char *)v36 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v46 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5320);
  MEMORY[0x1E0C80A78](v46);
  v44 = (char *)v36 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52E0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v36 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5310);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v36 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_18B72922C();
  v16 = *(_QWORD *)(v15 - 8);
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = (char *)v36 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v36 - v20;
  swift_retain();
  sub_18B71A988((uint64_t)v21);
  swift_release();
  (*(void (**)(char *, char *, uint64_t))(v16 + 16))(v19, v21, v15);
  v22 = sub_18B718EBC(v19);
  LODWORD(v19) = PRPosterTitleLayoutIsVertical(v22);
  (*(void (**)(char *, uint64_t))(v16 + 8))(v21, v15);
  if ((_DWORD)v19)
  {
    sub_18B701ABC(v47, a2, v48 & 1, (uint64_t)v14);
    v23 = &qword_1EDFD5310;
    sub_18B7096D0((uint64_t)v14, (uint64_t)v11, &qword_1EDFD5310);
    swift_storeEnumTagMultiPayload();
    sub_18B7089E4();
    sub_18B708A68();
    sub_18B7291CC();
    v24 = (uint64_t)v14;
  }
  else
  {
    v25 = v48;
    v37 = v11;
    v38 = v9;
    v36[1] = v12;
    v26 = v47;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    sub_18B7086A4(v52, v50);
    sub_18B7086A4(v50, v51);
    v27 = sub_18B7086E0((uint64_t)v51);
    v28 = (const void *)sub_18B7086EC((uint64_t)v51);
    if (v27 == 1)
    {
      memcpy(v52, v28, 0x12BuLL);
      v29 = v40;
      sub_18B703504((uint64_t)v52, v26, a2, v25 & 1, v40);
      v30 = &qword_1EDFD5378;
      sub_18B7096D0(v29, v43, &qword_1EDFD5378);
      swift_storeEnumTagMultiPayload();
      sub_18B709970(&qword_1EDFD5400, &qword_1EDFD5408, MEMORY[0x1E0CDFCC0]);
      sub_18B709150(&qword_1EDFD5370, &qword_1EDFD5378, (uint64_t (*)(void))sub_18B708748, (uint64_t (*)(void))sub_18B7087EC);
      v31 = (uint64_t)v44;
      sub_18B7291CC();
      sub_18B708890((uint64_t)v50);
    }
    else
    {
      sub_18B708890((uint64_t)v50);
      v32 = sub_18B729100();
      v33 = sub_18B701240();
      v29 = (uint64_t)v39;
      *v39 = v32;
      *(double *)(v29 + 8) = v33;
      *(_BYTE *)(v29 + 16) = 0;
      v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5268);
      sub_18B704204(v26, a2, v25 & 1, v29 + *(int *)(v34 + 44));
      v30 = &qword_1EDFD5408;
      sub_18B7096D0(v29, v43, &qword_1EDFD5408);
      swift_storeEnumTagMultiPayload();
      sub_18B709970(&qword_1EDFD5400, &qword_1EDFD5408, MEMORY[0x1E0CDFCC0]);
      sub_18B709150(&qword_1EDFD5370, &qword_1EDFD5378, (uint64_t (*)(void))sub_18B708748, (uint64_t (*)(void))sub_18B7087EC);
      v31 = (uint64_t)v44;
      sub_18B7291CC();
    }
    sub_18B709714(v29, v30);
    v23 = &qword_1EDFD5320;
    sub_18B7096D0(v31, (uint64_t)v37, &qword_1EDFD5320);
    swift_storeEnumTagMultiPayload();
    sub_18B7089E4();
    sub_18B708A68();
    sub_18B7291CC();
    v24 = v31;
  }
  return sub_18B709714(v24, v23);
}

uint64_t sub_18B701ABC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  int v18;
  const void *v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  uint64_t v32;
  _QWORD v34[4];
  char *v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  int v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[304];
  _BYTE v46[304];
  _OWORD v47[19];
  _BYTE v48[304];
  _BYTE v49[312];

  v41 = a3;
  v42 = a1;
  v43 = a4;
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5378);
  MEMORY[0x1E0C80A78](v37);
  v36 = (char *)v34 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52C0);
  MEMORY[0x1E0C80A78](v38);
  v39 = (uint64_t)v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5408);
  MEMORY[0x1E0C80A78](v7);
  v9 = (double *)((char *)v34 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5320);
  MEMORY[0x1E0C80A78](v44);
  v11 = (char *)v34 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DD0);
  MEMORY[0x1E0C80A78](v12);
  v40 = (uint64_t)v34 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD53F8);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v34 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v49, v48);
  sub_18B7086A4(v48, v49);
  if (sub_18B7086E0((uint64_t)v49) == 1)
  {
    v17 = (uint64_t)v36;
    v34[1] = v12;
    v34[2] = v7;
    v34[3] = v14;
    v35 = v11;
    sub_18B7086EC((uint64_t)v49);
    sub_18B708890((uint64_t)v48);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    sub_18B7086A4(v47, v45);
    sub_18B7086A4(v45, v46);
    v18 = sub_18B7086E0((uint64_t)v46);
    v19 = (const void *)sub_18B7086EC((uint64_t)v46);
    v20 = v42;
    v21 = v40;
    v22 = v41;
    if (v18 == 1)
    {
      memcpy(v47, v19, 0x12BuLL);
      sub_18B703504((uint64_t)v47, v42, a2, v41 & 1, v17);
      v23 = &qword_1EDFD5378;
      sub_18B7096D0(v17, v39, &qword_1EDFD5378);
      swift_storeEnumTagMultiPayload();
      sub_18B709970(&qword_1EDFD5400, &qword_1EDFD5408, MEMORY[0x1E0CDFCC0]);
      sub_18B709150(&qword_1EDFD5370, &qword_1EDFD5378, (uint64_t (*)(void))sub_18B708748, (uint64_t (*)(void))sub_18B7087EC);
      v24 = (uint64_t)v35;
      sub_18B7291CC();
      sub_18B708890((uint64_t)v45);
      v25 = v17;
    }
    else
    {
      sub_18B708890((uint64_t)v45);
      v30 = sub_18B729100();
      v31 = sub_18B701240();
      *(_QWORD *)v9 = v30;
      v9[1] = v31;
      *((_BYTE *)v9 + 16) = 0;
      v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5268);
      sub_18B704204(v20, a2, v22 & 1, (uint64_t)v9 + *(int *)(v32 + 44));
      v23 = &qword_1EDFD5408;
      sub_18B7096D0((uint64_t)v9, v39, &qword_1EDFD5408);
      swift_storeEnumTagMultiPayload();
      sub_18B709970(&qword_1EDFD5400, &qword_1EDFD5408, MEMORY[0x1E0CDFCC0]);
      sub_18B709150(&qword_1EDFD5370, &qword_1EDFD5378, (uint64_t (*)(void))sub_18B708748, (uint64_t (*)(void))sub_18B7087EC);
      v24 = (uint64_t)v35;
      sub_18B7291CC();
      v25 = (uint64_t)v9;
    }
    sub_18B709714(v25, v23);
    v28 = &qword_1EDFD5320;
    sub_18B7096D0(v24, v21, &qword_1EDFD5320);
    swift_storeEnumTagMultiPayload();
    sub_18B709970(&qword_1EDFD53F0, &qword_1EDFD53F8, MEMORY[0x1E0CDFB10]);
    sub_18B708A68();
    sub_18B7291CC();
    v29 = v24;
  }
  else
  {
    v26 = sub_18B7086EC((uint64_t)v49);
    v47[6] = *(_OWORD *)(v26 + 96);
    v47[7] = *(_OWORD *)(v26 + 112);
    v47[8] = *(_OWORD *)(v26 + 128);
    LOBYTE(v47[9]) = *(_BYTE *)(v26 + 144);
    v47[2] = *(_OWORD *)(v26 + 32);
    v47[3] = *(_OWORD *)(v26 + 48);
    v47[4] = *(_OWORD *)(v26 + 64);
    v47[5] = *(_OWORD *)(v26 + 80);
    v47[0] = *(_OWORD *)v26;
    v47[1] = *(_OWORD *)(v26 + 16);
    *(_QWORD *)v16 = sub_18B7290F4();
    *((_QWORD *)v16 + 1) = 0;
    v16[16] = 1;
    v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DD8);
    sub_18B7020DC(v42, a2, v41 & 1, (uint64_t)v47, (uint64_t)&v16[*(int *)(v27 + 44)]);
    v28 = &qword_1EDFD53F8;
    sub_18B7096D0((uint64_t)v16, v40, &qword_1EDFD53F8);
    swift_storeEnumTagMultiPayload();
    sub_18B709970(&qword_1EDFD53F0, &qword_1EDFD53F8, MEMORY[0x1E0CDFB10]);
    sub_18B708A68();
    sub_18B7291CC();
    sub_18B708890((uint64_t)v48);
    v29 = (uint64_t)v16;
  }
  return sub_18B709714(v29, v28);
}

uint64_t sub_18B7020DC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v24;

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v15 = (char *)&v24 - v14;
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  v17 = MEMORY[0x1E0C80A78](v16);
  v19 = (char *)&v24 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v21 = (char *)&v24 - v20;
  sub_18B702298(a1, a2, a3, (uint64_t)&v24 - v20);
  sub_18B7029F4(a4, 0, 0, 1, a2, a3, (uint64_t)v15);
  sub_18B7096D0((uint64_t)v21, (uint64_t)v19, &qword_1EDFD5390);
  sub_18B7096D0((uint64_t)v15, (uint64_t)v13, &qword_1EDFD5300);
  sub_18B7096D0((uint64_t)v19, a5, &qword_1EDFD5390);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DE0);
  sub_18B7096D0((uint64_t)v13, a5 + *(int *)(v22 + 48), &qword_1EDFD5300);
  sub_18B709714((uint64_t)v15, &qword_1EDFD5300);
  sub_18B709714((uint64_t)v21, &qword_1EDFD5390);
  sub_18B709714((uint64_t)v13, &qword_1EDFD5300);
  return sub_18B709714((uint64_t)v19, &qword_1EDFD5390);
}

uint64_t sub_18B702298@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v21;
  uint64_t v22;
  _BOOL4 IsVertical;
  void *v24;
  int IsSuitableForVerticalLayout;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  __int128 v29;
  id v30;
  id v31;
  char v32;
  id v33;
  id v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  char v41;
  uint64_t v42;
  char v43;
  _QWORD *v44;
  uint64_t v45;
  uint64_t v46;
  char *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  _QWORD *v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  __int128 v65;
  _OWORD v66[9];
  char v67;
  _BYTE v68[152];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  char v78;
  CGRect v79;

  v54 = a3;
  v49 = a1;
  v60 = a4;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52F0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v45 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52E8);
  MEMORY[0x1E0C80A78](v57);
  v59 = (uint64_t *)((char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52D0);
  MEMORY[0x1E0C80A78](v50);
  v52 = (uint64_t)&v45 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v51);
  v48 = (uint64_t)&v45 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v56);
  v53 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v55 = sub_18B72922C();
  v12 = *(_QWORD *)(v55 - 8);
  v13 = MEMORY[0x1E0C80A78](v55);
  v15 = (char *)&v45 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v45 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5388);
  MEMORY[0x1E0C80A78](v18);
  v58 = (char *)&v45 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B709750((uint64_t)&v69, (uint64_t)v68, &qword_1EDFD5510);
  sub_18B709750((uint64_t)v68, (uint64_t)&v69, &qword_1EDFD5510);
  if (sub_18B708DD4((uint64_t)&v69) == 1)
    goto LABEL_4;
  v45 = v18;
  v46 = v5;
  v47 = v7;
  v66[6] = v75;
  v66[7] = v76;
  v66[8] = v77;
  v67 = v78;
  v66[2] = v71;
  v66[3] = v72;
  v66[4] = v73;
  v66[5] = v74;
  v66[0] = v69;
  v66[1] = v70;
  if ((v71 & 1) != 0)
  {
    sub_18B708FA0((uint64_t)v68);
LABEL_4:
    swift_storeEnumTagMultiPayload();
    sub_18B709150(&qword_1EDFD5380, &qword_1EDFD5388, (uint64_t (*)(void))sub_18B7091C0, sub_18B7092E0);
    return sub_18B7291CC();
  }
  swift_retain();
  sub_18B71A988((uint64_t)v17);
  swift_release();
  v21 = v55;
  (*(void (**)(char *, char *, uint64_t))(v12 + 16))(v15, v17, v55);
  v22 = sub_18B718EBC(v15);
  IsVertical = PRPosterTitleLayoutIsVertical(v22);
  (*(void (**)(char *, uint64_t))(v12 + 8))(v17, v21);
  if (IsVertical)
  {
    v24 = (void *)sub_18B729358();
    IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

    if (IsSuitableForVerticalLayout)
    {
      v26 = v48;
      sub_18B7029F4((uint64_t)v66, 0, 0, 1, a2, v54 & 1, v48);
      sub_18B7096D0(v26, v52, &qword_1EDFD5300);
      swift_storeEnumTagMultiPayload();
      sub_18B70922C();
      v27 = (uint64_t)v53;
      sub_18B7291CC();
      sub_18B709714(v26, &qword_1EDFD5300);
    }
    else
    {
      swift_storeEnumTagMultiPayload();
      sub_18B70922C();
      v27 = (uint64_t)v53;
      sub_18B7291CC();
    }
    v36 = (uint64_t)v47;
    v37 = (uint64_t)v58;
    sub_18B7096D0(v27, (uint64_t)v59, &qword_1EDFD5350);
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5278);
    sub_18B7091C0();
    sub_18B7092E0();
    sub_18B7291CC();
    sub_18B709714(v27, &qword_1EDFD5350);
  }
  else
  {
    v28 = v69;
    v29 = v70;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    v30 = *((id *)&v29 + 1);
    swift_bridgeObjectRetain();
    v31 = (id)v29;
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v32 = v61;
    v33 = v30;
    swift_bridgeObjectRetain();
    v34 = v31;
    if ((v54 & 1) != 0)
      v35 = (void *)sub_18B708060(v28, *((unint64_t *)&v28 + 1));
    else
      v35 = 0;
    v38 = v35;
    v39 = v33;

    swift_bridgeObjectRelease();
    objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds, v45, v46);
    CGRectGetWidth(v79);
    sub_18B7292E0();
    sub_18B729028();
    v40 = v61;
    v41 = v62;
    v42 = v63;
    v43 = v64;
    v44 = v59;
    *v59 = v39;
    v44[1] = 0x3FF0000000000000;
    *((_OWORD *)v44 + 1) = v28;
    v44[4] = v34;
    v44[5] = v35;
    *((_BYTE *)v44 + 48) = v32;
    *((_BYTE *)v44 + 49) = 1;
    v44[7] = v40;
    *((_BYTE *)v44 + 64) = v41;
    v44[9] = v42;
    *((_BYTE *)v44 + 80) = v43;
    *(_OWORD *)(v44 + 11) = v65;
    swift_storeEnumTagMultiPayload();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5278);
    sub_18B7091C0();
    sub_18B7092E0();
    v37 = (uint64_t)v58;
    sub_18B7291CC();
    v36 = (uint64_t)v47;
  }
  sub_18B7096D0(v37, v36, &qword_1EDFD5388);
  swift_storeEnumTagMultiPayload();
  sub_18B709150(&qword_1EDFD5380, &qword_1EDFD5388, (uint64_t (*)(void))sub_18B7091C0, sub_18B7092E0);
  sub_18B7291CC();
  sub_18B708FA0((uint64_t)v68);
  return sub_18B709714(v37, &qword_1EDFD5388);
}

uint64_t sub_18B7029F4@<X0>(uint64_t a1@<X0>, void *a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X5>, char a6@<W6>, uint64_t a7@<X8>)
{
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
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
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  char v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int v48;
  int v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  id v54;
  uint64_t v55;
  uint64_t KeyPath;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  char *v63;
  uint64_t v64;
  _OWORD *v65;
  __int128 v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;
  int IsSuitableForArabicJustification;
  double Width;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint64_t v76;
  double v77;
  double v78;
  char *v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  char v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v96;
  char *v97;
  char *v98;
  uint64_t v99;
  uint64_t v100;
  char *v101;
  uint64_t v102;
  void (*v103)(uint64_t, uint64_t);
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char *v108;
  uint64_t v109;
  int v110;
  uint64_t v111;
  uint64_t v112;
  char *v113;
  void *v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  char *v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  char *v124;
  uint64_t v125;
  _OWORD v126[9];
  char v127;
  uint64_t v128;
  uint64_t v129;
  char v130;
  uint64_t v131;
  unsigned __int8 v132;
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  char v140;
  uint64_t v141;
  _BYTE v142[152];
  _OWORD v143[13];
  _OWORD v144[5];
  _OWORD v145[2];
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  char v155;
  CGRect v156;

  v111 = a3;
  v10 = a1;
  v121 = a7;
  v11 = *(_OWORD *)(a1 + 112);
  v152 = *(_OWORD *)(a1 + 96);
  v153 = v11;
  v110 = a4 & 1;
  v154 = *(_OWORD *)(a1 + 128);
  v155 = *(_BYTE *)(a1 + 144);
  v12 = *(_OWORD *)(a1 + 48);
  v148 = *(_OWORD *)(a1 + 32);
  v149 = v12;
  v13 = *(_OWORD *)(a1 + 80);
  v150 = *(_OWORD *)(a1 + 64);
  v151 = v13;
  v14 = *(_OWORD *)(a1 + 16);
  v146 = *(_OWORD *)a1;
  v147 = v14;
  v15 = sub_18B7290D0();
  v99 = *(_QWORD *)(v15 - 8);
  v100 = v15;
  MEMORY[0x1E0C80A78](v15);
  v98 = (char *)&v96 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v120 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DE8);
  v102 = *(_QWORD *)(v120 - 8);
  v17 = MEMORY[0x1E0C80A78](v120);
  v97 = (char *)&v96 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v17);
  v101 = (char *)&v96 - v19;
  v117 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DF0);
  MEMORY[0x1E0C80A78](v117);
  v119 = (char *)&v96 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v118 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52B8);
  MEMORY[0x1E0C80A78](v118);
  v104 = (uint64_t)&v96 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v123 = sub_18B72922C();
  v22 = *(_QWORD *)(v123 - 8);
  MEMORY[0x1E0C80A78](v123);
  v122 = (uint64_t)&v96 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v109 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8DF8);
  v107 = *(_QWORD *)(v109 - 8);
  MEMORY[0x1E0C80A78](v109);
  v124 = (char *)&v96 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v105 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5288);
  MEMORY[0x1E0C80A78](v105);
  v108 = (char *)&v96 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v106 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5298);
  MEMORY[0x1E0C80A78](v106);
  v27 = (char *)&v96 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v125 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52A8);
  MEMORY[0x1E0C80A78](v125);
  v116 = (uint64_t)&v96 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = sub_18B728EA8();
  MEMORY[0x1E0C80A78](v29);
  if ((a6 & 1) != 0)
  {
    sub_18B70774C(*(_QWORD *)v10, *(_QWORD *)(v10 + 8));
    v30 = sub_18B729250();
    v33 = v32;
    v35 = v34;
  }
  else
  {
    v36 = *(_QWORD *)(v10 + 8);
    v128 = *(_QWORD *)v10;
    v129 = v36;
    sub_18B6FFABC();
    v113 = v27;
    swift_bridgeObjectRetain();
    v37 = sub_18B72925C();
    v39 = v38;
    v103 = v40;
    v112 = v22;
    v42 = v41 & 1;
    v43 = MEMORY[0x18D77B854](*(id *)(v10 + 16));
    v114 = a2;
    v128 = v43;
    v44 = sub_18B729238();
    v115 = a5;
    v45 = v44;
    v33 = v46;
    v47 = v10;
    v49 = v48;
    v35 = v50;
    v51 = v39;
    LOBYTE(v48) = v42;
    v22 = v112;
    v27 = v113;
    sub_18B6FFB00(v37, v51, v48);
    a2 = v114;
    swift_release();
    swift_bridgeObjectRelease();
    v31 = v49;
    v10 = v47;
    v30 = v45;
  }
  v113 = (char *)v33;
  v114 = (void *)v30;
  v128 = v30;
  v129 = v33;
  LODWORD(v112) = v31;
  v130 = v31 & 1;
  v115 = v35;
  v131 = v35;
  swift_retain();
  v52 = v122;
  sub_18B71A988(v122);
  swift_release();
  sub_18B729280();
  v103 = *(void (**)(uint64_t, uint64_t))(v22 + 8);
  v103(v52, v123);
  if (!a2)
    v53 = *(id *)(v10 + 24);
  v54 = a2;
  v55 = sub_18B7291FC();
  KeyPath = swift_getKeyPath();
  v57 = v107;
  v58 = (uint64_t)v108;
  v59 = v124;
  v60 = v109;
  (*(void (**)(char *, char *, uint64_t))(v107 + 16))(v108, v124, v109);
  v61 = (uint64_t *)(v58 + *(int *)(v105 + 36));
  *v61 = KeyPath;
  v61[1] = v55;
  (*(void (**)(char *, uint64_t))(v57 + 8))(v59, v60);
  v62 = swift_getKeyPath();
  sub_18B7096D0(v58, (uint64_t)v27, &qword_1EDFD5288);
  v63 = &v27[*(int *)(v106 + 36)];
  *(_QWORD *)v63 = v62;
  *((_QWORD *)v63 + 1) = 1;
  v63[16] = 0;
  sub_18B709714(v58, &qword_1EDFD5288);
  sub_18B7292E0();
  sub_18B729028();
  v64 = v116;
  sub_18B7096D0((uint64_t)v27, v116, &qword_1EDFD5298);
  v65 = (_OWORD *)(v64 + *(int *)(v125 + 36));
  v66 = v143[11];
  *v65 = v143[10];
  v65[1] = v66;
  v65[2] = v143[12];
  sub_18B709714((uint64_t)v27, &qword_1EDFD5298);
  swift_retain();
  LOBYTE(v62) = sub_18B71A600();
  swift_release();
  if ((v62 & 1) == 0)
    goto LABEL_21;
  v67 = *(_QWORD *)v10;
  v68 = *(_QWORD *)(v10 + 8);
  v69 = (void *)sub_18B729358();
  IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();

  if (!IsSuitableForArabicJustification)
    goto LABEL_21;
  objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
  Width = CGRectGetWidth(v156);
  v72 = *(_OWORD *)(v10 + 88);
  v73 = *(_OWORD *)(v10 + 120);
  v144[4] = *(_OWORD *)(v10 + 104);
  v145[0] = v73;
  *(_OWORD *)((char *)v145 + 9) = *(_OWORD *)(v10 + 129);
  v74 = *(_OWORD *)(v10 + 56);
  v144[0] = *(_OWORD *)(v10 + 40);
  v144[1] = v74;
  v75 = *(_OWORD *)(v10 + 72);
  v144[3] = v72;
  v144[2] = v75;
  v76 = v122;
  sub_18B729214();
  sub_18B709CE0(v76, 1.0);
  v78 = v77;
  v103(v76, v123);
  if (v78 >= Width)
    goto LABEL_21;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B709750((uint64_t)&v128, (uint64_t)v142, &qword_1EDFD5510);
  sub_18B709750((uint64_t)v142, (uint64_t)v143, &qword_1EDFD5510);
  if (sub_18B708DD4((uint64_t)v143) != 1)
  {
    sub_18B709750((uint64_t)v142, (uint64_t)&v128, &qword_1EDFD5510);
    if ((v67 != v128 || v68 != v129) && (sub_18B729598() & 1) == 0)
    {
      sub_18B708FA0((uint64_t)v142);
      goto LABEL_19;
    }
    sub_18B6FEB68(0, qword_1EDFD4E40);
    sub_18B708DEC((_QWORD *)v10);
    sub_18B708DEC((_QWORD *)v10);
    if ((sub_18B729460() & 1) == 0 || (sub_18B729460() & 1) == 0 || ((v132 ^ *(unsigned __int8 *)(v10 + 32)) & 1) != 0)
    {
      sub_18B708FA0((uint64_t)v142);
      sub_18B709000(v10);
      sub_18B709000(v10);
      goto LABEL_19;
    }
    *(_OWORD *)((char *)v126 + 8) = v134;
    *(_OWORD *)((char *)&v126[1] + 8) = v135;
    *(_OWORD *)((char *)&v126[2] + 8) = v136;
    *(_OWORD *)((char *)&v126[3] + 8) = v137;
    *(_OWORD *)((char *)&v126[4] + 8) = v138;
    *(_QWORD *)&v126[0] = v133;
    *(_OWORD *)((char *)&v126[5] + 8) = v139;
    BYTE8(v126[6]) = v140;
    v87 = sub_18B70AF80((uint64_t)v144, (uint64_t)v126);
    sub_18B708FA0((uint64_t)v142);
    sub_18B709000(v10);
    sub_18B709000(v10);
    if ((v87 & 1) == 0)
      goto LABEL_19;
LABEL_21:
    objc_msgSend((id)objc_opt_self(), sel_minimumScaleFactor);
    v89 = v88;
    v90 = swift_getKeyPath();
    v91 = v104;
    sub_18B7096D0(v64, v104, &qword_1EDFD52A8);
    v92 = (uint64_t)v119;
    v93 = (uint64_t *)(v91 + *(int *)(v118 + 36));
    *v93 = v90;
    v93[1] = v89;
    sub_18B7096D0(v91, v92, &qword_1EDFD52B8);
    swift_storeEnumTagMultiPayload();
    sub_18B708C04();
    v94 = sub_18B7092FC(&qword_1EDFD52A0, &qword_1EDFD52A8, (uint64_t (*)(void))sub_18B708CA0);
    v128 = v125;
    v129 = v94;
    swift_getOpaqueTypeConformance2();
    sub_18B7291CC();
    sub_18B6FFB00((uint64_t)v114, (uint64_t)v113, v112 & 1);
    swift_bridgeObjectRelease();
    sub_18B709714(v91, &qword_1EDFD52B8);
    v86 = v64;
    return sub_18B709714(v86, &qword_1EDFD52A8);
  }
  v126[6] = v152;
  v126[7] = v153;
  v126[8] = v154;
  v127 = v155;
  v126[2] = v148;
  v126[3] = v149;
  v126[4] = v150;
  v126[5] = v151;
  v126[0] = v146;
  v126[1] = v147;
  nullsub_1(v126);
  sub_18B709750((uint64_t)v126, (uint64_t)&v128, &qword_1EDFD5510);
  sub_18B709750((uint64_t)v142, (uint64_t)&v141, &qword_1EDFD5510);
  sub_18B708DEC((_QWORD *)v10);
  sub_18B708E40((uint64_t)&v128);
LABEL_19:
  v79 = v98;
  sub_18B7290C4();
  v80 = sub_18B7092FC(&qword_1EDFD52A0, &qword_1EDFD52A8, (uint64_t (*)(void))sub_18B708CA0);
  v81 = v97;
  v82 = v125;
  sub_18B72928C();
  (*(void (**)(char *, uint64_t))(v99 + 8))(v79, v100);
  v84 = v101;
  v83 = v102;
  v85 = v120;
  (*(void (**)(char *, char *, uint64_t))(v102 + 32))(v101, v81, v120);
  (*(void (**)(char *, char *, uint64_t))(v83 + 16))(v119, v84, v85);
  swift_storeEnumTagMultiPayload();
  sub_18B708C04();
  v128 = v82;
  v129 = v80;
  swift_getOpaqueTypeConformance2();
  sub_18B7291CC();
  sub_18B6FFB00((uint64_t)v114, (uint64_t)v113, v112 & 1);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v83 + 8))(v84, v85);
  v86 = v64;
  return sub_18B709714(v86, &qword_1EDFD52A8);
}

uint64_t sub_18B703504@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  int v25;
  double v26;
  double v27;
  double v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  int v43;
  double v44;
  double v45;
  double v46;
  double v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  int v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  unsigned __int8 v68;
  unsigned __int8 v69;

  v60 = a4;
  v61 = a2;
  v62 = a3;
  v67 = a5;
  v6 = a1 + 297;
  v58 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5428);
  MEMORY[0x1E0C80A78](v58);
  v54 = (uint64_t *)((char *)&v53 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E20);
  MEMORY[0x1E0C80A78](v56);
  v9 = (char *)&v53 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v66 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5330);
  MEMORY[0x1E0C80A78](v66);
  v59 = (char *)&v53 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5418);
  MEMORY[0x1E0C80A78](v57);
  v12 = (uint64_t *)((char *)&v53 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v55 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5448);
  MEMORY[0x1E0C80A78](v55);
  v14 = (uint64_t *)((char *)&v53 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0));
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E28);
  MEMORY[0x1E0C80A78](v63);
  v65 = (uint64_t)&v53 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E30);
  MEMORY[0x1E0C80A78](v16);
  v18 = (char *)&v53 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5340);
  MEMORY[0x1E0C80A78](v64);
  v20 = (char *)&v53 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5438);
  MEMORY[0x1E0C80A78](v21);
  v23 = (uint64_t *)((char *)&v53 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0));
  if ((*(_BYTE *)(a1 + 297) & 1) == 0)
  {
    if ((*(_BYTE *)(v6 + 1) & 1) != 0)
    {
      sub_18B703D30(a1, v61, v62, v60 & 1, &qword_1EDFD8EA0, &qword_1EDFD8EA8, &qword_1EDFD8EB0, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))sub_18B705D50, v14, &qword_1EDFD8EB8);
      v38 = &qword_1EDFD5448;
      sub_18B7096D0((uint64_t)v14, (uint64_t)v18, &qword_1EDFD5448);
      swift_storeEnumTagMultiPayload();
      v39 = MEMORY[0x1E0CDFCF8];
      sub_18B709970(&qword_1EDFD5430, &qword_1EDFD5438, MEMORY[0x1E0CDFCF8]);
      sub_18B709970(&qword_1EDFD5440, &qword_1EDFD5448, v39);
      sub_18B7291CC();
      sub_18B7096D0((uint64_t)v20, v65, &qword_1EDFD5340);
      swift_storeEnumTagMultiPayload();
      sub_18B708748();
      sub_18B7087EC();
      sub_18B7291CC();
      sub_18B709714((uint64_t)v20, &qword_1EDFD5340);
      v36 = (uint64_t)v14;
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      v42 = v62;
      swift_retain();
      sub_18B728FE0();
      swift_release();
      swift_release();
      swift_release();
      v43 = v68;
      objc_msgSend(*(id *)(a1 + 176), sel_pointSize);
      v45 = v44;
      objc_msgSend(*(id *)(a1 + 24), sel_pointSize);
      v47 = v45 / v46;
      v48 = sub_18B729100();
      v49 = sub_18B7290DC();
      *v23 = v48;
      v23[1] = v49;
      v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E40);
      sub_18B7064B4(v61, v42, v60 & 1, v43, (uint64_t)v23 + *(int *)(v50 + 44), v47);
      v38 = &qword_1EDFD5438;
      sub_18B7096D0((uint64_t)v23, (uint64_t)v18, &qword_1EDFD5438);
      swift_storeEnumTagMultiPayload();
      v51 = MEMORY[0x1E0CDFCF8];
      sub_18B709970(&qword_1EDFD5430, &qword_1EDFD5438, MEMORY[0x1E0CDFCF8]);
      sub_18B709970(&qword_1EDFD5440, &qword_1EDFD5448, v51);
      sub_18B7291CC();
      sub_18B7096D0((uint64_t)v20, v65, &qword_1EDFD5340);
      swift_storeEnumTagMultiPayload();
      sub_18B708748();
      sub_18B7087EC();
      sub_18B7291CC();
      sub_18B709714((uint64_t)v20, &qword_1EDFD5340);
      v36 = (uint64_t)v23;
    }
    goto LABEL_8;
  }
  if ((*(_BYTE *)(v6 + 1) & 1) == 0)
  {
    sub_18B703D30(a1, v61, v62, v60 & 1, &qword_1EDFD8F00, &qword_1EDFD8F08, &qword_1EDFD8F10, (void (*)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double))sub_18B704FD0, v12, &qword_1EDFD8F18);
    v38 = &qword_1EDFD5418;
    sub_18B7096D0((uint64_t)v12, (uint64_t)v9, &qword_1EDFD5418);
    swift_storeEnumTagMultiPayload();
    v40 = MEMORY[0x1E0CDFCF8];
    sub_18B709970(&qword_1EDFD5410, &qword_1EDFD5418, MEMORY[0x1E0CDFCF8]);
    sub_18B709970(&qword_1EDFD5420, &qword_1EDFD5428, v40);
    v41 = (uint64_t)v59;
    sub_18B7291CC();
    sub_18B7096D0(v41, v65, &qword_1EDFD5330);
    swift_storeEnumTagMultiPayload();
    sub_18B708748();
    sub_18B7087EC();
    sub_18B7291CC();
    sub_18B709714(v41, &qword_1EDFD5330);
    v36 = (uint64_t)v12;
LABEL_8:
    v37 = v38;
    return sub_18B709714(v36, v37);
  }
  swift_getKeyPath();
  swift_getKeyPath();
  v24 = v62;
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v25 = v69;
  objc_msgSend(*(id *)(a1 + 24), sel_pointSize);
  v27 = v26;
  objc_msgSend(*(id *)(a1 + 176), sel_pointSize);
  v29 = v27 / v28;
  v30 = sub_18B729100();
  v31 = sub_18B7290DC();
  v32 = (uint64_t)v54;
  *v54 = v30;
  *(_QWORD *)(v32 + 8) = v31;
  v33 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E38);
  sub_18B706D04(v61, v24, v60 & 1, v25, v32 + *(int *)(v33 + 44), v29);
  sub_18B7096D0(v32, (uint64_t)v9, &qword_1EDFD5428);
  swift_storeEnumTagMultiPayload();
  v34 = MEMORY[0x1E0CDFCF8];
  sub_18B709970(&qword_1EDFD5410, &qword_1EDFD5418, MEMORY[0x1E0CDFCF8]);
  sub_18B709970(&qword_1EDFD5420, &qword_1EDFD5428, v34);
  v35 = (uint64_t)v59;
  sub_18B7291CC();
  sub_18B7096D0(v35, v65, &qword_1EDFD5330);
  swift_storeEnumTagMultiPayload();
  sub_18B708748();
  sub_18B7087EC();
  sub_18B7291CC();
  sub_18B709714(v35, &qword_1EDFD5330);
  v36 = v32;
  v37 = &qword_1EDFD5428;
  return sub_18B709714(v36, v37);
}

void sub_18B703D30(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t *a5@<X4>, uint64_t *a6@<X5>, uint64_t *a7@<X6>, void (*a8)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double)@<X7>, uint64_t *a9@<X8>, uint64_t *a10)
{
  unsigned int v12;
  char v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint64_t v24;
  unint64_t v25;
  unint64_t v26;
  char v27;
  void *v28;
  uint64_t v29;
  char v30;
  id v31;
  double v32;
  double v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  char v46;
  void *v47;
  uint64_t v48;
  char v49;
  id v50;
  double v51;
  double v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  uint64_t v63;
  __int128 v64;
  char v65;
  void *v66;
  uint64_t v67;
  char v68;
  id v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v99;
  __int128 v100;
  void *v101;
  char v102;
  uint64_t v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  char v110;
  uint64_t v111;
  __int128 v112;
  void *v113;
  char v114;
  uint64_t v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  char v122;
  uint64_t v123;
  __int128 v124;
  void *v125;
  char v126;
  uint64_t v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  unsigned __int128 v133;
  char v134;
  _OWORD v135[2];
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  char v143;
  _OWORD v144[2];
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  char v152;
  _OWORD v153[2];
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  char v161;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  v91 = a3;
  swift_release();
  swift_release();
  swift_release();
  v12 = LOBYTE(v153[0]);
  v13 = *(_BYTE *)(a1 + 297);
  if ((v13 & 1) != 0)
  {
    v14 = *(_OWORD *)(a1 + 112);
    v158 = *(_OWORD *)(a1 + 96);
    v159 = v14;
    v160 = *(_OWORD *)(a1 + 128);
    v161 = *(_BYTE *)(a1 + 144);
    v15 = *(_OWORD *)(a1 + 48);
    v154 = *(_OWORD *)(a1 + 32);
    v155 = v15;
    v16 = *(_OWORD *)(a1 + 80);
    v156 = *(_OWORD *)(a1 + 64);
    v157 = v16;
    v17 = *(_OWORD *)(a1 + 16);
    v153[0] = *(_OWORD *)a1;
    v153[1] = v17;
  }
  else
  {
    v18 = *(_OWORD *)(a1 + 248);
    v19 = *(_OWORD *)(a1 + 200);
    v154 = *(_OWORD *)(a1 + 184);
    v155 = v19;
    v20 = *(_OWORD *)(a1 + 232);
    v156 = *(_OWORD *)(a1 + 216);
    v157 = v20;
    v21 = *(_OWORD *)(a1 + 168);
    v153[0] = *(_OWORD *)(a1 + 152);
    v153[1] = v21;
    v22 = *(_OWORD *)(a1 + 264);
    v23 = *(_OWORD *)(a1 + 280);
    v158 = v18;
    v159 = v22;
    v161 = *(_BYTE *)(a1 + 296);
    v160 = v23;
  }
  v24 = *((_QWORD *)&v154 + 1);
  v87 = v158;
  v90 = v157;
  v26 = *((_QWORD *)&v160 + 1);
  v25 = v160;
  v27 = v154;
  v28 = (void *)*((_QWORD *)&v153[1] + 1);
  v29 = *(_QWORD *)&v153[0];
  v30 = v161 & 1;
  v81 = v156;
  v84 = v159;
  v75 = *(_OWORD *)((char *)v153 + 8);
  v78 = v155;
  sub_18B708DEC(v153);
  v124 = v75;
  v123 = v29;
  v125 = v28;
  v126 = v27;
  v127 = v24;
  v128 = v78;
  v129 = v81;
  v130 = v90;
  v131 = v87;
  v132 = v84;
  v133 = __PAIR128__(v26, v25);
  v134 = v30;
  v31 = v28;
  sub_18B709000((uint64_t)&v123);
  objc_msgSend(v31, sel_pointSize);
  v33 = v32;

  if ((v13 & 1) != 0)
  {
    v34 = *(_OWORD *)(a1 + 248);
    v35 = *(_OWORD *)(a1 + 200);
    v145 = *(_OWORD *)(a1 + 184);
    v146 = v35;
    v36 = *(_OWORD *)(a1 + 232);
    v147 = *(_OWORD *)(a1 + 216);
    v148 = v36;
    v37 = *(_OWORD *)(a1 + 168);
    v144[0] = *(_OWORD *)(a1 + 152);
    v144[1] = v37;
    v38 = *(_OWORD *)(a1 + 264);
    v39 = *(_OWORD *)(a1 + 280);
    v149 = v34;
    v150 = v38;
    v152 = *(_BYTE *)(a1 + 296);
    v151 = v39;
  }
  else
  {
    v40 = *(_OWORD *)(a1 + 112);
    v149 = *(_OWORD *)(a1 + 96);
    v150 = v40;
    v151 = *(_OWORD *)(a1 + 128);
    v152 = *(_BYTE *)(a1 + 144);
    v41 = *(_OWORD *)(a1 + 48);
    v145 = *(_OWORD *)(a1 + 32);
    v146 = v41;
    v42 = *(_OWORD *)(a1 + 80);
    v147 = *(_OWORD *)(a1 + 64);
    v148 = v42;
    v43 = *(_OWORD *)(a1 + 16);
    v144[0] = *(_OWORD *)a1;
    v144[1] = v43;
  }
  v44 = *((_QWORD *)&v145 + 1);
  v85 = v149;
  v88 = v148;
  v45 = v151;
  v46 = v145;
  v47 = (void *)*((_QWORD *)&v144[1] + 1);
  v48 = *(_QWORD *)&v144[0];
  v49 = v152 & 1;
  v79 = v147;
  v82 = v150;
  v73 = *(_OWORD *)((char *)v144 + 8);
  v76 = v146;
  sub_18B708DEC(v144);
  v112 = v73;
  v111 = v48;
  v113 = v47;
  v114 = v46;
  v115 = v44;
  v116 = v76;
  v117 = v79;
  v118 = v88;
  v119 = v85;
  v120 = v82;
  v121 = v45;
  v122 = v49;
  v50 = v47;
  sub_18B709000((uint64_t)&v111);
  objc_msgSend(v50, sel_pointSize);
  v52 = v51;

  if (!v12)
  {
    if ((v13 & 1) == 0)
      goto LABEL_9;
LABEL_11:
    v59 = *(_OWORD *)(a1 + 112);
    v140 = *(_OWORD *)(a1 + 96);
    v141 = v59;
    v142 = *(_OWORD *)(a1 + 128);
    v143 = *(_BYTE *)(a1 + 144);
    v60 = *(_OWORD *)(a1 + 48);
    v136 = *(_OWORD *)(a1 + 32);
    v137 = v60;
    v61 = *(_OWORD *)(a1 + 80);
    v138 = *(_OWORD *)(a1 + 64);
    v139 = v61;
    v62 = *(_OWORD *)(a1 + 16);
    v135[0] = *(_OWORD *)a1;
    v135[1] = v62;
    goto LABEL_12;
  }
  if ((v13 & 1) == 0)
    goto LABEL_11;
LABEL_9:
  v53 = *(_OWORD *)(a1 + 248);
  v54 = *(_OWORD *)(a1 + 200);
  v136 = *(_OWORD *)(a1 + 184);
  v137 = v54;
  v55 = *(_OWORD *)(a1 + 232);
  v138 = *(_OWORD *)(a1 + 216);
  v139 = v55;
  v56 = *(_OWORD *)(a1 + 168);
  v135[0] = *(_OWORD *)(a1 + 152);
  v135[1] = v56;
  v57 = *(_OWORD *)(a1 + 264);
  v58 = *(_OWORD *)(a1 + 280);
  v140 = v53;
  v141 = v57;
  v143 = *(_BYTE *)(a1 + 296);
  v142 = v58;
LABEL_12:
  v63 = *((_QWORD *)&v136 + 1);
  v86 = v140;
  v89 = v139;
  v64 = v142;
  v65 = v136;
  v66 = (void *)*((_QWORD *)&v135[1] + 1);
  v67 = *(_QWORD *)&v135[0];
  v68 = v143 & 1;
  v80 = v138;
  v83 = v141;
  v74 = *(_OWORD *)((char *)v135 + 8);
  v77 = v137;
  sub_18B708DEC(v135);
  v99 = v67;
  v100 = v74;
  v101 = v66;
  v102 = v65;
  v103 = v63;
  v104 = v77;
  v105 = v80;
  v106 = v89;
  v107 = v86;
  v108 = v83;
  v109 = v64;
  v110 = v68;
  v69 = v66;
  sub_18B709000((uint64_t)&v99);
  v70 = sub_18B729100();
  v71 = sub_18B7290DC();
  *a9 = v70;
  a9[1] = v71;
  v72 = __swift_instantiateConcreteTypeFromMangledName(a5);
  sub_18B70591C(a2, v91, a4 & 1, v12, a1, (uint64_t)v69, a6, a7, (uint64_t)a9 + *(int *)(v72 + 44), v33 / v52, a8, a10);

}

uint64_t sub_18B704204@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, uint64_t a4@<X8>)
{
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
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  int v32;
  uint64_t v33;
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t *v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  char v51;
  char v52;
  unint64_t v53;
  uint64_t v54;
  void *v55;
  void *v56;
  id v57;
  id v58;
  char v59;
  void *v60;
  uint64_t v61;
  uint64_t v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint64_t v68;
  id v69;
  id v70;
  uint64_t v71;
  char v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v82;
  uint64_t v83;
  uint64_t v84;
  char *v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  char *v89;
  char *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  int v97;
  uint64_t v98;
  char v99;
  uint64_t v100;
  char v101;
  __int128 v102;
  _OWORD v103[9];
  char v104;
  _BYTE v105[304];
  _BYTE v106[312];
  CGRect v107;
  CGRect v108;

  v97 = a3;
  v93 = a1;
  v95 = a4;
  v96 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5458);
  MEMORY[0x1E0C80A78](v96);
  v90 = (char *)&v82 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  v7 = MEMORY[0x1E0C80A78](v6);
  v87 = (uint64_t)&v82 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v7);
  v86 = (uint64_t)&v82 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v89 = (char *)&v82 - v12;
  MEMORY[0x1E0C80A78](v11);
  v88 = (char *)&v82 - v13;
  v91 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52C8);
  MEMORY[0x1E0C80A78](v91);
  v92 = (uint64_t)&v82 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v94 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5468);
  MEMORY[0x1E0C80A78](v94);
  v85 = (char *)&v82 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v83 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52D8);
  MEMORY[0x1E0C80A78](v83);
  v84 = (uint64_t)&v82 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v82 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5358);
  v21 = MEMORY[0x1E0C80A78](v20);
  v23 = (char *)&v82 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v21);
  v25 = (char *)&v82 - v24;
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  v27 = MEMORY[0x1E0C80A78](v26);
  v29 = (char *)&v82 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v82 - v30;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v106, v105);
  sub_18B7086A4(v105, v106);
  v32 = sub_18B7086E0((uint64_t)v106);
  v33 = sub_18B7086EC((uint64_t)v106);
  if (v32 == 1)
  {
    sub_18B708890((uint64_t)v105);
    v34 = v97 & 1;
    v35 = (uint64_t)v88;
    v36 = v93;
    sub_18B704AE0(v93, a2, v97 & 1);
    v37 = (uint64_t)v89;
    sub_18B704D50(v36, a2, v34);
    v38 = &qword_1EDFD5350;
    v39 = v86;
    sub_18B7096D0(v35, v86, &qword_1EDFD5350);
    v40 = v87;
    sub_18B7096D0(v37, v87, &qword_1EDFD5350);
    v41 = (uint64_t)v90;
    sub_18B7096D0(v39, (uint64_t)v90, &qword_1EDFD5350);
    v42 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E18);
    sub_18B7096D0(v40, v41 + *(int *)(v42 + 48), &qword_1EDFD5350);
    sub_18B709714(v40, &qword_1EDFD5350);
    sub_18B709714(v39, &qword_1EDFD5350);
    sub_18B7096D0(v41, v92, &qword_1EDFD5458);
    swift_storeEnumTagMultiPayload();
    v43 = MEMORY[0x1E0CE0680];
    sub_18B709970(&qword_1EDFD5460, &qword_1EDFD5468, MEMORY[0x1E0CE0680]);
    sub_18B709970(&qword_1EDFD5450, &qword_1EDFD5458, v43);
    sub_18B7291CC();
    sub_18B709714(v41, &qword_1EDFD5458);
    v44 = v37;
    v45 = &qword_1EDFD5350;
  }
  else
  {
    v46 = (uint64_t *)v33;
    v87 = v17;
    v88 = v29;
    v89 = v23;
    v90 = v25;
    v47 = *(_OWORD *)(v33 + 112);
    v103[6] = *(_OWORD *)(v33 + 96);
    v103[7] = v47;
    v103[8] = *(_OWORD *)(v33 + 128);
    v104 = *(_BYTE *)(v33 + 144);
    v48 = *(_OWORD *)(v33 + 48);
    v103[2] = *(_OWORD *)(v33 + 32);
    v103[3] = v48;
    v49 = *(_OWORD *)(v33 + 80);
    v103[4] = *(_OWORD *)(v33 + 64);
    v103[5] = v49;
    v50 = *(_OWORD *)(v33 + 16);
    v103[0] = *(_OWORD *)v33;
    v103[1] = v50;
    v51 = v97 & 1;
    sub_18B702298(v93, a2, v97 & 1, (uint64_t)v31);
    swift_retain();
    v52 = sub_18B71A600();
    swift_release();
    v82 = v31;
    if ((v52 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
      *(double *)&v67 = CGRectGetWidth(v107);
      sub_18B7029F4((uint64_t)v103, 0, v67, 0, a2, v51, (uint64_t)v19);
      sub_18B7096D0((uint64_t)v19, v84, &qword_1EDFD5300);
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5278);
      sub_18B70922C();
      sub_18B7092E0();
      v68 = (uint64_t)v90;
      sub_18B7291CC();
      sub_18B709714((uint64_t)v19, &qword_1EDFD5300);
    }
    else
    {
      v54 = *v46;
      v53 = v46[1];
      v56 = (void *)v46[2];
      v55 = (void *)v46[3];
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      v57 = v55;
      swift_bridgeObjectRetain();
      v58 = v56;
      sub_18B728FE0();
      swift_release();
      swift_release();
      swift_release();
      v59 = v98;
      v60 = (void *)objc_opt_self();
      objc_msgSend(v60, sel_minimumScaleFactor);
      v62 = v61;
      v63 = v57;
      swift_bridgeObjectRetain();
      v64 = v58;
      v65 = v84;
      if ((v97 & 1) != 0)
        v66 = (void *)sub_18B708060(v54, v53);
      else
        v66 = 0;
      v69 = v66;
      v70 = v63;

      swift_bridgeObjectRelease();
      objc_msgSend(v60, sel_maximumHorizontalTextBounds);
      CGRectGetWidth(v108);
      sub_18B7292E0();
      sub_18B729028();
      v71 = v98;
      v72 = v99;
      v73 = v100;
      v74 = v101;
      *(_QWORD *)v65 = v70;
      *(_QWORD *)(v65 + 8) = v62;
      *(_QWORD *)(v65 + 16) = v54;
      *(_QWORD *)(v65 + 24) = v53;
      *(_QWORD *)(v65 + 32) = v64;
      *(_QWORD *)(v65 + 40) = v66;
      *(_BYTE *)(v65 + 48) = v59;
      *(_BYTE *)(v65 + 49) = 0;
      *(_QWORD *)(v65 + 56) = v71;
      *(_BYTE *)(v65 + 64) = v72;
      *(_QWORD *)(v65 + 72) = v73;
      *(_BYTE *)(v65 + 80) = v74;
      *(_OWORD *)(v65 + 88) = v102;
      swift_storeEnumTagMultiPayload();
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5278);
      sub_18B70922C();
      sub_18B7092E0();
      v68 = (uint64_t)v90;
      sub_18B7291CC();
    }
    v75 = v92;
    v76 = (uint64_t)v85;
    v78 = (uint64_t)v88;
    v77 = (uint64_t)v89;
    v38 = &qword_1EDFD5390;
    v35 = (uint64_t)v82;
    sub_18B7096D0((uint64_t)v82, (uint64_t)v88, &qword_1EDFD5390);
    sub_18B7096D0(v68, v77, &qword_1EDFD5358);
    sub_18B7096D0(v78, v76, &qword_1EDFD5390);
    v79 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5398);
    sub_18B7096D0(v77, v76 + *(int *)(v79 + 48), &qword_1EDFD5358);
    sub_18B709714(v77, &qword_1EDFD5358);
    sub_18B709714(v78, &qword_1EDFD5390);
    sub_18B7096D0(v76, v75, &qword_1EDFD5468);
    swift_storeEnumTagMultiPayload();
    v80 = MEMORY[0x1E0CE0680];
    sub_18B709970(&qword_1EDFD5460, &qword_1EDFD5468, MEMORY[0x1E0CE0680]);
    sub_18B709970(&qword_1EDFD5450, &qword_1EDFD5458, v80);
    sub_18B7291CC();
    sub_18B708890((uint64_t)v105);
    sub_18B709714(v76, &qword_1EDFD5468);
    v44 = v68;
    v45 = &qword_1EDFD5358;
  }
  sub_18B709714(v44, v45);
  return sub_18B709714(v35, v38);
}

uint64_t sub_18B704AE0(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v20;
  _QWORD v21[2];
  _OWORD v22[9];
  char v23;
  _BYTE v24[304];
  _BYTE v25[312];
  CGRect v26;

  v21[1] = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v25, v24);
  sub_18B7086A4(v24, v25);
  v11 = sub_18B7086E0((uint64_t)v25);
  v12 = sub_18B7086EC((uint64_t)v25);
  if (v11 != 1)
    goto LABEL_3;
  v13 = *(_OWORD *)(v12 + 112);
  v14 = *(_OWORD *)(v12 + 128);
  v15 = *(_OWORD *)(v12 + 80);
  v22[6] = *(_OWORD *)(v12 + 96);
  v22[7] = v13;
  v22[8] = v14;
  v16 = *(_OWORD *)(v12 + 48);
  v17 = *(_OWORD *)(v12 + 64);
  v22[2] = *(_OWORD *)(v12 + 32);
  v22[3] = v16;
  v23 = *(_BYTE *)(v12 + 144);
  v22[4] = v17;
  v22[5] = v15;
  v18 = *(_OWORD *)(v12 + 16);
  v22[0] = *(_OWORD *)v12;
  v22[1] = v18;
  if ((*(_BYTE *)(v12 + 32) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
    *(double *)&v20 = CGRectGetWidth(v26);
    sub_18B7029F4((uint64_t)v22, 0, v20, 0, a2, a3 & 1, (uint64_t)v10);
    sub_18B7096D0((uint64_t)v10, (uint64_t)v7, &qword_1EDFD5300);
    swift_storeEnumTagMultiPayload();
    sub_18B70922C();
    sub_18B7291CC();
    sub_18B708890((uint64_t)v24);
    return sub_18B709714((uint64_t)v10, &qword_1EDFD5300);
  }
  else
  {
LABEL_3:
    sub_18B708890((uint64_t)v24);
    swift_storeEnumTagMultiPayload();
    sub_18B70922C();
    return sub_18B7291CC();
  }
}

uint64_t sub_18B704D50(uint64_t a1, uint64_t a2, char a3)
{
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v20;
  _QWORD v21[2];
  _OWORD v22[9];
  char v23;
  _BYTE v24[304];
  _BYTE v25[312];
  CGRect v26;

  v21[1] = a1;
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD52D0);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v21 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v25, v24);
  sub_18B7086A4(v24, v25);
  v11 = sub_18B7086E0((uint64_t)v25);
  v12 = sub_18B7086EC((uint64_t)v25);
  if (v11 != 1)
    goto LABEL_3;
  v13 = *(_OWORD *)(v12 + 248);
  v14 = *(_OWORD *)(v12 + 200);
  v22[2] = *(_OWORD *)(v12 + 184);
  v22[3] = v14;
  v15 = *(_OWORD *)(v12 + 232);
  v22[4] = *(_OWORD *)(v12 + 216);
  v22[5] = v15;
  v16 = *(_OWORD *)(v12 + 168);
  v22[0] = *(_OWORD *)(v12 + 152);
  v22[1] = v16;
  v17 = *(_OWORD *)(v12 + 264);
  v18 = *(_OWORD *)(v12 + 280);
  v22[6] = v13;
  v22[7] = v17;
  v23 = *(_BYTE *)(v12 + 296);
  v22[8] = v18;
  if ((*(_BYTE *)(v12 + 184) & 1) == 0)
  {
    objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
    *(double *)&v20 = CGRectGetWidth(v26);
    sub_18B7029F4((uint64_t)v22, 0, v20, 0, a2, a3 & 1, (uint64_t)v10);
    sub_18B7096D0((uint64_t)v10, (uint64_t)v7, &qword_1EDFD5300);
    swift_storeEnumTagMultiPayload();
    sub_18B70922C();
    sub_18B7291CC();
    sub_18B708890((uint64_t)v24);
    return sub_18B709714((uint64_t)v10, &qword_1EDFD5300);
  }
  else
  {
LABEL_3:
    sub_18B708890((uint64_t)v24);
    swift_storeEnumTagMultiPayload();
    sub_18B70922C();
    return sub_18B7291CC();
  }
}

uint64_t sub_18B704FD0@<X0>(char a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, char a4@<W3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  char v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  char v47;
  char v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  char v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  char v77;
  _OWORD v78[9];
  char v79;
  CGRect v80;

  v74 = a7;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v15);
  v68 = (char *)&v66 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v72 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E80);
  v71 = *(_QWORD *)(v72 - 8);
  MEMORY[0x1E0C80A78](v72);
  v67 = (uint64_t)&v66 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E78);
  v19 = MEMORY[0x1E0C80A78](v18);
  v73 = (uint64_t)&v66 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v66 - v21;
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v66 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8EC0);
  v26 = MEMORY[0x1E0C80A78](v69);
  v75 = (uint64_t)&v66 - ((v27 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v26);
  v76 = (uint64_t)&v66 - v28;
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F20);
  v30 = MEMORY[0x1E0C80A78](v29);
  v70 = (uint64_t)&v66 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v33 = (uint64_t *)((char *)&v66 - v32);
  v34 = a1;
  if ((a1 & 1) != 0)
  {
    v35 = a4;
    v36 = sub_18B729100();
    v37 = sub_18B7290E8();
    *v33 = v36;
    v33[1] = v37;
    a4 = v35;
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F38);
    sub_18B705608(a2, a3, v35 & 1, 1, (uint64_t)v33 + *(int *)(v38 + 44), a8);
    v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F28);
    v40 = (uint64_t)v33;
    (*(void (**)(uint64_t *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v39 - 8) + 56))(v33, 0, 1, v39);
  }
  else
  {
    v41 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F28);
    v40 = (uint64_t)v33;
    (*(void (**)(uint64_t *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v41 - 8) + 56))(v33, 1, 1, v41);
  }
  v42 = *(_OWORD *)(a5 + 112);
  v78[6] = *(_OWORD *)(a5 + 96);
  v78[7] = v42;
  v78[8] = *(_OWORD *)(a5 + 128);
  v79 = *(_BYTE *)(a5 + 144);
  v43 = *(_OWORD *)(a5 + 48);
  v78[2] = *(_OWORD *)(a5 + 32);
  v78[3] = v43;
  v44 = *(_OWORD *)(a5 + 80);
  v78[4] = *(_OWORD *)(a5 + 64);
  v78[5] = v44;
  v45 = *(_OWORD *)(a5 + 16);
  v78[0] = *(_OWORD *)a5;
  v78[1] = v45;
  objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
  *(double *)&v46 = CGRectGetWidth(v80);
  v47 = a4 & 1;
  sub_18B7029F4((uint64_t)v78, a6, v46, 0, a3, a4 & 1, (uint64_t)v25);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v48 = v77;
  v49 = v75;
  sub_18B7096D0((uint64_t)v25, v75, &qword_1EDFD5300);
  v50 = v49 + *(int *)(v69 + 36);
  *(_BYTE *)v50 = v48;
  v51 = a2;
  v52 = v34 & 1;
  *(_BYTE *)(v50 + 1) = v34 & 1;
  *(_BYTE *)(v50 + 2) = 0;
  *(double *)(v50 + 8) = a8;
  sub_18B709714((uint64_t)v25, &qword_1EDFD5300);
  sub_18B709750(v49, v76, &qword_1EDFD8EC0);
  v53 = 1;
  v54 = v72;
  if ((v34 & 1) == 0)
  {
    v55 = (uint64_t)v68;
    sub_18B704D50(v51, a3, v47);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v56 = v77;
    v57 = v67;
    sub_18B7096D0(v55, v67, &qword_1EDFD5350);
    v58 = v57 + *(int *)(v54 + 36);
    *(_BYTE *)v58 = v56;
    *(_BYTE *)(v58 + 1) = v52;
    *(_BYTE *)(v58 + 2) = 1;
    *(double *)(v58 + 8) = a8;
    sub_18B709714(v55, &qword_1EDFD5350);
    sub_18B709750(v57, (uint64_t)v22, &qword_1EDFD8E80);
    v53 = 0;
  }
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v71 + 56))(v22, v53, 1, v54);
  v59 = v70;
  sub_18B7096D0(v40, v70, &qword_1EDFD8F20);
  v60 = v76;
  v61 = v75;
  sub_18B7096D0(v76, v75, &qword_1EDFD8EC0);
  v62 = v73;
  sub_18B7096D0((uint64_t)v22, v73, &qword_1EDFD8E78);
  v63 = v74;
  sub_18B7096D0(v59, v74, &qword_1EDFD8F20);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F30);
  sub_18B7096D0(v61, v63 + *(int *)(v64 + 48), &qword_1EDFD8EC0);
  sub_18B7096D0(v62, v63 + *(int *)(v64 + 64), &qword_1EDFD8E78);
  sub_18B709714((uint64_t)v22, &qword_1EDFD8E78);
  sub_18B709714(v60, &qword_1EDFD8EC0);
  sub_18B709714(v40, &qword_1EDFD8F20);
  sub_18B709714(v62, &qword_1EDFD8E78);
  sub_18B709714(v61, &qword_1EDFD8EC0);
  return sub_18B709714(v59, &qword_1EDFD8F20);
}

uint64_t sub_18B705608@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  int v32;
  uint64_t v33;
  char v34;

  v32 = a4;
  v33 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v31 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E88);
  v13 = MEMORY[0x1E0C80A78](v31);
  v15 = (char *)&v31 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v31 - v16;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v31 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F40);
  v22 = MEMORY[0x1E0C80A78](v21);
  v24 = (char *)&v31 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v22);
  v26 = (char *)&v31 - v25;
  sub_18B704AE0(a1, a2, a3);
  sub_18B7096D0((uint64_t)v20, (uint64_t)v24, &qword_1EDFD5350);
  sub_18B709714((uint64_t)v20, &qword_1EDFD5350);
  sub_18B709750((uint64_t)v24, (uint64_t)v26, &qword_1EDFD8F40);
  sub_18B702298(a1, a2, a3, (uint64_t)v12);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(a3) = v34;
  sub_18B7096D0((uint64_t)v12, (uint64_t)v15, &qword_1EDFD5390);
  v27 = &v15[*(int *)(v31 + 36)];
  *v27 = a3;
  v27[1] = v32;
  v27[2] = 1;
  *((double *)v27 + 1) = a6;
  sub_18B709714((uint64_t)v12, &qword_1EDFD5390);
  sub_18B709750((uint64_t)v15, (uint64_t)v17, &qword_1EDFD8E88);
  sub_18B7096D0((uint64_t)v26, (uint64_t)v24, &qword_1EDFD8F40);
  sub_18B7096D0((uint64_t)v17, (uint64_t)v15, &qword_1EDFD8E88);
  v28 = v33;
  sub_18B7096D0((uint64_t)v24, v33, &qword_1EDFD8F40);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F48);
  sub_18B7096D0((uint64_t)v15, v28 + *(int *)(v29 + 48), &qword_1EDFD8E88);
  sub_18B709714((uint64_t)v17, &qword_1EDFD8E88);
  sub_18B709714((uint64_t)v26, &qword_1EDFD8F40);
  sub_18B709714((uint64_t)v15, &qword_1EDFD8E88);
  return sub_18B709714((uint64_t)v24, &qword_1EDFD8F40);
}

uint64_t sub_18B70591C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, unsigned int a4@<W3>, uint64_t a5@<X4>, uint64_t a6@<X5>, uint64_t *a7@<X6>, uint64_t *a8@<X7>, uint64_t a9@<X8>, double a10@<D0>, void (*a11)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double), uint64_t *a12)
{
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  double *v22;
  uint64_t v23;
  uint64_t v24;
  double *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  double v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v40;
  uint64_t *v41;
  unsigned int v42;
  void (*v43)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, double);
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;

  v41 = a8;
  v44 = a5;
  v45 = a6;
  v42 = a4;
  v46 = a9;
  v47 = a12;
  v43 = a11;
  v17 = __swift_instantiateConcreteTypeFromMangledName(a7);
  v18 = MEMORY[0x1E0C80A78](v17);
  v20 = (char *)&v40 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v18);
  v22 = (double *)((char *)&v40 - v21);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E50);
  MEMORY[0x1E0C80A78](v23);
  v25 = (double *)((char *)&v40 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E58);
  v27 = MEMORY[0x1E0C80A78](v26);
  v29 = (char *)&v40 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v40 - v30;
  v32 = sub_18B729100();
  v33 = sub_18B701240();
  *(_QWORD *)v25 = v32;
  v25[1] = v33;
  *((_BYTE *)v25 + 16) = 0;
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E60);
  sub_18B705BCC(a1, a2, a3, (uint64_t)v25 + *(int *)(v34 + 44));
  sub_18B7096D0((uint64_t)v25, (uint64_t)v29, &qword_1EDFD8E50);
  sub_18B709714((uint64_t)v25, &qword_1EDFD8E50);
  sub_18B709750((uint64_t)v29, (uint64_t)v31, &qword_1EDFD8E58);
  v35 = sub_18B729100();
  v36 = sub_18B701240();
  *(_QWORD *)v22 = v35;
  v22[1] = v36;
  *((_BYTE *)v22 + 16) = 0;
  __swift_instantiateConcreteTypeFromMangledName(v41);
  v43(v42, a1, a2, a3, v44, v45, a10);
  sub_18B7096D0((uint64_t)v31, (uint64_t)v29, &qword_1EDFD8E58);
  sub_18B7096D0((uint64_t)v22, (uint64_t)v20, a7);
  v37 = v46;
  sub_18B7096D0((uint64_t)v29, v46, &qword_1EDFD8E58);
  v38 = __swift_instantiateConcreteTypeFromMangledName(v47);
  sub_18B7096D0((uint64_t)v20, v37 + *(int *)(v38 + 48), a7);
  sub_18B709714((uint64_t)v22, a7);
  sub_18B709714((uint64_t)v31, &qword_1EDFD8E58);
  sub_18B709714((uint64_t)v20, a7);
  return sub_18B709714((uint64_t)v29, &qword_1EDFD8E58);
}

uint64_t sub_18B705BCC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, char a3@<W2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  uint64_t v9;
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
  uint64_t v22;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  v9 = MEMORY[0x1E0C80A78](v8);
  v11 = (char *)&v22 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v22 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v22 - v16;
  MEMORY[0x1E0C80A78](v15);
  v19 = (char *)&v22 - v18;
  sub_18B704AE0(a1, a2, a3);
  sub_18B704D50(a1, a2, a3);
  sub_18B7096D0((uint64_t)v19, (uint64_t)v14, &qword_1EDFD5350);
  sub_18B7096D0((uint64_t)v17, (uint64_t)v11, &qword_1EDFD5350);
  sub_18B7096D0((uint64_t)v14, a4, &qword_1EDFD5350);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E18);
  sub_18B7096D0((uint64_t)v11, a4 + *(int *)(v20 + 48), &qword_1EDFD5350);
  sub_18B709714((uint64_t)v17, &qword_1EDFD5350);
  sub_18B709714((uint64_t)v19, &qword_1EDFD5350);
  sub_18B709714((uint64_t)v11, &qword_1EDFD5350);
  return sub_18B709714((uint64_t)v14, &qword_1EDFD5350);
}

uint64_t sub_18B705D50@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X4>, void *a6@<X5>, uint64_t a7@<X8>, double a8@<D0>)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char v39;
  char *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  char v44;
  char *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint64_t v52;
  uint64_t v53;
  char v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char *v65;
  uint64_t v66;
  uint64_t v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  int v72;
  uint64_t v73;
  uint64_t v74;
  int v75;
  char v76;
  _OWORD v77[9];
  char v78;
  CGRect v79;

  v68 = a6;
  v75 = a4;
  v67 = a2;
  v74 = a7;
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5300);
  MEMORY[0x1E0C80A78](v12);
  v70 = (uint64_t)&v62 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8EC0);
  v14 = MEMORY[0x1E0C80A78](v69);
  v71 = (uint64_t)&v62 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v14);
  v73 = (uint64_t)&v62 - v16;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v17);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E80);
  v20 = MEMORY[0x1E0C80A78](v64);
  v22 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v20);
  v24 = (char *)&v62 - v23;
  v63 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8EC8);
  MEMORY[0x1E0C80A78](v63);
  v26 = (char *)&v62 - ((v25 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  MEMORY[0x1E0C80A78](v27);
  v29 = (char *)&v62 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
  v62 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E88);
  v30 = MEMORY[0x1E0C80A78](v62);
  v32 = (char *)&v62 - ((v31 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v30);
  v34 = (char *)&v62 - v33;
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8ED0);
  v36 = MEMORY[0x1E0C80A78](v35);
  v66 = (uint64_t)&v62 - ((v37 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v36);
  v65 = (char *)&v62 - v38;
  v72 = a1;
  if ((a1 & 1) != 0)
  {
    sub_18B702298(v67, a3, v75 & 1, (uint64_t)v29);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v39 = v77[0];
    sub_18B7096D0((uint64_t)v29, (uint64_t)v32, &qword_1EDFD5390);
    v40 = &v32[*(int *)(v62 + 36)];
    *v40 = v39;
    *(_WORD *)(v40 + 1) = 257;
    *((double *)v40 + 1) = a8;
    sub_18B709714((uint64_t)v29, &qword_1EDFD5390);
    sub_18B709750((uint64_t)v32, (uint64_t)v34, &qword_1EDFD8E88);
    sub_18B7096D0((uint64_t)v34, (uint64_t)v26, &qword_1EDFD8E88);
    swift_storeEnumTagMultiPayload();
    sub_18B709404();
    sub_18B709540();
    v41 = (uint64_t)v65;
    sub_18B7291CC();
    v42 = (uint64_t)v34;
    v43 = &qword_1EDFD8E88;
  }
  else
  {
    sub_18B704AE0(v67, a3, v75 & 1);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v44 = v77[0];
    sub_18B7096D0((uint64_t)v19, (uint64_t)v22, &qword_1EDFD5350);
    v45 = &v22[*(int *)(v64 + 36)];
    *v45 = v44;
    *(_WORD *)(v45 + 1) = 256;
    *((double *)v45 + 1) = a8;
    sub_18B709714((uint64_t)v19, &qword_1EDFD5350);
    sub_18B709750((uint64_t)v22, (uint64_t)v24, &qword_1EDFD8E80);
    sub_18B7096D0((uint64_t)v24, (uint64_t)v26, &qword_1EDFD8E80);
    swift_storeEnumTagMultiPayload();
    sub_18B709404();
    sub_18B709540();
    v41 = (uint64_t)v65;
    sub_18B7291CC();
    v42 = (uint64_t)v24;
    v43 = &qword_1EDFD8E80;
  }
  sub_18B709714(v42, v43);
  v46 = *(_OWORD *)(a5 + 248);
  v47 = *(_OWORD *)(a5 + 200);
  v77[2] = *(_OWORD *)(a5 + 184);
  v77[3] = v47;
  v48 = *(_OWORD *)(a5 + 232);
  v77[4] = *(_OWORD *)(a5 + 216);
  v77[5] = v48;
  v49 = *(_OWORD *)(a5 + 168);
  v77[0] = *(_OWORD *)(a5 + 152);
  v77[1] = v49;
  v50 = *(_OWORD *)(a5 + 264);
  v51 = *(_OWORD *)(a5 + 280);
  v77[6] = v46;
  v77[7] = v50;
  v78 = *(_BYTE *)(a5 + 296);
  v77[8] = v51;
  objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
  *(double *)&v52 = CGRectGetWidth(v79);
  v53 = v70;
  sub_18B7029F4((uint64_t)v77, v68, v52, 0, a3, v75 & 1, v70);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v54 = v76;
  v55 = v71;
  sub_18B7096D0(v53, v71, &qword_1EDFD5300);
  v56 = v55 + *(int *)(v69 + 36);
  *(_BYTE *)v56 = v54;
  *(_WORD *)(v56 + 1) = v72 & 1;
  *(double *)(v56 + 8) = a8;
  sub_18B709714(v53, &qword_1EDFD5300);
  v57 = v73;
  sub_18B709750(v55, v73, &qword_1EDFD8EC0);
  v58 = v66;
  sub_18B7096D0(v41, v66, &qword_1EDFD8ED0);
  sub_18B7096D0(v57, v55, &qword_1EDFD8EC0);
  v59 = v74;
  sub_18B7096D0(v58, v74, &qword_1EDFD8ED0);
  v60 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8EF8);
  sub_18B7096D0(v55, v59 + *(int *)(v60 + 48), &qword_1EDFD8EC0);
  sub_18B709714(v57, &qword_1EDFD8EC0);
  sub_18B709714(v41, &qword_1EDFD8ED0);
  sub_18B709714(v55, &qword_1EDFD8EC0);
  return sub_18B709714(v58, &qword_1EDFD8ED0);
}

uint64_t sub_18B7064B4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  uint64_t v36;

  v35 = a4;
  v36 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E48);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11);
  v15 = (double *)&v34[-v14];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E50);
  MEMORY[0x1E0C80A78](v16);
  v18 = (double *)&v34[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E58);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = &v34[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v24 = &v34[-v23];
  v25 = sub_18B729100();
  v26 = sub_18B701240();
  *(_QWORD *)v18 = v25;
  v18[1] = v26;
  *((_BYTE *)v18 + 16) = 0;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E60);
  sub_18B705BCC(a1, a2, a3, (uint64_t)v18 + *(int *)(v27 + 44));
  sub_18B7096D0((uint64_t)v18, (uint64_t)v22, &qword_1EDFD8E50);
  sub_18B709714((uint64_t)v18, &qword_1EDFD8E50);
  sub_18B709750((uint64_t)v22, (uint64_t)v24, &qword_1EDFD8E58);
  v28 = sub_18B729100();
  v29 = sub_18B701240();
  *(_QWORD *)v15 = v28;
  v15[1] = v29;
  *((_BYTE *)v15 + 16) = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E68);
  sub_18B706750(v35, a1, a2, a3, (uint64_t)v15 + *(int *)(v30 + 44), a6);
  sub_18B7096D0((uint64_t)v24, (uint64_t)v22, &qword_1EDFD8E58);
  sub_18B7096D0((uint64_t)v15, (uint64_t)v13, &qword_1EDFD8E48);
  v31 = v36;
  sub_18B7096D0((uint64_t)v22, v36, &qword_1EDFD8E58);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E70);
  sub_18B7096D0((uint64_t)v13, v31 + *(int *)(v32 + 48), &qword_1EDFD8E48);
  sub_18B709714((uint64_t)v15, &qword_1EDFD8E48);
  sub_18B709714((uint64_t)v24, &qword_1EDFD8E58);
  sub_18B709714((uint64_t)v13, &qword_1EDFD8E48);
  return sub_18B709714((uint64_t)v22, &qword_1EDFD8E58);
}

uint64_t sub_18B706750@<X0>(int a1@<W0>, uint64_t a2@<X1>, uint64_t a3@<X2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  _BYTE *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BYTE *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _BYTE *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE *v35;
  char v36;
  _BYTE *v37;
  uint64_t v38;
  uint64_t v39;
  char v40;
  char v41;
  uint64_t v42;
  double *v43;
  char v44;
  char v45;
  uint64_t v46;
  char v47;
  double *v48;
  _BYTE *v49;
  _BYTE *v50;
  _BYTE *v51;
  _BYTE *v52;
  uint64_t v53;
  uint64_t v54;
  _BYTE v56[4];
  int v57;
  uint64_t v58;
  int v59;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  _BYTE *v63;
  uint64_t v64;
  _BYTE *v65;
  _BYTE *v66;
  _BYTE *v67;
  char v68;
  char v69;
  char v70;

  v64 = a5;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E78);
  v12 = MEMORY[0x1E0C80A78](v11);
  v65 = &v56[-((v13 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v12);
  v63 = &v56[-v14];
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v15);
  v17 = &v56[-((v16 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E80);
  v19 = *(_QWORD *)(v18 - 8);
  v60 = v18;
  v61 = v19;
  v20 = MEMORY[0x1E0C80A78](v18);
  v22 = &v56[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v67 = &v56[-v23];
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  MEMORY[0x1E0C80A78](v24);
  v26 = &v56[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E88);
  v28 = *(_QWORD *)(v27 - 8);
  MEMORY[0x1E0C80A78](v27);
  v30 = &v56[-((v29 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E90);
  v32 = MEMORY[0x1E0C80A78](v31);
  v62 = &v56[-((v33 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v32);
  v35 = &v56[-v34];
  v66 = &v56[-v34];
  v59 = a1;
  if ((a1 & 1) != 0)
  {
    sub_18B702298(a2, a3, a4 & 1, (uint64_t)v26);
    swift_getKeyPath();
    swift_getKeyPath();
    v57 = a4;
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v36 = v68;
    sub_18B7096D0((uint64_t)v26, (uint64_t)v30, &qword_1EDFD5390);
    v37 = &v30[*(int *)(v27 + 36)];
    *v37 = v36;
    *(_WORD *)(v37 + 1) = 257;
    *((double *)v37 + 1) = a6;
    LOBYTE(a4) = v57;
    sub_18B709714((uint64_t)v26, &qword_1EDFD5390);
    sub_18B709750((uint64_t)v30, (uint64_t)v66, &qword_1EDFD8E88);
    v35 = v66;
    v38 = 0;
  }
  else
  {
    v38 = 1;
  }
  v58 = a2;
  v39 = 1;
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v28 + 56))(v35, v38, 1, v27);
  v40 = a4 & 1;
  sub_18B704AE0(a2, a3, a4 & 1);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v41 = v70;
  sub_18B7096D0((uint64_t)v17, (uint64_t)v22, &qword_1EDFD5350);
  v42 = v60;
  v43 = (double *)&v22[*(int *)(v60 + 36)];
  *(_BYTE *)v43 = v41;
  v44 = v59;
  v45 = v59 & 1;
  *((_BYTE *)v43 + 1) = v59 & 1;
  *((_BYTE *)v43 + 2) = 0;
  v43[1] = a6;
  sub_18B709714((uint64_t)v17, &qword_1EDFD5350);
  sub_18B709750((uint64_t)v22, (uint64_t)v67, &qword_1EDFD8E80);
  v46 = (uint64_t)v63;
  if ((v44 & 1) == 0)
  {
    sub_18B704D50(v58, a3, v40);
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    v47 = v69;
    sub_18B7096D0((uint64_t)v17, (uint64_t)v22, &qword_1EDFD5350);
    v48 = (double *)&v22[*(int *)(v42 + 36)];
    *(_BYTE *)v48 = v47;
    *((_BYTE *)v48 + 1) = v45;
    *((_BYTE *)v48 + 2) = 1;
    v48[1] = a6;
    sub_18B709714((uint64_t)v17, &qword_1EDFD5350);
    sub_18B709750((uint64_t)v22, v46, &qword_1EDFD8E80);
    v39 = 0;
  }
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v61 + 56))(v46, v39, 1, v42);
  v49 = v66;
  v50 = v62;
  sub_18B7096D0((uint64_t)v66, (uint64_t)v62, &qword_1EDFD8E90);
  v51 = v67;
  sub_18B7096D0((uint64_t)v67, (uint64_t)v22, &qword_1EDFD8E80);
  v52 = v65;
  sub_18B7096D0(v46, (uint64_t)v65, &qword_1EDFD8E78);
  v53 = v64;
  sub_18B7096D0((uint64_t)v50, v64, &qword_1EDFD8E90);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E98);
  sub_18B7096D0((uint64_t)v22, v53 + *(int *)(v54 + 48), &qword_1EDFD8E80);
  sub_18B7096D0((uint64_t)v52, v53 + *(int *)(v54 + 64), &qword_1EDFD8E78);
  sub_18B709714(v46, &qword_1EDFD8E78);
  sub_18B709714((uint64_t)v51, &qword_1EDFD8E80);
  sub_18B709714((uint64_t)v49, &qword_1EDFD8E90);
  sub_18B709714((uint64_t)v52, &qword_1EDFD8E78);
  sub_18B709714((uint64_t)v22, &qword_1EDFD8E80);
  return sub_18B709714((uint64_t)v50, &qword_1EDFD8E90);
}

uint64_t sub_18B706D04@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _BYTE *v13;
  uint64_t v14;
  double *v15;
  uint64_t v16;
  uint64_t v17;
  double *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  _BYTE *v24;
  uint64_t v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE v34[4];
  int v35;
  uint64_t v36;

  v35 = a4;
  v36 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F50);
  v11 = MEMORY[0x1E0C80A78](v10);
  v13 = &v34[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v11);
  v15 = (double *)&v34[-v14];
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E50);
  MEMORY[0x1E0C80A78](v16);
  v18 = (double *)&v34[-((v17 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E58);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = &v34[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v24 = &v34[-v23];
  v25 = sub_18B729100();
  v26 = sub_18B701240();
  *(_QWORD *)v18 = v25;
  v18[1] = v26;
  *((_BYTE *)v18 + 16) = 0;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E60);
  sub_18B705BCC(a1, a2, a3, (uint64_t)v18 + *(int *)(v27 + 44));
  sub_18B7096D0((uint64_t)v18, (uint64_t)v22, &qword_1EDFD8E50);
  sub_18B709714((uint64_t)v18, &qword_1EDFD8E50);
  sub_18B709750((uint64_t)v22, (uint64_t)v24, &qword_1EDFD8E58);
  v28 = sub_18B729100();
  v29 = sub_18B701240();
  *(_QWORD *)v15 = v28;
  v15[1] = v29;
  *((_BYTE *)v15 + 16) = 0;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F58);
  sub_18B706FA0(a1, a2, a3, v35, (uint64_t)v15 + *(int *)(v30 + 44), a6);
  sub_18B7096D0((uint64_t)v24, (uint64_t)v22, &qword_1EDFD8E58);
  sub_18B7096D0((uint64_t)v15, (uint64_t)v13, &qword_1EDFD8F50);
  v31 = v36;
  sub_18B7096D0((uint64_t)v22, v36, &qword_1EDFD8E58);
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F60);
  sub_18B7096D0((uint64_t)v13, v31 + *(int *)(v32 + 48), &qword_1EDFD8F50);
  sub_18B709714((uint64_t)v15, &qword_1EDFD8F50);
  sub_18B709714((uint64_t)v24, &qword_1EDFD8E58);
  sub_18B709714((uint64_t)v13, &qword_1EDFD8F50);
  return sub_18B709714((uint64_t)v22, &qword_1EDFD8E58);
}

uint64_t sub_18B706FA0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, int a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
  uint64_t v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BYTE *v16;
  uint64_t v17;
  _BYTE *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BYTE *v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double *v28;
  uint64_t v29;
  uint64_t v30;
  _BYTE v32[12];
  int v33;
  uint64_t v34;
  char v35;

  v33 = a4;
  v34 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v10);
  v12 = &v32[-((v11 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E80);
  v14 = MEMORY[0x1E0C80A78](v13);
  v16 = &v32[-((v15 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v14);
  v18 = &v32[-v17];
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F68);
  v20 = MEMORY[0x1E0C80A78](v19);
  v22 = &v32[-((v21 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v20);
  v24 = (uint64_t *)&v32[-v23];
  v25 = sub_18B729100();
  v26 = sub_18B7290E8();
  *v24 = v25;
  v24[1] = v26;
  v27 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F70);
  LOBYTE(v25) = v33;
  sub_18B70726C(a1, a2, a3, v33, (uint64_t)v24 + *(int *)(v27 + 44), a6);
  sub_18B704D50(a1, a2, a3);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(a1) = v35;
  sub_18B7096D0((uint64_t)v12, (uint64_t)v16, &qword_1EDFD5350);
  v28 = (double *)&v16[*(int *)(v13 + 36)];
  *(_BYTE *)v28 = a1;
  *((_BYTE *)v28 + 1) = v25;
  *((_BYTE *)v28 + 2) = 0;
  v28[1] = a6;
  sub_18B709714((uint64_t)v12, &qword_1EDFD5350);
  sub_18B709750((uint64_t)v16, (uint64_t)v18, &qword_1EDFD8E80);
  sub_18B7096D0((uint64_t)v24, (uint64_t)v22, &qword_1EDFD8F68);
  sub_18B7096D0((uint64_t)v18, (uint64_t)v16, &qword_1EDFD8E80);
  v29 = v34;
  sub_18B7096D0((uint64_t)v22, v34, &qword_1EDFD8F68);
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F78);
  sub_18B7096D0((uint64_t)v16, v29 + *(int *)(v30 + 48), &qword_1EDFD8E80);
  sub_18B709714((uint64_t)v18, &qword_1EDFD8E80);
  sub_18B709714((uint64_t)v24, &qword_1EDFD8F68);
  sub_18B709714((uint64_t)v16, &qword_1EDFD8E80);
  return sub_18B709714((uint64_t)v22, &qword_1EDFD8F68);
}

uint64_t sub_18B70726C@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, int a3@<W2>, char a4@<W3>, uint64_t a5@<X8>, double a6@<D0>)
{
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
  char *v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  char *v31;
  uint64_t v32;
  int v33;
  double v34;
  double v35;
  char v36;
  char *v37;
  char v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v49;
  uint64_t v50;
  int v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  char v60;
  char v61;

  v51 = a3;
  v49 = a1;
  v59 = a5;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5390);
  MEMORY[0x1E0C80A78](v10);
  v53 = (uint64_t)&v49 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v54 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F80);
  MEMORY[0x1E0C80A78](v54);
  v50 = (uint64_t)&v49 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F88);
  v13 = MEMORY[0x1E0C80A78](v57);
  v58 = (uint64_t)&v49 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = MEMORY[0x1E0C80A78](v13);
  v55 = (uint64_t)&v49 - v16;
  MEMORY[0x1E0C80A78](v15);
  v56 = (uint64_t)&v49 - v17;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5350);
  MEMORY[0x1E0C80A78](v18);
  v20 = (char *)&v49 - ((v19 + 15) & 0xFFFFFFFFFFFFFFF0);
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F90);
  MEMORY[0x1E0C80A78](v21);
  v23 = (char *)&v49 - ((v22 + 15) & 0xFFFFFFFFFFFFFFF0);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8F98);
  v25 = MEMORY[0x1E0C80A78](v24);
  v52 = (uint64_t)&v49 - ((v26 + 15) & 0xFFFFFFFFFFFFFFF0);
  v27 = MEMORY[0x1E0C80A78](v25);
  v29 = (char *)&v49 - v28;
  MEMORY[0x1E0C80A78](v27);
  v31 = (char *)&v49 - v30;
  v32 = a1;
  v33 = v51;
  sub_18B704AE0(v32, a2, v51);
  sub_18B7096D0((uint64_t)v20, (uint64_t)v23, &qword_1EDFD5350);
  if ((a4 & 1) != 0)
    v34 = 0.0;
  else
    v34 = 1.0;
  *(double *)&v23[*(int *)(v21 + 36)] = v34;
  if ((a4 & 1) != 0)
    v35 = 1.0;
  else
    v35 = 0.0;
  sub_18B709714((uint64_t)v20, &qword_1EDFD5350);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v36 = v61;
  sub_18B7096D0((uint64_t)v23, (uint64_t)v29, &qword_1EDFD8F90);
  v37 = &v29[*(int *)(v24 + 36)];
  *v37 = v36;
  v38 = a4;
  v37[1] = a4;
  v37[2] = 1;
  *((double *)v37 + 1) = a6;
  sub_18B709714((uint64_t)v23, &qword_1EDFD8F90);
  sub_18B709750((uint64_t)v29, (uint64_t)v31, &qword_1EDFD8F98);
  v39 = v53;
  sub_18B702298(v49, a2, v33, v53);
  v40 = v50;
  sub_18B7096D0(v39, v50, &qword_1EDFD5390);
  *(double *)(v40 + *(int *)(v54 + 36)) = v35;
  sub_18B709714(v39, &qword_1EDFD5390);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  LOBYTE(v39) = v60;
  v41 = v55;
  sub_18B7096D0(v40, v55, &qword_1EDFD8F80);
  v42 = v41 + *(int *)(v57 + 36);
  *(_BYTE *)v42 = v39;
  *(_BYTE *)(v42 + 1) = v38;
  *(_BYTE *)(v42 + 2) = 1;
  *(double *)(v42 + 8) = a6;
  sub_18B709714(v40, &qword_1EDFD8F80);
  v43 = v56;
  sub_18B709750(v41, v56, &qword_1EDFD8F88);
  v44 = v52;
  sub_18B7096D0((uint64_t)v31, v52, &qword_1EDFD8F98);
  v45 = v58;
  sub_18B7096D0(v43, v58, &qword_1EDFD8F88);
  v46 = v59;
  sub_18B7096D0(v44, v59, &qword_1EDFD8F98);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FA0);
  sub_18B7096D0(v45, v46 + *(int *)(v47 + 48), &qword_1EDFD8F88);
  sub_18B709714(v43, &qword_1EDFD8F88);
  sub_18B709714((uint64_t)v31, &qword_1EDFD8F98);
  sub_18B709714(v45, &qword_1EDFD8F88);
  return sub_18B709714(v44, &qword_1EDFD8F98);
}

void *sub_18B70774C(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  void *result;
  id v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t KeyPath;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v4 = sub_18B728ECC();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_18B728EA8();
  v25 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_18B728E6C();
  v23 = *(_QWORD *)(v8 - 8);
  v24 = v8;
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v23 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18B728E90();
  result = (void *)CEMGetSharedEmojiCharacterSet();
  if (result)
  {
    v12 = result;
    sub_18B728E48();

    v13 = HIBYTE(a2) & 0xF;
    v27 = a1;
    v28 = a2;
    if ((a2 & 0x2000000000000000) == 0)
      v13 = a1 & 0xFFFFFFFFFFFFLL;
    v29 = 0;
    v30 = v13;
    swift_bridgeObjectRetain();
    v14 = sub_18B7293AC();
    if (!v15)
    {
LABEL_11:
      swift_bridgeObjectRelease();
      return (void *)(*(uint64_t (**)(char *, uint64_t))(v23 + 8))(v10, v24);
    }
    v16 = v14;
    v17 = v15;
    while (1)
    {
      swift_bridgeObjectRetain();
      v22 = sub_18B707F2C(v16, v17);
      result = (void *)swift_bridgeObjectRelease();
      if ((v22 & 0x100000000) != 0)
        break;
      if ((sub_18B728E54() & 1) != 0)
        v18 = sub_18B7292B0();
      else
        v18 = sub_18B7292A4();
      v19 = v18;
      sub_18B728EC0();
      sub_18B728EB4();
      KeyPath = swift_getKeyPath();
      *(&v23 - 2) = MEMORY[0x1E0C80A78](KeyPath);
      swift_getKeyPath();
      v26 = v19;
      sub_18B709074();
      swift_retain();
      sub_18B728E84();
      sub_18B7093B4(&qword_1EDFD8E08, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAF240], MEMORY[0x1E0CAF230]);
      sub_18B728E9C();
      swift_release();
      (*(void (**)(char *, uint64_t))(v25 + 8))(v7, v5);
      v16 = sub_18B7293AC();
      v17 = v21;
      if (!v21)
        goto LABEL_11;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18B707A00@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_18B701530(*(_QWORD *)v1, *(_QWORD *)(v1 + 8), *(unsigned __int8 *)(v1 + 16), a1);
}

unint64_t sub_18B707A10()
{
  unint64_t result;

  result = qword_1EDFD8DC0;
  if (!qword_1EDFD8DC0)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73BA58, &type metadata for IncomingCallTextView.Alignment);
    atomic_store(result, (unint64_t *)&qword_1EDFD8DC0);
  }
  return result;
}

unint64_t sub_18B707A58()
{
  unint64_t result;

  result = qword_1EDFD8DC8;
  if (!qword_1EDFD8DC8)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73BAC0, &type metadata for IncomingCallTextView.CallState);
    atomic_store(result, (unint64_t *)&qword_1EDFD8DC8);
  }
  return result;
}

uint64_t sub_18B707A9C()
{
  uint64_t result;

  result = sub_18B7292F8();
  qword_1EDFD8DA8 = result;
  return result;
}

uint64_t sub_18B707AC0()
{
  uint64_t result;

  result = sub_18B729304();
  qword_1EDFD8DB0 = result;
  return result;
}

uint64_t sub_18B707AE8()
{
  uint64_t result;

  result = sub_18B7292EC();
  qword_1EDFD8DB8 = result;
  return result;
}

uint64_t sub_18B707B20@<X0>(uint64_t a1@<X0>, int a2@<W1>, uint64_t a3@<X8>)
{
  unsigned int v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  unsigned int v20;
  unsigned int v21;
  uint64_t v22;
  uint64_t v23;
  char *v24;
  uint64_t v25;
  char *v26;
  char *v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v35 = a3;
  v5 = a2 & 0x100;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FA8);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v32 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FB0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v32 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FB8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v32 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FC0);
  MEMORY[0x1E0C80A78](v34);
  v16 = (char *)&v32 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
  {
    v33 = v12;
    v21 = v5;
    if (qword_1EDFD8BF8 != -1)
      swift_once();
    v22 = qword_1EDFD8DB0;
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FC8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(v8, a1, v23);
    v24 = &v8[*(int *)(v6 + 36)];
    *(_QWORD *)v24 = v22;
    v20 = v21 >> 8;
    v24[8] = BYTE1(v21);
    v25 = qword_1EDFD8BF0;
    swift_retain();
    if (v25 != -1)
      swift_once();
    v18 = qword_1EDFD8DA8;
    swift_retain();
    v12 = v33;
  }
  else
  {
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8FC8);
    (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v8, a1, v17);
    v18 = 0;
    v19 = &v8[*(int *)(v6 + 36)];
    *(_QWORD *)v19 = 0;
    v20 = v5 >> 8;
    v19[8] = BYTE1(v5);
  }
  sub_18B7096D0((uint64_t)v8, (uint64_t)v11, &qword_1EDFD8FA8);
  v26 = &v11[*(int *)(v9 + 36)];
  *(_QWORD *)v26 = v18;
  v26[8] = v20;
  sub_18B709714((uint64_t)v8, &qword_1EDFD8FA8);
  if ((a2 & 1) != 0)
  {
    if (qword_1EDFD8C00 != -1)
      swift_once();
    v28 = qword_1EDFD8DB8;
    swift_retain();
    sub_18B7096D0((uint64_t)v11, (uint64_t)v14, &qword_1EDFD8FB0);
    v29 = &v14[*(int *)(v12 + 36)];
    *(_QWORD *)v29 = v28;
    v29[8] = v20;
    sub_18B709714((uint64_t)v11, &qword_1EDFD8FB0);
    if ((a2 & 0x10000) != 0)
    {
      sub_18B72931C();
      sub_18B729034();
      sub_18B729040();
      v30 = sub_18B72904C();
      swift_release();
      swift_release();
      goto LABEL_15;
    }
  }
  else
  {
    sub_18B7096D0((uint64_t)v11, (uint64_t)v14, &qword_1EDFD8FB0);
    v27 = &v14[*(int *)(v12 + 36)];
    *(_QWORD *)v27 = 0;
    v27[8] = v20;
    sub_18B709714((uint64_t)v11, &qword_1EDFD8FB0);
  }
  v30 = sub_18B729058();
LABEL_15:
  sub_18B7096D0((uint64_t)v14, (uint64_t)v16, &qword_1EDFD8FB8);
  *(_QWORD *)&v16[*(int *)(v34 + 36)] = v30;
  sub_18B709714((uint64_t)v14, &qword_1EDFD8FB8);
  return sub_18B709750((uint64_t)v16, v35, &qword_1EDFD8FC0);
}

uint64_t sub_18B707EE0()
{
  return sub_18B72901C();
}

uint64_t sub_18B707EF8@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  unsigned __int8 *v2;
  int v3;
  int v4;
  int v5;

  if (v2[1])
    v3 = 256;
  else
    v3 = 0;
  v4 = v3 | *v2;
  if (v2[2])
    v5 = 0x10000;
  else
    v5 = 0;
  return sub_18B707B20(a1, v4 | v5, a2);
}

unint64_t sub_18B707F2C(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_18B708494(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_18B7294E4();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_18B729508();
      v5 = sub_18B729514();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

uint64_t sub_18B708008()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E10);
  return sub_18B72934C() & 1;
}

unint64_t sub_18B708060(uint64_t a1, unint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  void *v8;
  id v9;
  unint64_t result;
  id v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  char v18;
  void *v19;
  char **v20;
  id v21;
  uint64_t inited;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  id v28;
  unint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;

  v4 = sub_18B728E6C();
  v30 = *(_QWORD *)(v4 - 8);
  v31 = v4;
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v30 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = objc_allocWithZone(MEMORY[0x1E0CB3778]);
  v8 = (void *)sub_18B729358();
  v9 = objc_msgSend(v7, sel_initWithString_, v8);

  result = CEMGetSharedEmojiCharacterSet();
  if (result)
  {
    v11 = (id)result;
    sub_18B728E48();

    v12 = HIBYTE(a2) & 0xF;
    v33 = a1;
    v34 = a2;
    if ((a2 & 0x2000000000000000) == 0)
      v12 = a1 & 0xFFFFFFFFFFFFLL;
    v35 = 0;
    v36 = v12;
    swift_bridgeObjectRetain();
    v13 = sub_18B7293AC();
    if (!v14)
    {
LABEL_10:
      swift_bridgeObjectRelease();
      (*(void (**)(char *, uint64_t))(v30 + 8))(v6, v31);
      return (unint64_t)v9;
    }
    v15 = v13;
    v16 = v14;
    v17 = (void *)*MEMORY[0x1E0DC1140];
    v32 = xmmword_18B73BDC0;
    while (1)
    {
      result = sub_18B707F2C(v15, v16);
      if ((result & 0x100000000) != 0)
        break;
      v18 = sub_18B728E54();
      v19 = (void *)objc_opt_self();
      v20 = &selRef_whiteColor;
      if ((v18 & 1) == 0)
        v20 = &selRef_clearColor;
      v21 = objc_msgSend(v19, *v20, v30, v31);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5640);
      inited = swift_initStackObject();
      *(_OWORD *)(inited + 16) = v32;
      *(_QWORD *)(inited + 32) = v17;
      *(_QWORD *)(inited + 64) = sub_18B6FEB68(0, (unint64_t *)&unk_1EDFD5608);
      *(_QWORD *)(inited + 40) = v21;
      v23 = v17;
      v24 = v21;
      sub_18B70B218(inited);
      v25 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
      v26 = (void *)sub_18B729358();
      swift_bridgeObjectRelease();
      type metadata accessor for Key(0);
      sub_18B7093B4((unint64_t *)&qword_1EDFD55C8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_18B73B4A8);
      v27 = (void *)sub_18B729328();
      swift_bridgeObjectRelease();
      v28 = objc_msgSend(v25, sel_initWithString_attributes_, v26, v27);

      objc_msgSend(v9, sel_appendAttributedString_, v28);
      v15 = sub_18B7293AC();
      v16 = v29;
      if (!v29)
        goto LABEL_10;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_18B708330@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18B7083AC()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B70841C(unint64_t a1, uint64_t a2, uint64_t a3)
{
  char v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;

  v3 = a1;
  v4 = (unsigned __int16)a1 >> 14;
  if ((a3 & 0x1000000000000000) == 0 || (a2 & 0x800000000000000) != 0)
  {
    v10 = sub_18B7293D0();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x18D77B95C](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

unint64_t sub_18B708494(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 1) == 0 || (result & 0xC) == 4 << v5)
    goto LABEL_9;
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
  {
    __break(1u);
LABEL_9:
    result = sub_18B708530(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_18B70859C(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_18B708530(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_18B70841C(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_18B70859C(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  int v11;
  unint64_t v12;
  _QWORD v13[4];

  if ((result & 0xC000) != 0 || result < 0x10000)
  {
    result &= 0xFFFFFFFFFFFF0000;
  }
  else
  {
    v5 = result >> 16;
    if ((a3 & 0x1000000000000000) == 0)
    {
      v13[2] = v3;
      v13[3] = v4;
      if ((a3 & 0x2000000000000000) != 0)
      {
        v13[0] = a2;
        v13[1] = a3 & 0xFFFFFFFFFFFFFFLL;
        if (v5 != (HIBYTE(a3) & 0xF) && (*((_BYTE *)v13 + v5) & 0xC0) == 0x80)
        {
          do
          {
            v10 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          v5 = v10;
        }
        return v5 << 16;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 != (a2 & 0xFFFFFFFFFFFFLL))
        {
          do
LABEL_9:
            v7 = *(_BYTE *)(v6 + v5--) & 0xC0;
          while (v7 == 128);
          ++v5;
        }
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_18B729508();
        v5 = v12;
        if (v12 != v9)
          goto LABEL_9;
      }
      return v5 << 16;
    }
    v8 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v8 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v8)
      return sub_18B7294D8();
  }
  return result;
}

void *sub_18B7086A4(const void *a1, void *a2)
{
  __swift_memcpy299_8(a2, a1);
  return a2;
}

uint64_t sub_18B7086E0(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 298) >> 7;
}

uint64_t sub_18B7086EC(uint64_t result)
{
  *(_BYTE *)(result + 298) &= ~0x80u;
  return result;
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x18D77C8D4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_18B708748()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EDFD5338;
  if (!qword_1EDFD5338)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5340);
    v2 = MEMORY[0x1E0CDFCF8];
    v3[0] = sub_18B709970(&qword_1EDFD5430, &qword_1EDFD5438, MEMORY[0x1E0CDFCF8]);
    v3[1] = sub_18B709970(&qword_1EDFD5440, &qword_1EDFD5448, v2);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EDFD5338);
  }
  return result;
}

unint64_t sub_18B7087EC()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1EDFD5328;
  if (!qword_1EDFD5328)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5330);
    v2 = MEMORY[0x1E0CDFCF8];
    v3[0] = sub_18B709970(&qword_1EDFD5410, &qword_1EDFD5418, MEMORY[0x1E0CDFCF8]);
    v3[1] = sub_18B709970(&qword_1EDFD5420, &qword_1EDFD5428, v2);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EDFD5328);
  }
  return result;
}

uint64_t sub_18B708890(uint64_t a1)
{
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;

  v5 = *(_OWORD *)(a1 + 256);
  v6 = *(_OWORD *)(a1 + 272);
  v3 = *(_OWORD *)(a1 + 224);
  v4 = *(_OWORD *)(a1 + 240);
  sub_18B708920(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(void **)(a1 + 168),
    *(void **)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(void **)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    v5,
    *((uint64_t *)&v5 + 1),
    v6,
    *((uint64_t *)&v6 + 1),
    *(_QWORD *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

void sub_18B708920(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  if ((a38 & 0x800000) != 0)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

unint64_t sub_18B7089E4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD5308;
  if (!qword_1EDFD5308)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5310);
    v2[0] = sub_18B709970(&qword_1EDFD53F0, &qword_1EDFD53F8, MEMORY[0x1E0CDFB10]);
    v2[1] = sub_18B708A68();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5308);
  }
  return result;
}

unint64_t sub_18B708A68()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD5318;
  if (!qword_1EDFD5318)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5320);
    v2[0] = sub_18B709970(&qword_1EDFD5400, &qword_1EDFD5408, MEMORY[0x1E0CDFCC0]);
    v2[1] = sub_18B709150(&qword_1EDFD5370, &qword_1EDFD5378, (uint64_t (*)(void))sub_18B708748, (uint64_t (*)(void))sub_18B7087EC);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5318);
  }
  return result;
}

uint64_t sub_18B708B0C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_18B729094();
  *a1 = result;
  return result;
}

uint64_t sub_18B708B34()
{
  swift_retain();
  return sub_18B7290A0();
}

uint64_t sub_18B708B5C@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;
  char v3;

  result = sub_18B7290AC();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = v3 & 1;
  return result;
}

uint64_t sub_18B708B8C()
{
  return sub_18B7290B8();
}

uint64_t sub_18B708BB8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_18B72907C();
  *a1 = v3;
  return result;
}

uint64_t sub_18B708BE0()
{
  return sub_18B729088();
}

unint64_t sub_18B708C04()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD52B0;
  if (!qword_1EDFD52B0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD52B8);
    v2[0] = sub_18B7092FC(&qword_1EDFD52A0, &qword_1EDFD52A8, (uint64_t (*)(void))sub_18B708CA0);
    v2[1] = sub_18B709970(&qword_1EDFD53A0, &qword_1EDFD53A8, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD52B0);
  }
  return result;
}

unint64_t sub_18B708CA0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD5290;
  if (!qword_1EDFD5290)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5298);
    v2[0] = sub_18B708D24();
    v2[1] = sub_18B709970(&qword_1EDFD53C0, &qword_1EDFD53C8, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5290);
  }
  return result;
}

unint64_t sub_18B708D24()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1EDFD5280;
  if (!qword_1EDFD5280)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5288);
    v2[2] = MEMORY[0x1E0CDDD78];
    v2[3] = MEMORY[0x1E0CDDD58];
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_18B709970(&qword_1EDFD53B0, &qword_1EDFD53B8, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5280);
  }
  return result;
}

uint64_t sub_18B708DD4(uint64_t a1)
{
  unint64_t v1;

  v1 = *(_QWORD *)(a1 + 8);
  if (v1 >= 0xFFFFFFFF)
    LODWORD(v1) = -1;
  return (v1 + 1);
}

_QWORD *sub_18B708DEC(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;

  v2 = (void *)a1[2];
  v3 = (void *)a1[3];
  v4 = (void *)a1[7];
  swift_bridgeObjectRetain();
  v5 = v2;
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v4;
  return a1;
}

uint64_t sub_18B708E40(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v9;
  uint64_t v10;

  v2 = *(void **)(a1 + 168);
  v9 = *(_QWORD *)(a1 + 160);
  v10 = *(_QWORD *)(a1 + 152);
  v3 = *(void **)(a1 + 176);
  v4 = *(_QWORD *)(a1 + 184);
  v5 = *(_QWORD *)(a1 + 192);
  v6 = *(_QWORD *)(a1 + 200);
  v7 = *(void **)(a1 + 208);
  sub_18B708F44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
  sub_18B708F44(v10, v9, v2, v3, v4, v5, v6, v7);
  return a1;
}

void sub_18B708F44(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

uint64_t sub_18B708FA0(uint64_t a1)
{
  sub_18B708F44(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56));
  return a1;
}

uint64_t sub_18B709000(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

void sub_18B709058()
{
  sub_18B728E78();
  __break(1u);
}

unint64_t sub_18B709074()
{
  unint64_t result;

  result = qword_1EDFD8E00;
  if (!qword_1EDFD8E00)
  {
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD8138], MEMORY[0x1E0CD8148]);
    atomic_store(result, (unint64_t *)&qword_1EDFD8E00);
  }
  return result;
}

void sub_18B7090B8()
{
  sub_18B709074();
  sub_18B728ED8();
  __break(1u);
}

uint64_t sub_18B7090DC()
{
  return 8;
}

uint64_t sub_18B7090E8()
{
  return swift_release();
}

uint64_t sub_18B7090F0(_QWORD *a1, _QWORD *a2)
{
  *a2 = *a1;
  return swift_retain();
}

uint64_t sub_18B709100()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD8E10);
  return sub_18B729340();
}

_QWORD *sub_18B709144(_QWORD *result, _QWORD *a2)
{
  *a2 = *result;
  return result;
}

uint64_t sub_18B709150(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void), uint64_t (*a4)(void))
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3();
    v9[1] = a4();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18B7091C0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD5348;
  if (!qword_1EDFD5348)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5350);
    v2[0] = sub_18B70922C();
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5348);
  }
  return result;
}

unint64_t sub_18B70922C()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  _QWORD v3[4];

  result = qword_1EDFD52F8;
  if (!qword_1EDFD52F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5300);
    v2 = sub_18B708C04();
    v3[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD52A8);
    v3[3] = sub_18B7092FC(&qword_1EDFD52A0, &qword_1EDFD52A8, (uint64_t (*)(void))sub_18B708CA0);
    v3[0] = v2;
    v3[1] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1EDFD52F8);
  }
  return result;
}

uint64_t sub_18B7092E0()
{
  return sub_18B7092FC(&qword_1EDFD5270, &qword_1EDFD5278, (uint64_t (*)(void))sub_18B709368);
}

uint64_t sub_18B7092FC(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18B709368()
{
  unint64_t result;

  result = qword_1EDFD5478;
  if (!qword_1EDFD5478)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73C89C, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_1EDFD5478);
  }
  return result;
}

uint64_t sub_18B7093B4(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x18D77C8E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_18B709404()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD8ED8;
  if (!qword_1EDFD8ED8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD8E88);
    v2[0] = sub_18B709470();
    v2[1] = sub_18B7094FC();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD8ED8);
  }
  return result;
}

unint64_t sub_18B709470()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD8EE0;
  if (!qword_1EDFD8EE0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5390);
    v2[0] = sub_18B709150(&qword_1EDFD5380, &qword_1EDFD5388, (uint64_t (*)(void))sub_18B7091C0, sub_18B7092E0);
    v2[1] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD8EE0);
  }
  return result;
}

unint64_t sub_18B7094FC()
{
  unint64_t result;

  result = qword_1EDFD8EE8;
  if (!qword_1EDFD8EE8)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73BD70, &type metadata for IncomingCallAnimationsModifier);
    atomic_store(result, (unint64_t *)&qword_1EDFD8EE8);
  }
  return result;
}

unint64_t sub_18B709540()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD8EF0;
  if (!qword_1EDFD8EF0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD8E80);
    v2[0] = sub_18B7091C0();
    v2[1] = sub_18B7094FC();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD8EF0);
  }
  return result;
}

uint64_t getEnumTagSinglePayload for IncomingCallAnimationsModifier(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[16])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for IncomingCallAnimationsModifier(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)result = a2 - 255;
    *(_QWORD *)(result + 8) = 0;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 16) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for IncomingCallAnimationsModifier()
{
  return &type metadata for IncomingCallAnimationsModifier;
}

unint64_t sub_18B709654()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD5360;
  if (!qword_1EDFD5360)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD5368);
    v2[0] = sub_18B7089E4();
    v2[1] = sub_18B708A68();
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD5360);
  }
  return result;
}

uint64_t sub_18B7096C0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_18B7096D0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_18B709714(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_18B709750(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

unint64_t sub_18B709798()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD8FD0;
  if (!qword_1EDFD8FD0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD8FC0);
    v2[0] = sub_18B709834(&qword_1EDFD8FD8, &qword_1EDFD8FB8, sub_18B7098B8);
    v2[1] = sub_18B709970(&qword_1EDFD9008, (uint64_t *)&unk_1EDFD9010, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD8FD0);
  }
  return result;
}

uint64_t sub_18B709834(unint64_t *a1, uint64_t *a2, uint64_t (*a3)(void))
{
  uint64_t result;
  uint64_t v6;
  _QWORD v7[2];

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v7[0] = a3();
    v7[1] = sub_18B709970(&qword_1EDFD8FF8, &qword_1EDFD9000, MEMORY[0x1E0CDB148]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v6, v7);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18B7098B8()
{
  return sub_18B709834(&qword_1EDFD8FE0, &qword_1EDFD8FB0, (uint64_t (*)(void))sub_18B7098D4);
}

unint64_t sub_18B7098D4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1EDFD8FE8;
  if (!qword_1EDFD8FE8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD8FA8);
    v2[0] = sub_18B709970(&qword_1EDFD8FF0, &qword_1EDFD8FC8, MEMORY[0x1E0CDBF10]);
    v2[1] = sub_18B709970(&qword_1EDFD8FF8, &qword_1EDFD9000, MEMORY[0x1E0CDB148]);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1EDFD8FE8);
  }
  return result;
}

uint64_t sub_18B709970(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x18D77C8E0](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_18B7099C0()
{
  return swift_initClassMetadata2();
}

uint64_t sub_18B709A00()
{
  return 1;
}

uint64_t sub_18B709A08(uint64_t a1)
{
  objc_class *v1;
  objc_class *v2;
  id v4;
  uint64_t v5;

  v2 = v1;
  v4 = objc_allocWithZone(v1);
  v5 = sub_18B709C64(a1);
  (*(void (**)(uint64_t))(*(_QWORD *)(*(_QWORD *)((char *)v2 + qword_1EDFDA4E8) - 8) + 8))(a1);
  return v5;
}

void *sub_18B709A68(uint64_t a1, uint64_t a2)
{
  objc_class *v2;
  id v5;

  v5 = objc_allocWithZone(v2);
  return sub_18B709AA8(a1, a2);
}

void *sub_18B709AA8(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void (*v8)(uint64_t, uint64_t);
  id v9;
  uint64_t v11;

  v4 = *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v2) + qword_1EDFDA4E8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v5 + 16))((char *)&v11 - v6);
  v7 = (void *)sub_18B729124();
  v8 = *(void (**)(uint64_t, uint64_t))(v5 + 8);
  v9 = v7;
  v8(a2, v4);
  if (v7)

  return v7;
}

id sub_18B709B68(void *a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v6;
  id v7;
  objc_super v9;

  v6 = (objc_class *)type metadata accessor for LockScreenHostingController(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EDFDA4E8), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EDFDA4E8 + 8), a4);
  v9.receiver = v4;
  v9.super_class = v6;
  v7 = objc_msgSendSuper2(&v9, sel_initWithCoder_, a1);

  return v7;
}

id sub_18B709BDC(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = a3;
  return sub_18B709B68(v3, v4, v5, v6);
}

id sub_18B709C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v4;
  objc_class *v5;
  objc_super v7;

  v5 = (objc_class *)type metadata accessor for LockScreenHostingController(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EDFDA4E8), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v4) + qword_1EDFDA4E8 + 8), a4);
  v7.receiver = v4;
  v7.super_class = v5;
  return objc_msgSendSuper2(&v7, sel_dealloc);
}

uint64_t type metadata accessor for LockScreenHostingController(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for LockScreenHostingController);
}

uint64_t sub_18B709C64(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;

  MEMORY[0x1E0C80A78](a1);
  (*(void (**)(char *))(v1 + 16))((char *)&v4 - v2);
  return sub_18B729130();
}

void sub_18B709CE0(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  void *v9;
  double v10;
  id v11;
  void *v12;
  uint64_t inited;
  void *v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;

  v5 = sub_18B72922C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(void **)(v2 + 16);
  objc_msgSend(v9, sel_pointSize);
  v11 = objc_msgSend(v9, sel_fontWithSize_, v10 * a2);
  v12 = (void *)sub_18B729358();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5640);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18B73BDC0;
  v14 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
  *(_QWORD *)(inited + 40) = v11;
  v15 = v14;
  v16 = v11;
  sub_18B70B218(inited);
  type metadata accessor for Key(0);
  sub_18B7093B4((unint64_t *)&qword_1EDFD55C8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_18B73B4A8);
  v17 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  objc_msgSend(v12, sel_sizeWithAttributes_, v17);

  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, a1, v5);
  v18 = sub_18B718EBC(v8);
  PRPosterTitleLayoutIsVertical(v18);

}

uint64_t sub_18B709EB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;
  void (*v10)(char *, uint64_t, uint64_t, uint64_t);
  void *v11;
  unsigned int (*v12)(char *, uint64_t, uint64_t);
  void (*v14)(char *, char *, uint64_t);
  uint64_t v15;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5208);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v15 - v4;
  v6 = sub_18B728E6C();
  __swift_allocate_value_buffer(v6, qword_1EDFD54E8);
  v7 = __swift_project_value_buffer(v6, (uint64_t)qword_1EDFD54E8);
  v8 = CTFontCopySystemUIFontExcessiveLineHeightCharacterSet();
  v9 = *(_QWORD **)(v6 - 8);
  v10 = (void (*)(char *, uint64_t, uint64_t, uint64_t))v9[7];
  if (!v8
    || (v11 = (void *)v8,
        v10(v3, 1, 1, v6),
        sub_18B7093B4(&qword_1EDFD5200, (uint64_t (*)(uint64_t))MEMORY[0x1E0CAE4B8], MEMORY[0x1E0CAE4D8]),
        sub_18B729580(),
        v11,
        v12 = (unsigned int (*)(char *, uint64_t, uint64_t))v9[6],
        v12(v3, 1, v6) == 1))
  {
    v10(v5, 1, 1, v6);
LABEL_4:
    sub_18B728E60();
    return sub_18B70B0C4((uint64_t)v5);
  }
  v14 = (void (*)(char *, char *, uint64_t))v9[4];
  v14(v5, v3, v6);
  v10(v5, 0, 1, v6);
  if (v12(v5, 1, v6) == 1)
    goto LABEL_4;
  return ((uint64_t (*)(uint64_t, char *, uint64_t))v14)(v7, v5, v6);
}

uint64_t sub_18B70A058()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  NSObject *v7;
  os_log_type_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  _QWORD *v21;
  uint64_t v22;
  _QWORD *v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;

  v1 = v0;
  v2 = sub_18B728FA4();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (qword_1EDFD5210 != -1)
    swift_once();
  v6 = __swift_project_value_buffer(v2, (uint64_t)qword_1EDFDA4D0);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))(v5, v6, v2);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  sub_18B70B094(v1);
  v7 = sub_18B728F98();
  v8 = sub_18B7293F4();
  v9 = v8;
  if (os_log_type_enabled(v7, v8))
  {
    v10 = swift_slowAlloc();
    v27 = v3;
    v11 = v10;
    v12 = (_QWORD *)swift_slowAlloc();
    v24 = v12;
    v26 = swift_slowAlloc();
    v29 = v26;
    *(_DWORD *)v11 = 136317442;
    v25 = v9;
    v14 = *(_QWORD *)v1;
    v13 = *(_QWORD *)(v1 + 8);
    swift_bridgeObjectRetain();
    v28 = sub_18B70E1CC(v14, v13, &v29);
    sub_18B729490();
    swift_bridgeObjectRelease();
    *(_WORD *)(v11 + 12) = 2112;
    v15 = *(void **)(v1 + 16);
    v28 = (uint64_t)v15;
    v16 = v15;
    sub_18B729490();
    *v12 = v15;
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 22) = 2048;
    v28 = *(_QWORD *)(v1 + 24);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 32) = 2048;
    v28 = *(_QWORD *)(v1 + 32);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 42) = 2048;
    v28 = *(_QWORD *)(v1 + 40);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 52) = 2048;
    v28 = *(_QWORD *)(v1 + 48);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 62) = 2080;
    v17 = sub_18B729454();
    v28 = sub_18B70E1CC(v17, v18, &v29);
    sub_18B729490();
    swift_bridgeObjectRelease();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 72) = 2048;
    v28 = *(_QWORD *)(v1 + 88);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 82) = 2048;
    v28 = *(_QWORD *)(v1 + 96);
    sub_18B729490();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    *(_WORD *)(v11 + 92) = 2080;
    if ((*(_BYTE *)(v1 + 104) & 1) != 0)
      v19 = 5457241;
    else
      v19 = 20302;
    if ((*(_BYTE *)(v1 + 104) & 1) != 0)
      v20 = 0xE300000000000000;
    else
      v20 = 0xE200000000000000;
    v28 = sub_18B70E1CC(v19, v20, &v29);
    sub_18B729490();
    swift_bridgeObjectRelease();
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    _os_log_impl(&dword_18B634000, v7, (os_log_type_t)v25, "---\nIncomingCallTextView.Configuration.Metrics\n---\nString: %s\nFont: %@\nA1: %f, A2: %f\nD1: %f, D2: %f\nGlyph Bounds: %s\nAscender Adjustment: %f\nDescender Adjustment: %f\nNeeds Taller Line Height: %s", (uint8_t *)v11, 0x66u);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
    v21 = v24;
    swift_arrayDestroy();
    MEMORY[0x18D77C964](v21, -1, -1);
    v22 = v26;
    swift_arrayDestroy();
    MEMORY[0x18D77C964](v22, -1, -1);
    MEMORY[0x18D77C964](v11, -1, -1);

    return (*(uint64_t (**)(char *, uint64_t))(v27 + 8))(v5, v2);
  }
  else
  {
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);
    sub_18B70AC94(v1);

    return (*(uint64_t (**)(char *, uint64_t))(v3 + 8))(v5, v2);
  }
}

uint64_t sub_18B70A5D0(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  _OWORD v10[5];
  _OWORD v11[2];
  _OWORD v12[5];
  _BYTE v13[25];

  v2 = a1[5];
  v10[4] = a1[4];
  v11[0] = v2;
  *(_OWORD *)((char *)v11 + 9) = *(_OWORD *)((char *)a1 + 89);
  v3 = a1[1];
  v10[0] = *a1;
  v10[1] = v3;
  v4 = a1[3];
  v10[2] = a1[2];
  v10[3] = v4;
  v5 = a2[1];
  v12[0] = *a2;
  v12[1] = v5;
  v6 = a2[2];
  v7 = a2[3];
  *(_OWORD *)&v13[9] = *(_OWORD *)((char *)a2 + 89);
  v8 = a2[5];
  v12[4] = a2[4];
  *(_OWORD *)v13 = v8;
  v12[2] = v6;
  v12[3] = v7;
  return sub_18B70AF80((uint64_t)v10, (uint64_t)v12) & 1;
}

double static IncomingCallTextViewConfigurationMetrics.idealSpaceBetween(topText:topFont:bottomText:bottomFont:)(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, void *a6)
{
  double v13[14];
  _BYTE v14[88];
  double v15;

  swift_bridgeObjectRetain();
  sub_18B70A89C(a1, a2, a3, (uint64_t)v13);
  swift_bridgeObjectRetain();
  sub_18B70A89C(a4, a5, a6, (uint64_t)v14);
  sub_18B70AC94((uint64_t)v14);
  sub_18B70AC94((uint64_t)v13);
  return round(v13[12] + v15);
}

id IncomingCallTextViewConfigurationMetrics.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id IncomingCallTextViewConfigurationMetrics.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return objc_msgSendSuper2(&v2, sel_init);
}

id IncomingCallTextViewConfigurationMetrics.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for IncomingCallTextViewConfigurationMetrics();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

double sub_18B70A89C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, void *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  id v9;
  uint64_t v10;
  char v11;
  char v12;
  uint64_t inited;
  void *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  const __CFAttributedString *v20;
  const __CTLine *v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  double height;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat MaxY;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  CGFloat v37;
  double v38;
  double v39;
  double v40;
  double v41;
  id v42;
  double result;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGRect BoundsWithOptions;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v8 = qword_1EDFD5508;
  swift_bridgeObjectRetain();
  v9 = a3;
  if (v8 != -1)
    swift_once();
  v10 = sub_18B728E6C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1EDFD54E8);
  sub_18B6FFABC();
  sub_18B7294A8();
  v12 = v11;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5640);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18B73BDC0;
  v14 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 64) = sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
  *(_QWORD *)(inited + 40) = v9;
  swift_bridgeObjectRetain();
  v15 = v9;
  v16 = v14;
  sub_18B70B218(inited);
  v17 = objc_allocWithZone(MEMORY[0x1E0CB3498]);
  v18 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  type metadata accessor for Key(0);
  sub_18B7093B4((unint64_t *)&qword_1EDFD55C8, (uint64_t (*)(uint64_t))type metadata accessor for Key, (uint64_t)&unk_18B73B4A8);
  v19 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  v20 = (const __CFAttributedString *)objc_msgSend(v17, sel_initWithString_attributes_, v18, v19);

  v21 = CTLineCreateWithAttributedString(v20);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v21, 8uLL);
  x = BoundsWithOptions.origin.x;
  y = BoundsWithOptions.origin.y;
  width = BoundsWithOptions.size.width;
  height = BoundsWithOptions.size.height;
  objc_msgSend(v15, sel_pointSize);
  v27 = v26 * 0.77;
  objc_msgSend(v15, sel_pointSize);
  v29 = v28 * 0.95;
  v49.origin.x = x;
  v49.origin.y = y;
  v49.size.width = width;
  v49.size.height = height;
  v46 = v29;
  v47 = v27;
  if (v29 >= CGRectGetMaxY(v49))
  {
    v50.origin.x = x;
    v50.origin.y = y;
    v50.size.width = width;
    v50.size.height = height;
    MaxY = CGRectGetMaxY(v50);
    v32 = 0.0;
    if (v27 < MaxY)
      goto LABEL_8;
    v30 = -0.07;
  }
  else
  {
    v30 = 0.16;
  }
  objc_msgSend(v15, sel_pointSize);
  v32 = v33 * v30;
LABEL_8:
  v45 = v32;
  objc_msgSend(v15, sel_pointSize);
  v35 = v34 * -0.06;
  objc_msgSend(v15, sel_pointSize);
  v37 = v36 * -0.25;
  v51.origin.x = x;
  v51.origin.y = y;
  v51.size.width = width;
  v51.size.height = height;
  v44 = v37;
  if (CGRectGetMinY(v51) < v37)
  {
    v38 = v35;
    v39 = 0.1;
LABEL_12:
    objc_msgSend(v15, sel_pointSize);
    v40 = v41 * v39;
    goto LABEL_13;
  }
  v52.origin.x = x;
  v52.origin.y = y;
  v52.size.width = width;
  v52.size.height = height;
  v40 = 0.0;
  v38 = v35;
  if (CGRectGetMinY(v52) >= v35)
  {
    v39 = -0.04;
    goto LABEL_12;
  }
LABEL_13:
  v42 = v15;
  sub_18B70A058();

  swift_bridgeObjectRelease();
  *(_QWORD *)a4 = a1;
  *(_QWORD *)(a4 + 8) = a2;
  *(_QWORD *)(a4 + 16) = v42;
  *(double *)(a4 + 24) = v47;
  *(CGFloat *)(a4 + 32) = v46;
  *(double *)(a4 + 40) = v38;
  *(CGFloat *)(a4 + 48) = v44;
  *(CGFloat *)(a4 + 56) = x;
  *(CGFloat *)(a4 + 64) = y;
  result = height;
  *(CGFloat *)(a4 + 72) = width;
  *(double *)(a4 + 80) = height;
  *(double *)(a4 + 88) = v45;
  *(double *)(a4 + 96) = v40;
  *(_BYTE *)(a4 + 104) = (v12 & 1) == 0;
  return result;
}

uint64_t sub_18B70AC94(uint64_t a1)
{

  swift_bridgeObjectRelease();
  return a1;
}

uint64_t type metadata accessor for IncomingCallTextViewConfigurationMetrics()
{
  return objc_opt_self();
}

void _s7MetricsVwxx(uint64_t a1)
{
  swift_bridgeObjectRelease();

}

uint64_t _s7MetricsVwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v4 = *(void **)(a2 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  swift_bridgeObjectRetain();
  v5 = v4;
  return a1;
}

uint64_t _s7MetricsVwca(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v4 = *(void **)(a2 + 16);
  v5 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v4;
  v6 = v4;

  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  return a1;
}

__n128 __swift_memcpy105_8(uint64_t a1, __int128 *a2)
{
  __int128 v2;
  __int128 v3;
  __n128 result;
  __int128 v5;
  __int128 v6;

  v2 = *a2;
  v3 = a2[2];
  *(_OWORD *)(a1 + 16) = a2[1];
  *(_OWORD *)(a1 + 32) = v3;
  *(_OWORD *)a1 = v2;
  result = (__n128)a2[3];
  v5 = a2[4];
  v6 = a2[5];
  *(_OWORD *)(a1 + 89) = *(__int128 *)((char *)a2 + 89);
  *(_OWORD *)(a1 + 64) = v5;
  *(_OWORD *)(a1 + 80) = v6;
  *(__n128 *)(a1 + 48) = result;
  return result;
}

uint64_t _s7MetricsVwta(uint64_t a1, uint64_t a2)
{
  void *v4;

  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v4 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);
  *(_OWORD *)(a1 + 40) = *(_OWORD *)(a2 + 40);
  *(_OWORD *)(a1 + 56) = *(_OWORD *)(a2 + 56);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_OWORD *)(a1 + 88) = *(_OWORD *)(a2 + 88);
  *(_BYTE *)(a1 + 104) = *(_BYTE *)(a2 + 104);
  return a1;
}

uint64_t _s7MetricsVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 105))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s7MetricsVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 104) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 105) = 1;
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
    *(_BYTE *)(result + 105) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s7MetricsVMa()
{
  return &_s7MetricsVN;
}

uint64_t sub_18B70AF80(uint64_t a1, uint64_t a2)
{
  BOOL v4;
  char v5;
  char v6;

  v4 = *(_QWORD *)a1 == *(_QWORD *)a2 && *(_QWORD *)(a1 + 8) == *(_QWORD *)(a2 + 8);
  if (v4 || (v5 = sub_18B729598(), v6 = 0, (v5 & 1) != 0))
  {
    sub_18B6FEB68(0, qword_1EDFD4E40);
    if ((sub_18B729460() & 1) != 0
      && *(double *)(a1 + 24) == *(double *)(a2 + 24)
      && *(double *)(a1 + 32) == *(double *)(a2 + 32)
      && *(double *)(a1 + 40) == *(double *)(a2 + 40)
      && *(double *)(a1 + 48) == *(double *)(a2 + 48)
      && CGRectEqualToRect(*(CGRect *)(a1 + 56), *(CGRect *)(a2 + 56))
      && *(double *)(a1 + 88) == *(double *)(a2 + 88)
      && *(double *)(a1 + 96) == *(double *)(a2 + 96))
    {
      v6 = ((*(_BYTE *)(a1 + 104) & 1) == 0) ^ *(_BYTE *)(a2 + 104);
    }
    else
    {
      v6 = 0;
    }
  }
  return v6 & 1;
}

uint64_t sub_18B70B094(uint64_t a1)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 16);
  swift_bridgeObjectRetain();
  v3 = v2;
  return a1;
}

uint64_t sub_18B70B0C4(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5208);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_18B70B104(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  double *v4;
  double v5;
  double v6;
  id v7;
  unint64_t result;
  char v9;
  double *v10;
  uint64_t v11;
  BOOL v12;
  uint64_t v13;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E58);
  v2 = (_QWORD *)sub_18B72955C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (double *)(a1 + 48);
  while (1)
  {
    v5 = *(v4 - 1);
    v6 = *v4;
    v7 = *((id *)v4 - 2);
    result = sub_18B70E8CC((uint64_t)v7, v5);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v10 = (double *)(v2[6] + 16 * result);
    *(_QWORD *)v10 = v7;
    v10[1] = v5;
    *(double *)(v2[7] + 8 * result) = v6;
    v11 = v2[2];
    v12 = __OFADD__(v11, 1);
    v13 = v11 + 1;
    if (v12)
      goto LABEL_11;
    v4 += 3;
    v2[2] = v13;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18B70B218(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t result;
  char v9;
  uint64_t v10;
  BOOL v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFD5628);
  v2 = sub_18B72955C();
  v3 = (_QWORD *)v2;
  v4 = *(_QWORD *)(a1 + 16);
  if (!v4)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v3;
  }
  v5 = v2 + 64;
  v6 = a1 + 32;
  swift_retain();
  while (1)
  {
    sub_18B7096D0(v6, (uint64_t)&v13, (uint64_t *)&unk_1EDFD55F0);
    v7 = v13;
    result = sub_18B70E948(v13);
    if ((v9 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    *(_QWORD *)(v3[6] + 8 * result) = v7;
    result = (unint64_t)sub_18B710DD4(&v14, (_OWORD *)(v3[7] + 32 * result));
    v10 = v3[2];
    v11 = __OFADD__(v10, 1);
    v12 = v10 + 1;
    if (v11)
      goto LABEL_11;
    v3[2] = v12;
    v6 += 40;
    if (!--v4)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

unint64_t sub_18B70B344(uint64_t a1)
{
  _QWORD *v2;
  uint64_t v3;
  void **v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;

  if (!*(_QWORD *)(a1 + 16))
  {
    v2 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9070);
  v2 = (_QWORD *)sub_18B72955C();
  v3 = *(_QWORD *)(a1 + 16);
  if (!v3)
  {
LABEL_9:
    swift_bridgeObjectRelease();
    return (unint64_t)v2;
  }
  swift_retain();
  v4 = (void **)(a1 + 48);
  while (1)
  {
    v5 = (uint64_t)*(v4 - 2);
    v6 = (uint64_t)*(v4 - 1);
    v7 = *v4;
    swift_bridgeObjectRetain();
    v8 = v7;
    result = sub_18B70E9C8(v5, v6);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)((char *)v2 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8) + 64) |= 1 << result;
    v11 = (uint64_t *)(v2[6] + 16 * result);
    *v11 = v5;
    v11[1] = v6;
    *(_QWORD *)(v2[7] + 8 * result) = v8;
    v12 = v2[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v2[2] = v14;
    v4 += 3;
    if (!--v3)
    {
      swift_release();
      goto LABEL_9;
    }
  }
  __break(1u);
LABEL_11:
  __break(1u);
  return result;
}

uint64_t sub_18B70B45C()
{
  void *v0;
  id v1;
  id v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  os_log_type_t v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  id v19;
  void *v20;
  id v22[2];

  v22[1] = *(id *)MEMORY[0x1E0C80C00];
  v22[0] = 0;
  v1 = objc_msgSend((id)objc_opt_self(), sel_archivedDataWithRootObject_requiringSecureCoding_error_, v0, 1, v22);
  v2 = v22[0];
  if (v1)
  {
    v3 = sub_18B728F14();
    v5 = v4;

    v6 = sub_18B728F08();
    sub_18B710DE4(v3, v5);
  }
  else
  {
    v7 = v2;
    v8 = (void *)sub_18B728EE4();

    swift_willThrow();
    if (qword_1EDFD5210 != -1)
      swift_once();
    v9 = sub_18B728FA4();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EDFDA4D0);
    v10 = sub_18B729400();
    v11 = v0;
    v12 = v8;
    v13 = v11;
    v14 = v8;
    v15 = sub_18B728F98();
    if (os_log_type_enabled(v15, v10))
    {
      v16 = swift_slowAlloc();
      v17 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v16 = 138412546;
      v22[0] = v13;
      v18 = v13;
      sub_18B729490();
      *v17 = v13;

      *(_WORD *)(v16 + 12) = 2112;
      v19 = v8;
      v20 = (void *)_swift_stdlib_bridgeErrorToNSError();
      v22[0] = v20;
      sub_18B729490();
      v17[1] = v20;

      _os_log_impl(&dword_18B634000, v15, v10, "Error archiving object %@: %@", (uint8_t *)v16, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
      swift_arrayDestroy();
      MEMORY[0x18D77C964](v17, -1, -1);
      MEMORY[0x18D77C964](v16, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v6;
}

uint64_t sub_18B70B738(uint64_t a1, uint64_t a2, unint64_t *a3)
{
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;

  if (!a2)
    return 0;
  v4 = sub_18B728EF0();
  v6 = 0;
  if (v5 >> 60 != 15)
  {
    v7 = v4;
    v8 = v5;
    sub_18B6FEB68(0, &qword_1EDFD9068);
    sub_18B6FEB68(0, a3);
    v6 = sub_18B72943C();
    sub_18B710E28(v7, v8);
  }
  return v6;
}

__CFString *PRPosterHomeScreenConfiguration.attributeType.getter()
{
  return CFSTR("PRPosterRoleAttributeTypeHomeScreenConfiguration");
}

uint64_t PRPosterHomeScreenConfiguration.encodeJSON()()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  uint64_t v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  char v46;
  uint64_t v47;
  uint64_t v48;
  char *v49;
  uint64_t v50;
  id v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  char v56;
  uint64_t v57;
  uint64_t v58;
  char *v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  uint64_t v68;
  os_log_type_t v69;
  id v70;
  id v71;
  id v72;
  id v73;
  NSObject *v74;
  uint64_t v75;
  _QWORD *v76;
  id v77;
  id v78;
  uint64_t v79;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  _BYTE v84[24];
  uint64_t v85;
  __int128 v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;

  v1 = v0;
  v89 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(v0, sel_selectedAppearanceType);
  v87 = MEMORY[0x1E0DEBB98];
  v88 = MEMORY[0x1E0DEBBA0];
  *(_QWORD *)&v86 = v2;
  sub_18B70C408(&v86, (uint64_t)v84);
  v3 = MEMORY[0x1E0DEE9E0];
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v82 = v3;
  v5 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
  MEMORY[0x1E0C80A78](v5);
  v7 = (uint64_t *)((char *)&v81 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v8 + 16))(v7);
  sub_18B7109DC(*v7, 0xD000000000000016, 0x800000018B744430, isUniquelyReferenced_nonNull_native, &v82);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
  v9 = v82;
  v83 = v82;
  swift_bridgeObjectRelease();
  v10 = objc_msgSend(v1, sel_lockPosterAppearance);
  v11 = sub_18B70B45C();
  v13 = v12;

  v14 = MEMORY[0x1E0DEA968];
  v15 = MEMORY[0x1E0DEA970];
  if (v13)
  {
    v87 = MEMORY[0x1E0DEA968];
    v88 = MEMORY[0x1E0DEA970];
    *(_QWORD *)&v86 = v11;
    *((_QWORD *)&v86 + 1) = v13;
    sub_18B70C408(&v86, (uint64_t)v84);
    v16 = swift_isUniquelyReferenced_nonNull_native();
    v82 = v9;
    v17 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1E0C80A78](v17);
    v19 = (char *)&v81 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v20 + 16))(v19);
    sub_18B710B84((uint64_t)v19, 0xD000000000000014, 0x800000018B744450, v16, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18B70ED6C(0xD000000000000014, 0x800000018B744450, (uint64_t)&v86);
    sub_18B709714((uint64_t)&v86, &qword_1EDFD9020);
  }
  v21 = objc_msgSend(v1, sel_solidColorAppearance);
  v22 = sub_18B70B45C();
  v24 = v23;

  if (v24)
  {
    v87 = v14;
    v88 = v15;
    *(_QWORD *)&v86 = v22;
    *((_QWORD *)&v86 + 1) = v24;
    sub_18B70C408(&v86, (uint64_t)v84);
    v25 = v83;
    v26 = swift_isUniquelyReferenced_nonNull_native();
    v82 = v25;
    v27 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1E0C80A78](v27);
    v29 = (char *)&v81 - ((v28 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v30 + 16))(v29);
    sub_18B710B84((uint64_t)v29, 0xD000000000000014, 0x800000018B744470, v26, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18B70ED6C(0xD000000000000014, 0x800000018B744470, (uint64_t)&v86);
    sub_18B709714((uint64_t)&v86, &qword_1EDFD9020);
  }
  v31 = objc_msgSend(v1, sel_gradientAppearance);
  v32 = sub_18B70B45C();
  v34 = v33;

  if (v34)
  {
    v87 = v14;
    v88 = v15;
    *(_QWORD *)&v86 = v32;
    *((_QWORD *)&v86 + 1) = v34;
    sub_18B70C408(&v86, (uint64_t)v84);
    v35 = v83;
    v36 = swift_isUniquelyReferenced_nonNull_native();
    v82 = v35;
    v37 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1E0C80A78](v37);
    v39 = (char *)&v81 - ((v38 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v40 + 16))(v39);
    sub_18B710B84((uint64_t)v39, 0xD000000000000012, 0x800000018B744490, v36, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18B70ED6C(0xD000000000000012, 0x800000018B744490, (uint64_t)&v86);
    sub_18B709714((uint64_t)&v86, &qword_1EDFD9020);
  }
  v41 = objc_msgSend(v1, sel_homePosterAppearance);
  v42 = sub_18B70B45C();
  v44 = v43;

  if (v44)
  {
    v87 = v14;
    v88 = v15;
    *(_QWORD *)&v86 = v42;
    *((_QWORD *)&v86 + 1) = v44;
    sub_18B70C408(&v86, (uint64_t)v84);
    v45 = v83;
    v46 = swift_isUniquelyReferenced_nonNull_native();
    v82 = v45;
    v47 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1E0C80A78](v47);
    v49 = (char *)&v81 - ((v48 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v50 + 16))(v49);
    sub_18B710B84((uint64_t)v49, 0xD000000000000014, 0x800000018B7444B0, v46, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18B70ED6C(0xD000000000000014, 0x800000018B7444B0, (uint64_t)&v86);
    sub_18B709714((uint64_t)&v86, &qword_1EDFD9020);
  }
  v51 = objc_msgSend(v1, sel_customizationConfiguration);
  v52 = sub_18B70B45C();
  v54 = v53;

  if (v54)
  {
    v87 = v14;
    v88 = v15;
    *(_QWORD *)&v86 = v52;
    *((_QWORD *)&v86 + 1) = v54;
    sub_18B70C408(&v86, (uint64_t)v84);
    v55 = v83;
    v56 = swift_isUniquelyReferenced_nonNull_native();
    v82 = v55;
    v57 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)v84, v85);
    MEMORY[0x1E0C80A78](v57);
    v59 = (char *)&v81 - ((v58 + 15) & 0xFFFFFFFFFFFFFFF0);
    (*(void (**)(char *))(v60 + 16))(v59);
    sub_18B710B84((uint64_t)v59, 0xD00000000000001ALL, 0x800000018B7444D0, v56, &v82, v14, v15);
    __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v84);
    v83 = v82;
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_18B70ED6C(0xD00000000000001ALL, 0x800000018B7444D0, (uint64_t)&v86);
    sub_18B709714((uint64_t)&v86, &qword_1EDFD9020);
  }
  v61 = (void *)objc_opt_self();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9028);
  v62 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v86 = 0;
  v63 = objc_msgSend(v61, sel_dataWithJSONObject_options_error_, v62, 0, &v86);

  v64 = (id)v86;
  if (v63)
  {
    v65 = sub_18B728F14();

  }
  else
  {
    v66 = v64;
    v67 = (void *)sub_18B728EE4();

    swift_willThrow();
    if (qword_1EDFD5210 != -1)
      swift_once();
    v68 = sub_18B728FA4();
    __swift_project_value_buffer(v68, (uint64_t)qword_1EDFDA4D0);
    v69 = sub_18B729400();
    v70 = v1;
    v71 = v67;
    v72 = v70;
    v73 = v67;
    v74 = sub_18B728F98();
    if (os_log_type_enabled(v74, v69))
    {
      v75 = swift_slowAlloc();
      v76 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v75 = 138412546;
      *(_QWORD *)&v86 = v72;
      v77 = v72;
      sub_18B729490();
      *v76 = v72;

      *(_WORD *)(v75 + 12) = 2112;
      v78 = v67;
      v79 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v86 = v79;
      sub_18B729490();
      v76[1] = v79;

      _os_log_impl(&dword_18B634000, v74, v69, "Error serializing into json %@ : %@", (uint8_t *)v75, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
      swift_arrayDestroy();
      MEMORY[0x18D77C964](v76, -1, -1);
      MEMORY[0x18D77C964](v75, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v65;
}

uint64_t sub_18B70C408(__int128 *a1, uint64_t a2)
{
  __int128 v2;
  __int128 v3;

  v2 = *a1;
  v3 = a1[1];
  *(_QWORD *)(a2 + 32) = *((_QWORD *)a1 + 4);
  *(_OWORD *)a2 = v2;
  *(_OWORD *)(a2 + 16) = v3;
  return a2;
}

uint64_t __swift_mutable_project_boxed_opaque_existential_1(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t result;

  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
  {
    swift_makeBoxUnique();
    return v2;
  }
  return result;
}

uint64_t static PRPosterHomeScreenConfiguration.decodeObject(withJSON:)()
{
  void *v0;
  void *v1;
  id v2;
  id v3;
  uint64_t v4;
  unint64_t v5;
  char v6;
  id v7;
  void *v8;
  uint64_t v9;
  os_log_type_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  _QWORD *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  char v23;
  int v24;
  BOOL v25;
  void *v26;
  unint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t v30;
  int v31;
  BOOL v32;
  void *v33;
  unint64_t v34;
  char v35;
  uint64_t v36;
  uint64_t v37;
  int v38;
  BOOL v39;
  void *v40;
  unint64_t v41;
  char v42;
  uint64_t v43;
  uint64_t v44;
  int v45;
  BOOL v46;
  void *v47;
  unint64_t v48;
  char v49;
  int v50;
  BOOL v51;
  uint64_t v52;
  uint64_t v53;
  void *v54;
  id v55;
  uint64_t result;
  uint64_t v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_18B728EFC();
  *(_QWORD *)&v59 = 0;
  v2 = objc_msgSend(v0, sel_JSONObjectWithData_options_error_, v1, 0, &v59);

  if (!v2)
  {
    v7 = (id)v59;
    v8 = (void *)sub_18B728EE4();

    swift_willThrow();
    if (qword_1EDFD5210 != -1)
      swift_once();
    v9 = sub_18B728FA4();
    __swift_project_value_buffer(v9, (uint64_t)qword_1EDFDA4D0);
    v10 = sub_18B729400();
    v11 = v8;
    v12 = v8;
    v13 = sub_18B728F98();
    v14 = v10;
    if (os_log_type_enabled(v13, v10))
    {
      v15 = (uint8_t *)swift_slowAlloc();
      v16 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v15 = 138412290;
      v17 = v8;
      v18 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v59 = v18;
      sub_18B729490();
      *v16 = v18;

      _os_log_impl(&dword_18B634000, v13, v14, "Error decoding json data into an object: %@", v15, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
      swift_arrayDestroy();
      MEMORY[0x18D77C964](v16, -1, -1);
      MEMORY[0x18D77C964](v15, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v3 = (id)v59;
  sub_18B7294B4();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9038);
  if (swift_dynamicCast())
    v4 = v57;
  else
    v4 = 0;
  if (!v4)
  {
    v59 = 0u;
    v60 = 0u;
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v19 = 0;
LABEL_20:
    v59 = 0u;
    v60 = 0u;
LABEL_21:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v20 = 0;
    v21 = 0;
    goto LABEL_34;
  }
  if (!*(_QWORD *)(v4 + 16))
  {
    v59 = 0u;
    v60 = 0u;
LABEL_22:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
LABEL_23:
    v19 = 0;
    if (!*(_QWORD *)(v4 + 16))
      goto LABEL_20;
    goto LABEL_24;
  }
  swift_bridgeObjectRetain();
  v5 = sub_18B70E9C8(0xD000000000000016, 0x800000018B744430);
  if ((v6 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v5, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_22;
  if (!swift_dynamicCast())
    goto LABEL_23;
  v19 = v57;
  if (!*(_QWORD *)(v4 + 16))
    goto LABEL_20;
LABEL_24:
  swift_bridgeObjectRetain();
  v22 = sub_18B70E9C8(0xD000000000000014, 0x800000018B744450);
  if ((v23 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v22, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_21;
  v24 = swift_dynamicCast();
  v25 = v24 == 0;
  if (v24)
    v20 = v57;
  else
    v20 = 0;
  if (v25)
    v21 = 0;
  else
    v21 = v58;
LABEL_34:
  v26 = (void *)sub_18B70B738(v20, v21, &qword_1EDFD90B8);
  swift_bridgeObjectRelease();
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
    v59 = 0u;
    v60 = 0u;
LABEL_39:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v29 = 0;
    v30 = 0;
    goto LABEL_48;
  }
  swift_bridgeObjectRetain();
  v27 = sub_18B70E9C8(0xD000000000000014, 0x800000018B744470);
  if ((v28 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v27, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_39;
  v31 = swift_dynamicCast();
  v32 = v31 == 0;
  if (v31)
    v29 = v57;
  else
    v29 = 0;
  if (v32)
    v30 = 0;
  else
    v30 = v58;
LABEL_48:
  v33 = (void *)sub_18B70B738(v29, v30, &qword_1EDFD90B0);
  swift_bridgeObjectRelease();
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
    v59 = 0u;
    v60 = 0u;
LABEL_53:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v36 = 0;
    v37 = 0;
    goto LABEL_62;
  }
  swift_bridgeObjectRetain();
  v34 = sub_18B70E9C8(0xD000000000000012, 0x800000018B744490);
  if ((v35 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v34, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_53;
  v38 = swift_dynamicCast();
  v39 = v38 == 0;
  if (v38)
    v36 = v57;
  else
    v36 = 0;
  if (v39)
    v37 = 0;
  else
    v37 = v58;
LABEL_62:
  v40 = (void *)sub_18B70B738(v36, v37, &qword_1EDFD90A8);
  swift_bridgeObjectRelease();
  if (!v4 || !*(_QWORD *)(v4 + 16))
  {
    v59 = 0u;
    v60 = 0u;
LABEL_67:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v43 = 0;
    v44 = 0;
    goto LABEL_76;
  }
  swift_bridgeObjectRetain();
  v41 = sub_18B70E9C8(0xD000000000000014, 0x800000018B7444B0);
  if ((v42 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v41, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_67;
  v45 = swift_dynamicCast();
  v46 = v45 == 0;
  if (v45)
    v43 = v57;
  else
    v43 = 0;
  if (v46)
    v44 = 0;
  else
    v44 = v58;
LABEL_76:
  v47 = (void *)sub_18B70B738(v43, v44, &qword_1EDFD90A0);
  swift_bridgeObjectRelease();
  if (!v4)
  {
    v59 = 0u;
    v60 = 0u;
LABEL_89:
    sub_18B709714((uint64_t)&v59, &qword_1EDFD9040);
    v52 = 0;
    v53 = 0;
    goto LABEL_90;
  }
  if (*(_QWORD *)(v4 + 16) && (v48 = sub_18B70E9C8(0xD00000000000001ALL, 0x800000018B7444D0), (v49 & 1) != 0))
  {
    sub_18B710D50(*(_QWORD *)(v4 + 56) + 32 * v48, (uint64_t)&v59);
  }
  else
  {
    v59 = 0u;
    v60 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v60 + 1))
    goto LABEL_89;
  v50 = swift_dynamicCast();
  v51 = v50 == 0;
  if (v50)
    v52 = v57;
  else
    v52 = 0;
  if (v51)
    v53 = 0;
  else
    v53 = v58;
LABEL_90:
  v54 = (void *)sub_18B70B738(v52, v53, &qword_1EDFD9098);
  swift_bridgeObjectRelease();
  if (!v54)
  {

LABEL_99:
LABEL_100:

LABEL_101:
    return 0;
  }
  if (!v26)
  {

    goto LABEL_99;
  }
  if (!v33)
  {

    goto LABEL_100;
  }
  if (!v40)
  {

    goto LABEL_101;
  }
  if (v47)
  {
    v55 = objc_msgSend(objc_allocWithZone((Class)PRPosterHomeScreenConfiguration), sel_initWithSelectedAppearanceType_lockPosterAppearance_solidColorAppearance_gradientAppearance_homePosterAppearance_customizationConfiguration_, v19, v26, v33, v40, v47, v54);

    result = swift_dynamicCastUnknownClass();
    if (result)
      return result;

  }
  else
  {

  }
  return 0;
}

__CFString *PRPosterSuggestionMetadata.attributeType.getter()
{
  return CFSTR("PRPosterRoleAttributeTypeSuggestionMetadata");
}

uint64_t PRPosterSuggestionMetadata.encodeJSON()()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  id v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char isUniquelyReferenced_nonNull_native;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  os_log_type_t v34;
  id v35;
  id v36;
  id v37;
  id v38;
  NSObject *v39;
  uint64_t v40;
  _QWORD *v41;
  id v42;
  id v43;
  uint64_t v44;
  _QWORD v46[2];
  uint64_t v47;
  _OWORD v48[2];
  __int128 v49;
  uint64_t v50;
  uint64_t v51;

  v1 = v0;
  v51 = *MEMORY[0x1E0C80C00];
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9048);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v46 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)v46 - v6;
  v47 = MEMORY[0x1E0DEE9E0];
  v8 = objc_msgSend(v1, sel_lastModifiedDate);
  if (v8)
  {
    v9 = v8;
    sub_18B728F44();

    v10 = sub_18B728F50();
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 0, 1, v10);
  }
  else
  {
    v10 = sub_18B728F50();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v10 - 8) + 56))(v5, 1, 1, v10);
  }
  sub_18B710D8C((uint64_t)v5, (uint64_t)v7);
  sub_18B728F50();
  v11 = *(_QWORD *)(v10 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v11 + 48))(v7, 1, v10) == 1)
  {
    sub_18B709714((uint64_t)v7, &qword_1EDFD9048);
    sub_18B70EE64(0xD000000000000010, 0x800000018B7444F0, &v49);
    sub_18B709714((uint64_t)&v49, &qword_1EDFD9040);
  }
  else
  {
    sub_18B728F2C();
    v50 = MEMORY[0x1E0DEB070];
    *(_QWORD *)&v49 = v12;
    (*(void (**)(char *, uint64_t))(v11 + 8))(v7, v10);
    sub_18B710DD4(&v49, v48);
    v13 = v47;
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v46[0] = v13;
    sub_18B7100A8(v48, 0xD000000000000010, 0x800000018B7444F0, isUniquelyReferenced_nonNull_native);
    v47 = v46[0];
    swift_bridgeObjectRelease();
  }
  v15 = objc_msgSend(v1, sel_suggestedGalleryItem);
  if (v15)
  {
    v16 = v15;
    v17 = sub_18B70B45C();
    if (v18)
    {
      v50 = MEMORY[0x1E0DEA968];
      *(_QWORD *)&v49 = v17;
      *((_QWORD *)&v49 + 1) = v18;
      sub_18B710DD4(&v49, v48);
      v19 = v47;
      v20 = swift_isUniquelyReferenced_nonNull_native();
      v46[0] = v19;
      sub_18B7100A8(v48, 0xD000000000000014, 0x800000018B744540, v20);
      v47 = v46[0];

      swift_bridgeObjectRelease();
    }
    else
    {
      sub_18B70EE64(0xD000000000000014, 0x800000018B744540, &v49);
      sub_18B709714((uint64_t)&v49, &qword_1EDFD9040);

    }
  }
  v21 = objc_msgSend(v1, sel_suggestedComplicationsByIdentifier);
  sub_18B6FEB68(0, &qword_1EDFD9050);
  v22 = sub_18B729334();

  v23 = sub_18B7107C0(v22);
  swift_bridgeObjectRelease();
  v50 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9058);
  *(_QWORD *)&v49 = v23;
  sub_18B710DD4(&v49, v48);
  v24 = v47;
  v25 = swift_isUniquelyReferenced_nonNull_native();
  v46[0] = v24;
  sub_18B7100A8(v48, 0xD000000000000022, 0x800000018B744510, v25);
  v47 = v46[0];
  swift_bridgeObjectRelease();
  v26 = (void *)objc_opt_self();
  v27 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  *(_QWORD *)&v49 = 0;
  v28 = objc_msgSend(v26, sel_dataWithJSONObject_options_error_, v27, 0, &v49);

  v29 = (id)v49;
  if (v28)
  {
    v30 = sub_18B728F14();

  }
  else
  {
    v31 = v29;
    v32 = (void *)sub_18B728EE4();

    swift_willThrow();
    if (qword_1EDFD5210 != -1)
      swift_once();
    v33 = sub_18B728FA4();
    __swift_project_value_buffer(v33, (uint64_t)qword_1EDFDA4D0);
    v34 = sub_18B729400();
    v35 = v1;
    v36 = v32;
    v37 = v35;
    v38 = v32;
    v39 = sub_18B728F98();
    if (os_log_type_enabled(v39, v34))
    {
      v40 = swift_slowAlloc();
      v41 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v40 = 138412546;
      *(_QWORD *)&v49 = v37;
      v42 = v37;
      sub_18B729490();
      *v41 = v37;

      *(_WORD *)(v40 + 12) = 2112;
      v43 = v32;
      v44 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v49 = v44;
      sub_18B729490();
      v41[1] = v44;

      _os_log_impl(&dword_18B634000, v39, v34, "Error serializing into json %@ : %@", (uint8_t *)v40, 0x16u);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
      swift_arrayDestroy();
      MEMORY[0x18D77C964](v41, -1, -1);
      MEMORY[0x18D77C964](v40, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  return v30;
}

id sub_18B70D344(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  void *v8;

  v4 = a1;
  v5 = a3();
  v7 = v6;

  if (v7 >> 60 == 15)
  {
    v8 = 0;
  }
  else
  {
    v8 = (void *)sub_18B728EFC();
    sub_18B710E28(v5, v7);
  }
  return v8;
}

uint64_t static PRPosterSuggestionMetadata.decodeObject(withJSON:)()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  unint64_t v14;
  char v15;
  char v16;
  uint64_t v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t, uint64_t, uint64_t);
  unint64_t v20;
  char v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  uint64_t v26;
  os_log_type_t v27;
  id v28;
  id v29;
  NSObject *v30;
  os_log_type_t v31;
  uint8_t *v32;
  _QWORD *v33;
  id v34;
  uint64_t v35;
  int v36;
  BOOL v37;
  void *v38;
  unint64_t v39;
  char v40;
  void *v41;
  void *v42;
  id v43;
  uint64_t result;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9048);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v45 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v1);
  v6 = (char *)&v45 - v5;
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v45 - v7;
  v9 = (void *)objc_opt_self();
  v10 = (void *)sub_18B728EFC();
  *(_QWORD *)&v48 = 0;
  v11 = objc_msgSend(v9, sel_JSONObjectWithData_options_error_, v10, 0, &v48);

  if (!v11)
  {
    v24 = (id)v48;
    v25 = (void *)sub_18B728EE4();

    swift_willThrow();
    if (qword_1EDFD5210 != -1)
      swift_once();
    v26 = sub_18B728FA4();
    __swift_project_value_buffer(v26, (uint64_t)qword_1EDFDA4D0);
    v27 = sub_18B729400();
    v28 = v25;
    v29 = v25;
    v30 = sub_18B728F98();
    v31 = v27;
    if (os_log_type_enabled(v30, v27))
    {
      v32 = (uint8_t *)swift_slowAlloc();
      v33 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v32 = 138412290;
      v34 = v25;
      v35 = _swift_stdlib_bridgeErrorToNSError();
      *(_QWORD *)&v48 = v35;
      sub_18B729490();
      *v33 = v35;

      _os_log_impl(&dword_18B634000, v30, v31, "Error decoding json data into an object: %@", v32, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
      swift_arrayDestroy();
      MEMORY[0x18D77C964](v33, -1, -1);
      MEMORY[0x18D77C964](v32, -1, -1);

    }
    else
    {

    }
    return 0;
  }
  v12 = (id)v48;
  sub_18B7294B4();
  swift_unknownObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9038);
  if (swift_dynamicCast())
    v13 = v46;
  else
    v13 = 0;
  if (!v13 || !*(_QWORD *)(v13 + 16))
  {
    v48 = 0u;
    v49 = 0u;
LABEL_10:
    sub_18B709714((uint64_t)&v48, &qword_1EDFD9040);
LABEL_11:
    v16 = 1;
    goto LABEL_12;
  }
  swift_bridgeObjectRetain();
  v14 = sub_18B70E9C8(0xD000000000000010, 0x800000018B7444F0);
  if ((v15 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v13 + 56) + 32 * v14, (uint64_t)&v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v49 + 1))
    goto LABEL_10;
  if (!swift_dynamicCast())
    goto LABEL_11;
  v16 = 0;
LABEL_12:
  v17 = sub_18B728F50();
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(v18 + 56);
  v19(v8, 1, 1, v17);
  if ((v16 & 1) == 0)
  {
    sub_18B728F20();
    sub_18B709714((uint64_t)v8, &qword_1EDFD9048);
    v19(v6, 0, 1, v17);
    sub_18B710D8C((uint64_t)v6, (uint64_t)v8);
  }
  if (!v13 || !*(_QWORD *)(v13 + 16))
  {
    v48 = 0u;
    v49 = 0u;
LABEL_19:
    sub_18B709714((uint64_t)&v48, &qword_1EDFD9040);
    v22 = 0;
    v23 = 0;
    goto LABEL_37;
  }
  swift_bridgeObjectRetain();
  v20 = sub_18B70E9C8(0xD000000000000014, 0x800000018B744540);
  if ((v21 & 1) != 0)
  {
    sub_18B710D50(*(_QWORD *)(v13 + 56) + 32 * v20, (uint64_t)&v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v49 + 1))
    goto LABEL_19;
  v36 = swift_dynamicCast();
  v37 = v36 == 0;
  if (v36)
    v22 = v46;
  else
    v22 = 0;
  if (v37)
    v23 = 0;
  else
    v23 = v47;
LABEL_37:
  v38 = (void *)sub_18B70B738(v22, v23, &qword_1EDFD9080);
  swift_bridgeObjectRelease();
  if (!v13)
  {
    v48 = 0u;
    v49 = 0u;
LABEL_46:
    sub_18B709714((uint64_t)&v48, &qword_1EDFD9040);
    goto LABEL_47;
  }
  if (*(_QWORD *)(v13 + 16) && (v39 = sub_18B70E9C8(0xD000000000000022, 0x800000018B744510), (v40 & 1) != 0))
  {
    sub_18B710D50(*(_QWORD *)(v13 + 56) + 32 * v39, (uint64_t)&v48);
  }
  else
  {
    v48 = 0u;
    v49 = 0u;
  }
  swift_bridgeObjectRelease();
  if (!*((_QWORD *)&v49 + 1))
    goto LABEL_46;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9060);
  if ((swift_dynamicCast() & 1) != 0)
  {
    sub_18B70DA90(v46);
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
LABEL_47:
  sub_18B70B344(MEMORY[0x1E0DEE9D8]);
LABEL_48:
  sub_18B7096D0((uint64_t)v8, (uint64_t)v3, &qword_1EDFD9048);
  sub_18B6FEB68(0, &qword_1EDFD9050);
  v41 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  v42 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v18 + 48))(v3, 1, v17) != 1)
  {
    v42 = (void *)sub_18B728F38();
    (*(void (**)(char *, uint64_t))(v18 + 8))(v3, v17);
  }
  v43 = objc_msgSend(objc_allocWithZone((Class)PRPosterSuggestionMetadata), sel_initWithSuggestedGalleryItem_suggestedComplicationsByIdentifier_lastModifiedDate_, v38, v41, v42);

  sub_18B709714((uint64_t)v8, &qword_1EDFD9048);
  result = swift_dynamicCastUnknownClass();
  if (!result)
  {

    return 0;
  }
  return result;
}

void sub_18B70DA90(uint64_t a1)
{
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  unint64_t v9;
  unint64_t v10;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_log_type_t v23;
  id v24;
  id v25;
  NSObject *v26;
  os_log_type_t v27;
  uint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  id v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  unint64_t v40;
  unint64_t v41;
  unint64_t v42;
  char v43;
  unint64_t v44;
  BOOL v45;
  uint64_t v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t i;
  int64_t v51;
  uint64_t v52;
  uint64_t v53[10];
  uint64_t v54;

  v2 = v1;
  v3 = a1;
  v4 = *(_QWORD *)(a1 + 64);
  v52 = a1 + 64;
  v48 = MEMORY[0x1E0DEE9E0];
  v54 = MEMORY[0x1E0DEE9E0];
  v5 = -1 << *(_BYTE *)(a1 + 32);
  if (-v5 < 64)
    v6 = ~(-1 << -(char)v5);
  else
    v6 = -1;
  v7 = v6 & v4;
  v51 = (unint64_t)(63 - v5) >> 6;
  v8 = 0;
  for (i = swift_bridgeObjectRetain(); ; v3 = i)
  {
    while (1)
    {
      while (1)
      {
        if (v7)
        {
          v9 = __clz(__rbit64(v7));
          v7 &= v7 - 1;
          v10 = v9 | (v8 << 6);
        }
        else
        {
          v11 = v8 + 1;
          if (__OFADD__(v8, 1))
          {
            __break(1u);
LABEL_51:
            __break(1u);
            goto LABEL_52;
          }
          if (v11 >= v51)
            goto LABEL_49;
          v12 = *(_QWORD *)(v52 + 8 * v11);
          if (!v12)
          {
            v13 = v8 + 2;
            if (v8 + 2 >= v51)
              goto LABEL_49;
            v12 = *(_QWORD *)(v52 + 8 * v13);
            if (!v12)
            {
              v13 = v8 + 3;
              if (v8 + 3 >= v51)
                goto LABEL_49;
              v12 = *(_QWORD *)(v52 + 8 * v13);
              if (!v12)
              {
                v13 = v8 + 4;
                if (v8 + 4 >= v51)
                  goto LABEL_49;
                v12 = *(_QWORD *)(v52 + 8 * v13);
                if (!v12)
                {
                  v13 = v8 + 5;
                  if (v8 + 5 >= v51)
                  {
LABEL_49:
                    sub_18B710E3C();
                    return;
                  }
                  v12 = *(_QWORD *)(v52 + 8 * v13);
                  if (!v12)
                  {
                    while (1)
                    {
                      v11 = v13 + 1;
                      if (__OFADD__(v13, 1))
                        goto LABEL_51;
                      if (v11 >= v51)
                        goto LABEL_49;
                      v12 = *(_QWORD *)(v52 + 8 * v11);
                      ++v13;
                      if (v12)
                        goto LABEL_20;
                    }
                  }
                }
              }
            }
            v11 = v13;
          }
LABEL_20:
          v7 = (v12 - 1) & v12;
          v10 = __clz(__rbit64(v12)) + (v11 << 6);
          v8 = v11;
        }
        v14 = (uint64_t *)(*(_QWORD *)(v3 + 48) + 16 * v10);
        v16 = *v14;
        v15 = v14[1];
        swift_bridgeObjectRetain();
        swift_bridgeObjectRetain();
        v17 = sub_18B728EF0();
        if (v18 >> 60 != 15)
          break;
        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      v19 = v17;
      v20 = v18;
      sub_18B6FEB68(0, &qword_1EDFD9068);
      sub_18B6FEB68(0, &qword_1EDFD9050);
      v21 = sub_18B72943C();
      if (!v2)
        break;
      sub_18B710E28(v19, v20);
      if (qword_1EDFD5210 != -1)
        swift_once();
      v22 = sub_18B728FA4();
      __swift_project_value_buffer(v22, (uint64_t)qword_1EDFDA4D0);
      v23 = sub_18B729400();
      v24 = v2;
      v25 = v2;
      v26 = sub_18B728F98();
      v27 = v23;
      if (os_log_type_enabled(v26, v23))
      {
        v28 = swift_slowAlloc();
        v29 = (_QWORD *)swift_slowAlloc();
        v49 = swift_slowAlloc();
        v53[0] = v49;
        *(_DWORD *)v28 = 136315394;
        v30 = sub_18B7295E0();
        *(_QWORD *)(v28 + 4) = sub_18B70E1CC(v30, v31, v53);
        swift_bridgeObjectRelease();
        *(_WORD *)(v28 + 12) = 2112;
        v32 = v2;
        v33 = _swift_stdlib_bridgeErrorToNSError();
        *(_QWORD *)(v28 + 14) = v33;
        *v29 = v33;

        _os_log_impl(&dword_18B634000, v26, v27, "Error unarchiving object for class %s: %@", (uint8_t *)v28, 0x16u);
        __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9030);
        swift_arrayDestroy();
        MEMORY[0x18D77C964](v29, -1, -1);
        swift_arrayDestroy();
        MEMORY[0x18D77C964](v49, -1, -1);
        MEMORY[0x18D77C964](v28, -1, -1);

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();
      }
      else
      {

        swift_bridgeObjectRelease();
        swift_bridgeObjectRelease();

      }
      v2 = 0;
LABEL_31:
      v3 = i;
    }
    v34 = v21;
    sub_18B710E28(v19, v20);
    if (!v34)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_31;
    }
    v35 = *(_QWORD *)(v48 + 16);
    if (*(_QWORD *)(v48 + 24) <= v35)
      sub_18B70F884(v35 + 1, 1);
    v36 = v54;
    sub_18B7295B0();
    sub_18B729388();
    v37 = sub_18B7295D4();
    v38 = v36 + 64;
    v48 = v36;
    v39 = -1 << *(_BYTE *)(v36 + 32);
    v40 = v37 & ~v39;
    v41 = v40 >> 6;
    if (((-1 << v40) & ~*(_QWORD *)(v36 + 64 + 8 * (v40 >> 6))) == 0)
      break;
    v42 = __clz(__rbit64((-1 << v40) & ~*(_QWORD *)(v36 + 64 + 8 * (v40 >> 6)))) | v40 & 0x7FFFFFFFFFFFFFC0;
LABEL_48:
    *(_QWORD *)(v38 + ((v42 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v42;
    v47 = (_QWORD *)(*(_QWORD *)(v36 + 48) + 16 * v42);
    *v47 = v16;
    v47[1] = v15;
    *(_QWORD *)(*(_QWORD *)(v36 + 56) + 8 * v42) = v34;
    ++*(_QWORD *)(v36 + 16);
    swift_bridgeObjectRelease();
  }
  v43 = 0;
  v44 = (unint64_t)(63 - v39) >> 6;
  while (++v41 != v44 || (v43 & 1) == 0)
  {
    v45 = v41 == v44;
    if (v41 == v44)
      v41 = 0;
    v43 |= v45;
    v46 = *(_QWORD *)(v38 + 8 * v41);
    if (v46 != -1)
    {
      v42 = __clz(__rbit64(~v46)) + (v41 << 6);
      goto LABEL_48;
    }
  }
LABEL_52:
  __break(1u);
}

id sub_18B70E07C(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(uint64_t, unint64_t))
{
  id v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;

  v5 = a3;
  v6 = sub_18B728F14();
  v8 = v7;

  swift_getObjCClassMetadata();
  v9 = (void *)a4(v6, v8);
  sub_18B710DE4(v6, v8);
  return v9;
}

uint64_t sub_18B70E0F8(uint64_t result, _BYTE **a2)
{
  _BYTE *v2;

  v2 = *a2;
  *v2 = result;
  *a2 = v2 + 1;
  return result;
}

uint64_t sub_18B70E108(uint64_t (**a1)(uint64_t, uint64_t, uint64_t), uint64_t a2, uint64_t a3, uint64_t a4)
{
  return (*a1)(a2, a3, a4);
}

uint64_t sub_18B70E13C(uint64_t (*a1)(void))
{
  return a1();
}

uint64_t sub_18B70E15C(uint64_t *a1, uint64_t a2, uint64_t *a3, uint64_t (*a4)(void))
{
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t result;

  v6 = a4();
  sub_18B70E1CC(v6, v7, a3);
  v8 = *a1 + 8;
  sub_18B729490();
  result = swift_bridgeObjectRelease();
  *a1 = v8;
  return result;
}

uint64_t sub_18B70E1CC(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_18B70E29C(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_18B710D50((uint64_t)v12, *a3);
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
      sub_18B710D50((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v12);
  return v7;
}

uint64_t sub_18B70E29C(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
{
  uint64_t v8;
  uint64_t result;
  uint64_t v11;
  uint64_t v12;
  _QWORD __src[2];

  if ((a6 & 0x2000000000000000) != 0)
  {
    if ((a4 & 1) == 0)
    {
      if (__dst)
      {
        v11 = HIBYTE(a6) & 0xF;
        if (a3 - (uint64_t)__dst > v11)
        {
          __src[0] = a5;
          __src[1] = a6 & 0xFFFFFFFFFFFFFFLL;
          if (__src >= (_QWORD *)&__dst[v11] || (char *)__src + v11 <= __dst)
          {
            memcpy(__dst, __src, HIBYTE(a6) & 0xF);
            sub_18B72949C();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_18B70E454(a5, a6);
    *a1 = v12;
    return result;
  }
  if ((a6 & 0x1000000000000000) != 0)
    goto LABEL_13;
  if ((a5 & 0x1000000000000000) != 0)
  {
    v8 = (a6 & 0xFFFFFFFFFFFFFFFLL) + 32;
    goto LABEL_5;
  }
  v8 = sub_18B729508();
  if (!v8)
  {
    sub_18B72952C();
    __break(1u);
LABEL_17:
    result = sub_18B729568();
    __break(1u);
    return result;
  }
LABEL_5:
  *a1 = v8;
  if ((a6 & 0x8000000000000000) != 0)
    return 0;
  else
    return swift_unknownObjectRetain();
}

uint64_t sub_18B70E454(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_18B70E4E8(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_18B70E6C0(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_18B70E6C0(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_18B70E4E8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  char v6;
  uint64_t result;

  if ((a2 & 0x1000000000000000) != 0)
    goto LABEL_10;
  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    while (1)
    {
      v3 = sub_18B70E65C(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_18B7294FC();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_18B72952C();
      __break(1u);
LABEL_10:
      v2 = sub_18B7293B8();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_18B729568();
    __break(1u);
LABEL_14:
    result = sub_18B72952C();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_18B70E65C(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9078);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_18B70E6C0(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  int64_t v8;
  int64_t v9;
  char *v10;
  size_t v11;
  char *v12;
  char *v13;
  uint64_t result;

  if ((a3 & 1) != 0)
  {
    v6 = *((_QWORD *)a4 + 3);
    v7 = v6 >> 1;
    if ((uint64_t)(v6 >> 1) < a2)
    {
      if (v7 + 0x4000000000000000 < 0)
      {
        __break(1u);
        goto LABEL_30;
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
  v8 = *((_QWORD *)a4 + 2);
  if (v7 <= v8)
    v9 = *((_QWORD *)a4 + 2);
  else
    v9 = v7;
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9078);
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
  v13 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v12 >= &v13[v8])
      memmove(v12, v13, v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_28;
  }
  if (v13 >= &v12[v8] || v12 >= &v13[v8])
  {
    memcpy(v12, v13, v8);
LABEL_28:
    swift_bridgeObjectRelease();
    return (uint64_t)v10;
  }
LABEL_30:
  result = sub_18B729568();
  __break(1u);
  return result;
}

_BYTE **sub_18B70E80C(_BYTE **result, uint64_t a2, uint64_t a3, char a4)
{
  _BYTE *v4;

  v4 = *result;
  *v4 = a4;
  *result = v4 + 1;
  return result;
}

void sub_18B70E81C(uint64_t *a1, _QWORD **a2, uint64_t a3, uint64_t (*a4)(void))
{
  void *v6;
  uint64_t v7;
  _QWORD *v8;

  v6 = (void *)a4();
  v7 = *a1 + 8;
  sub_18B729490();
  *a1 = v7;
  v8 = *a2;
  if (*a2)
  {
    *v8 = v6;
    *a2 = v8 + 1;
  }
  else
  {

  }
}

unint64_t sub_18B70E8CC(uint64_t a1, double a2)
{
  uint64_t v4;

  sub_18B7295B0();
  sub_18B72946C();
  sub_18B7295C8();
  v4 = sub_18B7295D4();
  return sub_18B70EA2C(a2, a1, v4);
}

unint64_t sub_18B70E948(uint64_t a1)
{
  uint64_t v2;

  sub_18B72937C();
  sub_18B7295B0();
  sub_18B729388();
  v2 = sub_18B7295D4();
  swift_bridgeObjectRelease();
  return sub_18B70EB18(a1, v2);
}

unint64_t sub_18B70E9C8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_18B7295B0();
  sub_18B729388();
  v4 = sub_18B7295D4();
  return sub_18B70EC8C(a1, a2, v4);
}

unint64_t sub_18B70EA2C(double a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v7;
  uint64_t v8;
  double v9;
  id v10;
  unsigned __int8 v11;

  v4 = -1 << *(_BYTE *)(v3 + 32);
  v5 = a3 & ~v4;
  if (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v7 = ~v4;
    sub_18B6FEB68(0, qword_1EDFD4E40);
    do
    {
      v8 = *(_QWORD *)(v3 + 48) + 16 * v5;
      v9 = *(double *)(v8 + 8);
      v10 = *(id *)v8;
      v11 = sub_18B729460();

      if ((v11 & (v9 == a1)) != 0)
        break;
      v5 = (v5 + 1) & v7;
    }
    while (((*(_QWORD *)(v3 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0);
  }
  return v5;
}

unint64_t sub_18B70EB18(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char v18;

  v3 = v2 + 64;
  v4 = -1 << *(_BYTE *)(v2 + 32);
  v5 = a2 & ~v4;
  if (((*(_QWORD *)(v2 + 64 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
  {
    v6 = sub_18B72937C();
    v8 = v7;
    if (v6 == sub_18B72937C() && v8 == v9)
    {
LABEL_16:
      swift_bridgeObjectRelease_n();
      return v5;
    }
    v11 = sub_18B729598();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    if ((v11 & 1) == 0)
    {
      v12 = ~v4;
      v5 = (v5 + 1) & v12;
      if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
      {
        while (1)
        {
          v13 = sub_18B72937C();
          v15 = v14;
          if (v13 == sub_18B72937C() && v15 == v16)
            break;
          v18 = sub_18B729598();
          swift_bridgeObjectRelease();
          swift_bridgeObjectRelease();
          if ((v18 & 1) == 0)
          {
            v5 = (v5 + 1) & v12;
            if (((*(_QWORD *)(v3 + ((v5 >> 3) & 0xFFFFFFFFFFFFF8)) >> v5) & 1) != 0)
              continue;
          }
          return v5;
        }
        goto LABEL_16;
      }
    }
  }
  return v5;
}

unint64_t sub_18B70EC8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v9;
  _QWORD *v10;
  BOOL v11;
  uint64_t v12;
  _QWORD *v13;
  BOOL v14;

  v4 = v3 + 64;
  v5 = -1 << *(_BYTE *)(v3 + 32);
  v6 = a3 & ~v5;
  if (((*(_QWORD *)(v3 + 64 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0)
  {
    v9 = *(_QWORD *)(v3 + 48);
    v10 = (_QWORD *)(v9 + 16 * v6);
    v11 = *v10 == a1 && v10[1] == a2;
    if (!v11 && (sub_18B729598() & 1) == 0)
    {
      v12 = ~v5;
      do
      {
        v6 = (v6 + 1) & v12;
        if (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) == 0)
          break;
        v13 = (_QWORD *)(v9 + 16 * v6);
        v14 = *v13 == a1 && v13[1] == a2;
      }
      while (!v14 && (sub_18B729598() & 1) == 0);
    }
  }
  return v6;
}

double sub_18B70ED6C@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_18B70E9C8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18B7103F4();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_18B70C408((__int128 *)(*(_QWORD *)(v11 + 56) + 40 * v8), a3);
    sub_18B70FB90(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    *(_QWORD *)(a3 + 32) = 0;
    result = 0.0;
    *(_OWORD *)a3 = 0u;
    *(_OWORD *)(a3 + 16) = 0u;
  }
  return result;
}

double sub_18B70EE64@<D0>(uint64_t a1@<X0>, uint64_t a2@<X1>, _OWORD *a3@<X8>)
{
  uint64_t *v3;
  uint64_t *v4;
  unint64_t v8;
  char v9;
  int isUniquelyReferenced_nonNull_native;
  uint64_t v11;
  double result;
  uint64_t v13;

  v4 = v3;
  swift_bridgeObjectRetain();
  v8 = sub_18B70E9C8(a1, a2);
  LOBYTE(a2) = v9;
  swift_bridgeObjectRelease();
  if ((a2 & 1) != 0)
  {
    isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
    v11 = *v4;
    v13 = *v4;
    *v4 = 0x8000000000000000;
    if (!isUniquelyReferenced_nonNull_native)
    {
      sub_18B7105DC();
      v11 = v13;
    }
    swift_bridgeObjectRelease();
    sub_18B710DD4((_OWORD *)(*(_QWORD *)(v11 + 56) + 32 * v8), a3);
    sub_18B70FD78(v8, v11);
    *v4 = v11;
    swift_bridgeObjectRelease();
  }
  else
  {
    result = 0.0;
    *a3 = 0u;
    a3[1] = 0u;
  }
  return result;
}

uint64_t sub_18B70EF54(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E58);
  v38 = a2;
  v6 = sub_18B729550();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = *(_QWORD *)(v5 + 48) + 16 * v20;
    v30 = *(void **)v29;
    v31 = *(_QWORD *)(v29 + 8);
    v32 = *(_QWORD *)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
      v33 = v30;
    sub_18B7295B0();
    sub_18B72946C();
    sub_18B7295C8();
    result = sub_18B7295D4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v30;
    v18[1] = v31;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18B70F264(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  _QWORD *v19;
  unint64_t v20;
  int64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;
  __int128 *v25;
  uint64_t v26;
  unint64_t v27;
  unint64_t v28;
  char v29;
  unint64_t v30;
  BOOL v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t *v34;
  int64_t v35;
  uint64_t v36;
  char v37;
  __int128 v38[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFD90C0);
  v37 = a2;
  v6 = sub_18B729550();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_41;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v36 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v34 = v2;
  v35 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v16 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v17 = v16 | (v13 << 6);
      goto LABEL_22;
    }
    v18 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_42:
      __break(1u);
LABEL_43:
      __break(1u);
      return result;
    }
    if (v18 >= v35)
      break;
    v19 = (_QWORD *)(v5 + 64);
    v20 = *(_QWORD *)(v36 + 8 * v18);
    ++v13;
    if (!v20)
    {
      v13 = v18 + 1;
      if (v18 + 1 >= v35)
        goto LABEL_34;
      v20 = *(_QWORD *)(v36 + 8 * v13);
      if (!v20)
      {
        v21 = v18 + 2;
        if (v21 >= v35)
        {
LABEL_34:
          swift_release();
          v3 = v34;
          if ((v37 & 1) == 0)
            goto LABEL_41;
          goto LABEL_37;
        }
        v20 = *(_QWORD *)(v36 + 8 * v21);
        if (!v20)
        {
          while (1)
          {
            v13 = v21 + 1;
            if (__OFADD__(v21, 1))
              goto LABEL_43;
            if (v13 >= v35)
              goto LABEL_34;
            v20 = *(_QWORD *)(v36 + 8 * v13);
            ++v21;
            if (v20)
              goto LABEL_21;
          }
        }
        v13 = v21;
      }
    }
LABEL_21:
    v10 = (v20 - 1) & v20;
    v17 = __clz(__rbit64(v20)) + (v13 << 6);
LABEL_22:
    v22 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
    v24 = *v22;
    v23 = v22[1];
    v25 = (__int128 *)(*(_QWORD *)(v5 + 56) + 40 * v17);
    if ((v37 & 1) != 0)
    {
      sub_18B70C408(v25, (uint64_t)v38);
    }
    else
    {
      sub_18B710FEC((uint64_t)v25, (uint64_t)v38);
      swift_bridgeObjectRetain();
    }
    sub_18B7295B0();
    sub_18B729388();
    result = sub_18B7295D4();
    v26 = -1 << *(_BYTE *)(v7 + 32);
    v27 = result & ~v26;
    v28 = v27 >> 6;
    if (((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6))) != 0)
    {
      v14 = __clz(__rbit64((-1 << v27) & ~*(_QWORD *)(v11 + 8 * (v27 >> 6)))) | v27 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v29 = 0;
      v30 = (unint64_t)(63 - v26) >> 6;
      do
      {
        if (++v28 == v30 && (v29 & 1) != 0)
        {
          __break(1u);
          goto LABEL_42;
        }
        v31 = v28 == v30;
        if (v28 == v30)
          v28 = 0;
        v29 |= v31;
        v32 = *(_QWORD *)(v11 + 8 * v28);
      }
      while (v32 == -1);
      v14 = __clz(__rbit64(~v32)) + (v28 << 6);
    }
    *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
    v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
    *v15 = v24;
    v15[1] = v23;
    result = sub_18B70C408(v38, *(_QWORD *)(v7 + 56) + 40 * v14);
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v34;
  v19 = (_QWORD *)(v5 + 64);
  if ((v37 & 1) == 0)
    goto LABEL_41;
LABEL_37:
  v33 = 1 << *(_BYTE *)(v5 + 32);
  if (v33 >= 64)
    bzero(v19, ((unint64_t)(v33 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v19 = -1 << v33;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_41:
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18B70F588(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  unint64_t v14;
  _QWORD *v15;
  unint64_t v16;
  unint64_t v17;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  _OWORD *v24;
  uint64_t v25;
  unint64_t v26;
  unint64_t v27;
  char v28;
  unint64_t v29;
  BOOL v30;
  uint64_t v31;
  uint64_t v32;
  int64_t v33;
  _QWORD *v34;
  _OWORD v35[2];

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9088);
  v6 = sub_18B729550();
  v7 = v6;
  if (*(_QWORD *)(v5 + 16))
  {
    v8 = 1 << *(_BYTE *)(v5 + 32);
    v34 = (_QWORD *)(v5 + 64);
    if (v8 < 64)
      v9 = ~(-1 << v8);
    else
      v9 = -1;
    v10 = v9 & *(_QWORD *)(v5 + 64);
    v33 = (unint64_t)(v8 + 63) >> 6;
    v11 = v6 + 64;
    result = swift_retain();
    v13 = 0;
    while (1)
    {
      if (v10)
      {
        v16 = __clz(__rbit64(v10));
        v10 &= v10 - 1;
        v17 = v16 | (v13 << 6);
      }
      else
      {
        v18 = v13 + 1;
        if (__OFADD__(v13, 1))
        {
LABEL_40:
          __break(1u);
LABEL_41:
          __break(1u);
          return result;
        }
        if (v18 >= v33)
          goto LABEL_34;
        v19 = v34[v18];
        ++v13;
        if (!v19)
        {
          v13 = v18 + 1;
          if (v18 + 1 >= v33)
            goto LABEL_34;
          v19 = v34[v13];
          if (!v19)
          {
            v20 = v18 + 2;
            if (v20 >= v33)
            {
LABEL_34:
              swift_release();
              v3 = v2;
              if ((a2 & 1) != 0)
              {
                v32 = 1 << *(_BYTE *)(v5 + 32);
                if (v32 >= 64)
                  bzero(v34, ((unint64_t)(v32 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v34 = -1 << v32;
                *(_QWORD *)(v5 + 16) = 0;
              }
              break;
            }
            v19 = v34[v20];
            if (!v19)
            {
              while (1)
              {
                v13 = v20 + 1;
                if (__OFADD__(v20, 1))
                  goto LABEL_41;
                if (v13 >= v33)
                  goto LABEL_34;
                v19 = v34[v13];
                ++v20;
                if (v19)
                  goto LABEL_21;
              }
            }
            v13 = v20;
          }
        }
LABEL_21:
        v10 = (v19 - 1) & v19;
        v17 = __clz(__rbit64(v19)) + (v13 << 6);
      }
      v21 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v17);
      v23 = *v21;
      v22 = v21[1];
      v24 = (_OWORD *)(*(_QWORD *)(v5 + 56) + 32 * v17);
      if ((a2 & 1) != 0)
      {
        sub_18B710DD4(v24, v35);
      }
      else
      {
        sub_18B710D50((uint64_t)v24, (uint64_t)v35);
        swift_bridgeObjectRetain();
      }
      sub_18B7295B0();
      sub_18B729388();
      result = sub_18B7295D4();
      v25 = -1 << *(_BYTE *)(v7 + 32);
      v26 = result & ~v25;
      v27 = v26 >> 6;
      if (((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6))) != 0)
      {
        v14 = __clz(__rbit64((-1 << v26) & ~*(_QWORD *)(v11 + 8 * (v26 >> 6)))) | v26 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v28 = 0;
        v29 = (unint64_t)(63 - v25) >> 6;
        do
        {
          if (++v27 == v29 && (v28 & 1) != 0)
          {
            __break(1u);
            goto LABEL_40;
          }
          v30 = v27 == v29;
          if (v27 == v29)
            v27 = 0;
          v28 |= v30;
          v31 = *(_QWORD *)(v11 + 8 * v27);
        }
        while (v31 == -1);
        v14 = __clz(__rbit64(~v31)) + (v27 << 6);
      }
      *(_QWORD *)(v11 + ((v14 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v14;
      v15 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v14);
      *v15 = v23;
      v15[1] = v22;
      result = (uint64_t)sub_18B710DD4(v35, (_OWORD *)(*(_QWORD *)(v7 + 56) + 32 * v14));
      ++*(_QWORD *)(v7 + 16);
    }
  }
  result = swift_release();
  *v3 = v7;
  return result;
}

uint64_t sub_18B70F884(uint64_t a1, char a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t result;
  int64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  unint64_t v19;
  unint64_t v20;
  int64_t v21;
  _QWORD *v22;
  unint64_t v23;
  int64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t *v35;
  int64_t v36;
  uint64_t v37;
  char v38;

  v3 = v2;
  v5 = *v2;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9070);
  v38 = a2;
  v6 = sub_18B729550();
  v7 = v6;
  if (!*(_QWORD *)(v5 + 16))
    goto LABEL_40;
  v8 = 1 << *(_BYTE *)(v5 + 32);
  v37 = v5 + 64;
  if (v8 < 64)
    v9 = ~(-1 << v8);
  else
    v9 = -1;
  v10 = v9 & *(_QWORD *)(v5 + 64);
  v35 = v2;
  v36 = (unint64_t)(v8 + 63) >> 6;
  v11 = v6 + 64;
  result = swift_retain();
  v13 = 0;
  while (1)
  {
    if (v10)
    {
      v19 = __clz(__rbit64(v10));
      v10 &= v10 - 1;
      v20 = v19 | (v13 << 6);
      goto LABEL_31;
    }
    v21 = v13 + 1;
    if (__OFADD__(v13, 1))
    {
LABEL_41:
      __break(1u);
LABEL_42:
      __break(1u);
      return result;
    }
    if (v21 >= v36)
      break;
    v22 = (_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v37 + 8 * v21);
    ++v13;
    if (!v23)
    {
      v13 = v21 + 1;
      if (v21 + 1 >= v36)
        goto LABEL_33;
      v23 = *(_QWORD *)(v37 + 8 * v13);
      if (!v23)
      {
        v24 = v21 + 2;
        if (v24 >= v36)
        {
LABEL_33:
          swift_release();
          v3 = v35;
          if ((v38 & 1) == 0)
            goto LABEL_40;
          goto LABEL_36;
        }
        v23 = *(_QWORD *)(v37 + 8 * v24);
        if (!v23)
        {
          while (1)
          {
            v13 = v24 + 1;
            if (__OFADD__(v24, 1))
              goto LABEL_42;
            if (v13 >= v36)
              goto LABEL_33;
            v23 = *(_QWORD *)(v37 + 8 * v13);
            ++v24;
            if (v23)
              goto LABEL_30;
          }
        }
        v13 = v24;
      }
    }
LABEL_30:
    v10 = (v23 - 1) & v23;
    v20 = __clz(__rbit64(v23)) + (v13 << 6);
LABEL_31:
    v29 = (uint64_t *)(*(_QWORD *)(v5 + 48) + 16 * v20);
    v31 = *v29;
    v30 = v29[1];
    v32 = *(void **)(*(_QWORD *)(v5 + 56) + 8 * v20);
    if ((v38 & 1) == 0)
    {
      swift_bridgeObjectRetain();
      v33 = v32;
    }
    sub_18B7295B0();
    sub_18B729388();
    result = sub_18B7295D4();
    v14 = -1 << *(_BYTE *)(v7 + 32);
    v15 = result & ~v14;
    v16 = v15 >> 6;
    if (((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6))) != 0)
    {
      v17 = __clz(__rbit64((-1 << v15) & ~*(_QWORD *)(v11 + 8 * (v15 >> 6)))) | v15 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v14) >> 6;
      do
      {
        if (++v16 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_41;
        }
        v27 = v16 == v26;
        if (v16 == v26)
          v16 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v11 + 8 * v16);
      }
      while (v28 == -1);
      v17 = __clz(__rbit64(~v28)) + (v16 << 6);
    }
    *(_QWORD *)(v11 + ((v17 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v17;
    v18 = (_QWORD *)(*(_QWORD *)(v7 + 48) + 16 * v17);
    *v18 = v31;
    v18[1] = v30;
    *(_QWORD *)(*(_QWORD *)(v7 + 56) + 8 * v17) = v32;
    ++*(_QWORD *)(v7 + 16);
  }
  swift_release();
  v3 = v35;
  v22 = (_QWORD *)(v5 + 64);
  if ((v38 & 1) == 0)
    goto LABEL_40;
LABEL_36:
  v34 = 1 << *(_BYTE *)(v5 + 32);
  if (v34 >= 64)
    bzero(v22, ((unint64_t)(v34 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
  else
    *v22 = -1 << v34;
  *(_QWORD *)(v5 + 16) = 0;
LABEL_40:
  result = swift_release();
  *v3 = v7;
  return result;
}

unint64_t sub_18B70FB90(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  _OWORD *v14;
  _OWORD *v15;
  uint64_t v16;
  unint64_t v17;
  __int128 *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_18B7294CC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_18B7295B0();
        swift_bridgeObjectRetain();
        sub_18B729388();
        v11 = sub_18B7295D4();
        result = swift_bridgeObjectRelease();
        v12 = v11 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v12 < v8)
            goto LABEL_5;
        }
        else if (v12 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v12)
        {
LABEL_11:
          v13 = *(_QWORD *)(a2 + 48);
          v14 = (_OWORD *)(v13 + 16 * v3);
          v15 = (_OWORD *)(v13 + 16 * v6);
          if (v3 != v6 || v14 >= v15 + 1)
            *v14 = *v15;
          v16 = *(_QWORD *)(a2 + 56);
          v17 = v16 + 40 * v3;
          v18 = (__int128 *)(v16 + 40 * v6);
          if (v3 != v6 || (v3 = v6, v17 >= (unint64_t)v18 + 40))
          {
            v9 = *v18;
            v10 = v18[1];
            *(_QWORD *)(v17 + 32) = *((_QWORD *)v18 + 4);
            *(_OWORD *)v17 = v9;
            *(_OWORD *)(v17 + 16) = v10;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v19 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v20 = *v19;
    v21 = (-1 << v3) - 1;
  }
  else
  {
    v19 = (uint64_t *)(v4 + 8 * (result >> 6));
    v21 = *v19;
    v20 = (-1 << result) - 1;
  }
  *v19 = v21 & v20;
  v22 = *(_QWORD *)(a2 + 16);
  v23 = __OFSUB__(v22, 1);
  v24 = v22 - 1;
  if (v23)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v24;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

unint64_t sub_18B70FD78(unint64_t result, uint64_t a2)
{
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unint64_t v8;
  __int128 v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _OWORD *v13;
  _OWORD *v14;
  uint64_t v15;
  _OWORD *v16;
  _OWORD *v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  BOOL v22;
  uint64_t v23;

  v3 = result;
  v4 = a2 + 64;
  v5 = -1 << *(_BYTE *)(a2 + 32);
  v6 = (result + 1) & ~v5;
  if (((1 << v6) & *(_QWORD *)(a2 + 64 + 8 * (v6 >> 6))) != 0)
  {
    v7 = ~v5;
    result = sub_18B7294CC();
    if ((*(_QWORD *)(v4 + 8 * (v6 >> 6)) & (1 << v6)) != 0)
    {
      v8 = (result + 1) & v7;
      do
      {
        sub_18B7295B0();
        swift_bridgeObjectRetain();
        sub_18B729388();
        v10 = sub_18B7295D4();
        result = swift_bridgeObjectRelease();
        v11 = v10 & v7;
        if (v3 >= (uint64_t)v8)
        {
          if (v11 < v8)
            goto LABEL_5;
        }
        else if (v11 >= v8)
        {
          goto LABEL_11;
        }
        if (v3 >= (uint64_t)v11)
        {
LABEL_11:
          v12 = *(_QWORD *)(a2 + 48);
          v13 = (_OWORD *)(v12 + 16 * v3);
          v14 = (_OWORD *)(v12 + 16 * v6);
          if (v3 != v6 || v13 >= v14 + 1)
            *v13 = *v14;
          v15 = *(_QWORD *)(a2 + 56);
          v16 = (_OWORD *)(v15 + 32 * v3);
          v17 = (_OWORD *)(v15 + 32 * v6);
          if (v3 != v6 || (v3 = v6, v16 >= v17 + 2))
          {
            v9 = v17[1];
            *v16 = *v17;
            v16[1] = v9;
            v3 = v6;
          }
        }
LABEL_5:
        v6 = (v6 + 1) & v7;
      }
      while (((*(_QWORD *)(v4 + ((v6 >> 3) & 0xFFFFFFFFFFFFF8)) >> v6) & 1) != 0);
    }
    v18 = (uint64_t *)(v4 + 8 * ((unint64_t)v3 >> 6));
    v19 = *v18;
    v20 = (-1 << v3) - 1;
  }
  else
  {
    v18 = (uint64_t *)(v4 + 8 * (result >> 6));
    v20 = *v18;
    v19 = (-1 << result) - 1;
  }
  *v18 = v20 & v19;
  v21 = *(_QWORD *)(a2 + 16);
  v22 = __OFSUB__(v21, 1);
  v23 = v21 - 1;
  if (v22)
  {
    __break(1u);
  }
  else
  {
    *(_QWORD *)(a2 + 16) = v23;
    ++*(_DWORD *)(a2 + 36);
  }
  return result;
}

id sub_18B70FF4C(uint64_t a1, void *a2, char a3, double a4)
{
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v9;
  char v10;
  unint64_t v11;
  uint64_t v12;
  _BOOL8 v13;
  id result;
  char v15;
  uint64_t v16;
  _QWORD *v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  uint64_t v22;

  v5 = v4;
  v9 = *v4;
  v11 = sub_18B70E8CC((uint64_t)a2, a4);
  v12 = *(_QWORD *)(v9 + 16);
  v13 = (v10 & 1) == 0;
  result = (id)(v12 + v13);
  if (__OFADD__(v12, v13))
  {
    __break(1u);
LABEL_14:
    __break(1u);
    goto LABEL_15;
  }
  v15 = v10;
  v16 = *(_QWORD *)(v9 + 24);
  if (v16 >= (uint64_t)result && (a3 & 1) != 0)
    goto LABEL_7;
  if (v16 >= (uint64_t)result && (a3 & 1) == 0)
  {
    result = sub_18B710240();
LABEL_7:
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
    {
LABEL_8:
      *(_QWORD *)(v17[7] + 8 * v11) = a1;
      return result;
    }
LABEL_11:
    v17[(v11 >> 6) + 8] |= 1 << v11;
    v19 = v17[6] + 16 * v11;
    *(_QWORD *)v19 = a2;
    *(double *)(v19 + 8) = a4;
    *(_QWORD *)(v17[7] + 8 * v11) = a1;
    v20 = v17[2];
    v21 = __OFADD__(v20, 1);
    v22 = v20 + 1;
    if (!v21)
    {
      v17[2] = v22;
      return a2;
    }
    goto LABEL_14;
  }
  sub_18B70EF54((uint64_t)result, a3 & 1);
  result = (id)sub_18B70E8CC((uint64_t)a2, a4);
  if ((v15 & 1) == (v18 & 1))
  {
    v11 = (unint64_t)result;
    v17 = (_QWORD *)*v5;
    if ((v15 & 1) != 0)
      goto LABEL_8;
    goto LABEL_11;
  }
LABEL_15:
  result = (id)sub_18B7295A4();
  __break(1u);
  return result;
}

_OWORD *sub_18B7100A8(_OWORD *a1, uint64_t a2, uint64_t a3, char a4)
{
  _QWORD *v4;
  _QWORD **v5;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  _OWORD *v19;
  _OWORD *result;
  unint64_t v21;
  char v22;

  v5 = (_QWORD **)v4;
  v10 = (_QWORD *)*v4;
  v12 = sub_18B70E9C8(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
  }
  else
  {
    v16 = v11;
    v17 = v10[3];
    if (v17 >= v15 && (a4 & 1) != 0)
    {
LABEL_7:
      v18 = *v5;
      if ((v16 & 1) != 0)
      {
LABEL_8:
        v19 = (_OWORD *)(v18[7] + 32 * v12);
        __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v19);
        return sub_18B710DD4(a1, v19);
      }
      goto LABEL_11;
    }
    if (v17 >= v15 && (a4 & 1) == 0)
    {
      sub_18B7105DC();
      goto LABEL_7;
    }
    sub_18B70F588(v15, a4 & 1);
    v21 = sub_18B70E9C8(a2, a3);
    if ((v16 & 1) == (v22 & 1))
    {
      v12 = v21;
      v18 = *v5;
      if ((v16 & 1) != 0)
        goto LABEL_8;
LABEL_11:
      sub_18B7101D8(v12, a2, a3, a1, v18);
      return (_OWORD *)swift_bridgeObjectRetain();
    }
  }
  result = (_OWORD *)sub_18B7295A4();
  __break(1u);
  return result;
}

_OWORD *sub_18B7101D8(unint64_t a1, uint64_t a2, uint64_t a3, _OWORD *a4, _QWORD *a5)
{
  _QWORD *v6;
  _OWORD *result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;

  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_18B710DD4(a4, (_OWORD *)(a5[7] + 32 * a1));
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

id sub_18B710240()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _QWORD *v22;
  int64_t v23;
  unint64_t v24;
  int64_t v25;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E58);
  v2 = *v0;
  v3 = sub_18B729544();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_26:
    result = (id)swift_release();
    *v1 = v4;
    return result;
  }
  result = (id)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v23 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_28;
    }
    if (v23 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v23);
    ++v9;
    if (!v24)
    {
      v9 = v23 + 1;
      if (v23 + 1 >= v13)
        goto LABEL_26;
      v24 = *(_QWORD *)(v6 + 8 * v9);
      if (!v24)
        break;
    }
LABEL_25:
    v12 = (v24 - 1) & v24;
    v15 = __clz(__rbit64(v24)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = *(_QWORD *)(v2 + 48) + 16 * v15;
    v18 = *(void **)v17;
    v19 = *(_QWORD *)(v17 + 8);
    v20 = 8 * v15;
    v21 = *(_QWORD *)(*(_QWORD *)(v2 + 56) + v20);
    v22 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v22 = v18;
    v22[1] = v19;
    *(_QWORD *)(*(_QWORD *)(v4 + 56) + v20) = v21;
    result = v18;
  }
  v25 = v23 + 2;
  if (v25 >= v13)
    goto LABEL_26;
  v24 = *(_QWORD *)(v6 + 8 * v25);
  if (v24)
  {
    v9 = v25;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v25 + 1;
    if (__OFADD__(v25, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v24 = *(_QWORD *)(v6 + 8 * v9);
    ++v25;
    if (v24)
      goto LABEL_25;
  }
LABEL_28:
  __break(1u);
  return result;
}

void *sub_18B7103F4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  __int128 v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EDFD90C0);
  v2 = *v0;
  v3 = sub_18B729544();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 40 * v15;
    sub_18B710FEC(*(_QWORD *)(v2 + 56) + 40 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_18B70C408(v26, *(_QWORD *)(v4 + 56) + v20);
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

void *sub_18B7105DC()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *result;
  uint64_t v6;
  unint64_t v7;
  int64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  int64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD *v21;
  int64_t v22;
  unint64_t v23;
  int64_t v24;
  uint64_t *v25;
  _OWORD v26[2];

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9088);
  v2 = *v0;
  v3 = sub_18B729544();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = (void *)swift_release();
LABEL_28:
    *v1 = v4;
    return result;
  }
  v25 = v1;
  result = (void *)(v3 + 64);
  v6 = v2 + 64;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 64 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 64), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 64);
  v13 = (unint64_t)(v10 + 63) >> 6;
  while (1)
  {
    if (v12)
    {
      v14 = __clz(__rbit64(v12));
      v12 &= v12 - 1;
      v15 = v14 | (v9 << 6);
      goto LABEL_12;
    }
    v22 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v22 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v22);
    ++v9;
    if (!v23)
    {
      v9 = v22 + 1;
      if (v22 + 1 >= v13)
        goto LABEL_26;
      v23 = *(_QWORD *)(v6 + 8 * v9);
      if (!v23)
        break;
    }
LABEL_25:
    v12 = (v23 - 1) & v23;
    v15 = __clz(__rbit64(v23)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v19 = *v17;
    v18 = v17[1];
    v20 = 32 * v15;
    sub_18B710D50(*(_QWORD *)(v2 + 56) + 32 * v15, (uint64_t)v26);
    v21 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v21 = v19;
    v21[1] = v18;
    sub_18B710DD4(v26, (_OWORD *)(*(_QWORD *)(v4 + 56) + v20));
    result = (void *)swift_bridgeObjectRetain();
  }
  v24 = v22 + 2;
  if (v24 >= v13)
  {
LABEL_26:
    result = (void *)swift_release();
    v1 = v25;
    goto LABEL_28;
  }
  v23 = *(_QWORD *)(v6 + 8 * v24);
  if (v23)
  {
    v9 = v24;
    goto LABEL_25;
  }
  while (1)
  {
    v9 = v24 + 1;
    if (__OFADD__(v24, 1))
      break;
    if (v9 >= v13)
      goto LABEL_26;
    v23 = *(_QWORD *)(v6 + 8 * v9);
    ++v24;
    if (v23)
      goto LABEL_25;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_18B7107C0(uint64_t a1)
{
  uint64_t result;
  int64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  int64_t v9;
  unint64_t i;
  int64_t v11;
  unint64_t v12;
  int64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t *v24;
  uint64_t v25;
  BOOL v26;
  uint64_t v27;
  uint64_t v28;
  int64_t v29;
  _QWORD *v30;
  uint64_t v31;
  uint64_t v32;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9090);
  result = sub_18B729544();
  v3 = 0;
  v32 = a1;
  v4 = *(_QWORD *)(a1 + 64);
  v28 = a1 + 64;
  v5 = 1 << *(_BYTE *)(a1 + 32);
  v6 = -1;
  if (v5 < 64)
    v6 = ~(-1 << v5);
  v7 = v6 & v4;
  v29 = (unint64_t)(v5 + 63) >> 6;
  v30 = (_QWORD *)result;
  v31 = result + 64;
  if ((v6 & v4) == 0)
    goto LABEL_5;
LABEL_4:
  v8 = __clz(__rbit64(v7));
  v7 &= v7 - 1;
  v9 = v3;
  for (i = v8 | (v3 << 6); ; i = __clz(__rbit64(v12)) + (v13 << 6))
  {
    v15 = (uint64_t *)(*(_QWORD *)(v32 + 48) + 16 * i);
    v17 = *v15;
    v16 = v15[1];
    v18 = *(void **)(*(_QWORD *)(v32 + 56) + 8 * i);
    swift_bridgeObjectRetain();
    v19 = v18;
    v20 = sub_18B70B45C();
    v22 = v21;

    result = (uint64_t)v30;
    *(_QWORD *)(v31 + ((i >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << i;
    v23 = (_QWORD *)(v30[6] + 16 * i);
    *v23 = v17;
    v23[1] = v16;
    v24 = (uint64_t *)(v30[7] + 16 * i);
    *v24 = v20;
    v24[1] = v22;
    v25 = v30[2];
    v26 = __OFADD__(v25, 1);
    v27 = v25 + 1;
    if (v26)
    {
      __break(1u);
LABEL_24:
      __break(1u);
      goto LABEL_25;
    }
    v30[2] = v27;
    v3 = v9;
    if (v7)
      goto LABEL_4;
LABEL_5:
    v11 = v3 + 1;
    if (__OFADD__(v3, 1))
      goto LABEL_24;
    if (v11 >= v29)
      return result;
    v12 = *(_QWORD *)(v28 + 8 * v11);
    v13 = v3 + 1;
    if (!v12)
    {
      v13 = v3 + 2;
      if (v3 + 2 >= v29)
        return result;
      v12 = *(_QWORD *)(v28 + 8 * v13);
      if (!v12)
      {
        v13 = v3 + 3;
        if (v3 + 3 >= v29)
          return result;
        v12 = *(_QWORD *)(v28 + 8 * v13);
        if (!v12)
          break;
      }
    }
LABEL_18:
    v7 = (v12 - 1) & v12;
    v9 = v13;
  }
  v14 = v3 + 4;
  if (v3 + 4 >= v29)
    return result;
  v12 = *(_QWORD *)(v28 + 8 * v14);
  if (v12)
  {
    v13 = v3 + 4;
    goto LABEL_18;
  }
  while (1)
  {
    v13 = v14 + 1;
    if (__OFADD__(v14, 1))
      break;
    if (v13 >= v29)
      return result;
    v12 = *(_QWORD *)(v28 + 8 * v13);
    ++v14;
    if (v12)
      goto LABEL_18;
  }
LABEL_25:
  __break(1u);
  return result;
}

uint64_t sub_18B7109DC(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5)
{
  uint64_t v9;
  _QWORD *v10;
  char v11;
  unint64_t v12;
  uint64_t v13;
  _BOOL8 v14;
  uint64_t v15;
  char v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v19;
  uint64_t result;
  unint64_t v21;
  char v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;

  *(_QWORD *)&v28 = a1;
  v9 = MEMORY[0x1E0DEBB98];
  v29 = MEMORY[0x1E0DEBB98];
  v30 = MEMORY[0x1E0DEBBA0];
  v10 = (_QWORD *)*a5;
  v12 = sub_18B70E9C8(a2, a3);
  v13 = v10[2];
  v14 = (v11 & 1) == 0;
  v15 = v13 + v14;
  if (__OFADD__(v13, v14))
  {
    __break(1u);
    goto LABEL_14;
  }
  v16 = v11;
  v17 = v10[3];
  if (v17 >= v15 && (a4 & 1) != 0)
  {
LABEL_7:
    v18 = (_QWORD *)*a5;
    if ((v16 & 1) != 0)
    {
LABEL_8:
      v19 = v18[7] + 40 * v12;
      __swift_destroy_boxed_opaque_existential_1Tm(v19);
      return sub_18B70C408(&v28, v19);
    }
    goto LABEL_11;
  }
  if (v17 >= v15 && (a4 & 1) == 0)
  {
    sub_18B7103F4();
    goto LABEL_7;
  }
  sub_18B70F264(v15, a4 & 1);
  v21 = sub_18B70E9C8(a2, a3);
  if ((v16 & 1) != (v22 & 1))
  {
LABEL_14:
    result = sub_18B7295A4();
    __break(1u);
    return result;
  }
  v12 = v21;
  v18 = (_QWORD *)*a5;
  if ((v16 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v23 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v28, v9);
  MEMORY[0x1E0C80A78](v23);
  v25 = (uint64_t *)((char *)&v27 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0));
  (*(void (**)(uint64_t *))(v26 + 16))(v25);
  sub_18B710EA4(v12, a2, a3, *v25, v18);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v28);
  return swift_bridgeObjectRetain();
}

uint64_t sub_18B710B84(uint64_t a1, uint64_t a2, uint64_t a3, char a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v15;
  char v16;
  unint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  uint64_t v20;
  char v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t result;
  unint64_t v26;
  char v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  uint64_t v34;
  uint64_t v35;

  v34 = a6;
  v35 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v33);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a1, a6);
  v15 = (_QWORD *)*a5;
  v17 = sub_18B70E9C8(a2, a3);
  v18 = v15[2];
  v19 = (v16 & 1) == 0;
  v20 = v18 + v19;
  if (__OFADD__(v18, v19))
  {
    __break(1u);
    goto LABEL_14;
  }
  v21 = v16;
  v22 = v15[3];
  if (v22 >= v20 && (a4 & 1) != 0)
  {
LABEL_7:
    v23 = (_QWORD *)*a5;
    if ((v21 & 1) != 0)
    {
LABEL_8:
      v24 = v23[7] + 40 * v17;
      __swift_destroy_boxed_opaque_existential_1Tm(v24);
      return sub_18B70C408(&v33, v24);
    }
    goto LABEL_11;
  }
  if (v22 >= v20 && (a4 & 1) == 0)
  {
    sub_18B7103F4();
    goto LABEL_7;
  }
  sub_18B70F264(v20, a4 & 1);
  v26 = sub_18B70E9C8(a2, a3);
  if ((v21 & 1) != (v27 & 1))
  {
LABEL_14:
    result = sub_18B7295A4();
    __break(1u);
    return result;
  }
  v17 = v26;
  v23 = (_QWORD *)*a5;
  if ((v21 & 1) != 0)
    goto LABEL_8;
LABEL_11:
  v28 = __swift_mutable_project_boxed_opaque_existential_1((uint64_t)&v33, v34);
  MEMORY[0x1E0C80A78](v28);
  v30 = (char *)&v32 - ((v29 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *))(v31 + 16))(v30);
  sub_18B710F34(v17, a2, a3, (uint64_t)v30, v23, a6, a7);
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)&v33);
  return swift_bridgeObjectRetain();
}

uint64_t sub_18B710D50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_18B710D8C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD9048);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

_OWORD *sub_18B710DD4(_OWORD *a1, _OWORD *a2)
{
  __int128 v2;

  v2 = a1[1];
  *a2 = *a1;
  a2[1] = v2;
  return a2;
}

uint64_t sub_18B710DE4(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    swift_release();
  }
  return swift_release();
}

uint64_t sub_18B710E28(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_18B710DE4(a1, a2);
  return a1;
}

uint64_t sub_18B710E3C()
{
  return swift_release();
}

uint64_t __swift_destroy_boxed_opaque_existential_1Tm(uint64_t a1)
{
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)(a1 + 24) - 8);
  if ((*(_BYTE *)(v1 + 82) & 2) != 0)
    return swift_release();
  else
    return (*(uint64_t (**)(void))(v1 + 8))();
}

uint64_t *__swift_allocate_boxed_opaque_existential_1(uint64_t *a1)
{
  uint64_t *v1;
  uint64_t v2;

  v1 = a1;
  if ((*(_BYTE *)(*(_QWORD *)(a1[3] - 8) + 82) & 2) != 0)
  {
    *a1 = swift_allocBox();
    return (uint64_t *)v2;
  }
  return v1;
}

uint64_t sub_18B710EA4(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  _QWORD *v6;
  uint64_t result;
  uint64_t v8;
  BOOL v9;
  uint64_t v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  *(_QWORD *)&v11 = a4;
  v12 = MEMORY[0x1E0DEBB98];
  v13 = MEMORY[0x1E0DEBBA0];
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v6 = (_QWORD *)(a5[6] + 16 * a1);
  *v6 = a2;
  v6[1] = a3;
  result = sub_18B70C408(&v11, a5[7] + 40 * a1);
  v8 = a5[2];
  v9 = __OFADD__(v8, 1);
  v10 = v8 + 1;
  if (v9)
    __break(1u);
  else
    a5[2] = v10;
  return result;
}

uint64_t sub_18B710F34(unint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, _QWORD *a5, uint64_t a6, uint64_t a7)
{
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v14;
  uint64_t result;
  uint64_t v16;
  BOOL v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;

  v20 = a6;
  v21 = a7;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)&v19);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(a6 - 8) + 32))(boxed_opaque_existential_1, a4, a6);
  a5[(a1 >> 6) + 8] |= 1 << a1;
  v14 = (_QWORD *)(a5[6] + 16 * a1);
  *v14 = a2;
  v14[1] = a3;
  result = sub_18B70C408(&v19, a5[7] + 40 * a1);
  v16 = a5[2];
  v17 = __OFADD__(v16, 1);
  v18 = v16 + 1;
  if (v17)
    __break(1u);
  else
    a5[2] = v18;
  return result;
}

uint64_t sub_18B710FEC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

id IncomingCallTextViewAdapter.viewController.getter()
{
  uint64_t v0;

  return *(id *)(v0 + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
}

void *IncomingCallTextViewAdapter.emojiViewController.getter()
{
  uint64_t v0;
  void *v1;
  id v2;

  v1 = *(void **)(v0 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  v2 = v1;
  return v1;
}

uint64_t IncomingCallTextViewAdapter.statusIsHidden.getter()
{
  uint64_t v0;
  _BYTE v2[152];
  _BYTE v3[152];
  _BYTE v4[152];
  _BYTE v5[152];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v5, (uint64_t)v4);
  sub_18B700E08((uint64_t)v4, (uint64_t)v3);
  sub_18B700E08((uint64_t)v4, (uint64_t)v5);
  if (sub_18B708DD4((uint64_t)v5) == 1)
    return 1;
  v0 = v3[32];
  sub_18B700E08((uint64_t)v3, (uint64_t)v2);
  sub_18B719870((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.statusIsHidden.setter(char a1)
{
  void (*v2)(_QWORD *);
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  _BYTE v7[152];
  _BYTE v8[152];

  swift_retain();
  v2 = sub_18B7199B8(v6);
  v4 = v3;
  sub_18B700E08(v3, (uint64_t)v7);
  sub_18B700E08((uint64_t)v7, (uint64_t)v8);
  if (sub_18B708DD4((uint64_t)v8) != 1)
    *(_BYTE *)(v4 + 32) = a1 & 1;
  ((void (*)(_QWORD *, _QWORD))v2)(v6, 0);
  return swift_release();
}

uint64_t sub_18B7112E0(char *a1)
{
  char v1;
  void (*v2)(_QWORD *);
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[4];
  _BYTE v7[152];
  _BYTE v8[152];

  v1 = *a1;
  swift_retain();
  v2 = sub_18B7199B8(v6);
  v4 = v3;
  sub_18B700E08(v3, (uint64_t)v7);
  sub_18B700E08((uint64_t)v7, (uint64_t)v8);
  if (sub_18B708DD4((uint64_t)v8) != 1)
    *(_BYTE *)(v4 + 32) = v1;
  ((void (*)(_QWORD *, _QWORD))v2)(v6, 0);
  return swift_release();
}

void (*IncomingCallTextViewAdapter.statusIsHidden.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  void *v3;
  uint64_t v4;
  char v5;

  v3 = malloc(0x290uLL);
  *a1 = v3;
  v4 = (uint64_t)v3 + 456;
  *((_QWORD *)v3 + 80) = v1;
  *((_QWORD *)v3 + 81) = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v3 + 456, (uint64_t)v3 + 152);
  sub_18B700E08((uint64_t)v3 + 152, (uint64_t)v3 + 304);
  sub_18B700E08((uint64_t)v3 + 152, (uint64_t)v3);
  if (sub_18B708DD4((uint64_t)v3) == 1)
  {
    v5 = 1;
  }
  else
  {
    v5 = *((_BYTE *)v3 + 336);
    sub_18B700E08((uint64_t)v3 + 304, v4);
    sub_18B719870(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  }
  *((_BYTE *)v3 + 145) = v5;
  return sub_18B7114A0;
}

void sub_18B7114A0(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char v6;
  void (*v7)(_QWORD *);
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)a1 + 304;
  v4 = *(_QWORD *)a1 + 456;
  v5 = (_QWORD *)(*(_QWORD *)a1 + 608);
  v6 = *(_BYTE *)(*(_QWORD *)a1 + 145);
  if ((a2 & 1) != 0)
  {
    swift_retain();
    v7 = sub_18B7199B8(v5);
    v9 = v8;
    sub_18B700E08(v8, v4);
    sub_18B700E08(v4, v3);
    v10 = v3;
  }
  else
  {
    swift_retain();
    v7 = sub_18B7199B8(v5);
    v9 = v11;
    sub_18B700E08(v11, v3);
    sub_18B700E08(v3, v4);
    v10 = v4;
  }
  if (sub_18B708DD4(v10) != 1)
    *(_BYTE *)(v9 + 32) = v6;
  ((void (*)(_QWORD *, _QWORD))v7)(v5, 0);
  swift_release();
  free(v2);
}

void IncomingCallTextViewAdapter.frame.setter(double a1, double a2, double a3, double a4)
{
  uint64_t v4;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v9 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v4
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v9)
  {
    __break(1u);
LABEL_7:
    __break(1u);
    return;
  }
  v10 = v9;
  objc_msgSend(v9, sel_setFrame_, a1, a2, a3, a4);

  v11 = *(void **)(v4 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (v11)
  {
    v12 = objc_msgSend(v11, sel_view);
    if (v12)
    {
      v13 = v12;
      objc_msgSend(v12, sel_setFrame_, a1, a2, a3, a4);

      return;
    }
    goto LABEL_7;
  }
}

void sub_18B711788(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v3 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(*a1
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_frame);
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

    *a2 = v6;
    a2[1] = v8;
    a2[2] = v10;
    a2[3] = v12;
  }
  else
  {
    __break(1u);
  }
}

void (*IncomingCallTextViewAdapter.frame.modify(_QWORD *a1))(double **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void (*result)(double **, char);
  void (*v6)(double **, char);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v3 = malloc(0x30uLL);
  *a1 = v3;
  v4 = OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController;
  v3[4] = v1;
  v3[5] = v4;
  result = (void (*)(double **, char))objc_msgSend(*(id *)(v1 + v4), sel_view);
  if (result)
  {
    v6 = result;
    objc_msgSend(result, sel_frame);
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;

    *v3 = v8;
    v3[1] = v10;
    v3[2] = v12;
    v3[3] = v14;
    return sub_18B7118B4;
  }
  else
  {
    __break(1u);
  }
  return result;
}

void sub_18B7118B4(double **a1, char a2)
{
  double *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;

  v3 = *a1;
  v5 = **a1;
  v4 = (*a1)[1];
  v7 = (*a1)[2];
  v6 = (*a1)[3];
  v8 = objc_msgSend(*(id *)(*((_QWORD *)*a1 + 4) + *((_QWORD *)*a1 + 5)), sel_view);
  v9 = v8;
  if ((a2 & 1) != 0)
  {
    if (!v8)
    {
      __break(1u);
      goto LABEL_12;
    }
    v10 = *((_QWORD *)v3 + 4);
    objc_msgSend(v8, sel_setFrame_, v5, v4, v7, v6);

    v11 = *(void **)(v10 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
    if (!v11)
    {
LABEL_10:
      free(v3);
      return;
    }
    v12 = objc_msgSend(v11, sel_view);
    if (v12)
    {
LABEL_9:
      v15 = v12;
      objc_msgSend(v12, sel_setFrame_, v5, v4, v7, v6);

      goto LABEL_10;
    }
    __break(1u);
  }
  if (!v9)
  {
LABEL_12:
    __break(1u);
    goto LABEL_13;
  }
  v13 = *((_QWORD *)v3 + 4);
  objc_msgSend(v9, sel_setFrame_, v5, v4, v7, v6);

  v14 = *(void **)(v13 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (!v14)
    goto LABEL_10;
  v12 = objc_msgSend(v14, sel_view);
  if (v12)
    goto LABEL_9;
LABEL_13:
  __break(1u);
}

void IncomingCallTextViewAdapter.tightFrame.getter()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _BYTE *v6;
  uint64_t v7;
  _BYTE *v8;
  char v9;
  void (*v10)(_BYTE *, uint64_t);
  char v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned __int8 *v15;
  uint64_t *v16;
  uint64_t *v17;
  id *v18;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t *v25;
  uint64_t *v26;
  uint64_t *v27;
  CGFloat *v28;
  unsigned __int8 *v29;
  CGFloat *v30;
  uint64_t *v31;
  uint64_t *v32;
  unsigned __int8 *v33;
  id v34;
  id v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  CGFloat v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t *v48;
  uint64_t *v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  char *v61;
  void **v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  char v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  CGFloat v81;
  id v82;
  id v83;
  id v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  double v89;
  double v90;
  double v91;
  double v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t *v95;
  uint64_t *v96;
  uint64_t *v97;
  uint64_t *v98;
  uint64_t *v99;
  uint64_t *v100;
  uint64_t *v101;
  uint64_t *v102;
  CGFloat *v103;
  CGFloat *v104;
  CGFloat *v105;
  CGFloat *v106;
  uint64_t *v107;
  uint64_t *v108;
  char *v109;
  uint64_t *v110;
  uint64_t *v111;
  uint64_t *v112;
  unsigned __int8 *v113;
  uint64_t v114;
  CGFloat v115;
  CGFloat v116;
  CGFloat v117;
  CGFloat v118;
  uint64_t v119;
  uint64_t v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  char v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  double Width;
  double v132;
  uint64_t *v133;
  uint64_t *v134;
  uint64_t *v135;
  uint64_t *v136;
  uint64_t *v137;
  uint64_t *v138;
  uint64_t *v139;
  CGFloat *v140;
  double *v141;
  CGFloat *v142;
  double *v143;
  uint64_t *v144;
  uint64_t *v145;
  char *v146;
  void **v147;
  uint64_t *v148;
  uint64_t *v149;
  unsigned __int8 *v150;
  uint64_t *v151;
  uint64_t *v152;
  uint64_t *v153;
  uint64_t *v154;
  uint64_t *v155;
  uint64_t *v156;
  uint64_t *v157;
  double *v158;
  double *v159;
  double *v160;
  double *v161;
  uint64_t *v162;
  uint64_t *v163;
  char *v164;
  void **v165;
  uint64_t *v166;
  uint64_t *v167;
  unsigned __int8 *v168;
  uint64_t v169;
  double v170;
  double v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  char v179;
  void *v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  double v185;
  double v186;
  double v187;
  double v188;
  uint64_t v189;
  uint64_t v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  char v196;
  void *v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  id v202;
  void *v203;
  id v204;
  void *v205;
  double v206;
  CGFloat v207;
  double v208;
  CGFloat v209;
  double v210;
  CGFloat v211;
  double v212;
  CGFloat v213;
  id v214;
  void *v215;
  double v216;
  CGFloat v217;
  double v218;
  CGFloat v219;
  double v220;
  CGFloat v221;
  double v222;
  CGFloat v223;
  id v224;
  void *v225;
  double v226;
  CGFloat v227;
  double v228;
  CGFloat v229;
  double v230;
  CGFloat v231;
  double v232;
  CGFloat v233;
  _BYTE v234[12];
  int v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  int v240;
  uint64_t v241;
  uint64_t v242;
  uint64_t v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  __int128 v250;
  unsigned __int8 *v251;
  uint64_t v252;
  int v253;
  CGFloat v254;
  CGFloat v255;
  CGFloat v256;
  id v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  CGFloat v261;
  uint64_t v262;
  uint64_t v263;
  uint64_t v264;
  void *v265;
  char v266;
  uint64_t v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  CGFloat v274;
  double v275;
  CGFloat v276;
  double v277;
  uint64_t v278;
  uint64_t v279;
  char v280;
  _QWORD v281[4];
  char v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  uint64_t v286;
  uint64_t v287;
  uint64_t v288;
  uint64_t v289;
  CGFloat v290;
  CGFloat v291;
  CGFloat v292;
  CGFloat v293;
  uint64_t v294;
  uint64_t v295;
  char v296;
  _QWORD v297[4];
  char v298;
  uint64_t v299;
  uint64_t v300;
  id v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  uint64_t v308;
  uint64_t v309;
  uint64_t v310;
  CGFloat v311;
  char v312;
  _QWORD v313[4];
  char v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  uint64_t v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  char v328;
  _QWORD v329[4];
  char v330;
  uint64_t v331;
  __int128 v332;
  __int128 v333;
  uint64_t v334;
  uint64_t v335;
  double v336;
  double v337;
  double v338;
  double v339;
  uint64_t v340;
  uint64_t v341;
  char v342;
  _BYTE v343[304];
  _BYTE v344[304];
  uint64_t v345;
  __int128 v346;
  __int128 v347;
  uint64_t v348;
  uint64_t v349;
  double v350;
  double v351;
  double v352;
  double v353;
  uint64_t v354;
  uint64_t v355;
  char v356;
  CGRect v357;
  CGRect v358;
  CGRect v359;
  CGRect v360;
  CGRect v361;
  CGRect v362;

  v1 = v0;
  v2 = sub_18B72922C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = &v234[-((v5 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v4);
  v8 = &v234[-v7];
  swift_retain();
  sub_18B71A988((uint64_t)v8);
  swift_release();
  sub_18B729214();
  v9 = sub_18B729220();
  v10 = *(void (**)(_BYTE *, uint64_t))(v3 + 8);
  v10(v6, v2);
  v10(v8, v2);
  if ((v9 & 1) == 0)
  {
    v34 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
    if (v34)
      goto LABEL_9;
    __break(1u);
LABEL_8:
    v34 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                                + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
    if (!v34)
    {
      __break(1u);
LABEL_34:
      __break(1u);
      goto LABEL_35;
    }
LABEL_9:
    v35 = v34;
    objc_msgSend(v34, sel_frame);
LABEL_32:

    return;
  }
  swift_retain();
  v11 = sub_18B71A600();
  swift_release();
  if ((v11 & 1) != 0)
    goto LABEL_8;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v344, v343);
  sub_18B7086A4(v343, v344);
  v12 = sub_18B7086E0((uint64_t)v344);
  v13 = sub_18B7086EC((uint64_t)v344);
  v14 = v13;
  if (v12 == 1)
  {
    v15 = (unsigned __int8 *)(v13 + 296);
    v235 = *(unsigned __int8 *)(v13 + 298);
    if ((v235 & 1) != 0)
    {
      v13 += 152;
      v16 = (uint64_t *)(v14 + 192);
      v17 = (uint64_t *)(v14 + 200);
      v18 = (id *)(v14 + 208);
      v19 = (uint64_t *)(v14 + 216);
      v20 = (uint64_t *)(v14 + 224);
      v21 = (uint64_t *)(v14 + 232);
      v22 = (uint64_t *)(v14 + 240);
      v23 = (uint64_t *)(v14 + 248);
      v24 = (uint64_t *)(v14 + 256);
      v25 = (uint64_t *)(v14 + 264);
      v26 = (uint64_t *)(v14 + 272);
      v27 = (uint64_t *)(v14 + 280);
      v28 = (CGFloat *)(v14 + 288);
      v29 = (unsigned __int8 *)(v14 + 184);
      v30 = (CGFloat *)(v14 + 176);
      v31 = (uint64_t *)(v14 + 168);
      v32 = (uint64_t *)(v14 + 160);
      v33 = (unsigned __int8 *)(v14 + 296);
    }
    else
    {
      v16 = (uint64_t *)(v13 + 40);
      v17 = (uint64_t *)(v13 + 48);
      v18 = (id *)(v13 + 56);
      v19 = (uint64_t *)(v13 + 64);
      v20 = (uint64_t *)(v13 + 72);
      v21 = (uint64_t *)(v13 + 80);
      v22 = (uint64_t *)(v13 + 88);
      v23 = (uint64_t *)(v13 + 96);
      v24 = (uint64_t *)(v13 + 104);
      v25 = (uint64_t *)(v13 + 112);
      v26 = (uint64_t *)(v13 + 120);
      v27 = (uint64_t *)(v13 + 128);
      v28 = (CGFloat *)(v13 + 136);
      v33 = (unsigned __int8 *)(v13 + 144);
      v29 = (unsigned __int8 *)(v13 + 32);
      v30 = (CGFloat *)(v13 + 24);
      v31 = (uint64_t *)(v13 + 16);
      v32 = (uint64_t *)(v13 + 8);
    }
    LODWORD(v255) = *v33;
    v254 = *v28;
    v40 = *v27;
    v249 = *v26;
    *(_QWORD *)&v250 = v40;
    v41 = *v25;
    v247 = *v24;
    v248 = v41;
    v42 = *v23;
    v245 = *v22;
    v246 = v42;
    v43 = *v21;
    v243 = *v20;
    v244 = v43;
    v242 = *v19;
    v44 = *v17;
    v257 = *v18;
    v258 = v44;
    v241 = *v16;
    LODWORD(v261) = *v29;
    v256 = *v30;
    v45 = *v31;
    v259 = *(_QWORD *)v13;
    v260 = v45;
    v46 = *v32;
    sub_18B708DEC((_QWORD *)v13);
    v253 = *(unsigned __int8 *)(v14 + 297);
    v251 = (unsigned __int8 *)(v14 + 296);
    v252 = v1;
    if ((v253 & 1) != 0)
    {
      v47 = (uint64_t *)(v14 + 152);
      v48 = (uint64_t *)(v14 + 192);
      v49 = (uint64_t *)(v14 + 200);
      v50 = (uint64_t *)(v14 + 208);
      v51 = (uint64_t *)(v14 + 216);
      v52 = (uint64_t *)(v14 + 224);
      v53 = (uint64_t *)(v14 + 232);
      v54 = (uint64_t *)(v14 + 240);
      v55 = (uint64_t *)(v14 + 248);
      v56 = (uint64_t *)(v14 + 256);
      v57 = (uint64_t *)(v14 + 264);
      v58 = (uint64_t *)(v14 + 272);
      v59 = (uint64_t *)(v14 + 280);
      v60 = (uint64_t *)(v14 + 288);
      v61 = (char *)(v14 + 184);
      v62 = (void **)(v14 + 176);
      v63 = (uint64_t *)(v14 + 168);
      v64 = (uint64_t *)(v14 + 160);
    }
    else
    {
      v48 = (uint64_t *)(v14 + 40);
      v49 = (uint64_t *)(v14 + 48);
      v50 = (uint64_t *)(v14 + 56);
      v51 = (uint64_t *)(v14 + 64);
      v52 = (uint64_t *)(v14 + 72);
      v53 = (uint64_t *)(v14 + 80);
      v54 = (uint64_t *)(v14 + 88);
      v55 = (uint64_t *)(v14 + 96);
      v56 = (uint64_t *)(v14 + 104);
      v57 = (uint64_t *)(v14 + 112);
      v58 = (uint64_t *)(v14 + 120);
      v59 = (uint64_t *)(v14 + 128);
      v60 = (uint64_t *)(v14 + 136);
      v15 = (unsigned __int8 *)(v14 + 144);
      v61 = (char *)(v14 + 32);
      v62 = (void **)(v14 + 24);
      v63 = (uint64_t *)(v14 + 16);
      v64 = (uint64_t *)(v14 + 8);
      v47 = (uint64_t *)v14;
    }
    v240 = *v15;
    v65 = *v60;
    v238 = *v59;
    v239 = v65;
    v66 = *v58;
    v67 = *v57;
    v68 = *v56;
    v69 = *v55;
    v70 = *v54;
    v71 = *v53;
    v72 = *v52;
    v73 = *v51;
    v74 = *v50;
    v236 = *v49;
    v237 = v74;
    v75 = *v48;
    v76 = *v61;
    v77 = *v62;
    v78 = *v63;
    v79 = *v47;
    v80 = *v64;
    sub_18B708DEC(v47);
    v297[0] = v259;
    v297[1] = v46;
    v297[2] = v260;
    v81 = v256;
    *(CGFloat *)&v297[3] = v256;
    v298 = LOBYTE(v261);
    v299 = v241;
    v300 = v258;
    v301 = v257;
    v302 = v242;
    v303 = v243;
    v304 = v244;
    v305 = v245;
    v306 = v246;
    v307 = v247;
    v308 = v248;
    v309 = v249;
    v310 = v250;
    v311 = v254;
    v312 = LOBYTE(v255);
    v313[0] = v79;
    v313[1] = v80;
    v313[2] = v78;
    v313[3] = v77;
    v314 = v76;
    v315 = v75;
    v316 = v236;
    v317 = v237;
    v318 = v73;
    v319 = v72;
    v320 = v71;
    v321 = v70;
    v322 = v69;
    v323 = v68;
    v324 = v67;
    v325 = v66;
    v326 = v238;
    v327 = v239;
    v328 = v240;
    v82 = v77;
    sub_18B709000((uint64_t)v313);
    v83 = v82;
    sub_18B708DEC(v297);

    v84 = v83;
    swift_bridgeObjectRetain();
    v85 = v259;
    sub_18B70A89C(v259, v46, v84, (uint64_t)&v345);
    v86 = v345;
    v250 = v347;
    v87 = v348;
    v88 = v349;
    v89 = v350;
    v90 = v351;
    v256 = v351;
    v91 = v352;
    v92 = v353;
    v254 = v350;
    v255 = v353;
    v93 = v354;
    v94 = v355;
    LOBYTE(v77) = v356;

    swift_bridgeObjectRelease();
    sub_18B709000((uint64_t)v297);
    v329[0] = v85;
    v329[1] = v46;
    v329[2] = v260;
    v329[3] = v84;
    v330 = LOBYTE(v261);
    v331 = v86;
    v332 = v346;
    v333 = v250;
    v334 = v87;
    v335 = v88;
    v336 = v89;
    v337 = v90;
    v261 = v91;
    v338 = v91;
    v339 = v92;
    v340 = v93;
    v341 = v94;
    v342 = (char)v77;
    if ((v253 & 1) != 0)
    {
      v95 = (uint64_t *)(v14 + 152);
      v96 = (uint64_t *)(v14 + 192);
      v97 = (uint64_t *)(v14 + 200);
      v98 = (uint64_t *)(v14 + 208);
      v99 = (uint64_t *)(v14 + 216);
      v100 = (uint64_t *)(v14 + 224);
      v101 = (uint64_t *)(v14 + 232);
      v102 = (uint64_t *)(v14 + 240);
      v103 = (CGFloat *)(v14 + 248);
      v104 = (CGFloat *)(v14 + 256);
      v105 = (CGFloat *)(v14 + 264);
      v106 = (CGFloat *)(v14 + 272);
      v107 = (uint64_t *)(v14 + 280);
      v108 = (uint64_t *)(v14 + 288);
      v109 = (char *)(v14 + 184);
      v110 = (uint64_t *)(v14 + 176);
      v111 = (uint64_t *)(v14 + 168);
      v112 = (uint64_t *)(v14 + 160);
      v113 = v251;
    }
    else
    {
      v96 = (uint64_t *)(v14 + 40);
      v97 = (uint64_t *)(v14 + 48);
      v98 = (uint64_t *)(v14 + 56);
      v99 = (uint64_t *)(v14 + 64);
      v100 = (uint64_t *)(v14 + 72);
      v101 = (uint64_t *)(v14 + 80);
      v102 = (uint64_t *)(v14 + 88);
      v103 = (CGFloat *)(v14 + 96);
      v104 = (CGFloat *)(v14 + 104);
      v105 = (CGFloat *)(v14 + 112);
      v106 = (CGFloat *)(v14 + 120);
      v107 = (uint64_t *)(v14 + 128);
      v108 = (uint64_t *)(v14 + 136);
      v113 = (unsigned __int8 *)(v14 + 144);
      v109 = (char *)(v14 + 32);
      v110 = (uint64_t *)(v14 + 24);
      v111 = (uint64_t *)(v14 + 16);
      v112 = (uint64_t *)(v14 + 8);
      v95 = (uint64_t *)v14;
    }
    LODWORD(v260) = *v113;
    v114 = *v108;
    v258 = *v107;
    v259 = v114;
    v115 = *v106;
    v116 = *v105;
    v117 = *v104;
    v118 = *v103;
    v119 = *v102;
    v120 = *v101;
    v121 = *v100;
    v122 = *v99;
    v123 = *v98;
    v124 = *v97;
    v125 = *v96;
    v126 = *v109;
    v127 = *v110;
    v128 = *v111;
    v129 = *v95;
    v130 = *v112;
    sub_18B708DEC(v95);
    v281[0] = v129;
    v281[1] = v130;
    v281[2] = v128;
    v281[3] = v127;
    v282 = v126;
    v283 = v125;
    v284 = v124;
    v285 = v123;
    v286 = v122;
    v287 = v121;
    v288 = v120;
    v289 = v119;
    v290 = v118;
    v291 = v117;
    v292 = v116;
    v293 = v115;
    v294 = v258;
    v295 = v259;
    v296 = v260;
    sub_18B709000((uint64_t)v281);
    v357.origin.x = v118;
    v357.origin.y = v117;
    v357.size.width = v116;
    v357.size.height = v115;
    Width = CGRectGetWidth(v357);
    v358.origin.x = v254;
    v358.size.height = v255;
    v358.origin.y = v256;
    v358.size.width = v261;
    v132 = CGRectGetWidth(v358);
    sub_18B709000((uint64_t)v329);
    if (v132 >= Width)
    {
      if ((v235 & 1) != 0)
      {
        v151 = (uint64_t *)(v14 + 192);
        v152 = (uint64_t *)(v14 + 200);
        v153 = (uint64_t *)(v14 + 208);
        v154 = (uint64_t *)(v14 + 216);
        v155 = (uint64_t *)(v14 + 224);
        v156 = (uint64_t *)(v14 + 232);
        v157 = (uint64_t *)(v14 + 240);
        v158 = (double *)(v14 + 248);
        v159 = (double *)(v14 + 256);
        v160 = (double *)(v14 + 264);
        v161 = (double *)(v14 + 272);
        v162 = (uint64_t *)(v14 + 280);
        v163 = (uint64_t *)(v14 + 288);
        v164 = (char *)(v14 + 184);
        v165 = (void **)(v14 + 176);
        v166 = (uint64_t *)(v14 + 168);
        v167 = (uint64_t *)(v14 + 160);
        v14 += 152;
        v168 = v251;
      }
      else
      {
        v151 = (uint64_t *)(v14 + 40);
        v152 = (uint64_t *)(v14 + 48);
        v153 = (uint64_t *)(v14 + 56);
        v154 = (uint64_t *)(v14 + 64);
        v155 = (uint64_t *)(v14 + 72);
        v156 = (uint64_t *)(v14 + 80);
        v157 = (uint64_t *)(v14 + 88);
        v158 = (double *)(v14 + 96);
        v159 = (double *)(v14 + 104);
        v160 = (double *)(v14 + 112);
        v161 = (double *)(v14 + 120);
        v162 = (uint64_t *)(v14 + 128);
        v163 = (uint64_t *)(v14 + 136);
        v168 = (unsigned __int8 *)(v14 + 144);
        v164 = (char *)(v14 + 32);
        v165 = (void **)(v14 + 24);
        v166 = (uint64_t *)(v14 + 16);
        v167 = (uint64_t *)(v14 + 8);
      }
      LODWORD(v260) = *v168;
      v184 = *v163;
      v258 = *v162;
      v259 = v184;
      v185 = *v161;
      v186 = *v160;
      v187 = *v159;
      v188 = *v158;
      v189 = *v157;
      v190 = *v156;
      v191 = *v155;
      v192 = *v154;
      v193 = *v153;
      v194 = *v152;
      v195 = *v151;
      v196 = *v164;
      v197 = *v165;
      v198 = *v166;
      v199 = *(_QWORD *)v14;
      v200 = *v167;
      sub_18B708DEC((_QWORD *)v14);
      sub_18B71972C((uint64_t)v343, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
      v262 = v199;
      v263 = v200;
      v264 = v198;
      v265 = v197;
      v266 = v196;
      v267 = v195;
      v268 = v194;
      v269 = v193;
      v270 = v192;
      v271 = v191;
      v272 = v190;
      v273 = v189;
      v274 = v188;
      v275 = v187;
      v276 = v186;
      v277 = v185;
      v278 = v258;
      v279 = v259;
      v280 = v260;
      v35 = v197;
      sub_18B709000((uint64_t)&v262);
      v1 = v252;
      v38 = v255;
      v36 = v256;
      v39 = v261;
      v37 = v254;
    }
    else
    {
      if ((v253 & 1) != 0)
      {
        v133 = (uint64_t *)(v14 + 192);
        v134 = (uint64_t *)(v14 + 200);
        v135 = (uint64_t *)(v14 + 208);
        v136 = (uint64_t *)(v14 + 216);
        v137 = (uint64_t *)(v14 + 224);
        v138 = (uint64_t *)(v14 + 232);
        v139 = (uint64_t *)(v14 + 240);
        v140 = (CGFloat *)(v14 + 248);
        v141 = (double *)(v14 + 256);
        v142 = (CGFloat *)(v14 + 264);
        v143 = (double *)(v14 + 272);
        v144 = (uint64_t *)(v14 + 280);
        v145 = (uint64_t *)(v14 + 288);
        v146 = (char *)(v14 + 184);
        v147 = (void **)(v14 + 176);
        v148 = (uint64_t *)(v14 + 168);
        v149 = (uint64_t *)(v14 + 160);
        v14 += 152;
        v150 = v251;
      }
      else
      {
        v133 = (uint64_t *)(v14 + 40);
        v134 = (uint64_t *)(v14 + 48);
        v135 = (uint64_t *)(v14 + 56);
        v136 = (uint64_t *)(v14 + 64);
        v137 = (uint64_t *)(v14 + 72);
        v138 = (uint64_t *)(v14 + 80);
        v139 = (uint64_t *)(v14 + 88);
        v140 = (CGFloat *)(v14 + 96);
        v141 = (double *)(v14 + 104);
        v142 = (CGFloat *)(v14 + 112);
        v143 = (double *)(v14 + 120);
        v144 = (uint64_t *)(v14 + 128);
        v145 = (uint64_t *)(v14 + 136);
        v150 = (unsigned __int8 *)(v14 + 144);
        v146 = (char *)(v14 + 32);
        v147 = (void **)(v14 + 24);
        v148 = (uint64_t *)(v14 + 16);
        v149 = (uint64_t *)(v14 + 8);
      }
      LODWORD(v261) = *v150;
      v169 = *v145;
      v259 = *v144;
      v260 = v169;
      v170 = *v143;
      v39 = *v142;
      v171 = *v141;
      v37 = *v140;
      v172 = *v139;
      v173 = *v138;
      v174 = *v137;
      v175 = *v136;
      v176 = *v135;
      v177 = *v134;
      v178 = *v133;
      v179 = *v146;
      v180 = *v147;
      v181 = *v148;
      v182 = *(_QWORD *)v14;
      v183 = *v149;
      sub_18B708DEC((_QWORD *)v14);
      sub_18B71972C((uint64_t)v343, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
      v262 = v182;
      v263 = v183;
      v264 = v181;
      v265 = v180;
      v266 = v179;
      v267 = v178;
      v268 = v177;
      v269 = v176;
      v270 = v175;
      v271 = v174;
      v272 = v173;
      v273 = v172;
      v38 = v170;
      v274 = v37;
      v275 = v171;
      v276 = v39;
      v277 = v170;
      v278 = v259;
      v279 = v260;
      v36 = v171;
      v280 = LOBYTE(v261);
      v35 = v180;
      sub_18B709000((uint64_t)&v262);
      v1 = v252;
    }
  }
  else
  {
    v37 = *(double *)(v13 + 96);
    v36 = *(double *)(v13 + 104);
    v39 = *(double *)(v13 + 112);
    v38 = *(double *)(v13 + 120);
    v35 = *(id *)(v13 + 24);
    sub_18B71972C((uint64_t)v343, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  }
  objc_msgSend(v35, sel_ascender);
  v201 = OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController;
  v202 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                               + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v202)
    goto LABEL_34;
  v203 = v202;
  objc_msgSend(v202, sel_frame);

  v359.origin.x = v37;
  v359.origin.y = v36;
  v359.size.width = v39;
  v359.size.height = v38;
  CGRectGetWidth(v359);
  v204 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (!v204)
  {
LABEL_35:
    __break(1u);
    goto LABEL_36;
  }
  v205 = v204;
  objc_msgSend(v204, sel_frame);
  v207 = v206;
  v209 = v208;
  v211 = v210;
  v213 = v212;

  v360.origin.x = v207;
  v360.origin.y = v209;
  v360.size.width = v211;
  v360.size.height = v213;
  CGRectGetMinX(v360);
  v214 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (!v214)
  {
LABEL_36:
    __break(1u);
    goto LABEL_37;
  }
  v215 = v214;
  objc_msgSend(v214, sel_frame);
  v217 = v216;
  v219 = v218;
  v221 = v220;
  v223 = v222;

  v361.origin.x = v217;
  v361.origin.y = v219;
  v361.size.width = v221;
  v361.size.height = v223;
  CGRectGetWidth(v361);
  v224 = objc_msgSend(*(id *)(v1 + v201), sel_view);
  if (v224)
  {
    v225 = v224;
    objc_msgSend(v224, sel_frame);
    v227 = v226;
    v229 = v228;
    v231 = v230;
    v233 = v232;

    v362.origin.x = v227;
    v362.origin.y = v229;
    v362.size.width = v231;
    v362.size.height = v233;
    CGRectGetMinY(v362);
    goto LABEL_32;
  }
LABEL_37:
  __break(1u);
}

uint64_t IncomingCallTextViewAdapter.preferredAlignment.getter()
{
  char v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  return v1 & 1;
}

uint64_t IncomingCallTextViewAdapter.preferredAlignment.setter(unint64_t a1)
{
  int v1;
  uint64_t result;
  char v3;

  v1 = sub_18B7190D4(a1) & 1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  result = swift_release();
  if (v3 == 2 || (v3 & 1) != v1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    return sub_18B728FEC();
  }
  return result;
}

uint64_t (*IncomingCallTextViewAdapter.preferredAlignment.modify(uint64_t a1))(unint64_t *a1)
{
  uint64_t v1;

  *(_QWORD *)(a1 + 8) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  *(_QWORD *)a1 = *(_BYTE *)(a1 + 16) & 1;
  return sub_18B71293C;
}

uint64_t sub_18B71293C(unint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredAlignment.setter(*a1);
}

uint64_t IncomingCallTextViewAdapter.preferredLayout.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v12 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = sub_18B72922C();
  v4 = *(_QWORD *)(v3 - 8);
  v5 = MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v12 - v8;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_18B709714((uint64_t)v2, &qword_1EDFD51D0);
    return 0;
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v9, v2, v3);
    (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v7, v9, v3);
    v10 = sub_18B718EBC(v7);
    (*(void (**)(char *, uint64_t))(v4 + 8))(v9, v3);
  }
  return v10;
}

uint64_t IncomingCallTextViewAdapter.preferredLayout.setter(uint64_t a1)
{
  return sub_18B717E8C(a1, (uint64_t)&unk_18B73C1F8, (uint64_t)&unk_18B73C220);
}

uint64_t sub_18B712B78(uint64_t a1)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (a1 == 1)
    return sub_18B729208();
  if (a1)
  {
    if (qword_1EDFD5210 != -1)
      swift_once();
    v1 = sub_18B728FA4();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EDFDA4D0);
    v2 = sub_18B728F98();
    v3 = sub_18B729400();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18B634000, v2, v3, "Unrecognized PRPosterTitleLayout; fallback to horizontal.", v4, 2u);
      MEMORY[0x18D77C964](v4, -1, -1);
    }

  }
  return sub_18B729214();
}

void (*IncomingCallTextViewAdapter.preferredLayout.modify(_QWORD *a1))(uint64_t **a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  size_t v8;
  char *v9;
  void *v10;
  uint64_t v11;

  v3 = malloc(0x28uLL);
  *a1 = v3;
  v3[1] = v1;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v5 = malloc(*(_QWORD *)(*(_QWORD *)(v4 - 8) + 64));
  v3[2] = v5;
  v6 = sub_18B72922C();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  v9 = (char *)malloc(v8);
  v3[3] = v9;
  v10 = malloc(v8);
  v3[4] = v10;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  if ((*(unsigned int (**)(void *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) == 1)
  {
    sub_18B709714((uint64_t)v5, &qword_1EDFD51D0);
    v11 = 0;
  }
  else
  {
    (*(void (**)(void *, void *, uint64_t))(v7 + 32))(v10, v5, v6);
    (*(void (**)(char *, void *, uint64_t))(v7 + 16))(v9, v10, v6);
    v11 = sub_18B718EBC(v9);
    (*(void (**)(void *, uint64_t))(v7 + 8))(v10, v6);
  }
  *v3 = v11;
  return sub_18B712DF4;
}

void sub_18B712DF4(uint64_t **a1)
{
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v4;

  v1 = *a1;
  v3 = (void *)(*a1)[3];
  v2 = (void *)(*a1)[4];
  v4 = (void *)(*a1)[2];
  IncomingCallTextViewAdapter.preferredLayout.setter(**a1);
  free(v2);
  free(v3);
  free(v4);
  free(v1);
}

id IncomingCallTextViewAdapter.textColor.getter()
{
  _BYTE *v0;
  id v1;
  _BYTE v3[304];
  _BYTE v4[304];
  _BYTE v5[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v5, v4);
  sub_18B7086A4(v4, v5);
  if (sub_18B7086E0((uint64_t)v5) == 1)
  {
    sub_18B7086EC((uint64_t)v5);
    sub_18B7086A4(v4, v3);
    v0 = v3;
  }
  else
  {
    v0 = v5;
  }
  v1 = *(id *)(sub_18B7086EC((uint64_t)v0) + 16);
  sub_18B71972C((uint64_t)v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  return v1;
}

void IncomingCallTextViewAdapter.textColor.setter(id a1)
{
  _BYTE *v2;
  id v3;
  char v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[38];
  _BYTE v10[304];
  _BYTE v11[152];
  _BYTE v12[152];
  _BYTE v13[304];
  _BYTE v14[304];
  _BYTE v15[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v15, v14);
  sub_18B7086A4(v14, v15);
  if (sub_18B7086E0((uint64_t)v15) == 1)
  {
    sub_18B7086EC((uint64_t)v15);
    sub_18B7086A4(v14, v13);
    v2 = v13;
  }
  else
  {
    v2 = v15;
  }
  v3 = *(id *)(sub_18B7086EC((uint64_t)v2) + 16);
  sub_18B71972C((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  sub_18B6FEB68(0, (unint64_t *)&unk_1EDFD5608);
  v4 = sub_18B729460();

  if ((v4 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    a1 = a1;
    sub_18B728FE0();
    swift_release();
    swift_release();
    sub_18B7086A4(v13, v10);
    sub_18B7086A4(v10, v9);
    sub_18B71DFD0(a1);

    sub_18B7086A4(v9, v13);
    sub_18B719BD4(v13);
    swift_release();
    swift_retain();
    v5 = sub_18B7199B8(v9);
    v7 = v6;
    sub_18B700E08(v6, (uint64_t)v11);
    sub_18B700E08((uint64_t)v11, (uint64_t)v12);
    if (sub_18B708DD4((uint64_t)v12) != 1)
    {
      v8 = *(void **)(v7 + 16);
      *(_QWORD *)(v7 + 16) = a1;
      a1 = a1;

    }
    ((void (*)(_QWORD *, _QWORD))v5)(v9, 0);
    swift_release();
  }

}

void (*IncomingCallTextViewAdapter.textColor.modify(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  const void *v4;
  uint64_t v5;
  id v6;

  v3 = malloc(0x3A0uLL);
  *a1 = v3;
  v4 = v3 + 38;
  v3[115] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v3 + 76, v3 + 38);
  sub_18B7086A4(v3 + 38, v3);
  if (sub_18B7086E0((uint64_t)v3) == 1)
  {
    sub_18B7086EC((uint64_t)v3);
    sub_18B7086A4(v4, v3 + 76);
    v5 = (uint64_t)(v3 + 76);
  }
  else
  {
    v5 = (uint64_t)v3;
  }
  v6 = *(id *)(sub_18B7086EC(v5) + 16);
  sub_18B71972C((uint64_t)v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  v3[114] = v6;
  return sub_18B713324;
}

void sub_18B713324(id **a1, char a2)
{
  id *v2;
  id v3;

  v2 = *a1;
  v3 = (*a1)[114];
  if ((a2 & 1) != 0)
  {
    IncomingCallTextViewAdapter.textColor.setter(v3);

  }
  else
  {
    IncomingCallTextViewAdapter.textColor.setter(v3);
  }
  free(v2);
}

id IncomingCallTextViewAdapter.emphasizedNameFont.getter()
{
  int v0;
  uint64_t v1;
  char *v2;
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
  char v15;
  void *v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  id v21;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  __int128 v28;
  void *v29;
  char v30;
  uint64_t v31;
  __int128 v32;
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
  char v43;
  _BYTE v44[304];
  _BYTE v45[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v45, v44);
  sub_18B7086A4(v44, v45);
  v0 = sub_18B7086E0((uint64_t)v45);
  v1 = sub_18B7086EC((uint64_t)v45);
  if (v0 == 1)
  {
    v2 = (char *)(v1 + 296);
    if ((*(_BYTE *)(v1 + 297) & 1) != 0)
    {
      v4 = *(_QWORD *)(v1 + 152);
      v1 += 152;
      v3 = v4;
      v5 = *(_QWORD *)(v1 + 40);
      v26 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v24 = *(_QWORD *)(v1 + 72);
      v25 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *v2;
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(void **)(v1 + 24);
    }
    else
    {
      v5 = *(_QWORD *)(v1 + 40);
      v26 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v24 = *(_QWORD *)(v1 + 72);
      v25 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *(_BYTE *)(v1 + 144);
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(void **)(v1 + 24);
      v3 = *(_QWORD *)v1;
    }
    v23 = *(_OWORD *)(v1 + 8);
    sub_18B708DEC((_QWORD *)v1);
    sub_18B71972C((uint64_t)v44, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v20 = v23;
    v19 = v24;
    v18 = v25;
    v17 = v26;
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 40);
    v17 = *(_OWORD *)(v1 + 48);
    v18 = *(_QWORD *)(v1 + 64);
    v19 = *(_QWORD *)(v1 + 72);
    v6 = *(_QWORD *)(v1 + 80);
    v7 = *(_QWORD *)(v1 + 88);
    v8 = *(_QWORD *)(v1 + 96);
    v9 = *(_QWORD *)(v1 + 104);
    v10 = *(_QWORD *)(v1 + 112);
    v12 = *(_QWORD *)(v1 + 120);
    v11 = *(_QWORD *)(v1 + 128);
    v13 = *(_QWORD *)(v1 + 136);
    v14 = *(_BYTE *)(v1 + 144);
    v15 = *(_BYTE *)(v1 + 32);
    v16 = *(void **)(v1 + 24);
    v3 = *(_QWORD *)v1;
    v20 = *(_OWORD *)(v1 + 8);
  }
  v27 = v3;
  v28 = v20;
  v29 = v16;
  v30 = v15;
  v31 = v5;
  v32 = v17;
  v33 = v18;
  v34 = v19;
  v35 = v6;
  v36 = v7;
  v37 = v8;
  v38 = v9;
  v39 = v10;
  v40 = v12;
  v41 = v11;
  v42 = v13;
  v43 = v14;
  v21 = v16;
  sub_18B709000((uint64_t)&v27);
  return v21;
}

void IncomingCallTextViewAdapter.emphasizedNameFont.setter(id a1)
{
  int v2;
  uint64_t v3;
  char *v4;
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
  char v16;
  char v17;
  void *v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  id v23;
  char v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  id v33;
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
  char v45;
  uint64_t v46;
  uint64_t v47;
  __int128 v48;
  id v49;
  char v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
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
  char v64;
  uint64_t v65;
  id v66;
  char v67;
  __int128 v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  id v79;
  uint64_t v80;
  id v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  char v93;
  char v94;
  __int128 v95;
  uint64_t v96;
  uint64_t v97;
  id v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  char v108;
  uint64_t v109;
  uint64_t v110;
  __int16 v111;
  __int128 v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _BYTE v122[7];
  _BYTE v123[7];
  _BYTE v124[7];
  _BYTE v125[304];
  _BYTE v126[304];
  _BYTE v127[304];
  _BYTE v128[304];
  uint64_t v129;
  __int128 v130;
  void *v131;
  char v132;
  uint64_t v133;
  __int128 v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  char v145;
  _QWORD v146[13];
  char v147;
  uint64_t v148;
  __int128 v149;
  id v150;
  char v151;
  _BYTE v152[7];
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
  char v166;
  _BYTE v167[7];
  uint64_t v168;
  __int128 v169;
  id v170;
  char v171;
  _BYTE v172[7];
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
  char v186;
  __int16 v187;
  _BYTE v188[304];
  _BYTE v189[312];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v189, v188);
  sub_18B7086A4(v188, v189);
  v2 = sub_18B7086E0((uint64_t)v189);
  v3 = sub_18B7086EC((uint64_t)v189);
  if (v2 == 1)
  {
    v4 = (char *)(v3 + 296);
    if ((*(_BYTE *)(v3 + 297) & 1) != 0)
    {
      v6 = *(_QWORD *)(v3 + 152);
      v3 += 152;
      v5 = v6;
      v7 = *(_QWORD *)(v3 + 40);
      v119 = *(_OWORD *)(v3 + 48);
      v8 = *(_QWORD *)(v3 + 80);
      v113 = *(_QWORD *)(v3 + 72);
      v116 = *(_QWORD *)(v3 + 64);
      v9 = *(_QWORD *)(v3 + 88);
      v10 = *(_QWORD *)(v3 + 96);
      v11 = *(_QWORD *)(v3 + 104);
      v12 = *(_QWORD *)(v3 + 112);
      v14 = *(_QWORD *)(v3 + 120);
      v13 = *(_QWORD *)(v3 + 128);
      v15 = *(_QWORD *)(v3 + 136);
      v16 = *v4;
      v17 = *(_BYTE *)(v3 + 32);
      v18 = *(void **)(v3 + 24);
    }
    else
    {
      v7 = *(_QWORD *)(v3 + 40);
      v119 = *(_OWORD *)(v3 + 48);
      v8 = *(_QWORD *)(v3 + 80);
      v113 = *(_QWORD *)(v3 + 72);
      v116 = *(_QWORD *)(v3 + 64);
      v9 = *(_QWORD *)(v3 + 88);
      v10 = *(_QWORD *)(v3 + 96);
      v11 = *(_QWORD *)(v3 + 104);
      v12 = *(_QWORD *)(v3 + 112);
      v14 = *(_QWORD *)(v3 + 120);
      v13 = *(_QWORD *)(v3 + 128);
      v15 = *(_QWORD *)(v3 + 136);
      v16 = *(_BYTE *)(v3 + 144);
      v17 = *(_BYTE *)(v3 + 32);
      v18 = *(void **)(v3 + 24);
      v5 = *(_QWORD *)v3;
    }
    v112 = *(_OWORD *)(v3 + 8);
    sub_18B708DEC((_QWORD *)v3);
    sub_18B71972C((uint64_t)v188, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v22 = v112;
    v21 = v113;
    v20 = v116;
    v19 = v119;
  }
  else
  {
    v7 = *(_QWORD *)(v3 + 40);
    v19 = *(_OWORD *)(v3 + 48);
    v20 = *(_QWORD *)(v3 + 64);
    v21 = *(_QWORD *)(v3 + 72);
    v8 = *(_QWORD *)(v3 + 80);
    v9 = *(_QWORD *)(v3 + 88);
    v10 = *(_QWORD *)(v3 + 96);
    v11 = *(_QWORD *)(v3 + 104);
    v12 = *(_QWORD *)(v3 + 112);
    v14 = *(_QWORD *)(v3 + 120);
    v13 = *(_QWORD *)(v3 + 128);
    v15 = *(_QWORD *)(v3 + 136);
    v16 = *(_BYTE *)(v3 + 144);
    v17 = *(_BYTE *)(v3 + 32);
    v18 = *(void **)(v3 + 24);
    v5 = *(_QWORD *)v3;
    v22 = *(_OWORD *)(v3 + 8);
  }
  v130 = v22;
  v129 = v5;
  v131 = v18;
  v132 = v17;
  v133 = v7;
  v134 = v19;
  v135 = v20;
  v136 = v21;
  v137 = v8;
  v138 = v9;
  v139 = v10;
  v140 = v11;
  v141 = v12;
  v142 = v14;
  v143 = v13;
  v144 = v15;
  v145 = v16;
  v23 = v18;
  sub_18B709000((uint64_t)&v129);
  sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
  v24 = sub_18B729460();

  if ((v24 & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    v25 = a1;
    sub_18B728FE0();
    swift_release();
    swift_release();
    sub_18B7086A4(&v148, v127);
    sub_18B7086A4(v127, v128);
    if (sub_18B7086E0((uint64_t)v128) == 1)
    {
      v32 = sub_18B7086EC((uint64_t)v128);
      if ((*(_BYTE *)(v32 + 297) & 1) != 0)
      {
        v26 = *(_QWORD *)(v32 + 152);
        v32 += 152;
        v31 = v26;
        v28 = *(void **)(v32 + 56);
        v29 = *(_BYTE *)(v32 + 32);
        v30 = *(void **)(v32 + 24);
      }
      else
      {
        v28 = *(void **)(v32 + 56);
        v29 = *(_BYTE *)(v32 + 32);
        v30 = *(void **)(v32 + 24);
        v31 = *(_QWORD *)v32;
      }
      v120 = *(_OWORD *)(v32 + 8);
    }
    else
    {
      v27 = sub_18B7086EC((uint64_t)v128);
      v28 = *(void **)(v27 + 56);
      v29 = *(_BYTE *)(v27 + 32);
      v30 = *(void **)(v27 + 24);
      v31 = *(_QWORD *)v27;
      v120 = *(_OWORD *)(v27 + 8);
      sub_18B7086A4(v127, &v148);
      v32 = sub_18B7086EC((uint64_t)&v148);
    }
    sub_18B708DEC((_QWORD *)v32);
    v33 = v25;

    a1 = v33;
    swift_bridgeObjectRetain();
    sub_18B70A89C(v31, v120, a1, (uint64_t)v146);
    v34 = v146[0];
    v35 = v146[1];
    v36 = v146[2];
    v37 = v146[3];
    v38 = v146[4];
    v39 = v146[5];
    v40 = v146[6];
    v41 = v146[7];
    v42 = v146[8];
    v43 = v146[9];
    v44 = v146[10];
    v114 = v146[12];
    v117 = v146[11];
    v45 = v147;

    swift_bridgeObjectRelease();
    sub_18B7086A4(v127, v126);
    if (sub_18B7086E0((uint64_t)v126) == 1)
    {
      v46 = sub_18B7086EC((uint64_t)v126);
      v47 = *(_QWORD *)v46;
      v48 = *(_OWORD *)(v46 + 8);
      v49 = *(id *)(v46 + 24);
      v50 = *(_BYTE *)(v46 + 32);
      *(_DWORD *)v124 = *(_DWORD *)(v46 + 33);
      *(_DWORD *)&v124[3] = *(_DWORD *)(v46 + 36);
      v52 = *(_QWORD *)(v46 + 40);
      v51 = *(_QWORD *)(v46 + 48);
      v53 = *(_QWORD *)(v46 + 56);
      v54 = *(_QWORD *)(v46 + 64);
      v55 = *(_QWORD *)(v46 + 72);
      v56 = *(_QWORD *)(v46 + 80);
      v57 = *(_QWORD *)(v46 + 88);
      v58 = *(_QWORD *)(v46 + 96);
      v59 = *(_QWORD *)(v46 + 104);
      v60 = *(_QWORD *)(v46 + 112);
      v61 = *(_QWORD *)(v46 + 120);
      v62 = *(_QWORD *)(v46 + 128);
      v63 = *(_QWORD *)(v46 + 136);
      v64 = *(_BYTE *)(v46 + 144);
      *(_DWORD *)v123 = *(_DWORD *)(v46 + 145);
      *(_DWORD *)&v123[3] = *(_DWORD *)(v46 + 148);
      v65 = v46 + 152;
      v66 = *(id *)(v46 + 176);
      v67 = *(_BYTE *)(v46 + 184);
      *(_DWORD *)v122 = *(_DWORD *)(v46 + 185);
      *(_DWORD *)&v122[3] = *(_DWORD *)(v46 + 188);
      v111 = *(_WORD *)(v46 + 297);
      v68 = v120;
      v69 = v40;
      v70 = v38;
      v71 = v39;
      v72 = v37;
      v73 = v42;
      v74 = v41;
      v75 = v44;
      v76 = v43;
      v77 = v114;
      v78 = v117;
      if ((*(_BYTE *)(v46 + 297) & 1) != 0)
      {
        v66 = a1;
        v67 = v29;
      }
      else
      {
        v65 = v46;
        v47 = v31;
        v62 = v117;
        v63 = v114;
        v78 = *(_QWORD *)(v46 + 280);
        v77 = *(_QWORD *)(v46 + 288);
        v49 = a1;
        v50 = v29;
        v60 = v76;
        v61 = v75;
        v76 = *(_QWORD *)(v46 + 264);
        v75 = *(_QWORD *)(v46 + 272);
        v52 = v34;
        v51 = v35;
        v58 = v74;
        v59 = v73;
        v74 = *(_QWORD *)(v46 + 248);
        v73 = *(_QWORD *)(v46 + 256);
        v53 = v36;
        v54 = v72;
        v55 = v70;
        v56 = v71;
        v72 = *(_QWORD *)(v46 + 216);
        v70 = *(_QWORD *)(v46 + 224);
        v34 = *(_QWORD *)(v46 + 192);
        v35 = *(_QWORD *)(v46 + 200);
        v57 = v69;
        v64 = v45;
        v31 = *(_QWORD *)(v46 + 152);
        v36 = *(_QWORD *)(v46 + 208);
        v71 = *(_QWORD *)(v46 + 232);
        v69 = *(_QWORD *)(v46 + 240);
        v45 = *(_BYTE *)(v46 + 296);
        v48 = v120;
        v68 = *(_OWORD *)(v46 + 160);
      }
      v95 = v48;
      v96 = v63;
      v97 = v62;
      v98 = v66;
      v99 = v34;
      v100 = v35;
      v101 = v36;
      v121 = v68;
      v102 = v72;
      v103 = v70;
      v104 = v74;
      v105 = v71;
      v106 = v69;
      v107 = v76;
      v108 = v45;
      v109 = v73;
      v110 = v75;
      v115 = v77;
      v118 = v78;
      v79 = a1;
      v80 = v31;
      v81 = v49;
      v82 = v50;
      v83 = v60;
      v84 = v61;
      v85 = v51;
      v86 = v58;
      v87 = v59;
      v88 = v53;
      v89 = v54;
      v90 = v55;
      v91 = v56;
      v92 = v57;
      v93 = v64;
      v94 = v67;
      sub_18B709000(v65);
      *(_DWORD *)v152 = *(_DWORD *)v124;
      *(_DWORD *)&v152[3] = *(_DWORD *)&v124[3];
      *(_DWORD *)v167 = *(_DWORD *)v123;
      *(_DWORD *)&v167[3] = *(_DWORD *)&v123[3];
      *(_DWORD *)v172 = *(_DWORD *)v122;
      *(_DWORD *)&v172[3] = *(_DWORD *)&v122[3];
      v149 = v95;
      v148 = v47;
      v150 = v81;
      v151 = v82;
      v153 = v52;
      v154 = v85;
      v155 = v88;
      v156 = v89;
      v157 = v90;
      v158 = v91;
      v159 = v92;
      v160 = v86;
      v161 = v87;
      v162 = v83;
      v163 = v84;
      v164 = v97;
      v165 = v96;
      v166 = v93;
      v168 = v80;
      a1 = v79;
      v169 = v121;
      v170 = v98;
      v171 = v94;
      v173 = v99;
      v174 = v100;
      v175 = v101;
      v176 = v102;
      v177 = v103;
      v178 = v105;
      v179 = v106;
      v180 = v104;
      v181 = v109;
      v182 = v107;
      v183 = v110;
      v184 = v118;
      v185 = v115;
      v186 = v108;
      v187 = v111;
      sub_18B719240((uint64_t)&v148);
    }
    else
    {
      sub_18B7086EC((uint64_t)v126);
      sub_18B71972C((uint64_t)v127, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
      v149 = v120;
      v148 = v31;
      v150 = a1;
      v151 = v29;
      v153 = v34;
      v154 = v35;
      v155 = v36;
      v156 = v37;
      v157 = v38;
      v158 = v39;
      v159 = v40;
      v160 = v41;
      v161 = v42;
      v162 = v43;
      v163 = v44;
      v164 = v117;
      v165 = v114;
      v166 = v45;
      sub_18B719288((uint64_t)&v148);
    }
    sub_18B7086A4(&v148, v125);
    sub_18B7086A4(v125, &v148);
    sub_18B719BD4(&v148);
    swift_release();
  }

}

void (*IncomingCallTextViewAdapter.emphasizedNameFont.modify(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  char *v3;
  int v4;
  uint64_t v5;
  char *v6;
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
  char v18;
  char v19;
  void *v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  id v25;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;

  v3 = (char *)malloc(0x3A0uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 115) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v3 + 608, v3 + 304);
  sub_18B7086A4(v3 + 304, v3);
  v4 = sub_18B7086E0((uint64_t)v3);
  v5 = sub_18B7086EC((uint64_t)v3);
  if (v4 == 1)
  {
    v6 = (char *)(v5 + 296);
    if ((*(_BYTE *)(v5 + 297) & 1) != 0)
    {
      v8 = *(_QWORD *)(v5 + 152);
      v5 += 152;
      v7 = v8;
      v9 = *(_QWORD *)(v5 + 40);
      v30 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v28 = *(_QWORD *)(v5 + 72);
      v29 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *v6;
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(void **)(v5 + 24);
    }
    else
    {
      v9 = *(_QWORD *)(v5 + 40);
      v30 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v28 = *(_QWORD *)(v5 + 72);
      v29 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *(_BYTE *)(v5 + 144);
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(void **)(v5 + 24);
      v7 = *(_QWORD *)v5;
    }
    v27 = *(_OWORD *)(v5 + 8);
    sub_18B708DEC((_QWORD *)v5);
    sub_18B71972C((uint64_t)(v3 + 304), (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v24 = v27;
    v23 = v28;
    v22 = v29;
    v21 = v30;
  }
  else
  {
    v9 = *(_QWORD *)(v5 + 40);
    v21 = *(_OWORD *)(v5 + 48);
    v22 = *(_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v5 + 72);
    v10 = *(_QWORD *)(v5 + 80);
    v11 = *(_QWORD *)(v5 + 88);
    v12 = *(_QWORD *)(v5 + 96);
    v13 = *(_QWORD *)(v5 + 104);
    v14 = *(_QWORD *)(v5 + 112);
    v16 = *(_QWORD *)(v5 + 120);
    v15 = *(_QWORD *)(v5 + 128);
    v17 = *(_QWORD *)(v5 + 136);
    v18 = *(_BYTE *)(v5 + 144);
    v19 = *(_BYTE *)(v5 + 32);
    v20 = *(void **)(v5 + 24);
    v7 = *(_QWORD *)v5;
    v24 = *(_OWORD *)(v5 + 8);
  }
  *((_QWORD *)v3 + 76) = v7;
  *(_OWORD *)(v3 + 616) = v24;
  *((_QWORD *)v3 + 79) = v20;
  v3[640] = v19;
  *((_QWORD *)v3 + 81) = v9;
  *((_OWORD *)v3 + 41) = v21;
  *((_QWORD *)v3 + 84) = v22;
  *((_QWORD *)v3 + 85) = v23;
  *((_QWORD *)v3 + 86) = v10;
  *((_QWORD *)v3 + 87) = v11;
  *((_QWORD *)v3 + 88) = v12;
  *((_QWORD *)v3 + 89) = v13;
  *((_QWORD *)v3 + 90) = v14;
  *((_QWORD *)v3 + 91) = v16;
  *((_QWORD *)v3 + 92) = v15;
  *((_QWORD *)v3 + 93) = v17;
  v3[752] = v18;
  v25 = v20;
  sub_18B709000((uint64_t)(v3 + 608));
  *((_QWORD *)v3 + 114) = v25;
  return sub_18B713FC4;
}

void sub_18B713FC4(id **a1, char a2)
{
  id *v2;
  id v3;

  v2 = *a1;
  v3 = (*a1)[114];
  if ((a2 & 1) != 0)
  {
    IncomingCallTextViewAdapter.emphasizedNameFont.setter(v3);

  }
  else
  {
    IncomingCallTextViewAdapter.emphasizedNameFont.setter(v3);
  }
  free(v2);
}

id IncomingCallTextViewAdapter.secondaryNameFont.getter()
{
  int v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t *v4;
  uint64_t *v5;
  uint64_t *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  char *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  id v21;
  char v22;
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
  char v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  char v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
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
  char v58;
  _BYTE v59[152];
  _BYTE v60[24];
  void *v61;
  _BYTE v62[304];
  _BYTE v63[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v63, v62);
  sub_18B7086A4(v62, v63);
  v0 = sub_18B7086E0((uint64_t)v63);
  v1 = sub_18B7086EC((uint64_t)v63);
  if (v0 == 1)
  {
    v2 = v1;
    v3 = (char *)(v1 + 296);
    if ((*(_BYTE *)(v1 + 297) & 1) != 0)
    {
      v4 = (uint64_t *)(v1 + 40);
      v5 = (uint64_t *)(v1 + 48);
      v6 = (uint64_t *)(v1 + 56);
      v7 = (uint64_t *)(v1 + 64);
      v8 = (uint64_t *)(v1 + 72);
      v9 = (uint64_t *)(v1 + 80);
      v10 = (uint64_t *)(v1 + 88);
      v11 = (uint64_t *)(v1 + 96);
      v12 = (uint64_t *)(v1 + 104);
      v13 = (uint64_t *)(v1 + 112);
      v14 = (uint64_t *)(v1 + 120);
      v15 = (uint64_t *)(v1 + 128);
      v16 = (uint64_t *)(v1 + 136);
      v3 = (char *)(v1 + 144);
      v17 = (char *)(v1 + 32);
      v18 = (uint64_t *)(v1 + 24);
      v19 = (uint64_t *)(v1 + 16);
      v20 = (uint64_t *)(v1 + 8);
    }
    else
    {
      v1 += 152;
      v4 = (uint64_t *)(v2 + 192);
      v5 = (uint64_t *)(v2 + 200);
      v6 = (uint64_t *)(v2 + 208);
      v7 = (uint64_t *)(v2 + 216);
      v8 = (uint64_t *)(v2 + 224);
      v9 = (uint64_t *)(v2 + 232);
      v10 = (uint64_t *)(v2 + 240);
      v11 = (uint64_t *)(v2 + 248);
      v12 = (uint64_t *)(v2 + 256);
      v13 = (uint64_t *)(v2 + 264);
      v14 = (uint64_t *)(v2 + 272);
      v15 = (uint64_t *)(v2 + 280);
      v16 = (uint64_t *)(v2 + 288);
      v17 = (char *)(v2 + 184);
      v18 = (uint64_t *)(v2 + 176);
      v19 = (uint64_t *)(v2 + 168);
      v20 = (uint64_t *)(v2 + 160);
    }
    v22 = *v3;
    v41 = *v15;
    v42 = *v16;
    v23 = *v14;
    v24 = *v13;
    v25 = *v12;
    v26 = *v11;
    v27 = *v10;
    v28 = *v9;
    v29 = *v8;
    v30 = *v7;
    v31 = *v6;
    v32 = *v5;
    v33 = *v4;
    v34 = *v17;
    v35 = *v18;
    v36 = *v19;
    v37 = *(_QWORD *)v1;
    v38 = *v20;
    sub_18B708DEC((_QWORD *)v1);
    sub_18B71972C((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v43[0] = v37;
    v43[1] = v38;
    v43[2] = v36;
    v43[3] = v35;
    v44 = v34;
    v45 = v33;
    v46 = v32;
    v47 = v31;
    v48 = v30;
    v49 = v29;
    v50 = v28;
    v51 = v27;
    v52 = v26;
    v53 = v25;
    v54 = v24;
    v55 = v23;
    v56 = v41;
    v57 = v42;
    v58 = v22;
    nullsub_1(v43);
    sub_18B700E08((uint64_t)v43, (uint64_t)v60);
    v39 = v61;
    sub_18B700E08((uint64_t)v60, (uint64_t)v59);
    v21 = v39;
    sub_18B719870((uint64_t)v59, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  }
  else
  {
    sub_18B71972C((uint64_t)v62, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    return 0;
  }
  return v21;
}

void IncomingCallTextViewAdapter.secondaryNameFont.setter(void *a1)
{
  void *v1;
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t *v7;
  uint64_t *v8;
  uint64_t *v9;
  uint64_t *v10;
  uint64_t *v11;
  uint64_t *v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  char *v20;
  uint64_t *v21;
  uint64_t *v22;
  uint64_t *v23;
  char v24;
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
  char v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  id v43;
  id v44;
  void (*v45)(uint64_t *, char);
  const void *v46;
  int v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t *v53;
  uint64_t *v54;
  uint64_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t *v58;
  uint64_t *v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  char *v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  char v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  id v86;
  uint64_t v87;
  uint64_t v88;
  id v89;
  void *v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  void (*v94)(uint64_t *, char);
  uint64_t v95;
  void *v96;
  id obj;
  id obja;
  _QWORD v99[4];
  char v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  char v114;
  _QWORD v115[3];
  id v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  _OWORD v122[2];
  uint64_t v123[4];
  _BYTE v124[304];
  _BYTE v125[24];
  void *v126;
  _BYTE v127[304];
  _BYTE v128[138];
  _OWORD v129[5];
  _OWORD v130[2];
  _QWORD v131[4];
  char v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  uint64_t v145;
  char v146;

  if (a1)
  {
    v1 = a1;
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    v2 = v1;
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    sub_18B7086A4(v125, v127);
    sub_18B7086A4(v127, v128);
    v3 = sub_18B7086E0((uint64_t)v128);
    v4 = sub_18B7086EC((uint64_t)v128);
    if (v3 == 1)
    {
      v5 = v4;
      v6 = (char *)(v4 + 296);
      v96 = v2;
      obj = v1;
      if ((*(_BYTE *)(v4 + 297) & 1) != 0)
      {
        v7 = (uint64_t *)(v4 + 40);
        v8 = (uint64_t *)(v4 + 48);
        v9 = (uint64_t *)(v4 + 56);
        v10 = (uint64_t *)(v4 + 64);
        v11 = (uint64_t *)(v4 + 72);
        v12 = (uint64_t *)(v4 + 80);
        v13 = (uint64_t *)(v4 + 88);
        v14 = (uint64_t *)(v4 + 96);
        v15 = (uint64_t *)(v4 + 104);
        v16 = (uint64_t *)(v4 + 112);
        v17 = (uint64_t *)(v4 + 120);
        v18 = (uint64_t *)(v4 + 128);
        v19 = (uint64_t *)(v4 + 136);
        v6 = (char *)(v4 + 144);
        v20 = (char *)(v4 + 32);
        v21 = (uint64_t *)(v4 + 24);
        v22 = (uint64_t *)(v4 + 16);
        v23 = (uint64_t *)(v4 + 8);
      }
      else
      {
        v4 += 152;
        v7 = (uint64_t *)(v5 + 192);
        v8 = (uint64_t *)(v5 + 200);
        v9 = (uint64_t *)(v5 + 208);
        v10 = (uint64_t *)(v5 + 216);
        v11 = (uint64_t *)(v5 + 224);
        v12 = (uint64_t *)(v5 + 232);
        v13 = (uint64_t *)(v5 + 240);
        v14 = (uint64_t *)(v5 + 248);
        v15 = (uint64_t *)(v5 + 256);
        v16 = (uint64_t *)(v5 + 264);
        v17 = (uint64_t *)(v5 + 272);
        v18 = (uint64_t *)(v5 + 280);
        v19 = (uint64_t *)(v5 + 288);
        v20 = (char *)(v5 + 184);
        v21 = (uint64_t *)(v5 + 176);
        v22 = (uint64_t *)(v5 + 168);
        v23 = (uint64_t *)(v5 + 160);
      }
      v24 = *v6;
      v93 = *v18;
      v95 = *v19;
      v25 = *v17;
      v26 = *v16;
      v27 = *v15;
      v28 = *v14;
      v29 = *v13;
      v30 = *v12;
      v31 = *v11;
      v32 = *v10;
      v33 = *v9;
      v34 = *v8;
      v35 = *v7;
      v36 = *v20;
      v37 = *v21;
      v38 = *v22;
      v39 = *(_QWORD *)v4;
      v40 = *v23;
      sub_18B708DEC((_QWORD *)v4);
      sub_18B71972C((uint64_t)v127, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
      v131[0] = v39;
      v131[1] = v40;
      v131[2] = v38;
      v131[3] = v37;
      v132 = v36;
      v133 = v35;
      v134 = v34;
      v135 = v33;
      v136 = v32;
      v137 = v31;
      v138 = v30;
      v139 = v29;
      v140 = v28;
      v141 = v27;
      v142 = v26;
      v143 = v25;
      v144 = v93;
      v145 = v95;
      v146 = v24;
      nullsub_1(v131);
      sub_18B700E08((uint64_t)v131, (uint64_t)v125);
      v41 = v126;
      sub_18B700E08((uint64_t)v125, (uint64_t)v124);
      v42 = v41;
      sub_18B719870((uint64_t)v124, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
      sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
      v2 = v96;
      v43 = v96;
      v44 = v42;
      LOBYTE(v42) = sub_18B729460();

      if ((v42 & 1) != 0)
      {

        return;
      }
      v1 = obj;
    }
    else
    {
      sub_18B71972C((uint64_t)v127, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    }
    swift_retain();
    v45 = sub_18B71A2B8(v123);
    sub_18B7086A4(v46, v124);
    sub_18B7086A4(v124, v125);
    v47 = sub_18B7086E0((uint64_t)v125);
    v48 = sub_18B7086EC((uint64_t)v125);
    if (v47 == 1)
    {
      v49 = v48;
      v50 = (char *)(v48 + 296);
      if ((*(_BYTE *)(v48 + 297) & 1) != 0)
      {
        v51 = (uint64_t *)(v48 + 40);
        v52 = (uint64_t *)(v48 + 48);
        v53 = (uint64_t *)(v48 + 56);
        v54 = (uint64_t *)(v48 + 64);
        v55 = (uint64_t *)(v48 + 72);
        v56 = (uint64_t *)(v48 + 80);
        v57 = (uint64_t *)(v48 + 88);
        v58 = (uint64_t *)(v48 + 96);
        v59 = (uint64_t *)(v48 + 104);
        v60 = (uint64_t *)(v48 + 112);
        v61 = (uint64_t *)(v48 + 120);
        v62 = (uint64_t *)(v48 + 128);
        v63 = (uint64_t *)(v48 + 136);
        v50 = (char *)(v48 + 144);
        v64 = (char *)(v48 + 32);
        v65 = (uint64_t *)(v48 + 24);
        v66 = (uint64_t *)(v48 + 16);
        v67 = (uint64_t *)(v48 + 8);
      }
      else
      {
        v48 += 152;
        v51 = (uint64_t *)(v49 + 192);
        v52 = (uint64_t *)(v49 + 200);
        v53 = (uint64_t *)(v49 + 208);
        v54 = (uint64_t *)(v49 + 216);
        v55 = (uint64_t *)(v49 + 224);
        v56 = (uint64_t *)(v49 + 232);
        v57 = (uint64_t *)(v49 + 240);
        v58 = (uint64_t *)(v49 + 248);
        v59 = (uint64_t *)(v49 + 256);
        v60 = (uint64_t *)(v49 + 264);
        v61 = (uint64_t *)(v49 + 272);
        v62 = (uint64_t *)(v49 + 280);
        v63 = (uint64_t *)(v49 + 288);
        v64 = (char *)(v49 + 184);
        v65 = (uint64_t *)(v49 + 176);
        v66 = (uint64_t *)(v49 + 168);
        v67 = (uint64_t *)(v49 + 160);
      }
      obja = v1;
      v68 = *v50;
      v91 = *v62;
      v92 = *v63;
      v69 = *v61;
      v70 = *v60;
      v71 = *v59;
      v72 = *v58;
      v73 = *v57;
      v74 = *v56;
      v75 = *v55;
      v76 = *v54;
      v94 = v45;
      v77 = v2;
      v78 = *v53;
      v79 = *v52;
      v80 = *v51;
      v81 = *v64;
      v82 = *v65;
      v83 = *v66;
      v84 = *(_QWORD *)v48;
      v85 = *v67;
      sub_18B708DEC((_QWORD *)v48);
      v99[0] = v84;
      v99[1] = v85;
      v99[2] = v83;
      v99[3] = v82;
      v100 = v81;
      v101 = v80;
      v102 = v79;
      v103 = v78;
      v104 = v76;
      v105 = v75;
      v106 = v74;
      v107 = v73;
      v108 = v72;
      v109 = v71;
      v110 = v70;
      v111 = v69;
      v112 = v91;
      v113 = v92;
      v114 = v68;
      nullsub_1(v99);
      sub_18B700E08((uint64_t)v99, (uint64_t)v115);
      v86 = v77;
      objc_storeStrong(&v116, obja);
      v87 = v115[0];
      v88 = v115[1];
      v89 = v86;
      swift_bridgeObjectRetain();
      sub_18B70A89C(v87, v88, v89, (uint64_t)v129);
      v90 = (void *)v118;

      swift_bridgeObjectRelease();
      v120 = v129[3];
      v121 = v129[4];
      v122[0] = v130[0];
      *(_OWORD *)((char *)v122 + 9) = *(_OWORD *)((char *)v130 + 9);
      v117 = v129[0];
      v118 = v129[1];
      v119 = v129[2];
      sub_18B700E08((uint64_t)v115, (uint64_t)v131);
      sub_18B71CA1C((uint64_t)v131);
      v94(v123, 0);
      swift_release();

    }
    else
    {
      v45(v123, 0);
      swift_release();

    }
  }
}

void (*IncomingCallTextViewAdapter.secondaryNameFont.modify(id *a1))(void **a1, char a2)
{
  void *v1;

  a1[1] = v1;
  *a1 = IncomingCallTextViewAdapter.secondaryNameFont.getter();
  return sub_18B714900;
}

void sub_18B714900(void **a1, char a2)
{
  void *v2;
  id v3;

  v2 = *a1;
  if ((a2 & 1) != 0)
  {
    v3 = v2;
    IncomingCallTextViewAdapter.secondaryNameFont.setter(v2);

  }
  else
  {
    IncomingCallTextViewAdapter.secondaryNameFont.setter(*a1);
  }
}

id IncomingCallTextViewAdapter.statusFont.getter()
{
  id v0;
  void *v1;
  _BYTE v3[152];
  _BYTE v4[24];
  void *v5;
  _BYTE v6[152];
  _BYTE v7[152];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v7, (uint64_t)v6);
  sub_18B700E08((uint64_t)v6, (uint64_t)v4);
  sub_18B700E08((uint64_t)v6, (uint64_t)v7);
  if (sub_18B708DD4((uint64_t)v7) == 1)
    return 0;
  v1 = v5;
  sub_18B700E08((uint64_t)v4, (uint64_t)v3);
  v0 = v1;
  sub_18B719870((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  return v0;
}

void IncomingCallTextViewAdapter.statusFont.setter(void *a1)
{
  id v2;
  void *v3;
  id v4;
  id v5;
  id v6;
  void (*v7)(_QWORD *);
  uint64_t v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD v13[4];
  _BYTE v14[152];
  _BYTE v15[24];
  void *v16;
  _BYTE v17[152];
  _BYTE v18[152];
  _BYTE v19[112];

  if (a1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    v2 = a1;
    sub_18B728FE0();
    swift_release();
    swift_release();
    swift_release();
    sub_18B700E08((uint64_t)v14, (uint64_t)v17);
    sub_18B700E08((uint64_t)v17, (uint64_t)v15);
    sub_18B700E08((uint64_t)v17, (uint64_t)v18);
    if (sub_18B708DD4((uint64_t)v18) == 1)
      goto LABEL_5;
    v3 = v16;
    sub_18B700E08((uint64_t)v15, (uint64_t)v14);
    v4 = v3;
    sub_18B719870((uint64_t)v14, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B6FEB68(0, (unint64_t *)&qword_1EDFD5600);
    v5 = v2;
    v6 = v4;
    LOBYTE(v4) = sub_18B729460();

    if ((v4 & 1) == 0)
    {
LABEL_5:
      swift_retain();
      v7 = sub_18B7199B8(v13);
      v9 = v8;
      sub_18B700E08(v8, (uint64_t)v14);
      sub_18B700E08((uint64_t)v14, (uint64_t)v15);
      if (sub_18B708DD4((uint64_t)v15) != 1)
      {
        v10 = v2;
        objc_storeStrong((id *)(v9 + 24), a1);
        v11 = *(_QWORD *)v9;
        v12 = *(_QWORD *)(v9 + 8);
        v2 = v10;
        swift_bridgeObjectRetain();
        sub_18B70A89C(v11, v12, v2, (uint64_t)v19);
        sub_18B7192CC((uint64_t)v19, v9 + 40);

      }
      ((void (*)(_QWORD *, _QWORD))v7)(v13, 0);
      swift_release();

    }
    else
    {

    }
  }
}

void (*IncomingCallTextViewAdapter.statusFont.modify(_QWORD *a1))(id **a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  _QWORD *v5;
  id v6;
  void *v7;

  v3 = malloc(0x270uLL);
  *a1 = v3;
  v4 = (uint64_t)(v3 + 57);
  v5 = v3 + 76;
  v3[77] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)(v3 + 57), (uint64_t)(v3 + 19));
  sub_18B700E08((uint64_t)(v3 + 19), (uint64_t)(v3 + 38));
  sub_18B700E08((uint64_t)(v3 + 19), (uint64_t)v3);
  if (sub_18B708DD4((uint64_t)v3) == 1)
  {
    v6 = 0;
  }
  else
  {
    v7 = (void *)v3[41];
    sub_18B700E08((uint64_t)(v3 + 38), v4);
    v6 = v7;
    sub_18B719870(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  }
  *v5 = v6;
  return sub_18B714DF8;
}

void sub_18B714DF8(id **a1, char a2)
{
  id *v2;
  id v3;
  id v4;

  v2 = *a1;
  v3 = (*a1)[76];
  if ((a2 & 1) != 0)
  {
    v4 = v3;
    IncomingCallTextViewAdapter.statusFont.setter(v3);

  }
  else
  {
    IncomingCallTextViewAdapter.statusFont.setter((*a1)[76]);
  }
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.displayNameText.getter()
{
  int v0;
  uint64_t v1;
  char *v2;
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
  char v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  __int128 v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  char v29;
  uint64_t v30;
  __int128 v31;
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
  char v42;
  _BYTE v43[304];
  _BYTE v44[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v44, v43);
  sub_18B7086A4(v43, v44);
  v0 = sub_18B7086E0((uint64_t)v44);
  v1 = sub_18B7086EC((uint64_t)v44);
  if (v0 == 1)
  {
    v2 = (char *)(v1 + 296);
    if ((*(_BYTE *)(v1 + 298) & 1) != 0)
    {
      v4 = *(_QWORD *)(v1 + 152);
      v1 += 152;
      v3 = v4;
      v5 = *(_QWORD *)(v1 + 40);
      v25 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v23 = *(_QWORD *)(v1 + 72);
      v24 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *v2;
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(_QWORD *)(v1 + 24);
    }
    else
    {
      v5 = *(_QWORD *)(v1 + 40);
      v25 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v23 = *(_QWORD *)(v1 + 72);
      v24 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *(_BYTE *)(v1 + 144);
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(_QWORD *)(v1 + 24);
      v3 = *(_QWORD *)v1;
    }
    v22 = *(_OWORD *)(v1 + 8);
    sub_18B708DEC((_QWORD *)v1);
    sub_18B71972C((uint64_t)v43, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v20 = v22;
    v19 = v23;
    v18 = v24;
    v17 = v25;
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 40);
    v17 = *(_OWORD *)(v1 + 48);
    v18 = *(_QWORD *)(v1 + 64);
    v19 = *(_QWORD *)(v1 + 72);
    v6 = *(_QWORD *)(v1 + 80);
    v7 = *(_QWORD *)(v1 + 88);
    v8 = *(_QWORD *)(v1 + 96);
    v9 = *(_QWORD *)(v1 + 104);
    v10 = *(_QWORD *)(v1 + 112);
    v12 = *(_QWORD *)(v1 + 120);
    v11 = *(_QWORD *)(v1 + 128);
    v13 = *(_QWORD *)(v1 + 136);
    v14 = *(_BYTE *)(v1 + 144);
    v15 = *(_BYTE *)(v1 + 32);
    v16 = *(_QWORD *)(v1 + 24);
    v3 = *(_QWORD *)v1;
    v20 = *(_OWORD *)(v1 + 8);
  }
  v26 = v3;
  v27 = v20;
  v28 = v16;
  v29 = v15;
  v30 = v5;
  v31 = v17;
  v32 = v18;
  v33 = v19;
  v34 = v6;
  v35 = v7;
  v36 = v8;
  v37 = v9;
  v38 = v10;
  v39 = v12;
  v40 = v11;
  v41 = v13;
  v42 = v14;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)&v26);
  return v3;
}

void IncomingCallTextViewAdapter.displayNameText.setter(uint64_t a1, uint64_t a2)
{
  int v4;
  uint64_t v5;
  char *v6;
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
  char v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  void *v28;
  char v29;
  uint64_t v30;
  id v31;
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
  char v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v46;
  char v47;
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
  uint64_t v60;
  char v61;
  uint64_t v62;
  int64x2_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char v74;
  uint64_t v75;
  uint64_t v76;
  id v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char v88;
  __int128 v89;
  uint64_t v90;
  uint64_t v91;
  int64x2_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  char v102;
  uint64_t v103;
  __int16 v104;
  __int128 v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  __int128 v112;
  __int128 v113;
  uint64_t v114;
  _BYTE v115[7];
  _BYTE v116[7];
  _BYTE v117[7];
  _BYTE v118[304];
  _BYTE v119[304];
  _BYTE v120[304];
  _BYTE v121[304];
  uint64_t v122;
  __int128 v123;
  uint64_t v124;
  char v125;
  uint64_t v126;
  __int128 v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  uint64_t v135;
  uint64_t v136;
  uint64_t v137;
  char v138;
  _QWORD v139[13];
  char v140;
  uint64_t v141;
  uint64_t v142;
  __int128 v143;
  char v144;
  _BYTE v145[7];
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t v158;
  char v159;
  _BYTE v160[7];
  uint64_t v161;
  int64x2_t v162;
  id v163;
  char v164;
  _BYTE v165[7];
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
  char v179;
  __int16 v180;
  _BYTE v181[304];
  _BYTE v182[312];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v182, v181);
  sub_18B7086A4(v181, v182);
  v4 = sub_18B7086E0((uint64_t)v182);
  v5 = sub_18B7086EC((uint64_t)v182);
  if (v4 == 1)
  {
    v6 = (char *)(v5 + 296);
    if ((*(_BYTE *)(v5 + 298) & 1) != 0)
    {
      v8 = *(_QWORD *)(v5 + 152);
      v5 += 152;
      v7 = v8;
      v9 = *(_QWORD *)(v5 + 40);
      v112 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v106 = *(_QWORD *)(v5 + 72);
      v109 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *v6;
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(_QWORD *)(v5 + 24);
    }
    else
    {
      v9 = *(_QWORD *)(v5 + 40);
      v112 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v106 = *(_QWORD *)(v5 + 72);
      v109 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *(_BYTE *)(v5 + 144);
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(_QWORD *)(v5 + 24);
      v7 = *(_QWORD *)v5;
    }
    v105 = *(_OWORD *)(v5 + 8);
    sub_18B708DEC((_QWORD *)v5);
    sub_18B71972C((uint64_t)v181, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v24 = v105;
    v23 = v106;
    v22 = v109;
    v21 = v112;
  }
  else
  {
    v9 = *(_QWORD *)(v5 + 40);
    v21 = *(_OWORD *)(v5 + 48);
    v22 = *(_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v5 + 72);
    v10 = *(_QWORD *)(v5 + 80);
    v11 = *(_QWORD *)(v5 + 88);
    v12 = *(_QWORD *)(v5 + 96);
    v13 = *(_QWORD *)(v5 + 104);
    v14 = *(_QWORD *)(v5 + 112);
    v16 = *(_QWORD *)(v5 + 120);
    v15 = *(_QWORD *)(v5 + 128);
    v17 = *(_QWORD *)(v5 + 136);
    v18 = *(_BYTE *)(v5 + 144);
    v19 = *(_BYTE *)(v5 + 32);
    v20 = *(_QWORD *)(v5 + 24);
    v7 = *(_QWORD *)v5;
    v24 = *(_OWORD *)(v5 + 8);
  }
  v123 = v24;
  v122 = v7;
  v124 = v20;
  v125 = v19;
  v126 = v9;
  v127 = v21;
  v128 = v22;
  v129 = v23;
  v130 = v10;
  v131 = v11;
  v132 = v12;
  v133 = v13;
  v134 = v14;
  v135 = v16;
  v136 = v15;
  v137 = v17;
  v25 = v24;
  v138 = v18;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)&v122);
  if (v7 == a1 && v25 == a2)
  {
    swift_bridgeObjectRelease_n();
  }
  else
  {
    v26 = sub_18B729598();
    swift_bridgeObjectRelease();
    if ((v26 & 1) != 0)
    {
      swift_bridgeObjectRelease();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      sub_18B728FE0();
      swift_release();
      swift_release();
      sub_18B7086A4(&v141, v120);
      sub_18B7086A4(v120, v121);
      if (sub_18B7086E0((uint64_t)v121) == 1)
      {
        v30 = sub_18B7086EC((uint64_t)v121);
        if ((*(_BYTE *)(v30 + 298) & 1) != 0)
        {
          v28 = *(void **)(v30 + 208);
          v29 = *(_BYTE *)(v30 + 184);
          v113 = *(_OWORD *)(v30 + 168);
          v30 += 152;
        }
        else
        {
          v28 = *(void **)(v30 + 56);
          v29 = *(_BYTE *)(v30 + 32);
          v113 = *(_OWORD *)(v30 + 16);
        }
      }
      else
      {
        v27 = sub_18B7086EC((uint64_t)v121);
        v28 = *(void **)(v27 + 56);
        v29 = *(_BYTE *)(v27 + 32);
        v113 = *(_OWORD *)(v27 + 16);
        sub_18B7086A4(v120, &v141);
        v30 = sub_18B7086EC((uint64_t)&v141);
      }
      sub_18B708DEC((_QWORD *)v30);
      swift_bridgeObjectRelease();
      swift_bridgeObjectRetain();
      v31 = *((id *)&v113 + 1);
      sub_18B70A89C(a1, a2, v31, (uint64_t)v139);
      v32 = v139[0];
      v33 = v139[1];
      v34 = v139[2];
      v35 = v139[3];
      v36 = v139[4];
      v37 = v139[5];
      v38 = v139[6];
      v39 = v139[7];
      v40 = v139[8];
      v41 = v139[9];
      v42 = v139[10];
      v107 = v139[12];
      v110 = v139[11];
      v43 = v140;

      swift_bridgeObjectRelease();
      sub_18B7086A4(v120, v119);
      if (sub_18B7086E0((uint64_t)v119) == 1)
      {
        v44 = sub_18B7086EC((uint64_t)v119);
        v45 = *(_QWORD *)v44;
        v46 = *(_OWORD *)(v44 + 16);
        v47 = *(_BYTE *)(v44 + 32);
        *(_DWORD *)v117 = *(_DWORD *)(v44 + 33);
        *(_DWORD *)&v117[3] = *(_DWORD *)(v44 + 36);
        v48 = *(_QWORD *)(v44 + 40);
        v49 = *(_QWORD *)(v44 + 48);
        v50 = *(_QWORD *)(v44 + 56);
        v51 = *(_QWORD *)(v44 + 64);
        v52 = *(_QWORD *)(v44 + 72);
        v53 = *(_QWORD *)(v44 + 80);
        v54 = *(_QWORD *)(v44 + 88);
        v55 = *(_QWORD *)(v44 + 96);
        v56 = *(_QWORD *)(v44 + 104);
        v57 = *(_QWORD *)(v44 + 112);
        v58 = *(_QWORD *)(v44 + 120);
        v59 = *(_QWORD *)(v44 + 128);
        v60 = *(_QWORD *)(v44 + 136);
        v61 = *(_BYTE *)(v44 + 144);
        *(_DWORD *)v116 = *(_DWORD *)(v44 + 145);
        *(_DWORD *)&v116[3] = *(_DWORD *)(v44 + 148);
        v62 = v44 + 152;
        v63 = *(int64x2_t *)(v44 + 160);
        *(_DWORD *)v115 = *(_DWORD *)(v44 + 185);
        *(_DWORD *)&v115[3] = *(_DWORD *)(v44 + 188);
        v104 = *(_WORD *)(v44 + 297);
        v64 = v38;
        v65 = v36;
        v66 = v37;
        v67 = v35;
        v68 = v40;
        v69 = v39;
        v70 = v42;
        v71 = v41;
        v72 = v107;
        v73 = v110;
        if ((*(_BYTE *)(v44 + 298) & 1) != 0)
        {
          v63 = vdupq_lane_s64(v113, 0);
          v63.i64[0] = a2;
          a2 = *(_QWORD *)(v44 + 8);
        }
        else
        {
          v62 = v44;
          v59 = v110;
          v60 = v107;
          v73 = *(_QWORD *)(v44 + 280);
          v72 = *(_QWORD *)(v44 + 288);
          v45 = a1;
          v47 = v29;
          v57 = v71;
          v58 = v70;
          v71 = *(_QWORD *)(v44 + 264);
          v70 = *(_QWORD *)(v44 + 272);
          v48 = v32;
          v49 = v33;
          v55 = v69;
          v56 = v68;
          v69 = *(_QWORD *)(v44 + 248);
          v68 = *(_QWORD *)(v44 + 256);
          v50 = v34;
          v51 = v67;
          v52 = v65;
          v53 = v66;
          v67 = *(_QWORD *)(v44 + 216);
          v65 = *(_QWORD *)(v44 + 224);
          v32 = *(_QWORD *)(v44 + 192);
          v33 = *(_QWORD *)(v44 + 200);
          v54 = v64;
          v61 = v43;
          a1 = *(_QWORD *)(v44 + 152);
          v31 = *(id *)(v44 + 176);
          v29 = *(_BYTE *)(v44 + 184);
          v34 = *(_QWORD *)(v44 + 208);
          v66 = *(_QWORD *)(v44 + 232);
          v64 = *(_QWORD *)(v44 + 240);
          v43 = *(_BYTE *)(v44 + 296);
          v46 = v113;
        }
        v89 = v46;
        v90 = v59;
        v91 = v60;
        v92 = v63;
        v93 = v32;
        v94 = v33;
        v95 = v34;
        v96 = v67;
        v97 = v65;
        v98 = v66;
        v99 = v69;
        v100 = v64;
        v101 = v71;
        v102 = v43;
        v103 = v68;
        v111 = v73;
        v114 = v70;
        v108 = v72;
        v74 = v29;
        v75 = v57;
        v76 = v58;
        v77 = v31;
        v78 = v48;
        v79 = a1;
        v80 = v49;
        v81 = v55;
        v82 = v56;
        v83 = v50;
        v84 = v51;
        v85 = v52;
        v86 = v53;
        v87 = v54;
        v88 = v61;
        sub_18B709000(v62);
        *(_DWORD *)v145 = *(_DWORD *)v117;
        *(_DWORD *)&v145[3] = *(_DWORD *)&v117[3];
        *(_DWORD *)v160 = *(_DWORD *)v116;
        *(_DWORD *)&v160[3] = *(_DWORD *)&v116[3];
        *(_DWORD *)v165 = *(_DWORD *)v115;
        *(_DWORD *)&v165[3] = *(_DWORD *)&v115[3];
        v141 = v45;
        v142 = a2;
        v143 = v89;
        v144 = v47;
        v146 = v78;
        v147 = v80;
        v148 = v83;
        v149 = v84;
        v150 = v85;
        v151 = v86;
        v152 = v87;
        v153 = v81;
        v154 = v82;
        v155 = v75;
        v156 = v76;
        v157 = v90;
        v158 = v91;
        v159 = v88;
        v161 = v79;
        v162 = v92;
        v163 = v77;
        v164 = v74;
        v166 = v93;
        v167 = v94;
        v168 = v95;
        v169 = v96;
        v170 = v97;
        v171 = v98;
        v172 = v100;
        v173 = v99;
        v174 = v103;
        v175 = v101;
        v176 = v114;
        v177 = v111;
        v178 = v108;
        v179 = v102;
        v180 = v104;
        sub_18B719240((uint64_t)&v141);
      }
      else
      {
        sub_18B7086EC((uint64_t)v119);
        sub_18B71972C((uint64_t)v120, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
        v141 = a1;
        v142 = a2;
        v143 = v113;
        v144 = v29;
        v146 = v32;
        v147 = v33;
        v148 = v34;
        v149 = v35;
        v150 = v36;
        v151 = v37;
        v152 = v38;
        v153 = v39;
        v154 = v40;
        v155 = v41;
        v156 = v42;
        v157 = v110;
        v158 = v107;
        v159 = v43;
        sub_18B719288((uint64_t)&v141);
      }
      sub_18B7086A4(&v141, v118);
      sub_18B7086A4(v118, &v141);
      sub_18B719BD4(&v141);
      swift_release();
      IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()();
    }
  }
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()()
{
  uint64_t v0;
  uint64_t v1;
  int v2;
  uint64_t v3;
  char *v4;
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
  char v16;
  char v17;
  uint64_t v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  __int128 v22;
  void *v23;
  int v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  id v47;
  void *v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;
  __int128 v55;
  uint64_t v56;
  char v57;
  uint64_t v58;
  __int128 v59;
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
  char v70;
  _BYTE v71[304];
  _BYTE v72[312];

  v1 = v0;
  v53 = sub_18B7291F0();
  MEMORY[0x1E0C80A78](v53);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v72, v71);
  sub_18B7086A4(v71, v72);
  v2 = sub_18B7086E0((uint64_t)v72);
  v3 = sub_18B7086EC((uint64_t)v72);
  if (v2 == 1)
  {
    v4 = (char *)(v3 + 296);
    if ((*(_BYTE *)(v3 + 298) & 1) != 0)
    {
      v6 = *(_QWORD *)(v3 + 152);
      v3 += 152;
      v5 = v6;
      v7 = *(_QWORD *)(v3 + 40);
      v52 = *(_OWORD *)(v3 + 48);
      v8 = *(_QWORD *)(v3 + 80);
      v50 = *(_QWORD *)(v3 + 72);
      v51 = *(_QWORD *)(v3 + 64);
      v9 = *(_QWORD *)(v3 + 88);
      v10 = *(_QWORD *)(v3 + 96);
      v11 = *(_QWORD *)(v3 + 104);
      v12 = *(_QWORD *)(v3 + 112);
      v14 = *(_QWORD *)(v3 + 120);
      v13 = *(_QWORD *)(v3 + 128);
      v15 = *(_QWORD *)(v3 + 136);
      v16 = *v4;
      v17 = *(_BYTE *)(v3 + 32);
      v18 = *(_QWORD *)(v3 + 24);
    }
    else
    {
      v7 = *(_QWORD *)(v3 + 40);
      v52 = *(_OWORD *)(v3 + 48);
      v8 = *(_QWORD *)(v3 + 80);
      v50 = *(_QWORD *)(v3 + 72);
      v51 = *(_QWORD *)(v3 + 64);
      v9 = *(_QWORD *)(v3 + 88);
      v10 = *(_QWORD *)(v3 + 96);
      v11 = *(_QWORD *)(v3 + 104);
      v12 = *(_QWORD *)(v3 + 112);
      v14 = *(_QWORD *)(v3 + 120);
      v13 = *(_QWORD *)(v3 + 128);
      v15 = *(_QWORD *)(v3 + 136);
      v16 = *(_BYTE *)(v3 + 144);
      v17 = *(_BYTE *)(v3 + 32);
      v18 = *(_QWORD *)(v3 + 24);
      v5 = *(_QWORD *)v3;
    }
    v49 = *(_OWORD *)(v3 + 8);
    sub_18B708DEC((_QWORD *)v3);
    sub_18B71972C((uint64_t)v71, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v22 = v49;
    v21 = v50;
    v20 = v51;
    v19 = v52;
  }
  else
  {
    v7 = *(_QWORD *)(v3 + 40);
    v19 = *(_OWORD *)(v3 + 48);
    v20 = *(_QWORD *)(v3 + 64);
    v21 = *(_QWORD *)(v3 + 72);
    v8 = *(_QWORD *)(v3 + 80);
    v9 = *(_QWORD *)(v3 + 88);
    v10 = *(_QWORD *)(v3 + 96);
    v11 = *(_QWORD *)(v3 + 104);
    v12 = *(_QWORD *)(v3 + 112);
    v14 = *(_QWORD *)(v3 + 120);
    v13 = *(_QWORD *)(v3 + 128);
    v15 = *(_QWORD *)(v3 + 136);
    v16 = *(_BYTE *)(v3 + 144);
    v17 = *(_BYTE *)(v3 + 32);
    v18 = *(_QWORD *)(v3 + 24);
    v5 = *(_QWORD *)v3;
    v22 = *(_OWORD *)(v3 + 8);
  }
  v54 = v5;
  v55 = v22;
  v56 = v18;
  v57 = v17;
  v58 = v7;
  v59 = v19;
  v60 = v20;
  v61 = v21;
  v62 = v8;
  v63 = v9;
  v64 = v10;
  v65 = v11;
  v66 = v12;
  v67 = v14;
  v68 = v13;
  v69 = v15;
  v70 = v16;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)&v54);
  v23 = (void *)sub_18B729358();
  v24 = CEMStringContainsEmoji();
  swift_bridgeObjectRelease();

  v25 = OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController;
  v26 = *(void **)(v1 + OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController);
  if (!v24)
  {
    if (!v26)
      return;
    v47 = objc_msgSend(v26, sel_view);
    if (v47)
    {
      v48 = v47;
      objc_msgSend(v47, sel_removeFromSuperview);

      v36 = *(void **)(v1 + v25);
      *(_QWORD *)(v1 + v25) = 0;
      goto LABEL_17;
    }
LABEL_23:
    __break(1u);
    return;
  }
  if (v26)
    return;
  _s11CoordinatorCMa();
  sub_18B7093B4(&qword_1EDFD54C8, (uint64_t (*)(uint64_t))_s11CoordinatorCMa, (uint64_t)&unk_18B73C390);
  swift_retain();
  sub_18B729070();
  v27 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD55A0));
  v28 = (void *)sub_18B729130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5638);
  *(_OWORD *)(swift_allocObject() + 16) = xmmword_18B73C110;
  sub_18B7291D8();
  sub_18B7291E4();
  sub_18B7093B4((unint64_t *)&unk_1EDFD53D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD0B0], MEMORY[0x1E0CDD0C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD55B8);
  sub_18B719308();
  sub_18B7294C0();
  sub_18B729118();
  v29 = objc_msgSend(v28, sel_view);
  if (!v29)
  {
    __break(1u);
    goto LABEL_20;
  }
  v30 = v29;
  v31 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
  objc_msgSend(v30, sel_setBackgroundColor_, v31);

  v32 = *(void **)(v1 + v25);
  *(_QWORD *)(v1 + v25) = v28;
  v33 = v28;

  v34 = *(void **)(v1 + v25);
  if (!v34)
  {
LABEL_20:
    __break(1u);
    goto LABEL_21;
  }
  v35 = objc_msgSend(v34, sel_view);
  if (!v35)
  {
LABEL_21:
    __break(1u);
    goto LABEL_22;
  }
  v36 = v35;
  v37 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v1
                                                              + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (!v37)
  {
LABEL_22:
    __break(1u);
    goto LABEL_23;
  }
  v38 = v37;
  objc_msgSend(v37, sel_frame);
  v40 = v39;
  v42 = v41;
  v44 = v43;
  v46 = v45;

  objc_msgSend(v36, sel_setFrame_, v40, v42, v44, v46);
LABEL_17:

}

void (*IncomingCallTextViewAdapter.displayNameText.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  char *v3;
  int v4;
  uint64_t v5;
  char *v6;
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
  char v18;
  char v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  __int128 v28;

  v3 = (char *)malloc(0x3A8uLL);
  *a1 = v3;
  *((_QWORD *)v3 + 116) = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v3 + 608, v3 + 304);
  sub_18B7086A4(v3 + 304, v3);
  v4 = sub_18B7086E0((uint64_t)v3);
  v5 = sub_18B7086EC((uint64_t)v3);
  if (v4 == 1)
  {
    v6 = (char *)(v5 + 296);
    if ((*(_BYTE *)(v5 + 298) & 1) != 0)
    {
      v8 = *(_QWORD *)(v5 + 152);
      v5 += 152;
      v7 = v8;
      v9 = *(_QWORD *)(v5 + 40);
      v27 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v25 = *(_QWORD *)(v5 + 72);
      v26 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *v6;
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(_QWORD *)(v5 + 24);
    }
    else
    {
      v9 = *(_QWORD *)(v5 + 40);
      v27 = *(_OWORD *)(v5 + 48);
      v10 = *(_QWORD *)(v5 + 80);
      v25 = *(_QWORD *)(v5 + 72);
      v26 = *(_QWORD *)(v5 + 64);
      v11 = *(_QWORD *)(v5 + 88);
      v12 = *(_QWORD *)(v5 + 96);
      v13 = *(_QWORD *)(v5 + 104);
      v14 = *(_QWORD *)(v5 + 112);
      v16 = *(_QWORD *)(v5 + 120);
      v15 = *(_QWORD *)(v5 + 128);
      v17 = *(_QWORD *)(v5 + 136);
      v18 = *(_BYTE *)(v5 + 144);
      v19 = *(_BYTE *)(v5 + 32);
      v20 = *(_QWORD *)(v5 + 24);
      v7 = *(_QWORD *)v5;
    }
    v28 = *(_OWORD *)(v5 + 8);
    sub_18B708DEC((_QWORD *)v5);
    sub_18B71972C((uint64_t)(v3 + 304), (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v23 = v25;
    v22 = v26;
    v21 = v27;
  }
  else
  {
    v9 = *(_QWORD *)(v5 + 40);
    v21 = *(_OWORD *)(v5 + 48);
    v22 = *(_QWORD *)(v5 + 64);
    v23 = *(_QWORD *)(v5 + 72);
    v10 = *(_QWORD *)(v5 + 80);
    v11 = *(_QWORD *)(v5 + 88);
    v12 = *(_QWORD *)(v5 + 96);
    v13 = *(_QWORD *)(v5 + 104);
    v14 = *(_QWORD *)(v5 + 112);
    v16 = *(_QWORD *)(v5 + 120);
    v15 = *(_QWORD *)(v5 + 128);
    v17 = *(_QWORD *)(v5 + 136);
    v18 = *(_BYTE *)(v5 + 144);
    v19 = *(_BYTE *)(v5 + 32);
    v20 = *(_QWORD *)(v5 + 24);
    v7 = *(_QWORD *)v5;
    v28 = *(_OWORD *)(v5 + 8);
  }
  *((_QWORD *)v3 + 76) = v7;
  *(_OWORD *)(v3 + 616) = v28;
  *((_QWORD *)v3 + 79) = v20;
  v3[640] = v19;
  *((_QWORD *)v3 + 81) = v9;
  *((_OWORD *)v3 + 41) = v21;
  *((_QWORD *)v3 + 84) = v22;
  *((_QWORD *)v3 + 85) = v23;
  *((_QWORD *)v3 + 86) = v10;
  *((_QWORD *)v3 + 87) = v11;
  *((_QWORD *)v3 + 88) = v12;
  *((_QWORD *)v3 + 89) = v13;
  *((_QWORD *)v3 + 90) = v14;
  *((_QWORD *)v3 + 91) = v16;
  *((_QWORD *)v3 + 92) = v15;
  *((_QWORD *)v3 + 93) = v17;
  v3[752] = v18;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)(v3 + 608));
  *((_QWORD *)v3 + 114) = v7;
  *((_QWORD *)v3 + 115) = v28;
  return sub_18B716000;
}

void sub_18B716000(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 912);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 920);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    IncomingCallTextViewAdapter.displayNameText.setter(v3, v4);
    swift_bridgeObjectRelease();
  }
  else
  {
    IncomingCallTextViewAdapter.displayNameText.setter(*(_QWORD *)(*(_QWORD *)a1 + 912), v4);
  }
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.statusText.getter()
{
  uint64_t v0;
  _BYTE v2[152];
  uint64_t v3;
  _BYTE v4[152];
  _BYTE v5[152];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v5, (uint64_t)v4);
  sub_18B700E08((uint64_t)v4, (uint64_t)&v3);
  sub_18B700E08((uint64_t)v4, (uint64_t)v5);
  if (sub_18B708DD4((uint64_t)v5) == 1)
    return 0;
  v0 = v3;
  sub_18B700E08((uint64_t)&v3, (uint64_t)v2);
  swift_bridgeObjectRetain();
  sub_18B719870((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.statusText.setter(uint64_t a1, uint64_t a2)
{
  swift_retain();
  sub_18B71AD60(a1, a2);
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_18B716298(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  swift_retain();
  sub_18B71AD60(v1, v2);
  swift_bridgeObjectRelease();
  return swift_release();
}

void (*IncomingCallTextViewAdapter.statusText.modify(_QWORD *a1))(uint64_t a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v3 = malloc(0x280uLL);
  *a1 = v3;
  v4 = (uint64_t)(v3 + 57);
  v3[78] = v1;
  v3[79] = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)(v3 + 57), (uint64_t)(v3 + 19));
  sub_18B700E08((uint64_t)(v3 + 19), (uint64_t)(v3 + 38));
  sub_18B700E08((uint64_t)(v3 + 19), (uint64_t)v3);
  if (sub_18B708DD4((uint64_t)v3) == 1)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    v5 = v3[38];
    v6 = v3[39];
    sub_18B700E08((uint64_t)(v3 + 38), v4);
    swift_bridgeObjectRetain();
    sub_18B719870(v4, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  }
  v3[76] = v5;
  v3[77] = v6;
  return sub_18B716428;
}

void sub_18B716428(uint64_t a1, char a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;

  v2 = *(void **)a1;
  v3 = *(_QWORD *)(*(_QWORD *)a1 + 608);
  v4 = *(_QWORD *)(*(_QWORD *)a1 + 616);
  if ((a2 & 1) != 0)
  {
    swift_bridgeObjectRetain();
    swift_retain();
    sub_18B71AD60(v3, v4);
    swift_release();
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_retain();
    sub_18B71AD60(v3, v4);
    swift_release();
  }
  swift_bridgeObjectRelease();
  free(v2);
}

uint64_t IncomingCallTextViewAdapter.alignment.getter()
{
  char v0;

  swift_retain();
  v0 = sub_18B71A600();
  swift_release();
  return v0 & 1;
}

uint64_t IncomingCallTextViewAdapter.layout.getter()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v4;

  v0 = sub_18B72922C();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v4 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_retain();
  sub_18B71A988((uint64_t)v2);
  swift_release();
  return sub_18B718EBC(v2);
}

uint64_t IncomingCallTextViewAdapter.displayNameIsSuitableForVerticalLayout.getter()
{
  int v0;
  uint64_t v1;
  char *v2;
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
  char v15;
  uint64_t v16;
  __int128 v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  void *v21;
  uint64_t IsSuitableForVerticalLayout;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  char v31;
  uint64_t v32;
  __int128 v33;
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
  char v44;
  _BYTE v45[304];
  _BYTE v46[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v46, v45);
  sub_18B7086A4(v45, v46);
  v0 = sub_18B7086E0((uint64_t)v46);
  v1 = sub_18B7086EC((uint64_t)v46);
  if (v0 == 1)
  {
    v2 = (char *)(v1 + 296);
    if ((*(_BYTE *)(v1 + 298) & 1) != 0)
    {
      v4 = *(_QWORD *)(v1 + 152);
      v1 += 152;
      v3 = v4;
      v5 = *(_QWORD *)(v1 + 40);
      v27 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v25 = *(_QWORD *)(v1 + 72);
      v26 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *v2;
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(_QWORD *)(v1 + 24);
    }
    else
    {
      v5 = *(_QWORD *)(v1 + 40);
      v27 = *(_OWORD *)(v1 + 48);
      v6 = *(_QWORD *)(v1 + 80);
      v25 = *(_QWORD *)(v1 + 72);
      v26 = *(_QWORD *)(v1 + 64);
      v7 = *(_QWORD *)(v1 + 88);
      v8 = *(_QWORD *)(v1 + 96);
      v9 = *(_QWORD *)(v1 + 104);
      v10 = *(_QWORD *)(v1 + 112);
      v12 = *(_QWORD *)(v1 + 120);
      v11 = *(_QWORD *)(v1 + 128);
      v13 = *(_QWORD *)(v1 + 136);
      v14 = *(_BYTE *)(v1 + 144);
      v15 = *(_BYTE *)(v1 + 32);
      v16 = *(_QWORD *)(v1 + 24);
      v3 = *(_QWORD *)v1;
    }
    v24 = *(_OWORD *)(v1 + 8);
    sub_18B708DEC((_QWORD *)v1);
    sub_18B71972C((uint64_t)v45, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v20 = v24;
    v19 = v25;
    v18 = v26;
    v17 = v27;
  }
  else
  {
    v5 = *(_QWORD *)(v1 + 40);
    v17 = *(_OWORD *)(v1 + 48);
    v18 = *(_QWORD *)(v1 + 64);
    v19 = *(_QWORD *)(v1 + 72);
    v6 = *(_QWORD *)(v1 + 80);
    v7 = *(_QWORD *)(v1 + 88);
    v8 = *(_QWORD *)(v1 + 96);
    v9 = *(_QWORD *)(v1 + 104);
    v10 = *(_QWORD *)(v1 + 112);
    v12 = *(_QWORD *)(v1 + 120);
    v11 = *(_QWORD *)(v1 + 128);
    v13 = *(_QWORD *)(v1 + 136);
    v14 = *(_BYTE *)(v1 + 144);
    v15 = *(_BYTE *)(v1 + 32);
    v16 = *(_QWORD *)(v1 + 24);
    v3 = *(_QWORD *)v1;
    v20 = *(_OWORD *)(v1 + 8);
  }
  v28 = v3;
  v29 = v20;
  v30 = v16;
  v31 = v15;
  v32 = v5;
  v33 = v17;
  v34 = v18;
  v35 = v19;
  v36 = v6;
  v37 = v7;
  v38 = v8;
  v39 = v9;
  v40 = v10;
  v41 = v12;
  v42 = v11;
  v43 = v13;
  v44 = v14;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)&v28);
  v21 = (void *)sub_18B729358();
  IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();
  swift_bridgeObjectRelease();

  return IsSuitableForVerticalLayout;
}

uint64_t IncomingCallTextViewAdapter.statusIsSuitableForVerticalLayout.getter()
{
  uint64_t IsSuitableForVerticalLayout;
  void *v1;
  _BYTE v3[152];
  uint64_t v4;
  _BYTE v5[152];
  _BYTE v6[152];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v6, (uint64_t)v5);
  sub_18B700E08((uint64_t)v5, (uint64_t)&v4);
  sub_18B700E08((uint64_t)v5, (uint64_t)v6);
  if (sub_18B708DD4((uint64_t)v6) == 1)
    return 1;
  sub_18B700E08((uint64_t)&v4, (uint64_t)v3);
  swift_bridgeObjectRetain();
  sub_18B719870((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  v1 = (void *)sub_18B729358();
  IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();
  swift_bridgeObjectRelease();

  return IsSuitableForVerticalLayout;
}

uint64_t IncomingCallTextViewAdapter.marqueeRunning.getter()
{
  return sub_18B716F78();
}

uint64_t IncomingCallTextViewAdapter.marqueeRunning.setter()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B716BA8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18B716C3C()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t (*IncomingCallTextViewAdapter.marqueeRunning.modify(uint64_t a1))(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;

  v3 = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  *(_QWORD *)a1 = v1;
  *(_QWORD *)(a1 + 8) = v3;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  *(_BYTE *)(a1 + 16) = *(_BYTE *)(a1 + 17);
  return sub_18B716D5C;
}

uint64_t sub_18B716D5C(uint64_t a1)
{
  char v2;

  v2 = *(_BYTE *)(a1 + 16);
  swift_getKeyPath();
  swift_getKeyPath();
  *(_BYTE *)(a1 + 17) = v2;
  swift_retain();
  return sub_18B728FEC();
}

BOOL IncomingCallTextViewAdapter.multilineNameIsDisplayed.getter()
{
  _BOOL8 v0;
  _BYTE v2[304];
  _BYTE v3[304];

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v3, v2);
  sub_18B7086A4(v2, v3);
  v0 = sub_18B7086E0((uint64_t)v3) == 1;
  sub_18B7086EC((uint64_t)v3);
  sub_18B71972C((uint64_t)v2, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  return v0;
}

uint64_t IncomingCallTextViewAdapter.callIsActive.getter()
{
  return sub_18B716F78();
}

uint64_t sub_18B716F78()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  return v1;
}

id IncomingCallTextViewAdapter.__allocating_init(name:)()
{
  objc_class *v0;
  id v1;
  void *v2;
  id v3;

  v1 = objc_allocWithZone(v0);
  v2 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  v3 = objc_msgSend(v1, sel_initWithName_status_callIsActive_, v2, 0, 0);

  return v3;
}

id IncomingCallTextViewAdapter.init(name:)()
{
  void *v0;
  void *v1;
  id v2;

  v1 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithName_status_callIsActive_, v1, 0, 0);

  return v2;
}

id IncomingCallTextViewAdapter.__allocating_init(name:status:callIsActive:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  objc_class *v5;
  id v11;
  uint64_t v12;
  id v13;
  id v14;

  v11 = objc_allocWithZone(v5);
  v12 = sub_18B71BCD0(a1, a2, a3, a4, a5 & 1);
  v13 = objc_allocWithZone(v5);
  v14 = sub_18B717668(v12);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v14;
}

id IncomingCallTextViewAdapter.init(name:status:callIsActive:)(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  objc_class *ObjectType;
  uint64_t v11;
  id v12;
  id v13;

  ObjectType = (objc_class *)swift_getObjectType();
  v11 = sub_18B71BCD0(a1, a2, a3, a4, a5 & 1);
  v12 = objc_allocWithZone(ObjectType);
  v13 = sub_18B717668(v11);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v13;
}

id IncomingCallTextViewAdapter.__allocating_init(contact:status:callIsActive:)(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  objc_class *v4;
  id v9;

  v9 = objc_allocWithZone(v4);
  return IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(a1, a2, a3, a4);
}

id IncomingCallTextViewAdapter.init(contact:status:callIsActive:)(void *a1, uint64_t a2, unint64_t a3, int a4)
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _BYTE *v10;
  uint64_t v11;
  _BYTE *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  _BYTE v24[12];
  int v25;
  Class ObjectType;
  _BYTE v27[152];
  _BYTE v28[312];

  v25 = a4;
  ObjectType = (Class)swift_getObjectType();
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = &v24[-((v9 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v8);
  v12 = &v24[-v11];
  v13 = (void *)objc_opt_self();
  v14 = a1;
  v15 = objc_msgSend(v13, sel_labelColor);
  v16 = (void *)objc_opt_self();
  sub_18B700B9C(a2, a3, v15, objc_msgSend(v16, sel_defaultStatusFont), (uint64_t)v27);
  v17 = sub_18B72922C();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v12, 1, 1, v17);
  v18 = v14;
  sub_18B71EB0C(v18, objc_msgSend(v13, sel_labelColor), objc_msgSend(v16, sel_defaultNameFont), v28);

  sub_18B7191F8((uint64_t)v12, (uint64_t)v10);
  _s11CoordinatorCMa();
  swift_allocObject();
  v19 = sub_18B71B6FC(v28, (uint64_t)v27, 2, (uint64_t)v10, v25 & 1);
  sub_18B719870((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  sub_18B71972C((uint64_t)v28, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  sub_18B709714((uint64_t)v12, &qword_1EDFD51D0);
  v20 = *(void **)(v19 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact);
  *(_QWORD *)(v19 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact) = v18;

  v21 = objc_allocWithZone(ObjectType);
  v22 = sub_18B717668(v19);

  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v22;
}

id sub_18B717668(uint64_t a1)
{
  char *v1;
  objc_class *ObjectType;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  uint64_t v10;
  id result;
  void *v12;
  id v13;
  id v14;
  id v15;
  objc_super v16;
  uint64_t v17;
  uint64_t v18;
  char v19;

  ObjectType = (objc_class *)swift_getObjectType();
  v4 = sub_18B7291F0();
  MEMORY[0x1E0C80A78](v4);
  *(_QWORD *)&v1[OBJC_IVAR___PRIncomingCallTextViewAdapter_emojiHostingController] = 0;
  *(_QWORD *)&v1[OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator] = a1;
  _s11CoordinatorCMa();
  sub_18B7093B4(&qword_1EDFD54C8, (uint64_t (*)(uint64_t))_s11CoordinatorCMa, (uint64_t)&unk_18B73C390);
  swift_retain_n();
  v5 = v1;
  sub_18B729070();
  v7 = v6;
  v8 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD55A0));
  v18 = v7;
  v19 = 0;
  v9 = (void *)sub_18B729130();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5638);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_18B73C110;
  sub_18B7291D8();
  sub_18B7291E4();
  v17 = v10;
  sub_18B7093B4((unint64_t *)&unk_1EDFD53D0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDD0B0], MEMORY[0x1E0CDD0C0]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD55B8);
  sub_18B719308();
  sub_18B7294C0();
  sub_18B729118();
  result = objc_msgSend(v9, sel_view);
  if (result)
  {
    v12 = result;
    v13 = objc_msgSend((id)objc_opt_self(), sel_clearColor);
    objc_msgSend(v12, sel_setBackgroundColor_, v13);

    *(_QWORD *)&v5[OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController] = v9;
    v14 = v9;

    v16.receiver = v5;
    v16.super_class = ObjectType;
    v15 = objc_msgSendSuper2(&v16, sel_init);
    IncomingCallTextViewAdapter.setupOrTeardownEmojiTextViewIfNecessary()();

    swift_release();
    return v15;
  }
  else
  {
    __break(1u);
  }
  return result;
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)(UIFont newFont)
{
  uint64_t v2;
  uint64_t v3;
  char *v4;
  int v5;
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
  char v21;
  uint64_t v22;
  __int128 v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  CGFloat v32;
  CTFontRef CopyWithAttributes;
  CGFloat v34;
  CTFontRef v35;
  __int128 v36;
  uint64_t v37;
  uint64_t v38;
  __int128 v39;
  _BYTE v40[152];
  _BYTE v41[152];
  uint64_t v42;
  __int128 v43;
  uint64_t v44;
  char v45;
  uint64_t v46;
  __int128 v47;
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
  char v58;
  _BYTE v59[152];
  _BYTE v60[152];
  _BYTE v61[304];
  _BYTE v62[312];

  v2 = sub_18B72922C();
  MEMORY[0x1E0C80A78](v2);
  v4 = (char *)&v36 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B7086A4(v62, v61);
  sub_18B7086A4(v61, v62);
  v5 = sub_18B7086E0((uint64_t)v62);
  v6 = sub_18B7086EC((uint64_t)v62);
  if (v5 == 1)
  {
    v7 = (char *)(v6 + 296);
    if ((*(_BYTE *)(v6 + 297) & 1) != 0)
    {
      v9 = *(_QWORD *)(v6 + 152);
      v6 += 152;
      v8 = v9;
      v10 = *(_QWORD *)(v6 + 40);
      v39 = *(_OWORD *)(v6 + 48);
      v11 = *(_QWORD *)(v6 + 64);
      v12 = *(_QWORD *)(v6 + 80);
      v37 = *(_QWORD *)(v6 + 72);
      v38 = v11;
      v13 = *(_QWORD *)(v6 + 88);
      v14 = *(_QWORD *)(v6 + 96);
      v15 = *(_QWORD *)(v6 + 104);
      v16 = *(_QWORD *)(v6 + 112);
      v18 = *(_QWORD *)(v6 + 120);
      v17 = *(_QWORD *)(v6 + 128);
      v19 = *(_QWORD *)(v6 + 136);
      v20 = *v7;
      v21 = *(_BYTE *)(v6 + 32);
      v22 = *(_QWORD *)(v6 + 24);
    }
    else
    {
      v10 = *(_QWORD *)(v6 + 40);
      v39 = *(_OWORD *)(v6 + 48);
      v27 = *(_QWORD *)(v6 + 64);
      v12 = *(_QWORD *)(v6 + 80);
      v37 = *(_QWORD *)(v6 + 72);
      v38 = v27;
      v13 = *(_QWORD *)(v6 + 88);
      v14 = *(_QWORD *)(v6 + 96);
      v15 = *(_QWORD *)(v6 + 104);
      v16 = *(_QWORD *)(v6 + 112);
      v18 = *(_QWORD *)(v6 + 120);
      v17 = *(_QWORD *)(v6 + 128);
      v19 = *(_QWORD *)(v6 + 136);
      v20 = *(_BYTE *)(v6 + 144);
      v21 = *(_BYTE *)(v6 + 32);
      v22 = *(_QWORD *)(v6 + 24);
      v8 = *(_QWORD *)v6;
    }
    v36 = *(_OWORD *)(v6 + 8);
    sub_18B708DEC((_QWORD *)v6);
    sub_18B71972C((uint64_t)v61, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v26 = v36;
    v25 = v37;
    v24 = v38;
    v23 = v39;
  }
  else
  {
    v10 = *(_QWORD *)(v6 + 40);
    v23 = *(_OWORD *)(v6 + 48);
    v24 = *(_QWORD *)(v6 + 64);
    v25 = *(_QWORD *)(v6 + 72);
    v12 = *(_QWORD *)(v6 + 80);
    v13 = *(_QWORD *)(v6 + 88);
    v14 = *(_QWORD *)(v6 + 96);
    v15 = *(_QWORD *)(v6 + 104);
    v16 = *(_QWORD *)(v6 + 112);
    v18 = *(_QWORD *)(v6 + 120);
    v17 = *(_QWORD *)(v6 + 128);
    v19 = *(_QWORD *)(v6 + 136);
    v20 = *(_BYTE *)(v6 + 144);
    v21 = *(_BYTE *)(v6 + 32);
    v22 = *(_QWORD *)(v6 + 24);
    v8 = *(_QWORD *)v6;
    v26 = *(_OWORD *)(v6 + 8);
  }
  v42 = v8;
  v43 = v26;
  v44 = v22;
  v45 = v21;
  v46 = v10;
  v47 = v23;
  v48 = v24;
  v49 = v25;
  v50 = v12;
  v51 = v13;
  v52 = v14;
  v53 = v15;
  v54 = v16;
  v55 = v18;
  v56 = v17;
  v57 = v19;
  v58 = v20;
  swift_bridgeObjectRetain();
  sub_18B709000((uint64_t)&v42);
  v28 = (void *)sub_18B729358();
  swift_bridgeObjectRelease();
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v60, (uint64_t)v59);
  sub_18B700E08((uint64_t)v59, (uint64_t)v41);
  sub_18B700E08((uint64_t)v59, (uint64_t)v60);
  if (sub_18B708DD4((uint64_t)v60) == 1)
  {
    v29 = 0;
  }
  else
  {
    sub_18B700E08((uint64_t)v41, (uint64_t)v40);
    swift_bridgeObjectRetain();
    sub_18B719870((uint64_t)v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    v29 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
  }
  v30 = (void *)objc_opt_self();
  swift_retain();
  sub_18B71A988((uint64_t)v4);
  swift_release();
  objc_msgSend(v30, sel_idealEmphasizedFontSizeForName_status_usingLayout_, v28, v29, sub_18B718EBC(v4));
  v32 = v31;

  CopyWithAttributes = CTFontCreateCopyWithAttributes(newFont.super.isa, v32, 0, 0);
  IncomingCallTextViewAdapter.emphasizedNameFont.setter(CopyWithAttributes);
  objc_msgSend(v30, sel_defaultSecondaryNameFontSize);
  v35 = CTFontCreateCopyWithAttributes(newFont.super.isa, v34, 0, 0);
  IncomingCallTextViewAdapter.secondaryNameFont.setter(v35);
  IncomingCallTextViewAdapter.statusFont.setter(objc_msgSend(v30, sel_defaultStatusFont));
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.transitionCallToActiveState(animated:)(Swift::Bool animated)
{
  char v1;

  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  if ((v1 & 1) == 0)
    sub_18B71B088(1);
  swift_release();
}

uint64_t IncomingCallTextViewAdapter.overrideTitleLayout(with:)(uint64_t a1)
{
  return sub_18B717E8C(a1, (uint64_t)"p݉b", (uint64_t)"P݉b");
}

uint64_t sub_18B717E8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BYTE *v19;
  uint64_t v20;
  _BYTE *v21;
  uint64_t v22;
  _QWORD *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _BYTE *v27;
  void (*v28)(_BYTE *, _BYTE *, uint64_t);
  uint64_t v29;
  unsigned int (*v30)(uint64_t, uint64_t, uint64_t);
  _BYTE *v31;
  void (*v32)(_BYTE *, uint64_t, uint64_t);
  _BYTE *v33;
  uint64_t (*v34)(_BYTE *, uint64_t);
  _BYTE *v35;
  uint64_t v36;
  _BYTE v38[12];
  int v39;
  void (*v40)(_BYTE *, _BYTE *, uint64_t);
  _BYTE *v41;
  _BYTE *v42;
  void (*v43)(_BYTE *, _QWORD, uint64_t, uint64_t);
  uint64_t v44;
  uint64_t v45;
  _BYTE *v46;
  _BYTE *v47;
  uint64_t v48;
  uint64_t v49;

  v6 = v3;
  v49 = a1;
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD53E8);
  MEMORY[0x1E0C80A78](v7);
  v9 = &v38[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v11 = MEMORY[0x1E0C80A78](v10);
  v46 = &v38[-((v12 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v13 = MEMORY[0x1E0C80A78](v11);
  v47 = &v38[-v14];
  v15 = MEMORY[0x1E0C80A78](v13);
  v42 = &v38[-v16];
  v17 = MEMORY[0x1E0C80A78](v15);
  v19 = &v38[-v18];
  MEMORY[0x1E0C80A78](v17);
  v21 = &v38[-v20];
  v22 = sub_18B72922C();
  v23 = *(_QWORD **)(v22 - 8);
  v24 = MEMORY[0x1E0C80A78](v22);
  v41 = &v38[-((v25 + 15) & 0xFFFFFFFFFFFFFFF0)];
  MEMORY[0x1E0C80A78](v24);
  v27 = &v38[-v26];
  sub_18B712B78(v49);
  v44 = OBJC_IVAR___PRIncomingCallTextViewAdapter_coordinator;
  v45 = v6;
  v48 = a2;
  swift_getKeyPath();
  v49 = a3;
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v28 = (void (*)(_BYTE *, _BYTE *, uint64_t))v23[2];
  v28(v19, v27, v22);
  v43 = (void (*)(_BYTE *, _QWORD, uint64_t, uint64_t))v23[7];
  v43(v19, 0, 1, v22);
  v29 = (uint64_t)&v9[*(int *)(v7 + 48)];
  sub_18B7191F8((uint64_t)v21, (uint64_t)v9);
  sub_18B7191F8((uint64_t)v19, v29);
  v30 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v23[6];
  if (v30((uint64_t)v9, 1, v22) == 1)
  {
    sub_18B709714((uint64_t)v19, &qword_1EDFD51D0);
    sub_18B709714((uint64_t)v21, &qword_1EDFD51D0);
    if (v30(v29, 1, v22) == 1)
    {
      sub_18B709714((uint64_t)v9, &qword_1EDFD51D0);
LABEL_9:
      v34 = (uint64_t (*)(_BYTE *, uint64_t))v23[1];
      return v34(v27, v22);
    }
    goto LABEL_6;
  }
  v31 = v42;
  sub_18B7191F8((uint64_t)v9, (uint64_t)v42);
  if (v30(v29, 1, v22) == 1)
  {
    sub_18B709714((uint64_t)v19, &qword_1EDFD51D0);
    sub_18B709714((uint64_t)v21, &qword_1EDFD51D0);
    ((void (*)(_BYTE *, uint64_t))v23[1])(v31, v22);
LABEL_6:
    sub_18B709714((uint64_t)v9, &qword_1EDFD53E8);
LABEL_8:
    v36 = (uint64_t)v47;
    v28(v47, v27, v22);
    v43((_BYTE *)v36, 0, 1, v22);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B7191F8(v36, (uint64_t)v46);
    swift_retain_n();
    sub_18B728FEC();
    sub_18B709714(v36, &qword_1EDFD51D0);
    swift_release();
    goto LABEL_9;
  }
  v32 = (void (*)(_BYTE *, uint64_t, uint64_t))v23[4];
  v40 = v28;
  v33 = v41;
  v32(v41, v29, v22);
  sub_18B7093B4(&qword_1EDFD53E0, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDDAD8], MEMORY[0x1E0CDDAF8]);
  v39 = sub_18B72934C();
  v34 = (uint64_t (*)(_BYTE *, uint64_t))v23[1];
  v35 = v33;
  v28 = v40;
  v34(v35, v22);
  sub_18B709714((uint64_t)v19, &qword_1EDFD51D0);
  sub_18B709714((uint64_t)v21, &qword_1EDFD51D0);
  v34(v31, v22);
  sub_18B709714((uint64_t)v9, &qword_1EDFD51D0);
  if ((v39 & 1) == 0)
    goto LABEL_8;
  return v34(v27, v22);
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.removeTitleLayoutOverride()()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  uint64_t v12;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v1 = MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = MEMORY[0x1E0C80A78](v1);
  v6 = (char *)&v12 - v5;
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v12 - v7;
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  swift_release();
  v9 = sub_18B72922C();
  v10 = *(_QWORD *)(v9 - 8);
  v11 = (*(uint64_t (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9);
  sub_18B709714((uint64_t)v8, &qword_1EDFD51D0);
  if (v11 != 1)
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v10 + 56))(v6, 1, 1, v9);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B7191F8((uint64_t)v6, (uint64_t)v3);
    swift_retain_n();
    sub_18B728FEC();
    sub_18B709714((uint64_t)v6, &qword_1EDFD51D0);
    swift_release();
  }
}

CGSize __swiftcall IncomingCallTextViewAdapter.sizeThatFits(in:)(CGSize in)
{
  uint64_t v1;
  id v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = *(id *)(v1 + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController);
  sub_18B72910C();
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

id IncomingCallTextViewAdapter.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)swift_getObjectType();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

Swift::Void __swiftcall IncomingCallTextViewAdapter.posterAppearanceDidChange(_:)(PRPosterAppearance *a1)
{
  UIFont *v2;
  PRPosterColor *v3;
  UIColor *v4;

  v2 = -[PRPosterAppearance font](a1, sel_font);
  IncomingCallTextViewAdapter.setTextFontUsingDefaultFontSizes(newFont:)((UIFont)v2);

  v3 = -[PRPosterAppearance labelColor](a1, sel_labelColor);
  v4 = -[PRPosterColor color](v3, sel_color);

  if (v4)
    IncomingCallTextViewAdapter.textColor.setter(v4);
  IncomingCallTextViewAdapter.preferredAlignment.setter(-[PRPosterAppearance preferredTitleAlignment](a1, sel_preferredTitleAlignment));
  IncomingCallTextViewAdapter.preferredLayout.setter(-[PRPosterAppearance preferredTitleLayout](a1, sel_preferredTitleLayout));
}

void _s9PosterKit27IncomingCallTextViewAdapterC5frameSo6CGRectVvg_0()
{
  uint64_t v0;
  id v1;
  void *v2;

  v1 = objc_retainAutoreleasedReturnValue(objc_msgSend(*(id *)(v0
                                                             + OBJC_IVAR___PRIncomingCallTextViewAdapter_hostingController), sel_view));
  if (v1)
  {
    v2 = v1;
    objc_msgSend(v1, sel_frame);

  }
  else
  {
    __break(1u);
  }
}

void *sub_18B718890@<X0>(void *a1@<X8>)
{
  uint64_t v3;
  _BYTE v4[304];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(&v3, v4);
  return sub_18B7086A4(v4, a1);
}

uint64_t sub_18B718924(const void *a1)
{
  uint64_t v2;
  _BYTE v3[304];

  sub_18B7086A4(a1, v3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B7086A4(v3, &v2);
  sub_18B71972C((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B7189B4@<X0>(uint64_t a1@<X8>)
{
  uint64_t v3;
  _BYTE v4[152];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)&v3, (uint64_t)v4);
  return sub_18B700E08((uint64_t)v4, a1);
}

uint64_t sub_18B718A4C(uint64_t a1)
{
  uint64_t v2;
  _BYTE v3[152];

  sub_18B700E08(a1, (uint64_t)v3);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B700E08((uint64_t)v3, (uint64_t)&v2);
  sub_18B719870((uint64_t)v3, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B718AE8@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18B718B64()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B718BD4()
{
  return sub_18B718C38();
}

uint64_t sub_18B718BE8(uint64_t a1)
{
  return sub_18B718CB0(a1);
}

uint64_t sub_18B718BFC@<X0>(_BYTE *a1@<X8>)
{
  return sub_18B718DBC(a1);
}

uint64_t sub_18B718C10()
{
  return sub_18B718E48();
}

uint64_t sub_18B718C24()
{
  return sub_18B718C38();
}

uint64_t sub_18B718C38()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  return swift_release();
}

uint64_t sub_18B718C9C(uint64_t a1)
{
  return sub_18B718CB0(a1);
}

uint64_t sub_18B718CB0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v9;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v3 = MEMORY[0x1E0C80A78](v2);
  v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v9 - v6;
  sub_18B7191F8(a1, (uint64_t)&v9 - v6);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B7191F8((uint64_t)v7, (uint64_t)v5);
  swift_retain();
  sub_18B728FEC();
  return sub_18B709714((uint64_t)v7, &qword_1EDFD51D0);
}

uint64_t sub_18B718DA8@<X0>(_BYTE *a1@<X8>)
{
  return sub_18B718DBC(a1);
}

uint64_t sub_18B718DBC@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;
  char v3;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  result = swift_release();
  *a1 = v3;
  return result;
}

uint64_t sub_18B718E34()
{
  return sub_18B718E48();
}

uint64_t sub_18B718E48()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B718EBC(char *a1)
{
  uint64_t v2;
  uint64_t (*v3)(uint64_t);
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  void (*v10)(char *, uint64_t);
  char v12;
  uint64_t v13;
  NSObject *v14;
  os_log_type_t v15;
  uint8_t *v16;
  uint64_t v17;

  v2 = sub_18B72922C();
  v3 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CDDAD8];
  v4 = *(_QWORD *)(v2 - 8);
  v5 = MEMORY[0x1E0C80A78](v2);
  v7 = (char *)&v17 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v17 - v8;
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))((char *)&v17 - v8, a1, v2);
  sub_18B729214();
  sub_18B7093B4(&qword_1EDFD53E0, v3, MEMORY[0x1E0CDDAF8]);
  LOBYTE(v3) = sub_18B72934C();
  v10 = *(void (**)(char *, uint64_t))(v4 + 8);
  v10(v7, v2);
  if ((v3 & 1) != 0)
  {
    v10(a1, v2);
    v10(v9, v2);
    return 0;
  }
  else
  {
    sub_18B729208();
    v12 = sub_18B72934C();
    v10(v7, v2);
    v10(v9, v2);
    if ((v12 & 1) == 0)
    {
      if (qword_1EDFD5210 != -1)
        swift_once();
      v13 = sub_18B728FA4();
      __swift_project_value_buffer(v13, (uint64_t)qword_1EDFDA4D0);
      v14 = sub_18B728F98();
      v15 = sub_18B729400();
      if (os_log_type_enabled(v14, v15))
      {
        v16 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_18B634000, v14, v15, "Unrecognized Text.WritingMode; fallback to horizontal.", v16, 2u);
        MEMORY[0x18D77C964](v16, -1, -1);
      }

    }
    v10(a1, v2);
    return 1;
  }
}

unint64_t sub_18B7190D4(unint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  uint8_t *v4;

  if (result >= 2)
  {
    if (qword_1EDFD5210 != -1)
      swift_once();
    v1 = sub_18B728FA4();
    __swift_project_value_buffer(v1, (uint64_t)qword_1EDFDA4D0);
    v2 = sub_18B728F98();
    v3 = sub_18B729400();
    if (os_log_type_enabled(v2, v3))
    {
      v4 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_18B634000, v2, v3, "Unrecognized PRPosterTitleAlignment; fallback to center.", v4, 2u);
      MEMORY[0x18D77C964](v4, -1, -1);
    }

    return 0;
  }
  return result;
}

uint64_t sub_18B7191B0()
{
  return sub_18B718C38();
}

uint64_t sub_18B7191D4(uint64_t a1)
{
  return sub_18B718CB0(a1);
}

uint64_t sub_18B7191F8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_18B719240(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(result + 144) & 1;
  v2 = *(_QWORD *)(result + 184) & 1;
  v3 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(_QWORD *)(result + 32) &= 1uLL;
  *(_QWORD *)(result + 144) = v1;
  *(_QWORD *)(result + 184) = v2;
  *(_WORD *)(result + 296) = v3;
  *(_BYTE *)(result + 298) = (v3 | 0x800000u) >> 16;
  return result;
}

uint64_t sub_18B719288(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;
  int v3;

  v1 = *(_QWORD *)(result + 144) & 1;
  v2 = *(_QWORD *)(result + 184) & 1;
  v3 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(_QWORD *)(result + 32) &= 1uLL;
  *(_QWORD *)(result + 144) = v1;
  *(_QWORD *)(result + 184) = v2;
  *(_WORD *)(result + 296) = v3;
  *(_BYTE *)(result + 298) = BYTE2(v3);
  return result;
}

uint64_t sub_18B7192CC(uint64_t a1, uint64_t a2)
{
  _s7MetricsVwta(a2, a1);
  return a2;
}

unint64_t sub_18B719308()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDFD55C0;
  if (!qword_1EDFD55C0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1EDFD55B8);
    result = MEMORY[0x18D77C8E0](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1EDFD55C0);
  }
  return result;
}

uint64_t sub_18B719354@<X0>(_BYTE *a1@<X8>)
{
  return sub_18B718DBC(a1);
}

uint64_t sub_18B719378()
{
  return sub_18B718E48();
}

uint64_t sub_18B71939C@<X0>(_BYTE *a1@<X8>)
{
  return sub_18B718DBC(a1);
}

uint64_t sub_18B7193C0()
{
  return sub_18B718E48();
}

uint64_t sub_18B7193E4()
{
  return sub_18B718C38();
}

uint64_t sub_18B719408(uint64_t a1)
{
  return sub_18B718CB0(a1);
}

uint64_t sub_18B71942C@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = IncomingCallTextViewAdapter.statusIsHidden.getter();
  *a1 = result & 1;
  return result;
}

void sub_18B719460(double *a1)
{
  IncomingCallTextViewAdapter.frame.setter(*a1, a1[1], a1[2], a1[3]);
}

uint64_t sub_18B719488@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IncomingCallTextViewAdapter.preferredAlignment.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18B7194B0(unint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredAlignment.setter(*a1);
}

uint64_t sub_18B7194D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = IncomingCallTextViewAdapter.preferredLayout.getter();
  *a1 = result;
  return result;
}

uint64_t sub_18B7194FC(uint64_t *a1)
{
  return IncomingCallTextViewAdapter.preferredLayout.setter(*a1);
}

id sub_18B719520@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = IncomingCallTextViewAdapter.textColor.getter();
  *a1 = result;
  return result;
}

void sub_18B719548(id *a1)
{
  IncomingCallTextViewAdapter.textColor.setter(*a1);
}

id sub_18B719570@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = IncomingCallTextViewAdapter.emphasizedNameFont.getter();
  *a1 = result;
  return result;
}

void sub_18B719598(id *a1)
{
  IncomingCallTextViewAdapter.emphasizedNameFont.setter(*a1);
}

id sub_18B7195C0@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = IncomingCallTextViewAdapter.secondaryNameFont.getter();
  *a1 = result;
  return result;
}

void sub_18B7195E8(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  IncomingCallTextViewAdapter.secondaryNameFont.setter(v1);
}

id sub_18B719614@<X0>(_QWORD *a1@<X8>)
{
  id result;

  result = IncomingCallTextViewAdapter.statusFont.getter();
  *a1 = result;
  return result;
}

void sub_18B71963C(id *a1)
{
  id v1;
  id v2;

  v1 = *a1;
  v2 = *a1;
  IncomingCallTextViewAdapter.statusFont.setter(v1);
}

uint64_t sub_18B719668@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = IncomingCallTextViewAdapter.displayNameText.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

void sub_18B719690(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;

  v1 = *a1;
  v2 = a1[1];
  swift_bridgeObjectRetain();
  IncomingCallTextViewAdapter.displayNameText.setter(v1, v2);
}

uint64_t sub_18B7196CC@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = IncomingCallTextViewAdapter.statusText.getter();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t type metadata accessor for IncomingCallTextViewAdapter()
{
  return objc_opt_self();
}

uint64_t method lookup function for IncomingCallTextViewAdapter()
{
  return swift_lookUpClassMethod();
}

uint64_t sub_18B71972C(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))
{
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;

  v6 = *(_OWORD *)(a1 + 256);
  v7 = *(_OWORD *)(a1 + 272);
  v4 = *(_OWORD *)(a1 + 224);
  v5 = *(_OWORD *)(a1 + 240);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(_QWORD *)(a1 + 168),
    *(_QWORD *)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(_QWORD *)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v4,
    *((_QWORD *)&v4 + 1),
    v5,
    *((_QWORD *)&v5 + 1),
    v6,
    *((_QWORD *)&v6 + 1),
    v7,
    *((_QWORD *)&v7 + 1),
    *(_QWORD *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
  return a1;
}

id sub_18B7197C0(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,int a38)
{
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;

  if ((a38 & 0x800000) != 0)
  {
    swift_bridgeObjectRetain();
    v40 = a3;
    v41 = a4;
    swift_bridgeObjectRetain();
    v42 = a8;
    a3 = a22;
    a4 = a23;
    a8 = a27;
  }
  swift_bridgeObjectRetain();
  v43 = a3;
  v44 = a4;
  swift_bridgeObjectRetain();
  return a8;
}

uint64_t sub_18B719870(uint64_t a1, void (*a2)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))
{
  char v4;

  v4 = *(_BYTE *)(a1 + 144);
  a2(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(_QWORD *)(a1 + 16), *(_QWORD *)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), v4);
  return a1;
}

id sub_18B7198D4(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8)
{
  id v10;
  id v11;
  id result;

  if (a2)
  {
    swift_bridgeObjectRetain();
    v10 = a3;
    v11 = a4;
    swift_bridgeObjectRetain();
    return a8;
  }
  return result;
}

uint64_t sub_18B719930@<X0>(uint64_t a1@<X8>)
{
  _BYTE v3[152];
  _BYTE v4[160];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v3, (uint64_t)v4);
  return sub_18B700E08((uint64_t)v4, a1);
}

void (*sub_18B7199B8(_QWORD *a1))(_QWORD *a1)
{
  _QWORD *v2;

  v2 = malloc(0x38uLL);
  *a1 = v2;
  v2[4] = swift_getKeyPath();
  v2[5] = swift_getKeyPath();
  v2[6] = sub_18B728FD4();
  return sub_18B719A30;
}

void sub_18B719A30(_QWORD *a1)
{
  void *v1;

  v1 = (void *)*a1;
  (*(void (**)(_QWORD, _QWORD))(*a1 + 48))(*a1, 0);
  swift_release();
  swift_release();
  free(v1);
}

uint64_t sub_18B719A7C()
{
  return 1;
}

uint64_t sub_18B719A84()
{
  sub_18B7295B0();
  sub_18B7295BC();
  return sub_18B7295D4();
}

uint64_t sub_18B719AC4()
{
  return sub_18B7295BC();
}

uint64_t sub_18B719AE8()
{
  sub_18B7295B0();
  sub_18B7295BC();
  return sub_18B7295D4();
}

const char *sub_18B719B24()
{
  return "SpringBoard";
}

const char *sub_18B719B38()
{
  return "PosterEditorKashida";
}

void *sub_18B719B4C@<X0>(void *a1@<X8>)
{
  _BYTE v3[304];
  _BYTE v4[312];

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(v3, v4);
  return sub_18B7086A4(v4, a1);
}

uint64_t sub_18B719BD4(const void *a1)
{
  uint64_t v1;
  void *v3;
  const void *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  char v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  int v22;
  uint64_t v23;
  char *v24;
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
  char v36;
  char v37;
  void *v38;
  __int128 v39;
  uint64_t v40;
  uint64_t v41;
  __int128 v42;
  id v43;
  char v44;
  uint64_t v46;
  _QWORD *v47;
  void *v48;
  _QWORD *v49;
  _QWORD *v50;
  void *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  char v63;
  id v64;
  void *v65;
  uint64_t v66;
  uint64_t v67;
  id v68;
  uint64_t v69;
  _QWORD *v70;
  id v71;
  id v72;
  __int128 v73;
  uint64_t v74;
  __int128 v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  void *v85;
  _BYTE v86[304];
  _QWORD v87[4];
  char v88;
  uint64_t v89;
  __int128 v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  char v101;
  uint64_t v102;
  __int128 v103;
  void *v104;
  char v105;
  uint64_t v106;
  __int128 v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  uint64_t v119;
  __int128 v120;
  void *v121;
  char v122;
  uint64_t v123;
  __int128 v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  uint64_t v132;
  uint64_t v133;
  uint64_t v134;
  char v135;
  _BYTE v136[304];
  _BYTE v137[304];
  _BYTE v138[304];
  _BYTE v139[304];
  _OWORD __dst[19];
  _BYTE v141[304];
  _BYTE v142[312];

  sub_18B7086A4(a1, v139);
  sub_18B7086A4(v139, v142);
  v3 = *(void **)(v1 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact);
  if (!v3)
    goto LABEL_15;
  sub_18B7086A4(a1, v141);
  if (sub_18B7086E0((uint64_t)v141) == 1)
  {
    v4 = (const void *)sub_18B7086EC((uint64_t)v141);
    memcpy(__dst, v4, 0x12BuLL);
    if ((BYTE10(__dst[18]) & 1) != 0)
    {
      v5 = (_QWORD *)&__dst[9] + 1;
      v6 = *(_QWORD *)&__dst[12];
      v75 = *(_OWORD *)((char *)&__dst[12] + 8);
      v78 = *(_QWORD *)&__dst[14];
      v81 = *((_QWORD *)&__dst[13] + 1);
      v7 = *((_QWORD *)&__dst[14] + 1);
      v9 = *((_QWORD *)&__dst[15] + 1);
      v8 = *(_QWORD *)&__dst[15];
      v10 = *((_QWORD *)&__dst[16] + 1);
      v11 = *(_QWORD *)&__dst[16];
      v13 = *((_QWORD *)&__dst[17] + 1);
      v12 = *(_QWORD *)&__dst[17];
      v14 = *(_QWORD *)&__dst[18];
      v15 = BYTE8(__dst[18]);
      v16 = BYTE8(__dst[11]);
      v17 = *(void **)&__dst[11];
      v18 = *((_QWORD *)&__dst[9] + 1);
      v84 = __dst[10];
    }
    else
    {
      v6 = *((_QWORD *)&__dst[2] + 1);
      v75 = __dst[3];
      v78 = *((_QWORD *)&__dst[4] + 1);
      v81 = *(_QWORD *)&__dst[4];
      v8 = *((_QWORD *)&__dst[5] + 1);
      v7 = *(_QWORD *)&__dst[5];
      v11 = *((_QWORD *)&__dst[6] + 1);
      v9 = *(_QWORD *)&__dst[6];
      v12 = *((_QWORD *)&__dst[7] + 1);
      v10 = *(_QWORD *)&__dst[7];
      v14 = *((_QWORD *)&__dst[8] + 1);
      v13 = *(_QWORD *)&__dst[8];
      v15 = __dst[9];
      v16 = __dst[2];
      v17 = (void *)*((_QWORD *)&__dst[1] + 1);
      v18 = *(_QWORD *)&__dst[0];
      v84 = *(_OWORD *)((char *)__dst + 8);
      v5 = __dst;
    }
  }
  else
  {
    v19 = sub_18B7086EC((uint64_t)v141);
    v18 = *(_QWORD *)v19;
    v84 = *(_OWORD *)(v19 + 8);
    v17 = *(void **)(v19 + 24);
    v75 = *(_OWORD *)(v19 + 48);
    v7 = *(_QWORD *)(v19 + 80);
    v78 = *(_QWORD *)(v19 + 72);
    v81 = *(_QWORD *)(v19 + 64);
    v8 = *(_QWORD *)(v19 + 88);
    v9 = *(_QWORD *)(v19 + 96);
    v11 = *(_QWORD *)(v19 + 104);
    v10 = *(_QWORD *)(v19 + 112);
    v12 = *(_QWORD *)(v19 + 120);
    v13 = *(_QWORD *)(v19 + 128);
    v14 = *(_QWORD *)(v19 + 136);
    v15 = *(_BYTE *)(v19 + 144) & 1;
    v16 = *(_BYTE *)(v19 + 32) & 1;
    v6 = *(_QWORD *)(v19 + 40);
    sub_18B7086A4(v142, __dst);
    v5 = (_QWORD *)sub_18B7086EC((uint64_t)__dst);
  }
  sub_18B708DEC(v5);
  v120 = v84;
  v119 = v18;
  v121 = v17;
  v122 = v16;
  v123 = v6;
  v124 = v75;
  v125 = v81;
  v126 = v78;
  v127 = v7;
  v128 = v8;
  v129 = v9;
  v130 = v11;
  v131 = v10;
  v132 = v12;
  v133 = v13;
  v134 = v14;
  v135 = v15;
  v20 = v17;
  v21 = v3;
  sub_18B709000((uint64_t)&v119);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(__dst, v136);
  sub_18B7086A4(v136, v137);
  v22 = sub_18B7086E0((uint64_t)v137);
  v23 = sub_18B7086EC((uint64_t)v137);
  if (v22 == 1)
  {
    v24 = (char *)(v23 + 296);
    if ((*(_BYTE *)(v23 + 298) & 1) != 0)
    {
      v26 = *(_QWORD *)(v23 + 152);
      v23 += 152;
      v25 = v26;
      v27 = *(_QWORD *)(v23 + 40);
      v82 = *(_OWORD *)(v23 + 48);
      v79 = *(_QWORD *)(v23 + 64);
      v28 = *(_QWORD *)(v23 + 80);
      v76 = *(_QWORD *)(v23 + 72);
      v29 = *(_QWORD *)(v23 + 88);
      v30 = *(_QWORD *)(v23 + 96);
      v31 = *(_QWORD *)(v23 + 104);
      v32 = *(_QWORD *)(v23 + 112);
      v34 = *(_QWORD *)(v23 + 120);
      v33 = *(_QWORD *)(v23 + 128);
      v35 = *(_QWORD *)(v23 + 136);
      v36 = *v24;
      v37 = *(_BYTE *)(v23 + 32);
      v38 = *(void **)(v23 + 24);
    }
    else
    {
      v27 = *(_QWORD *)(v23 + 40);
      v82 = *(_OWORD *)(v23 + 48);
      v79 = *(_QWORD *)(v23 + 64);
      v28 = *(_QWORD *)(v23 + 80);
      v76 = *(_QWORD *)(v23 + 72);
      v29 = *(_QWORD *)(v23 + 88);
      v30 = *(_QWORD *)(v23 + 96);
      v31 = *(_QWORD *)(v23 + 104);
      v32 = *(_QWORD *)(v23 + 112);
      v34 = *(_QWORD *)(v23 + 120);
      v33 = *(_QWORD *)(v23 + 128);
      v35 = *(_QWORD *)(v23 + 136);
      v36 = *(_BYTE *)(v23 + 144);
      v37 = *(_BYTE *)(v23 + 32);
      v38 = *(void **)(v23 + 24);
      v25 = *(_QWORD *)v23;
    }
    v73 = *(_OWORD *)(v23 + 8);
    sub_18B708DEC((_QWORD *)v23);
    sub_18B71972C((uint64_t)v136, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v42 = v73;
    v41 = v76;
    v40 = v79;
    v39 = v82;
  }
  else
  {
    v27 = *(_QWORD *)(v23 + 40);
    v39 = *(_OWORD *)(v23 + 48);
    v40 = *(_QWORD *)(v23 + 64);
    v41 = *(_QWORD *)(v23 + 72);
    v28 = *(_QWORD *)(v23 + 80);
    v29 = *(_QWORD *)(v23 + 88);
    v30 = *(_QWORD *)(v23 + 96);
    v31 = *(_QWORD *)(v23 + 104);
    v32 = *(_QWORD *)(v23 + 112);
    v34 = *(_QWORD *)(v23 + 120);
    v33 = *(_QWORD *)(v23 + 128);
    v35 = *(_QWORD *)(v23 + 136);
    v36 = *(_BYTE *)(v23 + 144);
    v37 = *(_BYTE *)(v23 + 32);
    v38 = *(void **)(v23 + 24);
    v25 = *(_QWORD *)v23;
    v42 = *(_OWORD *)(v23 + 8);
  }
  v103 = v42;
  v102 = v25;
  v104 = v38;
  v105 = v37;
  v106 = v27;
  v107 = v39;
  v108 = v40;
  v109 = v41;
  v110 = v28;
  v111 = v29;
  v112 = v30;
  v113 = v31;
  v114 = v32;
  v115 = v34;
  v116 = v33;
  v117 = v35;
  v118 = v36;
  v43 = v38;
  sub_18B709000((uint64_t)&v102);
  sub_18B71C02C();
  v44 = sub_18B729460();

  if ((v44 & 1) != 0)
  {

LABEL_15:
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B7086A4(a1, __dst);
    swift_retain();
    return sub_18B728FEC();
  }
  sub_18B7086A4(a1, __dst);
  v85 = v21;
  if (sub_18B7086E0((uint64_t)__dst) == 1)
  {
    sub_18B7086EC((uint64_t)__dst);
    sub_18B7086A4(v142, v138);
    v46 = sub_18B7086EC((uint64_t)v138);
    v47 = (_QWORD *)v46;
    v48 = *(void **)(v46 + 16);
    if ((*(_BYTE *)(v46 + 298) & 1) != 0)
    {
      v49 = (_QWORD *)(v46 + 152);
      v67 = *(_QWORD *)(v46 + 152);
      v74 = *(_QWORD *)(v46 + 192);
      v83 = *(_OWORD *)(v46 + 200);
      v80 = *(_QWORD *)(v46 + 216);
      v54 = *(_QWORD *)(v46 + 232);
      v77 = *(_QWORD *)(v46 + 224);
      v55 = *(_QWORD *)(v46 + 240);
      v56 = *(_QWORD *)(v46 + 248);
      v57 = *(_QWORD *)(v46 + 256);
      v58 = *(_QWORD *)(v46 + 264);
      v60 = *(_QWORD *)(v46 + 272);
      v59 = *(_QWORD *)(v46 + 280);
      v61 = *(_QWORD *)(v46 + 288);
      v62 = *(_BYTE *)(v46 + 296);
      v63 = *(_BYTE *)(v46 + 184);
      v64 = *(id *)(v46 + 168);
      v65 = *(void **)(v46 + 176);
      v66 = *(_QWORD *)(v46 + 160);
      v68 = v48;
      v50 = v49;
      v53 = v74;
      sub_18B708DEC(v50);
    }
    else
    {
      v69 = *(_QWORD *)(v46 + 40);
      v83 = *(_OWORD *)(v46 + 48);
      v80 = *(_QWORD *)(v46 + 64);
      v54 = *(_QWORD *)(v46 + 80);
      v77 = *(_QWORD *)(v46 + 72);
      v55 = *(_QWORD *)(v46 + 88);
      v56 = *(_QWORD *)(v46 + 96);
      v57 = *(_QWORD *)(v46 + 104);
      v58 = *(_QWORD *)(v46 + 112);
      v60 = *(_QWORD *)(v46 + 120);
      v59 = *(_QWORD *)(v46 + 128);
      v61 = *(_QWORD *)(v46 + 136);
      v62 = *(_BYTE *)(v46 + 144);
      v63 = *(_BYTE *)(v46 + 32);
      v65 = *(void **)(v46 + 24);
      v67 = *(_QWORD *)v46;
      v66 = *(_QWORD *)(v46 + 8);
      v64 = v48;
      v70 = v47;
      v53 = v69;
      sub_18B708DEC(v70);
      v68 = v64;
    }
  }
  else
  {
    v51 = *(void **)(sub_18B7086EC((uint64_t)__dst) + 16);
    sub_18B7086A4(v142, v138);
    v52 = sub_18B7086EC((uint64_t)v138);
    v53 = *(_QWORD *)(v52 + 40);
    v83 = *(_OWORD *)(v52 + 48);
    v80 = *(_QWORD *)(v52 + 64);
    v54 = *(_QWORD *)(v52 + 80);
    v77 = *(_QWORD *)(v52 + 72);
    v55 = *(_QWORD *)(v52 + 88);
    v56 = *(_QWORD *)(v52 + 96);
    v57 = *(_QWORD *)(v52 + 104);
    v58 = *(_QWORD *)(v52 + 112);
    v60 = *(_QWORD *)(v52 + 120);
    v59 = *(_QWORD *)(v52 + 128);
    v61 = *(_QWORD *)(v52 + 136);
    v62 = *(_BYTE *)(v52 + 144);
    v63 = *(_BYTE *)(v52 + 32);
    v64 = *(id *)(v52 + 16);
    v65 = *(void **)(v52 + 24);
    v67 = *(_QWORD *)v52;
    v66 = *(_QWORD *)(v52 + 8);
    sub_18B71972C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    v68 = v51;
  }
  v87[0] = v67;
  v87[1] = v66;
  v87[2] = v64;
  v87[3] = v65;
  v88 = v63;
  v89 = v53;
  v90 = v83;
  v91 = v80;
  v92 = v77;
  v93 = v54;
  v94 = v55;
  v95 = v56;
  v96 = v57;
  v97 = v58;
  v98 = v60;
  v99 = v59;
  v100 = v61;
  v101 = v62;
  v71 = v85;
  v72 = v65;
  sub_18B709000((uint64_t)v87);
  sub_18B71EB0C(v71, v68, v72, v138);

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B7086A4(v138, v86);
  swift_retain();
  sub_18B71972C((uint64_t)v138, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
  sub_18B728FEC();
  sub_18B71972C((uint64_t)a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);

  return sub_18B71972C((uint64_t)v138, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
}

void (*sub_18B71A2B8(_QWORD *a1))(uint64_t *a1, char a2)
{
  uint64_t v1;
  _QWORD *v3;

  v3 = malloc(0x5F8uLL);
  *a1 = v3;
  v3[190] = v1;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(v3 + 152, v3);
  sub_18B7086A4(v3, v3 + 114);
  return sub_18B71A368;
}

void sub_18B71A368(uint64_t *a1, char a2)
{
  uint64_t v2;
  const void *v3;

  v2 = *a1;
  v3 = (const void *)(*a1 + 912);
  if ((a2 & 1) != 0)
  {
    sub_18B7086A4((const void *)(*a1 + 912), (void *)(v2 + 304));
    sub_18B71972C(v2 + 304, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    sub_18B719BD4((const void *)(v2 + 304));
    sub_18B7086A4(v3, (void *)(v2 + 1216));
    sub_18B71972C(v2 + 1216, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  }
  else
  {
    sub_18B7086A4((const void *)(*a1 + 912), (void *)(v2 + 608));
    sub_18B719BD4((const void *)(v2 + 608));
  }
  free((void *)v2);
}

uint64_t sub_18B71A40C()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18B71A47C()
{
  return sub_18B71A4A4();
}

uint64_t sub_18B71A490()
{
  return sub_18B71A4A4();
}

uint64_t sub_18B71A4A4()
{
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  return swift_release();
}

uint64_t sub_18B71A500()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18B71A570()
{
  return sub_18B71A598();
}

uint64_t sub_18B71A584()
{
  return sub_18B71A598();
}

uint64_t sub_18B71A598()
{
  unsigned __int8 v1;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  return v1;
}

uint64_t sub_18B71A600()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  char v4;
  int v5;
  uint64_t v6;
  void *v7;
  int IsSuitableForArabicJustification;
  double Width;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  double v15;
  double v16;
  _BOOL4 v17;
  double v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  double v24;
  void *v25;
  int v26;
  __int128 v27;
  char v28;
  double v29;
  double v30;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  char v40;
  _BYTE v41[304];
  _QWORD v42[39];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;

  v0 = sub_18B72922C();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v32 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v42[3] = &_s11SpringBoardON;
  v42[4] = sub_18B71C078();
  v4 = sub_18B728F8C();
  __swift_destroy_boxed_opaque_existential_1Tm((uint64_t)v42);
  if ((v4 & 1) == 0)
    return 0;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(&v33, v41);
  sub_18B7086A4(v41, v42);
  v5 = sub_18B7086E0((uint64_t)v42);
  v6 = sub_18B7086EC((uint64_t)v42);
  v7 = (void *)sub_18B729358();
  IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();

  if (v5 == 1)
  {
    if (IsSuitableForArabicJustification)
    {
      objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
      Width = CGRectGetWidth(v50);
      v10 = *(_QWORD *)(v6 + 40);
      v11 = *(_OWORD *)(v6 + 64);
      v34 = *(_OWORD *)(v6 + 48);
      v35 = v11;
      v12 = *(_OWORD *)(v6 + 96);
      v36 = *(_OWORD *)(v6 + 80);
      v37 = v12;
      v13 = *(_OWORD *)(v6 + 128);
      v38 = *(_OWORD *)(v6 + 112);
      v39 = v13;
      v14 = *(_BYTE *)(v6 + 144);
      v33 = v10;
      v40 = v14;
      sub_18B729214();
      sub_18B709CE0((uint64_t)v3, 1.0);
      v16 = v15;
      (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
      if (v16 < Width)
      {
        sub_18B71972C((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
        v17 = 1;
        goto LABEL_12;
      }
    }
    v25 = (void *)sub_18B729358();
    v26 = CTStringIsSuitableForArabicJustification();

    if (v26)
    {
      objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
      v18 = CGRectGetWidth(v52);
      v43 = *(_OWORD *)(v6 + 200);
      v44 = *(_OWORD *)(v6 + 216);
      v45 = *(_OWORD *)(v6 + 232);
      v46 = *(_OWORD *)(v6 + 248);
      v27 = *(_OWORD *)(v6 + 280);
      v47 = *(_OWORD *)(v6 + 264);
      v28 = *(_BYTE *)(v6 + 296);
      v42[38] = *(_QWORD *)(v6 + 192);
      v48 = v27;
      v49 = v28;
      sub_18B729214();
      v24 = 1.0;
      goto LABEL_10;
    }
  }
  else if (IsSuitableForArabicJustification)
  {
    objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
    v18 = CGRectGetWidth(v51);
    v19 = *(_QWORD *)(v6 + 40);
    v20 = *(_OWORD *)(v6 + 64);
    v34 = *(_OWORD *)(v6 + 48);
    v35 = v20;
    v21 = *(_OWORD *)(v6 + 96);
    v36 = *(_OWORD *)(v6 + 80);
    v37 = v21;
    v22 = *(_OWORD *)(v6 + 128);
    v38 = *(_OWORD *)(v6 + 112);
    v39 = v22;
    v23 = *(_BYTE *)(v6 + 144);
    v33 = v19;
    v40 = v23;
    sub_18B729214();
    v24 = 1.0;
LABEL_10:
    sub_18B709CE0((uint64_t)v3, v24);
    v30 = v29;
    (*(void (**)(char *, uint64_t))(v1 + 8))(v3, v0);
    sub_18B71972C((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v17 = v30 < v18;
    goto LABEL_12;
  }
  sub_18B71972C((uint64_t)v41, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  v17 = 0;
LABEL_12:
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  if (HIBYTE(v32) == 2)
  {
    if (!v17)
      return 0;
  }
  else if ((v17 & HIBYTE(v32) & 1) == 0)
  {
    return 0;
  }
  return 1;
}

uint64_t sub_18B71A988@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  char *v16;
  unsigned int (*v17)(char *, uint64_t, uint64_t);
  int v18;
  uint64_t v20;
  void *v21;
  int IsSuitableForVerticalLayout;
  uint64_t v23;
  _BOOL4 v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  void (*v29)(char *, char *, uint64_t);
  char *v30;
  uint64_t v31;
  _BOOL4 IsVertical;
  void (*v33)(char *, uint64_t);
  void (*v34)(char *, uint64_t);
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  char *v39;
  unsigned int (*v40)(uint64_t, uint64_t, uint64_t);
  char *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  _BYTE v45[304];
  _BYTE v46[312];

  v43 = a1;
  v2 = sub_18B72922C();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v41 = (char *)&v35 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v35 - v7;
  MEMORY[0x1E0C80A78](v6);
  v10 = (char *)&v35 - v9;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v12 = MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v35 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v12);
  v16 = (char *)&v35 - v15;
  swift_getKeyPath();
  swift_getKeyPath();
  v42 = v1;
  sub_18B728FE0();
  swift_release();
  swift_release();
  v17 = *(unsigned int (**)(char *, uint64_t, uint64_t))(v3 + 48);
  if (v17(v16, 1, v2) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v3 + 32))(v43, v16, v2);
  v39 = v14;
  v40 = (unsigned int (*)(uint64_t, uint64_t, uint64_t))v17;
  v37 = v10;
  v38 = v2;
  v36 = v8;
  sub_18B71BC90((uint64_t)v16);
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B7086A4(&v44, v45);
  sub_18B7086A4(v45, v46);
  v18 = sub_18B7086E0((uint64_t)v46);
  sub_18B7086EC((uint64_t)v46);
  if (v18 == 1)
  {
    sub_18B71972C((uint64_t)v45, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    return sub_18B729214();
  }
  v20 = v3;
  v21 = (void *)sub_18B729358();
  IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

  if (IsSuitableForVerticalLayout)
  {
    v23 = sub_18B729394();
    v24 = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_maximumVerticalTextLength) >= v23;
  }
  else
  {
    v24 = 0;
  }
  v25 = v41;
  v26 = v38;
  v27 = (uint64_t)v39;
  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  swift_release();
  if (v40(v27, 1, v26) != 1)
  {
    v28 = v37;
    (*(void (**)(char *, uint64_t, uint64_t))(v20 + 32))(v37, v27, v26);
    v29 = *(void (**)(char *, char *, uint64_t))(v20 + 16);
    v30 = v36;
    v29(v36, v28, v26);
    if (v24)
    {
      v29(v25, v30, v26);
      v31 = sub_18B718EBC(v25);
      IsVertical = PRPosterTitleLayoutIsVertical(v31);
      v33 = *(void (**)(char *, uint64_t))(v20 + 8);
      v33(v30, v26);
      v33(v28, v26);
      if (IsVertical)
        goto LABEL_13;
    }
    else
    {
      v34 = *(void (**)(char *, uint64_t))(v20 + 8);
      v34(v30, v26);
      v34(v28, v26);
    }
LABEL_15:
    sub_18B729214();
    return sub_18B71972C((uint64_t)v45, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  }
  sub_18B71BC90(v27);
  if (!v24)
    goto LABEL_15;
LABEL_13:
  sub_18B729208();
  return sub_18B71972C((uint64_t)v45, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
}

uint64_t sub_18B71AD60(uint64_t a1, uint64_t a2)
{
  _BYTE *v4;
  void (*v5)(_QWORD *);
  uint64_t v6;
  _QWORD *v7;
  id v8;
  id v9;
  id v10;
  void *v12;
  _QWORD v13[19];
  _QWORD v14[4];
  char v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[304];
  _BYTE v25[304];
  _BYTE v26[152];
  _BYTE v27[152];
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char v35;

  if (!a2)
  {
    sub_18B700DE8((uint64_t)v25);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B700E08((uint64_t)v25, (uint64_t)v24);
    swift_retain();
    return sub_18B728FEC();
  }
  swift_getKeyPath();
  swift_getKeyPath();
  swift_bridgeObjectRetain();
  sub_18B728FE0();
  swift_release();
  swift_release();
  sub_18B700E08((uint64_t)v25, (uint64_t)v26);
  sub_18B719870((uint64_t)v26, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  sub_18B700E08((uint64_t)v26, (uint64_t)v27);
  if (sub_18B708DD4((uint64_t)v27) == 1)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B728FE0();
    swift_release();
    swift_release();
    sub_18B7086A4(v25, v24);
    sub_18B7086A4(v24, v25);
    if (sub_18B7086E0((uint64_t)v25) == 1)
    {
      sub_18B7086EC((uint64_t)v25);
      sub_18B7086A4(v24, v14);
      v4 = v14;
    }
    else
    {
      v4 = v25;
    }
    v8 = *(id *)(sub_18B7086EC((uint64_t)v4) + 16);
    sub_18B71972C((uint64_t)v24, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    v9 = objc_msgSend((id)objc_opt_self(), sel_defaultStatusFont);
    swift_bridgeObjectRetain();
    v10 = v9;
    sub_18B70A89C(a1, a2, v10, (uint64_t)&v28);
    v14[0] = a1;
    v14[1] = a2;
    v14[2] = v8;
    v14[3] = v10;
    v15 = 0;
    v16 = v28;
    v17 = v29;
    v18 = v30;
    v19 = v31;
    v20 = v32;
    v21 = v33;
    v22 = v34;
    v23 = v35;
    nullsub_1(v14);
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B700E08((uint64_t)v14, (uint64_t)v13);
    swift_retain();
    return sub_18B728FEC();
  }
  v5 = sub_18B7199B8(v13);
  v7 = (_QWORD *)v6;
  sub_18B700E08(v6, (uint64_t)v24);
  sub_18B700E08((uint64_t)v24, (uint64_t)v25);
  if (sub_18B708DD4((uint64_t)v25) == 1)
  {
    swift_bridgeObjectRelease();
  }
  else
  {
    swift_bridgeObjectRelease();
    *v7 = a1;
    v7[1] = a2;
    v12 = (void *)v7[3];
    swift_bridgeObjectRetain();
    sub_18B70A89C(a1, a2, v12, (uint64_t)v14);
    sub_18B7192CC((uint64_t)v14, (uint64_t)(v7 + 5));
  }
  return ((uint64_t (*)(_QWORD *, _QWORD))v5)(v13, 0);
}

uint64_t sub_18B71B088(char a1)
{
  uint64_t result;
  uint64_t v3;
  char v4;
  unsigned __int8 v5;

  swift_getKeyPath();
  swift_getKeyPath();
  sub_18B728FE0();
  swift_release();
  result = swift_release();
  if (((((a1 & 1) == 0) ^ v5) & 1) == 0)
  {
    swift_getKeyPath();
    swift_getKeyPath();
    swift_retain();
    sub_18B728FEC();
    swift_getKeyPath();
    swift_getKeyPath();
    sub_18B728FE0();
    swift_release();
    v3 = swift_release();
    if (v4 == 1)
    {
      MEMORY[0x1E0C80A78](v3);
      sub_18B729310();
      sub_18B729064();
      return swift_release();
    }
    else
    {
      swift_getKeyPath();
      swift_getKeyPath();
      swift_retain();
      return sub_18B728FEC();
    }
  }
  return result;
}

uint64_t sub_18B71B254()
{
  swift_getKeyPath();
  swift_getKeyPath();
  swift_retain();
  return sub_18B728FEC();
}

uint64_t sub_18B71B2CC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t);

  v1 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5230);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  v3 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator___nameStyle;
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(v3, v4);
  v5 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5240);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v5, v6);
  v7 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5218);
  v9 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 8);
  v9(v7, v8);
  v9(v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__overrideWritingMode, v8);
  v10 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__callState;
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD4E60);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 8))(v10, v11);
  v12 = v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__animationsEnabled;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5258);
  v14 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8);
  v14(v12, v13);
  v14(v0 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__marqueeRunning, v13);

  return swift_deallocClassInstance();
}

uint64_t sub_18B71B444()
{
  return _s11CoordinatorCMa();
}

uint64_t _s11CoordinatorCMa()
{
  uint64_t result;

  result = qword_1EDFD54D0;
  if (!qword_1EDFD54D0)
    return swift_getSingletonMetadata();
  return result;
}

void sub_18B71B488()
{
  unint64_t v0;
  unint64_t v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  sub_18B71B5E8(319, &qword_1EDFD5238, &qword_1EDFD5510);
  if (v0 <= 0x3F)
  {
    sub_18B71B634(319, &qword_1EDFD5250);
    if (v1 <= 0x3F)
    {
      sub_18B71B5E8(319, &qword_1EDFD5248, qword_1EDFD5518);
      if (v2 <= 0x3F)
      {
        sub_18B71B5E8(319, &qword_1EDFD5220, &qword_1EDFD51D0);
        if (v3 <= 0x3F)
        {
          sub_18B71B634(319, &qword_1EDFD5228);
          if (v4 <= 0x3F)
          {
            sub_18B71B634(319, &qword_1EDFD5260);
            if (v5 <= 0x3F)
              swift_updateClassMetadata2();
          }
        }
      }
    }
  }
}

void sub_18B71B5E8(uint64_t a1, unint64_t *a2, uint64_t *a3)
{
  unint64_t v4;
  uint64_t v5;

  if (!*a2)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(a3);
    v4 = sub_18B728FF8();
    if (!v5)
      atomic_store(v4, a2);
  }
}

void sub_18B71B634(uint64_t a1, unint64_t *a2)
{
  unint64_t v3;
  uint64_t v4;

  if (!*a2)
  {
    v3 = sub_18B728FF8();
    if (!v4)
      atomic_store(v3, a2);
  }
}

uint64_t sub_18B71B678()
{
  return MEMORY[0x1E0C96020];
}

uint64_t sub_18B71B684@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  _s11CoordinatorCMa();
  result = sub_18B728FBC();
  *a1 = result;
  return result;
}

uint64_t sub_18B71B6E0()
{
  return sub_18B71B254();
}

uint64_t sub_18B71B6FC(const void *a1, uint64_t a2, int a3, uint64_t a4, char a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  char *v29;
  void (*v30)(uint64_t, char *, uint64_t);
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  uint64_t v37;
  void (*v38)(uint64_t, char *, uint64_t);
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  char *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v61;
  uint64_t v62;
  uint64_t v63;
  const void *v64;
  uint64_t v65;
  int v66;
  uint64_t v67;
  int v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  _BYTE v72[304];
  char v73;
  _BYTE v74[160];

  v67 = a4;
  v66 = a3;
  v64 = a1;
  v65 = a2;
  v68 = a5 & 1;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5258);
  v62 = *(_QWORD *)(v6 - 8);
  v63 = v6;
  MEMORY[0x1E0C80A78](v6);
  v61 = (char *)&v47 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v51 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5218);
  v71 = *(_QWORD *)(v51 - 8);
  MEMORY[0x1E0C80A78](v51);
  v50 = (char *)&v47 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v9 = MEMORY[0x1E0C80A78](v69);
  v70 = (uint64_t)&v47 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v47 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5240);
  v14 = *(_QWORD *)(v13 - 8);
  v57 = v13;
  v58 = v14;
  v15 = v14;
  MEMORY[0x1E0C80A78](v13);
  v17 = (char *)&v47 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5230);
  v19 = *(_QWORD *)(v18 - 8);
  v55 = v18;
  v56 = v19;
  MEMORY[0x1E0C80A78](v18);
  v21 = (char *)&v47 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  v52 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__status;
  sub_18B700DE8((uint64_t)v74);
  sub_18B700E08((uint64_t)v74, (uint64_t)v72);
  v59 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5510);
  sub_18B728FC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v19 + 32))(v22, v21, v18);
  v23 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  v54 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredTextAlignment;
  v49 = v5;
  v72[0] = 2;
  v60 = __swift_instantiateConcreteTypeFromMangledName(qword_1EDFD5518);
  sub_18B728FC8();
  (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v23, v17, v13);
  v24 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  v53 = v5 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__preferredWritingMode;
  v25 = sub_18B72922C();
  v26 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v25 - 8) + 56);
  v27 = (uint64_t)v12;
  v26(v12, 1, 1, v25);
  v28 = v70;
  sub_18B7191F8((uint64_t)v12, v70);
  v29 = v50;
  sub_18B728FC8();
  sub_18B71BC90(v27);
  v30 = *(void (**)(uint64_t, char *, uint64_t))(v71 + 32);
  v31 = v24;
  v32 = v51;
  v30(v31, v29, v51);
  v33 = v49;
  v48 = v49 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__overrideWritingMode;
  v26((char *)v27, 1, 1, v25);
  sub_18B7191F8(v27, v28);
  sub_18B728FC8();
  v34 = v27;
  sub_18B71BC90(v27);
  v30(v48, v29, v32);
  v35 = v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__animationsEnabled;
  v72[0] = 1;
  v36 = v61;
  sub_18B728FC8();
  v37 = v63;
  v38 = *(void (**)(uint64_t, char *, uint64_t))(v62 + 32);
  v38(v35, v36, v63);
  v39 = v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator__marqueeRunning;
  v72[0] = 1;
  sub_18B728FC8();
  v38(v39, v36, v37);
  *(_QWORD *)(v33 + OBJC_IVAR____TtCV9PosterKit20IncomingCallTextView11Coordinator_contact) = 0;
  swift_beginAccess();
  v40 = (uint64_t)v64;
  sub_18B7086A4(v64, v72);
  sub_18B71972C(v40, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
  sub_18B728FC8();
  swift_endAccess();
  v41 = v52;
  swift_beginAccess();
  v42 = v65;
  sub_18B719870(v65, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
  (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v41, v55);
  sub_18B700E08(v42, (uint64_t)v72);
  sub_18B728FC8();
  swift_endAccess();
  v43 = v54;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v58 + 8))(v43, v57);
  v73 = v66;
  sub_18B728FC8();
  swift_endAccess();
  v44 = v67;
  sub_18B7191F8(v67, v34);
  v45 = v53;
  swift_beginAccess();
  (*(void (**)(uint64_t, uint64_t))(v71 + 8))(v45, v32);
  sub_18B7191F8(v34, v70);
  sub_18B728FC8();
  sub_18B71BC90(v34);
  swift_endAccess();
  swift_beginAccess();
  v73 = v68;
  sub_18B728FC8();
  swift_endAccess();
  sub_18B71BC90(v44);
  return v33;
}

uint64_t sub_18B71BC90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_18B71BCD0(uint64_t a1, uint64_t a2, uint64_t a3, unint64_t a4, char a5)
{
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v31;
  uint64_t v32;
  int v33;
  uint64_t v34;
  char *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _OWORD v46[9];
  char v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  char v55;
  _BYTE v56[152];
  _BYTE v57[320];

  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD51D0);
  v11 = MEMORY[0x1E0C80A78](v10);
  v34 = (uint64_t)&v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v11);
  v35 = (char *)&v31 - v13;
  v14 = (void *)sub_18B729358();
  v32 = a3;
  if (a4)
  {
    swift_bridgeObjectRetain();
    v15 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
  }
  else
  {
    v15 = 0;
  }
  v33 = a5 & 1;
  v16 = (void *)objc_opt_self();
  objc_msgSend(v16, sel_idealEmphasizedFontSizeForName_status_usingLayout_, v14, v15, 0);
  v18 = v17;

  v19 = objc_msgSend(v16, sel_defaultNameFont);
  v20 = objc_msgSend(v19, sel_fontWithSize_, v18);

  v21 = (void *)objc_opt_self();
  v22 = objc_msgSend(v21, sel_labelColor);
  v23 = v20;
  swift_bridgeObjectRetain();
  sub_18B70A89C(a1, a2, v23, (uint64_t)&v48);
  *(_QWORD *)&v36 = a1;
  *((_QWORD *)&v36 + 1) = a2;
  *(_QWORD *)&v37 = v22;
  *((_QWORD *)&v37 + 1) = v23;
  LOBYTE(v38) = 0;
  *((_QWORD *)&v38 + 1) = v48;
  v39 = v49;
  v40 = v50;
  v41 = v51;
  v42 = v52;
  v43 = v53;
  v44 = v54;
  v45 = v55;
  v24 = objc_msgSend(v21, sel_secondaryLabelColor);
  v25 = objc_msgSend(v16, sel_defaultStatusFont);
  sub_18B700B9C(v32, a4, v24, v25, (uint64_t)v56);
  v26 = sub_18B72922C();
  v27 = (uint64_t)v35;
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v26 - 8) + 56))(v35, 1, 1, v26);
  v46[6] = v42;
  v46[7] = v43;
  v46[8] = v44;
  v47 = v45;
  v46[2] = v38;
  v46[3] = v39;
  v46[4] = v40;
  v46[5] = v41;
  v46[0] = v36;
  v46[1] = v37;
  sub_18B719288((uint64_t)v46);
  sub_18B7086A4(v46, v57);
  v28 = v34;
  sub_18B7191F8(v27, v34);
  _s11CoordinatorCMa();
  swift_allocObject();
  v29 = sub_18B71B6FC(v57, (uint64_t)v56, 2, v28, v33);
  sub_18B719870((uint64_t)v56, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  sub_18B709000((uint64_t)&v36);
  sub_18B71BC90(v27);

  return v29;
}

unint64_t sub_18B71C02C()
{
  unint64_t result;

  result = qword_1EDFD5600;
  if (!qword_1EDFD5600)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1EDFD5600);
  }
  return result;
}

unint64_t sub_18B71C078()
{
  unint64_t result;

  result = qword_1EDFD54E0;
  if (!qword_1EDFD54E0)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73C67C, &_s11SpringBoardON);
    atomic_store(result, (unint64_t *)&qword_1EDFD54E0);
  }
  return result;
}

uint64_t _s11SpringBoardOwet(unsigned int *a1, int a2)
{
  int v2;
  int v3;

  if (!a2)
    return 0;
  if ((a2 + 1) >= 0x10000)
    v2 = 4;
  else
    v2 = 2;
  if ((a2 + 1) < 0x100)
    v3 = 1;
  else
    v3 = v2;
  if (v3 == 4)
    return *a1;
  if (v3 == 2)
    return *(unsigned __int16 *)a1;
  return *(unsigned __int8 *)a1;
}

uint64_t _s11SpringBoardOwst(uint64_t a1, int a2, int a3)
{
  int v3;
  uint64_t v4;

  if ((a3 + 1) >= 0x10000)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) < 0x100)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3)
    v4 = v4;
  else
    v4 = 0;
  if (a2)
    return ((uint64_t (*)(void))((char *)sub_18B71C150 + 4 * byte_18B73C360[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_18B71C170 + 4 * byte_18B73C365[v4]))();
}

_BYTE *sub_18B71C150(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_18B71C170(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B71C178(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B71C180(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_18B71C188(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_18B71C190(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_18B71C19C()
{
  return 0;
}

ValueMetadata *_s11SpringBoardOMa()
{
  return &_s11SpringBoardON;
}

unint64_t sub_18B71C1B8()
{
  unint64_t result;

  result = qword_1EDFD9210;
  if (!qword_1EDFD9210)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73C654, &_s11SpringBoardON);
    atomic_store(result, (unint64_t *)&qword_1EDFD9210);
  }
  return result;
}

void _s9NameStyleOwxx(uint64_t a1)
{
  __int128 v1;
  __int128 v2;
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)(a1 + 256);
  v4 = *(_OWORD *)(a1 + 272);
  v1 = *(_OWORD *)(a1 + 224);
  v2 = *(_OWORD *)(a1 + 240);
  sub_18B708920(*(_QWORD *)a1, *(_QWORD *)(a1 + 8), *(void **)(a1 + 16), *(void **)(a1 + 24), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(void **)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 112), *(_QWORD *)(a1 + 120), *(_QWORD *)(a1 + 128), *(_QWORD *)(a1 + 136), *(_QWORD *)(a1 + 144),
    *(_QWORD *)(a1 + 152),
    *(_QWORD *)(a1 + 160),
    *(void **)(a1 + 168),
    *(void **)(a1 + 176),
    *(_QWORD *)(a1 + 184),
    *(_QWORD *)(a1 + 192),
    *(_QWORD *)(a1 + 200),
    *(void **)(a1 + 208),
    *(_QWORD *)(a1 + 216),
    v1,
    *((uint64_t *)&v1 + 1),
    v2,
    *((uint64_t *)&v2 + 1),
    v3,
    *((uint64_t *)&v3 + 1),
    v4,
    *((uint64_t *)&v4 + 1),
    *(_QWORD *)(a1 + 288),
    *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16));
}

uint64_t _s9NameStyleOwcp(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
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
  int v37;
  int v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;

  v41 = *(_QWORD *)(a2 + 72);
  v42 = *(_QWORD *)(a2 + 64);
  v39 = *(_QWORD *)(a2 + 88);
  v40 = *(_QWORD *)(a2 + 80);
  v13 = *(_QWORD *)(a2 + 96);
  v14 = *(_QWORD *)(a2 + 104);
  v15 = *(_QWORD *)(a2 + 112);
  v16 = *(_QWORD *)(a2 + 120);
  v17 = *(_QWORD *)(a2 + 128);
  v18 = *(_QWORD *)(a2 + 136);
  v19 = *(_QWORD *)(a2 + 144);
  v20 = *(_QWORD *)(a2 + 152);
  v21 = *(_QWORD *)(a2 + 160);
  v22 = *(void **)(a2 + 168);
  v3 = *(_QWORD *)(a2 + 192);
  v23 = *(void **)(a2 + 176);
  v24 = *(_QWORD *)(a2 + 184);
  v25 = *(_QWORD *)(a2 + 200);
  v26 = *(void **)(a2 + 208);
  v27 = *(_QWORD *)(a2 + 216);
  v28 = *(_QWORD *)(a2 + 224);
  v29 = *(_QWORD *)(a2 + 232);
  v30 = *(_QWORD *)(a2 + 240);
  v31 = *(_QWORD *)(a2 + 248);
  v32 = *(_QWORD *)(a2 + 256);
  v33 = *(_QWORD *)(a2 + 264);
  v34 = *(_QWORD *)(a2 + 272);
  v35 = *(_QWORD *)(a2 + 280);
  v36 = *(_QWORD *)(a2 + 288);
  v37 = *(unsigned __int8 *)(a2 + 298);
  v38 = *(unsigned __int16 *)(a2 + 296);
  v5 = *(_QWORD *)(a2 + 8);
  v4 = *(_QWORD *)a2;
  v7 = *(void **)(a2 + 24);
  v6 = *(void **)(a2 + 16);
  v9 = *(_QWORD *)(a2 + 40);
  v8 = *(_QWORD *)(a2 + 32);
  v11 = *(void **)(a2 + 56);
  v10 = *(_QWORD *)(a2 + 48);
  sub_18B7197C0(*(_QWORD *)a2, v5, v6, v7, v8, v9, v10, v11, v42, v41, v40, v39, v13, v14, v15, v16, v17, v18, v19,
    v20,
    v21,
    v22,
    v23,
    v24,
    v3,
    v25,
    v26,
    v27,
    v28,
    v29,
    v30,
    v31,
    v32,
    v33,
    v34,
    v35,
    v36,
    v38 | (v37 << 16));
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v5;
  *(_QWORD *)(a1 + 16) = v6;
  *(_QWORD *)(a1 + 24) = v7;
  *(_QWORD *)(a1 + 32) = v8;
  *(_QWORD *)(a1 + 40) = v9;
  *(_QWORD *)(a1 + 48) = v10;
  *(_QWORD *)(a1 + 56) = v11;
  *(_QWORD *)(a1 + 64) = v42;
  *(_QWORD *)(a1 + 72) = v41;
  *(_QWORD *)(a1 + 80) = v40;
  *(_QWORD *)(a1 + 88) = v39;
  *(_QWORD *)(a1 + 96) = v13;
  *(_QWORD *)(a1 + 104) = v14;
  *(_QWORD *)(a1 + 112) = v15;
  *(_QWORD *)(a1 + 120) = v16;
  *(_QWORD *)(a1 + 128) = v17;
  *(_QWORD *)(a1 + 136) = v18;
  *(_QWORD *)(a1 + 144) = v19;
  *(_QWORD *)(a1 + 152) = v20;
  *(_QWORD *)(a1 + 160) = v21;
  *(_QWORD *)(a1 + 168) = v22;
  *(_QWORD *)(a1 + 176) = v23;
  *(_QWORD *)(a1 + 184) = v24;
  *(_QWORD *)(a1 + 192) = v3;
  *(_QWORD *)(a1 + 200) = v25;
  *(_QWORD *)(a1 + 208) = v26;
  *(_QWORD *)(a1 + 216) = v27;
  *(_QWORD *)(a1 + 224) = v28;
  *(_QWORD *)(a1 + 232) = v29;
  *(_QWORD *)(a1 + 240) = v30;
  *(_QWORD *)(a1 + 248) = v31;
  *(_QWORD *)(a1 + 256) = v32;
  *(_QWORD *)(a1 + 264) = v33;
  *(_QWORD *)(a1 + 272) = v34;
  *(_QWORD *)(a1 + 280) = v35;
  *(_QWORD *)(a1 + 288) = v36;
  *(_BYTE *)(a1 + 298) = v37;
  *(_WORD *)(a1 + 296) = v38;
  return a1;
}

uint64_t _s9NameStyleOwca(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  __int128 v21;
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
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  int v53;
  int v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;

  v65 = *(_QWORD *)a2;
  v66 = *(_QWORD *)(a2 + 8);
  v63 = *(void **)(a2 + 24);
  v64 = *(void **)(a2 + 16);
  v61 = *(_QWORD *)(a2 + 40);
  v62 = *(_QWORD *)(a2 + 32);
  v59 = *(void **)(a2 + 56);
  v60 = *(_QWORD *)(a2 + 48);
  v57 = *(_QWORD *)(a2 + 72);
  v58 = *(_QWORD *)(a2 + 64);
  v55 = *(_QWORD *)(a2 + 88);
  v56 = *(_QWORD *)(a2 + 80);
  v37 = *(_QWORD *)(a2 + 96);
  v38 = *(_QWORD *)(a2 + 104);
  v3 = *(_QWORD *)(a2 + 128);
  v39 = *(_QWORD *)(a2 + 112);
  v40 = *(_QWORD *)(a2 + 120);
  v4 = *(_QWORD *)(a2 + 136);
  v5 = *(_QWORD *)(a2 + 144);
  v6 = *(_QWORD *)(a2 + 152);
  v7 = *(_QWORD *)(a2 + 160);
  v8 = *(void **)(a2 + 168);
  v9 = *(void **)(a2 + 176);
  v10 = *(_QWORD *)(a2 + 184);
  v11 = *(_QWORD *)(a2 + 192);
  v41 = *(_QWORD *)(a2 + 200);
  v42 = *(void **)(a2 + 208);
  v43 = *(_QWORD *)(a2 + 216);
  v44 = *(_QWORD *)(a2 + 224);
  v45 = *(_QWORD *)(a2 + 232);
  v46 = *(_QWORD *)(a2 + 240);
  v47 = *(_QWORD *)(a2 + 248);
  v48 = *(_QWORD *)(a2 + 256);
  v49 = *(_QWORD *)(a2 + 264);
  v50 = *(_QWORD *)(a2 + 272);
  v51 = *(_QWORD *)(a2 + 280);
  v52 = *(_QWORD *)(a2 + 288);
  v53 = *(unsigned __int8 *)(a2 + 298);
  v54 = *(unsigned __int16 *)(a2 + 296);
  sub_18B7197C0(*(_QWORD *)a2, v66, v64, v63, v62, v61, v60, v59, v58, v57, v56, v55, v37, v38, v39, v40, v3, v4, v5,
    v6,
    v7,
    v8,
    v9,
    v10,
    v11,
    v41,
    v42,
    v43,
    v44,
    v45,
    v46,
    v47,
    v48,
    v49,
    v50,
    v51,
    v52,
    v54 | (v53 << 16));
  v12 = *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16);
  v13 = *(_QWORD *)a1;
  v14 = *(_QWORD *)(a1 + 8);
  *(_QWORD *)a1 = v65;
  *(_QWORD *)(a1 + 8) = v66;
  v15 = *(void **)(a1 + 16);
  v16 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 16) = v64;
  *(_QWORD *)(a1 + 24) = v63;
  v17 = *(_QWORD *)(a1 + 32);
  v18 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a1 + 32) = v62;
  *(_QWORD *)(a1 + 40) = v61;
  v19 = *(_QWORD *)(a1 + 48);
  v20 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 48) = v60;
  *(_QWORD *)(a1 + 56) = v59;
  v21 = *(_OWORD *)(a1 + 64);
  v22 = *(_OWORD *)(a1 + 80);
  *(_QWORD *)(a1 + 64) = v58;
  *(_QWORD *)(a1 + 72) = v57;
  *(_QWORD *)(a1 + 80) = v56;
  *(_QWORD *)(a1 + 88) = v55;
  v23 = *(_OWORD *)(a1 + 96);
  v24 = *(_OWORD *)(a1 + 112);
  *(_QWORD *)(a1 + 96) = v37;
  *(_QWORD *)(a1 + 104) = v38;
  *(_QWORD *)(a1 + 112) = v39;
  v25 = *(_OWORD *)(a1 + 128);
  v26 = *(_OWORD *)(a1 + 144);
  *(_QWORD *)(a1 + 120) = v40;
  *(_QWORD *)(a1 + 128) = v3;
  *(_QWORD *)(a1 + 136) = v4;
  *(_QWORD *)(a1 + 144) = v5;
  v27 = *(_OWORD *)(a1 + 160);
  v28 = *(_OWORD *)(a1 + 176);
  *(_QWORD *)(a1 + 152) = v6;
  *(_QWORD *)(a1 + 160) = v7;
  *(_QWORD *)(a1 + 168) = v8;
  *(_QWORD *)(a1 + 176) = v9;
  v29 = *(_OWORD *)(a1 + 192);
  v30 = *(_OWORD *)(a1 + 208);
  *(_QWORD *)(a1 + 184) = v10;
  *(_QWORD *)(a1 + 192) = v11;
  *(_QWORD *)(a1 + 200) = v41;
  *(_QWORD *)(a1 + 208) = v42;
  *(_QWORD *)(a1 + 216) = v43;
  v31 = *(_OWORD *)(a1 + 224);
  v32 = *(_OWORD *)(a1 + 240);
  *(_QWORD *)(a1 + 224) = v44;
  *(_QWORD *)(a1 + 232) = v45;
  *(_QWORD *)(a1 + 240) = v46;
  *(_QWORD *)(a1 + 248) = v47;
  v33 = *(_OWORD *)(a1 + 256);
  v34 = *(_OWORD *)(a1 + 272);
  *(_QWORD *)(a1 + 256) = v48;
  *(_QWORD *)(a1 + 264) = v49;
  *(_QWORD *)(a1 + 272) = v50;
  *(_QWORD *)(a1 + 280) = v51;
  v35 = *(_QWORD *)(a1 + 288);
  *(_QWORD *)(a1 + 288) = v52;
  *(_BYTE *)(a1 + 298) = v53;
  *(_WORD *)(a1 + 296) = v54;
  sub_18B708920(v13, v14, v15, v16, v17, v18, v19, v20, v21, *((uint64_t *)&v21 + 1), v22, *((uint64_t *)&v22 + 1), v23, *((uint64_t *)&v23 + 1), v24, *((uint64_t *)&v24 + 1), v25, *((uint64_t *)&v25 + 1), v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((void **)&v27 + 1),
    (void *)v28,
    *((uint64_t *)&v28 + 1),
    v29,
    *((uint64_t *)&v29 + 1),
    (void *)v30,
    *((uint64_t *)&v30 + 1),
    v31,
    *((uint64_t *)&v31 + 1),
    v32,
    *((uint64_t *)&v32 + 1),
    v33,
    *((uint64_t *)&v33 + 1),
    v34,
    *((uint64_t *)&v34 + 1),
    v35,
    v12);
  return a1;
}

void *__swift_memcpy299_8(void *a1, const void *a2)
{
  return memcpy(a1, a2, 0x12BuLL);
}

uint64_t _s9NameStyleOwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  __int16 v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
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
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  int v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;

  v4 = *(_QWORD *)(a2 + 288);
  v5 = *(_WORD *)(a2 + 296);
  v6 = *(_BYTE *)(a2 + 298);
  v7 = *(_QWORD *)a1;
  v8 = *(_QWORD *)(a1 + 8);
  v9 = *(void **)(a1 + 16);
  v10 = *(void **)(a1 + 24);
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_QWORD *)(a1 + 40);
  v13 = *(_QWORD *)(a1 + 48);
  v14 = *(void **)(a1 + 56);
  v15 = *(_OWORD *)(a1 + 64);
  v16 = *(_OWORD *)(a1 + 80);
  v17 = *(_OWORD *)(a1 + 96);
  v18 = *(_OWORD *)(a1 + 112);
  v19 = *(_OWORD *)(a1 + 128);
  v20 = *(_OWORD *)(a1 + 144);
  v21 = *(_OWORD *)(a1 + 160);
  v22 = *(_OWORD *)(a1 + 176);
  v23 = *(_OWORD *)(a1 + 192);
  v24 = *(_OWORD *)(a1 + 208);
  v25 = *(_OWORD *)(a1 + 224);
  v26 = *(_OWORD *)(a1 + 240);
  v27 = *(_OWORD *)(a1 + 256);
  v28 = *(_OWORD *)(a1 + 272);
  v29 = *(_QWORD *)(a1 + 288);
  v30 = *(unsigned __int16 *)(a1 + 296) | (*(unsigned __int8 *)(a1 + 298) << 16);
  v31 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v31;
  v32 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v32;
  v33 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v33;
  v34 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v34;
  v35 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_OWORD *)(a1 + 144) = v35;
  v36 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);
  *(_OWORD *)(a1 + 176) = v36;
  v37 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)(a1 + 192) = *(_OWORD *)(a2 + 192);
  *(_OWORD *)(a1 + 208) = v37;
  v38 = *(_OWORD *)(a2 + 240);
  *(_OWORD *)(a1 + 224) = *(_OWORD *)(a2 + 224);
  *(_OWORD *)(a1 + 240) = v38;
  v39 = *(_OWORD *)(a2 + 272);
  *(_OWORD *)(a1 + 256) = *(_OWORD *)(a2 + 256);
  *(_OWORD *)(a1 + 272) = v39;
  *(_QWORD *)(a1 + 288) = v4;
  *(_BYTE *)(a1 + 298) = v6;
  *(_WORD *)(a1 + 296) = v5;
  sub_18B708920(v7, v8, v9, v10, v11, v12, v13, v14, v15, *((uint64_t *)&v15 + 1), v16, *((uint64_t *)&v16 + 1), v17, *((uint64_t *)&v17 + 1), v18, *((uint64_t *)&v18 + 1), v19, *((uint64_t *)&v19 + 1), v20,
    *((uint64_t *)&v20 + 1),
    v21,
    *((void **)&v21 + 1),
    (void *)v22,
    *((uint64_t *)&v22 + 1),
    v23,
    *((uint64_t *)&v23 + 1),
    (void *)v24,
    *((uint64_t *)&v24 + 1),
    v25,
    *((uint64_t *)&v25 + 1),
    v26,
    *((uint64_t *)&v26 + 1),
    v27,
    *((uint64_t *)&v27 + 1),
    v28,
    *((uint64_t *)&v28 + 1),
    v29,
    v30);
  return a1;
}

uint64_t _s9NameStyleOwet(uint64_t a1, int a2)
{
  uint64_t v2;
  int v3;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 299))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 32) >> 1;
  if (v2 > 0x80000000)
    v3 = ~(_DWORD)v2;
  else
    v3 = -1;
  return (v3 + 1);
}

uint64_t _s9NameStyleOwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 298) = 0;
    *(_WORD *)(result + 296) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 299) = 1;
  }
  else
  {
    if ((a3 & 0x80000000) == 0)
    {
      if (!a2)
        return result;
LABEL_8:
      *(_OWORD *)result = 0u;
      *(_OWORD *)(result + 16) = 0u;
      *(_QWORD *)(result + 32) = 2 * -a2;
      *(_OWORD *)(result + 56) = 0u;
      *(_OWORD *)(result + 72) = 0u;
      *(_OWORD *)(result + 88) = 0u;
      *(_OWORD *)(result + 104) = 0u;
      *(_OWORD *)(result + 120) = 0u;
      *(_OWORD *)(result + 136) = 0u;
      *(_OWORD *)(result + 152) = 0u;
      *(_OWORD *)(result + 168) = 0u;
      *(_OWORD *)(result + 184) = 0u;
      *(_OWORD *)(result + 200) = 0u;
      *(_OWORD *)(result + 216) = 0u;
      *(_OWORD *)(result + 232) = 0u;
      *(_OWORD *)(result + 248) = 0u;
      *(_OWORD *)(result + 40) = 0u;
      result += 40;
      *(_OWORD *)(result + 224) = 0u;
      *(_OWORD *)(result + 240) = 0u;
      *(_DWORD *)(result + 255) = 0;
      return result;
    }
    *(_BYTE *)(result + 299) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

uint64_t sub_18B71C9C4(uint64_t result, int a2)
{
  uint64_t v2;
  uint64_t v3;
  int v4;

  v2 = *(_QWORD *)(result + 144) & 1;
  v3 = *(_QWORD *)(result + 184) & 1;
  v4 = (*(unsigned __int16 *)(result + 296) | (*(unsigned __int8 *)(result + 298) << 16)) & 0x1010101;
  *(_QWORD *)(result + 32) &= 1uLL;
  *(_QWORD *)(result + 144) = v2;
  *(_QWORD *)(result + 184) = v3;
  *(_WORD *)(result + 296) = v4;
  *(_BYTE *)(result + 298) = (v4 | (a2 << 23)) >> 16;
  return result;
}

ValueMetadata *_s9NameStyleOMa()
{
  return &_s9NameStyleON;
}

void *sub_18B71CA1C(uint64_t a1)
{
  void *v1;
  int v3;
  const void *v4;
  uint64_t v5;
  void *result;
  _BYTE *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _QWORD __src[38];
  _BYTE v13[304];
  _BYTE __dst[304];
  _OWORD v15[9];
  char v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  char v26;
  _BYTE v27[304];
  _BYTE v28[304];

  sub_18B7086A4(v1, v27);
  sub_18B7086A4(v27, v28);
  v3 = sub_18B7086E0((uint64_t)v28);
  v4 = (const void *)sub_18B7086EC((uint64_t)v28);
  if (v3 != 1)
    return (void *)sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  v5 = (uint64_t)v4;
  memcpy(__dst, v4, 0x12BuLL);
  sub_18B709750(a1, (uint64_t)v15, &qword_1EDFD5510);
  result = (void *)sub_18B708DD4((uint64_t)v15);
  if ((_DWORD)result != 1)
  {
    v23 = v15[6];
    v24 = v15[7];
    v25 = v15[8];
    v26 = v16;
    v19 = v15[2];
    v20 = v15[3];
    v21 = v15[4];
    v22 = v15[5];
    v17 = v15[0];
    v18 = v15[1];
    if ((*(_BYTE *)(v5 + 297) & 1) != 0)
    {
      sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
      sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
      sub_18B71972C((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
      sub_18B709000(v5);
      v7 = __dst;
    }
    else
    {
      sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
      sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
      sub_18B71972C((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
      sub_18B709000(v5 + 152);
      v7 = &__dst[152];
    }
    v8 = v24;
    *((_OWORD *)v7 + 6) = v23;
    *((_OWORD *)v7 + 7) = v8;
    *((_OWORD *)v7 + 8) = v25;
    v7[144] = v26;
    v9 = v20;
    *((_OWORD *)v7 + 2) = v19;
    *((_OWORD *)v7 + 3) = v9;
    v10 = v22;
    *((_OWORD *)v7 + 4) = v21;
    *((_OWORD *)v7 + 5) = v10;
    v11 = v18;
    *(_OWORD *)v7 = v17;
    *((_OWORD *)v7 + 1) = v11;
    memcpy(__src, __dst, 0x12BuLL);
    sub_18B71F008(__src);
    sub_18B71972C((uint64_t)v27, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B71F094((uint64_t)__src);
    memcpy(v13, __src, 0x12BuLL);
    sub_18B719240((uint64_t)v13);
    return sub_18B7086A4(v13, v1);
  }
  return result;
}

void *sub_18B71CC68(uint64_t a1)
{
  void *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  char v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _OWORD __src[19];
  _BYTE __dst[304];
  _OWORD v34[9];
  char v35;
  _BYTE v36[304];
  _BYTE v37[320];

  sub_18B7086A4(v1, v36);
  sub_18B7086A4(v36, v37);
  v3 = sub_18B7086E0((uint64_t)v37);
  v4 = sub_18B7086EC((uint64_t)v37);
  if (v3 != 1)
    return (void *)sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  v5 = v4;
  sub_18B709750(a1, (uint64_t)v34, &qword_1EDFD5510);
  result = (void *)sub_18B708DD4((uint64_t)v34);
  if ((_DWORD)result != 1)
  {
    v28 = v34[6];
    v29 = v34[7];
    v30 = v34[8];
    v31 = v35;
    v24 = v34[2];
    v25 = v34[3];
    v26 = v34[4];
    v27 = v34[5];
    v22 = v34[0];
    v23 = v34[1];
    v7 = *(void **)(v5 + 168);
    v8 = *(void **)(v5 + 176);
    v9 = *(void **)(v5 + 208);
    v20 = *(_BYTE *)(v5 + 298);
    v21 = *(_BYTE *)(v5 + 297);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
    sub_18B71972C((uint64_t)v36, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    swift_bridgeObjectRetain();
    v10 = v7;
    v11 = v8;
    swift_bridgeObjectRetain();
    v12 = v9;
    sub_18B709000(v5);
    __src[6] = v28;
    __src[7] = v29;
    __src[8] = v30;
    LOBYTE(__src[9]) = v31;
    __src[2] = v24;
    __src[3] = v25;
    __src[4] = v26;
    __src[5] = v27;
    __src[0] = v22;
    __src[1] = v23;
    v13 = *(_OWORD *)(v5 + 248);
    v14 = *(_BYTE *)(v5 + 296);
    v15 = *(_OWORD *)(v5 + 280);
    *(_OWORD *)((char *)&__src[16] + 8) = *(_OWORD *)(v5 + 264);
    *(_OWORD *)((char *)&__src[17] + 8) = v15;
    v16 = *(_OWORD *)(v5 + 152);
    *(_OWORD *)((char *)&__src[10] + 8) = *(_OWORD *)(v5 + 168);
    *(_OWORD *)((char *)&__src[9] + 8) = v16;
    v17 = *(_OWORD *)(v5 + 184);
    v18 = *(_OWORD *)(v5 + 200);
    v19 = *(_OWORD *)(v5 + 216);
    *(_OWORD *)((char *)&__src[14] + 8) = *(_OWORD *)(v5 + 232);
    *(_OWORD *)((char *)&__src[13] + 8) = v19;
    *(_OWORD *)((char *)&__src[12] + 8) = v18;
    *(_OWORD *)((char *)&__src[11] + 8) = v17;
    BYTE8(__src[18]) = v14;
    *(_OWORD *)((char *)&__src[15] + 8) = v13;
    BYTE9(__src[18]) = v21;
    BYTE10(__src[18]) = v20;
    sub_18B71F008(__src);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_18B71972C((uint64_t)v36, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B71F094((uint64_t)__src);
    memcpy(__dst, __src, 0x12BuLL);
    sub_18B719240((uint64_t)__dst);
    return sub_18B7086A4(__dst, v1);
  }
  return result;
}

void *sub_18B71CEE8(uint64_t a1)
{
  void *v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *result;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  char v20;
  char v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _OWORD __src[19];
  _BYTE __dst[304];
  _OWORD v34[9];
  char v35;
  _BYTE v36[304];
  _BYTE v37[320];

  sub_18B7086A4(v1, v36);
  sub_18B7086A4(v36, v37);
  v3 = sub_18B7086E0((uint64_t)v37);
  v4 = sub_18B7086EC((uint64_t)v37);
  if (v3 != 1)
    return (void *)sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
  v5 = v4;
  sub_18B709750(a1, (uint64_t)v34, &qword_1EDFD5510);
  result = (void *)sub_18B708DD4((uint64_t)v34);
  if ((_DWORD)result != 1)
  {
    v28 = v34[6];
    v29 = v34[7];
    v30 = v34[8];
    v31 = v35;
    v24 = v34[2];
    v25 = v34[3];
    v26 = v34[4];
    v27 = v34[5];
    v22 = v34[0];
    v23 = v34[1];
    v7 = *(void **)(v5 + 16);
    v8 = *(void **)(v5 + 24);
    v9 = *(void **)(v5 + 56);
    v20 = *(_BYTE *)(v5 + 298);
    v21 = *(_BYTE *)(v5 + 297);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B7198D4);
    sub_18B71972C((uint64_t)v36, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    swift_bridgeObjectRetain();
    v10 = v7;
    v11 = v8;
    swift_bridgeObjectRetain();
    v12 = v9;
    sub_18B709000(v5 + 152);
    v13 = *(_OWORD *)(v5 + 16);
    __src[0] = *(_OWORD *)v5;
    __src[1] = v13;
    v14 = *(_OWORD *)(v5 + 32);
    v15 = *(_OWORD *)(v5 + 48);
    v16 = *(_OWORD *)(v5 + 80);
    __src[4] = *(_OWORD *)(v5 + 64);
    __src[5] = v16;
    __src[2] = v14;
    __src[3] = v15;
    v17 = *(_OWORD *)(v5 + 96);
    v18 = *(_OWORD *)(v5 + 112);
    v19 = *(_OWORD *)(v5 + 128);
    LOBYTE(__src[9]) = *(_BYTE *)(v5 + 144);
    __src[7] = v18;
    __src[8] = v19;
    __src[6] = v17;
    *(_OWORD *)((char *)&__src[16] + 8) = v29;
    *(_OWORD *)((char *)&__src[17] + 8) = v30;
    *(_OWORD *)((char *)&__src[15] + 8) = v28;
    BYTE8(__src[18]) = v31;
    *(_OWORD *)((char *)&__src[11] + 8) = v24;
    *(_OWORD *)((char *)&__src[12] + 8) = v25;
    *(_OWORD *)((char *)&__src[13] + 8) = v26;
    *(_OWORD *)((char *)&__src[14] + 8) = v27;
    *(_OWORD *)((char *)&__src[9] + 8) = v22;
    *(_OWORD *)((char *)&__src[10] + 8) = v23;
    BYTE9(__src[18]) = v21;
    BYTE10(__src[18]) = v20;
    sub_18B71F008(__src);
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    sub_18B71972C((uint64_t)v36, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B719870(a1, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, char))sub_18B708F44);
    sub_18B71F094((uint64_t)__src);
    memcpy(__dst, __src, 0x12BuLL);
    sub_18B719240((uint64_t)__dst);
    return sub_18B7086A4(__dst, v1);
  }
  return result;
}

uint64_t sub_18B71D158()
{
  const void *v0;
  const void *v1;
  uint64_t v2;
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  _OWORD v8[9];
  char v9;
  uint64_t v10;
  unint64_t v11;
  _BYTE v12[304];
  _OWORD __dst[19];

  sub_18B7086A4(v0, v12);
  if (sub_18B7086E0((uint64_t)v12) == 1)
  {
    v1 = (const void *)sub_18B7086EC((uint64_t)v12);
    memcpy(__dst, v1, 0x12BuLL);
    *(_QWORD *)&v8[0] = 0x6E696C69746C756DLL;
    *((_QWORD *)&v8[0] + 1) = 0xEB000000005B3A65;
    sub_18B71972C((uint64_t)v0, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    sub_18B71D388();
    sub_18B7293A0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = sub_18B7086EC((uint64_t)v12);
    v3 = *(_OWORD *)(v2 + 112);
    __dst[6] = *(_OWORD *)(v2 + 96);
    __dst[7] = v3;
    __dst[8] = *(_OWORD *)(v2 + 128);
    LOBYTE(__dst[9]) = *(_BYTE *)(v2 + 144);
    v4 = *(_OWORD *)(v2 + 48);
    __dst[2] = *(_OWORD *)(v2 + 32);
    __dst[3] = v4;
    v5 = *(_OWORD *)(v2 + 80);
    __dst[4] = *(_OWORD *)(v2 + 64);
    __dst[5] = v5;
    v6 = *(_OWORD *)(v2 + 16);
    __dst[0] = *(_OWORD *)v2;
    __dst[1] = v6;
    v10 = 0;
    v11 = 0xE000000000000000;
    sub_18B71972C((uint64_t)v0, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);
    sub_18B7293A0();
    v8[6] = __dst[6];
    v8[7] = __dst[7];
    v8[8] = __dst[8];
    v9 = __dst[9];
    v8[2] = __dst[2];
    v8[3] = __dst[3];
    v8[4] = __dst[4];
    v8[5] = __dst[5];
    v8[0] = __dst[0];
    v8[1] = __dst[1];
    sub_18B729520();
  }
  sub_18B7293A0();
  sub_18B71972C((uint64_t)v0, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  sub_18B7294F0();
  swift_bridgeObjectRelease();
  strcpy((char *)v8, "NameStyle: { ");
  sub_18B7293A0();
  swift_bridgeObjectRelease();
  sub_18B7293A0();
  return *(_QWORD *)&v8[0];
}

uint64_t sub_18B71D388()
{
  sub_18B7294F0();
  sub_18B7293A0();
  sub_18B729520();
  sub_18B7293A0();
  sub_18B729520();
  sub_18B7293A0();
  sub_18B729520();
  sub_18B7293A0();
  sub_18B729520();
  sub_18B7293A0();
  return 0;
}

BOOL sub_18B71D574(uint64_t a1)
{
  __int128 *v1;
  uint64_t v2;
  void *v3;
  double v4;
  char v5;
  uint64_t v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  char v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char v30;
  void *v31;
  void *v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  uint64_t v61;
  char v62;
  char v63;
  void *v64;
  uint64_t v65;
  uint64_t v66;
  id v67;
  uint64_t v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  void *v86;
  uint64_t v87;
  void *v88;
  char v89;
  id v90;
  id v91;
  char v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  id v98;
  id v99;
  uint64_t v100;
  uint64_t v101;
  void *v102;
  id v103;
  void *v104;
  void *v105;
  char v106;
  char v107;
  uint64_t v108;
  uint64_t v109;
  void *v110;
  uint64_t v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  char v118;
  char v119;
  id v120;
  id v121;
  uint64_t v122;
  uint64_t v123;
  double v124;
  double v125;
  double v126;
  void (*v127)(uint64_t, uint64_t);
  uint64_t v128;
  id v129;
  double v130;
  double v131;
  double v132;
  uint64_t v134;
  int v135;
  int v136;
  uint64_t v137;
  void *v138;
  void *v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  uint64_t v143;
  uint64_t v144;
  void *v145;
  uint64_t v146;
  uint64_t v147;
  void *v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  id v152;
  void *v153;
  void *v154;
  id v155;
  id v156;
  uint64_t v157;
  double v158;
  uint64_t v159;
  CGFloat Width;
  uint64_t v161;
  char *v162;
  uint64_t v163;
  uint64_t v164;
  uint64_t v165;
  uint64_t v166;
  id v167;
  id v168;
  char v169;
  uint64_t v170;
  uint64_t v171;
  void *v172;
  void *v173;
  void *v174;
  uint64_t v175;
  uint64_t v176;
  uint64_t v177;
  uint64_t v178;
  uint64_t v179;
  void *v180;
  void *v181;
  uint64_t v182;
  char v183;
  uint64_t v184;
  uint64_t v185;
  id v186;
  void *v187;
  char v188;
  id v189;
  id v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  void *v195;
  uint64_t v196;
  uint64_t v197;
  uint64_t v198;
  uint64_t v199;
  uint64_t v200;
  uint64_t v201;
  char v202;
  _QWORD v203[13];
  char v204;
  _QWORD v205[13];
  char v206;
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  __int128 v213;
  __int128 v214;
  __int128 v215;
  char v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  __int128 v220;
  __int128 v221;
  __int128 v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  char v226;
  uint64_t v227;
  uint64_t v228;
  void *v229;
  void *v230;
  void *v231;
  uint64_t v232;
  uint64_t v233;
  uint64_t v234;
  uint64_t v235;
  uint64_t v236;
  void *v237;
  void *v238;
  uint64_t v239;
  char v240;
  void *v241;
  void *v242;
  id v243;
  uint64_t v244;
  uint64_t v245;
  uint64_t v246;
  void *v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  uint64_t v253;
  char v254;
  CGRect v255;

  v161 = a1;
  v163 = sub_18B72922C();
  v159 = *(_QWORD *)(v163 - 8);
  MEMORY[0x1E0C80A78](v163);
  v162 = (char *)&v134 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v3 = (void *)objc_opt_self();
  objc_msgSend(v3, sel_maximumHorizontalTextBounds);
  Width = CGRectGetWidth(v255);
  objc_msgSend(v3, sel_minimumScaleFactor);
  v158 = v4;
  v5 = *((_BYTE *)v1 + 297);
  if ((v5 & 1) == 0)
  {
    if ((*((_BYTE *)v1 + 298) & 1) != 0)
    {
      v36 = v1[6];
      v224 = v1[7];
      v225 = v1[8];
      v226 = *((_BYTE *)v1 + 144);
      v37 = v1[3];
      v219 = v1[2];
      v220 = v37;
      v38 = v1[5];
      v221 = v1[4];
      v222 = v38;
      v223 = v36;
      v39 = v1[1];
      v217 = *v1;
      v218 = v39;
      v34 = *((_QWORD *)&v217 + 1);
      v35 = v217;
      v30 = v219;
      v33 = v226 & 1;
      v6 = *((_QWORD *)&v217 + 1);
      v164 = v217;
      v31 = (void *)*((_QWORD *)&v39 + 1);
      v32 = (void *)v39;
      v155 = (id)*((_QWORD *)&v219 + 1);
      v156 = (id)v39;
      v147 = *((_QWORD *)&v219 + 1);
      v148 = (void *)*((_QWORD *)&v39 + 1);
      v136 = v219;
      v23 = (void *)*((_QWORD *)&v222 + 1);
      v22 = v222;
      v151 = *((_QWORD *)&v220 + 1);
      v145 = (void *)*((_QWORD *)&v220 + 1);
      v152 = (id)v220;
      v146 = v220;
      v149 = *((_QWORD *)&v221 + 1);
      v153 = (void *)*((_QWORD *)&v221 + 1);
      v150 = v221;
      v154 = (void *)v221;
      v25 = *((_QWORD *)&v36 + 1);
      v24 = v36;
      v143 = *((_QWORD *)&v222 + 1);
      v144 = v222;
      v141 = *((_QWORD *)&v36 + 1);
      v142 = v36;
      v27 = *((_QWORD *)&v224 + 1);
      v139 = (void *)*((_QWORD *)&v224 + 1);
      v26 = v224;
      v140 = v224;
      v29 = *((_QWORD *)&v225 + 1);
      v137 = *((_QWORD *)&v225 + 1);
      v28 = v225;
      v138 = (void *)v225;
      v135 = v226 & 1;
      goto LABEL_6;
    }
LABEL_8:
    v69 = v1[6];
    v224 = v1[7];
    v225 = v1[8];
    v226 = *((_BYTE *)v1 + 144);
    v70 = v1[3];
    v219 = v1[2];
    v220 = v70;
    v71 = v1[5];
    v221 = v1[4];
    v222 = v71;
    v223 = v69;
    v72 = v1[1];
    v217 = *v1;
    v218 = v72;
    v73 = *(__int128 *)((char *)v1 + 264);
    v74 = *(__int128 *)((char *)v1 + 280);
    v213 = *(__int128 *)((char *)v1 + 248);
    v214 = v73;
    v215 = v74;
    v216 = *((_BYTE *)v1 + 296);
    v75 = *(__int128 *)((char *)v1 + 200);
    v209 = *(__int128 *)((char *)v1 + 184);
    v210 = v75;
    v76 = *(__int128 *)((char *)v1 + 232);
    v211 = *(__int128 *)((char *)v1 + 216);
    v212 = v76;
    v77 = *(__int128 *)((char *)v1 + 168);
    v207 = *(__int128 *)((char *)v1 + 152);
    v208 = v77;
    v153 = (void *)v220;
    v154 = (void *)*((_QWORD *)&v219 + 1);
    v152 = (id)*((_QWORD *)&v220 + 1);
    v150 = *((_QWORD *)&v221 + 1);
    v151 = v221;
    v148 = (void *)*((_QWORD *)&v222 + 1);
    v149 = v222;
    v146 = *((_QWORD *)&v223 + 1);
    v147 = v223;
    v144 = *((_QWORD *)&v224 + 1);
    v145 = (void *)v224;
    v142 = *((_QWORD *)&v225 + 1);
    v143 = v225;
    LODWORD(v140) = v219;
    v155 = (id)*((_QWORD *)&v218 + 1);
    v156 = (id)v218;
    v157 = *((_QWORD *)&v217 + 1);
    v164 = v217;
    LODWORD(v141) = v226 & 1;
    v78 = *((_QWORD *)&v209 + 1);
    v80 = (void *)*((_QWORD *)&v210 + 1);
    v79 = v210;
    v138 = (void *)*((_QWORD *)&v211 + 1);
    v139 = (void *)v211;
    v81 = *((_QWORD *)&v212 + 1);
    v82 = v212;
    v84 = *((_QWORD *)&v213 + 1);
    v83 = v213;
    v86 = (void *)*((_QWORD *)&v214 + 1);
    v85 = v214;
    v87 = *((_QWORD *)&v74 + 1);
    v88 = (void *)v74;
    v89 = v209;
    v90 = (id)*((_QWORD *)&v77 + 1);
    v91 = (id)v77;
    v92 = v216 & 1;
    v93 = *((_QWORD *)&v207 + 1);
    v94 = v207;
    sub_18B708DEC(&v217);
    sub_18B708DEC(&v207);
    v95 = v94;
    v96 = v93;
    v98 = v152;
    v97 = v153;
    v100 = v157;
    v99 = v156;
    v101 = v164;
    v102 = v154;
    v103 = v155;
    v104 = v138;
    v105 = v139;
    v106 = v140;
    v107 = v141;
    v108 = v150;
    v109 = v151;
    v110 = v148;
    v111 = v149;
    v113 = v144;
    v112 = (uint64_t)v145;
    v115 = v146;
    v114 = v147;
    v116 = v142;
    v117 = v143;
    goto LABEL_11;
  }
  if ((*((_BYTE *)v1 + 298) & 1) != 0)
    goto LABEL_8;
  v6 = *((_QWORD *)v1 + 1);
  v164 = *(_QWORD *)v1;
  v156 = (id)*((_QWORD *)v1 + 2);
  v7 = (void *)*((_QWORD *)v1 + 3);
  v8 = *((_BYTE *)v1 + 32);
  v147 = *((_QWORD *)v1 + 5);
  v148 = v7;
  v9 = *((_QWORD *)v1 + 6);
  v145 = (void *)*((_QWORD *)v1 + 7);
  v146 = v9;
  v10 = (void *)*((_QWORD *)v1 + 8);
  v153 = (void *)*((_QWORD *)v1 + 9);
  v154 = v10;
  v11 = *((_QWORD *)v1 + 10);
  v143 = *((_QWORD *)v1 + 11);
  v144 = v11;
  v12 = *((_QWORD *)v1 + 12);
  v141 = *((_QWORD *)v1 + 13);
  v142 = v12;
  v13 = *((_QWORD *)v1 + 14);
  v139 = (void *)*((_QWORD *)v1 + 15);
  v140 = v13;
  v14 = (void *)*((_QWORD *)v1 + 16);
  v137 = *((_QWORD *)v1 + 17);
  v138 = v14;
  v15 = *((_BYTE *)v1 + 144);
  v16 = *(__int128 *)((char *)v1 + 184);
  v17 = *(__int128 *)((char *)v1 + 248);
  v18 = *(__int128 *)((char *)v1 + 280);
  v224 = *(__int128 *)((char *)v1 + 264);
  v225 = v18;
  v226 = *((_BYTE *)v1 + 296);
  v19 = *(__int128 *)((char *)v1 + 200);
  v219 = v16;
  v220 = v19;
  v20 = *(__int128 *)((char *)v1 + 232);
  v221 = *(__int128 *)((char *)v1 + 216);
  v222 = v20;
  v223 = v17;
  v21 = *(__int128 *)((char *)v1 + 168);
  v217 = *(__int128 *)((char *)v1 + 152);
  v218 = v21;
  v155 = (id)*((_QWORD *)&v16 + 1);
  v151 = *((_QWORD *)&v220 + 1);
  v152 = (id)v220;
  v149 = *((_QWORD *)&v221 + 1);
  v150 = v221;
  v23 = (void *)*((_QWORD *)&v222 + 1);
  v22 = v222;
  v25 = *((_QWORD *)&v17 + 1);
  v24 = v17;
  v27 = *((_QWORD *)&v224 + 1);
  v26 = v224;
  v29 = *((_QWORD *)&v18 + 1);
  v28 = v18;
  v30 = v16;
  v31 = (void *)*((_QWORD *)&v21 + 1);
  v32 = (void *)v21;
  v33 = v226 & 1;
  v135 = v15 & 1;
  v136 = v8 & 1;
  v34 = *((_QWORD *)&v217 + 1);
  v35 = v217;
LABEL_6:
  sub_18B708DEC(&v217);
  v184 = v35;
  v185 = v34;
  v186 = v32;
  v187 = v31;
  v188 = v30;
  v189 = v155;
  v190 = v152;
  v191 = v151;
  v192 = v150;
  v193 = v149;
  v194 = v22;
  v195 = v23;
  v196 = v24;
  v197 = v25;
  v198 = v26;
  v199 = v27;
  v200 = v28;
  v201 = v29;
  v202 = v33;
  swift_bridgeObjectRetain();
  v40 = v156;
  v41 = v31;
  sub_18B709000((uint64_t)&v184);
  swift_bridgeObjectRetain();
  v42 = v41;
  v43 = v164;
  sub_18B70A89C(v164, v6, v42, (uint64_t)v203);
  v44 = *(__int128 *)((char *)v1 + 264);
  v45 = *(__int128 *)((char *)v1 + 280);
  v213 = *(__int128 *)((char *)v1 + 248);
  v214 = v44;
  v215 = v45;
  v216 = *((_BYTE *)v1 + 296);
  v46 = *(__int128 *)((char *)v1 + 200);
  v209 = *(__int128 *)((char *)v1 + 184);
  v210 = v46;
  v47 = *(__int128 *)((char *)v1 + 232);
  v211 = *(__int128 *)((char *)v1 + 216);
  v212 = v47;
  v48 = *(__int128 *)((char *)v1 + 168);
  v207 = *(__int128 *)((char *)v1 + 152);
  v208 = v48;
  v49 = *((_QWORD *)&v207 + 1);
  v50 = v207;
  v152 = (id)v48;
  v156 = v40;
  v157 = v6;
  v155 = v42;
  if ((v5 & 1) != 0)
  {
    v51 = *((_QWORD *)&v209 + 1);
    v52 = (void *)*((_QWORD *)&v210 + 1);
    v53 = v210;
    v153 = (void *)*((_QWORD *)&v211 + 1);
    v154 = (void *)v211;
    v55 = *((_QWORD *)&v212 + 1);
    v54 = v212;
    v57 = *((_QWORD *)&v213 + 1);
    v56 = v213;
    v59 = (void *)*((_QWORD *)&v214 + 1);
    v58 = v214;
    v61 = *((_QWORD *)&v215 + 1);
    v60 = (void *)v215;
    v62 = v209;
    v63 = v216 & 1;
    v64 = (void *)*((_QWORD *)&v208 + 1);
    sub_18B708DEC(&v207);
    v65 = v50;
    v66 = v49;
    v67 = v152;
    v68 = v49;
  }
  else
  {
    v165 = v43;
    v166 = v6;
    v51 = v147;
    v64 = v148;
    v167 = v40;
    v168 = v148;
    v151 = v207;
    v118 = v136;
    v169 = v136;
    v52 = v145;
    v53 = v146;
    v170 = v147;
    v171 = v146;
    v172 = v145;
    v173 = v154;
    v174 = v153;
    v55 = v143;
    v54 = v144;
    v175 = v144;
    v176 = v143;
    v57 = v141;
    v56 = v142;
    v177 = v142;
    v178 = v141;
    v59 = v139;
    v58 = v140;
    v179 = v140;
    v180 = v139;
    v61 = v137;
    v60 = v138;
    v181 = v138;
    v182 = v137;
    v150 = *((_QWORD *)&v207 + 1);
    v119 = v135;
    v183 = v135;
    sub_18B708DEC(&v165);
    v65 = v43;
    v62 = v118;
    v66 = v6;
    v63 = v119;
    v67 = v40;
    v68 = v150;
    v50 = v151;
  }
  v165 = v65;
  v166 = v66;
  v167 = v67;
  v168 = v64;
  v169 = v62;
  v170 = v51;
  v171 = v53;
  v172 = v52;
  v173 = v154;
  v174 = v153;
  v175 = v54;
  v176 = v55;
  v177 = v56;
  v178 = v57;
  v179 = v58;
  v180 = v59;
  v181 = v60;
  v182 = v61;
  v183 = v63;
  swift_bridgeObjectRetain();
  v91 = v152;
  v120 = v64;
  sub_18B709000((uint64_t)&v165);
  swift_bridgeObjectRetain();
  v90 = v120;
  sub_18B70A89C(v50, v68, v90, (uint64_t)v205);
  v106 = 0;
  v89 = 0;
  v107 = v204;
  v116 = v203[12];
  v117 = v203[11];
  v114 = v203[7];
  v115 = v203[8];
  v112 = v203[9];
  v113 = v203[10];
  v110 = (void *)v203[6];
  v111 = v203[5];
  v108 = v203[4];
  v109 = v203[3];
  v98 = (id)v203[2];
  v102 = (void *)v203[0];
  v96 = v68;
  v97 = (void *)v203[1];
  v95 = v50;
  v92 = v206;
  v87 = v205[12];
  v88 = (void *)v205[11];
  v83 = v205[7];
  v84 = v205[8];
  v85 = v205[9];
  v86 = (void *)v205[10];
  v81 = v205[6];
  v82 = v205[5];
  v104 = (void *)v205[4];
  v105 = (void *)v205[3];
  v80 = (void *)v205[2];
  v78 = v205[0];
  v79 = v205[1];
  v101 = v164;
  v100 = v157;
  v99 = v156;
  v103 = v155;
LABEL_11:
  v227 = v78;
  v228 = v79;
  v229 = v80;
  v230 = v105;
  v231 = v104;
  v232 = v82;
  v233 = v81;
  v234 = v83;
  v235 = v84;
  v236 = v85;
  v237 = v86;
  v238 = v88;
  v239 = v87;
  v240 = v92;
  v165 = v95;
  v166 = v96;
  v167 = v91;
  v168 = v90;
  v169 = v89;
  v170 = v78;
  v171 = v79;
  v172 = v80;
  v173 = v105;
  v174 = v104;
  v175 = v82;
  v176 = v81;
  v177 = v83;
  v178 = v84;
  v179 = v85;
  v180 = v86;
  v181 = v88;
  v182 = v87;
  v183 = v92;
  v241 = v102;
  v242 = v97;
  v243 = v98;
  v244 = v109;
  v245 = v108;
  v246 = v111;
  v247 = v110;
  v248 = v114;
  v249 = v115;
  v250 = v112;
  v251 = v113;
  v252 = v117;
  v253 = v116;
  v254 = v107;
  v184 = v101;
  v185 = v100;
  v186 = v99;
  v187 = v103;
  v188 = v106;
  v189 = v102;
  v190 = v97;
  v191 = (uint64_t)v98;
  v192 = v109;
  v193 = v108;
  v194 = v111;
  v195 = v110;
  v196 = v114;
  v197 = v115;
  v198 = v112;
  v199 = v113;
  v200 = v117;
  v201 = v116;
  v202 = v107;
  swift_bridgeObjectRetain();
  v121 = v98;
  v123 = v161;
  v122 = (uint64_t)v162;
  sub_18B712B78(v161);
  v124 = v158;
  sub_18B709CE0(v122, v158);
  v126 = v125;

  swift_bridgeObjectRelease();
  v127 = *(void (**)(uint64_t, uint64_t))(v159 + 8);
  v128 = v163;
  v127(v122, v163);
  swift_bridgeObjectRetain();
  v129 = v80;
  sub_18B712B78(v123);
  sub_18B709CE0(v122, v124);
  v131 = v130;
  sub_18B709000((uint64_t)&v165);
  sub_18B709000((uint64_t)&v184);

  swift_bridgeObjectRelease();
  v127(v122, v128);
  if (v126 > v131)
    v132 = v126;
  else
    v132 = v131;
  return v132 <= Width;
}

uint64_t sub_18B71DE4C()
{
  const void *v0;
  uint64_t v2;

  sub_18B7086A4(v0, &v2);
  return sub_18B71D158();
}

unint64_t sub_18B71DE80()
{
  sub_18B7294F0();
  swift_bridgeObjectRelease();
  sub_18B72958C();
  sub_18B7293A0();
  swift_bridgeObjectRelease();
  sub_18B7293A0();
  sub_18B7293A0();
  swift_bridgeObjectRelease();
  sub_18B7293A0();
  return 0xD00000000000001BLL;
}

_QWORD *sub_18B71DF98@<X0>(_QWORD *result@<X0>, char *a2@<X8>)
{
  char v2;
  char v3;

  if (*result == 1)
    v2 = 1;
  else
    v2 = 2;
  if (*result)
    v3 = v2;
  else
    v3 = 0;
  *a2 = v3;
  return result;
}

void sub_18B71DFB8(_QWORD *a1@<X8>)
{
  unsigned __int8 *v1;

  *a1 = *v1;
}

unint64_t sub_18B71DFC4()
{
  return sub_18B71DE80();
}

void *sub_18B71DFD0(void *a1)
{
  void *v1;
  uint64_t v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  void *v11;
  id v12;
  _BYTE *v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  void *v22;
  id v23;
  uint64_t v24;
  __int128 v25;
  _QWORD *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  void *v32;
  id v33;
  _OWORD v35[9];
  char v36;
  _BYTE v37[16];
  id v38;
  _BYTE v39[304];
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  char v49;
  _BYTE v50[16];
  id v51;
  _OWORD v52[9];
  char v53;
  _BYTE v54[16];
  id v55;
  _BYTE v56[152];
  _OWORD v57[9];
  char v58;
  _BYTE v59[304];
  _BYTE v60[304];
  _BYTE v61[312];

  sub_18B7086A4(v1, v60);
  sub_18B7086A4(v60, v61);
  if (sub_18B7086E0((uint64_t)v61) == 1)
  {
    sub_18B7086EC((uint64_t)v61);
LABEL_4:
    v13 = v60;
    goto LABEL_6;
  }
  v3 = sub_18B7086EC((uint64_t)v61);
  v4 = *(_OWORD *)(v3 + 16);
  v57[0] = *(_OWORD *)v3;
  v57[1] = v4;
  v5 = *(_OWORD *)(v3 + 64);
  v7 = *(_OWORD *)(v3 + 32);
  v6 = *(_OWORD *)(v3 + 48);
  v57[5] = *(_OWORD *)(v3 + 80);
  v57[4] = v5;
  v57[2] = v7;
  v57[3] = v6;
  v9 = *(_OWORD *)(v3 + 112);
  v8 = *(_OWORD *)(v3 + 128);
  v10 = *(_OWORD *)(v3 + 96);
  v58 = *(_BYTE *)(v3 + 144);
  v57[8] = v8;
  v57[6] = v10;
  v57[7] = v9;
  nullsub_1(v57);
  sub_18B709750((uint64_t)v57, (uint64_t)v54, &qword_1EDFD5510);
  v11 = v55;
  v12 = a1;
  sub_18B71972C((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B7197C0);

  v55 = v12;
  sub_18B709750((uint64_t)v54, (uint64_t)v39, &qword_1EDFD5510);
  sub_18B709750((uint64_t)v39, (uint64_t)&v40, &qword_1EDFD5510);
  if (sub_18B708DD4((uint64_t)&v40) == 1)
    goto LABEL_4;
  sub_18B71972C((uint64_t)v60, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B708920);
  v52[6] = v46;
  v52[7] = v47;
  v52[8] = v48;
  v53 = v49;
  v52[2] = v42;
  v52[3] = v43;
  v52[4] = v44;
  v52[5] = v45;
  v52[0] = v40;
  v52[1] = v41;
  sub_18B719288((uint64_t)v52);
  sub_18B7086A4(v52, v1);
  v13 = v52;
LABEL_6:
  sub_18B7086A4(v13, v59);
  sub_18B7086A4(v59, v52);
  if (sub_18B7086E0((uint64_t)v52) == 1)
  {
    v14 = sub_18B7086EC((uint64_t)v52);
    v15 = *(_OWORD *)(v14 + 16);
    v40 = *(_OWORD *)v14;
    v41 = v15;
    v16 = *(_OWORD *)(v14 + 80);
    v18 = *(_OWORD *)(v14 + 32);
    v17 = *(_OWORD *)(v14 + 48);
    v44 = *(_OWORD *)(v14 + 64);
    v45 = v16;
    v42 = v18;
    v43 = v17;
    v20 = *(_OWORD *)(v14 + 112);
    v19 = *(_OWORD *)(v14 + 128);
    v21 = *(_OWORD *)(v14 + 96);
    v49 = *(_BYTE *)(v14 + 144);
    v47 = v20;
    v48 = v19;
    v46 = v21;
    nullsub_1(&v40);
    sub_18B709750((uint64_t)&v40, (uint64_t)v50, &qword_1EDFD5510);
    v22 = v51;
    v23 = a1;
    sub_18B708DEC((_QWORD *)v14);

    v51 = v23;
    sub_18B709750((uint64_t)v50, (uint64_t)v57, &qword_1EDFD5510);
    sub_18B71CC68((uint64_t)v57);
  }
  else
  {
    sub_18B7086EC((uint64_t)v52);
  }
  sub_18B7086A4(v1, v39);
  sub_18B7086A4(v39, &v40);
  if (sub_18B7086E0((uint64_t)&v40) != 1)
    return (void *)sub_18B7086EC((uint64_t)&v40);
  v24 = sub_18B7086EC((uint64_t)&v40);
  v25 = *(_OWORD *)(v24 + 248);
  v26 = (_QWORD *)(v24 + 152);
  v27 = *(_OWORD *)(v24 + 200);
  v35[2] = *(_OWORD *)(v24 + 184);
  v35[3] = v27;
  v28 = *(_OWORD *)(v24 + 232);
  v35[4] = *(_OWORD *)(v24 + 216);
  v35[5] = v28;
  v29 = *(_OWORD *)(v24 + 168);
  v35[0] = *(_OWORD *)(v24 + 152);
  v35[1] = v29;
  v30 = *(_OWORD *)(v24 + 264);
  v31 = *(_OWORD *)(v24 + 280);
  v35[6] = v25;
  v35[7] = v30;
  v36 = *(_BYTE *)(v24 + 296);
  v35[8] = v31;
  nullsub_1(v35);
  sub_18B709750((uint64_t)v35, (uint64_t)v37, &qword_1EDFD5510);
  v32 = v38;
  v33 = a1;
  sub_18B708DEC(v26);

  v38 = v33;
  sub_18B709750((uint64_t)v37, (uint64_t)v56, &qword_1EDFD5510);
  return sub_18B71CEE8((uint64_t)v56);
}

uint64_t sub_18B71E2F4@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X8>)
{
  id v10;
  id v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  id v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  char v24;
  uint64_t v25;
  char v26;
  char v27;
  id v28;
  void *v29;
  char IsSuitableForArabicJustification;
  void *v31;
  int v32;
  id v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  double v55;
  double v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  double v66;
  id v67;
  id v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  __int128 v77;
  uint64_t v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  char v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  char v92;
  uint64_t v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  uint64_t v97;
  void *v98;
  char v99;
  id v100[2];
  id v101;
  char v102;
  __int128 v103;
  __int128 v104;
  char v105;
  uint64_t v106;
  uint64_t v107;
  _BYTE v108[7];
  _BYTE v109[7];
  _BYTE v110[7];
  _BYTE v111[7];
  __int128 v112;
  id v113;
  id v114;
  char v115;
  _BYTE v116[7];
  uint64_t v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  uint64_t v123;
  uint64_t v124;
  char v125;
  _BYTE v126[7];
  uint64_t v127;
  unint64_t v128;
  id v129;
  id v130;
  char v131;
  _BYTE v132[7];
  uint64_t v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  uint64_t v139;
  uint64_t v140;
  char v141;
  char v142;
  char v143;
  uint64_t v144;
  __int128 v145;
  uint64_t v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  uint64_t v154;
  uint64_t v155;
  char v156;
  uint64_t v157;
  __int128 v158;
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
  char v169;
  uint64_t v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  uint64_t v176;
  uint64_t v177;
  char v178;
  _BYTE v179[312];

  v10 = objc_msgSend((id)objc_opt_self(), sel_posterNameComponentsForContact_, a1);
  v11 = objc_msgSend(v10, sel_secondNameComponent);
  if (!v11)
    goto LABEL_4;
  v12 = v11;
  v13 = sub_18B72937C();
  v15 = v14;

  if (a4)
    goto LABEL_3;
  v17 = objc_msgSend(v10, sel_firstNameComponent);
  v18 = sub_18B72937C();
  v20 = v19;

  swift_bridgeObjectRelease();
  v21 = HIBYTE(v20) & 0xF;
  if ((v20 & 0x2000000000000000) == 0)
    v21 = v18 & 0xFFFFFFFFFFFFLL;
  if (!v21)
    goto LABEL_3;
  v22 = HIBYTE(v15) & 0xF;
  if ((v15 & 0x2000000000000000) == 0)
    v22 = v13 & 0xFFFFFFFFFFFFLL;
  if (!v22)
    goto LABEL_3;
  v23 = objc_msgSend(v10, sel_singleNameComponentIndex);
  if (v23)
  {
    if (v23 == (id)1)
    {
      v24 = 1;
      goto LABEL_16;
    }
LABEL_3:
    swift_bridgeObjectRelease();
LABEL_4:

    sub_18B71EFD4(&v112);
    goto LABEL_5;
  }
  v24 = 0;
LABEL_16:
  v25 = sub_18B729448();
  v107 = v13;
  if ((v26 & 1) != 0)
  {
LABEL_19:
    v105 = v24;
    v27 = 1;
    goto LABEL_21;
  }
  if (v25)
  {
    if (v25 == 1)
      goto LABEL_19;
    goto LABEL_3;
  }
  v105 = v24;
  v27 = 0;
LABEL_21:
  v28 = objc_msgSend(v10, sel_firstNameComponent);
  sub_18B72937C();

  v29 = (void *)sub_18B729358();
  IsSuitableForArabicJustification = CTStringIsSuitableForArabicJustification();
  swift_bridgeObjectRelease();

  if ((IsSuitableForArabicJustification & 1) != 0
    || (v31 = (void *)sub_18B729358(), v32 = CTStringIsSuitableForArabicJustification(), v31, v32))
  {
    v105 = 0;
    v27 = 0;
  }
  v102 = v27;
  v98 = (void *)objc_opt_self();
  objc_msgSend(v98, sel_defaultSecondaryNameFontSize);
  v33 = objc_msgSend(a3, sel_fontWithSize_);
  v34 = objc_msgSend(v10, sel_firstNameComponent);
  v35 = sub_18B72937C();
  v37 = v36;

  v38 = v33;
  v39 = a2;
  swift_bridgeObjectRetain();
  v106 = v35;
  sub_18B70A89C(v35, v37, v38, (uint64_t)&v144);
  v83 = v144;
  v95 = v145;
  v40 = v146;
  v41 = v147;
  v91 = v149;
  v93 = v148;
  v88 = v151;
  v89 = v150;
  v86 = v153;
  v87 = v152;
  v84 = v155;
  v85 = v154;
  v82 = v156;
  v42 = v38;
  swift_bridgeObjectRetain_n();
  v43 = v42;
  v101 = v39;
  swift_bridgeObjectRetain();
  sub_18B70A89C(v107, v15, v43, (uint64_t)&v157);
  v72 = v157;
  v80 = v158;
  v44 = v160;
  v78 = v159;
  v45 = v161;
  v46 = v162;
  v47 = v163;
  v48 = v164;
  v49 = v165;
  v74 = v167;
  v76 = v166;
  v73 = v168;
  v71 = v169;
  swift_bridgeObjectRetain();
  v50 = v37;
  swift_bridgeObjectRelease();
  v97 = v37;
  if ((v102 & 1) != 0)
  {
    v51 = v43;
    v52 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
    v53 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_idealEmphasizedFontSizeForHorizontalName_nonEmphasizedText_nonEmphasizedFont_emphasizedNameIsTopName_, v52, v53, v51, 0);
    v54 = v40;
    v56 = v55;

    v57 = objc_msgSend(a3, sel_fontWithSize_, v56);
    swift_bridgeObjectRetain();
    v58 = v57;
    sub_18B70A89C(v107, v15, v58, (uint64_t)&v170);
    v75 = v170;
    v79 = v173;
    v81 = v172;
    v77 = v174;
    v103 = v175;
    v59 = v41;
    v60 = v176;
    v61 = v177;
    v99 = v178;
    sub_18B70AC94((uint64_t)&v157);

    *(_DWORD *)v116 = *(_DWORD *)v110;
    *(_DWORD *)&v116[3] = *(_DWORD *)&v110[3];
    *(_DWORD *)v132 = *(_DWORD *)v108;
    *(_DWORD *)&v132[3] = *(_DWORD *)&v108[3];
    *(_QWORD *)&v112 = v106;
    *((_QWORD *)&v112 + 1) = v37;
    v113 = v101;
    v114 = v51;
    v115 = 0;
    v117 = v83;
    v118 = v95;
    *(_QWORD *)&v119 = v54;
    *((_QWORD *)&v119 + 1) = v59;
    *(_QWORD *)&v120 = v93;
    *((_QWORD *)&v120 + 1) = v91;
    *(_QWORD *)&v121 = v89;
    *((_QWORD *)&v121 + 1) = v88;
    *(_QWORD *)&v122 = v87;
    *((_QWORD *)&v122 + 1) = v86;
    v123 = v85;
    v124 = v84;
    v125 = v82;
    *(_DWORD *)&v126[3] = *(_DWORD *)&v109[3];
    *(_DWORD *)v126 = *(_DWORD *)v109;
    v127 = v107;
    v128 = v15;
    v129 = v101;
    v130 = v58;
    v131 = 0;
    v133 = v75;
    v134 = v171;
    v135 = v81;
    v136 = v79;
    v137 = v77;
    v138 = v103;
    v139 = v60;
    v140 = v61;
    v141 = v99;
    v142 = 1;
  }
  else
  {
    v62 = v43;
    v63 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
    v64 = (void *)sub_18B729358();
    swift_bridgeObjectRelease();
    objc_msgSend(v98, sel_idealEmphasizedFontSizeForHorizontalName_nonEmphasizedText_nonEmphasizedFont_emphasizedNameIsTopName_, v63, v64, v62, 1);
    v66 = v65;

    v67 = objc_msgSend(a3, sel_fontWithSize_, v66);
    swift_bridgeObjectRetain();
    v68 = v67;
    sub_18B70A89C(v35, v50, v68, (uint64_t)&v170);
    v90 = v170;
    v104 = v172;
    *(_OWORD *)v100 = v173;
    v94 = v175;
    v96 = v174;
    v69 = v176;
    v70 = v177;
    v92 = v178;
    sub_18B70AC94((uint64_t)&v144);

    *(_DWORD *)v116 = *(_DWORD *)v108;
    *(_DWORD *)&v116[3] = *(_DWORD *)&v108[3];
    *(_QWORD *)&v112 = v35;
    *((_QWORD *)&v112 + 1) = v97;
    v113 = v101;
    v114 = v68;
    v115 = 0;
    v117 = v90;
    v118 = v171;
    v119 = v104;
    v120 = *(_OWORD *)v100;
    v121 = v96;
    v122 = v94;
    v123 = v69;
    v124 = v70;
    v125 = v92;
    *(_DWORD *)&v126[3] = *(_DWORD *)&v109[3];
    *(_DWORD *)v126 = *(_DWORD *)v109;
    v127 = v107;
    v128 = v15;
    v129 = v101;
    v130 = v62;
    v131 = 0;
    *(_DWORD *)&v132[3] = *(_DWORD *)&v111[3];
    *(_DWORD *)v132 = *(_DWORD *)v111;
    v133 = v72;
    v134 = v80;
    *(_QWORD *)&v135 = v78;
    *((_QWORD *)&v135 + 1) = v44;
    *(_QWORD *)&v136 = v45;
    *((_QWORD *)&v136 + 1) = v46;
    *(_QWORD *)&v137 = v47;
    *((_QWORD *)&v137 + 1) = v48;
    *(_QWORD *)&v138 = v49;
    *((_QWORD *)&v138 + 1) = v76;
    v139 = v74;
    v140 = v73;
    v141 = v71;
    v142 = 0;
  }
  v143 = v105;
  nullsub_1(&v112);
LABEL_5:
  sub_18B709750((uint64_t)&v112, (uint64_t)v179, qword_1EDFD4E70);
  return sub_18B709750((uint64_t)v179, a5, qword_1EDFD4E70);
}

void *sub_18B71EB0C@<X0>(void *a1@<X0>, void *a2@<X1>, void *a3@<X2>, void *a4@<X8>)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _OWORD *v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  char v21;
  uint64_t v22;
  char v23;
  void *v24;
  unsigned int IsSuitableForVerticalLayout;
  uint64_t v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  id v31;
  id v32;
  uint64_t v33;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _OWORD v41[19];
  _BYTE v42[7];
  _OWORD v43[19];
  _BYTE v44[304];
  uint64_t v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  char v52;
  _BYTE __src[304];
  _OWORD __dst[19];
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  char v58;
  uint64_t v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  sub_18B71E2F4(v7, v8, v9, 0, (uint64_t)v44);
  sub_18B709750((uint64_t)v44, (uint64_t)__src, qword_1EDFD4E70);
  if (sub_18B708DD4((uint64_t)__src) == 1)
  {
    v10 = objc_msgSend((id)objc_opt_self(), sel_posterNameComponentsForContact_, v7);
    v11 = objc_msgSend(v10, sel_firstNameComponent);

    v12 = sub_18B72937C();
    v14 = v13;

LABEL_11:
    v24 = (void *)sub_18B729358();
    IsSuitableForVerticalLayout = CTStringIsSuitableForVerticalLayout();

    v26 = IsSuitableForVerticalLayout;
    v27 = (void *)objc_opt_self();
    v28 = (void *)sub_18B729358();
    objc_msgSend(v27, sel_idealEmphasizedFontSizeForName_usingLayout_, v28, v26);
    v30 = v29;

    v31 = objc_msgSend(v9, sel_fontWithSize_, v30);
    swift_bridgeObjectRetain();
    v32 = v31;
    sub_18B70A89C(v12, v14, v32, (uint64_t)&v45);
    v33 = v45;
    LOBYTE(v28) = v52;

    *(_DWORD *)((char *)&v43[2] + 1) = *(_DWORD *)v42;
    DWORD1(v43[2]) = *(_DWORD *)&v42[3];
    *(_QWORD *)&v43[0] = v12;
    *((_QWORD *)&v43[0] + 1) = v14;
    *(_QWORD *)&v43[1] = v8;
    *((_QWORD *)&v43[1] + 1) = v32;
    LOBYTE(v43[2]) = 0;
    *((_QWORD *)&v43[2] + 1) = v33;
    v43[3] = v46;
    v43[4] = v47;
    v43[5] = v48;
    v43[6] = v49;
    v43[7] = v50;
    v43[8] = v51;
    LOBYTE(v43[9]) = (_BYTE)v28;
    sub_18B719288((uint64_t)v43);
    v15 = v43;
    goto LABEL_12;
  }
  memcpy(__dst, __src, 0x12BuLL);
  memcpy(v43, __src, 0x12BuLL);
  if (!sub_18B71D574(0))
  {
    v16 = objc_msgSend((id)objc_opt_self(), sel_stringFromContact_style_, v7, 0);
    if (v16)
    {
      v17 = v16;
      v12 = sub_18B72937C();
      v14 = v18;

      sub_18B71972C((uint64_t)v44, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B71EF30);
    }
    else
    {
      if ((BYTE10(__dst[18]) & 1) != 0)
      {
        v41[2] = *(_OWORD *)((char *)&__dst[11] + 8);
        v41[3] = *(_OWORD *)((char *)&__dst[12] + 8);
        v41[4] = *(_OWORD *)((char *)&__dst[13] + 8);
        v41[5] = *(_OWORD *)((char *)&__dst[14] + 8);
        v41[0] = *(_OWORD *)((char *)&__dst[9] + 8);
        v41[1] = *(_OWORD *)((char *)&__dst[10] + 8);
        v41[6] = *(_OWORD *)((char *)&__dst[15] + 8);
        v41[7] = *(_OWORD *)((char *)&__dst[16] + 8);
        LOBYTE(v41[9]) = BYTE8(__dst[18]);
        v41[8] = *(_OWORD *)((char *)&__dst[17] + 8);
      }
      else
      {
        v41[6] = __dst[6];
        v41[7] = __dst[7];
        v41[8] = __dst[8];
        LOBYTE(v41[9]) = __dst[9];
        v41[2] = __dst[2];
        v41[3] = __dst[3];
        v41[4] = __dst[4];
        v41[5] = __dst[5];
        v41[0] = __dst[0];
        v41[1] = __dst[1];
      }
      v19 = *((_QWORD *)&v41[2] + 1);
      v39 = v41[6];
      v40 = v41[5];
      v20 = v41[8];
      v21 = v41[2];
      v22 = *((_QWORD *)&v41[1] + 1);
      v12 = *(_QWORD *)&v41[0];
      v23 = v41[9] & 1;
      v37 = v41[4];
      v38 = v41[7];
      v35 = *(_OWORD *)((char *)v41 + 8);
      v36 = v41[3];
      sub_18B708DEC(v41);
      sub_18B71972C((uint64_t)v44, (void (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, int))sub_18B71EF30);
      v55 = v12;
      v56 = v35;
      v57 = v22;
      v58 = v21;
      v59 = v19;
      v60 = v36;
      v61 = v37;
      v62 = v40;
      v63 = v39;
      v64 = v38;
      v65 = v20;
      v14 = v35;
      v66 = v23;
      swift_bridgeObjectRetain();
      sub_18B709000((uint64_t)&v55);
    }
    goto LABEL_11;
  }

  memcpy(v41, v43, 0x12BuLL);
  sub_18B719240((uint64_t)v41);
  v15 = v41;
LABEL_12:
  sub_18B7086A4(v15, &v55);
  return sub_18B7086A4(&v55, a4);
}

void sub_18B71EF30(uint64_t a1, uint64_t a2, void *a3, void *a4, uint64_t a5, uint64_t a6, uint64_t a7, void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,void *a22,void *a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{
  if (a2)
  {
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();

    swift_bridgeObjectRelease();
  }
}

double sub_18B71EFD4(_OWORD *a1)
{
  double result;

  result = 0.0;
  a1[16] = 0u;
  a1[17] = 0u;
  a1[14] = 0u;
  a1[15] = 0u;
  a1[12] = 0u;
  a1[13] = 0u;
  a1[10] = 0u;
  a1[11] = 0u;
  a1[8] = 0u;
  a1[9] = 0u;
  a1[6] = 0u;
  a1[7] = 0u;
  a1[4] = 0u;
  a1[5] = 0u;
  a1[2] = 0u;
  a1[3] = 0u;
  *a1 = 0u;
  a1[1] = 0u;
  *(_OWORD *)((char *)a1 + 283) = 0u;
  return result;
}

_QWORD *sub_18B71F008(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;

  v2 = (void *)a1[2];
  v3 = (void *)a1[3];
  v4 = (void *)a1[7];
  v5 = (void *)a1[21];
  v6 = (void *)a1[22];
  v7 = (void *)a1[26];
  swift_bridgeObjectRetain();
  v8 = v2;
  v9 = v3;
  swift_bridgeObjectRetain();
  v10 = v4;
  swift_bridgeObjectRetain();
  v11 = v5;
  v12 = v6;
  swift_bridgeObjectRetain();
  v13 = v7;
  return a1;
}

uint64_t sub_18B71F094(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 16);
  v3 = *(void **)(a1 + 24);
  v4 = *(void **)(a1 + 56);
  v5 = *(void **)(a1 + 168);
  v6 = *(void **)(a1 + 176);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t _s10NameFormatV13NameComponentOwst(_BYTE *a1, unsigned int a2, unsigned int a3)
{
  int v3;
  uint64_t v4;

  if (a3 + 1 >= 0xFFFF00)
    v3 = 4;
  else
    v3 = 2;
  if ((a3 + 1) >> 8 < 0xFF)
    LODWORD(v4) = 1;
  else
    LODWORD(v4) = v3;
  if (a3 >= 0xFF)
    v4 = v4;
  else
    v4 = 0;
  if (a2 <= 0xFE)
    return ((uint64_t (*)(void))((char *)&loc_18B71F170 + 4 * byte_18B73C6B1[v4]))();
  *a1 = a2 + 1;
  return ((uint64_t (*)(void))((char *)sub_18B71F1A4 + 4 * byte_18B73C6AC[v4]))();
}

uint64_t sub_18B71F1A4(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B71F1AC(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x18B71F1B4);
  return result;
}

uint64_t sub_18B71F1C0(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x18B71F1C8);
  *(_BYTE *)result = a2 + 1;
  return result;
}

uint64_t sub_18B71F1CC(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_18B71F1D4(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

ValueMetadata *_s10NameFormatV13NameComponentOMa()
{
  return &_s10NameFormatV13NameComponentON;
}

void _s10NameFormatVwxx(id *a1)
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

uint64_t _s10NameFormatVwcp(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  uint64_t *v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v4 = *a2;
  v3 = a2[1];
  v5 = (void *)a2[2];
  v6 = (void *)a2[3];
  v7 = *((_BYTE *)a2 + 32);
  v8 = a2[5];
  v9 = a2[6];
  v10 = (void *)a2[7];
  v11 = *((_OWORD *)a2 + 5);
  *(_OWORD *)(a1 + 64) = *((_OWORD *)a2 + 4);
  *(_OWORD *)(a1 + 80) = v11;
  v13 = a2[19];
  v12 = a2 + 19;
  v14 = *(_OWORD *)(v12 - 5);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(v12 - 7);
  *(_OWORD *)(a1 + 112) = v14;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(v12 - 3);
  *(_QWORD *)(a1 + 152) = v13;
  v15 = *((_OWORD *)v12 + 5);
  *(_OWORD *)(a1 + 216) = *((_OWORD *)v12 + 4);
  *(_OWORD *)(a1 + 232) = v15;
  v16 = *((_OWORD *)v12 + 6);
  *(_OWORD *)(a1 + 264) = *((_OWORD *)v12 + 7);
  *(_QWORD *)a1 = v4;
  *(_QWORD *)(a1 + 8) = v3;
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v6;
  *(_BYTE *)(a1 + 32) = v7;
  *(_QWORD *)(a1 + 40) = v8;
  *(_QWORD *)(a1 + 48) = v9;
  *(_QWORD *)(a1 + 56) = v10;
  *(_BYTE *)(a1 + 144) = *((_BYTE *)v12 - 8);
  v17 = (void *)v12[2];
  *(_QWORD *)(a1 + 160) = v12[1];
  *(_QWORD *)(a1 + 168) = v17;
  v18 = (void *)v12[3];
  *(_QWORD *)(a1 + 176) = v18;
  *(_BYTE *)(a1 + 184) = *((_BYTE *)v12 + 32);
  v19 = v12[6];
  *(_QWORD *)(a1 + 192) = v12[5];
  *(_QWORD *)(a1 + 200) = v19;
  v20 = (void *)v12[7];
  *(_QWORD *)(a1 + 208) = v20;
  *(_OWORD *)(a1 + 248) = v16;
  v21 = v12[17];
  *(_QWORD *)(a1 + 280) = v12[16];
  *(_QWORD *)(a1 + 288) = v21;
  *(_BYTE *)(a1 + 296) = *((_BYTE *)v12 + 144);
  *(_BYTE *)(a1 + 297) = *((_BYTE *)v12 + 145);
  *(_BYTE *)(a1 + 298) = *((_BYTE *)v12 + 146);
  swift_bridgeObjectRetain();
  v22 = v5;
  v23 = v6;
  swift_bridgeObjectRetain();
  v24 = v10;
  swift_bridgeObjectRetain();
  v25 = v17;
  v26 = v18;
  swift_bridgeObjectRetain();
  v27 = v20;
  return a1;
}

uint64_t _s10NameFormatVwca(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;

  v4 = a2 + 296;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v5 = *(void **)(a2 + 16);
  v6 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v5;
  v7 = v5;

  v8 = *(void **)(a2 + 24);
  v9 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v8;
  v10 = v8;

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v11 = *(void **)(a2 + 56);
  v12 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v11;
  v13 = v11;

  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 88) = *(_QWORD *)(a2 + 88);
  *(_QWORD *)(a1 + 96) = *(_QWORD *)(a2 + 96);
  *(_QWORD *)(a1 + 104) = *(_QWORD *)(a2 + 104);
  *(_QWORD *)(a1 + 112) = *(_QWORD *)(a2 + 112);
  *(_QWORD *)(a1 + 120) = *(_QWORD *)(a2 + 120);
  *(_QWORD *)(a1 + 128) = *(_QWORD *)(a2 + 128);
  *(_QWORD *)(a1 + 136) = *(_QWORD *)(a2 + 136);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  *(_QWORD *)(a1 + 160) = *(_QWORD *)(a2 + 160);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v14 = *(void **)(a2 + 168);
  v15 = *(void **)(a1 + 168);
  *(_QWORD *)(a1 + 168) = v14;
  v16 = v14;

  v17 = *(void **)(a2 + 176);
  v18 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = v17;
  v19 = v17;

  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  *(_QWORD *)(a1 + 200) = *(_QWORD *)(a2 + 200);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v20 = *(void **)(a2 + 208);
  v21 = *(void **)(a1 + 208);
  *(_QWORD *)(a1 + 208) = v20;
  v22 = v20;

  *(_QWORD *)(a1 + 216) = *(_QWORD *)(a2 + 216);
  *(_QWORD *)(a1 + 224) = *(_QWORD *)(a2 + 224);
  *(_QWORD *)(a1 + 232) = *(_QWORD *)(a2 + 232);
  *(_QWORD *)(a1 + 240) = *(_QWORD *)(a2 + 240);
  *(_QWORD *)(a1 + 248) = *(_QWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 256) = *(_QWORD *)(a2 + 256);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_QWORD *)(a1 + 272) = *(_QWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 280) = *(_QWORD *)(a2 + 280);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_BYTE *)(a1 + 296) = *(_BYTE *)(a2 + 296);
  *(_BYTE *)(a1 + 297) = *(_BYTE *)(v4 + 1);
  *(_BYTE *)(a1 + 298) = *(_BYTE *)(v4 + 2);
  return a1;
}

uint64_t _s10NameFormatVwta(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a2 + 296;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 16);
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);

  v6 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);

  *(_BYTE *)(a1 + 32) = *(_BYTE *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_bridgeObjectRelease();
  v7 = *(void **)(a1 + 56);
  *(_OWORD *)(a1 + 48) = *(_OWORD *)(a2 + 48);

  v8 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v8;
  v9 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)(a1 + 96) = *(_OWORD *)(a2 + 96);
  *(_OWORD *)(a1 + 112) = v9;
  *(_OWORD *)(a1 + 128) = *(_OWORD *)(a2 + 128);
  *(_BYTE *)(a1 + 144) = *(_BYTE *)(a2 + 144);
  *(_QWORD *)(a1 + 152) = *(_QWORD *)(a2 + 152);
  swift_bridgeObjectRelease();
  v10 = *(void **)(a1 + 168);
  *(_OWORD *)(a1 + 160) = *(_OWORD *)(a2 + 160);

  v11 = *(void **)(a1 + 176);
  *(_QWORD *)(a1 + 176) = *(_QWORD *)(a2 + 176);

  *(_BYTE *)(a1 + 184) = *(_BYTE *)(a2 + 184);
  *(_QWORD *)(a1 + 192) = *(_QWORD *)(a2 + 192);
  swift_bridgeObjectRelease();
  v12 = *(void **)(a1 + 208);
  *(_OWORD *)(a1 + 200) = *(_OWORD *)(a2 + 200);

  *(_OWORD *)(a1 + 216) = *(_OWORD *)(a2 + 216);
  *(_OWORD *)(a1 + 232) = *(_OWORD *)(a2 + 232);
  *(_OWORD *)(a1 + 248) = *(_OWORD *)(a2 + 248);
  *(_QWORD *)(a1 + 264) = *(_QWORD *)(a2 + 264);
  *(_OWORD *)(a1 + 272) = *(_OWORD *)(a2 + 272);
  *(_QWORD *)(a1 + 288) = *(_QWORD *)(a2 + 288);
  *(_BYTE *)(a1 + 296) = *(_BYTE *)(a2 + 296);
  *(_BYTE *)(a1 + 297) = *(_BYTE *)(v4 + 1);
  *(_BYTE *)(a1 + 298) = *(_BYTE *)(v4 + 2);
  return a1;
}

uint64_t _s10NameFormatVwet(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 299))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t _s10NameFormatVwst(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_OWORD *)(result + 248) = 0u;
    *(_OWORD *)(result + 232) = 0u;
    *(_OWORD *)(result + 216) = 0u;
    *(_OWORD *)(result + 200) = 0u;
    *(_OWORD *)(result + 184) = 0u;
    *(_OWORD *)(result + 168) = 0u;
    *(_OWORD *)(result + 152) = 0u;
    *(_OWORD *)(result + 136) = 0u;
    *(_OWORD *)(result + 120) = 0u;
    *(_OWORD *)(result + 104) = 0u;
    *(_OWORD *)(result + 88) = 0u;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_BYTE *)(result + 298) = 0;
    *(_WORD *)(result + 296) = 0;
    *(_OWORD *)(result + 280) = 0u;
    *(_OWORD *)(result + 264) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 299) = 1;
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
    *(_BYTE *)(result + 299) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *_s10NameFormatVMa()
{
  return &_s10NameFormatVN;
}

unint64_t sub_18B71F7B4()
{
  unint64_t result;

  result = qword_1EDFD9218;
  if (!qword_1EDFD9218)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73C7CC, &_s10NameFormatV13NameComponentON);
    atomic_store(result, (unint64_t *)&qword_1EDFD9218);
  }
  return result;
}

void destroy for MarqueeLabel(id *a1)
{

  swift_bridgeObjectRelease();
}

uint64_t initializeWithCopy for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v3 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_OWORD *)(a1 + 8) = *(_OWORD *)(a2 + 8);
  v4 = *(void **)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v4;
  v5 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v5;
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  v6 = v3;
  swift_bridgeObjectRetain();
  v7 = v4;
  v8 = v5;
  return a1;
}

uint64_t assignWithCopy for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)a2;
  v5 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v4;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = *(void **)(a2 + 32);
  v8 = *(void **)(a1 + 32);
  *(_QWORD *)(a1 + 32) = v7;
  v9 = v7;

  v10 = *(void **)(a1 + 40);
  v11 = *(void **)(a2 + 40);
  *(_QWORD *)(a1 + 40) = v11;
  v12 = v11;

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

__n128 __swift_memcpy50_8(uint64_t a1, uint64_t a2)
{
  __n128 result;
  __int128 v3;
  __int128 v4;

  result = *(__n128 *)a2;
  v3 = *(_OWORD *)(a2 + 16);
  v4 = *(_OWORD *)(a2 + 32);
  *(_WORD *)(a1 + 48) = *(_WORD *)(a2 + 48);
  *(_OWORD *)(a1 + 16) = v3;
  *(_OWORD *)(a1 + 32) = v4;
  *(__n128 *)a1 = result;
  return result;
}

uint64_t assignWithTake for MarqueeLabel(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;

  *(_QWORD *)(a1 + 8) = *(_QWORD *)(a2 + 8);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_bridgeObjectRelease();
  v5 = *(void **)(a1 + 32);
  *(_OWORD *)(a1 + 24) = *(_OWORD *)(a2 + 24);

  v6 = *(void **)(a1 + 40);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);

  *(_BYTE *)(a1 + 48) = *(_BYTE *)(a2 + 48);
  *(_BYTE *)(a1 + 49) = *(_BYTE *)(a2 + 49);
  return a1;
}

uint64_t getEnumTagSinglePayload for MarqueeLabel(uint64_t *a1, int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *((_BYTE *)a1 + 50))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *a1;
  if ((unint64_t)*a1 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for MarqueeLabel(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_WORD *)(result + 48) = 0;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 50) = 1;
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
    *(_BYTE *)(result + 50) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for MarqueeLabel()
{
  return &type metadata for MarqueeLabel;
}

void sub_18B71FA7C(void *a1)
{
  uint64_t v1;
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  CTFontRef CopyWithAttributes;
  void *v9;
  uint64_t inited;
  void *v11;
  uint64_t v12;
  id v13;
  const __CTFont *v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  CGRect v19;

  v3 = *(double *)(v1 + 8);
  objc_msgSend(a1, sel_setMinimumScaleFactor_, v3);
  v4 = *(_QWORD *)(v1 + 40);
  if (v4)
  {
    objc_msgSend(a1, sel_setAttributedText_, v4);
  }
  else
  {
    v5 = (void *)sub_18B729358();
    objc_msgSend(a1, sel_setText_, v5);

    objc_msgSend(a1, sel_setTextColor_, *(_QWORD *)(v1 + 32));
  }
  v6 = *(void **)v1;
  objc_msgSend(a1, sel_setFont_, *(_QWORD *)v1);
  objc_msgSend(v6, sel_pointSize);
  CopyWithAttributes = CTFontCreateCopyWithAttributes((CTFontRef)v6, v3 * v7, 0, 0);
  v9 = (void *)sub_18B729358();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EDFD5640);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_18B73BDC0;
  v11 = (void *)*MEMORY[0x1E0DC1138];
  *(_QWORD *)(inited + 32) = *MEMORY[0x1E0DC1138];
  type metadata accessor for CTFont(0);
  *(_QWORD *)(inited + 64) = v12;
  *(_QWORD *)(inited + 40) = CopyWithAttributes;
  v13 = v11;
  v14 = CopyWithAttributes;
  sub_18B70B218(inited);
  type metadata accessor for Key(0);
  sub_18B71FEB4();
  v15 = (void *)sub_18B729328();
  swift_bridgeObjectRelease();
  objc_msgSend(v9, sel_sizeWithAttributes_, v15);
  v17 = v16;

  objc_msgSend((id)objc_opt_self(), sel_maximumHorizontalTextBounds);
  if (CGRectGetWidth(v19) >= v17)
  {
    objc_msgSend(a1, sel_setMarqueeEnabled_, 0);
    objc_msgSend(a1, sel_setMarqueeRunning_, 0);
    v18 = 0;
  }
  else
  {
    objc_msgSend(a1, sel_setMarqueeEnabled_, 1);
    objc_msgSend(a1, sel_setMarqueeRunning_, *(unsigned __int8 *)(v1 + 48));
    v18 = *(unsigned __int8 *)(v1 + 49);
  }
  objc_msgSend(a1, sel__setMarqueeUpdatable_, v18);

}

id sub_18B71FCA0()
{
  id v0;
  double v1;
  double v2;

  v0 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3990]), sel_init);
  objc_msgSend(v0, sel_setTextAlignment_, 1);
  objc_msgSend(v0, sel_setNumberOfLines_, 1);
  objc_msgSend(v0, sel_setAdjustsFontSizeToFitWidth_, 1);
  LODWORD(v1) = 1132068864;
  objc_msgSend(v0, sel_setContentCompressionResistancePriority_forAxis_, 0, v1);
  LODWORD(v2) = 1144750080;
  objc_msgSend(v0, sel_setContentHuggingPriority_forAxis_, 1, v2);
  return v0;
}

uint64_t sub_18B71FD60()
{
  return sub_18B729154();
}

uint64_t sub_18B71FDA0()
{
  return MEMORY[0x1E0CE0788];
}

uint64_t sub_18B71FDAC()
{
  sub_18B71FE70();
  return sub_18B7291B4();
}

uint64_t sub_18B71FDFC()
{
  sub_18B71FE70();
  return sub_18B729160();
}

void sub_18B71FE4C()
{
  sub_18B71FE70();
  sub_18B7291A8();
  __break(1u);
}

unint64_t sub_18B71FE70()
{
  unint64_t result;

  result = qword_1EDFD5470;
  if (!qword_1EDFD5470)
  {
    result = MEMORY[0x18D77C8E0](&unk_18B73C80C, &type metadata for MarqueeLabel);
    atomic_store(result, (unint64_t *)&qword_1EDFD5470);
  }
  return result;
}

unint64_t sub_18B71FEB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1EDFD55C8;
  if (!qword_1EDFD55C8)
  {
    type metadata accessor for Key(255);
    result = MEMORY[0x18D77C8E0](&unk_18B73B4A8, v1);
    atomic_store(result, (unint64_t *)&qword_1EDFD55C8);
  }
  return result;
}

uint64_t sub_18B71FEFC()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

void NSStringFromPRPosterSnapshotDefinitionLayerSet_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull NSStringFromPRPosterSnapshotDefinitionLayerSet(PRPosterSnapshotDefinitionLayerSet)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void NSStringFromPRPosterGalleryPresentationStyle_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable NSStringFromPRPosterGalleryPresentationStyle(PRPosterGalleryPresentationStyle)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

void NSStringFromPRPosterGalleryDisplayStyle_cold_1()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nullable NSStringFromPRPosterGalleryDisplayStyle(PRPosterGalleryDisplayStyle)");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_3();
  OUTLINED_FUNCTION_0_4(&dword_18B634000, MEMORY[0x1E0C81028], v1, "failure in %{public}@ (%{public}@:%i) : %{public}@", v2, v3, v4, v5, v6);

  OUTLINED_FUNCTION_2_0();
}

uint64_t sub_18B728E48()
{
  return MEMORY[0x1E0CAE438]();
}

uint64_t sub_18B728E54()
{
  return MEMORY[0x1E0CAE488]();
}

uint64_t sub_18B728E60()
{
  return MEMORY[0x1E0CAE4A8]();
}

uint64_t sub_18B728E6C()
{
  return MEMORY[0x1E0CAE4B8]();
}

uint64_t sub_18B728E78()
{
  return MEMORY[0x1E0CD81B8]();
}

uint64_t sub_18B728E84()
{
  return MEMORY[0x1E0CAEF48]();
}

uint64_t sub_18B728E90()
{
  return MEMORY[0x1E0CAEF60]();
}

uint64_t sub_18B728E9C()
{
  return MEMORY[0x1E0CAF1D8]();
}

uint64_t sub_18B728EA8()
{
  return MEMORY[0x1E0CAF240]();
}

uint64_t sub_18B728EB4()
{
  return MEMORY[0x1E0CAF278]();
}

uint64_t sub_18B728EC0()
{
  return MEMORY[0x1E0CAF458]();
}

uint64_t sub_18B728ECC()
{
  return MEMORY[0x1E0CAF460]();
}

uint64_t sub_18B728ED8()
{
  return MEMORY[0x1E0CD81F8]();
}

uint64_t sub_18B728EE4()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_18B728EF0()
{
  return MEMORY[0x1E0CB0138]();
}

uint64_t sub_18B728EFC()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_18B728F08()
{
  return MEMORY[0x1E0CB01F8]();
}

uint64_t sub_18B728F14()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_18B728F20()
{
  return MEMORY[0x1E0CB03B8]();
}

uint64_t sub_18B728F2C()
{
  return MEMORY[0x1E0CB03C0]();
}

uint64_t sub_18B728F38()
{
  return MEMORY[0x1E0CB06B8]();
}

uint64_t sub_18B728F44()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_18B728F50()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_18B728F5C()
{
  return MEMORY[0x1E0CAA578]();
}

uint64_t sub_18B728F68()
{
  return MEMORY[0x1E0CAA580]();
}

uint64_t sub_18B728F74()
{
  return MEMORY[0x1E0CAA5B0]();
}

uint64_t sub_18B728F80()
{
  return MEMORY[0x1E0CAA5B8]();
}

uint64_t sub_18B728F8C()
{
  return MEMORY[0x1E0D20EF8]();
}

uint64_t sub_18B728F98()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_18B728FA4()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_18B728FB0()
{
  return MEMORY[0x1E0DF2268]();
}

uint64_t sub_18B728FBC()
{
  return MEMORY[0x1E0C95ED8]();
}

uint64_t sub_18B728FC8()
{
  return MEMORY[0x1E0C96150]();
}

uint64_t sub_18B728FD4()
{
  return MEMORY[0x1E0C96168]();
}

uint64_t sub_18B728FE0()
{
  return MEMORY[0x1E0C96170]();
}

uint64_t sub_18B728FEC()
{
  return MEMORY[0x1E0C96178]();
}

uint64_t sub_18B728FF8()
{
  return MEMORY[0x1E0C96198]();
}

uint64_t sub_18B729004()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_18B729010()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_18B72901C()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_18B729028()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_18B729034()
{
  return MEMORY[0x1E0CD8E18]();
}

uint64_t sub_18B729040()
{
  return MEMORY[0x1E0CD8E28]();
}

uint64_t sub_18B72904C()
{
  return MEMORY[0x1E0CD8E30]();
}

uint64_t sub_18B729058()
{
  return MEMORY[0x1E0CD8E38]();
}

uint64_t sub_18B729064()
{
  return MEMORY[0x1E0CD9210]();
}

uint64_t sub_18B729070()
{
  return MEMORY[0x1E0CD94E8]();
}

uint64_t sub_18B72907C()
{
  return MEMORY[0x1E0CDA750]();
}

uint64_t sub_18B729088()
{
  return MEMORY[0x1E0CDA758]();
}

uint64_t sub_18B729094()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_18B7290A0()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_18B7290AC()
{
  return MEMORY[0x1E0CDA9D0]();
}

uint64_t sub_18B7290B8()
{
  return MEMORY[0x1E0CDA9E0]();
}

uint64_t sub_18B7290C4()
{
  return MEMORY[0x1E0CDAC60]();
}

uint64_t sub_18B7290D0()
{
  return MEMORY[0x1E0CDAC78]();
}

uint64_t sub_18B7290DC()
{
  return MEMORY[0x1E0CDAC88]();
}

uint64_t sub_18B7290E8()
{
  return MEMORY[0x1E0CDAC98]();
}

uint64_t sub_18B7290F4()
{
  return MEMORY[0x1E0CDACB8]();
}

uint64_t sub_18B729100()
{
  return MEMORY[0x1E0CDB420]();
}

uint64_t sub_18B72910C()
{
  return MEMORY[0x1E0CDB5C8]();
}

uint64_t sub_18B729118()
{
  return MEMORY[0x1E0CDB5D0]();
}

uint64_t sub_18B729124()
{
  return MEMORY[0x1E0CDB5F0]();
}

uint64_t sub_18B729130()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_18B72913C()
{
  return MEMORY[0x1E0CDB658]();
}

uint64_t sub_18B729148()
{
  return MEMORY[0x1E0CDB668]();
}

uint64_t sub_18B729154()
{
  return MEMORY[0x1E0CDB678]();
}

uint64_t sub_18B729160()
{
  return MEMORY[0x1E0CDB688]();
}

uint64_t sub_18B72916C()
{
  return MEMORY[0x1E0CDB698]();
}

uint64_t sub_18B729178()
{
  return MEMORY[0x1E0CDB6A8]();
}

uint64_t sub_18B729184()
{
  return MEMORY[0x1E0CDB6B8]();
}

uint64_t sub_18B729190()
{
  return MEMORY[0x1E0CDB6D0]();
}

uint64_t sub_18B72919C()
{
  return MEMORY[0x1E0CDB6E0]();
}

uint64_t sub_18B7291A8()
{
  return MEMORY[0x1E0CDB6F0]();
}

uint64_t sub_18B7291B4()
{
  return MEMORY[0x1E0CDB6F8]();
}

uint64_t sub_18B7291C0()
{
  return MEMORY[0x1E0CDB708]();
}

uint64_t sub_18B7291CC()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_18B7291D8()
{
  return MEMORY[0x1E0CDD0A0]();
}

uint64_t sub_18B7291E4()
{
  return MEMORY[0x1E0CDD0A8]();
}

uint64_t sub_18B7291F0()
{
  return MEMORY[0x1E0CDD0B0]();
}

uint64_t sub_18B7291FC()
{
  return MEMORY[0x1E0CDD860]();
}

uint64_t sub_18B729208()
{
  return MEMORY[0x1E0CDDAB8]();
}

uint64_t sub_18B729214()
{
  return MEMORY[0x1E0CDDAC0]();
}

uint64_t sub_18B729220()
{
  return MEMORY[0x1E0CDDAD0]();
}

uint64_t sub_18B72922C()
{
  return MEMORY[0x1E0CDDAD8]();
}

uint64_t sub_18B729238()
{
  return MEMORY[0x1E0CDDB98]();
}

uint64_t sub_18B729244()
{
  return MEMORY[0x1E0CDDC48]();
}

uint64_t sub_18B729250()
{
  return MEMORY[0x1E0CDDDC0]();
}

uint64_t sub_18B72925C()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_18B729268()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_18B729274()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_18B729280()
{
  return MEMORY[0x1E0CDE188]();
}

uint64_t sub_18B72928C()
{
  return MEMORY[0x1E0CDE318]();
}

uint64_t sub_18B729298()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_18B7292A4()
{
  return MEMORY[0x1E0CDF4A8]();
}

uint64_t sub_18B7292B0()
{
  return MEMORY[0x1E0CDF4D0]();
}

uint64_t sub_18B7292BC()
{
  return MEMORY[0x1E0CDF628]();
}

uint64_t sub_18B7292C8()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_18B7292D4()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_18B7292E0()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_18B7292EC()
{
  return MEMORY[0x1E0CE0280]();
}

uint64_t sub_18B7292F8()
{
  return MEMORY[0x1E0CE02B0]();
}

uint64_t sub_18B729304()
{
  return MEMORY[0x1E0CE02C8]();
}

uint64_t sub_18B729310()
{
  return MEMORY[0x1E0CE02D8]();
}

uint64_t sub_18B72931C()
{
  return MEMORY[0x1E0CE06D0]();
}

uint64_t sub_18B729328()
{
  return MEMORY[0x1E0CB17D8]();
}

uint64_t sub_18B729334()
{
  return MEMORY[0x1E0CB1808]();
}

uint64_t sub_18B729340()
{
  return MEMORY[0x1E0DEA1C8]();
}

uint64_t sub_18B72934C()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_18B729358()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_18B729364()
{
  return MEMORY[0x1E0CB1960]();
}

uint64_t sub_18B729370()
{
  return MEMORY[0x1E0CB1970]();
}

uint64_t sub_18B72937C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_18B729388()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_18B729394()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_18B7293A0()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_18B7293AC()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_18B7293B8()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_18B7293C4()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_18B7293D0()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_18B7293DC()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_18B7293E8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_18B7293F4()
{
  return MEMORY[0x1E0DF2278]();
}

uint64_t sub_18B729400()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_18B72940C()
{
  return MEMORY[0x1E0DC2BA8]();
}

uint64_t sub_18B729418()
{
  return MEMORY[0x1E0DC2BB0]();
}

uint64_t sub_18B729424()
{
  return MEMORY[0x1E0DC2BB8]();
}

uint64_t sub_18B729430()
{
  return MEMORY[0x1E0DC2BC0]();
}

uint64_t sub_18B72943C()
{
  return MEMORY[0x1E0CB1E68]();
}

uint64_t sub_18B729448()
{
  return MEMORY[0x1E0C965B8]();
}

uint64_t sub_18B729454()
{
  return MEMORY[0x1E0C9B9B8]();
}

uint64_t sub_18B729460()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_18B72946C()
{
  return MEMORY[0x1E0DEFCE8]();
}

uint64_t sub_18B729478()
{
  return MEMORY[0x1E0DC2FF8]();
}

uint64_t sub_18B729484()
{
  return MEMORY[0x1E0DC3258]();
}

uint64_t sub_18B729490()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_18B72949C()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_18B7294A8()
{
  return MEMORY[0x1E0CB2460]();
}

uint64_t sub_18B7294B4()
{
  return MEMORY[0x1E0DEBE50]();
}

uint64_t sub_18B7294C0()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_18B7294CC()
{
  return MEMORY[0x1E0DEC068]();
}

uint64_t sub_18B7294D8()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_18B7294E4()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_18B7294F0()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_18B7294FC()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_18B729508()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_18B729514()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_18B729520()
{
  return MEMORY[0x1E0DEC8E0]();
}

uint64_t sub_18B72952C()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_18B729538()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_18B729544()
{
  return MEMORY[0x1E0DECD38]();
}

uint64_t sub_18B729550()
{
  return MEMORY[0x1E0DECD40]();
}

uint64_t sub_18B72955C()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_18B729568()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_18B729574()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_18B729580()
{
  return MEMORY[0x1E0DECEF8]();
}

uint64_t sub_18B72958C()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_18B729598()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_18B7295A4()
{
  return MEMORY[0x1E0DEDAE8]();
}

uint64_t sub_18B7295B0()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_18B7295BC()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_18B7295C8()
{
  return MEMORY[0x1E0DEDF30]();
}

uint64_t sub_18B7295D4()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t sub_18B7295E0()
{
  return MEMORY[0x1E0DEE978]();
}

uint64_t AMUIAmbientDisplayStyleIsRedMode()
{
  return MEMORY[0x1E0CF7900]();
}

uint64_t AMUIAmbientDisplayStyleString()
{
  return MEMORY[0x1E0CF7908]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x1E0D00BF0]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x1E0D01208]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x1E0D01220]();
}

uint64_t BSDispatchQueueCreateSerial()
{
  return MEMORY[0x1E0D01240]();
}

uint64_t BSDispatchTimeWithInterval()
{
  return MEMORY[0x1E0D01258]();
}

uint64_t BSEqualArrays()
{
  return MEMORY[0x1E0D01260]();
}

uint64_t BSEqualBools()
{
  return MEMORY[0x1E0D01268]();
}

uint64_t BSEqualDoubles()
{
  return MEMORY[0x1E0D01278]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x1E0D01280]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x1E0D01290]();
}

uint64_t BSFloatEqualToFloat()
{
  return MEMORY[0x1E0D012D0]();
}

uint64_t BSFloatGreaterThanOrEqualToFloat()
{
  return MEMORY[0x1E0D012E8]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x1E0D012F0]();
}

uint64_t BSFloatIsZero()
{
  return MEMORY[0x1E0D012F8]();
}

uint64_t BSFloatLessThanFloat()
{
  return MEMORY[0x1E0D01300]();
}

uint64_t BSFloatLessThanOrEqualToFloat()
{
  return MEMORY[0x1E0D01308]();
}

uint64_t BSFloatRoundForScale()
{
  return MEMORY[0x1E0D01310]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x1E0D01348]();
}

uint64_t BSLogAddStateCaptureBlockWithTitle()
{
  return MEMORY[0x1E0D013D8]();
}

uint64_t BSPointEqualToPoint()
{
  return MEMORY[0x1E0D01480]();
}

uint64_t BSRectGetCenter()
{
  return MEMORY[0x1E0D014E8]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x1E0D014F8]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x1E0D01588]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x1E0D01590]();
}

uint64_t BSSettingFlagIfYes()
{
  return MEMORY[0x1E0D01598]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x1E0D015A8]();
}

uint64_t BSSizeSwap()
{
  return MEMORY[0x1E0D015E0]();
}

uint64_t CABackingStoreCollectWithCompletionHandler()
{
  return MEMORY[0x1E0CD2320]();
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

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x1E0CD24F8]();
}

uint64_t CARenderNotificationPostNotification()
{
  return MEMORY[0x1E0CD2548]();
}

CATransform3D *__cdecl CATransform3DMakeRotation(CATransform3D *__return_ptr retstr, CGFloat angle, CGFloat x, CGFloat y, CGFloat z)
{
  return (CATransform3D *)MEMORY[0x1E0CD2638](retstr, angle, x, y, z);
}

uint64_t CEMGetSharedEmojiCharacterSet()
{
  return MEMORY[0x1E0D15DB8]();
}

uint64_t CEMStringContainsEmoji()
{
  return MEMORY[0x1E0D15DC0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CGAffineTransform *__cdecl CGAffineTransformConcat(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t1, CGAffineTransform *t2)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BA90](retstr, t1, t2);
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

CGAffineTransform *__cdecl CGAffineTransformTranslate(CGAffineTransform *__return_ptr retstr, CGAffineTransform *t, CGFloat tx, CGFloat ty)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BB00](retstr, t, tx, ty);
}

void CGContextAddPath(CGContextRef c, CGPathRef path)
{
  MEMORY[0x1E0C9BFD8](c, path);
}

void CGContextAddRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9BFE8](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextDrawPath(CGContextRef c, CGPathDrawingMode mode)
{
  MEMORY[0x1E0C9C1B8](c, *(_QWORD *)&mode);
}

void CGContextFillPath(CGContextRef c)
{
  MEMORY[0x1E0C9C218](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

void CGContextSetStrokeColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C508](c, color);
}

uint64_t CGFontCreateFontsWithURL()
{
  return MEMORY[0x1E0C9C738]();
}

void CGPathAddEllipseInRect(CGMutablePathRef path, const CGAffineTransform *m, CGRect rect)
{
  MEMORY[0x1E0C9D2A0](path, m, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGPathRef CGPathCreateCopyByTransformingPath(CGPathRef path, const CGAffineTransform *transform)
{
  return (CGPathRef)MEMORY[0x1E0C9D358](path, transform);
}

CGMutablePathRef CGPathCreateMutable(void)
{
  return (CGMutablePathRef)MEMORY[0x1E0C9D388]();
}

CGRect CGPathGetPathBoundingBox(CGPathRef path)
{
  double v1;
  double v2;
  double v3;
  double v4;
  CGRect result;

  MEMORY[0x1E0C9D410](path);
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

void CGRectDivide(CGRect rect, CGRect *slice, CGRect *remainder, CGFloat amount, CGRectEdge edge)
{
  MEMORY[0x1E0C9D568](slice, remainder, *(_QWORD *)&edge, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, amount);
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

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x1E0C9D600]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x1E0C9D608]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CHSEdgeInsetsMake()
{
  return MEMORY[0x1E0D0FEB8]();
}

uint64_t CHSWidgetFamilyMaskFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF58]();
}

uint64_t CHSWidgetFromATXComplication()
{
  return MEMORY[0x1E0CF8BE8]();
}

uint64_t CSTimeNumberingSystemStringToType()
{
  return MEMORY[0x1E0D1BC78]();
}

uint64_t CTCopySampleStringForLanguage()
{
  return MEMORY[0x1E0CA7960]();
}

CFTypeRef CTFontCopyAttribute(CTFontRef font, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7968](font, attribute);
}

CFArrayRef CTFontCopyDefaultCascadeListForLanguages(CTFontRef font, CFArrayRef languagePrefList)
{
  return (CFArrayRef)MEMORY[0x1E0CA7980](font, languagePrefList);
}

CFStringRef CTFontCopyPostScriptName(CTFontRef font)
{
  return (CFStringRef)MEMORY[0x1E0CA79E0](font);
}

CFArrayRef CTFontCopySupportedLanguages(CTFontRef font)
{
  return (CFArrayRef)MEMORY[0x1E0CA79F0](font);
}

uint64_t CTFontCopySystemUIFontExcessiveLineHeightCharacterSet()
{
  return MEMORY[0x1E0CA79F8]();
}

CFDictionaryRef CTFontCopyVariation(CTFontRef font)
{
  return (CFDictionaryRef)MEMORY[0x1E0CA7A10](font);
}

uint64_t CTFontCopyVariationAxesInternal()
{
  return MEMORY[0x1E0CA7A20]();
}

CTFontRef CTFontCreateCopyWithAttributes(CTFontRef font, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A30](font, matrix, attributes, size);
}

CGPathRef CTFontCreatePathForGlyph(CTFontRef font, CGGlyph glyph, const CGAffineTransform *matrix)
{
  return (CGPathRef)MEMORY[0x1E0CA7A60](font, glyph, matrix);
}

CTFontRef CTFontCreateWithGraphicsFont(CGFontRef graphicsFont, CGFloat size, const CGAffineTransform *matrix, CTFontDescriptorRef attributes)
{
  return (CTFontRef)MEMORY[0x1E0CA7A80](graphicsFont, matrix, attributes, size);
}

CTFontRef CTFontCreateWithNameAndOptions(CFStringRef name, CGFloat size, const CGAffineTransform *matrix, CTFontOptions options)
{
  return (CTFontRef)MEMORY[0x1E0CA7A90](name, matrix, options, size);
}

CFTypeRef CTFontDescriptorCopyAttribute(CTFontDescriptorRef descriptor, CFStringRef attribute)
{
  return (CFTypeRef)MEMORY[0x1E0CA7AA0](descriptor, attribute);
}

uint64_t CTFontDescriptorCreateMatchingFontDescriptorsWithOptions()
{
  return MEMORY[0x1E0CA7AF8]();
}

CTFontDescriptorRef CTFontDescriptorCreateWithAttributes(CFDictionaryRef attributes)
{
  return (CTFontDescriptorRef)MEMORY[0x1E0CA7B00](attributes);
}

BOOL CTFontDescriptorMatchFontDescriptorsWithProgressHandler(CFArrayRef descriptors, CFSetRef mandatoryAttributes, CTFontDescriptorProgressHandler progressBlock)
{
  return MEMORY[0x1E0CA7B60](descriptors, mandatoryAttributes, progressBlock);
}

BOOL CTFontGetGlyphsForCharacters(CTFontRef font, const UniChar *characters, CGGlyph *glyphs, CFIndex count)
{
  return MEMORY[0x1E0CA7C08](font, characters, glyphs, count);
}

uint64_t CTFontGetLanguageAwareOutsets()
{
  return MEMORY[0x1E0CA7C10]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x1E0CA7E88](attrString);
}

uint64_t CTLineCreateWithString()
{
  return MEMORY[0x1E0CA7E98]();
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

CFArrayRef CTLineGetGlyphRuns(CTLineRef line)
{
  return (CFArrayRef)MEMORY[0x1E0CA7ED8](line);
}

uint64_t CTRunGetFont()
{
  return MEMORY[0x1E0CA7FC8]();
}

uint64_t CTStringIsSuitableForArabicJustification()
{
  return MEMORY[0x1E0CA8060]();
}

uint64_t CTStringIsSuitableForVerticalLayout()
{
  return MEMORY[0x1E0CA8068]();
}

uint64_t MGGetStringAnswer()
{
  return MEMORY[0x1E0DE2B80]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x1E0CB3158]();
}

uint64_t NSStringFromBLSAdjustedLuminance()
{
  return MEMORY[0x1E0D00EF8]();
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x1E0DC32E0]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x1E0DC32E8]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromCGSize(CGSize size)
{
  return (NSString *)MEMORY[0x1E0DC32F0]((__n128)size, *(__n128 *)&size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t NSStringFromFBSceneContentState()
{
  return MEMORY[0x1E0D22898]();
}

uint64_t NSStringFromPFServerPosterType()
{
  return MEMORY[0x1E0D7F8B0]();
}

uint64_t NSStringFromPUIPosterPreviewContent()
{
  return MEMORY[0x1E0D7FC98]();
}

uint64_t NSStringFromPUIPosterSignificantEvent()
{
  return MEMORY[0x1E0D7FCA0]();
}

uint64_t NSStringFromPUIRenderingContent()
{
  return MEMORY[0x1E0D7FCA8]();
}

uint64_t NSStringFromPUIRenderingMode()
{
  return MEMORY[0x1E0D7FCB0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

uint64_t NSStringFromWidgetFamily()
{
  return MEMORY[0x1E0D0FF90]();
}

uint64_t PFCurrentDeviceClass()
{
  return MEMORY[0x1E0D7F900]();
}

uint64_t PFPosterRoleDefaultRoleForCurrentExtensionProcess()
{
  return MEMORY[0x1E0D7F930]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x1E0D7F948]();
}

uint64_t PRSLogPosterContents()
{
  return MEMORY[0x1E0D7F748]();
}

uint64_t PRSPosterSnapshotOptionsIsFloatingLayerOnly()
{
  return MEMORY[0x1E0D7F760]();
}

uint64_t PRSPosterUpdateAmbientWidgetsIdentifiers()
{
  return MEMORY[0x1E0D7F780]();
}

uint64_t PUIDynamicRotationIsActive()
{
  return MEMORY[0x1E0D7FD40]();
}

uint64_t PUIPosterBoundingShapeFromInt()
{
  return MEMORY[0x1E0D7FD60]();
}

uint64_t PUIPosterParallaxDesiredOverhangForDeviceClass()
{
  return MEMORY[0x1E0D7FD68]();
}

uint64_t PUIPosterParallaxRequiredOverhangForDeviceClass()
{
  return MEMORY[0x1E0D7FD70]();
}

uint64_t PUIPosterSignificantEventOptionsContainsEvent()
{
  return MEMORY[0x1E0D7FD78]();
}

uint64_t PUIRenderingContentIsPreview()
{
  return MEMORY[0x1E0D7FD88]();
}

uint64_t SBHIconDragItemWithIconAndIconView()
{
  return MEMORY[0x1E0DAA748]();
}

uint64_t SBIconImageInfoEqualToIconImageInfo()
{
  return MEMORY[0x1E0DAA940]();
}

BOOL UIAccessibilityIsReduceTransparencyEnabled(void)
{
  return MEMORY[0x1E0DC4550]();
}

uint64_t UIApplicationSceneStringForUserInterfaceStyle()
{
  return MEMORY[0x1E0DC4830]();
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x1E0DC4910](category);
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

uint64_t UIIntegralTransform()
{
  return MEMORY[0x1E0DC4CF0]();
}

uint64_t UIRectCenteredIntegralRectScale()
{
  return MEMORY[0x1E0DC5250]();
}

uint64_t UIRectIntegralWithScale()
{
  return MEMORY[0x1E0DC52C8]();
}

uint64_t _AXSPrefersHorizontalTextLayout()
{
  return MEMORY[0x1E0DDDAD0]();
}

uint64_t _BSIsInternalInstall()
{
  return MEMORY[0x1E0D018D0]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _UIAccessibilityContentSizeCategoryName()
{
  return MEMORY[0x1E0DC56D0]();
}

uint64_t _UISceneSettingsDiffActionPerformChangesWithTransitionContext()
{
  return MEMORY[0x1E0DC59A0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x1E0D018D8]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint64_t _swift_stdlib_bridgeErrorToNSError()
{
  return MEMORY[0x1E0DEEA28]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

uint64_t dyld_image_path_containing_address()
{
  return MEMORY[0x1E0C83100]();
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x1E0C83A20]();
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

long double modf(long double __x, long double *__y)
{
  long double result;

  MEMORY[0x1E0C841E0](__y, __x);
  return result;
}

long double nexttoward(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C843B8](__x, __y);
  return result;
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7F88](self, _cmd, newValue, offset);
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

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
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

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
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

uint64_t swift_deallocPartialClassInstance()
{
  return MEMORY[0x1E0DEEB68]();
}

uint64_t swift_dynamicCast()
{
  return MEMORY[0x1E0DEEB80]();
}

uint64_t swift_dynamicCastUnknownClass()
{
  return MEMORY[0x1E0DEEBD0]();
}

uint64_t swift_endAccess()
{
  return MEMORY[0x1E0DEEBE0]();
}

uint64_t swift_errorRelease()
{
  return MEMORY[0x1E0DEEBF0]();
}

uint64_t swift_errorRetain()
{
  return MEMORY[0x1E0DEEBF8]();
}

uint64_t swift_getForeignTypeMetadata()
{
  return MEMORY[0x1E0DEEC78]();
}

uint64_t swift_getGenericMetadata()
{
  return MEMORY[0x1E0DEECB0]();
}

uint64_t swift_getKeyPath()
{
  return MEMORY[0x1E0DEECB8]();
}

uint64_t swift_getObjCClassMetadata()
{
  return MEMORY[0x1E0DEECD8]();
}

uint64_t swift_getObjectType()
{
  return MEMORY[0x1E0DEECE0]();
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

uint64_t swift_initClassMetadata2()
{
  return MEMORY[0x1E0DEED58]();
}

uint64_t swift_initStackObject()
{
  return MEMORY[0x1E0DEED78]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_makeBoxUnique()
{
  return MEMORY[0x1E0DEEDE8]();
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

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x1E0DEEE78]();
}

uint64_t swift_slowDealloc()
{
  return MEMORY[0x1E0DEEE80]();
}

uint64_t swift_storeEnumTagMultiPayload()
{
  return MEMORY[0x1E0DEEE98]();
}

uint64_t swift_unknownObjectRelease()
{
  return MEMORY[0x1E0DEEEC0]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectWeakAssign()
{
  return MEMORY[0x1E0DEEF20]();
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

uint64_t swift_willThrow()
{
  return MEMORY[0x1E0DEEFC0]();
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

