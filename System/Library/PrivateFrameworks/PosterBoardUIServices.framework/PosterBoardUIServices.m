void sub_2445F0B08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 208), 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
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

void sub_2445F3224(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  uint64_t v8;
  uint64_t v10;
  va_list va;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  va_list va1;

  va_start(va1, a8);
  va_start(va, a8);
  v10 = va_arg(va1, _QWORD);
  v12 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Block_object_dispose((const void *)(v8 - 144), 8);
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

void sub_2445F3918(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x3Au);
}

uint64_t OUTLINED_FUNCTION_3()
{
  return objc_opt_class();
}

BOOL PREditingAcceptButtonTypeForPRUISPosterEditingAcceptButtonType(_BOOL8 result)
{
  if (result != 2)
    return result == 1;
  return result;
}

void sub_2445F5738(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_2445FAA68(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id *location, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,id a34)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a34);
  _Unwind_Resume(a1);
}

void sub_2445FBB74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_2445FC444(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location, char a19)
{
  id *v19;

  objc_destroyWeak(v19);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a19, 8);
  _Unwind_Resume(a1);
}

void sub_2445FD344(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, id *location, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id a32)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a32);
  _Unwind_Resume(a1);
}

void sub_2445FDF20(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_2445FDF90(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

const __CFString *PRUISStringForRenderingMode(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("default");
  if (a1 == 1)
    v1 = CFSTR("paused");
  if (a1 == 2)
    return CFSTR("live");
  else
    return v1;
}

BOOL PRUISIsValidRenderingMode(unint64_t a1)
{
  return a1 < 3;
}

void sub_2446004A4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_2446015B4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t PRUISDefaultServiceQuality()
{
  return objc_msgSend(MEMORY[0x24BE38040], "userInitiated");
}

id PRUISExternallyHostedPosterEditingServiceInterface()
{
  if (PRUISExternallyHostedPosterEditingServiceInterface_onceToken != -1)
    dispatch_once(&PRUISExternallyHostedPosterEditingServiceInterface_onceToken, &__block_literal_global_10);
  return (id)PRUISExternallyHostedPosterEditingServiceInterface___interface;
}

id _PRUISIncomingCallPosterSnapshotDefinitionLevelSetsForIdentifier(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  void **v5;
  id v6;
  id v7;
  id v8;
  int v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v15;
  _QWORD v16[2];
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  v1 = a1;
  if (objc_msgSend(v1, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithObscurableContentView))
  {
    v2 = objc_alloc(MEMORY[0x24BE74E00]);
    v3 = (void *)objc_msgSend(v2, "initWithNumberOfLevels:", 5, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E58], +[PRUISPosterAppearanceObservingAttachmentProvider obscurableContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "obscurableContentAttachmentLevel"));
    v20[0] = v3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = (void **)v20;
LABEL_12:
    objc_msgSend(v4, "arrayWithObjects:count:", v5, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  if (objc_msgSend(v1, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsWithOverlay))
  {
    v6 = objc_alloc(MEMORY[0x24BE74E00]);
    v3 = (void *)objc_msgSend(v6, "initWithNumberOfLevels:", 5, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E58], +[PRUISPosterAppearanceObservingAttachmentProvider overlayContentAttachmentLevel](PRUISPosterAppearanceObservingAttachmentProvider, "overlayContentAttachmentLevel"));
    v19 = v3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = &v19;
    goto LABEL_12;
  }
  if (objc_msgSend(v1, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsOnly))
  {
    v7 = objc_alloc(MEMORY[0x24BE74E00]);
    v3 = (void *)objc_msgSend(v7, "initWithNumberOfLevels:", 4, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E58]);
    v18 = v3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = &v18;
    goto LABEL_12;
  }
  if (objc_msgSend(v1, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierIncomingCallPosterContentsExcludingBackground))
  {
    v8 = objc_alloc(MEMORY[0x24BE74E00]);
    v3 = (void *)objc_msgSend(v8, "initWithNumberOfLevels:", 3, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78]);
    v17 = v3;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = &v17;
    goto LABEL_12;
  }
  v9 = objc_msgSend(v1, "isEqualToString:", PRPosterSnapshotDefinitionIdentifierIncomingCallComposite);
  objc_msgSend(MEMORY[0x24BE74E00], "compositeLevelSet");
  v10 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v10;
  if (!v9)
  {
    v15 = v10;
    v4 = (void *)MEMORY[0x24BDBCE30];
    v5 = (void **)&v15;
    goto LABEL_12;
  }
  v16[0] = v10;
  v11 = objc_alloc(MEMORY[0x24BE74E00]);
  v12 = (void *)objc_msgSend(v11, "initWithNumberOfLevels:", 4, *MEMORY[0x24BE74E68], *MEMORY[0x24BE74E70], *MEMORY[0x24BE74E78], *MEMORY[0x24BE74E58]);
  v16[1] = v12;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v16, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_13:
  return v13;
}

