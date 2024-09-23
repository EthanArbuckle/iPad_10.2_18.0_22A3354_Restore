void _CACAssertionFailed(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, void *a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v13;
  objc_class *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  dispatch_semaphore_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  NSObject *v29;
  dispatch_time_t v30;
  _QWORD v31[4];
  dispatch_semaphore_t v32;
  uint64_t *v33;
  uint8_t buf[4];
  uint64_t v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  void *v41;
  __int16 v42;
  id v43;
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  v13 = a4;
  v33 = &a9;
  v14 = (objc_class *)MEMORY[0x24BDD17C8];
  v15 = a5;
  v16 = (void *)objc_msgSend([v14 alloc], "initWithFormat:arguments:", v15, &a9);

  v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithUTF8String:", a1);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedLong:", a2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  CACLogBugReporter();
  v19 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 136316162;
    v35 = a3;
    v36 = 2112;
    v37 = v17;
    v38 = 2112;
    v39 = v18;
    v40 = 2112;
    v41 = v16;
    v42 = 2112;
    v43 = v13;
    _os_log_fault_impl(&dword_229A40000, v19, OS_LOG_TYPE_FAULT, "*** Assertion failure in %s, %@:%@.\n\n%@\n%@", buf, 0x34u);
  }

  v20 = dispatch_semaphore_create(0);
  objc_msgSend(v17, "lastPathComponent");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[CACBugReporter sharedReporter](CACBugReporter, "sharedReporter");
  v22 = objc_claimAutoreleasedReturnValue();
  v23 = a3;
  v24 = v13;
  v25 = (void *)v22;
  v26 = CACBugReporterTypeAssertion;
  v27 = CACBugReporterSubtypeFault;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@, %s, %@"), v21, v23, v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x24BDAC760];
  v31[1] = 3221225472;
  v31[2] = ___CACAssertionFailed_block_invoke;
  v31[3] = &unk_24F2AA860;
  v32 = v20;
  v29 = v20;
  objc_msgSend(v25, "reportIssue:subtype:description:completionBlock:", v26, v27, v28, v31);

  v30 = dispatch_time(0, 10000000000);
  dispatch_semaphore_wait(v29, v30);

}

void sub_229A44498(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A473E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

const void *CACRecognizeCommandIdentifier(const void *a1, const void *a2)
{
  CFDictionaryRef v2;
  void *v3;
  void *v4;
  _xpc_connection_s *mach_service;
  xpc_object_t v6;
  xpc_object_t v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *Value;
  const void *v11;
  const void *v13[2];
  void *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24F2AAF88;
  v13[0] = a1;
  v13[1] = a2;
  v2 = CFDictionaryCreate(0, (const void **)keys, v13, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v2)
    return 0;
  v3 = CACCreateSerializedGenericActionDictionary((uint64_t)v2);
  if (!v3)
    return 0;
  v4 = v3;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_0);
  xpc_connection_resume(mach_service);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msg", 101);
  xpc_dictionary_set_value(v6, "pld", v4);
  v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  v8 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v7);
  if (v8)
  {
    v9 = v8;
    Value = CFDictionaryGetValue(v8, CFSTR("replyObject"));
    v11 = Value;
    if (Value)
      CFRetain(Value);
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const void *CACRecognizeString(const void *a1, const void *a2)
{
  CFDictionaryRef v2;
  void *v3;
  void *v4;
  _xpc_connection_s *mach_service;
  xpc_object_t v6;
  xpc_object_t v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  const void *Value;
  const void *v11;
  const void *v13[2];
  void *keys[2];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24F2AAFD8;
  v13[0] = a1;
  v13[1] = a2;
  v2 = CFDictionaryCreate(0, (const void **)keys, v13, 2, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v2)
    return 0;
  v3 = CACCreateSerializedGenericActionDictionary((uint64_t)v2);
  if (!v3)
    return 0;
  v4 = v3;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_13);
  xpc_connection_resume(mach_service);
  v6 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v6, "msg", 101);
  xpc_dictionary_set_value(v6, "pld", v4);
  v7 = xpc_connection_send_message_with_reply_sync(mach_service, v6);
  v8 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v7);
  if (v8)
  {
    v9 = v8;
    Value = CFDictionaryGetValue(v8, CFSTR("replyObject"));
    v11 = Value;
    if (Value)
      CFRetain(Value);
    CFRelease(v9);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

const void *CACRequestInformationWithLocaleAndParams(void *a1, void *a2, void *a3)
{
  CFDictionaryRef v3;
  void *v4;
  void *v5;
  _xpc_connection_s *mach_service;
  xpc_object_t v7;
  xpc_object_t v8;
  const __CFDictionary *v9;
  const __CFDictionary *v10;
  const void *Value;
  void *values[3];
  void *keys[2];
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)keys = xmmword_24F2AB008;
  v15 = CFSTR("timeout");
  values[0] = a1;
  values[1] = a2;
  values[2] = a3;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (!v3)
    return 0;
  v4 = CACCreateSerializedGenericActionDictionary((uint64_t)v3);
  if (!v4)
    return 0;
  v5 = v4;
  mach_service = xpc_connection_create_mach_service("com.apple.speech.CommandAndControl.utility", 0, 0);
  xpc_connection_set_event_handler(mach_service, &__block_literal_global_16);
  xpc_connection_resume(mach_service);
  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_int64(v7, "msg", 102);
  xpc_dictionary_set_value(v7, "pld", v5);
  v8 = xpc_connection_send_message_with_reply_sync(mach_service, v7);
  v9 = (const __CFDictionary *)CACCreateDeserializedObject((uint64_t)v8);
  if (v9)
  {
    v10 = v9;
    Value = CFDictionaryGetValue(v9, CFSTR("replyObject"));
    CFRetain(Value);
    CFRelease(v10);
  }
  else
  {
    Value = 0;
  }

  return Value;
}

uint64_t OUTLINED_FUNCTION_0_0()
{
  return NSRequestConcreteImplementation();
}

void sub_229A4A6B8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229A4B768(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_229A4BEA4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A4C0E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void CACGetDeviceSupportsUserAttentionDetection(void *a1, void *a2)
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
    if (CACGetDeviceSupportsUserAttentionDetection_onceToken != -1)
      dispatch_once(&CACGetDeviceSupportsUserAttentionDetection_onceToken, &__block_literal_global_3);
    v6 = CACGetDeviceSupportsUserAttentionDetection_serialUserAttentionSupportQueue;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __CACGetDeviceSupportsUserAttentionDetection_block_invoke_2;
    v7[3] = &unk_24F2AA990;
    v8 = v3;
    v9 = v5;
    dispatch_async(v6, v7);

  }
}

void sub_229A50028(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A505D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229A52524(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A53734(void *a1)
{
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x229A53708);
}

void sub_229A540C8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A54154(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A553DC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A556D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A56628(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id NumberWithLog2BucketForIntegerValue(uint64_t a1)
{
  void *v2;

  if (a1 < 1)
    return &unk_24F2CE9B0;
  if (a1 == 1)
  {
    v2 = &unk_24F2CE9C8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithLong:", llround(log2((double)a1)));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

void sub_229A57AE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A57C38(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A58A48(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A58A9C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A58D2C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A58ED4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A59144(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A59244(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A5936C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A5A8D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A5AC14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A5AE84(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_229A5B4EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void sub_229A5BCB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void OUTLINED_FUNCTION_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

_BYTE *OUTLINED_FUNCTION_7(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

void sub_229A632F8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 24));
  _Unwind_Resume(a1);
}

void sub_229A63478(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void _NotificationLanguageSettingsChanged()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1213);
}

void _NotificationAlwaysShowOverlayTypeSettingsChanged()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1214);
}

void _NotificationOverlayOptionsSettingsChanged()
{
  void *v0;
  int v1;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "isActiveOverlayType:", CFSTR("NumberedGrid"));

  if (v1)
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1215);
}

void _NotificationCommandsSettingsChanged()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1216);
}

void _NotificationUserHintsSettingsChanged()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "synchronizeRecognizersWithReason:", kSRUISyncReasonRecognizersChanged);

}

void _NotificationAttentionBasedSettingsChanged()
{
  dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_1218);
}

void _NotificationLiveMicrophoneDidTurnOnAfterInterruption()
{
  void *v0;
  void *v1;
  char v2;
  void *v3;
  void *v4;
  char v5;
  id v6;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_microphoneTurnedOnAfterInteruption");

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "telephonyInterruptedListening");

  if ((v2 & 1) != 0)
  {
    v3 = &__block_literal_global_1219;
LABEL_5:
    dispatch_async(MEMORY[0x24BDAC9B8], v3);
    goto LABEL_6;
  }
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "_attentionIsLostWithListeningOffAction");

  if ((v5 & 1) == 0)
  {
    v3 = &__block_literal_global_1238;
    goto LABEL_5;
  }
LABEL_6:
  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTelephonyInterruptedListening:", 0);

}

void _NotificationLiveMicrophoneDidTurnOffAfterInterruption()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_microphoneTurnedOffAfterInteruption");

}

void _NotificationLiveMicrophoneDidTurnOn()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_microphoneTurnedOn");

}

void _NotificationLiveMicrophoneDidTurnOff()
{
  id v0;

  +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_microphoneTurnedOff");

}

