uint64_t tcc_object_retain_cf_callback(uint64_t a1, uint64_t a2)
{
  return tcc_retain(a2);
}

uint64_t tcc_object_hash(uint64_t result)
{
  uint64_t (*v1)(void);

  if (result)
  {
    v1 = *(uint64_t (**)(void))(result + 40);
    if (v1)
      return v1();
  }
  return result;
}

void __service_queue_block_invoke_2(uint64_t a1)
{
  size_t v2;
  const void *v3;
  _OWORD v4[16];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48));
  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    v4[0] = *(_OWORD *)"com.apple.tcc.";
    memset(&v4[1], 0, 240);
    if (*(_BYTE *)(a1 + 56))
      __strlcat_chk();
    v2 = strlen((const char *)v4);
    CFStringGetCString(*(CFStringRef *)(a1 + 48), (char *)v4 + v2, 256 - v2, 0x600u);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = dispatch_queue_create((const char *)v4, 0);
    v3 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    if (v3)
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 40), *(const void **)(a1 + 48), v3);
  }
}

dispatch_queue_global_t service_queue(uint64_t a1, int a2)
{
  uint64_t *v4;
  uint64_t v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD v16[7];
  char v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  if (service_queue_once != -1)
    dispatch_once(&service_queue_once, &__block_literal_global_329);
  v4 = &service_queue_preflight_map;
  if (!a2)
    v4 = &service_queue_request_map;
  v5 = *v4;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  if (!v5)
    goto LABEL_7;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 0x40000000;
  v16[2] = __service_queue_block_invoke_2;
  v16[3] = &unk_1E4A2ED58;
  v16[4] = &v18;
  v16[5] = v5;
  v16[6] = a1;
  v17 = a2;
  dispatch_sync((dispatch_queue_t)service_queue_qq, v16);
  global_queue = (dispatch_queue_global_t)v19[3];
  if (!global_queue)
  {
LABEL_7:
    if ((service_queue_have_logged & 1) == 0)
    {
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      v7 = tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
        service_queue_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
      service_queue_have_logged = 1;
    }
    global_queue = dispatch_get_global_queue(0, 0);
  }
  _Block_object_dispose(&v18, 8);
  return global_queue;
}

void tccd_send_v2(_xpc_connection_s *a1, uint64_t a2, int a3, uint64_t a4, void *a5, uint64_t a6)
{
  _BOOL4 v9;
  _xpc_connection_s *v10;

  v9 = a3 == 0;
  tccd_set_message_number(a5);
  if (a1)
  {
    tccd_send_message(a1, v9, a5, a6, 7, 0);
  }
  else
  {
    v10 = tccd();
    tccd_send_message(v10, v9, a5, a6, 7, 0);
    if (v10)
      xpc_release(v10);
  }
}

void tccd_set_message_number(void *a1)
{
  unint64_t v2;
  unint64_t v3;
  pid_t v4;
  char __str[32];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (!xpc_dictionary_get_value(a1, "TCCD_MSG_ID"))
  {
    do
    {
      v2 = __ldaxr(&tccd_set_message_number_message_number);
      v3 = v2 + 1;
    }
    while (__stlxr(v2 + 1, &tccd_set_message_number_message_number));
    v4 = getpid();
    snprintf(__str, 0x20uLL, "%d.%lld", v4, v3);
    xpc_dictionary_set_string(a1, "TCCD_MSG_ID", __str);
  }
}

_xpc_connection_s *tccd()
{
  NSObject *global_queue;
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v2;

  global_queue = dispatch_get_global_queue(0, 0);
  mach_service = xpc_connection_create_mach_service("com.apple.tccd", global_queue, 2uLL);
  v2 = mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_327);
    xpc_connection_resume(v2);
  }
  return v2;
}

uint64_t ___tcc_service_singleton_for_platform_block_invoke()
{
  platform_services = (uint64_t)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], 0);
  _tcc_add_service_for_platform(kTCCServiceAll);
  _tcc_add_service_for_platform(kTCCServiceAddressBook);
  _tcc_add_service_for_platform(kTCCServiceContactsLimited);
  _tcc_add_service_for_platform(kTCCServiceContactsFull);
  _tcc_add_service_for_platform(kTCCServiceCalendar);
  _tcc_add_service_for_platform(kTCCServiceReminders);
  _tcc_add_service_for_platform(kTCCServiceTwitter);
  _tcc_add_service_for_platform(kTCCServiceFacebook);
  _tcc_add_service_for_platform(kTCCServiceSinaWeibo);
  _tcc_add_service_for_platform(kTCCServiceLiverpool);
  _tcc_add_service_for_platform(kTCCServiceUbiquity);
  _tcc_add_service_for_platform(kTCCServiceTencentWeibo);
  _tcc_add_service_for_platform(kTCCServiceShareKit);
  *(_QWORD *)(_tcc_add_service_for_platform(kTCCServicePhotos) + 80) = 15;
  _tcc_add_service_for_platform(kTCCServicePhotosAdd);
  _tcc_add_service_for_platform(kTCCServiceMicrophone);
  _tcc_add_service_for_platform(kTCCServiceCamera);
  _tcc_add_service_for_platform(kTCCServiceWillow);
  _tcc_add_service_for_platform(kTCCServiceMediaLibrary);
  _tcc_add_service_for_platform(kTCCServiceSiri);
  _tcc_add_service_for_platform(kTCCServiceMotion);
  _tcc_add_service_for_platform(kTCCServiceSpeechRecognition);
  _tcc_add_service_for_platform(kTCCServiceUserTracking);
  _tcc_add_service_for_platform(kTCCServiceBluetoothAlways);
  _tcc_add_service_for_platform(kTCCServiceWebKitIntelligentTrackingPrevention);
  _tcc_add_service_for_platform(kTCCServicePrototype3Rights);
  *(_QWORD *)(_tcc_add_service_for_platform(kTCCServicePrototype4Rights) + 80) = 15;
  _tcc_add_service_for_platform(kTCCServiceGameCenterFriends);
  _tcc_add_service_for_platform(kTCCServiceVoiceBanking);
  _tcc_add_service_for_platform(kTCCServiceBluetoothPeripheral);
  _tcc_add_service_for_platform(kTCCServiceBluetoothWhileInUse);
  _tcc_add_service_for_platform(kTCCServiceKeyboardNetwork);
  _tcc_add_service_for_platform(kTCCServiceMSO);
  _tcc_add_service_for_platform(kTCCServiceCalls);
  _tcc_add_service_for_platform(kTCCServiceFaceID);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMotion);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchMotion);
  _tcc_add_service_for_platform(kTCCServiceSensorKitLocationMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitAmbientLightSensor);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchAmbientLightSensor);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchHeartRate);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchOnWristState);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWristTemperature);
  _tcc_add_service_for_platform(kTCCServiceSensorKitKeyboardMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchPedometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitPedometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchFallStats);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchForegroundAppCategory);
  _tcc_add_service_for_platform(kTCCServiceSensorKitForegroundAppCategory);
  _tcc_add_service_for_platform(kTCCServiceSensorKitWatchSpeechMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitSpeechMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMotionHeartRate);
  _tcc_add_service_for_platform(kTCCServiceSensorKitOdometer);
  _tcc_add_service_for_platform(kTCCServiceSensorKitElevation);
  _tcc_add_service_for_platform(kTCCServiceSensorKitStrideCalibration);
  _tcc_add_service_for_platform(kTCCServiceSensorKitDeviceUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitPhoneUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMessageUsage);
  _tcc_add_service_for_platform(kTCCServiceSensorKitFacialMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitHistoricalMobilityMetrics);
  _tcc_add_service_for_platform(kTCCServiceSensorKitHistoricalCardioMetrics);
  _tcc_add_service_for_platform(kTCCServiceExposureNotification);
  _tcc_add_service_for_platform(kTCCServiceExposureNotificationRegion);
  _tcc_add_service_for_platform(kTCCServiceFinancialData);
  _tcc_add_service_for_platform(kTCCServiceContactlessAccess);
  _tcc_add_service_for_platform(kTCCServiceSecureElementAccess);
  _tcc_add_service_for_platform(kTCCServiceFallDetection);
  _tcc_add_service_for_platform(kTCCServiceSensorKitBedSensing);
  _tcc_add_service_for_platform(kTCCServiceSensorKitSoundDetection);
  _tcc_add_service_for_platform(kTCCServiceSensorKitBedSensingWriting);
  _tcc_add_service_for_platform(kTCCServiceSensorKitMediaEvents);
  _tcc_add_service_for_platform(kTCCServiceNearbyInteraction);
  _tcc_add_service_for_platform(kTCCServiceCrashDetection);
  _tcc_add_service_for_platform(kTCCServiceWebBrowserPublicKeyCredential);
  _tcc_add_service_for_platform(kTCCServicePasteboard);
  _tcc_add_service_for_platform(kTCCServiceFSKitBlockDevice);
  _tcc_add_service_for_platform(kTCCServiceUserAvailability);
  return _tcc_add_service_for_platform(kTCCServiceFocusStatus);
}

void tccd_send_message(_xpc_connection_s *a1, int a2, void *a3, uint64_t a4, uint64_t a5, unsigned int a6)
{
  uint64_t v6;
  unint64_t v12;
  unint64_t v13;
  CFMutableStringRef Mutable;
  __CFString *v15;
  const char *string;
  const char *v17;
  char **v18;
  const char *v19;
  const char *v20;
  const char *v21;
  char **v22;
  uint64_t v23;
  xpc_object_t value;
  void *v25;
  const char *v26;
  _BYTE *v27;
  void *v28;
  NSObject *v29;
  xpc_object_t v30;
  xpc_object_t v31;
  void *v32;
  const char *name;
  NSObject *v34;
  const char *v35;
  NSObject *global_queue;
  xpc_object_t v37;
  void *v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  NSObject *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  _xpc_connection_s *v50;
  _xpc_connection_s *v51;
  NSObject *v52;
  uint64_t v53;
  unsigned int v54;
  _QWORD handler[7];
  int v56;
  int v57;
  unsigned int v58;
  audit_token_t atoken;
  uid_t euidp;
  uid_t auidp;
  pid_t pidp;
  _BYTE buffer[34];
  __int16 v64;
  _BYTE *v65;
  uint64_t v66;

  v6 = a5;
  v66 = *MEMORY[0x1E0C80C00];
  if (a6 >= a5)
  {
    v28 = (void *)MEMORY[0x1A8591528](a3);
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v29 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buffer = 67109634;
      *(_DWORD *)&buffer[4] = v6;
      *(_WORD *)&buffer[8] = 2048;
      *(_QWORD *)&buffer[10] = a3;
      *(_WORD *)&buffer[18] = 2082;
      *(_QWORD *)&buffer[20] = v28;
      _os_log_error_impl(&dword_1A364C000, v29, OS_LOG_TYPE_ERROR, "Limit (%d) reached; cannot send request (%p): %{public}s",
        buffer,
        0x1Cu);
    }
    free(v28);
    v30 = xpc_dictionary_create(0, 0, 0);
    if (!v30)
    {
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      v52 = tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_FAULT))
        tccd_send_message_cold_2(v52);
      abort();
    }
    v31 = v30;
    xpc_dictionary_set_BOOL(v30, "do_not_cache", 1);
    (*(void (**)(uint64_t, xpc_object_t))(a4 + 16))(a4, v31);
    v32 = v31;
    goto LABEL_62;
  }
  v12 = 0x1ECDA0000uLL;
  if (tcc_log_handle_onceToken != -1)
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  v13 = 0x1ECDA0000uLL;
  if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
  {
    v54 = v6;
    Mutable = CFStringCreateMutable(0, 0);
    if (Mutable)
    {
      v15 = Mutable;
      string = xpc_dictionary_get_string(a3, "TCCD_MSG_ID");
      CFStringAppendFormat(v15, 0, CFSTR("msgID=%s, "), string);
      v17 = "function";
      v18 = off_1E4A2EC90;
      do
      {
        v19 = xpc_dictionary_get_string(a3, v17);
        if (v19)
          CFStringAppendFormat(v15, 0, CFSTR("%s=%s, "), v17, v19);
        v20 = *v18++;
        v17 = v20;
      }
      while (v20);
      v53 = a4;
      v21 = "target_token";
      v22 = off_1E4A2ECB8;
      v23 = MEMORY[0x1E0C812E8];
      do
      {
        value = xpc_dictionary_get_value(a3, v21);
        if (value)
        {
          v25 = value;
          if (MEMORY[0x1A859163C]() == v23)
          {
            memset(buffer, 0, 32);
            if (xpc_data_get_bytes(v25, buffer, 0, 0x20uLL) == 32)
            {
              pidp = 0;
              euidp = 0;
              auidp = 0;
              atoken = *(audit_token_t *)buffer;
              audit_token_to_au32(&atoken, &auidp, &euidp, 0, 0, 0, &pidp, 0, 0);
              CFStringAppendFormat(v15, 0, CFSTR("%s={pid:%d, auid:%d, euid:%d}, "), v21, pidp, auidp, euidp);
            }
          }
        }
        v26 = *v22++;
        v21 = v26;
      }
      while (v26);
      v27 = stringCopyUTF8String(v15);
      CFRelease(v15);
      a4 = v53;
      v13 = 0x1ECDA0000;
      v12 = 0x1ECDA0000;
    }
    else
    {
      v27 = 0;
    }
    name = xpc_connection_get_name(a1);
    if (*(_QWORD *)(v12 + 2816) != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v34 = *(NSObject **)(v13 + 2808);
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)&buffer[8] = 1024;
      v35 = "asynchronous";
      *(_DWORD *)buffer = 67110146;
      *(_DWORD *)&buffer[4] = a6;
      if (!a2)
        v35 = "synchronous";
      *(_DWORD *)&buffer[10] = v54;
      *(_WORD *)&buffer[14] = 2082;
      *(_QWORD *)&buffer[16] = v35;
      *(_WORD *)&buffer[24] = 2082;
      *(_QWORD *)&buffer[26] = name;
      v64 = 2082;
      v65 = v27;
      _os_log_impl(&dword_1A364C000, v34, OS_LOG_TYPE_INFO, "SEND: %d/%d %{public}s to %{public}s: request: %{public}s", buffer, 0x2Cu);
    }
    free(v27);
    v6 = v54;
  }
  if (a2)
  {
    xpc_retain(a1);
    xpc_retain(a3);
    global_queue = dispatch_get_global_queue(0, 0);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 0x40000000;
    handler[2] = __tccd_send_message_block_invoke;
    handler[3] = &unk_1E4A2EC68;
    handler[5] = a3;
    handler[6] = a1;
    handler[4] = a4;
    v56 = a2;
    v57 = v6;
    v58 = a6;
    xpc_connection_send_message_with_reply(a1, a3, global_queue, handler);
    return;
  }
  v37 = xpc_connection_send_message_with_reply_sync(a1, a3);
  v38 = v37;
  if (v37 == (xpc_object_t)MEMORY[0x1E0C81258])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v41 = *(NSObject **)(v13 + 2808);
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buffer = 134217984;
      *(_QWORD *)&buffer[4] = a3;
      _os_log_impl(&dword_1A364C000, v41, OS_LOG_TYPE_DEFAULT, "send_message_with_reply_sync(): connection interrupted for message: %p.", buffer, 0xCu);
    }
    tccd_send_message(a1, 0, a3, a4, v6, a6 + 1);
    goto LABEL_61;
  }
  if (v37 != (xpc_object_t)MEMORY[0x1E0C81260])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled(*(os_log_t *)(v13 + 2808), OS_LOG_TYPE_INFO))
    {
      v39 = (void *)tccd_reply_description_redacted(v38);
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      v40 = *(NSObject **)(v13 + 2808);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buffer = 136446210;
        *(_QWORD *)&buffer[4] = v39;
        _os_log_impl(&dword_1A364C000, v40, OS_LOG_TYPE_INFO, "RECV: synchronous reply %{public}s", buffer, 0xCu);
      }
      free(v39);
    }
    (*(void (**)(uint64_t, void *))(a4 + 16))(a4, v38);
    goto LABEL_61;
  }
  if (xpc_dictionary_get_BOOL(a3, "user_tccd_unavailable"))
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v42 = *(NSObject **)(v13 + 2808);
    if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
      tccd_send_message_cold_1((uint64_t)a3, v42, v43, v44, v45, v46, v47, v48);
LABEL_60:
    (*(void (**)(uint64_t, _QWORD))(a4 + 16))(a4, MEMORY[0x1E0C81260]);
    goto LABEL_61;
  }
  if (tcc_log_handle_onceToken != -1)
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  v49 = *(NSObject **)(v13 + 2808);
  if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buffer = 134217984;
    *(_QWORD *)&buffer[4] = a3;
    _os_log_impl(&dword_1A364C000, v49, OS_LOG_TYPE_DEFAULT, "send_message_with_reply_sync(): user tccd unavailable, sending %p to system tccd", buffer, 0xCu);
  }
  v50 = tccd();
  if (!v50)
    goto LABEL_60;
  v51 = v50;
  xpc_dictionary_set_BOOL(a3, "user_tccd_unavailable", 1);
  tccd_send_message(v51, 0, a3, a4, v6, a6 + 1);
  xpc_release(v51);
LABEL_61:
  v32 = v38;
LABEL_62:
  xpc_release(v32);
}

uint64_t _tcc_add_service_for_platform(const __CFString *a1)
{
  uint64_t v2;
  uint64_t v3;

  tcc_service_alloc(136, (uint64_t)&service_object_ops);
  v3 = v2;
  *(_QWORD *)(v2 + 56) = CFRetain(a1);
  *(_QWORD *)(v3 + 64) = stringCopyUTF8String(a1);
  *(_OWORD *)(v3 + 72) = xmmword_1A36607A0;
  *(_BYTE *)(v3 + 96) = 0;
  *(_DWORD *)(v3 + 100) = -1;
  *(_QWORD *)(v3 + 104) = 0;
  *(_QWORD *)(v3 + 120) = 0;
  CFDictionaryAddValue((CFMutableDictionaryRef)platform_services, a1, (const void *)v3);
  return v3;
}

_BYTE *stringCopyUTF8String(const __CFString *a1)
{
  CFIndex Length;
  _BYTE *v3;
  CFIndex maxBufLen;
  CFRange v6;
  CFRange v7;

  Length = CFStringGetLength(a1);
  maxBufLen = 0;
  v6.location = 0;
  v6.length = Length;
  v3 = 0;
  if (CFStringGetBytes(a1, v6, 0x8000100u, 0, 0, 0, 0, &maxBufLen) == Length
    && (v3 = malloc_type_malloc(maxBufLen + 1, 0xBE693CA1uLL)) != 0
    && (v7.location = 0,
        v7.length = Length,
        CFStringGetBytes(a1, v7, 0x8000100u, 0, 0, v3, maxBufLen, &maxBufLen) == Length))
  {
    v3[maxBufLen] = 0;
  }
  else
  {
    free(v3);
    return 0;
  }
  return v3;
}

__n128 tcc_service_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t tccd_reply_description_redacted(void *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v12;
  xpc_object_t v13;

  if (MEMORY[0x1A859163C]() != MEMORY[0x1E0C812F8])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v2 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      tccd_reply_description_redacted_cold_1(v2, v3, v4, v5, v6, v7, v8, v9);
    return MEMORY[0x1A8591528](a1);
  }
  if (!xpc_dictionary_get_string(a1, "extension"))
    return MEMORY[0x1A8591528](a1);
  v12 = xpc_copy(a1);
  xpc_dictionary_set_string(v12, "extension", "<redacted>");
  if (v12)
    v13 = v12;
  else
    v13 = a1;
  v10 = MEMORY[0x1A8591528](v13);
  if (v12)
    xpc_release(v12);
  return v10;
}

uint64_t __tcc_authorization_check_audit_token_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_check_audit_token_block_invoke_cold_1();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = tcc_authorization_record_get_authorization_right(a2);
  }
  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

uint64_t tcc_log_handle()
{
  if (tcc_log_handle_onceToken != -1)
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  return tcc_client_log;
}

uint64_t tcc_authorization_record_get_authorization_right(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

void tcc_message_options_dispose(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 104);
  if (v1)
    CFRelease(v1);
}

uint64_t tcc_credential_dispose(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2 == 3)
  {
    free(*(void **)(a1 + 64));
  }
  else if (v2 == 2)
  {
    xpc_release(*(xpc_object_t *)(a1 + 64));
  }
  result = *(_QWORD *)(a1 + 96);
  if (result)
    return tcc_release(result);
  return result;
}

void tcc_authorization_record_dispose(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  const void *v7;
  const void *v8;
  void *v9;

  v2 = a1[7];
  if (v2)
    tcc_release(v2);
  v3 = a1[8];
  if (v3)
    tcc_release(v3);
  v4 = a1[9];
  if (v4)
    tcc_release(v4);
  v5 = a1[13];
  if (v5)
    tcc_release(v5);
  v6 = a1[14];
  if (v6)
    tcc_release(v6);
  v7 = (const void *)a1[15];
  if (v7)
    CFRelease(v7);
  v8 = (const void *)a1[16];
  if (v8)
    CFRelease(v8);
  v9 = (void *)a1[19];
  if (v9)
    free(v9);
}

void tcc_identity_dispose(uint64_t a1)
{
  free(*(void **)(a1 + 64));
  if (*(_QWORD *)(a1 + 72) == 1)
    free(*(void **)(a1 + 80));
}

uint64_t tcc_authorization_check_audit_token(void *a1, __int128 *a2, const __CFDictionary *a3)
{
  const void *v5;
  __int128 v6;
  void (*v7)(_QWORD, _QWORD, _QWORD);
  void (*v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  uint64_t v10;
  void (*v11)(_QWORD, _QWORD, _QWORD);
  const void *v12;
  const void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void (*v19[7])(_QWORD, _QWORD, _QWORD);
  void *value;
  __int128 v21;
  __int128 v22;

  v5 = tcc_service_singleton_for_CF_name(a1);
  v6 = a2[1];
  v21 = *a2;
  v22 = v6;
  tcc_credential_create_for_process_with_audit_token((uint64_t)&v21);
  v8 = v7;
  v9 = tcc_server_singleton_default();
  tcc_message_options_create();
  v11 = (void (*)(_QWORD, _QWORD, _QWORD))v10;
  tcc_message_options_set_reply_handler_policy(v10, 1);
  if (a3)
  {
    v12 = CFDictionaryGetValue(a3, kTCCAccessCheckOptionPrompt);
    v13 = (const void *)*MEMORY[0x1E0C9AE50];
    if (v12 == (const void *)*MEMORY[0x1E0C9AE50])
    {
      v14 = (uint64_t)v11;
      v15 = 0;
    }
    else
    {
      v14 = (uint64_t)v11;
      v15 = 2;
    }
    tcc_message_options_set_request_prompt_policy(v14, v15);
    value = (void *)*MEMORY[0x1E0C9B0D0];
    if (CFDictionaryGetValueIfPresent(a3, kTCCAccessCheckOptionPurposeRequired, (const void **)&value))
    {
      if (CFEqual(value, v13))
        v16 = 1;
      else
        v16 = 2;
    }
    else
    {
      v16 = 0;
    }
  }
  else
  {
    tcc_message_options_set_request_prompt_policy((uint64_t)v11, 2);
    v16 = 0;
    value = (void *)*MEMORY[0x1E0C9B0D0];
  }
  tcc_message_options_set_request_usage_string_policy((uint64_t)v11, v16);
  *(_QWORD *)&v21 = 0;
  *((_QWORD *)&v21 + 1) = &v21;
  v22 = 0x2000000000uLL;
  v19[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v19[1] = (void (*)(_QWORD, _QWORD, _QWORD))0x40000000;
  v19[2] = (void (*)(_QWORD, _QWORD, _QWORD))__tcc_authorization_check_audit_token_block_invoke;
  v19[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E4A2EEC0;
  v19[4] = (void (*)(_QWORD, _QWORD, _QWORD))&v21;
  v19[5] = v11;
  v19[6] = v8;
  tcc_server_message_request_authorization(v9, (uint64_t)v11, v8, v5, 0, v19);
  v17 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 24);
  _Block_object_dispose(&v21, 8);
  return v17;
}

uint64_t tcc_message_options_set_reply_handler_policy(uint64_t result, int a2)
{
  *(_DWORD *)(result + 56) = a2;
  return result;
}

double tcc_message_options_create()
{
  uint64_t v0;
  double result;

  tcc_message_options_alloc(120, (uint64_t)&message_options_object_ops);
  *(_DWORD *)(v0 + 56) = 0;
  result = 0.0;
  *(_OWORD *)(v0 + 64) = 0u;
  *(_OWORD *)(v0 + 80) = 0u;
  *(_BYTE *)(v0 + 96) = 0;
  return result;
}

__n128 tcc_message_options_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

const void *tcc_service_singleton_for_CF_name(void *key)
{
  if (_tcc_service_singleton_for_platform_onceToken != -1)
    dispatch_once(&_tcc_service_singleton_for_platform_onceToken, &__block_literal_global_3);
  return CFDictionaryGetValue((CFDictionaryRef)platform_services, key);
}

void tcc_server_message_request_authorization(uint64_t a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, void (**a6)(_QWORD, _QWORD, _QWORD))
{
  xpc_object_t v12;
  uint64_t v13;
  uint64_t v14;
  xpc_object_t v15;
  xpc_object_t v16;

  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v12, "TCCD_MSG_REQUEST_TYPE_KEY", 0);
  v13 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v13 = v14;
    a2 = v14;
  }
  tcc_object_encode_to_dictionary(a2);
  v15 = xpc_dictionary_create(0, 0, 0);
  tcc_object_encode_to_dictionary((uint64_t)a3);
  xpc_dictionary_set_value(v12, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v15);
  xpc_release(v15);
  tcc_object_encode_to_dictionary((uint64_t)a4);
  if (a5)
  {
    v16 = xpc_dictionary_create(0, 0, 0);
    tcc_object_encode_to_dictionary(a5);
    xpc_dictionary_set_value(v12, "TCC_MSG_REQUEST_AUTHORIZATION_INDIRECT_OBJECT_CREDENTIAL_DICTIONARY_KEY", v16);
    xpc_release(v16);
  }
  _tcc_server_send_request_authorization(a1, a4, a3, a2, v12, a6);
  if (v13)
    tcc_release(v13);
  xpc_release(v12);
}

uint64_t tcc_object_encode_to_dictionary(uint64_t result)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(result + 24);
  if (v1)
    return v1();
  return result;
}

void tcc_message_options_encode_to_dictionary(uint64_t *a1, xpc_object_t xdict)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  const __CFData *v7;
  const __CFData *v8;
  const UInt8 *BytePtr;
  size_t Length;
  CFErrorRef error;
  uint8_t buf[4];
  const char *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_POLICY_KEY", a1[8]);
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_USAGE_STRING_POLICY_KEY", a1[9]);
  v4 = a1[10];
  if (v4)
    xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_RECORD_UPGRADE_POLICY_POLICY_KEY", v4);
  v5 = a1[11];
  if (v5)
    xpc_dictionary_set_uint64(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_RIGHTS_MASK_KEY", v5);
  v6 = (const void *)a1[13];
  if (v6)
  {
    error = 0;
    v7 = CFPropertyListCreateData(0, v6, kCFPropertyListBinaryFormat_v1_0, 0, &error);
    v8 = v7;
    if (!error)
    {
      BytePtr = CFDataGetBytePtr(v7);
      Length = CFDataGetLength(v8);
      xpc_dictionary_set_data(xdict, "TCCD_MSG_MESSAGE_OPTION_REQUEST_PROMPT_CLIENT_DICT_KEY", BytePtr, Length);
      if (!v8)
        return;
      goto LABEL_10;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v13 = "tcc_message_options_encode_to_dictionary";
      _os_log_impl(&dword_1A364C000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%s: error creating CFData from provided client_dict", buf, 0xCu);
    }
    if (v8)
LABEL_10:
      CFRelease(v8);
  }
}

void tcc_service_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_string(xdict, "service", *(const char **)(a1 + 64));
}