uint64_t _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierIsPredefined(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  v6[4] = *MEMORY[0x24BDAC8D0];
  v6[0] = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  v6[1] = PRUISIncomingCallPosterAttachmentTypeIdentifierInCallUIOverlay;
  v6[2] = PRUISIncomingCallPosterAttachmentTypeIdentifierBoopToMeetNameLabelOverlay;
  v6[3] = PRUISIncomingCallPosterAttachmentTypeIdentifierContactCardNameLabelOverlay;
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", v6, 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2);

  return v4;
}

uint64_t _PRUISIncomingCallPosterSnapshotAttachmentTypeIdentifierWillIncludeName(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  uint64_t v4;
  __CFString *v6;
  __CFString *v7;
  __CFString *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v6 = PRUISIncomingCallPosterAttachmentTypeIdentifierNameLabel;
  v7 = PRUISIncomingCallPosterAttachmentTypeIdentifierBoopToMeetNameLabelOverlay;
  v8 = PRUISIncomingCallPosterAttachmentTypeIdentifierContactCardNameLabelOverlay;
  v1 = (void *)MEMORY[0x24BDBCE30];
  v2 = a1;
  objc_msgSend(v1, "arrayWithObjects:count:", &v6, 3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsObject:", v2, v6, v7, v8, v9);

  return v4;
}

__CFString *NSStringFromPRUISSwitcherLayoutMode(unint64_t a1)
{
  if (a1 < 6)
    return off_251535738[a1];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(unknown - %lu)"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

id PRUISSwitcherLayoutTransitionAnimationSettings()
{
  void *v0;
  CAFrameRateRange v2;

  objc_msgSend(MEMORY[0x24BE0BE48], "settingsWithMass:stiffness:damping:", 1.0, 393.99462, 36.52271);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v2.minimum, *(double *)&v2.maximum, *(double *)&v2.preferred);
  objc_msgSend(v0, "setHighFrameRateReason:", 2490369);
  return v0;
}

id PRUISSwitcherLayoutDeflationAnimationSettings()
{
  void *v0;
  CAFrameRateRange v2;

  objc_msgSend(MEMORY[0x24BE0BE48], "settingsWithMass:stiffness:damping:", 1.0, 85.25592, 18.46683);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v2.minimum, *(double *)&v2.maximum, *(double *)&v2.preferred);
  objc_msgSend(v0, "setHighFrameRateReason:", 2490369);
  return v0;
}

id PRUISSwitcherLayoutBouncingAnimationSettings()
{
  void *v0;
  CAFrameRateRange v2;

  objc_msgSend(MEMORY[0x24BE0BE48], "settingsWithMass:stiffness:damping:", 1.0, 429.11311, 29.00106);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = CAFrameRateRangeMake(80.0, 120.0, 120.0);
  objc_msgSend(v0, "setPreferredFrameRateRange:", *(double *)&v2.minimum, *(double *)&v2.maximum, *(double *)&v2.preferred);
  objc_msgSend(v0, "setHighFrameRateReason:", 2490369);
  return v0;
}