void sub_229A69090(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A69400(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A69534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A695BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A69640(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A69A74(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A69AFC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6C368(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6C758(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6C924(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6CB8C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6CC00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6E2F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6E534(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6E5E4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6E6EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6F10C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_229A6F2A0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6F5F0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6F710(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6FD7C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A6FE34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A6FEE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A708CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A71A6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A71D5C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7257C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A72B14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A72D9C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A73080(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
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

void sub_229A736F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_229A75C10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A770E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A77C78(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_4_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void sub_229A7C514(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7C8D8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7C994(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void RXRelease(const void *a1)
{
  const char *label;
  _QWORD block[5];

  if (a1)
  {
    label = dispatch_queue_get_label(0);
    if (label && !strncmp(label, "com.apple.speech.RXAPIDispatchQueue", 0x23uLL))
    {
      CFRelease(a1);
    }
    else
    {
      CFRetain(a1);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __RXRelease_block_invoke;
      block[3] = &__block_descriptor_40_e5_v8__0l;
      block[4] = a1;
      dispatch_async((dispatch_queue_t)sRXAPIDispatchQueue, block);
    }
  }
}

void sub_229A7D7B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7D88C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7DA7C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7DB58(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7DDC8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A7E25C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7E84C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A7FFBC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A8007C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A80104(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A80560(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229A825A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

void sub_229A838C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

const __CFString *CACStringForUserAttentionGainEvent(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 3)
    return CFSTR("CACUserAttentionGainEventUndefined");
  else
    return off_24F2AC408[a1 - 1];
}

const __CFString *CACStringForUserAttentionLossEvent(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("CACUserAttentionLossEventUndefined");
  if (a1 == 1)
    v1 = CFSTR("CACUserAttentionLossEventFaceDetection");
  if (a1 == 2)
    return CFSTR("CACUserAttentionLossEventLowerDeviceGesture");
  else
    return v1;
}

void sub_229A888D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229A88A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void _handleNotification(uint64_t a1, uint64_t a2, void *a3)
{
  if (objc_msgSend(a3, "isEqualToString:", CFSTR("CACNotificationLanguageChanged")))
    dispatch_async(MEMORY[0x24BDAC9B8], &__block_literal_global_566);
}

void sub_229A905A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A90614(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void ___handleNotification_block_invoke()
{
  id v0;

  +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "_handleLanguageChanged");

}

void OUTLINED_FUNCTION_0_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

BOOL utility_tool_connection_entitled()
{
  void *v0;
  void *v1;
  _BOOL8 value;

  v0 = (void *)xpc_connection_copy_entitlement_value();
  v1 = v0;
  if (v0)
    value = xpc_BOOL_get_value(v0);
  else
    value = 0;

  return value;
}

void __utility_tool_event_handler_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  id v6;
  int64_t int64;
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
  double v18;
  id v19;
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
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  char v54;
  void *v55;
  uint64_t v56;
  int v57;
  void *v58;
  void *v59;
  void *v60;
  uint64_t v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  id v72;
  void *v73;
  __CFString *v74;
  const __CFString *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  void *v79;
  const __CFString *v80;
  uint64_t v81;
  void *v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  double v89;
  double v90;
  double v91;
  void *v92;
  void *v93;
  _xpc_connection_s *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  int v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  char isKindOfClass;
  void *v110;
  void *v111;
  void *v112;
  __CFString *v113;
  _QWORD v114[6];
  const __CFString *barrier;
  uint64_t v116;
  void (*v117)(uint64_t);
  void *v118;
  _xpc_connection_s *v119;
  void *v120;
  const __CFString *v121;
  _QWORD v122[3];

  v122[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (void *)MEMORY[0x22E2D5B84]();
  v5 = *(id *)(a1 + 32);
  v6 = v3;
  if (v6 == (id)MEMORY[0x24BDACF38])
  {
    v19 = v5;
    if (v19)
    {
      +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "commandsToIgnore");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      if (v21)
      {
        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "commandsToIgnore");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "removeAllObjects");

        +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setCommandsToIgnore:", 0);

        +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setShouldShowTextEditingOverlayInTutorial:", 1);

      }
      barrier = (const __CFString *)MEMORY[0x24BDAC760];
      v116 = 3221225472;
      v117 = __utility_tool_client_tearDown_block_invoke;
      v118 = &unk_24F2AA860;
      v119 = (_xpc_connection_s *)v19;
      xpc_connection_send_barrier(v119, &barrier);

    }
    +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "removeClient:", v19);

  }
  else
  {
    if (!utility_tool_connection_entitled())
    {
      v9 = (void *)CACCreateSerializedObject(objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", CFSTR("Unsupported client"), CFSTR("ErrorString"), 0));
      reply_to_event_with_object(v5, v6, v9);
      goto LABEL_16;
    }
    if (MEMORY[0x22E2D6004](v6) == MEMORY[0x24BDACFA0])
    {
      int64 = xpc_dictionary_get_int64(v6, "msg");
      xpc_dictionary_get_value(v6, "pld");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (int64 != 102)
      {
        if (int64 != 101)
          goto LABEL_16;
        v10 = (void *)CACCreateDeserializedGenericActionDictionary(v8);
        if (!v10)
          goto LABEL_16;
        v11 = v10;
        objc_msgSend(v10, "objectForKey:", CFSTR("timeout"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("cmTX"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("cxID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("ignoreCommand"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("getCorrections"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKey:", CFSTR("showTextEditingOverlay"));
        v108 = (void *)objc_claimAutoreleasedReturnValue();
        v111 = v15;
        v106 = v16;
        if (v13)
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v12, "doubleValue");
          else
            v18 = 10.0;
          objc_msgSend(v17, "synchronousRecognitionOfString:timeoutInterval:", v13, v18);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          if (objc_msgSend(v14, "length"))
          {
            v57 = objc_msgSend(v14, "isEqualToString:", CFSTR("ResetRecognizedCommandIdentifier"));
            +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v59 = v58;
            if (v57)
            {
              objc_msgSend(v58, "setRecognizedCommandIdentifier:", CFSTR("ResetRecognizedCommandIdentifier"));
            }
            else
            {
              objc_msgSend(v58, "handleCommandWithIdentifier:", v14);

              v59 = xpc_string_create("success");
              reply_to_event_with_object(v5, v6, v59);
            }
            goto LABEL_44;
          }
          if (objc_msgSend(v15, "length"))
          {
            v102 = objc_msgSend(v15, "isEqualToString:", CFSTR("ResetIgnoredCommands"));
            +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v63, "commandsToIgnore");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            v65 = v64;
            if (v102)
            {

              if (!v65)
                goto LABEL_45;
              +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "commandsToIgnore");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "removeAllObjects");
            }
            else
            {

              if (!v65)
              {
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v71 = (void *)objc_claimAutoreleasedReturnValue();
                v72 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                objc_msgSend(v71, "setCommandsToIgnore:", v72);

              }
              +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "commandsToIgnore");
              v62 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v62, "addObject:", v111);
            }
            goto LABEL_43;
          }
          if (objc_msgSend(v16, "length"))
          {
            +[CACPreferences sharedPreferences](CACPreferences, "sharedPreferences");
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v103, "bestLocaleIdentifier");
            v68 = (void *)objc_claimAutoreleasedReturnValue();
            +[CACCorrectionUtilities alternativesForString:languageIdentifier:](CACCorrectionUtilities, "alternativesForString:languageIdentifier:", v16, v68);
            v59 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v59, "count"))
            {
              +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
              v69 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v69, "setPhoneticAlternative:", 0);

              +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
              v104 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "objectAtIndexedSubscript:", 0);
              v70 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v104, "setPhoneticAlternative:", v70);

            }
            goto LABEL_44;
          }
          if (objc_msgSend(v108, "length"))
          {
            if (objc_msgSend(v108, "isEqualToString:", CFSTR("DisableTextEditingOverlay")))
            {
              +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v77;
              v78 = 0;
            }
            else
            {
              if (!objc_msgSend(v108, "isEqualToString:", CFSTR("ResetTextEditingOverlay")))
                goto LABEL_45;
              +[CACDisplayManager sharedManager](CACDisplayManager, "sharedManager");
              v77 = (void *)objc_claimAutoreleasedReturnValue();
              v59 = v77;
              v78 = 1;
            }
            objc_msgSend(v77, "setShouldShowTextEditingOverlayInTutorial:", v78);
            goto LABEL_44;
          }
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v105 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("cmID"));
          v99 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "objectForKey:", CFSTR("params"));
          v97 = (void *)objc_claimAutoreleasedReturnValue();
          if (v12)
            objc_msgSend(v12, "doubleValue");
          else
            v83 = 10.0;
          objc_msgSend(v105, "synchronousRecognitionUsingCommandIdentifier:parameters:timeoutInterval:", v99, v97, v83);
          v59 = (void *)objc_claimAutoreleasedReturnValue();

        }
        v62 = (void *)CACCreateSerializedObject((uint64_t)v59);
        reply_to_event_with_object(v5, v6, v62);
LABEL_43:

LABEL_44:
LABEL_45:
        CFRelease(v11);

        goto LABEL_16;
      }
      v27 = (void *)CACCreateDeserializedGenericActionDictionary(v8);
      if (v27)
      {
        v28 = v27;
        objc_msgSend(v27, "objectForKey:", CFSTR("localeID"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectForKey:", CFSTR("params"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "firstObject");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v31, "caseInsensitiveCompare:", CFSTR("allCommands"));

        if (v32)
        {
          objc_msgSend(v30, "firstObject");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v34 = objc_msgSend(v33, "caseInsensitiveCompare:", CFSTR("activeCommands"));

          if (v34)
          {
            objc_msgSend(v30, "firstObject");
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v36 = objc_msgSend(v35, "caseInsensitiveCompare:", CFSTR("groupedCommands"));

            if (v36)
            {
              objc_msgSend(v30, "firstObject");
              v37 = (void *)objc_claimAutoreleasedReturnValue();
              v38 = objc_msgSend(v37, "caseInsensitiveCompare:", CFSTR("contextSummary"));

              if (v38)
              {
                objc_msgSend(v30, "firstObject");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                v40 = objc_msgSend(v39, "caseInsensitiveCompare:", CFSTR("customCommands"));

                if (v40)
                {
                  objc_msgSend(v30, "firstObject");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  v42 = objc_msgSend(v41, "caseInsensitiveCompare:", CFSTR("listeningStatus"));

                  if (v42)
                  {
                    objc_msgSend(v30, "firstObject");
                    v43 = (void *)objc_claimAutoreleasedReturnValue();
                    v44 = objc_msgSend(v43, "caseInsensitiveCompare:", CFSTR("overlayStatus"));

                    if (v44)
                    {
                      objc_msgSend(v30, "firstObject");
                      v45 = (void *)objc_claimAutoreleasedReturnValue();
                      v46 = objc_msgSend(v45, "caseInsensitiveCompare:", CFSTR("dictationStatus"));

                      if (v46)
                      {
                        objc_msgSend(v30, "firstObject");
                        v47 = (void *)objc_claimAutoreleasedReturnValue();
                        v48 = objc_msgSend(v47, "caseInsensitiveCompare:", CFSTR("ComputeGridPath"));

                        if (!v48)
                        {
                          if ((unint64_t)objc_msgSend(v30, "count") < 5)
                            goto LABEL_86;
                          objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
                          v49 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_opt_class();
                          if ((objc_opt_isKindOfClass() & 1) != 0)
                          {
                            objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
                            v50 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_opt_class();
                            if ((objc_opt_isKindOfClass() & 1) != 0)
                            {
                              objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
                              v51 = (void *)objc_claimAutoreleasedReturnValue();
                              objc_opt_class();
                              v112 = v51;
                              if ((objc_opt_isKindOfClass() & 1) != 0)
                              {
                                objc_msgSend(v30, "objectAtIndexedSubscript:", 4);
                                v52 = (void *)objc_claimAutoreleasedReturnValue();
                                objc_opt_class();
                                isKindOfClass = objc_opt_isKindOfClass();

                                if ((isKindOfClass & 1) != 0)
                                {
                                  objc_msgSend(v30, "objectAtIndexedSubscript:", 1);
                                  v113 = (__CFString *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v30, "objectAtIndexedSubscript:", 2);
                                  v110 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v30, "objectAtIndexedSubscript:", 3);
                                  v107 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v30, "objectAtIndexedSubscript:", 4);
                                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                                  if ((unint64_t)objc_msgSend(v30, "count") >= 6
                                    && (objc_msgSend(v30, "objectAtIndexedSubscript:", 5),
                                        v53 = (void *)objc_claimAutoreleasedReturnValue(),
                                        objc_opt_class(),
                                        v54 = objc_opt_isKindOfClass(),
                                        v53,
                                        (v54 & 1) != 0))
                                  {
                                    objc_msgSend(v30, "objectAtIndexedSubscript:", 5);
                                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                                    v56 = objc_msgSend(v55, "unsignedIntValue");

                                  }
                                  else
                                  {
                                    v56 = 0;
                                  }
                                  -[__CFString doubleValue](v113, "doubleValue");
                                  v85 = v84;
                                  objc_msgSend(v110, "doubleValue");
                                  v87 = v86;
                                  objc_msgSend(v107, "doubleValue");
                                  v89 = v88;
                                  objc_msgSend(v101, "doubleValue");
                                  v91 = v90;
                                  +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
                                  v92 = (void *)objc_claimAutoreleasedReturnValue();
                                  objc_msgSend(v92, "gridNumberToHitRect:displayID:", v56, v85, v87, v89, v91);
                                  v93 = (void *)objc_claimAutoreleasedReturnValue();

                                  v98 = v93;
                                  objc_msgSend(v93, "objectForKey:", CFSTR("error"));
                                  v100 = (void *)objc_claimAutoreleasedReturnValue();
                                  if (v100)
                                  {
                                    v114[0] = CFSTR("ComputeGridPathResult");
                                    v121 = CFSTR("error");
                                    v122[0] = v100;
                                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
                                    v94 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
                                    barrier = (const __CFString *)v94;
                                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &barrier, v114, 1);
                                    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
                                  }
                                  else
                                  {
                                    v121 = CFSTR("ComputeGridPathResult");
                                    v114[0] = CFSTR("PointX");
                                    v114[1] = CFSTR("PointY");
                                    barrier = v113;
                                    v116 = (uint64_t)v110;
                                    v114[2] = CFSTR("Width");
                                    v114[3] = CFSTR("Height");
                                    v117 = (void (*)(uint64_t))v107;
                                    v118 = v101;
                                    v114[4] = CFSTR("Path");
                                    objc_msgSend(v93, "objectForKey:", CFSTR("number"));
                                    v94 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
                                    v119 = v94;
                                    v114[5] = CFSTR("IsFinal");
                                    objc_msgSend(v93, "objectForKey:", CFSTR("isFinal"));
                                    v96 = (void *)objc_claimAutoreleasedReturnValue();
                                    v120 = v96;
                                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &barrier, v114, 6);
                                    v95 = (void *)objc_claimAutoreleasedReturnValue();
                                    v122[0] = v95;
                                    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v122, &v121, 1);
                                    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

                                  }
                                  goto LABEL_87;
                                }
LABEL_86:
                                v74 = (__CFString *)&unk_24F2CF6C0;
LABEL_87:
                                v81 = (uint64_t)v74;
LABEL_73:
                                v82 = (void *)CACCreateSerializedObject(v81);
                                if (v82)
                                  reply_to_event_with_object(v5, v6, v82);

                                goto LABEL_56;
                              }

                            }
                          }

                          goto LABEL_86;
                        }
LABEL_56:
                        CFRelease(v28);

                        goto LABEL_16;
                      }
                      +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
                      v79 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v79, "dictationStatus");
                      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      v75 = CFSTR("DictationStatusString");
                    }
                    else
                    {
                      +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
                      v76 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v76, "overlayStatus");
                      v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

                      v75 = CFSTR("OverlayStatusString");
                    }
                  }
                  else
                  {
                    +[CACUtilityToolServer sharedInstance](CACUtilityToolServer, "sharedInstance");
                    v73 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v73, "listeningStatus");
                    v74 = (__CFString *)objc_claimAutoreleasedReturnValue();

                    v75 = CFSTR("ListeningStatusString");
                  }
                  v114[0] = v75;
                  if (v74)
                    v80 = v74;
                  else
                    v80 = &stru_24F2ADCC8;
                  barrier = v80;
                  v81 = objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &barrier, v114, 1);
                  goto LABEL_73;
                }
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "allCustomCommandsDetail");
                v61 = objc_claimAutoreleasedReturnValue();
              }
              else
              {
                +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "contextSummary");
                v61 = objc_claimAutoreleasedReturnValue();
              }
            }
            else
            {
              +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "groupedCommandsForLocaleIdentifier:", v29);
              v61 = objc_claimAutoreleasedReturnValue();
            }
          }
          else
          {
            +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "activeCommandsForLocaleIdentifier:", v29);
            v61 = objc_claimAutoreleasedReturnValue();
          }
        }
        else
        {
          +[CACSpokenCommandManager sharedCACSpokenCommandManager](CACSpokenCommandManager, "sharedCACSpokenCommandManager");
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v60, "allCommandsForLocaleIdentifier:", v29);
          v61 = objc_claimAutoreleasedReturnValue();
        }
        v66 = (void *)v61;

        v67 = (void *)CACCreateSerializedObject((uint64_t)v66);
        reply_to_event_with_object(v5, v6, v67);

        goto LABEL_56;
      }