void _tcc_server_send_request_authorization(uint64_t a1, const void *a2, const void *a3, uint64_t a4, void *a5, void (**a6)(_QWORD, _QWORD, _QWORD))
{
  int reply_handler_policy;
  _BOOL4 v11;
  uint64_t v12;
  int v13;
  uint64_t request_prompt_policy;
  int cache_policy;
  int audit_token_cache_max_size;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  BOOL v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t message_preflight_queue;
  void *v28;
  NSObject *v29;
  _QWORD *v30;
  NSObject *v31;
  const __CFString *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  void *v40;
  _BOOL4 v41;
  _QWORD activity_block[6];
  _BOOL4 v45;
  _QWORD v46[9];
  _BOOL4 v47;
  int v48;
  _BOOL4 v49;
  BOOL v50;
  _QWORD block[6];
  _QWORD v52[6];
  uint8_t buf[16];

  reply_handler_policy = tcc_message_options_get_reply_handler_policy(a4);
  v11 = reply_handler_policy == 1;
  v12 = tcc_credential_singleton_for_self();
  v13 = tcc_object_equal((uint64_t)a3, v12);
  request_prompt_policy = tcc_message_options_get_request_prompt_policy(a4);
  cache_policy = tcc_message_options_get_cache_policy(a4);
  v41 = cache_policy == 0;
  audit_token_cache_max_size = tcc_service_get_audit_token_cache_max_size((uint64_t)a2);
  if (os_variant_is_darwinos())
  {
    v17 = tcc_log_handle();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A364C000, v17, OS_LOG_TYPE_DEFAULT, "automatically granting auth because of darwinos", buf, 2u);
    }
    tcc_authorization_record_create();
    if (v18)
    {
      v19 = v18;
      tcc_authorization_record_set_service(v18, (uint64_t)a2);
      tcc_authorization_record_set_authorization_value(v19, 2);
      tcc_authorization_record_set_authorization_reason(v19, 5);
      if (reply_handler_policy == 1)
      {
        a6[2](a6, v19, 0);
        v20 = v19;
LABEL_30:
        tcc_release(v20);
        return;
      }
      v28 = _Block_copy(a6);
      v29 = *(NSObject **)(a1 + 56);
      v52[0] = MEMORY[0x1E0C809B0];
      v52[1] = 0x40000000;
      v52[2] = ___tcc_server_send_request_authorization_block_invoke;
      v52[3] = &unk_1E4A2F228;
      v52[4] = v28;
      v52[5] = v19;
      v30 = v52;
LABEL_32:
      dispatch_async(v29, v30);
      return;
    }
  }
  if (v13)
    v21 = 0;
  else
    v21 = audit_token_cache_max_size < 0;
  v22 = !v21;
  if (!cache_policy)
  {
    if (v22)
    {
      v23 = tcc_authorization_cache_copy_authorization(*(_QWORD *)(a1 + 64), a2, a3);
      if (v23)
      {
        v24 = v23;
        if (tcc_authorization_record_get_authorization_right(v23) != 1 || request_prompt_policy)
        {
          v31 = tcc_log_handle();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            v32 = tcc_object_copy_description(v24);
            v33 = tcc_log_handle();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
              _tcc_server_send_request_authorization_cold_1((uint64_t)v32, v33, v34, v35, v36, v37, v38, v39);
            CFRelease(v32);
          }
          if (reply_handler_policy == 1)
          {
            a6[2](a6, v24, 0);
            v20 = v24;
            goto LABEL_30;
          }
          v40 = _Block_copy(a6);
          v29 = *(NSObject **)(a1 + 56);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 0x40000000;
          block[2] = ___tcc_server_send_request_authorization_block_invoke_53;
          block[3] = &unk_1E4A2F250;
          block[4] = v40;
          block[5] = v24;
          v30 = block;
          goto LABEL_32;
        }
        tcc_release(v24);
      }
    }
  }
  xpc_dictionary_set_string(a5, "function", "TCCAccessRequest");
  tcc_retain(a2);
  v25 = _Block_copy(a6);
  xpc_retain(a5);
  v26 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 0x40000000;
  v46[2] = ___tcc_server_send_request_authorization_block_invoke_2;
  v46[3] = &unk_1E4A2F2C8;
  v46[6] = a1;
  v46[7] = a2;
  v46[4] = v25;
  v46[5] = a5;
  v47 = v11;
  v48 = v13;
  v49 = v41;
  v50 = audit_token_cache_max_size >= 0;
  v46[8] = a3;
  if (request_prompt_policy)
    message_preflight_queue = tcc_service_get_message_preflight_queue((uint64_t)a2);
  else
    message_preflight_queue = tcc_service_get_message_queue((uint64_t)a2);
  activity_block[0] = v26;
  activity_block[1] = 0x40000000;
  activity_block[2] = ___tcc_server_send_request_authorization_block_invoke_2_76;
  activity_block[3] = &unk_1E4A2F2F0;
  v45 = v11;
  activity_block[4] = v46;
  activity_block[5] = message_preflight_queue;
  _os_activity_initiate(&dword_1A364C000, "tcc_send_request_authorization() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t tcc_object_equal(uint64_t a1, uint64_t a2)
{
  uint64_t (*v2)(void);
  BOOL v3;

  if (a1 && ((v2 = *(uint64_t (**)(void))(a1 + 48)) != 0 ? (v3 = a2 == 0) : (v3 = 1), !v3 && *(_QWORD *)(a2 + 48)))
    return v2();
  else
    return a1 == a2;
}

uint64_t tcc_credential_singleton_for_self()
{
  if (tcc_credential_singleton_for_self_onceToken != -1)
    dispatch_once(&tcc_credential_singleton_for_self_onceToken, &__block_literal_global_1);
  return tcc_credential_singleton_for_self_cred_for_this_process;
}

uint64_t tcc_message_options_get_reply_handler_policy(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t tcc_message_options_get_request_prompt_policy(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t tcc_message_options_get_cache_policy(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 96);
}

BOOL tcc_credential_equal(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  _BOOL8 result;
  __int128 v6;
  BOOL v9;
  size_t length;
  const void *bytes_ptr;
  const void *v12;
  int v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;

  v4 = *(_QWORD *)(a1 + 56);
  if (v4 == *(_QWORD *)(a2 + 56))
  {
    switch(v4)
    {
      case 0:
        result = 1;
        break;
      case 1:
        v16 = *(_OWORD *)(a1 + 64);
        v17 = *(_OWORD *)(a1 + 80);
        v6 = *(_OWORD *)(a2 + 80);
        v15 = *(_OWORD *)(a2 + 64);
        v9 = (_QWORD)v16 == (_QWORD)v15
          && *((_QWORD *)&v16 + 1) == *((_QWORD *)&v15 + 1)
          && (_QWORD)v17 == (_QWORD)v6
          && *((_QWORD *)&v17 + 1) == *((_QWORD *)&v6 + 1);
        goto LABEL_18;
      case 2:
        length = xpc_data_get_length(*(xpc_object_t *)(a1 + 64));
        if (length != xpc_data_get_length(*(xpc_object_t *)(a2 + 64)))
          goto LABEL_15;
        bytes_ptr = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a1 + 64));
        v12 = xpc_data_get_bytes_ptr(*(xpc_object_t *)(a2 + 64));
        v13 = memcmp(bytes_ptr, v12, length);
        goto LABEL_17;
      case 3:
        v13 = strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64));
LABEL_17:
        v9 = v13 == 0;
LABEL_18:
        result = v9;
        break;
      default:
        goto LABEL_15;
    }
  }
  else
  {
LABEL_15:
    result = 0;
  }
  v14 = *(_QWORD *)(a2 + 96);
  if (*(_QWORD *)(a1 + 96))
  {
    if (v14)
      return tcc_identity_type_and_identifiers_are_equal(*(_QWORD *)(a1 + 96), v14);
  }
  else if (!v14)
  {
    return result;
  }
  return 0;
}

void tcc_credential_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  uint64_t v4;
  xpc_object_t v5;

  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY", *(_QWORD *)(a1 + 56));
  v4 = *(_QWORD *)(a1 + 56);
  switch(v4)
  {
    case 3:
      xpc_dictionary_set_string(xdict, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_FILE_PROVIDER_DOMAIN_ID_KEY", *(const char **)(a1 + 64));
      break;
    case 2:
      xpc_dictionary_set_value(xdict, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_DATA_KEY", *(xpc_object_t *)(a1 + 64));
      break;
    case 1:
      xpc_dictionary_set_data(xdict, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", (const void *)(a1 + 64), 0x20uLL);
      break;
  }
  if (*(_QWORD *)(a1 + 96))
  {
    v5 = xpc_dictionary_create(0, 0, 0);
    tcc_object_encode_to_dictionary(*(_QWORD *)(a1 + 96));
    xpc_dictionary_set_value(xdict, "TCCD_MSG_CREDENTIAL_ASSUMED_IDENTITY", v5);
    xpc_release(v5);
  }
}

uint64_t tcc_message_options_set_request_prompt_policy(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 64) = a2;
  return result;
}

uint64_t tcc_service_get_message_preflight_queue(uint64_t a1)
{
  dispatch_once_t *v2;
  uint64_t v3;
  _QWORD block[5];

  v3 = *(_QWORD *)(a1 + 120);
  v2 = (dispatch_once_t *)(a1 + 120);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __tcc_service_get_message_preflight_queue_block_invoke;
  block[3] = &__block_descriptor_tmp_2_0;
  block[4] = a1;
  if (v3 != -1)
    dispatch_once(v2, block);
  return *(_QWORD *)(a1 + 128);
}

void ___tcc_server_send_request_authorization_block_invoke_3(uint64_t a1, void *a2)
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t uint64;
  CFErrorRef v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  const char *string;
  CFErrorRef CFError_with_user_info;
  CFErrorRef v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t value;
  char v18;
  const void *v19;
  uint64_t v20;
  BOOL v21;
  const char *v22;
  char v23;
  uint64_t v24;
  int v25;
  uint64_t v26;
  char *v27;
  BOOL v28;
  uint64_t v29;
  NSObject *v30;
  NSObject *v31;
  int *v32;
  char v33;
  _QWORD block[8];

  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    v9 = tcc_log_handle();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    v11 = (const char *)*MEMORY[0x1E0C81270];
    if (v10)
      ___tcc_server_send_request_authorization_block_invoke_3_cold_1(a2, (const char *)*MEMORY[0x1E0C81270]);
    string = xpc_dictionary_get_string(a2, v11);
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), string);
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_release(*(const void **)(a1 + 32));
    tcc_release(*(_QWORD *)(a1 + 48));
    v14 = CFError_with_user_info;
    goto LABEL_42;
  }
  v4 = xpc_dictionary_get_string(a2, "abort");
  if (v4)
  {
    v5 = (uint64_t)v4;
    v6 = xpc_dictionary_get_string(a2, "problem_key");
    __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(v5, v6);
  }
  if (xpc_dictionary_get_value(a2, "auth_value"))
  {
    uint64 = xpc_dictionary_get_uint64(a2, "auth_value");
    v8 = 0;
  }
  else
  {
    v8 = _tcc_util_create_CFError_with_user_info(2, CFSTR("missing 'auth_value' in reply message"));
    uint64 = 0;
  }
  if (xpc_dictionary_get_value(a2, "auth_reason"))
    v15 = xpc_dictionary_get_uint64(a2, "auth_reason");
  else
    v15 = 0;
  v16 = xpc_dictionary_get_uint64(a2, "auth_version");
  value = xpc_dictionary_get_value(a2, "extension");
  if (v8)
    goto LABEL_14;
  if (*(_DWORD *)(a1 + 72))
  {
    if (value)
    {
      xpc_string_get_string_ptr(value);
      if (sandbox_extension_consume() == -1)
      {
        v31 = tcc_log_handle();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          ___tcc_server_send_request_authorization_block_invoke_3_cold_2(v31);
        v32 = __error();
        v8 = _tcc_util_create_CFError_with_user_info(2, CFSTR("sandbox_extension_consume():%d"), *v32);
        if (v8)
        {
LABEL_14:
          xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
          goto LABEL_15;
        }
      }
    }
  }
  if (xpc_dictionary_get_value(a2, "auth_error_string"))
  {
    if (xpc_dictionary_get_value(a2, "auth_error_code"))
      v20 = xpc_dictionary_get_uint64(a2, "auth_error_code");
    else
      v20 = 2;
    v22 = xpc_dictionary_get_string(a2, "auth_error_string");
    v8 = _tcc_util_create_CFError_with_user_info(v20, CFSTR("server error: %s"), v22);
    v21 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
    if (!v8)
      goto LABEL_25;
LABEL_15:
    v18 = 0;
    v19 = 0;
    goto LABEL_37;
  }
  v21 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
LABEL_25:
  v23 = v21;
  tcc_authorization_record_create();
  v19 = (const void *)v24;
  if (!v24)
    goto LABEL_36;
  tcc_authorization_record_set_service(v24, *(_QWORD *)(a1 + 48));
  tcc_authorization_record_set_authorization_value((uint64_t)v19, uint64);
  tcc_authorization_record_set_authorization_reason((uint64_t)v19, v15);
  tcc_authorization_record_set_version((uint64_t)v19, v16);
  tcc_authorization_record_set_allow_standard_user_to_set_system_service((uint64_t)v19, v23);
  if (xpc_dictionary_get_value(a2, "session_pid"))
  {
    v25 = xpc_dictionary_get_uint64(a2, "session_pid");
    tcc_authorization_record_set_session_pid((uint64_t)v19, v25);
  }
  if (xpc_dictionary_get_value(a2, "session_pid_version"))
  {
    v26 = xpc_dictionary_get_uint64(a2, "session_pid_version");
    tcc_authorization_record_set_session_pid_version((uint64_t)v19, v26);
  }
  v27 = (char *)xpc_dictionary_get_string(a2, "session_boot_UUID");
  if (v27)
    tcc_authorization_record_set_bootUUID((uint64_t)v19, v27);
  v28 = xpc_dictionary_get_BOOL(a2, "do_not_cache");
  if (!*(_DWORD *)(a1 + 76))
    goto LABEL_36;
  if (!*(_DWORD *)(a1 + 72))
  {
    if (*(_BYTE *)(a1 + 84))
      v33 = v28;
    else
      v33 = 1;
    if ((v33 & 1) != 0)
      goto LABEL_36;
    goto LABEL_35;
  }
  if (!v28)
LABEL_35:
    tcc_authorization_cache_set_authorization(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 64), *(const void **)(a1 + 48), *(const void **)(a1 + 64), v19);
LABEL_36:
  v8 = 0;
  v18 = 1;
LABEL_37:
  if (*(_DWORD *)(a1 + 80))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_release(*(const void **)(a1 + 32));
    tcc_release(*(_QWORD *)(a1 + 48));
    if (v19)
      tcc_release(v19);
    if ((v18 & 1) == 0)
    {
      v14 = v8;
LABEL_42:
      CFRelease(v14);
    }
  }
  else
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[2] = ___tcc_server_send_request_authorization_block_invoke_72;
    block[3] = &unk_1E4A2F278;
    v29 = *(_QWORD *)(a1 + 48);
    v30 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 56);
    block[1] = 0x40000000;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v19;
    block[6] = v8;
    block[7] = v29;
    dispatch_async(v30, block);
  }
}

uint64_t tcc_authorization_record_set_version(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 96) = a2;
  return result;
}

uint64_t tcc_authorization_record_set_service(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = tcc_retain(a2);
  *(_QWORD *)(a1 + 56) = result;
  return result;
}

uint64_t tcc_authorization_record_set_authorization_value(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t tcc_authorization_record_set_authorization_reason(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t tcc_authorization_record_set_allow_standard_user_to_set_system_service(uint64_t result, char a2)
{
  *(_BYTE *)(result + 136) = a2;
  return result;
}

void tcc_authorization_record_create()
{
  uint64_t v0;

  tcc_authorization_record_alloc(168, (uint64_t)&record_object_ops);
  *(_DWORD *)(v0 + 140) = -1;
  *(_QWORD *)(v0 + 144) = 0;
  *(_QWORD *)(v0 + 152) = 0;
}

__n128 tcc_authorization_record_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

__n128 tcc_credential_create_for_process_with_audit_token(uint64_t a1)
{
  uint64_t v2;
  __n128 result;
  __int128 v4;

  result.n128_u64[0] = tcc_credential_alloc(104, (uint64_t)&credential_object_ops).n128_u64[0];
  if (v2)
  {
    *(_QWORD *)(v2 + 56) = 1;
    result = *(__n128 *)a1;
    v4 = *(_OWORD *)(a1 + 16);
    *(_OWORD *)(v2 + 64) = *(_OWORD *)a1;
    *(_OWORD *)(v2 + 80) = v4;
  }
  return result;
}

__n128 tcc_credential_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t tcc_server_singleton_default()
{
  if (tcc_server_singleton_default_onceToken != -1)
    dispatch_once(&tcc_server_singleton_default_onceToken, &__block_literal_global_22);
  return tcc_server_singleton_default_default_ipc_server;
}

uint64_t tcc_authorization_cache_copy_authorization(uint64_t a1, const void *a2, const void *a3)
{
  os_unfair_lock_s *v6;
  const __CFDictionary *Value;
  const void *v8;
  uint64_t v9;
  const __CFString *v10;
  const __CFString *v11;
  NSObject *v12;
  CFStringRef v13;
  int v15;
  uint64_t name;
  __int16 v17;
  const __CFString *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v6 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    v8 = CFDictionaryGetValue(Value, a3);
    v9 = (uint64_t)v8;
    if (v8)
      tcc_retain(v8);
  }
  else
  {
    v9 = 0;
  }
  if (os_log_type_enabled(*(os_log_t *)(a1 + 56), OS_LOG_TYPE_DEBUG))
  {
    v10 = tcc_object_copy_description((uint64_t)a3);
    if (v9)
      v11 = tcc_object_copy_description(v9);
    else
      v11 = 0;
    v12 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      v15 = 136315650;
      name = tcc_service_get_name((uint64_t)a2);
      v17 = 2112;
      v18 = v10;
      v19 = 2112;
      v20 = v11;
      _os_log_debug_impl(&dword_1A364C000, v12, OS_LOG_TYPE_DEBUG, "GET: (%s, %@) -> %@", (uint8_t *)&v15, 0x20u);
    }
    CFRelease(v10);
    if (v11)
      CFRelease(v11);
    v13 = CFCopyDescription(*(CFTypeRef *)(a1 + 72));
    CFRelease(v13);
  }
  os_unfair_lock_unlock(v6);
  return v9;
}

uint64_t tcc_message_options_set_request_usage_string_policy(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 72) = a2;
  return result;
}

void tcc_authorization_cache_set_authorization(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  os_unfair_lock_s *v8;

  v8 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  _tcc_authorization_cache_locked_set_authorization(a1, a2, a3, a4);
  if (tcc_authorization_record_get_authorization_reason((uint64_t)a4) != 11)
    tcc_authorization_change_monitor_start_monitoring_service(*(_QWORD *)(a1 + 96), (uint64_t)a2);
  os_unfair_lock_unlock(v8);
}

uint64_t tcc_authorization_record_get_authorization_reason(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

void _tcc_authorization_cache_locked_set_authorization(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  uint64_t v8;
  int v9;
  void *Value;
  CFMutableDictionaryRef Mutable;
  NSObject *v12;
  int v13;
  NSObject *v14;
  CFIndex Count;
  int audit_token_cache_max_size;
  NSObject *v17;
  const void **v18;
  const __CFString *v19;
  NSObject *v20;
  uint64_t name;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  int v34;
  CFIndex v35;
  __int16 v36;
  const __CFString *v37;
  __int16 v38;
  const __CFString *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v8 = tcc_credential_singleton_for_self();
  v9 = tcc_object_equal((uint64_t)a3, v8);
  os_unfair_lock_assert_owner((const os_unfair_lock *)(a1 + 64));
  Value = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    if (!v9)
      goto LABEL_6;
    goto LABEL_17;
  }
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &kTCCObjectDictionaryKeyCallBacks, &kTCCObjectDictionaryValueCallBacks);
  if (Mutable)
  {
    Value = Mutable;
    CFDictionarySetValue(*(CFMutableDictionaryRef *)(a1 + 72), a2, Mutable);
    CFRelease(Value);
    if (!v9)
    {
LABEL_6:
      v12 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v34) = 0;
        _os_log_impl(&dword_1A364C000, v12, OS_LOG_TYPE_INFO, "Credential is not this process", (uint8_t *)&v34, 2u);
      }
      v13 = CFDictionaryContainsKey((CFDictionaryRef)Value, a3);
      v14 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v34 = 67109120;
        LODWORD(v35) = v13 != 0;
        _os_log_impl(&dword_1A364C000, v14, OS_LOG_TYPE_INFO, "Credential is present: %d", (uint8_t *)&v34, 8u);
      }
      Count = CFDictionaryGetCount((CFDictionaryRef)Value);
      audit_token_cache_max_size = tcc_service_get_audit_token_cache_max_size((uint64_t)a2);
      v17 = *(NSObject **)(a1 + 56);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        v34 = 134218240;
        v35 = Count;
        v36 = 1024;
        LODWORD(v37) = audit_token_cache_max_size;
        _os_log_impl(&dword_1A364C000, v17, OS_LOG_TYPE_INFO, "Numbers of entries in cache: %ld, max: %d", (uint8_t *)&v34, 0x12u);
      }
      if (!v13 && Count == audit_token_cache_max_size)
      {
        v18 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
        CFDictionaryGetKeysAndValues((CFDictionaryRef)Value, v18, 0);
        v19 = tcc_object_copy_description((uint64_t)a3);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)Value, *v18);
        v20 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          name = tcc_service_get_name((uint64_t)a2);
          v34 = 136315394;
          v35 = name;
          v36 = 2112;
          v37 = v19;
          _os_log_impl(&dword_1A364C000, v20, OS_LOG_TYPE_INFO, "REMOVE: (%s, %@)", (uint8_t *)&v34, 0x16u);
        }
        free(v18);
        CFRelease(v19);
      }
    }
LABEL_17:
    CFDictionarySetValue((CFMutableDictionaryRef)Value, a3, a4);
    v22 = tcc_object_copy_description((uint64_t)a3);
    v23 = tcc_object_copy_description((uint64_t)a4);
    v24 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = tcc_service_get_name((uint64_t)a2);
      v34 = 136315650;
      v35 = v25;
      v36 = 2112;
      v37 = v22;
      v38 = 2112;
      v39 = v23;
      _os_log_impl(&dword_1A364C000, v24, OS_LOG_TYPE_INFO, "SET: (%s, %@) -> %@", (uint8_t *)&v34, 0x20u);
    }
    CFRelease(v22);
    CFRelease(v23);
    return;
  }
  v26 = *(NSObject **)(a1 + 56);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    _tcc_authorization_cache_locked_set_authorization_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
}

const __CFString *tcc_object_copy_description(uint64_t a1)
{
  uint64_t (*v1)(void);

  v1 = *(uint64_t (**)(void))(a1 + 32);
  if (v1)
    return (const __CFString *)v1();
  else
    return CFSTR("<Missing Description>");
}

uint64_t tcc_service_get_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

__CFString *tcc_authorization_record_copy_description(uint64_t a1)
{
  __CFString *Mutable;
  uint64_t v3;
  const __CFString *v4;
  uint64_t v5;
  const __CFString *v6;
  unint64_t v7;
  const char *v8;
  unint64_t v9;
  const char *v10;
  uint64_t v11;
  const __CFString *v12;
  uint64_t v13;
  const __CFString *v14;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("<Authorization Record (%p) | "), a1);
  v3 = *(_QWORD *)(a1 + 64);
  if (v3)
  {
    v4 = tcc_object_copy_description(v3);
    CFStringAppendFormat(Mutable, 0, CFSTR("Subject: %@, "), v4);
    CFRelease(v4);
  }
  v5 = *(_QWORD *)(a1 + 56);
  if (v5
    && (v6 = tcc_object_copy_description(v5),
        CFStringAppendFormat(Mutable, 0, CFSTR("Service: %@, "), v6),
        CFRelease(v6),
        tcc_service_get_authorization_value_type(*(_QWORD *)(a1 + 56)) == 1))
  {
    v7 = *(_QWORD *)(a1 + 80);
    if (v7 > 6)
      v8 = "<Invalid Right>";
    else
      v8 = off_1E4A2E240[v7];
    CFStringAppendFormat(Mutable, 0, CFSTR("AuthRight: %s, "), v8);
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("AuthValue: 0x%llx, "), *(_QWORD *)(a1 + 80));
  }
  v9 = *(_QWORD *)(a1 + 88);
  if (v9 > 0xE)
    v10 = "<Invalid Reason>";
  else
    v10 = off_1E4A2E278[v9];
  CFStringAppendFormat(Mutable, 0, CFSTR("Reason: %s, "), v10);
  CFStringAppendFormat(Mutable, 0, CFSTR("Version: %llu, "), *(_QWORD *)(a1 + 96));
  v11 = *(_QWORD *)(a1 + 72);
  if (v11)
  {
    v12 = tcc_object_copy_description(v11);
    CFStringAppendFormat(Mutable, 0, CFSTR("IndirectObject: %@, "), v12);
    CFRelease(v12);
  }
  if (*(_QWORD *)(a1 + 120))
    CFStringAppendFormat(Mutable, 0, CFSTR("Last Modified: %@, "), *(_QWORD *)(a1 + 120));
  if (*(_QWORD *)(a1 + 128))
    CFStringAppendFormat(Mutable, 0, CFSTR("Expired At: %@, "), *(_QWORD *)(a1 + 128));
  v13 = *(_QWORD *)(a1 + 104);
  if (v13)
  {
    v14 = tcc_object_copy_description(v13);
    CFStringAppendFormat(Mutable, 0, CFSTR("Atrributed Entity: %@, "), v14);
    CFRelease(v14);
  }
  if ((*(_DWORD *)(a1 + 140) & 0x80000000) == 0)
    CFStringAppendFormat(Mutable, 0, CFSTR("Session pid: %d, "), *(unsigned int *)(a1 + 140));
  if (*(_QWORD *)(a1 + 144))
    CFStringAppendFormat(Mutable, 0, CFSTR("Session pid version: %llu, "), *(_QWORD *)(a1 + 144));
  if (*(_QWORD *)(a1 + 152))
    CFStringAppendFormat(Mutable, 0, CFSTR("Boot UUID: %s, "), *(_QWORD *)(a1 + 152));
  if (*(_BYTE *)(a1 + 136))
    CFStringAppend(Mutable, CFSTR("Allow Standard User to Set System Service"));
  if (*(_BYTE *)(a1 + 160))
    CFStringAppend(Mutable, CFSTR("Has Prompted For Allow"));
  CFStringAppend(Mutable, CFSTR(">"));
  return Mutable;
}

uint64_t tcc_service_get_authorization_value_type(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

__CFString *tcc_service_copy_description(uint64_t a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("%@"), *(_QWORD *)(a1 + 56));
  return Mutable;
}

__CFString *tcc_credential_copy_description(uint64_t a1)
{
  __CFString *Mutable;
  __CFString *v3;
  unint64_t v4;
  const char *v5;
  char __str[32];
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0);
  v3 = Mutable;
  v4 = *(_QWORD *)(a1 + 56) - 1;
  if (v4 > 2)
    v5 = "Requestor";
  else
    v5 = off_1E4A2F028[v4];
  CFStringAppendFormat(Mutable, 0, CFSTR("<Credential (%p) | %s"), a1, v5);
  if (*(_QWORD *)(a1 + 56) == 1)
  {
    snprintf(__str, 0x20uLL, "%d.%d/%d", *(_DWORD *)(a1 + 84), *(_DWORD *)(a1 + 92), *(_DWORD *)(a1 + 68));
    CFStringAppendFormat(v3, 0, CFSTR(", %s"), __str);
  }
  CFStringAppend(v3, CFSTR(">"));
  return v3;
}

CFMutableArrayRef TCCAccessCopyInformationInternal(void *a1)
{
  size_t count;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v4;
  _QWORD applier[5];

  count = xpc_array_get_count(a1);
  Mutable = CFArrayCreateMutable(0, count, MEMORY[0x1E0C9B378]);
  v4 = Mutable;
  if (Mutable)
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = __TCCAccessCopyInformationInternal_block_invoke;
    applier[3] = &__block_descriptor_tmp_333;
    applier[4] = Mutable;
    xpc_array_apply(a1, applier);
  }
  return v4;
}

void tcc_authorization_change_monitor_start_monitoring_service(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  _QWORD v3[6];

  v2 = *(NSObject **)(a1 + 64);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 0x40000000;
  v3[2] = __tcc_authorization_change_monitor_start_monitoring_service_block_invoke;
  v3[3] = &__block_descriptor_tmp_6;
  v3[4] = a1;
  v3[5] = a2;
  dispatch_async(v2, v3);
}

uint64_t __tcc_authorization_preflight_with_endpoint_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  uint64_t result;

  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_preflight_with_endpoint_block_invoke_cold_1((uint64_t)a1);
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = tcc_authorization_record_get_authorization_right(a2);
  }
  result = tcc_release(a1[6]);
  if (a1[7])
    return tcc_release(a1[8]);
  return result;
}

void tcc_events_subscription_dispose(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  NSObject *v4;
  const void *v5;

  v2 = (void *)a1[7];
  if (v2)
    free(v2);
  v3 = a1[8];
  if (v3)
    tcc_release(v3);
  v4 = a1[9];
  if (v4)
    dispatch_release(v4);
  v5 = (const void *)a1[10];
  if (v5)
    _Block_release(v5);
}

void tcc_events_filter_dispose(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 64);
  if (v1)
    xpc_release(v1);
}

void tcc_server_dispose(uint64_t a1)
{
  NSObject *v2;
  void *v3;

  v2 = *(NSObject **)(a1 + 56);
  if (v2)
    dispatch_release(v2);
  v3 = *(void **)(a1 + 72);
  if (v3)
    xpc_release(v3);
}

void tcc_identity_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_IDENTITY_TYPE_KEY", *(_QWORD *)(a1 + 56));
  xpc_dictionary_set_string(xdict, "TCCD_MSG_IDENTITY_ID_KEY", *(const char **)(a1 + 64));
  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_IDENTITY_VERIFIER_TYPE_KEY", *(_QWORD *)(a1 + 72));
  if (*(_QWORD *)(a1 + 72) == 1)
    xpc_dictionary_set_string(xdict, "TCCD_MSG_IDENTITY_VERIFIER_CODE_REQUIREMENT_KEY", *(const char **)(a1 + 80));
}

void ___tcc_server_send_get_authorization_records_block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  const char *v8;
  NSObject *v9;
  _BOOL4 v10;
  const char *v11;
  CFErrorRef CFError_with_user_info;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  const char *string;
  _QWORD applier[6];
  __int128 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2000000000;
  v27 = 0;
  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    v9 = tcc_log_handle();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    v11 = (const char *)*MEMORY[0x1E0C81270];
    if (v10)
      ___tcc_server_send_get_authorization_records_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1E0C81270]);
    string = xpc_dictionary_get_string(a2, v11);
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), string);
    goto LABEL_18;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    value = xpc_dictionary_get_value(a2, "clients");
    if (!value)
    {
      v5 = tcc_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ___tcc_server_send_get_authorization_records_block_invoke_2_cold_3(v5, v6, v7);
      v8 = "Missing 'clients' array in returned message.";
LABEL_17:
      CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), v8);
LABEL_18:
      v25[3] = (uint64_t)CFError_with_user_info;
LABEL_19:
      (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
      _Block_release(*(const void **)(a1 + 32));
      v16 = (const void *)v25[3];
      if (v16)
        CFRelease(v16);
      goto LABEL_24;
    }
  }
  else
  {
    value = xpc_dictionary_get_value(a2, "services");
    if (!value)
    {
      v13 = tcc_log_handle();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        ___tcc_server_send_get_authorization_records_block_invoke_2_cold_2(v13, v14, v15);
      v8 = "Missing 'services' array in returned message.";
      goto LABEL_17;
    }
  }
  if (v25[3])
    goto LABEL_19;
  applier[0] = MEMORY[0x1E0C809B0];
  applier[1] = 0x40000000;
  applier[2] = ___tcc_server_send_get_authorization_records_block_invoke_91;
  applier[3] = &unk_1E4A2F3F8;
  v22 = *(_OWORD *)(a1 + 48);
  v23 = *(_QWORD *)(a1 + 64);
  applier[4] = *(_QWORD *)(a1 + 40);
  applier[5] = &v24;
  xpc_array_apply(value, applier);
  if (v25[3])
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    CFRelease((CFTypeRef)v25[3]);
  }
  else if (*(_DWORD *)(a1 + 72))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  _Block_release(*(const void **)(a1 + 32));
LABEL_24:
  v17 = *(_QWORD *)(a1 + 48);
  if (v17)
    tcc_release(v17);
  v18 = *(_QWORD *)(a1 + 56);
  if (v18)
    tcc_release(v18);
  v19 = *(_QWORD *)(a1 + 64);
  if (v19)
    tcc_release(v19);
  _Block_object_dispose(&v24, 8);
}

uint64_t tcc_message_options_set_request_prompt_rights_mask(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 88) = a2;
  return result;
}