uint64_t modeFromPRUISwitcherLayoutMode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

uint64_t modeFromPRUISSwitcherLayoutMode(uint64_t result)
{
  if ((unint64_t)(result - 1) >= 5)
    return 0;
  return result;
}

void sub_244603D7C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 104));
  _Unwind_Resume(a1);
}

id PRUISLogCommon()
{
  if (PRUISLogCommon_onceToken != -1)
    dispatch_once(&PRUISLogCommon_onceToken, &__block_literal_global_11);
  return (id)PRUISLogCommon___logObj;
}

id PRUISLogRendering()
{
  if (PRUISLogRendering_onceToken != -1)
    dispatch_once(&PRUISLogRendering_onceToken, &__block_literal_global_3_1);
  return (id)PRUISLogRendering___logObj;
}

id PRUISLogSnapshotting()
{
  if (PRUISLogSnapshotting_onceToken != -1)
    dispatch_once(&PRUISLogSnapshotting_onceToken, &__block_literal_global_5_0);
  return (id)PRUISLogSnapshotting___logObj;
}

id PRUISLogSnapshotCache()
{
  if (PRUISLogSnapshotCache_onceToken != -1)
    dispatch_once(&PRUISLogSnapshotCache_onceToken, &__block_literal_global_7_0);
  return (id)PRUISLogSnapshotCache___logObj;
}

id PRUISLogAttachments()
{
  if (PRUISLogAttachments_onceToken != -1)
    dispatch_once(&PRUISLogAttachments_onceToken, &__block_literal_global_9);
  return (id)PRUISLogAttachments___logObj;
}

id PRUISLogEditing()
{
  if (PRUISLogEditing_onceToken != -1)
    dispatch_once(&PRUISLogEditing_onceToken, &__block_literal_global_11);
  return (id)PRUISLogEditing___logObj;
}

id PRUISLogRemoteEditing()
{
  if (PRUISLogRemoteEditing_onceToken != -1)
    dispatch_once(&PRUISLogRemoteEditing_onceToken, &__block_literal_global_13);
  return (id)PRUISLogRemoteEditing___logObj;
}