LABEL_16:

    }
  }

  objc_autoreleasePoolPop(v4);
}

void reply_to_event_with_object(void *a1, void *a2, void *a3)
{
  id v5;
  xpc_object_t reply;
  void *v7;
  _xpc_connection_s *connection;

  connection = a1;
  v5 = a3;
  reply = xpc_dictionary_create_reply(a2);
  if (reply)
  {
    v7 = (void *)os_transaction_create();
    xpc_dictionary_set_value(reply, "replyObject", v5);
    xpc_connection_send_message(connection, reply);

  }
}

void __utility_tool_client_tearDown_block_invoke(uint64_t a1)
{
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
}

void sub_229A941F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

id CACLogAccessibility()
{
  if (CACLogAccessibility_onceToken != -1)
    dispatch_once(&CACLogAccessibility_onceToken, &__block_literal_global_30);
  return (id)CACLogAccessibility_sLogAccessibility;
}

id CACLogAudio()
{
  if (CACLogAudio_onceToken != -1)
    dispatch_once(&CACLogAudio_onceToken, &__block_literal_global_1_0);
  return (id)CACLogAudio_sLogAudio;
}

id CACLogContext()
{
  if (CACLogContext_onceToken != -1)
    dispatch_once(&CACLogContext_onceToken, &__block_literal_global_2);
  return (id)CACLogContext_sLogContext;
}

id CACLogDictationCommands()
{
  if (CACLogDictationCommands_onceToken != -1)
    dispatch_once(&CACLogDictationCommands_onceToken, &__block_literal_global_3_0);
  return (id)CACLogDictationCommands_sLogDictationCommands;
}

id CACLogElementCollection()
{
  if (CACLogElementCollection_onceToken != -1)
    dispatch_once(&CACLogElementCollection_onceToken, &__block_literal_global_4);
  return (id)CACLogElementCollection_sLogElementCollection;
}

id CACLogElementEvaluation()
{
  if (CACLogElementEvaluation_onceToken != -1)
    dispatch_once(&CACLogElementEvaluation_onceToken, &__block_literal_global_5);
  return (id)CACLogElementEvaluation_sLogElementEvaluation;
}

id CACLogFindAndSelect()
{
  if (CACLogFindAndSelect_onceToken != -1)
    dispatch_once(&CACLogFindAndSelect_onceToken, &__block_literal_global_6);
  return (id)CACLogFindAndSelect_sLogFindAndSelect;
}

id CACLogGeneral()
{
  if (CACLogGeneral_onceToken != -1)
    dispatch_once(&CACLogGeneral_onceToken, &__block_literal_global_7);
  return (id)CACLogGeneral_sLogGeneral;
}

id CACLogPreferences()
{
  if (CACLogPreferences_onceToken != -1)
    dispatch_once(&CACLogPreferences_onceToken, &__block_literal_global_8);
  return (id)CACLogPreferences_sLogPreferences;
}

id CACLogRecognition()
{
  if (CACLogRecognition_onceToken != -1)
    dispatch_once(&CACLogRecognition_onceToken, &__block_literal_global_9_0);
  return (id)CACLogRecognition_sLogRecognition;
}

id CACLogWordParse()
{
  if (CACLogWordParse_onceToken != -1)
    dispatch_once(&CACLogWordParse_onceToken, &__block_literal_global_10);
  return (id)CACLogWordParse_sLogWordParse;
}

id CACLogBugReporter()
{
  if (CACLogBugReporter_onceToken != -1)
    dispatch_once(&CACLogBugReporter_onceToken, &__block_literal_global_11_0);
  return (id)CACLogBugReporter_sLogBugReporter;
}

id CACLogAttentionAware()
{
  if (CACLogAttentionAware_onceToken != -1)
    dispatch_once(&CACLogAttentionAware_onceToken, &__block_literal_global_12);
  return (id)CACLogAttentionAware_sLogAttentionAware;
}

id CACLogShortcuts()
{
  if (CACLogShortcuts_onceToken != -1)
    dispatch_once(&CACLogShortcuts_onceToken, &__block_literal_global_13_0);
  return (id)CACLogShortcuts_sLogShortcuts;
}

id CACLogCorrections()
{
  if (CACLogCorrections_onceToken != -1)
    dispatch_once(&CACLogCorrections_onceToken, &__block_literal_global_14);
  return (id)CACLogCorrections_sLogCorrections;
}

id CACLogGrid()
{
  if (CACLogGrid_onceToken != -1)
    dispatch_once(&CACLogGrid_onceToken, &__block_literal_global_15);
  return (id)CACLogGrid_sLogGrid;
}

id CACLogAssetDownload()
{
  if (CACLogAssetDownload_onceToken != -1)
    dispatch_once(&CACLogAssetDownload_onceToken, &__block_literal_global_16_0);
  return (id)CACLogAssetDownload_sLogAssetDownload;
}

id CACLogGestureRecording()
{
  if (CACLogGestureRecording_onceToken != -1)
    dispatch_once(&CACLogGestureRecording_onceToken, &__block_literal_global_17);
  return (id)CACLogGestureRecording_sLogGestureRecording;
}

id CACLogAdditionalLogging()
{
  if (CACLogAdditionalLogging_onceToken != -1)
    dispatch_once(&CACLogAdditionalLogging_onceToken, &__block_literal_global_18);
  return (id)CACLogAdditionalLogging_sLogAdditionalLogging;
}

id AXMRLogVoiceControl()
{
  if (AXMRLogVoiceControl_onceToken != -1)
    dispatch_once(&AXMRLogVoiceControl_onceToken, &__block_literal_global_19);
  return (id)AXMRLogVoiceControl_sMRLogVoiceControl;
}

uint64_t CACZWLensInnerColor()
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.564705882, 0.564705882, 0.619607843, 1.0);
}

uint64_t CACZWLensOuterColor()
{
  return objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithRed:green:blue:alpha:", 0.494117647, 0.494117647, 0.552941176, 1.0);
}

double CACZWZoomLensBorderThicknessForTouches()
{
  return 30.0;
}

double CACZWDefaultFadeAnimationDuration()
{
  return 0.2;
}

double CACZWDefaultZoomAnimationDuration()
{
  return 0.2;
}

double CACZWLensInnerBorderWidth()
{
  return 2.0;
}

double CACZWLensOuterBorderWidth()
{
  return 2.0;
}

double CACZWLensCornerRadius()
{
  return 10.0;
}

double CACZWZoomEdgeSlackAmount()
{
  return 10.0;
}

double CACZOTMainScreenSize()
{
  if (CACZOTMainScreenSize_onceToken != -1)
    dispatch_once(&CACZOTMainScreenSize_onceToken, &__block_literal_global_31);
  return *(double *)&CACZOTMainScreenSize_ScreenSize_0;
}

double CACZOTMainScreenRect()
{
  CACZOTMainScreenSize();
  return 0.0;
}

id CACZWInnerLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  id v10;
  void *v11;
  id v12;
  double MinX;
  double MidX;
  double MaxX;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v10 = objc_alloc_init(MEMORY[0x24BEBD420]);
  v11 = v10;
  if ((a1 & 1) != 0)
  {
    v12 = v10;
    v33.origin.x = a2;
    v33.origin.y = a3;
    v33.size.width = a4;
    v33.size.height = a5;
    MinX = CGRectGetMinX(v33);
    v34.origin.x = a2;
    v34.origin.y = a3;
    v34.size.width = a4;
    v34.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MinX, CGRectGetMinY(v34), 13.0, 1.44079633, 0.13);
    v35.origin.x = a2;
    v35.origin.y = a3;
    v35.size.width = a4;
    v35.size.height = a5;
    MidX = CGRectGetMidX(v35);
    v36.origin.x = a2;
    v36.origin.y = a3;
    v36.size.width = a4;
    v36.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MidX, CGRectGetMinY(v36), 13.0, -3.27159265, 0.13);
    v37.origin.x = a2;
    v37.origin.y = a3;
    v37.size.width = a4;
    v37.size.height = a5;
    MaxX = CGRectGetMaxX(v37);
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, MaxX, CGRectGetMinY(v38), 13.0, -3.27159265, 1.70079633);
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    v16 = CGRectGetMaxX(v39);
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v16, CGRectGetMidY(v40), 13.0, -1.70079633, 1.70079633);
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    v17 = CGRectGetMaxX(v41);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v17, CGRectGetMaxY(v42), 13.0, -1.70079633, -3.01159265);
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    v18 = CGRectGetMidX(v43);
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v18, CGRectGetMaxY(v44), 13.0, -0.13, -3.01159265);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    v19 = CGRectGetMinX(v45);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v19, CGRectGetMaxY(v46), 13.0, -0.13, -1.44079633);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    v20 = CGRectGetMinX(v47);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v20, CGRectGetMidY(v48), 13.0, 1.44079633, -1.44079633);
    objc_msgSend(v12, "closePath");

  }
  else
  {
    v21 = a5 + -4.0;
    v22 = a4 + -4.0;
    v23 = a3 + 2.0;
    v24 = a2 + 2.0;
    v25 = (void *)MEMORY[0x24BEBD420];
    v49.origin.x = v24;
    v49.origin.y = v23;
    v49.size.width = v22;
    v49.size.height = v21;
    v26 = CGRectGetMinX(v49) + 9.0;
    v50.origin.x = v24;
    v50.origin.y = v23;
    v50.size.width = v22;
    v50.size.height = v21;
    objc_msgSend(v25, "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", 1, v26, CGRectGetMinY(v50) + 9.0, 9.0, -3.14159265, -1.57079633);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    v51.origin.x = v24;
    v51.origin.y = v23;
    v51.size.width = v22;
    v51.size.height = v21;
    v27 = CGRectGetMaxX(v51) + -9.0;
    v52.origin.x = v24;
    v52.origin.y = v23;
    v52.size.width = v22;
    v52.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, CGRectGetMinY(v52) + 9.0, 9.0, -1.57079633, 0.0);
    v53.origin.x = v24;
    v53.origin.y = v23;
    v53.size.width = v22;
    v53.size.height = v21;
    v28 = CGRectGetMaxX(v53) + -9.0;
    v54.origin.x = v24;
    v54.origin.y = v23;
    v54.size.width = v22;
    v54.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v28, CGRectGetMaxY(v54) + -9.0, 9.0, 0.0, 1.57079633);
    v55.origin.x = v24;
    v55.origin.y = v23;
    v55.size.width = v22;
    v55.size.height = v21;
    v29 = CGRectGetMinX(v55) + 9.0;
    v56.origin.x = v24;
    v56.origin.y = v23;
    v56.size.width = v22;
    v56.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v29, CGRectGetMaxY(v56));
    v57.origin.x = v24;
    v57.origin.y = v23;
    v57.size.width = v22;
    v57.size.height = v21;
    v30 = CGRectGetMinX(v57) + 9.0;
    v58.origin.x = v24;
    v58.origin.y = v23;
    v58.size.width = v22;
    v58.size.height = v21;
    objc_msgSend(v12, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v30, CGRectGetMaxY(v58) + -9.0, 9.0, 1.57079633, 3.14159265);
    v59.origin.x = v24;
    v59.origin.y = v23;
    v59.size.width = v22;
    v59.size.height = v21;
    v31 = CGRectGetMinX(v59);
    v60.origin.x = v24;
    v60.origin.y = v23;
    v60.size.width = v22;
    v60.size.height = v21;
    objc_msgSend(v12, "addLineToPoint:", v31, CGRectGetMinY(v60) + 9.0);
  }
  return v12;
}

id CACZWOuterLensBorderForBounds(char a1, CGFloat a2, CGFloat a3, CGFloat a4, CGFloat a5)
{
  void *v10;
  double MinX;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  double MidX;
  CGFloat v18;
  double MaxX;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat v24;
  double v25;
  CGFloat v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGFloat v31;
  CGFloat v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;

  objc_msgSend(MEMORY[0x24BEBD420], "bezierPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37.origin.x = a2;
  v37.origin.y = a3;
  v37.size.width = a4;
  v37.size.height = a5;
  MinX = CGRectGetMinX(v37);
  v12 = a2;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  if ((a1 & 1) != 0)
  {
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX, CGRectGetMinY(*(CGRect *)&v12), 11.0, 0.0);
    v38.origin.x = a2;
    v38.origin.y = a3;
    v38.size.width = a4;
    v38.size.height = a5;
    v16 = CGRectGetMinX(v38) + 11.0;
    v39.origin.x = a2;
    v39.origin.y = a3;
    v39.size.width = a4;
    v39.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v16, CGRectGetMinY(v39));
    v40.origin.x = a2;
    v40.origin.y = a3;
    v40.size.width = a4;
    v40.size.height = a5;
    MidX = CGRectGetMidX(v40);
    v41.origin.x = a2;
    v41.origin.y = a3;
    v41.size.width = a4;
    v41.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v41), 11.0, -3.14159265, 3.14159265);
    v42.origin.x = a2;
    v42.origin.y = a3;
    v42.size.width = a4;
    v42.size.height = a5;
    v18 = CGRectGetMidX(v42) + 11.0;
    v43.origin.x = a2;
    v43.origin.y = a3;
    v43.size.width = a4;
    v43.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v18, CGRectGetMinY(v43));
    v44.origin.x = a2;
    v44.origin.y = a3;
    v44.size.width = a4;
    v44.size.height = a5;
    MaxX = CGRectGetMaxX(v44);
    v45.origin.x = a2;
    v45.origin.y = a3;
    v45.size.width = a4;
    v45.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v45), 11.0, -3.14159265, 3.14159265);
    v46.origin.x = a2;
    v46.origin.y = a3;
    v46.size.width = a4;
    v46.size.height = a5;
    v20 = CGRectGetMaxX(v46);
    v47.origin.x = a2;
    v47.origin.y = a3;
    v47.size.width = a4;
    v47.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v20, CGRectGetMinY(v47) + 11.0);
    v48.origin.x = a2;
    v48.origin.y = a3;
    v48.size.width = a4;
    v48.size.height = a5;
    v21 = CGRectGetMaxX(v48);
    v49.origin.x = a2;
    v49.origin.y = a3;
    v49.size.width = a4;
    v49.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v21, CGRectGetMidY(v49), 11.0, -1.57079633, 4.71238898);
    v50.origin.x = a2;
    v50.origin.y = a3;
    v50.size.width = a4;
    v50.size.height = a5;
    v22 = CGRectGetMaxX(v50);
    v51.origin.x = a2;
    v51.origin.y = a3;
    v51.size.width = a4;
    v51.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v22, CGRectGetMidY(v51) + 11.0);
    v52.origin.x = a2;
    v52.origin.y = a3;
    v52.size.width = a4;
    v52.size.height = a5;
    v23 = CGRectGetMaxX(v52);
    v53.origin.x = a2;
    v53.origin.y = a3;
    v53.size.width = a4;
    v53.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v23, CGRectGetMaxY(v53), 11.0, -1.57079633, 4.71238898);
    v54.origin.x = a2;
    v54.origin.y = a3;
    v54.size.width = a4;
    v54.size.height = a5;
    v24 = CGRectGetMaxX(v54) + -11.0;
    v55.origin.x = a2;
    v55.origin.y = a3;
    v55.size.width = a4;
    v55.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v24, CGRectGetMaxY(v55));
    v56.origin.x = a2;
    v56.origin.y = a3;
    v56.size.width = a4;
    v56.size.height = a5;
    v25 = CGRectGetMidX(v56);
    v57.origin.x = a2;
    v57.origin.y = a3;
    v57.size.width = a4;
    v57.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v25, CGRectGetMaxY(v57), 11.0, 0.0, 6.28318531);
    v58.origin.x = a2;
    v58.origin.y = a3;
    v58.size.width = a4;
    v58.size.height = a5;
    v26 = CGRectGetMidX(v58) + -11.0;
    v59.origin.x = a2;
    v59.origin.y = a3;
    v59.size.width = a4;
    v59.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v26, CGRectGetMaxY(v59));
    v60.origin.x = a2;
    v60.origin.y = a3;
    v60.size.width = a4;
    v60.size.height = a5;
    v27 = CGRectGetMinX(v60);
    v61.origin.x = a2;
    v61.origin.y = a3;
    v61.size.width = a4;
    v61.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v27, CGRectGetMaxY(v61), 11.0, 0.0, 6.28318531);
    v62.origin.x = a2;
    v62.origin.y = a3;
    v62.size.width = a4;
    v62.size.height = a5;
    v28 = CGRectGetMinX(v62);
    v63.origin.x = a2;
    v63.origin.y = a3;
    v63.size.width = a4;
    v63.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v28, CGRectGetMaxY(v63) + -11.0);
    v64.origin.x = a2;
    v64.origin.y = a3;
    v64.size.width = a4;
    v64.size.height = a5;
    v29 = CGRectGetMinX(v64);
    v65.origin.x = a2;
    v65.origin.y = a3;
    v65.size.width = a4;
    v65.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v29, CGRectGetMidY(v65), 11.0, 1.57079633, 7.85398163);
    v66.origin.x = a2;
    v66.origin.y = a3;
    v66.size.width = a4;
    v66.size.height = a5;
    v30 = CGRectGetMinX(v66);
    v67.origin.x = a2;
    v67.origin.y = a3;
    v67.size.width = a4;
    v67.size.height = a5;
    objc_msgSend(v10, "moveToPoint:", v30, CGRectGetMidY(v67) + -11.0);
  }
  else
  {
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX + 11.0, CGRectGetMinY(*(CGRect *)&v12) + 11.0, 11.0, -3.14159265, -1.57079633);
    v68.origin.x = a2;
    v68.origin.y = a3;
    v68.size.width = a4;
    v68.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, CGRectGetMaxX(v68) + -11.0, 11.0, 11.0, -1.57079633, 0.0);
    v69.origin.x = a2;
    v69.origin.y = a3;
    v69.size.width = a4;
    v69.size.height = a5;
    v31 = CGRectGetMaxX(v69) + -11.0;
    v70.origin.x = a2;
    v70.origin.y = a3;
    v70.size.width = a4;
    v70.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v31, CGRectGetMaxY(v70) + -11.0, 11.0, 0.0, 1.57079633);
    v71.origin.x = a2;
    v71.origin.y = a3;
    v71.size.width = a4;
    v71.size.height = a5;
    v32 = CGRectGetMidX(v71) + 25.0 + -1.0;
    v72.origin.x = a2;
    v72.origin.y = a3;
    v72.size.width = a4;
    v72.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 0, v32, CGRectGetMaxY(v72), 0.0, 0.0, -1.57079633);
    v73.origin.x = a2;
    v73.origin.y = a3;
    v73.size.width = a4;
    v73.size.height = a5;
    v33 = CGRectGetMinX(v73) + 11.0;
    v74.origin.x = a2;
    v74.origin.y = a3;
    v74.size.width = a4;
    v74.size.height = a5;
    objc_msgSend(v10, "addLineToPoint:", v33, CGRectGetMaxY(v74));
    v75.origin.x = a2;
    v75.origin.y = a3;
    v75.size.width = a4;
    v75.size.height = a5;
    v34 = CGRectGetMinX(v75) + 11.0;
    v76.origin.x = a2;
    v76.origin.y = a3;
    v76.size.width = a4;
    v76.size.height = a5;
    objc_msgSend(v10, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v34, CGRectGetMaxY(v76) + -11.0, 11.0, 1.57079633, 3.14159265);
  }
  v77.origin.x = a2;
  v77.origin.y = a3;
  v77.size.width = a4;
  v77.size.height = a5;
  v35 = CGRectGetMinX(v77);
  v78.origin.x = a2;
  v78.origin.y = a3;
  v78.size.width = a4;
  v78.size.height = a5;
  objc_msgSend(v10, "addLineToPoint:", v35, CGRectGetMinY(v78) + 11.0);
  return v10;
}