uint64_t tcc_identity_get_type(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t tcc_identity_get_identifier(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

_QWORD *tcc_identity_create(uint64_t a1, const char *a2)
{
  _QWORD *v4;
  _QWORD *v5;
  char *v6;

  tcc_identity_alloc(88, (uint64_t)&identity_object_ops);
  v5 = v4;
  v6 = strdup(a2);
  v5[7] = a1;
  v5[8] = v6;
  v5[9] = 0;
  return v5;
}

__n128 tcc_identity_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

os_log_t __tcc_log_handle_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.TCC", "access");
  tcc_client_log = (uint64_t)result;
  return result;
}

uint64_t tcc_authorization_preflight(void *key)
{
  return tcc_authorization_preflight_with_endpoint(0, key);
}

uint64_t TCCAccessPreflightWithAuditToken(const void *a1, void *a2)
{
  uint64_t v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  void *values[3];
  void *keys[2];
  const __CFString *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  *(_OWORD *)keys = xmmword_1E4A2E610;
  v16 = CFSTR("_kTCCAccessRequestOptionSyncCallback");
  v3 = MEMORY[0x1E0C809B0];
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = __TCCAccessPreflightWithAuditToken_block_invoke;
  v9[3] = &unk_1E4A2E630;
  v9[4] = &v10;
  values[0] = a2;
  values[1] = v9;
  values[2] = *(void **)MEMORY[0x1E0C9AE50];
  v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 3, MEMORY[0x1E0C9B390], 0);
  if (v4)
  {
    v5 = v4;
    v8[0] = v3;
    v8[1] = 0x40000000;
    v8[2] = __TCCAccessPreflightWithAuditToken_block_invoke_2;
    v8[3] = &unk_1E4A2E658;
    v8[4] = &v10;
    TCCAccessRequest(a1, v4, (uint64_t)v8);
    CFRelease(v5);
  }
  v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

uint64_t TCCAccessCheckAuditToken(const void *a1, void *a2, CFDictionaryRef theDict)
{
  const void *v6;
  void *v7;
  void *v8;
  void *v9;
  int ValueIfPresent;
  void *v11;
  const __CFDictionary *v12;
  const __CFDictionary *v13;
  uint64_t v14;
  _QWORD v16[5];
  void *value;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  char v21;
  void *values[4];
  void *keys[5];

  keys[4] = *(void **)MEMORY[0x1E0C80C00];
  v18 = 0;
  v19 = &v18;
  v20 = 0x2000000000;
  v21 = 0;
  if (theDict)
  {
    v6 = CFDictionaryGetValue(theDict, kTCCAccessCheckOptionPrompt);
    v7 = (void *)*MEMORY[0x1E0C9AE50];
    if (v6 == (const void *)*MEMORY[0x1E0C9AE50])
      v8 = 0;
    else
      v8 = &__block_literal_global_203;
    v9 = (void *)*MEMORY[0x1E0C9B0D0];
    value = (void *)*MEMORY[0x1E0C9B0D0];
    ValueIfPresent = CFDictionaryGetValueIfPresent(theDict, kTCCAccessCheckOptionPurposeRequired, (const void **)&value);
    v11 = value;
    if (!ValueIfPresent)
      v11 = v9;
  }
  else
  {
    v11 = (void *)*MEMORY[0x1E0C9B0D0];
    value = (void *)*MEMORY[0x1E0C9B0D0];
    v7 = (void *)*MEMORY[0x1E0C9AE50];
    v8 = &__block_literal_global_203;
  }
  keys[0] = CFSTR("_kTCCAccessRequestOptionTargetToken");
  keys[1] = CFSTR("_kTCCAccessRequestOptionPreflight");
  keys[2] = CFSTR("_kTCCAccessRequestOptionSyncCallback");
  keys[3] = kTCCAccessCheckOptionPurposeRequired;
  values[0] = a2;
  values[1] = v8;
  values[2] = v7;
  values[3] = v11;
  v12 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 4, MEMORY[0x1E0C9B390], 0);
  if (v12)
  {
    v13 = v12;
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 0x40000000;
    v16[2] = __TCCAccessCheckAuditToken_block_invoke_2;
    v16[3] = &unk_1E4A2E5F0;
    v16[4] = &v18;
    TCCAccessRequest(a1, v12, (uint64_t)v16);
    CFRelease(v13);
  }
  v14 = *((unsigned __int8 *)v19 + 24);
  _Block_object_dispose(&v18, 8);
  return v14;
}

uint64_t TCCAccessRestricted(const void *a1)
{
  void *v2;
  const __CFDictionary *v3;
  const __CFDictionary *v4;
  uint64_t v5;
  _QWORD v7[5];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;
  void *values[2];
  void *keys[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  *(_OWORD *)keys = xmmword_1E4A2E530;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = __TCCAccessRestricted_block_invoke;
  v7[3] = &unk_1E4A2E548;
  v7[4] = &v8;
  v2 = (void *)*MEMORY[0x1E0C9AE50];
  values[0] = v7;
  values[1] = v2;
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], 0);
  if (v3)
  {
    v4 = v3;
    TCCAccessRequest(a1, v3, (uint64_t)&__block_literal_global_201);
    CFRelease(v4);
  }
  v5 = *((unsigned __int8 *)v9 + 24);
  _Block_object_dispose(&v8, 8);
  return v5;
}

uint64_t TCCAccessPreflight(const void *a1)
{
  uint64_t v2;
  void *v3;
  const __CFDictionary *v4;
  const __CFDictionary *v5;
  uint64_t v6;
  _QWORD v8[5];
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;
  void *values[2];
  void *keys[2];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 1;
  v2 = MEMORY[0x1E0C809B0];
  *(_OWORD *)keys = xmmword_1E4A2E530;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = __TCCAccessPreflight_block_invoke;
  v9[3] = &unk_1E4A2E4E8;
  v9[4] = &v10;
  v3 = (void *)*MEMORY[0x1E0C9AE50];
  values[0] = v9;
  values[1] = v3;
  v4 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, MEMORY[0x1E0C9B390], 0);
  if (v4)
  {
    v5 = v4;
    v8[0] = v2;
    v8[1] = 0x40000000;
    v8[2] = __TCCAccessPreflight_block_invoke_2;
    v8[3] = &unk_1E4A2E510;
    v8[4] = &v10;
    TCCAccessRequest(a1, v4, (uint64_t)v8);
    CFRelease(v5);
  }
  v6 = *((unsigned int *)v11 + 6);
  _Block_object_dispose(&v10, 8);
  return v6;
}

void TCCAccessRequest(const void *a1, const __CFDictionary *a2, uint64_t a3)
{
  NSObject *global_queue;
  const void *Value;
  const void *v8;
  const void *v9;
  int v10;
  int v11;
  int v12;
  const __CFBoolean *v13;
  NSObject *v14;
  _QWORD *v15;
  _QWORD activity_block[7];
  int v17;
  _QWORD v18[9];
  int v19;
  int v20;
  int v21;
  _QWORD block[5];
  _QWORD v23[5];
  uint8_t buf[16];

  global_queue = dispatch_get_global_queue(0, 0);
  if (a2)
  {
    Value = CFDictionaryGetValue(a2, CFSTR("_kTCCAccessRequestOptionPreflight"));
    v8 = CFDictionaryGetValue(a2, CFSTR("_kTCCAccessRequestOptionTargetToken"));
    v9 = CFDictionaryGetValue(a2, CFSTR("_kTCCAccessRequestOptionSyncCallback"));
    if (v9)
      v10 = CFEqual(v9, (CFTypeRef)*MEMORY[0x1E0C9AE50]);
    else
      v10 = 0;
    v13 = (const __CFBoolean *)CFDictionaryGetValue(a2, kTCCAccessCheckOptionPurposeRequired);
    v11 = 0;
    v12 = 1;
    if (v13 && v13 != (const __CFBoolean *)*MEMORY[0x1E0C9B0D0])
    {
      v12 = CFBooleanGetValue(v13);
      v11 = 1;
    }
  }
  else
  {
    v8 = 0;
    v10 = 0;
    v11 = 0;
    Value = 0;
    v12 = 1;
  }
  if (os_variant_is_darwinos())
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v14 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A364C000, v14, OS_LOG_TYPE_DEFAULT, "automatically granting auth because of darwinos", buf, 2u);
    }
    if (v10)
    {
      (*(void (**)(uint64_t, uint64_t))(a3 + 16))(a3, 1);
      return;
    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 0x40000000;
    v23[2] = __TCCAccessRequest_block_invoke;
    v23[3] = &unk_1E4A2E318;
    v23[4] = a3;
    v15 = v23;
  }
  else
  {
    if (TCCAccessRequest_cache_once != -1)
      dispatch_once(&TCCAccessRequest_cache_once, &__block_literal_global_166);
    if (TCCAccessRequest_cache_map && TCCAccessRequest_cache_queue)
    {
      CFRetain(a1);
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 0x40000000;
      v18[2] = __TCCAccessRequest_block_invoke_4;
      v18[3] = &unk_1E4A2E498;
      v18[6] = v8;
      v18[7] = a1;
      v18[4] = Value;
      v18[5] = a3;
      v18[8] = global_queue;
      v19 = v10;
      v20 = v11;
      v21 = v12;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessRequest_block_invoke_2_191;
      activity_block[3] = &unk_1E4A2E4C0;
      v17 = v10;
      activity_block[4] = Value;
      activity_block[5] = v18;
      activity_block[6] = a1;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessRequest() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
      return;
    }
    if (v10)
    {
      (*(void (**)(uint64_t, _QWORD))(a3 + 16))(a3, 0);
      return;
    }
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = __TCCAccessRequest_block_invoke_3;
    block[3] = &unk_1E4A2E380;
    block[4] = a3;
    v15 = block;
  }
  dispatch_async(global_queue, v15);
}

_QWORD *__tcc_server_singleton_default_block_invoke()
{
  NSObject *global_queue;
  _QWORD *result;

  global_queue = dispatch_get_global_queue(0, 0);
  result = tcc_server_create(global_queue);
  tcc_server_singleton_default_default_ipc_server = (uint64_t)result;
  if (result)
  {
    *((_DWORD *)result + 3) = 0x7FFFFFFF;
    *((_DWORD *)result + 2) = 0x7FFFFFFF;
  }
  return result;
}

_QWORD *tcc_server_create(NSObject *global_queue)
{
  _QWORD *v2;
  _QWORD *v3;

  tcc_server_alloc(80, (uint64_t)&server_object_ops);
  v3 = v2;
  if (!global_queue)
    global_queue = dispatch_get_global_queue(0, 0);
  dispatch_retain(global_queue);
  v3[7] = global_queue;
  v3[9] = 0;
  v3[8] = tcc_authorization_cache_shared_instance();
  return v3;
}

__n128 tcc_server_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t tcc_authorization_cache_shared_instance()
{
  if (tcc_authorization_cache_shared_instance_init_once != -1)
    dispatch_once(&tcc_authorization_cache_shared_instance_init_once, &__block_literal_global_0);
  return tcc_authorization_cache_shared_instance_shared_instance;
}

void tcc_server_message_get_authorization_records_by_service(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  const char *name;
  int is_system_service;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY", 3uLL);
  v9 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v9 = v10;
    tcc_message_options_set_reply_handler_policy(v10, 1);
    a2 = v9;
  }
  tcc_object_encode_to_dictionary(a2);
  xpc_dictionary_set_string(v8, "function", "TCCAccessCopyInformation");
  name = (const char *)tcc_service_get_name(a3);
  xpc_dictionary_set_string(v8, "service", name);
  is_system_service = tcc_service_get_is_system_service(a3);
  _tcc_server_send_get_authorization_records(a1, is_system_service, a2, a3, 0, 0, (uint64_t)v8, a4);
  if (v9)
    tcc_release(v9);
  xpc_release(v8);
}

void ___tcc_server_send_request_authorization_block_invoke_2(uint64_t a1)
{
  xpc_object_t value;
  void *data;
  _xpc_connection_s *v4;
  uint64_t is_system_service;
  int v6;
  void *v7;
  _QWORD v8[6];
  int8x16_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  char v13;
  size_t length;

  length = 0;
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  data = value;
  if (value)
  {
    if (xpc_dictionary_get_uint64(value, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") == 1)
      data = (void *)xpc_dictionary_get_data(data, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_AUDIT_TOKEN_KEY", &length);
    else
      data = 0;
  }
  v4 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 48) + 72);
  is_system_service = tcc_service_get_is_system_service(*(_QWORD *)(a1 + 56));
  v6 = *(_DWORD *)(a1 + 72);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 0x40000000;
  v8[2] = ___tcc_server_send_request_authorization_block_invoke_3;
  v8[3] = &unk_1E4A2F2A0;
  v7 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v8[5] = v7;
  v11 = *(_QWORD *)(a1 + 76);
  v13 = *(_BYTE *)(a1 + 84);
  v9 = vextq_s8(*(int8x16_t *)(a1 + 48), *(int8x16_t *)(a1 + 48), 8uLL);
  v10 = *(_QWORD *)(a1 + 64);
  v12 = v6;
  tccd_send_v2(v4, is_system_service, v6, (uint64_t)data, v7, (uint64_t)v8);
}

uint64_t tcc_service_get_is_system_service(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 96);
}

void _tcc_server_send_get_authorization_records(uint64_t a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const void *a8)
{
  int reply_handler_policy;
  void *v16;
  _QWORD activity_block[11];
  int v18;
  _BOOL4 v19;
  int v20;

  reply_handler_policy = tcc_message_options_get_reply_handler_policy(a3);
  if (a4)
    tcc_retain(a4);
  if (a5)
    tcc_retain(a5);
  if (a6)
    tcc_retain(a6);
  v16 = _Block_copy(a8);
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 0x40000000;
  activity_block[2] = ___tcc_server_send_get_authorization_records_block_invoke;
  activity_block[3] = &unk_1E4A2F448;
  v18 = a2;
  v19 = reply_handler_policy == 1;
  activity_block[6] = a1;
  activity_block[7] = a7;
  activity_block[8] = a4;
  activity_block[9] = a5;
  activity_block[10] = a6;
  activity_block[4] = v16;
  activity_block[5] = a8;
  v20 = 1;
  _os_activity_initiate(&dword_1A364C000, "tcc_send_get_authorization() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
}

uint64_t tcc_credential_hash(uint64_t a1)
{
  size_t v2;
  uint64_t v3;
  uint64_t v4;
  __int128 v5;
  void *no_copy;
  uint64_t v7;
  _OWORD v9[2];

  v2 = *(_QWORD *)(a1 + 56);
  switch(v2)
  {
    case 3uLL:
      no_copy = (void *)xpc_string_create_no_copy();
      v2 = xpc_hash(no_copy) + 93;
      xpc_release(no_copy);
      break;
    case 2uLL:
      v2 = xpc_hash(*(xpc_object_t *)(a1 + 64)) + 62;
      break;
    case 1uLL:
      v3 = 0;
      v4 = 0;
      v5 = *(_OWORD *)(a1 + 80);
      v9[0] = *(_OWORD *)(a1 + 64);
      v9[1] = v5;
      do
      {
        v4 = *(unsigned int *)((char *)v9 + v3) - v4 + 32 * v4;
        v3 += 4;
      }
      while (v3 != 32);
      v2 = v4 + 31;
      break;
  }
  v7 = *(_QWORD *)(a1 + 96);
  if (v7)
    return tcc_object_hash(v7) - v2 + 32 * v2;
  return v2;
}

void __tcc_credential_singleton_for_self_block_invoke()
{
  uint64_t v0;

  tcc_credential_alloc(104, (uint64_t)&credential_object_ops);
  tcc_credential_singleton_for_self_cred_for_this_process = v0;
  if (v0)
  {
    *(_QWORD *)(v0 + 56) = 0;
    *(_DWORD *)(v0 + 12) = 0x7FFFFFFF;
    *(_DWORD *)(v0 + 8) = 0x7FFFFFFF;
  }
}

dispatch_queue_t __tcc_service_get_message_preflight_queue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result;
  _WORD v3[16];
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
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v8 = xmmword_1A3660910;
  v9 = unk_1A3660920;
  v6 = xmmword_1A36608F0;
  v7 = unk_1A3660900;
  v12 = xmmword_1A3660950;
  v13 = unk_1A3660960;
  v10 = xmmword_1A3660930;
  v11 = unk_1A3660940;
  v16 = xmmword_1A3660990;
  v17 = unk_1A36609A0;
  v14 = xmmword_1A3660970;
  v15 = unk_1A3660980;
  strcpy((char *)v3, "com.apple.tcc.auth.preflight.");
  v3[15] = 0;
  v4 = xmmword_1A36608D0;
  v5 = unk_1A36608E0;
  __strlcat_chk();
  result = dispatch_queue_create((const char *)v3, 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 128) = result;
  return result;
}

CFTypeRef _TCCTCCAccessCopyInformationInternalForEntry(void *a1)
{
  size_t count;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v4;
  const char *string;
  const UInt8 *v6;
  size_t v7;
  const __CFURL *v8;
  CFBundleRef v9;
  CFTypeRef v10;
  const char *v11;
  CFStringRef v12;
  const char *v13;
  CFStringRef v14;
  const void *v15;
  _BOOL4 v16;
  const void **v17;
  int64_t int64;
  CFDateRef v19;
  CFStringRef v20;
  int64_t v21;
  CFDateRef v22;
  const char *v23;

  count = xpc_dictionary_get_count(a1);
  Mutable = CFDictionaryCreateMutable(0, count, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  v4 = Mutable;
  string = xpc_dictionary_get_string(a1, "bundle");
  v6 = (const UInt8 *)string;
  if (!string)
  {
    v9 = 0;
LABEL_8:
    v11 = xpc_dictionary_get_string(a1, "path");
    if (v11)
    {
      v12 = CFStringCreateWithCString(0, v11, 0x8000100u);
      if (!v12)
      {
        v14 = 0;
        goto LABEL_23;
      }
      CFDictionarySetValue(v4, kTCCInfoPath, v12);
    }
    else
    {
      v12 = 0;
    }
    v13 = xpc_dictionary_get_string(a1, "service");
    if (!v13)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v14 = CFStringCreateWithCString(0, v13, 0x8000100u);
    if (v14)
    {
      CFDictionarySetValue(v4, (const void *)kTCCInfoService, v14);
LABEL_17:
      v15 = (const void *)kTCCInfoGranted;
      v16 = xpc_dictionary_get_BOOL(a1, "granted");
      v17 = (const void **)MEMORY[0x1E0C9AE50];
      if (!v16)
        v17 = (const void **)MEMORY[0x1E0C9AE40];
      CFDictionarySetValue(v4, v15, *v17);
      int64 = xpc_dictionary_get_int64(a1, "last_modified");
      if (int64 < 1)
      {
        v19 = 0;
      }
      else
      {
        v19 = CFDateCreate(0, (double)(int64 - 978307200));
        CFDictionarySetValue(v4, kTCCInfoLastModified, v19);
      }
      v21 = xpc_dictionary_get_int64(a1, "expired_at");
      if (v21 >= 1)
      {
        v22 = CFDateCreate(0, (double)(v21 - 978307200));
        CFDictionarySetValue(v4, kTCCInfoExpiredAt, v22);
        CFRelease(v22);
      }
      v23 = xpc_dictionary_get_string(a1, "_CHILD_SERVICE_");
      if (!v23)
      {
        v20 = 0;
        goto LABEL_32;
      }
      v20 = CFStringCreateWithCString(0, v23, 0x8000100u);
      if (v20)
      {
        CFDictionarySetValue(v4, CFSTR("_CHILD_SERVICE_"), v20);
LABEL_32:
        v10 = CFRetain(v4);
LABEL_33:
        CFRelease(v4);
        v4 = v19;
        if (!v6)
          goto LABEL_35;
        goto LABEL_34;
      }
LABEL_30:
      v10 = 0;
      goto LABEL_33;
    }
LABEL_23:
    v20 = 0;
    v19 = 0;
    goto LABEL_30;
  }
  v7 = strlen(string);
  v8 = CFURLCreateWithBytes(0, v6, v7, 0x8000100u, 0);
  if (!v8)
  {
    v10 = 0;
LABEL_44:
    CFRelease(v4);
    return v10;
  }
  v6 = (const UInt8 *)v8;
  v9 = CFBundleCreate(0, v8);
  if (v9)
  {
    CFDictionarySetValue(v4, kTCCInfoBundle, v9);
    goto LABEL_8;
  }
  CFRelease(v4);
  v10 = 0;
  v19 = 0;
  v20 = 0;
  v14 = 0;
  v12 = 0;
LABEL_34:
  CFRelease(v6);
  v4 = v19;
LABEL_35:
  if (v9)
    CFRelease(v9);
  if (v12)
    CFRelease(v12);
  if (v14)
    CFRelease(v14);
  if (v20)
    CFRelease(v20);
  if (v4)
    goto LABEL_44;
  return v10;
}

dispatch_queue_t __service_queue_block_invoke()
{
  const __CFAllocator *v0;
  const CFDictionaryKeyCallBacks *v1;
  dispatch_queue_t result;

  v0 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v1 = (const CFDictionaryKeyCallBacks *)MEMORY[0x1E0C9AEB8];
  service_queue_request_map = (uint64_t)CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9AEB8], 0);
  service_queue_preflight_map = (uint64_t)CFDictionaryCreateMutable(v0, 0, v1, 0);
  result = dispatch_queue_create("com.apple.tcc.service_queue", 0);
  service_queue_qq = (uint64_t)result;
  return result;
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke(uint64_t a1)
{
  uint32_t v2;
  int v3;
  NSObject *v4;
  CFNumberRef v5;
  _QWORD v6[4];
  __int128 v7;
  int out_token;
  char name[128];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (!CFDictionaryContainsValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 72), *(const void **)(a1 + 40)))
  {
    tcc_authorization_changed_for_service_notification_name(*(_QWORD *)(a1 + 40), name, 0x80uLL);
    out_token = -1;
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 0x40000000;
    v6[2] = __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2;
    v6[3] = &__block_descriptor_tmp;
    v7 = *(_OWORD *)(a1 + 32);
    v2 = notify_register_dispatch(name, &out_token, *(dispatch_queue_t *)(v7 + 64), v6);
    if (v2)
    {
      v3 = v2;
      v4 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 56);
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_cold_1((uint64_t)name, v3, v4);
    }
    else
    {
      v5 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &out_token);
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 72), v5, *(const void **)(a1 + 40));
      CFRelease(v5);
    }
  }
}

uint64_t tcc_authorization_changed_for_service_notification_name(uint64_t a1, char *a2, size_t a3)
{
  const char *name;
  uint64_t result;

  name = (const char *)tcc_service_get_name(a1);
  result = snprintf(a2, a3, "com.apple.TCC.%s.authorization.changed", name);
  if ((int)result <= 0)
    tcc_authorization_changed_for_service_notification_name_cold_1();
  return result;
}

uint64_t __tcc_authorization_cache_shared_instance_block_invoke()
{
  uint64_t result;

  result = tcc_authorization_cache_create(0);
  tcc_authorization_cache_shared_instance_shared_instance = result;
  if (result)
  {
    *(_DWORD *)(result + 12) = 0x7FFFFFFF;
    *(_DWORD *)(result + 8) = 0x7FFFFFFF;
  }
  return result;
}

uint64_t tcc_authorization_cache_create(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  CFMutableDictionaryRef Mutable;
  NSObject *global_queue;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  _QWORD *v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;

  tcc_authorization_cache_alloc(112, (uint64_t)&authorization_cache_object_ops);
  v3 = v2;
  *(_QWORD *)(v2 + 56) = os_log_create("com.apple.TCC", "cache");
  *(_QWORD *)(v3 + 104) = a1;
  *(_DWORD *)(v3 + 64) = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &kTCCObjectDictionaryKeyCallBacks, MEMORY[0x1E0C9B3A0]);
  *(_QWORD *)(v3 + 72) = Mutable;
  if (!Mutable)
  {
    v24 = *(NSObject **)(v3 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      tcc_authorization_cache_create_cold_1(v24, v25, v26, v27, v28, v29, v30, v31);
    goto LABEL_10;
  }
  global_queue = dispatch_get_global_queue(21, 0);
  *(_QWORD *)(v3 + 80) = dispatch_queue_create_with_target_V2("com.apple.TCC.cache.state_handler", 0, global_queue);
  v6 = os_state_add_handler();
  *(_QWORD *)(v3 + 88) = v6;
  if (!v6)
  {
    v7 = *(NSObject **)(v3 + 56);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      tcc_authorization_cache_create_cold_3(v7, v8, v9, v10, v11, v12, v13, v14);
  }
  v15 = tcc_authorization_change_monitor_create(v3);
  *(_QWORD *)(v3 + 96) = v15;
  if (!v15)
  {
    v16 = *(NSObject **)(v3 + 56);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      tcc_authorization_cache_create_cold_2(v16, v17, v18, v19, v20, v21, v22, v23);
LABEL_10:
    tcc_release(v3);
    return 0;
  }
  return v3;
}

_QWORD *tcc_authorization_change_monitor_create(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  NSObject *global_queue;
  CFMutableDictionaryRef Mutable;
  NSObject *v6;

  tcc_authorization_change_monitor_alloc(88, (uint64_t)&authorization_change_monitor_ops);
  v3 = v2;
  v2[7] = os_log_create("com.apple.TCC", "changeMonitor");
  v3[10] = a1;
  global_queue = dispatch_get_global_queue(21, 0);
  v3[8] = dispatch_queue_create_with_target_V2("com.apple.TCC.cache.changeMonitor", 0, global_queue);
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], &kTCCObjectDictionaryValueCallBacks);
  v3[9] = Mutable;
  if (!Mutable)
  {
    v6 = v3[7];
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      tcc_authorization_change_monitor_create_cold_1(v6);
    tcc_release(v3);
    return 0;
  }
  return v3;
}

__n128 tcc_authorization_change_monitor_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

__n128 tcc_authorization_cache_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t tcc_events_filter_create_with_criteria(void *a1)
{
  uint64_t v2;
  uint64_t v3;
  xpc_object_t v4;

  tcc_events_filter_alloc(72, (uint64_t)&events_filter_object_ops);
  v3 = v2;
  *(_BYTE *)(v2 + 56) = 1;
  v4 = xpc_copy(a1);
  *(_QWORD *)(v3 + 64) = v4;
  if (!v4)
  {
    tcc_release(v3);
    return 0;
  }
  return v3;
}

__n128 tcc_events_filter_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t TCCAccessCopyInformationForBundleId(const __CFString *a1)
{
  _BYTE *v1;
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  xpc_object_t *v7;
  void *v8;
  uint64_t v9;
  _QWORD activity_block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t values[2];
  __int128 v17;
  char *keys[2];
  const char *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  *(_OWORD *)keys = xmmword_1E4A2E6C8;
  v19 = "client";
  *(_OWORD *)values = 0u;
  v17 = 0u;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values[0] = xpc_string_create("TCCAccessCopyInformationForBundle")) != 0
    && (values[1] = xpc_string_create("bundle")) != 0
    && (*(_QWORD *)&v17 = xpc_string_create(v1), (_QWORD)v17)
    && (v2 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0)
  {
    v3 = v2;
    v4 = tccd();
    if (v4)
    {
      v5 = v4;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessCopyInformationForBundleId_block_invoke;
      activity_block[3] = &unk_1E4A2E710;
      activity_block[5] = v4;
      activity_block[6] = v3;
      activity_block[4] = &v12;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessCopyInformationForBundle() IPC-per-user", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      xpc_release(v5);
    }
    free(v1);
    xpc_release(v3);
  }
  else
  {
    free(v1);
  }
  v6 = values[0];
  if (values[0])
  {
    v7 = &values[1];
    do
    {
      xpc_release(v6);
      v8 = *v7++;
      v6 = v8;
    }
    while (v8);
  }
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t TCCAccessCopyBundleIdentifiersForService(const __CFString *a1)
{
  _BYTE *v1;
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t values;
  _QWORD v18[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  values = 0;
  *(_OWORD *)keys = xmmword_1E4A2EB50;
  v18[0] = 0;
  v18[1] = 0;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values = xpc_string_create("TCCAccessCopyBundleIdentifiersForService")) != 0
    && (v18[0] = xpc_string_create(v1)) != 0
    && (v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0)
  {
    v3 = v2;
    v4 = tccd();
    if (v4)
    {
      v5 = v4;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __TCCAccessCopyBundleIdentifiersForService_block_invoke;
      v12[3] = &unk_1E4A2E788;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessCopyBundleIdentifiersForService() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
      free(v1);
      xpc_release(v3);
      v6 = v5;
    }
    else
    {
      free(v1);
      v6 = (_xpc_connection_s *)v3;
    }
    xpc_release(v6);
  }
  else
  {
    free(v1);
  }
  v7 = values;
  if (values)
  {
    v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      v9 = *v8++;
      v7 = v9;
    }
    while (v9);
  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

void tcc_events_subscribe(const char *a1, uint64_t a2, NSObject *a3, const void *a4)
{
  _QWORD *v8;
  _QWORD *v9;
  xpc_object_t v10;
  uint64_t pointer;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t values;
  char *keys[2];

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  _tcc_events_initialize();
  tcc_events_subscription_alloc(88, (uint64_t)&events_subscription_object_ops);
  v9 = v8;
  v8[7] = strdup(a1);
  if (a2)
  {
    tcc_retain(a2);
  }
  else
  {
    keys[0] = "kTCCServiceAll";
    values = xpc_BOOL_create(1);
    v10 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    a2 = tcc_events_filter_create_with_criteria(v10);
    xpc_release(v10);
  }
  v9[8] = a2;
  v9[9] = a3;
  dispatch_retain(a3);
  v9[10] = _Block_copy(a4);
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE6C4728);
  pointer = xpc_dictionary_get_pointer();
  if (pointer)
  {
    v12 = pointer;
    v13 = qword_1EE6C4720;
    if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_DEBUG))
      tcc_events_subscribe_cold_2((uint64_t)(v9 + 7), v13, v14, v15, v16, v17, v18, v19);
    tcc_release(v12);
  }
  xpc_dictionary_set_pointer();
  if (*(_BYTE *)(v9[8] + 56) == 1)
    xpc_set_event();
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE6C4728);
  if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_DEBUG))
    tcc_events_subscribe_cold_1();
}

void tcc_events_unsubscribe()
{
  uint64_t pointer;
  uint64_t v1;

  _tcc_events_initialize();
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE6C4728);
  pointer = xpc_dictionary_get_pointer();
  if (pointer)
  {
    v1 = pointer;
    xpc_dictionary_set_pointer();
    tcc_release(v1);
    xpc_set_event();
  }
  else if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
  {
    tcc_events_unsubscribe_cold_2();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE6C4728);
  if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_DEBUG))
    tcc_events_unsubscribe_cold_1();
}

void _tcc_events_initialize()
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = ___tcc_events_initialize_block_invoke;
  block[3] = &__block_descriptor_tmp_7_0;
  block[4] = &_tcc_events_global_state;
  if (_tcc_events_global_state != -1)
    dispatch_once(&_tcc_events_global_state, block);
}

__n128 tcc_events_subscription_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

