void sub_1DAD43E2C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD451B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD456C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;
  id *v15;
  uint64_t v16;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  objc_destroyWeak(v14);
  objc_destroyWeak((id *)(v16 - 72));
  _Unwind_Resume(a1);
}

id SearchUIGeneralLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (searchUILogHandles)
    return (id)searchUILogHandles;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[112];
}

void sub_1DAD4786C(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

id SearchUIDataSourceLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D53A0)
    return (id)qword_1ED4D53A0;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[116];
}

void sub_1DAD4C38C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD4C5C4(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1DAD4EDA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD50044(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_1DAD50304(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD5179C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void SearchUIInitLogging()
{
  if (SearchUIInitLogging_once != -1)
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
}

id SearchUITapLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D5388)
    return (id)qword_1ED4D5388;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[113];
}

id SearchUIPeekLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D5390)
    return (id)qword_1ED4D5390;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[114];
}

id SearchUITelemetryLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D5398)
    return (id)qword_1ED4D5398;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[115];
}

id SearchUIAppTopHitSectionLoaderLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D53A8)
    return (id)qword_1ED4D53A8;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[117];
}

id SearchUIButtonItemLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D53B0)
    return (id)qword_1ED4D53B0;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[118];
}

id SearchUIBiomeLog()
{
  id *v0;

  v0 = (id *)&unk_1ED4D5000;
  if (qword_1ED4D53B8)
    return (id)qword_1ED4D53B8;
  if (SearchUIInitLogging_once != -1)
  {
    dispatch_once(&SearchUIInitLogging_once, &__block_literal_global_3);
    v0 = (id *)&unk_1ED4D5000;
  }
  return v0[119];
}

void sub_1DAD532C4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, id location, id a20)
{
  id *v20;
  id *v21;
  uint64_t v22;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a20);
  _Block_object_dispose((const void *)(v22 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1DAD533CC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD58060(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void sub_1DAD5AE80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DAD60D98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
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

void sub_1DAD67278(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD6734C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD6744C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD67880(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD6796C(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD686B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD68E54(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  _Block_object_dispose(&a9, 8);
  _Unwind_Resume(a1);
}

Class __getMTAlarmManagerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;

  if (!MobileTimerLibraryCore_frameworkLibrary)
  {
    MobileTimerLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!MobileTimerLibraryCore_frameworkLibrary)
    {
      abort_report_np();
      goto LABEL_6;
    }
  }
  while (1)
  {
    result = objc_getClass("MTAlarmManager");
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
    if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
      break;
LABEL_6:
    v3 = (void *)__getMTAlarmManagerClass_block_invoke_cold_1();
    free(v3);
  }
  getMTAlarmManagerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DAD758F4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD76D84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,id location,id a24)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(v24);
  objc_destroyWeak(&location);
  objc_destroyWeak(&a24);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_1DAD7F8AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  uint64_t v29;

  _Block_object_dispose(&a29, 8);
  _Block_object_dispose((const void *)(v29 - 128), 8);
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

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_1DAD83310(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
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

void __getSAAudioAppPredictorClass_block_invoke(uint64_t a1)
{
  SiriAudioSupportLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SAAudioAppPredictor");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSAAudioAppPredictorClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    __getSAAudioAppPredictorClass_block_invoke_cold_1();
    SiriAudioSupportLibrary();
  }
}

void SiriAudioSupportLibrary()
{
  void *v0;

  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
    SiriAudioSupportLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!SiriAudioSupportLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getSAAudioAppPredictorOptionsClass_block_invoke(uint64_t a1)
{
  Class result;
  uint64_t v3;

  SiriAudioSupportLibrary();
  result = objc_getClass("SAAudioAppPredictorOptions");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSAAudioAppPredictorOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = __getSAAudioAppPredictorOptionsClass_block_invoke_cold_1();
    return (Class)OUTLINED_FUNCTION_0_2(v3);
  }
  return result;
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_1DAD886B0(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 88));
  _Unwind_Resume(a1);
}

void sub_1DAD889A8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD88AC0(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD8A8C8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t forwardEvent(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = a1;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    while (2)
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v5), "key", (_QWORD)v9);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "keyCode") == 81 && objc_msgSend(v6, "modifierFlags") == 0x100000)
        {

          v7 = 0;
          goto LABEL_12;
        }

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v3)
        continue;
      break;
    }
  }
  v7 = 1;
LABEL_12:

  return v7;
}

void sub_1DAD8DE5C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 88));
  _Unwind_Resume(a1);
}

void sub_1DAD8E52C(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DAD8E6D8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

double sanitizeSFImage(void *a1)
{
  id v1;
  double v2;
  double v3;

  v1 = a1;
  objc_msgSend(v1, "size");
  v3 = v2;

  return v3;
}

void sub_1DAD91E1C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location, char a17)
{
  id *v17;

  objc_destroyWeak(v17);
  objc_destroyWeak(&location);
  _Block_object_dispose(&a17, 8);
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

void sub_1DAD91F74(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD926FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAD92854(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DAD92E18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1DAD99A54(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADA0624(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADA0F78(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 56));
  _Unwind_Resume(a1);
}

void sub_1DADA10B4(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DADA1CCC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5(uint64_t a1)
{

}

void sub_1DADA2248(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

id SSFormattedCalculationExpression(void *a1)
{
  void *v1;

  v1 = (void *)objc_msgSend(a1, "mutableCopy");
  if (SSFormattedCalculationExpression_onceToken != -1)
    dispatch_once(&SSFormattedCalculationExpression_onceToken, &__block_literal_global_27);
  objc_msgSend((id)SSFormattedCalculationExpression_regex, "replaceMatchesInString:options:range:withTemplate:", v1, 0, 0, objc_msgSend(v1, "length"), &stru_1EA1FB118);
  return v1;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1DADA9A28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DADA9C7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADA9DA8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke(uint64_t a1)
{
  FindMyUICoreLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("FMUILocationDetailViewControllerViewOptions");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFMUILocationDetailViewControllerViewOptionsClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8)
                                                                              + 24);
  }
  else
  {
    __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1();
    FindMyUICoreLibrary();
  }
}

void FindMyUICoreLibrary()
{
  void *v0;

  if (!FindMyUICoreLibraryCore_frameworkLibrary)
    FindMyUICoreLibraryCore_frameworkLibrary = _sl_dlopen();
  if (!FindMyUICoreLibraryCore_frameworkLibrary)
  {
    v0 = (void *)abort_report_np();
    free(v0);
  }
}

Class __getFMUILocationDetailViewControllerClass_block_invoke(uint64_t a1)
{
  Class result;
  void *v3;
  SEL v4;
  id v5;
  id v6;

  FindMyUICoreLibrary();
  result = objc_getClass("FMUILocationDetailViewController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getFMUILocationDetailViewControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    v3 = (void *)__getFMUILocationDetailViewControllerClass_block_invoke_cold_1();
    return (Class)+[SearchUIWebCompletion supportsResult:cardSection:](v3, v4, v5, v6);
  }
  return result;
}

void appDatabaseChanged()
{
  id v0;

  +[SearchUIDefaultBrowserAppIconImage invalidateDefaultBrowserBundleIdentifier](SearchUIDefaultBrowserAppIconImage, "invalidateDefaultBrowserBundleIdentifier");
  +[SearchUIImageCache sharedCache](SearchUIImageCache, "sharedCache");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "appIconImageDidChange:", 0);

}

void sub_1DADAEFCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADB01BC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DADB0F6C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADB5C34(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DADB63AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DADCC850(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 56));
  _Unwind_Resume(a1);
}

void sub_1DADCC920(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1DADCD194(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

Class __getOBPrivacySplashControllerClass_block_invoke(uint64_t a1)
{
  Class result;

  if (!OnBoardingKitLibraryCore_frameworkLibrary)
  {
    OnBoardingKitLibraryCore_frameworkLibrary = _sl_dlopen();
    if (!OnBoardingKitLibraryCore_frameworkLibrary)
    {
      abort_report_np();
LABEL_6:
      __getOBPrivacySplashControllerClass_block_invoke_cold_1();
    }
  }
  result = objc_getClass("OBPrivacySplashController");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
    goto LABEL_6;
  getOBPrivacySplashControllerClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  return result;
}

void sub_1DADD1DFC(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1DADD7100(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id sub_1DADD9954()
{
  void *v0;
  id result;
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _BYTE v12[32];
  uint64_t v13;

  result = objc_msgSend(v0, sel_dataSource);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_snapshot);

    v4 = objc_msgSend(v3, sel_itemIdentifiers);
    v5 = sub_1DAE0D5CC();

    v6 = MEMORY[0x1E0DEE9D8];
    v13 = MEMORY[0x1E0DEE9D8];
    v7 = *(_QWORD *)(v5 + 16);
    if (v7)
    {
      v8 = v5 + 32;
      swift_bridgeObjectRetain();
      do
      {
        sub_1DADDAA60(v8, (uint64_t)v12);
        sub_1DADDAA60((uint64_t)v12, (uint64_t)&v10);
        sub_1DADDAA9C();
        if ((swift_dynamicCast() & 1) == 0)
          v11 = 0;
        v9 = __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
        if (v11)
        {
          MEMORY[0x1DF0A7CE4](v9);
          if (*(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x10) >= *(_QWORD *)((v13 & 0xFFFFFFFFFFFFFF8) + 0x18) >> 1)
            sub_1DAE0D5E4();
          sub_1DAE0D5F0();
          sub_1DAE0D5D8();
        }
        v8 += 32;
        --v7;
      }
      while (v7);
      swift_bridgeObjectRelease();
      v6 = v13;
    }
    swift_bridgeObjectRelease();

    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DADD9AF0()
{
  void *v0;

  return objc_msgSend(v0, sel_searchUICommandEnvironment);
}

void *sub_1DADD9B14(uint64_t a1, uint64_t a2)
{
  id v4;
  void *v5;

  v4 = sub_1DADD9954();
  swift_bridgeObjectRetain();
  v5 = sub_1DADDA864((unint64_t)v4, a1, a2);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v5;
}

uint64_t static SearchUIAppIntentRunner.dependencyKey()()
{
  swift_getMetatypeMetadata();
  return sub_1DAE0D548();
}

uint64_t sub_1DADD9BB4()
{
  sub_1DAE0D50C();
  MEMORY[0x1E0C80A78]();
  sub_1DAE0D500();
  sub_1DAE0D4F4();
  sub_1DAE0D4E8();
  swift_bridgeObjectRelease();
  sub_1DAE0D4F4();
  return sub_1DAE0C750();
}

uint64_t sub_1DADD9CBC(unsigned __int8 *a1, unsigned __int8 *a2)
{
  return sub_1DADD9CC8(*a1, *a2);
}

uint64_t sub_1DADD9CC8(unsigned __int8 a1, unsigned __int8 a2)
{
  unint64_t v2;
  unint64_t v3;
  int v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  char v8;

  v2 = 0xD000000000000012;
  v3 = 0x80000001DAE22B90;
  v4 = a1;
  if (a1)
  {
    if (a1 == 1)
      v5 = 0x616C696176616E75;
    else
      v5 = 0xD000000000000016;
    if (v4 == 1)
      v6 = 0xEB00000000656C62;
    else
      v6 = 0x80000001DAE22BB0;
    v7 = a2;
    if (!a2)
      goto LABEL_15;
    goto LABEL_9;
  }
  v5 = 0xD000000000000012;
  v6 = 0x80000001DAE22B90;
  v7 = a2;
  if (a2)
  {
LABEL_9:
    if (v7 == 1)
      v2 = 0x616C696176616E75;
    else
      v2 = 0xD000000000000016;
    if (v7 == 1)
      v3 = 0xEB00000000656C62;
    else
      v3 = 0x80000001DAE22BB0;
  }
LABEL_15:
  if (v5 == v2 && v6 == v3)
    v8 = 1;
  else
    v8 = sub_1DAE0D8A8();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v8 & 1;
}

uint64_t sub_1DADD9DDC()
{
  return sub_1DADD9DE4();
}

uint64_t sub_1DADD9DE4()
{
  sub_1DAE0D914();
  sub_1DAE0D554();
  swift_bridgeObjectRelease();
  return sub_1DAE0D92C();
}

uint64_t sub_1DADD9E94()
{
  sub_1DAE0D554();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADD9F1C()
{
  return sub_1DADD9F24();
}

uint64_t sub_1DADD9F24()
{
  sub_1DAE0D914();
  sub_1DAE0D554();
  swift_bridgeObjectRelease();
  return sub_1DAE0D92C();
}

uint64_t sub_1DADD9FD0@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DADDA9F4();
  *a1 = result;
  return result;
}

void sub_1DADD9FFC(unint64_t *a1@<X8>)
{
  _BYTE *v1;
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;

  v2 = 0xD000000000000012;
  v3 = 0xEB00000000656C62;
  v4 = 0x616C696176616E75;
  if (*v1 != 1)
  {
    v4 = 0xD000000000000016;
    v3 = 0x80000001DAE22BB0;
  }
  if (*v1)
  {
    v2 = v4;
    v5 = v3;
  }
  else
  {
    v5 = 0x80000001DAE22B90;
  }
  *a1 = v2;
  a1[1] = v5;
}

uint64_t sub_1DADDA078()
{
  return sub_1DADD9BB4();
}

uint64_t sub_1DADDA080(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1DAE0D62C();
  v4[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

id sub_1DADDA0F0()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t ObjectType;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id result;
  void *v11;
  _BYTE *v12;
  uint64_t (*v13)(void);

  swift_release();
  if (!objc_msgSend((id)objc_opt_self(), sel_isAppIntentsSupportEnabled))
  {
    LOBYTE(v4) = 1;
    goto LABEL_11;
  }
  v1 = v0[5] + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (!MEMORY[0x1DF0A8C44](v1))
  {
    LOBYTE(v4) = 0;
    goto LABEL_11;
  }
  v2 = *(_QWORD *)(v1 + 8);
  ObjectType = swift_getObjectType();
  v4 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v2 + 8))(ObjectType, v2);
  swift_unknownObjectRelease();
  if (!v4)
  {
LABEL_11:
    sub_1DADDA2D0();
    swift_allocError();
    *v12 = (_BYTE)v4;
    swift_willThrow();
    v13 = (uint64_t (*)(void))v0[1];
    return (id)v13();
  }
  if (v0[4]
    && MEMORY[0x1DF0A8C44](v1)
    && (v6 = v0[3],
        v5 = v0[4],
        v7 = *(_QWORD *)(v1 + 8),
        v8 = swift_getObjectType(),
        v9 = (void *)(*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 16))(v6, v5, v8, v7),
        swift_unknownObjectRelease(),
        v9))
  {
    result = objc_msgSend((id)objc_opt_self(), sel_handlerForCommand_rowModel_button_sectionModel_environment_, v0[2], v9, 0, 0, v4);
    if (result)
    {
      v11 = result;
      objc_msgSend(result, sel_executeWithTriggerEvent_, 13);

LABEL_15:
      v13 = (uint64_t (*)(void))v0[1];
      return (id)v13();
    }
  }
  else
  {
    result = objc_msgSend((id)objc_opt_self(), sel_handlerForCommand_environment_, v0[2], v4);
    if (result)
    {
      v11 = result;
      objc_msgSend(result, sel_executeWithTriggerEvent_, 13);
      goto LABEL_15;
    }
    __break(1u);
  }
  __break(1u);
  return result;
}

unint64_t sub_1DADDA2D0()
{
  unint64_t result;

  result = qword_1F029D708;
  if (!qword_1F029D708)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DB60, &type metadata for SearchUIAppIntentRunner.RunnerError);
    atomic_store(result, (unint64_t *)&qword_1F029D708);
  }
  return result;
}

id SearchUIAppIntentRunner.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

void SearchUIAppIntentRunner.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchUIAppIntentRunner.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIAppIntentRunner();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIAppIntentRunner()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchUIAppIntentRunner()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchUIAppIntentRunner.perform(command:for:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
  uint64_t v4;
  int *v8;
  _QWORD *v9;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t);

  v8 = *(int **)((*MEMORY[0x1E0DEEDD8] & *v3) + 0x90);
  v11 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)v8 + *v8);
  v9 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v9;
  *v9 = v4;
  v9[1] = sub_1DADDA484;
  return v11(a1, a2, a3);
}

uint64_t sub_1DADDA484()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

void type metadata accessor for TLKProminence(uint64_t a1)
{
  sub_1DADDAC54(a1, &qword_1F029B498);
}

_BYTE *__swift_memcpy1_1(_BYTE *result, _BYTE *a2)
{
  *result = *a2;
  return result;
}

uint64_t getEnumTagSinglePayload for SearchUIAppIntentRunner.RunnerError(unsigned __int8 *a1, unsigned int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIAppIntentRunner.RunnerError(_BYTE *a1, unsigned int a2, unsigned int a3)
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
    return ((uint64_t (*)(void))((char *)&loc_1DADDA5CC + 4 * byte_1DAE1D9C5[v4]))();
  *a1 = a2 + 2;
  return ((uint64_t (*)(void))((char *)sub_1DADDA600 + 4 * byte_1DAE1D9C0[v4]))();
}

uint64_t sub_1DADDA600(uint64_t result)
{
  char v1;

  *(_BYTE *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DADDA608(uint64_t result, int a2)
{
  *(_WORD *)(result + 1) = 0;
  if (a2)
    JUMPOUT(0x1DADDA610);
  return result;
}

uint64_t sub_1DADDA61C(uint64_t result, int a2)
{
  *(_DWORD *)(result + 1) = 0;
  if (!a2)
    JUMPOUT(0x1DADDA624);
  *(_BYTE *)result = a2 + 2;
  return result;
}

uint64_t sub_1DADDA628(uint64_t result)
{
  int v1;

  *(_DWORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DADDA630(uint64_t result)
{
  __int16 v1;

  *(_WORD *)(result + 1) = v1;
  return result;
}

uint64_t sub_1DADDA63C(unsigned __int8 *a1)
{
  return *a1;
}

_BYTE *sub_1DADDA648(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppIntentRunner.RunnerError()
{
  return &type metadata for SearchUIAppIntentRunner.RunnerError;
}

unint64_t sub_1DADDA664()
{
  unint64_t result;

  result = qword_1F029D790;
  if (!qword_1F029D790)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DB38, &type metadata for SearchUIAppIntentRunner.RunnerError);
    atomic_store(result, (unint64_t *)&qword_1F029D790);
  }
  return result;
}

void sub_1DADDA6A8(_QWORD *a1@<X8>)
{
  _QWORD *v1;

  *a1 = *v1;
}

uint64_t sub_1DADDA6B4()
{
  return sub_1DAE0D65C();
}

uint64_t sub_1DADDA6BC(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v4;
  char v5;
  uint64_t v6;
  char v7;

  v6 = 0;
  v7 = 1;
  result = MEMORY[0x1DF0A7D98](a1, &v6);
  v4 = v6;
  v5 = v7;
  if (v7)
    v4 = 0;
  *(_QWORD *)a2 = v4;
  *(_BYTE *)(a2 + 8) = v5;
  return result;
}

uint64_t sub_1DADDA70C(uint64_t a1, uint64_t a2)
{
  char v3;

  v3 = sub_1DAE0D674();
  *(_QWORD *)a2 = 0;
  *(_BYTE *)(a2 + 8) = 1;
  return v3 & 1;
}

uint64_t sub_1DADDA760@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0D680();
  *a1 = result;
  return result;
}

_QWORD *sub_1DADDA784@<X0>(_QWORD *result@<X0>, uint64_t a2@<X8>)
{
  *(_QWORD *)a2 = *result;
  *(_BYTE *)(a2 + 8) = 0;
  return result;
}

uint64_t sub_1DADDA794()
{
  sub_1DADDAB54(&qword_1F029D820, (uint64_t)&unk_1DAE1DC94);
  sub_1DADDAB54(&qword_1F029D828, (uint64_t)&unk_1DAE1DC34);
  return sub_1DAE0D86C();
}

uint64_t sub_1DADDA818()
{
  return sub_1DAE0D68C();
}

uint64_t sub_1DADDA820()
{
  return sub_1DAE0D920();
}

uint64_t sub_1DADDA848()
{
  return sub_1DAE0D908();
}

BOOL sub_1DADDA850(_QWORD *a1, _QWORD *a2)
{
  return *a1 == *a2;
}

void *sub_1DADDA864(unint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v16;

  if (a1 >> 62)
    goto LABEL_20;
  v5 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v5; v5 = sub_1DAE0D83C())
  {
    v6 = 4;
    while (1)
    {
      v7 = (a1 & 0xC000000000000001) != 0 ? (id)MEMORY[0x1DF0A7ED0](v6 - 4, a1) : *(id *)(a1 + 8 * v6);
      v8 = v7;
      v9 = v6 - 3;
      if (__OFADD__(v6 - 4, 1))
        break;
      v10 = objc_msgSend(v7, sel_itemIdentifier);
      if (v10)
      {
        v11 = v10;
        v12 = sub_1DAE0D53C();
        v14 = v13;

        if (v12 == a2 && v14 == a3)
        {
          swift_bridgeObjectRelease();
LABEL_18:
          swift_bridgeObjectRelease();
          return v8;
        }
        v16 = sub_1DAE0D8A8();
        swift_bridgeObjectRelease();
        if ((v16 & 1) != 0)
          goto LABEL_18;
      }

      ++v6;
      if (v9 == v5)
        goto LABEL_21;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_21:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1DADDA9F4()
{
  unint64_t v0;

  v0 = sub_1DAE0D878();
  swift_bridgeObjectRelease();
  if (v0 >= 3)
    return 3;
  else
    return v0;
}

uint64_t sub_1DADDAA3C(uint64_t a1)
{
  swift_unknownObjectWeakDestroy();
  return a1;
}

uint64_t sub_1DADDAA60(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

unint64_t sub_1DADDAA9C()
{
  unint64_t result;

  result = qword_1F029D798;
  if (!qword_1F029D798)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029D798);
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

void type metadata accessor for UIBackgroundTaskIdentifier(uint64_t a1)
{
  sub_1DADDAC54(a1, &qword_1F029D7A0);
}

uint64_t sub_1DADDAB0C()
{
  return sub_1DADDAB54(&qword_1F029D808, (uint64_t)&unk_1DAE1DBF8);
}

uint64_t sub_1DADDAB30()
{
  return sub_1DADDAB54(&qword_1F029D810, (uint64_t)&unk_1DAE1DBCC);
}

uint64_t sub_1DADDAB54(unint64_t *a1, uint64_t a2)
{
  uint64_t result;
  uint64_t v5;

  result = *a1;
  if (!result)
  {
    type metadata accessor for UIBackgroundTaskIdentifier(255);
    result = MEMORY[0x1DF0A8B00](a2, v5);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADDAB94()
{
  return sub_1DADDAB54(&qword_1F029D818, (uint64_t)&unk_1DAE1DC68);
}

uint64_t initializeBufferWithCopyOfBuffer for CustomizedHighlightSettings(uint64_t *a1, uint64_t *a2)
{
  uint64_t v2;
  uint64_t v3;

  v2 = *a2;
  *a1 = *a2;
  v3 = v2 + 16;
  sub_1DAE0C564();
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

uint64_t sub_1DADDABF4(uint64_t a1, int a2)
{
  if (a2 && *(_BYTE *)(a1 + 32))
    return (*(_DWORD *)a1 + 1);
  else
    return 0;
}

uint64_t sub_1DADDAC14(uint64_t result, int a2, int a3)
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

void type metadata accessor for NSDirectionalEdgeInsets(uint64_t a1)
{
  sub_1DADDAC54(a1, (unint64_t *)&unk_1F029B4E0);
}

void sub_1DADDAC54(uint64_t a1, unint64_t *a2)
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

void sub_1DADDB08C(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  id v4;

  if (a1)
    v3 = sub_1DAE0C72C();
  else
    v3 = 0;
  v4 = (id)v3;
  (*(void (**)(uint64_t))(a2 + 16))(a2);

}

id sub_1DADDB1BC()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUISportsKitWrapper();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUISportsKitWrapper()
{
  return objc_opt_self();
}

uint64_t sub_1DADDB20C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DADDB230(char a1)
{
  uint64_t v1;

  return sub_1DAE07A4C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1DADDB238(unsigned __int8 a1, char a2)
{
  uint64_t v2;

  return (*(uint64_t (**)(_QWORD))(v2 + 16))(((a2 & 1) == 0) & a1);
}

void sub_1DADDB264(uint64_t a1)
{
  uint64_t v1;

  sub_1DADDB08C(a1, *(_QWORD *)(v1 + 16));
}

uint64_t sub_1DADDB27C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DADDB2A0()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 16))();
}

uint64_t sub_1DADDB2E4()
{
  return 1;
}

uint64_t sub_1DADDB2EC()
{
  sub_1DAE0D914();
  sub_1DAE0D920();
  return sub_1DAE0D92C();
}

uint64_t sub_1DADDB32C()
{
  return sub_1DAE0D920();
}

uint64_t sub_1DADDB350()
{
  sub_1DAE0D914();
  sub_1DAE0D920();
  return sub_1DAE0D92C();
}

id sub_1DADDB38C(void *a1, void *a2, int a3, uint64_t a4, uint64_t a5, void *a6)
{
  void *v6;
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
  char *v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v33;
  unint64_t v34;
  unsigned int v35;
  uint64_t v36;
  uint64_t v37;
  unsigned int *v38;
  unint64_t v39;
  void *v40;
  char *v41;
  NSObject *v42;
  id v43;
  NSObject *v44;
  uint64_t v45;
  NSObject *v46;
  os_log_type_t v47;
  _BOOL4 v48;
  uint8_t *v49;
  const char *v50;
  id v51;
  char *v52;
  uint64_t v53;
  uint64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  char *v58;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  uint8_t *v63;
  uint64_t v64;
  unint64_t v65;
  void (*v66)(char *, uint64_t);
  char *v67;
  uint64_t *v68;
  uint64_t v69;
  uint64_t v70;
  os_log_type_t v71;
  uint8_t *v72;
  uint64_t v73;
  unint64_t v74;
  char *v75;
  void (*v76)(char *, uint64_t);
  id v77;
  uint64_t v78;
  _BOOL4 v79;
  NSObject *v80;
  objc_class *v81;
  id v82;
  id v83;
  uint64_t v85;
  id v86;
  id v87;
  NSObject *v88;
  os_log_type_t v89;
  uint8_t *v90;
  void *v91;
  uint64_t v92;
  unint64_t v93;
  void *v94;
  uint64_t v95;
  void *v96;
  unint64_t v97;
  uint64_t v98;
  id v99;
  uint64_t v100;
  id v101;
  void *v102;
  void *v103;
  NSObject *v104;
  char *v105;
  char *v106;
  char *v107;
  uint64_t v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t v111;
  char *v112;
  char *v113;
  uint64_t v114;
  uint64_t v115;
  int v116;
  id v117;
  uint64_t v118[3];
  id v119[5];
  uint64_t v120;
  objc_super v121;
  uint64_t v122;
  uint64_t v123;

  v115 = a5;
  v116 = a3;
  v110 = sub_1DAE0D7B8();
  v108 = *(_QWORD *)(v110 - 8);
  v11 = ((uint64_t (*)(void))MEMORY[0x1E0C80A78])();
  v113 = (char *)&v95 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  v105 = (char *)&v95 - v14;
  v15 = MEMORY[0x1E0C80A78](v13);
  v106 = (char *)&v95 - v16;
  MEMORY[0x1E0C80A78](v15);
  v107 = (char *)&v95 - v17;
  v111 = sub_1DAE0D7C4();
  v109 = *(_QWORD *)(v111 - 8);
  MEMORY[0x1E0C80A78](v111);
  v112 = (char *)&v95 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = sub_1DAE0CA14();
  v20 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v22 = (char *)&v95 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B5D8);
  MEMORY[0x1E0C80A78](v23);
  v25 = (char *)&v95 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v117 = v6;
  v26 = (uint64_t)v6 + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
  *(_OWORD *)v26 = 0u;
  *(_OWORD *)(v26 + 16) = 0u;
  *(_QWORD *)(v26 + 32) = 0;
  if (!a2)
  {
LABEL_46:
    v31 = 0;
    if (!a6)
      goto LABEL_48;
    goto LABEL_47;
  }
  v114 = a4;
  objc_opt_self();
  v27 = swift_dynamicCastObjCClass();
  if (!v27)
  {
    v31 = 0;
    a4 = v114;
    if (!a6)
      goto LABEL_48;
LABEL_47:
    a6 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
    goto LABEL_48;
  }
  v28 = (void *)v27;
  v102 = a1;
  v101 = v117;
  v104 = a2;
  v29 = objc_msgSend(v28, sel_searchString);
  if (v29)
  {
    v30 = v29;
    v98 = sub_1DAE0D53C();

  }
  else
  {
    v98 = 0;
  }
  v32 = objc_msgSend(v28, sel_archive);
  v103 = a6;
  if (v32)
  {
    v33 = v32;
    v100 = sub_1DAE0C7A4();
    v97 = v34;

    v99 = objc_msgSend(v28, sel_attributeSet);
    if (v99)
    {
      v96 = a2;
      v35 = objc_msgSend(v28, sel_isTopHit);
      v36 = sub_1DAE0CA08();
      v37 = *(_QWORD *)(v36 - 8);
      v38 = (unsigned int *)MEMORY[0x1E0CF0BD0];
      if (!v35)
        v38 = (unsigned int *)MEMORY[0x1E0CF0BD8];
      (*(void (**)(char *, _QWORD, uint64_t))(v37 + 104))(v25, *v38, v36);
      sub_1DAE0CA08();
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v37 + 56))(v25, 0, 1, v36);
      v39 = v97;
      sub_1DAE0C660();
      sub_1DADDCC3C((uint64_t)v25, &qword_1F029B5D8);
      swift_bridgeObjectRelease();
      swift_beginAccess();
      sub_1DADDCC78((uint64_t)v119, v26);
      swift_endAccess();

      v31 = objc_msgSend(v28, sel_isTopHit);
      sub_1DADDCBF8(v100, v39);

      a2 = v96;
      a1 = v102;
      a4 = v114;
      goto LABEL_57;
    }
    swift_bridgeObjectRelease();

    sub_1DADDCBF8(v100, v97);
  }
  else
  {
    swift_bridgeObjectRelease();

  }
  sub_1DADDC4E4();
  v40 = (void *)swift_allocError();
  swift_willThrow();
  v41 = v113;
  a4 = v114;
  v42 = v104;
  v119[0] = v40;
  v43 = v40;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D928);
  if (swift_dynamicCast())
  {
    if ((*(unsigned int (**)(char *, uint64_t))(v20 + 88))(v22, v19) == *MEMORY[0x1E0CF0BF0])
    {
      v44 = v42;

      if (qword_1F029D6B8 != -1)
        swift_once();
      v45 = sub_1DAE0CA8C();
      __swift_project_value_buffer(v45, (uint64_t)qword_1F02A0390);
      v46 = sub_1DAE0CA74();
      v47 = sub_1DAE0D6C8();
      v48 = os_log_type_enabled(v46, v47);
      a1 = v102;
      if (v48)
      {
        v49 = (uint8_t *)swift_slowAlloc();
        *(_WORD *)v49 = 0;
        v50 = "Failed to find type of view, is the framework imported in Spotlight, and is the type public?";
LABEL_42:
        _os_log_impl(&dword_1DAD39000, v46, v47, v50, v49, 2u);
        MEMORY[0x1DF0A8B9C](v49, -1, -1);
        v80 = v44;
LABEL_44:
        a6 = v103;

        goto LABEL_45;
      }
      goto LABEL_43;
    }
    (*(void (**)(char *, uint64_t))(v20 + 8))(v22, v19);
  }

  v119[0] = v40;
  v51 = v40;
  v52 = v112;
  v53 = v111;
  if (swift_dynamicCast())
  {
    v54 = v109;
    v55 = (*(uint64_t (**)(char *, uint64_t))(v109 + 88))(v52, v53);
    if (v55 == *MEMORY[0x1E0DEC450])
    {

      (*(void (**)(char *, uint64_t))(v54 + 96))(v52, v53);
      v56 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D930);
      v57 = v108;
      v58 = v107;
      v59 = v110;
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v107, &v52[*(int *)(v56 + 48)], v110);
      if (qword_1F029D6B8 != -1)
        swift_once();
      v60 = sub_1DAE0CA8C();
      __swift_project_value_buffer(v60, (uint64_t)qword_1F02A0390);
      v41 = v106;
      (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v106, v58, v59);
      v61 = sub_1DAE0CA74();
      v62 = sub_1DAE0D6C8();
      if (os_log_type_enabled(v61, v62))
      {
        v63 = (uint8_t *)swift_slowAlloc();
        v113 = (char *)swift_slowAlloc();
        v118[0] = (uint64_t)v113;
        *(_DWORD *)v63 = 136315138;
        v64 = sub_1DAE0D7AC();
        v120 = sub_1DADDC540(v64, v65, v118);
        sub_1DAE0D71C();
        swift_bridgeObjectRelease();
        v66 = *(void (**)(char *, uint64_t))(v57 + 8);
        v66(v41, v59);
        _os_log_impl(&dword_1DAD39000, v61, v62, "Type mismatch with error %s", v63, 0xCu);
        v67 = v113;
        swift_arrayDestroy();
        a4 = v114;
        MEMORY[0x1DF0A8B9C](v67, -1, -1);
        MEMORY[0x1DF0A8B9C](v63, -1, -1);

        v68 = &v123;
LABEL_33:
        v66((char *)*(v68 - 32), v59);
LABEL_35:
        a1 = v102;
        a6 = v103;
LABEL_45:

        goto LABEL_46;
      }
      goto LABEL_34;
    }
    v59 = v110;
    if (v55 == *MEMORY[0x1E0DEC460])
    {

      (*(void (**)(char *, uint64_t))(v54 + 96))(v52, v53);
      v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D930);
      v57 = v108;
      v58 = v105;
      (*(void (**)(char *, char *, uint64_t))(v108 + 32))(v105, &v52[*(int *)(v69 + 48)], v59);
      if (qword_1F029D6B8 != -1)
        swift_once();
      v70 = sub_1DAE0CA8C();
      __swift_project_value_buffer(v70, (uint64_t)qword_1F02A0390);
      (*(void (**)(char *, char *, uint64_t))(v57 + 16))(v41, v58, v59);
      v61 = sub_1DAE0CA74();
      v71 = sub_1DAE0D6C8();
      if (os_log_type_enabled(v61, v71))
      {
        v72 = (uint8_t *)swift_slowAlloc();
        v113 = (char *)swift_slowAlloc();
        v118[0] = (uint64_t)v113;
        *(_DWORD *)v72 = 136315138;
        v73 = sub_1DAE0D7AC();
        v120 = sub_1DADDC540(v73, v74, v118);
        sub_1DAE0D71C();
        swift_bridgeObjectRelease();
        v66 = *(void (**)(char *, uint64_t))(v57 + 8);
        v66(v41, v59);
        _os_log_impl(&dword_1DAD39000, v61, v71, "required value not found with error %s", v72, 0xCu);
        v75 = v113;
        swift_arrayDestroy();
        a4 = v114;
        MEMORY[0x1DF0A8B9C](v75, -1, -1);
        MEMORY[0x1DF0A8B9C](v72, -1, -1);

        v68 = &v122;
        goto LABEL_33;
      }
LABEL_34:

      v76 = *(void (**)(char *, uint64_t))(v57 + 8);
      v76(v41, v59);

      v76(v58, v59);
      goto LABEL_35;
    }
    (*(void (**)(char *, uint64_t))(v54 + 8))(v52, v53);
  }

  v119[0] = v40;
  v77 = v40;
  if (swift_dynamicCast())
  {
    v44 = v42;

    if (qword_1F029D6B8 != -1)
      swift_once();
    v78 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v78, (uint64_t)qword_1F02A0390);
    v46 = sub_1DAE0CA74();
    v47 = sub_1DAE0D6D4();
    v79 = os_log_type_enabled(v46, v47);
    a1 = v102;
    if (v79)
    {
      v49 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v49 = 0;
      v50 = "Backend failed to fill values";
      goto LABEL_42;
    }
LABEL_43:
    v80 = v46;
    v46 = v44;
    goto LABEL_44;
  }

  if (qword_1F029D6B8 != -1)
    swift_once();
  v85 = sub_1DAE0CA8C();
  __swift_project_value_buffer(v85, (uint64_t)qword_1F02A0390);
  v86 = v40;
  v87 = v40;
  v88 = sub_1DAE0CA74();
  v89 = sub_1DAE0D6C8();
  if (os_log_type_enabled(v88, v89))
  {
    v90 = (uint8_t *)swift_slowAlloc();
    v91 = (void *)swift_slowAlloc();
    v119[0] = v91;
    *(_DWORD *)v90 = 136315138;
    swift_getErrorValue();
    v92 = sub_1DAE0D8C0();
    v118[0] = sub_1DADDC540(v92, v93, (uint64_t *)v119);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DAD39000, v88, v89, "unknown error %s", v90, 0xCu);
    swift_arrayDestroy();
    v94 = v91;
    a4 = v114;
    MEMORY[0x1DF0A8B9C](v94, -1, -1);
    MEMORY[0x1DF0A8B9C](v90, -1, -1);

  }
  else
  {

  }
  v31 = 0;
  a1 = v102;
LABEL_57:
  a6 = v103;
  if (v103)
    goto LABEL_47;
LABEL_48:
  v81 = (objc_class *)type metadata accessor for SearchUIArchivedRowModel();
  v121.receiver = v117;
  v121.super_class = v81;
  v82 = objc_msgSendSuper2(&v121, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, a1, a2, v116 & 1, a4, a6);

  if (v82)
  {

    v83 = v82;
    objc_msgSend(v83, sel_setIsTopHit_, v31);

  }
  return v82;
}

id sub_1DADDC3E4()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIArchivedRowModel();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIArchivedRowModel()
{
  return objc_opt_self();
}

uint64_t sub_1DADDC45C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t __swift_instantiateConcreteTypeFromMangledName(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0A8AE8]((char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

unint64_t sub_1DADDC4E4()
{
  unint64_t result;

  result = qword_1F029D920;
  if (!qword_1F029D920)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DE28, &type metadata for BackendError);
    atomic_store(result, (unint64_t *)&qword_1F029D920);
  }
  return result;
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t sub_1DADDC540(uint64_t a1, unint64_t a2, uint64_t *a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12[3];
  uint64_t ObjectType;

  v6 = sub_1DADDC610(v12, 0, 0, 1, a1, a2);
  v7 = v12[0];
  if (v6)
  {
    v8 = v6;
    ObjectType = swift_getObjectType();
    v12[0] = v8;
    v9 = *a3;
    if (*a3)
    {
      sub_1DADDAA60((uint64_t)v12, *a3);
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
      sub_1DADDAA60((uint64_t)v12, *a3);
      *a3 = v10 + 32;
    }
    swift_bridgeObjectRetain();
  }
  __swift_destroy_boxed_opaque_existential_0((uint64_t)v12);
  return v7;
}

uint64_t sub_1DADDC610(uint64_t *a1, char *__dst, uint64_t a3, char a4, uint64_t a5, unint64_t a6)
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
            sub_1DAE0D728();
            result = 0;
            *a1 = (uint64_t)__dst;
            return result;
          }
          goto LABEL_17;
        }
      }
    }
LABEL_13:
    result = sub_1DADDC7C8(a5, a6);
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
  v8 = sub_1DAE0D7D0();
  if (!v8)
  {
    sub_1DAE0D824();
    __break(1u);
LABEL_17:
    result = sub_1DAE0D860();
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

uint64_t sub_1DADDC7C8(uint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  unint64_t v4;

  v2 = sub_1DADDC85C(a1, a2);
  if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
    v2 = sub_1DADDCAAC(0, *(_QWORD *)(v2 + 16) + 1, 1, (char *)v2);
  v4 = *(_QWORD *)(v2 + 16);
  v3 = *(_QWORD *)(v2 + 24);
  if (v4 >= v3 >> 1)
    v2 = sub_1DADDCAAC(v3 > 1, v4 + 1, 1, (char *)v2);
  *(_QWORD *)(v2 + 16) = v4 + 1;
  *(_BYTE *)(v2 + 32 + v4) = 0;
  return v2;
}

uint64_t sub_1DADDC85C(uint64_t a1, unint64_t a2)
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
      v3 = sub_1DADDC9D0(v2, 0);
      if (v2 < 0)
        break;
      v4 = v3;
      v5 = sub_1DAE0D794();
      if ((v6 & 1) != 0)
        goto LABEL_14;
      if (v5 == v2)
        return (uint64_t)v4;
      sub_1DAE0D824();
      __break(1u);
LABEL_10:
      v2 = sub_1DAE0D584();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    sub_1DAE0D860();
    __break(1u);
LABEL_14:
    result = sub_1DAE0D824();
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9D8];
  }
  return result;
}

_QWORD *sub_1DADDC9D0(uint64_t a1, uint64_t a2)
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
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D938);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v4[2] = a1;
  v4[3] = 2 * v5 - 64;
  return v4;
}

uint64_t sub_1DADDCA34(unint64_t a1, uint64_t a2, uint64_t a3)
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
    v10 = sub_1DAE0D59C();
    v11 = v10 + (v4 << 16);
    v12 = v10 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v13 = v11 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v13 = v12;
    return v13 | 4;
  }
  else
  {
    v5 = MEMORY[0x1DF0A7CC0](15, a1 >> 16);
    v6 = v5 + (v4 << 16);
    v7 = v5 & 0xFFFFFFFFFFFFFFFCLL | v3 & 3;
    v8 = v6 & 0xFFFFFFFFFFFF0000;
    if (!v4)
      v8 = v7;
    return v8 | 8;
  }
}

uint64_t sub_1DADDCAAC(char a1, int64_t a2, char a3, char *a4)
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D938);
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
  result = sub_1DAE0D860();
  __break(1u);
  return result;
}

uint64_t sub_1DADDCBF8(uint64_t a1, unint64_t a2)
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

uint64_t sub_1DADDCC3C(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = __swift_instantiateConcreteTypeFromMangledName(a2);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t sub_1DADDCC78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6B8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t getEnumTagSinglePayload for BackendError(unsigned int *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for BackendError(uint64_t a1, int a2, int a3)
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
    return ((uint64_t (*)(void))((char *)sub_1DADDCD58 + 4 * byte_1DAE1DD80[v4]))();
  else
    return ((uint64_t (*)(void))((char *)sub_1DADDCD78 + 4 * byte_1DAE1DD85[v4]))();
}

_BYTE *sub_1DADDCD58(_BYTE *result, char a2)
{
  *result = a2;
  return result;
}

_BYTE *sub_1DADDCD78(_BYTE *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DADDCD80(_DWORD *result, int a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DADDCD88(_WORD *result, __int16 a2)
{
  *result = a2;
  return result;
}

_WORD *sub_1DADDCD90(_WORD *result)
{
  *result = 0;
  return result;
}

_DWORD *sub_1DADDCD98(_DWORD *result)
{
  *result = 0;
  return result;
}

uint64_t sub_1DADDCDA4()
{
  return 0;
}

ValueMetadata *type metadata accessor for BackendError()
{
  return &type metadata for BackendError;
}

unint64_t sub_1DADDCDC0()
{
  unint64_t result;

  result = qword_1F029D940;
  if (!qword_1F029D940)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DE00, &type metadata for BackendError);
    atomic_store(result, (unint64_t *)&qword_1F029D940);
  }
  return result;
}

unint64_t sub_1DADDCE08()
{
  unint64_t result;

  result = qword_1F029D948;
  if (!qword_1F029D948)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DF00, &type metadata for SearchUIContinuationIntent);
    atomic_store(result, (unint64_t *)&qword_1F029D948);
  }
  return result;
}

unint64_t sub_1DADDCE50()
{
  unint64_t result;

  result = qword_1F029D950;
  if (!qword_1F029D950)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DF28, &type metadata for SearchUIContinuationIntent);
    atomic_store(result, (unint64_t *)&qword_1F029D950);
  }
  return result;
}

uint64_t sub_1DADDCE94()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADDCEA4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADDCEB4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DAE0C744();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DAE0C75C();
  __swift_allocate_value_buffer(v6, qword_1F02A0350);
  __swift_project_value_buffer(v6, (uint64_t)qword_1F02A0350);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_1DAE0C804();
  return sub_1DAE0C768();
}

uint64_t sub_1DADDD064@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DAE0C744();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1DAE0C75C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_1F02A0400);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_1DAE0C654();
  v14 = sub_1DAE0C648();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
}

uint64_t sub_1DADDD2B8()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D9B0);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D9B8);
  MEMORY[0x1E0C80A78](v1);
  sub_1DADDDE80();
  sub_1DAE0C6D8();
  sub_1DAE0C6CC();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D9C0);
  sub_1DAE0C6C0();
  swift_release();
  sub_1DAE0C6CC();
  sub_1DAE0C6E4();
  return sub_1DAE0C6B4();
}

uint64_t sub_1DADDD430()
{
  return sub_1DAE0C54C();
}

double sub_1DADDD450@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  sub_1DAE0C534();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  return result;
}

uint64_t sub_1DADDD4A0(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[10] = a2;
  v3[11] = a3;
  v3[9] = a1;
  return swift_task_switch();
}

uint64_t sub_1DADDD4BC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  _QWORD *v3;
  char *v5;

  sub_1DAE0C45C();
  *(_QWORD *)(v0 + 96) = *(_QWORD *)(v0 + 64);
  sub_1DAE0C534();
  v2 = *(_QWORD *)(v0 + 16);
  v1 = *(_QWORD *)(v0 + 24);
  *(_QWORD *)(v0 + 104) = v1;
  *(_OWORD *)(v0 + 112) = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v0 + 128) = *(_QWORD *)(v0 + 56);
  v5 = (char *)&dword_1F029DF10 + dword_1F029DF10;
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 136) = v3;
  *v3 = v0;
  v3[1] = sub_1DADDD56C;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))v5)(v2, v1, 0);
}

uint64_t sub_1DADDD56C()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(*v1 + 96);
  v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1DADDD61C()
{
  uint64_t v0;

  sub_1DAE0C504();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADDD650@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F029D6A0 != -1)
    swift_once();
  v2 = sub_1DAE0C75C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02A0350);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DADDD6D4(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1DADDA484;
  *(_OWORD *)(v4 + 80) = *v1;
  *(_QWORD *)(v4 + 72) = a1;
  return swift_task_switch();
}

uint64_t sub_1DADDD73C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DADDD9FC();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DADDD760()
{
  sub_1DADDDE80();
  return sub_1DAE0C4D4();
}

uint64_t destroy for SearchUIContinuationIntent()
{
  swift_release();
  return swift_release();
}

_QWORD *_s8SearchUI26SearchUIContinuationIntentVwCP_0(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  sub_1DAE0C564();
  sub_1DAE0C564();
  return a1;
}

_QWORD *assignWithCopy for SearchUIContinuationIntent(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  sub_1DAE0C564();
  swift_release();
  a1[1] = a2[1];
  sub_1DAE0C564();
  swift_release();
  return a1;
}

__n128 __swift_memcpy16_8(__n128 *a1, __n128 *a2)
{
  __n128 result;

  result = *a2;
  *a1 = *a2;
  return result;
}

_OWORD *assignWithTake for SearchUIContinuationIntent(_OWORD *a1, _OWORD *a2)
{
  swift_release();
  *a1 = *a2;
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIContinuationIntent(uint64_t *a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIContinuationIntent(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchUIContinuationIntent()
{
  return &type metadata for SearchUIContinuationIntent;
}

uint64_t sub_1DADDD920()
{
  return sub_1DADDD9BC(&qword_1F029D960, &qword_1F029D968, MEMORY[0x1E0C916B0]);
}

uint64_t __swift_instantiateConcreteTypeFromMangledNameAbstract(uint64_t *a1)
{
  uint64_t result;

  result = *a1;
  if (result < 0)
  {
    result = MEMORY[0x1DF0A8AF4](255, (char *)a1 + (int)result, -(result >> 32), 0, 0);
    *a1 = result;
  }
  return result;
}

uint64_t sub_1DADDD990()
{
  return sub_1DADDD9BC(&qword_1F029D970, &qword_1F029D978, MEMORY[0x1E0C91590]);
}

uint64_t sub_1DADDD9BC(unint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0A8B00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADDD9FC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;

  v0 = sub_1DAE0C6F0();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  MEMORY[0x1E0C80A78](v0);
  v29 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D980);
  v3 = MEMORY[0x1E0C80A78](v2);
  v26 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v25 = (char *)&v24 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1DAE0C744();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DAE0C75C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D990);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v10, (uint64_t)qword_1F02A0400);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v13, v17, v10);
  sub_1DAE0C804();
  sub_1DAE0C768();
  sub_1DAE0D4DC();
  v18(v13, v17, v10);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
  v19 = sub_1DAE0C4F8();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v25, 1, 1, v19);
  v20(v26, 1, 1, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v29, *MEMORY[0x1E0C91738], v28);
  sub_1DADDDE3C();
  v21 = sub_1DAE0C558();
  sub_1DAE0C48C();
  sub_1DAE0C480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D998);
  *(_QWORD *)&v32 = type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  v30 = sub_1DAE0D548();
  v31 = v22;
  sub_1DAE0D740();
  sub_1DAE0C468();
  return v21;
}

unint64_t sub_1DADDDE3C()
{
  unint64_t result;

  result = qword_1ED4D44E0;
  if (!qword_1ED4D44E0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F960, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44E0);
  }
  return result;
}

unint64_t sub_1DADDDE80()
{
  unint64_t result;

  result = qword_1F029D9A0;
  if (!qword_1F029D9A0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DE70, &type metadata for SearchUIContinuationIntent);
    atomic_store(result, &qword_1F029D9A0);
  }
  return result;
}

uint64_t sub_1DADDDEC4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0C54C();
  *a1 = result;
  return result;
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

id sub_1DADDE028()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUISupplementaryIdentifiers();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

SearchUISupplementaryProvider __swiftcall SearchUISupplementaryProvider.init()()
{
  return (SearchUISupplementaryProvider)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SearchUISupplementaryProvider.init()()
{
  objc_super v1;

  v1.super_class = (Class)SearchUISupplementaryProvider;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t type metadata accessor for SearchUISupplementaryIdentifiers()
{
  return objc_opt_self();
}

unint64_t type metadata accessor for SearchUISupplementaryProvider()
{
  unint64_t result;

  result = qword_1F029D9C8;
  if (!qword_1F029D9C8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029D9C8);
  }
  return result;
}

uint64_t sub_1DADDE34C()
{
  unint64_t v0;

  v0 = sub_1DAE0D878();
  swift_bridgeObjectRelease();
  if (v0 >= 4)
    return 4;
  else
    return v0;
}

void sub_1DADDE394(void *a1)
{
  uint64_t v2;
  ValueMetadata *v3;
  _UNKNOWN **v4;
  uint64_t ObjCClassFromMetadata;
  void *v6;
  int v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;

  v2 = 0;
  do
  {
    v7 = byte_1EA1F8D80[v2 + 32];
    if (byte_1EA1F8D80[v2 + 32])
    {
      v8 = sub_1DADDE918();
      sub_1DADF4C28((uint64_t)&type metadata for Separator, (uint64_t)&off_1EA1FA5D8, v8);
    }
    else
    {
      v9 = type metadata accessor for Header();
      v10 = sub_1DADDE95C();
      sub_1DADF4C28(v9, (uint64_t)&off_1EA1F9E98, v10);
    }
    v11 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
    if (v7)
    {
      sub_1DADDE918();
      v3 = &type metadata for Separator;
      v4 = &off_1EA1FA5D8;
    }
    else
    {
      v3 = (ValueMetadata *)type metadata accessor for Header();
      sub_1DADDE95C();
      v4 = &off_1EA1F9E98;
    }
    ++v2;
    ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
    ((void (*)(uint64_t, uint64_t))v4[1])((uint64_t)v3, (uint64_t)v4);
    v6 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
    objc_msgSend(a1, sel_registerClass_forSupplementaryViewOfKind_withReuseIdentifier_, ObjCClassFromMetadata, v11, v6);

  }
  while (v2 != 4);
}

id sub_1DADDE56C(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5)
{
  unsigned int v8;
  _UNKNOWN **v9;
  ValueMetadata *v10;
  unint64_t v11;
  id result;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;

  swift_bridgeObjectRetain();
  v8 = sub_1DADDE34C();
  if (v8 - 1 >= 3)
  {
    if ((_BYTE)v8)
      return 0;
    v20 = a4;
    v10 = (ValueMetadata *)type metadata accessor for Header();
    v9 = &off_1EA1F9E98;
    v11 = sub_1DADDE95C();
  }
  else
  {
    v20 = a4;
    v9 = &off_1EA1FA5D8;
    v10 = &type metadata for Separator;
    v11 = sub_1DADDE918();
  }
  result = objc_msgSend(a5, sel_collectionView, v11);
  if (result)
  {
    v13 = result;
    v14 = (void *)sub_1DAE0D530();
    ((void (*)(uint64_t, uint64_t))v9[1])((uint64_t)v10, (uint64_t)v9);
    v15 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
    v16 = (void *)sub_1DAE0C834();
    v17 = objc_msgSend(v13, sel_dequeueReusableSupplementaryViewOfKind_withReuseIdentifier_forIndexPath_, v14, v15, v16);

    result = objc_msgSend(a5, sel_searchUIAttributes);
    if (result)
    {
      v18 = result;
      sub_1DADF4C3C(v17, a3, v8, v20, result, (uint64_t)v10, (uint64_t)v9, v19);

      return v17;
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADDE720()
{
  uint64_t v0;
  uint64_t v1;
  char *v2;
  uint64_t v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v10[3];
  uint64_t v11;
  uint64_t v12;

  v0 = type metadata accessor for Header();
  MEMORY[0x1E0C80A78](v0);
  v2 = (char *)&v10[-1] - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B448);
  v3 = swift_dynamicCastClass();
  if (!v3)
    return 3;
  v4 = *(id *)(v3 + qword_1ED4D4460);
  sub_1DAE0CB88();

  sub_1DADDE830((uint64_t)&v2[*(int *)(v0 + 40)], (uint64_t)v10);
  v5 = v11;
  if (v11)
  {
    v6 = v12;
    __swift_project_boxed_opaque_existential_1(v10, v11);
    v7 = (*(uint64_t (**)(uint64_t, uint64_t))(v6 + 32))(v5, v6);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v10);
  }
  else
  {
    sub_1DADDE878((uint64_t)v10);
    v7 = 3;
  }
  sub_1DADDE8B8((uint64_t)v2);
  return v7;
}

uint64_t sub_1DADDE830(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B0E8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADDE878(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B0E8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADDE8B8(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for Header();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_QWORD *__swift_project_boxed_opaque_existential_1(_QWORD *result, uint64_t a2)
{
  if ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) & 0x20000) != 0)
    return (_QWORD *)(*result
                    + ((*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80) + 16) & ~(unint64_t)*(_DWORD *)(*(_QWORD *)(a2 - 8) + 80)));
  return result;
}

unint64_t sub_1DADDE918()
{
  unint64_t result;

  result = qword_1ED4D4470;
  if (!qword_1ED4D4470)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F24C, &type metadata for Separator);
    atomic_store(result, (unint64_t *)&qword_1ED4D4470);
  }
  return result;
}

unint64_t sub_1DADDE95C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1ED4D4360;
  if (!qword_1ED4D4360)
  {
    v1 = type metadata accessor for Header();
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1EB00, v1);
    atomic_store(result, (unint64_t *)&qword_1ED4D4360);
  }
  return result;
}

ValueMetadata *type metadata accessor for TrailingIconLabelStyle()
{
  return &type metadata for TrailingIconLabelStyle;
}

uint64_t sub_1DADDE9B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADDE9C4@<X0>(char *a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  void (*v15)(char *, char *, uint64_t);
  void (*v16)(char *, char *, uint64_t);
  char *v17;
  uint64_t v18;
  void (*v19)(char *, uint64_t);
  void (*v20)(char *, uint64_t);
  uint64_t v22;
  char *v23;

  v23 = a1;
  v1 = sub_1DAE0CE04();
  v22 = *(_QWORD *)(v1 - 8);
  v2 = v22;
  v3 = MEMORY[0x1E0C80A78](v1);
  v5 = (char *)&v22 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v22 - v6;
  v8 = sub_1DAE0CE1C();
  v9 = *(_QWORD *)(v8 - 8);
  v10 = MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v22 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v14 = (char *)&v22 - v13;
  sub_1DAE0CE28();
  sub_1DAE0CE10();
  v15 = *(void (**)(char *, char *, uint64_t))(v9 + 16);
  v15(v12, v14, v8);
  v16 = *(void (**)(char *, char *, uint64_t))(v2 + 16);
  v16(v5, v7, v1);
  v17 = v23;
  v15(v23, v12, v8);
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B3A0);
  v16(&v17[*(int *)(v18 + 48)], v5, v1);
  v19 = *(void (**)(char *, uint64_t))(v22 + 8);
  v19(v7, v1);
  v20 = *(void (**)(char *, uint64_t))(v9 + 8);
  v20(v14, v8);
  v19(v5, v1);
  return ((uint64_t (*)(char *, uint64_t))v20)(v12, v8);
}

uint64_t sub_1DADDEB64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;

  *(_QWORD *)a1 = sub_1DAE0CCE4();
  *(_QWORD *)(a1 + 8) = 0x4010000000000000;
  *(_BYTE *)(a1 + 16) = 0;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B368);
  return sub_1DADDE9C4((char *)(a1 + *(int *)(v2 + 44)));
}

unint64_t sub_1DADDEBB4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B400;
  if (!qword_1F029B400)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B0E0);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDFB10], v1);
    atomic_store(result, (unint64_t *)&qword_1F029B400);
  }
  return result;
}

id sub_1DADDEC00()
{
  uint64_t v0;
  id result;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = MEMORY[0x1E0DEE9E8];
  v7 = MEMORY[0x1E0DEE9E8];
  result = objc_msgSend((id)objc_opt_self(), sel_bundleIdentifierForApp_, 4);
  if (result)
  {
    v2 = result;
    v3 = sub_1DAE0D53C();
    v5 = v4;

    sub_1DADDF324(&v6, v3, v5);
    result = (id)swift_bridgeObjectRelease();
    v0 = v7;
  }
  qword_1F02A0368 = v0;
  return result;
}

uint64_t static SearchUIToolKitUtilities.performOpenIntent(for:bundleId:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);

  v9 = (uint64_t (*)(uint64_t, uint64_t, uint64_t))((char *)&dword_1F029D9D8 + dword_1F029D9D8);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v7;
  *v7 = v3;
  v7[1] = sub_1DADDED10;
  return v9(a1, a2, a3);
}

uint64_t sub_1DADDED10(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1DADDED60(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD *v11;
  BOOL v12;
  uint64_t result;
  uint64_t v14;
  unint64_t v15;
  _QWORD *v16;
  BOOL v17;

  if (*(_QWORD *)(a3 + 16))
  {
    sub_1DAE0D914();
    sub_1DAE0D554();
    v6 = sub_1DAE0D92C();
    v7 = -1 << *(_BYTE *)(a3 + 32);
    v8 = v6 & ~v7;
    v9 = a3 + 56;
    if (((*(_QWORD *)(a3 + 56 + ((v8 >> 3) & 0xFFFFFFFFFFFFF8)) >> v8) & 1) != 0)
    {
      v10 = *(_QWORD *)(a3 + 48);
      v11 = (_QWORD *)(v10 + 16 * v8);
      v12 = *v11 == a1 && v11[1] == a2;
      if (v12 || (sub_1DAE0D8A8() & 1) != 0)
        return 1;
      v14 = ~v7;
      v15 = (v8 + 1) & v14;
      if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) != 0)
      {
        while (1)
        {
          v16 = (_QWORD *)(v10 + 16 * v15);
          v17 = *v16 == a1 && v16[1] == a2;
          if (v17 || (sub_1DAE0D8A8() & 1) != 0)
            break;
          result = 0;
          v15 = (v15 + 1) & v14;
          if (((*(_QWORD *)(v9 + ((v15 >> 3) & 0xFFFFFFFFFFFFF8)) >> v15) & 1) == 0)
            return result;
        }
        return 1;
      }
    }
  }
  return 0;
}

uint64_t sub_1DADDEE94(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void (*a5)(_QWORD), uint64_t (*a6)(char *))
{
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v12;

  a5(0);
  MEMORY[0x1E0C80A78]();
  v9 = (char *)&v12 - v8;
  (*(void (**)(char *, uint64_t))(v10 + 16))((char *)&v12 - v8, a1);
  return a6(v9);
}

unint64_t sub_1DADDEF10(uint64_t a1)
{
  uint64_t v2;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t result;
  char v10;
  uint64_t *v11;
  uint64_t v12;
  BOOL v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v17;

  if (!*(_QWORD *)(a1 + 16))
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9E0];
    goto LABEL_9;
  }
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA78);
  v2 = sub_1DAE0D848();
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
  sub_1DAE0C564();
  while (1)
  {
    sub_1DADE2598(v6, (uint64_t)&v15);
    v7 = v15;
    v8 = v16;
    result = sub_1DADDFDA0(v15, v16);
    if ((v10 & 1) != 0)
      break;
    *(_QWORD *)(v5 + ((result >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << result;
    v11 = (uint64_t *)(v3[6] + 16 * result);
    *v11 = v7;
    v11[1] = v8;
    result = sub_1DADE25E0(&v17, v3[7] + 40 * result);
    v12 = v3[2];
    v13 = __OFADD__(v12, 1);
    v14 = v12 + 1;
    if (v13)
      goto LABEL_11;
    v3[2] = v14;
    v6 += 56;
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

uint64_t sub_1DADDF170(void *a1, int a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD *v9;
  uint64_t (*v11)(id, uint64_t, uint64_t);

  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  v5 = sub_1DAE0D53C();
  v7 = v6;
  v3[4] = v6;
  v11 = (uint64_t (*)(id, uint64_t, uint64_t))((char *)&dword_1F029D9D8 + dword_1F029D9D8);
  v8 = a1;
  v9 = (_QWORD *)swift_task_alloc();
  v3[5] = v9;
  *v9 = v3;
  v9[1] = sub_1DADDF218;
  return v11(v8, v5, v7);
}

uint64_t sub_1DADDF218(char a1)
{
  uint64_t *v1;
  void (**v3)(_QWORD, _QWORD);
  void *v4;
  uint64_t v6;

  v4 = *(void **)(*v1 + 16);
  v3 = *(void (***)(_QWORD, _QWORD))(*v1 + 24);
  v6 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();

  v3[2](v3, a1 & 1);
  _Block_release(v3);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

SearchUIToolKitUtilities __swiftcall SearchUIToolKitUtilities.init()()
{
  return (SearchUIToolKitUtilities)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SearchUIToolKitUtilities.init()()
{
  objc_super v1;

  v1.super_class = (Class)SearchUIToolKitUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

uint64_t sub_1DADDF324(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t *v3;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  BOOL v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v17;
  _QWORD *v18;
  BOOL v19;
  char isUniquelyReferenced_nonNull_native;
  uint64_t v21;

  v7 = *v3;
  sub_1DAE0D914();
  swift_bridgeObjectRetain();
  sub_1DAE0D554();
  v8 = sub_1DAE0D92C();
  v9 = -1 << *(_BYTE *)(v7 + 32);
  v10 = v8 & ~v9;
  if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) != 0)
  {
    v11 = *(_QWORD *)(v7 + 48);
    v12 = (_QWORD *)(v11 + 16 * v10);
    v13 = *v12 == a2 && v12[1] == a3;
    if (v13 || (sub_1DAE0D8A8() & 1) != 0)
    {
LABEL_7:
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v14 = (uint64_t *)(*(_QWORD *)(*v3 + 48) + 16 * v10);
      v15 = v14[1];
      *a1 = *v14;
      a1[1] = v15;
      swift_bridgeObjectRetain();
      return 0;
    }
    v17 = ~v9;
    while (1)
    {
      v10 = (v10 + 1) & v17;
      if (((*(_QWORD *)(v7 + 56 + ((v10 >> 3) & 0xFFFFFFFFFFFFF8)) >> v10) & 1) == 0)
        break;
      v18 = (_QWORD *)(v11 + 16 * v10);
      v19 = *v18 == a2 && v18[1] == a3;
      if (v19 || (sub_1DAE0D8A8() & 1) != 0)
        goto LABEL_7;
    }
  }
  swift_bridgeObjectRelease();
  isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  v21 = *v3;
  *v3 = 0x8000000000000000;
  swift_bridgeObjectRetain();
  sub_1DADDF7AC(a2, a3, v10, isUniquelyReferenced_nonNull_native);
  *v3 = v21;
  swift_bridgeObjectRelease();
  *a1 = a2;
  a1[1] = a3;
  return 1;
}

uint64_t sub_1DADDF4D0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B4F0);
  v3 = sub_1DAE0D758();
  v4 = v3;
  if (*(_QWORD *)(v2 + 16))
  {
    v5 = 1 << *(_BYTE *)(v2 + 32);
    v30 = (_QWORD *)(v2 + 56);
    if (v5 < 64)
      v6 = ~(-1 << v5);
    else
      v6 = -1;
    v7 = v6 & *(_QWORD *)(v2 + 56);
    v8 = (unint64_t)(v5 + 63) >> 6;
    v9 = v3 + 56;
    result = sub_1DAE0C564();
    v11 = 0;
    while (1)
    {
      if (v7)
      {
        v14 = __clz(__rbit64(v7));
        v7 &= v7 - 1;
        v15 = v14 | (v11 << 6);
      }
      else
      {
        v16 = v11 + 1;
        if (__OFADD__(v11, 1))
        {
LABEL_38:
          __break(1u);
LABEL_39:
          __break(1u);
          return result;
        }
        if (v16 >= v8)
          goto LABEL_33;
        v17 = v30[v16];
        ++v11;
        if (!v17)
        {
          v11 = v16 + 1;
          if (v16 + 1 >= v8)
            goto LABEL_33;
          v17 = v30[v11];
          if (!v17)
          {
            v11 = v16 + 2;
            if (v16 + 2 >= v8)
              goto LABEL_33;
            v17 = v30[v11];
            if (!v17)
            {
              v18 = v16 + 3;
              if (v18 >= v8)
              {
LABEL_33:
                swift_release();
                v1 = v0;
                v29 = 1 << *(_BYTE *)(v2 + 32);
                if (v29 > 63)
                  bzero(v30, ((unint64_t)(v29 + 63) >> 3) & 0x1FFFFFFFFFFFFFF8);
                else
                  *v30 = -1 << v29;
                *(_QWORD *)(v2 + 16) = 0;
                break;
              }
              v17 = v30[v18];
              if (!v17)
              {
                while (1)
                {
                  v11 = v18 + 1;
                  if (__OFADD__(v18, 1))
                    goto LABEL_39;
                  if (v11 >= v8)
                    goto LABEL_33;
                  v17 = v30[v11];
                  ++v18;
                  if (v17)
                    goto LABEL_23;
                }
              }
              v11 = v18;
            }
          }
        }
LABEL_23:
        v7 = (v17 - 1) & v17;
        v15 = __clz(__rbit64(v17)) + (v11 << 6);
      }
      v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
      v20 = *v19;
      v21 = v19[1];
      sub_1DAE0D914();
      sub_1DAE0D554();
      result = sub_1DAE0D92C();
      v22 = -1 << *(_BYTE *)(v4 + 32);
      v23 = result & ~v22;
      v24 = v23 >> 6;
      if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
      {
        v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
      }
      else
      {
        v25 = 0;
        v26 = (unint64_t)(63 - v22) >> 6;
        do
        {
          if (++v24 == v26 && (v25 & 1) != 0)
          {
            __break(1u);
            goto LABEL_38;
          }
          v27 = v24 == v26;
          if (v24 == v26)
            v24 = 0;
          v25 |= v27;
          v28 = *(_QWORD *)(v9 + 8 * v24);
        }
        while (v28 == -1);
        v12 = __clz(__rbit64(~v28)) + (v24 << 6);
      }
      *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
      v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
      *v13 = v20;
      v13[1] = v21;
      ++*(_QWORD *)(v4 + 16);
    }
  }
  result = swift_release();
  *v1 = v4;
  return result;
}

uint64_t sub_1DADDF7AC(uint64_t result, uint64_t a2, unint64_t a3, char a4)
{
  uint64_t *v4;
  uint64_t *v5;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  BOOL v16;
  uint64_t v17;
  _QWORD *v18;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;

  v5 = v4;
  v8 = result;
  v9 = *(_QWORD *)(*v4 + 16);
  v10 = *(_QWORD *)(*v4 + 24);
  if (v10 > v9 && (a4 & 1) != 0)
    goto LABEL_22;
  if ((a4 & 1) != 0)
  {
    sub_1DADDF4D0();
  }
  else
  {
    if (v10 > v9)
    {
      result = (uint64_t)sub_1DADDF944();
      goto LABEL_22;
    }
    sub_1DADDFAF4();
  }
  v11 = *v4;
  sub_1DAE0D914();
  sub_1DAE0D554();
  result = sub_1DAE0D92C();
  v12 = -1 << *(_BYTE *)(v11 + 32);
  a3 = result & ~v12;
  v13 = v11 + 56;
  if (((*(_QWORD *)(v11 + 56 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) != 0)
  {
    v14 = *(_QWORD *)(v11 + 48);
    v15 = (_QWORD *)(v14 + 16 * a3);
    v16 = *v15 == v8 && v15[1] == a2;
    if (v16 || (result = sub_1DAE0D8A8(), (result & 1) != 0))
    {
LABEL_21:
      result = sub_1DAE0D8B4();
      __break(1u);
    }
    else
    {
      v17 = ~v12;
      while (1)
      {
        a3 = (a3 + 1) & v17;
        if (((*(_QWORD *)(v13 + ((a3 >> 3) & 0xFFFFFFFFFFFFF8)) >> a3) & 1) == 0)
          break;
        v18 = (_QWORD *)(v14 + 16 * a3);
        if (*v18 != v8 || v18[1] != a2)
        {
          result = sub_1DAE0D8A8();
          if ((result & 1) == 0)
            continue;
        }
        goto LABEL_21;
      }
    }
  }
LABEL_22:
  v20 = *v5;
  *(_QWORD *)(*v5 + 8 * (a3 >> 6) + 56) |= 1 << a3;
  v21 = (uint64_t *)(*(_QWORD *)(v20 + 48) + 16 * a3);
  *v21 = v8;
  v21[1] = a2;
  v22 = *(_QWORD *)(v20 + 16);
  v23 = __OFADD__(v22, 1);
  v24 = v22 + 1;
  if (v23)
    __break(1u);
  else
    *(_QWORD *)(v20 + 16) = v24;
  return result;
}

void *sub_1DADDF944()
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
  _QWORD *v17;
  uint64_t v18;
  _QWORD *v19;
  int64_t v20;
  unint64_t v21;
  int64_t v22;

  v1 = v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B4F0);
  v2 = *v0;
  v3 = sub_1DAE0D74C();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
LABEL_28:
    result = (void *)swift_release();
    *v1 = v4;
    return result;
  }
  result = (void *)(v3 + 56);
  v6 = v2 + 56;
  v7 = (unint64_t)((1 << *(_BYTE *)(v4 + 32)) + 63) >> 6;
  if (v4 != v2 || (unint64_t)result >= v2 + 56 + 8 * v7)
    result = memmove(result, (const void *)(v2 + 56), 8 * v7);
  v9 = 0;
  *(_QWORD *)(v4 + 16) = *(_QWORD *)(v2 + 16);
  v10 = 1 << *(_BYTE *)(v2 + 32);
  v11 = -1;
  if (v10 < 64)
    v11 = ~(-1 << v10);
  v12 = v11 & *(_QWORD *)(v2 + 56);
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
    v20 = v9 + 1;
    if (__OFADD__(v9, 1))
    {
      __break(1u);
      goto LABEL_30;
    }
    if (v20 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v20);
    ++v9;
    if (!v21)
    {
      v9 = v20 + 1;
      if (v20 + 1 >= v13)
        goto LABEL_28;
      v21 = *(_QWORD *)(v6 + 8 * v9);
      if (!v21)
      {
        v9 = v20 + 2;
        if (v20 + 2 >= v13)
          goto LABEL_28;
        v21 = *(_QWORD *)(v6 + 8 * v9);
        if (!v21)
          break;
      }
    }
LABEL_27:
    v12 = (v21 - 1) & v21;
    v15 = __clz(__rbit64(v21)) + (v9 << 6);
LABEL_12:
    v16 = 16 * v15;
    v17 = (_QWORD *)(*(_QWORD *)(v2 + 48) + v16);
    v18 = v17[1];
    v19 = (_QWORD *)(*(_QWORD *)(v4 + 48) + v16);
    *v19 = *v17;
    v19[1] = v18;
    result = (void *)swift_bridgeObjectRetain();
  }
  v22 = v20 + 3;
  if (v22 >= v13)
    goto LABEL_28;
  v21 = *(_QWORD *)(v6 + 8 * v22);
  if (v21)
  {
    v9 = v22;
    goto LABEL_27;
  }
  while (1)
  {
    v9 = v22 + 1;
    if (__OFADD__(v22, 1))
      break;
    if (v9 >= v13)
      goto LABEL_28;
    v21 = *(_QWORD *)(v6 + 8 * v9);
    ++v22;
    if (v21)
      goto LABEL_27;
  }
LABEL_30:
  __break(1u);
  return result;
}

uint64_t sub_1DADDFAF4()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t result;
  int64_t v11;
  unint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  int64_t v16;
  unint64_t v17;
  int64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  unint64_t v24;
  char v25;
  unint64_t v26;
  BOOL v27;
  uint64_t v28;
  int64_t v29;

  v1 = v0;
  v2 = *v0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B4F0);
  v3 = sub_1DAE0D758();
  v4 = v3;
  if (!*(_QWORD *)(v2 + 16))
  {
    result = swift_release();
LABEL_35:
    *v1 = v4;
    return result;
  }
  v5 = 1 << *(_BYTE *)(v2 + 32);
  v6 = v2 + 56;
  if (v5 < 64)
    v7 = ~(-1 << v5);
  else
    v7 = -1;
  v8 = v7 & *(_QWORD *)(v2 + 56);
  v29 = (unint64_t)(v5 + 63) >> 6;
  v9 = v3 + 56;
  result = sub_1DAE0C564();
  v11 = 0;
  while (1)
  {
    if (v8)
    {
      v14 = __clz(__rbit64(v8));
      v8 &= v8 - 1;
      v15 = v14 | (v11 << 6);
      goto LABEL_24;
    }
    v16 = v11 + 1;
    if (__OFADD__(v11, 1))
    {
LABEL_36:
      __break(1u);
      goto LABEL_37;
    }
    if (v16 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v16);
    ++v11;
    if (!v17)
    {
      v11 = v16 + 1;
      if (v16 + 1 >= v29)
        goto LABEL_33;
      v17 = *(_QWORD *)(v6 + 8 * v11);
      if (!v17)
      {
        v11 = v16 + 2;
        if (v16 + 2 >= v29)
          goto LABEL_33;
        v17 = *(_QWORD *)(v6 + 8 * v11);
        if (!v17)
          break;
      }
    }
LABEL_23:
    v8 = (v17 - 1) & v17;
    v15 = __clz(__rbit64(v17)) + (v11 << 6);
LABEL_24:
    v19 = (uint64_t *)(*(_QWORD *)(v2 + 48) + 16 * v15);
    v20 = *v19;
    v21 = v19[1];
    sub_1DAE0D914();
    swift_bridgeObjectRetain();
    sub_1DAE0D554();
    result = sub_1DAE0D92C();
    v22 = -1 << *(_BYTE *)(v4 + 32);
    v23 = result & ~v22;
    v24 = v23 >> 6;
    if (((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6))) != 0)
    {
      v12 = __clz(__rbit64((-1 << v23) & ~*(_QWORD *)(v9 + 8 * (v23 >> 6)))) | v23 & 0x7FFFFFFFFFFFFFC0;
    }
    else
    {
      v25 = 0;
      v26 = (unint64_t)(63 - v22) >> 6;
      do
      {
        if (++v24 == v26 && (v25 & 1) != 0)
        {
          __break(1u);
          goto LABEL_36;
        }
        v27 = v24 == v26;
        if (v24 == v26)
          v24 = 0;
        v25 |= v27;
        v28 = *(_QWORD *)(v9 + 8 * v24);
      }
      while (v28 == -1);
      v12 = __clz(__rbit64(~v28)) + (v24 << 6);
    }
    *(_QWORD *)(v9 + ((v12 >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << v12;
    v13 = (_QWORD *)(*(_QWORD *)(v4 + 48) + 16 * v12);
    *v13 = v20;
    v13[1] = v21;
    ++*(_QWORD *)(v4 + 16);
  }
  v18 = v16 + 3;
  if (v18 >= v29)
  {
LABEL_33:
    result = swift_release_n();
    v1 = v0;
    goto LABEL_35;
  }
  v17 = *(_QWORD *)(v6 + 8 * v18);
  if (v17)
  {
    v11 = v18;
    goto LABEL_23;
  }
  while (1)
  {
    v11 = v18 + 1;
    if (__OFADD__(v18, 1))
      break;
    if (v11 >= v29)
      goto LABEL_33;
    v17 = *(_QWORD *)(v6 + 8 * v11);
    ++v18;
    if (v17)
      goto LABEL_23;
  }
LABEL_37:
  __break(1u);
  return result;
}

unint64_t sub_1DADDFDA0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  sub_1DAE0D914();
  sub_1DAE0D554();
  v4 = sub_1DAE0D92C();
  return sub_1DADDFE04(a1, a2, v4);
}

unint64_t sub_1DADDFE04(uint64_t a1, uint64_t a2, uint64_t a3)
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
    if (!v11 && (sub_1DAE0D8A8() & 1) == 0)
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
      while (!v14 && (sub_1DAE0D8A8() & 1) == 0);
    }
  }
  return v6;
}

uint64_t sub_1DADDFEE4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t result;
  uint64_t v10;
  unint64_t v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  BOOL v17;
  uint64_t v18;
  _QWORD *v19;
  _QWORD *v21;
  uint64_t v22;
  BOOL v23;
  uint64_t v24;
  uint64_t v25;

  v1 = *(_QWORD *)(a1 + 16);
  if (v1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B4F0);
    v3 = sub_1DAE0D764();
    v4 = 0;
    v5 = v3 + 56;
    v25 = a1 + 32;
    while (1)
    {
      v6 = (uint64_t *)(v25 + 16 * v4);
      v8 = *v6;
      v7 = v6[1];
      sub_1DAE0D914();
      swift_bridgeObjectRetain();
      sub_1DAE0D554();
      result = sub_1DAE0D92C();
      v10 = -1 << *(_BYTE *)(v3 + 32);
      v11 = result & ~v10;
      v12 = v11 >> 6;
      v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
      v14 = 1 << v11;
      if (((1 << v11) & v13) != 0)
      {
        v15 = *(_QWORD *)(v3 + 48);
        v16 = (_QWORD *)(v15 + 16 * v11);
        v17 = *v16 == v8 && v16[1] == v7;
        if (v17 || (result = sub_1DAE0D8A8(), (result & 1) != 0))
        {
LABEL_3:
          swift_bridgeObjectRelease();
          goto LABEL_4;
        }
        v18 = ~v10;
        while (1)
        {
          v11 = (v11 + 1) & v18;
          v12 = v11 >> 6;
          v13 = *(_QWORD *)(v5 + 8 * (v11 >> 6));
          v14 = 1 << v11;
          if ((v13 & (1 << v11)) == 0)
            break;
          v19 = (_QWORD *)(v15 + 16 * v11);
          if (*v19 != v8 || v19[1] != v7)
          {
            result = sub_1DAE0D8A8();
            if ((result & 1) == 0)
              continue;
          }
          goto LABEL_3;
        }
      }
      *(_QWORD *)(v5 + 8 * v12) = v14 | v13;
      v21 = (_QWORD *)(*(_QWORD *)(v3 + 48) + 16 * v11);
      *v21 = v8;
      v21[1] = v7;
      v22 = *(_QWORD *)(v3 + 16);
      v23 = __OFADD__(v22, 1);
      v24 = v22 + 1;
      if (v23)
      {
        __break(1u);
        return result;
      }
      *(_QWORD *)(v3 + 16) = v24;
LABEL_4:
      if (++v4 == v1)
        return v3;
    }
  }
  return MEMORY[0x1E0DEE9E8];
}

uint64_t sub_1DADE0084(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1DAE0D218();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DAA0);
    v10 = sub_1DAE0D764();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1DADE25F8(&qword_1F029DAA8, (uint64_t (*)(uint64_t))MEMORY[0x1E0DC01D0], MEMORY[0x1E0DC01E0]);
      v14 = sub_1DAE0D4B8();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1DADE25F8((unint64_t *)&unk_1F029DAB0, (uint64_t (*)(uint64_t))MEMORY[0x1E0DC01D0], MEMORY[0x1E0DC01E8]);
          v20 = sub_1DAE0D4D0();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

uint64_t sub_1DADE02EC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  void (*v22)(char *, uint64_t);
  uint64_t result;
  uint64_t v24;
  BOOL v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(char *, uint64_t, uint64_t);
  uint64_t v32;

  v2 = sub_1DAE0D128();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = MEMORY[0x1E0C80A78](v2);
  v6 = (char *)&v27 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v4);
  v8 = (char *)&v27 - v7;
  v9 = *(_QWORD *)(a1 + 16);
  if (v9)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA88);
    v10 = sub_1DAE0D764();
    v11 = 0;
    v12 = *(unsigned __int8 *)(v3 + 80);
    v28 = v9;
    v29 = a1 + ((v12 + 32) & ~v12);
    v13 = *(_QWORD *)(v3 + 72);
    v31 = *(void (**)(char *, uint64_t, uint64_t))(v3 + 16);
    v32 = v10 + 56;
    while (1)
    {
      v30 = v11;
      v31(v8, v29 + v13 * v11, v2);
      sub_1DADE25F8(&qword_1F029DA90, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBF7E8], MEMORY[0x1E0DBF7F8]);
      v14 = sub_1DAE0D4B8();
      v15 = ~(-1 << *(_BYTE *)(v10 + 32));
      v16 = v14 & v15;
      v17 = (v14 & (unint64_t)v15) >> 6;
      v18 = *(_QWORD *)(v32 + 8 * v17);
      v19 = 1 << (v14 & v15);
      if ((v19 & v18) != 0)
      {
        do
        {
          v31(v6, *(_QWORD *)(v10 + 48) + v16 * v13, v2);
          sub_1DADE25F8(&qword_1F029DA98, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBF7E8], MEMORY[0x1E0DBF800]);
          v20 = sub_1DAE0D4D0();
          v21 = v3;
          v22 = *(void (**)(char *, uint64_t))(v3 + 8);
          v22(v6, v2);
          if ((v20 & 1) != 0)
          {
            v22(v8, v2);
            v3 = v21;
            v9 = v28;
            goto LABEL_4;
          }
          v16 = (v16 + 1) & v15;
          v17 = v16 >> 6;
          v18 = *(_QWORD *)(v32 + 8 * (v16 >> 6));
          v19 = 1 << v16;
          v3 = v21;
        }
        while ((v18 & (1 << v16)) != 0);
        v9 = v28;
      }
      *(_QWORD *)(v32 + 8 * v17) = v19 | v18;
      result = (*(uint64_t (**)(unint64_t, char *, uint64_t))(v3 + 32))(*(_QWORD *)(v10 + 48) + v16 * v13, v8, v2);
      v24 = *(_QWORD *)(v10 + 16);
      v25 = __OFADD__(v24, 1);
      v26 = v24 + 1;
      if (v25)
        break;
      *(_QWORD *)(v10 + 16) = v26;
LABEL_4:
      v11 = v30 + 1;
      if (v30 + 1 == v9)
        return v10;
    }
    __break(1u);
  }
  else
  {
    return MEMORY[0x1E0DEE9E8];
  }
  return result;
}

uint64_t sub_1DADE0554(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;
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

  v3[23] = a2;
  v3[24] = a3;
  v3[22] = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA30);
  v3[25] = swift_task_alloc();
  v4 = sub_1DAE0D14C();
  v3[26] = v4;
  v3[27] = *(_QWORD *)(v4 - 8);
  v3[28] = swift_task_alloc();
  v5 = sub_1DAE0D20C();
  v3[29] = v5;
  v3[30] = *(_QWORD *)(v5 - 8);
  v3[31] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA38);
  v3[32] = swift_task_alloc();
  v6 = sub_1DAE0D200();
  v3[33] = v6;
  v3[34] = *(_QWORD *)(v6 - 8);
  v3[35] = swift_task_alloc();
  v7 = sub_1DAE0D134();
  v3[36] = v7;
  v3[37] = *(_QWORD *)(v7 - 8);
  v3[38] = swift_task_alloc();
  v3[39] = swift_task_alloc();
  v3[40] = swift_task_alloc();
  v8 = sub_1DAE0D1E8();
  v3[41] = v8;
  v3[42] = *(_QWORD *)(v8 - 8);
  v3[43] = swift_task_alloc();
  v9 = sub_1DAE0C810();
  v3[44] = v9;
  v3[45] = *(_QWORD *)(v9 - 8);
  v3[46] = swift_task_alloc();
  v10 = sub_1DAE0D11C();
  v3[47] = v10;
  v3[48] = *(_QWORD *)(v10 - 8);
  v3[49] = swift_task_alloc();
  v11 = sub_1DAE0D194();
  v3[50] = v11;
  v3[51] = *(_QWORD *)(v11 - 8);
  v3[52] = swift_task_alloc();
  v12 = sub_1DAE0D17C();
  v3[53] = v12;
  v3[54] = *(_QWORD *)(v12 - 8);
  v3[55] = swift_task_alloc();
  v3[56] = swift_task_alloc();
  v3[57] = swift_task_alloc();
  v13 = sub_1DAE0D218();
  v3[58] = v13;
  v3[59] = *(_QWORD *)(v13 - 8);
  v3[60] = swift_task_alloc();
  v3[61] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADE07B0()
{
  uint64_t v0;
  uint64_t v1;
  NSObject *v2;
  os_log_type_t v3;
  _BOOL4 v4;
  unint64_t v5;
  uint64_t v6;
  uint8_t *v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  unint64_t v21;
  _QWORD *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  os_log_type_t v27;
  uint64_t v29;
  uint64_t v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void (*v34)(uint64_t, uint64_t);
  uint64_t v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  uint64_t v47;
  unint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  void (*v52)(uint64_t, unint64_t, uint64_t);
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t inited;
  uint64_t v57;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v59;
  uint64_t v60;
  NSObject *v61;
  os_log_type_t v62;
  _BOOL4 v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint8_t *v67;
  uint64_t v68;
  _QWORD *v69;
  uint64_t v70;
  NSObject *v71;
  os_log_type_t v72;
  _BOOL4 v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint8_t *v77;
  uint64_t v78;
  uint64_t v79;
  void (*v80)(unint64_t, uint64_t, uint64_t);
  unint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t *v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106[3];

  if (qword_1F029D6A8 != -1)
    swift_once();
  if ((sub_1DADDED60(*(_QWORD *)(v0 + 184), *(_QWORD *)(v0 + 192), qword_1F02A0368) & 1) != 0)
  {
    if (qword_1F029D6C0 != -1)
      swift_once();
    v1 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v1, (uint64_t)qword_1F02A03A8);
    swift_bridgeObjectRetain_n();
    v2 = sub_1DAE0CA74();
    v3 = sub_1DAE0D6C8();
    v4 = os_log_type_enabled(v2, v3);
    v5 = *(_QWORD *)(v0 + 192);
    if (!v4)
    {
      swift_bridgeObjectRelease_n();
LABEL_18:

LABEL_19:
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      swift_task_dealloc();
      return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
    }
    v6 = *(_QWORD *)(v0 + 184);
    v7 = (uint8_t *)swift_slowAlloc();
    v8 = swift_slowAlloc();
    v106[0] = v8;
    *(_DWORD *)v7 = 136315138;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 168) = sub_1DADDC540(v6, v5, v106);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease_n();
    _os_log_impl(&dword_1DAD39000, v2, v3, "Unable to perform OpenIntent: %s opted out", v7, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A8B9C](v8, -1, -1);
LABEL_17:
    MEMORY[0x1DF0A8B9C](v7, -1, -1);
    goto LABEL_18;
  }
  v9 = objc_msgSend(*(id *)(v0 + 176), sel_entityIdentifer);
  if (!v9)
  {
LABEL_13:
    if (qword_1F029D6C0 != -1)
      swift_once();
    v26 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v26, (uint64_t)qword_1F02A03A8);
    v2 = sub_1DAE0CA74();
    v27 = sub_1DAE0D6C8();
    if (!os_log_type_enabled(v2, v27))
      goto LABEL_18;
    v7 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_1DAD39000, v2, v27, "Unable to perform OpenIntent: incomplete annotation", v7, 2u);
    goto LABEL_17;
  }
  v10 = v9;
  v11 = *(void **)(v0 + 176);
  sub_1DAE0D53C();

  v12 = objc_msgSend(v11, sel_typeIdentifer);
  if (!v12)
  {
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  v13 = v12;
  v14 = *(_QWORD **)(v0 + 488);
  v15 = *(_QWORD *)(v0 + 464);
  v16 = *(_QWORD *)(v0 + 472);
  v18 = *(_QWORD *)(v0 + 184);
  v17 = *(_QWORD *)(v0 + 192);
  v19 = sub_1DAE0D53C();
  v21 = v20;

  *(_QWORD *)(v0 + 496) = v19;
  *(_QWORD *)(v0 + 504) = v21;
  v22 = (_QWORD *)swift_allocObject();
  v22[2] = v18;
  v22[3] = v17;
  v22[4] = v19;
  v22[5] = v21;
  *v14 = v22;
  (*(void (**)(_QWORD *, _QWORD, uint64_t))(v16 + 104))(v14, *MEMORY[0x1E0DC01C0], v15);
  sub_1DAE0D1C4();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  *(_QWORD *)(v0 + 512) = sub_1DAE0D1B8();
  v23 = *(_QWORD *)(v0 + 488);
  v24 = *(_QWORD *)(v0 + 464);
  v25 = *(_QWORD *)(v0 + 472);
  v79 = v19;
  v81 = v21;
  v29 = *(_QWORD *)(v0 + 440);
  v101 = *(_QWORD *)(v0 + 448);
  v85 = *(_QWORD *)(v0 + 432);
  v30 = *(_QWORD *)(v0 + 416);
  v100 = *(_QWORD *)(v0 + 424);
  v82 = *(_QWORD *)(v0 + 408);
  v83 = *(_QWORD *)(v0 + 400);
  v87 = *(uint64_t **)(v0 + 392);
  v89 = *(_QWORD *)(v0 + 384);
  v91 = *(_QWORD *)(v0 + 376);
  v94 = *(_QWORD *)(v0 + 336);
  v96 = *(_QWORD *)(v0 + 344);
  v98 = *(_QWORD *)(v0 + 328);
  sub_1DAE0D170();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA40);
  v31 = (*(unsigned __int8 *)(v25 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v25 + 80);
  v32 = swift_allocObject();
  *(_OWORD *)(v32 + 16) = xmmword_1DAE1E030;
  v80 = *(void (**)(unint64_t, uint64_t, uint64_t))(v25 + 16);
  v80(v32 + v31, v23, v24);
  v33 = sub_1DADE0084(v32);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  MEMORY[0x1DF0A78B8](v33);
  swift_bridgeObjectRelease();
  sub_1DADE25F8(&qword_1F029DA48, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBFA20], MEMORY[0x1E0DBFA18]);
  sub_1DADE25F8(&qword_1F029DA50, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBFAB0], MEMORY[0x1E0DBFAA8]);
  sub_1DAE0D1DC();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v82 + 8))(v30, v83);
  v34 = *(void (**)(uint64_t, uint64_t))(v85 + 8);
  v34(v29, v100);
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA58);
  v35 = sub_1DAE0D128();
  v36 = *(_QWORD *)(v35 - 8);
  v37 = (*(unsigned __int8 *)(v36 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v36 + 80);
  v38 = swift_allocObject();
  *(_OWORD *)(v38 + 16) = xmmword_1DAE1E030;
  (*(void (**)(unint64_t, _QWORD, uint64_t))(v36 + 104))(v38 + v37, *MEMORY[0x1E0DBF7E0], v35);
  v39 = sub_1DADE02EC(v38);
  swift_setDeallocating();
  swift_arrayDestroy();
  swift_deallocClassInstance();
  *v87 = v39;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v89 + 104))(v87, *MEMORY[0x1E0DBF7B0], v91);
  sub_1DADE25F8(&qword_1F029DA60, (uint64_t (*)(uint64_t))MEMORY[0x1E0DBF7C0], MEMORY[0x1E0DBF7B8]);
  sub_1DAE0D1DC();
  swift_release();
  (*(void (**)(uint64_t *, uint64_t))(v89 + 8))(v87, v91);
  v34(v101, v100);
  sub_1DAE0C7F8();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v94 + 104))(v96, *MEMORY[0x1E0DBFCD0], v98);
  v40 = sub_1DAE0D1AC();
  v41 = *(_QWORD *)(v0 + 456);
  v42 = *(_QWORD *)(v0 + 424);
  v44 = *(_QWORD *)(v0 + 360);
  v43 = *(_QWORD *)(v0 + 368);
  v45 = *(_QWORD *)(v0 + 352);
  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 336) + 8))(*(_QWORD *)(v0 + 344), *(_QWORD *)(v0 + 328));
  (*(void (**)(uint64_t, uint64_t))(v44 + 8))(v43, v45);
  v34(v41, v42);
  if (*(_QWORD *)(v40 + 16) != 1)
  {
    swift_bridgeObjectRelease();
    v59 = *(_QWORD *)(v40 + 16);
    swift_bridgeObjectRelease();
    if (v59)
    {
      if (qword_1F029D6C0 != -1)
        swift_once();
      v60 = sub_1DAE0CA8C();
      __swift_project_value_buffer(v60, (uint64_t)qword_1F02A03A8);
      swift_bridgeObjectRetain();
      v61 = sub_1DAE0CA74();
      v62 = sub_1DAE0D6BC();
      v63 = os_log_type_enabled(v61, v62);
      v64 = *(_QWORD *)(v0 + 488);
      v66 = *(_QWORD *)(v0 + 464);
      v65 = *(_QWORD *)(v0 + 472);
      if (v63)
      {
        v104 = *(_QWORD *)(v0 + 464);
        v67 = (uint8_t *)swift_slowAlloc();
        v102 = v64;
        v68 = swift_slowAlloc();
        v106[0] = v68;
        *(_DWORD *)v67 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 144) = sub_1DADDC540(v79, v81, v106);
        sub_1DAE0D71C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1DAD39000, v61, v62, "Too many OpenIntents found for type: %s. Unable to pick one!", v67, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1DF0A8B9C](v68, -1, -1);
        MEMORY[0x1DF0A8B9C](v67, -1, -1);
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v102, v104);
      }
      else
      {
        swift_release();

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v65 + 8))(v64, v66);
      }
    }
    else
    {
      if (qword_1F029D6C0 != -1)
        swift_once();
      v70 = sub_1DAE0CA8C();
      __swift_project_value_buffer(v70, (uint64_t)qword_1F02A03A8);
      swift_bridgeObjectRetain();
      v71 = sub_1DAE0CA74();
      v72 = sub_1DAE0D6BC();
      v73 = os_log_type_enabled(v71, v72);
      v74 = *(_QWORD *)(v0 + 488);
      v76 = *(_QWORD *)(v0 + 464);
      v75 = *(_QWORD *)(v0 + 472);
      if (v73)
      {
        v105 = *(_QWORD *)(v0 + 488);
        v77 = (uint8_t *)swift_slowAlloc();
        v103 = v76;
        v78 = swift_slowAlloc();
        v106[0] = v78;
        *(_DWORD *)v77 = 136315138;
        swift_bridgeObjectRetain();
        *(_QWORD *)(v0 + 152) = sub_1DADDC540(v79, v81, v106);
        sub_1DAE0D71C();
        swift_bridgeObjectRelease_n();
        _os_log_impl(&dword_1DAD39000, v71, v72, "No usable OpenIntent found for type: %s", v77, 0xCu);
        swift_arrayDestroy();
        MEMORY[0x1DF0A8B9C](v78, -1, -1);
        MEMORY[0x1DF0A8B9C](v77, -1, -1);
        swift_release();

        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v105, v103);
      }
      else
      {
        swift_release();

        swift_bridgeObjectRelease_n();
        (*(void (**)(uint64_t, uint64_t))(v75 + 8))(v74, v76);
      }
    }
    goto LABEL_19;
  }
  v46 = *(_QWORD *)(v0 + 480);
  v84 = *(_QWORD *)(v0 + 464);
  v86 = *(_QWORD *)(v0 + 488);
  v47 = *(_QWORD *)(v0 + 312);
  v48 = *(_QWORD *)(v0 + 320);
  v49 = *(_QWORD *)(v0 + 296);
  v50 = *(_QWORD *)(v0 + 288);
  v92 = *(_QWORD *)(v0 + 272);
  v51 = *(_QWORD *)(v0 + 256);
  v88 = *(_QWORD *)(v0 + 280);
  v90 = *(_QWORD *)(v0 + 264);
  v93 = *(uint64_t **)(v0 + 248);
  v95 = *(_QWORD *)(v0 + 240);
  v97 = *(_QWORD *)(v0 + 232);
  v99 = *(_QWORD *)(v0 + 304);
  v52 = *(void (**)(uint64_t, unint64_t, uint64_t))(v49 + 16);
  v52(v47, v40 + ((*(unsigned __int8 *)(v49 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v49 + 80)), v50);
  swift_bridgeObjectRelease();
  (*(void (**)(unint64_t, uint64_t, uint64_t))(v49 + 32))(v48, v47, v50);
  v80(v46, v86, v84);
  v53 = sub_1DAE0D224();
  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v53 - 8) + 56))(v51, 1, 1, v53);
  sub_1DAE0D1F4();
  v54 = swift_allocBox();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v92 + 16))(v55, v88, v90);
  *v93 = v54;
  (*(void (**)(uint64_t *, _QWORD, uint64_t))(v95 + 104))(v93, *MEMORY[0x1E0DBFFB8], v97);
  v52(v99, v48, v50);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA68);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DAE1E030;
  *(_QWORD *)(inited + 32) = 0x746567726174;
  *(_QWORD *)(inited + 40) = 0xE600000000000000;
  v57 = MEMORY[0x1E0DC0020];
  *(_QWORD *)(inited + 72) = v97;
  *(_QWORD *)(inited + 80) = v57;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(inited + 48));
  (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v95 + 16))(boxed_opaque_existential_1, v93, v97);
  sub_1DADDEF10(inited);
  sub_1DAE0D140();
  v69 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 520) = v69;
  *v69 = v0;
  v69[1] = sub_1DADE17DC;
  return sub_1DAE0D1D0();
}

uint64_t sub_1DADE17DC(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v5;

  v3 = (_QWORD *)*v2;
  v3[66] = a1;
  v3[67] = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v5 = (_QWORD *)swift_task_alloc();
  v3[68] = v5;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA70);
  swift_getOpaqueTypeConformance2();
  *v5 = v3;
  v5[1] = sub_1DADE18B4;
  return sub_1DAE0D1A0();
}

uint64_t sub_1DADE18B4()
{
  uint64_t v0;
  uint64_t *v1;
  uint64_t v2;

  v2 = *v1;
  *(_QWORD *)(*v1 + 552) = v0;
  swift_task_dealloc();
  if (!v0)
  {
    sub_1DADE2558(*(_QWORD *)(v2 + 200));
    swift_bridgeObjectRelease();
  }
  return swift_task_switch();
}

uint64_t sub_1DADE192C()
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
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v15 = *(_QWORD *)(v0 + 464);
  v16 = *(_QWORD *)(v0 + 488);
  v13 = *(_QWORD *)(v0 + 320);
  v14 = *(_QWORD *)(v0 + 472);
  v11 = *(_QWORD *)(v0 + 296);
  v12 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 272);
  v10 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = *(_QWORD *)(v0 + 216);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v10, v2);
  (*(void (**)(uint64_t, uint64_t))(v11 + 8))(v13, v12);
  (*(void (**)(uint64_t, uint64_t))(v14 + 8))(v16, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(1);
}

uint64_t sub_1DADE1AE4()
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
  uint64_t v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  NSObject *v14;
  os_log_type_t v15;
  _BOOL4 v16;
  unint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = *(_QWORD *)(v0 + 464);
  v29 = *(_QWORD *)(v0 + 488);
  v26 = *(_QWORD *)(v0 + 320);
  v27 = *(_QWORD *)(v0 + 472);
  v1 = *(_QWORD *)(v0 + 280);
  v24 = *(_QWORD *)(v0 + 296);
  v25 = *(_QWORD *)(v0 + 288);
  v3 = *(_QWORD *)(v0 + 264);
  v2 = *(_QWORD *)(v0 + 272);
  v4 = *(_QWORD *)(v0 + 240);
  v5 = *(_QWORD *)(v0 + 248);
  v7 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 208);
  v8 = *(_QWORD *)(v0 + 216);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  v10 = *(void **)(v0 + 536);
  if (qword_1F029D6C0 != -1)
    swift_once();
  v11 = sub_1DAE0CA8C();
  __swift_project_value_buffer(v11, (uint64_t)qword_1F02A03A8);
  v12 = v10;
  swift_bridgeObjectRetain();
  v13 = v10;
  v14 = sub_1DAE0CA74();
  v15 = sub_1DAE0D6C8();
  v16 = os_log_type_enabled(v14, v15);
  v17 = *(_QWORD *)(v0 + 504);
  if (v16)
  {
    v18 = *(_QWORD *)(v0 + 496);
    v19 = swift_slowAlloc();
    v20 = swift_slowAlloc();
    v30 = v20;
    *(_DWORD *)v19 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 160) = sub_1DADDC540(v18, v17, &v30);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v19 + 12) = 2080;
    swift_getErrorValue();
    v21 = sub_1DAE0D8C0();
    *(_QWORD *)(v0 + 136) = sub_1DADDC540(v21, v22, &v30);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DAD39000, v14, v15, "Failed to perform OpenIntent for type: %s. Error: %s", (uint8_t *)v19, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0A8B9C](v20, -1, -1);
    MEMORY[0x1DF0A8B9C](v19, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1DADE1E90()
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
  void *v9;
  uint64_t v10;
  id v11;
  id v12;
  NSObject *v13;
  os_log_type_t v14;
  _BOOL4 v15;
  unint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = *(_QWORD *)(v0 + 464);
  v29 = *(_QWORD *)(v0 + 488);
  v26 = *(_QWORD *)(v0 + 320);
  v27 = *(_QWORD *)(v0 + 472);
  v24 = *(_QWORD *)(v0 + 296);
  v25 = *(_QWORD *)(v0 + 288);
  v1 = *(_QWORD *)(v0 + 272);
  v23 = *(_QWORD *)(v0 + 280);
  v2 = *(_QWORD *)(v0 + 264);
  v3 = *(_QWORD *)(v0 + 240);
  v4 = *(_QWORD *)(v0 + 248);
  v5 = *(_QWORD *)(v0 + 224);
  v6 = *(_QWORD *)(v0 + 232);
  v7 = *(_QWORD *)(v0 + 208);
  v8 = *(_QWORD *)(v0 + 216);
  swift_unknownObjectRelease();
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v5, v7);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v4, v6);
  (*(void (**)(uint64_t, uint64_t))(v1 + 8))(v23, v2);
  (*(void (**)(uint64_t, uint64_t))(v24 + 8))(v26, v25);
  (*(void (**)(uint64_t, uint64_t))(v27 + 8))(v29, v28);
  v9 = *(void **)(v0 + 552);
  if (qword_1F029D6C0 != -1)
    swift_once();
  v10 = sub_1DAE0CA8C();
  __swift_project_value_buffer(v10, (uint64_t)qword_1F02A03A8);
  v11 = v9;
  swift_bridgeObjectRetain();
  v12 = v9;
  v13 = sub_1DAE0CA74();
  v14 = sub_1DAE0D6C8();
  v15 = os_log_type_enabled(v13, v14);
  v16 = *(_QWORD *)(v0 + 504);
  if (v15)
  {
    v17 = *(_QWORD *)(v0 + 496);
    v18 = swift_slowAlloc();
    v19 = swift_slowAlloc();
    v30 = v19;
    *(_DWORD *)v18 = 136315394;
    swift_bridgeObjectRetain();
    *(_QWORD *)(v0 + 160) = sub_1DADDC540(v17, v16, &v30);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease_n();
    *(_WORD *)(v18 + 12) = 2080;
    swift_getErrorValue();
    v20 = sub_1DAE0D8C0();
    *(_QWORD *)(v0 + 136) = sub_1DADDC540(v20, v21, &v30);
    sub_1DAE0D71C();
    swift_bridgeObjectRelease();

    _os_log_impl(&dword_1DAD39000, v13, v14, "Failed to perform OpenIntent for type: %s. Error: %s", (uint8_t *)v18, 0x16u);
    swift_arrayDestroy();
    MEMORY[0x1DF0A8B9C](v19, -1, -1);
    MEMORY[0x1DF0A8B9C](v18, -1, -1);

  }
  else
  {

    swift_bridgeObjectRelease_n();
  }
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

unint64_t type metadata accessor for SearchUIToolKitUtilities()
{
  unint64_t result;

  result = qword_1F029DA08;
  if (!qword_1F029DA08)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029DA08);
  }
  return result;
}

uint64_t sub_1DADE228C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1DADE22C0()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DADE2638;
  return ((uint64_t (*)(void *, int, void *))((char *)&dword_1F029DA10 + dword_1F029DA10))(v2, v3, v4);
}

uint64_t sub_1DADE233C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  int *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (int *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DADE2638;
  return ((uint64_t (*)(uint64_t, uint64_t, int *))((char *)&dword_1F029E4E8 + dword_1F029E4E8))(v2, v3, v4);
}

uint64_t objectdestroy_4Tm()
{
  swift_unknownObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DADE23E4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DADDA484;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F029E4F0 + dword_1F029E4F0))(a1, v4, v5, v6);
}

uint64_t sub_1DADE2468()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DADE2494()
{
  return sub_1DAE0D164();
}

uint64_t sub_1DADE24B4(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADDEE94(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0DBFAB0], MEMORY[0x1E0DBF9F8]);
}

uint64_t sub_1DADE24D8()
{
  return sub_1DAE0D158();
}

uint64_t sub_1DADE24F8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADDEE94(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0DBF7C0], MEMORY[0x1E0DBF9D8]);
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

uint64_t sub_1DADE2558(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA30);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADE2598(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DA80);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADE25E0(__int128 *a1, uint64_t a2)
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

uint64_t sub_1DADE25F8(unint64_t *a1, uint64_t (*a2)(uint64_t), uint64_t a3)
{
  uint64_t result;
  uint64_t v6;

  result = *a1;
  if (!result)
  {
    v6 = a2(255);
    result = MEMORY[0x1DF0A8B00](a3, v6);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADE2670(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_1F029DAC0 + dword_1F029DAC0);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DADDA484;
  return v5(a1);
}

uint64_t sub_1DADE27FC(void *a1, void *aBlock)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;
  uint64_t (*v7)(id);

  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  v7 = (uint64_t (*)(id))((char *)&dword_1F029DAC0 + dword_1F029DAC0);
  v4 = a1;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1DADE287C;
  return v7(v4);
}

uint64_t sub_1DADE287C()
{
  void *v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  v2 = *(void **)(*v1 + 16);
  v3 = *v1;
  swift_task_dealloc();

  v4 = *(_QWORD *)(v3 + 24);
  if (v0)
  {
    v5 = (void *)sub_1DAE0C72C();

    (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v4 + 16))(*(_QWORD *)(v3 + 24), 0);
  }
  _Block_release(*(const void **)(v3 + 24));
  return (*(uint64_t (**)(void))(v3 + 8))();
}

uint64_t sub_1DADE291C()
{
  return swift_task_switch();
}

uint64_t sub_1DADE2930()
{
  uint64_t v0;

  if (qword_1F02A0370)
  {
    sub_1DAE0C564();
    sub_1DAE0C99C();
    qword_1F02A0370 = 0;
    swift_release();
    swift_release();
  }
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADE2AD0(const void *a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  return swift_task_switch();
}

uint64_t sub_1DADE2B0C()
{
  uint64_t v0;

  if (qword_1F02A0370)
  {
    sub_1DAE0C564();
    sub_1DAE0C99C();
    qword_1F02A0370 = 0;
    swift_release();
    swift_release();
  }
  (*(void (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
  _Block_release(*(const void **)(v0 + 16));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id SearchUITTSUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUITTSUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITTSUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUITTSUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITTSUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

unint64_t sub_1DADE2C90(unint64_t a1, unint64_t a2)
{
  uint64_t v2;
  unsigned int v5;

  if ((a2 & 0x2000000000000000) != 0)
    v2 = HIBYTE(a2) & 0xF;
  else
    v2 = a1 & 0xFFFFFFFFFFFFLL;
  if (v2)
  {
    sub_1DADE2D6C(0xFuLL, a1, a2);
    if ((a2 & 0x1000000000000000) != 0)
    {
      v5 = sub_1DAE0D77C();
    }
    else
    {
      if ((a2 & 0x2000000000000000) == 0 && (a1 & 0x1000000000000000) == 0)
        sub_1DAE0D7D0();
      v5 = sub_1DAE0D7DC();
    }
  }
  else
  {
    v5 = 0;
  }
  return v5 | ((unint64_t)(v2 == 0) << 32);
}

unint64_t sub_1DADE2D6C(unint64_t result, unint64_t a2, unint64_t a3)
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
    result = sub_1DADE2E08(result, a2, a3);
    if ((result & 1) == 0)
      return result & 0xC | sub_1DADE2E74(result, a2, a3) & 0xFFFFFFFFFFFFFFF3 | 1;
  }
  return result;
}

unint64_t sub_1DADE2E08(unint64_t result, unint64_t a2, unint64_t a3)
{
  uint64_t v5;
  unint64_t v6;

  v5 = (a2 >> 59) & 1;
  if ((a3 & 0x1000000000000000) == 0)
    LOBYTE(v5) = 1;
  if ((result & 0xC) == 4 << v5)
    result = sub_1DADDCA34(result, a2, a3);
  v6 = HIBYTE(a3) & 0xF;
  if ((a3 & 0x2000000000000000) == 0)
    v6 = a2 & 0xFFFFFFFFFFFFLL;
  if (v6 <= result >> 16)
    __break(1u);
  return result;
}

unint64_t sub_1DADE2E74(unint64_t result, uint64_t a2, unint64_t a3)
{
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  unint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
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
            v7 = v5 - 1;
            v11 = *((_BYTE *)&v12 + v5-- + 7) & 0xC0;
          }
          while (v11 == 128);
          return v7 << 16;
        }
        goto LABEL_14;
      }
      if ((a2 & 0x1000000000000000) != 0)
      {
        v6 = (a3 & 0xFFFFFFFFFFFFFFFLL) + 32;
        if (v5 == (a2 & 0xFFFFFFFFFFFFLL))
          goto LABEL_14;
      }
      else
      {
        v12 = result >> 16;
        v6 = sub_1DAE0D7D0();
        v5 = v12;
        if (v12 == v10)
          goto LABEL_14;
      }
      if ((*(_BYTE *)(v6 + v5) & 0xC0) == 0x80)
      {
        do
        {
          v7 = v5 - 1;
          v8 = *(_BYTE *)(v6 - 1 + v5--) & 0xC0;
        }
        while (v8 == 128);
        return v7 << 16;
      }
LABEL_14:
      v7 = v5;
      return v7 << 16;
    }
    v9 = HIBYTE(a3) & 0xF;
    if ((a3 & 0x2000000000000000) == 0)
      v9 = a2 & 0xFFFFFFFFFFFFLL;
    if (v5 != v9)
      return sub_1DAE0D770();
  }
  return result;
}

_QWORD *sub_1DADE2F84(_QWORD *result, uint64_t *a2, uint64_t a3, uint64_t a4, unint64_t a5)
{
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  uint64_t v14;

  v5 = result;
  v6 = HIBYTE(a5) & 0xF;
  v12 = a4;
  v13 = a5;
  if ((a5 & 0x2000000000000000) == 0)
    v6 = a4 & 0xFFFFFFFFFFFFLL;
  v14 = v6;
  if (!a2)
  {
    v7 = 0;
LABEL_14:
    *v5 = a4;
    v5[1] = a5;
    v5[2] = 0;
    v5[3] = v6;
    return (_QWORD *)v7;
  }
  v7 = a3;
  if (!a3)
    goto LABEL_14;
  if ((a3 & 0x8000000000000000) == 0)
  {
    v8 = a2;
    v9 = 0;
    while (1)
    {
      v10 = sub_1DAE0D578();
      if (!v11)
        break;
      ++v9;
      *v8 = v10;
      v8[1] = v11;
      v8 += 2;
      if (v7 == v9)
      {
        a4 = v12;
        a5 = v13;
        goto LABEL_13;
      }
    }
    a4 = v12;
    a5 = v13;
    v7 = v9;
LABEL_13:
    v6 = v14;
    goto LABEL_14;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1DADE303C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v4;
  int64_t v5;
  uint64_t v6;

  if (a2 <= a1)
    v2 = a1;
  else
    v2 = a2;
  if (!v2)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB38);
  v4 = (_QWORD *)swift_allocObject();
  v5 = _swift_stdlib_malloc_size(v4);
  v6 = v5 - 32;
  if (v5 < 32)
    v6 = v5 - 17;
  v4[2] = a1;
  v4[3] = 2 * (v6 >> 4);
  return v4;
}

uint64_t sub_1DADE30B0(void *a1)
{
  uint64_t result;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  uint64_t v15;
  unint64_t v16;
  int v17;
  unint64_t v18;
  unint64_t *v19;
  unint64_t v20;
  unint64_t v21;
  BOOL v22;
  int v23;
  int v24;
  int v25;
  int v26;
  BOOL v27;
  id v28;
  void *v29;
  unsigned int v30;
  id v31;
  void *v32;
  unsigned int v33;
  id v34;
  void *v35;
  unsigned int v36;
  id v37;
  void *v38;
  unsigned int v39;
  id v40;
  void *v41;
  unsigned int v42;
  id v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  unsigned int v48;
  uint64_t v49;
  int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  unsigned int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;

  result = (uint64_t)objc_msgSend(a1, sel_audioBuffer);
  if (!result)
    return result;
  v3 = (void *)result;
  sub_1DAE0C7A4();

  objc_msgSend(a1, sel_sampleRate);
  v5 = v4;
  v6 = objc_msgSend(a1, sel_formatID);
  if (!v6)
    goto LABEL_32;
  v7 = v6;
  v8 = sub_1DAE0D53C();
  v10 = v9;

  v11 = sub_1DAE0D560();
  if (!v11)
  {
    result = swift_bridgeObjectRelease();
    v13 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v15 = *(_QWORD *)(MEMORY[0x1E0DEE9D8] + 16);
    if (v15)
      goto LABEL_6;
LABEL_35:
    v17 = 0;
LABEL_36:
    swift_release();
    goto LABEL_37;
  }
  v12 = v11;
  v13 = sub_1DADE303C(v11, 0);
  swift_bridgeObjectRetain();
  v14 = sub_1DADE2F84(&v49, v13 + 4, v12, v8, v10);
  result = swift_bridgeObjectRelease();
  if (v14 != (_QWORD *)v12)
    goto LABEL_63;
  result = swift_bridgeObjectRelease();
  v15 = v13[2];
  if (!v15)
    goto LABEL_35;
LABEL_6:
  if ((unint64_t)(v15 - 1) >> 61)
  {
    __break(1u);
LABEL_32:
    v17 = 0;
LABEL_37:
    v28 = objc_msgSend(a1, sel_formatFlags);
    if (v28)
    {
      v29 = v28;
      v30 = objc_msgSend(v28, sel_unsignedIntValue);

    }
    else
    {
      v30 = 0;
    }
    v31 = objc_msgSend(a1, sel_bytesPerPacket);
    if (v31)
    {
      v32 = v31;
      v33 = objc_msgSend(v31, sel_unsignedIntValue);

    }
    else
    {
      v33 = 0;
    }
    v34 = objc_msgSend(a1, sel_framesPerPacket);
    if (v34)
    {
      v35 = v34;
      v36 = objc_msgSend(v34, sel_unsignedIntValue);

    }
    else
    {
      v36 = 0;
    }
    v37 = objc_msgSend(a1, sel_bytesPerFrame);
    if (v37)
    {
      v38 = v37;
      v39 = objc_msgSend(v37, sel_unsignedIntValue);

    }
    else
    {
      v39 = 0;
    }
    v40 = objc_msgSend(a1, sel_channelsPerFrame);
    if (v40)
    {
      v41 = v40;
      v42 = objc_msgSend(v40, sel_unsignedIntValue);

    }
    else
    {
      v42 = 0;
    }
    v43 = objc_msgSend(a1, sel_bitsPerChannel);
    if (v43)
    {
      v44 = v43;
      v45 = objc_msgSend(v43, sel_unsignedIntValue);

    }
    else
    {
      v45 = 0;
    }
    v46 = objc_msgSend(a1, sel_reserved);
    if (v46)
    {
      v47 = v46;
      v48 = objc_msgSend(v46, sel_unsignedIntValue);

    }
    else
    {
      v48 = 0;
    }
    sub_1DAE0C9E4();
    v49 = v5;
    v50 = v17;
    v51 = v30;
    v52 = v33;
    v53 = v36;
    v54 = v39;
    v55 = v42;
    v56 = v45;
    v57 = v48;
    return sub_1DAE0C9CC();
  }
  v16 = 0;
  v17 = 0;
  v18 = 8 * v15 - 8;
  v19 = v13 + 5;
  while (v16 < v13[2])
  {
    v21 = *(v19 - 1);
    v20 = *v19;
    v22 = v21 == 2573 && v20 == 0xE200000000000000;
    if (v22 || (result = sub_1DAE0D8A8(), (result & 1) != 0))
    {
      if (v18 > 0x20)
        goto LABEL_22;
      v24 = 10;
    }
    else
    {
      swift_bridgeObjectRetain();
      if ((sub_1DAE0D4C4() & 1) == 0)
        goto LABEL_24;
      result = sub_1DADE2C90(v21, v20);
      if ((result & 0x100000000) != 0)
        goto LABEL_64;
      if ((result & 0xFFFFFF80) != 0)
      {
LABEL_24:
        result = swift_bridgeObjectRelease();
        v24 = 0;
        v25 = 0;
        if (v18 > 0x20)
          goto LABEL_28;
      }
      else
      {
        result = sub_1DADE2C90(v21, v20);
        if ((result & 0x100000000) != 0)
          goto LABEL_65;
        v23 = result;
        result = swift_bridgeObjectRelease();
        if ((v23 & 0xFFFFFF00) != 0)
          goto LABEL_62;
        if (v18 > 0x20)
        {
LABEL_22:
          v25 = 0;
          goto LABEL_28;
        }
        v24 = v23;
      }
    }
    v26 = v24 << (v18 & 0x18);
    if (v18 >= 0x20)
      v25 = 0;
    else
      v25 = v26;
LABEL_28:
    v27 = __CFADD__(v17, v25);
    v17 += v25;
    if (v27)
      goto LABEL_61;
    if (v15 == ++v16)
      goto LABEL_36;
    v18 -= 8;
    v19 += 2;
  }
  __break(1u);
LABEL_61:
  __break(1u);
LABEL_62:
  __break(1u);
LABEL_63:
  __break(1u);
LABEL_64:
  __break(1u);
LABEL_65:
  __break(1u);
  return result;
}

uint64_t sub_1DADE351C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 64) = a1;
  return swift_task_switch();
}

uint64_t sub_1DADE3580()
{
  uint64_t v0;
  id v1;
  void **v2;
  unsigned int v3;
  void *v4;
  id v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t (*v11)(void);
  unsigned int v13;
  void *v14;
  id v15;
  id v16;

  v1 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  *(_QWORD *)(v0 + 56) = 0;
  v2 = (void **)(v0 + 56);
  v3 = objc_msgSend(v1, sel_setCategory_mode_options_error_, *MEMORY[0x1E0C89690], *MEMORY[0x1E0C89748], 19, v0 + 56);
  v4 = *(void **)(v0 + 56);
  if (!v3)
  {
    v9 = v4;
    sub_1DAE0C738();

LABEL_6:
    swift_willThrow();
    goto LABEL_7;
  }
  *v2 = 0;
  v5 = v4;
  v6 = objc_msgSend(v1, sel_setActive_error_, 1, v0 + 56);
  v7 = *v2;
  if (!v6)
  {
    v10 = v7;
    sub_1DAE0C738();

    goto LABEL_6;
  }
  v8 = v7;
  objc_msgSend(v1, sel_opaqueSessionID);
  sub_1DAE0C9D8();
  sub_1DAE0C9C0();
  swift_allocObject();
  qword_1F02A0370 = sub_1DAE0C990();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C9A8();
  sub_1DAE0C9B4();
  sub_1DAE0C99C();
  *v2 = 0;
  v13 = objc_msgSend(v1, sel_setActive_error_, 0, v0 + 56);
  v14 = *v2;
  if (v13)
  {
    qword_1F02A0370 = 0;
    v15 = v14;
    swift_release();
    swift_release();

    v11 = *(uint64_t (**)(void))(v0 + 8);
    return v11();
  }
  v16 = v14;
  sub_1DAE0C738();

  swift_willThrow();
  swift_release();
LABEL_7:

  v11 = *(uint64_t (**)(void))(v0 + 8);
  return v11();
}

uint64_t type metadata accessor for SearchUITTSUtilities()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchUITTSUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SearchUITTSUtilities.ttsAudioData(sfAudioData:)()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 80))();
}

uint64_t dispatch thunk of static SearchUITTSUtilities.play(audioData:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 88) + *(_QWORD *)(v1 + 88));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DADDA484;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUITTSUtilities.stop()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(v0 + 96) + *(_QWORD *)(v0 + 96));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1DADE2638;
  return v4();
}

uint64_t sub_1DADE38E0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DADE3904()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DADE2638;
  return ((uint64_t (*)(const void *))((char *)&dword_1F029DB08 + dword_1F029DB08))(v2);
}

uint64_t sub_1DADE3970()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DADE399C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DADDA484;
  return ((uint64_t (*)(void *, void *))((char *)&dword_1F029DB18 + dword_1F029DB18))(v2, v3);
}

uint64_t sub_1DADE3A10(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  int *v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = (int *)v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DADE2638;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, int *))((char *)&dword_1F029E4F0 + dword_1F029E4F0))(a1, v4, v5, v6);
}

uint64_t sub_1DADE3A94(uint64_t a1)
{
  return sub_1DADE3AF4(a1, qword_1F02A0378);
}

uint64_t sub_1DADE3AB4(uint64_t a1)
{
  return sub_1DADE3AF4(a1, qword_1F02A0390);
}

uint64_t sub_1DADE3AD4(uint64_t a1)
{
  return sub_1DADE3AF4(a1, qword_1F02A03A8);
}

uint64_t sub_1DADE3AF4(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;

  v3 = sub_1DAE0CA8C();
  __swift_allocate_value_buffer(v3, a2);
  __swift_project_value_buffer(v3, (uint64_t)a2);
  return sub_1DAE0CA80();
}

void sub_1DADE3B68(_QWORD *a1@<X8>)
{
  int *v2;
  char *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t *v11;
  void *v12;
  id v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  uint64_t *v17;

  v2 = (int *)type metadata accessor for SearchUIUserReportModel();
  *a1 = 0;
  a1[1] = 0;
  v3 = (char *)a1 + v2[6];
  v4 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 56))(v3, 1, 1, v4);
  v5 = (void *)objc_opt_self();
  v6 = (void *)sub_1DAE0D530();
  v7 = objc_msgSend(v5, sel_localizedStringForKey_, v6);

  if (v7)
  {
    v8 = sub_1DAE0D53C();
    v10 = v9;

  }
  else
  {
    v8 = 0;
    v10 = 0xE000000000000000;
  }
  v11 = (_QWORD *)((char *)a1 + v2[7]);
  *v11 = v8;
  v11[1] = v10;
  v12 = (void *)sub_1DAE0D530();
  v13 = objc_msgSend(v5, sel_localizedStringForKey_, v12);

  if (v13)
  {
    v14 = sub_1DAE0D53C();
    v16 = v15;

  }
  else
  {
    v14 = 0;
    v16 = 0xE000000000000000;
  }
  v17 = (_QWORD *)((char *)a1 + v2[8]);
  *v17 = v14;
  v17[1] = v16;
}

uint64_t type metadata accessor for SearchUIUserReportModel()
{
  uint64_t result;

  result = qword_1F029DBA0;
  if (!qword_1F029DBA0)
    return swift_getSingletonMetadata();
  return result;
}

char *sub_1DADE3CF8(char *a1, char **a2, int *a3)
{
  int v4;
  char *v5;
  char *v8;
  uint64_t v9;
  char *v10;
  char *v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  char *v19;
  char *v20;
  uint64_t v21;
  void (*v22)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v23;
  uint64_t v24;
  char *v25;
  _QWORD *v26;
  uint64_t v27;
  char *v28;
  _QWORD *v29;
  uint64_t v30;

  v4 = *(_DWORD *)(*((_QWORD *)a3 - 1) + 80);
  v5 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v4 & 0x20000) != 0)
  {
    a1 = &v5[(v4 + 16) & ~(unint64_t)v4];
    sub_1DAE0C564();
  }
  else
  {
    v8 = a2[1];
    *((_QWORD *)a1 + 1) = v8;
    v9 = a3[6];
    v10 = &a1[v9];
    v11 = (char *)a2 + v9;
    v12 = v5;
    v13 = v8;
    v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
    v15 = *(_QWORD *)(v14 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v11, 1, v14))
    {
      v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
      memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
    }
    else
    {
      v17 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v10, v11, v17);
      v18 = *(int *)(v14 + 28);
      v19 = &v10[v18];
      v20 = &v11[v18];
      v21 = *((_QWORD *)v20 + 1);
      *(_QWORD *)v19 = *(_QWORD *)v20;
      *((_QWORD *)v19 + 1) = v21;
      v22 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56);
      swift_bridgeObjectRetain();
      v22(v10, 0, 1, v14);
    }
    v23 = a3[7];
    v24 = a3[8];
    v25 = &a1[v23];
    v26 = (char **)((char *)a2 + v23);
    v27 = v26[1];
    *(_QWORD *)v25 = *v26;
    *((_QWORD *)v25 + 1) = v27;
    v28 = &a1[v24];
    v29 = (char **)((char *)a2 + v24);
    v30 = v29[1];
    *(_QWORD *)v28 = *v29;
    *((_QWORD *)v28 + 1) = v30;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1DADE3E50(id *a1, uint64_t a2)
{
  char *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (char *)a1 + *(int *)(a2 + 24);
  v5 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 48))(v4, 1, v5))
  {
    v6 = sub_1DAE0C7EC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v6 - 8) + 8))(v4, v6);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1DADE3F04(_QWORD *a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char *v19;
  uint64_t v20;
  void (*v21)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  _QWORD *v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;

  v6 = *(void **)a2;
  v7 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v7;
  v8 = a3[6];
  v9 = (char *)a1 + v8;
  v10 = (char *)(a2 + v8);
  v11 = v6;
  v12 = v7;
  v13 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v14 = *(_QWORD *)(v13 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v14 + 48))(v10, 1, v13))
  {
    v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v15 - 8) + 64));
  }
  else
  {
    v16 = sub_1DAE0C7EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v9, v10, v16);
    v17 = *(int *)(v13 + 28);
    v18 = &v9[v17];
    v19 = &v10[v17];
    v20 = *((_QWORD *)v19 + 1);
    *(_QWORD *)v18 = *(_QWORD *)v19;
    *((_QWORD *)v18 + 1) = v20;
    v21 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v14 + 56);
    swift_bridgeObjectRetain();
    v21(v9, 0, 1, v13);
  }
  v22 = a3[7];
  v23 = a3[8];
  v24 = (_QWORD *)((char *)a1 + v22);
  v25 = (_QWORD *)(a2 + v22);
  v26 = v25[1];
  *v24 = *v25;
  v24[1] = v26;
  v27 = (_QWORD *)((char *)a1 + v23);
  v28 = (_QWORD *)(a2 + v23);
  v29 = v28[1];
  *v27 = *v28;
  v27[1] = v29;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t sub_1DADE4030(uint64_t a1, uint64_t a2, int *a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  char *v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(char *, uint64_t, uint64_t);
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char *v22;
  char *v23;
  void (*v24)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v25;
  uint64_t v26;
  _QWORD *v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  char *v36;

  v6 = *(void **)a1;
  v7 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v7;

  v9 = *(void **)(a1 + 8);
  v10 = *(void **)(a2 + 8);
  *(_QWORD *)(a1 + 8) = v10;
  v11 = v10;

  v12 = a3[6];
  v13 = (char *)(a1 + v12);
  v14 = (char *)(a2 + v12);
  v15 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v16 = *(_QWORD *)(v15 - 8);
  v17 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v16 + 48);
  v18 = v17(v13, 1, v15);
  v19 = v17(v14, 1, v15);
  if (!v18)
  {
    if (!v19)
    {
      v33 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v33 - 8) + 24))(v13, v14, v33);
      v34 = *(int *)(v15 + 28);
      v35 = &v13[v34];
      v36 = &v14[v34];
      *(_QWORD *)v35 = *(_QWORD *)v36;
      *((_QWORD *)v35 + 1) = *((_QWORD *)v36 + 1);
      swift_bridgeObjectRetain();
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_1DADE4220((uint64_t)v13);
    goto LABEL_6;
  }
  if (v19)
  {
LABEL_6:
    v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v13, v14, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    goto LABEL_7;
  }
  v20 = sub_1DAE0C7EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v13, v14, v20);
  v21 = *(int *)(v15 + 28);
  v22 = &v13[v21];
  v23 = &v14[v21];
  *(_QWORD *)v22 = *(_QWORD *)v23;
  *((_QWORD *)v22 + 1) = *((_QWORD *)v23 + 1);
  v24 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56);
  swift_bridgeObjectRetain();
  v24(v13, 0, 1, v15);
LABEL_7:
  v26 = a3[7];
  v27 = (_QWORD *)(a1 + v26);
  v28 = (_QWORD *)(a2 + v26);
  *v27 = *v28;
  v27[1] = v28[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v29 = a3[8];
  v30 = (_QWORD *)(a1 + v29);
  v31 = (_QWORD *)(a2 + v29);
  *v30 = *v31;
  v30[1] = v31[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DADE4220(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

_OWORD *sub_1DADE4260(_OWORD *a1, _OWORD *a2, int *a3)
{
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *a1 = *a2;
  v6 = a3[6];
  v7 = (char *)a1 + v6;
  v8 = (char *)a2 + v6;
  v9 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v10 = *(_QWORD *)(v9 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v10 + 48))(v8, 1, v9))
  {
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v7, v8, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  else
  {
    v12 = sub_1DAE0C7EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v7, v8, v12);
    *(_OWORD *)&v7[*(int *)(v9 + 28)] = *(_OWORD *)&v8[*(int *)(v9 + 28)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v7, 0, 1, v9);
  }
  v13 = a3[8];
  *(_OWORD *)((char *)a1 + a3[7]) = *(_OWORD *)((char *)a2 + a3[7]);
  *(_OWORD *)((char *)a1 + v13) = *(_OWORD *)((char *)a2 + v13);
  return a1;
}

uint64_t sub_1DADE435C(uint64_t a1, _QWORD *a2, int *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t (*v13)(char *, uint64_t, uint64_t);
  int v14;
  int v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  char *v31;
  char *v32;
  uint64_t v33;
  uint64_t v34;

  v6 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v7 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = a2[1];

  v8 = a3[6];
  v9 = (char *)(a1 + v8);
  v10 = (char *)a2 + v8;
  v11 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v12 = *(_QWORD *)(v11 - 8);
  v13 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v12 + 48);
  v14 = v13(v9, 1, v11);
  v15 = v13(v10, 1, v11);
  if (!v14)
  {
    if (!v15)
    {
      v29 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v29 - 8) + 40))(v9, v10, v29);
      v30 = *(int *)(v11 + 28);
      v31 = &v9[v30];
      v32 = &v10[v30];
      v34 = *(_QWORD *)v32;
      v33 = *((_QWORD *)v32 + 1);
      *(_QWORD *)v31 = v34;
      *((_QWORD *)v31 + 1) = v33;
      swift_bridgeObjectRelease();
      goto LABEL_7;
    }
    sub_1DADE4220((uint64_t)v9);
    goto LABEL_6;
  }
  if (v15)
  {
LABEL_6:
    v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v17 - 8) + 64));
    goto LABEL_7;
  }
  v16 = sub_1DAE0C7EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v16 - 8) + 32))(v9, v10, v16);
  *(_OWORD *)&v9[*(int *)(v11 + 28)] = *(_OWORD *)&v10[*(int *)(v11 + 28)];
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v12 + 56))(v9, 0, 1, v11);
LABEL_7:
  v18 = a3[7];
  v19 = (_QWORD *)(a1 + v18);
  v20 = (_QWORD *)((char *)a2 + v18);
  v22 = *v20;
  v21 = v20[1];
  *v19 = v22;
  v19[1] = v21;
  swift_bridgeObjectRelease();
  v23 = a3[8];
  v24 = (_QWORD *)(a1 + v23);
  v25 = (_QWORD *)((char *)a2 + v23);
  v27 = *v25;
  v26 = v25[1];
  *v24 = v27;
  v24[1] = v26;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DADE4500()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADE450C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  unint64_t v9;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1 + *(int *)(a3 + 24), a2, v6);
  v9 = *(_QWORD *)(a1 + *(int *)(a3 + 28) + 8);
  if (v9 >= 0xFFFFFFFF)
    LODWORD(v9) = -1;
  return (v9 + 1);
}

uint64_t sub_1DADE4594()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADE45A0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v9;

  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
  v9 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56))(a1 + *(int *)(a4 + 24), a2, a2, result);
  *(_QWORD *)(a1 + *(int *)(a4 + 28) + 8) = (a2 - 1);
  return result;
}

void sub_1DADE4624()
{
  unint64_t v0;

  sub_1DADE46A4();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1DADE46A4()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F029DBB0)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1F029DCB0);
    v0 = sub_1DAE0D710();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F029DBB0);
  }
}

BOOL sub_1DADE46FC(void *a1)
{
  void *v1;
  void *v2;
  uint64_t v4;
  unint64_t v5;
  _BOOL8 v6;
  id v7;
  id v8;
  id v9;

  v2 = v1;
  sub_1DAE0C564();
  v4 = sub_1DAE0D374();
  swift_release();
  v5 = *(_QWORD *)(v4 + 16);
  swift_bridgeObjectRelease();
  v6 = v5 >= 2 && !objc_msgSend(a1, sel_sectionType) || objc_msgSend(a1, sel_sectionType) == (id)3;
  v7 = objc_msgSend(v2, sel_image);

  if (!v7)
    return 0;
  v8 = objc_msgSend(v2, sel_text_1);

  if (v8)
    return 0;
  v9 = objc_msgSend(v2, sel_text_2);

  if (v9)
    return 0;
  return v6;
}

id sub_1DADE4808@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  id result;
  id v5;
  uint64_t v6;
  double v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  result = (id)sub_1DADE46FC(a1);
  if ((result & 1) != 0)
  {
    v5 = objc_msgSend(a1, sel_sectionType);
    result = objc_msgSend((id)objc_opt_self(), sel_isSiri);
    if ((_DWORD)result)
    {
      v6 = 0x4028000000000000;
      v7 = 28.0 - 12.0;
      if (v5 != (id)3)
      {
        v8 = 0;
        v9 = 0;
LABEL_10:
        v11 = 0x4028000000000000;
        goto LABEL_11;
      }
    }
    else
    {
      if (v5 != (id)3)
      {
        v8 = 0;
        v9 = 0;
        v7 = 24.0;
        v6 = 0x4028000000000000;
        goto LABEL_10;
      }
      v7 = 14.0;
    }
    v8 = *MEMORY[0x1E0DC3298];
    v6 = *(_QWORD *)(MEMORY[0x1E0DC3298] + 8);
    v9 = *(_QWORD *)(MEMORY[0x1E0DC3298] + 16);
    v11 = *(_QWORD *)(MEMORY[0x1E0DC3298] + 24);
LABEL_11:
    v10 = 1;
    goto LABEL_12;
  }
  v8 = 0;
  v9 = 0;
  v6 = 0;
  v10 = 2;
  v11 = 0;
  v7 = 0.0;
LABEL_12:
  *(_QWORD *)a2 = v10;
  *(_QWORD *)(a2 + 8) = v8;
  *(_QWORD *)(a2 + 16) = v6;
  *(_QWORD *)(a2 + 24) = v9;
  *(_QWORD *)(a2 + 32) = v11;
  *(double *)(a2 + 40) = v7;
  return result;
}

BOOL sub_1DADE491C(void *a1)
{
  return sub_1DADE46FC(a1);
}

uint64_t sub_1DADE4940@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  _BYTE v4[48];

  sub_1DADE4808(a1, (uint64_t)v4);
  return sub_1DADE55F0((uint64_t)v4, a2);
}

id sub_1DADE49E0()
{
  void *v0;
  id result;
  void *v2;
  uint64_t ObjectType;
  id v4;
  void *v5;
  uint64_t v6;
  objc_super v7;

  result = objc_msgSend(v0, sel_cardSection);
  if (result)
  {
    v2 = result;
    ObjectType = swift_getObjectType();

    __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4698);
    sub_1DAE0D548();
    v7.receiver = v0;
    v7.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
    v4 = objc_msgSendSuper2(&v7, sel_reuseIdentifier, ObjectType);
    if (v4)
    {
      v5 = v4;
      v6 = sub_1DAE0D53C();

    }
    else
    {
      v6 = 0x3E6C696E3CLL;
    }
    sub_1DAE0D56C();
    sub_1DAE0D56C();
    swift_bridgeObjectRelease();
    return (id)v6;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DADE4BE8()
{
  void *v0;
  id result;
  void *v2;
  unsigned int v3;
  id v4;
  uint64_t v5;
  objc_super v6;

  result = objc_msgSend(v0, sel_cardSection);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(result, sel_separatorStyle);

    if (v3)
    {
      v6.receiver = v0;
      v6.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
      return objc_msgSendSuper2(&v6, sel_separatorStyle);
    }
    else
    {
      sub_1DAE0D368();
      v4 = objc_msgSend(v0, sel_cardSection);
      v5 = sub_1DAE0D344();

      return (id)v5;
    }
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DADE4CD4()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  unsigned __int8 v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;

  if (!objc_msgSend(v0, sel_cardSection)
    || (sub_1DADE5574(), __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC08),
                         (swift_dynamicCast() & 1) == 0))
  {
    v7 = 0;
    v5 = 0u;
    v6 = 0u;
    goto LABEL_6;
  }
  v1 = *((_QWORD *)&v6 + 1);
  if (!*((_QWORD *)&v6 + 1))
  {
LABEL_6:
    sub_1DADE55B0((uint64_t)&v5);
    v3 = objc_msgSend((id)objc_opt_self(), sel_fillsBackgroundWithContentForRowModel_, v0);
    return v3 & 1;
  }
  v2 = v7;
  __swift_project_boxed_opaque_existential_1(&v5, *((uint64_t *)&v6 + 1));
  v3 = (*(uint64_t (**)(void *, uint64_t, uint64_t))(v2 + 8))(v0, v1, v2);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v5);
  return v3 & 1;
}

uint64_t sub_1DADE4DE4(void *a1, uint64_t a2, uint64_t (*a3)(void))
{
  id v5;
  id v6;

  sub_1DAE0D368();
  v5 = a1;
  v6 = objc_msgSend(v5, sel_cardSection);
  LOBYTE(a3) = a3();

  return a3 & 1;
}

uint64_t sub_1DADE4E70(uint64_t a1, uint64_t a2, void *a3, uint64_t (*a4)(void *))
{
  id v6;

  sub_1DAE0D368();
  v6 = a3;
  LOBYTE(a4) = a4(a3);

  return a4 & 1;
}

uint64_t sub_1DADE4EC4@<X0>(__int128 *a1@<X8>)
{
  void *v1;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint64_t v15;
  _OWORD v16[3];

  v3 = objc_msgSend(v1, sel_cardSection);
  if (!v3
    || (*(_QWORD *)&v16[0] = v3,
        sub_1DADE5574(),
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC08),
        (swift_dynamicCast() & 1) == 0))
  {
    v15 = 0;
    v13 = 0u;
    v14 = 0u;
    goto LABEL_6;
  }
  v4 = *((_QWORD *)&v14 + 1);
  if (!*((_QWORD *)&v14 + 1))
  {
LABEL_6:
    result = sub_1DADE55B0((uint64_t)&v13);
    v9 = xmmword_1DAE1E140;
    v7 = 0uLL;
    v8 = 0uLL;
    goto LABEL_7;
  }
  v5 = v15;
  __swift_project_boxed_opaque_existential_1(&v13, *((uint64_t *)&v14 + 1));
  (*(void (**)(_OWORD *__return_ptr, void *, uint64_t, uint64_t))(v5 + 16))(v16, v1, v4, v5);
  v11 = v16[1];
  v12 = v16[0];
  v10 = v16[2];
  result = __swift_destroy_boxed_opaque_existential_0((uint64_t)&v13);
  v8 = v10;
  v7 = v11;
  v9 = v12;
LABEL_7:
  *a1 = v9;
  a1[1] = v7;
  a1[2] = v8;
  return result;
}

id sub_1DADE5200()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIRFCardSectionRowModel);
}

uint64_t type metadata accessor for SearchUIRFCardSectionRowModel()
{
  return objc_opt_self();
}

id sub_1DADE53E4()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIRFCardSectionRowModelProvider);
}

id sub_1DADE53F0(uint64_t (*a1)(void))
{
  void *v1;
  objc_super v3;

  v3.receiver = v1;
  v3.super_class = (Class)a1();
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIRFCardSectionRowModelProvider()
{
  return objc_opt_self();
}

void sub_1DADE5450(uint64_t a1, void *a2, void *a3, char a4, uint64_t a5)
{
  void *v5;
  char *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  objc_super v16;
  uint64_t v17;
  _BYTE v18[32];

  sub_1DADDAA60(a1, (uint64_t)v18);
  sub_1DAE0D38C();
  v11 = v5;
  swift_dynamicCast();
  *(_QWORD *)&v11[OBJC_IVAR___SearchUIRFCardSectionRowModel__builderContext] = v17;

  v12 = a2;
  v13 = a3;
  v14 = (void *)sub_1DAE0D530();
  swift_bridgeObjectRelease();
  v16.receiver = v11;
  v16.super_class = (Class)type metadata accessor for SearchUIRFCardSectionRowModel();
  v15 = objc_msgSendSuper2(&v16, sel_initWithResult_cardSection_isInline_queryId_itemIdentifier_, v12, v13, a4 & 1, a5, v14);

  if (v15)
    __swift_destroy_boxed_opaque_existential_0(a1);
  else
    __break(1u);
}

unint64_t sub_1DADE5574()
{
  unint64_t result;

  result = qword_1ED4D4610;
  if (!qword_1ED4D4610)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1ED4D4610);
  }
  return result;
}

uint64_t sub_1DADE55B0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC00);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADE55F0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC10);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
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

uint64_t getEnumTagSinglePayload for CustomizedHighlightSettings(unsigned __int8 *a1, unsigned int a2)
{
  unsigned int v3;
  BOOL v4;
  int v5;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && a1[48])
    return (*(_DWORD *)a1 + 255);
  v3 = *a1;
  v4 = v3 >= 2;
  v5 = (v3 + 2147483646) & 0x7FFFFFFF;
  if (!v4)
    v5 = -1;
  return (v5 + 1);
}

uint64_t storeEnumTagSinglePayload for CustomizedHighlightSettings(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_QWORD *)(result + 40) = 0;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 48) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 48) = 0;
    if (a2)
      *(_BYTE *)result = a2 + 1;
  }
  return result;
}

ValueMetadata *type metadata accessor for CustomizedHighlightSettings()
{
  return &type metadata for CustomizedHighlightSettings;
}

uint64_t destroy for SearchUIUserReportRequestSelectorSection(uint64_t a1)
{
  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

uint64_t initializeWithCopy for SearchUIUserReportRequestSelectorSection(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v3 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v3;
  v5 = *(void **)(a2 + 16);
  v4 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = v5;
  *(_QWORD *)(a1 + 24) = v4;
  v6 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v6;
  v7 = *(_QWORD *)(a2 + 56);
  *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 56) = v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = *(_QWORD *)(a2 + 88);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 88) = v8;
  sub_1DAE0C564();
  sub_1DAE0C564();
  v9 = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  return a1;
}

_QWORD *assignWithCopy for SearchUIUserReportRequestSelectorSection(_QWORD *a1, _QWORD *a2)
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;

  *a1 = *a2;
  sub_1DAE0C564();
  swift_release();
  a1[1] = a2[1];
  sub_1DAE0C564();
  swift_release();
  v4 = (void *)a1[2];
  v5 = (void *)a2[2];
  a1[2] = v5;
  v6 = v5;

  a1[3] = a2[3];
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[5] = a2[5];
  a1[6] = a2[6];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[7] = a2[7];
  a1[8] = a2[8];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[9] = a2[9];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v7 = a2[11];
  a1[10] = a2[10];
  a1[11] = v7;
  sub_1DAE0C564();
  swift_release();
  return a1;
}

__n128 __swift_memcpy96_8(uint64_t a1, uint64_t a2)
{
  __int128 v2;
  __n128 result;
  __int128 v4;
  __int128 v5;

  v2 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v2;
  result = *(__n128 *)(a2 + 32);
  v4 = *(_OWORD *)(a2 + 48);
  v5 = *(_OWORD *)(a2 + 80);
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  *(_OWORD *)(a1 + 80) = v5;
  *(__n128 *)(a1 + 32) = result;
  *(_OWORD *)(a1 + 48) = v4;
  return result;
}

uint64_t assignWithTake for SearchUIUserReportRequestSelectorSection(uint64_t a1, uint64_t a2)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;

  swift_release();
  *(_OWORD *)a1 = *(_OWORD *)a2;
  swift_release();
  v4 = *(void **)(a1 + 16);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);

  v5 = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 24) = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 32) = v5;
  swift_bridgeObjectRelease();
  v6 = *(_QWORD *)(a2 + 48);
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 48) = v6;
  swift_bridgeObjectRelease();
  *(_QWORD *)(a1 + 56) = *(_QWORD *)(a2 + 56);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 64) = *(_OWORD *)(a2 + 64);
  swift_bridgeObjectRelease();
  *(_OWORD *)(a1 + 80) = *(_OWORD *)(a2 + 80);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIUserReportRequestSelectorSection(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 96))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIUserReportRequestSelectorSection(uint64_t result, int a2, int a3)
{
  if (a2 < 0)
  {
    *(_QWORD *)(result + 88) = 0;
    *(_OWORD *)(result + 72) = 0u;
    *(_OWORD *)(result + 56) = 0u;
    *(_OWORD *)(result + 40) = 0u;
    *(_OWORD *)(result + 24) = 0u;
    *(_OWORD *)(result + 8) = 0u;
    *(_QWORD *)result = a2 ^ 0x80000000;
    if (a3 < 0)
      *(_BYTE *)(result + 96) = 1;
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
    *(_BYTE *)(result + 96) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIUserReportRequestSelectorSection()
{
  return &type metadata for SearchUIUserReportRequestSelectorSection;
}

uint64_t sub_1DADE5A78()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE5A88@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  char v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t KeyPath;
  _OWORD *v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  char v62;
  uint64_t v63;
  char v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  char v69;

  v2 = v1;
  v54 = a1;
  v3 = sub_1DAE0CB58();
  v55 = *(_QWORD *)(v3 - 8);
  v56 = v3;
  MEMORY[0x1E0C80A78](v3);
  v53 = (char *)&v45 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v50 = sub_1DAE0CAB0();
  v49 = *(_QWORD *)(v50 - 8);
  MEMORY[0x1E0C80A78](v50);
  v6 = (char *)&v45 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v47 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC18);
  MEMORY[0x1E0C80A78](v47);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC20);
  v48 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v45 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC28);
  v51 = *(_QWORD *)(v10 - 8);
  v52 = v10;
  MEMORY[0x1E0C80A78](v10);
  v46 = (char *)&v45 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v57 = v2;
  v12 = *(_QWORD *)(v2 + 32);
  v60 = *(_QWORD *)(v2 + 24);
  v61 = v12;
  sub_1DADE63A4();
  swift_bridgeObjectRetain();
  v13 = sub_1DAE0CF18();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = sub_1DAE0CEB8();
  sub_1DAE0CA98();
  v60 = v13;
  v61 = v15;
  v62 = v17 & 1;
  v63 = v19;
  v64 = v20;
  v65 = v21;
  v66 = v22;
  v67 = v23;
  v68 = v24;
  v69 = 0;
  sub_1DADE6124();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC38);
  sub_1DADE63E8();
  sub_1DADDD9BC(&qword_1F029DC48, &qword_1F029DC38, (uint64_t)&unk_1DAE1F088);
  v25 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC50);
  v26 = sub_1DADE644C();
  v58 = v25;
  v59 = v26;
  swift_getOpaqueTypeConformance2();
  sub_1DAE0D0EC();
  v27 = v49;
  v28 = v50;
  (*(void (**)(char *, _QWORD, uint64_t))(v49 + 104))(v6, *MEMORY[0x1E0CD84F8], v50);
  sub_1DADE64D0();
  v29 = v46;
  sub_1DAE0CF78();
  (*(void (**)(char *, uint64_t))(v27 + 8))(v6, v28);
  (*(void (**)(char *, uint64_t))(v48 + 8))(v9, v7);
  KeyPath = swift_getKeyPath();
  v31 = (_OWORD *)swift_allocObject();
  v32 = *(_OWORD *)(v2 + 48);
  v31[3] = *(_OWORD *)(v2 + 32);
  v31[4] = v32;
  v33 = *(_OWORD *)(v2 + 80);
  v31[5] = *(_OWORD *)(v2 + 64);
  v31[6] = v33;
  v34 = *(_OWORD *)(v2 + 16);
  v31[1] = *(_OWORD *)v2;
  v31[2] = v34;
  sub_1DADE6638(v2);
  v35 = v53;
  sub_1DAE0CB4C();
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC78);
  v37 = v54;
  v38 = (uint64_t *)(v54 + *(int *)(v36 + 36));
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC80);
  v41 = v55;
  v40 = v56;
  (*(void (**)(char *, char *, uint64_t))(v55 + 16))((char *)v38 + *(int *)(v39 + 28), v35, v56);
  *v38 = KeyPath;
  v43 = v51;
  v42 = v52;
  (*(void (**)(uint64_t, char *, uint64_t))(v51 + 16))(v37, v29, v52);
  (*(void (**)(char *, uint64_t))(v41 + 8))(v35, v40);
  return (*(uint64_t (**)(char *, uint64_t))(v43 + 8))(v29, v42);
}

void sub_1DADE5E90(__int128 *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  char v12;
  id v13;
  __int128 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;

  v14 = *a1;
  v15 = *((_QWORD *)a1 + 2);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC88);
  sub_1DAE0D0B0();
  v5 = v16;
  v6 = v17;
  v7 = v18;
  swift_getKeyPath();
  v8 = *((_QWORD *)a1 + 9);
  swift_getKeyPath();
  v13 = v18;
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  sub_1DAE0C564();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC90);
  v9 = sub_1DAE0D854();
  swift_release();
  sub_1DAE0C564();
  v10 = sub_1DADE6928(v8);
  swift_bridgeObjectRelease();
  swift_release();
  sub_1DAE0C564();
  swift_bridgeObjectRetain();
  MEMORY[0x1DF0A77BC](&v14, v4);
  v11 = (void *)v14;
  if ((_QWORD)v14)
  {
    v12 = sub_1DADE66C4(v14, v10);

    swift_bridgeObjectRelease();
    if ((v12 & 1) != 0)
      goto LABEL_6;
  }
  else
  {
    swift_bridgeObjectRelease();
  }
  *(_QWORD *)&v14 = 0;
  sub_1DAE0D098();
LABEL_6:
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  *a2 = v5;
  a2[1] = v6;
  a2[2] = v7;
  a2[3] = v9;
  a2[4] = v10;
  a2[5] = 0x72616D6B63656863;
  a2[6] = 0xE90000000000006BLL;
}

void sub_1DADE6064(id *a1@<X0>, uint64_t *a2@<X8>)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = objc_msgSend(*a1, sel_name);
  if (v3)
  {
    v4 = v3;
    v5 = sub_1DAE0D53C();
    v7 = v6;

  }
  else
  {
    v5 = 0;
    v7 = 0;
  }
  *a2 = v5;
  a2[1] = v7;
}

void sub_1DADE60C8(uint64_t a1, void **a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *a2;
  if (*(_QWORD *)(a1 + 8))
    v3 = sub_1DAE0D530();
  else
    v3 = 0;
  v4 = (id)v3;
  objc_msgSend(v2, sel_setName_);

}

uint64_t sub_1DADE6124()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;
  char v5;

  v0 = sub_1DAE0CD14();
  MEMORY[0x1E0C80A78](v0);
  sub_1DAE0CD08();
  sub_1DAE0CCFC();
  sub_1DAE0CCF0();
  sub_1DAE0CCFC();
  sub_1DAE0CCF0();
  sub_1DAE0CCFC();
  sub_1DAE0CD20();
  v1 = sub_1DAE0CF0C();
  v3 = v2;
  v5 = v4 & 1;
  sub_1DAE0CFD8();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC50);
  sub_1DADE644C();
  sub_1DAE0CF60();
  sub_1DADE68D8(v1, v3, v5);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADE62C0(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DAE0CB58();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DAE0CC78();
}

uint64_t sub_1DADE6344()
{
  return sub_1DAE0CF6C();
}

uint64_t sub_1DADE635C@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADE5A88(a1);
}

void sub_1DADE639C(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1DADE5E90(*(__int128 **)(v1 + 16), a1);
}

unint64_t sub_1DADE63A4()
{
  unint64_t result;

  result = qword_1F029B480;
  if (!qword_1F029B480)
  {
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0DEA9B8], MEMORY[0x1E0DEA968]);
    atomic_store(result, (unint64_t *)&qword_1F029B480);
  }
  return result;
}

unint64_t sub_1DADE63E8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029DC40;
  if (!qword_1F029DC40)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC30);
    v2[0] = MEMORY[0x1E0CDDD58];
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029DC40);
  }
  return result;
}

unint64_t sub_1DADE644C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F029DC58;
  if (!qword_1F029DC58)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC50);
    v2 = sub_1DADDD9BC(&qword_1F029DC60, &qword_1F029DC68, MEMORY[0x1E0CDCF80]);
    v3[0] = MEMORY[0x1E0CDDD58];
    v3[1] = v2;
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F029DC58);
  }
  return result;
}

unint64_t sub_1DADE64D0()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;
  uint64_t v3;
  _QWORD v4[5];

  result = qword_1F029DC70;
  if (!qword_1F029DC70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC20);
    v2 = sub_1DADE63E8();
    v3 = sub_1DADDD9BC(&qword_1F029DC48, &qword_1F029DC38, (uint64_t)&unk_1DAE1F088);
    v4[3] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC50);
    v4[4] = sub_1DADE644C();
    v4[0] = v2;
    v4[1] = v3;
    v4[2] = swift_getOpaqueTypeConformance2();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDFF98], v1, v4);
    atomic_store(result, (unint64_t *)&qword_1F029DC70);
  }
  return result;
}

uint64_t sub_1DADE6590()
{
  return sub_1DAE0CC6C();
}

uint64_t sub_1DADE65B4()
{
  uint64_t v0;

  swift_release();
  swift_release();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DADE6610()
{
  uint64_t v0;

  (*(void (**)(void))(v0 + 96))();
  return sub_1DAE0CB40();
}

uint64_t sub_1DADE6638(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 16);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  sub_1DAE0C564();
  sub_1DAE0C564();
  return a1;
}

uint64_t sub_1DADE66C4(uint64_t a1, unint64_t a2)
{
  uint64_t v3;
  unint64_t v4;
  id v5;
  void *v6;
  char v7;
  uint64_t v9;
  uint64_t v10;
  char v11;
  unint64_t v12;
  id v13;
  char v14;

  if (a2 >> 62)
    goto LABEL_20;
  v3 = *(_QWORD *)((a2 & 0xFFFFFFFFFFFFF8) + 0x10);
  swift_bridgeObjectRetain();
  for (; v3; v3 = sub_1DAE0D83C())
  {
    v4 = a2 & 0xC000000000000001;
    if ((a2 & 0xC000000000000001) == 0)
    {
      v5 = *(id *)(a2 + 32);
      goto LABEL_5;
    }
    while (1)
    {
      v5 = (id)MEMORY[0x1DF0A7ED0](0, a2);
LABEL_5:
      v6 = v5;
      sub_1DADE6A80();
      v7 = sub_1DAE0D704();

      if ((v7 & 1) != 0)
      {
LABEL_6:
        swift_bridgeObjectRelease();
        return 1;
      }
      if (v3 == 1)
        goto LABEL_18;
      if (v4)
        break;
      v4 = 5;
      while (1)
      {
        v12 = v4 - 3;
        if (__OFADD__(v4 - 4, 1))
          break;
        v13 = *(id *)(a2 + 8 * v4);
        v14 = sub_1DAE0D704();

        if ((v14 & 1) != 0)
          goto LABEL_6;
        ++v4;
        if (v12 == v3)
          goto LABEL_18;
      }
      __break(1u);
    }
    v9 = 1;
    while (1)
    {
      MEMORY[0x1DF0A7ED0](v9, a2);
      v10 = v9 + 1;
      if (__OFADD__(v9, 1))
        break;
      v11 = sub_1DAE0D704();
      swift_unknownObjectRelease();
      if ((v11 & 1) != 0)
        goto LABEL_6;
      ++v9;
      if (v10 == v3)
        goto LABEL_18;
    }
    __break(1u);
LABEL_20:
    swift_bridgeObjectRetain();
  }
LABEL_18:
  swift_bridgeObjectRelease();
  return 0;
}

uint64_t sub_1DADE6838@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0CC9C();
  *a1 = result;
  return result;
}

uint64_t sub_1DADE6860@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0CC9C();
  *a1 = result;
  return result;
}

uint64_t sub_1DADE6888()
{
  sub_1DAE0C564();
  return sub_1DAE0CCA8();
}

uint64_t sub_1DADE68B0()
{
  sub_1DAE0C564();
  return sub_1DAE0CCA8();
}

uint64_t sub_1DADE68D8(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return swift_release();
  else
    return swift_bridgeObjectRelease();
}

char *keypath_get_selector_name()
{
  return sel_name;
}

uint64_t sub_1DADE68FC@<X0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;

  v3 = a1[1];
  if (v3)
  {
    *a2 = *a1;
    a2[1] = v3;
  }
  else
  {
    *a2 = 0;
    a2[1] = 0xE000000000000000;
  }
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DADE6928(unint64_t a1)
{
  uint64_t v2;
  unint64_t v3;
  id v4;
  void *v5;
  unint64_t v6;
  uint64_t v8;
  uint64_t v9;

  v9 = MEMORY[0x1E0DEE9D8];
  if (a1 >> 62)
    goto LABEL_16;
  v2 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  if (v2)
  {
    while (1)
    {
      v3 = 0;
      while ((a1 & 0xC000000000000001) != 0)
      {
        v4 = (id)MEMORY[0x1DF0A7ED0](v3, a1);
LABEL_9:
        v5 = v4;
        v6 = v3 + 1;
        if (__OFADD__(v3, 1))
          goto LABEL_15;
        swift_getAtKeyPath();
        if (v8)
        {
          swift_bridgeObjectRelease();
          sub_1DAE0D7E8();
          sub_1DAE0D80C();
          sub_1DAE0D818();
          sub_1DAE0D7F4();
        }
        else
        {

        }
        ++v3;
        if (v6 == v2)
          return v9;
      }
      if (v3 < *(_QWORD *)((a1 & 0xFFFFFFFFFFFFFF8) + 0x10))
        break;
      __break(1u);
LABEL_15:
      __break(1u);
LABEL_16:
      v2 = sub_1DAE0D83C();
      if (!v2)
        return MEMORY[0x1E0DEE9D8];
    }
    v4 = *(id *)(a1 + 8 * v3 + 32);
    goto LABEL_9;
  }
  return MEMORY[0x1E0DEE9D8];
}

unint64_t sub_1DADE6A80()
{
  unint64_t result;

  result = qword_1F029B0F8;
  if (!qword_1F029B0F8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029B0F8);
  }
  return result;
}

unint64_t sub_1DADE6AC0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[4];

  result = qword_1F029DC98;
  if (!qword_1F029DC98)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC78);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DC20);
    v2[3] = sub_1DADE64D0();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_1DADDD9BC((unint64_t *)&unk_1F029DCA0, &qword_1F029DC80, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029DC98);
  }
  return result;
}

char *sub_1DADE6B6C(char *a1, char **a2, uint64_t a3)
{
  int v3;
  char *v4;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  char *v18;
  char *v19;
  char *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  char *v28;
  char *v29;
  uint64_t v30;
  void (*v31)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v32;
  _QWORD *v33;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  _QWORD *v37;
  _QWORD *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  char *v42;
  _QWORD *v43;
  uint64_t v44;
  _QWORD *v46;
  char *__dst;
  uint64_t v48;

  v3 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  v4 = *a2;
  *(_QWORD *)a1 = *a2;
  if ((v3 & 0x20000) != 0)
  {
    v6 = &v4[(v3 + 16) & ~(unint64_t)v3];
    sub_1DAE0C564();
  }
  else
  {
    v6 = a1;
    v7 = a2[1];
    v8 = a2[2];
    *((_QWORD *)a1 + 1) = v7;
    *((_QWORD *)a1 + 2) = v8;
    v9 = a2[3];
    *((_QWORD *)a1 + 3) = v9;
    v10 = *(int *)(a3 + 32);
    v11 = &a1[v10];
    v12 = (uint64_t)a2 + v10;
    v13 = *(char **)((char *)a2 + v10);
    v14 = *(char **)((char *)a2 + v10 + 8);
    *(_QWORD *)v11 = v13;
    *((_QWORD *)v11 + 1) = v14;
    v15 = type metadata accessor for SearchUIUserReportModel();
    v16 = *(int *)(v15 + 24);
    v46 = v11;
    __dst = &v11[v16];
    v48 = v15;
    v17 = (char *)(v12 + v16);
    v18 = v4;
    v19 = v7;
    swift_unknownObjectRetain();
    v20 = v9;
    v21 = v13;
    v22 = v14;
    v23 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
    v24 = *(_QWORD *)(v23 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v24 + 48))(v17, 1, v23))
    {
      v25 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
      memcpy(__dst, v17, *(_QWORD *)(*(_QWORD *)(v25 - 8) + 64));
    }
    else
    {
      v26 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v26 - 8) + 16))(__dst, v17, v26);
      v27 = *(int *)(v23 + 28);
      v28 = &__dst[v27];
      v29 = &v17[v27];
      v30 = *((_QWORD *)v29 + 1);
      *(_QWORD *)v28 = *(_QWORD *)v29;
      *((_QWORD *)v28 + 1) = v30;
      v31 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v24 + 56);
      swift_bridgeObjectRetain();
      v31(__dst, 0, 1, v23);
    }
    v32 = *(int *)(v48 + 28);
    v33 = (_QWORD *)((char *)v46 + v32);
    v34 = (_QWORD *)(v12 + v32);
    v35 = v34[1];
    *v33 = *v34;
    v33[1] = v35;
    v36 = *(int *)(v48 + 32);
    v37 = (_QWORD *)((char *)v46 + v36);
    v38 = (_QWORD *)(v12 + v36);
    v39 = v38[1];
    *v37 = *v38;
    v37[1] = v39;
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
    *(_QWORD *)((char *)v46 + *(int *)(v40 + 28)) = *(_QWORD *)(v12 + *(int *)(v40 + 28));
    v41 = *(int *)(a3 + 36);
    v42 = &v6[v41];
    v43 = (char **)((char *)a2 + v41);
    sub_1DAE0C564();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v44 = sub_1DAE0CB34();
      (*(void (**)(char *, _QWORD *, uint64_t))(*(_QWORD *)(v44 - 8) + 16))(v42, v43, v44);
    }
    else
    {
      *(_QWORD *)v42 = *v43;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
  }
  return v6;
}

uint64_t sub_1DADE6DC4(id *a1, uint64_t a2)
{
  id *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  swift_unknownObjectRelease();
  v4 = (id *)((char *)a1 + *(int *)(a2 + 32));

  v5 = (char *)v4 + *(int *)(type metadata accessor for SearchUIUserReportModel() + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    v7 = sub_1DAE0C7EC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  swift_release();
  v8 = (char *)a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v9 = sub_1DAE0CB34();
  return (*(uint64_t (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
}

_QWORD *sub_1DADE6F28(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  void (*v28)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v29;
  _QWORD *v30;
  _QWORD *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD *v34;
  _QWORD *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  char *__dst;
  uint64_t v44;

  v5 = *(void **)a2;
  v4 = *(void **)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  v6 = *(void **)(a2 + 24);
  a1[2] = *(_QWORD *)(a2 + 16);
  a1[3] = v6;
  v7 = *(int *)(a3 + 32);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = a2 + v7;
  v11 = *(void **)(a2 + v7);
  v10 = *(void **)(a2 + v7 + 8);
  *v8 = v11;
  v8[1] = v10;
  v12 = type metadata accessor for SearchUIUserReportModel();
  v13 = *(int *)(v12 + 24);
  __dst = (char *)v8 + v13;
  v44 = v12;
  v14 = (char *)(v9 + v13);
  v15 = v5;
  v16 = v4;
  swift_unknownObjectRetain();
  v17 = v6;
  v18 = v11;
  v19 = v10;
  v20 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v21 = *(_QWORD *)(v20 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v21 + 48))(v14, 1, v20))
  {
    v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(__dst, v14, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  else
  {
    v23 = sub_1DAE0C7EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 16))(__dst, v14, v23);
    v24 = *(int *)(v20 + 28);
    v25 = &__dst[v24];
    v26 = &v14[v24];
    v27 = *((_QWORD *)v26 + 1);
    *(_QWORD *)v25 = *(_QWORD *)v26;
    *((_QWORD *)v25 + 1) = v27;
    v28 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v21 + 56);
    swift_bridgeObjectRetain();
    v28(__dst, 0, 1, v20);
  }
  v29 = *(int *)(v44 + 28);
  v30 = (_QWORD *)((char *)v8 + v29);
  v31 = (_QWORD *)(v9 + v29);
  v32 = v31[1];
  *v30 = *v31;
  v30[1] = v32;
  v33 = *(int *)(v44 + 32);
  v34 = (_QWORD *)((char *)v8 + v33);
  v35 = (_QWORD *)(v9 + v33);
  v36 = v35[1];
  *v34 = *v35;
  v34[1] = v36;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  *(_QWORD *)((char *)v8 + *(int *)(v37 + 28)) = *(_QWORD *)(v9 + *(int *)(v37 + 28));
  v38 = *(int *)(a3 + 36);
  v39 = (_QWORD *)((char *)a1 + v38);
  v40 = (_QWORD *)(a2 + v38);
  sub_1DAE0C564();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v41 = sub_1DAE0CB34();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v41 - 8) + 16))(v39, v40, v41);
  }
  else
  {
    *v39 = *v40;
    sub_1DAE0C564();
  }
  swift_storeEnumTagMultiPayload();
  return a1;
}

uint64_t sub_1DADE713C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(char *, uint64_t, uint64_t);
  int v30;
  int v31;
  uint64_t v32;
  uint64_t v33;
  char *v34;
  char *v35;
  void (*v36)(char *, _QWORD, uint64_t, uint64_t);
  uint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  _QWORD *v40;
  uint64_t v41;
  _QWORD *v42;
  _QWORD *v43;
  uint64_t v44;
  uint64_t v45;
  _QWORD *v46;
  _QWORD *v47;
  uint64_t v48;
  uint64_t v50;
  uint64_t v51;
  char *v52;
  char *v53;
  uint64_t v54;
  int *v55;

  v6 = *(void **)a2;
  v7 = *(void **)a1;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v8 = v6;

  v9 = *(void **)(a2 + 8);
  v10 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = v9;
  v11 = v9;

  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
  v12 = *(void **)(a2 + 24);
  v13 = *(void **)(a1 + 24);
  *(_QWORD *)(a1 + 24) = v12;
  v14 = v12;

  v54 = a3;
  v15 = *(int *)(a3 + 32);
  v16 = (_QWORD *)(a1 + v15);
  v17 = a2 + v15;
  v18 = *(void **)(a1 + v15);
  v19 = *(void **)(a2 + v15);
  *v16 = v19;
  v20 = v19;

  v21 = (void *)v16[1];
  v22 = *(void **)(v17 + 8);
  v16[1] = v22;
  v23 = v22;

  v55 = (int *)type metadata accessor for SearchUIUserReportModel();
  v24 = v55[6];
  v25 = (char *)v16 + v24;
  v26 = (char *)(v17 + v24);
  v27 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v28 = *(_QWORD *)(v27 - 8);
  v29 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v28 + 48);
  v30 = v29(v25, 1, v27);
  v31 = v29(v26, 1, v27);
  if (v30)
  {
    if (!v31)
    {
      v32 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v32 - 8) + 16))(v25, v26, v32);
      v33 = *(int *)(v27 + 28);
      v34 = &v25[v33];
      v35 = &v26[v33];
      *(_QWORD *)v34 = *(_QWORD *)v35;
      *((_QWORD *)v34 + 1) = *((_QWORD *)v35 + 1);
      v36 = *(void (**)(char *, _QWORD, uint64_t, uint64_t))(v28 + 56);
      swift_bridgeObjectRetain();
      v36(v25, 0, 1, v27);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v31)
  {
    sub_1DADDCC3C((uint64_t)v25, (uint64_t *)&unk_1F029DCB0);
LABEL_6:
    v37 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v25, v26, *(_QWORD *)(*(_QWORD *)(v37 - 8) + 64));
    goto LABEL_7;
  }
  v50 = sub_1DAE0C7EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v50 - 8) + 24))(v25, v26, v50);
  v51 = *(int *)(v27 + 28);
  v52 = &v25[v51];
  v53 = &v26[v51];
  *(_QWORD *)v52 = *(_QWORD *)v53;
  *((_QWORD *)v52 + 1) = *((_QWORD *)v53 + 1);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
LABEL_7:
  v38 = v55[7];
  v39 = (_QWORD *)((char *)v16 + v38);
  v40 = (_QWORD *)(v17 + v38);
  *v39 = *v40;
  v39[1] = v40[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v41 = v55[8];
  v42 = (_QWORD *)((char *)v16 + v41);
  v43 = (_QWORD *)(v17 + v41);
  *v42 = *v43;
  v42[1] = v43[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v44 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  *(_QWORD *)((char *)v16 + *(int *)(v44 + 28)) = *(_QWORD *)(v17 + *(int *)(v44 + 28));
  sub_1DAE0C564();
  swift_release();
  if (a1 != a2)
  {
    v45 = *(int *)(v54 + 36);
    v46 = (_QWORD *)(a1 + v45);
    v47 = (_QWORD *)(a2 + v45);
    sub_1DADDCC3C(a1 + v45, &qword_1F029DCC8);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v48 = sub_1DAE0CB34();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v48 - 8) + 16))(v46, v47, v48);
    }
    else
    {
      *v46 = *v47;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
  }
  return a1;
}

_OWORD *sub_1DADE7468(_OWORD *a1, _OWORD *a2, uint64_t a3)
{
  __int128 v6;
  uint64_t v7;
  char *v8;
  char *v9;
  int *v10;
  uint64_t v11;
  char *v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;

  v6 = a2[1];
  *a1 = *a2;
  a1[1] = v6;
  v7 = *(int *)(a3 + 32);
  v8 = (char *)a1 + v7;
  v9 = (char *)a2 + v7;
  *(_OWORD *)((char *)a1 + v7) = *(_OWORD *)((char *)a2 + v7);
  v10 = (int *)type metadata accessor for SearchUIUserReportModel();
  v11 = v10[6];
  v12 = &v8[v11];
  v13 = &v9[v11];
  v14 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v15 = *(_QWORD *)(v14 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v15 + 48))(v13, 1, v14))
  {
    v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v16 - 8) + 64));
  }
  else
  {
    v17 = sub_1DAE0C7EC();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v17 - 8) + 32))(v12, v13, v17);
    *(_OWORD *)&v12[*(int *)(v14 + 28)] = *(_OWORD *)&v13[*(int *)(v14 + 28)];
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v15 + 56))(v12, 0, 1, v14);
  }
  *(_OWORD *)&v8[v10[7]] = *(_OWORD *)&v9[v10[7]];
  *(_OWORD *)&v8[v10[8]] = *(_OWORD *)&v9[v10[8]];
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  *(_QWORD *)&v8[*(int *)(v18 + 28)] = *(_QWORD *)&v9[*(int *)(v18 + 28)];
  v19 = *(int *)(a3 + 36);
  v20 = (char *)a1 + v19;
  v21 = (char *)a2 + v19;
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v23 = sub_1DAE0CB34();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v23 - 8) + 32))(v20, v21, v23);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v20, v21, *(_QWORD *)(*(_QWORD *)(v22 - 8) + 64));
  }
  return a1;
}

void **sub_1DADE7620(void **a1, void **a2, uint64_t a3)
{
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(char *, uint64_t, uint64_t);
  int v20;
  int v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  _QWORD *v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char *v36;
  char *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  char *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  int *v48;

  v6 = *a1;
  *a1 = *a2;

  v7 = a1[1];
  a1[1] = a2[1];

  a1[2] = a2[2];
  swift_unknownObjectRelease();
  v8 = a1[3];
  a1[3] = a2[3];

  v47 = a3;
  v9 = *(int *)(a3 + 32);
  v10 = (void **)((char *)a1 + v9);
  v11 = (void **)((char *)a2 + v9);
  v12 = *(void **)((char *)a1 + v9);
  *v10 = *v11;

  v13 = (void *)v10[1];
  v10[1] = v11[1];

  v48 = (int *)type metadata accessor for SearchUIUserReportModel();
  v14 = v48[6];
  v15 = (char *)v10 + v14;
  v16 = (char *)v11 + v14;
  v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = *(uint64_t (**)(char *, uint64_t, uint64_t))(v18 + 48);
  v20 = v19(v15, 1, v17);
  v21 = v19(v16, 1, v17);
  if (v20)
  {
    if (!v21)
    {
      v22 = sub_1DAE0C7EC();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v22 - 8) + 32))(v15, v16, v22);
      *(_OWORD *)&v15[*(int *)(v17 + 28)] = *(_OWORD *)&v16[*(int *)(v17 + 28)];
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v18 + 56))(v15, 0, 1, v17);
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  if (v21)
  {
    sub_1DADDCC3C((uint64_t)v15, (uint64_t *)&unk_1F029DCB0);
LABEL_6:
    v23 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
    memcpy(v15, v16, *(_QWORD *)(*(_QWORD *)(v23 - 8) + 64));
    goto LABEL_7;
  }
  v41 = sub_1DAE0C7EC();
  (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v41 - 8) + 40))(v15, v16, v41);
  v42 = *(int *)(v17 + 28);
  v43 = &v15[v42];
  v44 = &v16[v42];
  v46 = *(_QWORD *)v44;
  v45 = *((_QWORD *)v44 + 1);
  *(_QWORD *)v43 = v46;
  *((_QWORD *)v43 + 1) = v45;
  swift_bridgeObjectRelease();
LABEL_7:
  v24 = v48[7];
  v25 = (_QWORD *)((char *)v10 + v24);
  v26 = (_QWORD *)((char *)v11 + v24);
  v28 = *v26;
  v27 = v26[1];
  *v25 = v28;
  v25[1] = v27;
  swift_bridgeObjectRelease();
  v29 = v48[8];
  v30 = (_QWORD *)((char *)v10 + v29);
  v31 = (_QWORD *)((char *)v11 + v29);
  v33 = *v31;
  v32 = v31[1];
  *v30 = v33;
  v30[1] = v32;
  swift_bridgeObjectRelease();
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  *(_QWORD *)((char *)v10 + *(int *)(v34 + 28)) = *(_QWORD *)((char *)v11 + *(int *)(v34 + 28));
  swift_release();
  if (a1 != a2)
  {
    v35 = *(int *)(v47 + 36);
    v36 = (char *)a1 + v35;
    v37 = (char *)a2 + v35;
    sub_1DADDCC3C((uint64_t)a1 + v35, &qword_1F029DCC8);
    v38 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v39 = sub_1DAE0CB34();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v39 - 8) + 32))(v36, v37, v39);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v36, v37, *(_QWORD *)(*(_QWORD *)(v38 - 8) + 64));
    }
  }
  return a1;
}

uint64_t sub_1DADE78E8()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADE78F4(char *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)a1;
    if (*(_QWORD *)a1 >= 0xFFFFFFFFuLL)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == (_DWORD)a2)
    {
      v10 = v8;
      v11 = *(int *)(a3 + 32);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_1F029DCD0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a3 + 36);
    }
    return (*(uint64_t (**)(char *, uint64_t, uint64_t))(v9 + 48))(&a1[v11], a2, v10);
  }
}

uint64_t sub_1DADE799C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

char *sub_1DADE79A8(char *result, uint64_t a2, int a3, uint64_t a4)
{
  char *v5;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)result = (a2 - 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
    v9 = *(_QWORD *)(v8 - 8);
    if (*(_DWORD *)(v9 + 84) == a3)
    {
      v10 = v8;
      v11 = *(int *)(a4 + 32);
    }
    else
    {
      v10 = __swift_instantiateConcreteTypeFromMangledName(qword_1F029DCD0);
      v9 = *(_QWORD *)(v10 - 8);
      v11 = *(int *)(a4 + 36);
    }
    return (char *)(*(uint64_t (**)(char *, uint64_t, uint64_t, uint64_t))(v9 + 56))(&v5[v11], a2, a2, v10);
  }
  return result;
}

uint64_t type metadata accessor for SearchUIUserReportRequestView()
{
  uint64_t result;

  result = qword_1F029DD30;
  if (!qword_1F029DD30)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DADE7A88()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DADE7B58(319, &qword_1F029DD40, (uint64_t (*)(uint64_t))type metadata accessor for SearchUIUserReportModel, MEMORY[0x1E0CDF9A8]);
  if (v0 <= 0x3F)
  {
    sub_1DADE7B58(319, qword_1F029DD48, (uint64_t (*)(uint64_t))MEMORY[0x1E0CD8E80], (uint64_t (*)(uint64_t, uint64_t))MEMORY[0x1E0CD87D0]);
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DADE7B58(uint64_t a1, unint64_t *a2, uint64_t (*a3)(uint64_t), uint64_t (*a4)(uint64_t, uint64_t))
{
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;

  if (!*a2)
  {
    v7 = a3(255);
    v8 = a4(a1, v7);
    if (!v9)
      atomic_store(v8, a2);
  }
}

uint64_t sub_1DADE7BB0()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADE7BC0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
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
  char *v13;
  uint64_t v14;
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
  id v26;
  void *v27;
  uint64_t v28;
  unint64_t v29;
  unint64_t v30;
  uint64_t v31;
  char *v32;
  uint64_t v33;
  uint64_t OpaqueTypeConformance2;
  unint64_t v35;
  char *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  char *v48;
  uint64_t v49;
  uint64_t v50;
  unint64_t v51;
  uint64_t v52;
  char *v53;
  uint64_t v54;
  char *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  char *v62;
  char *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  char *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  char *v74;
  char *v75;
  char *v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t v79;
  uint64_t v80;
  char *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  char *v86;
  uint64_t v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  uint64_t v93;
  unint64_t v94;
  uint64_t v95;
  unint64_t v96;

  v89 = a2;
  v3 = sub_1DAE0D650();
  v87 = *(_QWORD *)(v3 - 8);
  v88 = v3;
  MEMORY[0x1E0C80A78](v3);
  v86 = (char *)&v62 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v80 = type metadata accessor for SearchUIUserReportRequestView();
  v82 = *(_QWORD *)(v80 - 8);
  MEMORY[0x1E0C80A78](v80);
  v83 = v5;
  v84 = (uint64_t)&v62 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDF0);
  MEMORY[0x1E0C80A78](v6);
  v81 = (char *)&v62 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v77 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDF8);
  MEMORY[0x1E0C80A78](v77);
  v76 = (char *)&v62 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v68 = sub_1DAE0CCCC();
  v67 = *(_QWORD *)(v68 - 8);
  MEMORY[0x1E0C80A78](v68);
  v63 = (char *)&v62 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DAE0CDC8();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v62 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDB8);
  v15 = *(_QWORD *)(v14 - 8);
  MEMORY[0x1E0C80A78](v14);
  v17 = (char *)&v62 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v65 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDB0);
  v64 = *(_QWORD *)(v65 - 8);
  MEMORY[0x1E0C80A78](v65);
  v19 = (char *)&v62 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v69 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDA0);
  v66 = *(_QWORD *)(v69 - 8);
  MEMORY[0x1E0C80A78](v69);
  v62 = (char *)&v62 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  v73 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DD98);
  v72 = *(_QWORD *)(v73 - 8);
  MEMORY[0x1E0C80A78](v73);
  v70 = (char *)&v62 - ((v21 + 15) & 0xFFFFFFFFFFFFFFF0);
  v22 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE00);
  v78 = *(_QWORD *)(v22 - 8);
  v79 = v22;
  MEMORY[0x1E0C80A78](v22);
  v75 = (char *)&v62 - ((v23 + 15) & 0xFFFFFFFFFFFFFFF0);
  v71 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DD88);
  MEMORY[0x1E0C80A78](v71);
  v74 = (char *)&v62 - ((v24 + 15) & 0xFFFFFFFFFFFFFFF0);
  v90 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE08);
  sub_1DADDD9BC(&qword_1F029DE10, &qword_1F029DE08, MEMORY[0x1E0CE0680]);
  sub_1DAE0CF00();
  sub_1DAE0CDBC();
  v25 = sub_1DADDD9BC((unint64_t *)&unk_1F029DDC0, &qword_1F029DDB8, MEMORY[0x1E0CDD950]);
  sub_1DAE0CFC0();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  (*(void (**)(char *, uint64_t))(v15 + 8))(v17, v14);
  v85 = a1;
  v26 = objc_msgSend(*(id *)(a1 + 8), sel_title);
  if (v26)
  {
    v27 = v26;
    v28 = sub_1DAE0D53C();
    v30 = v29;

  }
  else
  {
    v28 = 0;
    v30 = 0xE000000000000000;
  }
  v95 = v28;
  v96 = v30;
  v31 = v67;
  v32 = v63;
  v33 = v68;
  (*(void (**)(char *, _QWORD, uint64_t))(v67 + 104))(v63, *MEMORY[0x1E0CDAB90], v68);
  v91 = v14;
  v92 = v10;
  v93 = v25;
  v94 = MEMORY[0x1E0CDBD50];
  OpaqueTypeConformance2 = swift_getOpaqueTypeConformance2();
  v35 = sub_1DADE63A4();
  v36 = v62;
  v37 = v65;
  sub_1DAE0CF84();
  (*(void (**)(char *, uint64_t))(v31 + 8))(v32, v33);
  swift_bridgeObjectRelease();
  v38 = (*(uint64_t (**)(char *, uint64_t))(v64 + 8))(v19, v37);
  MEMORY[0x1E0C80A78](v38);
  v39 = v85;
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDA8);
  v91 = v37;
  v92 = MEMORY[0x1E0DEA968];
  v93 = OpaqueTypeConformance2;
  v94 = v35;
  v41 = swift_getOpaqueTypeConformance2();
  v42 = sub_1DADDD9BC(&qword_1F029DDD0, &qword_1F029DDA8, MEMORY[0x1E0CDB5C0]);
  v43 = v70;
  v44 = v69;
  sub_1DAE0CFA8();
  (*(void (**)(char *, uint64_t))(v66 + 8))(v36, v44);
  v45 = v39;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  v46 = (uint64_t)v76;
  sub_1DAE0D05C();
  swift_getKeyPath();
  v47 = (uint64_t)v81;
  sub_1DAE0D0A4();
  swift_release();
  sub_1DADDCC3C(v46, &qword_1F029DDF8);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  v91 = v44;
  v92 = v40;
  v93 = v41;
  v94 = v42;
  swift_getOpaqueTypeConformance2();
  sub_1DADDD9BC(&qword_1F029DDD8, (uint64_t *)&unk_1F029DCB0, (uint64_t)&unk_1DAE1EEF8);
  sub_1DADE9C2C();
  v48 = v75;
  v49 = v73;
  sub_1DAE0CF9C();
  sub_1DADDCC3C(v47, &qword_1F029DDF0);
  (*(void (**)(char *, uint64_t))(v72 + 8))(v43, v49);
  v50 = v84;
  sub_1DADE9E90(v45, v84, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  v51 = (*(unsigned __int8 *)(v82 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v82 + 80);
  v52 = swift_allocObject();
  sub_1DADE9CCC(v50, v52 + v51);
  v53 = v86;
  sub_1DAE0D638();
  v54 = (uint64_t)v74;
  v55 = &v74[*(int *)(v71 + 36)];
  v56 = sub_1DAE0CB64();
  v58 = v87;
  v57 = v88;
  (*(void (**)(char *, char *, uint64_t))(v87 + 16))(&v55[*(int *)(v56 + 20)], v53, v88);
  *(_QWORD *)v55 = &unk_1F029DE20;
  *((_QWORD *)v55 + 1) = v52;
  v60 = v78;
  v59 = v79;
  (*(void (**)(uint64_t, char *, uint64_t))(v78 + 16))(v54, v48, v79);
  (*(void (**)(char *, uint64_t))(v58 + 8))(v53, v57);
  (*(void (**)(char *, uint64_t))(v60 + 8))(v48, v59);
  return sub_1DADE9D90(v54, v89, &qword_1F029DD88);
}

void sub_1DADE840C(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id *v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  void *v16;
  id v17;
  void *v18;
  unint64_t v19;
  id v20;
  void *v21;
  unint64_t v22;
  unint64_t v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  unint64_t v30;
  unint64_t v31;
  id v32;
  void *v33;
  id v34;
  unint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  id v45;
  void *v46;
  uint64_t v47;
  unint64_t v48;
  unint64_t v49;
  uint64_t v50;
  unint64_t v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  void *v69;

  v4 = type metadata accessor for SearchUIUserReportModel();
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v56 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SearchUIUserReportRequestView();
  v60 = *(_QWORD *)(v7 - 8);
  v8 = *(_QWORD *)(v60 + 64);
  v9 = MEMORY[0x1E0C80A78](v7);
  v66 = (uint64_t)&v56 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v9);
  v11 = (id *)((char *)&v56 - v10);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DDF8);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)&v56 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = a1 + *(int *)(v7 + 32);
  v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  v65 = v15;
  sub_1DAE0D05C();
  swift_getKeyPath();
  sub_1DAE0D0A4();
  swift_release();
  sub_1DADDCC3C((uint64_t)v14, &qword_1F029DDF8);
  v61 = v68;
  v62 = v67;
  v63 = v69;
  v16 = *(void **)(a1 + 8);
  v17 = objc_msgSend(v16, sel_reportOptionsSectionTitle);
  if (v17)
  {
    v18 = v17;
    v58 = sub_1DAE0D53C();
    v59 = v19;

  }
  else
  {
    v58 = 0;
    v59 = 0xE000000000000000;
  }
  v20 = objc_msgSend(v16, sel_disclaimerText);
  if (v20)
  {
    v21 = v20;
    v57 = sub_1DAE0D53C();
    v23 = v22;

  }
  else
  {
    v57 = 0;
    v23 = 0xE000000000000000;
  }
  v24 = (void *)objc_opt_self();
  v25 = (void *)sub_1DAE0D530();
  v26 = objc_msgSend(v24, sel_linkWithBundleIdentifier_, v25);

  if (v26
    && (v27 = objc_msgSend(v26, sel_flow),
        v26,
        v28 = objc_msgSend(v27, sel_localizedButtonTitle),
        v27,
        v28))
  {
    v29 = sub_1DAE0D53C();
    v31 = v30;

    sub_1DADE9E90(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
    if (v31)
      goto LABEL_16;
  }
  else
  {
    sub_1DADE9E90(a1, (uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  }
  v32 = objc_msgSend(v11[1], sel_disclaimerLearnMorePunchout);
  if (v32 && (v33 = v32, v34 = objc_msgSend(v32, sel_name), v33, v34))
  {
    v29 = sub_1DAE0D53C();
    v31 = v35;

  }
  else
  {
    v29 = 0;
    v31 = 0xE000000000000000;
  }
LABEL_16:
  sub_1DADE9F7C((uint64_t)v11, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  v36 = objc_msgSend(*(id *)(a1 + 8), sel_userReportOptions);
  if (v36)
  {
    v37 = v36;
    sub_1DADE6A80();
    v38 = sub_1DAE0D5CC();

  }
  else
  {
    v38 = MEMORY[0x1E0DEE9D8];
  }
  v39 = v60;
  v40 = v66;
  sub_1DADE9E90(a1, v66, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  v41 = (*(unsigned __int8 *)(v39 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v39 + 80);
  v42 = swift_allocObject();
  sub_1DADE9CCC(v40, v42 + v41);
  sub_1DAE0D044();
  v43 = (void *)*((_QWORD *)v6 + 1);
  v44 = v43;
  sub_1DADE9F7C((uint64_t)v6, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  v45 = objc_msgSend(*(id *)(a1 + 8), sel_attachmentSectionTitle);
  if (v45)
  {
    v46 = v45;
    v47 = sub_1DAE0D53C();
    v49 = v48;

  }
  else
  {
    v47 = 0;
    v49 = 0xE000000000000000;
  }
  v50 = v58;
  v51 = v59;
  v52 = v63;
  v53 = v61;
  v54 = v57;
  *a2 = v62;
  a2[1] = v53;
  a2[2] = v52;
  a2[3] = v50;
  a2[4] = v51;
  a2[5] = v54;
  a2[6] = v23;
  a2[7] = v29;
  a2[8] = v31;
  a2[9] = v38;
  a2[10] = sub_1DADEA150;
  a2[11] = v42;
  a2[12] = v43;
  a2[13] = v47;
  a2[14] = v49;
  v55 = v52;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

}

void sub_1DADE88C8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  id v25;

  v1 = type metadata accessor for SearchUIUserReportModel();
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v24 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)&v24 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v24 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = (void *)v0[1];
  v11 = objc_msgSend(v10, sel_disclaimerLearnMorePunchout);
  if (v11
    && (v12 = v11,
        v13 = objc_msgSend(v11, sel_bundleIdentifier),
        v12,
        v13))
  {
    v14 = sub_1DAE0D53C();
    v16 = v15;

    sub_1DAE0C7E0();
    v17 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
    v18 = (uint64_t *)&v9[*(int *)(v17 + 28)];
    *v18 = v14;
    v18[1] = v16;
    (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 56))(v9, 0, 1, v17);
    v19 = type metadata accessor for SearchUIUserReportRequestView();
    sub_1DADEA198((uint64_t)v0 + *(int *)(v19 + 32), (uint64_t)v6);
    sub_1DAE0D044();
    sub_1DADEA1E0((uint64_t)v9, (uint64_t)&v3[*(int *)(v1 + 24)]);
    sub_1DAE0D050();
    sub_1DADDCC3C((uint64_t)v6, &qword_1F029DCC0);
  }
  else
  {
    v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D8C580]), sel_init);
    v20 = objc_msgSend(v10, sel_disclaimerLearnMorePunchout);
    objc_msgSend(v25, sel_setPunchout_, v20);

    v21 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D8C2A0]), sel_init);
    objc_msgSend(v21, sel_setCommand_, v25);
    v22 = objc_msgSend((id)objc_opt_self(), sel_handlerForButton_rowModel_environment_, v21, *v0, v0[3]);
    if (v22)
    {
      v23 = v22;
      objc_msgSend(v23, sel_executeWithTriggerEvent_, 2);

    }
  }
}

uint64_t sub_1DADE8B90@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  unint64_t v14;
  char *v15;
  char *v16;
  uint64_t v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;

  v22 = a2;
  v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE38);
  MEMORY[0x1E0C80A78](v21);
  v4 = (char *)&v19 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE40);
  v5 = *(_QWORD *)(v20 - 8);
  MEMORY[0x1E0C80A78](v20);
  v7 = (char *)&v19 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DAE0CD98();
  MEMORY[0x1E0C80A78](v8);
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE48);
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v19 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAE0CD80();
  v24 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE50);
  sub_1DADDD9BC(&qword_1F029DE58, &qword_1F029DE50, MEMORY[0x1E0CDFA58]);
  sub_1DAE0CAE0();
  sub_1DAE0CD8C();
  v23 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE60);
  v13 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DE68);
  v14 = sub_1DADE9DE4();
  v25 = v13;
  v26 = v14;
  swift_getOpaqueTypeConformance2();
  sub_1DAE0CAE0();
  v15 = &v4[*(int *)(v21 + 48)];
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v4, v12, v9);
  v16 = v15;
  v17 = v20;
  (*(void (**)(char *, char *, uint64_t))(v5 + 16))(v16, v7, v20);
  sub_1DAE0CD5C();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v17);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

uint64_t sub_1DADE8DE8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  _QWORD v14[2];

  v2 = type metadata accessor for SearchUIUserReportRequestView();
  v3 = *(_QWORD *)(v2 - 8);
  v4 = *(_QWORD *)(v3 + 64);
  MEMORY[0x1E0C80A78](v2);
  v5 = type metadata accessor for SearchUIUserReportModel();
  MEMORY[0x1E0C80A78](v5);
  v7 = (char *)v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  sub_1DAE0D044();
  v8 = &v7[*(int *)(v5 + 28)];
  v10 = *(_QWORD *)v8;
  v9 = *((_QWORD *)v8 + 1);
  swift_bridgeObjectRetain();
  sub_1DADE9F7C((uint64_t)v7, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  v14[0] = v10;
  v14[1] = v9;
  sub_1DADE9E90(a1, (uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  v11 = (*(unsigned __int8 *)(v3 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v3 + 80);
  v12 = swift_allocObject();
  sub_1DADE9CCC((uint64_t)v14 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0), v12 + v11);
  sub_1DADE63A4();
  return sub_1DAE0D074();
}

uint64_t sub_1DADE8F58()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v5;

  v0 = sub_1DAE0CB34();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v5 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SearchUIUserReportRequestView();
  sub_1DADEAA54((uint64_t)v3);
  sub_1DAE0CB28();
  return (*(uint64_t (**)(char *, uint64_t))(v1 + 8))(v3, v0);
}

uint64_t sub_1DADE8FF0@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  id v28;
  char v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t KeyPath;
  uint64_t v35;
  uint64_t *v36;
  char *v37;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  char *v45;
  char *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;

  v48 = a2;
  v3 = type metadata accessor for SearchUIUserReportRequestView();
  v44 = *(_QWORD *)(v3 - 8);
  v4 = *(_QWORD *)(v44 + 64);
  MEMORY[0x1E0C80A78](v3);
  v43 = (uint64_t)&v39 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = type metadata accessor for SearchUIUserReportModel();
  v6 = MEMORY[0x1E0C80A78](v5);
  v45 = (char *)&v39 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v6);
  v10 = (uint64_t *)((char *)&v39 - v9);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v39 - v11;
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE50);
  v41 = *(_QWORD *)(v13 - 8);
  v42 = v13;
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v39 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v40 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE68);
  MEMORY[0x1E0C80A78](v40);
  v17 = (char *)&v39 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v39 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DE60);
  v47 = *(_QWORD *)(v39 - 8);
  MEMORY[0x1E0C80A78](v39);
  v46 = (char *)&v39 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  sub_1DAE0D044();
  v19 = &v12[*(int *)(v5 + 32)];
  v20 = *(_QWORD *)v19;
  v21 = *((_QWORD *)v19 + 1);
  swift_bridgeObjectRetain();
  sub_1DADE9F7C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  v49 = v20;
  v50 = v21;
  v22 = v43;
  sub_1DADE9E90(a1, v43, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportRequestView);
  v23 = (*(unsigned __int8 *)(v44 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v44 + 80);
  v24 = swift_allocObject();
  sub_1DADE9CCC(v22, v24 + v23);
  sub_1DADE63A4();
  v25 = (uint64_t)v45;
  sub_1DAE0D074();
  sub_1DAE0D044();
  v26 = *v10;
  sub_1DADE9E90((uint64_t)v10, v25, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  if (!v26)
  {
    sub_1DADE9F7C(v25, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
    goto LABEL_5;
  }
  v27 = *(void **)(v25 + 8);
  v28 = v27;
  sub_1DADE9F7C(v25, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  if (!v27)
  {
LABEL_5:
    v29 = 1;
    goto LABEL_6;
  }

  v29 = 0;
LABEL_6:
  v31 = v41;
  v30 = v42;
  v32 = v39;
  v33 = v40;
  sub_1DADE9F7C((uint64_t)v10, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  KeyPath = swift_getKeyPath();
  v35 = swift_allocObject();
  *(_BYTE *)(v35 + 16) = v29;
  (*(void (**)(char *, char *, uint64_t))(v31 + 16))(v17, v15, v30);
  v36 = (uint64_t *)&v17[*(int *)(v33 + 36)];
  *v36 = KeyPath;
  v36[1] = (uint64_t)sub_1DADE9F34;
  v36[2] = v35;
  (*(void (**)(char *, uint64_t))(v31 + 8))(v15, v30);
  sub_1DADE9DE4();
  v37 = v46;
  sub_1DAE0CF90();
  sub_1DADDCC3C((uint64_t)v17, &qword_1F029DE68);
  return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v47 + 32))(v48, v37, v32);
}

void sub_1DADE939C()
{
  void **v0;
  void **v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  unsigned __int8 v29;
  uint64_t v30;
  _QWORD v31[2];
  uint64_t v32;
  id v33;

  v1 = v0;
  v2 = sub_1DAE0CB34();
  v3 = *(_QWORD *)(v2 - 8);
  MEMORY[0x1E0C80A78](v2);
  v5 = (char *)v31 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = type metadata accessor for SearchUIUserReportModel();
  v7 = MEMORY[0x1E0C80A78](v6);
  v9 = (id *)((char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v10 = MEMORY[0x1E0C80A78](v7);
  v12 = (char *)v31 - v11;
  MEMORY[0x1E0C80A78](v10);
  v14 = (_QWORD *)((char *)v31 - v13);
  v15 = *v0;
  v16 = objc_msgSend(v15, sel_identifyingResult);
  if (!v16)
    return;
  v33 = v16;
  v17 = objc_msgSend(v15, sel_cardSection);
  if (!v17)
  {

    return;
  }
  v18 = v17;
  v32 = v3;
  v31[1] = type metadata accessor for SearchUIUserReportRequestView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  sub_1DAE0D044();
  v19 = *v14;
  sub_1DADE9E90((uint64_t)v14, (uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  if (!v19)
  {
    sub_1DADE9F7C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
    goto LABEL_13;
  }
  v31[0] = v2;
  v20 = (void *)*((_QWORD *)v12 + 1);
  v21 = v20;
  sub_1DADE9F7C((uint64_t)v12, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  if (!v20)
  {
LABEL_13:
    sub_1DADE9F7C((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
    goto LABEL_14;
  }

  sub_1DADE9F7C((uint64_t)v14, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  sub_1DAE0D044();
  v22 = *v9;
  v23 = *v9;
  sub_1DADE9F7C((uint64_t)v9, (uint64_t (*)(_QWORD))type metadata accessor for SearchUIUserReportModel);
  if (!v22)
  {
LABEL_14:

    return;
  }
  v24 = objc_allocWithZone(MEMORY[0x1E0D8C810]);
  v25 = objc_msgSend(v24, sel_initWithSelection_result_cardSection_, v23, v33, v18);
  if (v25)
  {
    v26 = v25;
    v27 = objc_msgSend(v1[3], sel_feedbackDelegate);
    if (v27)
    {
      v28 = v27;
      v29 = objc_msgSend(v27, sel_respondsToSelector_, sel_didReportUserResponseFeedback_);
      v30 = v31[0];
      if ((v29 & 1) != 0)
        objc_msgSend(v28, sel_didReportUserResponseFeedback_, v26);
      swift_unknownObjectRelease();
      sub_1DADEAA54((uint64_t)v5);
      sub_1DAE0CB28();

      (*(void (**)(char *, uint64_t))(v32 + 8))(v5, v30);
    }
    else
    {
      __break(1u);
    }
  }
  else
  {

  }
}

uint64_t sub_1DADE96A8@<X0>(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;

  v3 = (_QWORD *)(a1 + *(int *)(__swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0) + 28));
  v4 = v3[1];
  *a2 = *v3;
  a2[1] = v4;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DADE96E4()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADE2638;
  return sub_1DADE972C();
}

uint64_t sub_1DADE972C()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t v2;

  v1[16] = v0;
  type metadata accessor for SearchUIUserReportModel();
  v1[17] = swift_task_alloc();
  sub_1DAE0D62C();
  v1[18] = sub_1DAE0D620();
  v1[19] = sub_1DAE0D608();
  v1[20] = v2;
  return swift_task_switch();
}

uint64_t sub_1DADE97B8()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  _QWORD *v5;

  v1 = objc_msgSend(**(id **)(v0 + 128), sel_identifyingResult);
  *(_QWORD *)(v0 + 168) = v1;
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(*(_QWORD *)(v0 + 128) + 16);
    *(_QWORD *)(v0 + 56) = v0 + 120;
    *(_QWORD *)(v0 + 16) = v0;
    *(_QWORD *)(v0 + 24) = sub_1DADE98B0;
    v4 = swift_continuation_init();
    *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
    v5 = (_QWORD *)(v0 + 80);
    v5[1] = 0x40000000;
    v5[2] = sub_1DADE9990;
    v5[3] = &block_descriptor;
    v5[4] = v4;
    objc_msgSend(v3, sel_fetchPreviewImageForResult_completion_, v2, v5);
    return swift_continuation_await();
  }
  else
  {
    swift_release();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1DADE98B0()
{
  return swift_task_switch();
}

uint64_t sub_1DADE98F4()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;

  v1 = *(void **)(v0 + 168);
  v2 = *(_QWORD *)(v0 + 136);
  swift_release();
  v3 = *(_QWORD *)(v0 + 120);
  type metadata accessor for SearchUIUserReportRequestView();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  sub_1DAE0D044();

  *(_QWORD *)(v2 + 8) = v3;
  sub_1DAE0D050();

  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADE9990(uint64_t a1, void *a2)
{
  uint64_t v2;
  uint64_t v3;
  id v4;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v6 = a2;
  v3 = *(_QWORD *)(*(_QWORD *)(v2 + 64) + 40);
  v4 = a2;
  sub_1DADE9D90((uint64_t)&v6, v3, &qword_1F029DE30);
  return swift_continuation_resume();
}

uint64_t sub_1DADE99E0()
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DD88);
  sub_1DADE9A40();
  return sub_1DAE0CBB8();
}

uint64_t sub_1DADE9A38@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADE7BC0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1DADE9A40()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD v4[8];

  result = qword_1F029DD90;
  if (!qword_1F029DD90)
  {
    v3 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DD88);
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DD98);
    v2 = __swift_instantiateConcreteTypeFromMangledNameAbstract((uint64_t *)&unk_1F029DCB0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DDA0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DDA8);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DDB0);
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DDB8);
    sub_1DAE0CDC8();
    sub_1DADDD9BC((unint64_t *)&unk_1F029DDC0, &qword_1F029DDB8, MEMORY[0x1E0CDD950]);
    swift_getOpaqueTypeConformance2();
    sub_1DADE63A4();
    swift_getOpaqueTypeConformance2();
    sub_1DADDD9BC(&qword_1F029DDD0, &qword_1F029DDA8, MEMORY[0x1E0CDB5C0]);
    v4[2] = v1;
    v4[3] = v2;
    v4[4] = &type metadata for SearchUIPrivacyView;
    v4[5] = swift_getOpaqueTypeConformance2();
    v4[6] = sub_1DADDD9BC(&qword_1F029DDD8, (uint64_t *)&unk_1F029DCB0, (uint64_t)&unk_1DAE1EEF8);
    v4[7] = sub_1DADE9C2C();
    v4[0] = swift_getOpaqueTypeConformance2();
    v4[1] = sub_1DADE9C70();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v3, v4);
    atomic_store(result, (unint64_t *)&qword_1F029DD90);
  }
  return result;
}

unint64_t sub_1DADE9C2C()
{
  unint64_t result;

  result = qword_1F029DDE0;
  if (!qword_1F029DDE0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F62C, &type metadata for SearchUIPrivacyView);
    atomic_store(result, (unint64_t *)&qword_1F029DDE0);
  }
  return result;
}

unint64_t sub_1DADE9C70()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029DDE8;
  if (!qword_1F029DDE8)
  {
    v1 = sub_1DAE0CB64();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9158], v1);
    atomic_store(result, (unint64_t *)&qword_1F029DDE8);
  }
  return result;
}

void sub_1DADE9CB8(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1DADE840C(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1DADE9CC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADE8B90(*(_QWORD *)(v1 + 16), a1);
}

uint64_t sub_1DADE9CCC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SearchUIUserReportRequestView();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADE9D10()
{
  uint64_t v0;
  _QWORD *v1;
  _QWORD *v2;

  type metadata accessor for SearchUIUserReportRequestView();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADDA484;
  v2 = (_QWORD *)swift_task_alloc();
  v1[2] = v2;
  *v2 = v1;
  v2[1] = sub_1DADE2638;
  return sub_1DADE972C();
}

uint64_t sub_1DADE9D90(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 32))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADE9DD4()
{
  uint64_t v0;

  return sub_1DADE8DE8(*(_QWORD *)(v0 + 16));
}

uint64_t sub_1DADE9DDC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADE8FF0(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1DADE9DE4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029DE70;
  if (!qword_1F029DE70)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DE68);
    v2[0] = sub_1DADDD9BC(&qword_1F029DE58, &qword_1F029DE50, MEMORY[0x1E0CDFA58]);
    v2[1] = sub_1DADDD9BC(&qword_1F029DE78, (uint64_t *)&unk_1F029DE80, MEMORY[0x1E0CDD0D8]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029DE70);
  }
  return result;
}

uint64_t sub_1DADE9E84()
{
  return sub_1DADEA15C((uint64_t (*)(void))sub_1DADE939C);
}

uint64_t sub_1DADE9E90(uint64_t a1, uint64_t a2, uint64_t (*a3)(_QWORD))
{
  uint64_t v5;

  v5 = a3(0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

uint64_t sub_1DADE9ED4@<X0>(_BYTE *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0CC84();
  *a1 = result & 1;
  return result;
}

uint64_t sub_1DADE9F00()
{
  return sub_1DAE0CC90();
}

uint64_t sub_1DADE9F24()
{
  return swift_deallocObject();
}

_BYTE *sub_1DADE9F34(_BYTE *result)
{
  uint64_t v1;

  *result &= ~*(_BYTE *)(v1 + 16) & 1;
  return result;
}

uint64_t sub_1DADE9F50()
{
  type metadata accessor for SearchUIUserReportRequestView();
  return sub_1DADE8F58();
}

uint64_t sub_1DADE9F7C(uint64_t a1, uint64_t (*a2)(_QWORD))
{
  uint64_t v3;

  v3 = a2(0);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 8))(a1, v3);
  return a1;
}

uint64_t objectdestroyTm()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  id *v3;
  id *v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;

  v1 = type metadata accessor for SearchUIUserReportRequestView();
  v2 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  v3 = (id *)(v0 + ((v2 + 16) & ~v2));

  swift_unknownObjectRelease();
  v4 = (id *)((char *)v3 + *(int *)(v1 + 32));

  v5 = (char *)v4 + *(int *)(type metadata accessor for SearchUIUserReportModel() + 24);
  v6 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029DCB0);
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v6 - 8) + 48))(v5, 1, v6))
  {
    v7 = sub_1DAE0C7EC();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v7 - 8) + 8))(v5, v7);
    swift_bridgeObjectRelease();
  }
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  swift_release();
  v8 = (char *)v3 + *(int *)(v1 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v9 = sub_1DAE0CB34();
    (*(void (**)(char *, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(v8, v9);
  }
  else
  {
    swift_release();
  }
  return swift_deallocObject();
}

uint64_t sub_1DADEA150()
{
  return sub_1DADEA15C((uint64_t (*)(void))sub_1DADE88C8);
}

uint64_t sub_1DADEA15C(uint64_t (*a1)(void))
{
  type metadata accessor for SearchUIUserReportRequestView();
  return a1();
}

uint64_t sub_1DADEA198(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADEA1E0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DB40);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 40))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADEA228()
{
  return sub_1DADDD9BC(&qword_1F029DE90, &qword_1F029DE98, MEMORY[0x1E0CD9C70]);
}

void SearchUIAppearance.Style.color(for:)(id a1)
{
  uint64_t *v1;
  uint64_t v3;

  v3 = *v1;
  if (*((_BYTE *)v1 + 8))
  {
    if (*((_BYTE *)v1 + 8) != 1)
      goto LABEL_7;
    if (objc_msgSend(a1, sel_buttonColorForProminence_, v3))
      goto LABEL_10;
    __break(1u);
  }
  if (objc_msgSend(a1, sel_colorForProminence_, v3))
    goto LABEL_10;
  __break(1u);
LABEL_7:
  if (!objc_msgSend((id)objc_opt_self(), sel_separatorColorForAppearance_, a1))
    __break(1u);
LABEL_10:
  JUMPOUT(0x1DF0A76FCLL);
}

uint64_t SearchUIAppearance.style.getter@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t result;
  uint64_t *v4;
  uint64_t v5;

  result = type metadata accessor for SearchUIAppearance();
  v4 = (uint64_t *)(v1 + *(int *)(result + 24));
  v5 = *v4;
  LOBYTE(v4) = *((_BYTE *)v4 + 8);
  *(_QWORD *)a1 = v5;
  *(_BYTE *)(a1 + 8) = (_BYTE)v4;
  return result;
}

uint64_t type metadata accessor for SearchUIAppearance()
{
  uint64_t result;

  result = qword_1F029B6F8;
  if (!qword_1F029B6F8)
    return swift_getSingletonMetadata();
  return result;
}

id sub_1DADEA368()
{
  uint64_t v0;
  uint64_t (*v1)(void);
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char *v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  _BOOL8 v12;
  char v13;
  void (*v14)(char *, uint64_t);
  id result;
  uint64_t v16;

  v0 = sub_1DAE0CAC8();
  v1 = MEMORY[0x1E0CD86F8];
  v2 = *(_QWORD *)(v0 - 8);
  v3 = MEMORY[0x1E0C80A78](v0);
  v5 = (char *)&v16 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v7 = (char *)&v16 - v6;
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for SearchUIAppearance();
  sub_1DADEACC0((uint64_t)v10);
  v11 = sub_1DAE0D0F8();
  v12 = (*(unsigned int (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v11 - 8) + 48))(v10, 1, v11) != 1;
  sub_1DADDCC3C((uint64_t)v10, &qword_1F029B408);
  sub_1DADEAA88(&qword_1F029B348, (uint64_t (*)(_QWORD))v1, 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v7);
  (*(void (**)(char *, _QWORD, uint64_t))(v2 + 104))(v5, *MEMORY[0x1E0CD86D0], v0);
  v13 = sub_1DAE0CABC();
  v14 = *(void (**)(char *, uint64_t))(v2 + 8);
  v14(v5, v0);
  v14(v7, v0);
  result = objc_msgSend((id)objc_opt_self(), sel_appearanceWithVibrancyEnabled_isDark_, v12, v13 & 1);
  if (!result)
    __break(1u);
  return result;
}

id SearchUIAppearance.body(content:)@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  int v23;
  id v24;
  void *v25;
  id result;
  uint64_t v27;
  uint64_t v28;
  char v29;
  void (*v30)(char *, uint64_t);
  unsigned int *v31;
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

  v41 = a2;
  v4 = sub_1DAE0CAC8();
  v38 = *(_QWORD *)(v4 - 8);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v34 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v34 - v8;
  v10 = sub_1DAE0D110();
  v39 = *(_QWORD *)(v10 - 8);
  v40 = v10;
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v34 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B600);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v34 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  v35 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B640);
  MEMORY[0x1E0C80A78](v35);
  v17 = (char *)&v34 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B670);
  MEMORY[0x1E0C80A78](v36);
  v19 = (char *)&v34 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v20 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6A0);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v20 - 8) + 16))(v15, a1, v20);
  v21 = (uint64_t *)(v2 + *(int *)(type metadata accessor for SearchUIAppearance() + 24));
  v22 = *v21;
  v23 = *((unsigned __int8 *)v21 + 8);
  v37 = v2;
  v24 = sub_1DADEA368();
  v25 = v24;
  if (!v23)
  {
LABEL_5:
    if (objc_msgSend(v25, sel_colorForProminence_, v22))
      goto LABEL_8;
    __break(1u);
    goto LABEL_7;
  }
  if (v23 == 1)
  {
    if (objc_msgSend(v24, sel_buttonColorForProminence_, v22))
      goto LABEL_8;
    __break(1u);
    goto LABEL_5;
  }
LABEL_7:
  result = objc_msgSend((id)objc_opt_self(), sel_separatorColorForAppearance_, v25);
  if (!result)
  {
    __break(1u);
    return result;
  }
LABEL_8:
  v27 = MEMORY[0x1DF0A76FC]();

  sub_1DADEC1E0((uint64_t)v15, (uint64_t)v17, &qword_1F029B600);
  *(_QWORD *)&v17[*(int *)(v35 + 36)] = v27;
  sub_1DADDCC3C((uint64_t)v15, &qword_1F029B600);
  sub_1DADEAA88(&qword_1F029B348, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD86F8], 0x686353726F6C6F43, 0xEB00000000656D65, (uint64_t)v9);
  v28 = v38;
  (*(void (**)(char *, _QWORD, uint64_t))(v38 + 104))(v7, *MEMORY[0x1E0CD86D0], v4);
  v29 = sub_1DAE0CABC();
  v30 = *(void (**)(char *, uint64_t))(v28 + 8);
  v30(v7, v4);
  v30(v9, v4);
  v31 = (unsigned int *)MEMORY[0x1E0CE0368];
  v33 = v39;
  v32 = v40;
  if ((v29 & 1) == 0)
    v31 = (unsigned int *)MEMORY[0x1E0CE0350];
  (*(void (**)(char *, _QWORD, uint64_t))(v39 + 104))(v12, *v31, v40);
  (*(void (**)(char *, char *, uint64_t))(v33 + 16))(&v19[*(int *)(v36 + 36)], v12, v32);
  sub_1DADEC1E0((uint64_t)v17, (uint64_t)v19, &qword_1F029B640);
  (*(void (**)(char *, uint64_t))(v33 + 8))(v12, v32);
  sub_1DADDCC3C((uint64_t)v17, &qword_1F029B640);
  return (id)sub_1DADE9D90((uint64_t)v19, v41, &qword_1F029B670);
}

uint64_t sub_1DADEA8E4()
{
  return sub_1DAE0CB10();
}

uint64_t View.searchUIAppearance(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DADEAA2C(a1, a2, a3, 0);
}

uint64_t View.searchUIAppearance(_:)(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;
  uint64_t *v11;
  char *v12;
  uint64_t v14;

  v6 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1E0C80A78](v6);
  v8 = (uint64_t *)((char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = *a1;
  v10 = *((_BYTE *)a1 + 8);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  swift_storeEnumTagMultiPayload();
  v11 = (uint64_t *)((char *)v8 + *(int *)(v6 + 20));
  *v11 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  swift_storeEnumTagMultiPayload();
  v12 = (char *)v8 + *(int *)(v6 + 24);
  *(_QWORD *)v12 = v9;
  v12[8] = v10;
  MEMORY[0x1DF0A76E4](v8, a2, v6, a3);
  return sub_1DADEB260((uint64_t)v8);
}

uint64_t View.searchUIButtonAppearance(_:)(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return sub_1DADEAA2C(a1, a2, a3, 1);
}

uint64_t sub_1DADEAA2C(uint64_t a1, uint64_t a2, uint64_t a3, char a4)
{
  uint64_t v5;
  char v6;

  v5 = a1;
  v6 = a4;
  return View.searchUIAppearance(_:)(&v5, a2, a3);
}

uint64_t sub_1DADEAA54@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADEAA88(&qword_1F029DCC8, (uint64_t (*)(_QWORD))MEMORY[0x1E0CD8E80], 0x417373696D736944, 0xED00006E6F697463, a1);
}

uint64_t sub_1DADEAA88@<X0>(uint64_t *a1@<X0>, uint64_t (*a2)(_QWORD)@<X1>, uint64_t a3@<X2>, unint64_t a4@<X3>, uint64_t a5@<X8>)
{
  uint64_t v5;
  uint64_t v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  char *v17;
  uint64_t v18;
  os_log_type_t v20;
  NSObject *v21;
  uint64_t v22;
  uint8_t *v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;

  v28 = a3;
  v9 = v5;
  v11 = sub_1DAE0CCC0();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  v14 = (char *)&v25 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = __swift_instantiateConcreteTypeFromMangledName(a1);
  MEMORY[0x1E0C80A78](v15);
  v17 = (char *)&v25 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADEC1E0(v9, (uint64_t)v17, a1);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v18 = a2(0);
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(*(_QWORD *)(v18 - 8) + 32))(a5, v17, v18);
  }
  else
  {
    v20 = sub_1DAE0D6D4();
    v21 = sub_1DAE0CEA0();
    if (os_log_type_enabled(v21, v20))
    {
      v26 = a4;
      v22 = swift_slowAlloc();
      v27 = a5;
      v23 = (uint8_t *)v22;
      v24 = swift_slowAlloc();
      v30 = v24;
      *(_DWORD *)v23 = 136315138;
      v29 = sub_1DADDC540(v28, v26, &v30);
      sub_1DAE0D71C();
      _os_log_impl(&dword_1DAD39000, v21, v20, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v23, 0xCu);
      swift_arrayDestroy();
      MEMORY[0x1DF0A8B9C](v24, -1, -1);
      MEMORY[0x1DF0A8B9C](v23, -1, -1);
    }

    sub_1DAE0CCB4();
    swift_getAtKeyPath();
    swift_release();
    return (*(uint64_t (**)(char *, uint64_t))(v12 + 8))(v14, v11);
  }
}

uint64_t sub_1DADEACC0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  os_log_type_t v12;
  NSObject *v13;
  os_log_type_t v14;
  uint8_t *v15;
  uint64_t v16;
  uint64_t v17;
  _QWORD v18[3];
  uint64_t v19;

  v2 = v1;
  v4 = sub_1DAE0CCC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)v18 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADEC1E0(v2, (uint64_t)v10, &qword_1F029B358);
  if (swift_getEnumCaseMultiPayload() == 1)
    return sub_1DADE9D90((uint64_t)v10, a1, &qword_1F029B408);
  v12 = sub_1DAE0D6D4();
  v13 = sub_1DAE0CEA0();
  v14 = v12;
  if (os_log_type_enabled(v13, v12))
  {
    v15 = (uint8_t *)swift_slowAlloc();
    v16 = swift_slowAlloc();
    v18[1] = a1;
    v17 = v16;
    v19 = v16;
    *(_DWORD *)v15 = 136315138;
    v18[2] = sub_1DADDC540(0xD000000000000012, 0x80000001DAE236F0, &v19);
    sub_1DAE0D71C();
    _os_log_impl(&dword_1DAD39000, v13, v14, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v15, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A8B9C](v17, -1, -1);
    MEMORY[0x1DF0A8B9C](v15, -1, -1);
  }

  sub_1DAE0CCB4();
  swift_getAtKeyPath();
  swift_release();
  return (*(uint64_t (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

uint64_t sub_1DADEAEF0@<X0>(uint64_t a1@<X8>)
{
  return sub_1DADEAA88(&qword_1F029B508, (uint64_t (*)(_QWORD))MEMORY[0x1E0CDB388], 0xD000000000000013, 0x80000001DAE23710, a1);
}

double sub_1DADEAF1C(uint64_t a1, char a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  os_log_type_t v8;
  NSObject *v9;
  os_log_type_t v10;
  uint8_t *v11;
  uint64_t v12;
  uint64_t v14;
  double v15;

  v4 = sub_1DAE0CCC0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if ((a2 & 1) != 0)
    return *(double *)&a1;
  sub_1DAE0C564();
  v8 = sub_1DAE0D6D4();
  v9 = sub_1DAE0CEA0();
  v10 = v8;
  if (os_log_type_enabled(v9, v8))
  {
    v11 = (uint8_t *)swift_slowAlloc();
    v12 = swift_slowAlloc();
    v15 = *(double *)&v12;
    *(_DWORD *)v11 = 136315138;
    v14 = sub_1DADDC540(0x74616F6C464743, 0xE700000000000000, (uint64_t *)&v15);
    sub_1DAE0D71C();
    _os_log_impl(&dword_1DAD39000, v9, v10, "Accessing Environment<%s>'s value outside of being installed on a View. This will always read the default value and will not update.", v11, 0xCu);
    swift_arrayDestroy();
    MEMORY[0x1DF0A8B9C](v12, -1, -1);
    MEMORY[0x1DF0A8B9C](v11, -1, -1);
  }

  sub_1DAE0CCB4();
  swift_getAtKeyPath();
  sub_1DADEC1D4(a1, 0);
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  return v15;
}

uint64_t sub_1DADEB0DC()
{
  return sub_1DAE0CBDC();
}

uint64_t sub_1DADEB0FC()
{
  return sub_1DAE0CBDC();
}

uint64_t sub_1DADEB11C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DAE0CAC8();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t))(v4 + 16))((char *)&v6 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), a1);
  return sub_1DAE0CBE8();
}

uint64_t sub_1DADEB19C()
{
  return sub_1DAE0CC30();
}

uint64_t sub_1DADEB1BC()
{
  return sub_1DAE0CC30();
}

uint64_t sub_1DADEB1DC(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
  MEMORY[0x1E0C80A78](v2);
  sub_1DADEC1E0(a1, (uint64_t)&v5 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0), &qword_1F029B408);
  return sub_1DAE0CC3C();
}

uint64_t sub_1DADEB260(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADEB29C()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t *initializeBufferWithCopyOfBuffer for SearchUIAppearance(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v8 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v8 + ((v5 + 16) & ~(unint64_t)v5));
    sub_1DAE0C564();
  }
  else
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_1DAE0CAC8();
      (*(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v7 - 8) + 16))(a1, a2, v7);
    }
    else
    {
      *a1 = *a2;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
    v9 = *(int *)(a3 + 20);
    v10 = (uint64_t *)((char *)a1 + v9);
    v11 = (uint64_t *)((char *)a2 + v9);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_1DAE0D0F8();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v13 + 48))(v11, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
        memcpy(v10, v11, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v13 + 16))(v10, v11, v12);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v10, 0, 1, v12);
      }
    }
    else
    {
      *v10 = *v11;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
    v15 = *(int *)(a3 + 24);
    v16 = (char *)a1 + v15;
    v17 = (char *)a2 + v15;
    *(_QWORD *)v16 = *(_QWORD *)v17;
    v16[8] = v17[8];
  }
  return a1;
}

uint64_t destroy for SearchUIAppearance(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v4 = sub_1DAE0CAC8();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 8))(a1, v4);
  }
  else
  {
    swift_release();
  }
  v5 = a1 + *(int *)(a2 + 20);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  if (swift_getEnumCaseMultiPayload() != 1)
    return swift_release();
  v6 = sub_1DAE0D0F8();
  v7 = *(_QWORD *)(v6 - 8);
  result = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6);
  if (!(_DWORD)result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  return result;
}

_QWORD *initializeWithCopy for SearchUIAppearance(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v6 = sub_1DAE0CAC8();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
  }
  else
  {
    *a1 = *a2;
    sub_1DAE0C564();
  }
  swift_storeEnumTagMultiPayload();
  v7 = *(int *)(a3 + 20);
  v8 = (_QWORD *)((char *)a1 + v7);
  v9 = (_QWORD *)((char *)a2 + v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v10 = sub_1DAE0D0F8();
    v11 = *(_QWORD *)(v10 - 8);
    if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
    {
      v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
      memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
    }
    else
    {
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v11 + 16))(v8, v9, v10);
      (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
    }
  }
  else
  {
    *v8 = *v9;
    sub_1DAE0C564();
  }
  swift_storeEnumTagMultiPayload();
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  *(_QWORD *)v14 = *(_QWORD *)v15;
  v14[8] = v15[8];
  return a1;
}

_QWORD *assignWithCopy for SearchUIAppearance(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  char *v15;
  uint64_t v16;

  if (a1 != a2)
  {
    sub_1DADDCC3C((uint64_t)a1, &qword_1F029B348);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v6 = sub_1DAE0CAC8();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v6 - 8) + 16))(a1, a2, v6);
    }
    else
    {
      *a1 = *a2;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
    v7 = *(int *)(a3 + 20);
    v8 = (_QWORD *)((char *)a1 + v7);
    v9 = (_QWORD *)((char *)a2 + v7);
    sub_1DADDCC3C((uint64_t)a1 + v7, &qword_1F029B358);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v10 = sub_1DAE0D0F8();
      v11 = *(_QWORD *)(v10 - 8);
      if ((*(unsigned int (**)(_QWORD *, uint64_t, uint64_t))(v11 + 48))(v9, 1, v10))
      {
        v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
        memcpy(v8, v9, *(_QWORD *)(*(_QWORD *)(v12 - 8) + 64));
      }
      else
      {
        (*(void (**)(_QWORD *, _QWORD *, uint64_t))(v11 + 16))(v8, v9, v10);
        (*(void (**)(_QWORD *, _QWORD, uint64_t, uint64_t))(v11 + 56))(v8, 0, 1, v10);
      }
    }
    else
    {
      *v8 = *v9;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = *(int *)(a3 + 24);
  v14 = (char *)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *(_QWORD *)v15;
  v14[8] = v15[8];
  *(_QWORD *)v14 = v16;
  return a1;
}

char *initializeWithTake for SearchUIAppearance(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v7 = sub_1DAE0CAC8();
    (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
  }
  v8 = *(int *)(a3 + 20);
  v9 = &a1[v8];
  v10 = &a2[v8];
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_1DAE0D0F8();
    v13 = *(_QWORD *)(v12 - 8);
    if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
    {
      v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
    else
    {
      (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
      (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
    }
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  return a1;
}

char *assignWithTake for SearchUIAppearance(char *a1, char *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  char *v17;

  if (a1 != a2)
  {
    sub_1DADDCC3C((uint64_t)a1, &qword_1F029B348);
    v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v7 = sub_1DAE0CAC8();
      (*(void (**)(char *, char *, uint64_t))(*(_QWORD *)(v7 - 8) + 32))(a1, a2, v7);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(a1, a2, *(_QWORD *)(*(_QWORD *)(v6 - 8) + 64));
    }
    v8 = *(int *)(a3 + 20);
    v9 = &a1[v8];
    v10 = &a2[v8];
    sub_1DADDCC3C((uint64_t)&a1[v8], &qword_1F029B358);
    v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_1DAE0D0F8();
      v13 = *(_QWORD *)(v12 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v13 + 48))(v10, 1, v12))
      {
        v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B408);
        memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
      }
      else
      {
        (*(void (**)(char *, char *, uint64_t))(v13 + 32))(v9, v10, v12);
        (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v9, 0, 1, v12);
      }
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
    }
  }
  v15 = *(int *)(a3 + 24);
  v16 = &a1[v15];
  v17 = &a2[v15];
  *(_QWORD *)v16 = *(_QWORD *)v17;
  v16[8] = v17[8];
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIAppearance()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADEBC34(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, uint64_t);
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v14;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DEA0);
  v7 = *(_QWORD *)(v6 - 8);
  if (*(_DWORD *)(v7 + 84) == (_DWORD)a2)
  {
    v8 = v6;
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48);
    v10 = a1;
    return v9(v10, a2, v8);
  }
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DEA8);
  v12 = *(_QWORD *)(v11 - 8);
  if (*(_DWORD *)(v12 + 84) == (_DWORD)a2)
  {
    v8 = v11;
    v10 = a1 + *(int *)(a3 + 20);
    v9 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v12 + 48);
    return v9(v10, a2, v8);
  }
  v14 = *(unsigned __int8 *)(a1 + *(int *)(a3 + 24) + 8);
  if (v14 > 2)
    return (v14 ^ 0xFF) + 1;
  else
    return 0;
}

uint64_t storeEnumTagSinglePayload for SearchUIAppearance()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADEBCF0(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t, uint64_t, uint64_t);
  uint64_t v12;
  uint64_t result;
  uint64_t v14;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DEA0);
  v9 = *(_QWORD *)(v8 - 8);
  if (*(_DWORD *)(v9 + 84) == a3)
  {
    v10 = v8;
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v9 + 56);
    v12 = a1;
    return v11(v12, a2, a2, v10);
  }
  result = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DEA8);
  v14 = *(_QWORD *)(result - 8);
  if (*(_DWORD *)(v14 + 84) == a3)
  {
    v10 = result;
    v12 = a1 + *(int *)(a4 + 20);
    v11 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v14 + 56);
    return v11(v12, a2, a2, v10);
  }
  *(_BYTE *)(a1 + *(int *)(a4 + 24) + 8) = -(char)a2;
  return result;
}

void sub_1DADEBDA0()
{
  unint64_t v0;
  unint64_t v1;

  sub_1DADEBE2C();
  if (v0 <= 0x3F)
  {
    sub_1DADEBE80();
    if (v1 <= 0x3F)
      swift_initStructMetadata();
  }
}

void sub_1DADEBE2C()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F029B350)
  {
    sub_1DAE0CAC8();
    v0 = sub_1DAE0CAD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F029B350);
  }
}

void sub_1DADEBE80()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1F029B360)
  {
    __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B408);
    v0 = sub_1DAE0CAD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1F029B360);
  }
}

uint64_t __swift_memcpy9_8(uint64_t result, uint64_t *a2)
{
  uint64_t v2;

  v2 = *a2;
  *(_BYTE *)(result + 8) = *((_BYTE *)a2 + 8);
  *(_QWORD *)result = v2;
  return result;
}

uint64_t getEnumTagSinglePayload for SearchUIAppearance.Style(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFE && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 254);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 2)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIAppearance.Style(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFD)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 254;
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFE)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

uint64_t sub_1DADEBF78(uint64_t a1)
{
  if (*(unsigned __int8 *)(a1 + 8) <= 1u)
    return *(unsigned __int8 *)(a1 + 8);
  else
    return (*(_DWORD *)a1 + 2);
}

uint64_t sub_1DADEBF90(uint64_t result, unsigned int a2)
{
  if (a2 >= 2)
  {
    *(_QWORD *)result = a2 - 2;
    LOBYTE(a2) = 2;
  }
  *(_BYTE *)(result + 8) = a2;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppearance.Style()
{
  return &type metadata for SearchUIAppearance.Style;
}

unint64_t sub_1DADEBFBC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B668;
  if (!qword_1F029B668)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B670);
    v2[0] = sub_1DADEC028();
    v2[1] = MEMORY[0x1E0CDA1C0];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B668);
  }
  return result;
}

unint64_t sub_1DADEC028()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B638;
  if (!qword_1F029B638)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B640);
    v2[0] = sub_1DADEC0AC();
    v2[1] = sub_1DADDD9BC(&qword_1F029B3A8, &qword_1F029B3B0, MEMORY[0x1E0CDC718]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B638);
  }
  return result;
}

unint64_t sub_1DADEC0AC()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B5F8;
  if (!qword_1F029B5F8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B600);
    v2[0] = sub_1DADDD9BC(&qword_1F029B698, &qword_1F029B6A0, MEMORY[0x1E0CDBF10]);
    v2[1] = MEMORY[0x1E0CDC4A8];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B5F8);
  }
  return result;
}

uint64_t sub_1DADEC130(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD v4[2];

  v1 = *(_QWORD *)(a1 + 8);
  type metadata accessor for SearchUIAppearance();
  v2 = sub_1DAE0CBAC();
  v4[0] = v1;
  v4[1] = sub_1DADEC18C();
  return MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v2, v4);
}

unint64_t sub_1DADEC18C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B6F0;
  if (!qword_1F029B6F0)
  {
    v1 = type metadata accessor for SearchUIAppearance();
    result = MEMORY[0x1DF0A8B00](&protocol conformance descriptor for SearchUIAppearance, v1);
    atomic_store(result, (unint64_t *)&qword_1F029B6F0);
  }
  return result;
}

uint64_t sub_1DADEC1D4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return swift_release();
  return result;
}

uint64_t sub_1DADEC1E0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;

  v5 = __swift_instantiateConcreteTypeFromMangledName(a3);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a2, a1, v5);
  return a2;
}

unint64_t sub_1DADEC228()
{
  unint64_t result;

  result = qword_1F029DEB0;
  if (!qword_1F029DEB0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E610, &type metadata for SearchUIOpenKnowledgeIntent);
    atomic_store(result, (unint64_t *)&qword_1F029DEB0);
  }
  return result;
}

unint64_t sub_1DADEC270()
{
  unint64_t result;

  result = qword_1F029DEB8;
  if (!qword_1F029DEB8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E638, &type metadata for SearchUIOpenKnowledgeIntent);
    atomic_store(result, (unint64_t *)&qword_1F029DEB8);
  }
  return result;
}

uint64_t sub_1DADEC2B4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEC2C4()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADEC2D4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v9;

  v0 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v0);
  v1 = sub_1DAE0C744();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DAE0C75C();
  __swift_allocate_value_buffer(v6, qword_1F02A03C0);
  __swift_project_value_buffer(v6, (uint64_t)qword_1F02A03C0);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v7 = __swift_project_value_buffer(v1, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v2 + 16))(v4, v7, v1);
  sub_1DAE0C804();
  return sub_1DAE0C768();
}

uint64_t sub_1DADEC484@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;
  _BYTE *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _BYTE *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _BYTE v16[16];

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v2);
  v4 = &v16[-((v3 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v5 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v5);
  v6 = sub_1DAE0C744();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = &v16[-((v8 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v10 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1DAE0C75C();
  v12 = *(_QWORD *)(v11 - 8);
  MEMORY[0x1E0C80A78](v11);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v6, (uint64_t)qword_1F02A0400);
  (*(void (**)(_BYTE *, uint64_t, uint64_t))(v7 + 16))(v9, v13, v6);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(_BYTE *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v4, 1, 1, v11);
  sub_1DAE0C654();
  v14 = sub_1DAE0C648();
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v14 - 8) + 56))(a1, 0, 1, v14);
}

__n128 sub_1DADEC6D8@<Q0>(__n128 *a1@<X8>)
{
  __n128 result;
  unint64_t v3;
  unint64_t v4;
  __n128 v5;
  unint64_t v6;

  sub_1DAE0C534();
  result = v5;
  a1->n128_u64[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1] = v5;
  a1[2].n128_u64[0] = v6;
  return result;
}

uint64_t sub_1DADEC720(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v3;

  v3[9] = a2;
  v3[10] = a3;
  v3[8] = a1;
  return swift_task_switch();
}

uint64_t sub_1DADEC73C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD *v5;
  char *v7;

  sub_1DAE0C45C();
  v0[11] = v0[7];
  sub_1DAE0C534();
  v2 = v0[2];
  v1 = v0[3];
  v3 = v0[5];
  v4 = v0[6];
  v0[12] = v1;
  v0[13] = v3;
  v0[14] = v4;
  v7 = (char *)&dword_1F029DEF0 + dword_1F029DEF0;
  v5 = (_QWORD *)swift_task_alloc();
  v0[15] = v5;
  *v5 = v0;
  v5[1] = sub_1DADEC7E4;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD))v7)(v2, v1, 0);
}

uint64_t sub_1DADEC7E4()
{
  uint64_t v0;
  uint64_t *v1;
  void *v2;
  uint64_t v3;

  v2 = *(void **)(*v1 + 88);
  v3 = *v1;
  swift_task_dealloc();

  swift_bridgeObjectRelease();
  swift_release();
  swift_bridgeObjectRelease();
  if (v0)
    return (*(uint64_t (**)(void))(v3 + 8))();
  else
    return swift_task_switch();
}

uint64_t sub_1DADEC88C()
{
  uint64_t v0;

  sub_1DAE0C504();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADEC8C0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F029D6C8 != -1)
    swift_once();
  v2 = sub_1DAE0C75C();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02A03C0);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DADEC930()
{
  uint64_t v0;
  uint64_t v1;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DEF8);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DF00);
  MEMORY[0x1E0C80A78](v1);
  sub_1DAE0C6D8();
  sub_1DAE0C6CC();
  swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DF08);
  sub_1DAE0C6C0();
  swift_release();
  sub_1DAE0C6CC();
  sub_1DAE0C6E4();
  return sub_1DAE0C6B4();
}

uint64_t sub_1DADECA9C(uint64_t a1)
{
  _OWORD *v1;
  uint64_t v2;
  uint64_t v4;

  v4 = swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *(_QWORD *)v4 = v2;
  *(_QWORD *)(v4 + 8) = sub_1DADDA484;
  *(_OWORD *)(v4 + 72) = *v1;
  *(_QWORD *)(v4 + 64) = a1;
  return swift_task_switch();
}

uint64_t sub_1DADECB04@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DADECE7C();
  *a1 = result;
  a1[1] = v3;
  return result;
}

uint64_t sub_1DADECB28()
{
  sub_1DADED310();
  return sub_1DAE0C4D4();
}

ValueMetadata *type metadata accessor for SearchUIOpenKnowledgeIntent()
{
  return &type metadata for SearchUIOpenKnowledgeIntent;
}

uint64_t sub_1DADECB60()
{
  return sub_1DADDD9BC(&qword_1F029DEC8, &qword_1F029DED0, MEMORY[0x1E0C916B0]);
}

uint64_t sub_1DADECB8C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1DAE0D62C();
  v4[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DADECBFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  _QWORD *v4;

  v4[4] = a3;
  v4[5] = v3;
  v4[2] = a1;
  v4[3] = a2;
  sub_1DAE0D62C();
  v4[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

id sub_1DADECC6C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id result;
  void *v16;
  _BYTE *v17;
  _BYTE *v18;
  uint64_t (*v19)(void);

  v1 = v0[5];
  swift_release();
  v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (!MEMORY[0x1DF0A8C44](v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate)
    || (v3 = *(_QWORD *)(v2 + 8),
        ObjectType = swift_getObjectType(),
        v5 = (void *)(*(uint64_t (**)(uint64_t, uint64_t))(v3 + 8))(ObjectType, v3),
        swift_unknownObjectRelease(),
        !v5))
  {
    sub_1DADDA2D0();
    swift_allocError();
    *v17 = 0;
    swift_willThrow();
LABEL_10:
    v19 = (uint64_t (*)(void))v0[1];
    return (id)v19();
  }
  if (!MEMORY[0x1DF0A8C44](v2))
    goto LABEL_9;
  v6 = v0[2];
  v7 = v0[3];
  v8 = *(_QWORD *)(v2 + 8);
  v9 = swift_getObjectType();
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v8 + 16);
  swift_bridgeObjectRetain();
  v11 = (void *)v10(v6, v7, v9, v8);
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  if (!v11)
  {
LABEL_9:
    sub_1DADDA2D0();
    swift_allocError();
    *v18 = 2;
    swift_willThrow();

    goto LABEL_10;
  }
  v12 = (void *)v0[4];
  if (v12)
  {
    v13 = (void *)objc_opt_self();
    v14 = v12;
    result = objc_msgSend(v13, sel_handlerForButton_rowModel_environment_, v14, v11, v5);
    if (result)
    {
      v16 = result;
      objc_msgSend(result, sel_executeWithTriggerEvent_, 13);

LABEL_14:
      v19 = (uint64_t (*)(void))v0[1];
      return (id)v19();
    }
    __break(1u);
  }
  else
  {
    result = objc_msgSend((id)objc_opt_self(), sel_handlerForRowModel_environment_, v11, v5);
    if (result)
    {
      v16 = result;
      objc_msgSend(result, sel_executeWithTriggerEvent_, 13);
      goto LABEL_14;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1DADECE7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(char *, uint64_t, uint64_t);
  uint64_t v19;
  void (*v20)(char *, uint64_t, uint64_t, uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t v24;
  char *v25;
  char *v26;
  uint64_t v27;
  uint64_t v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v0 = sub_1DAE0C6F0();
  v27 = *(_QWORD *)(v0 - 8);
  v28 = v0;
  MEMORY[0x1E0C80A78](v0);
  v29 = (char *)&v24 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D980);
  v3 = MEMORY[0x1E0C80A78](v2);
  v26 = (char *)&v24 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v3);
  v25 = (char *)&v24 - v5;
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v24 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1DAE0C744();
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v24 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v14);
  v15 = sub_1DAE0C75C();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v24 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DED8);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v17 = __swift_project_value_buffer(v10, (uint64_t)qword_1F02A0400);
  v18 = *(void (**)(char *, uint64_t, uint64_t))(v11 + 16);
  v18(v13, v17, v10);
  sub_1DAE0C804();
  sub_1DAE0C768();
  sub_1DAE0D4DC();
  v18(v13, v17, v10);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v16 + 56))(v8, 0, 1, v15);
  v19 = sub_1DAE0C4F8();
  v32 = 0u;
  v33 = 0u;
  v34 = 0;
  v20 = *(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v19 - 8) + 56);
  v20(v25, 1, 1, v19);
  v20(v26, 1, 1, v19);
  (*(void (**)(char *, _QWORD, uint64_t))(v27 + 104))(v29, *MEMORY[0x1E0C91738], v28);
  sub_1DADED2CC();
  v21 = sub_1DAE0C558();
  sub_1DAE0C48C();
  sub_1DAE0C480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D998);
  *(_QWORD *)&v32 = type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  v30 = sub_1DAE0D548();
  v31 = v22;
  sub_1DAE0D740();
  sub_1DAE0C468();
  return v21;
}

unint64_t sub_1DADED2CC()
{
  unint64_t result;

  result = qword_1ED4D4490;
  if (!qword_1ED4D4490)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1EA0C, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4490);
  }
  return result;
}

unint64_t sub_1DADED310()
{
  unint64_t result;

  result = qword_1F029DEE0;
  if (!qword_1F029DEE0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E580, &type metadata for SearchUIOpenKnowledgeIntent);
    atomic_store(result, &qword_1F029DEE0);
  }
  return result;
}

uint64_t sub_1DADED354@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0C54C();
  *a1 = result;
  return result;
}

ValueMetadata *type metadata accessor for SearchUIAppIntentsPackage()
{
  return &type metadata for SearchUIAppIntentsPackage;
}

uint64_t sub_1DADED394(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F029DF20 + dword_1F029DF20);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADDA484;
  return v7(a1, a2);
}

uint64_t sub_1DADED52C(int a1, void *aBlock)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v2[2] = _Block_copy(aBlock);
  v3 = sub_1DAE0D53C();
  v5 = v4;
  v2[3] = v4;
  v8 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F029DF20 + dword_1F029DF20);
  v6 = (_QWORD *)swift_task_alloc();
  v2[4] = v6;
  *v6 = v2;
  v6[1] = sub_1DADED5B4;
  return v8(v3, v5);
}

uint64_t sub_1DADED5B4()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 16);
  if (v0)
  {
    v4 = (void *)sub_1DAE0C72C();

    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 16), 0);
  }
  _Block_release(*(const void **)(v2 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id sub_1DADED654()
{
  id result;

  result = (id)qword_1F02A03D8;
  if (qword_1F02A03D8)
    return objc_msgSend((id)qword_1F02A03D8, sel_play);
  return result;
}

id sub_1DADED68C()
{
  id result;

  result = (id)qword_1F02A03D8;
  if (qword_1F02A03D8)
    return objc_msgSend((id)qword_1F02A03D8, sel_pause);
  return result;
}

id SearchUIVoicemailUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUIVoicemailUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIVoicemailUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIVoicemailUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIVoicemailUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DADED784(uint64_t a1, uint64_t a2)
{
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;

  v2[3] = a1;
  v2[4] = a2;
  v3 = sub_1DAE0C78C();
  v2[5] = v3;
  v2[6] = *(_QWORD *)(v3 - 8);
  v2[7] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DF68);
  v2[8] = swift_task_alloc();
  v4 = sub_1DAE0C7EC();
  v2[9] = v4;
  v2[10] = *(_QWORD *)(v4 - 8);
  v2[11] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADED85C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;

  v1 = *(_QWORD *)(v0 + 72);
  v2 = *(_QWORD *)(v0 + 80);
  v3 = *(_QWORD *)(v0 + 64);
  sub_1DAE0C7D4();
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v3, 1, v1) == 1)
  {
    sub_1DADEDF90(*(_QWORD *)(v0 + 64));
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v6 = *(_QWORD *)(v0 + 80);
    v5 = *(_QWORD *)(v0 + 88);
    v7 = *(_QWORD *)(v0 + 72);
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v6 + 32))(v5, *(_QWORD *)(v0 + 64), v7);
    sub_1DAE0CA44();
    *(_QWORD *)(v0 + 96) = sub_1DAE0CA38();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DF70);
    v8 = (*(unsigned __int8 *)(v6 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v6 + 80);
    v9 = swift_allocObject();
    *(_QWORD *)(v0 + 104) = v9;
    *(_OWORD *)(v9 + 16) = xmmword_1DAE1E030;
    (*(void (**)(unint64_t, uint64_t, uint64_t))(v6 + 16))(v9 + v8, v5, v7);
    v10 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 112) = v10;
    *v10 = v0;
    v10[1] = sub_1DADED9FC;
    return sub_1DAE0CA2C();
  }
}

uint64_t sub_1DADED9FC(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v3;

  v3 = *v2;
  *(_QWORD *)(v3 + 120) = a1;
  *(_QWORD *)(v3 + 128) = v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_task_switch();
}

uint64_t sub_1DADEDAC4()
{
  _QWORD *v0;
  unint64_t v1;
  id v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  id v18;
  uint64_t (*v19)(void);
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v25;

  v1 = v0[15];
  if (!(v1 >> 62))
  {
    if (*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      goto LABEL_3;
LABEL_12:
    v22 = v0[10];
    v21 = v0[11];
    v23 = v0[9];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v22 + 8))(v21, v23);
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  v20 = sub_1DAE0D83C();
  swift_bridgeObjectRelease();
  if (!v20)
    goto LABEL_12;
LABEL_3:
  if ((v1 & 0xC000000000000001) != 0)
  {
    v2 = (id)MEMORY[0x1DF0A7ED0](0, v0[15]);
  }
  else
  {
    if (!*(_QWORD *)((v1 & 0xFFFFFFFFFFFFF8) + 0x10))
      __break(1u);
    v2 = *(id *)(v0[15] + 32);
  }
  swift_bridgeObjectRelease();
  v3 = (void *)sub_1DAE0CA20();
  v4 = (void *)sub_1DAE0CA50();

  if (!v4)
  {
    (*(void (**)(_QWORD, _QWORD))(v0[10] + 8))(v0[11], v0[9]);

    goto LABEL_13;
  }
  v25 = v0[10];
  v6 = v0[6];
  v5 = v0[7];
  v7 = v0[5];
  sub_1DAE0C780();
  v8 = objc_allocWithZone(MEMORY[0x1E0C8B2E8]);
  v9 = (void *)sub_1DAE0C774();
  v10 = objc_msgSend(v8, sel_initWithURL_, v9);

  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v5, v7);
  v11 = objc_msgSend((id)objc_opt_self(), sel_sharedInstance);
  v12 = *MEMORY[0x1E0C89690];
  v0[2] = 0;
  LOBYTE(v8) = objc_msgSend(v11, sel_setCategory_error_, v12, v0 + 2);

  v13 = (void *)v0[2];
  v14 = v0[11];
  v15 = v0[9];
  if ((v8 & 1) != 0)
  {
    v16 = v13;
    objc_msgSend(v10, sel_play);
    v17 = (void *)qword_1F02A03D8;
    qword_1F02A03D8 = (uint64_t)v10;

    (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v14, v15);
LABEL_13:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    v19 = (uint64_t (*)(void))v0[1];
    return v19();
  }
  v18 = v13;
  sub_1DAE0C738();

  swift_willThrow();
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v14, v15);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  v19 = (uint64_t (*)(void))v0[1];
  return v19();
}

uint64_t sub_1DADEDDBC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 80) + 8))(*(_QWORD *)(v0 + 88), *(_QWORD *)(v0 + 72));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SearchUIVoicemailUtilities()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchUIVoicemailUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.playVoicemail(identifier:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 80) + *(_QWORD *)(v2 + 80));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1DADDA484;
  return v8(a1, a2);
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.resumeVoicemail()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 88))();
}

uint64_t dispatch thunk of static SearchUIVoicemailUtilities.pauseVoicemail()()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 96))();
}

uint64_t sub_1DADEDEF0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DADEDF1C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD *v4;

  v2 = *(_QWORD *)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DADDA484;
  return ((uint64_t (*)(int, void *))((char *)&dword_1F029DF58 + dword_1F029DF58))(v2, v3);
}

uint64_t sub_1DADEDF90(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DF68);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DADEDFD4()
{
  unint64_t result;

  result = qword_1F029DF78;
  if (!qword_1F029DF78)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E788, &type metadata for SearchUIKnowledgeEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029DF78);
  }
  return result;
}

unint64_t sub_1DADEE01C()
{
  unint64_t result;

  result = qword_1F029DF80[0];
  if (!qword_1F029DF80[0])
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E7E8, &type metadata for SearchUIKnowledgeEntity.Query);
    atomic_store(result, qword_1F029DF80);
  }
  return result;
}

uint64_t sub_1DADEE064()
{
  uint64_t result;

  sub_1DAE0C48C();
  sub_1DAE0C480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D998);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  sub_1DAE0D548();
  sub_1DAE0D740();
  result = sub_1DAE0C468();
  qword_1F02A03E0 = result;
  return result;
}

uint64_t sub_1DADEE100()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v0);
  v13[0] = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DAE0C744();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DAE0C75C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DAE0C714();
  __swift_allocate_value_buffer(v10, qword_1F02A03E8);
  __swift_project_value_buffer(v10, (uint64_t)qword_1F02A03E8);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v3, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v13[0], 1, 1, v8);
  return sub_1DAE0C708();
}

uint64_t sub_1DADEE358()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v8;

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DFD8);
  MEMORY[0x1E0C80A78](v0);
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v8 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DAE0C75C();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v6 = sub_1DAE0D50C();
  MEMORY[0x1E0C80A78](v6);
  sub_1DAE0D500();
  sub_1DAE0D4F4();
  sub_1DAE0C510();
  sub_1DAE0D4E8();
  swift_bridgeObjectRelease();
  sub_1DAE0D4F4();
  sub_1DAE0C750();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v5 + 56))(v3, 1, 1, v4);
  swift_bridgeObjectRetain();
  sub_1DAE0C66C();
  return sub_1DAE0C690();
}

uint64_t sub_1DADEE54C(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_1DADEE564()
{
  _QWORD *v0;

  sub_1DAE0C45C();
  v0[5] = v0[2];
  sub_1DAE0D62C();
  v0[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DADEE5E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1DF0A8C44](v2))
  {
    v3 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
  }
  v6 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  v7 = sub_1DADEF77C(v6, v5);
  swift_bridgeObjectRelease_n();
  if (v7[2])
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1DADDA2D0();
    *(_QWORD *)(v0 + 56) = swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return swift_task_switch();
  }
}

uint64_t sub_1DADEE708()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADEE73C@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  sub_1DAE0C48C();
  sub_1DAE0C480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D998);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  sub_1DAE0D548();
  sub_1DAE0D740();
  result = sub_1DAE0C468();
  *a1 = result;
  return result;
}

uint64_t sub_1DADEE7E4(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADEE848;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_1DADEE848(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  v5 = swift_task_dealloc();
  if (!v1)
    v5 = a1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_1DADEE89C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_1DADEE8B8()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  sub_1DAE0C45C();
  v0[5] = v0[2];
  v3 = (uint64_t (__cdecl *)())((char *)&dword_1F029E728 + dword_1F029E728);
  v1 = (_QWORD *)swift_task_alloc();
  v0[6] = v1;
  *v1 = v0;
  v1[1] = sub_1DADEE924;
  return v3();
}

uint64_t sub_1DADEE924(uint64_t a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  _QWORD *v6;

  v4 = *v2;
  *(_QWORD *)(v4 + 56) = v1;
  swift_task_dealloc();
  if (v1)
    return swift_task_switch();
  v6 = *(_QWORD **)(v4 + 24);

  *v6 = a1;
  return (*(uint64_t (**)(void))(v4 + 8))();
}

unint64_t sub_1DADEE9B8()
{
  unint64_t result;

  result = qword_1F029DF98;
  if (!qword_1F029DF98)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E810, &type metadata for SearchUIKnowledgeEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029DF98);
  }
  return result;
}

unint64_t sub_1DADEEA00()
{
  unint64_t result;

  result = qword_1ED4D4498;
  if (!qword_1ED4D4498)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E9B4, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4498);
  }
  return result;
}

unint64_t sub_1DADEEA48()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F029DFA0;
  if (!qword_1F029DFA0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1F029DFA8);
    v2 = sub_1DADEEA00();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0C91CE0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F029DFA0);
  }
  return result;
}

uint64_t sub_1DADEEAAC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1DADEF16C();
  *v1 = v0;
  v1[1] = sub_1DADDA484;
  return sub_1DAE0C4EC();
}

uint64_t sub_1DADEEB18()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADDA484;
  return sub_1DAE0C69C();
}

uint64_t destroy for SearchUIKnowledgeEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_release();
}

_QWORD *initializeWithCopy for SearchUIKnowledgeEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  a1[4] = a2[4];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  return a1;
}

_QWORD *assignWithCopy for SearchUIKnowledgeEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  sub_1DAE0C564();
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

uint64_t assignWithTake for SearchUIKnowledgeEntity(uint64_t a1, uint64_t a2)
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
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIKnowledgeEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIKnowledgeEntity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchUIKnowledgeEntity()
{
  return &type metadata for SearchUIKnowledgeEntity;
}

ValueMetadata *type metadata accessor for SearchUIKnowledgeEntity.Query()
{
  return &type metadata for SearchUIKnowledgeEntity.Query;
}

uint64_t sub_1DADEEDB0@<X0>(_QWORD *a1@<X8>)
{
  if (qword_1F029D6D0 != -1)
    swift_once();
  *a1 = qword_1F02A03E0;
  return sub_1DAE0C564();
}

uint64_t sub_1DADEEE00@<X0>(_QWORD *a1@<X8>)
{
  _QWORD *v1;
  uint64_t v2;

  v2 = v1[1];
  *a1 = *v1;
  a1[1] = v2;
  return swift_bridgeObjectRetain();
}

uint64_t sub_1DADEEE0C@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F029D6D8 != -1)
    swift_once();
  v2 = sub_1DAE0C714();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02A03E8);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DADEEE7C()
{
  sub_1DADED2CC();
  return sub_1DAE0C4A4();
}

uint64_t sub_1DADEEEB8()
{
  sub_1DADEEF48();
  return sub_1DAE0C720();
}

unint64_t sub_1DADEEEF4()
{
  unint64_t result;

  result = qword_1ED4D44C0;
  if (!qword_1ED4D44C0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E850, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44C0);
  }
  return result;
}

uint64_t sub_1DADEEF38()
{
  return MEMORY[0x1E0DEA978];
}

unint64_t sub_1DADEEF48()
{
  unint64_t result;

  result = qword_1ED4D44B8;
  if (!qword_1ED4D44B8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E878, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44B8);
  }
  return result;
}

unint64_t sub_1DADEEF90()
{
  unint64_t result;

  result = qword_1ED4D44B0;
  if (!qword_1ED4D44B0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E8A8, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44B0);
  }
  return result;
}

unint64_t sub_1DADEEFD8()
{
  unint64_t result;

  result = qword_1ED4D44A8;
  if (!qword_1ED4D44A8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E8D0, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44A8);
  }
  return result;
}

unint64_t sub_1DADEF01C(uint64_t a1)
{
  unint64_t result;

  result = sub_1DADED2CC();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1DADEF044()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029DFC0;
  if (!qword_1F029DFC0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029DFC8);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0C91998], v1);
    atomic_store(result, (unint64_t *)&qword_1F029DFC0);
  }
  return result;
}

unint64_t sub_1DADEF094()
{
  unint64_t result;

  result = qword_1ED4D4488;
  if (!qword_1ED4D4488)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E960, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4488);
  }
  return result;
}

unint64_t sub_1DADEF0DC()
{
  unint64_t result;

  result = qword_1ED4D44A0;
  if (!qword_1ED4D44A0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E930, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44A0);
  }
  return result;
}

unint64_t sub_1DADEF124()
{
  unint64_t result;

  result = qword_1ED4D44C8;
  if (!qword_1ED4D44C8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E8F8, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44C8);
  }
  return result;
}

unint64_t sub_1DADEF16C()
{
  unint64_t result;

  result = qword_1F029DFD0;
  if (!qword_1F029DFD0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E730, &type metadata for SearchUIKnowledgeEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029DFD0);
  }
  return result;
}

uint64_t sub_1DADEF1B0()
{
  return MEMORY[0x1E0C91C88];
}

void sub_1DADEF1BC(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  id v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;

  v4 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v4);
  v5 = sub_1DAE0C744();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v43 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v9);
  v10 = sub_1DAE0C75C();
  MEMORY[0x1E0C80A78](v10);
  v12 = (char *)&v43 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DFE0);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v5, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v6 + 16))(v8, v13, v5);
  sub_1DAE0C804();
  sub_1DAE0C768();
  v14 = MEMORY[0x1DF0A6C58](v12);
  sub_1DAE0C564();
  v15 = objc_msgSend(a1, sel_itemIdentifier);
  if (v15)
  {
    v16 = v15;
    v17 = sub_1DAE0D53C();
    v19 = v18;

    swift_bridgeObjectRetain();
    v20 = objc_msgSend(a1, sel_cardSection);
    if (v20)
    {
      v21 = v20;
      v22 = objc_msgSend(v20, sel_command);

      if (v22)
      {
        objc_opt_self();
        v23 = (void *)swift_dynamicCastObjCClass();
        if (v23)
        {
          v24 = v23;
          v25 = objc_msgSend(v23, sel_tokenString);
          if (v25)
          {
            v26 = sub_1DAE0D53C();
            v28 = v27;

            v29 = objc_msgSend(v24, sel_symbolImage);
            v30 = v29;
            if (v29)
            {
              v45 = v26;
              v31 = objc_msgSend(v29, sel_symbolName);

              if (v31)
              {
                v30 = (id)sub_1DAE0D53C();
                v25 = v32;

              }
              else
              {
                v30 = 0;
                v25 = 0;
              }
              v26 = v45;
            }
            else
            {
              v25 = 0;
            }
            v46 = v26;
            v47 = v28;
            goto LABEL_40;
          }

          swift_release_n();
          swift_bridgeObjectRelease_n();
          goto LABEL_29;
        }

      }
    }
    v33 = objc_msgSend(a1, sel_cardSection);
    v30 = v33;
    if (v33)
    {
      v22 = objc_msgSend(v33, sel_command);

      if (!v22)
      {

        swift_release_n();
        swift_bridgeObjectRelease_n();
LABEL_23:
        v17 = 0;
        v19 = 0;
        v30 = 0;
LABEL_26:
        v25 = 0;
        v14 = 0;
LABEL_41:
        *a2 = v17;
        a2[1] = v19;
        a2[2] = (uint64_t)v30;
        a2[3] = (uint64_t)v25;
        a2[4] = v14;
        return;
      }
      objc_opt_self();
      v34 = (void *)swift_dynamicCastObjCClass();
      v30 = v34;
      if (v34)
      {
        v35 = objc_msgSend(v34, sel_card);
        v25 = v35;
        if (!v35)
        {

          swift_release_n();
          swift_bridgeObjectRelease_n();

LABEL_29:
          v17 = 0;
          v19 = 0;
          v30 = 0;
          v14 = 0;
          goto LABEL_41;
        }
        v36 = objc_msgSend(v35, sel_title);

        if (v36)
        {
          v37 = sub_1DAE0D53C();
          v44 = v38;
          v45 = v37;

          v39 = objc_msgSend(v30, sel_card);
          v25 = v39;
          if (v39)
          {
            v30 = objc_msgSend(v39, sel_titleImage);

            if (v30)
            {
              objc_opt_self();
              v40 = (void *)swift_dynamicCastObjCClass();
              if (v40)
              {
                v41 = objc_msgSend(v40, sel_symbolName);

                if (v41)
                {
                  v30 = (id)sub_1DAE0D53C();
                  v25 = v42;

LABEL_39:
                  v46 = v45;
                  v47 = v44;
LABEL_40:
                  swift_bridgeObjectRetain();
                  sub_1DAE0C564();
                  swift_bridgeObjectRetain();
                  sub_1DAE0C51C();

                  swift_release_n();
                  swift_bridgeObjectRelease();
                  swift_bridgeObjectRelease_n();

                  goto LABEL_41;
                }
              }
              else
              {

              }
              v30 = 0;
            }
            v25 = 0;
            goto LABEL_39;
          }
          v30 = 0;
          goto LABEL_39;
        }

        swift_release_n();
        swift_bridgeObjectRelease_n();

        goto LABEL_23;
      }

    }
    swift_release_n();
    swift_bridgeObjectRelease_n();
    v17 = 0;
    v19 = 0;
    goto LABEL_26;
  }
  __break(1u);
}

_QWORD *sub_1DADEF77C(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  _QWORD *v24;
  unint64_t v25;
  unint64_t v26;
  _QWORD *v27;
  uint64_t v28;
  _QWORD *v29;
  unint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  uint64_t v35[5];
  _BYTE v36[8];
  uint64_t v37;
  unint64_t v38;

  v32 = *(_QWORD *)(a1 + 16);
  if (!v32)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v2 = a2;
  v31 = a1 + 32;
  v28 = a2 & 0xFFFFFFFFFFFFFF8;
  v34 = a2 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  v3 = 0;
  v29 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v30 = v2 >> 62;
  v38 = v2;
  while (1)
  {
    v4 = (uint64_t *)(v31 + 16 * v3);
    v6 = *v4;
    v5 = v4[1];
    if (v30)
      break;
    v7 = *(_QWORD *)(v28 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_9;
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v32)
    {
      swift_bridgeObjectRelease();
      return v29;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_1DAE0D83C();
  if (!v7)
    goto LABEL_3;
LABEL_9:
  v33 = v3;
  v8 = 4;
  while (1)
  {
    result = v34 ? (_QWORD *)MEMORY[0x1DF0A7ED0](v8 - 4, v2) : *(id *)(v2 + 8 * v8);
    v10 = result;
    v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
      break;
    v12 = objc_msgSend(result, sel_itemIdentifier);
    if (v12)
    {
      v13 = v12;
      v14 = sub_1DAE0D53C();
      v16 = v15;

      v17 = v14 == v6 && v16 == v5;
      if (v17)
      {
        v2 = v38;
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
      v18 = sub_1DAE0D8A8();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
      {
        v2 = v38;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1DADEF1BC(v10, v35);
        v19 = v35[0];
        v20 = v35[1];
        v21 = v35[2];
        v22 = v35[3];
        v23 = v35[4];
        swift_bridgeObjectRelease();
        sub_1DADEFBF8((uint64_t)v35, (uint64_t)v36);
        if (v37)
        {
          v24 = v29;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v24 = sub_1DAE06230(0, v29[2] + 1, 1, v29);
          v26 = v24[2];
          v25 = v24[3];
          v29 = v24;
          if (v26 >= v25 >> 1)
            v29 = sub_1DAE06230((_QWORD *)(v25 > 1), v26 + 1, 1, v24);
          v29[2] = v26 + 1;
          v27 = &v29[5 * v26];
          v27[4] = v19;
          v27[5] = v20;
          v27[6] = v21;
          v27[7] = v22;
          v27[8] = v23;
          v2 = v38;
        }
LABEL_30:
        v3 = v33;
        goto LABEL_4;
      }
    }

    ++v8;
    v17 = v11 == v7;
    v2 = v38;
    if (v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

id sub_1DADEFA50(void *a1)
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id result;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  uint64_t v20;
  unint64_t v21;

  v2 = objc_msgSend(a1, sel_cardSection);
  if (!v2 || (v3 = v2, v4 = objc_msgSend(v2, sel_command), v3, !v4))
  {
LABEL_7:
    result = objc_msgSend(a1, sel_cardSection);
    if (!result)
      return result;
    v14 = result;
    v15 = objc_msgSend(result, sel_command);

    if (v15)
    {
      objc_opt_self();
      v16 = (void *)swift_dynamicCastObjCClass();
      if (v16)
      {
        v17 = objc_msgSend(v16, sel_card);
        if (v17)
        {
          v18 = v17;
          v19 = objc_msgSend(v17, sel_title);

          if (v19)
          {
            v20 = sub_1DAE0D53C();
            v10 = v21;

            swift_bridgeObjectRelease();
            v11 = HIBYTE(v10) & 0xF;
            v12 = v20 & 0xFFFFFFFFFFFFLL;
            goto LABEL_13;
          }
        }
      }

    }
    return 0;
  }
  objc_opt_self();
  v5 = (void *)swift_dynamicCastObjCClass();
  if (!v5)
  {

    goto LABEL_7;
  }
  v6 = objc_msgSend(v5, sel_tokenString);
  if (!v6)
  {

    return 0;
  }
  v7 = v6;
  v8 = sub_1DAE0D53C();
  v10 = v9;

  swift_bridgeObjectRelease();
  v11 = HIBYTE(v10) & 0xF;
  v12 = v8 & 0xFFFFFFFFFFFFLL;
LABEL_13:
  if ((v10 & 0x2000000000000000) == 0)
    v11 = v12;
  return (id)(v11 != 0);
}

uint64_t sub_1DADEFBF8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DFF0);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADEFC40()
{
  uint64_t v0;
  _QWORD *v1;

  v0 = sub_1DAE0C744();
  __swift_allocate_value_buffer(v0, qword_1F02A0400);
  v1 = (_QWORD *)__swift_project_value_buffer(v0, (uint64_t)qword_1F02A0400);
  *v1 = sub_1DADEFCAC();
  return (*(uint64_t (**)(_QWORD *, _QWORD, uint64_t))(*(_QWORD *)(v0 - 8) + 104))(v1, *MEMORY[0x1E0CAF9C8], v0);
}

unint64_t sub_1DADEFCAC()
{
  unint64_t result;

  result = qword_1F029DFF8;
  if (!qword_1F029DFF8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029DFF8);
  }
  return result;
}

uint64_t sub_1DADEFCE8(uint64_t a1, uint64_t *a2, uint64_t a3)
{
  int v5;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  _QWORD *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;

  v5 = *(_DWORD *)(*(_QWORD *)(a3 - 8) + 80);
  if ((v5 & 0x20000) != 0)
  {
    v17 = *a2;
    *(_QWORD *)a1 = *a2;
    a1 = v17 + ((v5 + 16) & ~(unint64_t)v5);
    sub_1DAE0C564();
  }
  else
  {
    v7 = a2[1];
    *(_QWORD *)a1 = *a2;
    *(_QWORD *)(a1 + 8) = v7;
    v8 = a2[3];
    *(_QWORD *)(a1 + 16) = a2[2];
    *(_QWORD *)(a1 + 24) = v8;
    v9 = *((_OWORD *)a2 + 3);
    *(_OWORD *)(a1 + 32) = *((_OWORD *)a2 + 2);
    *(_OWORD *)(a1 + 48) = v9;
    v11 = (void *)a2[8];
    v10 = a2[9];
    *(_QWORD *)(a1 + 64) = v11;
    *(_QWORD *)(a1 + 72) = v10;
    v12 = *(int *)(a3 + 36);
    v13 = (_QWORD *)(a1 + v12);
    v14 = (uint64_t *)((char *)a2 + v12);
    *(_QWORD *)(a1 + 80) = a2[10];
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    v15 = v11;
    swift_bridgeObjectRetain();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v16 = sub_1DAE0CD44();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v16 - 8) + 16))(v13, v14, v16);
    }
    else
    {
      *v13 = *v14;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
    v18 = *(int *)(a3 + 40);
    v19 = a1 + v18;
    v20 = (uint64_t)a2 + v18;
    v21 = *(uint64_t *)((char *)a2 + v18 + 24);
    if (v21)
    {
      v22 = *(_QWORD *)(v20 + 32);
      *(_QWORD *)(v19 + 24) = v21;
      *(_QWORD *)(v19 + 32) = v22;
      (**(void (***)(void))(v21 - 8))();
    }
    else
    {
      v23 = *(_OWORD *)(v20 + 16);
      *(_OWORD *)v19 = *(_OWORD *)v20;
      *(_OWORD *)(v19 + 16) = v23;
      *(_QWORD *)(v19 + 32) = *(_QWORD *)(v20 + 32);
    }
  }
  return a1;
}

uint64_t sub_1DADEFE44(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t result;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  v4 = a1 + *(int *)(a2 + 36);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v5 = sub_1DAE0CD44();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 8))(v4, v5);
  }
  else
  {
    swift_release();
  }
  result = a1 + *(int *)(a2 + 40);
  if (*(_QWORD *)(result + 24))
    return __swift_destroy_boxed_opaque_existential_0(result);
  return result;
}

uint64_t sub_1DADEFEFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD *v12;
  _QWORD *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  v10 = *(void **)(a2 + 64);
  v9 = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 64) = v10;
  *(_QWORD *)(a1 + 72) = v9;
  v11 = *(int *)(a3 + 36);
  v12 = (_QWORD *)(a1 + v11);
  v13 = (_QWORD *)(a2 + v11);
  *(_QWORD *)(a1 + 80) = *(_QWORD *)(a2 + 80);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v14 = v10;
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v15 = sub_1DAE0CD44();
    (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v15 - 8) + 16))(v12, v13, v15);
  }
  else
  {
    *v12 = *v13;
    sub_1DAE0C564();
  }
  swift_storeEnumTagMultiPayload();
  v16 = *(int *)(a3 + 40);
  v17 = a1 + v16;
  v18 = a2 + v16;
  v19 = *(_QWORD *)(a2 + v16 + 24);
  if (v19)
  {
    v20 = *(_QWORD *)(v18 + 32);
    *(_QWORD *)(v17 + 24) = v19;
    *(_QWORD *)(v17 + 32) = v20;
    (**(void (***)(void))(v19 - 8))();
  }
  else
  {
    v21 = *(_OWORD *)(v18 + 16);
    *(_OWORD *)v17 = *(_OWORD *)v18;
    *(_OWORD *)(v17 + 16) = v21;
    *(_QWORD *)(v17 + 32) = *(_QWORD *)(v18 + 32);
  }
  return a1;
}

_QWORD *sub_1DADF002C(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD *v10;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  __int128 v17;
  __int128 v18;

  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  a1[5] = a2[5];
  a1[6] = a2[6];
  a1[7] = a2[7];
  v6 = (void *)a1[8];
  v7 = (void *)a2[8];
  a1[8] = v7;
  v8 = v7;

  a1[9] = a2[9];
  a1[10] = a2[10];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v9 = *(int *)(a3 + 36);
    v10 = (_QWORD *)((char *)a1 + v9);
    v11 = (_QWORD *)((char *)a2 + v9);
    sub_1DADDCC3C((uint64_t)a1 + v9, &qword_1F029B508);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v12 = sub_1DAE0CD44();
      (*(void (**)(_QWORD *, _QWORD *, uint64_t))(*(_QWORD *)(v12 - 8) + 16))(v10, v11, v12);
    }
    else
    {
      *v10 = *v11;
      sub_1DAE0C564();
    }
    swift_storeEnumTagMultiPayload();
  }
  v13 = *(int *)(a3 + 40);
  v14 = (uint64_t)a1 + v13;
  v15 = (char *)a2 + v13;
  v16 = *((_QWORD *)v15 + 3);
  if (!*(_QWORD *)((char *)a1 + v13 + 24))
  {
    if (v16)
    {
      *(_QWORD *)(v14 + 24) = v16;
      *(_QWORD *)(v14 + 32) = *((_QWORD *)v15 + 4);
      (**(void (***)(uint64_t, char *))(v16 - 8))(v14, v15);
      return a1;
    }
LABEL_12:
    v17 = *(_OWORD *)v15;
    v18 = *((_OWORD *)v15 + 1);
    *(_QWORD *)(v14 + 32) = *((_QWORD *)v15 + 4);
    *(_OWORD *)v14 = v17;
    *(_OWORD *)(v14 + 16) = v18;
    return a1;
  }
  if (!v16)
  {
    __swift_destroy_boxed_opaque_existential_0(v14);
    goto LABEL_12;
  }
  __swift_assign_boxed_opaque_existential_1((uint64_t *)v14, (uint64_t *)v15);
  return a1;
}

uint64_t *__swift_assign_boxed_opaque_existential_1(uint64_t *result, uint64_t *a2)
{
  uint64_t *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE v11[24];

  if (result != a2)
  {
    v3 = result;
    v4 = result[3];
    v5 = a2[3];
    if (v4 == v5)
    {
      v9 = *(_QWORD *)(v4 - 8);
      if ((*(_BYTE *)(v9 + 82) & 2) != 0)
      {
        v10 = *a2;
        sub_1DAE0C564();
        result = (uint64_t *)swift_release();
        *v3 = v10;
      }
      else
      {
        return (uint64_t *)(*(uint64_t (**)(uint64_t *, uint64_t *, uint64_t))(v9 + 24))(result, a2, result[3]);
      }
    }
    else
    {
      result[3] = v5;
      result[4] = a2[4];
      v6 = *(_QWORD *)(v4 - 8);
      v7 = *(_QWORD *)(v5 - 8);
      v8 = *(_DWORD *)(v7 + 80);
      if ((*(_BYTE *)(v6 + 82) & 2) != 0)
      {
        if ((v8 & 0x20000) != 0)
        {
          *result = *a2;
          sub_1DAE0C564();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(result, a2, v5);
        }
        return (uint64_t *)swift_release();
      }
      else
      {
        (*(void (**)(_BYTE *, uint64_t *, uint64_t))(v6 + 32))(v11, result, v4);
        if ((v8 & 0x20000) != 0)
        {
          *v3 = *a2;
          sub_1DAE0C564();
        }
        else
        {
          (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(v3, a2, v5);
        }
        return (uint64_t *)(*(uint64_t (**)(_BYTE *, uint64_t))(v6 + 8))(v11, v4);
      }
    }
  }
  return result;
}

uint64_t sub_1DADF0358(uint64_t a1, uint64_t a2, uint64_t a3)
{
  __int128 v6;
  __int128 v7;
  uint64_t v8;
  void *v9;
  const void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;

  v6 = *(_OWORD *)(a2 + 16);
  *(_OWORD *)a1 = *(_OWORD *)a2;
  *(_OWORD *)(a1 + 16) = v6;
  v7 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v7;
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);
  v8 = *(int *)(a3 + 36);
  v9 = (void *)(a1 + v8);
  v10 = (const void *)(a2 + v8);
  *(_OWORD *)(a1 + 72) = *(_OWORD *)(a2 + 72);
  v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
  if (swift_getEnumCaseMultiPayload() == 1)
  {
    v12 = sub_1DAE0CD44();
    (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v12 - 8) + 32))(v9, v10, v12);
    swift_storeEnumTagMultiPayload();
  }
  else
  {
    memcpy(v9, v10, *(_QWORD *)(*(_QWORD *)(v11 - 8) + 64));
  }
  v13 = *(int *)(a3 + 40);
  v14 = a1 + v13;
  v15 = a2 + v13;
  v16 = *(_OWORD *)(v15 + 16);
  *(_OWORD *)v14 = *(_OWORD *)v15;
  *(_OWORD *)(v14 + 16) = v16;
  *(_QWORD *)(v14 + 32) = *(_QWORD *)(v15 + 32);
  return a1;
}

uint64_t sub_1DADF0444(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;

  v6 = *(_QWORD *)(a2 + 8);
  *(_QWORD *)a1 = *(_QWORD *)a2;
  *(_QWORD *)(a1 + 8) = v6;
  swift_bridgeObjectRelease();
  v7 = *(_QWORD *)(a2 + 24);
  *(_QWORD *)(a1 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a1 + 24) = v7;
  swift_bridgeObjectRelease();
  v8 = *(_OWORD *)(a2 + 48);
  *(_OWORD *)(a1 + 32) = *(_OWORD *)(a2 + 32);
  *(_OWORD *)(a1 + 48) = v8;
  v9 = *(void **)(a1 + 64);
  *(_QWORD *)(a1 + 64) = *(_QWORD *)(a2 + 64);

  v10 = *(_QWORD *)(a2 + 80);
  *(_QWORD *)(a1 + 72) = *(_QWORD *)(a2 + 72);
  *(_QWORD *)(a1 + 80) = v10;
  swift_bridgeObjectRelease();
  if (a1 != a2)
  {
    v11 = *(int *)(a3 + 36);
    v12 = (void *)(a1 + v11);
    v13 = (const void *)(a2 + v11);
    sub_1DADDCC3C(a1 + v11, &qword_1F029B508);
    v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
    if (swift_getEnumCaseMultiPayload() == 1)
    {
      v15 = sub_1DAE0CD44();
      (*(void (**)(void *, const void *, uint64_t))(*(_QWORD *)(v15 - 8) + 32))(v12, v13, v15);
      swift_storeEnumTagMultiPayload();
    }
    else
    {
      memcpy(v12, v13, *(_QWORD *)(*(_QWORD *)(v14 - 8) + 64));
    }
  }
  v16 = *(int *)(a3 + 40);
  v17 = a1 + v16;
  if (*(_QWORD *)(a1 + v16 + 24))
    __swift_destroy_boxed_opaque_existential_0(a1 + v16);
  v18 = *(_OWORD *)(a2 + v16 + 16);
  *(_OWORD *)v17 = *(_OWORD *)(a2 + v16);
  *(_OWORD *)(v17 + 16) = v18;
  *(_QWORD *)(v17 + 32) = *(_QWORD *)(a2 + v16 + 32);
  return a1;
}

uint64_t sub_1DADF0580()
{
  return swift_getEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADF058C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  unint64_t v4;
  uint64_t v8;

  if ((_DWORD)a2 == 0x7FFFFFFF)
  {
    v4 = *(_QWORD *)(a1 + 8);
    if (v4 >= 0xFFFFFFFF)
      LODWORD(v4) = -1;
    return (v4 + 1);
  }
  else
  {
    v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E000);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 48))(a1 + *(int *)(a3 + 36), a2, v8);
  }
}

uint64_t sub_1DADF060C()
{
  return swift_storeEnumTagSinglePayloadGeneric();
}

uint64_t sub_1DADF0618(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t v5;
  uint64_t v7;

  v5 = result;
  if (a3 == 0x7FFFFFFF)
  {
    *(_QWORD *)(result + 8) = (a2 - 1);
  }
  else
  {
    v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E000);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v5 + *(int *)(a4 + 36), a2, a2, v7);
  }
  return result;
}

uint64_t type metadata accessor for Header()
{
  uint64_t result;

  result = qword_1ED4D45D8;
  if (!qword_1ED4D45D8)
    return swift_getSingletonMetadata();
  return result;
}

void sub_1DADF06CC()
{
  unint64_t v0;

  sub_1DADF0768();
  if (v0 <= 0x3F)
    swift_initStructMetadata();
}

void sub_1DADF0768()
{
  unint64_t v0;
  uint64_t v1;

  if (!qword_1ED4D45D0)
  {
    sub_1DAE0CD44();
    v0 = sub_1DAE0CAD4();
    if (!v1)
      atomic_store(v0, (unint64_t *)&qword_1ED4D45D0);
  }
}

uint64_t sub_1DADF07BC()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADF07CC@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t *v3;
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
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char *v24;
  uint64_t *v25;
  char *v26;
  uint64_t v27;
  uint64_t KeyPath;
  uint64_t *v29;
  _QWORD v31[2];

  v31[1] = a1;
  v1 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1E0C80A78](v1);
  v3 = (_QWORD *)((char *)v31 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0));
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B688);
  MEMORY[0x1E0C80A78](v4);
  v6 = (char *)v31 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B5F0);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)v31 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31[0] = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B630);
  MEMORY[0x1E0C80A78](v31[0]);
  v11 = (char *)v31 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B660);
  MEMORY[0x1E0C80A78](v12);
  v14 = (char *)v31 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADF0AC8((uint64_t)v6);
  sub_1DAE0CAA4();
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;
  v23 = sub_1DAE0CEAC();
  sub_1DADEC1E0((uint64_t)v6, (uint64_t)v9, &qword_1F029B688);
  v24 = &v9[*(int *)(v7 + 36)];
  *v24 = v23;
  *((_QWORD *)v24 + 1) = v16;
  *((_QWORD *)v24 + 2) = v18;
  *((_QWORD *)v24 + 3) = v20;
  *((_QWORD *)v24 + 4) = v22;
  v24[40] = 0;
  sub_1DADDCC3C((uint64_t)v6, &qword_1F029B688);
  *v3 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  swift_storeEnumTagMultiPayload();
  v25 = (uint64_t *)((char *)v3 + *(int *)(v1 + 20));
  *v25 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  swift_storeEnumTagMultiPayload();
  v26 = (char *)v3 + *(int *)(v1 + 24);
  *(_QWORD *)v26 = 1;
  v26[8] = 0;
  sub_1DADEC1E0((uint64_t)v9, (uint64_t)v11, &qword_1F029B5F0);
  sub_1DADF2490((uint64_t)v3, (uint64_t)&v11[*(int *)(v31[0] + 36)]);
  sub_1DADDCC3C((uint64_t)v9, &qword_1F029B5F0);
  v27 = sub_1DAE0CEE8();
  KeyPath = swift_getKeyPath();
  sub_1DADEC1E0((uint64_t)v11, (uint64_t)v14, &qword_1F029B630);
  v29 = (uint64_t *)&v14[*(int *)(v12 + 36)];
  *v29 = KeyPath;
  v29[1] = v27;
  sub_1DADDCC3C((uint64_t)v11, &qword_1F029B630);
  sub_1DADF2524();
  sub_1DAE0CF90();
  return sub_1DADDCC3C((uint64_t)v14, &qword_1F029B660);
}

uint64_t sub_1DADF0AC8@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  char v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;

  v2 = v1;
  v31 = a1;
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6C8);
  MEMORY[0x1E0C80A78](v32);
  v4 = (char *)&v29 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v29 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B678);
  MEMORY[0x1E0C80A78](v29);
  v6 = (char *)&v29 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6E8);
  v8 = MEMORY[0x1E0C80A78](v7);
  v10 = (char *)&v29 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v8);
  v12 = (char *)&v29 - v11;
  v30 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6D8);
  MEMORY[0x1E0C80A78](v30);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v15 = sub_1DAE0CD44();
  v16 = *(_QWORD *)(v15 - 8);
  MEMORY[0x1E0C80A78](v15);
  v18 = (char *)&v29 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  type metadata accessor for Header();
  sub_1DADEAEF0((uint64_t)v18);
  v19 = sub_1DAE0CD38();
  (*(void (**)(char *, uint64_t))(v16 + 8))(v18, v15);
  if ((v19 & 1) != 0)
  {
    *(_QWORD *)v14 = sub_1DAE0CCE4();
    *((_QWORD *)v14 + 1) = 0;
    v14[16] = 1;
    v20 = (uint64_t)&v14[*(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F029E008) + 44)];
    *(_QWORD *)v12 = sub_1DAE0CD50();
    *((_QWORD *)v12 + 1) = 0;
    v12[16] = 1;
    v21 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E010);
    sub_1DADF0E60(v2, (uint64_t)&v12[*(int *)(v21 + 44)]);
    sub_1DADEC1E0((uint64_t)v12, (uint64_t)v10, &qword_1F029B6E8);
    sub_1DADEC1E0((uint64_t)v10, v20, &qword_1F029B6E8);
    v22 = v20 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F029E018) + 48);
    *(_QWORD *)v22 = 0;
    *(_BYTE *)(v22 + 8) = 1;
    sub_1DADDCC3C((uint64_t)v12, &qword_1F029B6E8);
    sub_1DADDCC3C((uint64_t)v10, &qword_1F029B6E8);
    v23 = &qword_1F029B6D8;
    sub_1DADEC1E0((uint64_t)v14, (uint64_t)v6, &qword_1F029B6D8);
    swift_storeEnumTagMultiPayload();
    v24 = MEMORY[0x1E0CDFB10];
    sub_1DADDD9BC(&qword_1F029B6D0, &qword_1F029B6D8, MEMORY[0x1E0CDFB10]);
    sub_1DADDD9BC(&qword_1F029B6C0, &qword_1F029B6C8, v24);
    sub_1DAE0CD74();
    v25 = (uint64_t)v14;
  }
  else
  {
    *(_QWORD *)v4 = sub_1DAE0CCD8();
    *((_QWORD *)v4 + 1) = 0;
    v4[16] = 1;
    v26 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B5E0);
    sub_1DADF1414(v2, (uint64_t)&v4[*(int *)(v26 + 44)]);
    v23 = &qword_1F029B6C8;
    sub_1DADEC1E0((uint64_t)v4, (uint64_t)v6, &qword_1F029B6C8);
    swift_storeEnumTagMultiPayload();
    v27 = MEMORY[0x1E0CDFB10];
    sub_1DADDD9BC(&qword_1F029B6D0, &qword_1F029B6D8, MEMORY[0x1E0CDFB10]);
    sub_1DADDD9BC(&qword_1F029B6C0, &qword_1F029B6C8, v27);
    sub_1DAE0CD74();
    v25 = (uint64_t)v4;
  }
  return sub_1DADDCC3C(v25, v23);
}

uint64_t sub_1DADF0E60@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  char *v9;
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
  uint64_t v25;
  uint64_t v26;
  int v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD v33[2];
  unsigned __int8 v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6B0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v25 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v9 = (char *)&v25 - v8;
  v32 = (uint64_t)&v25 - v8;
  v29 = sub_1DAE0CD50();
  sub_1DADF15E4(a1, (uint64_t)v33);
  v10 = v33[0];
  v26 = v33[0];
  v28 = v33[1];
  v27 = v34;
  v11 = v35;
  v12 = v36;
  v13 = v37;
  v14 = v38;
  v30 = v37;
  v31 = v38;
  v15 = v39;
  sub_1DADF1034((uint64_t)v9);
  v16 = (uint64_t)v9;
  v17 = (uint64_t)v7;
  sub_1DADEC1E0(v16, (uint64_t)v7, &qword_1F029B6B0);
  v18 = v28;
  *(_QWORD *)a2 = v29;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v18;
  LOBYTE(a1) = v27;
  *(_BYTE *)(a2 + 40) = v27;
  *(_QWORD *)(a2 + 48) = v11;
  *(_QWORD *)(a2 + 56) = v12;
  *(_QWORD *)(a2 + 64) = v13;
  *(_QWORD *)(a2 + 72) = v14;
  *(_QWORD *)(a2 + 80) = v15;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E020);
  sub_1DADEC1E0(v17, a2 + *(int *)(v19 + 48), &qword_1F029B6B0);
  v20 = v26;
  sub_1DADF273C(v26, v18, a1);
  swift_bridgeObjectRetain();
  v21 = v12;
  v22 = v12;
  v23 = v30;
  LOBYTE(a2) = v31;
  sub_1DADF274C(v22, v30, v31, v15);
  sub_1DADDCC3C(v32, &qword_1F029B6B0);
  sub_1DADDCC3C(v17, &qword_1F029B6B0);
  sub_1DADE68D8(v20, v18, a1);
  swift_bridgeObjectRelease();
  return sub_1DADF277C(v21, v23, a2, v15);
}

uint64_t sub_1DADF1034@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t *v20;
  char *v21;
  uint64_t v22;
  char *v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  __int128 v37;
  uint64_t v38;
  _BYTE v39[40];

  v2 = v1;
  v4 = sub_1DAE0CDB0();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v35 = (char *)&v29 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1E0C80A78](v7);
  v9 = (uint64_t *)((char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0));
  v32 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B3F8);
  v10 = *(_QWORD *)(v32 - 8);
  MEMORY[0x1E0C80A78](v32);
  v12 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  v34 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B610);
  MEMORY[0x1E0C80A78](v34);
  v14 = (char *)&v29 - ((v13 + 15) & 0xFFFFFFFFFFFFFFF0);
  v36 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6A8);
  v15 = *(_QWORD *)(v36 - 8);
  MEMORY[0x1E0C80A78](v36);
  v33 = (char *)&v29 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = type metadata accessor for Header();
  sub_1DADEC1E0(v2 + *(int *)(v17 + 40), (uint64_t)&v37, &qword_1F029B0E8);
  if (v38)
  {
    v31 = v4;
    sub_1DADE25E0(&v37, (uint64_t)v39);
    sub_1DADF27AC((uint64_t)v39, (uint64_t)&v37);
    v18 = swift_allocObject();
    v19 = sub_1DADE25E0(&v37, v18 + 16);
    v29 = v5;
    MEMORY[0x1E0C80A78](v19);
    v30 = a1;
    *(&v29 - 2) = (uint64_t)v39;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B378);
    sub_1DADF2860();
    sub_1DAE0D068();
    *v9 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
    swift_storeEnumTagMultiPayload();
    v20 = (uint64_t *)((char *)v9 + *(int *)(v7 + 20));
    *v20 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
    swift_storeEnumTagMultiPayload();
    v21 = (char *)v9 + *(int *)(v7 + 24);
    *(_QWORD *)v21 = 2;
    v21[8] = 1;
    v22 = v32;
    (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v14, v12, v32);
    sub_1DADF2490((uint64_t)v9, (uint64_t)&v14[*(int *)(v34 + 36)]);
    (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v22);
    v23 = v35;
    sub_1DAE0CDA4();
    sub_1DADF296C();
    sub_1DADE25F8(&qword_1F029B690, (uint64_t (*)(uint64_t))MEMORY[0x1E0CDBC90], MEMORY[0x1E0CDBC70]);
    v24 = v33;
    v25 = v31;
    sub_1DAE0CF54();
    (*(void (**)(char *, uint64_t))(v29 + 8))(v23, v25);
    sub_1DADDCC3C((uint64_t)v14, &qword_1F029B610);
    v26 = v30;
    v27 = v36;
    (*(void (**)(uint64_t, char *, uint64_t))(v15 + 32))(v30, v24, v36);
    (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v15 + 56))(v26, 0, 1, v27);
    return __swift_destroy_boxed_opaque_existential_0((uint64_t)v39);
  }
  else
  {
    sub_1DADDCC3C((uint64_t)&v37, &qword_1F029B0E8);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v15 + 56))(a1, 1, 1, v36);
  }
}

uint64_t sub_1DADF1414@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
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
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  _QWORD v29[2];
  char v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6B0);
  v5 = MEMORY[0x1E0C80A78](v4);
  v27 = (uint64_t)&v23 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v23 - v7;
  v28 = (uint64_t)&v23 - v7;
  v24 = sub_1DAE0CD50();
  sub_1DADF15E4(a1, (uint64_t)v29);
  v10 = v29[0];
  v9 = v29[1];
  v11 = v30;
  v12 = v31;
  v13 = v32;
  v15 = v33;
  v14 = v34;
  v26 = v33;
  v23 = v35;
  sub_1DADF1034((uint64_t)v8);
  v16 = v27;
  sub_1DADEC1E0((uint64_t)v8, v27, &qword_1F029B6B0);
  *(_QWORD *)a2 = v24;
  *(_QWORD *)(a2 + 8) = 0;
  *(_BYTE *)(a2 + 16) = 1;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v9;
  *(_BYTE *)(a2 + 40) = v11;
  v25 = v12;
  *(_QWORD *)(a2 + 48) = v12;
  *(_QWORD *)(a2 + 56) = v13;
  *(_QWORD *)(a2 + 64) = v15;
  *(_QWORD *)(a2 + 72) = v14;
  v17 = v23;
  *(_QWORD *)(a2 + 80) = v23;
  *(_QWORD *)(a2 + 88) = 0;
  *(_BYTE *)(a2 + 96) = 1;
  v18 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6E0);
  sub_1DADEC1E0(v16, a2 + *(int *)(v18 + 64), &qword_1F029B6B0);
  sub_1DADF273C(v10, v9, v11);
  swift_bridgeObjectRetain();
  v19 = v13;
  v20 = v13;
  v21 = v26;
  sub_1DADF274C(v20, v26, v14, v17);
  sub_1DADDCC3C(v28, &qword_1F029B6B0);
  sub_1DADDCC3C(v16, &qword_1F029B6B0);
  sub_1DADE68D8(v10, v9, v11);
  swift_bridgeObjectRelease();
  return sub_1DADF277C(v19, v21, v14, v17);
}

uint64_t sub_1DADF15E4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char v7;
  char v8;
  uint64_t v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  char v20;

  sub_1DADE63A4();
  swift_bridgeObjectRetain();
  v4 = sub_1DAE0CF18();
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = *(_QWORD *)(a1 + 24);
  if (!v11)
    goto LABEL_6;
  v12 = HIBYTE(v11) & 0xF;
  if ((v11 & 0x2000000000000000) == 0)
    v12 = *(_QWORD *)(a1 + 16) & 0xFFFFFFFFFFFFLL;
  if (v12)
  {
    swift_bridgeObjectRetain();
    v13 = sub_1DAE0CF18();
    v15 = v14;
    v17 = v16;
    v19 = v18 & 1;
  }
  else
  {
LABEL_6:
    v13 = 0;
    v15 = 0;
    v19 = 0;
    v17 = 0;
  }
  v20 = v8 & 1;
  *(_QWORD *)a2 = v4;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v20;
  *(_QWORD *)(a2 + 24) = v10;
  *(_QWORD *)(a2 + 32) = v13;
  *(_QWORD *)(a2 + 40) = v15;
  *(_QWORD *)(a2 + 48) = v19;
  *(_QWORD *)(a2 + 56) = v17;
  sub_1DADF273C(v4, v6, v20);
  swift_bridgeObjectRetain();
  sub_1DADF274C(v13, v15, v19, v17);
  sub_1DADF277C(v13, v15, v19, v17);
  sub_1DADE68D8(v4, v6, v20);
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADF1738@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _BYTE *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  uint64_t (**v12)();
  _BYTE v14[16];
  uint64_t v15;
  uint64_t v16;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B3E8);
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = &v14[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B3D8);
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v11 = &v14[-((v10 + 15) & 0xFFFFFFFFFFFFFFF0)];
  v16 = a1;
  v15 = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B390);
  sub_1DADF2A18();
  sub_1DAE0D02C();
  sub_1DADDD9BC(&qword_1F029B3E0, &qword_1F029B3E8, MEMORY[0x1E0CDF8C8]);
  sub_1DADF2928();
  sub_1DAE0CF48();
  (*(void (**)(_BYTE *, uint64_t))(v5 + 8))(v7, v4);
  (*(void (**)(uint64_t, _BYTE *, uint64_t))(v9 + 16))(a2, v11, v8);
  v12 = (uint64_t (**)())(a2 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F029B378) + 36));
  *v12 = sub_1DADF1B80;
  v12[1] = 0;
  return (*(uint64_t (**)(_BYTE *, uint64_t))(v9 + 8))(v11, v8);
}

uint64_t sub_1DADF18E0@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  char v7;
  uint64_t v8;

  v3 = a1[3];
  v4 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v3);
  (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
  sub_1DADE63A4();
  result = sub_1DAE0CF18();
  *(_QWORD *)a2 = result;
  *(_QWORD *)(a2 + 8) = v6;
  *(_BYTE *)(a2 + 16) = v7 & 1;
  *(_QWORD *)(a2 + 24) = v8;
  return result;
}

uint64_t sub_1DADF1958@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t KeyPath;
  uint64_t v18;
  uint64_t v20;
  uint64_t v21;

  v21 = a2;
  v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B3D0);
  MEMORY[0x1E0C80A78](v3);
  v5 = (uint64_t *)((char *)&v20 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  v6 = sub_1DAE0D014();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v20 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B388);
  v20 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v12 = (uint64_t *)((char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0));
  v13 = a1[3];
  v14 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v13);
  (*(void (**)(uint64_t, uint64_t))(v14 + 24))(v13, v14);
  if (!v15)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v20 + 56))(v21, 1, 1, v10);
  v16 = sub_1DAE0CFFC();
  (*(void (**)(char *, _QWORD, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E0CDF7D0], v6);
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, char *, uint64_t))(v7 + 16))((char *)v5 + *(int *)(v3 + 28), v9, v6);
  *v5 = KeyPath;
  sub_1DADEC1E0((uint64_t)v5, (uint64_t)v12 + *(int *)(v10 + 36), &qword_1F029B3D0);
  *v12 = v16;
  sub_1DAE0C564();
  sub_1DADDCC3C((uint64_t)v5, &qword_1F029B3D0);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  swift_release();
  v18 = v21;
  sub_1DADE9D90((uint64_t)v12, v21, &qword_1F029B388);
  return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v20 + 56))(v18, 0, 1, v10);
}

uint64_t sub_1DADF1B80()
{
  return sub_1DAE0CAEC();
}

uint64_t sub_1DADF1BA4@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, uint64_t *a4@<X8>)
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  unint64_t v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  unint64_t v30;
  id v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t *v36;
  uint64_t result;
  unint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  _BYTE v42[40];

  v7 = a3;
  objc_msgSend(a1, sel_headerInsetsWithAttributes_sectionIndex_, v7, sub_1DAE0C84C());
  v9 = v8;
  v11 = v10;

  v12 = objc_msgSend(a1, sel_section);
  v13 = objc_msgSend(v12, sel_collectionSection);

  if (v13)
  {
    v14 = 0;
    if (!v12)
    {
      v21 = 0xE000000000000000;
      v41 = 0;
      v22 = objc_msgSend(a1, sel_section, 0);
      goto LABEL_21;
    }
    v41 = 0;
    v15 = objc_msgSend(v12, sel_collectionSection, 0);
  }
  else
  {
    if (!v12)
    {
LABEL_19:
      v14 = 0;
      v38 = 0;
      v41 = 0;
      v21 = 0xE000000000000000;
      goto LABEL_20;
    }
    v16 = objc_msgSend(v12, sel_resultSection);
    if (v16
      && (v17 = v16, v18 = objc_msgSend(v16, sel_subtitle), v17, v18))
    {
      v19 = sub_1DAE0D53C();
      v39 = v20;
      v41 = v19;

      v15 = objc_msgSend(v12, sel_collectionSection, v39);
    }
    else
    {
      v41 = 0;
      v15 = objc_msgSend(v12, sel_collectionSection, 0);
    }
  }
  v23 = v15;
  if (!v23
    || (v24 = v23, v25 = objc_msgSend(v23, sel_title), v24, !v25)
    || (v26 = objc_msgSend(v25, sel_text), v25, !v26))
  {
    v27 = objc_msgSend(v12, sel_resultSection);
    if (!v27
      || (v28 = v27, v26 = objc_msgSend(v27, sel_title), v28, !v26))
    {
      v21 = v38;
      if (v38)
      {
        v14 = 0;
        v22 = objc_msgSend(a1, sel_section, 0);
        goto LABEL_21;
      }
      goto LABEL_19;
    }
  }
  v29 = sub_1DAE0D53C();
  v21 = v30;

  v14 = v41;
  v41 = v29;
LABEL_20:
  v22 = objc_msgSend(a1, sel_section, v38);
LABEL_21:
  v31 = v22;
  if (v31)
  {
    v32 = v31;
    v33 = objc_msgSend(v31, sel_resultSection);

    sub_1DADF1F64(v7, (uint64_t)v42);
    sub_1DAE0D788();
    swift_bridgeObjectRelease();
    sub_1DAE0C84C();
    sub_1DAE0D884();
    sub_1DAE0D56C();
    swift_bridgeObjectRelease();
    sub_1DAE0D56C();
    swift_bridgeObjectRetain();
    sub_1DAE0D56C();

    swift_bridgeObjectRelease();
    v34 = sub_1DAE0C858();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v34 - 8) + 8))(a2, v34);
    v35 = type metadata accessor for Header();
    v36 = (uint64_t *)((char *)a4 + *(int *)(v35 + 36));
    *v36 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
    swift_storeEnumTagMultiPayload();
    *a4 = v41;
    a4[1] = v21;
    a4[2] = v14;
    a4[3] = v40;
    a4[4] = v9;
    a4[5] = 0;
    a4[6] = v11;
    a4[7] = 0;
    a4[8] = (uint64_t)v33;
    result = sub_1DADE9D90((uint64_t)v42, (uint64_t)a4 + *(int *)(v35 + 40), &qword_1F029B0E8);
    a4[9] = 0xD000000000000021;
    a4[10] = 0x80000001DAE23840;
  }
  else
  {
    result = swift_bridgeObjectRelease();
    __break(1u);
  }
  return result;
}

void *sub_1DADF1F64@<X0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  void *v2;
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  void *result;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id, id, uint64_t, uint64_t);
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  char *v23;
  id v24;
  uint64_t v25;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33[3];

  v31 = a1;
  v4 = objc_msgSend(v2, sel_section);
  if (v4)
  {
    v5 = v4;
    v6 = objc_msgSend(v4, sel_resultSection);

    if (v6)
    {
      v7 = objc_msgSend(v6, sel_bundleIdentifier);

      if (v7)
      {
        v8 = sub_1DAE0D53C();
        v10 = v9;

        if (qword_1F029B4D0 != -1)
          swift_once();
        v11 = sub_1DADDED60(v8, v10, qword_1F029B4C0);
        result = (void *)swift_bridgeObjectRelease();
        if ((v11 & 1) != 0)
          goto LABEL_14;
      }
    }
  }
  if (qword_1F029B4B8 != -1)
    swift_once();
  result = off_1F029B4A8;
  v30 = *((_QWORD *)off_1F029B4A8 + 2);
  if (!v30)
  {
LABEL_14:
    *(_QWORD *)(a2 + 32) = 0;
    *(_OWORD *)a2 = 0u;
    *(_OWORD *)(a2 + 16) = 0u;
  }
  else
  {
    v28 = a2;
    v13 = swift_bridgeObjectRetain();
    v14 = 0;
    while (1)
    {
      v15 = v13;
      v16 = v13 + 16 * v14;
      v17 = *(_QWORD *)(v16 + 40);
      v18 = *(void (**)(id, id, uint64_t, uint64_t))(v17 + 48);
      v29 = *(_OWORD *)(v16 + 32);
      v19 = v29;
      v20 = sub_1DAE0D710();
      v21 = *(_QWORD *)(v20 - 8);
      MEMORY[0x1E0C80A78](v20);
      v23 = (char *)&v27 - v22;
      v24 = v32;
      v18(v24, v31, v19, v17);
      v25 = *(_QWORD *)(v19 - 8);
      if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v25 + 48))(v23, 1, v19) != 1)
        break;
      ++v14;
      (*(void (**)(char *, uint64_t))(v21 + 8))(v23, v20);
      memset(v33, 0, 40);
      sub_1DADDCC3C((uint64_t)v33, &qword_1F029B0E8);
      v13 = v15;
      if (v30 == v14)
      {
        result = (void *)swift_bridgeObjectRelease();
        a2 = v28;
        goto LABEL_14;
      }
    }
    *(__int128 *)((char *)&v33[1] + 8) = v29;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)v33);
    (*(void (**)(uint64_t *, char *, uint64_t))(v25 + 32))(boxed_opaque_existential_1, v23, v19);
    swift_bridgeObjectRelease();
    return (void *)sub_1DADE25E0(v33, v28);
  }
  return result;
}

uint64_t sub_1DADF21F4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(v0 + 72);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADF2220@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  __int128 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t result;
  __int128 v9;
  _OWORD v10[2];
  uint64_t v11;

  v4 = *MEMORY[0x1E0DC3298];
  v5 = *(_QWORD *)(MEMORY[0x1E0DC3298] + 16);
  v6 = *(_QWORD *)(MEMORY[0x1E0DC3298] + 24);
  v11 = 0;
  v9 = v4;
  memset(v10, 0, sizeof(v10));
  v7 = (uint64_t *)(a2 + *(int *)(a1 + 36));
  *v7 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B508);
  swift_storeEnumTagMultiPayload();
  *(_QWORD *)a2 = 0;
  *(_QWORD *)(a2 + 8) = 0xE000000000000000;
  *(_QWORD *)(a2 + 16) = 0;
  *(_QWORD *)(a2 + 24) = 0;
  *(_OWORD *)(a2 + 32) = v9;
  *(_QWORD *)(a2 + 48) = v5;
  *(_QWORD *)(a2 + 56) = v6;
  *(_QWORD *)(a2 + 64) = 0;
  result = sub_1DADE9D90((uint64_t)v10, a2 + *(int *)(a1 + 40), &qword_1F029B0E8);
  *(_QWORD *)(a2 + 72) = 0;
  *(_QWORD *)(a2 + 80) = 0;
  return result;
}

uint64_t sub_1DADF22E8()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B4F8);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DAE1EA70;
  v1 = type metadata accessor for ButtonItemHeaderAction();
  v2 = sub_1DADE25F8(&qword_1F029B428, (uint64_t (*)(uint64_t))type metadata accessor for ButtonItemHeaderAction, (uint64_t)&unk_1DAE1EEA4);
  *(_QWORD *)(v0 + 32) = v1;
  *(_QWORD *)(v0 + 40) = v2;
  v3 = type metadata accessor for ExpandSectionHeaderAction();
  result = sub_1DADE25F8(&qword_1F029B468, (uint64_t (*)(uint64_t))type metadata accessor for ExpandSectionHeaderAction, (uint64_t)&unk_1DAE1EFCC);
  *(_QWORD *)(v0 + 48) = v3;
  *(_QWORD *)(v0 + 56) = result;
  off_1F029B4A8 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1DADF2388()
{
  uint64_t inited;
  uint64_t v1;
  uint64_t v2;
  uint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B500);
  inited = swift_initStackObject();
  *(_OWORD *)(inited + 16) = xmmword_1DAE1EA70;
  *(_QWORD *)(inited + 32) = sub_1DAE0D53C();
  *(_QWORD *)(inited + 40) = v1;
  *(_QWORD *)(inited + 48) = 0xD00000000000001DLL;
  *(_QWORD *)(inited + 56) = 0x80000001DAE23870;
  v2 = sub_1DADDFEE4(inited);
  swift_setDeallocating();
  result = swift_arrayDestroy();
  qword_1F029B4C0 = v2;
  return result;
}

uint64_t sub_1DADF243C()
{
  return sub_1DAE0CC0C();
}

uint64_t sub_1DADF245C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADDEE94(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0CDB388], MEMORY[0x1E0CDA5C0]);
}

uint64_t sub_1DADF2490(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADF24D4@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0CC48();
  *a1 = result;
  return result;
}

uint64_t sub_1DADF24FC()
{
  sub_1DAE0C564();
  return sub_1DAE0CC54();
}

unint64_t sub_1DADF2524()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B658;
  if (!qword_1F029B658)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B660);
    v2[0] = sub_1DADF25A8();
    v2[1] = sub_1DADDD9BC(&qword_1F029B3B8, &qword_1F029B3C0, MEMORY[0x1E0CDCF80]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B658);
  }
  return result;
}

unint64_t sub_1DADF25A8()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B628;
  if (!qword_1F029B628)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B630);
    v2[0] = sub_1DADF262C();
    v2[1] = sub_1DADE25F8((unint64_t *)&qword_1F029B6F0, (uint64_t (*)(uint64_t))type metadata accessor for SearchUIAppearance, (uint64_t)&protocol conformance descriptor for SearchUIAppearance);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B628);
  }
  return result;
}

unint64_t sub_1DADF262C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B5E8;
  if (!qword_1F029B5E8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B5F0);
    v2[0] = sub_1DADF2698();
    v2[1] = MEMORY[0x1E0CD9758];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B5E8);
  }
  return result;
}

unint64_t sub_1DADF2698()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F029B680;
  if (!qword_1F029B680)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B688);
    v2 = MEMORY[0x1E0CDFB10];
    v3[0] = sub_1DADDD9BC(&qword_1F029B6D0, &qword_1F029B6D8, MEMORY[0x1E0CDFB10]);
    v3[1] = sub_1DADDD9BC(&qword_1F029B6C0, &qword_1F029B6C8, v2);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDB8A0], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F029B680);
  }
  return result;
}

uint64_t sub_1DADF273C(uint64_t a1, uint64_t a2, char a3)
{
  if ((a3 & 1) != 0)
    return sub_1DAE0C564();
  else
    return swift_bridgeObjectRetain();
}

uint64_t sub_1DADF274C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1DADF273C(result, a2, a3 & 1);
    return swift_bridgeObjectRetain();
  }
  return result;
}

uint64_t sub_1DADF277C(uint64_t result, uint64_t a2, char a3, uint64_t a4)
{
  if (a4)
  {
    sub_1DADE68D8(result, a2, a3 & 1);
    return swift_bridgeObjectRelease();
  }
  return result;
}

uint64_t sub_1DADF27AC(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 24);
  *(_QWORD *)(a2 + 24) = v3;
  *(_QWORD *)(a2 + 32) = *(_QWORD *)(a1 + 32);
  (**(void (***)(uint64_t, uint64_t))(v3 - 8))(a2, a1);
  return a2;
}

uint64_t sub_1DADF27F0()
{
  uint64_t v0;

  __swift_destroy_boxed_opaque_existential_0(v0 + 16);
  return swift_deallocObject();
}

uint64_t sub_1DADF2814()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;

  v1 = v0[5];
  v2 = v0[6];
  __swift_project_boxed_opaque_existential_1(v0 + 2, v1);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v2 + 40))(v1, v2);
}

uint64_t sub_1DADF2858@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADF1738(*(_QWORD *)(v1 + 16), a1);
}

unint64_t sub_1DADF2860()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[6];

  result = qword_1F029B370;
  if (!qword_1F029B370)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B378);
    v2[2] = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B3E8);
    v2[3] = &type metadata for TrailingIconLabelStyle;
    v2[4] = sub_1DADDD9BC(&qword_1F029B3E0, &qword_1F029B3E8, MEMORY[0x1E0CDF8C8]);
    v2[5] = sub_1DADF2928();
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = MEMORY[0x1E0CDBC38];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B370);
  }
  return result;
}

unint64_t sub_1DADF2928()
{
  unint64_t result;

  result = qword_1F029B440;
  if (!qword_1F029B440)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1DFE8, &type metadata for TrailingIconLabelStyle);
    atomic_store(result, (unint64_t *)&qword_1F029B440);
  }
  return result;
}

unint64_t sub_1DADF296C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B608;
  if (!qword_1F029B608)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B610);
    v2[0] = sub_1DADDD9BC(&qword_1F029B3F0, &qword_1F029B3F8, MEMORY[0x1E0CDFA58]);
    v2[1] = sub_1DADE25F8((unint64_t *)&qword_1F029B6F0, (uint64_t (*)(uint64_t))type metadata accessor for SearchUIAppearance, (uint64_t)&protocol conformance descriptor for SearchUIAppearance);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B608);
  }
  return result;
}

uint64_t sub_1DADF2A08@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADF18E0(*(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_1DADF2A10@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADF1958(*(_QWORD **)(v1 + 16), a1);
}

unint64_t sub_1DADF2A18()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F029B398;
  if (!qword_1F029B398)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B390);
    v2 = sub_1DADF2A7C();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CE0798], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F029B398);
  }
  return result;
}

unint64_t sub_1DADF2A7C()
{
  unint64_t result;
  uint64_t v1;
  uint64_t v2;
  _QWORD v3[2];

  result = qword_1F029B380;
  if (!qword_1F029B380)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B388);
    v2 = sub_1DADDD9BC(&qword_1F029B3C8, &qword_1F029B3D0, MEMORY[0x1E0CDCF80]);
    v3[0] = MEMORY[0x1E0CDF820];
    v3[1] = v2;
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v3);
    atomic_store(result, (unint64_t *)&qword_1F029B380);
  }
  return result;
}

uint64_t sub_1DADF2B00()
{
  return sub_1DAE0CBD0();
}

uint64_t sub_1DADF2B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return sub_1DADDEE94(a1, a2, a3, a4, (void (*)(_QWORD))MEMORY[0x1E0CDF7E8], MEMORY[0x1E0CDA4B0]);
}

uint64_t sub_1DADF2B44()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B660);
  sub_1DADF2524();
  return swift_getOpaqueTypeConformance2();
}

uint64_t destroy for SearchUIUserReportRequestImageSection(id *a1)
{

  return swift_bridgeObjectRelease();
}

_QWORD *_s8SearchUI37SearchUIUserReportRequestImageSectionVwCP_0(_QWORD *a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  id v5;

  v3 = *(void **)a2;
  v4 = *(_QWORD *)(a2 + 8);
  *a1 = *(_QWORD *)a2;
  a1[1] = v4;
  a1[2] = *(_QWORD *)(a2 + 16);
  v5 = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t assignWithCopy for SearchUIUserReportRequestImageSection(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  id v6;

  v4 = *(void **)a1;
  v5 = *(void **)a2;
  *(_QWORD *)a1 = *(_QWORD *)a2;
  v6 = v5;

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

uint64_t assignWithTake for SearchUIUserReportRequestImageSection(uint64_t a1, _QWORD *a2)
{
  void *v4;
  uint64_t v5;

  v4 = *(void **)a1;
  *(_QWORD *)a1 = *a2;

  v5 = a2[2];
  *(_QWORD *)(a1 + 8) = a2[1];
  *(_QWORD *)(a1 + 16) = v5;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIUserReportRequestImageSection(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIUserReportRequestImageSection(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchUIUserReportRequestImageSection()
{
  return &type metadata for SearchUIUserReportRequestImageSection;
}

uint64_t sub_1DADF2D48()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADF2D58@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  char *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  char v39;
  __int128 v40;
  __int128 v41;
  char v42;

  v31 = a4;
  v7 = sub_1DAE0CAB0();
  v29 = *(_QWORD *)(v7 - 8);
  v30 = v7;
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v28 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E028);
  v11 = *(_QWORD *)(v10 - 8);
  MEMORY[0x1E0C80A78](v10);
  v13 = (char *)&v28 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E030);
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)&v28 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v32 = a1;
  v33 = a2;
  v34 = a3;
  v35 = a2;
  v36 = a3;
  sub_1DADE63A4();
  swift_bridgeObjectRetain();
  v17 = sub_1DAE0CF18();
  v19 = v18;
  LOBYTE(a1) = v20;
  v22 = v21;
  v23 = sub_1DAE0CEAC();
  v35 = v17;
  v36 = v19;
  v37 = a1 & 1;
  v38 = v22;
  v39 = v23;
  v40 = xmmword_1DAE1EC50;
  v41 = xmmword_1DAE1EC50;
  v42 = 0;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DC30);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E038);
  sub_1DADF3354((unint64_t *)&qword_1F029DC40, &qword_1F029DC30, MEMORY[0x1E0CDDD58], MEMORY[0x1E0CD9758]);
  sub_1DADF322C();
  sub_1DAE0D0E0();
  (*(void (**)(char *, char *, uint64_t))(v11 + 16))(v16, v13, v10);
  v24 = &v16[*(int *)(v14 + 36)];
  v24[32] = 0;
  *(_OWORD *)v24 = 0u;
  *((_OWORD *)v24 + 1) = 0u;
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
  v26 = v29;
  v25 = v30;
  (*(void (**)(char *, _QWORD, uint64_t))(v29 + 104))(v9, *MEMORY[0x1E0CD84F8], v30);
  sub_1DADF33B4();
  sub_1DAE0CF78();
  (*(void (**)(char *, uint64_t))(v26 + 8))(v9, v25);
  return sub_1DADF34D0((uint64_t)v16);
}

double sub_1DADF2FC0@<D0>(void *a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t KeyPath;
  double result;
  __int128 v17;
  uint64_t v18;
  __int16 v19;
  char v20;
  uint64_t v21;
  __int128 v22;
  uint64_t v23;
  _QWORD v24[2];
  __int128 v25;
  __int128 v26;
  uint64_t v27;
  __int16 v28;
  char v29;

  v4 = sub_1DAE0D008();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v21 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a1)
  {
    v8 = a1;
    sub_1DAE0CFF0();
    (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0CDF6F8], v4);
    v9 = sub_1DAE0D020();
    swift_release();
    (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
    v21 = v9;
    v22 = xmmword_1DAE1EC60;
    v23 = 0;
    memset(v24, 0, 11);
    sub_1DAE0C564();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E050);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E080);
    sub_1DADF32B0();
    sub_1DADDD9BC(&qword_1F029E078, &qword_1F029E080, MEMORY[0x1E0CDFCF8]);
    sub_1DAE0CD74();
    swift_release();

  }
  else
  {
    v10 = sub_1DAE0D104();
    v12 = v11;
    v13 = objc_msgSend((id)objc_opt_self(), sel_secondarySystemGroupedBackgroundColor);
    v14 = MEMORY[0x1DF0A76FC](v13);
    KeyPath = swift_getKeyPath();
    v21 = v10;
    *(_QWORD *)&v22 = v12;
    *((_QWORD *)&v22 + 1) = KeyPath;
    v23 = v14;
    v24[0] = 0x3FF0000000000000;
    LOWORD(v24[1]) = 256;
    BYTE2(v24[1]) = 1;
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E050);
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E080);
    sub_1DADF32B0();
    sub_1DADDD9BC(&qword_1F029E078, &qword_1F029E080, MEMORY[0x1E0CDFCF8]);
    sub_1DAE0CD74();
  }
  result = *(double *)&v25;
  v17 = v26;
  v18 = v27;
  v19 = v28;
  v20 = v29;
  *(_OWORD *)a2 = v25;
  *(_OWORD *)(a2 + 16) = v17;
  *(_QWORD *)(a2 + 32) = v18;
  *(_WORD *)(a2 + 40) = v19;
  *(_BYTE *)(a2 + 42) = v20;
  return result;
}

uint64_t sub_1DADF3214@<X0>(uint64_t a1@<X8>)
{
  uint64_t *v1;

  return sub_1DADF2D58(*v1, v1[1], v1[2], a1);
}

double sub_1DADF3220@<D0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADF2FC0(*(void **)(v1 + 16), a1);
}

unint64_t sub_1DADF322C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029E040;
  if (!qword_1F029E040)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E038);
    v2[0] = sub_1DADF32B0();
    v2[1] = sub_1DADDD9BC(&qword_1F029E078, &qword_1F029E080, MEMORY[0x1E0CDFCF8]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDB8A0], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029E040);
  }
  return result;
}

unint64_t sub_1DADF32B0()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029E048;
  if (!qword_1F029E048)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E050);
    v2[0] = sub_1DADF3354(&qword_1F029E058, &qword_1F029E060, MEMORY[0x1E0CDF820], MEMORY[0x1E0CDB158]);
    v2[1] = sub_1DADDD9BC(&qword_1F029E068, &qword_1F029E070, MEMORY[0x1E0CD89F0]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029E048);
  }
  return result;
}

uint64_t sub_1DADF3354(unint64_t *a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;
  uint64_t v8;
  _QWORD v9[2];

  result = *a1;
  if (!result)
  {
    v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    v9[0] = a3;
    v9[1] = a4;
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v8, v9);
    atomic_store(result, a1);
  }
  return result;
}

unint64_t sub_1DADF33B4()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029E088;
  if (!qword_1F029E088)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E030);
    v2[0] = sub_1DADF3438();
    v2[1] = sub_1DADDD9BC(&qword_1F029E098, qword_1F029E0A0, MEMORY[0x1E0CDBEF0]);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029E088);
  }
  return result;
}

unint64_t sub_1DADF3438()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[3];

  result = qword_1F029E090;
  if (!qword_1F029E090)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E028);
    v2[0] = sub_1DADF3354((unint64_t *)&qword_1F029DC40, &qword_1F029DC30, MEMORY[0x1E0CDDD58], MEMORY[0x1E0CD9758]);
    v2[1] = sub_1DADF322C();
    v2[2] = MEMORY[0x1E0CE0400];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDFF98], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029E090);
  }
  return result;
}

uint64_t sub_1DADF34D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E030);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADF3510@<X0>(uint64_t *a1@<X8>)
{
  uint64_t result;

  result = sub_1DAE0CC18();
  *a1 = result;
  return result;
}

uint64_t sub_1DADF3538()
{
  sub_1DAE0C564();
  return sub_1DAE0CC24();
}

uint64_t sub_1DADF3560()
{
  __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E030);
  sub_1DADF33B4();
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADF35AC()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADE2638;
  return sub_1DAE0C984();
}

uint64_t sub_1DADF3760(int a1, int a2, int a3, void *aBlock)
{
  _QWORD *v4;
  uint64_t v5;
  _QWORD *v6;

  v4[2] = _Block_copy(aBlock);
  sub_1DAE0D53C();
  v4[3] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v4[4] = v6;
  *v6 = v4;
  v6[1] = sub_1DADED5B4;
  return sub_1DAE0C984();
}

uint64_t sub_1DADF37F0()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADDA484;
  return sub_1DAE0C978();
}

uint64_t sub_1DADF3994(int a1, int a2, void *aBlock)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD *v6;

  v3[2] = _Block_copy(aBlock);
  sub_1DAE0D53C();
  v3[3] = v4;
  sub_1DAE0D53C();
  v3[4] = v5;
  v6 = (_QWORD *)swift_task_alloc();
  v3[5] = v6;
  *v6 = v3;
  v6[1] = sub_1DADF3A30;
  return sub_1DAE0C978();
}

uint64_t sub_1DADF3A30()
{
  void *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *v1;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(_QWORD *)(v2 + 16);
  if (v0)
  {
    v4 = (void *)sub_1DAE0C72C();

    (*(void (**)(uint64_t, void *))(v3 + 16))(v3, v4);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD))(v3 + 16))(*(_QWORD *)(v2 + 16), 0);
  }
  _Block_release(*(const void **)(v2 + 16));
  return (*(uint64_t (**)(void))(v2 + 8))();
}

id SearchUIMarketplaceKitUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUIMarketplaceKitUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

uint64_t type metadata accessor for SearchUIMarketplaceKitUtilities()
{
  return objc_opt_self();
}

id SearchUIMarketplaceKitUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMarketplaceKitUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t method lookup function for SearchUIMarketplaceKitUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SearchUIMarketplaceKitUtilities.requestProductPage(distributorID:itemID:versionID:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 80) + *(_QWORD *)(v4 + 80));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1DADE2638;
  return v12(a1, a2, a3, a4);
}

uint64_t dispatch thunk of static SearchUIMarketplaceKitUtilities.requestSearchPage(distributorID:searchString:)(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  _QWORD *v10;
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = (uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(**(int **)(v4 + 88) + *(_QWORD *)(v4 + 88));
  v10 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 16) = v10;
  *v10 = v5;
  v10[1] = sub_1DADDA484;
  return v12(a1, a2, a3, a4);
}

uint64_t sub_1DADF3CCC()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1DADF3D00()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;
  _QWORD *v5;

  v2 = v0[2];
  v3 = v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DADDA484;
  return ((uint64_t (*)(int, int, void *))((char *)&dword_1F029E0F0 + dword_1F029E0F0))(v2, v3, v4);
}

uint64_t sub_1DADF3D80()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 40));
  return swift_deallocObject();
}

uint64_t sub_1DADF3DAC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  _QWORD *v6;

  v2 = v0[2];
  v3 = v0[3];
  v4 = v0[4];
  v5 = (void *)v0[5];
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v6;
  *v6 = v1;
  v6[1] = sub_1DADE2638;
  return ((uint64_t (*)(int, int, int, void *))((char *)&dword_1F029E100 + dword_1F029E100))(v2, v3, v4, v5);
}

uint64_t sub_1DADF3E34()
{
  return 0;
}

uint64_t sub_1DADF3F70(void *a1, void *aBlock, void *a3)
{
  _QWORD *v3;
  id v6;
  id v7;
  _QWORD *v8;
  uint64_t (*v10)(uint64_t);

  v3[2] = a1;
  v3[3] = a3;
  v3[4] = _Block_copy(aBlock);
  v10 = (uint64_t (*)(uint64_t))((char *)&dword_1F029E130 + dword_1F029E130);
  v6 = a1;
  v7 = a3;
  v8 = (_QWORD *)swift_task_alloc();
  v3[5] = v8;
  *v8 = v3;
  v8[1] = sub_1DADF3FFC;
  return v10((uint64_t)v6);
}

uint64_t sub_1DADF3FFC()
{
  uint64_t *v0;
  void (**v1)(_QWORD, _QWORD);
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  v1 = *(void (***)(_QWORD, _QWORD))(*v0 + 32);
  v3 = *(void **)(*v0 + 16);
  v2 = *(void **)(*v0 + 24);
  v6 = *v0;
  swift_task_dealloc();

  v4 = (void *)sub_1DAE0D5C0();
  swift_bridgeObjectRelease();
  ((void (**)(_QWORD, void *))v1)[2](v1, v4);

  _Block_release(v1);
  return (*(uint64_t (**)(void))(v6 + 8))();
}

id sub_1DADF40D0()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIWeatherColor();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for SearchUIWeatherColor()
{
  return objc_opt_self();
}

uint64_t sub_1DADF4120()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DADF4154()
{
  _QWORD *v0;
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  _QWORD *v5;

  v2 = (void *)v0[2];
  v3 = (void *)v0[3];
  v4 = (void *)v0[4];
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DADDA484;
  return ((uint64_t (*)(void *, void *, void *))((char *)&dword_1F029E120 + dword_1F029E120))(v2, v3, v4);
}

uint64_t sub_1DADF41C8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v1[3] = a1;
  v2 = sub_1DAE0D494();
  v1[4] = v2;
  v1[5] = *(_QWORD *)(v2 - 8);
  v1[6] = swift_task_alloc();
  v3 = sub_1DAE0D47C();
  v1[7] = v3;
  v1[8] = *(_QWORD *)(v3 - 8);
  v1[9] = swift_task_alloc();
  v4 = sub_1DAE0D434();
  v1[10] = v4;
  v1[11] = *(_QWORD *)(v4 - 8);
  v1[12] = swift_task_alloc();
  v5 = sub_1DAE0D440();
  v1[13] = v5;
  v1[14] = *(_QWORD *)(v5 - 8);
  v1[15] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B538);
  v1[16] = swift_task_alloc();
  v6 = sub_1DAE0C7C8();
  v1[17] = v6;
  v1[18] = *(_QWORD *)(v6 - 8);
  v1[19] = swift_task_alloc();
  v1[20] = swift_task_alloc();
  v7 = sub_1DAE0D4AC();
  v1[21] = v7;
  v1[22] = *(_QWORD *)(v7 - 8);
  v1[23] = swift_task_alloc();
  v1[24] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B540);
  v1[25] = swift_task_alloc();
  v8 = sub_1DAE0C828();
  v1[26] = v8;
  v1[27] = *(_QWORD *)(v8 - 8);
  v1[28] = swift_task_alloc();
  v1[29] = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(qword_1F029B548);
  v1[30] = swift_task_alloc();
  v9 = sub_1DAE0C870();
  v1[31] = v9;
  v1[32] = *(_QWORD *)(v9 - 8);
  v1[33] = swift_task_alloc();
  v1[34] = swift_task_alloc();
  v1[35] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADF43F8()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, uint64_t, uint64_t);
  uint64_t v15;
  NSObject *v16;
  os_log_type_t v17;
  uint8_t *v18;
  double v19;
  double v20;
  double v21;
  id v22;
  id v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, uint64_t, uint64_t);
  void *v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void (*v37)(uint64_t, uint64_t, uint64_t);
  uint64_t v38;
  id v39;
  NSObject *v40;
  os_log_type_t v41;
  uint8_t *v42;
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
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
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
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
  uint64_t v74;
  _QWORD *v75;
  uint64_t v76;
  void *v77;
  void *v78;

  v1 = objc_msgSend(*(id *)(v0 + 24), sel_location);
  if (v1)
  {
    v2 = v1;
    v3 = *(void **)(v0 + 24);
    (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(v0 + 256) + 104))(*(_QWORD *)(v0 + 280), *MEMORY[0x1E0CEEAD8], *(_QWORD *)(v0 + 248));
    v4 = objc_msgSend(v3, sel_condition);
    if (v4)
    {
      v5 = v4;
      v7 = *(_QWORD *)(v0 + 248);
      v6 = *(_QWORD *)(v0 + 256);
      v8 = *(_QWORD *)(v0 + 240);
      sub_1DAE0D53C();

      sub_1DAE0C864();
      v9 = (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 48))(v8, 1, v7);
      v10 = *(_QWORD *)(v0 + 272);
      v12 = *(_QWORD *)(v0 + 248);
      v11 = *(_QWORD *)(v0 + 256);
      v13 = *(_QWORD *)(v0 + 240);
      if (v9 == 1)
      {
        v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
        v14(*(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 248));
        sub_1DADDCC3C(v13, qword_1F029B548);
      }
      else
      {
        (*(void (**)(_QWORD, _QWORD))(v11 + 8))(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 248));
        v14 = *(void (**)(uint64_t, uint64_t, uint64_t))(v11 + 32);
        v14(v10, v13, v12);
      }
      v14(*(_QWORD *)(v0 + 280), *(_QWORD *)(v0 + 272), *(_QWORD *)(v0 + 248));
    }
    objc_msgSend(v2, sel_lat);
    v20 = v19;
    objc_msgSend(v2, sel_lng);
    v22 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0C9E3B8]), sel_initWithLatitude_longitude_, v20, v21);
    v23 = objc_msgSend((id)objc_opt_self(), sel__timeZoneAtLocation_, v22);
    if (v23)
    {
      v24 = v23;
      v26 = *(_QWORD *)(v0 + 216);
      v25 = *(_QWORD *)(v0 + 224);
      v28 = *(_QWORD *)(v0 + 200);
      v27 = *(_QWORD *)(v0 + 208);
      sub_1DAE0C81C();

      v29 = *(void (**)(uint64_t, uint64_t, uint64_t))(v26 + 32);
      v29(v28, v25, v27);
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v26 + 56))(v28, 0, 1, v27);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v26 + 48))(v28, 1, v27) != 1)
      {
        v30 = *(void **)(v0 + 24);
        v29(*(_QWORD *)(v0 + 232), *(_QWORD *)(v0 + 200), *(_QWORD *)(v0 + 208));
        objc_msgSend(v22, sel_coordinate);
        v31 = objc_msgSend(v30, sel_date);
        v77 = v22;
        v78 = v2;
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)(v0 + 144);
          v34 = *(_QWORD *)(v0 + 152);
          v36 = *(_QWORD *)(v0 + 128);
          v35 = *(_QWORD *)(v0 + 136);
          sub_1DAE0C7B0();

          v37 = *(void (**)(uint64_t, uint64_t, uint64_t))(v33 + 32);
          v37(v36, v34, v35);
          (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v33 + 56))(v36, 0, 1, v35);
          if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v33 + 48))(v36, 1, v35) != 1)
          {
            v37(*(_QWORD *)(v0 + 160), *(_QWORD *)(v0 + 128), *(_QWORD *)(v0 + 136));
LABEL_28:
            v49 = *(_QWORD *)(v0 + 280);
            v50 = *(_QWORD *)(v0 + 256);
            v59 = *(_QWORD *)(v0 + 264);
            v51 = *(_QWORD *)(v0 + 248);
            v69 = *(_QWORD *)(v0 + 232);
            v74 = *(_QWORD *)(v0 + 216);
            v76 = *(_QWORD *)(v0 + 208);
            v52 = *(_QWORD *)(v0 + 192);
            v58 = *(_QWORD *)(v0 + 184);
            v53 = *(_QWORD *)(v0 + 168);
            v54 = *(_QWORD *)(v0 + 176);
            v55 = *(_QWORD *)(v0 + 160);
            v57 = *(_QWORD *)(v0 + 136);
            v56 = *(_QWORD *)(v0 + 144);
            v65 = *(_QWORD *)(v0 + 120);
            v72 = *(_QWORD *)(v0 + 112);
            v73 = *(_QWORD *)(v0 + 104);
            v60 = *(_QWORD *)(v0 + 88);
            v61 = *(_QWORD *)(v0 + 96);
            v64 = *(_QWORD *)(v0 + 72);
            v62 = *(_QWORD *)(v0 + 80);
            v63 = *(_QWORD *)(v0 + 64);
            v71 = *(_QWORD *)(v0 + 56);
            v66 = *(_QWORD *)(v0 + 48);
            v67 = *(_QWORD *)(v0 + 40);
            v68 = *(_QWORD *)(v0 + 32);
            sub_1DAE0D470();
            (*(void (**)(uint64_t, uint64_t))(v56 + 8))(v55, v57);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v50 + 16))(v59, v49, v51);
            (*(void (**)(uint64_t, uint64_t, uint64_t))(v54 + 16))(v58, v52, v53);
            sub_1DAE0D4A0();
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v60 + 104))(v61, *MEMORY[0x1E0DCC8A0], v62);
            (*(void (**)(uint64_t, _QWORD, uint64_t))(v63 + 104))(v64, *MEMORY[0x1E0DCC968], v71);
            sub_1DAE0D428();
            sub_1DAE0D464();
            swift_allocObject();
            sub_1DAE0D458();
            sub_1DAE0D44C();
            swift_release();
            v70 = sub_1DAE0D488();

            (*(void (**)(uint64_t, uint64_t))(v67 + 8))(v66, v68);
            (*(void (**)(uint64_t, uint64_t))(v72 + 8))(v65, v73);
            (*(void (**)(uint64_t, uint64_t))(v54 + 8))(v52, v53);
            (*(void (**)(uint64_t, uint64_t))(v74 + 8))(v69, v76);
            (*(void (**)(uint64_t, uint64_t))(v50 + 8))(v49, v51);
            goto LABEL_25;
          }
        }
        else
        {
          (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 144) + 56))(*(_QWORD *)(v0 + 128), 1, 1, *(_QWORD *)(v0 + 136));
        }
        v48 = *(_QWORD *)(v0 + 128);
        sub_1DAE0C7BC();
        sub_1DADDCC3C(v48, &qword_1F029B538);
        goto LABEL_28;
      }
    }
    else
    {
      (*(void (**)(_QWORD, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(v0 + 216) + 56))(*(_QWORD *)(v0 + 200), 1, 1, *(_QWORD *)(v0 + 208));
    }
    sub_1DADDCC3C(*(_QWORD *)(v0 + 200), &qword_1F029B540);
    if (qword_1F029D6B0 != -1)
      swift_once();
    v38 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v38, (uint64_t)qword_1F02A0378);
    v39 = v22;
    v40 = sub_1DAE0CA74();
    v41 = sub_1DAE0D6C8();
    if (os_log_type_enabled(v40, v41))
    {
      v42 = (uint8_t *)swift_slowAlloc();
      v75 = (_QWORD *)swift_slowAlloc();
      *(_DWORD *)v42 = 138412290;
      *(_QWORD *)(v0 + 16) = v39;
      v43 = v39;
      sub_1DAE0D71C();
      *v75 = v22;

      _os_log_impl(&dword_1DAD39000, v40, v41, "Failed to determine timeZone from location: %@", v42, 0xCu);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E138);
      swift_arrayDestroy();
      MEMORY[0x1DF0A8B9C](v75, -1, -1);
      MEMORY[0x1DF0A8B9C](v42, -1, -1);
    }
    else
    {

    }
    v44 = *(_QWORD *)(v0 + 280);
    v45 = *(_QWORD *)(v0 + 248);
    v46 = *(_QWORD *)(v0 + 256);

    (*(void (**)(uint64_t, uint64_t))(v46 + 8))(v44, v45);
  }
  else
  {
    if (qword_1F029D6B0 != -1)
      swift_once();
    v15 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v15, (uint64_t)qword_1F02A0378);
    v16 = sub_1DAE0CA74();
    v17 = sub_1DAE0D6C8();
    if (os_log_type_enabled(v16, v17))
    {
      v18 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v18 = 0;
      _os_log_impl(&dword_1DAD39000, v16, v17, "Invalid SFWeatherColor provided: no coordinates set!", v18, 2u);
      MEMORY[0x1DF0A8B9C](v18, -1, -1);
    }

  }
  v70 = MEMORY[0x1E0DEE9D8];
LABEL_25:
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v0 + 8))(v70);
}

uint64_t sub_1DADF4C28(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return type metadata accessor for SupplementaryHostingView(0, a1, a2, a3);
}

void sub_1DADF4C3C(void *a1, uint64_t a2, unsigned int a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  char *v18;
  void *v19;
  void (*v20)(id, char *, _QWORD, id, uint64_t, uint64_t);
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  unsigned int v26;

  v25 = a5;
  v26 = a3;
  v14 = sub_1DAE0C858();
  v15 = *(_QWORD *)(v14 - 8);
  v16 = MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v25 - ((v17 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v16);
  type metadata accessor for SupplementaryHostingView(0, a6, a7, a8);
  if (swift_dynamicCastClass())
  {
    v19 = (void *)sub_1DADFCE18();
    (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))(v18, a2, v14);
    v20 = *(void (**)(id, char *, _QWORD, id, uint64_t, uint64_t))(a7 + 32);
    v21 = v19;
    v22 = a1;
    v23 = a4;
    v24 = v25;
    v20(v23, v18, v26, v24, a6, a7);
    sub_1DAE0CB94();

  }
}

uint64_t sub_1DADF4DA0(uint64_t a1, uint64_t a2)
{
  return sub_1DADF4DB8(a1, a2, &qword_1ED4D4468);
}

uint64_t sub_1DADF4DAC(uint64_t a1, uint64_t a2)
{
  return sub_1DADF4DB8(a1, a2, &qword_1ED4D4478);
}

uint64_t sub_1DADF4DB8(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  __swift_instantiateConcreteTypeFromMangledName(a3);
  return sub_1DAE0D548();
}

uint64_t sub_1DADF4DE8@<X0>(void *a1@<X0>, uint64_t a2@<X1>, void *a3@<X3>, uint64_t a4@<X8>)
{
  uint64_t KeyPath;
  uint64_t v9;
  uint64_t result;

  KeyPath = swift_getKeyPath();

  v9 = sub_1DAE0C858();
  result = (*(uint64_t (**)(uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 8))(a2, v9);
  *(_QWORD *)a4 = KeyPath;
  *(_BYTE *)(a4 + 8) = 0;
  return result;
}

uint64_t sub_1DADF4E5C@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DAE0CBF4();
  *a1 = v3;
  return result;
}

uint64_t sub_1DADF4E84()
{
  return sub_1DAE0CC00();
}

uint64_t sub_1DADF4EA8@<X0>(_QWORD *a1@<X8>)
{
  uint64_t result;
  uint64_t v3;

  result = sub_1DAE0CBF4();
  *a1 = v3;
  return result;
}

uint64_t sub_1DADF4ED0()
{
  return sub_1DAE0CC00();
}

uint64_t AppDependency<>.init(manager:)()
{
  swift_getMetatypeMetadata();
  sub_1DAE0D548();
  sub_1DAE0D740();
  return sub_1DAE0C468();
}

id sub_1DADF5008()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for RequestUserReportUtility();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t type metadata accessor for RequestUserReportUtility()
{
  return objc_opt_self();
}

uint64_t sub_1DADF5058(void *a1, void *a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD *v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  _QWORD *v23;
  uint64_t *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  _QWORD v31[2];
  _QWORD *v32;
  void *v33;
  char *v34;
  void *v35;
  void *v36;
  void *v37;

  v35 = a2;
  v5 = type metadata accessor for SearchUIUserReportModel();
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)v31 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v6);
  v10 = (_QWORD *)((char *)v31 - v9);
  v11 = type metadata accessor for SearchUIUserReportRequestView();
  MEMORY[0x1E0C80A78](v11);
  v13 = (_QWORD *)((char *)v31 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0));
  if (objc_msgSend(a3, sel_feedbackDelegate))
  {
    v36 = &unk_1F035D1D0;
    v14 = swift_dynamicCastObjCProtocolConditional();
    if (!v14)
      swift_unknownObjectRelease();
  }
  else
  {
    v14 = 0;
  }
  v15 = objc_msgSend(a3, sel_feedbackDelegate);
  if (v14)
  {
    v32 = v10;
    v33 = a1;
    v16 = v11;
    v34 = v8;
    v17 = v14;
LABEL_7:
    v18 = v35;
    v19 = v33;
    *v13 = v35;
    v13[1] = v19;
    v13[2] = v17;
    v13[3] = a3;
    swift_unknownObjectRetain();
    v20 = v18;
    v21 = v19;
    swift_unknownObjectRetain();
    v22 = a3;
    v23 = v32;
    sub_1DADE3B68(v32);
    sub_1DADF5330((uint64_t)v23, (uint64_t)v34);
    sub_1DAE0D038();
    sub_1DADF5374((uint64_t)v23);
    v24 = (_QWORD *)((char *)v13 + *(int *)(v16 + 36));
    *v24 = swift_getKeyPath();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DCC8);
    swift_storeEnumTagMultiPayload();
    v25 = objc_allocWithZone((Class)__swift_instantiateConcreteTypeFromMangledName(qword_1F029E170));
    v26 = sub_1DAE0CD68();
    swift_unknownObjectRelease();
    swift_unknownObjectRelease_n();
  }
  else if (v15)
  {
    v33 = a1;
    v34 = v8;
    v31[1] = v5;
    while (1)
    {
      v37 = &unk_1F035D1D0;
      v27 = swift_dynamicCastObjCProtocolConditional();
      if (v27)
      {
        v17 = v27;
        v32 = v10;
        v16 = v11;
        swift_unknownObjectRetain_n();
        goto LABEL_7;
      }
      objc_opt_self();
      v28 = (void *)swift_dynamicCastObjCClass();
      if (!v28)
        break;
      v29 = objc_msgSend(v28, sel_feedbackListener);
      swift_unknownObjectRelease();
      if (!v29)
        return 0;
    }
    swift_unknownObjectRelease();
    return 0;
  }
  else
  {
    return 0;
  }
  return v26;
}

uint64_t sub_1DADF5330(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SearchUIUserReportModel();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADF5374(uint64_t a1)
{
  uint64_t v2;

  v2 = type metadata accessor for SearchUIUserReportModel();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADF53B0()
{
  return sub_1DAE0CC60();
}

void sub_1DADF53D0()
{
  uint64_t v0;
  void *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  unint64_t v10;
  void *v11;
  id v12;
  id v13;
  char v14;
  id v15;
  void *v16;

  v1 = *(void **)(v0 + 16);
  v2 = objc_msgSend(v1, sel_command);
  if (!v2)
    goto LABEL_23;
  v3 = v2;
  objc_opt_self();
  v4 = (void *)swift_dynamicCastObjCClass();
  if (v4)
  {
    v5 = objc_msgSend(v4, sel_punchout);
    v6 = objc_msgSend(*(id *)(v0 + 24), sel_section);
    if (v6)
    {
      v7 = v6;
      v8 = objc_msgSend(v6, sel_resultSection);

      if (!v8)
        goto LABEL_13;
      v9 = objc_msgSend(v8, sel_results);

      if (!v9)
      {
        v8 = 0;
        if (v5)
          goto LABEL_14;
LABEL_18:

        if (!v8)
          return;
        v3 = v8;
        goto LABEL_22;
      }
      sub_1DADF5F84(0, &qword_1F029B4A0);
      v10 = sub_1DAE0D5CC();

      if (v10 >> 62)
      {
        swift_bridgeObjectRetain();
        v11 = (void *)sub_1DAE0D83C();
        swift_bridgeObjectRelease();
        if (!v11)
          goto LABEL_12;
      }
      else
      {
        v11 = *(void **)((v10 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (!v11)
        {
LABEL_12:
          swift_bridgeObjectRelease();
          v8 = objc_msgSend(v11, sel_moreResultsPunchout);

LABEL_13:
          if (v5)
          {
LABEL_14:
            if (v8)
            {
              sub_1DADF5F84(0, (unint64_t *)&qword_1F029B0F8);
              v13 = v5;
              v14 = sub_1DAE0D704();

              if ((v14 & 1) != 0)
                return;
              goto LABEL_23;
            }

            goto LABEL_22;
          }
          goto LABEL_18;
        }
      }
      if ((v10 & 0xC000000000000001) != 0)
      {
        v12 = (id)MEMORY[0x1DF0A7ED0](0, v10);
        goto LABEL_11;
      }
      if (*(_QWORD *)((v10 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
        v12 = *(id *)(v10 + 32);
LABEL_11:
        v11 = v12;
        goto LABEL_12;
      }
      __break(1u);
    }

    __break(1u);
    return;
  }
LABEL_22:

LABEL_23:
  v15 = objc_msgSend(v1, sel_command);
  if (v15)
  {
    v16 = v15;
    objc_opt_self();
    swift_dynamicCastObjCClass();

  }
}

_QWORD *sub_1DADF564C(void *a1, void *a2)
{
  _QWORD *v2;
  char *v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  id v26;
  uint64_t v27;

  v5 = (char *)v2 + OBJC_IVAR____TtC8SearchUI22ButtonItemHeaderAction___observationRegistrar;
  sub_1DAE0C894();
  v6 = objc_msgSend(a2, sel_commandEnvironment);
  if (!v6)
    goto LABEL_15;
  v7 = v6;
  v8 = objc_msgSend(a1, sel_section);
  v9 = objc_msgSend(v8, sel_collectionSection);

  v10 = objc_msgSend(v9, sel_buttonItem);
  if (!v10)
  {
    v24 = objc_msgSend(a1, sel_section);
    if (!v24
      || (v25 = v24,
          v26 = objc_msgSend(v24, sel_resultSection),
          v25,
          !v26)
      || (v10 = objc_msgSend(v26, sel_button), v26, !v10))
    {
      v12 = a1;
      a1 = a2;
      a2 = v7;
      goto LABEL_14;
    }
  }
  v11 = (void *)objc_opt_self();
  v12 = v10;
  v13 = objc_msgSend(v12, sel_command);
  LODWORD(v11) = objc_msgSend(v11, sel_hasValidHandlerForCommand_rowModel_environment_, v13, 0, v7);

  if ((_DWORD)v11)
  {
    v14 = objc_msgSend(v12, sel_title);
    if (v14)
    {
      v15 = v14;
      v16 = sub_1DAE0D53C();
      v18 = v17;

      v19 = objc_msgSend(v12, sel_image);
      if (v19)
      {
        objc_opt_self();
        v20 = (void *)swift_dynamicCastObjCClass();
        if (v20)
        {
          v21 = objc_msgSend(v20, sel_symbolName);

          if (v21)
          {
            v19 = (id)sub_1DAE0D53C();
            v23 = v22;

LABEL_21:
            v2[2] = v12;
            v2[3] = a1;
            v2[4] = v7;
            v2[5] = v16;
            v2[6] = v18;
            v2[7] = v19;
            v2[8] = v23;
            return v2;
          }
        }
        else
        {

        }
        v19 = 0;
      }
      else
      {

      }
      v23 = 0;
      goto LABEL_21;
    }
  }

LABEL_14:
LABEL_15:

  v27 = sub_1DAE0C8A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v27 - 8) + 8))(v5, v27);
  type metadata accessor for ButtonItemHeaderAction();
  swift_deallocPartialClassInstance();
  return 0;
}

void sub_1DADF591C()
{
  uint64_t v0;
  void *v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  char v20;
  char v21;
  id v22;
  id v23;
  unsigned __int8 v24;
  id v25;
  void *v26;
  id v27;
  void *v28;
  id v29;

  v1 = *(void **)(v0 + 24);
  v2 = objc_msgSend(v1, sel_section);
  v3 = objc_msgSend(v2, sel_resultSection);

  v4 = objc_msgSend(v1, sel_section);
  if (!v4
    || (v5 = v4, v6 = objc_msgSend(v4, sel_collectionSection), v5, !v6))
  {
    v29 = 0;
    goto LABEL_16;
  }
  if (v3)
  {
    v7 = objc_msgSend(v3, sel_results);
    if (v7)
    {
      v8 = v7;
      sub_1DADF5F84(0, &qword_1F029B4A0);
      v9 = sub_1DAE0D5CC();

      if (v9 >> 62)
      {
        swift_bridgeObjectRetain();
        v13 = sub_1DAE0D83C();
        swift_bridgeObjectRelease();
        if (v13)
          goto LABEL_7;
      }
      else if (*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
      {
LABEL_7:
        if ((v9 & 0xC000000000000001) != 0)
        {
          v10 = (id)MEMORY[0x1DF0A7ED0](0, v9);
        }
        else
        {
          if (!*(_QWORD *)((v9 & 0xFFFFFFFFFFFFF8) + 0x10))
          {
            __break(1u);
            goto LABEL_29;
          }
          v10 = *(id *)(v9 + 32);
        }
        v11 = v10;
        swift_bridgeObjectRelease();
        v12 = objc_msgSend(v11, sel_queryId);

        goto LABEL_15;
      }
      swift_bridgeObjectRelease();
    }
  }
  v12 = objc_msgSend(*(id *)(v0 + 32), sel_queryId);
LABEL_15:
  v14 = objc_allocWithZone((Class)SearchUIRowModel);
  v15 = v6;
  v16 = (void *)sub_1DAE0D530();
  v29 = objc_msgSend(v14, sel_initWithCardSection_queryId_itemIdentifier_, v15, v12, v16);

LABEL_16:
  v17 = *(void **)(v0 + 32);
  objc_msgSend(v17, sel_setSection_, v3);
  v18 = objc_msgSend((id)objc_opt_self(), sel_handlerForButton_rowModel_sectionModel_environment_, *(_QWORD *)(v0 + 16), v29, v1, v17);
  if (!v18)
  {
LABEL_29:

    __break(1u);
LABEL_30:

    __break(1u);
LABEL_31:

    __break(1u);
    return;
  }
  v19 = v18;
  objc_msgSend(v18, sel_executeWithTriggerEvent_, 2);

  sub_1DADF53D0();
  if (!v3)
  {
LABEL_25:

    return;
  }
  v21 = v20;
  v22 = v3;
  v23 = objc_msgSend(v17, sel_feedbackDelegate);
  if (!v23)
    goto LABEL_30;
  v24 = objc_msgSend(v23, sel_respondsToSelector_, sel_didEngageSection_);
  swift_unknownObjectRelease();
  if ((v24 & 1) == 0)
    goto LABEL_24;
  v25 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D8C6D0]), sel_initWithSection_triggerEvent_, v22, v21 & 1);
  if (!v25)
    goto LABEL_24;
  v26 = v25;
  v27 = objc_msgSend(v17, sel_feedbackDelegate);
  if (!v27)
    goto LABEL_31;
  v28 = v27;
  if ((objc_msgSend(v27, sel_respondsToSelector_, sel_didEngageSection_) & 1) != 0)
  {
    objc_msgSend(v28, sel_didEngageSection_, v26);

    swift_unknownObjectRelease();
LABEL_24:

    goto LABEL_25;
  }

  swift_unknownObjectRelease();
}

uint64_t sub_1DADF5CC4()
{
  id *v0;
  char *v1;
  uint64_t v2;

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v1 = (char *)v0 + OBJC_IVAR____TtC8SearchUI22ButtonItemHeaderAction___observationRegistrar;
  v2 = sub_1DAE0C8A0();
  (*(void (**)(char *, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1DADF5D3C()
{
  return type metadata accessor for ButtonItemHeaderAction();
}

uint64_t type metadata accessor for ButtonItemHeaderAction()
{
  uint64_t result;

  result = qword_1F029B430;
  if (!qword_1F029B430)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DADF5D80()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DAE0C8A0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

uint64_t sub_1DADF5E14()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 40);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADF5E44()
{
  uint64_t v0;
  uint64_t v1;

  v1 = *(_QWORD *)(*(_QWORD *)v0 + 56);
  swift_bridgeObjectRetain();
  return v1;
}

uint64_t sub_1DADF5E74()
{
  char v0;

  sub_1DADF53D0();
  if ((v0 & 1) != 0)
    return 1;
  else
    return 3;
}

void sub_1DADF5EA0()
{
  sub_1DADF591C();
}

_QWORD *sub_1DADF5EC0@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  _QWORD *result;

  type metadata accessor for ButtonItemHeaderAction();
  swift_allocObject();
  result = sub_1DADF564C(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1DADF5F18(uint64_t a1)
{
  unint64_t result;

  result = sub_1DADF5F3C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1DADF5F3C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B420;
  if (!qword_1F029B420)
  {
    v1 = type metadata accessor for ButtonItemHeaderAction();
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1EE88, v1);
    atomic_store(result, (unint64_t *)&qword_1F029B420);
  }
  return result;
}

uint64_t sub_1DADF5F84(uint64_t a1, unint64_t *a2)
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

uint64_t sub_1DADF5FBC()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1DADF5FC4()
{
  uint64_t result;
  unint64_t v1;
  unint64_t v2;

  result = sub_1DAE0C7EC();
  if (v1 <= 0x3F)
  {
    result = swift_checkMetadataState();
    if (v2 <= 0x3F)
    {
      swift_initStructMetadata();
      return 0;
    }
  }
  return result;
}

uint64_t *sub_1DADF604C(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v15;
  uint64_t v16;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(_DWORD *)(v9 + 80);
  v11 = *(_QWORD *)(v7 + 64) + v10;
  v12 = (*(_BYTE *)(v7 + 80) | *(_BYTE *)(v9 + 80));
  if (v12 > 7
    || ((*(_DWORD *)(v7 + 80) | *(_DWORD *)(v9 + 80)) & 0x100000) != 0
    || (v11 & (unint64_t)~v10) + *(_QWORD *)(v9 + 64) > 0x18)
  {
    v15 = *a2;
    *a1 = *a2;
    a1 = (uint64_t *)(v15 + ((v12 + 16) & ~v12));
    sub_1DAE0C564();
  }
  else
  {
    v16 = ~v10;
    (*(void (**)(uint64_t *, uint64_t *, uint64_t))(v7 + 16))(a1, a2, v6);
    (*(void (**)(unint64_t, unint64_t, uint64_t))(v9 + 16))(((unint64_t)a1 + v11) & v16, ((unint64_t)a2 + v11) & v16, v8);
  }
  return a1;
}

uint64_t sub_1DADF6124(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;

  v4 = sub_1DAE0C7EC();
  v5 = *(_QWORD *)(v4 - 8);
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(a1, v4);
  return (*(uint64_t (**)(unint64_t))(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 8))((*(_QWORD *)(v5 + 64) + a1 + *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80)) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a2 + 16) - 8) + 80));
}

uint64_t sub_1DADF6188(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 16))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1DADF6204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 24))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 24))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1DADF6280(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 32))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 32))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1DADF62FC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 40))(a1, a2, v6);
  v8 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  (*(void (**)(unint64_t, unint64_t))(v8 + 40))((*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a1) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80), (*(_QWORD *)(v7 + 64) + *(unsigned __int8 *)(v8 + 80) + a2) & ~(unint64_t)*(unsigned __int8 *)(v8 + 80));
  return a1;
}

uint64_t sub_1DADF6378(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char v16;
  int v17;
  unsigned int v18;
  int v19;
  int v20;

  v6 = sub_1DAE0C7EC();
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(unsigned int *)(v7 + 84);
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(_DWORD *)(v10 + 84);
  if (v11 <= v8)
    v12 = *(_DWORD *)(v7 + 84);
  else
    v12 = *(_DWORD *)(v10 + 84);
  if (!a2)
    return 0;
  v13 = *(unsigned __int8 *)(v10 + 80);
  v14 = *(_QWORD *)(v7 + 64) + v13;
  if (a2 <= v12)
    goto LABEL_23;
  v15 = (v14 & ~v13) + *(_QWORD *)(v10 + 64);
  v16 = 8 * v15;
  if (v15 <= 3)
  {
    v18 = ((a2 - v12 + ~(-1 << v16)) >> v16) + 1;
    if (HIWORD(v18))
    {
      v17 = *(_DWORD *)(a1 + v15);
      if (!v17)
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v18 > 0xFF)
    {
      v17 = *(unsigned __int16 *)(a1 + v15);
      if (!*(_WORD *)(a1 + v15))
        goto LABEL_23;
      goto LABEL_14;
    }
    if (v18 < 2)
    {
LABEL_23:
      if (v12)
      {
        if (v8 >= v11)
          return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, v8, v6);
        else
          return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t))(v10 + 48))((v14 + a1) & ~v13, *(unsigned int *)(v10 + 84), v9);
      }
      return 0;
    }
  }
  v17 = *(unsigned __int8 *)(a1 + v15);
  if (!*(_BYTE *)(a1 + v15))
    goto LABEL_23;
LABEL_14:
  v19 = (v17 - 1) << v16;
  if (v15 > 3)
    v19 = 0;
  if ((_DWORD)v15)
  {
    if (v15 <= 3)
      v20 = (v14 & ~(_DWORD)v13) + *(_DWORD *)(v10 + 64);
    else
      v20 = 4;
    __asm { BR              X12 }
  }
  return v12 + v19 + 1;
}

void sub_1DADF6508(_BYTE *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;

  v8 = *(_QWORD *)(sub_1DAE0C7EC() - 8);
  v9 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  if (*(_DWORD *)(v9 + 84) <= *(_DWORD *)(v8 + 84))
    v10 = *(_DWORD *)(v8 + 84);
  else
    v10 = *(_DWORD *)(v9 + 84);
  v11 = *(unsigned __int8 *)(v9 + 80);
  v12 = ((*(_QWORD *)(v8 + 64) + v11) & ~v11) + *(_QWORD *)(v9 + 64);
  if (a3 <= v10)
  {
    v13 = 0u;
  }
  else if (v12 <= 3)
  {
    v15 = ((a3 - v10 + ~(-1 << (8 * v12))) >> (8 * v12)) + 1;
    if (HIWORD(v15))
    {
      v13 = 4u;
    }
    else if (v15 >= 0x100)
    {
      v13 = 2;
    }
    else
    {
      v13 = v15 > 1;
    }
  }
  else
  {
    v13 = 1u;
  }
  if (v10 < a2)
  {
    v14 = ~v10 + a2;
    if (v12 < 4)
    {
      if ((_DWORD)v12)
      {
        v16 = v14 & ~(-1 << (8 * v12));
        bzero(a1, ((*(_QWORD *)(v8 + 64) + v11) & ~v11) + *(_QWORD *)(v9 + 64));
        if ((_DWORD)v12 == 3)
        {
          *(_WORD *)a1 = v16;
          a1[2] = BYTE2(v16);
        }
        else if ((_DWORD)v12 == 2)
        {
          *(_WORD *)a1 = v16;
        }
        else
        {
          *a1 = v16;
        }
      }
    }
    else
    {
      bzero(a1, ((*(_QWORD *)(v8 + 64) + v11) & ~v11) + *(_QWORD *)(v9 + 64));
      *(_DWORD *)a1 = v14;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X16 }
}

uint64_t type metadata accessor for IdentifiableContainer(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for IdentifiableContainer);
}

unint64_t sub_1DADF672C()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029E1F8;
  if (!qword_1F029E1F8)
  {
    v1 = sub_1DAE0C7EC();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CB09C8], v1);
    atomic_store(result, (unint64_t *)&qword_1F029E1F8);
  }
  return result;
}

uint64_t sub_1DADF6774@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v3;

  v3 = sub_1DAE0C7EC();
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 - 8) + 16))(a1, v1, v3);
}

uint64_t __swift_instantiateGenericMetadata(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD v6[3];

  v6[0] = a2;
  v6[1] = a3;
  v6[2] = a4;
  return MEMORY[0x1DF0A8A7C](a1, v6, a5);
}

uint64_t sub_1DADF67D8()
{
  uint64_t v0;

  swift_getKeyPath();
  sub_1DADF7790();
  sub_1DAE0C888();
  swift_release();
  return *(unsigned __int8 *)(v0 + 16);
}

uint64_t sub_1DADF6844@<X0>(uint64_t *a1@<X0>, _BYTE *a2@<X8>)
{
  uint64_t v3;
  uint64_t result;

  v3 = *a1;
  swift_getKeyPath();
  sub_1DADF7790();
  sub_1DAE0C888();
  result = swift_release();
  *a2 = *(_BYTE *)(v3 + 16);
  return result;
}

uint64_t sub_1DADF68B8()
{
  swift_getKeyPath();
  sub_1DADF7790();
  sub_1DAE0C87C();
  return swift_release();
}

void sub_1DADF6948()
{
  void *v0;
  void *v1;
  id v2;

  swift_getKeyPath();
  sub_1DADF7790();
  sub_1DAE0C888();
  swift_release();
  v0 = (void *)objc_opt_self();
  v1 = (void *)sub_1DAE0D530();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_localizedStringForKey_, v1);

  if (v2)
  {
    sub_1DAE0D53C();

  }
  else
  {
    __break(1u);
  }
}

id sub_1DADF6A50(void *a1, void *a2)
{
  uint64_t v2;
  uint64_t v5;
  id v6;
  void *v7;
  char v8;
  id v9;
  id result;
  void *v11;
  id v12;
  uint64_t v13;

  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakInit();
  v5 = v2 + OBJC_IVAR____TtC8SearchUI25ExpandSectionHeaderAction___observationRegistrar;
  sub_1DAE0C894();
  v6 = objc_msgSend(a2, sel_headerDelegate);
  if (!v6)
    goto LABEL_6;
  v7 = v6;
  sub_1DADF77D8(a1);
  if ((v8 & 1) == 0)
  {
    swift_unknownObjectRelease();
LABEL_6:

    sub_1DADDAA3C(v2 + 32);
    sub_1DADDAA3C(v2 + 40);
    v13 = sub_1DAE0C8A0();
    (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v13 - 8) + 8))(v5, v13);
    type metadata accessor for ExpandSectionHeaderAction();
    swift_deallocPartialClassInstance();
    return 0;
  }
  *(_BYTE *)(v2 + 16) = objc_msgSend(v7, sel_isExpandedForSectionModel_, a1);
  *(_QWORD *)(v2 + 24) = a1;
  swift_unknownObjectWeakAssign();
  v9 = a1;
  result = objc_msgSend(a2, sel_commandEnvironment);
  if (result)
  {
    v11 = result;
    v12 = objc_msgSend(result, sel_feedbackDelegate);
    swift_unknownObjectRelease();

    swift_unknownObjectWeakAssign();
    swift_unknownObjectRelease();
    return (id)v2;
  }
  __break(1u);
  return result;
}

void sub_1DADF6BE4()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t KeyPath;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  os_log_type_t v15;
  uint8_t *v16;
  NSObject *v17;

  v1 = v0;
  v2 = MEMORY[0x1DF0A8C44](v0 + 32);
  if (v2)
  {
    v3 = (void *)v2;
    swift_getKeyPath();
    sub_1DADF7790();
    sub_1DAE0C888();
    swift_release();
    if (*(_BYTE *)(v0 + 16))
      v4 = 3;
    else
      v4 = 2;
    v5 = *(void **)(v0 + 24);
    objc_msgSend(v3, sel_toggleExpansionForSectionModel_, v5);
    objc_msgSend(v3, sel_isExpandedForSectionModel_, v5);
    KeyPath = swift_getKeyPath();
    MEMORY[0x1E0C80A78](KeyPath);
    sub_1DAE0C87C();
    swift_release();
    v7 = objc_msgSend(v5, sel_section);
    if (v7)
    {
      v8 = v7;
      v9 = objc_msgSend(v7, sel_resultSection);

      if (v9)
      {
        v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0D8C6D0]), sel_initWithSection_triggerEvent_, v9, v4);
        if (v10)
        {
          v11 = v10;
          v12 = (void *)MEMORY[0x1DF0A8C44](v1 + 40);
          if (!v12)
          {
            swift_unknownObjectRelease();

            goto LABEL_19;
          }
          v13 = v12;
          if ((objc_msgSend(v12, sel_respondsToSelector_, sel_didEngageSection_) & 1) != 0)
          {
            objc_msgSend(v13, sel_didEngageSection_, v11);
            swift_unknownObjectRelease();

            swift_unknownObjectRelease();
LABEL_19:

            return;
          }
          swift_unknownObjectRelease();

        }
        else
        {

        }
      }
      swift_unknownObjectRelease();
      return;
    }
    __break(1u);
  }
  else
  {
    if (qword_1F029D6B0 != -1)
      swift_once();
    v14 = sub_1DAE0CA8C();
    __swift_project_value_buffer(v14, (uint64_t)qword_1F02A0378);
    v15 = sub_1DAE0D6C8();
    v17 = sub_1DAE0CA74();
    if (os_log_type_enabled(v17, v15))
    {
      v16 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1DAD39000, v17, v15, "ExpandSectionHeaderAction: delegate is unexpectedly nil", v16, 2u);
      MEMORY[0x1DF0A8B9C](v16, -1, -1);
    }

  }
}

uint64_t sub_1DADF6EE8()
{
  void *v0;
  uint64_t result;
  void *v2;
  id v3;
  unint64_t v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  uint64_t v10;

  result = (uint64_t)objc_msgSend(v0, sel_resultSection);
  if (result)
  {
    v2 = (void *)result;
    v3 = objc_msgSend((id)result, sel_results);

    if (v3)
    {
      sub_1DADF5F84(0, &qword_1F029B4A0);
      v4 = sub_1DAE0D5CC();

      if (v4 >> 62)
      {
        swift_bridgeObjectRetain();
        v5 = (void *)sub_1DAE0D83C();
        swift_bridgeObjectRelease();
        if (v5)
          goto LABEL_5;
      }
      else
      {
        v5 = *(void **)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
        if (v5)
        {
LABEL_5:
          if ((v4 & 0xC000000000000001) != 0)
          {
            v6 = (id)MEMORY[0x1DF0A7ED0](0, v4);
          }
          else
          {
            if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              __break(1u);
              goto LABEL_23;
            }
            v6 = *(id *)(v4 + 32);
          }
          v5 = v6;
          swift_bridgeObjectRelease();
          v7 = objc_msgSend((id)objc_opt_self(), sel_cardSectionsForRenderingResult_, v5);
          if (v7)
          {
            v8 = v7;
            sub_1DADF5F84(0, (unint64_t *)&qword_1ED4D4610);
            v9 = sub_1DAE0D5CC();

            if ((objc_msgSend(v5, sel_renderHorizontallyWithOtherResultsInCategory) & 1) != 0)
            {
              if (v9)
              {
                if (!(v9 >> 62))
                {
                  v10 = *(_QWORD *)((v9 & 0xFFFFFFFFFFFFFF8) + 0x10);
                  swift_bridgeObjectRelease();

                  return v10 == 0;
                }
LABEL_23:
                swift_bridgeObjectRetain();
                v10 = sub_1DAE0D83C();

                swift_bridgeObjectRelease_n();
                return v10 == 0;
              }
              goto LABEL_15;
            }
          }
          else if ((objc_msgSend(v5, sel_renderHorizontallyWithOtherResultsInCategory) & 1) != 0)
          {
LABEL_15:

            return 1;
          }
          swift_bridgeObjectRelease();

          return 0;
        }
      }
      swift_bridgeObjectRelease();
    }
    return 0;
  }
  return result;
}

unint64_t sub_1DADF70F8()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  unint64_t v4;
  unint64_t result;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  void *v14;

  v1 = objc_msgSend(v0, sel_resultSection);
  if (!v1)
    goto LABEL_12;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_results);

  if (!v3)
    goto LABEL_12;
  sub_1DADF5F84(0, &qword_1F029B4A0);
  v4 = sub_1DAE0D5CC();

  if (v4 >> 62)
  {
    swift_bridgeObjectRetain();
    v9 = sub_1DAE0D83C();
    result = swift_bridgeObjectRelease();
    if (v9)
      goto LABEL_5;
LABEL_11:
    swift_bridgeObjectRelease();
    goto LABEL_12;
  }
  if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_11;
LABEL_5:
  if ((v4 & 0xC000000000000001) != 0)
  {
    v6 = (id)MEMORY[0x1DF0A7ED0](0, v4);
  }
  else
  {
    if (!*(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
    {
      __break(1u);
      goto LABEL_29;
    }
    v6 = *(id *)(v4 + 32);
  }
  v7 = v6;
  swift_bridgeObjectRelease();
  v8 = objc_msgSend(v7, sel_moreResults);

  if (v8)
  {
LABEL_22:

    return 1;
  }
LABEL_12:
  result = (unint64_t)objc_msgSend(v0, sel_resultSection);
  if (!result)
    return result;
  v10 = (void *)result;
  v11 = objc_msgSend((id)result, sel_results);

  if (v11)
  {
    sub_1DADF5F84(0, &qword_1F029B4A0);
    v4 = sub_1DAE0D5CC();

    if (v4 >> 62)
    {
      swift_bridgeObjectRetain();
      v12 = sub_1DAE0D83C();
      swift_bridgeObjectRelease();
      if (v12)
      {
LABEL_16:
        result = v12 - 1;
        if (!__OFSUB__(v12, 1))
        {
          if ((v4 & 0xC000000000000001) == 0)
          {
            if ((result & 0x8000000000000000) != 0)
            {
              __break(1u);
            }
            else if (result < *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10))
            {
              v13 = *(id *)(v4 + 8 * result + 32);
              goto LABEL_21;
            }
            __break(1u);
            return result;
          }
LABEL_30:
          v13 = (id)MEMORY[0x1DF0A7ED0](result, v4);
LABEL_21:
          v14 = v13;
          swift_bridgeObjectRelease();
          v8 = objc_msgSend(v14, sel_moreResults);

          if (v8)
            goto LABEL_22;
          return 0;
        }
LABEL_29:
        __break(1u);
        goto LABEL_30;
      }
    }
    else
    {
      v12 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
      if (v12)
        goto LABEL_16;
    }
    swift_bridgeObjectRelease();
  }
  return 0;
}

BOOL sub_1DADF736C()
{
  void *v0;
  id v1;
  void *v2;
  id v3;
  char **v4;
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  unint64_t *v13;
  id v14;
  void *v15;
  unint64_t v16;
  uint64_t v17;

  v1 = objc_msgSend(v0, sel_collectionSection);
  if (v1
    && (v2 = v1, v3 = objc_msgSend(v1, sel_collectionStyle), v2, v3))
  {
    v4 = &selRef_initiallyVisibleCardSectionCount;
  }
  else
  {
    v5 = objc_msgSend(v0, sel_resultSection);
    if (!v5)
    {
LABEL_8:
      v6 = 0;
      goto LABEL_9;
    }
    v3 = v5;
    v4 = &selRef_maxInitiallyVisibleResults;
  }
  v6 = (uint64_t)objc_msgSend(v3, *v4);

  if (v6 < 0)
  {
    __break(1u);
    goto LABEL_8;
  }
LABEL_9:
  v7 = objc_msgSend(v0, sel_collectionSection);
  if (v7
    && (v8 = v7, v9 = objc_msgSend(v7, sel_collectionStyle), v8, v9))
  {
    objc_msgSend(v9, sel_initiallyVisibleCardSectionCount);

    v10 = objc_msgSend(v0, sel_collectionSection);
    if (v10)
    {
      v11 = v10;
      v12 = objc_msgSend(v10, sel_cardSections);

      if (v12)
      {
        v13 = (unint64_t *)&qword_1ED4D4610;
        goto LABEL_17;
      }
    }
  }
  else
  {
    v14 = objc_msgSend(v0, sel_resultSection);
    if (v14)
    {
      v15 = v14;
      v12 = objc_msgSend(v14, sel_results);

      if (v12)
      {
        v13 = &qword_1F029B4A0;
LABEL_17:
        sub_1DADF5F84(0, v13);
        v16 = sub_1DAE0D5CC();

        if (v16 >> 62)
        {
          swift_bridgeObjectRetain();
          v17 = sub_1DAE0D83C();
          swift_bridgeObjectRelease();
        }
        else
        {
          v17 = *(_QWORD *)((v16 & 0xFFFFFFFFFFFFF8) + 0x10);
        }
        swift_bridgeObjectRelease();
        if (!v6)
          return 0;
        return v6 < v17;
      }
    }
  }
  if (v6)
  {
    v17 = 0;
    return v6 < v17;
  }
  return 0;
}

uint64_t sub_1DADF7590()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;

  sub_1DADDAA3C(v0 + 32);
  sub_1DADDAA3C(v0 + 40);
  v1 = v0 + OBJC_IVAR____TtC8SearchUI25ExpandSectionHeaderAction___observationRegistrar;
  v2 = sub_1DAE0C8A0();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(v1, v2);
  return swift_deallocClassInstance();
}

uint64_t sub_1DADF75F8()
{
  return type metadata accessor for ExpandSectionHeaderAction();
}

uint64_t type metadata accessor for ExpandSectionHeaderAction()
{
  uint64_t result;

  result = qword_1F029B470;
  if (!qword_1F029B470)
    return swift_getSingletonMetadata();
  return result;
}

uint64_t sub_1DADF763C()
{
  uint64_t result;
  unint64_t v1;

  result = sub_1DAE0C8A0();
  if (v1 <= 0x3F)
  {
    result = swift_updateClassMetadata2();
    if (!result)
      return 0;
  }
  return result;
}

void sub_1DADF76CC()
{
  sub_1DADF6948();
}

uint64_t sub_1DADF76EC()
{
  return 2;
}

void sub_1DADF76F4()
{
  sub_1DADF6BE4();
}

id sub_1DADF7714@<X0>(void *a1@<X0>, void *a2@<X1>, _QWORD *a3@<X8>)
{
  id result;

  type metadata accessor for ExpandSectionHeaderAction();
  swift_allocObject();
  result = sub_1DADF6A50(a1, a2);
  *a3 = result;
  return result;
}

unint64_t sub_1DADF776C(uint64_t a1)
{
  unint64_t result;

  result = sub_1DADF7790();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1DADF7790()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B460;
  if (!qword_1F029B460)
  {
    v1 = type metadata accessor for ExpandSectionHeaderAction();
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1EFB0, v1);
    atomic_store(result, (unint64_t *)&qword_1F029B460);
  }
  return result;
}

void sub_1DADF77D8(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  unint64_t v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  unsigned __int8 v14;
  unsigned __int8 v15;
  uint64_t v16;

  v1 = objc_msgSend(a1, sel_section);
  if (!v1)
    return;
  v2 = v1;
  v3 = objc_msgSend(v1, sel_resultSection);
  if (!v3)
    goto LABEL_13;
  v4 = v3;
  v5 = objc_msgSend(v3, sel_results);
  if (!v5)
  {

    if ((sub_1DADF6EE8() & 1) != 0)
      goto LABEL_23;
    goto LABEL_14;
  }
  v6 = v5;
  sub_1DADF5F84(0, &qword_1F029B4A0);
  v7 = sub_1DAE0D5CC();

  if (v7 >> 62)
  {
    swift_bridgeObjectRetain();
    v16 = sub_1DAE0D83C();
    swift_bridgeObjectRelease();
    if (v16)
      goto LABEL_6;
LABEL_22:

    swift_bridgeObjectRelease();
    if ((sub_1DADF6EE8() & 1) != 0)
      goto LABEL_23;
    goto LABEL_14;
  }
  if (!*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
    goto LABEL_22;
LABEL_6:
  if ((v7 & 0xC000000000000001) != 0)
  {
    v8 = (id)MEMORY[0x1DF0A7ED0](0, v7);
LABEL_9:
    v9 = v8;
    swift_bridgeObjectRelease();
    if ((objc_msgSend(v9, sel_isLocalApplicationResult) & 1) == 0)
    {
      v10 = objc_msgSend(v9, sel_applicationBundleIdentifier);
      if (v10)
      {
        v11 = v10;
        v12 = (void *)objc_opt_self();
        v13 = objc_msgSend(v4, sel_bundleIdentifier);
        v14 = objc_msgSend(v12, sel_bundleIdentifierIsBlockedForScreenTimeExpiration_, v13);

        v15 = objc_msgSend(v12, sel_bundleIdentifierIsBlockedForScreenTimeExpiration_, v11);
        if ((v14 & 1) != 0 || (v15 & 1) != 0)
          goto LABEL_23;
LABEL_13:
        if ((sub_1DADF6EE8() & 1) == 0)
          goto LABEL_14;
LABEL_23:

        return;
      }
    }

    if ((sub_1DADF6EE8() & 1) != 0)
      goto LABEL_23;
LABEL_14:
    if ((sub_1DADF70F8() & 1) == 0)
      sub_1DADF736C();
    goto LABEL_23;
  }
  if (*(_QWORD *)((v7 & 0xFFFFFFFFFFFFF8) + 0x10))
  {
    v8 = *(id *)(v7 + 32);
    goto LABEL_9;
  }
  __break(1u);
}

void sub_1DADF7A1C()
{
  uint64_t v0;

  *(_BYTE *)(*(_QWORD *)(v0 + 16) + 16) = *(_BYTE *)(v0 + 24);
}

void sub_1DADF7A2C()
{
  sub_1DADF7A1C();
}

uint64_t sub_1DADF7A40()
{
  return swift_allocateGenericValueMetadata();
}

uint64_t sub_1DADF7A48()
{
  uint64_t result;
  unint64_t v1;

  sub_1DAE0D710();
  result = sub_1DAE0D0BC();
  if (v1 <= 0x3F)
  {
    swift_initStructMetadata();
    return 0;
  }
  return result;
}

uint64_t *sub_1DADF7AE4(uint64_t *a1, uint64_t *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  size_t v9;
  size_t v10;
  int v11;
  uint64_t v12;
  _QWORD *v16;
  _QWORD *v17;
  void *v18;
  const void *v19;
  unsigned int (*v20)(const void *, uint64_t, uint64_t);
  _QWORD *v21;
  _QWORD *v22;
  _QWORD *v23;
  _QWORD *v24;
  _QWORD *v25;
  _QWORD *v26;

  v4 = *(_QWORD *)(a3 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = *(_DWORD *)(v5 + 80);
  v7 = v6;
  v8 = (v7 + 16) & ~v7;
  if (*(_DWORD *)(v5 + 84))
    v9 = *(_QWORD *)(v5 + 64);
  else
    v9 = *(_QWORD *)(v5 + 64) + 1;
  v10 = v8 + v9;
  v11 = v6 & 0x100000;
  v12 = *a2;
  *a1 = *a2;
  if (v7 > 7
    || v11 != 0
    || ((((((v8 + v9 + 7) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8) + 16 > 0x18)
  {
    a1 = (uint64_t *)(v12 + ((v7 & 0xF8 ^ 0x1F8) & (v7 + 16)));
    sub_1DAE0C564();
  }
  else
  {
    v16 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
    v17 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v16 = *v17;
    v18 = (void *)(((unint64_t)v16 + v7 + 8) & ~v7);
    v19 = (const void *)(((unint64_t)v17 + v7 + 8) & ~v7);
    v20 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v5 + 48);
    sub_1DAE0C564();
    sub_1DAE0C564();
    if (v20(v19, 1, v4))
    {
      memcpy(v18, v19, v9);
    }
    else
    {
      (*(void (**)(void *, const void *, uint64_t))(v5 + 16))(v18, v19, v4);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v5 + 56))(v18, 0, 1, v4);
    }
    v21 = (_QWORD *)(((unint64_t)a1 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
    v22 = (_QWORD *)(((unint64_t)a2 + v10 + 7) & 0xFFFFFFFFFFFFFFF8);
    *v21 = *v22;
    v23 = (_QWORD *)(((unint64_t)v21 + 15) & 0xFFFFFFFFFFFFF8);
    v24 = (_QWORD *)(((unint64_t)v22 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v23 = *v24;
    v25 = (_QWORD *)(((unint64_t)v23 + 15) & 0xFFFFFFFFFFFFFFF8);
    v26 = (_QWORD *)(((unint64_t)v24 + 15) & 0xFFFFFFFFFFFFFFF8);
    *v25 = *v26;
    v25[1] = v26[1];
    sub_1DAE0C564();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
  }
  return a1;
}

uint64_t sub_1DADF7C94(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;

  v3 = a1 + 15;
  swift_release();
  swift_release();
  v4 = *(_QWORD *)(a2 + 16);
  v5 = *(_QWORD *)(v4 - 8);
  v6 = ((v3 & 0xFFFFFFFFFFFFFFF8) + *(unsigned __int8 *)(v5 + 80) + 8) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
  if (!(*(unsigned int (**)(unint64_t, uint64_t, uint64_t))(v5 + 48))(v6, 1, v4))
    (*(void (**)(unint64_t, uint64_t))(v5 + 8))(v6, v4);
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

_QWORD *sub_1DADF7D64(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  unsigned int (*v12)(const void *, uint64_t, uint64_t);
  int v13;
  uint64_t v14;
  size_t v15;
  uint64_t v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;
  _QWORD *v20;
  _QWORD *v21;
  _QWORD *v22;

  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  v12 = *(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48);
  sub_1DAE0C564();
  sub_1DAE0C564();
  if (v12(v11, 1, v7))
  {
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
    if (v13)
      v15 = *(_QWORD *)(v8 + 64);
    else
      v15 = v14 + 1;
    memcpy(v10, v11, v15);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 16))(v10, v11, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
    v13 = *(_DWORD *)(v8 + 84);
    v14 = *(_QWORD *)(v8 + 64);
  }
  v16 = v14 + ((v9 + 16) & ~v9);
  if (!v13)
    ++v16;
  v17 = (_QWORD *)(((unint64_t)a1 + v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  v18 = (_QWORD *)(((unint64_t)a2 + v16 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v17 = *v18;
  v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFF8);
  v20 = (_QWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v19 = *v20;
  v21 = (_QWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFFFF8);
  v22 = (_QWORD *)(((unint64_t)v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v21 = *v22;
  v21[1] = v22[1];
  sub_1DAE0C564();
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  return a1;
}

_QWORD *sub_1DADF7ED4(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t (*v13)(void *, uint64_t, uint64_t);
  int v14;
  size_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  uint64_t v21;
  _QWORD *v22;

  v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  sub_1DAE0C564();
  swift_release();
  v7 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 &= 0xFFFFFFFFFFFFFFF8;
  *v7 = *(_QWORD *)v6;
  sub_1DAE0C564();
  swift_release();
  v8 = *(_QWORD *)(a3 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  v10 = *(unsigned __int8 *)(v9 + 80);
  v11 = (void *)(((unint64_t)v7 + v10 + 8) & ~v10);
  v12 = (void *)((v10 + 8 + v6) & ~v10);
  v13 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v9 + 48);
  LODWORD(v7) = v13(v11, 1, v8);
  v14 = v13(v12, 1, v8);
  if ((_DWORD)v7)
  {
    if (!v14)
    {
      (*(void (**)(void *, void *, uint64_t))(v9 + 16))(v11, v12, v8);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v9 + 56))(v11, 0, 1, v8);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v9 + 84))
      v15 = *(_QWORD *)(v9 + 64);
    else
      v15 = *(_QWORD *)(v9 + 64) + 1;
    memcpy(v11, v12, v15);
    goto LABEL_10;
  }
  if (v14)
  {
    (*(void (**)(void *, uint64_t))(v9 + 8))(v11, v8);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v9 + 24))(v11, v12, v8);
LABEL_10:
  v16 = *(_QWORD *)(v9 + 64) + ((v10 + 16) & ~v10);
  if (!*(_DWORD *)(v9 + 84))
    ++v16;
  v17 = (uint64_t)a1 + v16 + 7;
  v18 = (uint64_t)a2 + v16 + 7;
  v19 = (v18 & 0xFFFFFFFFFFFFFFF8) + 15;
  *(_QWORD *)(v17 & 0xFFFFFFFFFFFFFFF8) = *(_QWORD *)(v18 & 0xFFFFFFFFFFFFFFF8);
  v20 = (v17 & 0xFFFFFFFFFFFFFFF8) + 15;
  sub_1DAE0C564();
  swift_release();
  v20 &= 0xFFFFFFFFFFFFFFF8;
  v19 &= 0xFFFFFFFFFFFFF8uLL;
  v21 = *(_QWORD *)v19;
  v19 += 15;
  *(_QWORD *)v20 = v21;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  v22 = (_QWORD *)((v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v22 = *(_QWORD *)(v19 & 0xFFFFFFFFFFFFFFF8);
  v22[1] = *(_QWORD *)((v19 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *sub_1DADF80BC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  _QWORD *v5;
  _QWORD *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  const void *v11;
  int v12;
  size_t v13;
  size_t v14;
  size_t v15;
  _QWORD *v16;
  _QWORD *v17;
  _QWORD *v18;
  _QWORD *v19;

  *a1 = *a2;
  v5 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v6 = (_QWORD *)(((unint64_t)a2 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v5 = *v6;
  v7 = *(_QWORD *)(a3 + 16);
  v8 = *(_QWORD *)(v7 - 8);
  v9 = *(unsigned __int8 *)(v8 + 80);
  v10 = (void *)(((unint64_t)v5 + v9 + 8) & ~v9);
  v11 = (const void *)(((unint64_t)v6 + v9 + 8) & ~v9);
  if ((*(unsigned int (**)(const void *, uint64_t, uint64_t))(v8 + 48))(v11, 1, v7))
  {
    v12 = *(_DWORD *)(v8 + 84);
    v13 = *(_QWORD *)(v8 + 64);
    if (v12)
      v14 = v13;
    else
      v14 = v13 + 1;
    memcpy(v10, v11, v14);
  }
  else
  {
    (*(void (**)(void *, const void *, uint64_t))(v8 + 32))(v10, v11, v7);
    (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v8 + 56))(v10, 0, 1, v7);
    v12 = *(_DWORD *)(v8 + 84);
    v13 = *(_QWORD *)(v8 + 64);
  }
  v15 = v13 + ((v9 + 16) & ~v9);
  if (!v12)
    ++v15;
  v16 = (_QWORD *)(((unint64_t)a1 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  v17 = (_QWORD *)(((unint64_t)a2 + v15 + 7) & 0xFFFFFFFFFFFFFFF8);
  *v16 = *v17;
  v18 = (_QWORD *)(((unint64_t)v16 + 15) & 0xFFFFFFFFFFFFF8);
  v19 = (_QWORD *)(((unint64_t)v17 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v18 = *v19;
  *(_OWORD *)(((unint64_t)v18 + 15) & 0xFFFFFFFFFFFFF8) = *(_OWORD *)(((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFF8);
  return a1;
}

_QWORD *sub_1DADF81FC(_QWORD *a1, _QWORD *a2, uint64_t a3)
{
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t (*v14)(void *, uint64_t, uint64_t);
  int v15;
  size_t v16;
  uint64_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _QWORD *v23;

  v6 = (unint64_t)a2 + 15;
  *a1 = *a2;
  swift_release();
  v7 = (_QWORD *)(((unint64_t)a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  v8 = v6 & 0xFFFFFFFFFFFFFFF8;
  *v7 = *(_QWORD *)(v6 & 0xFFFFFFFFFFFFFFF8);
  swift_release();
  v9 = *(_QWORD *)(a3 + 16);
  v10 = *(_QWORD *)(v9 - 8);
  v11 = *(unsigned __int8 *)(v10 + 80);
  v12 = (void *)(((unint64_t)v7 + v11 + 8) & ~v11);
  v13 = (void *)((v11 + 8 + v8) & ~v11);
  v14 = *(uint64_t (**)(void *, uint64_t, uint64_t))(v10 + 48);
  LODWORD(v8) = v14(v12, 1, v9);
  v15 = v14(v13, 1, v9);
  if ((_DWORD)v8)
  {
    if (!v15)
    {
      (*(void (**)(void *, void *, uint64_t))(v10 + 32))(v12, v13, v9);
      (*(void (**)(void *, _QWORD, uint64_t, uint64_t))(v10 + 56))(v12, 0, 1, v9);
      goto LABEL_10;
    }
LABEL_6:
    if (*(_DWORD *)(v10 + 84))
      v16 = *(_QWORD *)(v10 + 64);
    else
      v16 = *(_QWORD *)(v10 + 64) + 1;
    memcpy(v12, v13, v16);
    goto LABEL_10;
  }
  if (v15)
  {
    (*(void (**)(void *, uint64_t))(v10 + 8))(v12, v9);
    goto LABEL_6;
  }
  (*(void (**)(void *, void *, uint64_t))(v10 + 40))(v12, v13, v9);
LABEL_10:
  v17 = *(_QWORD *)(v10 + 64) + ((v11 + 16) & ~v11);
  if (!*(_DWORD *)(v10 + 84))
    ++v17;
  v18 = (uint64_t)a1 + v17 + 7;
  v19 = (_QWORD *)(((unint64_t)a2 + v17 + 7) & 0xFFFFFFFFFFFFFFF8);
  *(_QWORD *)(v18 & 0xFFFFFFFFFFFFFFF8) = *v19;
  v20 = (v18 & 0xFFFFFFFFFFFFFFF8) + 15;
  swift_release();
  v20 &= 0xFFFFFFFFFFFFFFF8;
  v21 = ((unint64_t)v19 + 15) & 0xFFFFFFFFFFFFF8;
  v22 = *(_QWORD *)v21;
  v21 += 15;
  *(_QWORD *)v20 = v22;
  swift_bridgeObjectRelease();
  v23 = (_QWORD *)((v20 + 15) & 0xFFFFFFFFFFFFFFF8);
  *v23 = *(_QWORD *)(v21 & 0xFFFFFFFFFFFFFFF8);
  v23[1] = *(_QWORD *)((v21 & 0xFFFFFFFFFFFFFFF8) + 8);
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t sub_1DADF83BC(uint64_t a1, unsigned int a2, uint64_t a3)
{
  uint64_t v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  uint64_t v8;
  uint64_t v9;
  unsigned int v10;
  unsigned int v11;
  uint64_t v12;
  unint64_t *v14;
  unint64_t v15;
  unsigned int v16;

  v4 = *(_QWORD *)(*(_QWORD *)(a3 + 16) - 8);
  v5 = *(_DWORD *)(v4 + 84);
  if (v5)
    v6 = v5 - 1;
  else
    v6 = 0;
  if (v6 <= 0x7FFFFFFF)
    v7 = 0x7FFFFFFF;
  else
    v7 = v6;
  if (v5)
    v8 = 7;
  else
    v8 = 8;
  if (!a2)
    return 0;
  v9 = *(unsigned __int8 *)(v4 + 80);
  if (v7 < a2)
  {
    if (((((((((v8 + *(_QWORD *)(v4 + 64) + ((v9 + 16) & ~v9)) & 0xFFFFFFFFFFFFFFF8) + 15) & 0xFFFFFFFFFFFFFFF8)
           + 15) & 0xFFFFFFFFFFFFFFF8)
         + 16) & 0xFFFFFFF8) != 0)
      v10 = 2;
    else
      v10 = a2 - v7 + 1;
    if (v10 >= 0x10000)
      v11 = 4;
    else
      v11 = 2;
    if (v10 < 0x100)
      v11 = 1;
    if (v10 >= 2)
      v12 = v11;
    else
      v12 = 0;
    __asm { BR              X16 }
  }
  v14 = (unint64_t *)((a1 + 15) & 0xFFFFFFFFFFFFFFF8);
  if ((v6 & 0x80000000) != 0)
  {
    v16 = (*(uint64_t (**)(unint64_t))(v4 + 48))(((unint64_t)v14 + v9 + 8) & ~v9);
    if (v16 >= 2)
      return v16 - 1;
    else
      return 0;
  }
  else
  {
    v15 = *v14;
    if (v15 >= 0xFFFFFFFF)
      LODWORD(v15) = -1;
    return (v15 + 1);
  }
}

void sub_1DADF851C(unsigned int *a1, unsigned int a2, unsigned int a3, uint64_t a4)
{
  int v6;
  uint64_t v7;
  int v8;
  unsigned int v9;
  unsigned int v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  unsigned int v15;

  v6 = 0u;
  v7 = *(_QWORD *)(*(_QWORD *)(a4 + 16) - 8);
  v8 = *(_DWORD *)(v7 + 84);
  if (v8)
    v9 = v8 - 1;
  else
    v9 = 0;
  if (v9 <= 0x7FFFFFFF)
    v10 = 0x7FFFFFFF;
  else
    v10 = v9;
  v11 = *(_QWORD *)(v7 + 64);
  if (!v8)
    ++v11;
  if (v10 < a3)
  {
    v12 = a3 - v10;
    if ((((((((_DWORD)v11 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFF8)
           + 15) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) == 0xFFFFFFF0)
      v13 = v12 + 1;
    else
      v13 = 2;
    if (v13 >= 0x10000)
      v14 = 4;
    else
      v14 = 2;
    if (v13 < 0x100)
      v14 = 1;
    if (v13 >= 2)
      v6 = v14;
    else
      v6 = 0;
  }
  if (a2 > v10)
  {
    if ((((((((_DWORD)v11 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFF8)
           + 15) & 0xFFFFFFF8)
         + 15) & 0xFFFFFFF8) != 0xFFFFFFF0)
    {
      v15 = ~v10 + a2;
      bzero(a1, ((((((v11 + ((*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80)) + 7) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 15) & 0xFFFFFFFFFFFFFFF8)+ 16);
      *a1 = v15;
    }
    __asm { BR              X10 }
  }
  __asm { BR              X15 }
}

uint64_t sub_1DADF8638@<X0>(unsigned int a1@<W1>, size_t a2@<X8>, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  uint64_t v10;
  unsigned int v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  int v18;
  uint64_t result;

  *(_BYTE *)(v14 + v15) = 0;
  if (a1)
  {
    v16 = (_QWORD *)((v14 + 15) & 0xFFFFFFFFFFFFFFF8);
    if ((v11 & 0x80000000) != 0)
    {
      if (v11 >= a1)
      {
        return (*(uint64_t (**)(unint64_t, _QWORD))(v12 + 56))(((unint64_t)v16 + v13 + 8) & v10, a1 + 1);
      }
      else if ((_DWORD)a2)
      {
        if (a2 <= 3)
          v18 = a2;
        else
          v18 = 4;
        bzero((void *)(((unint64_t)v16 + v13 + 8) & v10), a2);
        __asm { BR              X10 }
      }
    }
    else
    {
      if ((a1 & 0x80000000) != 0)
        v17 = a1 ^ 0x80000000;
      else
        v17 = a1 - 1;
      *v16 = v17;
    }
  }
  return result;
}

void sub_1DADF8730()
{
  _WORD *v0;
  __int16 v1;

  *v0 = v1;
}

void sub_1DADF8738()
{
  uint64_t v0;
  int v1;

  *(_WORD *)v0 = v1;
  *(_BYTE *)(v0 + 2) = BYTE2(v1);
}

void sub_1DADF8748()
{
  _DWORD *v0;
  int v1;

  *v0 = v1;
}

uint64_t type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SearchUIUserReportRequestSelectorSectionContent);
}

uint64_t sub_1DADF8760()
{
  return swift_getOpaqueTypeConformance2();
}

void sub_1DADF879C()
{
  sub_1DAE0D710();
  sub_1DAE0D0BC();
  JUMPOUT(0x1DF0A77BCLL);
}

uint64_t sub_1DADF87D4@<X0>(uint64_t a1@<X0>, char *a2@<X8>)
{
  uint64_t v2;
  uint64_t v4;
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
  unint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(char *, char *, uint64_t);
  char *v21;
  void (*v22)(char *, uint64_t);
  uint64_t KeyPath;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  char *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;

  v30 = a2;
  v4 = *(_QWORD *)(a1 - 8);
  v31 = (char *)&KeyPath - ((*(_QWORD *)(v4 + 64) + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *(_QWORD *)(MEMORY[0x1E0C80A78](a1) + 16);
  v6 = sub_1DAE0D5FC();
  v28 = v6;
  v7 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E2E0);
  v27 = v7;
  v26 = MEMORY[0x1DF0A8B00](MEMORY[0x1E0DEAF48], v6);
  v8 = *(_QWORD *)(a1 + 32);
  v36 = v6;
  v37 = v5;
  v38 = v7;
  v39 = v26;
  v40 = v8;
  v9 = sub_1DAE0D0D4();
  v29 = *(_QWORD *)(v9 - 8);
  v10 = MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&KeyPath - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v10);
  v25 = (char *)&KeyPath - v13;
  v36 = *(_QWORD *)(v2 + *(int *)(a1 + 48));
  v14 = *(_QWORD *)(a1 + 24);
  v32 = v5;
  v33 = v14;
  v34 = v8;
  KeyPath = swift_getKeyPath();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v31, v2, a1);
  v15 = v4;
  v16 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v17 = (char *)swift_allocObject();
  *((_QWORD *)v17 + 2) = v5;
  *((_QWORD *)v17 + 3) = v14;
  *((_QWORD *)v17 + 4) = v8;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v17[v16], v31, a1);
  v18 = sub_1DADDD9BC(&qword_1F029E2E8, &qword_1F029E2E0, MEMORY[0x1E0CDFA58]);
  swift_bridgeObjectRetain();
  sub_1DAE0D0C8();
  v35 = v18;
  MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDFEE8], v9, &v35);
  v19 = v29;
  v20 = *(void (**)(char *, char *, uint64_t))(v29 + 16);
  v21 = v25;
  v20(v25, v12, v9);
  v22 = *(void (**)(char *, uint64_t))(v19 + 8);
  v22(v12, v9);
  v20(v30, v21, v9);
  return ((uint64_t (*)(char *, uint64_t))v22)(v21, v9);
}

uint64_t sub_1DADF8A38@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X2>, uint64_t a4@<X3>, uint64_t a5@<X4>, uint64_t a6@<X8>)
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
  char *v18;
  unint64_t v19;
  unint64_t v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
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

  v27 = a4;
  v28 = a5;
  v29 = a2;
  v30 = a6;
  v26 = a1;
  v9 = *(_QWORD *)(a3 - 8);
  v10 = *(_QWORD *)(v9 + 64);
  MEMORY[0x1E0C80A78](a1);
  v25 = (char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, v11, v12, v13);
  v15 = *(_QWORD *)(v14 - 8);
  v16 = *(_QWORD *)(v15 + 64);
  MEMORY[0x1E0C80A78](v14);
  v18 = (char *)&v25 - v17;
  (*(void (**)(char *, uint64_t, uint64_t))(v15 + 16))((char *)&v25 - v17, a2, v14);
  (*(void (**)(char *, uint64_t, uint64_t))(v9 + 16))((char *)&v25 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0), a1, a3);
  v19 = (*(unsigned __int8 *)(v15 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v15 + 80);
  v20 = (v16 + *(unsigned __int8 *)(v9 + 80) + v19) & ~(unint64_t)*(unsigned __int8 *)(v9 + 80);
  v21 = (char *)swift_allocObject();
  v22 = v27;
  v23 = v28;
  *((_QWORD *)v21 + 2) = a3;
  *((_QWORD *)v21 + 3) = v22;
  *((_QWORD *)v21 + 4) = v23;
  (*(void (**)(char *, char *, uint64_t))(v15 + 32))(&v21[v19], v18, v14);
  (*(void (**)(char *, char *, uint64_t))(v9 + 32))(&v21[v20], v25, a3);
  v31 = a3;
  v32 = v22;
  v33 = v23;
  v34 = v26;
  v35 = v29;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E2F0);
  sub_1DADDD9BC(&qword_1F029E2F8, &qword_1F029E2F0, MEMORY[0x1E0CDFB10]);
  return sub_1DAE0D068();
}

uint64_t sub_1DADF8C00(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  uint64_t v13;
  uint64_t v15;

  v9 = sub_1DAE0D710();
  v10 = *(_QWORD *)(v9 - 8);
  MEMORY[0x1E0C80A78](v9);
  v12 = (char *)&v15 - v11;
  v13 = *(_QWORD *)(a3 - 8);
  (*(void (**)(char *, uint64_t, uint64_t))(v13 + 16))((char *)&v15 - v11, a2, a3);
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(v13 + 56))(v12, 0, 1, a3);
  type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, a3, a4, a5);
  sub_1DADF97B8((uint64_t)v12);
  return (*(uint64_t (**)(char *, uint64_t))(v10 + 8))(v12, v9);
}

void sub_1DADF8CEC(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v10;

  *(_QWORD *)a5 = sub_1DAE0CCE4();
  *(_QWORD *)(a5 + 8) = 0;
  *(_BYTE *)(a5 + 16) = 1;
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E300);
  sub_1DADF8D68(a1, a2, a3, a4, a5 + *(int *)(v10 + 44));
}

void sub_1DADF8D68(uint64_t a1@<X0>, uint64_t a2@<X2>, uint64_t a3@<X3>, uint64_t a4@<X4>, uint64_t a5@<X8>)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  int v24;
  uint64_t v25;
  _QWORD v26[9];
  int v27;
  uint64_t v28;
  char *v29;
  uint64_t KeyPath;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  char *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  char *v39;
  char *v40;
  uint64_t TupleTypeMetadata2;
  char *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;

  v28 = a5;
  v26[8] = *(_QWORD *)(a2 - 8);
  MEMORY[0x1E0C80A78](a1);
  v26[3] = (char *)v26 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v26[7] = sub_1DAE0D710();
  TupleTypeMetadata2 = swift_getTupleTypeMetadata2();
  v26[6] = *(_QWORD *)(TupleTypeMetadata2 - 8);
  v9 = MEMORY[0x1E0C80A78](TupleTypeMetadata2);
  v42 = (char *)v26 - v10;
  v11 = MEMORY[0x1E0C80A78](v9);
  v26[5] = (char *)v26 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v13 = MEMORY[0x1E0C80A78](v11);
  MEMORY[0x1E0C80A78](v13);
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E308);
  v37 = *(_QWORD *)(v14 - 8);
  v38 = v14;
  MEMORY[0x1E0C80A78](v14);
  v16 = (char *)v26 - ((v15 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E310);
  v17 = MEMORY[0x1E0C80A78](v31);
  v40 = (char *)v26 - ((v18 + 15) & 0xFFFFFFFFFFFFFFF0);
  v19 = MEMORY[0x1E0C80A78](v17);
  v29 = (char *)v26 - v20;
  MEMORY[0x1E0C80A78](v19);
  v39 = (char *)v26 - v21;
  v26[4] = a4;
  type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, a2, a3, a4);
  swift_getAtKeyPath();
  v43 = v45;
  v44 = v46;
  sub_1DADE63A4();
  v22 = sub_1DAE0CF18();
  v33 = v23;
  v34 = v22;
  v27 = v24;
  v36 = v25;
  v32 = sub_1DAE0CFE4();
  KeyPath = swift_getKeyPath();
  swift_bridgeObjectRetain();
  v45 = sub_1DAE0CFFC();
  sub_1DAE0CEF4();
  v35 = v16;
  sub_1DAE0CF3C();
  swift_release();
  sub_1DADF879C();
}

uint64_t sub_1DADF9060()
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
  uint64_t v9;
  void (*v10)(uint64_t, uint64_t, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unsigned int (*v16)(uint64_t, uint64_t, uint64_t);
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  double v19;
  uint64_t v20;
  void (*v21)(uint64_t, uint64_t);
  uint64_t v22;
  char v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t, uint64_t);
  char v26;
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

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 16))(v3, v5, v4);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v3, 0, 1, v4);
  v7 = *(_QWORD *)(v6 - 144);
  v8 = v1;
  v9 = v7 + *(int *)(*(_QWORD *)(v6 - 152) + 48);
  v10 = *(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 16);
  v11 = v0;
  v12 = *(_QWORD *)(v6 - 280);
  v10(v7, v0, v12);
  v13 = v3;
  v14 = v3;
  v15 = v12;
  v10(v9, v14, v12);
  v16 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48);
  if (v16(v7, 1, v4) != 1)
  {
    *(_QWORD *)(v6 - 328) = v11;
    *(_QWORD *)(v6 - 320) = v8;
    v20 = *(_QWORD *)(v6 - 296);
    v10(v20, *(_QWORD *)(v6 - 144), v15);
    if (v16(v9, 1, v4) != 1)
    {
      v22 = *(_QWORD *)(v6 - 312);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v2 + 32))(v22, v9, v4);
      v23 = sub_1DAE0D4D0();
      v24 = *(void (**)(uint64_t, uint64_t))(v2 + 8);
      v24(v22, v4);
      v25 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 8);
      v25(v13, v15);
      v25(*(_QWORD *)(v6 - 328), v15);
      v24(v20, v4);
      v25(*(_QWORD *)(v6 - 144), v15);
      v19 = 1.0;
      if ((v23 & 1) != 0)
        goto LABEL_9;
LABEL_8:
      v19 = 0.0;
      goto LABEL_9;
    }
    v17 = *(_QWORD *)(v6 - 144);
    v21 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v6 - 320) + 8);
    v21(v13, v15);
    v21(*(_QWORD *)(v6 - 328), v15);
    (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v20, v4);
LABEL_6:
    (*(void (**)(uint64_t, _QWORD))(*(_QWORD *)(v6 - 288) + 8))(v17, *(_QWORD *)(v6 - 152));
    goto LABEL_8;
  }
  v17 = *(_QWORD *)(v6 - 144);
  v18 = *(void (**)(uint64_t, uint64_t))(v8 + 8);
  v18(v13, v15);
  v18(v11, v15);
  if (v16(v9, 1, v4) != 1)
    goto LABEL_6;
  v18(v17, v15);
  v19 = 1.0;
LABEL_9:
  v26 = *(_DWORD *)(v6 - 260) & 1;
  v28 = *(_QWORD *)(v6 - 184);
  v27 = *(_QWORD *)(v6 - 176);
  v29 = *(_QWORD *)(v6 - 248);
  v30 = *(_QWORD *)(v6 - 200);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v28 + 16))(v29, v30, v27);
  *(double *)(v29 + *(int *)(*(_QWORD *)(v6 - 232) + 36)) = v19;
  (*(void (**)(uint64_t, uint64_t))(v28 + 8))(v30, v27);
  v31 = *(_QWORD *)(v6 - 168);
  sub_1DADF96E8(v29, v31);
  v32 = *(_QWORD *)(v6 - 160);
  sub_1DADF9730(v31, v32);
  v34 = *(_QWORD *)(v6 - 216);
  v33 = *(_QWORD *)(v6 - 208);
  v35 = *(_QWORD *)(v6 - 256);
  *(_QWORD *)v35 = v33;
  *(_QWORD *)(v35 + 8) = v34;
  *(_BYTE *)(v35 + 16) = v26;
  v36 = *(_QWORD *)(v6 - 240);
  *(_QWORD *)(v35 + 24) = *(_QWORD *)(v6 - 192);
  *(_QWORD *)(v35 + 32) = v36;
  *(_QWORD *)(v35 + 40) = *(_QWORD *)(v6 - 224);
  *(_QWORD *)(v35 + 48) = 0;
  *(_BYTE *)(v35 + 56) = 1;
  v37 = __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029E318);
  sub_1DADF9730(v32, v35 + *(int *)(v37 + 64));
  sub_1DADF273C(v33, v34, v26);
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  sub_1DAE0C564();
  sub_1DADF9778(v31);
  sub_1DADF9778(v32);
  sub_1DADE68D8(v33, v34, v26);
  swift_release();
  swift_release();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADF93AC()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v1 = v0[2];
  v2 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, v1, v0[3], v0[4])- 8)+ 80);
  swift_release();
  swift_release();
  sub_1DAE0D710();
  v3 = (uint64_t)v0 + ((v2 + 40) & ~v2) + *(int *)(sub_1DAE0D0BC() + 32);
  v4 = *(_QWORD *)(v1 - 8);
  if (!(*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v3, 1, v1))
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DADF94AC@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  _QWORD *v2;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = v2[2];
  v6 = v2[3];
  v7 = v2[4];
  v8 = *(unsigned __int8 *)(*(_QWORD *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, v5, v6, v7)- 8)+ 80);
  return sub_1DADF8A38(a1, (uint64_t)v2 + ((v8 + 40) & ~v8), v5, v6, v7, a2);
}

uint64_t sub_1DADF9520()
{
  char *v0;
  uint64_t v1;
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v1 = *((_QWORD *)v0 + 2);
  v2 = *(_QWORD *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, v1, *((_QWORD *)v0 + 3), *((_QWORD *)v0 + 4))- 8);
  v3 = (*(unsigned __int8 *)(v2 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v2 + 80);
  v8 = *(_QWORD *)(v2 + 64);
  v4 = *(_QWORD *)(v1 - 8);
  v5 = *(unsigned __int8 *)(v4 + 80);
  swift_release();
  swift_release();
  sub_1DAE0D710();
  v6 = &v0[v3 + *(int *)(sub_1DAE0D0BC() + 32)];
  if (!(*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v6, 1, v1))
    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v1);
  swift_release();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(&v0[(v3 + v8 + v5) & ~v5], v1);
  return swift_deallocObject();
}

uint64_t sub_1DADF9658()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;

  v1 = v0[2];
  v2 = v0[3];
  v3 = v0[4];
  v4 = *(_QWORD *)(type metadata accessor for SearchUIUserReportRequestSelectorSectionContent(0, v1, v2, v3) - 8);
  v5 = (*(unsigned __int8 *)(v4 + 80) + 40) & ~(unint64_t)*(unsigned __int8 *)(v4 + 80);
  v6 = *(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80);
  return sub_1DADF8C00((uint64_t)v0 + v5, (uint64_t)v0 + ((v5 + *(_QWORD *)(v4 + 64) + v6) & ~v6), v1, v2, v3);
}

void sub_1DADF96D0(uint64_t a1@<X8>)
{
  uint64_t *v1;

  sub_1DADF8CEC(v1[5], v1[2], v1[3], v1[4], a1);
}

uint64_t sub_1DADF96E8(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADF9730(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E310);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADF9778(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E310);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADF97B8(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v6;

  v2 = sub_1DAE0D710();
  MEMORY[0x1E0C80A78](v2);
  (*(void (**)(char *, uint64_t, uint64_t))(v3 + 16))((char *)&v6 - v4, a1, v2);
  sub_1DAE0D0BC();
  return sub_1DAE0D098();
}

uint64_t sub_1DADF9844(uint64_t *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  v1 = *a1;
  v2 = a1[2];
  v6 = sub_1DAE0D5FC();
  v7 = v1;
  v8 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E2E0);
  v9 = MEMORY[0x1DF0A8B00](MEMORY[0x1E0DEAF48], v6);
  v10 = v2;
  v3 = sub_1DAE0D0D4();
  v5 = sub_1DADDD9BC(&qword_1F029E2E8, &qword_1F029E2E0, MEMORY[0x1E0CDFA58]);
  return MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDFEE8], v3, &v5);
}

uint64_t sub_1DADF98FC@<X0>(uint64_t *a1@<X0>, unint64_t *a2@<X1>, uint64_t (*a3)(_QWORD)@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  void (*v10)(_QWORD *, _QWORD);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v15[5];

  __swift_instantiateConcreteTypeFromMangledName(a1);
  sub_1DADFC7F8(a2, a1);
  sub_1DAE0D698();
  sub_1DAE0D6A4();
  if (v15[4] == v15[0])
  {
    v8 = a3(0);
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 56))(a4, 1, 1, v8);
  }
  else
  {
    v10 = (void (*)(_QWORD *, _QWORD))sub_1DAE0D6B0();
    v12 = v11;
    v13 = a3(0);
    v14 = *(_QWORD *)(v13 - 8);
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v14 + 16))(a4, v12, v13);
    v10(v15, 0);
    return (*(uint64_t (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v14 + 56))(a4, 0, 1, v13);
  }
}

uint64_t sub_1DADF9A0C(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(v1 + 16) = a1;
  return swift_task_switch();
}

uint64_t sub_1DADF9A24()
{
  uint64_t v0;
  id v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  _QWORD *v7;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_mediaIdentifier);
  if (!v1)
    return (*(uint64_t (**)(void))(v0 + 8))();
  v2 = *(void **)(v0 + 16);
  v3 = sub_1DAE0D53C();
  v5 = v4;

  *(_QWORD *)(v0 + 24) = v5;
  v6 = objc_msgSend(v2, sel_mediaType);
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 32) = v7;
  *v7 = v0;
  v7[1] = sub_1DADF9AE4;
  return sub_1DADFAB1C(v3, v5, v6);
}

uint64_t sub_1DADF9AE4()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DADF9C60(void *a1, void *aBlock)
{
  uint64_t v2;
  id v4;

  *(_QWORD *)(v2 + 16) = a1;
  *(_QWORD *)(v2 + 24) = _Block_copy(aBlock);
  v4 = a1;
  return swift_task_switch();
}

uint64_t sub_1DADF9CAC()
{
  uint64_t v0;
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  _QWORD *v8;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_mediaIdentifier);
  v2 = *(void **)(v0 + 16);
  if (v1)
  {
    v3 = v1;
    v4 = sub_1DAE0D53C();
    v6 = v5;

    *(_QWORD *)(v0 + 32) = v6;
    v7 = objc_msgSend(v2, sel_mediaType);
    v8 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 40) = v8;
    *v8 = v0;
    v8[1] = sub_1DADF9D84;
    return sub_1DADFAB1C(v4, v6, v7);
  }
  else
  {

    (*(void (**)(void))(*(_QWORD *)(v0 + 24) + 16))();
    _Block_release(*(const void **)(v0 + 24));
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1DADF9D84()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  swift_bridgeObjectRelease();
  return swift_task_switch();
}

uint64_t sub_1DADF9DF0()
{
  uint64_t v0;

  (*(void (**)(void))(*(_QWORD *)(v0 + 24) + 16))();
  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADF9E38()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 48);
  v2 = *(_QWORD *)(v0 + 24);

  v3 = (void *)sub_1DAE0C72C();
  (*(void (**)(uint64_t, void *))(v2 + 16))(v2, v3);

  _Block_release(*(const void **)(v0 + 24));
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADF9EA4()
{
  _QWORD *v0;
  uint64_t v1;
  _QWORD *v2;

  v1 = sub_1DAE0D29C();
  v0[2] = v1;
  v0[3] = *(_QWORD *)(v1 - 8);
  v0[4] = swift_task_alloc();
  v2 = (_QWORD *)swift_task_alloc();
  v0[5] = v2;
  *v2 = v0;
  v2[1] = sub_1DADF9F20;
  return sub_1DAE0D290();
}

uint64_t sub_1DADF9F20()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 48) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADF9F84()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char v4;

  v2 = *(_QWORD *)(v0 + 24);
  v1 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = sub_1DAE0D284();
  (*(void (**)(uint64_t, uint64_t))(v2 + 8))(v1, v3);
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v4 & 1);
}

uint64_t sub_1DADF9FE4()
{
  uint64_t v0;

  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1DADFA130(const void *a1)
{
  _QWORD *v1;
  uint64_t v3;
  _QWORD *v4;

  v3 = sub_1DAE0D29C();
  v1[2] = v3;
  v1[3] = *(_QWORD *)(v3 - 8);
  v1[4] = swift_task_alloc();
  v1[5] = _Block_copy(a1);
  v4 = (_QWORD *)swift_task_alloc();
  v1[6] = v4;
  *v4 = v1;
  v4[1] = sub_1DADFA1BC;
  return sub_1DAE0D290();
}

uint64_t sub_1DADFA1BC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 56) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFA220()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  char v5;

  v2 = *(_QWORD *)(v0 + 32);
  v1 = *(_QWORD *)(v0 + 40);
  v3 = *(_QWORD *)(v0 + 16);
  v4 = *(_QWORD *)(v0 + 24);
  v5 = sub_1DAE0D284();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v2, v3);
  (*(void (**)(uint64_t, _QWORD, _QWORD))(v1 + 16))(v1, v5 & 1, 0);
  _Block_release(*(const void **)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFA29C()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v1 = *(void **)(v0 + 56);
  v2 = *(_QWORD *)(v0 + 40);
  v3 = (void *)sub_1DAE0C72C();

  (*(void (**)(uint64_t, _QWORD, void *))(v2 + 16))(v2, 0, v3);
  _Block_release(*(const void **)(v0 + 40));
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

id SearchUIMusicUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUIMusicUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMusicUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIMusicUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIMusicUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DADFA3CC(uint64_t a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *(_DWORD *)(v2 + 288) = a2;
  *(_QWORD *)(v2 + 136) = a1;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E450);
  *(_QWORD *)(v2 + 144) = swift_task_alloc();
  v3 = sub_1DAE0D338();
  *(_QWORD *)(v2 + 152) = v3;
  *(_QWORD *)(v2 + 160) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 168) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3B8);
  *(_QWORD *)(v2 + 176) = swift_task_alloc();
  v4 = sub_1DAE0D308();
  *(_QWORD *)(v2 + 184) = v4;
  *(_QWORD *)(v2 + 192) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 200) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3D8);
  *(_QWORD *)(v2 + 208) = swift_task_alloc();
  v5 = sub_1DAE0D2FC();
  *(_QWORD *)(v2 + 216) = v5;
  *(_QWORD *)(v2 + 224) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 232) = swift_task_alloc();
  sub_1DAE0D62C();
  *(_QWORD *)(v2 + 240) = sub_1DAE0D620();
  *(_QWORD *)(v2 + 248) = sub_1DAE0D608();
  *(_QWORD *)(v2 + 256) = v6;
  return swift_task_switch();
}

uint64_t sub_1DADFA520()
{
  uint64_t v0;
  int v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  _QWORD *v33;
  uint64_t (*v35)(void);

  v1 = *(_DWORD *)(v0 + 288);
  sub_1DAE0D248();
  *(_QWORD *)(v0 + 264) = sub_1DAE0D23C();
  if (v1 == 3)
  {
    v13 = *(_QWORD *)(v0 + 160);
    sub_1DADFC838(*(_QWORD *)(v0 + 136), v0 + 16);
    if (*(_QWORD *)(v0 + 40))
    {
      v14 = *(_QWORD *)(v0 + 152);
      v15 = *(_QWORD *)(v0 + 160);
      v16 = *(_QWORD *)(v0 + 144);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E458);
      v17 = swift_dynamicCast();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v13 + 56))(v16, v17 ^ 1u, 1, v14);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v16, 1, v14) != 1)
      {
        v8 = *(_QWORD *)(v0 + 160);
        v7 = *(_QWORD *)(v0 + 168);
        v9 = *(_QWORD *)(v0 + 152);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v7, *(_QWORD *)(v0 + 144), v9);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029E460);
        v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_1DAE1E030;
        v11 = (uint64_t *)(v10 + 32);
        v12 = MEMORY[0x1E0CCD510];
        goto LABEL_13;
      }
    }
    else
    {
      v30 = *(_QWORD *)(v0 + 144);
      v29 = *(_QWORD *)(v0 + 152);
      sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v13 + 56))(v30, 1, 1, v29);
    }
    v27 = *(_QWORD *)(v0 + 144);
    v28 = (uint64_t *)&unk_1F029E450;
LABEL_21:
    sub_1DADDCC3C(v27, v28);
    goto LABEL_22;
  }
  if (v1 == 2)
  {
    v18 = *(_QWORD *)(v0 + 192);
    sub_1DADFC838(*(_QWORD *)(v0 + 136), v0 + 56);
    if (*(_QWORD *)(v0 + 80))
    {
      v19 = *(_QWORD *)(v0 + 184);
      v20 = *(_QWORD *)(v0 + 192);
      v21 = *(_QWORD *)(v0 + 176);
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E458);
      v22 = swift_dynamicCast();
      (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v18 + 56))(v21, v22 ^ 1u, 1, v19);
      if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v20 + 48))(v21, 1, v19) != 1)
      {
        v8 = *(_QWORD *)(v0 + 192);
        v7 = *(_QWORD *)(v0 + 200);
        v9 = *(_QWORD *)(v0 + 184);
        (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v7, *(_QWORD *)(v0 + 176), v9);
        __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029E460);
        v10 = swift_allocObject();
        *(_OWORD *)(v10 + 16) = xmmword_1DAE1E030;
        v11 = (uint64_t *)(v10 + 32);
        v12 = MEMORY[0x1E0CCCD88];
        goto LABEL_13;
      }
    }
    else
    {
      v32 = *(_QWORD *)(v0 + 176);
      v31 = *(_QWORD *)(v0 + 184);
      sub_1DADDCC3C(v0 + 56, &qword_1F029E410);
      (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v18 + 56))(v32, 1, 1, v31);
    }
    v27 = *(_QWORD *)(v0 + 176);
    v28 = (uint64_t *)&unk_1F029E3B8;
    goto LABEL_21;
  }
  if (v1 != 1)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E400);
    v24 = swift_allocObject();
    *(_OWORD *)(v24 + 16) = xmmword_1DAE1E030;
    *(_QWORD *)(v24 + 56) = MEMORY[0x1E0DEA968];
    *(_QWORD *)(v24 + 32) = 0xD000000000000014;
    *(_QWORD *)(v24 + 40) = 0x80000001DAE23B50;
    sub_1DAE0D8FC();
    swift_bridgeObjectRelease();
    goto LABEL_22;
  }
  v2 = *(_QWORD *)(v0 + 224);
  sub_1DADFC838(*(_QWORD *)(v0 + 136), v0 + 96);
  if (!*(_QWORD *)(v0 + 120))
  {
    v26 = *(_QWORD *)(v0 + 208);
    v25 = *(_QWORD *)(v0 + 216);
    sub_1DADDCC3C(v0 + 96, &qword_1F029E410);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v2 + 56))(v26, 1, 1, v25);
    goto LABEL_16;
  }
  v3 = *(_QWORD *)(v0 + 216);
  v4 = *(_QWORD *)(v0 + 224);
  v5 = *(_QWORD *)(v0 + 208);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E458);
  v6 = swift_dynamicCast();
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v2 + 56))(v5, v6 ^ 1u, 1, v3);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v4 + 48))(v5, 1, v3) == 1)
  {
LABEL_16:
    v27 = *(_QWORD *)(v0 + 208);
    v28 = (uint64_t *)&unk_1F029E3D8;
    goto LABEL_21;
  }
  v8 = *(_QWORD *)(v0 + 224);
  v7 = *(_QWORD *)(v0 + 232);
  v9 = *(_QWORD *)(v0 + 216);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v8 + 32))(v7, *(_QWORD *)(v0 + 208), v9);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1F029E460);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1DAE1E030;
  v11 = (uint64_t *)(v10 + 32);
  v12 = MEMORY[0x1E0CCCB58];
LABEL_13:
  *(_QWORD *)(v10 + 56) = v9;
  *(_QWORD *)(v10 + 64) = v12;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(v8 + 16))(boxed_opaque_existential_1, v7, v9);
  sub_1DAE0D2F0();
  sub_1DAE0D2E4();
  sub_1DAE0D230();
  (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v7, v9);
LABEL_22:
  v35 = (uint64_t (*)(void))((int)*MEMORY[0x1E0CC9438] + MEMORY[0x1E0CC9438]);
  v33 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 272) = v33;
  *v33 = v0;
  v33[1] = sub_1DADFA994;
  return v35();
}

uint64_t sub_1DADFA994()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 280) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFA9F4()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFAA88()
{
  uint64_t v0;

  swift_release();
  swift_release();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFAB1C(uint64_t a1, uint64_t a2, int a3)
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

  *(_DWORD *)(v3 + 696) = a3;
  *(_QWORD *)(v3 + 224) = a1;
  *(_QWORD *)(v3 + 232) = a2;
  v4 = sub_1DAE0D338();
  *(_QWORD *)(v3 + 240) = v4;
  *(_QWORD *)(v3 + 248) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v3 + 256) = swift_task_alloc();
  v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E390);
  *(_QWORD *)(v3 + 264) = v5;
  *(_QWORD *)(v3 + 272) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v3 + 280) = swift_task_alloc();
  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E398);
  *(_QWORD *)(v3 + 288) = v6;
  *(_QWORD *)(v3 + 296) = *(_QWORD *)(v6 - 8);
  *(_QWORD *)(v3 + 304) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3A0);
  *(_QWORD *)(v3 + 312) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3A8);
  *(_QWORD *)(v3 + 320) = swift_task_alloc();
  v7 = sub_1DAE0D314();
  *(_QWORD *)(v3 + 328) = v7;
  *(_QWORD *)(v3 + 336) = *(_QWORD *)(v7 - 8);
  *(_QWORD *)(v3 + 344) = swift_task_alloc();
  *(_QWORD *)(v3 + 352) = swift_task_alloc();
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3B0);
  *(_QWORD *)(v3 + 360) = v8;
  *(_QWORD *)(v3 + 368) = *(_QWORD *)(v8 - 8);
  *(_QWORD *)(v3 + 376) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3B8);
  *(_QWORD *)(v3 + 384) = swift_task_alloc();
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3C0);
  *(_QWORD *)(v3 + 392) = v9;
  *(_QWORD *)(v3 + 400) = *(_QWORD *)(v9 - 8);
  *(_QWORD *)(v3 + 408) = swift_task_alloc();
  v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3C8);
  *(_QWORD *)(v3 + 416) = v10;
  *(_QWORD *)(v3 + 424) = *(_QWORD *)(v10 - 8);
  *(_QWORD *)(v3 + 432) = swift_task_alloc();
  v11 = sub_1DAE0D308();
  *(_QWORD *)(v3 + 440) = v11;
  *(_QWORD *)(v3 + 448) = *(_QWORD *)(v11 - 8);
  *(_QWORD *)(v3 + 456) = swift_task_alloc();
  v12 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3D0);
  *(_QWORD *)(v3 + 464) = v12;
  *(_QWORD *)(v3 + 472) = *(_QWORD *)(v12 - 8);
  *(_QWORD *)(v3 + 480) = swift_task_alloc();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3D8);
  *(_QWORD *)(v3 + 488) = swift_task_alloc();
  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3E0);
  *(_QWORD *)(v3 + 496) = v13;
  *(_QWORD *)(v3 + 504) = *(_QWORD *)(v13 - 8);
  *(_QWORD *)(v3 + 512) = swift_task_alloc();
  v14 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3E8);
  *(_QWORD *)(v3 + 520) = v14;
  *(_QWORD *)(v3 + 528) = *(_QWORD *)(v14 - 8);
  *(_QWORD *)(v3 + 536) = swift_task_alloc();
  v15 = sub_1DAE0D2FC();
  *(_QWORD *)(v3 + 544) = v15;
  *(_QWORD *)(v3 + 552) = *(_QWORD *)(v15 - 8);
  *(_QWORD *)(v3 + 560) = swift_task_alloc();
  v16 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E3F0);
  *(_QWORD *)(v3 + 568) = v16;
  *(_QWORD *)(v3 + 576) = *(_QWORD *)(v16 - 8);
  *(_QWORD *)(v3 + 584) = swift_task_alloc();
  v17 = sub_1DAE0D260();
  *(_QWORD *)(v3 + 592) = v17;
  *(_QWORD *)(v3 + 600) = *(_QWORD *)(v17 - 8);
  *(_QWORD *)(v3 + 608) = swift_task_alloc();
  *(_QWORD *)(v3 + 616) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADFAE5C()
{
  uint64_t v0;
  _OWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, uint64_t, uint64_t);
  char v8;
  void (*v9)(uint64_t, uint64_t);
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t);
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v19;
  uint64_t v21;
  _QWORD *v22;

  v1 = (_OWORD *)(v0 + 16);
  v2 = *(_QWORD *)(v0 + 616);
  v3 = *(_QWORD *)(v0 + 608);
  v4 = *(_QWORD *)(v0 + 600);
  v5 = *(_QWORD *)(v0 + 592);
  sub_1DAE0D26C();
  v6 = *MEMORY[0x1E0D50708];
  v7 = *(void (**)(uint64_t, uint64_t, uint64_t))(v4 + 104);
  v7(v3, v6, v5);
  sub_1DADE25F8(&qword_1F029E3F8, (uint64_t (*)(uint64_t))MEMORY[0x1E0D50710], MEMORY[0x1E0D50718]);
  v8 = sub_1DAE0D4D0();
  v9 = *(void (**)(uint64_t, uint64_t))(v4 + 8);
  v9(v3, v5);
  v9(v2, v5);
  if ((v8 & 1) == 0)
  {
    v7(*(_QWORD *)(v0 + 616), v6, *(_QWORD *)(v0 + 592));
    sub_1DAE0D278();
  }
  v10 = *(_DWORD *)(v0 + 696);
  swift_bridgeObjectRetain();
  v11 = sub_1DAE0D2D8();
  v13 = v12;
  *v1 = 0u;
  *(_OWORD *)(v0 + 32) = 0u;
  *(_QWORD *)(v0 + 48) = 0;
  switch(v10)
  {
    case 3:
      swift_getKeyPath();
      *(_QWORD *)(v0 + 176) = v11;
      *(_QWORD *)(v0 + 184) = v13;
      v15 = sub_1DAE0D32C();
      v16 = (uint64_t (*)(uint64_t))MEMORY[0x1E0CCD178];
      *(_QWORD *)(v0 + 656) = v15;
      sub_1DADE25F8(&qword_1F029E418, v16, MEMORY[0x1E0CCD1A0]);
      sub_1DAE0D2B4();
      __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4D46B0);
      v17 = swift_allocObject();
      *(_OWORD *)(v17 + 16) = xmmword_1DAE1E130;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E420);
      *(_QWORD *)(v17 + 32) = sub_1DAE0D254();
      sub_1DAE0D5D8();
      sub_1DAE0D2A8();
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 664) = v18;
      *v18 = v0;
      v18[1] = sub_1DADFB8D8;
      return sub_1DAE0D2C0();
    case 2:
      swift_getKeyPath();
      *(_QWORD *)(v0 + 208) = v11;
      *(_QWORD *)(v0 + 216) = v13;
      sub_1DADE25F8(&qword_1F029E428, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCCDF8], MEMORY[0x1E0CCCE20]);
      sub_1DAE0D2B4();
      v19 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 640) = v19;
      *v19 = v0;
      v19[1] = sub_1DADFB5B4;
      return sub_1DAE0D2C0();
    case 1:
      swift_getKeyPath();
      *(_QWORD *)(v0 + 192) = v11;
      *(_QWORD *)(v0 + 200) = v13;
      sub_1DADE25F8(&qword_1F029E430, (uint64_t (*)(uint64_t))MEMORY[0x1E0CCCBB8], MEMORY[0x1E0CCCBE0]);
      sub_1DAE0D2B4();
      v14 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 624) = v14;
      *v14 = v0;
      v14[1] = sub_1DADFB278;
      return sub_1DAE0D2C0();
  }
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E400);
  v21 = swift_allocObject();
  *(_OWORD *)(v21 + 16) = xmmword_1DAE1E030;
  *(_QWORD *)(v21 + 56) = MEMORY[0x1E0DEA968];
  *(_QWORD *)(v21 + 32) = 0xD000000000000014;
  *(_QWORD *)(v21 + 40) = 0x80000001DAE23B50;
  sub_1DAE0D8FC();
  swift_bridgeObjectRelease();
  v22 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 680) = v22;
  *v22 = v0;
  v22[1] = sub_1DADFBD40;
  return sub_1DADFA3CC((uint64_t)v1, *(_DWORD *)(v0 + 696));
}

uint64_t sub_1DADFB278()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 632) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFB2DC()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 552);
  v21 = v0 + 16;
  v2 = *(_QWORD *)(v0 + 544);
  v3 = *(_QWORD *)(v0 + 536);
  v4 = *(_QWORD *)(v0 + 528);
  v5 = *(_QWORD *)(v0 + 520);
  v6 = *(_QWORD *)(v0 + 504);
  v7 = *(_QWORD *)(v0 + 512);
  v9 = *(_QWORD *)(v0 + 488);
  v8 = *(_QWORD *)(v0 + 496);
  sub_1DAE0D2CC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1DADF98FC(&qword_1F029E3E0, &qword_1F029E438, (uint64_t (*)(_QWORD))MEMORY[0x1E0CCCBB8], v9);
  (*(void (**)(uint64_t, uint64_t))(v6 + 8))(v7, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v1 + 48))(v9, 1, v2) == 1)
  {
    v10 = *(_QWORD *)(v0 + 488);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 576) + 8))(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 568));
    sub_1DADDCC3C(v21, &qword_1F029E410);
    sub_1DADDCC3C(v10, &qword_1F029E3D8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 584);
    v13 = *(_QWORD *)(v0 + 576);
    v14 = *(_QWORD *)(v0 + 568);
    v15 = *(uint64_t **)(v0 + 560);
    v16 = *(_QWORD *)(v0 + 544);
    v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v0 + 552) + 32);
    v17(v15, *(uint64_t **)(v0 + 488), v16);
    v18 = MEMORY[0x1E0CCCB80];
    *(_QWORD *)(v0 + 160) = v16;
    *(_QWORD *)(v0 + 168) = v18;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 136));
    v17(boxed_opaque_existential_1, v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v13 + 8))(v12, v14);
    sub_1DADDCC3C(v21, &qword_1F029E410);
    sub_1DADFC748(v0 + 136, v21);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 680) = v20;
    *v20 = v0;
    v20[1] = sub_1DADFBD40;
    return sub_1DADFA3CC(v21, *(_DWORD *)(v0 + 696));
  }
}

uint64_t sub_1DADFB5B4()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 648) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFB618()
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
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  void (*v17)(uint64_t *, uint64_t *, uint64_t);
  uint64_t v18;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v20;
  uint64_t v21;

  v1 = *(_QWORD *)(v0 + 440);
  v2 = *(_QWORD *)(v0 + 448);
  v21 = v0 + 16;
  v4 = *(_QWORD *)(v0 + 424);
  v3 = *(_QWORD *)(v0 + 432);
  v6 = *(_QWORD *)(v0 + 408);
  v5 = *(_QWORD *)(v0 + 416);
  v8 = *(_QWORD *)(v0 + 392);
  v7 = *(_QWORD *)(v0 + 400);
  v9 = *(_QWORD *)(v0 + 384);
  sub_1DAE0D2CC();
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  sub_1DADF98FC(&qword_1F029E3C0, &qword_1F029E440, (uint64_t (*)(_QWORD))MEMORY[0x1E0CCCDF8], v9);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v2 + 48))(v9, 1, v1) == 1)
  {
    v10 = *(_QWORD *)(v0 + 384);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 472) + 8))(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 464));
    sub_1DADDCC3C(v21, &qword_1F029E410);
    sub_1DADDCC3C(v10, &qword_1F029E3B8);
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  else
  {
    v12 = *(_QWORD *)(v0 + 472);
    v13 = *(_QWORD *)(v0 + 480);
    v15 = *(uint64_t **)(v0 + 456);
    v14 = *(_QWORD *)(v0 + 464);
    v16 = *(_QWORD *)(v0 + 440);
    v17 = *(void (**)(uint64_t *, uint64_t *, uint64_t))(*(_QWORD *)(v0 + 448) + 32);
    v17(v15, *(uint64_t **)(v0 + 384), v16);
    v18 = MEMORY[0x1E0CCCDC0];
    *(_QWORD *)(v0 + 80) = v16;
    *(_QWORD *)(v0 + 88) = v18;
    boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 56));
    v17(boxed_opaque_existential_1, v15, v16);
    (*(void (**)(uint64_t, uint64_t))(v12 + 8))(v13, v14);
    sub_1DADDCC3C(v21, &qword_1F029E410);
    sub_1DADFC748(v0 + 56, v21);
    v20 = (_QWORD *)swift_task_alloc();
    *(_QWORD *)(v0 + 680) = v20;
    *v20 = v0;
    v20[1] = sub_1DADFBD40;
    return sub_1DADFA3CC(v21, *(_DWORD *)(v0 + 696));
  }
}

uint64_t sub_1DADFB8D8()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 672) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFB93C()
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
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  void (*v31)(uint64_t *, uint64_t, uint64_t);
  uint64_t v32;
  uint64_t *boxed_opaque_existential_1;
  _QWORD *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void (*v40)(uint64_t, uint64_t);
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;

  v1 = *(_QWORD *)(v0 + 656);
  v2 = *(_QWORD *)(v0 + 304);
  v3 = *(_QWORD *)(v0 + 312);
  v4 = *(_QWORD *)(v0 + 288);
  v5 = *(_QWORD *)(v0 + 296);
  v7 = *(_QWORD *)(v0 + 272);
  v6 = *(_QWORD *)(v0 + 280);
  v8 = *(_QWORD *)(v0 + 264);
  sub_1DAE0D2CC();
  (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v2, v4);
  sub_1DADF98FC(&qword_1F029E390, &qword_1F029E448, (uint64_t (*)(_QWORD))MEMORY[0x1E0CCD178], v3);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
  v9 = *(_QWORD *)(v1 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v9 + 48))(v3, 1, v1) == 1)
  {
    v10 = *(_QWORD *)(v0 + 328);
    v11 = *(_QWORD *)(v0 + 336);
    v12 = *(_QWORD *)(v0 + 320);
    sub_1DADDCC3C(*(_QWORD *)(v0 + 312), &qword_1F029E3A0);
    (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v11 + 56))(v12, 1, 1, v10);
LABEL_4:
    v18 = *(_QWORD *)(v0 + 320);
    (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 368) + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 360));
    sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
    sub_1DADDCC3C(v18, &qword_1F029E3A8);
LABEL_5:
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
  v13 = *(_QWORD *)(v0 + 656);
  v14 = *(_QWORD *)(v0 + 328);
  v15 = *(_QWORD *)(v0 + 336);
  v16 = *(_QWORD *)(v0 + 312);
  v17 = *(_QWORD *)(v0 + 320);
  sub_1DAE0D320();
  (*(void (**)(uint64_t, uint64_t))(v9 + 8))(v16, v13);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v15 + 48))(v17, 1, v14) == 1)
    goto LABEL_4;
  v21 = *(_QWORD *)(v0 + 344);
  v20 = *(_QWORD *)(v0 + 352);
  v22 = *(_QWORD *)(v0 + 328);
  v23 = *(_QWORD *)(v0 + 336);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v23 + 32))(v20, *(_QWORD *)(v0 + 320), v22);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(v23 + 16))(v21, v20, v22);
  if ((*(unsigned int (**)(uint64_t, uint64_t))(v23 + 88))(v21, v22) != *MEMORY[0x1E0D50748])
  {
    v36 = *(_QWORD *)(v0 + 368);
    v35 = *(_QWORD *)(v0 + 376);
    v37 = *(_QWORD *)(v0 + 360);
    v38 = *(_QWORD *)(v0 + 344);
    v39 = *(_QWORD *)(v0 + 328);
    v40 = *(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v0 + 336) + 8);
    v40(*(_QWORD *)(v0 + 352), v39);
    (*(void (**)(uint64_t, uint64_t))(v36 + 8))(v35, v37);
    sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
    v40(v38, v39);
    goto LABEL_5;
  }
  v41 = *(_QWORD *)(v0 + 368);
  v24 = *(_QWORD *)(v0 + 352);
  v42 = *(_QWORD *)(v0 + 360);
  v43 = *(_QWORD *)(v0 + 376);
  v25 = *(_QWORD *)(v0 + 336);
  v26 = *(_QWORD *)(v0 + 344);
  v27 = *(_QWORD *)(v0 + 328);
  v28 = *(_QWORD *)(v0 + 248);
  v29 = *(uint64_t **)(v0 + 256);
  v30 = *(_QWORD *)(v0 + 240);
  (*(void (**)(uint64_t, uint64_t))(v25 + 96))(v26, v27);
  v31 = *(void (**)(uint64_t *, uint64_t, uint64_t))(v28 + 32);
  v31(v29, v26, v30);
  v32 = MEMORY[0x1E0CCD518];
  *(_QWORD *)(v0 + 120) = v30;
  *(_QWORD *)(v0 + 128) = v32;
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1((uint64_t *)(v0 + 96));
  v31(boxed_opaque_existential_1, (uint64_t)v29, v30);
  (*(void (**)(uint64_t, uint64_t))(v25 + 8))(v24, v27);
  (*(void (**)(uint64_t, uint64_t))(v41 + 8))(v43, v42);
  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  sub_1DADFC748(v0 + 96, v0 + 16);
  v34 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 680) = v34;
  *v34 = v0;
  v34[1] = sub_1DADFBD40;
  return sub_1DADFA3CC(v0 + 16, *(_DWORD *)(v0 + 696));
}

uint64_t sub_1DADFBD40()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 688) = v0;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DADFBDA4()
{
  uint64_t v0;

  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFBEFC()
{
  uint64_t v0;

  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFC064()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 576) + 8))(*(_QWORD *)(v0 + 584), *(_QWORD *)(v0 + 568));
  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFC1E4()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 472) + 8))(*(_QWORD *)(v0 + 480), *(_QWORD *)(v0 + 464));
  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFC360()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 368) + 8))(*(_QWORD *)(v0 + 376), *(_QWORD *)(v0 + 360));
  sub_1DADDCC3C(v0 + 16, &qword_1F029E410);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SearchUIMusicUtilities()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchUIMusicUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SearchUIMusicUtilities.playMusicItem(withMediaMetadata:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 80) + *(_QWORD *)(v1 + 80));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DADDA484;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUIMusicUtilities.canPlayAppleMusic()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(v0 + 112) + *(_QWORD *)(v0 + 112));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1DADFC5BC;
  return v4();
}

uint64_t sub_1DADFC5BC(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v4;

  v4 = *v1;
  swift_task_dealloc();
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(a1);
}

uint64_t sub_1DADFC60C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DADFC630()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DADE2638;
  return ((uint64_t (*)(const void *))((char *)&dword_1F029E370 + dword_1F029E370))(v2);
}

uint64_t sub_1DADFC69C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DADFC6C8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DADDA484;
  return ((uint64_t (*)(void *, void *))((char *)&dword_1F029E380 + dword_1F029E380))(v2, v3);
}

uint64_t sub_1DADFC73C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E0CC9C78], a2);
}

uint64_t sub_1DADFC748(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 32))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADFC790@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E0CC99D0], a2);
}

uint64_t sub_1DADFC79C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  return keypath_getTm(a1, MEMORY[0x1E0CC9988], a2);
}

uint64_t keypath_getTm@<X0>(_QWORD *a1@<X0>, uint64_t (*a2)(uint64_t, uint64_t)@<X3>, uint64_t *a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;

  v5 = a1[3];
  v6 = a1[4];
  __swift_project_boxed_opaque_existential_1(a1, v5);
  result = a2(v5, v6);
  *a3 = result;
  a3[1] = v8;
  return result;
}

uint64_t sub_1DADFC7F8(unint64_t *a1, uint64_t *a2)
{
  uint64_t result;
  uint64_t v4;

  result = *a1;
  if (!result)
  {
    v4 = __swift_instantiateConcreteTypeFromMangledNameAbstract(a2);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CC85C0], v4);
    atomic_store(result, a1);
  }
  return result;
}

uint64_t sub_1DADFC838(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E410);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADFC884()
{
  return swift_initClassMetadata2();
}

id sub_1DADFC8D0()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  id v3;
  id v4;
  void *v5;
  id v6;

  v1 = qword_1ED4D4458;
  v2 = *(void **)(v0 + qword_1ED4D4458);
  if (v2)
  {
    v3 = *(id *)(v0 + qword_1ED4D4458);
  }
  else
  {
    v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC40B0]), sel_initWithHostedView_, *(_QWORD *)(v0 + qword_1ED4D4460));
    v5 = *(void **)(v0 + v1);
    *(_QWORD *)(v0 + v1) = v4;
    v3 = v4;

    v2 = 0;
  }
  v6 = v2;
  return v3;
}

id sub_1DADFC950(void *a1)
{
  id v1;
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  sub_1DADFC9B4((uint64_t)v1);
  v3 = v2;

  if (v3)
  {
    v4 = (void *)sub_1DAE0D530();
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

uint64_t sub_1DADFC9B4(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  id v7;
  uint64_t v8;
  uint64_t v10;

  v2 = *MEMORY[0x1E0DEEDD8] & *v1;
  v3 = *(_QWORD *)(v2 + 0x50);
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)&v10 - v5;
  v7 = *(id *)((char *)v1 + qword_1ED4D4460);
  sub_1DAE0CB88();

  v8 = (*(uint64_t (**)(uint64_t))(*(_QWORD *)(v2 + 88) + 16))(v3);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v8;
}

char *sub_1DADFCA78(uint64_t a1, double a2, double a3, double a4, double a5)
{
  char *v5;
  char *v6;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  char *v16;
  objc_class *v17;
  char *v18;
  void *v19;
  char *v20;
  id v21;
  id v22;
  char *v23;
  id v24;
  objc_super v26;

  v6 = v5;
  v11 = (_QWORD *)(*MEMORY[0x1E0DEEDD8] & *(_QWORD *)v5);
  v12 = v11[10];
  MEMORY[0x1E0C80A78](a1);
  v13 = qword_1ED4D4460;
  v14 = v11[12];
  sub_1DAE0CBA0();
  v15 = v11[11];
  (*(void (**)(uint64_t, uint64_t))(v15 + 24))(v12, v15);
  v16 = v6;
  *(_QWORD *)&v6[v13] = sub_1DAE0CB7C();
  *(_QWORD *)&v16[qword_1ED4D4458] = 0;

  v17 = (objc_class *)type metadata accessor for SupplementaryHostingView(0, v12, v15, v14);
  v26.receiver = v16;
  v26.super_class = v17;
  v18 = (char *)objc_msgSendSuper2(&v26, sel_initWithFrame_, a2, a3, a4, a5);
  v19 = *(void **)&v18[qword_1ED4D4460];
  v20 = v18;
  v21 = v19;
  sub_1DAE0CB70();

  v22 = sub_1DADFC8D0();
  objc_msgSend(v22, sel_setInvalidatingIntrinsicContentSizeAlsoInvalidatesSuperview_, 1);

  v23 = v20;
  v24 = sub_1DADFC8D0();
  objc_msgSend(v23, sel_addSubview_, v24);

  return v23;
}

char *sub_1DADFCC30(uint64_t a1, double a2, double a3, double a4, double a5)
{
  return sub_1DADFCA78(a1, a2, a3, a4, a5);
}

void sub_1DADFCC50(uint64_t a1, uint64_t a2, void *a3)
{
  sub_1DADFCE28((uint64_t)a3);
}

uint64_t sub_1DADFCC74()
{
  return 1;
}

double sub_1DADFCC7C(void *a1, double a2, double a3)
{
  id v5;
  double v6;

  v5 = a1;
  v6 = sub_1DADFCF24(a2, a3);

  return v6;
}

void sub_1DADFCCCC()
{
  _QWORD *v0;
  objc_class *v1;
  id v2;
  objc_super v3;

  v1 = (objc_class *)type metadata accessor for SupplementaryHostingView(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60));
  v3.receiver = v0;
  v3.super_class = v1;
  objc_msgSendSuper2(&v3, sel_layoutSubviews);
  v2 = sub_1DADFC8D0();
  objc_msgSend(v0, sel_bounds);
  objc_msgSend(v2, sel_setFrame_);

}

void sub_1DADFCD50(void *a1)
{
  id v1;

  v1 = a1;
  sub_1DADFCCCC();

}

id sub_1DADFCD84()
{
  _QWORD *v0;
  objc_class *v1;
  objc_super v3;

  v1 = (objc_class *)type metadata accessor for SupplementaryHostingView(0, *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x50), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x58), *(_QWORD *)((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60));
  v3.receiver = v0;
  v3.super_class = v1;
  return objc_msgSendSuper2(&v3, sel_dealloc);
}

void sub_1DADFCDD4(uint64_t a1)
{

}

uint64_t type metadata accessor for SupplementaryHostingView(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  return __swift_instantiateGenericMetadata(a1, a2, a3, a4, (uint64_t)&nominal type descriptor for SupplementaryHostingView);
}

uint64_t sub_1DADFCE18()
{
  uint64_t v0;

  return *(_QWORD *)(v0 + qword_1ED4D4460);
}

void sub_1DADFCE28(uint64_t a1)
{
  char *v1;
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v2 = v1;
  v3 = *MEMORY[0x1E0DEEDD8] & *(_QWORD *)v1;
  v4 = *(_QWORD *)(v3 + 0x50);
  MEMORY[0x1E0C80A78](a1);
  v5 = qword_1ED4D4460;
  sub_1DAE0CBA0();
  (*(void (**)(uint64_t))(*(_QWORD *)(v3 + 88) + 24))(v4);
  *(_QWORD *)&v2[v5] = sub_1DAE0CB7C();
  *(_QWORD *)&v2[qword_1ED4D4458] = 0;

  sub_1DAE0D830();
  __break(1u);
}

double sub_1DADFCF24(double a1, double a2)
{
  id v4;
  double v5;
  double v6;

  v4 = sub_1DADFC8D0();
  objc_msgSend(v4, sel__layoutSizeThatFits_fixedAxes_, 1, a1, a2);
  v6 = v5;

  return v6;
}

uint64_t initializeBufferWithCopyOfBuffer for Separator(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1DADFCFC4(*(_QWORD *)a2, v4);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  return a1;
}

uint64_t sub_1DADFCFC4(uint64_t a1, char a2)
{
  uint64_t result;

  if ((a2 & 1) == 0)
    return sub_1DAE0C564();
  return result;
}

uint64_t destroy for Separator(uint64_t a1)
{
  return sub_1DADEC1D4(*(_QWORD *)a1, *(_BYTE *)(a1 + 8));
}

uint64_t assignWithCopy for Separator(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *(_QWORD *)a2;
  v4 = *(_BYTE *)(a2 + 8);
  sub_1DADFCFC4(*(_QWORD *)a2, v4);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1DADEC1D4(v5, v6);
  return a1;
}

uint64_t assignWithTake for Separator(uint64_t a1, uint64_t *a2)
{
  uint64_t v3;
  char v4;
  uint64_t v5;
  char v6;

  v3 = *a2;
  v4 = *((_BYTE *)a2 + 8);
  v5 = *(_QWORD *)a1;
  v6 = *(_BYTE *)(a1 + 8);
  *(_QWORD *)a1 = v3;
  *(_BYTE *)(a1 + 8) = v4;
  sub_1DADEC1D4(v5, v6);
  return a1;
}

uint64_t getEnumTagSinglePayload for Separator(uint64_t a1, unsigned int a2)
{
  unsigned int v3;
  int v4;

  if (!a2)
    return 0;
  if (a2 >= 0xFF && *(_BYTE *)(a1 + 9))
    return (*(_DWORD *)a1 + 255);
  v3 = *(unsigned __int8 *)(a1 + 8);
  if (v3 <= 1)
    v4 = -1;
  else
    v4 = v3 ^ 0xFF;
  return (v4 + 1);
}

uint64_t storeEnumTagSinglePayload for Separator(uint64_t result, unsigned int a2, unsigned int a3)
{
  if (a2 > 0xFE)
  {
    *(_BYTE *)(result + 8) = 0;
    *(_QWORD *)result = a2 - 255;
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 1;
  }
  else
  {
    if (a3 >= 0xFF)
      *(_BYTE *)(result + 9) = 0;
    if (a2)
      *(_BYTE *)(result + 8) = -(char)a2;
  }
  return result;
}

ValueMetadata *type metadata accessor for Separator()
{
  return &type metadata for Separator;
}

uint64_t sub_1DADFD108()
{
  return swift_getOpaqueTypeConformance2();
}

uint64_t sub_1DADFD118@<X0>(uint64_t a1@<X0>, char a2@<W1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t *v12;
  char *v13;
  _OWORD *v14;
  __int128 v15;
  _OWORD v17[3];

  v6 = type metadata accessor for SearchUIAppearance();
  MEMORY[0x1E0C80A78](v6);
  v8 = (uint64_t *)((char *)v17 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B620);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)v17 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  *v8 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B348);
  swift_storeEnumTagMultiPayload();
  v12 = (uint64_t *)((char *)v8 + *(int *)(v6 + 20));
  *v12 = swift_getKeyPath();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B358);
  swift_storeEnumTagMultiPayload();
  v13 = (char *)v8 + *(int *)(v6 + 24);
  *(_QWORD *)v13 = 0;
  v13[8] = 2;
  sub_1DADFD344((uint64_t)v8, (uint64_t)v11);
  sub_1DADEB260((uint64_t)v8);
  a2 &= 1u;
  sub_1DADFCFC4(a1, a2);
  sub_1DADEAF1C(a1, a2);
  sub_1DADEC1D4(a1, a2);
  sub_1DAE0D104();
  sub_1DAE0CB1C();
  sub_1DADFD388((uint64_t)v11, a3);
  v14 = (_OWORD *)(a3 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F029B650) + 36));
  v15 = v17[1];
  *v14 = v17[0];
  v14[1] = v15;
  v14[2] = v17[2];
  return sub_1DADFD3D0((uint64_t)v11);
}

uint64_t sub_1DADFD2F0@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DADFD118(*(_QWORD *)v1, *(_BYTE *)(v1 + 8), a1);
}

uint64_t sub_1DADFD2FC@<X0>(uint64_t a1@<X8>)
{
  uint64_t result;

  result = swift_getKeyPath();
  *(_QWORD *)a1 = result;
  *(_BYTE *)(a1 + 8) = 0;
  return result;
}

uint64_t sub_1DADFD344(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = type metadata accessor for SearchUIAppearance();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADFD388(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B620);
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DADFD3D0(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B620);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

unint64_t sub_1DADFD414()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B648;
  if (!qword_1F029B648)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B650);
    v2[0] = sub_1DADFD480();
    v2[1] = MEMORY[0x1E0CD8D70];
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B648);
  }
  return result;
}

unint64_t sub_1DADFD480()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029B618;
  if (!qword_1F029B618)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B620);
    v2[0] = sub_1DADFD4EC();
    v2[1] = sub_1DADEC18C();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029B618);
  }
  return result;
}

unint64_t sub_1DADFD4EC()
{
  unint64_t result;

  result = qword_1F029B410;
  if (!qword_1F029B410)
  {
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CE0558], MEMORY[0x1E0CE0580]);
    atomic_store(result, (unint64_t *)&qword_1F029B410);
  }
  return result;
}

uint64_t sub_1DADFD534()
{
  uint64_t v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  v3 = (uint64_t (__cdecl *)())((char *)&dword_1F029E470 + dword_1F029E470);
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  *v1 = v0;
  v1[1] = sub_1DADFF680;
  return v3();
}

uint64_t sub_1DADFD6A0(const void *a1)
{
  uint64_t v1;
  _QWORD *v2;
  uint64_t (__cdecl *v4)();

  *(_QWORD *)(v1 + 16) = _Block_copy(a1);
  v4 = (uint64_t (__cdecl *)())((char *)&dword_1F029E470 + dword_1F029E470);
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 24) = v2;
  *v2 = v1;
  v2[1] = sub_1DADFD700;
  return v4();
}

uint64_t sub_1DADFD700(char a1)
{
  void *v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;
  void *v6;

  v4 = *v2;
  swift_task_dealloc();
  v5 = *(_QWORD *)(v4 + 16);
  if (v1)
  {
    v6 = (void *)sub_1DAE0C72C();

    (*(void (**)(uint64_t, _QWORD, void *))(v5 + 16))(v5, 0, v6);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v5 + 16))(*(_QWORD *)(v4 + 16), a1 & 1, 0);
  }
  _Block_release(*(const void **)(v4 + 16));
  return (*(uint64_t (**)(void))(v4 + 8))();
}

uint64_t sub_1DADFD7A4(uint64_t a1)
{
  uint64_t v1;
  _QWORD *v3;
  uint64_t (*v5)(uint64_t);

  v5 = (uint64_t (*)(uint64_t))((char *)&dword_1F029E480 + dword_1F029E480);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DADFD804;
  return v5(a1);
}

uint64_t sub_1DADFD804(char a1)
{
  uint64_t v1;
  uint64_t *v2;
  uint64_t v4;
  uint64_t v5;

  v4 = *v2;
  swift_task_dealloc();
  if (v1)
    v5 = 0;
  else
    v5 = a1 & 1;
  return (*(uint64_t (**)(uint64_t))(v4 + 8))(v5);
}

uint64_t sub_1DADFD98C(void *a1, void *aBlock)
{
  _QWORD *v2;
  id v4;
  _QWORD *v5;
  uint64_t (*v7)(id);

  v2[2] = a1;
  v2[3] = _Block_copy(aBlock);
  v7 = (uint64_t (*)(id))((char *)&dword_1F029E480 + dword_1F029E480);
  v4 = a1;
  v5 = (_QWORD *)swift_task_alloc();
  v2[4] = v5;
  *v5 = v2;
  v5[1] = sub_1DADFDA0C;
  return v7(v4);
}

uint64_t sub_1DADFDA0C(char a1)
{
  void *v1;
  uint64_t *v2;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v4 = *(void **)(*v2 + 16);
  v5 = *v2;
  swift_task_dealloc();

  v6 = *(_QWORD *)(v5 + 24);
  if (v1)
  {
    v7 = (void *)sub_1DAE0C72C();

    (*(void (**)(uint64_t, _QWORD, void *))(v6 + 16))(v6, 0, v7);
  }
  else
  {
    (*(void (**)(_QWORD, _QWORD, _QWORD))(v6 + 16))(*(_QWORD *)(v5 + 24), a1 & 1, 0);
  }
  _Block_release(*(const void **)(v5 + 24));
  return (*(uint64_t (**)(void))(v5 + 8))();
}

uint64_t sub_1DADFDAB8(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  _QWORD *v5;
  uint64_t (*v7)(uint64_t, uint64_t);

  v7 = (uint64_t (*)(uint64_t, uint64_t))((char *)&dword_1F029E490 + dword_1F029E490);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADDA484;
  return v7(a1, a2);
}

uint64_t sub_1DADFDC58(void *a1, char a2, void *aBlock)
{
  _QWORD *v3;
  id v6;
  _QWORD *v7;
  uint64_t (*v9)(uint64_t, char);

  v3[2] = a1;
  v3[3] = _Block_copy(aBlock);
  v9 = (uint64_t (*)(uint64_t, char))((char *)&dword_1F029E490 + dword_1F029E490);
  v6 = a1;
  v7 = (_QWORD *)swift_task_alloc();
  v3[4] = v7;
  *v7 = v3;
  v7[1] = sub_1DADE287C;
  return v9((uint64_t)v6, a2);
}

id SearchUITVUtilities.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUITVUtilities.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITVUtilities();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUITVUtilities.__deallocating_deinit()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUITVUtilities();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DADFDDA0(uint64_t a1, uint64_t a2, int *a3)
{
  uint64_t v3;
  _QWORD *v4;
  uint64_t (*v6)(void);

  v6 = (uint64_t (*)(void))((char *)a3 + *a3);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v4;
  *v4 = v3;
  v4[1] = sub_1DADE2638;
  return v6();
}

uint64_t sub_1DADFDDF4(uint64_t a1, uint64_t a2, uint64_t a3, int *a4)
{
  uint64_t v4;
  _QWORD *v5;
  uint64_t (*v7)(void);

  v7 = (uint64_t (*)(void))((char *)a4 + *a4);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v4 + 16) = v5;
  *v5 = v4;
  v5[1] = sub_1DADE2638;
  return v7();
}

uint64_t sub_1DADFDE48(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0D650();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DAE0D644();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DADFF42C(a1);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DAE0D608();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DADFDF8C(uint64_t a1, int *a2)
{
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))((char *)a2 + *a2);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DADFDFF0;
  return v6(a1);
}

uint64_t sub_1DADFDFF0()
{
  uint64_t *v0;
  uint64_t v2;

  v2 = *v0;
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v2 + 8))();
}

uint64_t sub_1DADFE03C()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  v1 = sub_1DAE0C8C4();
  v0[6] = v1;
  v0[7] = *(_QWORD *)(v1 - 8);
  v0[8] = swift_task_alloc();
  v0[9] = swift_task_alloc();
  v2 = sub_1DAE0C96C();
  v0[10] = v2;
  v0[11] = *(_QWORD *)(v2 - 8);
  v0[12] = swift_task_alloc();
  v3 = sub_1DAE0C8B8();
  v0[13] = v3;
  v0[14] = *(_QWORD *)(v3 - 8);
  v0[15] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADFE0F8()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1DAE0C90C();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 128) = v1;
  *v1 = v0;
  v1[1] = sub_1DADFE154;
  return sub_1DAE0C8D0();
}

uint64_t sub_1DADFE154()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 88);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 96);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 80);
  *(_QWORD *)(*(_QWORD *)v1 + 136) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_1DADFE1D8()
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
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t);
  char v13;

  v1 = *(_QWORD *)(v0 + 64);
  v2 = *(_QWORD *)(v0 + 48);
  v3 = *(_QWORD *)(v0 + 56);
  sub_1DAE0C8AC();
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v3 + 104))(v1, *MEMORY[0x1E0DB1680], v2);
  sub_1DADE25F8(&qword_1F029E570, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB1698], MEMORY[0x1E0DB16A0]);
  sub_1DAE0D5A8();
  sub_1DAE0D5A8();
  if (*(_QWORD *)(v0 + 16) == *(_QWORD *)(v0 + 32) && *(_QWORD *)(v0 + 24) == *(_QWORD *)(v0 + 40))
    v13 = 1;
  else
    v13 = sub_1DAE0D8A8();
  v4 = *(_QWORD *)(v0 + 112);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 104);
  v8 = *(_QWORD *)(v0 + 64);
  v7 = *(_QWORD *)(v0 + 72);
  v10 = *(_QWORD *)(v0 + 48);
  v9 = *(_QWORD *)(v0 + 56);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v11 = *(void (**)(uint64_t, uint64_t))(v9 + 8);
  v11(v8, v10);
  v11(v7, v10);
  (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v13 & 1);
}

uint64_t sub_1DADFE358()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1DADFE3B8(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v1[7] = a1;
  v2 = sub_1DAE0C924();
  v1[8] = v2;
  v1[9] = *(_QWORD *)(v2 - 8);
  v1[10] = swift_task_alloc();
  v1[11] = swift_task_alloc();
  v3 = sub_1DAE0C93C();
  v1[12] = v3;
  v1[13] = *(_QWORD *)(v3 - 8);
  v1[14] = swift_task_alloc();
  v1[15] = swift_task_alloc();
  v1[16] = swift_task_alloc();
  v4 = sub_1DAE0C8F4();
  v1[17] = v4;
  v1[18] = *(_QWORD *)(v4 - 8);
  v1[19] = swift_task_alloc();
  v5 = sub_1DAE0C96C();
  v1[20] = v5;
  v1[21] = *(_QWORD *)(v5 - 8);
  v1[22] = swift_task_alloc();
  v6 = sub_1DAE0C960();
  v1[23] = v6;
  v1[24] = *(_QWORD *)(v6 - 8);
  v1[25] = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADFE4E4()
{
  uint64_t v0;
  _QWORD *v1;

  sub_1DAE0C90C();
  *(_QWORD *)(v0 + 48) = MEMORY[0x1E0DEE9D8];
  sub_1DADE25F8(&qword_1F029E550, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB1700], MEMORY[0x1E0DB1710]);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E558);
  sub_1DADFF630();
  sub_1DAE0D734();
  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 208) = v1;
  *v1 = v0;
  v1[1] = sub_1DADFE5C0;
  return sub_1DAE0C8E8();
}

uint64_t sub_1DADFE5C0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v3 = *(_QWORD *)(*(_QWORD *)v1 + 168);
  v2 = *(_QWORD *)(*(_QWORD *)v1 + 176);
  v5 = *(_QWORD *)(*(_QWORD *)v1 + 152);
  v4 = *(_QWORD *)(*(_QWORD *)v1 + 160);
  v6 = *(_QWORD *)(*(_QWORD *)v1 + 136);
  v7 = *(_QWORD *)(*(_QWORD *)v1 + 144);
  *(_QWORD *)(*(_QWORD *)v1 + 216) = v0;
  swift_task_dealloc();
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  (*(void (**)(uint64_t, uint64_t))(v3 + 8))(v2, v4);
  return swift_task_switch();
}

uint64_t sub_1DADFE668()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t result;
  uint64_t v3;
  int64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t, uint64_t);
  unint64_t i;
  int64_t v18;
  unint64_t v19;
  int64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void (*v26)(uint64_t, unint64_t, uint64_t);
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t v37;
  char v39;
  unint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  unsigned int v51;
  uint64_t v52;
  uint64_t v53;
  int64_t v54;
  int v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  unsigned int v59;
  int64_t v60;

  v1 = *(_QWORD *)(v0 + 104);
  v56 = *(_QWORD *)(v0 + 72);
  result = sub_1DAE0C954();
  v3 = result;
  v4 = 0;
  v53 = result + 56;
  v5 = -1;
  v6 = -1 << *(_BYTE *)(result + 32);
  if (-v6 < 64)
    v5 = ~(-1 << -(char)v6);
  v7 = v5 & *(_QWORD *)(result + 56);
  v54 = (unint64_t)(63 - v6) >> 6;
  v51 = *MEMORY[0x1E0DB1738];
  v52 = result;
  v57 = v1;
  if (v7)
    goto LABEL_8;
LABEL_9:
  while (2)
  {
    v18 = v4 + 1;
    if (__OFADD__(v4, 1))
    {
      __break(1u);
      goto LABEL_41;
    }
    if (v18 >= v54)
    {
LABEL_37:
      v59 = 0;
      goto LABEL_39;
    }
    v19 = *(_QWORD *)(v53 + 8 * v18);
    v20 = v4 + 1;
    if (!v19)
    {
      v20 = v4 + 2;
      if (v4 + 2 >= v54)
        goto LABEL_37;
      v19 = *(_QWORD *)(v53 + 8 * v20);
      if (!v19)
      {
        v20 = v4 + 3;
        if (v4 + 3 >= v54)
          goto LABEL_37;
        v19 = *(_QWORD *)(v53 + 8 * v20);
        if (!v19)
        {
          v21 = v4 + 4;
          if (v4 + 4 < v54)
          {
            v19 = *(_QWORD *)(v53 + 8 * v21);
            if (v19)
            {
              v20 = v4 + 4;
              goto LABEL_22;
            }
            while (1)
            {
              v20 = v21 + 1;
              if (__OFADD__(v21, 1))
                break;
              if (v20 >= v54)
                goto LABEL_37;
              v19 = *(_QWORD *)(v53 + 8 * v20);
              ++v21;
              if (v19)
                goto LABEL_22;
            }
LABEL_41:
            __break(1u);
            return result;
          }
          goto LABEL_37;
        }
      }
    }
LABEL_22:
    v58 = (v19 - 1) & v19;
    v60 = v20;
    for (i = __clz(__rbit64(v19)) + (v20 << 6); ; i = __clz(__rbit64(v7)) | (v4 << 6))
    {
      v23 = *(_QWORD *)(v0 + 120);
      v22 = *(_QWORD *)(v0 + 128);
      v24 = *(_QWORD *)(v0 + 96);
      v25 = *(void **)(v0 + 56);
      v26 = *(void (**)(uint64_t, unint64_t, uint64_t))(v1 + 16);
      v26(v22, *(_QWORD *)(v3 + 48) + *(_QWORD *)(v1 + 72) * i, v24);
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v1 + 32))(v23, v22, v24);
      v27 = sub_1DAE0C918();
      v29 = v28;
      v30 = objc_msgSend(v25, sel_identifier);
      if (!v30)
      {
        v41 = *(_QWORD *)(v0 + 112);
        v40 = *(_QWORD *)(v0 + 120);
        v42 = *(_QWORD *)(v0 + 96);
        swift_bridgeObjectRelease();
        v26(v41, v40, v42);
        goto LABEL_31;
      }
      v31 = v30;
      v32 = sub_1DAE0D53C();
      v34 = v33;

      v36 = *(_QWORD *)(v0 + 112);
      v35 = *(_QWORD *)(v0 + 120);
      v37 = *(_QWORD *)(v0 + 96);
      if (v27 == v32 && v29 == v34)
        break;
      v39 = sub_1DAE0D8A8();
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      v26(v36, v35, v37);
      if ((v39 & 1) != 0)
        goto LABEL_34;
LABEL_31:
      v43 = *(_QWORD *)(v0 + 120);
      v44 = *(_QWORD *)(v0 + 96);
      v1 = v57;
      v45 = *(uint64_t (**)(uint64_t, uint64_t))(v57 + 8);
      v45(*(_QWORD *)(v0 + 112), v44);
      result = v45(v43, v44);
      v7 = v58;
      v4 = v60;
      if (!v58)
        goto LABEL_9;
LABEL_8:
      v58 = (v7 - 1) & v7;
      v60 = v4;
    }
    swift_bridgeObjectRelease_n();
    v26(v36, v35, v37);
LABEL_34:
    v46 = *(_QWORD *)(v0 + 80);
    v47 = *(_QWORD *)(v0 + 64);
    sub_1DAE0C930();
    (*(void (**)(uint64_t, _QWORD, uint64_t))(v56 + 104))(v46, v51, v47);
    sub_1DADE25F8(&qword_1F029E568, (uint64_t (*)(uint64_t))MEMORY[0x1E0DB1748], MEMORY[0x1E0DB1750]);
    sub_1DAE0D5A8();
    sub_1DAE0D5A8();
    if (*(_QWORD *)(v0 + 16) == *(_QWORD *)(v0 + 32) && *(_QWORD *)(v0 + 24) == *(_QWORD *)(v0 + 40))
      v55 = 1;
    else
      v55 = sub_1DAE0D8A8();
    v9 = *(_QWORD *)(v0 + 112);
    v8 = *(_QWORD *)(v0 + 120);
    v11 = *(_QWORD *)(v0 + 88);
    v10 = *(_QWORD *)(v0 + 96);
    v12 = *(_QWORD *)(v0 + 80);
    v14 = *(void **)(v0 + 56);
    v13 = *(_QWORD *)(v0 + 64);
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v15 = *(void (**)(uint64_t, uint64_t))(v56 + 8);
    v15(v12, v13);
    v15(v11, v13);
    LODWORD(v14) = objc_msgSend(v14, sel_type) != 1;
    v1 = v57;
    v16 = *(void (**)(uint64_t, uint64_t))(v57 + 8);
    v16(v9, v10);
    result = ((uint64_t (*)(uint64_t, uint64_t))v16)(v8, v10);
    v3 = v52;
    v7 = v58;
    v4 = v60;
    if (((v55 ^ v14) & 1) == 0)
    {
      if (!v58)
        continue;
      goto LABEL_8;
    }
    break;
  }
  v59 = 1;
LABEL_39:
  v49 = *(_QWORD *)(v0 + 192);
  v48 = *(_QWORD *)(v0 + 200);
  v50 = *(_QWORD *)(v0 + 184);
  swift_release();
  (*(void (**)(uint64_t, uint64_t))(v49 + 8))(v48, v50);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(v59);
}

uint64_t sub_1DADFEB20()
{
  uint64_t v0;

  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(_QWORD))(v0 + 8))(0);
}

uint64_t sub_1DADFEBBC(uint64_t a1, char a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  *(_BYTE *)(v2 + 160) = a2;
  *(_QWORD *)(v2 + 16) = a1;
  v3 = sub_1DAE0C96C();
  *(_QWORD *)(v2 + 24) = v3;
  *(_QWORD *)(v2 + 32) = *(_QWORD *)(v3 - 8);
  *(_QWORD *)(v2 + 40) = swift_task_alloc();
  *(_QWORD *)(v2 + 48) = swift_task_alloc();
  v4 = sub_1DAE0C960();
  *(_QWORD *)(v2 + 56) = v4;
  *(_QWORD *)(v2 + 64) = *(_QWORD *)(v4 - 8);
  *(_QWORD *)(v2 + 72) = swift_task_alloc();
  *(_QWORD *)(v2 + 80) = swift_task_alloc();
  v5 = sub_1DAE0C948();
  *(_QWORD *)(v2 + 88) = v5;
  *(_QWORD *)(v2 + 96) = *(_QWORD *)(v5 - 8);
  *(_QWORD *)(v2 + 104) = swift_task_alloc();
  return swift_task_switch();
}

uint64_t sub_1DADFEC90()
{
  uint64_t v0;
  id v1;
  uint64_t *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  unsigned int *v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  uint64_t v17;
  _QWORD *v18;
  _QWORD *v20;

  v1 = objc_msgSend(*(id *)(v0 + 16), sel_identifier);
  v2 = *(uint64_t **)(v0 + 104);
  if (v1)
  {
    v3 = v1;
    v4 = *(_QWORD *)(v0 + 88);
    v5 = *(_QWORD *)(v0 + 96);
    v6 = *(unsigned __int8 *)(v0 + 160);
    v7 = *(void **)(v0 + 16);
    v8 = sub_1DAE0D53C();
    v10 = v9;

    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B500);
    v11 = swift_allocObject();
    *(_OWORD *)(v11 + 16) = xmmword_1DAE1E030;
    *(_QWORD *)(v11 + 32) = v8;
    *(_QWORD *)(v11 + 40) = v10;
    v12 = objc_msgSend(v7, sel_type);
    *v2 = v11;
    v13 = (unsigned int *)MEMORY[0x1E0DB1768];
    if (v12 != 1)
      v13 = (unsigned int *)MEMORY[0x1E0DB1770];
    (*(void (**)(uint64_t *, _QWORD, uint64_t))(v5 + 104))(v2, *v13, v4);
    v14 = *(_QWORD *)(v0 + 104);
    v15 = *(_QWORD *)(v0 + 88);
    sub_1DAE0C90C();
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E548);
    v16 = (*(unsigned __int8 *)(v5 + 80) + 32) & ~(unint64_t)*(unsigned __int8 *)(v5 + 80);
    v17 = swift_allocObject();
    if (v6 == 1)
    {
      *(_QWORD *)(v0 + 112) = v17;
      *(_OWORD *)(v17 + 16) = xmmword_1DAE1E030;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v17 + v16, v14, v15);
      v18 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 120) = v18;
      *v18 = v0;
      v18[1] = sub_1DADFEF1C;
      return sub_1DAE0C8DC();
    }
    else
    {
      *(_QWORD *)(v0 + 136) = v17;
      *(_OWORD *)(v17 + 16) = xmmword_1DAE1E030;
      (*(void (**)(unint64_t, uint64_t, uint64_t))(v5 + 16))(v17 + v16, v14, v15);
      v20 = (_QWORD *)swift_task_alloc();
      *(_QWORD *)(v0 + 144) = v20;
      *v20 = v0;
      v20[1] = sub_1DADFF060;
      return sub_1DAE0C900();
    }
  }
  else
  {
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    swift_task_dealloc();
    return (*(uint64_t (**)(void))(v0 + 8))();
  }
}

uint64_t sub_1DADFEF1C()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 128) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[4] + 8))(v2[6], v2[3]);
    swift_bridgeObjectRelease();
  }
  else
  {
    v3 = v2[10];
    v4 = v2[7];
    v5 = v2[8];
    v6 = v2[6];
    v9 = v2 + 3;
    v7 = v2[3];
    v8 = v9[1];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v8 + 8))(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v5 + 8))(v3, v4);
  }
  return swift_task_switch();
}

uint64_t sub_1DADFEFEC()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFF060()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = *(_QWORD **)v1;
  *(_QWORD *)(*(_QWORD *)v1 + 152) = v0;
  swift_task_dealloc();
  if (v0)
  {
    (*(void (**)(_QWORD, _QWORD))(v2[4] + 8))(v2[5], v2[3]);
    swift_bridgeObjectRelease();
  }
  else
  {
    v4 = v2[8];
    v3 = v2[9];
    v5 = v2[7];
    v7 = v2[4];
    v6 = v2[5];
    v8 = v2[3];
    swift_bridgeObjectRelease();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v6, v8);
    (*(void (**)(uint64_t, uint64_t))(v4 + 8))(v3, v5);
  }
  return swift_task_switch();
}

uint64_t sub_1DADFF130()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DADFF1B0()
{
  uint64_t v0;

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(v0 + 96) + 8))(*(_QWORD *)(v0 + 104), *(_QWORD *)(v0 + 88));
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t type metadata accessor for SearchUITVUtilities()
{
  return objc_opt_self();
}

uint64_t method lookup function for SearchUITVUtilities()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of static SearchUITVUtilities.fetchSportsFavoritesEnabledStatus()()
{
  uint64_t v0;
  uint64_t v1;
  _QWORD *v2;
  uint64_t (*v4)(void);

  v4 = (uint64_t (*)(void))(**(int **)(v0 + 80) + *(_QWORD *)(v0 + 80));
  v2 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v2;
  *v2 = v1;
  v2[1] = sub_1DADFF684;
  return v4();
}

uint64_t dispatch thunk of static SearchUITVUtilities.fetchSportsItemIsFavorited(sportsItem:)(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _QWORD *v4;
  uint64_t (*v6)(uint64_t);

  v6 = (uint64_t (*)(uint64_t))(**(int **)(v1 + 88) + *(_QWORD *)(v1 + 88));
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v4;
  *v4 = v2;
  v4[1] = sub_1DADFC5BC;
  return v6(a1);
}

uint64_t dispatch thunk of static SearchUITVUtilities.updateSportsItemFavoriteStatus(sportsItem:shouldBeFavorite:)(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  _QWORD *v6;
  uint64_t (*v8)(uint64_t, uint64_t);

  v8 = (uint64_t (*)(uint64_t, uint64_t))(**(int **)(v2 + 96) + *(_QWORD *)(v2 + 96));
  v6 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 16) = v6;
  *v6 = v3;
  v6[1] = sub_1DADDA484;
  return v8(a1, a2);
}

uint64_t sub_1DADFF37C()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 32));
  return swift_deallocObject();
}

uint64_t sub_1DADFF3A8()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  char v3;
  void *v4;
  _QWORD *v5;

  v2 = *(void **)(v0 + 16);
  v3 = *(_BYTE *)(v0 + 24);
  v4 = *(void **)(v0 + 32);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v5;
  *v5 = v1;
  v5[1] = sub_1DADE2638;
  return ((uint64_t (*)(void *, char, void *))((char *)&dword_1F029E4D8 + dword_1F029E4D8))(v2, v3, v4);
}

uint64_t sub_1DADFF42C(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DADFF46C()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DADFF490(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADE2638;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F029E4F8 + dword_1F029E4F8))(a1, v4);
}

uint64_t sub_1DADFF500()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 24));
  return swift_deallocObject();
}

uint64_t sub_1DADFF52C()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  _QWORD *v4;

  v2 = *(void **)(v0 + 16);
  v3 = *(void **)(v0 + 24);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DADDA484;
  return ((uint64_t (*)(void *, void *))((char *)&dword_1F029E508 + dword_1F029E508))(v2, v3);
}

uint64_t sub_1DADFF5A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DADFF5C4()
{
  uint64_t v0;
  uint64_t v1;
  const void *v2;
  _QWORD *v3;

  v2 = *(const void **)(v0 + 16);
  v3 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v3;
  *v3 = v1;
  v3[1] = sub_1DADE2638;
  return ((uint64_t (*)(const void *))((char *)&dword_1F029E528 + dword_1F029E528))(v2);
}

unint64_t sub_1DADFF630()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029E560;
  if (!qword_1F029E560)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E558);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1F029E560);
  }
  return result;
}

uint64_t sub_1DADFF688@<X0>(uint64_t a1@<X0>, uint64_t a2@<X8>)
{
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD v11[2];

  v4 = *(_QWORD *)(a1 - 8);
  MEMORY[0x1E0C80A78](a1);
  v6 = (char *)v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v7, a1);
  v8 = *(_QWORD *)(a1 + 16);
  v9 = *(_QWORD *)(v8 - 8);
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
    return (*(uint64_t (**)(uint64_t, char *, uint64_t))(v9 + 32))(a2, v6, v8);
  v11[0] = 0;
  v11[1] = 0xE000000000000000;
  sub_1DAE0D89C();
  return (*(uint64_t (**)(char *, uint64_t))(v4 + 8))(v6, a1);
}

uint64_t sub_1DADFF780(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  void (*v5)(char *, uint64_t);
  uint64_t v6;
  uint64_t v7;
  void (*v8)(char *, uint64_t);
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  unint64_t v20;
  void (*v21)(char *, uint64_t);
  uint64_t v22;

  v22 = a1;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5A8);
  v1 = *(_QWORD *)(v19 - 8);
  MEMORY[0x1E0C80A78](v19);
  v3 = (char *)&v15 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5B0);
  MEMORY[0x1E0C80A78](v4);
  sub_1DADDDE80();
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  v20 = sub_1DAE00A04();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v18 = sub_1DAE0C588();
  v5 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6 = v19;
  v5(v3, v19);
  v21 = v5;
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v17 = sub_1DAE0C588();
  v5(v3, v6);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v16 = sub_1DAE0C588();
  v21(v3, v6);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v15 = sub_1DAE0C588();
  v7 = v19;
  v8 = v21;
  v21(v3, v19);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v9 = sub_1DAE0C588();
  v8(v3, v7);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5B8);
  v10 = swift_allocObject();
  *(_OWORD *)(v10 + 16) = xmmword_1DAE1F370;
  v11 = v17;
  *(_QWORD *)(v10 + 32) = v18;
  *(_QWORD *)(v10 + 40) = v11;
  v12 = v15;
  *(_QWORD *)(v10 + 48) = v16;
  *(_QWORD *)(v10 + 56) = v12;
  *(_QWORD *)(v10 + 64) = v9;
  v13 = sub_1DAE0C57C();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1DADFFCE0()
{
  swift_bridgeObjectRetain_n();
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_retain_n();
  sub_1DAE0C540();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DADFFD84(uint64_t a1)
{
  return sub_1DAE00568(a1, (uint64_t)&unk_1DAE1F418, (void (*)(void))sub_1DAE00A04, (void (*)(uint64_t))sub_1DADDDE80);
}

uint64_t sub_1DADFFDA8()
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

  v0 = sub_1DAE0C5A0();
  v1 = sub_1DAE0C5A0();
  v2 = sub_1DAE0C5A0();
  v3 = sub_1DAE0C5A0();
  v4 = sub_1DAE0C5A0();
  v5 = sub_1DAE0C5A0();
  v6 = sub_1DAE0C5A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E588);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1DAE1F380;
  *(_QWORD *)(v7 + 32) = v0;
  *(_QWORD *)(v7 + 40) = v1;
  *(_QWORD *)(v7 + 48) = v2;
  *(_QWORD *)(v7 + 56) = v3;
  *(_QWORD *)(v7 + 64) = v4;
  *(_QWORD *)(v7 + 72) = v5;
  *(_QWORD *)(v7 + 80) = v6;
  v8 = sub_1DAE0C594();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1DADFFED4(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(char *, uint64_t);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  unint64_t v25;

  v22 = a1;
  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E590);
  v23 = *(_QWORD *)(v1 - 8);
  v24 = v1;
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v18 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = sub_1DAE0C570();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v18 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E598);
  MEMORY[0x1E0C80A78](v8);
  sub_1DADED310();
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  v25 = sub_1DADEEA00();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  (*(void (**)(char *, _QWORD, uint64_t))(v5 + 104))(v7, *MEMORY[0x1E0C90F68], v4);
  sub_1DAE0C5DC();
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v21 = sub_1DAE0C588();
  v9 = v24;
  v23 = *(_QWORD *)(v23 + 8);
  ((void (*)(char *, uint64_t))v23)(v3, v24);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v20 = sub_1DAE0C588();
  ((void (*)(char *, uint64_t))v23)(v3, v9);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v19 = sub_1DAE0C588();
  v10 = (void (*)(char *, uint64_t))v23;
  v11 = v24;
  ((void (*)(char *, uint64_t))v23)(v3, v24);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v18 = sub_1DAE0C588();
  v10(v3, v11);
  sub_1DAE0C600();
  sub_1DAE0C5F4();
  swift_getKeyPath();
  sub_1DAE0C564();
  swift_release();
  sub_1DAE0C5E8();
  swift_release();
  sub_1DAE0C5F4();
  sub_1DAE0C60C();
  v12 = sub_1DAE0C588();
  v10(v3, v11);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5A0);
  v13 = swift_allocObject();
  *(_OWORD *)(v13 + 16) = xmmword_1DAE1F370;
  v14 = v20;
  *(_QWORD *)(v13 + 32) = v21;
  *(_QWORD *)(v13 + 40) = v14;
  v15 = v18;
  *(_QWORD *)(v13 + 48) = v19;
  *(_QWORD *)(v13 + 56) = v15;
  *(_QWORD *)(v13 + 64) = v12;
  v16 = sub_1DAE0C57C();
  swift_bridgeObjectRelease();
  return v16;
}

uint64_t sub_1DAE004BC()
{
  swift_bridgeObjectRetain_n();
  swift_retain_n();
  swift_bridgeObjectRetain_n();
  sub_1DAE0C540();
  swift_release();
  swift_bridgeObjectRelease();
  return swift_bridgeObjectRelease();
}

uint64_t sub_1DAE00544(uint64_t a1)
{
  return sub_1DAE00568(a1, (uint64_t)&unk_1DAE1F3F0, (void (*)(void))sub_1DADEEA00, (void (*)(uint64_t))sub_1DADED310);
}

uint64_t sub_1DAE00568(uint64_t a1, uint64_t a2, void (*a3)(void), void (*a4)(uint64_t))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;

  v6 = sub_1DAE0C5D0();
  v7 = *(_QWORD *)(v6 - 8);
  MEMORY[0x1E0C80A78](v6);
  v9 = (char *)&v15 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getKeyPath();
  a3();
  sub_1DAE0C564();
  v10 = swift_release();
  a4(v10);
  sub_1DAE0C5C4();
  v11 = sub_1DAE0C5B8();
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E580);
  v12 = swift_allocObject();
  *(_OWORD *)(v12 + 16) = xmmword_1DAE1E030;
  *(_QWORD *)(v12 + 32) = v11;
  v13 = sub_1DAE0C5AC();
  swift_bridgeObjectRelease();
  return v13;
}

uint64_t sub_1DAE0068C()
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

  v0 = sub_1DAE0C5A0();
  v1 = sub_1DAE0C5A0();
  v2 = sub_1DAE0C5A0();
  v3 = sub_1DAE0C5A0();
  v4 = sub_1DAE0C5A0();
  v5 = sub_1DAE0C5A0();
  v6 = sub_1DAE0C5A0();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E588);
  v7 = swift_allocObject();
  *(_OWORD *)(v7 + 16) = xmmword_1DAE1F380;
  *(_QWORD *)(v7 + 32) = v0;
  *(_QWORD *)(v7 + 40) = v1;
  *(_QWORD *)(v7 + 48) = v2;
  *(_QWORD *)(v7 + 56) = v3;
  *(_QWORD *)(v7 + 64) = v4;
  *(_QWORD *)(v7 + 72) = v5;
  *(_QWORD *)(v7 + 80) = v6;
  v8 = sub_1DAE0C594();
  swift_bridgeObjectRelease();
  return v8;
}

uint64_t sub_1DAE007F4()
{
  return MEMORY[0x1E0DEE9D8];
}

ValueMetadata *type metadata accessor for SearchUIAssistantIntents()
{
  return &type metadata for SearchUIAssistantIntents;
}

uint64_t sub_1DAE00810()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  uint64_t v4;
  uint64_t v5;
  void (*v6)(char *, uint64_t);
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v12;
  uint64_t v13;

  v0 = sub_1DAE0C630();
  v1 = *(_QWORD *)(v0 - 8);
  MEMORY[0x1E0C80A78](v0);
  v3 = (char *)&v12 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = sub_1DADDD9FC();
  v13 = v4;
  sub_1DADDDE80();
  sub_1DAE0C63C();
  v5 = sub_1DAE0C624();
  v6 = *(void (**)(char *, uint64_t))(v1 + 8);
  v6(v3, v0);
  v12 = sub_1DADECE7C();
  v13 = v7;
  sub_1DADED310();
  sub_1DAE0C63C();
  v8 = sub_1DAE0C624();
  v6(v3, v0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E578);
  v9 = swift_allocObject();
  *(_OWORD *)(v9 + 16) = xmmword_1DAE1EA70;
  *(_QWORD *)(v9 + 32) = v5;
  *(_QWORD *)(v9 + 40) = v8;
  v10 = sub_1DAE0C618();
  swift_bridgeObjectRelease();
  return v10;
}

__n128 sub_1DAE00964@<Q0>(__n128 *a1@<X8>)
{
  __n128 result;
  unint64_t v3;
  unint64_t v4;
  __n128 v5;
  unint64_t v6;

  sub_1DAE0C534();
  result = v5;
  a1->n128_u64[0] = v3;
  a1->n128_u64[1] = v4;
  a1[1] = v5;
  a1[2].n128_u64[0] = v6;
  return result;
}

double sub_1DAE009B0@<D0>(uint64_t a1@<X8>)
{
  double result;
  __int128 v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  sub_1DAE0C534();
  result = *(double *)&v3;
  *(_OWORD *)a1 = v3;
  *(_QWORD *)(a1 + 16) = v4;
  *(_OWORD *)(a1 + 24) = v5;
  *(_QWORD *)(a1 + 40) = v6;
  return result;
}

unint64_t sub_1DAE00A04()
{
  unint64_t result;

  result = qword_1ED4D44E8;
  if (!qword_1ED4D44E8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F908, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44E8);
  }
  return result;
}

uint64_t sub_1DAE00A48(void *a1)
{
  id v2;

  sub_1DAE0D368();
  v2 = a1;
  LOBYTE(a1) = sub_1DAE0D350();

  return a1 & 1;
}

uint64_t sub_1DAE00B40@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v6;
  uint64_t v7;
  double *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  double v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v19;

  v6 = sub_1DAE0CBC4();
  MEMORY[0x1E0C80A78](v6);
  v8 = (double *)((char *)&v19 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0));
  v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5C8);
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (*(_BYTE *)(a2 + 8))
    v12 = 0.0;
  else
    v12 = *(double *)a2;
  v13 = (char *)v8 + *(int *)(v6 + 20);
  v14 = *MEMORY[0x1E0CDB0C0];
  v15 = sub_1DAE0CD2C();
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 104))(v13, v14, v15);
  *v8 = v12;
  v8[1] = v12;
  v16 = (uint64_t)&v11[*(int *)(v9 + 36)];
  sub_1DAE01F78((uint64_t)v8, v16);
  *(_WORD *)(v16 + *(int *)(__swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5E0) + 36)) = 256;
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D46A8);
  (*(void (**)(char *, uint64_t, uint64_t))(*(_QWORD *)(v17 - 8) + 16))(v11, a1, v17);
  sub_1DAE01FBC((uint64_t)v8);
  return sub_1DADE9D90((uint64_t)v11, a3, &qword_1F029E5C8);
}

uint64_t sub_1DAE00D5C@<X0>(_QWORD *a1@<X0>, uint64_t *a2@<X8>)
{
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t result;
  uint64_t v7;

  v3 = __swift_project_boxed_opaque_existential_1(a1, a1[3]);
  MEMORY[0x1E0C80A78](v3);
  (*(void (**)(char *))(v5 + 16))((char *)&v7 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0));
  result = sub_1DAE0D080();
  *a2 = result;
  return result;
}

id sub_1DAE00E7C()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIContentConfigurator();
  return objc_msgSendSuper2(&v2, sel_dealloc);
}

uint64_t sub_1DAE00EAC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1DAE00EC8(a1, a2, a3, a4, a5, MEMORY[0x1E0DC2D08]);
}

uint64_t sub_1DAE00EC8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t (*a6)(uint64_t *))
{
  uint64_t v8;
  uint64_t *boxed_opaque_existential_1;
  uint64_t v11[5];

  v11[0] = a2;
  v11[1] = a3;
  v11[2] = a4;
  v8 = sub_1DAE0CDF8();
  v11[3] = v8;
  v11[4] = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CDC120], v8);
  boxed_opaque_existential_1 = __swift_allocate_boxed_opaque_existential_1(v11);
  (*(void (**)(uint64_t *, uint64_t, uint64_t))(*(_QWORD *)(v8 - 8) + 16))(boxed_opaque_existential_1, a1, v8);
  return a6(v11);
}

uint64_t sub_1DAE00F4C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return sub_1DAE00EC8(a1, a2, a3, a4, a5, MEMORY[0x1E0DC2B20]);
}

uint64_t type metadata accessor for SearchUIContentConfigurator()
{
  return objc_opt_self();
}

id sub_1DAE00F88(void *a1, void *a2, uint64_t a3)
{
  _QWORD *v5;
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
  uint64_t v16;
  char *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id result;
  void (**v22)(char *, uint64_t, _QWORD, unint64_t, _QWORD, uint64_t);
  void *v23;
  void *v24;
  void *v25;
  id v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  _QWORD *i;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  unint64_t v37;
  uint64_t v38;
  _QWORD *v39;
  uint64_t v40;
  uint64_t v41;
  unint64_t v42;
  char *v43;
  uint64_t v44;
  uint64_t v45;
  unint64_t v46;
  char *v47;
  char *v48;
  _QWORD *v49;
  void (*v50)(char *, _QWORD *);
  char *v51;
  char *v52;
  char *v53;
  uint64_t v54;
  id v55;
  char *v56;
  uint64_t ObjectType;
  id v58;
  void *v59;
  void (**v60)(char *, uint64_t, _QWORD, unint64_t, _QWORD, uint64_t);
  char *v61;
  char *v62;
  char *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  char *v68;
  uint64_t v69;
  char *v70;
  unint64_t v71;
  char v72;
  __int128 v73[3];
  __int128 v74[3];
  __int128 v75[3];
  char v76[40];
  unint64_t v77;
  char v78[8];
  char v79[56];

  v69 = a3;
  v5 = (_QWORD *)__swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5C0);
  v65 = *(v5 - 1);
  v6 = MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v54 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = MEMORY[0x1E0C80A78](v6);
  v11 = (char *)&v54 - v10;
  v12 = MEMORY[0x1E0C80A78](v9);
  v14 = (char *)&v54 - v13;
  v15 = MEMORY[0x1E0C80A78](v12);
  v17 = (char *)&v54 - v16;
  MEMORY[0x1E0C80A78](v15);
  v68 = (char *)&v54 - v18;
  v19 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D46A8);
  v66 = *(_QWORD *)(v19 - 8);
  v67 = v19;
  MEMORY[0x1E0C80A78](v19);
  v70 = (char *)&v54 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  swift_getObjectType();
  result = (id)swift_conformsToProtocol2();
  if (result)
    v22 = (void (**)(char *, uint64_t, _QWORD, unint64_t, _QWORD, uint64_t))result;
  else
    v22 = 0;
  if (result)
    v23 = a1;
  else
    v23 = 0;
  if (v23)
  {
    v60 = v22;
    v61 = v8;
    v62 = v11;
    v63 = v14;
    v24 = (void *)objc_opt_self();
    ObjectType = swift_getObjectType();
    v58 = a1;
    v59 = v23;
    result = objc_msgSend(v24, sel_bestAppearanceForView_, v23);
    if (result)
    {
      v25 = result;
      objc_msgSend(result, sel_isVibrant);

      v26 = objc_allocWithZone((Class)sub_1DAE0D3C8());
      v27 = (id)sub_1DAE0D3B0();
      v71 = 0;
      v72 = 1;
      sub_1DAE0D3BC();
      swift_unknownObjectRetain();
      sub_1DAE0D3A4();
      type metadata accessor for SearchUIRFCardSectionRowModel();
      v28 = swift_dynamicCastClass();
      v56 = v17;
      v64 = v27;
      if (v28)
      {
        v29 = (void *)v28;
        v30 = a2;
LABEL_11:
        sub_1DAE0C564();
        sub_1DAE0D398();
        sub_1DADE4EC4(v73);
        sub_1DADE9D90((uint64_t)v73, (uint64_t)v79, &qword_1F029DC10);
        v31 = v69;
        i = v5;
        if (v79[0] == 2)
        {

        }
        else
        {
          sub_1DADE4EC4(v74);
          sub_1DADE9D90((uint64_t)v74, (uint64_t)v78, &qword_1F029DC10);
          sub_1DADE4EC4(v75);

          sub_1DADE9D90((uint64_t)v75, (uint64_t)v76, &qword_1F029DC10);
          v42 = 0xBFF0000000000000;
          if (v76[0] != 2)
            v42 = v77;
          v71 = v42;
          v72 = 0;
        }
        goto LABEL_34;
      }
      objc_opt_self();
      v33 = swift_dynamicCastObjCClass();
      if (!v33)
      {
        i = v5;
LABEL_33:
        v31 = v69;
LABEL_34:
        sub_1DAE0D368();
        v43 = v70;
        v44 = MEMORY[0x1DF0A7A8C](v31, v27);
        MEMORY[0x1E0C80A78](v44);
        *(&v54 - 2) = (uint64_t)v43;
        *(&v54 - 1) = (uint64_t)&v71;
        v45 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5C8);
        v46 = sub_1DAE01E6C();
        v47 = v63;
        sub_1DAE0CDEC();
        v48 = v56;
        v49 = i;
        sub_1DAE0CDD4();
        v50 = *(void (**)(char *, _QWORD *))(v65 + 8);
        v50(v47, i);
        sub_1DAE0CEB8();
        v51 = v61;
        sub_1DAE0CDE0();
        sub_1DAE0CED0();
        v52 = v62;
        sub_1DAE0CDE0();
        v50(v51, v49);
        sub_1DAE0CEC4();
        sub_1DAE0CDE0();
        v50(v52, v49);
        sub_1DAE0CEDC();
        v53 = v68;
        sub_1DAE0CDE0();
        v50(v47, v49);
        v50(v48, v49);
        v60[1](v53, v45, MEMORY[0x1E0CE0428], v46, MEMORY[0x1E0CE0400], ObjectType);

        v50(v53, v49);
        return (id)(*(uint64_t (**)(char *, uint64_t))(v66 + 8))(v70, v67);
      }
      v34 = (void *)v33;
      v35 = a2;
      result = objc_msgSend(v34, sel_cardSectionRowModels);
      if (result)
      {
        v36 = result;
        sub_1DADF5F84(0, &qword_1F029E5E8);
        v37 = sub_1DAE0D5CC();

        if (v37 >> 62)
          goto LABEL_31;
        v38 = *(_QWORD *)((v37 & 0xFFFFFFFFFFFFF8) + 0x10);
        for (i = v5; v38; i = v5)
        {
          v55 = (id)v35;
          v27 = (id)(v37 & 0xC000000000000001);
          v35 = 4;
          while (1)
          {
            v39 = v27 ? (_QWORD *)MEMORY[0x1DF0A7ED0](v35 - 4, v37) : *(id *)(v37 + 8 * v35);
            v5 = v39;
            v40 = v35 - 3;
            if (__OFADD__(v35 - 4, 1))
              break;
            v41 = swift_dynamicCastClass();
            if (v41)
            {
              v29 = (void *)v41;

              swift_bridgeObjectRelease();
              v5 = i;
              v27 = v64;
              goto LABEL_11;
            }

            ++v35;
            if (v40 == v38)
            {

              swift_bridgeObjectRelease();
              v31 = v69;
              v27 = v64;
              goto LABEL_34;
            }
          }
          __break(1u);
LABEL_31:
          swift_bridgeObjectRetain();
          v38 = sub_1DAE0D83C();
          swift_bridgeObjectRelease();
        }

        swift_bridgeObjectRelease();
        goto LABEL_33;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
  }
  return result;
}

void sub_1DAE015CC(void *a1, void *a2, uint64_t a3)
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  char *v21;
  uint64_t v22;
  char *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  void (*v30)(char *, uint64_t);
  id v31;
  unint64_t v32;
  id v33;
  uint64_t v34;
  id v35;
  id v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  id v50;
  uint64_t v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  unint64_t v56;
  uint64_t v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  unint64_t v61;
  char *v62;
  uint64_t v63;
  uint64_t v64;
  unint64_t v65;
  char *v66;
  char *v67;
  uint64_t v68;
  void (*v69)(char *, uint64_t);
  unint64_t v70;
  char *v71;
  char *v72;
  id v73;
  _QWORD v74[2];
  uint64_t v75;
  id v76;
  id v77;
  void *v78;
  char *v79;
  uint64_t v80;
  char *v81;
  char *v82;
  char *v83;
  char *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  char *v88;
  uint64_t ObjectType;
  id v90;
  unint64_t v91;
  char v92;
  __int128 v93[3];
  __int128 v94[3];
  __int128 v95[3];
  char v96[40];
  unint64_t v97;
  __int128 v98;
  uint64_t v99;
  unsigned __int8 v100[56];

  ObjectType = a3;
  v87 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5C0);
  v80 = *(_QWORD *)(v87 - 8);
  v5 = MEMORY[0x1E0C80A78](v87);
  v7 = (char *)v74 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = MEMORY[0x1E0C80A78](v5);
  v81 = (char *)v74 - v9;
  v10 = MEMORY[0x1E0C80A78](v8);
  v83 = (char *)v74 - v11;
  v12 = MEMORY[0x1E0C80A78](v10);
  v82 = (char *)v74 - v13;
  MEMORY[0x1E0C80A78](v12);
  v88 = (char *)v74 - v14;
  v15 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D46A8);
  v85 = *(_QWORD *)(v15 - 8);
  v86 = v15;
  MEMORY[0x1E0C80A78](v15);
  v84 = (char *)v74 - ((v16 + 15) & 0xFFFFFFFFFFFFFFF0);
  v17 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D46A0);
  v18 = *(_QWORD *)(v17 - 8);
  v19 = MEMORY[0x1E0C80A78](v17);
  v21 = (char *)v74 - ((v20 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x1E0C80A78](v19);
  v23 = (char *)v74 - v22;
  swift_getObjectType();
  v24 = swift_conformsToProtocol2();
  if (v24)
    v25 = v24;
  else
    v25 = 0;
  if (v24)
    v26 = a1;
  else
    v26 = 0;
  if (v26)
  {
    type metadata accessor for SearchUIArchivedRowModel();
    v90 = a2;
    v27 = swift_dynamicCastClass();
    if (v27)
    {
      v79 = v7;
      v28 = v27 + OBJC_IVAR___SearchUIArchivedRowModel_swiftUIView;
      swift_beginAccess();
      sub_1DADDC45C(v28, (uint64_t)&v98);
      if (v99)
      {
        sub_1DADE25E0(&v98, (uint64_t)v100);
        ObjectType = swift_getObjectType();
        MEMORY[0x1E0C80A78](ObjectType);
        v74[-2] = v100;
        v88 = a1;
        v29 = v90;
        sub_1DAE0CDEC();
        sub_1DAE0CEAC();
        sub_1DAE0CDE0();
        v30 = *(void (**)(char *, uint64_t))(v18 + 8);
        v30(v21, v17);
        (*(void (**)(char *, _QWORD, _QWORD, _QWORD, _QWORD, uint64_t, uint64_t))(v25 + 8))(v23, MEMORY[0x1E0CDFD18], MEMORY[0x1E0CE0428], MEMORY[0x1E0CDFD08], MEMORY[0x1E0CE0400], ObjectType, v25);

        v30(v23, v17);
        __swift_destroy_boxed_opaque_existential_0((uint64_t)v100);
        return;
      }
      v33 = a1;
      sub_1DAE01F30((uint64_t)&v98);
      v32 = (unint64_t)v79;
    }
    else
    {
      v31 = a1;
      v32 = (unint64_t)v7;
    }
    __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4D46B0);
    v34 = swift_allocObject();
    *(_OWORD *)(v34 + 16) = xmmword_1DAE1E130;
    v35 = a1;
    v36 = v90;
    v37 = objc_msgSend(v90, sel_cardSection);
    if (v37)
    {
      *(_QWORD *)(v34 + 32) = v37;
      *(_QWORD *)v100 = v34;
      sub_1DAE0D5D8();
      v38 = *(void **)v100;
      swift_getObjectType();
      v39 = swift_conformsToProtocol2();
      if (v39)
        v40 = v39;
      else
        v40 = 0;
      if (v39)
        v41 = v26;
      else
        v41 = 0;
      if (!v41)
      {
        swift_bridgeObjectRelease();

        return;
      }
      v75 = v40;
      v76 = v35;
      v42 = (void *)objc_opt_self();
      v74[0] = swift_getObjectType();
      v43 = v26;
      v74[1] = v41;
      v44 = objc_msgSend(v42, sel_bestAppearanceForView_, v41);
      if (v44)
      {
        v45 = v44;
        objc_msgSend(v44, sel_isVibrant);

        v46 = objc_allocWithZone((Class)sub_1DAE0D3C8());
        v47 = sub_1DAE0D3B0();
        v91 = 0;
        v92 = 1;
        sub_1DAE0D3BC();
        swift_unknownObjectRetain();
        sub_1DAE0D3A4();
        type metadata accessor for SearchUIRFCardSectionRowModel();
        v48 = swift_dynamicCastClass();
        v77 = (id)v47;
        v78 = v38;
        if (v48)
        {
          v49 = (void *)v48;
          v50 = v36;
LABEL_24:
          sub_1DAE0C564();
          sub_1DAE0D398();
          sub_1DADE4EC4(v93);
          sub_1DADE9D90((uint64_t)v93, (uint64_t)v100, &qword_1F029DC10);
          if (v100[0] == 2)
          {

          }
          else
          {
            sub_1DADE4EC4(v94);
            sub_1DADE9D90((uint64_t)v94, (uint64_t)&v98, &qword_1F029DC10);
            sub_1DADE4EC4(v95);

            sub_1DADE9D90((uint64_t)v95, (uint64_t)v96, &qword_1F029DC10);
            v61 = 0xBFF0000000000000;
            if (v96[0] != 2)
              v61 = v97;
            v91 = v61;
            v92 = 0;
          }
          goto LABEL_46;
        }
        objc_opt_self();
        v51 = swift_dynamicCastObjCClass();
        if (!v51)
        {
LABEL_46:
          sub_1DAE0D368();
          v62 = v84;
          v63 = MEMORY[0x1DF0A7A8C](v38, v47);
          MEMORY[0x1E0C80A78](v63);
          v74[-2] = v62;
          v74[-1] = &v91;
          v64 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E5C8);
          v65 = sub_1DAE01E6C();
          v66 = v83;
          sub_1DAE0CDEC();
          v67 = v82;
          v68 = v87;
          sub_1DAE0CDD4();
          v69 = *(void (**)(char *, uint64_t))(v80 + 8);
          v69(v66, v68);
          sub_1DAE0CEB8();
          sub_1DAE0CDE0();
          sub_1DAE0CED0();
          v70 = v32;
          v71 = v81;
          sub_1DAE0CDE0();
          v69((char *)v70, v68);
          sub_1DAE0CEC4();
          sub_1DAE0CDE0();
          v69(v71, v68);
          sub_1DAE0CEDC();
          v72 = v88;
          sub_1DAE0CDE0();
          v69(v66, v68);
          v69(v67, v68);
          (*(void (**)(char *, uint64_t, _QWORD, unint64_t, _QWORD, _QWORD))(v75 + 8))(v72, v64, MEMORY[0x1E0CE0428], v65, MEMORY[0x1E0CE0400], v74[0]);
          v73 = v76;

          v69(v72, v68);
          (*(void (**)(char *, uint64_t))(v85 + 8))(v62, v86);
          swift_bridgeObjectRelease();

          return;
        }
        v52 = (void *)v51;
        v53 = v36;
        v54 = objc_msgSend(v52, sel_cardSectionRowModels);
        if (v54)
        {
          v55 = v54;
          sub_1DADF5F84(0, &qword_1F029E5E8);
          v56 = sub_1DAE0D5CC();

          if (v56 >> 62)
            goto LABEL_44;
          v57 = *(_QWORD *)((v56 & 0xFFFFFFFFFFFFF8) + 0x10);
          while (v57)
          {
            v79 = (char *)v32;
            v32 = v56 & 0xC000000000000001;
            v47 = 4;
            while (1)
            {
              v58 = v32 ? (id)MEMORY[0x1DF0A7ED0](v47 - 4, v56) : *(id *)(v56 + 8 * v47);
              v38 = v58;
              v59 = v47 - 3;
              if (__OFADD__(v47 - 4, 1))
                break;
              v60 = swift_dynamicCastClass();
              if (v60)
              {
                v49 = (void *)v60;

                swift_bridgeObjectRelease();
                v38 = v78;
                v32 = (unint64_t)v79;
                v47 = (uint64_t)v77;
                goto LABEL_24;
              }

              ++v47;
              if (v59 == v57)
              {

                swift_bridgeObjectRelease();
                v38 = v78;
                v32 = (unint64_t)v79;
                v47 = (uint64_t)v77;
                goto LABEL_46;
              }
            }
            __break(1u);
LABEL_44:
            swift_bridgeObjectRetain();
            v57 = sub_1DAE0D83C();
            swift_bridgeObjectRelease();
          }

          swift_bridgeObjectRelease();
          goto LABEL_46;
        }
LABEL_50:
        __break(1u);
        return;
      }
    }
    else
    {
      __break(1u);
    }
    __break(1u);
    goto LABEL_50;
  }
}

uint64_t sub_1DAE01E64@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;

  return sub_1DAE00B40(*(_QWORD *)(v1 + 16), *(_QWORD *)(v1 + 24), a1);
}

unint64_t sub_1DAE01E6C()
{
  unint64_t result;
  uint64_t v1;
  _QWORD v2[2];

  result = qword_1F029E5D0;
  if (!qword_1F029E5D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E5C8);
    v2[0] = swift_getOpaqueTypeConformance2();
    v2[1] = sub_1DAE01EE4();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD9C20], v1, v2);
    atomic_store(result, (unint64_t *)&qword_1F029E5D0);
  }
  return result;
}

unint64_t sub_1DAE01EE4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029E5D8;
  if (!qword_1F029E5D8)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E5E0);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0CD89F0], v1);
    atomic_store(result, (unint64_t *)&qword_1F029E5D8);
  }
  return result;
}

uint64_t sub_1DAE01F30(uint64_t a1)
{
  uint64_t v2;

  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B6B8);
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

uint64_t sub_1DAE01F70@<X0>(uint64_t *a1@<X8>)
{
  uint64_t v1;

  return sub_1DAE00D5C(*(_QWORD **)(v1 + 16), a1);
}

uint64_t sub_1DAE01F78(uint64_t a1, uint64_t a2)
{
  uint64_t v4;

  v4 = sub_1DAE0CBC4();
  (*(void (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v4 - 8) + 16))(a2, a1, v4);
  return a2;
}

uint64_t sub_1DAE01FBC(uint64_t a1)
{
  uint64_t v2;

  v2 = sub_1DAE0CBC4();
  (*(void (**)(uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 8))(a1, v2);
  return a1;
}

SearchUIItemProviderUtilities __swiftcall SearchUIItemProviderUtilities.init()()
{
  return (SearchUIItemProviderUtilities)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SearchUIItemProviderUtilities.init()()
{
  objc_super v1;

  v1.super_class = (Class)SearchUIItemProviderUtilities;
  return objc_msgSendSuper2(&v1, sel_init);
}

void sub_1DAE020F8(uint64_t a1, uint64_t a2)
{
  id v4;
  uint64_t v5;
  id v6;

  v4 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4D46B0);
  v5 = swift_allocObject();
  *(_OWORD *)(v5 + 16) = xmmword_1DAE1E130;
  *(_QWORD *)(v5 + 32) = (*(uint64_t (**)(uint64_t, uint64_t))(a2 + 8))(a1, a2);
  sub_1DAE0D5D8();
  sub_1DADF5F84(0, &qword_1F029E670);
  v6 = (id)sub_1DAE0D5C0();
  swift_bridgeObjectRelease();
  objc_msgSend(v4, sel_setItemProviders_, v6);

}

id sub_1DAE021EC()
{
  id *v0;
  id result;
  void *v2;
  id v3;

  result = objc_msgSend(*v0, sel_copyableString);
  if (result)
  {
    v2 = result;
    v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB36C8]), sel_initWithObject_, result);

    return v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

id sub_1DAE02254()
{
  void *v0;
  id v1;
  void *v2;
  _QWORD *v3;
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  _QWORD *v23;
  void *v24;
  id v25;
  uint64_t v27;
  uint64_t aBlock;
  uint64_t v29;
  id (*v30)(uint64_t, void *);
  void *v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  _QWORD *v33;

  v1 = objc_msgSend(v0, sel_fileProviderTypeIdentifiers);
  if (v1)
  {
    v2 = v1;
    v3 = (_QWORD *)sub_1DAE0D5CC();

  }
  else
  {
    v3 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  }
  v4 = objc_msgSend(v0, sel_dataProviderTypeIdentifiers);
  if (v4)
  {
    v5 = v4;
    v6 = sub_1DAE0D5CC();

  }
  else
  {
    v6 = MEMORY[0x1E0DEE9D8];
  }
  v7 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB36C8]), sel_init);
  v8 = v3[2];
  if (v8)
  {
    v27 = v6;
    swift_bridgeObjectRetain();
    v9 = v3 + 5;
    v10 = MEMORY[0x1E0C809B0];
    do
    {
      v11 = *(v9 - 1);
      v12 = *v9;
      swift_bridgeObjectRetain();
      v13 = (void *)sub_1DAE0D530();
      v14 = (_QWORD *)swift_allocObject();
      v14[2] = v0;
      v14[3] = v11;
      v14[4] = v12;
      v32 = sub_1DAE04618;
      v33 = v14;
      aBlock = v10;
      v29 = 1107296256;
      v30 = sub_1DAE02A40;
      v31 = &block_descriptor_20;
      v15 = _Block_copy(&aBlock);
      v16 = v0;
      swift_release();
      objc_msgSend(v7, sel_registerFileRepresentationForTypeIdentifier_fileOptions_visibility_loadHandler_, v13, 1, 0, v15);
      _Block_release(v15);

      v9 += 2;
      --v8;
    }
    while (v8);
    swift_bridgeObjectRelease();
    v6 = v27;
  }
  v17 = sub_1DAE03FCC(v6, v3);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v18 = *(_QWORD *)(v17 + 16);
  if (v18)
  {
    v19 = (uint64_t *)(v17 + 40);
    do
    {
      v20 = *(v19 - 1);
      v21 = *v19;
      swift_bridgeObjectRetain();
      v22 = (void *)sub_1DAE0D530();
      v23 = (_QWORD *)swift_allocObject();
      v23[2] = v0;
      v23[3] = v20;
      v23[4] = v21;
      v32 = sub_1DAE04674;
      v33 = v23;
      aBlock = MEMORY[0x1E0C809B0];
      v29 = 1107296256;
      v30 = sub_1DAE02FF0;
      v31 = &block_descriptor_26;
      v24 = _Block_copy(&aBlock);
      v25 = v0;
      swift_release();
      objc_msgSend(v7, sel_registerDataRepresentationForTypeIdentifier_visibility_loadHandler_, v22, 0, v24);
      _Block_release(v24);

      v19 += 2;
      --v18;
    }
    while (v18);
  }
  swift_bridgeObjectRelease();
  return v7;
}

uint64_t sub_1DAE0252C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;
  uint64_t v9;

  v8[18] = a7;
  v8[19] = a8;
  v8[16] = a5;
  v8[17] = a6;
  v8[15] = a4;
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E688);
  v8[20] = swift_task_alloc();
  v9 = sub_1DAE0C78C();
  v8[21] = v9;
  v8[22] = *(_QWORD *)(v9 - 8);
  v8[23] = swift_task_alloc();
  v8[24] = swift_task_alloc();
  return swift_task_switch();
}

id sub_1DAE025C8()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *v9;

  v1 = *(void **)(v0 + 120);
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultSearchableIndex);
  *(_QWORD *)(v0 + 200) = v2;
  result = objc_msgSend(v1, sel_applicationBundleIdentifier);
  *(_QWORD *)(v0 + 208) = result;
  if (result)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(v0 + 120), sel_coreSpotlightIdentifier);
    *(_QWORD *)(v0 + 216) = result;
    if (result)
    {
      v5 = result;
      v6 = *(_QWORD *)(v0 + 184);
      v7 = sub_1DAE0D530();
      *(_QWORD *)(v0 + 224) = v7;
      *(_QWORD *)(v0 + 56) = v6;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_1DAE02704;
      v8 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
      v9 = (_QWORD *)(v0 + 80);
      v9[1] = 0x40000000;
      v9[2] = sub_1DAE02950;
      v9[3] = &block_descriptor_42;
      v9[4] = v8;
      objc_msgSend(v2, sel_provideFileURLForBundle_itemIdentifier_typeIdentifier_options_completionHandler_, v4, v5, v7, 0, v9);
      return (id)swift_continuation_await();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE02704()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 232) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAE02764()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void (*v10)(uint64_t, uint64_t, _QWORD);

  v2 = *(void **)(v0 + 216);
  v1 = *(void **)(v0 + 224);
  v4 = *(void **)(v0 + 200);
  v3 = *(void **)(v0 + 208);
  v5 = *(_QWORD *)(v0 + 192);
  v6 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 160);
  v10 = *(void (**)(uint64_t, uint64_t, _QWORD))(v0 + 144);
  (*(void (**)(uint64_t, _QWORD, uint64_t))(v7 + 32))(v5, *(_QWORD *)(v0 + 184), v6);

  (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v8, v5, v6);
  (*(void (**)(uint64_t, _QWORD, uint64_t, uint64_t))(v7 + 56))(v8, 0, 1, v6);
  v10(v8, 1, 0);
  sub_1DADDCC3C(v8, &qword_1F029E688);
  (*(void (**)(uint64_t, uint64_t))(v7 + 8))(v5, v6);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAE02864()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void (*v11)(uint64_t, _QWORD, void *);

  v2 = *(void **)(v0 + 224);
  v1 = *(void **)(v0 + 232);
  v4 = *(void **)(v0 + 208);
  v3 = *(void **)(v0 + 216);
  v5 = *(void **)(v0 + 200);
  v6 = *(_QWORD *)(v0 + 168);
  v7 = *(_QWORD *)(v0 + 176);
  v8 = *(_QWORD *)(v0 + 160);
  v11 = *(void (**)(uint64_t, _QWORD, void *))(v0 + 144);
  swift_willThrow();

  (*(void (**)(uint64_t, uint64_t, uint64_t, uint64_t))(v7 + 56))(v8, 1, 1, v6);
  v9 = v1;
  v11(v8, 0, v1);

  sub_1DADDCC3C(v8, &qword_1F029E688);
  swift_task_dealloc();
  swift_task_dealloc();
  swift_task_dealloc();
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAE02950(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v5 = sub_1DAE0C78C();
  v6 = *(_QWORD *)(v5 - 8);
  MEMORY[0x1E0C80A78](v5);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D928);
    swift_allocError();
    *v10 = a3;
    v11 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    sub_1DAE0C780();
    (*(void (**)(_QWORD, char *, uint64_t))(v6 + 32))(*(_QWORD *)(*(_QWORD *)(v9 + 64) + 40), v8, v5);
    return swift_continuation_throwingResume();
  }
}

id sub_1DAE02A40(uint64_t a1, void *a2)
{
  return sub_1DAE03004(a1, a2, (uint64_t)&unk_1EA1FAA88, (uint64_t)sub_1DAE0478C);
}

void sub_1DAE02A54(uint64_t a1, char a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E688);
  MEMORY[0x1E0C80A78](v8);
  v10 = (char *)&v15 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DADEC1E0(a1, (uint64_t)v10, &qword_1F029E688);
  v11 = sub_1DAE0C78C();
  v12 = *(_QWORD *)(v11 - 8);
  v13 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v12 + 48))(v10, 1, v11) != 1)
  {
    v13 = (void *)sub_1DAE0C774();
    (*(void (**)(char *, uint64_t))(v12 + 8))(v10, v11);
  }
  if (a3)
    v14 = (void *)sub_1DAE0C72C();
  else
    v14 = 0;
  (*(void (**)(uint64_t, void *, _QWORD, void *))(a4 + 16))(a4, v13, a2 & 1, v14);

}

uint64_t sub_1DAE02B64(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  uint64_t v13;
  uint64_t v14;
  char *v15;
  uint64_t v16;
  _QWORD *v17;
  id v18;
  uint64_t v20;

  v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v13);
  v15 = (char *)&v20 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAE0D638();
  v16 = sub_1DAE0D650();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v16 - 8) + 56))(v15, 0, 1, v16);
  v17 = (_QWORD *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = a3;
  v17[5] = a4;
  v17[6] = a5;
  v17[7] = a1;
  v17[8] = a2;
  v18 = a3;
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  sub_1DAE06E00((uint64_t)v15, a7, (uint64_t)v17);
  swift_release();
  return 0;
}

uint64_t sub_1DAE02C68(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  _QWORD *v8;

  v8[20] = a7;
  v8[21] = a8;
  v8[18] = a5;
  v8[19] = a6;
  v8[17] = a4;
  return swift_task_switch();
}

id sub_1DAE02C88()
{
  uint64_t v0;
  void *v1;
  id v2;
  id result;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD *v8;

  v1 = *(void **)(v0 + 136);
  v2 = objc_msgSend((id)objc_opt_self(), sel_defaultSearchableIndex);
  *(_QWORD *)(v0 + 176) = v2;
  result = objc_msgSend(v1, sel_applicationBundleIdentifier);
  *(_QWORD *)(v0 + 184) = result;
  if (result)
  {
    v4 = result;
    result = objc_msgSend(*(id *)(v0 + 136), sel_coreSpotlightIdentifier);
    *(_QWORD *)(v0 + 192) = result;
    if (result)
    {
      v5 = result;
      v6 = sub_1DAE0D530();
      *(_QWORD *)(v0 + 200) = v6;
      *(_QWORD *)(v0 + 56) = v0 + 120;
      *(_QWORD *)(v0 + 16) = v0;
      *(_QWORD *)(v0 + 24) = sub_1DAE02DC4;
      v7 = swift_continuation_init();
      *(_QWORD *)(v0 + 80) = MEMORY[0x1E0C809B0];
      v8 = (_QWORD *)(v0 + 80);
      v8[1] = 0x40000000;
      v8[2] = sub_1DAE02F50;
      v8[3] = &block_descriptor_34;
      v8[4] = v7;
      objc_msgSend(v2, sel_provideDataForBundle_itemIdentifier_typeIdentifier_options_completionHandler_, v4, v5, v6, 0, v8);
      return (id)swift_continuation_await();
    }
  }
  else
  {
    __break(1u);
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE02DC4()
{
  uint64_t v0;

  *(_QWORD *)(*(_QWORD *)v0 + 208) = *(_QWORD *)(*(_QWORD *)v0 + 48);
  return swift_task_switch();
}

uint64_t sub_1DAE02E24()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void (*v4)(uint64_t, unint64_t, _QWORD);
  uint64_t v5;
  unint64_t v6;

  v2 = *(void **)(v0 + 192);
  v1 = *(void **)(v0 + 200);
  v3 = *(void **)(v0 + 184);
  v4 = *(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 160);
  v5 = *(_QWORD *)(v0 + 120);
  v6 = *(_QWORD *)(v0 + 128);

  sub_1DAE04748(v5, v6);
  v4(v5, v6, 0);
  sub_1DADDCBF8(v5, v6);
  sub_1DADDCBF8(v5, v6);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAE02EB8()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void (*v6)(_QWORD, unint64_t, void *);
  id v7;

  v2 = *(void **)(v0 + 200);
  v1 = *(void **)(v0 + 208);
  v4 = *(void **)(v0 + 184);
  v3 = *(void **)(v0 + 192);
  v5 = *(void **)(v0 + 176);
  v6 = *(void (**)(_QWORD, unint64_t, void *))(v0 + 160);
  swift_willThrow();

  v7 = v1;
  v6(0, 0xF000000000000000, v1);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAE02F50(uint64_t a1, void *a2, void *a3)
{
  uint64_t v3;
  _QWORD *v5;
  id v6;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t *v12;

  v3 = *(_QWORD *)(a1 + 32);
  if (a3)
  {
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D928);
    swift_allocError();
    *v5 = a3;
    v6 = a3;
    return swift_continuation_throwingResumeWithError();
  }
  else
  {
    v8 = a2;
    v9 = sub_1DAE0C7A4();
    v11 = v10;

    v12 = *(uint64_t **)(*(_QWORD *)(v3 + 64) + 40);
    *v12 = v9;
    v12[1] = v11;
    return swift_continuation_throwingResume();
  }
}

id sub_1DAE02FF0(uint64_t a1, void *a2)
{
  return sub_1DAE03004(a1, a2, (uint64_t)&unk_1EA1FAA20, (uint64_t)sub_1DAE046C4);
}

id sub_1DAE03004(uint64_t a1, void *aBlock, uint64_t a3, uint64_t a4)
{
  uint64_t (*v5)(uint64_t, uint64_t);
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = *(uint64_t (**)(uint64_t, uint64_t))(a1 + 32);
  v6 = _Block_copy(aBlock);
  v7 = swift_allocObject();
  *(_QWORD *)(v7 + 16) = v6;
  sub_1DAE0C564();
  v8 = (void *)v5(a4, v7);
  swift_release();
  swift_release();
  return v8;
}

void sub_1DAE0308C(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v6;
  uint64_t v7;
  id v8;

  if (a2 >> 60 != 15)
  {
    v6 = (void *)sub_1DAE0C798();
    if (a3)
      goto LABEL_3;
LABEL_5:
    v7 = 0;
    goto LABEL_6;
  }
  v6 = 0;
  if (!a3)
    goto LABEL_5;
LABEL_3:
  v7 = sub_1DAE0C72C();
LABEL_6:
  v8 = (id)v7;
  (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v6);

}

id sub_1DAE0310C()
{
  return sub_1DAE02254();
}

void sub_1DAE0312C()
{
  void *v0;
  void *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  v1 = (void *)objc_opt_self();
  v2 = objc_msgSend(v1, sel_sharedCache);
  if (!v2)
  {
    __break(1u);
    goto LABEL_7;
  }
  v3 = v2;
  v4 = objc_msgSend(v0, sel_person);
  if (!v4)
  {
LABEL_7:
    __break(1u);
    goto LABEL_8;
  }
  v5 = v4;
  v6 = objc_msgSend(v4, sel_contactIdentifier);

  v7 = objc_msgSend(v3, sel_contactForIdentifier_, v6);
  if (!v7)
  {
LABEL_8:
    __break(1u);
    goto LABEL_9;
  }
  v8 = objc_msgSend(v1, sel_sharedCache);
  if (v8)
  {
    v9 = v8;
    v10 = (void *)objc_opt_self();
    v11 = objc_msgSend(v9, sel_contactStore);

    objc_msgSend(v10, sel_itemProviderForContact_withContactStore_, v7, v11);
    return;
  }
LABEL_9:
  __break(1u);
}

void sub_1DAE03274()
{
  sub_1DAE0312C();
}

uint64_t sub_1DAE03294(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  _QWORD *v10;
  id v11;
  uint64_t v13;

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v6);
  v8 = (char *)&v13 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DAE0D638();
  v9 = sub_1DAE0D650();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v9 - 8) + 56))(v8, 0, 1, v9);
  v10 = (_QWORD *)swift_allocObject();
  v10[2] = 0;
  v10[3] = 0;
  v10[4] = a3;
  v10[5] = a1;
  v10[6] = a2;
  v11 = a3;
  sub_1DAE0C564();
  sub_1DAE06E00((uint64_t)v8, (uint64_t)&unk_1F029E668, (uint64_t)v10);
  swift_release();
  return 0;
}

uint64_t sub_1DAE0337C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  _QWORD *v6;
  _QWORD *v8;

  v6[2] = a5;
  v6[3] = a6;
  v8 = (_QWORD *)swift_task_alloc();
  v6[4] = v8;
  *v8 = v6;
  v8[1] = sub_1DAE033E0;
  v8[3] = a4;
  return swift_task_switch();
}

uint64_t sub_1DAE033E0(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 40) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAE0343C()
{
  uint64_t v0;
  NSData *v1;
  NSData *v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;

  v1 = UIImageJPEGRepresentation(*(UIImage **)(v0 + 40), 1.0);
  if (v1)
  {
    v2 = v1;
    v3 = sub_1DAE0C7A4();
    v5 = v4;

  }
  else
  {
    v3 = 0;
    v5 = 0xF000000000000000;
  }
  v6 = *(void **)(v0 + 40);
  (*(void (**)(uint64_t, unint64_t, _QWORD))(v0 + 16))(v3, v5, 0);
  sub_1DAE04600(v3, v5);

  return (*(uint64_t (**)(void))(v0 + 8))();
}

uint64_t sub_1DAE034CC()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 24) = v0;
  return swift_task_switch();
}

id sub_1DAE034E4()
{
  uint64_t v0;
  id result;
  void *v2;

  result = objc_msgSend(*(id *)(v0 + 24), sel_image);
  if (result)
  {
    v2 = result;
    *(_QWORD *)(v0 + 32) = objc_msgSend(objc_allocWithZone((Class)SearchUIImage), sel_initWithSFImage_, result);

    *(_QWORD *)(v0 + 40) = objc_opt_self();
    *(_QWORD *)(v0 + 48) = sub_1DAE0D62C();
    *(_QWORD *)(v0 + 56) = sub_1DAE0D620();
    sub_1DAE0D608();
    return (id)swift_task_switch();
  }
  else
  {
    __break(1u);
  }
  return result;
}

uint64_t sub_1DAE035A8()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);
  swift_release();
  *(_QWORD *)(v0 + 64) = objc_msgSend(v1, sel_mainScreen);
  return swift_task_switch();
}

uint64_t sub_1DAE03604()
{
  uint64_t v0;

  *(_QWORD *)(v0 + 72) = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE03664()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;

  v1 = *(void **)(v0 + 64);
  swift_release();
  objc_msgSend(v1, sel_scale);
  *(_QWORD *)(v0 + 80) = v2;

  return swift_task_switch();
}

uint64_t sub_1DAE036B8()
{
  _QWORD *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  v1 = v0[10];
  v2 = v0[4];
  v3 = swift_task_alloc();
  v0[11] = v3;
  *(_QWORD *)(v3 + 16) = v2;
  *(_QWORD *)(v3 + 24) = v1;
  v4 = (_QWORD *)swift_task_alloc();
  v0[12] = v4;
  sub_1DADF5F84(0, &qword_1F029E650);
  *v4 = v0;
  v4[1] = sub_1DAE03780;
  return sub_1DAE0D890();
}

uint64_t sub_1DAE03780()
{
  swift_task_dealloc();
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAE037DC()
{
  uint64_t v0;

  return (*(uint64_t (**)(_QWORD))(v0 + 8))(*(_QWORD *)(v0 + 16));
}

void sub_1DAE0380C(uint64_t a1, void *a2, double a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  _QWORD aBlock[6];

  v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E658);
  v7 = *(_QWORD *)(v6 - 8);
  v8 = *(_QWORD *)(v7 + 64);
  MEMORY[0x1E0C80A78](v6);
  if (a2)
  {
    v9 = objc_msgSend((id)objc_opt_self(), sel_bestAppearanceForSystem);
    if (v9)
    {
      v10 = v9;
      v11 = objc_msgSend(v9, sel_isDark);

      (*(void (**)(char *, uint64_t, uint64_t))(v7 + 16))((char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), a1, v6);
      v12 = (*(unsigned __int8 *)(v7 + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(v7 + 80);
      v13 = swift_allocObject();
      (*(void (**)(unint64_t, char *, uint64_t))(v7 + 32))(v13 + v12, (char *)aBlock - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0), v6);
      aBlock[4] = sub_1DAE044A8;
      aBlock[5] = v13;
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 1107296256;
      aBlock[2] = sub_1DAE039E0;
      aBlock[3] = &block_descriptor_0;
      v14 = _Block_copy(aBlock);
      swift_release();
      objc_msgSend(a2, sel_loadImageWithScale_isDarkStyle_completionHandler_, v11, v14, a3);
      _Block_release(v14);
    }
    else
    {
      __break(1u);
    }
  }
}

void *sub_1DAE03994(void *result, char a2)
{
  id v2;

  if ((a2 & 1) != 0)
  {
    if (result)
    {
      v2 = result;
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E658);
      return (void *)sub_1DAE0D614();
    }
  }
  return result;
}

void sub_1DAE039E0(uint64_t a1, void *a2, uint64_t a3)
{
  void (*v5)(void *, uint64_t);
  id v6;

  v5 = *(void (**)(void *, uint64_t))(a1 + 32);
  sub_1DAE0C564();
  v6 = a2;
  v5(a2, a3);
  swift_release();

}

uint64_t sub_1DAE03A40(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  _QWORD *v7;

  *(_QWORD *)(v5 + 16) = a5;
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v5 + 24) = v7;
  *v7 = v5;
  v7[1] = sub_1DAE03AA4;
  v7[3] = a4;
  return swift_task_switch();
}

uint64_t sub_1DAE03AA4(uint64_t a1)
{
  uint64_t v1;

  *(_QWORD *)(*(_QWORD *)v1 + 32) = a1;
  swift_task_dealloc();
  return swift_task_switch();
}

uint64_t sub_1DAE03B00()
{
  _QWORD *v0;
  uint64_t v1;
  id v2;

  v1 = v0[4];
  v2 = objc_msgSend((id)objc_opt_self(), sel_generalPasteboard);
  objc_msgSend(v2, sel_setImage_, v1);

  v0[5] = objc_opt_self();
  sub_1DAE0D62C();
  v0[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE03BB4()
{
  uint64_t v0;
  void *v1;

  v1 = *(void **)(v0 + 40);
  swift_release();
  *(_QWORD *)(v0 + 56) = objc_msgSend(v1, sel_sharedApplication);
  return swift_task_switch();
}

uint64_t sub_1DAE03C0C()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v1 = *(void **)(v0 + 56);
  v2 = *(void **)(v0 + 32);
  objc_msgSend(v1, sel_endBackgroundTask_, *(_QWORD *)(v0 + 16));

  return (*(uint64_t (**)(void))(v0 + 8))();
}

id sub_1DAE03C58()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  char *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v9;

  v1 = sub_1DAE0CA68();
  v2 = *(_QWORD *)(v1 - 8);
  MEMORY[0x1E0C80A78](v1);
  v4 = (char *)&v9 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v5 = *v0;
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB36C8]), sel_init);
  sub_1DAE0CA5C();
  *(_QWORD *)(swift_allocObject() + 16) = v5;
  v7 = v5;
  sub_1DAE0D6E0();
  swift_release();
  (*(void (**)(char *, uint64_t))(v2 + 8))(v4, v1);
  return v6;
}

uint64_t sub_1DAE03D38()
{
  void **v0;
  uint64_t v1;
  uint64_t v2;
  char *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD *v8;
  id v9;
  uint64_t v11;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4410);
  MEMORY[0x1E0C80A78](v1);
  v3 = (char *)&v11 - ((v2 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = *v0;
  v5 = objc_msgSend((id)objc_opt_self(), sel_sharedApplication);
  v6 = objc_msgSend(v5, sel_beginBackgroundTaskWithExpirationHandler_, 0);

  v7 = sub_1DAE0D650();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v7 - 8) + 56))(v3, 1, 1, v7);
  v8 = (_QWORD *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v4;
  v8[5] = v6;
  v9 = v4;
  sub_1DAE06E00((uint64_t)v3, (uint64_t)&unk_1F029E640, (uint64_t)v8);
  return swift_release();
}

uint64_t type metadata accessor for SearchUIItemProviderUtilities(uint64_t a1)
{
  return sub_1DADF5F84(a1, &qword_1F029E618);
}

uint64_t sub_1DAE03E48(char a1, int64_t a2, char a3)
{
  char **v3;
  uint64_t result;

  result = sub_1DAE03E64(a1, a2, a3, *v3);
  *v3 = (char *)result;
  return result;
}

uint64_t sub_1DAE03E64(char a1, int64_t a2, char a3, char *a4)
{
  unint64_t v6;
  int64_t v7;
  uint64_t v8;
  uint64_t v9;
  char *v10;
  int64_t v11;
  uint64_t v12;
  char *v13;
  char *v14;
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
        goto LABEL_32;
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
    __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B500);
    v10 = (char *)swift_allocObject();
    v11 = _swift_stdlib_malloc_size(v10);
    v12 = v11 - 32;
    if (v11 < 32)
      v12 = v11 - 17;
    *((_QWORD *)v10 + 2) = v8;
    *((_QWORD *)v10 + 3) = 2 * (v12 >> 4);
  }
  else
  {
    v10 = (char *)MEMORY[0x1E0DEE9D8];
  }
  v13 = v10 + 32;
  v14 = a4 + 32;
  if ((a1 & 1) != 0)
  {
    if (v10 != a4 || v13 >= &v14[16 * v8])
      memmove(v13, v14, 16 * v8);
    *((_QWORD *)a4 + 2) = 0;
    goto LABEL_30;
  }
  if (v14 >= &v13[16 * v8] || v13 >= &v14[16 * v8])
  {
    swift_arrayInitWithCopy();
LABEL_30:
    swift_release();
    return (uint64_t)v10;
  }
LABEL_32:
  result = sub_1DAE0D860();
  __break(1u);
  return result;
}

uint64_t sub_1DAE03FCC(uint64_t result, _QWORD *a2)
{
  unint64_t v2;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t v19;
  _QWORD *v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;

  v2 = *(_QWORD *)(result + 16);
  if (!v2)
    return MEMORY[0x1E0DEE9D8];
  v4 = 0;
  v22 = result + 32;
  v20 = a2 + 7;
  v21 = MEMORY[0x1E0DEE9D8];
  do
  {
    if (v4 <= v2)
      v5 = v2;
    else
      v5 = v4;
    v23 = v5;
    while (1)
    {
      if (v4 == v23)
        goto LABEL_33;
      v6 = (uint64_t *)(v22 + 16 * v4);
      v7 = *v6;
      v8 = v6[1];
      ++v4;
      v9 = a2[2];
      if (!v9)
        goto LABEL_24;
      result = a2[4];
      if (result != v7 || a2[5] != v8)
      {
        result = sub_1DAE0D8A8();
        if ((result & 1) == 0)
          break;
      }
LABEL_7:
      if (v4 == v2)
        return v21;
    }
    if (v9 != 1)
    {
      v11 = v20;
      v12 = 1;
      while (1)
      {
        v13 = v12 + 1;
        if (__OFADD__(v12, 1))
          break;
        result = *(v11 - 1);
        if (result == v7 && *v11 == v8)
          goto LABEL_7;
        result = sub_1DAE0D8A8();
        if ((result & 1) != 0)
          goto LABEL_7;
        v11 += 2;
        ++v12;
        if (v13 == v9)
          goto LABEL_24;
      }
      __break(1u);
LABEL_33:
      __break(1u);
      return result;
    }
LABEL_24:
    swift_bridgeObjectRetain();
    result = swift_isUniquelyReferenced_nonNull_native();
    v15 = v21;
    if ((result & 1) == 0)
    {
      result = sub_1DAE03E48(0, *(_QWORD *)(v21 + 16) + 1, 1);
      v15 = v21;
    }
    v16 = v15;
    v18 = *(_QWORD *)(v15 + 16);
    v17 = *(_QWORD *)(v15 + 24);
    if (v18 >= v17 >> 1)
    {
      result = sub_1DAE03E48(v17 > 1, v18 + 1, 1);
      v16 = v21;
    }
    *(_QWORD *)(v16 + 16) = v18 + 1;
    v21 = v16;
    v19 = v16 + 16 * v18;
    *(_QWORD *)(v19 + 32) = v7;
    *(_QWORD *)(v19 + 40) = v8;
  }
  while (v4 != v2);
  return v21;
}

uint64_t sub_1DAE04190(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  if (!a1
    || (v6[0] = a1,
        sub_1DADF5F84(0, &qword_1F029E628),
        v2 = a1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E630),
        (swift_dynamicCast() & 1) == 0))
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_1DADEC1E0((uint64_t)v9, (uint64_t)v6, &qword_1F029E620);
  v3 = v7;
  if (v7)
  {
    v4 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    v3 = (*(uint64_t (**)(uint64_t, uint64_t))(v4 + 8))(v3, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  else
  {
    sub_1DADDCC3C((uint64_t)v6, &qword_1F029E620);
  }
  sub_1DADDCC3C((uint64_t)v9, &qword_1F029E620);
  return v3;
}

uint64_t sub_1DAE0428C(void *a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  _QWORD v6[3];
  uint64_t v7;
  uint64_t v8;
  _OWORD v9[2];
  uint64_t v10;

  if (!a1
    || (v6[0] = a1,
        sub_1DADF5F84(0, &qword_1F029E628),
        v2 = a1,
        __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E630),
        (swift_dynamicCast() & 1) == 0))
  {
    v10 = 0;
    memset(v9, 0, sizeof(v9));
  }
  sub_1DADEC1E0((uint64_t)v9, (uint64_t)v6, &qword_1F029E620);
  v3 = v7;
  if (v7)
  {
    v4 = v8;
    __swift_project_boxed_opaque_existential_1(v6, v7);
    (*(void (**)(uint64_t, uint64_t))(v4 + 16))(v3, v4);
    __swift_destroy_boxed_opaque_existential_0((uint64_t)v6);
  }
  else
  {
    sub_1DADDCC3C((uint64_t)v6, &qword_1F029E620);
  }
  return sub_1DADDCC3C((uint64_t)v9, &qword_1F029E620);
}

uint64_t sub_1DAE04380()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1DAE043AC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v1 + 16) = v4;
  *v4 = v1;
  v4[1] = sub_1DADDA484;
  v4[2] = v3;
  v5 = (_QWORD *)swift_task_alloc();
  v4[3] = v5;
  *v5 = v4;
  v5[1] = sub_1DAE03AA4;
  v5[3] = v2;
  return swift_task_switch();
}

void sub_1DAE04438(uint64_t a1)
{
  uint64_t v1;

  sub_1DAE0380C(a1, *(void **)(v1 + 16), *(double *)(v1 + 24));
}

uint64_t sub_1DAE04444()
{
  uint64_t v0;
  uint64_t v1;

  v1 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E658);
  (*(void (**)(unint64_t, uint64_t))(*(_QWORD *)(v1 - 8) + 8))(v0+ ((*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80) + 16) & ~(unint64_t)*(unsigned __int8 *)(*(_QWORD *)(v1 - 8) + 80)), v1);
  return swift_deallocObject();
}

void *sub_1DAE044A8(void *a1, char a2)
{
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E658);
  return sub_1DAE03994(a1, a2);
}

uint64_t block_copy_helper(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_1DAE0C564();
}

uint64_t block_destroy_helper()
{
  return swift_release();
}

uint64_t sub_1DAE04510()
{
  uint64_t v0;

  return swift_deallocObject();
}

uint64_t sub_1DAE04534(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DAE03294(a1, a2, *(void **)(v2 + 16));
}

uint64_t sub_1DAE0453C()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAE04570()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  __int128 v4;
  _QWORD *v5;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = swift_task_alloc();
  v4 = *(_OWORD *)(v0 + 40);
  *(_QWORD *)(v1 + 16) = v3;
  *(_QWORD *)v3 = v1;
  *(_QWORD *)(v3 + 8) = sub_1DADE2638;
  *(_OWORD *)(v3 + 16) = v4;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v3 + 32) = v5;
  *v5 = v3;
  v5[1] = sub_1DAE033E0;
  v5[3] = v2;
  return swift_task_switch();
}

uint64_t sub_1DAE04600(uint64_t a1, unint64_t a2)
{
  if (a2 >> 60 != 15)
    return sub_1DADDCBF8(a1, a2);
  return a1;
}

uint64_t sub_1DAE04618(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DAE02B64(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), (uint64_t)&unk_1EA1FAAB0, (uint64_t)&unk_1F029E698);
}

uint64_t objectdestroy_16Tm()
{
  uint64_t v0;

  swift_bridgeObjectRelease();
  return swift_deallocObject();
}

uint64_t sub_1DAE04674(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  return sub_1DAE02B64(a1, a2, *(void **)(v2 + 16), *(_QWORD *)(v2 + 24), *(_QWORD *)(v2 + 32), (uint64_t)&unk_1EA1FAA48, (uint64_t)&unk_1F029E680);
}

uint64_t sub_1DAE046A0()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

void sub_1DAE046C4(uint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v3;

  sub_1DAE0308C(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t sub_1DAE046D0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  __int128 v6;

  v2 = *(_QWORD *)(v0 + 32);
  v3 = *(_QWORD *)(v0 + 40);
  v4 = *(_QWORD *)(v0 + 64);
  v5 = swift_task_alloc();
  v6 = *(_OWORD *)(v0 + 48);
  *(_QWORD *)(v1 + 16) = v5;
  *(_QWORD *)v5 = v1;
  *(_QWORD *)(v5 + 8) = sub_1DADE2638;
  *(_QWORD *)(v5 + 168) = v4;
  *(_OWORD *)(v5 + 152) = v6;
  *(_QWORD *)(v5 + 136) = v2;
  *(_QWORD *)(v5 + 144) = v3;
  return swift_task_switch();
}

uint64_t sub_1DAE04748(uint64_t a1, unint64_t a2)
{
  uint64_t result;

  if (a2 >> 62 != 1)
  {
    if (a2 >> 62 != 2)
      return result;
    sub_1DAE0C564();
  }
  return sub_1DAE0C564();
}

void sub_1DAE0478C(uint64_t a1, char a2, uint64_t a3)
{
  uint64_t v3;

  sub_1DAE02A54(a1, a2, a3, *(_QWORD *)(v3 + 16));
}

uint64_t objectdestroy_31Tm()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAE047D4(uint64_t a1)
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
  v11[1] = sub_1DADE2638;
  return sub_1DAE0252C(a1, v4, v5, v6, v7, v8, v9, v10);
}

_QWORD *initializeBufferWithCopyOfBuffer for SearchUIPrivacyView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRetain();
  return a1;
}

uint64_t destroy for SearchUIPrivacyView()
{
  return swift_bridgeObjectRelease();
}

_QWORD *assignWithCopy for SearchUIPrivacyView(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  return a1;
}

_QWORD *assignWithTake for SearchUIPrivacyView(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  swift_bridgeObjectRelease();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIPrivacyView(uint64_t a1, int a2)
{
  unint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0 && *(_BYTE *)(a1 + 16))
    return *(_DWORD *)a1 + 0x80000000;
  v2 = *(_QWORD *)(a1 + 8);
  if (v2 >= 0xFFFFFFFF)
    LODWORD(v2) = -1;
  return (v2 + 1);
}

uint64_t storeEnumTagSinglePayload for SearchUIPrivacyView(uint64_t result, int a2, int a3)
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
      *(_QWORD *)(result + 8) = (a2 - 1);
      return result;
    }
    *(_BYTE *)(result + 16) = 0;
    if (a2)
      goto LABEL_8;
  }
  return result;
}

ValueMetadata *type metadata accessor for SearchUIPrivacyView()
{
  return &type metadata for SearchUIPrivacyView;
}

void sub_1DAE049B8()
{
  id v0;
  void *v1;
  id v2;

  v0 = objc_allocWithZone((Class)SearchUIPrivacyDetailsViewController);
  swift_bridgeObjectRetain();
  v1 = (void *)sub_1DAE0D530();
  swift_bridgeObjectRelease();
  v2 = objc_msgSend(v0, sel_initWithBundleIdentifier_, v1);

  if (!v2)
    __break(1u);
}

uint64_t sub_1DAE04A40()
{
  return sub_1DAE0CE4C();
}

uint64_t sub_1DAE04A78()
{
  return MEMORY[0x1E0CE0788];
}

uint64_t sub_1DAE04A84()
{
  sub_1DAE04B48();
  return sub_1DAE0CE88();
}

uint64_t sub_1DAE04AD4()
{
  sub_1DAE04B48();
  return sub_1DAE0CE58();
}

void sub_1DAE04B24()
{
  sub_1DAE04B48();
  sub_1DAE0CE7C();
  __break(1u);
}

unint64_t sub_1DAE04B48()
{
  unint64_t result;

  result = qword_1F029E6A0;
  if (!qword_1F029E6A0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F5B4, &type metadata for SearchUIPrivacyView);
    atomic_store(result, (unint64_t *)&qword_1F029E6A0);
  }
  return result;
}

unint64_t sub_1DAE04B94()
{
  unint64_t result;

  result = qword_1F029E6A8;
  if (!qword_1F029E6A8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F6D8, &type metadata for SearchUIContinuationEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029E6A8);
  }
  return result;
}

unint64_t sub_1DAE04BDC()
{
  unint64_t result;

  result = qword_1F029E6B0[0];
  if (!qword_1F029E6B0[0])
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F738, &type metadata for SearchUIContinuationEntity.Query);
    atomic_store(result, qword_1F029E6B0);
  }
  return result;
}

uint64_t sub_1DAE04C24()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 96) = v0;
  sub_1DAE0D62C();
  *(_QWORD *)(v1 + 104) = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE04C90()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  unint64_t v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD *v16;
  unint64_t v17;
  unint64_t v18;
  _QWORD *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  _QWORD *v24;

  v1 = *(_QWORD *)(v0 + 96);
  swift_release();
  v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1DF0A8C44](v2))
  {
    v3 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
    if (!(v5 >> 62))
      goto LABEL_3;
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
    if (!(MEMORY[0x1E0DEE9D8] >> 62))
    {
LABEL_3:
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v6)
        goto LABEL_4;
LABEL_19:
      v24 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_20:
      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v24);
    }
  }
  swift_bridgeObjectRetain();
  result = sub_1DAE0D83C();
  v6 = result;
  if (!result)
    goto LABEL_19;
LABEL_4:
  if (v6 >= 1)
  {
    v8 = 0;
    v23 = (uint64_t *)(v0 + 56);
    v22 = v5 & 0xC000000000000001;
    v24 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v20 = v6;
    v21 = v5;
    do
    {
      v9 = v5;
      if (v22)
        v10 = (id)MEMORY[0x1DF0A7ED0](v8, v5);
      else
        v10 = *(id *)(v5 + 8 * v8 + 32);
      sub_1DADEF1BC(v10, v23);
      v12 = *(_QWORD *)(v0 + 56);
      v11 = *(_QWORD *)(v0 + 64);
      v13 = *(_QWORD *)(v0 + 72);
      v14 = *(_QWORD *)(v0 + 80);
      v15 = *(_QWORD *)(v0 + 88);
      sub_1DADE9D90((uint64_t)v23, v0 + 16, &qword_1F029DFF0);
      if (*(_QWORD *)(v0 + 24))
      {
        v16 = v24;
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v16 = sub_1DAE06230(0, v24[2] + 1, 1, v24);
        v18 = v16[2];
        v17 = v16[3];
        if (v18 >= v17 >> 1)
          v16 = sub_1DAE06230((_QWORD *)(v17 > 1), v18 + 1, 1, v16);
        v16[2] = v18 + 1;
        v24 = v16;
        v19 = &v16[5 * v18];
        v19[4] = v12;
        v19[5] = v11;
        v19[6] = v13;
        v19[7] = v14;
        v19[8] = v15;
        v6 = v20;
        v5 = v21;
      }
      else
      {
        v5 = v9;
      }
      ++v8;
    }
    while (v6 != v8);
    goto LABEL_20;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE04EC0()
{
  uint64_t v0;
  uint64_t v1;

  *(_QWORD *)(v1 + 112) = v0;
  sub_1DAE0D62C();
  *(_QWORD *)(v1 + 120) = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE04F2C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  unint64_t v5;
  uint64_t v6;
  uint64_t result;
  uint64_t v8;
  _QWORD *v9;
  _QWORD *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  __int128 v21;

  v1 = *(_QWORD *)(v0 + 112);
  swift_release();
  v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1DF0A8C44](v2))
  {
    v3 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
    if (!(v5 >> 62))
      goto LABEL_3;
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
    if (!(MEMORY[0x1E0DEE9D8] >> 62))
    {
LABEL_3:
      v6 = *(_QWORD *)((v5 & 0xFFFFFFFFFFFFF8) + 0x10);
      result = swift_bridgeObjectRetain();
      if (v6)
        goto LABEL_4;
LABEL_18:
      v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
LABEL_19:
      swift_bridgeObjectRelease_n();
      return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v9);
    }
  }
  swift_bridgeObjectRetain();
  result = sub_1DAE0D83C();
  v6 = result;
  if (!result)
    goto LABEL_18;
LABEL_4:
  if (v6 >= 1)
  {
    v8 = 0;
    v20 = v5 & 0xC000000000000001;
    v9 = (_QWORD *)MEMORY[0x1E0DEE9D8];
    v18 = v6;
    v19 = v5;
    do
    {
      if (v20)
        v11 = (id)MEMORY[0x1DF0A7ED0](v8, v5);
      else
        v11 = *(id *)(v5 + 8 * v8 + 32);
      sub_1DAE06568(v11, (uint64_t *)(v0 + 64));
      v13 = *(_QWORD *)(v0 + 64);
      v12 = *(_QWORD *)(v0 + 72);
      v14 = *(_QWORD *)(v0 + 80);
      v21 = *(_OWORD *)(v0 + 88);
      v15 = *(_QWORD *)(v0 + 104);
      sub_1DADE9D90(v0 + 64, v0 + 16, &qword_1F029E710);
      if (*(_QWORD *)(v0 + 24))
      {
        if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
          v9 = sub_1DAE06350(0, v9[2] + 1, 1, v9);
        v17 = v9[2];
        v16 = v9[3];
        if (v17 >= v16 >> 1)
          v9 = sub_1DAE06350((_QWORD *)(v16 > 1), v17 + 1, 1, v9);
        v9[2] = v17 + 1;
        v10 = &v9[6 * v17];
        v10[4] = v13;
        v10[5] = v12;
        v10[6] = v14;
        *(_OWORD *)(v10 + 7) = v21;
        v10[9] = v15;
        v6 = v18;
        v5 = v19;
      }
      ++v8;
    }
    while (v6 != v8);
    goto LABEL_19;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE05144()
{
  uint64_t result;

  sub_1DAE0C48C();
  sub_1DAE0C480();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D998);
  type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  sub_1DAE0D548();
  sub_1DAE0D740();
  result = sub_1DAE0C468();
  qword_1F02A0418 = result;
  return result;
}

uint64_t sub_1DAE051E0()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  _QWORD v13[2];

  v0 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v0);
  v13[0] = (char *)v13 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v2 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v2);
  v3 = sub_1DAE0C744();
  v4 = *(_QWORD *)(v3 - 8);
  MEMORY[0x1E0C80A78](v3);
  v6 = (char *)v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v7);
  v8 = sub_1DAE0C75C();
  v9 = *(_QWORD *)(v8 - 8);
  MEMORY[0x1E0C80A78](v8);
  v10 = sub_1DAE0C714();
  __swift_allocate_value_buffer(v10, qword_1F02A0420);
  __swift_project_value_buffer(v10, (uint64_t)qword_1F02A0420);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v11 = __swift_project_value_buffer(v3, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, v11, v3);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t))(v9 + 56))(v13[0], 1, 1, v8);
  return sub_1DAE0C708();
}

uint64_t sub_1DAE05438@<X0>(uint64_t a1@<X8>)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v14;
  uint64_t v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;
  uint64_t v21;
  char *v22;
  uint64_t v23;

  v23 = a1;
  v2 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DFD8);
  MEMORY[0x1E0C80A78](v2);
  v22 = (char *)&v17 - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1F029D988);
  MEMORY[0x1E0C80A78](v4);
  v20 = (char *)&v17 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v6);
  v7 = sub_1DAE0C744();
  v19 = *(_QWORD *)(v7 - 8);
  MEMORY[0x1E0C80A78](v7);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v10 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v10);
  v11 = sub_1DAE0D50C();
  MEMORY[0x1E0C80A78](v11);
  v18 = sub_1DAE0C75C();
  v12 = *(_QWORD *)(v18 - 8);
  MEMORY[0x1E0C80A78](v18);
  sub_1DAE0D500();
  sub_1DAE0D4F4();
  sub_1DAE0C510();
  sub_1DAE0D4E8();
  swift_bridgeObjectRelease();
  sub_1DAE0D4F4();
  v21 = v1;
  sub_1DAE0C510();
  sub_1DAE0D4E8();
  swift_bridgeObjectRelease();
  sub_1DAE0D4F4();
  sub_1DAE0D518();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v13 = __swift_project_value_buffer(v7, (uint64_t)qword_1F02A0400);
  (*(void (**)(char *, uint64_t, uint64_t))(v19 + 16))(v9, v13, v7);
  sub_1DAE0C804();
  sub_1DAE0C768();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(v12 + 56))(v20, 1, 1, v18);
  swift_bridgeObjectRetain();
  v14 = v22;
  sub_1DAE0C678();
  v15 = sub_1DAE0C684();
  (*(void (**)(char *, _QWORD, uint64_t, uint64_t))(*(_QWORD *)(v15 - 8) + 56))(v14, 0, 1, v15);
  return sub_1DAE0C690();
}

uint64_t sub_1DAE057B0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = a2;
  return swift_task_switch();
}

uint64_t sub_1DAE057C8()
{
  _QWORD *v0;

  sub_1DAE0C45C();
  v0[5] = v0[2];
  sub_1DAE0D62C();
  v0[6] = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE05844()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t ObjectType;
  unint64_t v5;
  uint64_t v6;
  _QWORD *v7;
  _BYTE *v9;

  v1 = *(_QWORD *)(v0 + 40);
  swift_release();
  v2 = v1 + OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate;
  if (MEMORY[0x1DF0A8C44](v2))
  {
    v3 = *(_QWORD *)(v2 + 8);
    ObjectType = swift_getObjectType();
    v5 = (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 24))(ObjectType, v3);
    swift_unknownObjectRelease();
  }
  else
  {
    v5 = MEMORY[0x1E0DEE9D8];
  }
  v6 = *(_QWORD *)(v0 + 24);
  swift_bridgeObjectRetain();
  v7 = sub_1DAE06B24(v6, v5);
  swift_bridgeObjectRelease_n();
  if (v7[2])
  {

    return (*(uint64_t (**)(_QWORD *))(v0 + 8))(v7);
  }
  else
  {
    swift_bridgeObjectRelease();
    sub_1DADDA2D0();
    *(_QWORD *)(v0 + 56) = swift_allocError();
    *v9 = 2;
    swift_willThrow();
    return swift_task_switch();
  }
}

uint64_t sub_1DAE0596C(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v4;
  _QWORD *v5;

  v4 = *v1;
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADEE848;
  v5[3] = a1;
  v5[4] = v4;
  return swift_task_switch();
}

uint64_t sub_1DAE059D0(uint64_t a1)
{
  uint64_t *v1;
  uint64_t v2;
  uint64_t v3;

  v3 = *v1;
  *(_QWORD *)(v2 + 24) = a1;
  *(_QWORD *)(v2 + 32) = v3;
  return swift_task_switch();
}

uint64_t sub_1DAE059EC()
{
  _QWORD *v0;
  _QWORD *v1;
  uint64_t (__cdecl *v3)();

  sub_1DAE0C45C();
  v0[5] = v0[2];
  v3 = (uint64_t (__cdecl *)())((char *)&dword_1F029E708 + dword_1F029E708);
  v1 = (_QWORD *)swift_task_alloc();
  v0[6] = v1;
  *v1 = v0;
  v1[1] = sub_1DADEE924;
  return v3();
}

unint64_t sub_1DAE05A5C()
{
  unint64_t result;

  result = qword_1F029E6C8;
  if (!qword_1F029E6C8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F760, &type metadata for SearchUIContinuationEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029E6C8);
  }
  return result;
}

unint64_t sub_1DAE05AA8()
{
  unint64_t result;
  uint64_t v1;
  unint64_t v2;

  result = qword_1F029E6D0;
  if (!qword_1F029E6D0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(qword_1F029E6D8);
    v2 = sub_1DAE00A04();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0C91CE0], v1, &v2);
    atomic_store(result, (unint64_t *)&qword_1F029E6D0);
  }
  return result;
}

uint64_t sub_1DAE05B0C()
{
  uint64_t v0;
  _QWORD *v1;

  v1 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v0 + 16) = v1;
  sub_1DAE061EC();
  *v1 = v0;
  v1[1] = sub_1DADDA484;
  return sub_1DAE0C4EC();
}

uint64_t destroy for SearchUIContinuationEntity()
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_release();
  return swift_release();
}

_QWORD *initializeWithCopy for SearchUIContinuationEntity(_QWORD *a1, _QWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2[1];
  *a1 = *a2;
  a1[1] = v3;
  v4 = a2[3];
  a1[2] = a2[2];
  a1[3] = v4;
  v5 = a2[5];
  a1[4] = a2[4];
  a1[5] = v5;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DAE0C564();
  sub_1DAE0C564();
  return a1;
}

_QWORD *assignWithCopy for SearchUIContinuationEntity(_QWORD *a1, _QWORD *a2)
{
  *a1 = *a2;
  a1[1] = a2[1];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[2] = a2[2];
  a1[3] = a2[3];
  swift_bridgeObjectRetain();
  swift_bridgeObjectRelease();
  a1[4] = a2[4];
  sub_1DAE0C564();
  swift_release();
  a1[5] = a2[5];
  sub_1DAE0C564();
  swift_release();
  return a1;
}

uint64_t assignWithTake for SearchUIContinuationEntity(uint64_t a1, uint64_t a2)
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
  *(_QWORD *)(a1 + 40) = *(_QWORD *)(a2 + 40);
  swift_release();
  return a1;
}

uint64_t getEnumTagSinglePayload for SearchUIContinuationEntity(uint64_t a1, int a2)
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

uint64_t storeEnumTagSinglePayload for SearchUIContinuationEntity(uint64_t result, int a2, int a3)
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

ValueMetadata *type metadata accessor for SearchUIContinuationEntity()
{
  return &type metadata for SearchUIContinuationEntity;
}

ValueMetadata *type metadata accessor for SearchUIContinuationEntity.Query()
{
  return &type metadata for SearchUIContinuationEntity.Query;
}

BOOL sub_1DAE05DC0(void *a1)
{
  id v1;
  void *v2;
  id v3;
  _BOOL8 v4;

  v1 = objc_msgSend(a1, sel_cardSection);
  if (v1)
  {
    v2 = v1;
    v3 = objc_msgSend(v1, sel_command);

    if (!v3)
    {
LABEL_5:
      v1 = 0;
      goto LABEL_6;
    }
    objc_opt_self();
    v1 = (id)swift_dynamicCastObjCClass();
    if (!v1)
    {

      goto LABEL_5;
    }
  }
LABEL_6:
  v4 = v1 != 0;

  return v4;
}

uint64_t sub_1DAE05E48@<X0>(_QWORD *a1@<X8>)
{
  if (qword_1F029D6E8 != -1)
    swift_once();
  *a1 = qword_1F02A0418;
  return sub_1DAE0C564();
}

uint64_t sub_1DAE05E98@<X0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  uint64_t v3;

  if (qword_1F029D6F0 != -1)
    swift_once();
  v2 = sub_1DAE0C714();
  v3 = __swift_project_value_buffer(v2, (uint64_t)qword_1F02A0420);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v2 - 8) + 16))(a1, v3, v2);
}

uint64_t sub_1DAE05F08()
{
  sub_1DADDDE3C();
  return sub_1DAE0C4A4();
}

uint64_t sub_1DAE05F44()
{
  sub_1DAE05FC8();
  return sub_1DAE0C720();
}

unint64_t sub_1DAE05F80()
{
  unint64_t result;

  result = qword_1ED4D4510;
  if (!qword_1ED4D4510)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F7A4, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4510);
  }
  return result;
}

unint64_t sub_1DAE05FC8()
{
  unint64_t result;

  result = qword_1ED4D4508;
  if (!qword_1ED4D4508)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F7CC, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4508);
  }
  return result;
}

unint64_t sub_1DAE06010()
{
  unint64_t result;

  result = qword_1ED4D4500;
  if (!qword_1ED4D4500)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F7FC, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4500);
  }
  return result;
}

unint64_t sub_1DAE06058()
{
  unint64_t result;

  result = qword_1ED4D44F8;
  if (!qword_1ED4D44F8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F824, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44F8);
  }
  return result;
}

unint64_t sub_1DAE0609C(uint64_t a1)
{
  unint64_t result;

  result = sub_1DADDDE3C();
  *(_QWORD *)(a1 + 8) = result;
  return result;
}

unint64_t sub_1DAE060C4()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029E6F0;
  if (!qword_1F029E6F0)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029E6F8);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0C91998], v1);
    atomic_store(result, (unint64_t *)&qword_1F029E6F0);
  }
  return result;
}

unint64_t sub_1DAE06114()
{
  unint64_t result;

  result = qword_1ED4D44D8;
  if (!qword_1ED4D44D8)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F8B4, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44D8);
  }
  return result;
}

unint64_t sub_1DAE0615C()
{
  unint64_t result;

  result = qword_1ED4D44F0;
  if (!qword_1ED4D44F0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F884, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44F0);
  }
  return result;
}

unint64_t sub_1DAE061A4()
{
  unint64_t result;

  result = qword_1ED4D4518;
  if (!qword_1ED4D4518)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F84C, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4518);
  }
  return result;
}

unint64_t sub_1DAE061EC()
{
  unint64_t result;

  result = qword_1F029E700;
  if (!qword_1F029E700)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F680, &type metadata for SearchUIContinuationEntity.Query);
    atomic_store(result, (unint64_t *)&qword_1F029E700);
  }
  return result;
}

_QWORD *sub_1DAE06230(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E730);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 40);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[5 * v8 + 4])
          memmove(v12, a4 + 4, 40 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1DAE06474(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

_QWORD *sub_1DAE06350(_QWORD *result, int64_t a2, char a3, _QWORD *a4)
{
  char v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  size_t v11;
  _QWORD *v12;

  v5 = (char)result;
  if ((a3 & 1) == 0)
  {
    v7 = a2;
    goto LABEL_8;
  }
  v6 = a4[3];
  v7 = v6 >> 1;
  if ((uint64_t)(v6 >> 1) >= a2)
    goto LABEL_8;
  if (v7 + 0x4000000000000000 >= 0)
  {
    v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
    if ((uint64_t)(v6 & 0xFFFFFFFFFFFFFFFELL) <= a2)
      v7 = a2;
LABEL_8:
    v8 = a4[2];
    if (v7 <= v8)
      v9 = a4[2];
    else
      v9 = v7;
    if (v9)
    {
      __swift_instantiateConcreteTypeFromMangledName(&qword_1F029E718);
      v10 = (_QWORD *)swift_allocObject();
      v11 = _swift_stdlib_malloc_size(v10);
      v10[2] = v8;
      v10[3] = 2 * ((uint64_t)(v11 - 32) / 48);
      v12 = v10 + 4;
      if ((v5 & 1) != 0)
      {
LABEL_13:
        if (v10 != a4 || v12 >= &a4[6 * v8 + 4])
          memmove(v12, a4 + 4, 48 * v8);
        a4[2] = 0;
        goto LABEL_22;
      }
    }
    else
    {
      v10 = (_QWORD *)MEMORY[0x1E0DEE9D8];
      v12 = (_QWORD *)(MEMORY[0x1E0DEE9D8] + 32);
      if ((result & 1) != 0)
        goto LABEL_13;
    }
    sub_1DAE06A30(0, v8, (unint64_t)v12, (uint64_t)a4);
LABEL_22:
    swift_bridgeObjectRelease();
    return v10;
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE06474(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 40 * a1 + 32;
    v6 = a3 + 40 * v4;
    if (v5 >= v6 || v5 + 40 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1DAE0D860();
  __break(1u);
  return result;
}

void sub_1DAE06568(void *a1@<X0>, uint64_t *a2@<X8>)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  uint64_t v12;
  void (*v13)(char *, uint64_t, uint64_t);
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v45 = a2;
  v3 = sub_1DAE0C810();
  MEMORY[0x1E0C80A78](v3);
  v4 = sub_1DAE0C744();
  v5 = *(_QWORD *)(v4 - 8);
  MEMORY[0x1E0C80A78](v4);
  v7 = (char *)&v41 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = sub_1DAE0D524();
  MEMORY[0x1E0C80A78](v8);
  v9 = sub_1DAE0C75C();
  MEMORY[0x1E0C80A78](v9);
  v11 = (char *)&v41 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029DFE0);
  sub_1DAE0D4DC();
  if (qword_1F029D6E0 != -1)
    swift_once();
  v12 = __swift_project_value_buffer(v4, (uint64_t)qword_1F02A0400);
  v13 = *(void (**)(char *, uint64_t, uint64_t))(v5 + 16);
  v13(v7, v12, v4);
  sub_1DAE0C804();
  sub_1DAE0C768();
  v14 = MEMORY[0x1DF0A6C58](v11);
  sub_1DAE0C564();
  sub_1DAE0D4DC();
  v13(v7, v12, v4);
  sub_1DAE0C804();
  sub_1DAE0C768();
  v15 = MEMORY[0x1DF0A6C58](v11);
  sub_1DAE0C564();
  v16 = objc_msgSend(a1, sel_itemIdentifier);
  if (!v16)
  {
    __break(1u);
    goto LABEL_16;
  }
  v17 = v16;
  v18 = sub_1DAE0D53C();
  v20 = v19;

  swift_bridgeObjectRetain();
  v21 = objc_msgSend(a1, sel_cardSection);
  if (!v21)
  {
LABEL_16:
    __break(1u);
    goto LABEL_17;
  }
  v22 = v21;
  v23 = objc_msgSend(v21, sel_command);

  if (!v23)
  {
LABEL_12:

    swift_release_n();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    v39 = 0;
    v20 = 0;
    v28 = 0;
    v30 = 0;
    v14 = 0;
    v15 = 0;
    goto LABEL_13;
  }
  objc_opt_self();
  v24 = (void *)swift_dynamicCastObjCClass();
  if (!v24
    || (v25 = v24, (v26 = objc_msgSend(v24, sel_applicationBundleIdentifier)) == 0))
  {

    goto LABEL_12;
  }
  v27 = v26;
  v28 = sub_1DAE0D53C();
  v30 = v29;
  v31 = objc_msgSend(v25, sel_searchString);
  if (!v31)
  {
    swift_bridgeObjectRelease();

    goto LABEL_12;
  }
  v32 = v31;
  v44 = v18;
  v33 = sub_1DAE0D53C();
  v42 = v34;
  v43 = v33;

  swift_bridgeObjectRetain_n();
  sub_1DAE0C564();
  sub_1DAE0C564();
  swift_bridgeObjectRetain();
  v35 = (id)SSAppNameForBundleId();

  if (v35)
  {
    v36 = sub_1DAE0D53C();
    v38 = v37;

    v46 = v36;
    v47 = v38;
    sub_1DAE0C51C();
    swift_release();
    swift_release();
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
    v46 = v43;
    v47 = v42;
    sub_1DAE0C564();
    sub_1DAE0C564();
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    sub_1DAE0C51C();

    swift_release();
    swift_release_n();
    swift_bridgeObjectRelease_n();
    swift_bridgeObjectRelease_n();

    swift_release();
    v39 = v44;
LABEL_13:
    v40 = v45;
    *v45 = v39;
    v40[1] = v20;
    v40[2] = v28;
    v40[3] = v30;
    v40[4] = v14;
    v40[5] = v15;
    return;
  }
LABEL_17:
  __break(1u);
}

uint64_t sub_1DAE06A30(uint64_t a1, uint64_t a2, unint64_t a3, uint64_t a4)
{
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  uint64_t result;

  v4 = a2 - a1;
  if (__OFSUB__(a2, a1))
  {
    __break(1u);
  }
  else if ((v4 & 0x8000000000000000) == 0)
  {
    v5 = a4 + 48 * a1 + 32;
    v6 = a3 + 48 * v4;
    if (v5 >= v6 || v5 + 48 * v4 <= a3)
    {
      swift_arrayInitWithCopy();
      return v6;
    }
  }
  result = sub_1DAE0D860();
  __break(1u);
  return result;
}

_QWORD *sub_1DAE06B24(uint64_t a1, unint64_t a2)
{
  unint64_t v2;
  uint64_t v3;
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  _QWORD *result;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  BOOL v17;
  char v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _QWORD *v25;
  unint64_t v26;
  unint64_t v27;
  _QWORD *v28;
  uint64_t v29;
  _QWORD *v30;
  unint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  unint64_t v35;
  uint64_t v36[6];
  _BYTE v37[8];
  uint64_t v38;
  unint64_t v39;

  v33 = *(_QWORD *)(a1 + 16);
  if (!v33)
    return (_QWORD *)MEMORY[0x1E0DEE9D8];
  v2 = a2;
  v32 = a1 + 32;
  v29 = a2 & 0xFFFFFFFFFFFFFF8;
  v35 = a2 & 0xC000000000000001;
  swift_bridgeObjectRetain();
  v3 = 0;
  v30 = (_QWORD *)MEMORY[0x1E0DEE9D8];
  v31 = v2 >> 62;
  v39 = v2;
  while (1)
  {
    v4 = (uint64_t *)(v32 + 16 * v3);
    v6 = *v4;
    v5 = v4[1];
    if (v31)
      break;
    v7 = *(_QWORD *)(v29 + 16);
    swift_bridgeObjectRetain();
    swift_bridgeObjectRetain();
    if (v7)
      goto LABEL_9;
LABEL_3:
    swift_bridgeObjectRelease();
    swift_bridgeObjectRelease();
LABEL_4:
    if (++v3 == v33)
    {
      swift_bridgeObjectRelease();
      return v30;
    }
  }
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  v7 = sub_1DAE0D83C();
  if (!v7)
    goto LABEL_3;
LABEL_9:
  v34 = v3;
  v8 = 4;
  while (1)
  {
    result = v35 ? (_QWORD *)MEMORY[0x1DF0A7ED0](v8 - 4, v2) : *(id *)(v2 + 8 * v8);
    v10 = result;
    v11 = v8 - 3;
    if (__OFADD__(v8 - 4, 1))
      break;
    v12 = objc_msgSend(result, sel_itemIdentifier);
    if (v12)
    {
      v13 = v12;
      v14 = sub_1DAE0D53C();
      v16 = v15;

      v17 = v14 == v6 && v16 == v5;
      if (v17)
      {
        v2 = v39;
        swift_bridgeObjectRelease();
        goto LABEL_24;
      }
      v18 = sub_1DAE0D8A8();
      swift_bridgeObjectRelease();
      if ((v18 & 1) != 0)
      {
        v2 = v39;
LABEL_24:
        swift_bridgeObjectRelease();
        sub_1DAE06568(v10, v36);
        v19 = v36[0];
        v20 = v36[1];
        v21 = v36[2];
        v22 = v36[3];
        v23 = v36[4];
        v24 = v36[5];
        swift_bridgeObjectRelease();
        sub_1DADE9D90((uint64_t)v36, (uint64_t)v37, &qword_1F029E710);
        if (v38)
        {
          v25 = v30;
          if ((swift_isUniquelyReferenced_nonNull_native() & 1) == 0)
            v25 = sub_1DAE06350(0, v30[2] + 1, 1, v30);
          v27 = v25[2];
          v26 = v25[3];
          v30 = v25;
          if (v27 >= v26 >> 1)
            v30 = sub_1DAE06350((_QWORD *)(v26 > 1), v27 + 1, 1, v25);
          v30[2] = v27 + 1;
          v28 = &v30[6 * v27];
          v28[4] = v19;
          v28[5] = v20;
          v28[6] = v21;
          v28[7] = v22;
          v28[8] = v23;
          v28[9] = v24;
          v2 = v39;
        }
LABEL_30:
        v3 = v34;
        goto LABEL_4;
      }
    }

    ++v8;
    v17 = v11 == v7;
    v2 = v39;
    if (v17)
    {
      swift_bridgeObjectRelease();
      swift_bridgeObjectRelease();
      goto LABEL_30;
    }
  }
  __break(1u);
  return result;
}

uint64_t sub_1DAE06E00(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = sub_1DAE0D650();
  v7 = *(_QWORD *)(v6 - 8);
  if ((*(unsigned int (**)(uint64_t, uint64_t, uint64_t))(v7 + 48))(a1, 1, v6) != 1)
  {
    sub_1DAE0D644();
    (*(void (**)(uint64_t, uint64_t))(v7 + 8))(a1, v6);
    if (!*(_QWORD *)(a3 + 16))
      goto LABEL_5;
    goto LABEL_3;
  }
  sub_1DADDCC3C(a1, &qword_1ED4D4410);
  if (*(_QWORD *)(a3 + 16))
  {
LABEL_3:
    swift_getObjectType();
    swift_unknownObjectRetain();
    sub_1DAE0D608();
    swift_unknownObjectRelease();
  }
LABEL_5:
  v8 = swift_allocObject();
  *(_QWORD *)(v8 + 16) = a2;
  *(_QWORD *)(v8 + 24) = a3;
  return swift_task_create();
}

uint64_t sub_1DAE06F4C(uint64_t a1)
{
  uint64_t v2;
  uint64_t AssociatedTypeWitness;
  uint64_t v4;
  uint64_t v5;
  char *v6;
  uint64_t v8;

  v2 = sub_1DAE0C498();
  MEMORY[0x1E0C80A78](v2);
  AssociatedTypeWitness = swift_getAssociatedTypeWitness();
  v4 = *(_QWORD *)(AssociatedTypeWitness - 8);
  MEMORY[0x1E0C80A78](AssociatedTypeWitness);
  v6 = (char *)&v8 - v5;
  sub_1DAE0C9FC();
  (*(void (**)(char *, uint64_t, uint64_t))(v4 + 16))(v6, a1, AssociatedTypeWitness);
  sub_1DAE07064();
  return sub_1DAE0C9F0();
}

uint64_t sub_1DAE07064()
{
  sub_1DAE0C498();
  sub_1DAE07930();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1F029B0F0);
  sub_1DAE07978();
  return sub_1DAE0D734();
}

unint64_t sub_1DAE070E0()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t result;

  __swift_instantiateConcreteTypeFromMangledName(qword_1ED4D4530);
  v0 = swift_allocObject();
  *(_OWORD *)(v0 + 16) = xmmword_1DAE1EA70;
  v1 = sub_1DAE079C4();
  *(_QWORD *)(v0 + 32) = &type metadata for SearchUIContinuationEntity;
  *(_QWORD *)(v0 + 40) = v1;
  result = sub_1DAE07A08();
  *(_QWORD *)(v0 + 48) = &type metadata for SearchUIKnowledgeEntity;
  *(_QWORD *)(v0 + 56) = result;
  off_1ED4D4528 = (_UNKNOWN *)v0;
  return result;
}

uint64_t sub_1DAE071CC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  *(_QWORD *)(v4 + 72) = a4;
  sub_1DAE0D62C();
  *(_QWORD *)(v4 + 80) = sub_1DAE0D620();
  sub_1DAE0D608();
  return swift_task_switch();
}

uint64_t sub_1DAE07238()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;

  v1 = *(void **)(v0 + 72);
  swift_release();
  sub_1DAE0C48C();
  sub_1DAE0C480();
  *(_QWORD *)(v0 + 56) = type metadata accessor for SearchUIAppIntentRunner();
  __swift_instantiateConcreteTypeFromMangledName(&qword_1ED4D4450);
  *(_QWORD *)(v0 + 56) = sub_1DAE0D548();
  *(_QWORD *)(v0 + 64) = v2;
  sub_1DAE0D740();
  *(_QWORD *)(swift_allocObject() + 16) = v1;
  v3 = v1;
  sub_1DAE0C474();
  swift_release();
  swift_release();
  sub_1DADDCC3C(v0 + 16, &qword_1ED4D4480);
  return (*(uint64_t (**)(void))(v0 + 8))();
}

void sub_1DAE07338(uint64_t a1@<X0>, _QWORD *a2@<X8>)
{
  uint64_t v3;
  void *v4;
  objc_class *v5;
  char *v6;
  uint64_t v7;
  _UNKNOWN **v8;
  id v9;
  objc_super v10;

  v3 = a1 + 16;
  swift_beginAccess();
  v4 = (void *)MEMORY[0x1DF0A8C44](v3);
  v5 = (objc_class *)type metadata accessor for SearchUIAppIntentRunner();
  v6 = (char *)objc_allocWithZone(v5);
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI23SearchUIAppIntentRunner_delegate + 8] = 0;
  v7 = swift_unknownObjectWeakInit();
  v8 = &off_1EA1F8DA8;
  if (!v4)
    v8 = 0;
  *(_QWORD *)(v7 + 8) = v8;
  swift_unknownObjectWeakAssign();
  v10.receiver = v6;
  v10.super_class = v5;
  v9 = objc_msgSendSuper2(&v10, sel_init);

  *a2 = v9;
}

SearchUIAppEntityAnnotator __swiftcall SearchUIAppEntityAnnotator.init()()
{
  return (SearchUIAppEntityAnnotator)objc_msgSend(objc_allocWithZone((Class)swift_getObjCClassFromMetadata()), sel_init);
}

id SearchUIAppEntityAnnotator.init()()
{
  objc_super v1;

  v1.super_class = (Class)SearchUIAppEntityAnnotator;
  return objc_msgSendSuper2(&v1, sel_init);
}

unint64_t type metadata accessor for SearchUIAppEntityAnnotator()
{
  unint64_t result;

  result = qword_1F029E738;
  if (!qword_1F029E738)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, &qword_1F029E738);
  }
  return result;
}

uint64_t sub_1DAE075FC()
{
  uint64_t v0;

  swift_unknownObjectRelease();

  return swift_deallocObject();
}

uint64_t sub_1DAE07628(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD *v7;

  v4 = v1[2];
  v5 = v1[3];
  v6 = v1[4];
  v7 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v7;
  *v7 = v2;
  v7[1] = sub_1DADDA484;
  return sub_1DAE071CC(a1, v4, v5, v6);
}

uint64_t sub_1DAE07694()
{
  swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAE076B8(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  int *v4;
  _QWORD *v5;

  v4 = *(int **)(v1 + 16);
  v5 = (_QWORD *)swift_task_alloc();
  *(_QWORD *)(v2 + 16) = v5;
  *v5 = v2;
  v5[1] = sub_1DADDA484;
  return ((uint64_t (*)(uint64_t, int *))((char *)&dword_1F029E750 + dword_1F029E750))(a1, v4);
}

uint64_t sub_1DAE07728()
{
  uint64_t v0;

  return swift_deallocObject();
}

void (*sub_1DAE0774C())(_QWORD *a1@<X8>)
{
  swift_allocObject();
  swift_unknownObjectWeakInit();
  return sub_1DAE077BC;
}

uint64_t sub_1DAE07798()
{
  swift_unknownObjectWeakDestroy();
  return swift_deallocObject();
}

void sub_1DAE077BC(_QWORD *a1@<X8>)
{
  uint64_t v1;

  sub_1DAE07338(v1, a1);
}

uint64_t sub_1DAE077D4(uint64_t a1, void *a2)
{
  uint64_t result;
  char *v4;
  uint64_t v5;
  _QWORD *i;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[2];

  result = (uint64_t)objc_msgSend((id)objc_opt_self(), sel_isAppIntentsSupportEnabled);
  if ((_DWORD)result)
  {
    result = (uint64_t)objc_msgSend(a2, sel_allowsAppEntityAnnotation);
    if ((_DWORD)result)
    {
      if (qword_1ED4D4418 != -1)
        swift_once();
      v4 = (char *)off_1ED4D4528;
      v5 = *((_QWORD *)off_1ED4D4528 + 2);
      if (v5)
      {
        swift_bridgeObjectRetain();
        for (i = v4 + 40;
              ((*(uint64_t (**)(void *, _QWORD, _QWORD))(*i + 24))(a2, *(i - 1), *i) & 1) == 0;
              i += 2)
        {
          if (!--v5)
          {
            swift_bridgeObjectRelease();
            return 0;
          }
        }
        swift_bridgeObjectRelease();
        result = (uint64_t)objc_msgSend(a2, sel_itemIdentifier);
        if (result)
        {
          v7 = (void *)result;
          v8 = sub_1DAE0D53C();
          v10 = v9;

          v12[0] = v8;
          v12[1] = v10;
          v11 = (void *)sub_1DAE06F4C((uint64_t)v12);
          swift_bridgeObjectRelease();
          sub_1DAE0D6F8();

          return 1;
        }
        else
        {
          __break(1u);
        }
      }
      else
      {
        return 0;
      }
    }
  }
  return result;
}

unint64_t sub_1DAE07930()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B340;
  if (!qword_1F029B340)
  {
    v1 = sub_1DAE0C498();
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0C904C0], v1);
    atomic_store(result, (unint64_t *)&qword_1F029B340);
  }
  return result;
}

unint64_t sub_1DAE07978()
{
  unint64_t result;
  uint64_t v1;

  result = qword_1F029B488;
  if (!qword_1F029B488)
  {
    v1 = __swift_instantiateConcreteTypeFromMangledNameAbstract(&qword_1F029B0F0);
    result = MEMORY[0x1DF0A8B00](MEMORY[0x1E0DEAF38], v1);
    atomic_store(result, (unint64_t *)&qword_1F029B488);
  }
  return result;
}

unint64_t sub_1DAE079C4()
{
  unint64_t result;

  result = qword_1ED4D4520;
  if (!qword_1ED4D4520)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1F8EC, &type metadata for SearchUIContinuationEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D4520);
  }
  return result;
}

unint64_t sub_1DAE07A08()
{
  unint64_t result;

  result = qword_1ED4D44D0;
  if (!qword_1ED4D44D0)
  {
    result = MEMORY[0x1DF0A8B00](&unk_1DAE1E998, &type metadata for SearchUIKnowledgeEntity);
    atomic_store(result, (unint64_t *)&qword_1ED4D44D0);
  }
  return result;
}

uint64_t sub_1DAE07A4C(char a1, uint64_t a2)
{
  return (*(uint64_t (**)(uint64_t, _QWORD))(a2 + 16))(a2, a1 & 1);
}

double sub_1DAE07AA4()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1DAE07B38(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1DAE07B88())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1DAE07C10()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1DAE07CA4(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1DAE07CF4())()
{
  swift_beginAccess();
  return j__swift_endAccess;
}

id sub_1DAE07DD0()
{
  uint64_t v0;
  id v1;
  double *v2;

  v1 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2710]), sel_init);
  v2 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  objc_msgSend(v1, sel_setDuration_, *v2);
  return v1;
}

id sub_1DAE07EFC()
{
  uint64_t v0;
  double *v1;
  double v2;
  id v3;
  id v4;

  v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
  swift_beginAccess();
  v2 = *v1;
  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC36D8]), sel_initWithAnimationCurve_, 0);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v3, v2);

  return v4;
}

void SearchUIBasicAnimationSettings.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchUIBasicAnimationSettings.__deallocating_deinit()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIBasicAnimationSettings);
}

uint64_t type metadata accessor for SearchUIBasicAnimationSettings()
{
  return objc_opt_self();
}

id static SearchUISpringAnimationSettings.buttonSelection.getter()
{
  objc_class *v0;
  char *v1;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v1 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FD96F0068DB8BACLL;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

uint64_t type metadata accessor for SearchUISpringAnimationSettings()
{
  return objc_opt_self();
}

id static SearchUISpringAnimationSettings.buttonSelectionCancel.getter()
{
  objc_class *v0;
  char *v1;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v1 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FD78D4FDF3B645ALL;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FE06A7EF9DB22D1;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

id static SearchUISpringAnimationSettings.buttonIconAppear.getter()
{
  objc_class *v0;
  char *v1;
  objc_super v3;

  v0 = (objc_class *)type metadata accessor for SearchUISpringAnimationSettings();
  v1 = (char *)objc_allocWithZone(v0);
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay] = 0;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce] = 0x3FDC6F694467381DLL;
  *(_QWORD *)&v1[OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration] = 0x3FDE147AE147AE14;
  v3.receiver = v1;
  v3.super_class = v0;
  return objc_msgSendSuper2(&v3, sel_init);
}

double sub_1DAE08394()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1DAE08428(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1DAE08478())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1DAE08500()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1DAE08594(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1DAE085E4())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

double sub_1DAE0866C()
{
  uint64_t v0;
  uint64_t v1;

  v1 = v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay;
  swift_beginAccess();
  return *(double *)v1;
}

uint64_t sub_1DAE08700(double a1)
{
  uint64_t v1;
  double *v3;
  uint64_t result;

  v3 = (double *)(v1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
  result = swift_beginAccess();
  *v3 = a1;
  return result;
}

uint64_t (*sub_1DAE08750())()
{
  swift_beginAccess();
  return j_j__swift_endAccess;
}

id sub_1DAE08828()
{
  uint64_t v0;
  double *v1;
  double v2;
  double *v3;

  v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  v2 = *v1;
  v3 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  return objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2848]), sel_initWithPerceptualDuration_bounce_, v2, *v3);
}

id sub_1DAE08998()
{
  uint64_t v0;
  double *v1;
  double v2;
  double *v3;
  id v4;
  id v5;

  v1 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
  swift_beginAccess();
  v2 = *v1;
  v3 = (double *)(v0 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3CA0]), sel_initWithDuration_bounce_, v2, *v3);
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0DC3F38]), sel_initWithDuration_timingParameters_, v4, 0.0);

  return v5;
}

void SearchUISpringAnimationSettings.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchUISpringAnimationSettings.__deallocating_deinit()
{
  return sub_1DADE53F0(type metadata accessor for SearchUISpringAnimationSettings);
}

id sub_1DAE08B34(void *a1)
{
  uint64_t v1;
  id v2;
  void *v3;

  v2 = objc_msgSend(a1, sel_coreAnimation);
  swift_bridgeObjectRetain();
  v3 = (void *)sub_1DAE0D530();
  swift_bridgeObjectRelease();
  objc_msgSend(v2, sel_setKeyPath_, v3);

  objc_msgSend(v2, sel_setFromValue_, *(_QWORD *)(v1 + OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue));
  objc_msgSend(v2, sel_setToValue_, *(_QWORD *)(v1 + OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue));
  return v2;
}

void SearchUIBasicLayerAnimation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchUIBasicLayerAnimation.__deallocating_deinit()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIBasicLayerAnimation);
}

uint64_t sub_1DAE08CB4(uint64_t a1)
{
  id v2;
  unint64_t v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t result;
  uint64_t v9;
  double v10;
  id v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CD2700]), sel_init);
  swift_unknownObjectRetain();
  v3 = swift_bridgeObjectRetain();
  v4 = sub_1DAE09854(v3, a1);
  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
  sub_1DAE099B8();
  v5 = (void *)sub_1DAE0D5C0();
  objc_msgSend(v2, sel_setAnimations_, v5);

  if (!(v4 >> 62))
  {
    v6 = *(_QWORD *)((v4 & 0xFFFFFFFFFFFFF8) + 0x10);
    v7 = v2;
    result = swift_bridgeObjectRetain();
    if (v6)
      goto LABEL_3;
LABEL_12:
    v10 = 0.0;
LABEL_13:
    swift_bridgeObjectRelease_n();
    objc_msgSend(v2, sel_setDuration_, v10);

    return (uint64_t)v2;
  }
  v15 = v2;
  swift_bridgeObjectRetain();
  result = sub_1DAE0D83C();
  v6 = result;
  if (!result)
    goto LABEL_12;
LABEL_3:
  if (v6 >= 1)
  {
    v9 = 0;
    v10 = 0.0;
    do
    {
      if ((v4 & 0xC000000000000001) != 0)
        v11 = (id)MEMORY[0x1DF0A7ED0](v9, v4);
      else
        v11 = *(id *)(v4 + 8 * v9 + 32);
      v12 = v11;
      objc_msgSend(v11, sel_duration);
      v14 = v13;

      if (v10 <= v14)
        v10 = v14;
      ++v9;
    }
    while (v6 != v9);
    goto LABEL_13;
  }
  __break(1u);
  return result;
}

id sub_1DAE08E6C(void *a1, uint64_t a2, uint64_t a3, uint64_t (*a4)(uint64_t))
{
  id v7;
  void *v8;

  swift_unknownObjectRetain();
  v7 = a1;
  v8 = (void *)a4(a3);
  swift_unknownObjectRelease();

  return v8;
}

void SearchUIGroupedLayerAnimation.init()()
{
  _swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
}

id SearchUIGroupedLayerAnimation.__deallocating_deinit()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIGroupedLayerAnimation);
}

void static SearchUIAnimator.animate(layer:with:key:animations:delegate:)(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  objc_class *v10;
  char *v11;
  id v12;
  void *v13;
  void *v14;
  objc_super v15;

  v10 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  v11 = (char *)objc_allocWithZone(v10);
  *(_QWORD *)&v11[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = a5;
  v15.receiver = v11;
  v15.super_class = v10;
  swift_bridgeObjectRetain();
  v12 = objc_msgSendSuper2(&v15, sel_init);
  v13 = (void *)sub_1DAE08CB4(a2);
  objc_msgSend(v13, sel_setDelegate_, a6, v15.receiver, v15.super_class);
  v14 = (void *)sub_1DAE0D530();
  objc_msgSend(a1, sel_addAnimation_forKey_, v13, v14);

}

uint64_t sub_1DAE09154(uint64_t a1)
{
  void (*v1)(uint64_t);
  uint64_t v2;

  v1 = *(void (**)(uint64_t))(a1 + 32);
  v2 = sub_1DAE0C564();
  v1(v2);
  return swift_release();
}

uint64_t sub_1DAE09180(uint64_t a1, uint64_t a2)
{
  void (*v3)(uint64_t);

  v3 = *(void (**)(uint64_t))(a1 + 32);
  sub_1DAE0C564();
  v3(a2);
  return swift_release();
}

id SearchUIAnimator.__allocating_init()()
{
  objc_class *v0;

  return objc_msgSend(objc_allocWithZone(v0), sel_init);
}

id SearchUIAnimator.init()()
{
  void *v0;
  objc_super v2;

  v2.receiver = v0;
  v2.super_class = (Class)type metadata accessor for SearchUIAnimator();
  return objc_msgSendSuper2(&v2, sel_init);
}

id SearchUIAnimator.__deallocating_deinit()
{
  return sub_1DADE53F0(type metadata accessor for SearchUIAnimator);
}

id _s8SearchUI0A21UIBasicLayerAnimationC7opacity4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3;
  id v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v7 = 0x7974696361706FLL;
  *((_QWORD *)v7 + 1) = 0xE700000000000000;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC4blur4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3;
  id v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v7 = 0xD000000000000020;
  *((_QWORD *)v7 + 1) = 0x80000001DAE243D0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC13verticalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3;
  id v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v7 = 0xD000000000000011;
  *((_QWORD *)v7 + 1) = 0x80000001DAE24390;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC15horizontalScale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  id v3;
  id v4;
  objc_class *v5;
  char *v6;
  char *v7;
  objc_super v9;

  v3 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v4 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v5 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  v6 = (char *)objc_allocWithZone(v5);
  v7 = &v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v7 = 0xD000000000000011;
  *((_QWORD *)v7 + 1) = 0x80000001DAE243B0;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v3;
  *(_QWORD *)&v6[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v4;
  v9.receiver = v6;
  v9.super_class = v5;
  return objc_msgSendSuper2(&v9, sel_init);
}

id _s8SearchUI0A21UIBasicLayerAnimationC5scale4from2toAA0a7UILayerE0_p12CoreGraphics7CGFloatV_AJtFZ_0(double a1, double a2)
{
  uint64_t v4;
  id v5;
  id v6;
  objc_class *v7;
  char *v8;
  char *v9;
  id v10;
  id v11;
  char *v12;
  char *v13;
  uint64_t v14;
  objc_class *v15;
  char *v16;
  objc_super v18;
  uint64_t v19;
  objc_super v20;
  objc_super v21;

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1ED4D46B0);
  v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_1DAE1F9C0;
  v5 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v6 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v7 = (objc_class *)type metadata accessor for SearchUIBasicLayerAnimation();
  v8 = (char *)objc_allocWithZone(v7);
  v9 = &v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v9 = 0xD000000000000011;
  *((_QWORD *)v9 + 1) = 0x80000001DAE24390;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v5;
  *(_QWORD *)&v8[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v6;
  v21.receiver = v8;
  v21.super_class = v7;
  *(_QWORD *)(v4 + 32) = objc_msgSendSuper2(&v21, sel_init);
  v10 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a1);
  v11 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E0CB37E8]), sel_initWithDouble_, a2);
  v12 = (char *)objc_allocWithZone(v7);
  v13 = &v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_keyPath];
  *(_QWORD *)v13 = 0xD000000000000011;
  *((_QWORD *)v13 + 1) = 0x80000001DAE243B0;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_fromValue] = v10;
  *(_QWORD *)&v12[OBJC_IVAR____TtC8SearchUI27SearchUIBasicLayerAnimation_toValue] = v11;
  v20.receiver = v12;
  v20.super_class = v7;
  *(_QWORD *)(v4 + 40) = objc_msgSendSuper2(&v20, sel_init);
  v19 = v4;
  sub_1DAE0D5D8();
  v14 = v4;
  v15 = (objc_class *)type metadata accessor for SearchUIGroupedLayerAnimation();
  v16 = (char *)objc_allocWithZone(v15);
  *(_QWORD *)&v16[OBJC_IVAR____TtC8SearchUI29SearchUIGroupedLayerAnimation_animations] = v14;
  v18.receiver = v16;
  v18.super_class = v15;
  return objc_msgSendSuper2(&v18, sel_init);
}

uint64_t type metadata accessor for SearchUIBasicLayerAnimation()
{
  return objc_opt_self();
}

uint64_t sub_1DAE09854(unint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  void *v7;
  id v8;
  uint64_t v9;

  if (a1 >> 62)
    goto LABEL_14;
  v4 = *(_QWORD *)((a1 & 0xFFFFFFFFFFFFF8) + 0x10);
  while (1)
  {
    result = MEMORY[0x1E0DEE9D8];
    if (!v4)
      break;
    v9 = MEMORY[0x1E0DEE9D8];
    result = sub_1DAE0D800();
    if (v4 < 0)
    {
      __break(1u);
      return result;
    }
    v6 = 0;
    while (v4 != v6)
    {
      if ((a1 & 0xC000000000000001) != 0)
      {
        v7 = (void *)MEMORY[0x1DF0A7ED0](v6, a1);
      }
      else
      {
        v7 = *(void **)(a1 + 8 * v6 + 32);
        swift_unknownObjectRetain();
      }
      ++v6;
      v8 = objc_msgSend(v7, sel_animationWith_, a2);
      swift_unknownObjectRelease();
      sub_1DAE0D7E8();
      sub_1DAE0D80C();
      sub_1DAE0D818();
      sub_1DAE0D7F4();
      if (v4 == v6)
        return v9;
    }
    __break(1u);
LABEL_14:
    swift_bridgeObjectRetain();
    v4 = sub_1DAE0D83C();
    swift_bridgeObjectRelease();
  }
  return result;
}

unint64_t sub_1DAE099B8()
{
  unint64_t result;

  result = qword_1F029E7A8;
  if (!qword_1F029E7A8)
  {
    objc_opt_self();
    result = swift_getObjCClassMetadata();
    atomic_store(result, (unint64_t *)&qword_1F029E7A8);
  }
  return result;
}

uint64_t type metadata accessor for SearchUIGroupedLayerAnimation()
{
  return objc_opt_self();
}

id _s8SearchUI0A10UIAnimatorC7animate4with10animations10completionSo22UIViewPropertyAnimatorCAA0A19UIAnimationSettings_p_yycySbcSgtFZ_0(void *a1, uint64_t (*a2)(uint64_t result), uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t (*v20)(uint64_t);
  uint64_t v21;

  v10 = objc_msgSend(a1, sel_propertyAnimator);
  v20 = a2;
  v21 = a3;
  v11 = MEMORY[0x1E0C809B0];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 1107296256;
  v18 = sub_1DAE09154;
  v19 = &block_descriptor_1;
  v12 = _Block_copy(&v16);
  sub_1DAE0C564();
  swift_release();
  objc_msgSend(v10, sel_addAnimations_, v12);
  _Block_release(v12);
  v13 = swift_allocObject();
  *(_QWORD *)(v13 + 16) = a4;
  *(_QWORD *)(v13 + 24) = a5;
  v20 = sub_1DAE0A01C;
  v21 = v13;
  v16 = v11;
  v17 = 1107296256;
  v18 = sub_1DAE09180;
  v19 = &block_descriptor_21;
  v14 = _Block_copy(&v16);
  sub_1DAE0A04C(a4);
  swift_release();
  objc_msgSend(v10, sel_addCompletion_, v14);
  _Block_release(v14);
  objc_msgSend(a1, sel_delay);
  objc_msgSend(v10, sel_startAnimationAfterDelay_);
  return v10;
}

uint64_t type metadata accessor for SearchUIAnimator()
{
  return objc_opt_self();
}

double sub_1DAE09BB0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration, a2);
}

uint64_t sub_1DAE09BBC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_duration);
}

double sub_1DAE09BC8@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay, a2);
}

uint64_t sub_1DAE09BD4(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI30SearchUIBasicAnimationSettings_delay);
}

double sub_1DAE09BE0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  double *v3;
  double result;

  v3 = (double *)(*a1 + OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
  swift_beginAccess();
  result = *v3;
  *a2 = *(_QWORD *)v3;
  return result;
}

uint64_t sub_1DAE09C30(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_bounce);
}

double sub_1DAE09C3C@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration, a2);
}

uint64_t sub_1DAE09C48(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_perceptualDuration);
}

double sub_1DAE09C54@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X8>)
{
  return keypath_getTm_0(a1, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay, a2);
}

double keypath_getTm_0@<D0>(_QWORD *a1@<X0>, _QWORD *a2@<X3>, _QWORD *a3@<X8>)
{
  double *v4;
  double result;

  v4 = (double *)(*a1 + *a2);
  swift_beginAccess();
  result = *v4;
  *a3 = *(_QWORD *)v4;
  return result;
}

uint64_t sub_1DAE09CAC(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4)
{
  return keypath_setTm(a1, a2, a3, a4, &OBJC_IVAR____TtC8SearchUI31SearchUISpringAnimationSettings_delay);
}

uint64_t keypath_setTm(uint64_t *a1, _QWORD *a2, uint64_t a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v5;
  _QWORD *v6;
  uint64_t result;

  v5 = *a1;
  v6 = (_QWORD *)(*a2 + *a5);
  result = swift_beginAccess();
  *v6 = v5;
  return result;
}

uint64_t method lookup function for SearchUIBasicAnimationSettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x60))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.duration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.delay.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.coreAnimation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SearchUIBasicAnimationSettings.propertyAnimator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t method lookup function for SearchUISpringAnimationSettings()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x68))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x70))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.bounce.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x80))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x88))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.perceptualDuration.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x90))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x98))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.setter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA0))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.delay.modify()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xA8))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.coreAnimation.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t dispatch thunk of SearchUISpringAnimationSettings.propertyAnimator.getter()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xC0))();
}

uint64_t method lookup function for SearchUIBasicLayerAnimation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchUIBasicLayerAnimation.animation(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0xB8))();
}

uint64_t method lookup function for SearchUIGroupedLayerAnimation()
{
  return swift_lookUpClassMethod();
}

uint64_t dispatch thunk of SearchUIGroupedLayerAnimation.animation(with:)()
{
  _QWORD *v0;

  return (*(uint64_t (**)(void))((*MEMORY[0x1E0DEEDD8] & *v0) + 0x78))();
}

uint64_t sub_1DAE09F84()
{
  uint64_t v0;

  _Block_release(*(const void **)(v0 + 16));
  return swift_deallocObject();
}

uint64_t sub_1DAE09FA8()
{
  uint64_t v0;

  return (*(uint64_t (**)(void))(*(_QWORD *)(v0 + 16) + 16))();
}

uint64_t sub_1DAE09FB4(uint64_t result)
{
  if (result)
    return swift_release();
  return result;
}

uint64_t sub_1DAE09FC4(char a1)
{
  uint64_t v1;

  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(v1 + 16) + 16))(*(_QWORD *)(v1 + 16), a1 & 1);
}

uint64_t block_copy_helper_0(uint64_t a1, uint64_t a2)
{
  uint64_t v2;

  v2 = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a1 + 32) = *(_QWORD *)(a2 + 32);
  *(_QWORD *)(a1 + 40) = v2;
  return sub_1DAE0C564();
}

uint64_t block_destroy_helper_0()
{
  return swift_release();
}

uint64_t sub_1DAE09FF0()
{
  uint64_t v0;

  if (*(_QWORD *)(v0 + 16))
    swift_release();
  return swift_deallocObject();
}

uint64_t sub_1DAE0A01C(uint64_t result)
{
  uint64_t v1;
  uint64_t (*v2)(BOOL);

  v2 = *(uint64_t (**)(BOOL))(v1 + 16);
  if (v2)
    return v2(result == 0);
  return result;
}

uint64_t sub_1DAE0A04C(uint64_t result)
{
  if (result)
    return sub_1DAE0C564();
  return result;
}

uint64_t sub_1DAE0A07C()
{
  return swift_deallocClassInstance();
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
}

uint64_t __getMTAlarmManagerClass_block_invoke_cold_1()
{
  NSObject *v0;

  v0 = abort_report_np();
  return -[SearchUILeadingTrailingSectionModel copyWithRowModels:].cold.1(v0);
}

uint64_t __getSAAudioAppPredictorClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getSAAudioAppPredictorOptionsClass_block_invoke_cold_1(v0);
}

uint64_t __getSAAudioAppPredictorOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __80__SearchUIImageDerivedColorGenerator_fetchColorsForImage_withCompletionHandler___block_invoke_2_cold_1(v0);
}

uint64_t __getFMUILocationDetailViewControllerViewOptionsClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return __getFMUILocationDetailViewControllerClass_block_invoke_cold_1(v0);
}

uint64_t __getFMUILocationDetailViewControllerClass_block_invoke_cold_1()
{
  uint64_t v0;

  v0 = abort_report_np();
  return -[SearchUIPersonHeaderViewController handleErrorResultFromDowntimeToggleFor:withError:].cold.1(v0);
}

void __getOBPrivacySplashControllerClass_block_invoke_cold_1()
{
  abort_report_np();
  sub_1DAE0C450();
}

uint64_t sub_1DAE0C450()
{
  return MEMORY[0x1E0C902C8]();
}

uint64_t sub_1DAE0C45C()
{
  return MEMORY[0x1E0C90360]();
}

uint64_t sub_1DAE0C468()
{
  return MEMORY[0x1E0C90380]();
}

uint64_t sub_1DAE0C474()
{
  return MEMORY[0x1E0C90408]();
}

uint64_t sub_1DAE0C480()
{
  return MEMORY[0x1E0C90428]();
}

uint64_t sub_1DAE0C48C()
{
  return MEMORY[0x1E0C90438]();
}

uint64_t sub_1DAE0C498()
{
  return MEMORY[0x1E0C90498]();
}

uint64_t sub_1DAE0C4A4()
{
  return MEMORY[0x1E0C90518]();
}

uint64_t sub_1DAE0C4B0()
{
  return MEMORY[0x1E0C905A0]();
}

uint64_t sub_1DAE0C4BC()
{
  return MEMORY[0x1E0C905D0]();
}

uint64_t sub_1DAE0C4C8()
{
  return MEMORY[0x1E0C90640]();
}

uint64_t sub_1DAE0C4D4()
{
  return MEMORY[0x1E0C90650]();
}

uint64_t sub_1DAE0C4E0()
{
  return MEMORY[0x1E0C906D8]();
}

uint64_t sub_1DAE0C4EC()
{
  return MEMORY[0x1E0C90778]();
}

uint64_t sub_1DAE0C4F8()
{
  return MEMORY[0x1E0C907D0]();
}

uint64_t sub_1DAE0C504()
{
  return MEMORY[0x1E0C90A08]();
}

uint64_t sub_1DAE0C510()
{
  return MEMORY[0x1E0C90AD8]();
}

uint64_t sub_1DAE0C51C()
{
  return MEMORY[0x1E0C90AE8]();
}

uint64_t sub_1DAE0C528()
{
  return MEMORY[0x1E0C90B80]();
}

uint64_t sub_1DAE0C534()
{
  return MEMORY[0x1E0C90D00]();
}

uint64_t sub_1DAE0C540()
{
  return MEMORY[0x1E0C90D10]();
}

uint64_t sub_1DAE0C54C()
{
  return MEMORY[0x1E0C90D20]();
}

uint64_t sub_1DAE0C558()
{
  return MEMORY[0x1E0C90DC8]();
}

uint64_t sub_1DAE0C564()
{
  return MEMORY[0x1E0C90F60]();
}

uint64_t sub_1DAE0C570()
{
  return MEMORY[0x1E0C90F78]();
}

uint64_t sub_1DAE0C57C()
{
  return MEMORY[0x1E0C90F90]();
}

uint64_t sub_1DAE0C588()
{
  return MEMORY[0x1E0C90FA0]();
}

uint64_t sub_1DAE0C594()
{
  return MEMORY[0x1E0C90FB0]();
}

uint64_t sub_1DAE0C5A0()
{
  return MEMORY[0x1E0C90FC0]();
}

uint64_t sub_1DAE0C5AC()
{
  return MEMORY[0x1E0C90FD8]();
}

uint64_t sub_1DAE0C5B8()
{
  return MEMORY[0x1E0C90FF0]();
}

uint64_t sub_1DAE0C5C4()
{
  return MEMORY[0x1E0C91000]();
}

uint64_t sub_1DAE0C5D0()
{
  return MEMORY[0x1E0C91008]();
}

uint64_t sub_1DAE0C5DC()
{
  return MEMORY[0x1E0C91040]();
}

uint64_t sub_1DAE0C5E8()
{
  return MEMORY[0x1E0C91048]();
}

uint64_t sub_1DAE0C5F4()
{
  return MEMORY[0x1E0C91058]();
}

uint64_t sub_1DAE0C600()
{
  return MEMORY[0x1E0C91068]();
}

uint64_t sub_1DAE0C60C()
{
  return MEMORY[0x1E0C91090]();
}

uint64_t sub_1DAE0C618()
{
  return MEMORY[0x1E0C910B8]();
}

uint64_t sub_1DAE0C624()
{
  return MEMORY[0x1E0C910D0]();
}

uint64_t sub_1DAE0C630()
{
  return MEMORY[0x1E0C910D8]();
}

uint64_t sub_1DAE0C63C()
{
  return MEMORY[0x1E0C91100]();
}

uint64_t sub_1DAE0C648()
{
  return MEMORY[0x1E0C91128]();
}

uint64_t sub_1DAE0C654()
{
  return MEMORY[0x1E0C91148]();
}

uint64_t sub_1DAE0C660()
{
  return MEMORY[0x1E0CF0BC8]();
}

uint64_t sub_1DAE0C66C()
{
  return MEMORY[0x1E0CF0C38]();
}

uint64_t sub_1DAE0C678()
{
  return MEMORY[0x1E0C91470]();
}

uint64_t sub_1DAE0C684()
{
  return MEMORY[0x1E0C91480]();
}

uint64_t sub_1DAE0C690()
{
  return MEMORY[0x1E0C914B0]();
}

uint64_t sub_1DAE0C69C()
{
  return MEMORY[0x1E0C91620]();
}

uint64_t sub_1DAE0C6A8()
{
  return MEMORY[0x1E0C91640]();
}

uint64_t sub_1DAE0C6B4()
{
  return MEMORY[0x1E0C91690]();
}

uint64_t sub_1DAE0C6C0()
{
  return MEMORY[0x1E0C916C0]();
}

uint64_t sub_1DAE0C6CC()
{
  return MEMORY[0x1E0C916C8]();
}

uint64_t sub_1DAE0C6D8()
{
  return MEMORY[0x1E0C916D0]();
}

uint64_t sub_1DAE0C6E4()
{
  return MEMORY[0x1E0C916F8]();
}

uint64_t sub_1DAE0C6F0()
{
  return MEMORY[0x1E0C91750]();
}

uint64_t sub_1DAE0C6FC()
{
  return MEMORY[0x1E0C91820]();
}

uint64_t sub_1DAE0C708()
{
  return MEMORY[0x1E0C91920]();
}

uint64_t sub_1DAE0C714()
{
  return MEMORY[0x1E0C91930]();
}

uint64_t sub_1DAE0C720()
{
  return MEMORY[0x1E0C91A38]();
}

uint64_t sub_1DAE0C72C()
{
  return MEMORY[0x1E0CAF980]();
}

uint64_t sub_1DAE0C738()
{
  return MEMORY[0x1E0CAF990]();
}

uint64_t sub_1DAE0C744()
{
  return MEMORY[0x1E0CAF9D0]();
}

uint64_t sub_1DAE0C750()
{
  return MEMORY[0x1E0CAF9D8]();
}

uint64_t sub_1DAE0C75C()
{
  return MEMORY[0x1E0CAF9F8]();
}

uint64_t sub_1DAE0C768()
{
  return MEMORY[0x1E0CAFA28]();
}

uint64_t sub_1DAE0C774()
{
  return MEMORY[0x1E0CAFE38]();
}

uint64_t sub_1DAE0C780()
{
  return MEMORY[0x1E0CAFF00]();
}

uint64_t sub_1DAE0C78C()
{
  return MEMORY[0x1E0CAFFF8]();
}

uint64_t sub_1DAE0C798()
{
  return MEMORY[0x1E0CB01F0]();
}

uint64_t sub_1DAE0C7A4()
{
  return MEMORY[0x1E0CB0228]();
}

uint64_t sub_1DAE0C7B0()
{
  return MEMORY[0x1E0CB07E8]();
}

uint64_t sub_1DAE0C7BC()
{
  return MEMORY[0x1E0CB07F8]();
}

uint64_t sub_1DAE0C7C8()
{
  return MEMORY[0x1E0CB0870]();
}

uint64_t sub_1DAE0C7D4()
{
  return MEMORY[0x1E0CB0900]();
}

uint64_t sub_1DAE0C7E0()
{
  return MEMORY[0x1E0CB0988]();
}

uint64_t sub_1DAE0C7EC()
{
  return MEMORY[0x1E0CB0998]();
}

uint64_t sub_1DAE0C7F8()
{
  return MEMORY[0x1E0CB0BF8]();
}

uint64_t sub_1DAE0C804()
{
  return MEMORY[0x1E0CB0CC8]();
}

uint64_t sub_1DAE0C810()
{
  return MEMORY[0x1E0CB0E38]();
}

uint64_t sub_1DAE0C81C()
{
  return MEMORY[0x1E0CB1458]();
}

uint64_t sub_1DAE0C828()
{
  return MEMORY[0x1E0CB1470]();
}

uint64_t sub_1DAE0C834()
{
  return MEMORY[0x1E0CB15E8]();
}

uint64_t sub_1DAE0C840()
{
  return MEMORY[0x1E0CB1608]();
}

uint64_t sub_1DAE0C84C()
{
  return MEMORY[0x1E0DC1A58]();
}

uint64_t sub_1DAE0C858()
{
  return MEMORY[0x1E0CB1658]();
}

uint64_t sub_1DAE0C864()
{
  return MEMORY[0x1E0CEEB38]();
}

uint64_t sub_1DAE0C870()
{
  return MEMORY[0x1E0CEEB98]();
}

uint64_t sub_1DAE0C87C()
{
  return MEMORY[0x1E0DEFD58]();
}

uint64_t sub_1DAE0C888()
{
  return MEMORY[0x1E0DEFD60]();
}

uint64_t sub_1DAE0C894()
{
  return MEMORY[0x1E0DEFD78]();
}

uint64_t sub_1DAE0C8A0()
{
  return MEMORY[0x1E0DEFD80]();
}

uint64_t sub_1DAE0C8AC()
{
  return MEMORY[0x1E0DB1668]();
}

uint64_t sub_1DAE0C8B8()
{
  return MEMORY[0x1E0DB1670]();
}

uint64_t sub_1DAE0C8C4()
{
  return MEMORY[0x1E0DB1698]();
}

uint64_t sub_1DAE0C8D0()
{
  return MEMORY[0x1E0DB16A8]();
}

uint64_t sub_1DAE0C8DC()
{
  return MEMORY[0x1E0DB16E0]();
}

uint64_t sub_1DAE0C8E8()
{
  return MEMORY[0x1E0DB16F0]();
}

uint64_t sub_1DAE0C8F4()
{
  return MEMORY[0x1E0DB1700]();
}

uint64_t sub_1DAE0C900()
{
  return MEMORY[0x1E0DB1718]();
}

uint64_t sub_1DAE0C90C()
{
  return MEMORY[0x1E0DB1728]();
}

uint64_t sub_1DAE0C918()
{
  return MEMORY[0x1E0DB1730]();
}

uint64_t sub_1DAE0C924()
{
  return MEMORY[0x1E0DB1748]();
}

uint64_t sub_1DAE0C930()
{
  return MEMORY[0x1E0DB1758]();
}

uint64_t sub_1DAE0C93C()
{
  return MEMORY[0x1E0DB1760]();
}

uint64_t sub_1DAE0C948()
{
  return MEMORY[0x1E0DB1778]();
}

uint64_t sub_1DAE0C954()
{
  return MEMORY[0x1E0DB1790]();
}

uint64_t sub_1DAE0C960()
{
  return MEMORY[0x1E0DB1798]();
}

uint64_t sub_1DAE0C96C()
{
  return MEMORY[0x1E0DB17A0]();
}

uint64_t sub_1DAE0C978()
{
  return MEMORY[0x1E0CC1AD0]();
}

uint64_t sub_1DAE0C984()
{
  return MEMORY[0x1E0CC1AE0]();
}

uint64_t sub_1DAE0C990()
{
  return MEMORY[0x1E0DA7850]();
}

uint64_t sub_1DAE0C99C()
{
  return MEMORY[0x1E0DA7858]();
}

uint64_t sub_1DAE0C9A8()
{
  return MEMORY[0x1E0DA7860]();
}

uint64_t sub_1DAE0C9B4()
{
  return MEMORY[0x1E0DA7868]();
}

uint64_t sub_1DAE0C9C0()
{
  return MEMORY[0x1E0DA7870]();
}

uint64_t sub_1DAE0C9CC()
{
  return MEMORY[0x1E0DA7878]();
}

uint64_t sub_1DAE0C9D8()
{
  return MEMORY[0x1E0DA7880]();
}

uint64_t sub_1DAE0C9E4()
{
  return MEMORY[0x1E0DA7888]();
}

uint64_t sub_1DAE0C9F0()
{
  return MEMORY[0x1E0CF0C48]();
}

uint64_t sub_1DAE0C9FC()
{
  return MEMORY[0x1E0CF0C80]();
}

uint64_t sub_1DAE0CA08()
{
  return MEMORY[0x1E0CF0BE0]();
}

uint64_t sub_1DAE0CA14()
{
  return MEMORY[0x1E0CF0BF8]();
}

uint64_t sub_1DAE0CA20()
{
  return MEMORY[0x1E0D20CC0]();
}

uint64_t sub_1DAE0CA2C()
{
  return MEMORY[0x1E0D20D90]();
}

uint64_t sub_1DAE0CA38()
{
  return MEMORY[0x1E0D20DE0]();
}

uint64_t sub_1DAE0CA44()
{
  return MEMORY[0x1E0D20DE8]();
}

uint64_t sub_1DAE0CA50()
{
  return MEMORY[0x1E0D20E50]();
}

uint64_t sub_1DAE0CA5C()
{
  return MEMORY[0x1E0DF0298]();
}

uint64_t sub_1DAE0CA68()
{
  return MEMORY[0x1E0DF0340]();
}

uint64_t sub_1DAE0CA74()
{
  return MEMORY[0x1E0DF2240]();
}

uint64_t sub_1DAE0CA80()
{
  return MEMORY[0x1E0DF2248]();
}

uint64_t sub_1DAE0CA8C()
{
  return MEMORY[0x1E0DF2258]();
}

uint64_t sub_1DAE0CA98()
{
  return MEMORY[0x1E0CD83B8]();
}

uint64_t sub_1DAE0CAA4()
{
  return MEMORY[0x1E0CD83E8]();
}

uint64_t sub_1DAE0CAB0()
{
  return MEMORY[0x1E0CD8500]();
}

uint64_t sub_1DAE0CABC()
{
  return MEMORY[0x1E0CD86C0]();
}

uint64_t sub_1DAE0CAC8()
{
  return MEMORY[0x1E0CD86F8]();
}

uint64_t sub_1DAE0CAD4()
{
  return MEMORY[0x1E0CD87D0]();
}

uint64_t sub_1DAE0CAE0()
{
  return MEMORY[0x1E0CD88F0]();
}

uint64_t sub_1DAE0CAEC()
{
  return MEMORY[0x1E0CD8968]();
}

uint64_t sub_1DAE0CAF8()
{
  return MEMORY[0x1E0CD8C70]();
}

uint64_t sub_1DAE0CB04()
{
  return MEMORY[0x1E0CD8C80]();
}

uint64_t sub_1DAE0CB10()
{
  return MEMORY[0x1E0CD8C90]();
}

uint64_t sub_1DAE0CB1C()
{
  return MEMORY[0x1E0CD8D60]();
}

uint64_t sub_1DAE0CB28()
{
  return MEMORY[0x1E0CD8E78]();
}

uint64_t sub_1DAE0CB34()
{
  return MEMORY[0x1E0CD8E80]();
}

uint64_t sub_1DAE0CB40()
{
  return MEMORY[0x1E0CD9010]();
}

uint64_t sub_1DAE0CB4C()
{
  return MEMORY[0x1E0CD9020]();
}

uint64_t sub_1DAE0CB58()
{
  return MEMORY[0x1E0CD9030]();
}

uint64_t sub_1DAE0CB64()
{
  return MEMORY[0x1E0CD9168]();
}

uint64_t sub_1DAE0CB70()
{
  return MEMORY[0x1E0CD9780]();
}

uint64_t sub_1DAE0CB7C()
{
  return MEMORY[0x1E0CD9788]();
}

uint64_t sub_1DAE0CB88()
{
  return MEMORY[0x1E0CD97A0]();
}

uint64_t sub_1DAE0CB94()
{
  return MEMORY[0x1E0CD97A8]();
}

uint64_t sub_1DAE0CBA0()
{
  return MEMORY[0x1E0CD97C8]();
}

uint64_t sub_1DAE0CBAC()
{
  return MEMORY[0x1E0CD9BF0]();
}

uint64_t sub_1DAE0CBB8()
{
  return MEMORY[0x1E0CD9C40]();
}

uint64_t sub_1DAE0CBC4()
{
  return MEMORY[0x1E0CDA088]();
}

uint64_t sub_1DAE0CBD0()
{
  return MEMORY[0x1E0CDA4A8]();
}

uint64_t sub_1DAE0CBDC()
{
  return MEMORY[0x1E0CDA4E0]();
}

uint64_t sub_1DAE0CBE8()
{
  return MEMORY[0x1E0CDA4E8]();
}

uint64_t sub_1DAE0CBF4()
{
  return MEMORY[0x1E0CDA590]();
}

uint64_t sub_1DAE0CC00()
{
  return MEMORY[0x1E0CDA5A0]();
}

uint64_t sub_1DAE0CC0C()
{
  return MEMORY[0x1E0CDA5A8]();
}

uint64_t sub_1DAE0CC18()
{
  return MEMORY[0x1E0CDA630]();
}

uint64_t sub_1DAE0CC24()
{
  return MEMORY[0x1E0CDA640]();
}

uint64_t sub_1DAE0CC30()
{
  return MEMORY[0x1E0CDA720]();
}

uint64_t sub_1DAE0CC3C()
{
  return MEMORY[0x1E0CDA728]();
}

uint64_t sub_1DAE0CC48()
{
  return MEMORY[0x1E0CDA8D8]();
}

uint64_t sub_1DAE0CC54()
{
  return MEMORY[0x1E0CDA8E0]();
}

uint64_t sub_1DAE0CC60()
{
  return MEMORY[0x1E0CDA938]();
}

uint64_t sub_1DAE0CC6C()
{
  return MEMORY[0x1E0CDA940]();
}

uint64_t sub_1DAE0CC78()
{
  return MEMORY[0x1E0CDA948]();
}

uint64_t sub_1DAE0CC84()
{
  return MEMORY[0x1E0CDA9C0]();
}

uint64_t sub_1DAE0CC90()
{
  return MEMORY[0x1E0CDA9C8]();
}

uint64_t sub_1DAE0CC9C()
{
  return MEMORY[0x1E0CDA9F0]();
}

uint64_t sub_1DAE0CCA8()
{
  return MEMORY[0x1E0CDA9F8]();
}

uint64_t sub_1DAE0CCB4()
{
  return MEMORY[0x1E0CDAA20]();
}

uint64_t sub_1DAE0CCC0()
{
  return MEMORY[0x1E0CDAA30]();
}

uint64_t sub_1DAE0CCCC()
{
  return MEMORY[0x1E0CDABA0]();
}

uint64_t sub_1DAE0CCD8()
{
  return MEMORY[0x1E0CDAC88]();
}

uint64_t sub_1DAE0CCE4()
{
  return MEMORY[0x1E0CDACC8]();
}

uint64_t sub_1DAE0CCF0()
{
  return MEMORY[0x1E0CDAFB8]();
}

uint64_t sub_1DAE0CCFC()
{
  return MEMORY[0x1E0CDAFC8]();
}

uint64_t sub_1DAE0CD08()
{
  return MEMORY[0x1E0CDAFD0]();
}

uint64_t sub_1DAE0CD14()
{
  return MEMORY[0x1E0CDAFE0]();
}

uint64_t sub_1DAE0CD20()
{
  return MEMORY[0x1E0CDB000]();
}

uint64_t sub_1DAE0CD2C()
{
  return MEMORY[0x1E0CDB0E8]();
}

uint64_t sub_1DAE0CD38()
{
  return MEMORY[0x1E0CDB310]();
}

uint64_t sub_1DAE0CD44()
{
  return MEMORY[0x1E0CDB388]();
}

uint64_t sub_1DAE0CD50()
{
  return MEMORY[0x1E0CDB430]();
}

uint64_t sub_1DAE0CD5C()
{
  return MEMORY[0x1E0CDB5B8]();
}

uint64_t sub_1DAE0CD68()
{
  return MEMORY[0x1E0CDB608]();
}

uint64_t sub_1DAE0CD74()
{
  return MEMORY[0x1E0CDB870]();
}

uint64_t sub_1DAE0CD80()
{
  return MEMORY[0x1E0CDBAB0]();
}

uint64_t sub_1DAE0CD8C()
{
  return MEMORY[0x1E0CDBAC0]();
}

uint64_t sub_1DAE0CD98()
{
  return MEMORY[0x1E0CDBB10]();
}

uint64_t sub_1DAE0CDA4()
{
  return MEMORY[0x1E0CDBC88]();
}

uint64_t sub_1DAE0CDB0()
{
  return MEMORY[0x1E0CDBC90]();
}

uint64_t sub_1DAE0CDBC()
{
  return MEMORY[0x1E0CDBD58]();
}

uint64_t sub_1DAE0CDC8()
{
  return MEMORY[0x1E0CDBD70]();
}

uint64_t sub_1DAE0CDD4()
{
  return MEMORY[0x1E0CDC0F8]();
}

uint64_t sub_1DAE0CDE0()
{
  return MEMORY[0x1E0CDC100]();
}

uint64_t sub_1DAE0CDEC()
{
  return MEMORY[0x1E0CDC108]();
}

uint64_t sub_1DAE0CDF8()
{
  return MEMORY[0x1E0CDC110]();
}

uint64_t sub_1DAE0CE04()
{
  return MEMORY[0x1E0CDC350]();
}

uint64_t sub_1DAE0CE10()
{
  return MEMORY[0x1E0CDC368]();
}

uint64_t sub_1DAE0CE1C()
{
  return MEMORY[0x1E0CDC388]();
}

uint64_t sub_1DAE0CE28()
{
  return MEMORY[0x1E0CDC3A8]();
}

uint64_t sub_1DAE0CE34()
{
  return MEMORY[0x1E0CDCE48]();
}

uint64_t sub_1DAE0CE40()
{
  return MEMORY[0x1E0CDCE60]();
}

uint64_t sub_1DAE0CE4C()
{
  return MEMORY[0x1E0CDCE68]();
}

uint64_t sub_1DAE0CE58()
{
  return MEMORY[0x1E0CDCE78]();
}

uint64_t sub_1DAE0CE64()
{
  return MEMORY[0x1E0CDCE90]();
}

uint64_t sub_1DAE0CE70()
{
  return MEMORY[0x1E0CDCEA0]();
}

uint64_t sub_1DAE0CE7C()
{
  return MEMORY[0x1E0CDCEB0]();
}

uint64_t sub_1DAE0CE88()
{
  return MEMORY[0x1E0CDCEB8]();
}

uint64_t sub_1DAE0CE94()
{
  return MEMORY[0x1E0CDCEC8]();
}

uint64_t sub_1DAE0CEA0()
{
  return MEMORY[0x1E0CDD2D8]();
}

uint64_t sub_1DAE0CEAC()
{
  return MEMORY[0x1E0CDD358]();
}

uint64_t sub_1DAE0CEB8()
{
  return MEMORY[0x1E0CDD368]();
}

uint64_t sub_1DAE0CEC4()
{
  return MEMORY[0x1E0CDD380]();
}

uint64_t sub_1DAE0CED0()
{
  return MEMORY[0x1E0CDD390]();
}

uint64_t sub_1DAE0CEDC()
{
  return MEMORY[0x1E0CDD3B0]();
}

uint64_t sub_1DAE0CEE8()
{
  return MEMORY[0x1E0CDD438]();
}

uint64_t sub_1DAE0CEF4()
{
  return MEMORY[0x1E0CDD5F8]();
}

uint64_t sub_1DAE0CF00()
{
  return MEMORY[0x1E0CDD928]();
}

uint64_t sub_1DAE0CF0C()
{
  return MEMORY[0x1E0CDDDA0]();
}

uint64_t sub_1DAE0CF18()
{
  return MEMORY[0x1E0CDDDD0]();
}

uint64_t sub_1DAE0CF24()
{
  return MEMORY[0x1E0CDDE48]();
}

uint64_t sub_1DAE0CF30()
{
  return MEMORY[0x1E0CDDE58]();
}

uint64_t sub_1DAE0CF3C()
{
  return MEMORY[0x1E0CDDEE0]();
}

uint64_t sub_1DAE0CF48()
{
  return MEMORY[0x1E0CDDF08]();
}

uint64_t sub_1DAE0CF54()
{
  return MEMORY[0x1E0CDDFD0]();
}

uint64_t sub_1DAE0CF60()
{
  return MEMORY[0x1E0CDE230]();
}

uint64_t sub_1DAE0CF6C()
{
  return MEMORY[0x1E0CDE380]();
}

uint64_t sub_1DAE0CF78()
{
  return MEMORY[0x1E0CDE5C0]();
}

uint64_t sub_1DAE0CF84()
{
  return MEMORY[0x1E0CDE898]();
}

uint64_t sub_1DAE0CF90()
{
  return MEMORY[0x1E0CDEE28]();
}

uint64_t sub_1DAE0CF9C()
{
  return MEMORY[0x1E0CDEF78]();
}

uint64_t sub_1DAE0CFA8()
{
  return MEMORY[0x1E0CDF0D8]();
}

uint64_t sub_1DAE0CFB4()
{
  return MEMORY[0x1E0CDF128]();
}

uint64_t sub_1DAE0CFC0()
{
  return MEMORY[0x1E0CDF2B0]();
}

uint64_t sub_1DAE0CFCC()
{
  return MEMORY[0x1E0CDF3B0]();
}

uint64_t sub_1DAE0CFD8()
{
  return MEMORY[0x1E0CDF440]();
}

uint64_t sub_1DAE0CFE4()
{
  return MEMORY[0x1E0CDF530]();
}

uint64_t sub_1DAE0CFF0()
{
  return MEMORY[0x1E0CDF6A8]();
}

uint64_t sub_1DAE0CFFC()
{
  return MEMORY[0x1E0CDF6D8]();
}

uint64_t sub_1DAE0D008()
{
  return MEMORY[0x1E0CDF700]();
}

uint64_t sub_1DAE0D014()
{
  return MEMORY[0x1E0CDF7E8]();
}

uint64_t sub_1DAE0D020()
{
  return MEMORY[0x1E0CDF810]();
}

uint64_t sub_1DAE0D02C()
{
  return MEMORY[0x1E0CDF878]();
}

uint64_t sub_1DAE0D038()
{
  return MEMORY[0x1E0CDF968]();
}

uint64_t sub_1DAE0D044()
{
  return MEMORY[0x1E0CDF970]();
}

uint64_t sub_1DAE0D050()
{
  return MEMORY[0x1E0CDF988]();
}

uint64_t sub_1DAE0D05C()
{
  return MEMORY[0x1E0CDF990]();
}

uint64_t sub_1DAE0D068()
{
  return MEMORY[0x1E0CDF9F0]();
}

uint64_t sub_1DAE0D074()
{
  return MEMORY[0x1E0CDFA28]();
}

uint64_t sub_1DAE0D080()
{
  return MEMORY[0x1E0CDFD20]();
}

uint64_t sub_1DAE0D08C()
{
  return MEMORY[0x1E0CDFD38]();
}

uint64_t sub_1DAE0D098()
{
  return MEMORY[0x1E0CDFD48]();
}

uint64_t sub_1DAE0D0A4()
{
  return MEMORY[0x1E0CDFD58]();
}

uint64_t sub_1DAE0D0B0()
{
  return MEMORY[0x1E0CDFD70]();
}

uint64_t sub_1DAE0D0BC()
{
  return MEMORY[0x1E0CDFDB8]();
}

uint64_t sub_1DAE0D0C8()
{
  return MEMORY[0x1E0CDFE98]();
}

uint64_t sub_1DAE0D0D4()
{
  return MEMORY[0x1E0CDFEC0]();
}

uint64_t sub_1DAE0D0E0()
{
  return MEMORY[0x1E0CDFF48]();
}

uint64_t sub_1DAE0D0EC()
{
  return MEMORY[0x1E0CDFF58]();
}

uint64_t sub_1DAE0D0F8()
{
  return MEMORY[0x1E0CE01B0]();
}

uint64_t sub_1DAE0D104()
{
  return MEMORY[0x1E0CE0220]();
}

uint64_t sub_1DAE0D110()
{
  return MEMORY[0x1E0CE03F0]();
}

uint64_t sub_1DAE0D11C()
{
  return MEMORY[0x1E0DBF7C0]();
}

uint64_t sub_1DAE0D128()
{
  return MEMORY[0x1E0DBF7E8]();
}

uint64_t sub_1DAE0D134()
{
  return MEMORY[0x1E0DBF8F8]();
}

uint64_t sub_1DAE0D140()
{
  return MEMORY[0x1E0DBF918]();
}

uint64_t sub_1DAE0D14C()
{
  return MEMORY[0x1E0DBF938]();
}

uint64_t sub_1DAE0D158()
{
  return MEMORY[0x1E0DBF9D0]();
}

uint64_t sub_1DAE0D164()
{
  return MEMORY[0x1E0DBF9F0]();
}

uint64_t sub_1DAE0D170()
{
  return MEMORY[0x1E0DBFA00]();
}

uint64_t sub_1DAE0D17C()
{
  return MEMORY[0x1E0DBFA20]();
}

uint64_t sub_1DAE0D188()
{
  return MEMORY[0x1E0DBFAA0]();
}

uint64_t sub_1DAE0D194()
{
  return MEMORY[0x1E0DBFAB0]();
}

uint64_t sub_1DAE0D1A0()
{
  return MEMORY[0x1E0DBFB00]();
}

uint64_t sub_1DAE0D1AC()
{
  return MEMORY[0x1E0DBFC50]();
}

uint64_t sub_1DAE0D1B8()
{
  return MEMORY[0x1E0DBFC90]();
}

uint64_t sub_1DAE0D1C4()
{
  return MEMORY[0x1E0DBFC98]();
}

uint64_t sub_1DAE0D1D0()
{
  return MEMORY[0x1E0DBFCB0]();
}

uint64_t sub_1DAE0D1DC()
{
  return MEMORY[0x1E0DBFCC8]();
}

uint64_t sub_1DAE0D1E8()
{
  return MEMORY[0x1E0DBFCD8]();
}

uint64_t sub_1DAE0D1F4()
{
  return MEMORY[0x1E0DBFD60]();
}

uint64_t sub_1DAE0D200()
{
  return MEMORY[0x1E0DBFD70]();
}

uint64_t sub_1DAE0D20C()
{
  return MEMORY[0x1E0DC0028]();
}

uint64_t sub_1DAE0D218()
{
  return MEMORY[0x1E0DC01D0]();
}

uint64_t sub_1DAE0D224()
{
  return MEMORY[0x1E0DC05E0]();
}

uint64_t sub_1DAE0D230()
{
  return MEMORY[0x1E0CC7E80]();
}

uint64_t sub_1DAE0D23C()
{
  return MEMORY[0x1E0CC7E88]();
}

uint64_t sub_1DAE0D248()
{
  return MEMORY[0x1E0CC7E90]();
}

uint64_t sub_1DAE0D254()
{
  return MEMORY[0x1E0D50700]();
}

uint64_t sub_1DAE0D260()
{
  return MEMORY[0x1E0D50710]();
}

uint64_t sub_1DAE0D26C()
{
  return MEMORY[0x1E0D50720]();
}

uint64_t sub_1DAE0D278()
{
  return MEMORY[0x1E0D50728]();
}

uint64_t sub_1DAE0D284()
{
  return MEMORY[0x1E0CC8150]();
}

uint64_t sub_1DAE0D290()
{
  return MEMORY[0x1E0CC8170]();
}

uint64_t sub_1DAE0D29C()
{
  return MEMORY[0x1E0CC8180]();
}

uint64_t sub_1DAE0D2A8()
{
  return MEMORY[0x1E0CC8B38]();
}

uint64_t sub_1DAE0D2B4()
{
  return MEMORY[0x1E0CC8B80]();
}

uint64_t sub_1DAE0D2C0()
{
  return MEMORY[0x1E0CC8B88]();
}

uint64_t sub_1DAE0D2CC()
{
  return MEMORY[0x1E0CC8CC8]();
}

uint64_t sub_1DAE0D2D8()
{
  return MEMORY[0x1E0CC9410]();
}

uint64_t sub_1DAE0D2E4()
{
  return MEMORY[0x1E0CC9450]();
}

uint64_t sub_1DAE0D2F0()
{
  return MEMORY[0x1E0CC9468]();
}

uint64_t sub_1DAE0D2FC()
{
  return MEMORY[0x1E0CCCBB8]();
}

uint64_t sub_1DAE0D308()
{
  return MEMORY[0x1E0CCCDF8]();
}

uint64_t sub_1DAE0D314()
{
  return MEMORY[0x1E0D50750]();
}

uint64_t sub_1DAE0D320()
{
  return MEMORY[0x1E0D50760]();
}

uint64_t sub_1DAE0D32C()
{
  return MEMORY[0x1E0CCD178]();
}

uint64_t sub_1DAE0D338()
{
  return MEMORY[0x1E0CCD550]();
}

uint64_t sub_1DAE0D344()
{
  return MEMORY[0x1E0DA86B8]();
}

uint64_t sub_1DAE0D350()
{
  return MEMORY[0x1E0DA86C8]();
}

uint64_t sub_1DAE0D35C()
{
  return MEMORY[0x1E0DA86D8]();
}

uint64_t sub_1DAE0D368()
{
  return MEMORY[0x1E0DA86E8]();
}

uint64_t sub_1DAE0D374()
{
  return MEMORY[0x1E0DA86F0]();
}

uint64_t sub_1DAE0D380()
{
  return MEMORY[0x1E0DA86F8]();
}

uint64_t sub_1DAE0D38C()
{
  return MEMORY[0x1E0DA8700]();
}

uint64_t sub_1DAE0D398()
{
  return MEMORY[0x1E0DA8728]();
}

uint64_t sub_1DAE0D3A4()
{
  return MEMORY[0x1E0DA8738]();
}

uint64_t sub_1DAE0D3B0()
{
  return MEMORY[0x1E0DA8740]();
}

uint64_t sub_1DAE0D3BC()
{
  return MEMORY[0x1E0DA8748]();
}

uint64_t sub_1DAE0D3C8()
{
  return MEMORY[0x1E0DA8750]();
}

uint64_t sub_1DAE0D3D4()
{
  return MEMORY[0x1E0DA9058]();
}

uint64_t sub_1DAE0D3E0()
{
  return MEMORY[0x1E0DA91D0]();
}

uint64_t sub_1DAE0D3EC()
{
  return MEMORY[0x1E0DA91D8]();
}

uint64_t sub_1DAE0D3F8()
{
  return MEMORY[0x1E0DA91F0]();
}

uint64_t sub_1DAE0D404()
{
  return MEMORY[0x1E0DA9220]();
}

uint64_t sub_1DAE0D410()
{
  return MEMORY[0x1E0DA9248]();
}

uint64_t sub_1DAE0D41C()
{
  return MEMORY[0x1E0DA9250]();
}

uint64_t sub_1DAE0D428()
{
  return MEMORY[0x1E0DCC870]();
}

uint64_t sub_1DAE0D434()
{
  return MEMORY[0x1E0DCC8A8]();
}

uint64_t sub_1DAE0D440()
{
  return MEMORY[0x1E0DCC8B0]();
}

uint64_t sub_1DAE0D44C()
{
  return MEMORY[0x1E0DCC8B8]();
}

uint64_t sub_1DAE0D458()
{
  return MEMORY[0x1E0DCC8C0]();
}

uint64_t sub_1DAE0D464()
{
  return MEMORY[0x1E0DCC8C8]();
}

uint64_t sub_1DAE0D470()
{
  return MEMORY[0x1E0DCC940]();
}

uint64_t sub_1DAE0D47C()
{
  return MEMORY[0x1E0DCC970]();
}

uint64_t sub_1DAE0D488()
{
  return MEMORY[0x1E0DCC980]();
}

uint64_t sub_1DAE0D494()
{
  return MEMORY[0x1E0DCC990]();
}

uint64_t sub_1DAE0D4A0()
{
  return MEMORY[0x1E0DCC9B8]();
}

uint64_t sub_1DAE0D4AC()
{
  return MEMORY[0x1E0DCC9C0]();
}

uint64_t sub_1DAE0D4B8()
{
  return MEMORY[0x1E0DEA1B8]();
}

uint64_t sub_1DAE0D4C4()
{
  return MEMORY[0x1E0DEA280]();
}

uint64_t sub_1DAE0D4D0()
{
  return MEMORY[0x1E0DEA568]();
}

uint64_t sub_1DAE0D4DC()
{
  return MEMORY[0x1E0CB18A0]();
}

uint64_t sub_1DAE0D4E8()
{
  return MEMORY[0x1E0CB18C0]();
}

uint64_t sub_1DAE0D4F4()
{
  return MEMORY[0x1E0CB18D8]();
}

uint64_t sub_1DAE0D500()
{
  return MEMORY[0x1E0CB18E0]();
}

uint64_t sub_1DAE0D50C()
{
  return MEMORY[0x1E0CB18E8]();
}

uint64_t sub_1DAE0D518()
{
  return MEMORY[0x1E0CB18F0]();
}

uint64_t sub_1DAE0D524()
{
  return MEMORY[0x1E0CB18F8]();
}

uint64_t sub_1DAE0D530()
{
  return MEMORY[0x1E0CB1940]();
}

uint64_t sub_1DAE0D53C()
{
  return MEMORY[0x1E0CB1980]();
}

uint64_t sub_1DAE0D548()
{
  return MEMORY[0x1E0DEA5F8]();
}

uint64_t sub_1DAE0D554()
{
  return MEMORY[0x1E0DEA758]();
}

uint64_t sub_1DAE0D560()
{
  return MEMORY[0x1E0DEA7B8]();
}

uint64_t sub_1DAE0D56C()
{
  return MEMORY[0x1E0DEA800]();
}

uint64_t sub_1DAE0D578()
{
  return MEMORY[0x1E0DEA840]();
}

uint64_t sub_1DAE0D584()
{
  return MEMORY[0x1E0DEA850]();
}

uint64_t sub_1DAE0D590()
{
  return MEMORY[0x1E0DEA870]();
}

uint64_t sub_1DAE0D59C()
{
  return MEMORY[0x1E0DEA908]();
}

uint64_t sub_1DAE0D5A8()
{
  return MEMORY[0x1E0DEAC88]();
}

uint64_t sub_1DAE0D5B4()
{
  return MEMORY[0x1E0DEADA0]();
}

uint64_t sub_1DAE0D5C0()
{
  return MEMORY[0x1E0CB1AC0]();
}

uint64_t sub_1DAE0D5CC()
{
  return MEMORY[0x1E0CB1AE8]();
}

uint64_t sub_1DAE0D5D8()
{
  return MEMORY[0x1E0DEADB8]();
}

uint64_t sub_1DAE0D5E4()
{
  return MEMORY[0x1E0DEADE8]();
}

uint64_t sub_1DAE0D5F0()
{
  return MEMORY[0x1E0DEAE58]();
}

uint64_t sub_1DAE0D5FC()
{
  return MEMORY[0x1E0DEAEC8]();
}

uint64_t sub_1DAE0D608()
{
  return MEMORY[0x1E0DF05B8]();
}

uint64_t sub_1DAE0D614()
{
  return MEMORY[0x1E0DF05D0]();
}

uint64_t sub_1DAE0D620()
{
  return MEMORY[0x1E0DF06D8]();
}

uint64_t sub_1DAE0D62C()
{
  return MEMORY[0x1E0DF06E0]();
}

uint64_t sub_1DAE0D638()
{
  return MEMORY[0x1E0DF0700]();
}

uint64_t sub_1DAE0D644()
{
  return MEMORY[0x1E0DF0748]();
}

uint64_t sub_1DAE0D650()
{
  return MEMORY[0x1E0DF0750]();
}

uint64_t sub_1DAE0D65C()
{
  return MEMORY[0x1E0CB1C10]();
}

uint64_t sub_1DAE0D668()
{
  return MEMORY[0x1E0CB1C18]();
}

uint64_t sub_1DAE0D674()
{
  return MEMORY[0x1E0CB1C20]();
}

uint64_t sub_1DAE0D680()
{
  return MEMORY[0x1E0CB1C28]();
}

uint64_t sub_1DAE0D68C()
{
  return MEMORY[0x1E0DEB408]();
}

uint64_t sub_1DAE0D698()
{
  return MEMORY[0x1E0DEB528]();
}

uint64_t sub_1DAE0D6A4()
{
  return MEMORY[0x1E0DEB5A8]();
}

uint64_t sub_1DAE0D6B0()
{
  return MEMORY[0x1E0DEB6D0]();
}

uint64_t sub_1DAE0D6BC()
{
  return MEMORY[0x1E0DF2270]();
}

uint64_t sub_1DAE0D6C8()
{
  return MEMORY[0x1E0DF2280]();
}

uint64_t sub_1DAE0D6D4()
{
  return MEMORY[0x1E0DF2288]();
}

uint64_t sub_1DAE0D6E0()
{
  return MEMORY[0x1E0DF0390]();
}

uint64_t sub_1DAE0D6EC()
{
  return MEMORY[0x1E0CF0CC8]();
}

uint64_t sub_1DAE0D6F8()
{
  return MEMORY[0x1E0CF0CE8]();
}

uint64_t sub_1DAE0D704()
{
  return MEMORY[0x1E0DEFCE0]();
}

uint64_t sub_1DAE0D710()
{
  return MEMORY[0x1E0DEB940]();
}

uint64_t sub_1DAE0D71C()
{
  return MEMORY[0x1E0DEBC20]();
}

uint64_t sub_1DAE0D728()
{
  return MEMORY[0x1E0DEBC90]();
}

uint64_t sub_1DAE0D734()
{
  return MEMORY[0x1E0DEC060]();
}

uint64_t sub_1DAE0D740()
{
  return MEMORY[0x1E0DEC1B0]();
}

uint64_t sub_1DAE0D74C()
{
  return MEMORY[0x1E0DEC248]();
}

uint64_t sub_1DAE0D758()
{
  return MEMORY[0x1E0DEC250]();
}

uint64_t sub_1DAE0D764()
{
  return MEMORY[0x1E0DEC260]();
}

uint64_t sub_1DAE0D770()
{
  return MEMORY[0x1E0DEC290]();
}

uint64_t sub_1DAE0D77C()
{
  return MEMORY[0x1E0DEC2A0]();
}

uint64_t sub_1DAE0D788()
{
  return MEMORY[0x1E0DEC2A8]();
}

uint64_t sub_1DAE0D794()
{
  return MEMORY[0x1E0DEC2B0]();
}

uint64_t sub_1DAE0D7A0()
{
  return MEMORY[0x1E0DEC3E0]();
}

uint64_t sub_1DAE0D7AC()
{
  return MEMORY[0x1E0DEC480]();
}

uint64_t sub_1DAE0D7B8()
{
  return MEMORY[0x1E0DEC488]();
}

uint64_t sub_1DAE0D7C4()
{
  return MEMORY[0x1E0DEC498]();
}

uint64_t sub_1DAE0D7D0()
{
  return MEMORY[0x1E0DEC588]();
}

uint64_t sub_1DAE0D7DC()
{
  return MEMORY[0x1E0DEC590]();
}

uint64_t sub_1DAE0D7E8()
{
  return MEMORY[0x1E0DEC660]();
}

uint64_t sub_1DAE0D7F4()
{
  return MEMORY[0x1E0DEC670]();
}

uint64_t sub_1DAE0D800()
{
  return MEMORY[0x1E0DEC688]();
}

uint64_t sub_1DAE0D80C()
{
  return MEMORY[0x1E0DEC6C0]();
}

uint64_t sub_1DAE0D818()
{
  return MEMORY[0x1E0DEC6C8]();
}

uint64_t sub_1DAE0D824()
{
  return MEMORY[0x1E0DECBE0]();
}

uint64_t sub_1DAE0D830()
{
  return MEMORY[0x1E0DECBE8]();
}

uint64_t sub_1DAE0D83C()
{
  return MEMORY[0x1E0DECD18]();
}

uint64_t sub_1DAE0D848()
{
  return MEMORY[0x1E0DECD50]();
}

uint64_t sub_1DAE0D854()
{
  return MEMORY[0x1E0DECD68]();
}

uint64_t sub_1DAE0D860()
{
  return MEMORY[0x1E0DECD70]();
}

uint64_t sub_1DAE0D86C()
{
  return MEMORY[0x1E0DECE70]();
}

uint64_t sub_1DAE0D878()
{
  return MEMORY[0x1E0DECF28]();
}

uint64_t sub_1DAE0D884()
{
  return MEMORY[0x1E0DED1D0]();
}

uint64_t sub_1DAE0D890()
{
  return MEMORY[0x1E0DF0DD0]();
}

uint64_t sub_1DAE0D89C()
{
  return MEMORY[0x1E0DED590]();
}

uint64_t sub_1DAE0D8A8()
{
  return MEMORY[0x1E0DED600]();
}

uint64_t sub_1DAE0D8B4()
{
  return MEMORY[0x1E0DEDAE0]();
}

uint64_t sub_1DAE0D8C0()
{
  return MEMORY[0x1E0CB2650]();
}

uint64_t sub_1DAE0D8CC()
{
  return MEMORY[0x1E0DEDB10]();
}

uint64_t sub_1DAE0D8D8()
{
  return MEMORY[0x1E0DEDB18]();
}

uint64_t sub_1DAE0D8E4()
{
  return MEMORY[0x1E0DEDB20]();
}

uint64_t sub_1DAE0D8F0()
{
  return MEMORY[0x1E0DEDB28]();
}

uint64_t sub_1DAE0D8FC()
{
  return MEMORY[0x1E0DEDED8]();
}

uint64_t sub_1DAE0D908()
{
  return MEMORY[0x1E0DEDEF0]();
}

uint64_t sub_1DAE0D914()
{
  return MEMORY[0x1E0DEDEF8]();
}

uint64_t sub_1DAE0D920()
{
  return MEMORY[0x1E0DEDF10]();
}

uint64_t sub_1DAE0D92C()
{
  return MEMORY[0x1E0DEDF40]();
}

uint64_t BiomeLibrary()
{
  return MEMORY[0x1E0D01E18]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

BOOL CGAffineTransformIsIdentity(CGAffineTransform *t)
{
  return MEMORY[0x1E0C9BAB8](t);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
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

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
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

CLLocationCoordinate2D CLLocationCoordinate2DMake(CLLocationDegrees latitude, CLLocationDegrees longitude)
{
  double v2;
  double v3;
  CLLocationCoordinate2D result;

  MEMORY[0x1E0C9E308](latitude, longitude);
  result.longitude = v3;
  result.latitude = v2;
  return result;
}

uint64_t CUIKAdjustedColorForColor()
{
  return MEMORY[0x1E0D0C8D8]();
}

uint64_t DOCContentTypesReadableByApplicationWithBundleIdentifier()
{
  return MEMORY[0x1E0D1D870]();
}

uint64_t GEOFetchOfflineMapsDownloadURLForSFFlightLeg()
{
  return MEMORY[0x1E0D265C8]();
}

uint64_t INIntentCreate()
{
  return MEMORY[0x1E0CBD438]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

MKCoordinateRegion MKCoordinateRegionMakeWithDistance(CLLocationCoordinate2D centerCoordinate, CLLocationDistance latitudinalMeters, CLLocationDistance longitudinalMeters)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKCoordinateRegion result;

  MEMORY[0x1E0CC1570]((__n128)centerCoordinate, *(__n128 *)&centerCoordinate.longitude, latitudinalMeters, longitudinalMeters);
  result.span.longitudeDelta = v6;
  result.span.latitudeDelta = v5;
  result.center.longitude = v4;
  result.center.latitude = v3;
  return result;
}

MKMapPoint MKMapPointForCoordinate(CLLocationCoordinate2D coordinate)
{
  double v1;
  double v2;
  MKMapPoint result;

  MEMORY[0x1E0CC15F8]((__n128)coordinate, *(__n128 *)&coordinate.longitude);
  result.y = v2;
  result.x = v1;
  return result;
}

MKMapRect MKMapRectInset(MKMapRect rect, double dx, double dy)
{
  double v3;
  double v4;
  double v5;
  double v6;
  MKMapRect result;

  MEMORY[0x1E0CC1628]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height, dx, dy);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x1E0CB2C58](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

uint64_t PUItemProviderForAsset()
{
  return MEMORY[0x1E0D7D258]();
}

uint64_t SBIconImageInfoMake()
{
  return MEMORY[0x1E0DAA948]();
}

uint64_t SBSRequestPasscodeUnlockUI()
{
  return MEMORY[0x1E0DAB950]();
}

uint64_t SSAppNameForBundleId()
{
  return MEMORY[0x1E0DA9CD0]();
}

uint64_t SSGetDisabledBundleSet()
{
  return MEMORY[0x1E0DA9CD8]();
}

uint64_t TLKBiggerSuggestionsLayoutEnabled()
{
  return MEMORY[0x1E0DBDA58]();
}

uint64_t TLKSnippetModernizationEnabled()
{
  return MEMORY[0x1E0DBDA80]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x1E0DC4500]();
}

uint64_t UICeilToScale()
{
  return MEMORY[0x1E0DC4880]();
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

NSData *__cdecl UIImageJPEGRepresentation(UIImage *image, CGFloat compressionQuality)
{
  return (NSData *)MEMORY[0x1E0DC4C58](image, compressionQuality);
}

void UIRectFill(CGRect rect)
{
  MEMORY[0x1E0DC5298]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

uint64_t WFDataFromSpotlightResultRunnable()
{
  return MEMORY[0x1E0DC8088]();
}

uint64_t WFSpotlightResultRunnableFromData()
{
  return MEMORY[0x1E0DC82C0]();
}

uint64_t WFTopHitContextualActionTypeForBundleIdentifier()
{
  return MEMORY[0x1E0DC83D0]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

uint64_t _os_feature_enabled_impl()
{
  return MEMORY[0x1E0C81010]();
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

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

uint64_t _swift_stdlib_reportUnimplementedInitializer()
{
  return MEMORY[0x1E0DEEA40]();
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

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
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

uint64_t geo_isDayLightForLocation()
{
  return MEMORY[0x1E0D278F8]();
}

size_t malloc_size(const void *ptr)
{
  return MEMORY[0x1E0C83EE0](ptr);
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

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x1E0DE7C30](dest, src, size, atomic, hasStrong);
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

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x1E0C84928](log);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

uint64_t rankingPrefetchedAttributesArray()
{
  return MEMORY[0x1E0DA9D00]();
}

uint64_t swift_allocBox()
{
  return MEMORY[0x1E0DEEA98]();
}

uint64_t swift_allocError()
{
  return MEMORY[0x1E0DEEAA8]();
}

uint64_t swift_allocObject()
{
  return MEMORY[0x1E0DEEAB0]();
}

uint64_t swift_allocateGenericClassMetadata()
{
  return MEMORY[0x1E0DEEAB8]();
}

uint64_t swift_allocateGenericValueMetadata()
{
  return MEMORY[0x1E0DEEAC0]();
}

uint64_t swift_arrayDestroy()
{
  return MEMORY[0x1E0DEEAD8]();
}

uint64_t swift_arrayInitWithCopy()
{
  return MEMORY[0x1E0DEEAE0]();
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

uint64_t swift_checkMetadataState()
{
  return MEMORY[0x1E0DEEB28]();
}

uint64_t swift_conformsToProtocol2()
{
  return MEMORY[0x1E0DEEB40]();
}

uint64_t swift_continuation_await()
{
  return MEMORY[0x1E0DF0F88]();
}

uint64_t swift_continuation_init()
{
  return MEMORY[0x1E0DF0F90]();
}

uint64_t swift_continuation_resume()
{
  return MEMORY[0x1E0DF0F98]();
}

uint64_t swift_continuation_throwingResume()
{
  return MEMORY[0x1E0DF0FA0]();
}

uint64_t swift_continuation_throwingResumeWithError()
{
  return MEMORY[0x1E0DF0FA8]();
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

uint64_t swift_dynamicCastClass()
{
  return MEMORY[0x1E0DEEB88]();
}

uint64_t swift_dynamicCastObjCClass()
{
  return MEMORY[0x1E0DEEBA8]();
}

uint64_t swift_dynamicCastObjCProtocolConditional()
{
  return MEMORY[0x1E0DEEBB8]();
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

uint64_t swift_getAssociatedTypeWitness()
{
  return MEMORY[0x1E0DEEC08]();
}

uint64_t swift_getAtKeyPath()
{
  return MEMORY[0x1E0DEEC18]();
}

uint64_t swift_getEnumCaseMultiPayload()
{
  return MEMORY[0x1E0DEEC40]();
}

uint64_t swift_getEnumTagSinglePayloadGeneric()
{
  return MEMORY[0x1E0DEEC48]();
}

uint64_t swift_getErrorValue()
{
  return MEMORY[0x1E0DEEC50]();
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

uint64_t swift_getMetatypeMetadata()
{
  return MEMORY[0x1E0DEECC0]();
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

uint64_t swift_getOpaqueTypeConformance2()
{
  return MEMORY[0x1E0DEECE8]();
}

uint64_t swift_getSingletonMetadata()
{
  return MEMORY[0x1E0DEECF8]();
}

uint64_t swift_getTupleTypeMetadata2()
{
  return MEMORY[0x1E0DEED20]();
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

uint64_t swift_initStructMetadata()
{
  return MEMORY[0x1E0DEED88]();
}

uint64_t swift_isUniquelyReferenced_nonNull_native()
{
  return MEMORY[0x1E0DEEDD0]();
}

uint64_t swift_lookUpClassMethod()
{
  return MEMORY[0x1E0DEEDE0]();
}

uint64_t swift_once()
{
  return MEMORY[0x1E0DEEE00]();
}

uint64_t swift_release()
{
  return MEMORY[0x1E0DEEE30]();
}

uint64_t swift_release_n()
{
  return MEMORY[0x1E0DEEE38]();
}

uint64_t swift_retain()
{
  return MEMORY[0x1E0DEEE48]();
}

uint64_t swift_retain_n()
{
  return MEMORY[0x1E0DEEE50]();
}

uint64_t swift_setDeallocating()
{
  return MEMORY[0x1E0DEEE70]();
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

uint64_t swift_unknownObjectRelease_n()
{
  return MEMORY[0x1E0DEEEC8]();
}

uint64_t swift_unknownObjectRetain()
{
  return MEMORY[0x1E0DEEED0]();
}

uint64_t swift_unknownObjectRetain_n()
{
  return MEMORY[0x1E0DEEED8]();
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