id CACZWResizeGrabberPath(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4)
{
  id v8;
  double MinX;
  double MidX;
  double MaxX;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect v30;
  CGRect v31;
  CGRect v32;
  CGRect v33;

  v8 = objc_alloc_init(MEMORY[0x24BEBD420]);
  v18.origin.x = a1;
  v18.origin.y = a2;
  v18.size.width = a3;
  v18.size.height = a4;
  MinX = CGRectGetMinX(v18);
  v19.origin.x = a1;
  v19.origin.y = a2;
  v19.size.width = a3;
  v19.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MinX, CGRectGetMinY(v19), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v20.origin.x = a1;
  v20.origin.y = a2;
  v20.size.width = a3;
  v20.size.height = a4;
  MidX = CGRectGetMidX(v20);
  v21.origin.x = a1;
  v21.origin.y = a2;
  v21.size.width = a3;
  v21.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MidX, CGRectGetMinY(v21), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v22.origin.x = a1;
  v22.origin.y = a2;
  v22.size.width = a3;
  v22.size.height = a4;
  MaxX = CGRectGetMaxX(v22);
  v23.origin.x = a1;
  v23.origin.y = a2;
  v23.size.width = a3;
  v23.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, MaxX, CGRectGetMinY(v23), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v24.origin.x = a1;
  v24.origin.y = a2;
  v24.size.width = a3;
  v24.size.height = a4;
  v12 = CGRectGetMinX(v24);
  v25.origin.x = a1;
  v25.origin.y = a2;
  v25.size.width = a3;
  v25.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v12, CGRectGetMidY(v25), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v26.origin.x = a1;
  v26.origin.y = a2;
  v26.size.width = a3;
  v26.size.height = a4;
  v13 = CGRectGetMaxX(v26);
  v27.origin.x = a1;
  v27.origin.y = a2;
  v27.size.width = a3;
  v27.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v13, CGRectGetMidY(v27), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v28.origin.x = a1;
  v28.origin.y = a2;
  v28.size.width = a3;
  v28.size.height = a4;
  v14 = CGRectGetMinX(v28);
  v29.origin.x = a1;
  v29.origin.y = a2;
  v29.size.width = a3;
  v29.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v14, CGRectGetMaxY(v29), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v30.origin.x = a1;
  v30.origin.y = a2;
  v30.size.width = a3;
  v30.size.height = a4;
  v15 = CGRectGetMidX(v30);
  v31.origin.x = a1;
  v31.origin.y = a2;
  v31.size.width = a3;
  v31.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v15, CGRectGetMaxY(v31), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  v32.origin.x = a1;
  v32.origin.y = a2;
  v32.size.width = a3;
  v32.size.height = a4;
  v16 = CGRectGetMaxX(v32);
  v33.origin.x = a1;
  v33.origin.y = a2;
  v33.size.width = a3;
  v33.size.height = a4;
  objc_msgSend(v8, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", 1, v16, CGRectGetMaxY(v33), 10.0, -3.14159265, 3.14159265);
  objc_msgSend(v8, "closePath");
  return v8;
}

uint64_t NSStringFromCATransform3D(_QWORD *a1)
{
  return objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("\n[%f, %f, %f, %f,\n %f, %f, %f, %f,\n %f, %f, %f, %f,\n %f, %f, %f, %f]"), *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13], a1[14], a1[15]);
}

void sub_229A987A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A98B6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A98D44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A98EA8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A98FE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A99138(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A992B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A9940C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A9955C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A996AC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229A9EA54(_Unwind_Exception *a1)
{
  _Block_object_dispose(&STACK[0x430], 8);
  _Unwind_Resume(a1);
}

void sub_229AA36D8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229AA3814(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_229AA4FE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, ...)
{
  va_list va;

  va_start(va, a17);
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

void OUTLINED_FUNCTION_0_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void sub_229AA9D30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

__CFString *CACNonNilStringWithinLengthLimit(void *a1, uint64_t a2, unint64_t a3)
{
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __CFString *v11;
  _QWORD v13[4];
  id v14;
  __CFString *v15;
  _QWORD *v16;
  _QWORD *v17;
  uint64_t v18;
  _QWORD v19[6];
  _QWORD v20[4];

  v5 = a1;
  v6 = v5;
  if (v5)
    v7 = v5;
  else
    v7 = &stru_24F2ADCC8;
  if (-[__CFString length](v7, "length") >= a3)
  {
    objc_msgSend(MEMORY[0x24BDD16A8], "string");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = 0;
    v20[1] = v20;
    v20[2] = 0x2020000000;
    v20[3] = 0;
    v19[0] = 0;
    v19[1] = v19;
    v19[2] = 0x3010000000;
    v19[4] = 0;
    v19[5] = 0;
    v19[3] = &unk_229AE1DD3;
    v9 = -[__CFString length](v7, "length");
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __CACNonNilStringWithinLengthLimit_block_invoke;
    v13[3] = &unk_24F2ACE48;
    v16 = v20;
    v10 = v8;
    v14 = v10;
    v11 = v7;
    v15 = v11;
    v17 = v19;
    v18 = a2;
    -[__CFString enumerateSubstringsInRange:options:usingBlock:](v11, "enumerateSubstringsInRange:options:usingBlock:", 0, v9, 3, v13);
    v7 = (__CFString *)v10;

    _Block_object_dispose(v19, 8);
    _Block_object_dispose(v20, 8);
  }

  return v7;
}

void sub_229AAA910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  uint64_t v11;
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v11 - 96), 8);
  _Unwind_Resume(a1);
}

void sub_229AAAEE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AAB1A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AABAB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AABB24(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AAD2F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_229AAFE50(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_229AB7874(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,char a37)
{
  _Block_object_dispose(&a37, 8);
  _Unwind_Resume(a1);
}

void sub_229ABC59C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229ABC620(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229ABC6C0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229ABF7AC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_229ABF844(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229ABFBF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229ABFD28(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_229ABFDA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229ABFF00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC002C(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

void sub_229AC01A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC0224(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC02C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC0430(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC04D4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_229AC08B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void *CACCreateSerializedGenericActionDictionary(uint64_t a1)
{
  void *v1;

  if (!a1)
    return 0;
  v1 = (void *)_CFXPCCreateXPCObjectFromCFObject();
  if (!xpc_dictionary_get_count(v1))
  {

    return 0;
  }
  return v1;
}

uint64_t CACCreateDeserializedGenericActionDictionary(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;

  v1 = a1;
  v2 = v1;
  if (v1 && MEMORY[0x22E2D6004](v1) == MEMORY[0x24BDACFA0])
    v3 = _CFXPCCreateCFObjectFromXPCObject();
  else
    v3 = 0;

  return v3;
}

uint64_t CACCreateSerializedObject(uint64_t result)
{
  if (result)
    return _CFXPCCreateXPCObjectFromCFObject();
  return result;
}

uint64_t CACCreateDeserializedObject(uint64_t result)
{
  if (result)
    return _CFXPCCreateCFObjectFromXPCObject();
  return result;
}

void _languageChanged(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = ___languageChanged_block_invoke;
  v3[3] = &__block_descriptor_48_e5_v8__0l;
  v3[4] = a3;
  v3[5] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t ___languageChanged_block_invoke(uint64_t a1)
{
  NSObject *v2;

  CACLogAssetDownload();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    ___languageChanged_block_invoke_cold_1(a1, v2);

  return objc_msgSend(*(id *)(a1 + 40), "languageDidChange");
}

id CACMakeErrorWithArgs(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  CACMakeError(a1, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

id CACMakeError(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  +[CACBugReporter sharedReporter](CACBugReporter, "sharedReporter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = CACBugReporterTypeGenericError;
  CACErrorCodeToString(a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reportIssue:subtype:description:", v5, v6, v3);

  v7 = (void *)MEMORY[0x24BDD1540];
  v11 = *MEMORY[0x24BDD0FC8];
  v12[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "errorWithDomain:code:userInfo:", CFSTR("CACErrorDomain"), a1, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

__CFString *CACErrorCodeToString(uint64_t a1)
{
  __CFString *v1;
  __CFString *result;

  switch(a1)
  {
    case 3000:
      v1 = CFSTR("Cancelled by user");
      goto LABEL_3;
    case 3001:
      result = CFSTR("Interrupted by command");
      break;
    case 3002:
      result = CFSTR("Command cannot be executed in this context");
      break;
    case 3003:
      result = CFSTR("Command playback found unexpected disambiguation");
      break;
    case 3004:
      result = CFSTR("Command target cannot be found missing name");
      break;
    case 3005:
      result = CFSTR("Command target cannot be found missing number");
      break;
    case 3006:
      result = CFSTR("User action unsupported type");
      break;
    default:
      if (a1)
      {
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%ld"), a1);
        v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_3:
        result = v1;
      }
      else
      {
        result = CFSTR("Success");
      }
      break;
  }
  return result;
}

uint64_t CACMakeSuccessError()
{
  return objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("CACErrorDomain"), 0, 0);
}

void OUTLINED_FUNCTION_0_6(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

double CACViewRectFromPortraitUpRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  _CACFixedCoordinateSpaceForView(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CACCoordinateSpaceForView(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

id _CACFixedCoordinateSpaceForView(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;

  v1 = a1;
  objc_msgSend(v1, "window");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (v2 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0) && (v2 = v1) != 0)
  {
    objc_msgSend(v2, "screen");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "fixedCoordinateSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "fixedCoordinateSpace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v4;
}

id _CACCoordinateSpaceForView(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v4;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = v1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD8F8], "mainScreen");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinateSpace");
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

double CACPortraitUpRectFromViewRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  _CACFixedCoordinateSpaceForView(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _CACCoordinateSpaceForView(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertRect:fromCoordinateSpace:", v11, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

double CACViewPointFromPortraitUpPoint(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a1;
  _CACFixedCoordinateSpaceForView(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CACCoordinateSpaceForView(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "convertPoint:toCoordinateSpace:", v7, a2, a3);
  v9 = v8;

  return v9;
}

double CACPortraitUpPointFromViewPoint(void *a1, double a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  v5 = a1;
  _CACFixedCoordinateSpaceForView(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _CACCoordinateSpaceForView(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "convertPoint:fromCoordinateSpace:", v7, a2, a3);
  v9 = v8;

  return v9;
}

double CACScreenOrientedRectFromPortraitUpRect(void *a1, double a2, double a3, double a4, double a5)
{
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;

  v9 = a1;
  objc_msgSend(v9, "fixedCoordinateSpace");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "convertRect:toCoordinateSpace:", v11, a2, a3, a4, a5);
  v13 = v12;

  return v13;
}

void CACLayerize(void *a1, void *a2)
{
  id v3;
  id v4;
  CGColor *v5;
  id v6;

  v3 = a2;
  v6 = a1;
  objc_msgSend(v6, "setBorderWidth:", 3.0);
  v4 = objc_retainAutorelease(v3);
  v5 = (CGColor *)objc_msgSend(v4, "CGColor");

  objc_msgSend(v6, "setBorderColor:", CGColorCreateCopyWithAlpha(v5, 0.3));
}

void CACLayercake(void *a1, void *a2, double a3, double a4, double a5, double a6)
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;

  v11 = (objc_class *)MEMORY[0x24BEBDB00];
  v12 = a2;
  v13 = a1;
  v15 = (id)objc_msgSend([v11 alloc], "initWithFrame:", a3, a4, a5, a6);
  objc_msgSend(v15, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  CACLayerize(v14, v12);

  objc_msgSend(v13, "addSubview:", v15);
}

const __CFString *CACAdaptiveBackdropGroupName()
{
  return CFSTR("CACAdaptiveBackdropView");
}

const __CFString *CACAdaptiveBackdropContrastedGroupName()
{
  return CFSTR("CACContrastedAdaptiveBackdropView");
}

double CACAdaptiveBackdropScale()
{
  return 0.25;
}

double CACCGRectIncreasedByPercentage(CGFloat a1, CGFloat a2, CGFloat a3, CGFloat a4, double a5)
{
  double Width;
  CGFloat v11;
  double result;
  CGRect v13;
  CGRect v14;

  Width = CGRectGetWidth(*(CGRect *)&a1);
  v13.origin.x = a1;
  v13.origin.y = a2;
  v13.size.width = a3;
  v13.size.height = a4;
  v11 = CGRectGetHeight(v13) * a5 * -0.5;
  v14.origin.x = a1;
  v14.origin.y = a2;
  v14.size.width = a3;
  v14.size.height = a4;
  *(_QWORD *)&result = (unint64_t)CGRectInset(v14, Width * a5 * -0.5, v11);
  return result;
}

double CACCGPointDistance(double a1, double a2, double a3, double a4)
{
  return hypot(a3 - a1, a4 - a2);
}

BOOL CACIsInDarkMode()
{
  void *v0;
  _BOOL8 v1;

  objc_msgSend(MEMORY[0x24BEBDAB0], "currentTraitCollection");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceStyle") == 2;

  return v1;
}

void sub_229AC40BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void _languageChanged_0(uint64_t a1, uint64_t a2)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = ___languageChanged_block_invoke_0;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

uint64_t ___languageChanged_block_invoke_0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "languageDidChange");
}

void sub_229AC5C34(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t _accessibilityNotificationCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  return objc_msgSend(a5, "_didObserveNotification:notificationData:");
}

uint64_t ResourceBundleClass.__deallocating_deinit()
{
  return swift_deallocClassInstance();
}

objc_class *one-time initialization function for resourceBundle()
{
  uint64_t ObjCClassFromMetadata;
  objc_class *result;

  type metadata accessor for ResourceBundleClass();
  ObjCClassFromMetadata = swift_getObjCClassFromMetadata();
  result = (objc_class *)objc_msgSend((id)objc_opt_self(), sel_bundleForClass_, ObjCClassFromMetadata);
  resourceBundle.super.isa = result;
  return result;
}

uint64_t one-time initialization function for badgePlatterBordered(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterBordered, 0xD000000000000016, 0x8000000229ADD7A0);
}

uint64_t ImageResource.badgePlatterBordered.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterBordered, (uint64_t)static ImageResource.badgePlatterBordered);
}

uint64_t __swift_project_value_buffer(uint64_t a1, uint64_t a2)
{
  if ((*(_BYTE *)(*(_QWORD *)(a1 - 8) + 82) & 2) != 0)
    return *(_QWORD *)a2;
  return a2;
}

uint64_t static ImageResource.badgePlatterBordered.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterBordered, (uint64_t)static ImageResource.badgePlatterBordered, a1);
}

uint64_t one-time initialization function for badgePlatterDoubleTailRight(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterDoubleTailRight, 0xD00000000000001FLL, 0x8000000229ADD780);
}

uint64_t ImageResource.badgePlatterDoubleTailRight.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterDoubleTailRight, (uint64_t)static ImageResource.badgePlatterDoubleTailRight);
}

uint64_t ImageResource.badgePlatterBordered.unsafeMutableAddressor(_QWORD *a1, uint64_t a2)
{
  uint64_t v3;

  if (*a1 != -1)
    swift_once();
  v3 = type metadata accessor for ImageResource();
  return __swift_project_value_buffer(v3, a2);
}

uint64_t static ImageResource.badgePlatterDoubleTailRight.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterDoubleTailRight, (uint64_t)static ImageResource.badgePlatterDoubleTailRight, a1);
}

uint64_t static ImageResource.badgePlatterBordered.getter@<X0>(_QWORD *a1@<X0>, uint64_t a2@<X1>, uint64_t a3@<X8>)
{
  uint64_t v5;
  uint64_t v6;

  if (*a1 != -1)
    swift_once();
  v5 = type metadata accessor for ImageResource();
  v6 = __swift_project_value_buffer(v5, a2);
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v5 - 8) + 16))(a3, v6, v5);
}

uint64_t one-time initialization function for badgePlatterSingleTailDown(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterSingleTailDown, 0xD00000000000001ELL, 0x8000000229ADD760);
}

uint64_t ImageResource.badgePlatterSingleTailDown.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterSingleTailDown, (uint64_t)static ImageResource.badgePlatterSingleTailDown);
}

uint64_t static ImageResource.badgePlatterSingleTailDown.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterSingleTailDown, (uint64_t)static ImageResource.badgePlatterSingleTailDown, a1);
}