uint64_t tcc_authorization_preflight_with_endpoint(_xpc_endpoint_s *a1, void *key)
{
  const void *v3;
  const void *v4;
  uint64_t v5;
  void (*v6)(_QWORD, _QWORD, _QWORD);
  uint64_t v7;
  void (*v8)(_QWORD, _QWORD, _QWORD);
  uint64_t v9;
  void (*v11[9])(_QWORD, _QWORD, _QWORD);
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v3 = tcc_service_singleton_for_CF_name(key);
  v4 = (const void *)tcc_credential_singleton_for_self();
  if (a1)
    v5 = (uint64_t)tcc_server_create_with_endpoint(0, a1);
  else
    v5 = tcc_server_singleton_default();
  v6 = (void (*)(_QWORD, _QWORD, _QWORD))v5;
  tcc_message_options_create();
  v8 = (void (*)(_QWORD, _QWORD, _QWORD))v7;
  tcc_message_options_set_reply_handler_policy(v7, 1);
  tcc_message_options_set_request_prompt_policy((uint64_t)v8, 2);
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v11[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v11[1] = (void (*)(_QWORD, _QWORD, _QWORD))0x40000000;
  v11[2] = (void (*)(_QWORD, _QWORD, _QWORD))__tcc_authorization_preflight_with_endpoint_block_invoke;
  v11[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E4A2EE98;
  v11[4] = (void (*)(_QWORD, _QWORD, _QWORD))&v12;
  v11[5] = (void (*)(_QWORD, _QWORD, _QWORD))v3;
  v11[6] = v8;
  v11[7] = (void (*)(_QWORD, _QWORD, _QWORD))a1;
  v11[8] = v6;
  tcc_server_message_request_authorization((uint64_t)v6, (uint64_t)v8, v4, v3, 0, v11);
  v9 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t tcc_credential_create_for_self_with_assumed_identity(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;

  tcc_credential_alloc(104, (uint64_t)&credential_object_ops);
  v3 = v2;
  *(_QWORD *)(v2 + 56) = 0;
  *(_QWORD *)(v2 + 96) = tcc_retain(a1);
  return v3;
}

__n128 ___tcc_server_send_get_authorization_records_block_invoke(uint64_t a1)
{
  void *v1;
  _xpc_connection_s *v2;
  uint64_t v3;
  int v4;
  __int128 v5;
  __n128 result;
  _QWORD v7[4];
  __int128 v8;
  __int128 v9;
  uint64_t v10;
  int v11;

  v1 = *(void **)(a1 + 56);
  v2 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 48) + 72);
  v3 = *(unsigned int *)(a1 + 88);
  v4 = *(_DWORD *)(a1 + 92);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 0x40000000;
  v7[2] = ___tcc_server_send_get_authorization_records_block_invoke_2;
  v7[3] = &unk_1E4A2F420;
  v5 = *(_OWORD *)(a1 + 64);
  v10 = *(_QWORD *)(a1 + 80);
  v8 = *(_OWORD *)(a1 + 32);
  v9 = v5;
  v11 = *(_DWORD *)(a1 + 96);
  tccd_send_v2(v2, v3, v4, 0, v1, (uint64_t)v7);
  return result;
}

void *__tcc_authorization_cache_create_block_invoke(uint64_t a1, uint64_t a2)
{
  __CFDictionary *v2;
  __CFDictionary *v3;
  const __CFData *Data;
  const __CFData *v5;
  unsigned int Length;
  void *v7;
  CFRange v9;

  if ((*(_DWORD *)(a2 + 16) & 0xFFFFFFFE) != 2)
    return 0;
  v2 = tcc_authorization_cache_copy_state_dump(*(_QWORD *)(a1 + 32));
  if (!v2)
    return 0;
  v3 = v2;
  Data = CFPropertyListCreateData((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v2, kCFPropertyListBinaryFormat_v1_0, 0, 0);
  if (Data)
  {
    v5 = Data;
    Length = CFDataGetLength(Data);
    v7 = malloc_type_calloc(1uLL, Length + 200, 0xA27E1B14uLL);
    if (v7)
    {
      __strlcpy_chk();
      *(_DWORD *)v7 = 1;
      *((_DWORD *)v7 + 1) = Length;
      v9.location = 0;
      v9.length = Length;
      CFDataGetBytes(v5, v9, (UInt8 *)v7 + 200);
    }
    CFRelease(v3);
  }
  else
  {
    v7 = 0;
    v5 = v3;
  }
  CFRelease(v5);
  return v7;
}

uint64_t tcc_service_get_CF_name(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

void ___tcc_events_initialize_block_invoke(uint64_t a1)
{
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) = os_log_create("com.apple.TCC", "events");
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 16) = 0;
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24) = xpc_dictionary_create(0, 0, 0);
  xpc_set_event_stream_handler("com.apple.tccd.events", 0, &__block_literal_global_6);
}

void __tccd_send_message_block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  NSObject *v5;
  void (*v6)(void);
  NSObject *v7;
  void *v8;
  void **v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _xpc_connection_s *v19;
  _xpc_connection_s *v20;
  int v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  if (a2 == (void *)MEMORY[0x1E0C81258])
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v7 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(void **)(a1 + 40);
      v21 = 134217984;
      v22 = v8;
      _os_log_impl(&dword_1A364C000, v7, OS_LOG_TYPE_DEFAULT, "send_message_with_reply(): connection interrupted for message: %p.", (uint8_t *)&v21, 0xCu);
    }
    tccd_send_message(*(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 60), (*(_DWORD *)(a1 + 64) + 1));
  }
  else
  {
    if (a2 != (void *)MEMORY[0x1E0C81260])
    {
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
      {
        v4 = (void *)tccd_reply_description_redacted(a2);
        if (tcc_log_handle_onceToken != -1)
          dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
        v5 = tcc_client_log;
        if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_INFO))
        {
          v21 = 136446210;
          v22 = v4;
          _os_log_impl(&dword_1A364C000, v5, OS_LOG_TYPE_INFO, "RECV: asynchronous reply %{public}s", (uint8_t *)&v21, 0xCu);
        }
        free(v4);
      }
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
      goto LABEL_29;
    }
    v9 = (void **)(a1 + 40);
    if (xpc_dictionary_get_BOOL(*(xpc_object_t *)(a1 + 40), "user_tccd_unavailable"))
    {
      if (tcc_log_handle_onceToken != -1)
        dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
      v10 = tcc_client_log;
      if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
        __tccd_send_message_block_invoke_cold_1(a1 + 40, v10, v11, v12, v13, v14, v15, v16);
LABEL_28:
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
LABEL_29:
      v6();
      goto LABEL_30;
    }
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    v17 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *v9;
      v21 = 134217984;
      v22 = v18;
      _os_log_impl(&dword_1A364C000, v17, OS_LOG_TYPE_DEFAULT, "send_message_with_reply(): user tccd unavailable, sending %p to system tccd", (uint8_t *)&v21, 0xCu);
    }
    v19 = tccd();
    if (!v19)
      goto LABEL_28;
    v20 = v19;
    xpc_dictionary_set_BOOL(*(xpc_object_t *)(a1 + 40), "user_tccd_unavailable", 1);
    tccd_send_message(v20, *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 60), (*(_DWORD *)(a1 + 64) + 1));
    xpc_release(v20);
  }
LABEL_30:
  xpc_release(*(xpc_object_t *)(a1 + 48));
  xpc_release(*(xpc_object_t *)(a1 + 40));
}

uint64_t tcc_message_options_get_request_usage_string_policy(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t tcc_message_options_set_request_record_upgrade_policy(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t tcc_message_options_get_request_record_upgrade_policy(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t tcc_message_options_get_request_prompt_rights_mask(uint64_t a1)
{
  return *(_QWORD *)(a1 + 88);
}

uint64_t tcc_message_options_set_cache_policy(uint64_t result, char a2)
{
  *(_BYTE *)(result + 96) = a2;
  return result;
}

CFTypeRef tcc_message_options_set_client_dict(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = CFRetain(cf);
  *(_QWORD *)(a1 + 104) = cf;
  return result;
}

uint64_t tcc_message_options_get_client_dict(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t tcc_message_options_get_nokill_policy(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 112))
    return *(_QWORD *)(a1 + 112);
  else
    return *MEMORY[0x1E0C9AE40];
}

uint64_t tcc_message_options_set_nokill_policy(uint64_t result, int a2)
{
  _QWORD *v2;

  v2 = (_QWORD *)MEMORY[0x1E0C9AE50];
  if (!a2)
    v2 = (_QWORD *)MEMORY[0x1E0C9AE40];
  *(_QWORD *)(result + 112) = *v2;
  return result;
}

__n128 tcc_attributed_entity_alloc(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  __n128 result;
  __int128 v5;

  objc_opt_class();
  v3 = _os_object_alloc();
  if (v3)
  {
    result = *(__n128 *)a2;
    v5 = *(_OWORD *)(a2 + 16);
    *(_OWORD *)(v3 + 16) = *(_OWORD *)a2;
    *(_OWORD *)(v3 + 32) = v5;
    *(_QWORD *)(v3 + 48) = *(_QWORD *)(a2 + 32);
  }
  return result;
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2(uint64_t a1, int a2)
{
  CFNumberRef v3;
  const void *Value;
  uint64_t v5;
  NSObject *v6;
  int valuePtr;

  valuePtr = a2;
  v3 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 32) + 72), v3);
  CFRelease(v3);
  v5 = *(_QWORD *)(a1 + 32);
  if (Value)
  {
    tcc_authorization_cache_handle_authorization_changed_for_service_clear(*(_QWORD *)(v5 + 80), *(const void **)(a1 + 40));
  }
  else
  {
    v6 = *(NSObject **)(v5 + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
      __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2_cold_1(&valuePtr, v6);
  }
}

void tcc_authorization_change_monitor_dispose(uint64_t a1)
{
  NSObject *v2;
  const __CFDictionary *v3;
  CFIndex Count;
  const void **v5;
  const __CFNumber **v6;
  const __CFNumber *v7;
  int valuePtr;

  v2 = *(NSObject **)(a1 + 64);
  if (v2)
    dispatch_release(v2);
  v3 = *(const __CFDictionary **)(a1 + 72);
  if (v3)
  {
    Count = CFDictionaryGetCount(v3);
    v5 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), v5, 0);
    if (Count >= 1)
    {
      v6 = (const __CFNumber **)v5;
      do
      {
        valuePtr = 0;
        v7 = *v6++;
        CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
        notify_cancel(valuePtr);
        --Count;
      }
      while (Count);
    }
    free(v5);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
  }
}

uint64_t tcc_object_release_cf_callback(uint64_t a1, uint64_t a2)
{
  return tcc_release(a2);
}

CFErrorRef _tcc_util_create_CFError_with_user_info(CFIndex a1, CFStringRef format, ...)
{
  CFStringRef v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __CFDictionary *Mutable;
  CFErrorRef v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  va_list va;

  va_start(va, format);
  v4 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE30], 0, format, va);
  if (!v4)
  {
    v5 = tcc_log_handle();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      _tcc_util_create_CFError_with_user_info_cold_2((uint64_t)format, v5, v6, v7, v8, v9, v10, v11);
    v4 = CFSTR("<Failed User Info creation>");
  }
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0C9AFB0], v4);
  v13 = CFErrorCreate(0, CFSTR("kTCCErrorDomain"), a1, Mutable);
  CFRelease(Mutable);
  CFRelease(v4);
  v14 = tcc_log_handle();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    _tcc_util_create_CFError_with_user_info_cold_1((uint64_t)v13, v14, v15, v16, v17, v18, v19, v20);
  return v13;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

uint64_t tcc_authorization_record_get_service(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t tcc_authorization_record_set_subject_identity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = tcc_retain(a2);
  *(_QWORD *)(a1 + 64) = result;
  return result;
}

uint64_t tcc_authorization_record_get_subject_identity(uint64_t a1)
{
  return *(_QWORD *)(a1 + 64);
}

uint64_t tcc_authorization_record_set_indirect_object_identity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = tcc_retain(a2);
  *(_QWORD *)(a1 + 72) = result;
  return result;
}

uint64_t tcc_authorization_record_get_indirect_object_identity(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t tcc_authorization_record_set_authorization_right(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 80) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_authorization_value(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

uint64_t tcc_authorization_record_set_subject_attributed_entity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = tcc_retain(a2);
  *(_QWORD *)(a1 + 104) = result;
  return result;
}

uint64_t tcc_authorization_record_get_subject_attributed_entity(uint64_t a1)
{
  return *(_QWORD *)(a1 + 104);
}

uint64_t tcc_authorization_record_set_indirect_object_attributed_entity(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = tcc_retain(a2);
  *(_QWORD *)(a1 + 112) = result;
  return result;
}

uint64_t tcc_authorization_record_get_indirect_object_attributed_entity(uint64_t a1)
{
  return *(_QWORD *)(a1 + 112);
}

CFTypeRef tcc_authorization_record_set_last_modified_date(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = CFRetain(cf);
  *(_QWORD *)(a1 + 120) = result;
  return result;
}

uint64_t tcc_authorization_record_get_last_modified_date(uint64_t a1)
{
  return *(_QWORD *)(a1 + 120);
}

CFTypeRef tcc_authorization_record_set_expired_at_date(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef result;

  result = CFRetain(cf);
  *(_QWORD *)(a1 + 128) = result;
  return result;
}

uint64_t tcc_authorization_record_get_expired_at_date(uint64_t a1)
{
  return *(_QWORD *)(a1 + 128);
}

uint64_t tcc_authorization_record_get_version(uint64_t a1)
{
  return *(_QWORD *)(a1 + 96);
}

uint64_t tcc_authorization_record_get_allow_standard_user_to_set_system_service(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 136);
}

uint64_t tcc_authorization_record_set_session_pid(uint64_t result, int a2)
{
  *(_DWORD *)(result + 140) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_session_pid(uint64_t a1)
{
  return *(unsigned int *)(a1 + 140);
}

uint64_t tcc_authorization_record_set_session_pid_version(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 144) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_session_pid_version(uint64_t a1)
{
  return *(_QWORD *)(a1 + 144);
}

char *tcc_authorization_record_set_bootUUID(uint64_t a1, char *__s)
{
  size_t v4;
  char *result;

  v4 = strlen(__s);
  result = strndup(__s, v4);
  *(_QWORD *)(a1 + 152) = result;
  return result;
}

uint64_t tcc_authorization_record_get_bootUUID(uint64_t a1)
{
  return *(_QWORD *)(a1 + 152);
}

uint64_t tcc_authorization_record_set_has_prompted_for_allow(uint64_t result, char a2)
{
  *(_BYTE *)(result + 160) = a2;
  return result;
}

uint64_t tcc_authorization_record_get_has_prompted_for_allow(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 160);
}

uint64_t tcc_authorization_record_hash(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  const void *v12;

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    v3 = tcc_object_hash(v2);
  else
    v3 = 0;
  v4 = *(_QWORD *)(a1 + 64);
  if (v4)
    v3 = tcc_object_hash(v4) - v3 + 32 * v3;
  v5 = *(_QWORD *)(a1 + 72);
  if (v5)
    v3 = tcc_object_hash(v5) - v3 + 32 * v3;
  v6 = *(_QWORD *)(a1 + 80) - v3 + 32 * v3;
  v7 = *(_QWORD *)(a1 + 88) - v6 + 32 * v6;
  v8 = *(_QWORD *)(a1 + 104);
  v9 = *(_QWORD *)(a1 + 96) - v7 + 32 * v7;
  if (v8)
    v9 = tcc_object_hash(v8) - v9 + 32 * v9;
  v10 = *(_QWORD *)(a1 + 112);
  if (v10)
    v9 = tcc_object_hash(v10) - v9 + 32 * v9;
  v11 = *(const void **)(a1 + 120);
  if (v11)
    v9 = CFHash(v11) - v9 + 32 * v9;
  v12 = *(const void **)(a1 + 128);
  if (v12)
    v9 = CFHash(v12) - v9 + 32 * v9;
  if (*(_BYTE *)(a1 + 136))
    return 31 * v9;
  else
    return 31 * v9 + 1;
}

uint64_t tcc_authorization_record_equal(uint64_t a1, uint64_t a2)
{
  uint64_t result;
  const void *v5;
  const void *v6;
  const void *v7;
  const void *v8;
  const char *v9;
  const char *v10;
  size_t v11;

  result = tcc_object_equal(*(_QWORD *)(a1 + 56), *(_QWORD *)(a2 + 56));
  if ((_DWORD)result)
  {
    result = tcc_object_equal(*(_QWORD *)(a1 + 64), *(_QWORD *)(a2 + 64));
    if ((_DWORD)result)
    {
      result = tcc_object_equal(*(_QWORD *)(a1 + 72), *(_QWORD *)(a2 + 72));
      if ((_DWORD)result)
      {
        if (*(_QWORD *)(a1 + 80) != *(_QWORD *)(a2 + 80)
          || *(_QWORD *)(a1 + 88) != *(_QWORD *)(a2 + 88)
          || *(_QWORD *)(a1 + 96) != *(_QWORD *)(a2 + 96))
        {
          return 0;
        }
        result = tcc_object_equal(*(_QWORD *)(a1 + 104), *(_QWORD *)(a2 + 104));
        if ((_DWORD)result)
        {
          result = tcc_object_equal(*(_QWORD *)(a1 + 112), *(_QWORD *)(a2 + 112));
          if ((_DWORD)result)
          {
            v5 = *(const void **)(a1 + 120);
            if (!v5 || (v6 = *(const void **)(a2 + 120)) == 0 || (result = CFEqual(v5, v6), (_DWORD)result))
            {
              v7 = *(const void **)(a1 + 128);
              if (!v7 || (v8 = *(const void **)(a2 + 128)) == 0 || (result = CFEqual(v7, v8), (_DWORD)result))
              {
                if (*(unsigned __int8 *)(a1 + 136) != *(unsigned __int8 *)(a2 + 136)
                  || *(_DWORD *)(a1 + 140) != *(_DWORD *)(a2 + 140)
                  || *(_QWORD *)(a1 + 144) != *(_QWORD *)(a2 + 144))
                {
                  return 0;
                }
                v9 = *(const char **)(a1 + 152);
                v10 = *(const char **)(a2 + 152);
                if (v9 == v10)
                  return 1;
                result = 0;
                if (v9 && v10)
                {
                  v11 = strlen(v9);
                  return !strncmp(v9, v10, v11);
                }
              }
            }
          }
        }
      }
    }
  }
  return result;
}

void __TCC_CRASHING_DUE_TO_PRIVACY_VIOLATION__(uint64_t a1, const char *a2)
{
  NSObject *v4;
  int v5;
  uint64_t v6;

  if (tcc_log_handle_onceToken != -1)
    goto LABEL_7;
  while (1)
  {
    v4 = tcc_client_log;
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
    {
      v5 = 136446210;
      v6 = a1;
      _os_log_error_impl(&dword_1A364C000, v4, OS_LOG_TYPE_ERROR, "%{public}s", (uint8_t *)&v5, 0xCu);
    }
    if (a2)
      strlen(a2);
    abort_with_payload();
LABEL_7:
    dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
  }
}

uint64_t TCCAccessCopyInformation(const __CFString *a1)
{
  _BYTE *v1;
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t values;
  _QWORD v18[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  values = 0;
  *(_OWORD *)keys = xmmword_1E4A2EB50;
  v18[0] = 0;
  v18[1] = 0;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values = xpc_string_create("TCCAccessCopyInformation")) != 0
    && (v18[0] = xpc_string_create(v1)) != 0
    && (v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0)
  {
    v3 = v2;
    v4 = tccd();
    if (v4)
    {
      v5 = v4;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __TCCAccessCopyInformation_block_invoke;
      v12[3] = &unk_1E4A2E6A8;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessCopyInformation() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
      free(v1);
      xpc_release(v3);
      v6 = v5;
    }
    else
    {
      free(v1);
      v6 = (_xpc_connection_s *)v3;
    }
    xpc_release(v6);
  }
  else
  {
    free(v1);
  }
  v7 = values;
  if (values)
  {
    v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      v9 = *v8++;
      v7 = v9;
    }
    while (v9);
  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

const __CFString *TCCAccessCopyInformationForBundle(__CFBundle *a1)
{
  const __CFString *result;

  result = CFBundleGetIdentifier(a1);
  if (result)
    return (const __CFString *)TCCAccessCopyInformationForBundleId(result);
  return result;
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService(const __CFString *a1)
{
  _BYTE *v1;
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t values;
  _QWORD v18[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  values = 0;
  *(_OWORD *)keys = xmmword_1E4A2EB50;
  v18[0] = 0;
  v18[1] = 0;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values = xpc_string_create("TCCAccessCopyBundleIdentifiersDisabledForService")) != 0
    && (v18[0] = xpc_string_create(v1)) != 0
    && (v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0)
  {
    v3 = v2;
    v4 = tccd();
    if (v4)
    {
      v5 = v4;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __TCCAccessCopyBundleIdentifiersDisabledForService_block_invoke;
      v12[3] = &unk_1E4A2E800;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessCopyBundleIdentifiersDisabledForService() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
      free(v1);
      xpc_release(v3);
      v6 = v5;
    }
    else
    {
      free(v1);
      v6 = (_xpc_connection_s *)v3;
    }
    xpc_release(v6);
  }
  else
  {
    free(v1);
  }
  v7 = values;
  if (values)
  {
    v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      v9 = *v8++;
      v7 = v9;
    }
    while (v9);
  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t TCCAccessSetInternal(const __CFString *a1, const char *a2, const char *a3, const void *a4, int a5, const __CFData *a6, int a7, CFDictionaryRef theDict)
{
  const void *Value;
  int64_t v16;
  CFTypeID v17;
  const __CFBoolean *v18;
  const __CFBoolean *v19;
  CFTypeID v20;
  char *v21;
  xpc_object_t v22;
  xpc_object_t v23;
  xpc_object_t v24;
  const UInt8 *BytePtr;
  size_t Length;
  xpc_object_t v27;
  xpc_object_t v28;
  void *v29;
  _xpc_connection_s *v30;
  _xpc_connection_s *v31;
  const __CFNumber *v32;
  const __CFNumber *v33;
  CFTypeID v34;
  NSObject *v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  _xpc_connection_s *v43;
  xpc_object_t v44;
  xpc_object_t *v45;
  void *v46;
  uint64_t v47;
  _QWORD v49[5];
  uint64_t valuePtr;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  xpc_object_t values[2];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;
  char *keys[2];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v51 = 0;
  v52 = &v51;
  v53 = 0x2000000000;
  v54 = 0;
  v67 = xmmword_1E4A2E860;
  v68 = *(_OWORD *)&off_1E4A2E870;
  v69 = xmmword_1E4A2E880;
  *(_OWORD *)keys = xmmword_1E4A2E820;
  v64 = *(_OWORD *)&off_1E4A2E830;
  v65 = xmmword_1E4A2E840;
  v66 = *(_OWORD *)&off_1E4A2E850;
  v62 = 0;
  v60 = 0u;
  v61 = 0u;
  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  *(_OWORD *)values = 0u;
  if (!theDict)
  {
    v16 = 0;
LABEL_10:
    LODWORD(v19) = 0;
    goto LABEL_11;
  }
  Value = CFDictionaryGetValue(theDict, kTCCInfoLastModified);
  v16 = (int64_t)Value;
  if (Value)
  {
    v17 = CFGetTypeID(Value);
    if (v17 == CFDateGetTypeID())
      v16 = (uint64_t)(MEMORY[0x1A8590FDC](v16) + *MEMORY[0x1E0C9ADF8]);
    else
      v16 = 0;
  }
  v18 = (const __CFBoolean *)CFDictionaryGetValue(theDict, kTCCSetNoKill);
  v19 = v18;
  if (v18)
  {
    v20 = CFGetTypeID(v18);
    if (v20 == CFBooleanGetTypeID())
    {
      LODWORD(v19) = CFBooleanGetValue(v19);
      goto LABEL_11;
    }
    goto LABEL_10;
  }
LABEL_11:
  v21 = stringCopyUTF8String(a1);
  if (!v21)
    goto LABEL_50;
  values[0] = xpc_string_create("TCCAccessSetInternal");
  if (!values[0])
    goto LABEL_50;
  values[1] = xpc_string_create(v21);
  if (!values[1])
    goto LABEL_50;
  v22 = a2 ? xpc_string_create(a2) : xpc_null_create();
  *(_QWORD *)&v56 = v22;
  if (!v22)
    goto LABEL_50;
  v23 = a3 ? xpc_string_create(a3) : xpc_null_create();
  *((_QWORD *)&v56 + 1) = v23;
  if (!v23)
    goto LABEL_50;
  v24 = a4 ? xpc_data_create(a4, 0x20uLL) : xpc_null_create();
  *(_QWORD *)&v57 = v24;
  if (!v24)
    goto LABEL_50;
  *((_QWORD *)&v57 + 1) = xpc_BOOL_create(a5 != 0);
  if (!*((_QWORD *)&v57 + 1))
    goto LABEL_50;
  if (a6)
  {
    BytePtr = CFDataGetBytePtr(a6);
    Length = CFDataGetLength(a6);
    v27 = xpc_data_create(BytePtr, Length);
  }
  else
  {
    v27 = xpc_null_create();
  }
  *(_QWORD *)&v58 = v27;
  if (!v27)
    goto LABEL_50;
  *((_QWORD *)&v58 + 1) = xpc_null_create();
  if (!*((_QWORD *)&v58 + 1))
    goto LABEL_50;
  *(_QWORD *)&v59 = xpc_null_create();
  if ((_QWORD)v59
    && (*((_QWORD *)&v59 + 1) = xpc_null_create()) != 0
    && (*(_QWORD *)&v60 = xpc_uint64_create(0), (_QWORD)v60)
    && (*((_QWORD *)&v60 + 1) = xpc_int64_create(v16)) != 0
    && (*(_QWORD *)&v61 = xpc_BOOL_create((_DWORD)v19 != 0), (_QWORD)v61)
    && (*((_QWORD *)&v61 + 1) = xpc_null_create()) != 0
    && (v28 = xpc_dictionary_create((const char *const *)keys, values, 0xEuLL)) != 0)
  {
    v29 = v28;
    v30 = tccd();
    if (v30)
    {
      v31 = v30;
      if (theDict)
      {
        v32 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("auth_value"));
        if (v32)
        {
          v33 = v32;
          v34 = CFGetTypeID(v32);
          if (v34 == CFNumberGetTypeID())
          {
            valuePtr = 0;
            if (CFNumberGetValue(v33, kCFNumberLongLongType, &valuePtr) != 1)
            {
              if (tcc_log_handle_onceToken != -1)
                dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
              v35 = tcc_client_log;
              if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
                TCCAccessSetInternal_cold_1(v35, v36, v37, v38, v39, v40, v41, v42);
            }
            xpc_dictionary_set_uint64(v29, "auth_value", valuePtr);
            xpc_dictionary_set_uint64(v29, "TCCD_MSG_SPI_VERSION", 2uLL);
          }
        }
      }
      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 0x40000000;
      v49[2] = __TCCAccessSetInternal_block_invoke;
      v49[3] = &unk_1E4A2E898;
      v49[4] = &v51;
      tccd_set_message_number(v29);
      tccd_send_message(v31, 0, v29, (uint64_t)v49, 7, 0);
      free(v21);
      xpc_release(v29);
      v43 = v31;
    }
    else
    {
      free(v21);
      v43 = (_xpc_connection_s *)v29;
    }
    xpc_release(v43);
  }
  else
  {
LABEL_50:
    free(v21);
  }
  v44 = values[0];
  if (values[0])
  {
    v45 = &values[1];
    do
    {
      xpc_release(v44);
      v46 = *v45++;
      v44 = v46;
    }
    while (v46);
  }
  v47 = *((unsigned __int8 *)v52 + 24);
  _Block_object_dispose(&v51, 8);
  return v47;
}

uint64_t TCCAccessSetForBundle(uint64_t a1, CFBundleRef bundle, char a3)
{
  CFStringRef Identifier;
  const __CFString *v7;
  CFURLRef v8;
  CFURLRef v9;
  CFDictionaryRef v10;
  uint64_t v11;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  Identifier = CFBundleGetIdentifier(bundle);
  if (!Identifier)
    return 0;
  v7 = Identifier;
  v8 = CFBundleCopyBundleURL(bundle);
  if (!v8)
    return 0;
  v9 = v8;
  values = v8;
  keys[0] = CFSTR("bundle_url");
  v10 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], 0);
  v11 = TCCAccessSetForBundleIdWithOptions(a1, v7, a3, (uint64_t)v10);
  CFRelease(v9);
  if (v10)
    CFRelease(v10);
  return v11;
}