id _findUIWindowSceneForUIScreen(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v1 = a1;
  objc_msgSend(MEMORY[0x24BDF6FF8], "_applicationKeyWindow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", v1);

  if (v4)
  {
    objc_msgSend(v2, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "windows");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___findUIWindowSceneForUIScreen_block_invoke;
    v10[3] = &unk_251535968;
    v11 = v1;
    objc_msgSend(v7, "bs_firstObjectPassingTest:", v10);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

uint64_t ___findUIWindowSceneForUIScreen_block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqual:", *(_QWORD *)(a1 + 32));

  return v4;
}

void sub_244606308(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

__CFString *ShortNSStringFromPRUISPosterLevel(uint64_t a1)
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
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("(UNK%lu)"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    return v1;
  }
  v1 = CFSTR("BG1");
  return v1;
}

BOOL resultFromPRUISResult(uint64_t a1)
{
  return a1 == 1;
}

BOOL resultFromPRUIResult(uint64_t a1)
{
  return a1 == 1;
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_24460CA58(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_24460CBB0(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

uint64_t AMUIAmbientDisplayStyleString()
{
  return MEMORY[0x24BE039B0]();
}

uint64_t BKSTouchDeliveryPolicyServerGetProxyWithErrorHandler()
{
  return MEMORY[0x24BE0B640]();
}

uint64_t BSCurrentUserDirectory()
{
  return MEMORY[0x24BE0BAD8]();
}

uint64_t BSDispatchMain()
{
  return MEMORY[0x24BE0BB30]();
}

uint64_t BSDispatchQueueAssertMain()
{
  return MEMORY[0x24BE0BB40]();
}

uint64_t BSEqualDictionaries()
{
  return MEMORY[0x24BE0BB90]();
}

uint64_t BSEqualObjects()
{
  return MEMORY[0x24BE0BBA0]();
}

uint64_t BSEqualStrings()
{
  return MEMORY[0x24BE0BBB0]();
}

uint64_t BSFloatIsOne()
{
  return MEMORY[0x24BE0BBF0]();
}

uint64_t BSInterfaceOrientationIsLandscape()
{
  return MEMORY[0x24BE0BC20]();
}

uint64_t BSInterfaceOrientationIsValid()
{
  return MEMORY[0x24BE0BC28]();
}

uint64_t BSRectEqualToRect()
{
  return MEMORY[0x24BE0BCA0]();
}

uint64_t BSRectWithSize()
{
  return MEMORY[0x24BE0BCC0]();
}

uint64_t BSSettingFlagDescription()
{
  return MEMORY[0x24BE0BD20]();
}

uint64_t BSSettingFlagForBool()
{
  return MEMORY[0x24BE0BD28]();
}

uint64_t BSSettingFlagIsYes()
{
  return MEMORY[0x24BE0BD30]();
}

CAFrameRateRange CAFrameRateRangeMake(float minimum, float maximum, float preferred)
{
  float v3;
  float v4;
  float v5;
  CAFrameRateRange result;

  MEMORY[0x24BDE5440](minimum, maximum, preferred);
  result.preferred = v5;
  result.maximum = v4;
  result.minimum = v3;
  return result;
}

uint64_t CALayerGetRenderId()
{
  return MEMORY[0x24BDE54E0]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
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

CGFloat CGRectGetMaxX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBEFF0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

CGFloat CGRectGetWidth(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF020]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
  return result;
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

CGRect CGRectUnion(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF088]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t NSStringFromFBSceneContentState()
{
  return MEMORY[0x24BE38000]();
}

uint64_t NSStringFromPUIPosterLevel()
{
  return MEMORY[0x24BE74EB0]();
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

uint64_t PFFileProtectionNoneAttributes()
{
  return MEMORY[0x24BE74D48]();
}

uint64_t PFPosterRoleIsValid()
{
  return MEMORY[0x24BE74D60]();
}

uint64_t PRDynamicRotationIsActive()
{
  return MEMORY[0x24BE74E48]();
}

uint64_t PRPosterLevelSetsForPRSPosterSnapshotDefinitionLayerSet()
{
  return MEMORY[0x24BE74E80]();
}

uint64_t PRSPosterSnapshotOptionsAllowTransparency()
{
  return MEMORY[0x24BE74C80]();
}

uint64_t PRSPosterSnapshotOptionsIsFloatingLayerOnly()
{
  return MEMORY[0x24BE74C88]();
}

uint64_t PUIFeatureEnabled()
{
  return MEMORY[0x24BE74F00]();
}

uint64_t PUIPosterBoundingShapeFromInt()
{
  return MEMORY[0x24BE74F08]();
}

uint64_t PUIPosterBoundingShapeIsValid()
{
  return MEMORY[0x24BE74F10]();
}

uint64_t PUIPosterLevelIsDefined()
{
  return MEMORY[0x24BE74F18]();
}

uint64_t PUIPosterSignificantEventOptionsContainsEvent()
{
  return MEMORY[0x24BE74F20]();
}

uint64_t SBSTopButtonFramesForPosters()
{
  return MEMORY[0x24BEB0D58]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t _bs_set_crash_log_message()
{
  return MEMORY[0x24BE0BEF0]();
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x24BDACB60]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB88](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDE0](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAA8](__x);
  return result;
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
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

uint64_t objc_opt_self()
{
  return MEMORY[0x24BEDD168]();
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x24BEDD3C0](object, key, value, policy);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x24BEDD420](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x24BDAF490]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x24BDAF4A8]();
}