uint64_t one-time initialization function for badgePlatterSingleTailRight(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterSingleTailRight, 0xD00000000000001FLL, 0x8000000229ADD740);
}

uint64_t ImageResource.badgePlatterSingleTailRight.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterSingleTailRight, (uint64_t)static ImageResource.badgePlatterSingleTailRight);
}

uint64_t static ImageResource.badgePlatterSingleTailRight.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterSingleTailRight, (uint64_t)static ImageResource.badgePlatterSingleTailRight, a1);
}

uint64_t one-time initialization function for badgePlatterTailNone(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.badgePlatterTailNone, 0xD000000000000017, 0x8000000229ADD720);
}

uint64_t ImageResource.badgePlatterTailNone.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for badgePlatterTailNone, (uint64_t)static ImageResource.badgePlatterTailNone);
}

uint64_t static ImageResource.badgePlatterTailNone.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for badgePlatterTailNone, (uint64_t)static ImageResource.badgePlatterTailNone, a1);
}

uint64_t one-time initialization function for dicationModeAlphabetical(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeAlphabetical, 0xD00000000000001ALL, 0x8000000229ADD700);
}

uint64_t ImageResource.dicationModeAlphabetical.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeAlphabetical, (uint64_t)static ImageResource.dicationModeAlphabetical);
}

uint64_t static ImageResource.dicationModeAlphabetical.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeAlphabetical, (uint64_t)static ImageResource.dicationModeAlphabetical, a1);
}

uint64_t one-time initialization function for dicationModeCommandsonly(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeCommandsonly, 0xD00000000000001ALL, 0x8000000229ADD6E0);
}

uint64_t ImageResource.dicationModeCommandsonly.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeCommandsonly, (uint64_t)static ImageResource.dicationModeCommandsonly);
}

uint64_t static ImageResource.dicationModeCommandsonly.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeCommandsonly, (uint64_t)static ImageResource.dicationModeCommandsonly, a1);
}

uint64_t one-time initialization function for dicationModeNumerical(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.dicationModeNumerical, 0xD000000000000017, 0x8000000229ADD6C0);
}

uint64_t ImageResource.dicationModeNumerical.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for dicationModeNumerical, (uint64_t)static ImageResource.dicationModeNumerical);
}

uint64_t static ImageResource.dicationModeNumerical.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for dicationModeNumerical, (uint64_t)static ImageResource.dicationModeNumerical, a1);
}

uint64_t one-time initialization function for luminance(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.luminance, 0x636E616E696D756CLL, 0xE900000000000065);
}

uint64_t ImageResource.luminance.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for luminance, (uint64_t)static ImageResource.luminance);
}

uint64_t static ImageResource.luminance.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for luminance, (uint64_t)static ImageResource.luminance, a1);
}

uint64_t one-time initialization function for menuMicOff(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.menuMicOff, 0x63696D2D756E656DLL, 0xEC00000066666F2DLL);
}

uint64_t ImageResource.menuMicOff.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for menuMicOff, (uint64_t)static ImageResource.menuMicOff);
}

uint64_t static ImageResource.menuMicOff.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for menuMicOff, (uint64_t)static ImageResource.menuMicOff, a1);
}

uint64_t one-time initialization function for menuMicOn(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.menuMicOn, 0x63696D2D756E656DLL, 0xEB000000006E6F2DLL);
}

uint64_t ImageResource.menuMicOn.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for menuMicOn, (uint64_t)static ImageResource.menuMicOn);
}

uint64_t static ImageResource.menuMicOn.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for menuMicOn, (uint64_t)static ImageResource.menuMicOn, a1);
}

uint64_t one-time initialization function for onboardingGestures(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.onboardingGestures, 0xD000000000000013, 0x8000000229ADD6A0);
}

uint64_t ImageResource.onboardingGestures.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for onboardingGestures, (uint64_t)static ImageResource.onboardingGestures);
}

uint64_t static ImageResource.onboardingGestures.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for onboardingGestures, (uint64_t)static ImageResource.onboardingGestures, a1);
}

uint64_t one-time initialization function for statusMicOff(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.statusMicOff, 0x6D2D737574617473, 0xEE0066666F2D6369);
}

uint64_t ImageResource.statusMicOff.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for statusMicOff, (uint64_t)static ImageResource.statusMicOff);
}

uint64_t static ImageResource.statusMicOff.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for statusMicOff, (uint64_t)static ImageResource.statusMicOff, a1);
}

uint64_t one-time initialization function for statusMicOn(uint64_t a1)
{
  return one-time initialization function for badgePlatterBordered(a1, static ImageResource.statusMicOn, 0x6D2D737574617473, 0xED00006E6F2D6369);
}

uint64_t one-time initialization function for badgePlatterBordered(uint64_t a1, uint64_t *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v7;

  v7 = type metadata accessor for ImageResource();
  __swift_allocate_value_buffer(v7, a2);
  __swift_project_value_buffer(v7, (uint64_t)a2);
  if (one-time initialization token for resourceBundle != -1)
    swift_once();
  return MEMORY[0x22E2D4FC0](a3, a4, resourceBundle.super.isa);
}

uint64_t ImageResource.statusMicOn.unsafeMutableAddressor()
{
  return ImageResource.badgePlatterBordered.unsafeMutableAddressor(&one-time initialization token for statusMicOn, (uint64_t)static ImageResource.statusMicOn);
}

uint64_t static ImageResource.statusMicOn.getter@<X0>(uint64_t a1@<X8>)
{
  return static ImageResource.badgePlatterBordered.getter(&one-time initialization token for statusMicOn, (uint64_t)static ImageResource.statusMicOn, a1);
}

uint64_t type metadata accessor for ResourceBundleClass()
{
  return objc_opt_self();
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

void ___languageChanged_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_229A40000, a2, OS_LOG_TYPE_DEBUG, "Recieved Language Change notification: %@", (uint8_t *)&v3, 0xCu);
}

uint64_t ImageResource.init(name:bundle:)()
{
  return MEMORY[0x24BDC6D38]();
}

uint64_t type metadata accessor for ImageResource()
{
  return MEMORY[0x24BDC6D50]();
}

uint64_t AXDeviceCanArmApplePay()
{
  return MEMORY[0x24BDFFF18]();
}

uint64_t AXDeviceGetMainScreenBounds()
{
  return MEMORY[0x24BDFFF28]();
}

uint64_t AXDeviceHas3DTouch()
{
  return MEMORY[0x24BDFFF48]();
}

uint64_t AXDeviceHasLongPress3dTouch()
{
  return MEMORY[0x24BDFFF70]();
}

uint64_t AXDeviceIsPad()
{
  return MEMORY[0x24BDFE000]();
}

uint64_t AXDeviceIsPhone()
{
  return MEMORY[0x24BDFE008]();
}

uint64_t AXDeviceIsRealityDevice()
{
  return MEMORY[0x24BDFE020]();
}

uint64_t AXDeviceIsRingerSwitchAvailable()
{
  return MEMORY[0x24BDFFFA8]();
}

uint64_t AXDeviceIsSiriAvailable()
{
  return MEMORY[0x24BDFFFB0]();
}

uint64_t AXDeviceSupportsCameraButton()
{
  return MEMORY[0x24BDFFFE0]();
}

uint64_t AXDeviceSupportsSideApp()
{
  return MEMORY[0x24BE00030]();
}

uint64_t AXForceTouchThresholdPeek()
{
  return MEMORY[0x24BE000A0]();
}

uint64_t AXForceTouchThresholdPop()
{
  return MEMORY[0x24BE000A8]();
}