uint64_t TCCAccessSetForBundleIdWithOptions(uint64_t a1, const __CFString *a2, char a3, uint64_t a4)
{
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  _QWORD activity_block[8];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v7 = stringCopyUTF8String(a2);
  v8 = v7;
  if (v7)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 0x40000000;
    activity_block[2] = __TCCAccessSetForBundleIdWithOptions_block_invoke;
    activity_block[3] = &unk_1E4A2E8C0;
    activity_block[4] = &v13;
    activity_block[5] = a1;
    v12 = a3;
    activity_block[6] = v7;
    activity_block[7] = a4;
    _os_activity_initiate(&dword_1A364C000, "TCCAccessSetForBundleIdWithOptions() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
  }
  free(v8);
  v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t TCCAccessSetForBundleId(uint64_t a1, const __CFString *a2, char a3)
{
  return TCCAccessSetForBundleIdWithOptions(a1, a2, a3, 0);
}

uint64_t TCCAccessSetForPath(uint64_t a1, const __CFString *a2, char a3)
{
  return TCCAccessSetForPathWithOptions(a1, a2, a3, 0);
}

uint64_t TCCAccessSetForPathWithOptions(uint64_t a1, const __CFString *a2, char a3, uint64_t a4)
{
  _BYTE *v7;
  void *v8;
  uint64_t v9;
  _QWORD activity_block[8];
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  v7 = stringCopyUTF8String(a2);
  v8 = v7;
  if (v7)
  {
    activity_block[0] = MEMORY[0x1E0C809B0];
    activity_block[1] = 0x40000000;
    activity_block[2] = __TCCAccessSetForPathWithOptions_block_invoke;
    activity_block[3] = &unk_1E4A2E8E8;
    activity_block[4] = &v13;
    activity_block[5] = a1;
    v12 = a3;
    activity_block[6] = v7;
    activity_block[7] = a4;
    _os_activity_initiate(&dword_1A364C000, "TCCAccessSetForPathWithOptions() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
  }
  free(v8);
  v9 = *((unsigned __int8 *)v14 + 24);
  _Block_object_dispose(&v13, 8);
  return v9;
}

uint64_t TCCAccessSetForAuditToken(uint64_t a1, __int128 *a2, char a3)
{
  __int128 v3;
  uint64_t v4;
  _QWORD activity_block[6];
  __int128 v7;
  __int128 v8;
  char v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v10 = 0;
  v11 = &v10;
  v12 = 0x2000000000;
  v13 = 0;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 0x40000000;
  activity_block[2] = __TCCAccessSetForAuditToken_block_invoke;
  activity_block[3] = &unk_1E4A2E910;
  activity_block[4] = &v10;
  activity_block[5] = a1;
  v3 = a2[1];
  v7 = *a2;
  v8 = v3;
  v9 = a3;
  _os_activity_initiate(&dword_1A364C000, "TCCAccessSetForAuditToken() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
  v4 = *((unsigned __int8 *)v11 + 24);
  _Block_object_dispose(&v10, 8);
  return v4;
}

uint64_t TCCAccessSetForAuditTokenWithOptions(uint64_t a1, __int128 *a2, char a3, uint64_t a4)
{
  __int128 v4;
  uint64_t v5;
  _QWORD v7[7];
  __int128 v8;
  __int128 v9;
  char v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v13 = 0x2000000000;
  v7[1] = 0x40000000;
  v4 = a2[1];
  v8 = *a2;
  v11 = 0;
  v12 = &v11;
  v14 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[2] = __TCCAccessSetForAuditTokenWithOptions_block_invoke;
  v7[3] = &unk_1E4A2E938;
  v7[4] = &v11;
  v7[5] = a1;
  v9 = v4;
  v10 = a3;
  v7[6] = a4;
  _os_activity_initiate(&dword_1A364C000, "TCCAccessSetForAuditToken() IPC", OS_ACTIVITY_FLAG_DETACHED, v7);
  v5 = *((unsigned __int8 *)v12 + 24);
  _Block_object_dispose(&v11, 8);
  return v5;
}

uint64_t TCCAccessSetOverride(const __CFString *a1, int a2)
{
  _BYTE *v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  xpc_object_t *v10;
  void *v11;
  uint64_t v12;
  _QWORD activity_block[7];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  xpc_object_t values[2];
  __int128 v20;
  char *keys[2];
  const char *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  *(_OWORD *)keys = xmmword_1E4A2E958;
  v22 = "override";
  *(_OWORD *)values = 0u;
  v20 = 0u;
  v3 = stringCopyUTF8String(a1);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessSetOverride")) != 0
    && (values[1] = xpc_string_create(v3)) != 0
    && (*(_QWORD *)&v20 = xpc_BOOL_create(a2 != 0), (_QWORD)v20)
    && (v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0)
  {
    v5 = v4;
    v6 = tccd();
    if (v6)
    {
      v7 = v6;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessSetOverride_block_invoke;
      activity_block[3] = &unk_1E4A2E9A0;
      activity_block[5] = v6;
      activity_block[6] = v5;
      activity_block[4] = &v15;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessSetOverride() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      v8 = v7;
    }
    else
    {
      free(v3);
      v8 = (_xpc_connection_s *)v5;
    }
    xpc_release(v8);
  }
  else
  {
    free(v3);
  }
  v9 = values[0];
  if (values[0])
  {
    v10 = &values[1];
    do
    {
      xpc_release(v9);
      v11 = *v10++;
      v9 = v11;
    }
    while (v11);
  }
  v12 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

uint64_t TCCAccessGetOverride(const __CFString *a1, uint64_t a2)
{
  _BYTE *v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  void **v10;
  void *v11;
  uint64_t v12;
  _QWORD activity_block[8];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  xpc_object_t values;
  _QWORD v20[2];
  char *keys[2];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 0;
  *(_OWORD *)keys = xmmword_1E4A2EB50;
  values = 0;
  v20[0] = 0;
  v20[1] = 0;
  v3 = stringCopyUTF8String(a1);
  if (v3
    && (values = xpc_string_create("TCCAccessGetOverride")) != 0
    && (v20[0] = xpc_string_create(v3)) != 0
    && (v4 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0)
  {
    v5 = v4;
    v6 = tccd();
    if (v6)
    {
      v7 = v6;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessGetOverride_block_invoke;
      activity_block[3] = &unk_1E4A2E9F0;
      activity_block[4] = &v15;
      activity_block[5] = v6;
      activity_block[6] = v5;
      activity_block[7] = a2;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessGetOverride() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      v8 = v7;
    }
    else
    {
      free(v3);
      v8 = (_xpc_connection_s *)v5;
    }
    xpc_release(v8);
  }
  else
  {
    free(v3);
  }
  v9 = values;
  if (values)
  {
    v10 = (void **)v20;
    do
    {
      xpc_release(v9);
      v11 = *v10++;
      v9 = v11;
    }
    while (v11);
  }
  v12 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v12;
}

CFMutableSetRef TCCAccessCopyOverrides()
{
  xpc_object_t v0;
  void *v1;
  _xpc_connection_s *v2;
  _xpc_connection_s *v3;
  xpc_object_t v4;
  void **v5;
  void *v6;
  const __CFArray *v7;
  CFIndex Count;
  CFMutableSetRef Mutable;
  _QWORD activity_block[7];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  xpc_object_t values;
  uint64_t v17;
  char *keys[2];
  CFRange v19;

  keys[1] = *(char **)MEMORY[0x1E0C80C00];
  v12 = 0;
  v13 = &v12;
  v14 = 0x2000000000;
  v15 = 0;
  v17 = 0;
  keys[0] = "function";
  values = xpc_string_create("TCCAccessGetOverrides");
  if (values)
  {
    v0 = xpc_dictionary_create((const char *const *)keys, &values, 1uLL);
    if (v0)
    {
      v1 = v0;
      v2 = tccd();
      if (v2)
      {
        v3 = v2;
        activity_block[0] = MEMORY[0x1E0C809B0];
        activity_block[1] = 0x40000000;
        activity_block[2] = __TCCGetOverridesInternal_block_invoke;
        activity_block[3] = &unk_1E4A2EDC8;
        activity_block[5] = v2;
        activity_block[6] = v1;
        activity_block[4] = &v12;
        _os_activity_initiate(&dword_1A364C000, "TCCAccessGetOverrides() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
        xpc_release(v3);
      }
      xpc_release(v1);
    }
    v4 = values;
    if (values)
    {
      v5 = (void **)&v17;
      do
      {
        xpc_release(v4);
        v6 = *v5++;
        v4 = v6;
      }
      while (v6);
    }
  }
  v7 = (const __CFArray *)v13[3];
  _Block_object_dispose(&v12, 8);
  if (!v7)
    return 0;
  Count = CFArrayGetCount(v7);
  Mutable = CFSetCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], Count, MEMORY[0x1E0C9B3B0]);
  v19.length = CFArrayGetCount(v7);
  v19.location = 0;
  CFArrayApplyFunction(v7, v19, (CFArrayApplierFunction)_append_override, Mutable);
  CFRelease(v7);
  return Mutable;
}

void _append_override(const void *a1, __CFSet *a2)
{
  CFTypeID v4;

  v4 = CFGetTypeID(a1);
  if (v4 == CFStringGetTypeID())
  {
    CFSetSetValue(a2, a1);
  }
  else
  {
    if (tcc_log_handle_onceToken != -1)
      dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
    if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
      _append_override_cold_1();
  }
}

uint64_t TCCAccessReset(const __CFString *cf1)
{
  return TCCResetInternal("TCCAccessResetInternal", cf1, 0, 0, 0);
}

uint64_t TCCAccessResetForBundle(const __CFString *a1, CFBundleRef bundle)
{
  const __CFString *Identifier;
  char *v4;
  uint64_t v5;

  Identifier = CFBundleGetIdentifier(bundle);
  if (Identifier)
  {
    v4 = stringCopyUTF8String(Identifier);
    if (v4)
      v5 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v4, 0);
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
    v4 = 0;
  }
  free(v4);
  return v5;
}

uint64_t TCCAccessResetForBundleId(const __CFString *a1, const __CFString *a2)
{
  char *v3;
  uint64_t v4;

  v3 = stringCopyUTF8String(a2);
  if (v3)
    v4 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v3, 0);
  else
    v4 = 0;
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForBundleIdWithAuditToken(const __CFString *a1, const __CFString *a2)
{
  char *v3;
  uint64_t v4;

  v3 = stringCopyUTF8String(a2);
  if (v3)
    v4 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v3, 0);
  else
    v4 = 0;
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForPath(const __CFString *a1, const __CFString *a2)
{
  char *v3;
  uint64_t v4;

  v3 = stringCopyUTF8String(a2);
  if (v3)
    v4 = TCCResetInternal("TCCAccessResetInternal", a1, "path", v3, 0);
  else
    v4 = 0;
  free(v3);
  return v4;
}

uint64_t TCCAccessResetForBundleIdWithOptions(const __CFString *a1, const __CFString *a2, const __CFDictionary *a3)
{
  char *v5;
  uint64_t v6;

  v5 = stringCopyUTF8String(a2);
  if (v5)
    v6 = TCCResetInternal("TCCAccessResetInternal", a1, "bundle", v5, a3);
  else
    v6 = 0;
  free(v5);
  return v6;
}

uint64_t TCCAccessDeclarePolicy(const __CFUUID *a1, const __CFString *a2)
{
  _BYTE *v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  xpc_object_t *v10;
  void *v11;
  uint64_t v12;
  _QWORD activity_block[7];
  CFUUIDBytes uuid;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  xpc_object_t values[2];
  __int128 v21;
  char *keys[2];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  uuid = CFUUIDGetUUIDBytes(a1);
  v23 = "display";
  v21 = 0u;
  *(_OWORD *)keys = xmmword_1E4A2EA10;
  *(_OWORD *)values = 0u;
  v3 = stringCopyUTF8String(a2);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessDeclarePolicy")) != 0
    && (values[1] = xpc_uuid_create(&uuid.byte0)) != 0
    && (*(_QWORD *)&v21 = xpc_string_create(v3), (_QWORD)v21)
    && (v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0)
  {
    v5 = v4;
    v6 = tccd();
    if (v6)
    {
      v7 = v6;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessDeclarePolicy_block_invoke;
      activity_block[3] = &unk_1E4A2EA58;
      activity_block[5] = v6;
      activity_block[6] = v5;
      activity_block[4] = &v16;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessDeclarePolicy() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      v8 = v7;
    }
    else
    {
      free(v3);
      v8 = (_xpc_connection_s *)v5;
    }
    xpc_release(v8);
  }
  else
  {
    free(v3);
  }
  v9 = values[0];
  if (values[0])
  {
    v10 = &values[1];
    do
    {
      xpc_release(v9);
      v11 = *v10++;
      v9 = v11;
    }
    while (v11);
  }
  v12 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

uint64_t TCCAccessSelectPolicyForExtensionWithIdentifier(const __CFUUID *a1, const __CFString *a2)
{
  _BYTE *v3;
  xpc_object_t v4;
  void *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  xpc_object_t v9;
  xpc_object_t *v10;
  void *v11;
  uint64_t v12;
  _QWORD activity_block[7];
  CFUUIDBytes uuid;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  char v19;
  xpc_object_t values[2];
  __int128 v21;
  char *keys[2];
  const char *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v17 = &v16;
  v18 = 0x2000000000;
  v19 = 0;
  uuid = CFUUIDGetUUIDBytes(a1);
  v23 = "bundle_id";
  v21 = 0u;
  *(_OWORD *)keys = xmmword_1E4A2EA78;
  *(_OWORD *)values = 0u;
  v3 = stringCopyUTF8String(a2);
  if (v3
    && (values[0] = xpc_string_create("TCCAccessSelectPolicyForExtensionWithIdentifier")) != 0
    && (values[1] = xpc_uuid_create(&uuid.byte0)) != 0
    && (*(_QWORD *)&v21 = xpc_string_create(v3), (_QWORD)v21)
    && (v4 = xpc_dictionary_create((const char *const *)keys, values, 3uLL)) != 0)
  {
    v5 = v4;
    v6 = tccd();
    if (v6)
    {
      v7 = v6;
      activity_block[0] = MEMORY[0x1E0C809B0];
      activity_block[1] = 0x40000000;
      activity_block[2] = __TCCAccessSelectPolicyForExtensionWithIdentifier_block_invoke;
      activity_block[3] = &unk_1E4A2EAC0;
      activity_block[5] = v6;
      activity_block[6] = v5;
      activity_block[4] = &v16;
      _os_activity_initiate(&dword_1A364C000, "TCCAccessSelectPolicyForExtensionWithIdentifier() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
      free(v3);
      xpc_release(v5);
      v8 = v7;
    }
    else
    {
      free(v3);
      v8 = (_xpc_connection_s *)v5;
    }
    xpc_release(v8);
  }
  else
  {
    free(v3);
  }
  v9 = values[0];
  if (values[0])
  {
    v10 = &values[1];
    do
    {
      xpc_release(v9);
      v11 = *v10++;
      v9 = v11;
    }
    while (v11);
  }
  v12 = *((unsigned __int8 *)v17 + 24);
  _Block_object_dispose(&v16, 8);
  return v12;
}

_xpc_connection_s *TCCAccessResetPoliciesExcept(const __CFArray *a1)
{
  _xpc_connection_s *result;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  void **v8;
  _xpc_connection_s *v9;
  _QWORD activity_block[6];
  xpc_object_t values;
  _QWORD v12[2];
  char *keys[2];
  uint64_t v14;
  CFRange v15;

  v14 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)keys = xmmword_1E4A2EAE0;
  values = 0;
  v12[0] = 0;
  v12[1] = 0;
  result = (_xpc_connection_s *)xpc_array_create(0, 0);
  if (result)
  {
    v3 = result;
    v15.length = CFArrayGetCount(a1);
    v15.location = 0;
    CFArrayApplyFunction(a1, v15, (CFArrayApplierFunction)_append_policy, v3);
    values = xpc_string_create("TCCAccessResetPoliciesExcept");
    if (values)
    {
      v12[0] = xpc_retain(v3);
      if (v12[0])
      {
        v4 = (_xpc_connection_s *)xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
        if (v4)
        {
          v5 = v4;
          v6 = tccd();
          if (v6)
          {
            v7 = v6;
            activity_block[0] = MEMORY[0x1E0C809B0];
            activity_block[1] = 0x40000000;
            activity_block[2] = __TCCAccessResetPoliciesExcept_block_invoke;
            activity_block[3] = &__block_descriptor_tmp_291;
            activity_block[4] = v6;
            activity_block[5] = v5;
            _os_activity_initiate(&dword_1A364C000, "TCCAccessResetPoliciesExcept() IPC", OS_ACTIVITY_FLAG_DETACHED, activity_block);
            xpc_release(v3);
            v3 = v5;
            v5 = v7;
          }
          xpc_release(v3);
          v3 = v5;
        }
      }
    }
    xpc_release(v3);
    result = (_xpc_connection_s *)values;
  }
  if (result)
  {
    v8 = (void **)v12;
    do
    {
      xpc_release(result);
      v9 = (_xpc_connection_s *)*v8++;
      result = v9;
    }
    while (v9);
  }
  return result;
}

uint64_t TCCExpirationCopyInformationForService(const __CFString *a1)
{
  _BYTE *v1;
  xpc_object_t v2;
  void *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t values;
  _QWORD v18[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  values = 0;
  *(_OWORD *)keys = xmmword_1E4A2EB50;
  v18[0] = 0;
  v18[1] = 0;
  v1 = stringCopyUTF8String(a1);
  if (v1
    && (values = xpc_string_create("TCCExpirationCopyInformationForService")) != 0
    && (v18[0] = xpc_string_create(v1)) != 0
    && (v2 = xpc_dictionary_create((const char *const *)keys, &values, 2uLL)) != 0)
  {
    v3 = v2;
    v4 = tccd();
    if (v4)
    {
      v5 = v4;
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 0x40000000;
      v12[2] = __TCCExpirationCopyInformationForService_block_invoke;
      v12[3] = &unk_1E4A2EB90;
      v12[5] = v4;
      v12[6] = v3;
      v12[4] = &v13;
      _os_activity_initiate(&dword_1A364C000, "TCCExpirationCopyInformationForService() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
      free(v1);
      xpc_release(v3);
      v6 = v5;
    }
    else
    {
      free(v1);
      v6 = (_xpc_connection_s *)v3;
    }
    xpc_release(v6);
  }
  else
  {
    free(v1);
  }
  v7 = values;
  if (values)
  {
    v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      v9 = *v8++;
      v7 = v9;
    }
    while (v9);
  }
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

uint64_t TCCExpirationResetService(const __CFString *cf1)
{
  return TCCResetInternal("TCCExpirationReset", cf1, "bundle", "kTCCClientAll", 0);
}

uint64_t TCCExpirationResetServiceForBundleIdentifier(const __CFString *a1, const __CFString *a2)
{
  char *v3;
  uint64_t v4;

  v3 = stringCopyUTF8String(a2);
  if (v3)
    v4 = TCCResetInternal("TCCExpirationReset", a1, "bundle", v3, 0);
  else
    v4 = 0;
  free(v3);
  return v4;
}

uint64_t TCCExpirationResetServiceForPath(const __CFString *a1, const __CFString *a2)
{
  char *v3;
  uint64_t v4;

  v3 = stringCopyUTF8String(a2);
  if (v3)
    v4 = TCCResetInternal("TCCExpirationReset", a1, "path", v3, 0);
  else
    v4 = 0;
  free(v3);
  return v4;
}

uint64_t TCCServiceCopyDescriptions(const __CFString *a1)
{
  char *v1;
  xpc_object_t v2;
  _xpc_connection_s *v3;
  _xpc_connection_s *v4;
  _xpc_connection_s *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  void **v8;
  void *v9;
  uint64_t v10;
  _QWORD v12[7];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t values;
  _QWORD v18[2];
  char *keys[2];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x2000000000;
  v16 = 0;
  values = 0;
  *(_OWORD *)keys = xmmword_1E4A2EBB0;
  v18[0] = 0;
  v18[1] = 0;
  if (a1)
  {
    v1 = stringCopyUTF8String(a1);
    if (!v1)
      goto LABEL_14;
  }
  else
  {
    v1 = 0;
  }
  values = xpc_string_create("TCCServiceCopyDescriptions");
  if (!values)
    goto LABEL_17;
  if (v1)
    v2 = xpc_string_create(v1);
  else
    v2 = xpc_null_create();
  v18[0] = v2;
  if (v2)
  {
    v3 = (_xpc_connection_s *)xpc_dictionary_create((const char *const *)keys, &values, 2uLL);
    if (v3)
    {
      v4 = v3;
      v5 = tccd();
      if (v5)
      {
        v6 = v5;
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 0x40000000;
        v12[2] = __TCCServiceCopyDescriptions_block_invoke;
        v12[3] = &unk_1E4A2EBF0;
        v12[5] = v5;
        v12[6] = v4;
        v12[4] = &v13;
        _os_activity_initiate(&dword_1A364C000, "TCCServiceCopyDescriptions() IPC", OS_ACTIVITY_FLAG_DETACHED, v12);
        xpc_release(v4);
        v4 = v6;
      }
      xpc_release(v4);
    }
  }
LABEL_14:
  v7 = values;
  if (values)
  {
    v8 = (void **)v18;
    do
    {
      xpc_release(v7);
      v9 = *v8++;
      v7 = v9;
    }
    while (v9);
  }
LABEL_17:
  free(v1);
  v10 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v10;
}

CFArrayRef TCCServiceCopyNames(const __CFString *a1)
{
  const __CFArray *v1;
  const __CFArray *v2;
  CFIndex Count;
  CFMutableArrayRef Mutable;
  __CFArray *v5;
  CFIndex v6;
  const __CFDictionary *ValueAtIndex;
  const void *Value;
  CFArrayRef Copy;

  v1 = (const __CFArray *)TCCServiceCopyDescriptions(a1);
  if (!v1)
    return 0;
  v2 = v1;
  Count = CFArrayGetCount(v1);
  Mutable = CFArrayCreateMutable(0, Count, MEMORY[0x1E0C9B378]);
  if (Mutable)
  {
    v5 = Mutable;
    if (CFArrayGetCount(v2) >= 1)
    {
      v6 = 0;
      do
      {
        ValueAtIndex = (const __CFDictionary *)CFArrayGetValueAtIndex(v2, v6);
        Value = CFDictionaryGetValue(ValueAtIndex, CFSTR("name"));
        if (Value)
          CFArrayAppendValue(v5, Value);
        ++v6;
      }
      while (v6 < CFArrayGetCount(v2));
    }
    CFRelease(v2);
    Copy = CFArrayCreateCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v5);
  }
  else
  {
    Copy = 0;
    v5 = v2;
  }
  CFRelease(v5);
  return Copy;
}

uint64_t TCCTestInternalWithReplyHander4(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  xpc_object_t v13;
  char *v14;
  _xpc_connection_s *v15;
  _xpc_connection_s *v16;
  uint64_t v17;
  _QWORD v19[8];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;

  v20 = 0;
  v21 = &v20;
  v22 = 0x2000000000;
  v23 = 0;
  v13 = xpc_dictionary_create(0, 0, 0);
  v14 = stringCopyUTF8String(a2);
  v15 = tccd();
  v16 = v15;
  if (v13 && v14 && v15)
  {
    xpc_dictionary_set_string(v13, "function", "TCCTestInternal");
    xpc_dictionary_set_string(v13, "operation", v14);
    if (a3)
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a3 + 16))(a3, v13, "arg1");
    if (a4)
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a4 + 16))(a4, v13, "arg2");
    if (a5)
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a5 + 16))(a5, v13, "arg3");
    if (a6)
      (*(void (**)(uint64_t, xpc_object_t, const char *))(a6 + 16))(a6, v13, "arg4");
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 0x40000000;
    v19[2] = __TCCTestInternalWithReplyHander4_block_invoke;
    v19[3] = &unk_1E4A2EC40;
    v19[6] = v16;
    v19[7] = v13;
    v19[4] = a7;
    v19[5] = &v20;
    _os_activity_initiate(&dword_1A364C000, "TCCTestInternal() IPC", OS_ACTIVITY_FLAG_DETACHED, v19);
  }
  else if (!v14)
  {
    goto LABEL_15;
  }
  free(v14);
LABEL_15:
  if (v13)
    xpc_release(v13);
  if (v16)
    xpc_release(v16);
  v17 = *((unsigned __int8 *)v21 + 24);
  _Block_object_dispose(&v20, 8);
  return v17;
}

uint64_t TCCTestInternalWithReplyHander(uint64_t a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  return TCCTestInternalWithReplyHander4(0, a2, a3, a4, 0, 0, a5);
}

uint64_t TCCTestInternal(const __CFString *a1, uint64_t a2, uint64_t a3)
{
  return TCCTestInternalWithReplyHander4(0, a1, a2, a3, 0, 0, 0);
}

uint64_t TCCResetInternal(const char *a1, const __CFString *cf1, const char *a3, const char *a4, const __CFDictionary *a5)
{
  int v10;
  _xpc_connection_s *v11;
  _xpc_connection_s *v12;
  uint64_t v13;
  uint64_t v14;

  v10 = CFEqual(cf1, kTCCServiceAll);
  v11 = tccd();
  v12 = v11;
  if (v10)
  {
    if (v11)
    {
      v13 = TCCResetInternalWithConnection((uint64_t)v11, a1, cf1, a3, a4, a5);
      xpc_release(v12);
      if (!(_DWORD)v13)
        return v13;
      v12 = tccd();
      if (!v12)
        return v13;
LABEL_7:
      v14 = TCCResetInternalWithConnection((uint64_t)v12, a1, cf1, a3, a4, a5);
      xpc_release(v12);
      return v14;
    }
  }
  else if (v11)
  {
    goto LABEL_7;
  }
  return 0;
}

uint64_t TCCResetInternalWithConnection(uint64_t a1, const char *a2, const __CFString *a3, const char *a4, const char *a5, CFDictionaryRef theDict)
{
  const __CFBoolean *Value;
  const __CFBoolean *v13;
  CFTypeID v14;
  const __CFNumber *v15;
  const __CFNumber *v16;
  CFTypeID v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  char *v26;
  xpc_object_t v27;
  xpc_object_t v28;
  xpc_object_t v29;
  void *v30;
  xpc_object_t v31;
  xpc_object_t *v32;
  void *v33;
  uint64_t v34;
  _QWORD v36[7];
  int64_t valuePtr;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;
  xpc_object_t values[2];
  __int128 v43;
  __int128 v44;
  uint64_t v45;
  char *keys[2];
  __int128 v47;
  __int128 v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v38 = 0;
  v39 = &v38;
  v40 = 0x2000000000;
  valuePtr = 1;
  v41 = 0;
  *(_OWORD *)keys = xmmword_1E4A2EDE8;
  v47 = *(_OWORD *)&off_1E4A2EDF8;
  v48 = xmmword_1E4A2EE08;
  v45 = 0;
  v43 = 0u;
  v44 = 0u;
  *(_OWORD *)values = 0u;
  if (theDict)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, kTCCSetNoKill);
    v13 = Value;
    if (Value)
    {
      v14 = CFGetTypeID(Value);
      if (v14 == CFBooleanGetTypeID())
        LODWORD(v13) = CFBooleanGetValue(v13);
      else
        LODWORD(v13) = 0;
    }
    v15 = (const __CFNumber *)CFDictionaryGetValue(theDict, (const void *)kTCCResetSyncAuth);
    if (v15)
    {
      v16 = v15;
      v17 = CFGetTypeID(v15);
      if (v17 == CFNumberGetTypeID() && !CFNumberGetValue(v16, kCFNumberSInt64Type, &valuePtr))
      {
        if (tcc_log_handle_onceToken != -1)
          dispatch_once(&tcc_log_handle_onceToken, &__block_literal_global);
        v18 = tcc_client_log;
        if (os_log_type_enabled((os_log_t)tcc_client_log, OS_LOG_TYPE_ERROR))
          TCCResetInternalWithConnection_cold_1(v18, v19, v20, v21, v22, v23, v24, v25);
      }
    }
  }
  else
  {
    LODWORD(v13) = 0;
  }
  v26 = stringCopyUTF8String(a3);
  if (!v26)
    goto LABEL_29;
  values[0] = xpc_string_create(a2);
  if (!values[0])
    goto LABEL_29;
  values[1] = xpc_string_create(v26);
  if (!values[1])
    goto LABEL_29;
  v27 = a4 ? xpc_string_create(a4) : xpc_null_create();
  *(_QWORD *)&v43 = v27;
  if (v27
    && (!a5 ? (v28 = xpc_null_create()) : (v28 = xpc_string_create(a5)),
        (*((_QWORD *)&v43 + 1) = v28) != 0
     && (*(_QWORD *)&v44 = xpc_BOOL_create((_DWORD)v13 != 0), (_QWORD)v44)
     && (*((_QWORD *)&v44 + 1) = xpc_int64_create(valuePtr)) != 0
     && (v29 = xpc_dictionary_create((const char *const *)keys, values, 6uLL)) != 0))
  {
    v30 = v29;
    v36[0] = MEMORY[0x1E0C809B0];
    v36[1] = 0x40000000;
    v36[2] = __TCCResetInternalWithConnection_block_invoke;
    v36[3] = &unk_1E4A2EE48;
    v36[5] = a1;
    v36[6] = v29;
    v36[4] = &v38;
    _os_activity_initiate(&dword_1A364C000, "TCCResetInternal() IPC", OS_ACTIVITY_FLAG_DETACHED, v36);
    free(v26);
    xpc_release(v30);
  }
  else
  {
LABEL_29:
    free(v26);
  }
  v31 = values[0];
  if (values[0])
  {
    v32 = &values[1];
    do
    {
      xpc_release(v31);
      v33 = *v32++;
      v31 = v33;
    }
    while (v33);
  }
  v34 = *((unsigned __int8 *)v39 + 24);
  _Block_object_dispose(&v38, 8);
  return v34;
}

void _append_policy(const __CFUUID *a1, void *a2)
{
  xpc_object_t v3;
  CFUUIDBytes v4;

  v4 = CFUUIDGetUUIDBytes(a1);
  v3 = xpc_uuid_create(&v4.byte0);
  xpc_array_append_value(a2, v3);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void tcc_authorization_request_with_endpoint(_xpc_endpoint_s *a1, void *key, uint64_t a3, void (*a4)(_QWORD, _QWORD, _QWORD))
{
  const void *v6;
  const void *v7;
  uint64_t v8;
  void (*v9)(_QWORD, _QWORD, _QWORD);
  void (*v10)(_QWORD, _QWORD, _QWORD);
  void (*v11[8])(_QWORD, _QWORD, _QWORD);

  v6 = tcc_service_singleton_for_CF_name(key);
  v7 = (const void *)tcc_credential_singleton_for_self();
  if (a1)
    v8 = (uint64_t)tcc_server_create_with_endpoint(0, a1);
  else
    v8 = tcc_server_singleton_default();
  v9 = (void (*)(_QWORD, _QWORD, _QWORD))v8;
  tcc_message_options_create();
  v11[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v11[1] = (void (*)(_QWORD, _QWORD, _QWORD))0x40000000;
  v11[2] = (void (*)(_QWORD, _QWORD, _QWORD))__tcc_authorization_request_with_endpoint_block_invoke;
  v11[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E4A2EE70;
  v11[4] = a4;
  v11[5] = v10;
  v11[6] = (void (*)(_QWORD, _QWORD, _QWORD))a1;
  v11[7] = v9;
  tcc_server_message_request_authorization((uint64_t)v9, (uint64_t)v10, v7, v6, 0, v11);
}

uint64_t __tcc_authorization_request_with_endpoint_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(void);
  uint64_t result;

  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_request_with_endpoint_block_invoke_cold_1();
    v4 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    v4 = *(void (**)(void))(a1[4] + 16);
  }
  v4();
  result = tcc_release(a1[5]);
  if (a1[6])
    return tcc_release(a1[7]);
  return result;
}

void tcc_authorization_request(void *key, uint64_t a2, void (*a3)(_QWORD, _QWORD, _QWORD))
{
  tcc_authorization_request_with_endpoint(0, key, (uint64_t)a3, a3);
}

uint64_t tcc_authorization_audit_token_request_change(void *a1, __int128 *a2, uint64_t a3, const __CFDictionary *a4)
{
  uint64_t v8;
  uint64_t v9;
  void (*v10)(_QWORD, _QWORD, _QWORD);
  const void *Value;
  __int128 v12;
  void (*v13)(_QWORD, _QWORD, _QWORD);
  void (*v14)(_QWORD, _QWORD, _QWORD);
  const void *v15;
  uint64_t v16;
  void (*v18[7])(_QWORD, _QWORD, _QWORD);
  __int128 v19;
  __int128 v20;

  v8 = tcc_server_singleton_default();
  tcc_message_options_create();
  v10 = (void (*)(_QWORD, _QWORD, _QWORD))v9;
  tcc_message_options_set_reply_handler_policy(v9, 1);
  if (a4 && CFDictionaryContainsKey(a4, kTCCAccessClientDictionary))
  {
    Value = CFDictionaryGetValue(a4, kTCCAccessClientDictionary);
    tcc_message_options_set_client_dict((uint64_t)v10, Value);
  }
  v12 = a2[1];
  v19 = *a2;
  v20 = v12;
  tcc_credential_create_for_process_with_audit_token((uint64_t)&v19);
  v14 = v13;
  v15 = tcc_service_singleton_for_CF_name(a1);
  *(_QWORD *)&v19 = 0;
  *((_QWORD *)&v19 + 1) = &v19;
  *(_QWORD *)&v20 = 0x2000000000;
  *((_QWORD *)&v20 + 1) = 1;
  v18[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v18[1] = (void (*)(_QWORD, _QWORD, _QWORD))0x40000000;
  v18[2] = (void (*)(_QWORD, _QWORD, _QWORD))__tcc_authorization_audit_token_request_change_block_invoke;
  v18[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E4A2EEE8;
  v18[4] = (void (*)(_QWORD, _QWORD, _QWORD))&v19;
  v18[5] = v10;
  v18[6] = v14;
  tcc_server_message_request_authorization_change(v8, (uint64_t)v10, v14, v15, a3, 0, v18);
  v16 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 24);
  _Block_object_dispose(&v19, 8);
  return v16;
}

uint64_t __tcc_authorization_audit_token_request_change_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_audit_token_request_change_block_invoke_cold_1();
  }
  else
  {
    *(_QWORD *)(*(_QWORD *)(a1[4] + 8) + 24) = tcc_authorization_record_get_authorization_right(a2);
  }
  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

uint64_t tcc_authorization_audit_token_report_use(void *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  uint64_t v8;
  uint64_t v9;
  const void *v10;
  uint64_t v11;
  _QWORD v13[7];
  _OWORD v14[2];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2000000000;
  v18 = 1;
  v4 = tcc_server_singleton_default();
  tcc_message_options_create();
  v6 = v5;
  tcc_message_options_set_reply_handler_policy(v5, 1);
  v7 = a2[1];
  v14[0] = *a2;
  v14[1] = v7;
  tcc_credential_create_for_process_with_audit_token((uint64_t)v14);
  v9 = v8;
  v10 = tcc_service_singleton_for_CF_name(a1);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 0x40000000;
  v13[2] = __tcc_authorization_audit_token_report_use_block_invoke;
  v13[3] = &unk_1E4A2EF10;
  v13[4] = &v15;
  v13[5] = v6;
  v13[6] = v9;
  tcc_server_message_credential_report_use(v4, v6, v9, (uint64_t)v10, v13);
  v11 = *((unsigned __int8 *)v16 + 24);
  _Block_object_dispose(&v15, 8);
  return v11;
}

uint64_t __tcc_authorization_audit_token_report_use_block_invoke(_QWORD *a1, uint64_t a2)
{
  if (a2)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_audit_token_report_use_block_invoke_cold_1();
    *(_BYTE *)(*(_QWORD *)(a1[4] + 8) + 24) = 0;
  }
  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

void tcc_authorization_request_change(void *a1, uint64_t a2, const __CFDictionary *a3, void (*a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v8;
  void (*v9)(_QWORD, _QWORD, _QWORD);
  void (*v10)(_QWORD, _QWORD, _QWORD);
  const void *Value;
  const void *v12;
  const void *v13;
  void (*v14[6])(_QWORD, _QWORD, _QWORD);

  v8 = tcc_server_singleton_default();
  tcc_message_options_create();
  v10 = v9;
  if (a3 && CFDictionaryContainsKey(a3, kTCCAccessClientDictionary))
  {
    Value = CFDictionaryGetValue(a3, kTCCAccessClientDictionary);
    tcc_message_options_set_client_dict((uint64_t)v10, Value);
  }
  v12 = (const void *)tcc_credential_singleton_for_self();
  v13 = tcc_service_singleton_for_CF_name(a1);
  v14[0] = (void (*)(_QWORD, _QWORD, _QWORD))MEMORY[0x1E0C809B0];
  v14[1] = (void (*)(_QWORD, _QWORD, _QWORD))0x40000000;
  v14[2] = (void (*)(_QWORD, _QWORD, _QWORD))__tcc_authorization_request_change_block_invoke;
  v14[3] = (void (*)(_QWORD, _QWORD, _QWORD))&unk_1E4A2EF38;
  v14[4] = a4;
  v14[5] = v10;
  tcc_server_message_request_authorization_change(v8, (uint64_t)v10, v12, v13, a2, 0, v14);
}

uint64_t __tcc_authorization_request_change_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(void);

  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_request_change_block_invoke_cold_1();
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    v4 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v4();
  return tcc_release(*(_QWORD *)(a1 + 40));
}

void tcc_authorization_set_access_with_prompt(void *a1, const __CFString *a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  const void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  const char *CStringPtr;
  _QWORD *v13;
  _QWORD v14[7];

  v8 = tcc_service_singleton_for_CF_name(a1);
  v9 = tcc_server_singleton_default();
  tcc_message_options_create();
  v11 = v10;
  tcc_message_options_set_reply_handler_policy(v10, 1);
  CStringPtr = CFStringGetCStringPtr(a2, 0x8000100u);
  v13 = tcc_identity_create(0, CStringPtr);
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 0x40000000;
  v14[2] = __tcc_authorization_set_access_with_prompt_block_invoke;
  v14[3] = &unk_1E4A2EF60;
  v14[4] = a5;
  v14[5] = v11;
  v14[6] = v13;
  tcc_server_message_prompt_authorization_value(v9, v11, (uint64_t)v13, (uint64_t)v8, 0, a3, v14);
}

uint64_t __tcc_authorization_set_access_with_prompt_block_invoke(_QWORD *a1, uint64_t a2, uint64_t a3)
{
  void (*v4)(void);

  if (a3)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      __tcc_authorization_set_access_with_prompt_block_invoke_cold_1();
    v4 = *(void (**)(void))(a1[4] + 16);
  }
  else
  {
    tcc_authorization_record_get_authorization_right(a2);
    v4 = *(void (**)(void))(a1[4] + 16);
  }
  v4();
  tcc_release(a1[5]);
  return tcc_release(a1[6]);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void tcc_authorization_cache_handle_authorization_changed_for_service(uint64_t a1, const void *a2)
{
  os_unfair_lock_s *v4;
  const __CFDictionary *Value;
  const __CFDictionary *v6;
  CFIndex Count;
  const void **v8;
  uint64_t v9;
  uint64_t *v10;
  const void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  const void *v16;
  const void *v17;
  const __CFString *v18;
  const __CFString *v19;
  NSObject *v20;
  NSObject *v21;
  NSObject *v22;
  os_unfair_lock_t lock;
  const void **v24;
  const void **v25;
  uint64_t block;
  uint64_t p_block;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  _BYTE buf[24];
  void *v32;
  uint64_t *v33;
  uint64_t v34;
  uint8_t v35[4];
  _QWORD v36[3];

  *(_QWORD *)((char *)&v36[1] + 4) = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (const __CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  if (Value)
  {
    v6 = Value;
    lock = v4;
    Count = CFDictionaryGetCount(Value);
    v8 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
    v24 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
    v25 = v8;
    CFDictionaryGetKeysAndValues(v6, v8, v24);
    if (Count >= 1)
    {
      v9 = MEMORY[0x1E0C809B0];
      v10 = (uint64_t *)v24;
      do
      {
        v11 = *v8;
        v12 = *v10;
        block = v9;
        p_block = 0x40000000;
        v28 = (uint64_t)___tcc_authorization_cache_lazy_init_server_block_invoke;
        v29 = &__block_descriptor_tmp_9;
        v30 = a1;
        if (_tcc_authorization_cache_lazy_init_server_init_once != -1)
          dispatch_once(&_tcc_authorization_cache_lazy_init_server_init_once, &block);
        if (*(_QWORD *)(a1 + 104))
        {
          tcc_message_options_create();
          v14 = v13;
          tcc_message_options_set_request_prompt_policy(v13, 2);
          tcc_message_options_set_request_usage_string_policy(v14, 2);
          tcc_message_options_set_reply_handler_policy(v14, 1);
          tcc_message_options_set_cache_policy(v14, 1);
          block = 0;
          p_block = (uint64_t)&block;
          v28 = 0x2000000000;
          v29 = 0;
          v15 = *(_QWORD *)(a1 + 104);
          *(_QWORD *)buf = v9;
          *(_QWORD *)&buf[8] = 0x40000000;
          *(_QWORD *)&buf[16] = ___tcc_authorization_cache_copy_current_authorization_block_invoke;
          v32 = &unk_1E4A2EFC8;
          v33 = &block;
          v34 = a1;
          tcc_server_message_request_authorization(v15, v14, v11, a2, 0, (void (**)(_QWORD, _QWORD, _QWORD))buf);
          tcc_release(v14);
          v16 = *(const void **)(p_block + 24);
          _Block_object_dispose(&block, 8);
          if (v16)
          {
            if (!tcc_object_equal((uint64_t)v16, v12))
            {
              v17 = a2;
              v18 = tcc_object_copy_description(v12);
              v19 = tcc_object_copy_description((uint64_t)v16);
              v20 = *(NSObject **)(a1 + 56);
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543618;
                *(_QWORD *)&buf[4] = v18;
                *(_WORD *)&buf[12] = 2114;
                *(_QWORD *)&buf[14] = v19;
                _os_log_impl(&dword_1A364C000, v20, OS_LOG_TYPE_DEFAULT, "UPDATE:\n%{public}@ ->\n%{public}@", buf, 0x16u);
              }
              CFRelease(v18);
              CFRelease(v19);
              a2 = v17;
              _tcc_authorization_cache_locked_set_authorization(a1, v17, v11, v16);
              v9 = MEMORY[0x1E0C809B0];
            }
            tcc_release(v16);
          }
        }
        else
        {
          v21 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            tcc_authorization_cache_handle_authorization_changed_for_service_cold_2(v35, v36, v21);
        }
        ++v10;
        ++v8;
        --Count;
      }
      while (Count);
    }
    free(v25);
    free(v24);
    v4 = lock;
  }
  else
  {
    v22 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      tcc_authorization_cache_handle_authorization_changed_for_service_cold_1((uint64_t)a2, v22);
  }
  os_unfair_lock_unlock(v4);
}

__CFDictionary *tcc_authorization_cache_copy_state_dump(uint64_t a1)
{
  os_unfair_lock_s *v2;
  CFIndex Count;
  const void **v4;
  uint64_t v5;
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v7;
  uint64_t v8;
  const __CFDictionary *v9;
  CFIndex v10;
  const void **v11;
  const void **v12;
  uint64_t *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  const __CFString *v18;
  const __CFString *v19;
  const void *CF_name;
  os_unfair_lock_s *v22;
  CFIndex v23;
  const void **v24;
  const void **v25;
  const __CFAllocator *allocator;
  __CFDictionary *theDict;

  v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  theDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (theDict)
  {
    v22 = v2;
    Count = CFDictionaryGetCount(*(CFDictionaryRef *)(a1 + 72));
    v4 = (const void **)malloc_type_malloc(8 * Count, 0x2004093837F09uLL);
    v24 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    v25 = v4;
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), v4, v24);
    v23 = Count;
    if (Count >= 1)
    {
      v5 = 0;
      do
      {
        Mutable = CFDictionaryCreateMutable(allocator, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        if (!Mutable)
          break;
        v7 = Mutable;
        v8 = (uint64_t)v25[v5];
        v9 = (const __CFDictionary *)v24[v5];
        v10 = CFDictionaryGetCount(v9);
        v11 = (const void **)malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
        v12 = (const void **)malloc_type_malloc(8 * v10, 0x2004093837F09uLL);
        CFDictionaryGetKeysAndValues(v9, v11, v12);
        if (v10 >= 1)
        {
          v13 = (uint64_t *)v11;
          v14 = (uint64_t *)v12;
          do
          {
            v16 = *v13++;
            v15 = v16;
            v17 = *v14++;
            v18 = tcc_object_copy_description(v15);
            v19 = tcc_object_copy_description(v17);
            CFDictionarySetValue(v7, v18, v19);
            CFRelease(v18);
            CFRelease(v19);
            --v10;
          }
          while (v10);
        }
        free(v11);
        free(v12);
        CF_name = (const void *)tcc_service_get_CF_name(v8);
        CFDictionarySetValue(theDict, CF_name, v7);
        CFRelease(v7);
        ++v5;
      }
      while (v5 != v23);
    }
    free(v25);
    free(v24);
    v2 = v22;
  }
  os_unfair_lock_unlock(v2);
  return theDict;
}

void tcc_authorization_cache_handle_authorization_changed_for_service_clear(uint64_t a1, const void *a2)
{
  os_unfair_lock_s *v4;
  __CFDictionary *Value;
  NSObject *v6;
  __CFDictionary *v7;
  int v8;
  uint64_t name;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  Value = (__CFDictionary *)CFDictionaryGetValue(*(CFDictionaryRef *)(a1 + 72), a2);
  v6 = *(NSObject **)(a1 + 56);
  if (Value)
  {
    v7 = Value;
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446210;
      name = tcc_service_get_name((uint64_t)a2);
      _os_log_impl(&dword_1A364C000, v6, OS_LOG_TYPE_DEFAULT, "CLEAR:\n%{public}s", (uint8_t *)&v8, 0xCu);
    }
    CFDictionaryRemoveAllValues(v7);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    tcc_authorization_cache_handle_authorization_changed_for_service_clear_cold_1((uint64_t)a2, v6);
  }
  os_unfair_lock_unlock(v4);
}

void tcc_authorization_cache_dispose(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  const __CFDictionary *v4;
  CFIndex Count;
  const void **v6;
  __CFDictionary **v7;
  __CFDictionary *v8;

  v2 = *(NSObject **)(a1 + 80);
  if (v2)
    dispatch_release(v2);
  if (*(_QWORD *)(a1 + 88))
    os_state_remove_handler();
  v3 = *(_QWORD *)(a1 + 96);
  if (v3)
    tcc_release(v3);
  v4 = *(const __CFDictionary **)(a1 + 72);
  if (v4)
  {
    Count = CFDictionaryGetCount(v4);
    v6 = (const void **)malloc_type_malloc(8 * Count, 0xC0040B8AA526DuLL);
    CFDictionaryGetKeysAndValues(*(CFDictionaryRef *)(a1 + 72), 0, v6);
    if (Count >= 1)
    {
      v7 = (__CFDictionary **)v6;
      do
      {
        v8 = *v7++;
        CFDictionaryRemoveAllValues(v8);
        --Count;
      }
      while (Count);
    }
    free(v6);
    CFDictionaryRemoveAllValues(*(CFMutableDictionaryRef *)(a1 + 72));
    CFRelease(*(CFTypeRef *)(a1 + 72));
  }
}

CFStringRef tcc_authorization_cache_copy_description(uint64_t a1)
{
  os_unfair_lock_s *v2;
  CFStringRef v3;

  v2 = (os_unfair_lock_s *)(a1 + 64);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 64));
  v3 = CFCopyDescription(*(CFTypeRef *)(a1 + 72));
  os_unfair_lock_unlock(v2);
  return v3;
}

void ___tcc_authorization_cache_copy_current_authorization_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  uint64_t v5;

  if (a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = tcc_retain(a2);
  }
  else
  {
    v4 = *(NSObject **)(*(_QWORD *)(a1 + 40) + 56);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      ___tcc_authorization_cache_copy_current_authorization_block_invoke_cold_1(a3, v4, v5);
  }
}

_QWORD *___tcc_authorization_cache_lazy_init_server_block_invoke(_QWORD *result)
{
  uint64_t v1;

  v1 = result[4];
  if (!*(_QWORD *)(v1 + 104))
  {
    result = tcc_server_create(0);
    *(_QWORD *)(v1 + 104) = result;
  }
  return result;
}

uint64_t tcc_attributed_entity_create(int a1, const char *a2)
{
  uint64_t v4;
  uint64_t v5;

  tcc_attributed_entity_alloc(72, (uint64_t)&entity_object_ops);
  v5 = v4;
  *(_DWORD *)(v4 + 56) = a1;
  *(_QWORD *)(v4 + 64) = strdup(a2);
  return v5;
}

uint64_t tcc_attributed_entity_get_type(uint64_t a1)
{
  return *(unsigned int *)(a1 + 56);
}

uint64_t tcc_attributed_entity_get_path(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) > 1u)
    return 0;
  else
    return *(_QWORD *)(a1 + 64);
}

void tcc_attributed_entity_dispose(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 56) <= 1u)
    free(*(void **)(a1 + 64));
}

void tcc_attributed_entity_encode_to_dictionary(uint64_t a1, xpc_object_t xdict)
{
  int v4;
  const char *v5;

  xpc_dictionary_set_uint64(xdict, "TCCD_MSG_ATTRIBUTED_ENTITY_TYPE_KEY", *(unsigned int *)(a1 + 56));
  v4 = *(_DWORD *)(a1 + 56);
  if (v4)
  {
    if (v4 != 1)
      return;
    v5 = "TCCD_MSG_ATTRIBUTED_ENTITY_EXECUTABLE_PATH_KEY";
  }
  else
  {
    v5 = "TCCD_MSG_ATTRIBUTED_ENTITY_APPLICATION_PATH_KEY";
  }
  xpc_dictionary_set_string(xdict, v5, *(const char **)(a1 + 64));
}

__CFString *tcc_attributed_entity_copy_description(uint64_t a1)
{
  __CFString *Mutable;
  __CFString *v3;
  uint64_t v4;

  Mutable = CFStringCreateMutable(0, 0);
  v3 = Mutable;
  v4 = *(unsigned int *)(a1 + 56);
  if (v4 > 1)
    CFStringAppendFormat(Mutable, 0, CFSTR("Entity Type Unknown/%u"), *(unsigned int *)(a1 + 56));
  else
    CFStringAppendFormat(Mutable, 0, CFSTR("%s(%u)"), *(_QWORD *)(a1 + 64), v4);
  return v3;
}

size_t tcc_attributed_entity_hash(uint64_t a1)
{
  size_t v1;
  void *no_copy;

  v1 = *(unsigned int *)(a1 + 56);
  if (v1 <= 1)
  {
    no_copy = (void *)xpc_string_create_no_copy();
    v1 = xpc_hash(no_copy) - v1 + 32 * v1;
    xpc_release(no_copy);
  }
  return v1;
}

BOOL tcc_attributed_entity_equal(uint64_t a1, uint64_t a2)
{
  unsigned int v2;

  v2 = *(_DWORD *)(a1 + 56);
  return v2 == *(_DWORD *)(a2 + 56) && (v2 > 1 || !strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64)));
}

uint64_t tcc_credential_create_for_process_with_audit_token_and_assumed_identity(__int128 *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  __int128 v6;
  __int128 v7;

  v6 = *a1;
  v7 = a1[1];
  tcc_credential_alloc(104, (uint64_t)&credential_object_ops);
  v4 = v3;
  if (v3)
  {
    *(_QWORD *)(v3 + 56) = 1;
    *(_OWORD *)(v3 + 64) = v6;
    *(_OWORD *)(v3 + 80) = v7;
  }
  *(_QWORD *)(v3 + 96) = tcc_retain(a2);
  return v4;
}

uint64_t tcc_credential_create_data_from_process_with_audit_token()
{
  xpc_object_t v0;
  uint64_t v1;
  uint64_t v2;

  v0 = xpc_null_create();
  tcc_credential_alloc(104, (uint64_t)&credential_object_ops);
  v2 = v1;
  if (v1)
  {
    *(_QWORD *)(v1 + 56) = 2;
    *(_QWORD *)(v1 + 64) = xpc_retain(v0);
  }
  xpc_release(v0);
  return v2;
}

uint64_t tcc_credential_create_for_file_provider_domain_identifier(const char *a1)
{
  uint64_t v2;
  uint64_t v3;

  tcc_credential_alloc(104, (uint64_t)&credential_object_ops);
  v3 = v2;
  if (v2)
  {
    *(_QWORD *)(v2 + 56) = 3;
    *(_QWORD *)(v2 + 64) = strdup(a1);
  }
  return v3;
}

uint64_t tcc_events_filter_singleton_for_check_in()
{
  if (tcc_events_filter_singleton_for_check_in_init_once != -1)
    dispatch_once(&tcc_events_filter_singleton_for_check_in_init_once, &__block_literal_global_2);
  return tcc_events_filter_singleton_for_check_in_events_filter_for_check_in;
}

void __tcc_events_filter_singleton_for_check_in_block_invoke()
{
  uint64_t v0;

  tcc_events_filter_alloc(72, (uint64_t)&events_filter_object_ops);
  tcc_events_filter_singleton_for_check_in_events_filter_for_check_in = v0;
  *(_BYTE *)(v0 + 56) = 0;
  *(_DWORD *)(v0 + 12) = 0x7FFFFFFF;
  *(_DWORD *)(v0 + 8) = 0x7FFFFFFF;
}

void ___tcc_events_initialize_block_invoke_2(uint64_t a1, void *a2)
{
  const _xpc_type_s *v3;
  void *v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t pointer;
  uint64_t v8;
  uint64_t uint64;
  uint64_t v10;
  uint64_t v11;
  const char *string;
  const char *v13;
  xpc_object_t reply;
  void *v15;
  void *v16;
  uint64_t v17;
  const char *v18;
  _QWORD *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  _QWORD block[7];

  v3 = (const _xpc_type_s *)MEMORY[0x1A859163C](a2);
  v4 = (void *)MEMORY[0x1A8591528](a2);
  if (v3 != (const _xpc_type_s *)MEMORY[0x1E0C81310])
  {
    v5 = qword_1EE6C4720;
    if (v3 != (const _xpc_type_s *)MEMORY[0x1E0C812F8])
    {
      if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
        ___tcc_events_initialize_block_invoke_2_cold_10(v3, (uint64_t)v4, v5);
      goto LABEL_46;
    }
    if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_DEBUG))
      ___tcc_events_initialize_block_invoke_2_cold_9();
    if (xpc_dictionary_get_uint64(a2, "event_type"))
    {
      if (xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81298]))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1EE6C4728);
        pointer = xpc_dictionary_get_pointer();
        if (!pointer)
        {
          if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
            ___tcc_events_initialize_block_invoke_2_cold_4();
          goto LABEL_45;
        }
        v8 = pointer;
        os_unfair_lock_assert_owner((const os_unfair_lock *)&unk_1EE6C4728);
        if (!*(_QWORD *)(v8 + 72))
          tcc_authorization_changed_for_service_notification_name_cold_1();
        if (!*(_QWORD *)(v8 + 80))
          tcc_authorization_changed_for_service_notification_name_cold_1();
        uint64 = xpc_dictionary_get_uint64(a2, "event_type");
        tcc_authorization_record_create();
        v11 = v10;
        string = xpc_dictionary_get_string(a2, "service");
        if (string)
          v13 = tcc_service_singleton_for_name(string);
        else
          v13 = 0;
        v17 = xpc_dictionary_get_uint64(a2, "TCCD_MSG_IDENTITY_TYPE_KEY");
        v18 = xpc_dictionary_get_string(a2, "TCCD_MSG_IDENTITY_ID_KEY");
        if (v18)
          v19 = tcc_identity_create(v17, v18);
        else
          v19 = 0;
        v20 = xpc_dictionary_get_uint64(a2, "auth_value");
        if (v11 && v13 && v19)
        {
          v21 = v20;
          tcc_authorization_record_set_service(v11, (uint64_t)v13);
          tcc_authorization_record_set_subject_identity(v11, (uint64_t)v19);
          tcc_authorization_record_set_authorization_value(v11, v21);
        }
        else
        {
          v22 = (void *)MEMORY[0x1A8591528](a2);
          if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
            ___tcc_events_initialize_block_invoke_2_cold_8();
          free(v22);
          if (v11)
            tcc_release(v11);
          if (!v19)
            goto LABEL_42;
          v11 = 0;
        }
        tcc_release(v19);
        if (uint64 && v11)
        {
          tcc_retain(v8);
          v23 = *(NSObject **)(v8 + 72);
          block[0] = MEMORY[0x1E0C809B0];
          block[1] = 0x40000000;
          block[2] = ___tcc_events_handle_event_for_subscription_block_invoke;
          block[3] = &__block_descriptor_tmp_9_0;
          block[4] = v8;
          block[5] = uint64;
          block[6] = v11;
          dispatch_async(v23, block);
LABEL_45:
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1EE6C4728);
          goto LABEL_46;
        }
LABEL_42:
        v24 = (void *)MEMORY[0x1A8591528](a2);
        if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
          ___tcc_events_initialize_block_invoke_2_cold_7();
        free(v24);
        goto LABEL_45;
      }
      v16 = (void *)MEMORY[0x1A8591528](a2);
      if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
        ___tcc_events_initialize_block_invoke_2_cold_3();
    }
    else
    {
      reply = xpc_dictionary_create_reply(a2);
      if (reply)
      {
        v15 = reply;
        xpc_dictionary_send_reply();
        xpc_release(v15);
        goto LABEL_46;
      }
      v16 = (void *)MEMORY[0x1A8591528](a2);
      if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
        ___tcc_events_initialize_block_invoke_2_cold_2();
    }
    free(v16);
    goto LABEL_46;
  }
  v6 = qword_1EE6C4720;
  if (os_log_type_enabled((os_log_t)qword_1EE6C4720, OS_LOG_TYPE_ERROR))
    ___tcc_events_initialize_block_invoke_2_cold_1(a2, v6);
LABEL_46:
  free(v4);
}

uint64_t ___tcc_events_handle_event_for_subscription_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 80) + 16))();
  tcc_release(*(_QWORD *)(a1 + 32));
  return tcc_release(*(_QWORD *)(a1 + 48));
}

void OUTLINED_FUNCTION_2_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

const char *TCCAuthGetReasonDescription(uint64_t a1)
{
  const char *result;

  result = "None";
  switch(a1)
  {
    case 0:
      return result;
    case 1:
      result = "Recorded";
      break;
    case 2:
      result = "Service Default";
      break;
    case 3:
      result = "Service Policy";
      break;
    case 4:
      result = "Compatibility Policy";
      break;
    case 5:
      result = "Override Policy";
      break;
    case 6:
      result = "Set";
      break;
    default:
      switch(a1)
      {
        case 1000:
          result = "Error";
          break;
        case 1001:
          result = "Service Override";
          break;
        case 1002:
          result = "Missing Usage String";
          break;
        case 1003:
          result = "Prompt Timeout";
          break;
        case 1004:
          result = "Preflight Unknown";
          break;
        default:
          if (a1 == 2000)
            result = "Entitled";
          else
            result = "<Unknown Reason>";
          break;
      }
      break;
  }
  return result;
}

char *TCCAuthCopyDescription(uint64_t a1)
{
  char *v2;

  v2 = 0;
  if ((a1 & 0x100000000000000) != 0)
  {
    if ((a1 & 0x200000000000000) != 0)
    {
      asprintf(&v2, "Auth:{Access:Unknown}");
    }
    else
    {
      TCCAuthGetReasonDescription(WORD2(a1));
      asprintf(&v2, "{Access:%s, reason:%s}");
    }
  }
  else
  {
    asprintf(&v2, "Auth:{Invalid}");
  }
  return v2;
}

const char *tcc_service_singleton_for_name(const char *cStr)
{
  __CFString *v1;
  const void *v2;

  if (cStr)
  {
    v1 = (__CFString *)CFStringCreateWithCString(0, cStr, 0x8000100u);
    v2 = tcc_service_singleton_for_CF_name(v1);
    CFRelease(v1);
    return (const char *)v2;
  }
  return cStr;
}

uint64_t tcc_service_get_authorization_rights_mask(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80);
}

unint64_t tcc_service_get_authorization_prompt_rights_mask(uint64_t a1)
{
  return *(_QWORD *)(a1 + 80) & 0xFFFFFFFFFFFFFFFDLL;
}

uint64_t tcc_service_get_message_queue(uint64_t a1)
{
  dispatch_once_t *v2;
  uint64_t v3;
  _QWORD block[5];

  v3 = *(_QWORD *)(a1 + 104);
  v2 = (dispatch_once_t *)(a1 + 104);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 0x40000000;
  block[2] = __tcc_service_get_message_queue_block_invoke;
  block[3] = &__block_descriptor_tmp_5;
  block[4] = a1;
  if (v3 != -1)
    dispatch_once(v2, block);
  return *(_QWORD *)(a1 + 112);
}

dispatch_queue_t __tcc_service_get_message_queue_block_invoke(uint64_t a1)
{
  dispatch_queue_t result;
  char v3[20];
  int v4;
  uint64_t v5;
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
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v10 = xmmword_1A3660810;
  v11 = unk_1A3660820;
  v8 = xmmword_1A36607F0;
  v9 = unk_1A3660800;
  v14 = xmmword_1A3660850;
  v15 = unk_1A3660860;
  v12 = xmmword_1A3660830;
  v13 = unk_1A3660840;
  v18 = xmmword_1A3660890;
  v19 = unk_1A36608A0;
  v16 = xmmword_1A3660870;
  v17 = unk_1A3660880;
  strcpy(v3, "com.apple.tcc.auth.");
  v4 = 0;
  v5 = 0;
  v6 = xmmword_1A36607D0;
  v7 = unk_1A36607E0;
  __strlcat_chk();
  result = dispatch_queue_create(v3, 0);
  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 112) = result;
  return result;
}

uint64_t tcc_service_get_audit_token_cache_max_size(uint64_t a1)
{
  return *(unsigned int *)(a1 + 100);
}

void tcc_service_dispose(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;

  CFRelease(*(CFTypeRef *)(a1 + 56));
  free(*(void **)(a1 + 64));
  v2 = *(NSObject **)(a1 + 112);
  if (v2)
    dispatch_release(v2);
  v3 = *(NSObject **)(a1 + 128);
  if (v3)
    dispatch_release(v3);
}