uint64_t AXFormatInteger()
{
  return MEMORY[0x24BDFE058]();
}

AXError AXObserverAddNotification(AXObserverRef observer, AXUIElementRef element, CFStringRef notification, void *refcon)
{
  return MEMORY[0x24BDFE900](observer, element, notification, refcon);
}

AXError AXObserverCreate(pid_t application, AXObserverCallback callback, AXObserverRef *outObserver)
{
  return MEMORY[0x24BDFE908](*(_QWORD *)&application, callback, outObserver);
}

CFRunLoopSourceRef AXObserverGetRunLoopSource(AXObserverRef observer)
{
  return (CFRunLoopSourceRef)MEMORY[0x24BDFE910](observer);
}

uint64_t AXUIKeyboardIsOOP()
{
  return MEMORY[0x24BDFF9F8]();
}

AXValueRef AXValueCreate(AXValueType theType, const void *valuePtr)
{
  return (AXValueRef)MEMORY[0x24BDFEA28](*(_QWORD *)&theType, valuePtr);
}

AXValueType AXValueGetType(AXValueRef value)
{
  return MEMORY[0x24BDFEA30](value);
}

CFTypeID AXValueGetTypeID(void)
{
  return MEMORY[0x24BDFEA38]();
}

Boolean AXValueGetValue(AXValueRef value, AXValueType theType, void *valuePtr)
{
  return MEMORY[0x24BDFEA40](value, *(_QWORD *)&theType, valuePtr);
}

uint64_t AX_CGPointGetDistanceToPoint()
{
  return MEMORY[0x24BE004C8]();
}

uint64_t AX_CGRectGetCenter()
{
  return MEMORY[0x24BE00500]();
}

uint64_t AX_CGRectToOrientation()
{
  return MEMORY[0x24BE00508]();
}

uint64_t AllValidCommandParameterIdentifiers()
{
  return MEMORY[0x24BEAFEC8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

uint64_t AudioServicesCreateSystemSoundIDWithOptions()
{
  return MEMORY[0x24BDB6968]();
}

uint64_t AudioServicesPlaySystemSoundWithOptions()
{
  return MEMORY[0x24BDB6990]();
}

uint64_t CAColorMatrixMakeColorSourceOver()
{
  return MEMORY[0x24BDE53F0]();
}

CATransform3D *__cdecl CATransform3DConcat(CATransform3D *__return_ptr retstr, CATransform3D *a, CATransform3D *b)
{
  return (CATransform3D *)MEMORY[0x24BDE5578](retstr, a, b);
}

CATransform3D *__cdecl CATransform3DMakeScale(CATransform3D *__return_ptr retstr, CGFloat sx, CGFloat sy, CGFloat sz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D0](retstr, sx, sy, sz);
}

CATransform3D *__cdecl CATransform3DMakeTranslation(CATransform3D *__return_ptr retstr, CGFloat tx, CGFloat ty, CGFloat tz)
{
  return (CATransform3D *)MEMORY[0x24BDE55D8](retstr, tx, ty, tz);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x24BDBBC58](cf);
}

uint64_t CFCopySearchPathForDirectoriesInDomains()
{
  return MEMORY[0x24BDBBC70]();
}

CFDateFormatterRef CFDateFormatterCreate(CFAllocatorRef allocator, CFLocaleRef locale, CFDateFormatterStyle dateStyle, CFDateFormatterStyle timeStyle)
{
  return (CFDateFormatterRef)MEMORY[0x24BDBBD40](allocator, locale, dateStyle, timeStyle);
}

CFStringRef CFDateFormatterCreateStringWithAbsoluteTime(CFAllocatorRef allocator, CFDateFormatterRef formatter, CFAbsoluteTime at)
{
  return (CFStringRef)MEMORY[0x24BDBBD60](allocator, formatter, at);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x24BDBBDD8](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x24BDBBF10](cf);
}

CFLocaleRef CFLocaleCreate(CFAllocatorRef allocator, CFLocaleIdentifier localeIdentifier)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF48](allocator, localeIdentifier);
}

CFLocaleIdentifier CFLocaleGetIdentifier(CFLocaleRef locale)
{
  return (CFLocaleIdentifier)MEMORY[0x24BDBBF78](locale);
}

CFLocaleRef CFLocaleGetSystem(void)
{
  return (CFLocaleRef)MEMORY[0x24BDBBF88]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x24BDBC040](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x24BDBC050]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x24BDBC070](center, name, object, userInfo, deliverImmediately);
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x24BDBC088](center, observer, name, object);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x24BDBC150](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x24BDBC160](key, applicationID);
}

CFArrayRef CFPreferencesCopyKeyList(CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFArrayRef)MEMORY[0x24BDBC168](applicationID, userName, hostName);
}

CFDictionaryRef CFPreferencesCopyMultiple(CFArrayRef keysToFetch, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFDictionaryRef)MEMORY[0x24BDBC170](keysToFetch, applicationID, userName, hostName);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x24BDBC198](key, value, applicationID);
}

void CFPreferencesSetValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  MEMORY[0x24BDBC1A8](key, value, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x24BDBC5B0](alloc, str, range.location, range.length);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x24BDBC658](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

CFStringTokenizerTokenType CFStringTokenizerAdvanceToNextToken(CFStringTokenizerRef tokenizer)
{
  return MEMORY[0x24BDBC6F8](tokenizer);
}

CFStringTokenizerRef CFStringTokenizerCreate(CFAllocatorRef alloc, CFStringRef string, CFRange range, CFOptionFlags options, CFLocaleRef locale)
{
  return (CFStringTokenizerRef)MEMORY[0x24BDBC710](alloc, string, range.location, range.length, options, locale);
}

CFRange CFStringTokenizerGetCurrentTokenRange(CFStringTokenizerRef tokenizer)
{
  CFIndex v1;
  CFIndex v2;
  CFRange result;

  v1 = MEMORY[0x24BDBC718](tokenizer);
  result.length = v2;
  result.location = v1;
  return result;
}

CFStringTokenizerTokenType CFStringTokenizerGoToTokenAtIndex(CFStringTokenizerRef tokenizer, CFIndex index)
{
  return MEMORY[0x24BDBC720](tokenizer, index);
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x24BDBC7B8](anURL);
}

CFURLRef CFURLCreateCopyAppendingPathComponent(CFAllocatorRef allocator, CFURLRef url, CFStringRef pathComponent, Boolean isDirectory)
{
  return (CFURLRef)MEMORY[0x24BDBC7F8](allocator, url, pathComponent, isDirectory);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x24BDBD8E0](retstr, sx, sy);
}

CGColorRef CGColorCreateCopyWithAlpha(CGColorRef color, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x24BDBDA90](color, alpha);
}

void CGContextAddLineToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDCD0](c, x, y);
}

uint64_t CGContextClear()
{
  return MEMORY[0x24BDBDD18]();
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x24BDBDE70](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextMoveToPoint(CGContextRef c, CGFloat x, CGFloat y)
{
  MEMORY[0x24BDBDF20](c, x, y);
}

void CGContextSetLineCap(CGContextRef c, CGLineCap cap)
{
  MEMORY[0x24BDBE020](c, *(_QWORD *)&cap);
}

void CGContextSetLineJoin(CGContextRef c, CGLineJoin join)
{
  MEMORY[0x24BDBE030](c, *(_QWORD *)&join);
}

void CGContextSetLineWidth(CGContextRef c, CGFloat width)
{
  MEMORY[0x24BDBE038](c, width);
}

void CGContextSetRGBStrokeColor(CGContextRef c, CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  MEMORY[0x24BDBE068](c, red, green, blue, alpha);
}

void CGContextStrokePath(CGContextRef c)
{
  MEMORY[0x24BDBE118](c);
}

uint64_t CGFloatIsValid()
{
  return MEMORY[0x24BDBE298]();
}

CGImageRef CGImageCreateWithMask(CGImageRef image, CGImageRef mask)
{
  return (CGImageRef)MEMORY[0x24BDBE610](image, mask);
}

size_t CGImageGetBitsPerComponent(CGImageRef image)
{
  return MEMORY[0x24BDBE630](image);
}

size_t CGImageGetBitsPerPixel(CGImageRef image)
{
  return MEMORY[0x24BDBE638](image);
}

size_t CGImageGetBytesPerRow(CGImageRef image)
{
  return MEMORY[0x24BDBE648](image);
}

CGDataProviderRef CGImageGetDataProvider(CGImageRef image)
{
  return (CGDataProviderRef)MEMORY[0x24BDBE668](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x24BDBE680](image);
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x24BDBE6E0](image);
}

CGImageRef CGImageMaskCreate(size_t width, size_t height, size_t bitsPerComponent, size_t bitsPerPixel, size_t bytesPerRow, CGDataProviderRef provider, const CGFloat *decode, BOOL shouldInterpolate)
{
  return (CGImageRef)MEMORY[0x24BDBE6F8](width, height, bitsPerComponent, bitsPerPixel, bytesPerRow, provider, decode, shouldInterpolate);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x24BDBE770](image);
}