uint64_t tcc_server_convert_xpc_object_to_record(void *a1, const char *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v8;
  uint64_t v9;
  const char *v10;
  const char *string;
  uint64_t uint64;
  uint64_t v13;
  uint64_t v14;
  char v15;
  int v16;
  uint64_t v17;
  char *v18;
  char v19;
  xpc_object_t value;
  uint64_t v21;
  const char *v22;
  _QWORD *v23;
  uint64_t v24;
  xpc_object_t v25;
  int64_t int64;
  const char *v27;
  _QWORD *v28;
  uint64_t v29;
  xpc_object_t v30;
  const __CFDictionary *v31;
  const __CFDictionary *v32;
  __CFBundle *v33;
  const __CFURL *v34;
  uint64_t v35;
  const __CFString *v36;
  char *v37;
  const void *v38;
  const void *v39;
  UInt8 buffer[1024];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  tcc_authorization_record_create();
  v9 = v8;
  if (!v8)
    return v9;
  if (a2)
  {
    v10 = a2;
  }
  else
  {
    if (!xpc_dictionary_get_value(a1, "service"))
      goto LABEL_7;
    string = xpc_dictionary_get_string(a1, "service");
    v10 = tcc_service_singleton_for_name(string);
    v8 = v9;
  }
  tcc_authorization_record_set_service(v8, (uint64_t)v10);
LABEL_7:
  if (!xpc_dictionary_get_value(a1, "auth_value"))
  {
    _tcc_util_create_CFError_with_user_info(2, CFSTR("missing 'auth_value' in reply message"));
    goto LABEL_33;
  }
  uint64 = xpc_dictionary_get_uint64(a1, "auth_value");
  if (xpc_dictionary_get_value(a1, "auth_reason"))
    v13 = xpc_dictionary_get_uint64(a1, "auth_reason");
  else
    v13 = 0;
  v14 = xpc_dictionary_get_uint64(a1, "auth_version");
  v15 = xpc_dictionary_get_BOOL(a1, "has_prompted_for_allow");
  tcc_authorization_record_set_authorization_value(v9, uint64);
  tcc_authorization_record_set_authorization_reason(v9, v13);
  tcc_authorization_record_set_version(v9, v14);
  tcc_authorization_record_set_has_prompted_for_allow(v9, v15);
  if (xpc_dictionary_get_value(a1, "session_pid"))
  {
    v16 = xpc_dictionary_get_uint64(a1, "session_pid");
    tcc_authorization_record_set_session_pid(v9, v16);
  }
  if (xpc_dictionary_get_value(a1, "session_pid_version"))
  {
    v17 = xpc_dictionary_get_uint64(a1, "session_pid_version");
    tcc_authorization_record_set_session_pid_version(v9, v17);
  }
  v18 = (char *)xpc_dictionary_get_string(a1, "session_boot_UUID");
  if (v18)
    tcc_authorization_record_set_bootUUID(v9, v18);
  v19 = xpc_dictionary_get_BOOL(a1, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
  tcc_authorization_record_set_allow_standard_user_to_set_system_service(v9, v19);
  if (xpc_dictionary_get_value(a1, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY"))
  {
    value = xpc_dictionary_get_value(a1, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_IDENTITY_DICTIONARY_KEY");
    v21 = xpc_dictionary_get_uint64(value, "TCCD_MSG_IDENTITY_TYPE_KEY");
    v22 = xpc_dictionary_get_string(value, "TCCD_MSG_IDENTITY_ID_KEY");
    v23 = tcc_identity_create(v21, v22);
    if (v23)
    {
      v24 = (uint64_t)v23;
      v25 = xpc_dictionary_get_value(a1, "code_requirement");
      tcc_identity_set_verifier_code_requirement_data(v24, v25);
      tcc_authorization_record_set_subject_identity(v9, v24);
      tcc_release(v24);
      goto LABEL_23;
    }
    _tcc_util_create_CFError_with_user_info(2, CFSTR("Failed to allocate subject identity."));
LABEL_33:
    tcc_release(v9);
    return 0;
  }
  if (a3)
    tcc_authorization_record_set_subject_identity(v9, a3);
LABEL_23:
  if (xpc_dictionary_get_value(a1, "indirect_object_identifier"))
  {
    int64 = xpc_dictionary_get_int64(a1, "indirect_object_identifier_type");
    v27 = xpc_dictionary_get_string(a1, "indirect_object_identifier");
    v28 = tcc_identity_create(int64, v27);
    if (v28)
    {
      v29 = (uint64_t)v28;
      v30 = xpc_dictionary_get_value(a1, "indirect_object_code_requirement");
      tcc_identity_set_verifier_code_requirement_data(v29, v30);
      tcc_authorization_record_set_indirect_object_identity(v9, v29);
      tcc_release(v29);
    }
  }
  else if (a4)
  {
    tcc_authorization_record_set_indirect_object_identity(v9, a4);
  }
  v31 = (const __CFDictionary *)_TCCTCCAccessCopyInformationInternalForEntry(a1);
  if (v31)
  {
    v32 = v31;
    v33 = (__CFBundle *)CFDictionaryGetValue(v31, kTCCInfoBundle);
    if (v33)
    {
      v34 = CFBundleCopyBundleURL(v33);
      if (CFURLGetFileSystemRepresentation(v34, 0, buffer, 1024))
        v35 = tcc_attributed_entity_create(0, (const char *)buffer);
      else
        v35 = 0;
      CFRelease(v34);
    }
    else
    {
      v36 = (const __CFString *)CFDictionaryGetValue(v32, kTCCInfoPath);
      if (!v36)
      {
LABEL_40:
        v38 = CFDictionaryGetValue(v32, kTCCInfoLastModified);
        if (v38)
          tcc_authorization_record_set_last_modified_date(v9, v38);
        v39 = CFDictionaryGetValue(v32, kTCCInfoExpiredAt);
        if (v39)
          tcc_authorization_record_set_last_modified_date(v9, v39);
        CFRelease(v32);
        return v9;
      }
      v37 = stringCopyUTF8String(v36);
      v35 = tcc_attributed_entity_create(1, v37);
      free(v37);
    }
    if (v35)
    {
      tcc_authorization_record_set_subject_attributed_entity(v9, v35);
      tcc_release(v35);
    }
    goto LABEL_40;
  }
  return v9;
}

uint64_t tcc_server_copy_cached_authorization(uint64_t a1, const void *a2, const void *a3)
{
  return tcc_authorization_cache_copy_authorization(*(_QWORD *)(a1 + 64), a2, a3);
}

void tcc_server_cache_authorization(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  tcc_authorization_cache_set_authorization(*(_QWORD *)(a1 + 64), a2, a3, a4);
}

_QWORD *tcc_server_create_with_endpoint(NSObject *a1, _xpc_endpoint_s *a2)
{
  _QWORD *v3;
  _xpc_connection_s *v4;

  v3 = tcc_server_create(a1);
  v4 = xpc_connection_create_from_endpoint(a2);
  v3[9] = v4;
  xpc_connection_set_event_handler(v4, &__block_literal_global_4);
  xpc_connection_activate((xpc_connection_t)v3[9]);
  return v3;
}

uint64_t tcc_server_get_connection(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t tcc_server_get_reply_handler_queue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

void tcc_server_message_set_authorization_value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  const char *v12;
  const void *v13;
  uint64_t nokill_policy;
  CFErrorRef CFError_with_user_info;
  _BOOL4 v16;
  __CFDictionary *Mutable;
  CFNumberRef v18;
  const __CFString *CF_name;
  const char *identifier;
  int v21;
  CFErrorRef v22;
  uint64_t name;
  uint64_t v24;
  CFErrorRef v25;
  uint64_t type;
  uint64_t valuePtr;

  valuePtr = a6;
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1)
    {
      type = tcc_identity_get_type(a3);
      CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("Unhandled identity type: %llu"), type);
      goto LABEL_18;
    }
    v12 = "path";
  }
  else
  {
    v12 = "bundle";
  }
  v13 = (const void *)*MEMORY[0x1E0C9AE40];
  if (a2)
  {
    nokill_policy = tcc_message_options_get_nokill_policy(a2);
    if (nokill_policy)
      v13 = (const void *)nokill_policy;
  }
  if (a6 == 1)
  {
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(8, CFSTR("Authorization right cannot be Unknown"));
LABEL_18:
    v25 = CFError_with_user_info;
    if (a7)
      (*(void (**)(uint64_t, CFErrorRef))(a7 + 16))(a7, CFError_with_user_info);
    CFRelease(v25);
    return;
  }
  v16 = a6 != 0;
  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  v18 = CFNumberCreate(0, kCFNumberLongLongType, &valuePtr);
  CFDictionarySetValue(Mutable, CFSTR("auth_value"), v18);
  CFDictionarySetValue(Mutable, kTCCSetNoKill, v13);
  CF_name = (const __CFString *)tcc_service_get_CF_name(a4);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  v21 = TCCAccessSetInternal(CF_name, v12, identifier, 0, v16, 0, 0, Mutable);
  v22 = 0;
  if (!v21)
  {
    name = tcc_service_get_name(a4);
    v24 = tcc_identity_get_identifier(a3);
    v22 = _tcc_util_create_CFError_with_user_info(2, CFSTR("Failed to set authorization for %s, %s"), name, v24);
  }
  if (a7)
    (*(void (**)(uint64_t, CFErrorRef))(a7 + 16))(a7, v22);
  if (v22)
    CFRelease(v22);
  CFRelease(v18);
  CFRelease(Mutable);
}

void tcc_server_message_prompt_authorization_value(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const void *a7)
{
  xpc_object_t v13;
  uint64_t v14;
  uint64_t v15;
  const char *v16;
  const char *identifier;
  const char *name;
  _BOOL4 v19;
  void *v20;
  _QWORD activity_block[5];
  _BOOL4 v22;
  _QWORD v23[8];
  _BOOL4 v24;

  v13 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v13, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v13, "TCCD_MSG_REQUEST_TYPE_KEY", 8uLL);
  xpc_dictionary_set_string(v13, "function", "TCCAccessSetWithPrompt");
  v14 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v14 = v15;
    a2 = v15;
  }
  tcc_object_encode_to_dictionary(a2);
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1)
      goto LABEL_8;
    v16 = "path";
  }
  else
  {
    v16 = "bundle";
  }
  xpc_dictionary_set_string(v13, "client_type", v16);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  xpc_dictionary_set_string(v13, "client", identifier);
LABEL_8:
  name = (const char *)tcc_service_get_name(a4);
  xpc_dictionary_set_string(v13, "service", name);
  xpc_dictionary_set_uint64(v13, "desired_auth_value", a6);
  v19 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  v20 = _Block_copy(a7);
  xpc_retain(v13);
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 0x40000000;
  v23[2] = ___tcc_server_send_prompt_authorization_value_block_invoke;
  v23[3] = &unk_1E4A2F368;
  v24 = v19;
  v23[6] = v13;
  v23[7] = a4;
  v23[4] = v20;
  v23[5] = a1;
  activity_block[0] = MEMORY[0x1E0C809B0];
  activity_block[1] = 0x40000000;
  activity_block[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_2_82;
  activity_block[3] = &unk_1E4A2F390;
  v22 = v19;
  activity_block[4] = v23;
  _os_activity_initiate(&dword_1A364C000, "tcc_send_prompt_authorization_value() IPC", OS_ACTIVITY_FLAG_DEFAULT, activity_block);
  if (v14)
    tcc_release(v14);
  xpc_release(v13);
}

void tcc_server_message_get_authorization_records_by_identity(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  const char *identifier;

  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_REQUEST_TYPE_KEY", 2uLL);
  v11 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v11 = v12;
    tcc_message_options_set_reply_handler_policy(v12, 1);
    a2 = v11;
  }
  tcc_object_encode_to_dictionary(a2);
  xpc_dictionary_set_string(v10, "function", "TCCAccessCopyInformationForBundle");
  if (tcc_identity_get_type(a3))
  {
    if (tcc_identity_get_type(a3) != 1)
      goto LABEL_8;
    v13 = "path";
  }
  else
  {
    v13 = "bundle";
  }
  xpc_dictionary_set_string(v10, "client_type", v13);
  identifier = (const char *)tcc_identity_get_identifier(a3);
  xpc_dictionary_set_string(v10, "client", identifier);
LABEL_8:
  _tcc_server_send_get_authorization_records(a1, 0, a2, 0, a3, a4, (uint64_t)v10, a5);
  if (v11)
    tcc_release(v11);
  xpc_release(v10);
}

void tcc_server_message_get_identity_for_credential(uint64_t a1, uint64_t a2, uint64_t a3, const void *a4)
{
  xpc_object_t v8;
  uint64_t v9;
  uint64_t v10;
  xpc_object_t v11;
  _BOOL4 v12;
  void *v13;
  _QWORD v14[5];
  _BOOL4 v15;
  _QWORD v16[7];
  _BOOL4 v17;

  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v8, "TCCD_MSG_REQUEST_TYPE_KEY", 4uLL);
  xpc_dictionary_set_string(v8, "function", "TCCGetIdentityForCredential");
  v9 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v9 = v10;
    a2 = v10;
  }
  tcc_object_encode_to_dictionary(a2);
  v11 = xpc_dictionary_create(0, 0, 0);
  tcc_object_encode_to_dictionary(a3);
  xpc_dictionary_set_value(v8, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v11);
  xpc_release(v11);
  v12 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  v13 = _Block_copy(a4);
  xpc_retain(v8);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 0x40000000;
  v16[2] = ___tcc_server_send_get_identity_for_credential_block_invoke;
  v16[3] = &unk_1E4A2F4C0;
  v16[5] = v8;
  v16[6] = a1;
  v17 = v12;
  v16[4] = v13;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 0x40000000;
  v14[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_2_106;
  v14[3] = &unk_1E4A2F4E8;
  v15 = v12;
  v14[4] = v16;
  _os_activity_initiate(&dword_1A364C000, "tcc_send_get_identity_for_credential() IPC", OS_ACTIVITY_FLAG_DEFAULT, v14);
  if (v9)
    tcc_release(v9);
  xpc_release(v8);
}

void tcc_server_set_authorization_change_handler()
{
  if (tcc_server_set_authorization_change_handler_log_once != -1)
    dispatch_once(&tcc_server_set_authorization_change_handler_log_once, &__block_literal_global_46);
}

void __tcc_server_set_authorization_change_handler_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = tcc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __tcc_server_set_authorization_change_handler_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void tcc_server_message_set_authorization_change_policy()
{
  if (tcc_server_message_set_authorization_change_policy_log_once != -1)
    dispatch_once(&tcc_server_message_set_authorization_change_policy_log_once, &__block_literal_global_48);
}

void __tcc_server_message_set_authorization_change_policy_block_invoke()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  v0 = tcc_log_handle();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    __tcc_server_message_set_authorization_change_policy_block_invoke_cold_1(v0, v1, v2, v3, v4, v5, v6, v7);
}

void tcc_server_message_request_authorization_change(uint64_t a1, uint64_t a2, const void *a3, const void *a4, uint64_t a5, uint64_t a6, void (**a7)(_QWORD, _QWORD, _QWORD))
{
  xpc_object_t v14;
  uint64_t v15;
  uint64_t v16;
  xpc_object_t v17;
  xpc_object_t v18;

  v14 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v14, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v14, "TCCD_MSG_REQUEST_TYPE_KEY", 0);
  xpc_dictionary_set_uint64(v14, "desired_auth_value", a5);
  v15 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v15 = v16;
    a2 = v16;
  }
  tcc_object_encode_to_dictionary(a2);
  v17 = xpc_dictionary_create(0, 0, 0);
  tcc_object_encode_to_dictionary((uint64_t)a3);
  xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v17);
  xpc_release(v17);
  tcc_object_encode_to_dictionary((uint64_t)a4);
  if (a6)
  {
    v18 = xpc_dictionary_create(0, 0, 0);
    tcc_object_encode_to_dictionary(a6);
    xpc_dictionary_set_value(v14, "TCC_MSG_REQUEST_AUTHORIZATION_INDIRECT_OBJECT_CREDENTIAL_DICTIONARY_KEY", v18);
    xpc_release(v18);
  }
  _tcc_server_send_request_authorization(a1, a4, a3, a2, v14, a7);
  if (v15)
    tcc_release(v15);
  xpc_release(v14);
}

void tcc_server_message_credential_report_use(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, const void *a5)
{
  xpc_object_t v10;
  uint64_t v11;
  uint64_t v12;
  xpc_object_t v13;
  _BOOL4 v14;
  void *v15;
  _QWORD v16[5];
  _BOOL4 v17;
  _QWORD v18[7];
  _BOOL4 v19;

  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v10, "TCCD_MSG_REQUEST_TYPE_KEY", 7uLL);
  v11 = 0;
  if (!a2)
  {
    tcc_message_options_create();
    v11 = v12;
    a2 = v12;
  }
  tcc_object_encode_to_dictionary(a2);
  v13 = xpc_dictionary_create(0, 0, 0);
  tcc_object_encode_to_dictionary(a3);
  xpc_dictionary_set_value(v10, "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY", v13);
  xpc_release(v13);
  tcc_object_encode_to_dictionary(a4);
  v14 = tcc_message_options_get_reply_handler_policy(a2) == 1;
  v15 = _Block_copy(a5);
  xpc_retain(v10);
  xpc_dictionary_set_string(v10, "function", "TCCReportUse");
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 0x40000000;
  v18[2] = ___tcc_server_send_report_resource_use_block_invoke;
  v18[3] = &unk_1E4A2F5A0;
  v18[5] = v10;
  v18[6] = a1;
  v19 = v14;
  v18[4] = v15;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 0x40000000;
  v16[2] = ___tcc_server_send_report_resource_use_block_invoke_2_117;
  v16[3] = &unk_1E4A2F5C8;
  v17 = v14;
  v16[4] = v18;
  _os_activity_initiate(&dword_1A364C000, "tcc_send_report_resource_use() IPC", OS_ACTIVITY_FLAG_DEFAULT, v16);
  if (v11)
    tcc_release(v11);
  xpc_release(v10);
}

void tcc_server_message_get_authorization_records_by_services(uint64_t a1, const __CFArray *a2, uint64_t a3, void (**a4)(_QWORD, _QWORD, _QWORD))
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  xpc_object_t v9;
  xpc_object_t v10;
  CFIndex Count;
  CFIndex v12;
  CFIndex i;
  __CFString *ValueAtIndex;
  const void *v15;
  const char *name;
  xpc_object_t v17;
  _BYTE *v18;
  NSObject *v19;
  void *v20;
  _BOOL4 v21;
  uint64_t v22;
  NSObject *v23;
  CFErrorRef CFError_with_user_info;
  _QWORD v26[6];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  __int128 buf;
  void (*v32)(uint64_t);
  void *v33;
  _QWORD *v34;
  void *v35;
  uint64_t *v36;
  uint64_t v37;
  xpc_object_t v38;
  _BOOL4 v39;
  int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (a3)
  {
    v6 = a3;
    v7 = 0;
  }
  else
  {
    tcc_message_options_create();
    v7 = v8;
    tcc_message_options_set_reply_handler_policy(v8, 1);
    v6 = v7;
  }
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v9, "TCCD_MSG_SPI_VERSION", 2uLL);
  xpc_dictionary_set_uint64(v9, "TCCD_MSG_REQUEST_TYPE_KEY", 5uLL);
  xpc_dictionary_set_string(v9, "function", "TCCAccessCopyInformationForServices");
  tcc_object_encode_to_dictionary(v6);
  v10 = xpc_array_create(0, 0);
  Count = CFArrayGetCount(a2);
  if (Count >= 1)
  {
    v12 = Count;
    for (i = 0; i != v12; ++i)
    {
      ValueAtIndex = (__CFString *)CFArrayGetValueAtIndex(a2, i);
      v15 = tcc_service_singleton_for_CF_name(ValueAtIndex);
      if (v15)
      {
        name = (const char *)tcc_service_get_name((uint64_t)v15);
        v17 = xpc_string_create(name);
        xpc_array_append_value(v10, v17);
        xpc_release(v17);
      }
      else
      {
        v18 = stringCopyUTF8String(ValueAtIndex);
        v19 = tcc_log_handle();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = v18;
          _os_log_error_impl(&dword_1A364C000, v19, OS_LOG_TYPE_ERROR, "%s, service invalid", (uint8_t *)&buf, 0xCu);
        }
        free(v18);
      }
    }
  }
  if (xpc_array_get_count(v10))
  {
    xpc_dictionary_set_value(v9, "services", v10);
  }
  else
  {
    xpc_release(v9);
    v9 = 0;
  }
  xpc_release(v10);
  v27 = 0;
  v28 = &v27;
  v29 = 0x2000000000;
  v30 = 0;
  if (v9)
  {
    v20 = _Block_copy(a4);
    v21 = tcc_message_options_get_reply_handler_policy(v6) == 1;
    v22 = MEMORY[0x1E0C809B0];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 0x40000000;
    v26[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke;
    v26[3] = &unk_1E4A2F640;
    v26[4] = v20;
    v26[5] = &v27;
    v23 = tcc_log_handle();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1A364C000, v23, OS_LOG_TYPE_INFO, "tcc_server_message_get_authorization_records_by_services() IPC", (uint8_t *)&buf, 2u);
    }
    *(_QWORD *)&buf = v22;
    *((_QWORD *)&buf + 1) = 0x40000000;
    v32 = ___tcc_server_send_get_authorization_records_by_services_block_invoke_129;
    v33 = &unk_1E4A2F6B8;
    v37 = a1;
    v38 = v9;
    v35 = v20;
    v36 = &v27;
    v34 = v26;
    v39 = v21;
    v40 = 1;
    _os_activity_initiate(&dword_1A364C000, "tcc_server_message_get_authorization_records_by_services() IPC", OS_ACTIVITY_FLAG_DEFAULT, &buf);
  }
  else
  {
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(8, CFSTR("Invalid services list"));
    v28[3] = (uint64_t)CFError_with_user_info;
    ((void (**)(_QWORD, _QWORD, CFErrorRef))a4)[2](a4, 0, CFError_with_user_info);
  }
  _Block_object_dispose(&v27, 8);
  if (v7)
    tcc_release(v7);
}

uint64_t tcc_server_copy_authorization_cache(uint64_t a1)
{
  return tcc_authorization_cache_dump_state_copy(*(_QWORD *)(a1 + 64));
}

void ___tcc_server_send_request_authorization_block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  tcc_release(*(_QWORD *)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

void ___tcc_server_send_request_authorization_block_invoke_53(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  tcc_release(*(_QWORD *)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

void ___tcc_server_send_request_authorization_block_invoke_72(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  tcc_release(*(_QWORD *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    tcc_release(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

void ___tcc_server_send_request_authorization_block_invoke_2_76(uint64_t a1)
{
  int v2;
  NSObject *v3;
  void *v4;

  v2 = *(_DWORD *)(a1 + 48);
  v3 = *(NSObject **)(a1 + 40);
  v4 = *(void **)(a1 + 32);
  if (v2)
    dispatch_sync(v3, v4);
  else
    dispatch_async(v3, v4);
}

void ___tcc_server_send_prompt_authorization_value_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  _xpc_connection_s *v3;
  int v4;
  _QWORD v5[5];
  __int128 v6;
  uint64_t v7;
  int v8;

  v2 = *(_QWORD *)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(_xpc_connection_s **)(v1 + 72);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_2;
  v5[3] = &unk_1E4A2F340;
  v4 = *(_DWORD *)(a1 + 64);
  v5[1] = 0x40000000;
  v6 = *(_OWORD *)(a1 + 48);
  v8 = v4;
  v5[4] = v2;
  v7 = v1;
  tccd_send_v2(v3, 0, v4, 0, (void *)v6, (uint64_t)v5);
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t uint64;
  CFErrorRef CFError_with_user_info;
  NSObject *v6;
  _BOOL4 v7;
  const char *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  BOOL v16;
  const char *string;
  char v18;
  uint64_t v19;
  NSObject *v20;
  _QWORD block[7];

  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (MEMORY[0x1A859163C](a2) != MEMORY[0x1E0C81310])
  {
    if (xpc_dictionary_get_value(a2, "auth_value"))
    {
      uint64 = xpc_dictionary_get_uint64(a2, "auth_value");
      CFError_with_user_info = 0;
    }
    else
    {
      CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("missing 'auth_value' in reply message"));
      uint64 = 0;
    }
    if (xpc_dictionary_get_value(a2, "auth_reason"))
      v10 = xpc_dictionary_get_uint64(a2, "auth_reason");
    else
      v10 = 0;
    v11 = xpc_dictionary_get_uint64(a2, "auth_version");
    if (CFError_with_user_info)
    {
      xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
LABEL_13:
      v12 = 0;
      v13 = 0;
LABEL_23:
      if (*(_DWORD *)(a1 + 64))
      {
        (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
        _Block_release(*(const void **)(a1 + 32));
        if ((v12 & 1) == 0)
          CFRelease(CFError_with_user_info);
        if (v13)
          tcc_release(v13);
      }
      else
      {
        v20 = *(NSObject **)(*(_QWORD *)(a1 + 56) + 56);
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 0x40000000;
        block[2] = ___tcc_server_send_prompt_authorization_value_block_invoke_78;
        block[3] = &unk_1E4A2F318;
        block[4] = *(_QWORD *)(a1 + 32);
        block[5] = v13;
        block[6] = CFError_with_user_info;
        dispatch_async(v20, block);
      }
      return;
    }
    v14 = v11;
    if (xpc_dictionary_get_value(a2, "auth_error_string"))
    {
      if (xpc_dictionary_get_value(a2, "auth_error_code"))
        v15 = xpc_dictionary_get_uint64(a2, "auth_error_code");
      else
        v15 = 2;
      string = xpc_dictionary_get_string(a2, "auth_error_string");
      CFError_with_user_info = _tcc_util_create_CFError_with_user_info(v15, CFSTR("server error: %s"), string);
      v16 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
      if (CFError_with_user_info)
        goto LABEL_13;
    }
    else
    {
      v16 = xpc_dictionary_get_BOOL(a2, "TCCD_MSG_ALLOW_STANDARD_USER_TO_SET_SYSTEM_SERVICE");
    }
    v18 = v16;
    tcc_authorization_record_create();
    v13 = v19;
    if (v19)
    {
      tcc_authorization_record_set_service(v19, *(_QWORD *)(a1 + 48));
      tcc_authorization_record_set_authorization_value(v13, uint64);
      tcc_authorization_record_set_authorization_reason(v13, v10);
      tcc_authorization_record_set_version(v13, v14);
      tcc_authorization_record_set_allow_standard_user_to_set_system_service(v13, v18);
    }
    CFError_with_user_info = 0;
    v12 = 1;
    goto LABEL_23;
  }
  v6 = tcc_log_handle();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_ERROR);
  v8 = (const char *)*MEMORY[0x1E0C81270];
  if (v7)
    ___tcc_server_send_prompt_authorization_value_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1E0C81270]);
  v9 = xpc_dictionary_get_string(a2, v8);
  _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), v9);
}

uint64_t ___tcc_server_send_prompt_authorization_value_block_invoke_78(uint64_t a1)
{
  const void *v2;
  uint64_t result;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return tcc_release(result);
  return result;
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2_82(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1)
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    dispatch_sync((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1)
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    dispatch_async((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }
}

dispatch_queue_t ___tcc_server_resource_use_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.TCC.send_report_resource_use", 0);
  _tcc_server_resource_use_queue_resource_use_queue = (uint64_t)result;
  return result;
}

BOOL ___tcc_server_send_get_authorization_records_block_invoke_91(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v4 = tcc_server_convert_xpc_object_to_record(a3, *(const char **)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
  v5 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v5)
  {
    v6 = v4;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v6)
      tcc_release(v6);
  }
  return v5 == 0;
}

void ___tcc_server_send_get_identity_for_credential_block_invoke(uint64_t a1)
{
  xpc_object_t value;
  void *v3;
  const void *data;
  void *v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  int v8;
  _QWORD v9[7];
  int v10;
  size_t length;

  length = 0;
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  if (value && (v3 = value, xpc_dictionary_get_uint64(value, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") == 1))
    data = xpc_dictionary_get_data(v3, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_DATA_KEY", &length);
  else
    data = 0;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_xpc_connection_s **)(v6 + 72);
  v8 = *(_DWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_2;
  v9[3] = &unk_1E4A2F498;
  v10 = v8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v5;
  v9[6] = v6;
  tccd_send_v2(v7, 0, v8, (uint64_t)data, v5, (uint64_t)v9);
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2(uint64_t a1, void *a2)
{
  xpc_object_t value;
  xpc_object_t v5;
  void *v6;
  void *v7;
  NSObject *v8;
  CFErrorRef CFError_with_user_info;
  NSObject *v10;
  _BOOL4 v11;
  const char *v12;
  const char *string;
  _QWORD *v14;
  NSObject *v15;
  uint64_t v16;
  const char *string_ptr;
  _QWORD block[7];

  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    v10 = tcc_log_handle();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    v12 = (const char *)*MEMORY[0x1E0C81270];
    if (v11)
      ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1E0C81270]);
    string = xpc_dictionary_get_string(a2, v12);
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), string);
    goto LABEL_12;
  }
  value = xpc_dictionary_get_value(a2, "TCCD_MSG_IDENTITY_TYPE_KEY");
  v5 = xpc_dictionary_get_value(a2, "TCCD_MSG_IDENTITY_ID_KEY");
  if (!value
    || (v6 = v5, MEMORY[0x1A859163C](value) != MEMORY[0x1E0C81398])
    || !v6
    || MEMORY[0x1A859163C](v6) != MEMORY[0x1E0C81390])
  {
    v7 = (void *)MEMORY[0x1A8591528](a2);
    v8 = tcc_log_handle();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_2();
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("Invalid reply for attribution request: %s"), v7);
    free(v7);
LABEL_12:
    v14 = 0;
    goto LABEL_13;
  }
  v16 = xpc_uint64_get_value(value);
  string_ptr = xpc_string_get_string_ptr(v6);
  v14 = tcc_identity_create(v16, string_ptr);
  if (v14)
    CFError_with_user_info = 0;
  else
    CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("Failed to allocate identity."));
LABEL_13:
  if (*(_DWORD *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_release(*(const void **)(a1 + 32));
    if (v14)
      tcc_release(v14);
    if (CFError_with_user_info)
      CFRelease(CFError_with_user_info);
  }
  else
  {
    v15 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___tcc_server_send_get_identity_for_credential_block_invoke_102;
    block[3] = &unk_1E4A2F470;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = v14;
    block[6] = CFError_with_user_info;
    dispatch_async(v15, block);
  }
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_102(uint64_t a1)
{
  uint64_t v2;
  const void *v3;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(_QWORD *)(a1 + 40);
  if (v2)
    tcc_release(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_106(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_attribution_ipc_queue_attribution_queue_once != -1)
      dispatch_once(&_tcc_server_attribution_ipc_queue_attribution_queue_once, &__block_literal_global_109);
    dispatch_sync((dispatch_queue_t)_tcc_server_attribution_ipc_queue_attribution_queue, *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    if (_tcc_server_attribution_ipc_queue_attribution_queue_once != -1)
      dispatch_once(&_tcc_server_attribution_ipc_queue_attribution_queue_once, &__block_literal_global_109);
    dispatch_async((dispatch_queue_t)_tcc_server_attribution_ipc_queue_attribution_queue, *(dispatch_block_t *)(a1 + 32));
  }
}

dispatch_queue_t ___tcc_server_attribution_ipc_queue_block_invoke()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.TCC.send_get_identity_for_credential", 0);
  _tcc_server_attribution_ipc_queue_attribution_queue = (uint64_t)result;
  return result;
}

void ___tcc_server_send_report_resource_use_block_invoke(uint64_t a1)
{
  xpc_object_t value;
  void *v3;
  const void *data;
  void *v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  int v8;
  _QWORD v9[7];
  int v10;
  size_t length;

  length = 0;
  value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "TCC_MSG_REQUEST_AUTHORIZATION_SUBJECT_CREDENTIAL_DICTIONARY_KEY");
  if (value && (v3 = value, xpc_dictionary_get_uint64(value, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_TYPE_KEY") == 1))
    data = xpc_dictionary_get_data(v3, "TCCD_MSG_CREDENTIAL_AUTHENTICATOR_DATA_KEY", &length);
  else
    data = 0;
  v5 = *(void **)(a1 + 40);
  v6 = *(_QWORD *)(a1 + 48);
  v7 = *(_xpc_connection_s **)(v6 + 72);
  v8 = *(_DWORD *)(a1 + 56);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 0x40000000;
  v9[2] = ___tcc_server_send_report_resource_use_block_invoke_2;
  v9[3] = &unk_1E4A2F578;
  v10 = v8;
  v9[4] = *(_QWORD *)(a1 + 32);
  v9[5] = v5;
  v9[6] = v6;
  tccd_send_v2(v7, 0, v8, (uint64_t)data, v5, (uint64_t)v9);
}

void ___tcc_server_send_report_resource_use_block_invoke_2(uint64_t a1, void *a2)
{
  CFErrorRef CFError_with_user_info;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  void *v8;
  const char *v9;
  const char *string;
  NSObject *v11;
  _QWORD block[6];

  xpc_release(*(xpc_object_t *)(a1 + 40));
  if (MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C81310])
  {
    v5 = tcc_log_handle();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
    v7 = (const char *)*MEMORY[0x1E0C81270];
    if (v6)
      ___tcc_server_send_report_resource_use_block_invoke_2_cold_1(a2, (const char *)*MEMORY[0x1E0C81270]);
    v8 = a2;
    v9 = v7;
  }
  else
  {
    if (xpc_dictionary_get_BOOL(a2, "result"))
    {
      CFError_with_user_info = 0;
      goto LABEL_9;
    }
    v9 = (const char *)*MEMORY[0x1E0C81270];
    v8 = a2;
  }
  string = xpc_dictionary_get_string(v8, v9);
  CFError_with_user_info = _tcc_util_create_CFError_with_user_info(2, CFSTR("%s"), string);
LABEL_9:
  if (*(_DWORD *)(a1 + 56))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    _Block_release(*(const void **)(a1 + 32));
    if (CFError_with_user_info)
      CFRelease(CFError_with_user_info);
  }
  else
  {
    v11 = *(NSObject **)(*(_QWORD *)(a1 + 48) + 56);
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 0x40000000;
    block[2] = ___tcc_server_send_report_resource_use_block_invoke_113;
    block[3] = &unk_1E4A2F550;
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = CFError_with_user_info;
    dispatch_async(v11, block);
  }
}

void ___tcc_server_send_report_resource_use_block_invoke_113(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  _Block_release(*(const void **)(a1 + 32));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

void ___tcc_server_send_report_resource_use_block_invoke_2_117(uint64_t a1)
{
  if (*(_DWORD *)(a1 + 40))
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1)
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    dispatch_sync((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }
  else
  {
    if (_tcc_server_resource_use_queue_resource_use_queue_once != -1)
      dispatch_once(&_tcc_server_resource_use_queue_resource_use_queue_once, &__block_literal_global_85);
    dispatch_async((dispatch_queue_t)_tcc_server_resource_use_queue_resource_use_queue, *(dispatch_block_t *)(a1 + 32));
  }
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke(uint64_t a1, void *a2)
{
  const char *string;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD applier[4];
  __int128 v14;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (MEMORY[0x1A859163C](a2) != MEMORY[0x1E0C81310] && MEMORY[0x1A859163C](a2) == MEMORY[0x1E0C812F8])
    {
      applier[0] = MEMORY[0x1E0C809B0];
      applier[1] = 0x40000000;
      applier[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_123;
      applier[3] = &unk_1E4A2F618;
      v14 = *(_OWORD *)(a1 + 32);
      xpc_dictionary_apply(a2, applier);
    }
    else
    {
      string = xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _tcc_util_create_CFError_with_user_info(2, CFSTR("Failed to get clients for services: %s"), string);
      v5 = tcc_log_handle();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1(v5, v6, v7, v8, v9, v10, v11, v12);
    }
  }
}

BOOL ___tcc_server_send_get_authorization_records_by_services_block_invoke_123(uint64_t a1, uint64_t a2, void *a3)
{
  const char *string;
  NSObject *v7;
  _BOOL8 result;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD applier[4];
  __int128 v17;
  uint64_t v18;

  if (MEMORY[0x1A859163C](a3) != MEMORY[0x1E0C81310] && MEMORY[0x1A859163C](a3) == MEMORY[0x1E0C812C8])
  {
    applier[0] = MEMORY[0x1E0C809B0];
    applier[1] = 0x40000000;
    applier[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_124;
    applier[3] = &unk_1E4A2F5F0;
    v18 = a2;
    v17 = *(_OWORD *)(a1 + 32);
    xpc_array_apply(a3, applier);
    return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 0;
  }
  else
  {
    string = xpc_dictionary_get_string(a3, (const char *)*MEMORY[0x1E0C81270]);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = _tcc_util_create_CFError_with_user_info(2, CFSTR("Failed to get clients for services: %s"), string);
    v7 = tcc_log_handle();
    result = os_log_type_enabled(v7, OS_LOG_TYPE_ERROR);
    if (result)
    {
      ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1(v7, v9, v10, v11, v12, v13, v14, v15);
      return 0;
    }
  }
  return result;
}

BOOL ___tcc_server_send_get_authorization_records_by_services_block_invoke_124(uint64_t a1, uint64_t a2, void *a3)
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v5 = tcc_service_singleton_for_name(*(const char **)(a1 + 48));
  v6 = tcc_server_convert_xpc_object_to_record(a3, v5, 0, 0);
  v7 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (!v7)
  {
    v8 = v6;
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v8)
      tcc_release(v8);
  }
  return v7 == 0;
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_129(uint64_t a1)
{
  int v2;
  uint64_t v3;
  _xpc_connection_s *v4;
  void *v5;
  _QWORD *v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[5];
  __int128 v10;
  void *v11;
  int v12;
  _QWORD v13[4];
  __int128 v14;
  uint64_t v15;
  void *v16;
  int v17;

  v2 = *(_DWORD *)(a1 + 72);
  if (v2)
  {
    v3 = *(_QWORD *)(a1 + 48);
    v4 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 56) + 72);
    v13[0] = MEMORY[0x1E0C809B0];
    v13[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_2;
    v13[3] = &unk_1E4A2F668;
    v5 = *(void **)(a1 + 64);
    v13[1] = 0x40000000;
    v15 = v3;
    v16 = v5;
    v14 = *(_OWORD *)(a1 + 32);
    v17 = *(_DWORD *)(a1 + 76);
    v6 = v13;
  }
  else
  {
    v7 = _Block_copy(*(const void **)(a1 + 32));
    v5 = *(void **)(a1 + 64);
    v8 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 56) + 72);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 0x40000000;
    v9[2] = ___tcc_server_send_get_authorization_records_by_services_block_invoke_3;
    v9[3] = &unk_1E4A2F690;
    v9[4] = v7;
    v11 = v5;
    v10 = *(_OWORD *)(a1 + 40);
    v2 = *(_DWORD *)(a1 + 72);
    v12 = *(_DWORD *)(a1 + 76);
    v6 = v9;
    v4 = v8;
  }
  tccd_send_v2(v4, 0, v2, 0, v5, (uint64_t)v6);
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 56));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  else if (*(_DWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  _Block_release(*(const void **)(a1 + 40));
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_3(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  xpc_release(*(xpc_object_t *)(a1 + 56));
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    CFRelease(*(CFTypeRef *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24));
  }
  else if (*(_DWORD *)(a1 + 64))
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  _Block_release(*(const void **)(a1 + 40));
  _Block_release(*(const void **)(a1 + 32));
}

const char *OUTLINED_FUNCTION_6_0(xpc_object_t xdict, const char *key)
{
  return xpc_dictionary_get_string(xdict, key);
}

const char *OUTLINED_FUNCTION_7_0(char *key)
{
  void *v1;

  return xpc_dictionary_get_string(v1, key);
}

const __CFNumber *tcc_identity_create_from_external_representation(const void *a1)
{
  CFTypeID v2;
  const __CFNumber *Value;
  const __CFNumber *v4;
  CFTypeID v5;
  int v6;
  const __CFString *v7;
  const __CFString *v8;
  CFTypeID v9;
  const __CFString *v10;
  const __CFString *v11;
  CFTypeID v12;
  const __CFNumber *v13;
  unint64_t valuePtr;

  v2 = CFGetTypeID(a1);
  if (v2 != CFDictionaryGetTypeID())
    return 0;
  valuePtr = 0;
  Value = (const __CFNumber *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kTCCIdentityType);
  v4 = Value;
  if (!Value)
    return v4;
  v5 = CFGetTypeID(Value);
  if (v5 != CFNumberGetTypeID())
    return 0;
  v6 = CFNumberGetValue(v4, kCFNumberSInt64Type, &valuePtr);
  v4 = 0;
  if (v6 && valuePtr <= 3)
  {
    v7 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kTCCIdentityIdentifier);
    if (v7)
    {
      v8 = v7;
      v9 = CFGetTypeID(v7);
      if (v9 == CFStringGetTypeID())
      {
        v10 = (const __CFString *)CFDictionaryGetValue((CFDictionaryRef)a1, (const void *)kTCCIdentityCodeRequirementString);
        v11 = v10;
        if (!v10 || (v12 = CFGetTypeID(v10), v12 == CFStringGetTypeID()))
        {
          tcc_identity_alloc(88, (uint64_t)&identity_object_ops);
          v4 = v13;
          *((_QWORD *)v13 + 7) = valuePtr;
          *((_QWORD *)v13 + 8) = stringCopyUTF8String(v8);
          if (v11)
          {
            *((_QWORD *)v4 + 9) = 1;
            *((_QWORD *)v4 + 10) = stringCopyUTF8String(v11);
          }
          else
          {
            *((_QWORD *)v4 + 9) = 0;
          }
          return v4;
        }
      }
    }
    return 0;
  }
  return v4;
}

char *tcc_identity_set_verifier_code_requirement_string(uint64_t a1, char *__s1)
{
  char *result;

  result = strdup(__s1);
  *(_QWORD *)(a1 + 72) = 1;
  *(_QWORD *)(a1 + 80) = result;
  return result;
}

uint64_t tcc_identity_get_verifier_type(uint64_t a1)
{
  return *(_QWORD *)(a1 + 72);
}

uint64_t tcc_identity_get_verifier_code_requirement_string(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 72) == 1)
    return *(_QWORD *)(a1 + 80);
  else
    return 0;
}

CFDictionaryRef tcc_identity_copy_external_representation(uint64_t a1)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v3;
  CFNumberRef v4;
  CFNumberRef v5;
  CFStringRef v6;
  CFStringRef v7;
  CFDictionaryRef Copy;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9AEB8], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
    return 0;
  v3 = Mutable;
  v4 = CFNumberCreate(0, kCFNumberSInt64Type, (const void *)(a1 + 56));
  if (!v4)
  {
    Copy = 0;
    v7 = (CFStringRef)v3;
LABEL_16:
    CFRelease(v7);
    return Copy;
  }
  v5 = v4;
  CFDictionarySetValue(v3, (const void *)kTCCIdentityType, v4);
  v6 = CFStringCreateWithCString(0, *(const char **)(a1 + 64), 0x8000100u);
  if (!v6)
  {
    Copy = 0;
    v7 = 0;
    goto LABEL_13;
  }
  CFDictionarySetValue(v3, (const void *)kTCCIdentityIdentifier, v6);
  if (*(_QWORD *)(a1 + 72) != 1)
  {
    v7 = 0;
    goto LABEL_11;
  }
  v7 = CFStringCreateWithCString(0, *(const char **)(a1 + 80), 0x8000100u);
  if (v7)
  {
    CFDictionarySetValue(v3, (const void *)kTCCIdentityCodeRequirementString, v7);
LABEL_11:
    Copy = CFDictionaryCreateCopy(0, v3);
    goto LABEL_13;
  }
  Copy = 0;
LABEL_13:
  CFRelease(v3);
  CFRelease(v5);
  if (v6)
    CFRelease(v6);
  if (v7)
    goto LABEL_16;
  return Copy;
}

BOOL tcc_identity_type_and_identifiers_are_equal(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 56) == *(_QWORD *)(a2 + 56)
      && strcmp(*(const char **)(a1 + 64), *(const char **)(a2 + 64)) == 0;
}

__CFString *tcc_identity_copy_description(_QWORD *a1)
{
  __CFString *Mutable;

  Mutable = CFStringCreateMutable(0, 0);
  CFStringAppendFormat(Mutable, 0, CFSTR("%s/%llu"), a1[8], a1[7]);
  if (a1[9] == 1)
    CFStringAppendFormat(Mutable, 0, CFSTR(", %s"), a1[10]);
  return Mutable;
}

uint64_t tcc_identity_hash(uint64_t a1)
{
  uint64_t v2;
  void *no_copy;
  size_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v2 = *(_QWORD *)(a1 + 56);
  no_copy = (void *)xpc_string_create_no_copy();
  v4 = xpc_hash(no_copy) - v2 + 32 * v2;
  xpc_release(no_copy);
  v5 = *(_QWORD *)(a1 + 72);
  v6 = v5 - v4 + 32 * v4;
  if (v5 == 1)
  {
    v7 = (void *)xpc_string_create_no_copy();
    v6 = xpc_hash(v7) - v6 + 32 * v6;
    xpc_release(v7);
  }
  return v6;
}

void tcc_authorization_changed_for_service_notification_name_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void tcc_authorization_change_monitor_create_cold_1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 136315138;
  v2 = "tcc_authorization_change_monitor_create";
  _os_log_error_impl(&dword_1A364C000, log, OS_LOG_TYPE_ERROR, "%s: CFDictionaryCreateMutable failed", (uint8_t *)&v1, 0xCu);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_cold_1(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl(&dword_1A364C000, log, OS_LOG_TYPE_ERROR, "notify_register_dispatch(%{public}s) failed: %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2_cold_1(int *a1, NSObject *a2)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 136315394;
  v4 = "tcc_authorization_change_monitor_start_monitoring_service_block_invoke_2";
  v5 = 1024;
  v6 = v2;
  _os_log_fault_impl(&dword_1A364C000, a2, OS_LOG_TYPE_FAULT, "%s: Failed to get service for token %d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_0();
}

void _tcc_util_create_CFError_with_user_info_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a2, a3, "Created Error: %{public}@", a5, a6, a7, a8, 2u);
}

void _tcc_util_create_CFError_with_user_info_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a2, a3, "User Info string for a CFError is NULL; format: %{public}@",
    a5,
    a6,
    a7,
    a8,
    2u);
}

void tccd_send_message_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a2, a3, "send_message_with_reply_sync(): XPC_ERROR_CONNECTION_INVALID for message %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void tccd_send_message_cold_2(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1A364C000, log, OS_LOG_TYPE_FAULT, "Unable to allocate reply dictionary when message send limit reached.", v1, 2u);
  OUTLINED_FUNCTION_7();
}

void service_queue_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A364C000, a1, a3, "failed to create serial queue; processing concurrently",
    a5,
    a6,
    a7,
    a8,
    0);
  OUTLINED_FUNCTION_7();
}

void TCCAccessSetInternal_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%{public}s: failed to construct auth_value", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void _append_override_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_2(&dword_1A364C000, v0, v1, "%{public}s: Invalid type for override: %{public}@", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void tccd_reply_description_redacted_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A364C000, a1, a3, "Cannot redact xpc_object_t of unsupported type", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void __tccd_send_message_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a2, a3, "send_message_with_reply(): XPC_ERROR_CONNECTION_INVALID for message %p", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_0();
}

void TCCResetInternalWithConnection_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%{public}s: failed to read syncAuth option", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_request_with_endpoint_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "TCC authorization request (%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_preflight_with_endpoint_block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  tcc_service_get_name(*(_QWORD *)(a1 + 40));
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v1, "tcc_authorization_preflight(%{public}s) fails: %{public}@", v2, v3, v4, v5, 2u);
}

void __tcc_authorization_check_audit_token_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "TCC authorization request (%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_audit_token_request_change_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "TCC authorization audit token request change (%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_audit_token_report_use_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "(%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_request_change_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "TCC authorization request change (%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_authorization_set_access_with_prompt_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_0_2(&dword_1A364C000, MEMORY[0x1E0C81028], v0, "TCC authorization request change (%{public}s) fails: %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_0();
}

void tcc_authorization_cache_create_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%s: CFDictionaryCreateMutable failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void tcc_authorization_cache_create_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%s: tcc_authorization_change_monitor_create failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void tcc_authorization_cache_create_cold_3(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%s: os_state_add_handler failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void _tcc_authorization_cache_locked_set_authorization_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, a1, a3, "%s: CFDictionaryCreateMutable failed", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void tcc_authorization_cache_handle_authorization_changed_for_service_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  tcc_service_get_name(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A364C000, a2, v3, "%s: Failed to find cached authorizations for %{public}s", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

void tcc_authorization_cache_handle_authorization_changed_for_service_cold_2(uint8_t *buf, _QWORD *a2, os_log_t log)
{
  *(_DWORD *)buf = 136315138;
  *a2 = "_tcc_authorization_cache_copy_current_authorization";
  _os_log_error_impl(&dword_1A364C000, log, OS_LOG_TYPE_ERROR, "%s: failed to initialize server", buf, 0xCu);
}

void tcc_authorization_cache_handle_authorization_changed_for_service_clear_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4[6];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  tcc_service_get_name(a1);
  v4[0] = 136315394;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A364C000, a2, v3, "%s: Failed to find cached authorizations for %{public}s", (uint8_t *)v4);
  OUTLINED_FUNCTION_3();
}

void ___tcc_authorization_cache_copy_current_authorization_block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136315394;
  v4 = "_tcc_authorization_cache_copy_current_authorization_block_invoke";
  v5 = 2114;
  v6 = a1;
  OUTLINED_FUNCTION_2(&dword_1A364C000, a2, a3, "%s: authorization request failed with error: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void tcc_events_subscribe_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, v0, v1, "%{public}s subscribed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void tcc_events_subscribe_cold_2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, a2, a3, "Replaced subscription: %{public}s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void tcc_events_unsubscribe_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, v0, v1, "%{public}s unsubscribed", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void tcc_events_unsubscribe_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "Subscription not found: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  uint8_t v3[24];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x1E0C81270]);
  OUTLINED_FUNCTION_1_0();
  _os_log_error_impl(&dword_1A364C000, a2, OS_LOG_TYPE_ERROR, "Subscriber received error: %s", v3, 0xCu);
  OUTLINED_FUNCTION_3();
}

void ___tcc_events_initialize_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "Entitlement check reply failed: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "Invalid XPC event: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "No subscription found for %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_7()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "Invalid TCC event: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A364C000, v0, v1, "Failed to create TCC authorization record from XPC object: %{public}s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_9()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, v0, v1, "Subscriber received event: %s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_0();
}

void ___tcc_events_initialize_block_invoke_2_cold_10(const _xpc_type_s *a1, uint64_t a2, NSObject *a3)
{
  uint8_t v5[12];
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  xpc_type_get_name(a1);
  OUTLINED_FUNCTION_1_0();
  v6 = 2080;
  v7 = a2;
  _os_log_error_impl(&dword_1A364C000, a3, OS_LOG_TYPE_ERROR, "Subscriber received event of unexpected type %s: %s", v5, 0x16u);
  OUTLINED_FUNCTION_3();
}

void _tcc_server_send_request_authorization_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, a2, a3, "Using cached authorization: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_server_set_authorization_change_handler_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, a1, a3, "Called stub: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void __tcc_server_message_set_authorization_change_policy_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_2_0(&dword_1A364C000, a1, a3, "Called stub: %s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_request_authorization_block_invoke_3_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v2, v3, "%{public}s: %{public}s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_request_authorization_block_invoke_3_cold_2(NSObject *a1)
{
  int v2;
  int v3;
  const char *v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *__error();
  v3 = 136446466;
  v4 = "_tcc_server_send_request_authorization_block_invoke";
  v5 = 1024;
  v6 = v2;
  _os_log_error_impl(&dword_1A364C000, a1, OS_LOG_TYPE_ERROR, "%{public}s: sandbox_extension_consume():%d", (uint8_t *)&v3, 0x12u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_prompt_authorization_value_block_invoke_2_cold_1(void *a1, const char *a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_1(void *a1, const char *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v2, v3, "%{public}s: %{public}s", v4, v5, v6, v7, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = "_tcc_server_send_get_authorization_records_block_invoke";
  v5 = 2082;
  v6 = "Missing 'services' array in returned message.";
  OUTLINED_FUNCTION_2(&dword_1A364C000, a1, a3, "%{public}s: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_get_authorization_records_block_invoke_2_cold_3(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  __int16 v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 136446466;
  v4 = "_tcc_server_send_get_authorization_records_block_invoke";
  v5 = 2082;
  v6 = "Missing 'clients' array in returned message.";
  OUTLINED_FUNCTION_2(&dword_1A364C000, a1, a3, "%{public}s: %{public}s", (uint8_t *)&v3);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_1(void *a1, const char *a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_identity_for_credential_block_invoke_2_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  int v2[6];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 136446466;
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_2(&dword_1A364C000, v0, v1, "%{public}s: invalid reply for attribution request: %{public}s", (uint8_t *)v2);
  OUTLINED_FUNCTION_0();
}

void ___tcc_server_send_report_resource_use_block_invoke_2_cold_1(void *a1, const char *a2)
{
  char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v2 = (char *)OUTLINED_FUNCTION_6_0(a1, a2);
  OUTLINED_FUNCTION_7_0(v2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_1A364C000, v3, v4, "%{public}s: %{public}s", v5, v6, v7, v8, 2u);
  OUTLINED_FUNCTION_3();
}

void ___tcc_server_send_get_authorization_records_by_services_block_invoke_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1A364C000, a1, a3, "Failed to get clients for services", a5, a6, a7, a8, 0);
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

void CFArrayApplyFunction(CFArrayRef theArray, CFRange range, CFArrayApplierFunction applier, void *context)
{
  MEMORY[0x1E0C97D00](theArray, range.location, range.length, applier, context);
}

CFArrayRef CFArrayCreateCopy(CFAllocatorRef allocator, CFArrayRef theArray)
{
  return (CFArrayRef)MEMORY[0x1E0C97D30](allocator, theArray);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x1E0C97D98](theArray, idx);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFURLRef CFBundleCopyBundleURL(CFBundleRef bundle)
{
  return (CFURLRef)MEMORY[0x1E0C98000](bundle);
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x1E0C980D0](allocator, bundleURL);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFStringRef CFCopyDescription(CFTypeRef cf)
{
  return (CFStringRef)MEMORY[0x1E0C98350](cf);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

void CFDataGetBytes(CFDataRef theData, CFRange range, UInt8 *buffer)
{
  MEMORY[0x1E0C983F0](theData, range.location, range.length, buffer);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
}

CFDateRef CFDateCreate(CFAllocatorRef allocator, CFAbsoluteTime at)
{
  return (CFDateRef)MEMORY[0x1E0C98448](allocator, at);
}

CFAbsoluteTime CFDateGetAbsoluteTime(CFDateRef theDate)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C984D8](theDate);
  return result;
}

CFTypeID CFDateGetTypeID(void)
{
  return MEMORY[0x1E0C984E8]();
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

Boolean CFDictionaryContainsValue(CFDictionaryRef theDict, const void *value)
{
  return MEMORY[0x1E0C98520](theDict, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98538](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x1E0C98570](theDict);
}

void CFDictionaryGetKeysAndValues(CFDictionaryRef theDict, const void **keys, const void **values)
{
  MEMORY[0x1E0C985A0](theDict, keys, values);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

Boolean CFDictionaryGetValueIfPresent(CFDictionaryRef theDict, const void *key, const void **value)
{
  return MEMORY[0x1E0C985C8](theDict, key, value);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFHashCode CFHash(CFTypeRef cf)
{
  return MEMORY[0x1E0C98758](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFDataRef CFPropertyListCreateData(CFAllocatorRef allocator, CFPropertyListRef propertyList, CFPropertyListFormat format, CFOptionFlags options, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C98AA0](allocator, propertyList, format, options, error);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x1E0C98D98](allocator, capacity, callBacks);
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
  MEMORY[0x1E0C98DF0](theSet, value);
}

void CFStringAppend(CFMutableStringRef theString, CFStringRef appendedString)
{
  MEMORY[0x1E0C98ED8](theString, appendedString);
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x1E0C98EF0](theString, formatOptions, format);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x1E0C98F90](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormatAndArguments(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, va_list arguments)
{
  return (CFStringRef)MEMORY[0x1E0C99020](alloc, formatOptions, format, arguments);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

CFURLRef CFURLCreateWithBytes(CFAllocatorRef allocator, const UInt8 *URLBytes, CFIndex length, CFStringEncoding encoding, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99418](allocator, URLBytes, length, *(_QWORD *)&encoding, baseURL);
}

Boolean CFURLGetFileSystemRepresentation(CFURLRef url, Boolean resolveAgainstBase, UInt8 *buffer, CFIndex maxBufLen)
{
  return MEMORY[0x1E0C99490](url, resolveAgainstBase, buffer, maxBufLen);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
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

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcat_chk()
{
  return MEMORY[0x1E0C80C40]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
}

void _os_activity_initiate(void *dso, const char *description, os_activity_flag_t flags, os_block_t activity_block)
{
  MEMORY[0x1E0C80FD0](dso, description, *(_QWORD *)&flags, activity_block);
}

uint64_t _os_assert_log()
{
  return MEMORY[0x1E0C80FF0]();
}

uint64_t _os_crash()
{
  return MEMORY[0x1E0C81000]();
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

uint64_t _os_object_alloc()
{
  return MEMORY[0x1E0C81098]();
}

uint64_t _os_object_release()
{
  return MEMORY[0x1E0C810A0]();
}

uint64_t _os_object_release_internal()
{
  return MEMORY[0x1E0C810A8]();
}

uint64_t _os_object_retain()
{
  return MEMORY[0x1E0C810B0]();
}

uint64_t _os_object_retain_internal()
{
  return MEMORY[0x1E0C810B8]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint64_t abort_with_payload()
{
  return MEMORY[0x1E0C813B8]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x1E0C81608](a1, a2);
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
  MEMORY[0x1E0DE40C8](atoken, auidp, euidp, egidp, ruidp, rgidp, pidp, asidp);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_queue_t dispatch_queue_create_with_target_V2(const char *label, dispatch_queue_attr_t attr, dispatch_queue_t target)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E50](label, attr, target);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x1E0C82E98](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA8](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x1E0C84078](__s1, __s2, __n);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

void os_unfair_lock_assert_owner(const os_unfair_lock *lock)
{
  MEMORY[0x1E0C84990](lock);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x1E0C85440](__str, __size, __format);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

void xpc_array_append_value(xpc_object_t xarray, xpc_object_t value)
{
  MEMORY[0x1E0C85DE0](xarray, value);
}

BOOL xpc_array_apply(xpc_object_t xarray, xpc_array_applier_t applier)
{
  return MEMORY[0x1E0C85DF8](xarray, applier);
}

xpc_object_t xpc_array_create(xpc_object_t *objects, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C85E00](objects, count);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

xpc_object_t xpc_BOOL_create(BOOL value)
{
  return (xpc_object_t)MEMORY[0x1E0C85EF0](value);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FA0](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x1E0C86038](connection, message, replyq, handler);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

xpc_object_t xpc_copy(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C860E8](object);
}

char *__cdecl xpc_copy_description(xpc_object_t object)
{
  return (char *)MEMORY[0x1E0C86108](object);
}

xpc_object_t xpc_data_create(const void *bytes, size_t length)
{
  return (xpc_object_t)MEMORY[0x1E0C86178](bytes, length);
}

size_t xpc_data_get_bytes(xpc_object_t xdata, void *buffer, size_t off, size_t length)
{
  return MEMORY[0x1E0C86190](xdata, buffer, off, length);
}

const void *__cdecl xpc_data_get_bytes_ptr(xpc_object_t xdata)
{
  return (const void *)MEMORY[0x1E0C86198](xdata);
}

size_t xpc_data_get_length(xpc_object_t xdata)
{
  return MEMORY[0x1E0C861A8](xdata);
}

BOOL xpc_dictionary_apply(xpc_object_t xdict, xpc_dictionary_applier_t applier)
{
  return MEMORY[0x1E0C861F0](xdict, applier);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

size_t xpc_dictionary_get_count(xpc_object_t xdict)
{
  return MEMORY[0x1E0C86270](xdict);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

uint64_t xpc_dictionary_get_pointer()
{
  return MEMORY[0x1E0C862A8]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862D0](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x1E0C862F8]();
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

uint64_t xpc_dictionary_set_pointer()
{
  return MEMORY[0x1E0C86380]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x1E0C86398](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

size_t xpc_hash(xpc_object_t object)
{
  return MEMORY[0x1E0C86538](object);
}

xpc_object_t xpc_int64_create(int64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C86568](value);
}

xpc_object_t xpc_null_create(void)
{
  return (xpc_object_t)MEMORY[0x1E0C86628]();
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x1E0C86658](object);
}

xpc_object_t xpc_retain(xpc_object_t object)
{
  return (xpc_object_t)MEMORY[0x1E0C86660](object);
}

uint64_t xpc_set_event()
{
  return MEMORY[0x1E0C866E0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x1E0C866E8](stream, targetq, handler);
}

xpc_object_t xpc_string_create(const char *string)
{
  return (xpc_object_t)MEMORY[0x1E0C86720](string);
}

uint64_t xpc_string_create_no_copy()
{
  return MEMORY[0x1E0C86728]();
}

const char *__cdecl xpc_string_get_string_ptr(xpc_object_t xstring)
{
  return (const char *)MEMORY[0x1E0C86758](xstring);
}

const char *__cdecl xpc_type_get_name(xpc_type_t type)
{
  return (const char *)MEMORY[0x1E0C867A0](type);
}

xpc_object_t xpc_uint64_create(uint64_t value)
{
  return (xpc_object_t)MEMORY[0x1E0C867B0](value);
}

uint64_t xpc_uint64_get_value(xpc_object_t xuint)
{
  return MEMORY[0x1E0C867B8](xuint);
}