CGPoint CGPointFromString(NSString *string)
{
  double v1;
  double v2;
  CGPoint result;

  MEMORY[0x24BEBD230](string);
  result.y = v2;
  result.x = v1;
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

CGFloat CGRectGetMinX(CGRect rect)
{
  CGFloat result;

  MEMORY[0x24BDBF010]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

CGRect CGRectIntersection(CGRect r1, CGRect r2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  MEMORY[0x24BDBF040]((__n128)r1.origin, *(__n128 *)&r1.origin.y, (__n128)r1.size, *(__n128 *)&r1.size.height, (__n128)r2.origin, *(__n128 *)&r2.origin.y, (__n128)r2.size, *(__n128 *)&r2.size.height);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

BOOL CGRectIntersectsRect(CGRect rect1, CGRect rect2)
{
  return MEMORY[0x24BDBF048]((__n128)rect1.origin, *(__n128 *)&rect1.origin.y, (__n128)rect1.size, *(__n128 *)&rect1.size.height, (__n128)rect2.origin, *(__n128 *)&rect2.origin.y, (__n128)rect2.size, *(__n128 *)&rect2.size.height);
}

BOOL CGRectIsEmpty(CGRect rect)
{
  return MEMORY[0x24BDBF050]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

BOOL CGRectIsNull(CGRect rect)
{
  return MEMORY[0x24BDBF060]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
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

uint64_t CRVehicleIdentifierForCertificateSerial()
{
  return MEMORY[0x24BE15200]();
}

CTLineRef CTLineCreateWithAttributedString(CFAttributedStringRef attrString)
{
  return (CTLineRef)MEMORY[0x24BDC4A30](attrString);
}

CFIndex CTLineGetGlyphCount(CTLineRef line)
{
  return MEMORY[0x24BDC4A80](line);
}

uint64_t MADisplayFilterPrefGetCategoryEnabled()
{
  return MEMORY[0x24BDDB918]();
}

uint64_t MADisplayFilterPrefSetCategoryEnabled()
{
  return MEMORY[0x24BDDB928]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x24BED8470]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

BOOL NSPointInRect(NSPoint aPoint, NSRect aRect)
{
  return MEMORY[0x24BDD1150]((__n128)aPoint, *(__n128 *)&aPoint.y, (__n128)aRect.origin, *(__n128 *)&aRect.origin.y, (__n128)aRect.size, *(__n128 *)&aRect.size.height);
}

uint64_t NSRequestConcreteImplementation()
{
  return MEMORY[0x24BDD11E8]();
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromCGPoint(CGPoint point)
{
  return (NSString *)MEMORY[0x24BEBD2B8]((__n128)point, *(__n128 *)&point.y);
}

NSString *__cdecl NSStringFromCGRect(CGRect rect)
{
  return (NSString *)MEMORY[0x24BEBD2C0]((__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x24BDD1258](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

NSRange NSUnionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2;
  NSUInteger v3;
  NSRange result;

  v2 = MEMORY[0x24BDD13D8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

uint64_t RXAdLibCreate()
{
  return MEMORY[0x24BEAFF90]();
}

uint64_t RXGetSupportedQuasarLocaleIdentifiers()
{
  return MEMORY[0x24BEAFFA0]();
}

uint64_t RXGlobalSetDownloadProgressCallback()
{
  return MEMORY[0x24BEAFFA8]();
}

uint64_t RXIsLocaleWithNoSpaceInPostITN()
{
  return MEMORY[0x24BEAFFB0]();
}

uint64_t RXLanguageModelCreate()
{
  return MEMORY[0x24BEAFFB8]();
}

uint64_t RXLanguageObjectAddObject()
{
  return MEMORY[0x24BEAFFC0]();
}

uint64_t RXLanguageObjectAddPhraseAndAlternatives()
{
  return MEMORY[0x24BEAFFC8]();
}

uint64_t RXLanguageObjectGetCount()
{
  return MEMORY[0x24BEAFFD0]();
}

uint64_t RXLanguageObjectGetObjectAtIndex()
{
  return MEMORY[0x24BEAFFD8]();
}

uint64_t RXLanguageObjectGetType()
{
  return MEMORY[0x24BEAFFE0]();
}

uint64_t RXLanguageObjectSetObjectAtIndex()
{
  return MEMORY[0x24BEAFFE8]();
}

uint64_t RXLocalesSupportingSpellingMode()
{
  return MEMORY[0x24BEAFFF0]();
}

uint64_t RXObjectCopyProperty()
{
  return MEMORY[0x24BEAFFF8]();
}

uint64_t RXObjectCopyPropertyWithLocale()
{
  return MEMORY[0x24BEB0000]();
}

uint64_t RXObjectSetProperty()
{
  return MEMORY[0x24BEB0008]();
}

uint64_t RXPathCreate()
{
  return MEMORY[0x24BEB0018]();
}

uint64_t RXRecognitionSystemAddLeadingContext()
{
  return MEMORY[0x24BEB0020]();
}

uint64_t RXRecognitionSystemAddOtherContext()
{
  return MEMORY[0x24BEB0028]();
}

uint64_t RXRecognitionSystemCopyPhoneticNeighborsForText()
{
  return MEMORY[0x24BEB0030]();
}

uint64_t RXRecognitionSystemCreate()
{
  return MEMORY[0x24BEB0038]();
}

uint64_t RXRecognitionSystemReset()
{
  return MEMORY[0x24BEB0040]();
}

uint64_t RXRecognitionSystemSetResetMode()
{
  return MEMORY[0x24BEB0048]();
}

uint64_t RXRecognitionSystemSetSecureFieldFocused()
{
  return MEMORY[0x24BEB0050]();
}

uint64_t RXRecognizerCreate()
{
  return MEMORY[0x24BEB0058]();
}

uint64_t RXSignpostLog()
{
  return MEMORY[0x24BEB0060]();
}

uint64_t RXVocabularyCreateWithLocale()
{
  return MEMORY[0x24BEB0068]();
}

BOOL UIAccessibilityDarkerSystemColorsEnabled(void)
{
  return MEMORY[0x24BEBDDE0]();
}

BOOL UIAccessibilityIsSpeakScreenEnabled(void)
{
  return MEMORY[0x24BEBDE60]();
}

BOOL UIAccessibilityIsVoiceOverRunning(void)
{
  return MEMORY[0x24BEBDE80]();
}

void UIAccessibilityPostNotification(UIAccessibilityNotifications notification, id argument)
{
  MEMORY[0x24BEBDE98](*(_QWORD *)&notification, argument);
}

BOOL UIContentSizeCategoryIsAccessibilityCategory(UIContentSizeCategory category)
{
  return MEMORY[0x24BEBE0B0](category);
}

void UIGraphicsBeginImageContextWithOptions(CGSize size, BOOL opaque, CGFloat scale)
{
  MEMORY[0x24BEBE280](opaque, (__n128)size, *(__n128 *)&size.height, scale);
}

void UIGraphicsEndImageContext(void)
{
  MEMORY[0x24BEBE298]();
}

CGContextRef UIGraphicsGetCurrentContext(void)
{
  return (CGContextRef)MEMORY[0x24BEBE2A8]();
}

UIImage *UIGraphicsGetImageFromCurrentImageContext(void)
{
  return (UIImage *)MEMORY[0x24BEBE2B0]();
}

uint64_t UIKBGetNamedColor()
{
  return MEMORY[0x24BEBE3A8]();
}

uint64_t UIRoundToScale()
{
  return MEMORY[0x24BEBE6D0]();
}

uint64_t _AXCreateAXUIElementWithElement()
{
  return MEMORY[0x24BDFECF8]();
}

uint64_t _AXSAccessibilityPreferenceDomain()
{
  return MEMORY[0x24BED2010]();
}

uint64_t _AXSApplicationAccessibilitySetEnabled()
{
  return MEMORY[0x24BED2048]();
}

uint64_t _AXSAssistiveTouchEnabled()
{
  return MEMORY[0x24BED2050]();
}

uint64_t _AXSAssistiveTouchScannerEnabled()
{
  return MEMORY[0x24BED2070]();
}

uint64_t _AXSAssistiveTouchScannerSetEnabled()
{
  return MEMORY[0x24BED2078]();
}

uint64_t _AXSAssistiveTouchSetEnabled()
{
  return MEMORY[0x24BED2080]();
}

uint64_t _AXSAssistiveTouchSetUIEnabled()
{
  return MEMORY[0x24BED2098]();
}

uint64_t _AXSCanDisableApplicationAccessibility()
{
  return MEMORY[0x24BED2110]();
}

uint64_t _AXSCommandAndControlCarPlayEnabled()
{
  return MEMORY[0x24BED2160]();
}

uint64_t _AXSCommandAndControlCarPlaySetEnabled()
{
  return MEMORY[0x24BED2168]();
}

uint64_t _AXSCommandAndControlEnabled()
{
  return MEMORY[0x24BED2170]();
}

uint64_t _AXSCommandAndControlSetEnabled()
{
  return MEMORY[0x24BED2178]();
}

uint64_t _AXSFullKeyboardAccessEnabled()
{
  return MEMORY[0x24BED21F0]();
}

uint64_t _AXSFullKeyboardAccessSetEnabled()
{
  return MEMORY[0x24BED2208]();
}

uint64_t _AXSGrayscaleEnabled()
{
  return MEMORY[0x24BED2218]();
}

uint64_t _AXSGrayscaleSetEnabled()
{
  return MEMORY[0x24BED2220]();
}

uint64_t _AXSInvertColorsEnabled()
{
  return MEMORY[0x24BED22E0]();
}

uint64_t _AXSInvertColorsSetEnabled()
{
  return MEMORY[0x24BED22F8]();
}

uint64_t _AXSReduceWhitePointEnabled()
{
  return MEMORY[0x24BED23F0]();
}

uint64_t _AXSSetReduceWhitePointEnabled()
{
  return MEMORY[0x24BED24B0]();
}

uint64_t _AXSTwiceRemoteScreenEnabled()
{
  return MEMORY[0x24BED2568]();
}

uint64_t _AXSTwiceRemoteScreenSetEnabled()
{
  return MEMORY[0x24BED2578]();
}

uint64_t _AXSVoiceOverTouchEnabled()
{
  return MEMORY[0x24BED25B0]();
}

uint64_t _AXSVoiceOverTouchSetEnabled()
{
  return MEMORY[0x24BED25B8]();
}

uint64_t _AXSVoiceOverTouchSetUIEnabled()
{
  return MEMORY[0x24BED25E8]();
}

uint64_t _AXSVoiceOverTouchSetUsageConfirmed()
{
  return MEMORY[0x24BED25F0]();
}

uint64_t _AXSVoiceOverTouchUsageConfirmed()
{
  return MEMORY[0x24BED2618]();
}

uint64_t _AXSWatchControlEnabled()
{
  return MEMORY[0x24BED2628]();
}

uint64_t _AXSWatchControlSetEnabled()
{
  return MEMORY[0x24BED2630]();
}

uint64_t _AXSZoomTouchEnabled()
{
  return MEMORY[0x24BED2650]();
}

uint64_t _AXSZoomTouchSetEnabled()
{
  return MEMORY[0x24BED2658]();
}

uint64_t _AXTraitsAsString()
{
  return MEMORY[0x24BDFED20]();
}

uint64_t _AXTraitsAsStringInternal()
{
  return MEMORY[0x24BDFED28]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesSetFileProtectionClass()
{
  return MEMORY[0x24BDBD068]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x24BDBD138]();
}

uint64_t _CFXPCCreateXPCObjectFromCFObject()
{
  return MEMORY[0x24BDBD148]();
}

uint64_t _UIAccessibilityBlockPostingOfNotification()
{
  return MEMORY[0x24BEBB260]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t __AXStringForVariables()
{
  return MEMORY[0x24BDFEDA0]();
}

__double2 __sincos_stret(double a1)
{
  double v1;
  double v2;
  __double2 result;

  MEMORY[0x24BDAC890](a1);
  result.__cosval = v2;
  result.__sinval = v1;
  return result;
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

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACC10](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x24BDAD170](*(_QWORD *)&__upper_bound);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x24BDADEE0](queue);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x24BDAE410](__filename, __mode);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x24BDAE428](a1, a2);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

long double hypot(long double __x, long double __y)
{
  long double result;

  MEMORY[0x24BDAE838](__x, __y);
  return result;
}

long double log2(long double __x)
{
  long double result;

  MEMORY[0x24BDAEAD8](__x);
  return result;
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

int mkdir(const char *a1, mode_t a2)
{
  return MEMORY[0x24BDAEF28](a1, a2);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x24BDAF148](*(_QWORD *)&token, state64);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x24BEDCF78](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

void objc_copyStruct(void *dest, const void *src, ptrdiff_t size, BOOL atomic, BOOL hasStrong)
{
  MEMORY[0x24BEDD020](dest, src, size, atomic, hasStrong);
}

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x24BEDD030](to, from);
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x24BEDD038](location);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x24BEDD0B0](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x24BEDD0C0](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x24BEDD0E8](location);
}

id objc_msgSend(id a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD108](a1, a2);
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

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
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

DIR *__cdecl opendir(const char *a1)
{
  return (DIR *)MEMORY[0x24BDAF258](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x24BDAF400](log);
}

os_signpost_id_t os_signpost_id_generate(os_log_t log)
{
  return MEMORY[0x24BDAF408](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int rand(void)
{
  return MEMORY[0x24BDAFA38]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x24BDAFE38](*(_QWORD *)&a1);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t swift_deallocClassInstance()
{
  return MEMORY[0x24BEE4C00]();
}

uint64_t swift_getObjCClassFromMetadata()
{
  return MEMORY[0x24BEE4DA0]();
}

uint64_t swift_once()
{
  return MEMORY[0x24BEE4EC8]();
}

uint64_t swift_slowAlloc()
{
  return MEMORY[0x24BEE4F38]();
}

int usleep(useconds_t a1)
{
  return MEMORY[0x24BDB02E8](*(_QWORD *)&a1);
}

BOOL xpc_BOOL_get_value(xpc_object_t xBOOL)
{
  return MEMORY[0x24BDB06E0](xBOOL);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

uint64_t xpc_connection_copy_entitlement_value()
{
  return MEMORY[0x24BDB0720]();
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_barrier(xpc_connection_t connection, dispatch_block_t barrier)
{
  MEMORY[0x24BDB07A0](connection, barrier);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x24BDB07E8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x24BDB0910](xdict);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x24BDB0B80](string);
}

