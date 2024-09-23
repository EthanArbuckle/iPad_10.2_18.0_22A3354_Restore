id PLLogCamera()
{
  if (PLLogCamera_onceToken != -1)
    dispatch_once(&PLLogCamera_onceToken, &__block_literal_global);
  return (id)PLLogCamera___logObj;
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

void sub_1DA9DD338(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
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

id PLLogCoalition()
{
  if (PLLogCoalition_onceToken != -1)
    dispatch_once(&PLLogCoalition_onceToken, &__block_literal_global_0);
  return (id)PLLogCoalition___logObj;
}

void sub_1DA9E1B48(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1DA9E7E14(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a21, 8);
  _Block_object_dispose(&a27, 8);
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

void sub_1DA9E8E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

void OUTLINED_FUNCTION_0_0(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void NotificationCallback(uint64_t a1, void *a2)
{
  NSObject *v2;
  _QWORD block[5];
  _QWORD v4[5];
  id v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__2;
  v4[4] = __Block_byref_object_dispose__2;
  v5 = a2;
  dispatch_get_global_queue(-2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __NotificationCallback_block_invoke;
  block[3] = &unk_1EA16D4A8;
  block[4] = v4;
  dispatch_async(v2, block);

  _Block_object_dispose(v4, 8);
}

void sub_1DA9F0AF0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
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

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, uint64_t a2, uint64_t a3, const char *a4)
{
  NSObject *v4;
  uint8_t *v5;

  _os_log_debug_impl(a1, v4, OS_LOG_TYPE_DEBUG, a4, v5, 0xCu);
}

void OUTLINED_FUNCTION_10(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t OUTLINED_FUNCTION_12(uint64_t a1, uint64_t a2)
{
  return a2;
}

void sub_1DA9F0F2C(void *a1)
{
  uint64_t v1;

  MEMORY[0x1DF0A4230](v1, 0x10B1C40CB89C51DLL);
  objc_begin_catch(a1);
  objc_end_catch();
  JUMPOUT(0x1DA9F0F18);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_3_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_13_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void sub_1DA9F6AE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, os_log_type_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, a3, a4, a5, 0xCu);
}

void PowerChangedCallback(void *a1, uint64_t a2, uint64_t a3, intptr_t a4)
{
  unint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t i;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  id obj;
  id v54;
  _QWORD v55[5];
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  _QWORD v60[5];
  _QWORD v61[7];
  _QWORD v62[5];
  uint64_t v63;
  uint64_t *v64;
  uint64_t v65;
  uint64_t (*v66)(uint64_t, uint64_t);
  void (*v67)(uint64_t);
  id v68;
  _QWORD v69[5];
  _QWORD block[5];
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  _QWORD v77[2];
  _QWORD v78[2];
  _BYTE v79[128];
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v71 = 0;
  v72 = &v71;
  v73 = 0x3032000000;
  v74 = __Block_byref_object_copy__4;
  v75 = __Block_byref_object_dispose__4;
  v76 = a1;
  HIDWORD(v6) = a3;
  LODWORD(v6) = a3 + 536870288;
  switch((v6 >> 4))
  {
    case 0u:
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v7 = objc_opt_class();
        block[0] = MEMORY[0x1E0C809B0];
        block[1] = 3221225472;
        block[2] = __PowerChangedCallback_block_invoke;
        block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        block[4] = v7;
        if (PowerChangedCallback_defaultOnce != -1)
          dispatch_once(&PowerChangedCallback_defaultOnce, block);
        if (PowerChangedCallback_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep: start listening"));
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "lastPathComponent");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "logMessage:fromFile:fromFunction:fromLineNumber:", v8, v11, v12, 1126);

          PLLogCommon();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend((id)v72[5], "canSleepSemaphore");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "signalStartListening");

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v15 = objc_opt_class();
        v69[0] = MEMORY[0x1E0C809B0];
        v69[1] = 3221225472;
        v69[2] = __PowerChangedCallback_block_invoke_394;
        v69[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v69[4] = v15;
        if (PowerChangedCallback_defaultOnce_392 != -1)
          dispatch_once(&PowerChangedCallback_defaultOnce_392, v69);
        if (PowerChangedCallback_classDebugEnabled_393)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep: log entry"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "lastPathComponent");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 1128);

          PLLogCommon();
          v21 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      v63 = 0;
      v64 = &v63;
      v65 = 0x3032000000;
      v66 = __Block_byref_object_copy__4;
      v67 = __Block_byref_object_dispose__4;
      v68 = -[PLEventForwardPowerStateEntry initEntryWithIOMessage:]([PLEventForwardPowerStateEntry alloc], "initEntryWithIOMessage:", a3);
      objc_msgSend((id)v72[5], "logEntry:", v64[5]);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v22 = objc_opt_class();
        v62[0] = MEMORY[0x1E0C809B0];
        v62[1] = 3221225472;
        v62[2] = __PowerChangedCallback_block_invoke_399;
        v62[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v62[4] = v22;
        if (PowerChangedCallback_defaultOnce_397 != -1)
          dispatch_once(&PowerChangedCallback_defaultOnce_397, v62);
        if (PowerChangedCallback_classDebugEnabled_398)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep: begin block entry.id=%lld"), objc_msgSend((id)v64[5], "entryID"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "lastPathComponent");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "logMessage:fromFile:fromFunction:fromLineNumber:", v23, v26, v27, 1131);

          PLLogCommon();
          v28 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend((id)v72[5], "canSleepSemaphore");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = MEMORY[0x1E0C809B0];
      v61[0] = MEMORY[0x1E0C809B0];
      v61[1] = 3221225472;
      v61[2] = __PowerChangedCallback_block_invoke_402;
      v61[3] = &unk_1EA16D650;
      v61[4] = &v71;
      v61[5] = &v63;
      v61[6] = a4;
      objc_msgSend(v29, "waitWithBlock:", v61);

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v60[0] = v30;
        v60[1] = 3221225472;
        v60[2] = __PowerChangedCallback_block_invoke_407;
        v60[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v60[4] = objc_opt_class();
        if (PowerChangedCallback_defaultOnce_405 != -1)
          dispatch_once(&PowerChangedCallback_defaultOnce_405, v60);
        if (PowerChangedCallback_classDebugEnabled_406)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep: after block entry.id=%lld"), objc_msgSend((id)v64[5], "entryID"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "lastPathComponent");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "logMessage:fromFile:fromFunction:fromLineNumber:", v31, v34, v35, 1136);

          PLLogCommon();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      _Block_object_dispose(&v63, 8);

      break;
    case 1u:
      v37 = -[PLEventForwardPowerStateEntry initEntryWithIOMessage:]([PLEventForwardPowerStateEntry alloc], "initEntryWithIOMessage:", a3);
      objc_msgSend((id)v72[5], "logEntry:", v37);
      IOAllowPowerChange(objc_msgSend((id)v72[5], "rootDomainConnect"), a4);

      break;
    case 2u:
      v54 = -[PLEventForwardPowerStateEntry initEntryWithIOMessage:]([PLEventForwardPowerStateEntry alloc], "initEntryWithIOMessage:", a3);
      objc_msgSend((id)v72[5], "getSleepStatisticsApps");
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue();
      v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v79, 16);
      if (v38)
      {
        v39 = *(_QWORD *)v57;
        do
        {
          for (i = 0; i != v38; ++i)
          {
            if (*(_QWORD *)v57 != v39)
              objc_enumerationMutation(obj);
            v41 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
            v77[0] = CFSTR("PID");
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("PID"));
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v78[0] = v42;
            v77[1] = CFSTR("AppName");
            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("AppName"));
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v78[1] = v43;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v41, "objectForKeyedSubscript:", CFSTR("ResponseType"));
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v54, "setObject:forKeyedSubscript:", v45, v44);

          }
          v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v79, 16);
        }
        while (v38);
      }

      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v46 = objc_opt_class();
        v55[0] = MEMORY[0x1E0C809B0];
        v55[1] = 3221225472;
        v55[2] = __PowerChangedCallback_block_invoke_412;
        v55[3] = &__block_descriptor_40_e5_v8__0lu32l8;
        v55[4] = v46;
        if (PowerChangedCallback_defaultOnce_410 != -1)
          dispatch_once(&PowerChangedCallback_defaultOnce_410, v55);
        if (PowerChangedCallback_classDebugEnabled_411)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep: SystemWillNotSleep dict[kPLSWE_ResponseType] =%lld "), objc_msgSend(v54, "entryID"));
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "lastPathComponent");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PowerChangedCallback");
          v51 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "logMessage:fromFile:fromFunction:fromLineNumber:", v47, v50, v51, 1149);

          PLLogCommon();
          v52 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }
      objc_msgSend((id)v72[5], "logEntry:", v54);

      break;
    case 9u:
      objc_msgSend((id)v72[5], "systemPoweredOn");
      break;
    default:
      break;
  }
  _Block_object_dispose(&v71, 8);

}

void sub_1DA9FC98C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void fakeSleep(uint64_t a1, void *a2)
{
  id v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  PLEventForwardPowerStateEntry *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[4];
  id v40;
  _QWORD v41[5];
  _QWORD v42[5];
  _QWORD block[6];

  v2 = a2;
  v3 = objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled");
  v4 = MEMORY[0x1E0C809B0];
  if (v3)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __fakeSleep_block_invoke;
    block[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    block[4] = objc_opt_class();
    if (fakeSleep_defaultOnce != -1)
      dispatch_once(&fakeSleep_defaultOnce, block);
    if (fakeSleep_classDebugEnabled)
    {
      v5 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep Fake: start listening"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "lastPathComponent");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fakeSleep");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "logMessage:fromFile:fromFunction:fromLineNumber:", v6, v9, v10, 1084);

      PLLogCommon();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v4 = v5;
    }
  }
  objc_msgSend(v2, "canSleepSemaphore");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "signalStartListening");

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v42[0] = v4;
    v42[1] = 3221225472;
    v42[2] = __fakeSleep_block_invoke_362;
    v42[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v42[4] = objc_opt_class();
    if (fakeSleep_defaultOnce_360 != -1)
      dispatch_once(&fakeSleep_defaultOnce_360, v42);
    if (fakeSleep_classDebugEnabled_361)
    {
      v13 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep Fake: log entry"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "lastPathComponent");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fakeSleep");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "logMessage:fromFile:fromFunction:fromLineNumber:", v14, v17, v18, 1087);

      PLLogCommon();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v4 = v13;
    }
  }
  v20 = [PLEventForwardPowerStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withDate:](v20, "initEntryWithState:withEvent:withReason:withDate:", 1, 3, &unk_1EA1DB158, v21);

  objc_msgSend(v2, "logEntry:", v22);
  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v41[0] = v4;
    v41[1] = 3221225472;
    v41[2] = __fakeSleep_block_invoke_371;
    v41[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v41[4] = objc_opt_class();
    if (fakeSleep_defaultOnce_369 != -1)
      dispatch_once(&fakeSleep_defaultOnce_369, v41);
    if (fakeSleep_classDebugEnabled_370)
    {
      v23 = v4;
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep Fake: begin block entry.id=%lld"), objc_msgSend(v22, "entryID"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "lastPathComponent");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fakeSleep");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 1090);

      PLLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      v4 = v23;
    }
  }
  objc_msgSend(v2, "canSleepSemaphore");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = v4;
  v39[1] = 3221225472;
  v39[2] = __fakeSleep_block_invoke_374;
  v39[3] = &unk_1EA16D040;
  v31 = v22;
  v40 = v31;
  objc_msgSend(v30, "waitWithBlock:", v39);

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v38[0] = v4;
    v38[1] = 3221225472;
    v38[2] = __fakeSleep_block_invoke_379;
    v38[3] = &__block_descriptor_40_e5_v8__0lu32l8;
    v38[4] = objc_opt_class();
    if (fakeSleep_defaultOnce_377 != -1)
      dispatch_once(&fakeSleep_defaultOnce_377, v38);
    if (fakeSleep_classDebugEnabled_378)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Sleep Fake: after block entry.id=%lld"), objc_msgSend(v31, "entryID"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "lastPathComponent");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fakeSleep");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "logMessage:fromFile:fromFunction:fromLineNumber:", v32, v35, v36, 1095);

      PLLogCommon();
      v37 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }

}

void fakeWakeBB(uint64_t a1, void *a2)
{
  id v2;
  PLEventForwardPowerStateEntry *v3;
  id v4;
  id v5;

  v2 = a2;
  v3 = [PLEventForwardPowerStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withDate:](v3, "initEntryWithState:withEvent:withReason:withDate:", 0, 0, &unk_1EA1DB170, v5);
  objc_msgSend(v2, "logEntry:", v4);

}

void fakeWakeWiFi(uint64_t a1, void *a2)
{
  id v2;
  PLEventForwardPowerStateEntry *v3;
  id v4;
  id v5;

  v2 = a2;
  v3 = [PLEventForwardPowerStateEntry alloc];
  objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[PLEventForwardPowerStateEntry initEntryWithState:withEvent:withReason:withDate:](v3, "initEntryWithState:withEvent:withReason:withDate:", 0, 0, &unk_1EA1DB188, v5);
  objc_msgSend(v2, "logEntry:", v4);

}

uint64_t __fakeSleep_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  fakeSleep_classDebugEnabled = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_362(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  fakeSleep_classDebugEnabled_361 = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_371(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  fakeSleep_classDebugEnabled_370 = result;
  return result;
}

void __fakeSleep_block_invoke_374(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t block;
  uint64_t v12;
  uint64_t (*v13)(uint64_t);
  void *v14;
  uint64_t v15;

  if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
  {
    v2 = objc_opt_class();
    block = MEMORY[0x1E0C809B0];
    v12 = 3221225472;
    v13 = __fakeSleep_block_invoke_2;
    v14 = &__block_descriptor_40_e5_v8__0lu32l8;
    v15 = v2;
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_defaultOnce != -1)
      dispatch_once(&kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_defaultOnce, &block);
    if (kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_classDebugEnabled)
    {
      v3 = (void *)MEMORY[0x1E0CB3940];
      v4 = objc_msgSend(*(id *)(a1 + 32), "entryID");
      objc_msgSend(v3, "stringWithFormat:", CFSTR("Sleep Fake: block Done entry.id=%lld"), v4, block, v12, v13, v14, v15);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Software/PLSleepWakeAgent.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "lastPathComponent");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "fakeSleep_block_invoke");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "logMessage:fromFile:fromFunction:fromLineNumber:", v5, v8, v9, 1093);

      PLLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

    }
  }
}

uint64_t __fakeSleep_block_invoke_2(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  kPLSleepWakeAgentEventPointNameScheduledWakeProcessName_block_invoke_3_classDebugEnabled = result;
  return result;
}

uint64_t __fakeSleep_block_invoke_379(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D7FFA0], "isClassDebugEnabled:", *(_QWORD *)(a1 + 32));
  fakeSleep_classDebugEnabled_378 = result;
  return result;
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

void sub_1DAA063C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_3_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void myRelease(int a1, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

id PLLogUrsa()
{
  if (PLLogUrsa_onceToken != -1)
    dispatch_once(&PLLogUrsa_onceToken, &__block_literal_global_130);
  return (id)PLLogUrsa___logObj;
}

id PLLogComputeSafeguards()
{
  if (PLLogComputeSafeguards_onceToken != -1)
    dispatch_once(&PLLogComputeSafeguards_onceToken, &__block_literal_global_140);
  return (id)PLLogComputeSafeguards___logObj;
}

id PLLogPowerMetricMonitor()
{
  if (PLLogPowerMetricMonitor_onceToken != -1)
    dispatch_once(&PLLogPowerMetricMonitor_onceToken, &__block_literal_global_6);
  return (id)PLLogPowerMetricMonitor_log;
}

id PLLogPowerSignpost()
{
  if (PLLogPowerSignpost_onceToken != -1)
    dispatch_once(&PLLogPowerSignpost_onceToken, &__block_literal_global_48);
  return (id)PLLogPowerSignpost_log;
}

void sub_1DAA1C278(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA1C364(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA1C458(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA1F238(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id *location, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,id a40)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a40);
  _Unwind_Resume(a1);
}

void sub_1DAA20D18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_3_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_7_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_11_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_12_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_13_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1DAA26D64(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLLogCommon()
{
  if (PLLogCommon_onceToken != -1)
    dispatch_once(&PLLogCommon_onceToken, &__block_literal_global_489);
  return (id)PLLogCommon___logObj;
}

id PLLogZlib()
{
  if (PLLogZlib_onceToken != -1)
    dispatch_once(&PLLogZlib_onceToken, &__block_literal_global_498);
  return (id)PLLogZlib___logObj;
}

void sub_1DAA2859C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,char a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a23, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__6(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__6(uint64_t a1)
{

}

void sub_1DAA29020(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLLogPower()
{
  if (PLLogPower_onceToken != -1)
    dispatch_once(&PLLogPower_onceToken, &__block_literal_global_492);
  return (id)PLLogPower___logObj;
}

id PLLogSubmission()
{
  if (PLLogSubmission_onceToken != -1)
    dispatch_once(&PLLogSubmission_onceToken, &__block_literal_global_494);
  return (id)PLLogSubmission___logObj;
}

id PLLogSQLiteConnection()
{
  if (PLLogSQLiteConnection_onceToken != -1)
    dispatch_once(&PLLogSQLiteConnection_onceToken, &__block_literal_global_496);
  return (id)PLLogSQLiteConnection___logObj;
}

void PLEmitPowerSignpost(void *a1, void *a2, void *a3, void *a4)
{
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  int v12;
  id v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _BOOL4 v18;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  if (v9)
  {
    v11 = objc_retainAutorelease(v9);
    v12 = strcmp((const char *)objc_msgSend(v11, "objCType"), "f");
    v13 = objc_retainAutorelease(v11);
    v14 = (const char *)objc_msgSend(v13, "objCType");
    if (!v12 || !strcmp(v14, "d"))
    {
      v15 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(v13, "doubleValue");
      objc_msgSend(v15, "stringWithFormat:", CFSTR("%.6e"), v16);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), objc_msgSend(v13, "intValue"));
    }
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = os_signpost_enabled(v7);
    if (v10)
    {
      if (v18)
        goto LABEL_10;
    }
    else if (v18)
    {
LABEL_10:
      _os_signpost_emit_unreliably_with_name_impl();
    }

  }
}

void PLEmitSystemPowerSignpost()
{
  NSObject *v0;

  PLLogPower();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_ERROR))
    PLEmitSystemPowerSignpost_cold_1();

}

void __stringIsUUID_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3500], "characterSetWithCharactersInString:", CFSTR("0123456789ABCDEFabcdef"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)stringIsUUID_hexChars;
  stringIsUUID_hexChars = v0;

}

void OUTLINED_FUNCTION_8_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

void logRunStateNotificationReceived(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = *MEMORY[0x1E0D80378];
    v3 = a2;
    +[PLOperator entryKeyForType:andName:](PLARKitAgent, "entryKeyForType:andName:", v2, CFSTR("State"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("State");
    v8[0] = &unk_1EA1BFE88;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v5);
    objc_msgSend(v3, "logEntry:", v6);

  }
}

void logPauseStateNotificationReceived(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v2 = *MEMORY[0x1E0D80378];
    v3 = a2;
    +[PLOperator entryKeyForType:andName:](PLARKitAgent, "entryKeyForType:andName:", v2, CFSTR("State"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = CFSTR("State");
    v8[0] = &unk_1EA1BFEA0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7FFB0]), "initWithEntryKey:withRawData:", v4, v5);
    objc_msgSend(v3, "logEntry:", v6);

  }
}

id PLLogAggregateSummarizationService()
{
  if (PLLogAggregateSummarizationService_onceToken != -1)
    dispatch_once(&PLLogAggregateSummarizationService_onceToken, &__block_literal_global_8);
  return (id)PLLogAggregateSummarizationService___logObj;
}

id PLLogScreenState()
{
  if (PLLogScreenState_onceToken != -1)
    dispatch_once(&PLLogScreenState_onceToken, &__block_literal_global_9);
  return (id)PLLogScreenState___logObj;
}

void sub_1DAA3B514(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_6_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

void OUTLINED_FUNCTION_7_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 8u);
}

void OUTLINED_FUNCTION_11_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xEu);
}

uint64_t OUTLINED_FUNCTION_15_1()
{
  void *v0;

  return objc_msgSend(v0, "lastDisplayLayoutContainsLockScreen");
}

id PLLogApplication()
{
  if (PLLogApplication_onceToken != -1)
    dispatch_once(&PLLogApplication_onceToken, &__block_literal_global_10);
  return (id)PLLogApplication___logObj;
}

void sub_1DAA3C5C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAA3C6B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAA3C738(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAA40EC4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 232));
  _Unwind_Resume(a1);
}

uint64_t TestRefreshAllAppsAndPlugins(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "refreshAllAppsAndPlugins");
}

void sub_1DAA44024(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA475E0(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__8(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__8(uint64_t a1)
{

}

void sub_1DAA47A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,char a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,char a46)
{
  _Block_object_dispose(&a40, 8);
  _Block_object_dispose(&a46, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA47DB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

void sub_1DAA48104(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
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

id PLLogSMC()
{
  if (PLLogSMC_onceToken != -1)
    dispatch_once(&PLLogSMC_onceToken, &__block_literal_global_11);
  return (id)PLLogSMC___logObj;
}

void sub_1DAA50BF4(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 104));
  _Unwind_Resume(a1);
}

void sub_1DAA51674(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
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

void OUTLINED_FUNCTION_3_4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_11_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0xEu);
}

void OUTLINED_FUNCTION_13_3(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_1DAA63170(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id PLLogPush()
{
  if (PLLogPush_onceToken != -1)
    dispatch_once(&PLLogPush_onceToken, &__block_literal_global_13);
  return (id)PLLogPush___logObj;
}

void sub_1DAA6EA58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, ...)
{
  va_list va;

  va_start(va, a8);
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

void testLogEvents(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
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
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  _QWORD v51[3];
  const __CFString *v52;
  void *v53;
  _QWORD v54[2];
  _QWORD v55[2];
  _QWORD v56[2];
  _QWORD v57[2];
  _QWORD v58[2];
  _QWORD v59[2];
  _QWORD v60[2];
  _QWORD v61[2];
  _QWORD v62[2];
  _QWORD v63[2];
  _QWORD v64[2];
  _QWORD v65[2];
  _QWORD v66[2];
  _QWORD v67[2];
  _QWORD v68[2];
  _QWORD v69[2];
  _QWORD v70[2];
  _QWORD v71[2];
  _QWORD v72[9];
  _QWORD v73[3];
  _QWORD v74[3];
  _QWORD v75[2];
  _QWORD v76[2];
  _QWORD v77[2];
  _QWORD v78[2];
  _QWORD v79[2];
  _QWORD v80[3];
  _QWORD v81[3];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[4];
  _QWORD v88[6];

  v88[4] = *MEMORY[0x1E0C80C00];
  v87[0] = CFSTR("bundleID");
  v87[1] = CFSTR("updateType");
  v88[0] = CFSTR("cloudphotod");
  v88[1] = &unk_1EA1C0548;
  v87[2] = CFSTR("eventIntervals");
  v84[0] = CFSTR("startDate");
  v2 = (void *)MEMORY[0x1E0C99D68];
  v50 = a2;
  objc_msgSend(v2, "dateWithTimeIntervalSince1970:", 0.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = CFSTR("endDate");
  v85[0] = v3;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 3.0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v85[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v86[0] = v5;
  v82[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 8.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = CFSTR("endDate");
  v83[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 25.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v83[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v86, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v87[3] = CFSTR("childBundleIDToWeight");
  v88[2] = v9;
  v88[3] = &unk_1EA1D8080;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v88, v87, 4);
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  v80[0] = CFSTR("bundleID");
  v80[1] = CFSTR("updateType");
  v81[0] = CFSTR("com.apple.bird");
  v81[1] = &unk_1EA1C0548;
  v80[2] = CFSTR("eventIntervals");
  v77[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v78[0] = v10;
  v77[1] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 5.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v78[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v78, v77, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v79[0] = v12;
  v75[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 7.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v76[0] = v13;
  v75[1] = CFSTR("endDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 12.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v76[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v76, v75, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v79[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v79, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v81[2] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 3);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v73[0] = CFSTR("bundleID");
  v73[1] = CFSTR("updateType");
  v74[0] = CFSTR("nsurlsessiond");
  v74[1] = &unk_1EA1C0548;
  v73[2] = CFSTR("eventIntervals");
  v70[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 0.0);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = CFSTR("endDate");
  v71[0] = v47;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v71[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, v70, 2);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v72[0] = v45;
  v68[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v68[1] = CFSTR("endDate");
  v69[0] = v44;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v69[1] = v43;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v69, v68, 2);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v72[1] = v42;
  v66[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v66[1] = CFSTR("endDate");
  v67[0] = v41;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v40;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v67, v66, 2);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v72[2] = v39;
  v64[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 1.0);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v64[1] = CFSTR("endDate");
  v65[0] = v38;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 2.0);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v65[1] = v37;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v65, v64, 2);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v72[3] = v36;
  v62[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 2.0);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = CFSTR("endDate");
  v63[0] = v35;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 7.0);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v63[1] = v34;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v63, v62, 2);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v72[4] = v33;
  v60[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 7.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v60[1] = CFSTR("endDate");
  v61[0] = v32;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 14.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v61[1] = v31;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v61, v60, 2);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v72[5] = v30;
  v58[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 20.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = CFSTR("endDate");
  v59[0] = v29;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 24.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v59[1] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v59, v58, 2);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v72[6] = v18;
  v56[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 27.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v56[1] = CFSTR("endDate");
  v57[0] = v19;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 34.0);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v57[1] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v57, v56, 2);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v72[7] = v21;
  v54[0] = CFSTR("startDate");
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 34.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v54[1] = CFSTR("endDate");
  v55[0] = v22;
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSince1970:", 40.0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v55[1] = v23;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v72[8] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 9);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v74[2] = v25;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v74, v73, 3);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  v51[0] = v49;
  v51[1] = v48;
  v51[2] = v28;
  v52 = CFSTR("events");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 3);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = v26;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v50, "didReceiveEventWithPayload:", v27);
}

void testReportEnergy(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;

  objc_msgSend(a2, "energyResponse");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("energyResponse=%@"), v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0D7FF98];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "lastPathComponent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testReportEnergy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "logMessage:fromFile:fromFunction:fromLineNumber:", v3, v6, v7, 684);

  PLLogCommon();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

}

uint64_t testStartEvent(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveStartEventWithPayload:", &unk_1EA1D80D0);
}

uint64_t testStartEvent2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveStartEventWithPayload:", &unk_1EA1D8120);
}

id testStopEvent(uint64_t a1, void *a2)
{
  return (id)objc_msgSend(a2, "didReceiveStopEventWithPayload:", &unk_1EA1D8170);
}

void testStopEvent2(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[2];
  _QWORD v7[2];
  _QWORD v8[2];
  _QWORD v9[3];

  v9[2] = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v8[1] = CFSTR("info");
  v9[0] = CFSTR("diagnosticd");
  v6[0] = &unk_1EA1C0548;
  v6[1] = &unk_1EA1C0590;
  v7[0] = &unk_1EA1DA9E8;
  v7[1] = &unk_1EA1DA9F8;
  v8[0] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v9[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, v8, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (id)objc_msgSend(v2, "didReceiveStopEventWithPayload:", v4);

}

uint64_t testReset(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "didReceiveReset");
}

void testCapping(uint64_t a1, void *a2)
{
  id v2;
  unsigned int v3;
  double v4;
  unsigned int v5;
  double v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  unsigned int v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = 0;
  v4 = 0.0;
  do
  {
    v16 = v3;
    v5 = -20;
    v6 = 0.0;
    do
    {
      objc_msgSend(v2, "capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:", v4, 90.0, 1.0, 30.0);
      v8 = v7;
      objc_msgSend(v2, "capUtilizationInSeconds:withUpperBoundInError:withCapInError:withCappedUpperBound:", v6, 90.0, 10.0, 30.0);
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f, %f => %f, %f"), *(_QWORD *)&v4, *(_QWORD *)&v6, v8, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)MEMORY[0x1E0D7FF98];
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Services/PLDuetService.m");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "lastPathComponent");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "testCappingWithInput");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logMessage:fromFile:fromFunction:fromLineNumber:", v10, v13, v14, 1034);

      PLLogCommon();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v18 = v10;
        _os_log_debug_impl(&dword_1DA9D6000, v15, OS_LOG_TYPE_DEBUG, "%@", buf, 0xCu);
      }

      v6 = v6 + 20.0;
      v5 += 20;
    }
    while (v5 < 0xB4);
    v4 = v4 + 20.0;
    v3 = v16 + 20;
  }
  while (v16 < 0xB4);

}

_BYTE *OUTLINED_FUNCTION_9_2(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t OUTLINED_FUNCTION_11_3(void *a1, const char *a2)
{
  return objc_msgSend(a1, "timeIntervalSince1970");
}

id PLLogNetwork()
{
  if (PLLogNetwork_onceToken != -1)
    dispatch_once(&PLLogNetwork_onceToken, &__block_literal_global_15);
  return (id)PLLogNetwork___logObj;
}

void sub_1DAA7EEC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,char a59)
{
  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a59, 8);
  _Unwind_Resume(a1);
}

void sub_1DAA8E0CC(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1DAA8E09CLL);
  }
  objc_exception_rethrow();
}

void sub_1DAA8E0F0(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

id PLLogProcessMonitor()
{
  if (PLLogProcessMonitor_onceToken != -1)
    dispatch_once(&PLLogProcessMonitor_onceToken, &__block_literal_global_19);
  return (id)PLLogProcessMonitor___logObj;
}

void sub_1DAA9668C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,void *a27)
{

  _Unwind_Resume(a1);
}

char *OUTLINED_FUNCTION_14_2(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_15_2()
{
  return __error();
}

id PLLogWifi()
{
  if (PLLogWifi_onceToken != -1)
    dispatch_once(&PLLogWifi_onceToken, &__block_literal_global_20);
  return (id)PLLogWifi___logObj;
}

void WiFiDeviceAttached(uint64_t a1, uint64_t a2, void *a3)
{
  id v3;
  NSObject *v4;
  id v5;
  _QWORD block[4];
  id v7;

  v3 = a3;
  objc_msgSend(v3, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __WiFiDeviceAttached_block_invoke;
  block[3] = &unk_1EA16D040;
  v7 = v3;
  v5 = v3;
  dispatch_async(v4, block);

}

void WiFiVirtualInterfaceCallback(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD block[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v4 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__11;
  v22 = __Block_byref_object_dispose__11;
  v23 = a2;
  v5 = (void *)v19[5];
  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("LINK_CHANGED_IS_LINKDOWN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v4, "workQueue");
      v7 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __WiFiVirtualInterfaceCallback_block_invoke;
      block[3] = &unk_1EA16FAA8;
      v16 = v4;
      v17 = &v18;
      dispatch_async(v7, block);

    }
  }
  v8 = (void *)v19[5];
  if (v8)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x1E0D4FE30]);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      objc_msgSend((id)v19[5], "objectForKeyedSubscript:", *MEMORY[0x1E0D4FE28]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v4, "workQueue");
        v11 = objc_claimAutoreleasedReturnValue();
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __WiFiVirtualInterfaceCallback_block_invoke_2;
        v12[3] = &unk_1EA16FAA8;
        v13 = v4;
        v14 = &v18;
        dispatch_async(v11, v12);

      }
    }
  }
  _Block_object_dispose(&v18, 8);

}

void sub_1DAAA7914(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiStateChangeCallback(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "logFromCFCallback:", CFSTR("WiFiStateChangeCallback"));
}

uint64_t WiFiLinkChangeCallback(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "logFromLinkChangeCallback:withStats:", CFSTR("WiFiLinkChangeCallback"), a2);
}

void WiFiDeviceAvailableCallback(uint64_t a1, const __CFDictionary *a2, void *a3)
{
  const __CFBoolean *Value;
  void *v5;
  id v6;

  v6 = a3;
  if (a2)
  {
    Value = (const __CFBoolean *)CFDictionaryGetValue(a2, CFSTR("DRIVER_AVAILABLE"));
    if (CFBooleanGetValue(Value))
    {
      if (CFDictionaryContainsKey(a2, CFSTR("IO80211InterfaceWoWWakeUpParams")))
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", CFDictionaryGetValue(a2, CFSTR("IO80211InterfaceWoWWakeUpParams")), 1);
      else
        v5 = 0;
      objc_msgSend(v6, "logFromWiFiNoAvailableCallback:withAvailability:withWakeParams:", CFSTR("WiFiDeviceAvailableCallback"), 1, v5);

    }
  }

}

void WiFiClientScanCacheCallback(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, void *a5)
{
  CFTypeID TypeID;
  id v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__11;
  v18 = __Block_byref_object_dispose__11;
  v19 = a5;
  if (a2)
  {
    TypeID = CFDictionaryGetTypeID();
    if (TypeID == CFGetTypeID(a2))
    {
      CFRetain(a2);
      v7 = a2;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithDictionary:", v7);
      v8 = objc_claimAutoreleasedReturnValue();
      v9 = (void *)v8;
      if (v15[5] && v8)
      {
        CFRelease(v7);
        objc_msgSend((id)v15[5], "workQueue");
        v10 = objc_claimAutoreleasedReturnValue();
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __WiFiClientScanCacheCallback_block_invoke;
        v11[3] = &unk_1EA16D8F8;
        v13 = &v14;
        v12 = v9;
        dispatch_async(v10, v11);

      }
    }
  }
  _Block_object_dispose(&v14, 8);

}

void sub_1DAAA81E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WiFiManagerClientUserAutoJoinStateChangedCallback1(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  return objc_msgSend(a4, "logFromAJCallback:withFlag:withStats:", CFSTR("WiFiManagerClientUserAutoJoinStateChangedCallback"), a2, a3);
}

void WiFiDeviceLinkQualityChanged(uint64_t a1, void *a2, void *a3)
{
  id v4;
  uint64_t v5;
  id v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "remainingAllowedRSSIEntryCount");
  if (a2 && v5)
  {
    v6 = a2;
    objc_msgSend(v4, "workQueue");
    v7 = objc_claimAutoreleasedReturnValue();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __WiFiDeviceLinkQualityChanged_block_invoke;
    v9[3] = &unk_1EA16D948;
    v10 = v4;
    v11 = v6;
    v8 = v6;
    dispatch_async(v7, v9);

  }
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

id PLLogBatteryGaugeService()
{
  if (PLLogBatteryGaugeService_onceToken != -1)
    dispatch_once(&PLLogBatteryGaugeService_onceToken, &__block_literal_global_21);
  return (id)PLLogBatteryGaugeService_log;
}

void sub_1DAAB9960(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAAB9ADC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABC7D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
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

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_5_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x26u);
}

void OUTLINED_FUNCTION_8_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x26u);
}

void sub_1DAABD648(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1DAABDD7C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABE100(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABE3AC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABE66C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABE924(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABEBDC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABED8C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF11C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF2A0(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF440(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF5D8(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF6DC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

void sub_1DAABF874(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___Sync___"));
  _Unwind_Resume(a1);
}

id PLLogXPC()
{
  if (PLLogXPC_onceToken != -1)
    dispatch_once(&PLLogXPC_onceToken, &__block_literal_global_23);
  return (id)PLLogXPC___logObj;
}

void sub_1DAAE7880(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_13_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_17(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void fsEventsHandler(uint64_t a1, void *a2, uint64_t a3, void *a4, uint64_t a5)
{
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  id v14;

  v14 = a4;
  if (a3)
  {
    v7 = 0;
    do
    {
      if ((~*(_DWORD *)(a5 + 4 * v7) & 0x10100) == 0)
      {
        objc_msgSend(v14, "objectAtIndexedSubscript:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "lastPathComponent");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if ((~*(_DWORD *)(a5 + 4 * v7) & 0x900) == 0)
        {
          objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "count") == 4)
          {
            objc_msgSend(v10, "objectAtIndexedSubscript:", 1);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = objc_msgSend(v11, "isEqualToString:", CFSTR("microstackshots"));

            if (v12)
              objc_msgSend(a2, "logLogFileName:withName:", CFSTR("microstackshots"), v9);
          }

        }
      }
      ++v7;
    }
    while (a3 != v7);
  }

}

void PLProcessCPU::PLProcessCPU(PLProcessCPU *this)
{
  os_log_t v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  size_t v7;
  size_t count;

  *(_QWORD *)this = &off_1EA170738;
  *(_OWORD *)((char *)this + 8) = 0u;
  *(_OWORD *)((char *)this + 24) = 0u;
  *((_DWORD *)this + 10) = 1065353216;
  *((_OWORD *)this + 3) = 0u;
  *((_OWORD *)this + 4) = 0u;
  *((_DWORD *)this + 20) = 1065353216;
  *((_QWORD *)this + 19) = 0;
  v2 = os_log_create("com.apple.powerlog", "PLProcessCPU");
  v3 = (void *)*((_QWORD *)this + 19);
  *((_QWORD *)this + 19) = v2;

  LODWORD(count) = 0;
  *((_DWORD *)this + 27) = 0;
  *((_DWORD *)this + 28) = 0;
  *((_QWORD *)this + 17) = 0x100000000;
  *((_BYTE *)this + 144) = 1;
  v4 = mach_absolute_time();
  *((_QWORD *)this + 15) = v4;
  *((_QWORD *)this + 16) = v4;
  v7 = 4;
  sysctlbyname("kern.maxproc", &count, &v7, 0, 0);
  *((_QWORD *)this + 11) = malloc_type_calloc((int)count, 4uLL, 0x100004052888210uLL);
  v5 = malloc_type_calloc((int)count, 4uLL, 0x100004052888210uLL);
  *((_QWORD *)this + 12) = v5;
  *((_DWORD *)this + 26) = 4 * count;
  v6 = *((_QWORD *)this + 19);
  if (!*((_QWORD *)this + 11) || !v5)
  {
    if (os_log_type_enabled(*((os_log_t *)this + 19), OS_LOG_TYPE_ERROR))
      PLProcessCPU::PLProcessCPU(v6);
    __cxa_rethrow();
  }
  if (os_log_type_enabled(*((os_log_t *)this + 19), OS_LOG_TYPE_DEBUG))
    PLProcessCPU::PLProcessCPU(v6);
}

void sub_1DAAEB5A8(_Unwind_Exception *a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;

  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table(v3);
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(v2);
  _Unwind_Resume(a1);
}

void PLProcessCPU::~PLProcessCPU(void **this)
{
  *this = &off_1EA170738;
  free(this[11]);
  free(this[12]);

  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table((uint64_t)(this + 6));
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table((uint64_t)(this + 1));
}

void PLProcessCPU::findMissing(PLProcessCPU *this@<X0>, char **a2@<X8>)
{
  uint64_t v3;
  unint64_t v5;
  char *v7;
  unint64_t v8;
  uint64_t v9;
  _QWORD *v10;
  uint64_t v11;
  uint64_t v12;
  int v13;
  char *v14;
  char *v15;
  uint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  char *v20;
  char *v21;
  int v22;

  *a2 = 0;
  a2[1] = 0;
  a2[2] = 0;
  v3 = *((unsigned int *)this + *((int *)this + 35) + 27);
  if ((_DWORD)v3)
  {
    v5 = *((unsigned int *)this + *((int *)this + 34) + 27);
    if ((int)v5 >= 1 && (int)v3 >= 1)
    {
      v7 = 0;
      v8 = 0;
      LODWORD(v9) = 0;
      v10 = a2 + 2;
      do
      {
        v11 = v5 - v8;
        v9 = (int)v9;
        while (1)
        {
          v12 = *((_QWORD *)this + *((int *)this + 35) + 11);
          v13 = *(_DWORD *)(v12 + 4 * v9);
          if (*(_DWORD *)(*((_QWORD *)this + *((int *)this + 34) + 11) + 4 * v8) == v13)
            break;
          if (v11 >= v3 - v9)
            goto LABEL_31;
          if ((unint64_t)v7 >= *v10)
          {
            v15 = *a2;
            v16 = (v7 - *a2) >> 2;
            v17 = v16 + 1;
            if ((unint64_t)(v16 + 1) >> 62)
              std::vector<int>::__throw_length_error[abi:ne180100]();
            v18 = *v10 - (_QWORD)v15;
            if (v18 >> 1 > v17)
              v17 = v18 >> 1;
            if ((unint64_t)v18 >= 0x7FFFFFFFFFFFFFFCLL)
              v19 = 0x3FFFFFFFFFFFFFFFLL;
            else
              v19 = v17;
            if (v19)
            {
              v20 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<int>>((uint64_t)(a2 + 2), v19);
              v15 = *a2;
              v7 = a2[1];
              v13 = *(_DWORD *)(v12 + 4 * v9);
            }
            else
            {
              v20 = 0;
            }
            v21 = &v20[4 * v16];
            *(_DWORD *)v21 = v13;
            v14 = v21 + 4;
            while (v7 != v15)
            {
              v22 = *((_DWORD *)v7 - 1);
              v7 -= 4;
              *((_DWORD *)v21 - 1) = v22;
              v21 -= 4;
            }
            *a2 = v21;
            a2[1] = v14;
            a2[2] = &v20[4 * v19];
            if (v15)
              operator delete(v15);
          }
          else
          {
            *(_DWORD *)v7 = v13;
            v14 = v7 + 4;
          }
          a2[1] = v14;
          ++v9;
          v7 = v14;
          if (v9 >= v3)
            return;
        }
        if ((_DWORD)v3 - (_DWORD)v9 == (_DWORD)v11)
          return;
        LODWORD(v9) = v9 + 1;
LABEL_31:
        ++v8;
      }
      while (v8 < v5 && (int)v9 < (int)v3);
    }
  }
}

void sub_1DAAEB7D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  void *v3;

  v3 = *(void **)v1;
  if (*(_QWORD *)v1)
  {
    *(_QWORD *)(v1 + 8) = v3;
    operator delete(v3);
  }
  _Unwind_Resume(exception_object);
}

void PLProcessCPU::cleanupDeadPids(PLProcessCPU *this)
{
  int *v2;
  int *v3;
  _QWORD *v4;
  char *v5;
  uint64_t *v6;
  _QWORD *v7;
  int v8;
  char *v9;
  char *v10;
  _QWORD *v11;

  PLProcessCPU::findMissing(this, &v9);
  v2 = (int *)v9;
  v3 = (int *)v10;
  if (v9 != v10)
  {
    v4 = (_QWORD *)((char *)this + 8);
    v5 = (char *)this + 48;
    do
    {
      v8 = *v2;
      v6 = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(v4, &v8);
      if (v6)
      {
        v11 = v6 + 3;
        v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)v5, (unint64_t *)v6 + 3, (uint64_t)&std::piecewise_construct, &v11);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v7 + 3, &v8);
        std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v4, &v8);
      }
      ++v2;
    }
    while (v2 != v3);
    v2 = (int *)v9;
  }
  if (v2)
  {
    v10 = (char *)v2;
    operator delete(v2);
  }
}

void sub_1DAAEB8B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, void *__p, uint64_t a11)
{
  if (__p)
    operator delete(__p);
  _Unwind_Resume(exception_object);
}

__darwin_ino64_t PLProcessCPU::getInode(PLProcessCPU *this, const char *a2)
{
  stat v3;

  if (stat(a2, &v3) == -1)
    return -1;
  else
    return v3.st_ino;
}

char *PLProcessCPU::getName(PLProcessCPU *this, char *a2)
{
  return basename(a2);
}

unint64_t PLProcessCPU::updateInodeMap(PLProcessCPU *this, int *a2)
{
  uint64_t v4;
  _QWORD *v5;
  _QWORD *v6;
  char *v7;
  void **v8;
  _QWORD *exception;
  _QWORD *v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  _QWORD buffer[129];

  buffer[128] = *MEMORY[0x1E0C80C00];
  if (*a2)
  {
    if (!proc_pidpath(*a2, buffer, 0x400u))
    {
      exception = __cxa_allocate_exception(8uLL);
      *exception = "Unable to get path for pid, or process terminated";
      __cxa_throw(exception, MEMORY[0x1E0DE4E50], 0);
    }
    v4 = (**(uint64_t (***)(PLProcessCPU *, _QWORD *))this)(this, buffer);
    v14 = v4;
    if (v4 == -1)
    {
      v5 = __cxa_allocate_exception(8uLL);
      *v5 = "Cannot find the inode for the process";
      __cxa_throw(v5, MEMORY[0x1E0DE4E50], 0);
    }
  }
  else
  {
    v4 = 0;
    strcpy((char *)buffer, "kernel_task");
    v14 = 0;
  }
  *(_QWORD *)&v12 = a2;
  std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)this + 8, a2, (uint64_t)&std::piecewise_construct, (_DWORD **)&v12)[3] = v4;
  *(_QWORD *)&v12 = &v14;
  v6 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)this + 48, &v14, (uint64_t)&std::piecewise_construct, (_QWORD **)&v12);
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>((uint64_t)(v6 + 3), a2, a2);
  if (*((char *)v6 + 87) < 0)
  {
    if (v6[9])
      return v14;
  }
  else if (*((_BYTE *)v6 + 87))
  {
    return v14;
  }
  v7 = (char *)(*(uint64_t (**)(PLProcessCPU *, _QWORD *))(*(_QWORD *)this + 8))(this, buffer);
  if (!v7)
  {
    v11 = __cxa_allocate_exception(8uLL);
    *v11 = "Unable to get basename for the process";
    __cxa_throw(v11, MEMORY[0x1E0DE4E50], 0);
  }
  std::string::basic_string[abi:ne180100]<0>(&v12, v7);
  v8 = (void **)(v6 + 8);
  if (*((char *)v6 + 87) < 0)
    operator delete(*v8);
  *(_OWORD *)v8 = v12;
  v6[10] = v13;
  return v14;
}

uint64_t PLProcessCPU::getCpu(PLProcessCPU *this, int pid, proc_taskinfo *buffer)
{
  return proc_pidinfo(pid, 4, 0, buffer, 96);
}

uint64_t PLProcessCPU::getRawCpu(PLProcessCPU *this, int *a2, unint64_t *a3)
{
  _QWORD *v7;
  _QWORD *exception;
  _QWORD v9[12];

  if ((*(unsigned int (**)(PLProcessCPU *, _QWORD, _QWORD *))(*(_QWORD *)this + 16))(this, *a2, v9) != 96)
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>((_QWORD *)this + 1, a2);
    v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>((_QWORD *)this + 6, a3);
    if (!v7[6])
      std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(v7 + 3, a2);
    exception = __cxa_allocate_exception(8uLL);
    *exception = "Process terminated while acquiring pidinfo";
    __cxa_throw(exception, MEMORY[0x1E0DE4E50], 0);
  }
  return v9[3] + v9[2];
}

uint64_t PLProcessCPU::aggregateCpu(uint64_t a1, _QWORD *a2, uint64_t *a3, unint64_t *a4)
{
  _QWORD *v7;
  _QWORD *v8;
  uint64_t result;
  uint64_t v10;
  uint64_t v11;
  _QWORD *v12;
  unint64_t *v13;

  v7 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>(a2, a4);
  if (v7)
  {
    v8 = v7;
    result = v7[3];
    v10 = *a3 + result;
    *a3 = v10;
    v8[3] = v10;
  }
  else
  {
    v11 = *a3;
    v13 = a4;
    v12 = std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>((uint64_t)a2, a4, (uint64_t)&std::piecewise_construct, &v13);
    result = 0;
    v12[3] = v11;
  }
  return result;
}

void PLProcessCPU::addToReport(uint64_t a1, unint64_t *a2, _QWORD *a3, uint64_t a4, uint64_t *a5, unint64_t *a6)
{
  uint64_t v10;
  uint64_t *v11;
  uint64_t **v12;
  uint64_t *v13;
  unint64_t v14;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t *v22;
  uint64_t *v23;
  __int128 v24;
  uint64_t v25[2];

  v10 = PLProcessCPU::aggregateCpu(a1, a3, a5, a2);
  v25[0] = *a2;
  v25[1] = v10;
  v11 = std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::find<std::pair<unsigned long long,unsigned long long>>(a4, v25);
  v12 = (uint64_t **)(a4 + 8);
  if ((uint64_t *)(a4 + 8) != v11)
  {
    v13 = v11;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer((uint64_t **)a4, v11);
    operator delete(v13);
  }
  v14 = *a5;
  if (*(_QWORD *)(a4 + 16) != 10 || v14 > *a6)
  {
    *(_QWORD *)&v24 = *a2;
    *((_QWORD *)&v24 + 1) = v14;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<std::pair<unsigned long long,unsigned long long>,std::pair<unsigned long long,unsigned long long>>((uint64_t **)a4, (uint64_t *)&v24, &v24);
    if (*(_QWORD *)(a4 + 16) >= 0xBuLL)
    {
      do
      {
        v16 = *v12;
        v17 = (uint64_t *)(a4 + 8);
        if (*v12)
        {
          do
          {
            v17 = v16;
            v16 = (uint64_t *)v16[1];
          }
          while (v16);
          v18 = (uint64_t *)*v17;
        }
        else
        {
          do
          {
            v19 = v17;
            v17 = (uint64_t *)v17[2];
            v18 = (uint64_t *)*v17;
          }
          while ((uint64_t *)*v17 == v19);
        }
        if (v18)
        {
          do
          {
            v17 = v18;
            v18 = (uint64_t *)v18[1];
          }
          while (v18);
          *a6 = v17[5];
        }
        else
        {
          do
          {
            v22 = v17;
            v17 = (uint64_t *)v17[2];
          }
          while ((uint64_t *)*v17 == v22);
          v23 = (uint64_t *)v17[1];
          *a6 = v17[5];
          if (v23)
          {
            do
            {
              v20 = v23;
              v23 = (uint64_t *)*v23;
            }
            while (v23);
            goto LABEL_22;
          }
        }
        do
        {
          v20 = (uint64_t *)v17[2];
          v21 = *v20 == (_QWORD)v17;
          v17 = v20;
        }
        while (!v21);
LABEL_22:
        std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer((uint64_t **)a4, v20);
        operator delete(v20);
      }
      while (*(_QWORD *)(a4 + 16) > 0xAuLL);
    }
  }
}

void PLProcessCPU::reportCpus(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  double v5;
  float v6;
  __int128 v7;
  double v8;
  NSObject *v9;
  float v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  int v14;
  double v15;
  double v16;
  double v17;
  NSObject *v18;
  int v19;
  _QWORD *v20;
  _QWORD *v21;
  float v22;
  _QWORD *v23;
  _QWORD *v24;
  BOOL v25;
  __int128 v26;
  __int128 v27;
  __int128 *v28;
  uint8_t buf[4];
  _BYTE v30[24];
  __int16 v31;
  int v32;
  __int16 v33;
  _QWORD *v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *a3);
  v6 = v5 * 1000.0;
  +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *(_QWORD *)(a1 + 120 + 8 * *(int *)(a1 + 136)) - *(_QWORD *)(a1 + 120 + 8 * *(int *)(a1 + 140)));
  if (a2[2])
  {
    v8 = *(double *)&v7;
    v9 = *(NSObject **)(a1 + 152);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = v8;
      *(_DWORD *)buf = 134218240;
      *(double *)v30 = v6;
      *(_WORD *)&v30[8] = 2048;
      *(double *)&v30[10] = v10;
      _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_DEFAULT, "plcpu-00, %8.2f ms, %6.2f s", buf, 0x16u);
    }
  }
  v13 = (_QWORD *)*a2;
  v11 = a2 + 1;
  v12 = v13;
  if (v13 != v11)
  {
    v14 = 0;
    v15 = v6;
    *(_QWORD *)&v7 = 67110146;
    v26 = v7;
    do
    {
      v27 = *((_OWORD *)v12 + 2);
      +[PLUtilities secondsFromMachTime:](PLUtilities, "secondsFromMachTime:", *((_QWORD *)&v27 + 1), v26, v27);
      v17 = v16;
      v18 = *(id *)(a1 + 152);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        v28 = &v27;
        v19 = *(_DWORD *)(std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 48, (unint64_t *)&v27, (uint64_t)&std::piecewise_construct, (_QWORD **)&v28)[5]+ 16);
        v28 = &v27;
        v20 = std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(a1 + 48, (unint64_t *)&v27, (uint64_t)&std::piecewise_construct, (_QWORD **)&v28);
        v21 = v20 + 8;
        if (*((char *)v20 + 87) < 0)
          v21 = (_QWORD *)*v21;
        v22 = v17 * 1000.0;
        ++v14;
        *(_DWORD *)buf = v26;
        *(_DWORD *)v30 = v14;
        *(_WORD *)&v30[4] = 2048;
        *(double *)&v30[6] = v22;
        *(_WORD *)&v30[14] = 2048;
        *(double *)&v30[16] = v22 * 100.0 / v15;
        v31 = 1024;
        v32 = v19;
        v33 = 2080;
        v34 = v21;
        _os_log_impl(&dword_1DA9D6000, v18, OS_LOG_TYPE_DEFAULT, "plcpu-%02d, %8.2f ms, %6.2f %%, %5d, %s", buf, 0x2Cu);
      }

      v23 = (_QWORD *)v12[1];
      if (v23)
      {
        do
        {
          v24 = v23;
          v23 = (_QWORD *)*v23;
        }
        while (v23);
      }
      else
      {
        do
        {
          v24 = (_QWORD *)v12[2];
          v25 = *v24 == (_QWORD)v12;
          v12 = v24;
        }
        while (!v25);
      }
      v12 = v24;
    }
    while (v24 != v11);
  }
}

void sub_1DAAEC064(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t PLProcessCPU::processPids(int32x2_t *this)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t *v5;
  uint64_t *v6;
  unint64_t updated;
  uint64_t RawCpu;
  unint64_t v10;
  int v11;
  uint64_t v12;
  unint64_t v13;
  _QWORD **v14;
  _QWORD *v15[2];
  _OWORD v16[2];
  int v17;
  int *v18;

  this[13].i32[this[17].i32[0] + 1] = proc_listallpids(*(void **)&this[this[17].i32[0] + 11], this[13].i32[0]);
  PLProcessCPU::cleanupDeadPids((PLProcessCPU *)this);
  memset(v16, 0, sizeof(v16));
  v17 = 1065353216;
  v15[0] = 0;
  v15[1] = 0;
  v13 = 0;
  v14 = v15;
  v12 = 0;
  v2 = mach_absolute_time();
  v3 = this[17].i32[0];
  this[v3 + 15] = (int32x2_t)v2;
  if (this[13].i32[v3 + 1] >= 1)
  {
    v4 = 0;
    do
    {
      v11 = 0;
      v11 = *(_DWORD *)(*(_QWORD *)&this[v3 + 11] + 4 * v4);
      v10 = 0;
      v5 = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(&this[1], &v11);
      v6 = v5;
      if (v5)
        updated = v5[3];
      else
        updated = PLProcessCPU::updateInodeMap((PLProcessCPU *)this, &v11);
      v10 = updated;
      RawCpu = PLProcessCPU::getRawCpu((PLProcessCPU *)this, &v11, &v10);
      if (v6)
      {
        v6[this[17].i32[0] + 4] = RawCpu;
        if (!this[18].i8[0])
        {
          v18 = (int *)(RawCpu - v6[this[17].i32[1] + 4]);
          v12 += (uint64_t)v18;
          if (v18)
            PLProcessCPU::addToReport(RawCpu, &v10, v16, (uint64_t)&v14, (uint64_t *)&v18, &v13);
        }
      }
      else
      {
        v18 = &v11;
        std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>((uint64_t)&this[1], &v11, (uint64_t)&std::piecewise_construct, &v18)[this[17].i32[0] + 4] = RawCpu;
      }
      ++v4;
      v3 = this[17].i32[0];
    }
    while (v4 < this[13].i32[v3 + 1]);
  }
  PLProcessCPU::reportCpus((uint64_t)this, &v14, &v12);
  this[17] = vrev64_s32(this[17]);
  this[18].i8[0] = 0;
  std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy((uint64_t)&v14, v15[0]);
  return std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table((uint64_t)v16);
}

void sub_1DAAEC280()
{
  JUMPOUT(0x1DAAEC28CLL);
}

uint64_t std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(uint64_t a1)
{
  _QWORD *v2;
  _QWORD *v3;
  void *v4;

  v2 = *(_QWORD **)(a1 + 16);
  if (v2)
  {
    do
    {
      v3 = (_QWORD *)*v2;
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
  v4 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v4)
    operator delete(v4);
  return a1;
}

uint64_t std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::~__hash_table(uint64_t a1)
{
  void *v2;

  std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__deallocate_node(a1, *(_QWORD **)(a1 + 16));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;
  if (v2)
    operator delete(v2);
  return a1;
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__deallocate_node(uint64_t a1, _QWORD *a2)
{
  _QWORD *v2;
  _QWORD *v3;

  if (a2)
  {
    v2 = a2;
    do
    {
      v3 = (_QWORD *)*v2;
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>((uint64_t)(v2 + 2));
      operator delete(v2);
      v2 = v3;
    }
    while (v3);
  }
}

uint64_t std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>(uint64_t a1)
{
  if (*(char *)(a1 + 71) < 0)
    operator delete(*(void **)(a1 + 48));
  return std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::~__hash_table(a1 + 8);
}

void std::vector<int>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1EA16C040, MEMORY[0x1E0DE42D0]);
}

void sub_1DAAEC3E4(_Unwind_Exception *a1)
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

void *std::__allocate_at_least[abi:ne180100]<std::allocator<int>>(uint64_t a1, unint64_t a2)
{
  if (a2 >> 62)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(4 * a2);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t *std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(_QWORD *a1, int *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  uint64_t **v6;
  uint64_t *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (*(_QWORD *)&v2 <= v3)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(uint64_t ***)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  for (result = *v6; result; result = (uint64_t *)*result)
  {
    v8 = result[1];
    if (v8 == v3)
    {
      if (*((_DWORD *)result + 4) == (_DWORD)v3)
        return result;
    }
    else
    {
      if (v4.u32[0] > 1uLL)
      {
        if (v8 >= *(_QWORD *)&v2)
          v8 %= *(_QWORD *)&v2;
      }
      else
      {
        v8 &= *(_QWORD *)&v2 - 1;
      }
      if (v8 != v5)
        return 0;
    }
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD *v10;
  _QWORD *v11;
  unint64_t v12;
  uint64_t v13;
  char *v14;
  float v15;
  float v16;
  _BOOL8 v17;
  unint64_t v18;
  unint64_t v19;
  size_t v20;
  _QWORD *v21;
  unint64_t v22;
  _QWORD v24[2];
  char v25;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = (_QWORD *)*v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (v11[2] == v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v13 = a1 + 16;
  v14 = (char *)operator new(0x58uLL);
  v24[0] = v14;
  v24[1] = a1 + 16;
  *(_QWORD *)v14 = 0;
  *((_QWORD *)v14 + 1) = v7;
  *((_QWORD *)v14 + 2) = **a4;
  *((_QWORD *)v14 + 7) = 0;
  *((_QWORD *)v14 + 8) = 0;
  *(_OWORD *)(v14 + 40) = 0u;
  *(_OWORD *)(v14 + 24) = 0u;
  *((_DWORD *)v14 + 14) = 1065353216;
  *((_QWORD *)v14 + 9) = 0;
  *((_QWORD *)v14 + 10) = 0;
  v25 = 1;
  v15 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v16 = *(float *)(a1 + 32);
  if (!v8 || (float)(v16 * (float)v8) < v15)
  {
    v17 = 1;
    if (v8 >= 3)
      v17 = (v8 & (v8 - 1)) != 0;
    v18 = v17 | (2 * v8);
    v19 = vcvtps_u32_f32(v15 / v16);
    if (v18 <= v19)
      v20 = v19;
    else
      v20 = v18;
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v20);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v21 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v21)
  {
    *(_QWORD *)v24[0] = *v21;
    *v21 = v24[0];
  }
  else
  {
    *(_QWORD *)v24[0] = *(_QWORD *)(a1 + 16);
    *(_QWORD *)(a1 + 16) = v24[0];
    *(_QWORD *)(*(_QWORD *)a1 + 8 * v4) = v13;
    if (*(_QWORD *)v24[0])
    {
      v22 = *(_QWORD *)(*(_QWORD *)v24[0] + 8);
      if ((v8 & (v8 - 1)) != 0)
      {
        if (v22 >= v8)
          v22 %= v8;
      }
      else
      {
        v22 &= v8 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v22) = v24[0];
    }
  }
  v11 = (_QWORD *)v24[0];
  v24[0] = 0;
  ++*(_QWORD *)(a1 + 24);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100]((uint64_t)v24, 0);
  return v11;
}

void sub_1DAAEC788(_Unwind_Exception *a1, uint64_t a2, ...)
{
  va_list va;

  va_start(va, a2);
  std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100]((uint64_t)va, 0);
  _Unwind_Resume(a1);
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(uint64_t a1, size_t __n)
{
  size_t prime;
  int8x8_t v4;
  unint64_t v5;
  uint8x8_t v6;
  uint64_t v7;

  if (__n == 1)
  {
    prime = 2;
  }
  else
  {
    prime = __n;
    if ((__n & (__n - 1)) != 0)
      prime = std::__next_prime(__n);
  }
  v4 = *(int8x8_t *)(a1 + 8);
  if (prime > *(_QWORD *)&v4)
    goto LABEL_16;
  if (prime < *(_QWORD *)&v4)
  {
    v5 = vcvtps_u32_f32((float)*(unint64_t *)(a1 + 24) / *(float *)(a1 + 32));
    if (*(_QWORD *)&v4 < 3uLL || (v6 = (uint8x8_t)vcnt_s8(v4), v6.i16[0] = vaddlv_u8(v6), v6.u32[0] > 1uLL))
    {
      v5 = std::__next_prime(v5);
    }
    else
    {
      v7 = 1 << -(char)__clz(v5 - 1);
      if (v5 >= 2)
        v5 = v7;
    }
    if (prime <= v5)
      prime = v5;
    if (prime < *(_QWORD *)&v4)
LABEL_16:
      std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__do_rehash<true>(a1, prime);
  }
}

void std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__do_rehash<true>(uint64_t a1, unint64_t a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  uint8x8_t v9;
  void *v10;
  _QWORD *v11;
  unint64_t v12;

  if (a2)
  {
    if (a2 >> 61)
      std::__throw_bad_array_new_length[abi:ne180100]();
    v4 = operator new(8 * a2);
    v5 = *(void **)a1;
    *(_QWORD *)a1 = v4;
    if (v5)
      operator delete(v5);
    v6 = 0;
    *(_QWORD *)(a1 + 8) = a2;
    do
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v6++) = 0;
    while (a2 != v6);
    v7 = *(_QWORD **)(a1 + 16);
    if (v7)
    {
      v8 = v7[1];
      v9 = (uint8x8_t)vcnt_s8((int8x8_t)a2);
      v9.i16[0] = vaddlv_u8(v9);
      if (v9.u32[0] > 1uLL)
      {
        if (v8 >= a2)
          v8 %= a2;
      }
      else
      {
        v8 &= a2 - 1;
      }
      *(_QWORD *)(*(_QWORD *)a1 + 8 * v8) = a1 + 16;
      v11 = (_QWORD *)*v7;
      if (*v7)
      {
        do
        {
          v12 = v11[1];
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= a2)
              v12 %= a2;
          }
          else
          {
            v12 &= a2 - 1;
          }
          if (v12 != v8)
          {
            if (!*(_QWORD *)(*(_QWORD *)a1 + 8 * v12))
            {
              *(_QWORD *)(*(_QWORD *)a1 + 8 * v12) = v7;
              goto LABEL_24;
            }
            *v7 = *v11;
            *v11 = **(_QWORD **)(*(_QWORD *)a1 + 8 * v12);
            **(_QWORD **)(*(_QWORD *)a1 + 8 * v12) = v11;
            v11 = v7;
          }
          v12 = v8;
LABEL_24:
          v7 = v11;
          v11 = (_QWORD *)*v11;
          v8 = v12;
        }
        while (v11);
      }
    }
  }
  else
  {
    v10 = *(void **)a1;
    *(_QWORD *)a1 = 0;
    if (v10)
      operator delete(v10);
    *(_QWORD *)(a1 + 8) = 0;
  }
}

void std::unique_ptr<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>,std::__hash_node_destructor<std::allocator<std::__hash_node<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,void *>>>>::reset[abi:ne180100](uint64_t a1, uint64_t a2)
{
  void *v2;

  v2 = *(void **)a1;
  *(_QWORD *)a1 = a2;
  if (v2)
  {
    if (*(_BYTE *)(a1 + 16))
      std::__destroy_at[abi:ne180100]<std::pair<unsigned long long const,PLProcessCPU::inode_data_t>,0>((uint64_t)v2 + 16);
    operator delete(v2);
  }
}

uint64_t *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__erase_unique<int>(_QWORD *a1, int *a2)
{
  uint64_t *result;

  result = std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::find<int>(a1, a2);
  if (result)
  {
    std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(a1, result);
    return (uint64_t *)1;
  }
  return result;
}

uint64_t std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::erase(_QWORD *a1, uint64_t *a2)
{
  uint64_t v2;
  void *v3;
  void *__p;

  v2 = *a2;
  std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::remove(a1, a2, (uint64_t)&__p);
  v3 = __p;
  __p = 0;
  if (v3)
    operator delete(v3);
  return v2;
}

_QWORD *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::remove@<X0>(_QWORD *result@<X0>, _QWORD *a2@<X1>, uint64_t a3@<X8>)
{
  int8x8_t v3;
  unint64_t v4;
  uint8x8_t v5;
  _QWORD *v6;
  _QWORD *v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;

  v3 = (int8x8_t)result[1];
  v4 = a2[1];
  v5 = (uint8x8_t)vcnt_s8(v3);
  v5.i16[0] = vaddlv_u8(v5);
  if (v5.u32[0] > 1uLL)
  {
    if (v4 >= *(_QWORD *)&v3)
      v4 %= *(_QWORD *)&v3;
  }
  else
  {
    v4 &= *(_QWORD *)&v3 - 1;
  }
  v6 = *(_QWORD **)(*result + 8 * v4);
  do
  {
    v7 = v6;
    v6 = (_QWORD *)*v6;
  }
  while (v6 != a2);
  if (v7 == result + 2)
    goto LABEL_18;
  v8 = v7[1];
  if (v5.u32[0] > 1uLL)
  {
    if (v8 >= *(_QWORD *)&v3)
      v8 %= *(_QWORD *)&v3;
  }
  else
  {
    v8 &= *(_QWORD *)&v3 - 1;
  }
  if (v8 != v4)
  {
LABEL_18:
    if (!*a2)
      goto LABEL_19;
    v9 = *(_QWORD *)(*a2 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v9 >= *(_QWORD *)&v3)
        v9 %= *(_QWORD *)&v3;
    }
    else
    {
      v9 &= *(_QWORD *)&v3 - 1;
    }
    if (v9 != v4)
LABEL_19:
      *(_QWORD *)(*result + 8 * v4) = 0;
  }
  v10 = *a2;
  if (*a2)
  {
    v11 = *(_QWORD *)(v10 + 8);
    if (v5.u32[0] > 1uLL)
    {
      if (v11 >= *(_QWORD *)&v3)
        v11 %= *(_QWORD *)&v3;
    }
    else
    {
      v11 &= *(_QWORD *)&v3 - 1;
    }
    if (v11 != v4)
    {
      *(_QWORD *)(*result + 8 * v11) = v7;
      v10 = *a2;
    }
  }
  *v7 = v10;
  *a2 = 0;
  --result[3];
  *(_QWORD *)a3 = a2;
  *(_QWORD *)(a3 + 8) = result + 2;
  *(_BYTE *)(a3 + 16) = 1;
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::__unordered_map_hasher<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::hash<int>,std::equal_to<int>,true>,std::__unordered_map_equal<int,std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>,std::equal_to<int>,std::hash<int>,true>,std::allocator<std::__hash_value_type<int,PLProcessCPU::inode_cpu_t>>>::__emplace_unique_key_args<int,std::piecewise_construct_t const&,std::tuple<int const&>,std::tuple<>>(uint64_t a1, int *a2, uint64_t a3, _DWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  void **v10;
  _QWORD *v11;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v8 <= v7)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(void ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      v11 = *v10;
      if (*v10)
      {
        do
        {
          v12 = v11[1];
          if (v12 == v7)
          {
            if (*((_DWORD *)v11 + 4) == (_DWORD)v7)
              return v11;
          }
          else
          {
            if (v9.u32[0] > 1uLL)
            {
              if (v12 >= v8)
                v12 %= v8;
            }
            else
            {
              v12 &= v8 - 1;
            }
            if (v12 != v4)
              break;
          }
          v11 = (_QWORD *)*v11;
        }
        while (v11);
      }
    }
  }
  v11 = operator new(0x30uLL);
  *v11 = 0;
  v11[1] = v7;
  *((_DWORD *)v11 + 4) = **a4;
  v11[4] = 0;
  v11[5] = 0;
  v11[3] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v8 <= v7)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *v11 = *v20;
LABEL_38:
    *v20 = v11;
    goto LABEL_39;
  }
  *v11 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v11;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*v11)
  {
    v21 = *(_QWORD *)(*v11 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v11;
}

void sub_1DAAECDD0(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__hash_table<int,std::hash<int>,std::equal_to<int>,std::allocator<int>>::__emplace_unique_key_args<int,int const&>(uint64_t a1, int *a2, _DWORD *a3)
{
  unint64_t v3;
  unint64_t v6;
  unint64_t v7;
  uint8x8_t v8;
  void **v9;
  _QWORD *v10;
  unint64_t v11;
  float v12;
  float v13;
  _BOOL8 v14;
  unint64_t v15;
  unint64_t v16;
  size_t v17;
  uint64_t v18;
  _QWORD *v19;
  unint64_t v20;

  v6 = *a2;
  v7 = *(_QWORD *)(a1 + 8);
  if (v7)
  {
    v8 = (uint8x8_t)vcnt_s8((int8x8_t)v7);
    v8.i16[0] = vaddlv_u8(v8);
    if (v8.u32[0] > 1uLL)
    {
      v3 = *a2;
      if (v7 <= v6)
        v3 = v6 % v7;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
    v9 = *(void ***)(*(_QWORD *)a1 + 8 * v3);
    if (v9)
    {
      v10 = *v9;
      if (*v9)
      {
        do
        {
          v11 = v10[1];
          if (v11 == v6)
          {
            if (*((_DWORD *)v10 + 4) == (_DWORD)v6)
              return v10;
          }
          else
          {
            if (v8.u32[0] > 1uLL)
            {
              if (v11 >= v7)
                v11 %= v7;
            }
            else
            {
              v11 &= v7 - 1;
            }
            if (v11 != v3)
              break;
          }
          v10 = (_QWORD *)*v10;
        }
        while (v10);
      }
    }
  }
  v10 = operator new(0x18uLL);
  *v10 = 0;
  v10[1] = v6;
  *((_DWORD *)v10 + 4) = *a3;
  v12 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v13 = *(float *)(a1 + 32);
  if (!v7 || (float)(v13 * (float)v7) < v12)
  {
    v14 = 1;
    if (v7 >= 3)
      v14 = (v7 & (v7 - 1)) != 0;
    v15 = v14 | (2 * v7);
    v16 = vcvtps_u32_f32(v12 / v13);
    if (v15 <= v16)
      v17 = v16;
    else
      v17 = v15;
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v17);
    v7 = *(_QWORD *)(a1 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v7 <= v6)
        v3 = v6 % v7;
      else
        v3 = v6;
    }
    else
    {
      v3 = (v7 - 1) & v6;
    }
  }
  v18 = *(_QWORD *)a1;
  v19 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v3);
  if (v19)
  {
    *v10 = *v19;
LABEL_38:
    *v19 = v10;
    goto LABEL_39;
  }
  *v10 = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = v10;
  *(_QWORD *)(v18 + 8 * v3) = a1 + 16;
  if (*v10)
  {
    v20 = *(_QWORD *)(*v10 + 8);
    if ((v7 & (v7 - 1)) != 0)
    {
      if (v20 >= v7)
        v20 %= v7;
    }
    else
    {
      v20 &= v7 - 1;
    }
    v19 = (_QWORD *)(*(_QWORD *)a1 + 8 * v20);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return v10;
}

void sub_1DAAECFE8(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::string::basic_string[abi:ne180100]<0>(_QWORD *a1, char *__s)
{
  size_t v4;
  size_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;

  v4 = strlen(__s);
  if (v4 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  v5 = v4;
  if (v4 >= 0x17)
  {
    v7 = (v4 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v4 | 7) != 0x17)
      v7 = v4 | 7;
    v8 = v7 + 1;
    v6 = operator new(v7 + 1);
    a1[1] = v5;
    a1[2] = v8 | 0x8000000000000000;
    *a1 = v6;
  }
  else
  {
    *((_BYTE *)a1 + 23) = v4;
    v6 = a1;
    if (!v4)
      goto LABEL_9;
  }
  memmove(v6, __s, v5);
LABEL_9:
  *((_BYTE *)v6 + v5) = 0;
  return a1;
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::find<unsigned long long>(_QWORD *a1, unint64_t *a2)
{
  int8x8_t v2;
  unint64_t v3;
  uint8x8_t v4;
  unint64_t v5;
  _QWORD *v6;
  _QWORD *result;
  unint64_t v8;

  v2 = (int8x8_t)a1[1];
  if (!*(_QWORD *)&v2)
    return 0;
  v3 = *a2;
  v4 = (uint8x8_t)vcnt_s8(v2);
  v4.i16[0] = vaddlv_u8(v4);
  if (v4.u32[0] > 1uLL)
  {
    v5 = *a2;
    if (v3 >= *(_QWORD *)&v2)
      v5 = v3 % *(_QWORD *)&v2;
  }
  else
  {
    v5 = (*(_QWORD *)&v2 - 1) & v3;
  }
  v6 = *(_QWORD **)(*a1 + 8 * v5);
  if (!v6)
    return 0;
  result = (_QWORD *)*v6;
  if (*v6)
  {
    do
    {
      v8 = result[1];
      if (v8 == v3)
      {
        if (result[2] == v3)
          return result;
      }
      else
      {
        if (v4.u32[0] > 1uLL)
        {
          if (v8 >= *(_QWORD *)&v2)
            v8 %= *(_QWORD *)&v2;
        }
        else
        {
          v8 &= *(_QWORD *)&v2 - 1;
        }
        if (v8 != v5)
          return 0;
      }
      result = (_QWORD *)*result;
    }
    while (result);
  }
  return result;
}

_QWORD *std::__hash_table<std::__hash_value_type<unsigned long long,unsigned long long>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,unsigned long long>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<unsigned long long,std::piecewise_construct_t const&,std::tuple<unsigned long long const&>,std::tuple<>>(uint64_t a1, unint64_t *a2, uint64_t a3, _QWORD **a4)
{
  unint64_t v4;
  unint64_t v7;
  unint64_t v8;
  uint8x8_t v9;
  _QWORD **v10;
  _QWORD *i;
  unint64_t v12;
  float v13;
  float v14;
  _BOOL8 v15;
  unint64_t v16;
  unint64_t v17;
  size_t v18;
  uint64_t v19;
  _QWORD *v20;
  unint64_t v21;

  v7 = *a2;
  v8 = *(_QWORD *)(a1 + 8);
  if (v8)
  {
    v9 = (uint8x8_t)vcnt_s8((int8x8_t)v8);
    v9.i16[0] = vaddlv_u8(v9);
    if (v9.u32[0] > 1uLL)
    {
      v4 = *a2;
      if (v7 >= v8)
        v4 = v7 % v8;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
    v10 = *(_QWORD ***)(*(_QWORD *)a1 + 8 * v4);
    if (v10)
    {
      for (i = *v10; i; i = (_QWORD *)*i)
      {
        v12 = i[1];
        if (v12 == v7)
        {
          if (i[2] == v7)
            return i;
        }
        else
        {
          if (v9.u32[0] > 1uLL)
          {
            if (v12 >= v8)
              v12 %= v8;
          }
          else
          {
            v12 &= v8 - 1;
          }
          if (v12 != v4)
            break;
        }
      }
    }
  }
  i = operator new(0x20uLL);
  *i = 0;
  i[1] = v7;
  i[2] = **a4;
  i[3] = 0;
  v13 = (float)(unint64_t)(*(_QWORD *)(a1 + 24) + 1);
  v14 = *(float *)(a1 + 32);
  if (!v8 || (float)(v14 * (float)v8) < v13)
  {
    v15 = 1;
    if (v8 >= 3)
      v15 = (v8 & (v8 - 1)) != 0;
    v16 = v15 | (2 * v8);
    v17 = vcvtps_u32_f32(v13 / v14);
    if (v16 <= v17)
      v18 = v17;
    else
      v18 = v16;
    std::__hash_table<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::__unordered_map_hasher<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::hash<unsigned long long>,std::equal_to<unsigned long long>,true>,std::__unordered_map_equal<unsigned long long,std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>,std::equal_to<unsigned long long>,std::hash<unsigned long long>,true>,std::allocator<std::__hash_value_type<unsigned long long,PLProcessCPU::inode_data_t>>>::__rehash<true>(a1, v18);
    v8 = *(_QWORD *)(a1 + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v7 >= v8)
        v4 = v7 % v8;
      else
        v4 = v7;
    }
    else
    {
      v4 = (v8 - 1) & v7;
    }
  }
  v19 = *(_QWORD *)a1;
  v20 = *(_QWORD **)(*(_QWORD *)a1 + 8 * v4);
  if (v20)
  {
    *i = *v20;
LABEL_38:
    *v20 = i;
    goto LABEL_39;
  }
  *i = *(_QWORD *)(a1 + 16);
  *(_QWORD *)(a1 + 16) = i;
  *(_QWORD *)(v19 + 8 * v4) = a1 + 16;
  if (*i)
  {
    v21 = *(_QWORD *)(*i + 8);
    if ((v8 & (v8 - 1)) != 0)
    {
      if (v21 >= v8)
        v21 %= v8;
    }
    else
    {
      v21 &= v8 - 1;
    }
    v20 = (_QWORD *)(*(_QWORD *)a1 + 8 * v21);
    goto LABEL_38;
  }
LABEL_39:
  ++*(_QWORD *)(a1 + 24);
  return i;
}

void sub_1DAAED37C(_Unwind_Exception *a1)
{
  void *v1;

  operator delete(v1);
  _Unwind_Resume(a1);
}

_QWORD *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::find<std::pair<unsigned long long,unsigned long long>>(uint64_t a1, uint64_t *a2)
{
  _QWORD *v2;
  _QWORD *v3;
  _QWORD *v4;
  uint64_t v5;
  unint64_t v6;
  _QWORD *v7;
  unint64_t v8;
  BOOL v9;
  _BOOL4 v10;
  int v11;
  int v12;
  BOOL v13;
  _QWORD *v14;
  unint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;

  v4 = *(_QWORD **)(a1 + 8);
  v2 = (_QWORD *)(a1 + 8);
  v3 = v4;
  if (!v4)
    return v2;
  v5 = *a2;
  v6 = a2[1];
  v7 = v2;
  do
  {
    v8 = v3[5];
    v9 = v8 >= v6;
    v10 = v8 > v6;
    v11 = v9;
    if (v3[4] == v5)
      v12 = v10;
    else
      v12 = v11;
    v13 = v12 == 0;
    if (v12)
      v14 = v3 + 1;
    else
      v14 = v3;
    if (v13)
      v7 = v3;
    v3 = (_QWORD *)*v14;
  }
  while (*v14);
  if (v7 == v2)
    return v2;
  v15 = v7[5];
  v9 = v6 >= v15;
  v16 = v6 > v15;
  v17 = v9;
  if (v5 == v7[4] ? v16 : v17)
    return v2;
  return v7;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__remove_node_pointer(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(v6, a2);
  return v3;
}

uint64_t *std::__tree_remove[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__emplace_unique_key_args<std::pair<unsigned long long,unsigned long long>,std::pair<unsigned long long,unsigned long long>>(uint64_t **a1, uint64_t *a2, _OWORD *a3)
{
  void **v5;
  uint64_t *v6;
  uint64_t **v7;
  uint64_t v9;

  v5 = (void **)std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__find_equal<std::pair<unsigned long long,unsigned long long>>((uint64_t)a1, &v9, a2);
  v6 = (uint64_t *)*v5;
  if (!*v5)
  {
    v7 = (uint64_t **)v5;
    v6 = (uint64_t *)operator new(0x30uLL);
    *((_OWORD *)v6 + 2) = *a3;
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__insert_node_at(a1, v9, v7, v6);
  }
  return v6;
}

_QWORD *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__find_equal<std::pair<unsigned long long,unsigned long long>>(uint64_t a1, _QWORD *a2, uint64_t *a3)
{
  _QWORD *result;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  unint64_t v7;
  _QWORD *v8;
  uint64_t v9;
  unint64_t v10;
  _BOOL4 v11;
  BOOL v12;
  _BOOL4 v13;
  int v14;
  int v15;

  v5 = *(_QWORD **)(a1 + 8);
  result = (_QWORD *)(a1 + 8);
  v4 = v5;
  if (v5)
  {
    v6 = *a3;
    v7 = a3[1];
    do
    {
      while (1)
      {
        v8 = v4;
        v9 = v4[4];
        v10 = v8[5];
        v11 = v7 > v10;
        if (v6 != v9)
          v11 = v7 >= v10;
        if (!v11)
          break;
        v4 = (_QWORD *)*v8;
        result = v8;
        if (!*v8)
          goto LABEL_18;
      }
      v12 = v10 >= v7;
      v13 = v10 > v7;
      v14 = v12;
      if (v6 == v9)
        v15 = v13;
      else
        v15 = v14;
      if (v15 != 1)
        break;
      result = v8 + 1;
      v4 = (_QWORD *)v8[1];
    }
    while (v4);
  }
  else
  {
    v8 = result;
  }
LABEL_18:
  *a2 = v8;
  return result;
}

uint64_t *std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::__insert_node_at(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *std::__tree_balance_after_insert[abi:ne180100]<std::__tree_node_base<void *> *>(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(a1, *a2);
    std::__tree<std::pair<unsigned long long,unsigned long long>,PLProcessCPU::compare_t,std::allocator<std::pair<unsigned long long,unsigned long long>>>::destroy(a1, a2[1]);
    operator delete(a2);
  }
}

void sub_1DAAF9530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  va_list va;

  va_start(va, a10);
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

uint64_t OUTLINED_FUNCTION_12_5(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

uint64_t OUTLINED_FUNCTION_16_2(void *a1, const char *a2)
{
  return objc_msgSend(a1, "doubleValue");
}

uint64_t OUTLINED_FUNCTION_17_0(void *a1, const char *a2)
{
  return objc_msgSend(a1, "count");
}

id PLLogDisplay()
{
  if (PLLogDisplay_onceToken != -1)
    dispatch_once(&PLLogDisplay_onceToken, &__block_literal_global_25);
  return (id)PLLogDisplay___logObj;
}

void serviceInterestCallback(void *a1, uint64_t a2, int a3)
{
  uint64_t v3;
  uint64_t v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];
  uint64_t v8;
  uint64_t v9;

  if (a3 == -536870896)
  {
    v8 = v3;
    v9 = v4;
    v5 = a1;
    objc_msgSend(v5, "cancel");
    objc_msgSend(v5, "setValid:", 0);

    PLLogDisplay();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1DA9D6000, v6, OS_LOG_TYPE_DEFAULT, "Cancelled AFKInterface", v7, 2u);
    }

  }
}

uint64_t handleIOMFBPowerCallback(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t result;

  if (!_os_feature_enabled_impl())
    return objc_msgSend(a4, "logEventPointDisplayBacklightWithState:", a3);
  result = objc_msgSend(MEMORY[0x1E0D80020], "hasAOD");
  if ((result & 1) == 0)
    return objc_msgSend(a4, "logEventPointDisplayBacklightWithState:", a3);
  return result;
}

void sub_1DAB072DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAB0CCCC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,id location)
{
  id *v32;

  objc_destroyWeak(v32);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __HIDTouchEventCallback(void *a1)
{
  uint64_t Children;
  const __CFArray *v3;
  CFIndex Count;
  uint64_t v5;
  CFIndex v6;
  int v7;
  uint64_t v8;
  id v9;

  if (IOHIDEventGetType() == 11)
  {
    Children = IOHIDEventGetChildren();
    if (Children)
    {
      v3 = (const __CFArray *)Children;
      v9 = a1;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        Count = CFArrayGetCount(v3);
        if (Count >= 1)
        {
          v5 = Count;
          v6 = 0;
          v7 = 0;
          while (1)
          {
            CFArrayGetValueAtIndex(v3, v6);
            if (IOHIDEventGetType() == 11)
            {
              if (IOHIDEventGetIntegerValue())
                break;
            }
            v6 = ++v7;
            if (v5 <= v7)
              goto LABEL_9;
          }
          if ((objc_msgSend(v9, "userTouch") & 1) != 0)
            goto LABEL_15;
          v8 = 1;
          goto LABEL_14;
        }
LABEL_9:
        if (objc_msgSend(v9, "userTouch"))
        {
          v8 = 0;
LABEL_14:
          objc_msgSend(v9, "logEventBackwardUserTouch:", v8);
        }
      }
LABEL_15:

    }
  }
}

void sub_1DAB0D6B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,char a34)
{
  uint64_t v34;

  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Block_object_dispose(&a34, 8);
  _Block_object_dispose((const void *)(v34 - 200), 8);
  _Block_object_dispose((const void *)(v34 - 152), 8);
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

uint64_t updateDisplayIOReportAZLStats(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  NSObject *Samples;
  NSObject *v5;
  void *v6;
  void *v7;
  void *SamplesDelta;
  PLDisplayAZLStats *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  PLDisplayAZLStats *v14;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    if (objc_msgSend(v1, "subscription"))
    {
      objc_msgSend(v2, "subscription");
      objc_msgSend(v2, "subscribedChannels");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      Samples = IOReportCreateSamples();

      if (Samples)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v5 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "ioReportSample");
        v6 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v6)
        {
LABEL_7:
          objc_msgSend(v2, "setIoReportSample:", Samples);
          objc_msgSend(v2, "sampleTime");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setSampleTimePrevious:", v10);

          objc_msgSend(v2, "setSampleTime:", v5);
          v11 = 1;
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v2, "ioReportSample");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        if (SamplesDelta)
        {
          v14 = objc_alloc_init(PLDisplayAZLStats);
          v9 = v14;
          IOReportIterate();
          objc_msgSend(v2, "setDisplayAZLStats:", v9);

          goto LABEL_7;
        }
        PLLogDisplay();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          updateDisplayIOReportAZLStats_cold_4();

      }
      else
      {
        PLLogDisplay();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
          updateDisplayIOReportAZLStats_cold_3();
      }
      v11 = 0;
      goto LABEL_19;
    }
    PLLogDisplay();
    Samples = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG))
      updateDisplayIOReportAZLStats_cold_2();
  }
  else
  {
    PLLogDisplay();
    Samples = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG))
      updateDisplayIOReportAZLStats_cold_1();
  }
  v11 = 0;
LABEL_20:

  return v11;
}

void __updateDisplayIOReportAZLStats_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  IOReportChannelGetChannelName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &unk_1EA1C1550;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("power")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAvgPower:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAZLStats_block_invoke_cold_1(v7, v8);
LABEL_18:

    goto LABEL_19;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("azl_accum")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAzlAccum:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAZLStats_block_invoke_cold_2(v7, v8);
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("nits_accum")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setNitsAccum:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAZLStats_block_invoke_cold_3(v7, v8);
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("bl_update_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBlUpdateCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAZLStats_block_invoke_cold_4(v7, v8);
    goto LABEL_18;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("bl_frame_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setBlFrameCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAZLStats_block_invoke_cold_5(v7, v8);
    goto LABEL_18;
  }
LABEL_19:

  objc_autoreleasePoolPop(v2);
}

uint64_t updateDisplayIOReportAODStats(void *a1)
{
  id v1;
  void *v2;
  uint64_t v3;
  NSObject *Samples;
  _BOOL4 v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *SamplesDelta;
  PLDisplayAODStats *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  PLDisplayAODStats *v17;

  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_msgSend(v1, "subscription");
    PLLogDisplay();
    Samples = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG);
    if (v3)
    {
      if (v5)
        updateDisplayIOReportAODStats_cold_6();

      objc_msgSend(v2, "subscription");
      objc_msgSend(v2, "subscribedChannels");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      Samples = IOReportCreateSamples();

      if (Samples)
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "monotonicDate");
        v7 = objc_claimAutoreleasedReturnValue();
        PLLogDisplay();
        v8 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
          updateDisplayIOReportAODStats_cold_5(v2, v8);

        objc_msgSend(v2, "ioReportSample");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_11;
        objc_msgSend(v2, "ioReportSample");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        SamplesDelta = (void *)IOReportCreateSamplesDelta();

        if (SamplesDelta)
        {
          v17 = objc_alloc_init(PLDisplayAODStats);
          v12 = v17;
          IOReportIterate();
          objc_msgSend(v2, "setDisplayAODStats:", v12);

LABEL_11:
          objc_msgSend(v2, "setIoReportSample:", Samples);
          objc_msgSend(v2, "sampleTime");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "setSampleTimePrevious:", v13);

          objc_msgSend(v2, "setSampleTime:", v7);
          v14 = 1;
LABEL_23:

          goto LABEL_24;
        }
        PLLogDisplay();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          updateDisplayIOReportAODStats_cold_4();

      }
      else
      {
        PLLogDisplay();
        v7 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          updateDisplayIOReportAODStats_cold_3();
      }
      v14 = 0;
      goto LABEL_23;
    }
    if (v5)
      updateDisplayIOReportAODStats_cold_2();
  }
  else
  {
    PLLogDisplay();
    Samples = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(Samples, OS_LOG_TYPE_DEBUG))
      updateDisplayIOReportAODStats_cold_1();
  }
  v14 = 0;
LABEL_24:

  return v14;
}

void __updateDisplayIOReportAODStats_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;

  v2 = (void *)MEMORY[0x1DF0A47AC]();
  IOReportChannelGetChannelName();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", IOReportSimpleGetIntegerValue());
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = &unk_1EA1C1550;
  if (v4)
    v6 = (void *)v4;
  v7 = v6;

  if (objc_msgSend(v3, "isEqualToString:", CFSTR("awake_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAwakeCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_1(v7, v8);
LABEL_36:

    goto LABEL_37;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("media_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setMediaCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_2(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("flipbook_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFlipbookCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_3(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("flipbook_delay")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setFlipbookDelay:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_4(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("media_scanout")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setMediaScanout:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_5(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ambient_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAmbientCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_6(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("prc_repeat_coun")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPrcRepeatCoun:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_7(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("pdc_repeat_coun")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setPdcRepeatCoun:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_8(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("llm_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setLlmCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_9(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("apl_sum")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAplSum:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_10(v7, v8);
    goto LABEL_36;
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("apl_count")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setAplCount:", v7);
    PLLogDisplay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      __updateDisplayIOReportAODStats_block_invoke_cold_11(v7, v8);
    goto LABEL_36;
  }
LABEL_37:

  objc_autoreleasePoolPop(v2);
}

void sub_1DAB1020C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_9_4()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_10_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_1DAB132B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__15(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__15(uint64_t a1)
{

}

id PLLogDuetServiceDAS()
{
  if (PLLogDuetServiceDAS_onceToken != -1)
    dispatch_once(&PLLogDuetServiceDAS_onceToken, &__block_literal_global_26);
  return (id)PLLogDuetServiceDAS___logObj;
}

id PLLogPausedCharging()
{
  if (PLLogPausedCharging_onceToken != -1)
    dispatch_once(&PLLogPausedCharging_onceToken, &__block_literal_global_28);
  return (id)PLLogPausedCharging___logObj;
}

id PLLogUrsaNotification()
{
  if (PLLogUrsaNotification_onceToken != -1)
    dispatch_once(&PLLogUrsaNotification_onceToken, &__block_literal_global_8);
  return (id)PLLogUrsaNotification___logObj;
}

void sub_1DAB1D174(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAB1E2B4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAB22764(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,uint64_t a48,uint64_t a49,uint64_t a50,uint64_t a51,uint64_t a52,uint64_t a53,uint64_t a54,uint64_t a55,uint64_t a56,uint64_t a57,uint64_t a58,uint64_t a59,uint64_t a60,uint64_t a61,char a62,uint64_t a63)
{
  char a68;
  uint64_t v68;

  _Block_object_dispose(&a62, 8);
  _Block_object_dispose(&a68, 8);
  _Block_object_dispose(&STACK[0x208], 8);
  _Block_object_dispose(&STACK[0x238], 8);
  _Block_object_dispose(&STACK[0x268], 8);
  _Block_object_dispose(&STACK[0x298], 8);
  _Block_object_dispose(&STACK[0x2B8], 8);
  _Block_object_dispose((const void *)(v68 - 192), 8);
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

id PLLogSoC()
{
  if (PLLogSoC_onceToken != -1)
    dispatch_once(&PLLogSoC_onceToken, &__block_literal_global_29);
  return (id)PLLogSoC___logObj;
}

void sub_1DAB25358(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,uint64_t a47,id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1DAB25C10(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1DAB27448(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, id a9)
{
  objc_destroyWeak(&a9);
  _Unwind_Resume(a1);
}

uint64_t pushConfigToAggd(uint64_t a1, void *a2)
{
  uint64_t result;

  if (a2)
    return objc_msgSend(a2, "aggdTimerFired");
  return result;
}

void sub_1DAB3FD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, ...)
{
  va_list va;

  va_start(va, a6);
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

void sub_1DAB40064(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  _Block_object_dispose(&a27, 8);
  _Unwind_Resume(a1);
}

void sub_1DAB49DC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
  _Block_object_dispose(&a22, 8);
  _Block_object_dispose(&a28, 8);
  _Unwind_Resume(a1);
}

void sub_1DAB4A064(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1DAB4A048);
  }
  objc_exception_rethrow();
}

void sub_1DAB4A09C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DAB4AB98(void *a1, int a2)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1DAB4AB6CLL);
  }
  objc_exception_rethrow();
}

void sub_1DAB4ABC8(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DAB4AC88(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DAB4B38C(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  id v12;
  NSObject *v13;

  if (a2 == 2)
  {
    v12 = objc_begin_catch(exc_buf);
    PLLogCommon();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[PLBatteryAgent parseTimeAtHighSoc:].cold.1();

    objc_end_catch();
    JUMPOUT(0x1DAB4B330);
  }
  objc_begin_catch(exc_buf);
  JUMPOUT(0x1DAB4B334);
}

void sub_1DAB4B590(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  id v11;
  NSObject *v12;

  if (a2 == 2)
  {
    v11 = objc_begin_catch(exc_buf);
    PLLogCommon();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      -[PLBatteryAgent parseLowVoltageResidencyCounters:].cold.1();

    objc_end_catch();
    JUMPOUT(0x1DAB4B52CLL);
  }
  objc_begin_catch(exc_buf);
  JUMPOUT(0x1DAB4B530);
}

void sub_1DAB4B860(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1DAB4B86CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1DAB4B87C(_Unwind_Exception *a1)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DAB4B88C(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1DAB4B898);
}

void sub_1DAB4BAC4()
{
  objc_end_catch();
  JUMPOUT(0x1DAB4BACCLL);
}

void sub_1DAB4BAE0(_Unwind_Exception *exception_object)
{
  char v1;

  if ((v1 & 1) != 0)
    objc_end_catch();
  _Unwind_Resume(exception_object);
}

void sub_1DAB4EBDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t block, uint64_t a19, uint64_t (*a20)(uint64_t a1),void *a21,uint64_t a22)
{
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;

  if (a2)
  {
    if (a2 == 2)
    {
      v22 = objc_begin_catch(exception_object);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v23 = objc_opt_class();
        block = MEMORY[0x1E0C809B0];
        a19 = 3221225472;
        a20 = __46__PLBatteryAgent_logEventPointBatteryShutdown__block_invoke;
        a21 = &__block_descriptor_40_e5_v8__0lu32l8;
        a22 = v23;
        if (logEventPointBatteryShutdown_defaultOnce != -1)
          dispatch_once(&logEventPointBatteryShutdown_defaultOnce, &block);
        if (logEventPointBatteryShutdown_classDebugEnabled)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BatteryShutdown data could not be parsed"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "lastPathComponent");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryAgent logEventPointBatteryShutdown]");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logMessage:fromFile:fromFunction:fromLineNumber:", v24, v27, v28, 7385);

          PLLogCommon();
          v29 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }

      objc_end_catch();
      JUMPOUT(0x1DAB4EB90);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_1DAB4EFF0(void *exc_buf, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t (*a11)(uint64_t a1), void *a12, uint64_t a13)
{
  uint64_t v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  if (a2 == 2)
  {
    v14 = objc_begin_catch(exc_buf);
    if (objc_msgSend(*(id *)(v13 + 4000), "debugEnabled"))
    {
      v15 = objc_opt_class();
      a9 = MEMORY[0x1E0C809B0];
      a10 = 3221225472;
      a11 = __52__PLBatteryAgent_logEventPointBatteryPanicShutdown___block_invoke_2;
      a12 = &__block_descriptor_40_e5_v8__0lu32l8;
      a13 = v15;
      if (logEventPointBatteryPanicShutdown__defaultOnce != -1)
        dispatch_once(&logEventPointBatteryPanicShutdown__defaultOnce, &a9);
      if (logEventPointBatteryPanicShutdown__classDebugEnabled)
      {
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BatteryPanicShutdown data could not be parsed"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (void *)MEMORY[0x1E0D7FF98];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "lastPathComponent");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryAgent logEventPointBatteryPanicShutdown:]");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "logMessage:fromFile:fromFunction:fromLineNumber:", v16, v19, v20, 7430);

        PLLogCommon();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
          __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

      }
    }

    objc_end_catch();
    JUMPOUT(0x1DAB4EFC0);
  }
  objc_begin_catch(exc_buf);
  objc_exception_rethrow();
}

void sub_1DAB4F16C(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1DAB51788(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t (*a23)(uint64_t a1),void *a24,uint64_t a25)
{
  id v25;
  uint64_t v26;
  uint64_t *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;

  if (a2)
  {
    if (a2 == 2)
    {
      v25 = objc_begin_catch(exception_object);
      if (objc_msgSend(MEMORY[0x1E0D7FFA0], "debugEnabled"))
      {
        v26 = objc_opt_class();
        a21 = MEMORY[0x1E0C809B0];
        a22 = 3221225472;
        a23 = __55__PLBatteryAgent_logEventNoneBatteryConfigWithRawData___block_invoke_3394;
        a24 = &__block_descriptor_40_e5_v8__0lu32l8;
        a25 = v26;
        v27 = &a21;
        if (logEventNoneBatteryConfigWithRawData__defaultOnce_3392 != -1)
          dispatch_once(&logEventNoneBatteryConfigWithRawData__defaultOnce_3392, v27);

        if (logEventNoneBatteryConfigWithRawData__classDebugEnabled_3393)
        {
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("BatteryConfig data could not be parsed"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0D7FF98];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/PerfPowerServices_Operators/Operators/Agents/Hardware/PLBatteryAgent.m");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "lastPathComponent");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[PLBatteryAgent logEventNoneBatteryConfigWithRawData:]");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "logMessage:fromFile:fromFunction:fromLineNumber:", v28, v31, v32, 7860);

          PLLogCommon();
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            __111__PLProcessPortMap_pidAndProcessNameForDestAddress_withDestPort_withSourceAddress_withSourcePort_withProtocol___block_invoke_cold_1();

        }
      }

      objc_end_catch();
      JUMPOUT(0x1DAB51728);
    }
    objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

id PLLogBH()
{
  if (PLLogBH_onceToken != -1)
    dispatch_once(&PLLogBH_onceToken, &__block_literal_global_3639);
  return (id)PLLogBH___logObj;
}

void sub_1DAB5C0A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  uint64_t v35;

  _Block_object_dispose(&a31, 8);
  _Block_object_dispose(&a35, 8);
  _Block_object_dispose((const void *)(v35 - 208), 8);
  _Block_object_dispose((const void *)(v35 - 176), 8);
  _Block_object_dispose((const void *)(v35 - 144), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_19(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xEu);
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x1Eu);
}

uint64_t OUTLINED_FUNCTION_21(uint64_t result, uint64_t a2, float a3)
{
  *(float *)a2 = a3;
  *(_QWORD *)(a2 + 4) = result;
  return result;
}

void sub_1DAB5F814(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_33);
  return (id)logHandle__logHandle;
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServicesSignpostReader", "");
  v1 = (void *)logHandle__logHandle;
  logHandle__logHandle = (uint64_t)v0;

}

void sub_1DAB60910(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
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

void NotificationCallback_0(uint64_t a1, void *a2)
{
  NSObject *v2;
  _QWORD block[5];
  _QWORD v4[5];
  id v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x3032000000;
  v4[3] = __Block_byref_object_copy__19;
  v4[4] = __Block_byref_object_dispose__19;
  v5 = a2;
  dispatch_get_global_queue(-2, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __NotificationCallback_block_invoke_0;
  block[3] = &unk_1EA16D4A8;
  block[4] = v4;
  dispatch_async(v2, block);

  _Block_object_dispose(v4, 8);
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

id hdqRead16(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  void *v3;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  v2 = IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt);
  v3 = 0;
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", SLOWORD(output[0]));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t OUTLINED_FUNCTION_11_5(void *a1, const char *a2)
{
  return objc_msgSend(a1, "totalFGTimeSBC");
}

uint64_t OUTLINED_FUNCTION_12_6(void *a1, const char *a2)
{
  return objc_msgSend(a1, "totalBGTimeSBC");
}

id PLLogDuetServiceLpmSource()
{
  if (PLLogDuetServiceLpmSource_onceToken != -1)
    dispatch_once(&PLLogDuetServiceLpmSource_onceToken, &__block_literal_global_35);
  return (id)PLLogDuetServiceLpmSource___logObj;
}

uint64_t bq_sealed(mach_port_t a1)
{
  unsigned __int16 v2;

  v2 = 0;
  if (!controlReadU16(a1, 0, &v2))
    return (v2 >> 13) & 1;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    bq_sealed_cold_1();
  return 0xFFFFFFFFLL;
}

uint64_t bq_sleep_mode(uint64_t a1, int a2, int a3)
{
  char v6;
  _BYTE inputStruct[32];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if ((readBlock(a1, 64, 0, inputStruct, 0) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (a2)
  {
    if ((inputStruct[0] & 0x20) == 0 || a3)
    {
      v6 = inputStruct[0] | 0x20;
      goto LABEL_11;
    }
    return 1;
  }
  if ((inputStruct[0] & 0x20) == 0 && !a3)
    return 1;
  v6 = inputStruct[0] & 0xDF;
LABEL_11:
  inputStruct[0] = v6;
  if ((writeBlock(a1, 64, 0, inputStruct) & 0x80000000) != 0)
    return 4294967294;
  if ((readBlock(a1, 64, 0, inputStruct, 0) & 0x80000000) != 0)
    return 4294967293;
  if (((inputStruct[0] & 0x20) == 0) != a2)
    return 0;
  return 4294967292;
}

uint64_t bq_write_dfchecksum(uint64_t a1, unsigned int a2)
{
  mach_port_t v3;
  _BYTE inputStruct[10];
  __int16 v6;
  uint64_t v7;

  v3 = a1;
  v7 = *MEMORY[0x1E0C80C00];
  if ((readBlock(a1, 57, 0, inputStruct, 0) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v6 = __rev16(a2);
  return ((int)writeBlock(v3, 57, 0, inputStruct) >> 31);
}

uint64_t bq_vlow_enable(uint64_t a1, int a2)
{
  unsigned __int16 v4;
  unsigned __int16 v5;
  int v6;
  int v7;
  int v8;
  int v9;
  unsigned __int16 v10;
  uint64_t result;
  unsigned __int16 v12;
  int Block;
  unsigned __int16 v15;
  _BYTE inputStruct[8];
  unsigned __int8 v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = controlRead16(a1, 28);
  v5 = v4;
  if (v4 > 0xC602u)
  {
    if (v4 <= 0xCEC5u)
    {
      if (v4 > 0xC71Eu)
      {
        if (v4 > 0xCEBBu)
        {
          if (v4 == 52924)
            goto LABEL_60;
          v9 = 52933;
        }
        else
        {
          if (v4 == 50975)
            goto LABEL_60;
          v9 = 52923;
        }
      }
      else
      {
        if (v4 <= 0xC71Cu)
        {
          if (v4 != 50691)
          {
            v7 = 50692;
            goto LABEL_59;
          }
LABEL_47:
          v10 = (v4 & 0x7FFF) + a2;
          goto LABEL_64;
        }
        if (v4 == 50973)
          goto LABEL_47;
        v9 = 50974;
      }
LABEL_46:
      if (v4 != v9)
        goto LABEL_89;
      goto LABEL_47;
    }
    if (v4 > 0xD401u)
    {
      if (v4 > 0xD743u)
      {
        if (v4 == 55108)
          goto LABEL_47;
        v7 = 55109;
      }
      else
      {
        if (v4 == 54274)
          goto LABEL_47;
        v7 = 54275;
      }
    }
    else
    {
      if (v4 <= 0xD0ABu)
      {
        if (v4 == 52934)
          goto LABEL_60;
        v9 = 53419;
        goto LABEL_46;
      }
      if (v4 == 53420)
        goto LABEL_47;
      v7 = 53421;
    }
LABEL_59:
    if (v4 != v7)
      goto LABEL_89;
LABEL_60:
    v10 = (v4 & 0x7FFF) - (a2 ^ 1);
    goto LABEL_64;
  }
  if (v4 > 0x4EC5u)
  {
    if (v4 > 0x5401u)
    {
      if (v4 > 0x5743u)
      {
        if (v4 == 22340)
          goto LABEL_53;
        v6 = 22341;
      }
      else
      {
        if (v4 == 21506)
          goto LABEL_53;
        v6 = 21507;
      }
    }
    else
    {
      if (v4 <= 0x50ABu)
      {
        if (v4 != 20166)
        {
          v8 = 20651;
          goto LABEL_42;
        }
        goto LABEL_51;
      }
      if (v4 == 20652)
        goto LABEL_61;
      v6 = 20653;
    }
LABEL_50:
    if (v4 == v6)
      goto LABEL_51;
LABEL_89:
    if ((v4 & 0x8000u) != 0)
      return 4294967289;
    else
      return 4294967290;
  }
  if (v4 > 0x471Eu)
  {
    if (v4 > 0x4EBBu)
    {
      if (v4 != 20156)
      {
        v8 = 20165;
LABEL_42:
        if (v4 != v8)
          goto LABEL_89;
        goto LABEL_53;
      }
    }
    else if (v4 != 18207)
    {
      v8 = 20155;
      goto LABEL_42;
    }
LABEL_51:
    if ((a2 & 1) != 0)
      return 1;
    v10 = v4 - 1;
    goto LABEL_64;
  }
  if (v4 > 0x471Cu)
  {
    if (v4 == 18205)
      goto LABEL_53;
LABEL_61:
    if (a2)
      v10 = v4 + 1;
    else
      v10 = v4 - 1;
    goto LABEL_64;
  }
  if (v4 != 17923)
  {
    v6 = 17924;
    goto LABEL_50;
  }
LABEL_53:
  if (!a2)
    return 4294967292;
  v10 = v4 + 1;
LABEL_64:
  if ((readBlock(a1, 49, 0, inputStruct, 0) & 0x80000000) != 0)
    return 4294967294;
  if (v18 != a2)
  {
    v18 = a2;
    if ((writeBlock(a1, 49, 0, inputStruct) & 0x80000000) == 0)
    {
      Block = readBlock(a1, 49, 0, inputStruct, 0);
      result = 4294967294;
      if (Block < 0 || v18 != a2)
        return result;
      goto LABEL_78;
    }
    return 4294967294;
  }
  if ((v5 & 0x8000) == 0)
  {
    if (v5 != 20652 && v5 != 18206)
      return 4294967290;
    v12 = controlRead16(a1, 28);
    if (v12 != v5 || (__int16)v12 <= -1)
      return 4294967293;
    else
      return 1;
  }
LABEL_78:
  if ((bq_write_dfchecksum(a1, v10) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v15 = controlRead16(a1, 28);
  if (v10 != v15 || (__int16)v15 <= -1)
    return 4294967293;
  else
    return 0;
}

uint64_t gasgauge_swupdate()
{
  return gasgauge_swupdate_log(0);
}

uint64_t gasgauge_swupdate_log(uint64_t (*a1)())
{
  uint64_t (*v1)();
  uint8_t v3[16];
  size_t v4;
  _BYTE v5[64];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  if (a1)
    v1 = a1;
  else
    v1 = log_default;
  v4 = 64;
  if (sysctlbyname("hw.model", v5, &v4, 0, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      gasgauge_swupdate_log_cold_1();
    return 0xFFFFFFFFLL;
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "No gas gauge update for this platform.", v3, 2u);
    }
    ((void (*)(const char *))v1)("No gas gauge update for this platform.");
    return 0;
  }
}

uint64_t log_default()
{
  return 0;
}

uint64_t gasgauge_start_update_thread()
{
  return startUpdateThread(0);
}

uint64_t gasgauge_info(uint64_t result, _DWORD *a2, _DWORD *a3, _DWORD *a4)
{
  *a2 = *(_DWORD *)(*(_QWORD *)(result + 8) + 24);
  *a4 = *(_DWORD *)(result + 4);
  *a3 = *(_DWORD *)(result + 16);
  return result;
}

unsigned int *gasgauge_open()
{
  unsigned int *v0;
  uint64_t v1;
  uint64_t v2;
  _OWORD v4[9];
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

  if (!okToLoad())
    return 0;
  v0 = (unsigned int *)malloc(0x18uLL);
  if (v0)
  {
    v1 = ggctl_connect(0);
    *v0 = v1;
    if ((_DWORD)v1)
    {
      v2 = v1;
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
      v5 = 0u;
      memset(v4, 0, sizeof(v4));
      ggctl_get_device_configuration(v1, v4);
      if (!ggctl_map_currentlog(v2, (_QWORD *)v0 + 1))
      {
        v0[4] = 0;
        v0[1] = HIDWORD(v5);
        return v0;
      }
      ggctl_disconnect(*v0);
    }
    free(v0);
    return 0;
  }
  return v0;
}

void gasgauge_close(_QWORD *a1)
{
  if (a1)
  {
    if (a1[1])
    {
      MEMORY[0x1DF0A3A98](*(unsigned int *)a1, 0, *MEMORY[0x1E0C83DA0]);
      a1[1] = 0;
    }
    ggctl_disconnect(*(unsigned int *)a1);
    free(a1);
  }
}

uint64_t gasgauge_currentlog_interval(uint64_t a1)
{
  _BYTE *v1;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!*(_DWORD *)a1)
    return 0xFFFFFFFFLL;
  v1 = *(_BYTE **)(a1 + 8);
  if (!v1)
    return 0xFFFFFFFFLL;
  if (*v1)
    return *(unsigned int *)(a1 + 4);
  return 1;
}

uint64_t gasgauge_currentlog_sleepinterval(uint64_t a1)
{
  _BYTE *v1;

  if (!a1)
    return 0xFFFFFFFFLL;
  if (!*(_DWORD *)a1)
    return 0xFFFFFFFFLL;
  v1 = *(_BYTE **)(a1 + 8);
  if (!v1)
    return 0xFFFFFFFFLL;
  if (*v1)
    return 30;
  return 0;
}

uint64_t gasgauge_currentlog_start__(unsigned int *a1, int a2, char a3)
{
  uint64_t v4;
  unsigned __int8 *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  int v13;
  int v14;
  int v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0xFFFFFFFFLL;
  v4 = *a1;
  if (!(_DWORD)v4)
    return 0xFFFFFFFFLL;
  v5 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
  if (!v5)
    return 0xFFFFFFFFLL;
  if (a2)
    *v5 = 1;
  if (!*v5)
    goto LABEL_17;
  v6 = a3 & 3;
  v7 = ggctl_open_device(v4, 1, v6 == 1);
  if ((v7 & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  v8 = v7;
  if (v6 == 1)
  {
    v9 = ggctl_drainDataLog(v7);
    if ((_DWORD)v9)
    {
      v10 = v9;
      ggctl_close_device(*a1, v8);
      goto LABEL_14;
    }
  }
  v10 = ggctl_enable_currentlog(*a1, 1u);
  ggctl_close_device(*a1, v8);
  if ((_DWORD)v10)
  {
LABEL_14:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      gasgauge_currentlog_start___cold_1();
    return v10;
  }
  v5 = (unsigned __int8 *)*((_QWORD *)a1 + 1);
LABEL_17:
  a1[4] = *((_DWORD *)v5 + 6);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v12 = *v5;
    v15 = 67109120;
    v16 = v12;
    _os_log_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "data log supported: %d", (uint8_t *)&v15, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v13 = *(_DWORD *)(*((_QWORD *)a1 + 1) + 4);
    v15 = 67109120;
    v16 = v13;
    _os_log_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "data log clients: %d", (uint8_t *)&v15, 8u);
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v14 = *(_DWORD *)(*((_QWORD *)a1 + 1) + 24);
    v15 = 67109120;
    v16 = v14;
    _os_log_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "data log entries: %u", (uint8_t *)&v15, 8u);
  }
  return 0;
}

uint64_t gasgauge_currentlog_start(unsigned int *a1)
{
  return gasgauge_currentlog_start__(a1, 0, 1);
}

uint64_t gasgauge_currentlog_start_collection(unsigned int *a1, char a2)
{
  return gasgauge_currentlog_start__(a1, 0, a2);
}

uint64_t gasgauge_currentlog_stop(uint64_t a1)
{
  mach_port_t v2;
  _BYTE *v3;
  uint64_t result;

  if (!a1)
    return 4294967294;
  v2 = *(_DWORD *)a1;
  if (!v2)
    return 4294967293;
  v3 = *(_BYTE **)(a1 + 8);
  if (!v3)
    return 4294967293;
  if (!*v3)
    return 0;
  result = ggctl_enable_currentlog(v2, 0);
  if ((_DWORD)result)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      gasgauge_currentlog_stop_cold_1();
    return 0xFFFFFFFFLL;
  }
  return result;
}

uint64_t gasgauge_currentlog_entries(unsigned int *a1, uint64_t a2, unint64_t *a3, char a4)
{
  uint64_t v4;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int v14;
  _DWORD *v15;
  uint64_t v17;
  int v18;
  _DWORD *v19;
  unint64_t v20;
  unsigned int v21;
  uint64_t v22;
  __int128 v23;
  unsigned int v24;

  v4 = 4294967294;
  if (!a1 || !a3)
    return v4;
  v7 = *a1;
  if (!(_DWORD)v7)
    return 4294967293;
  v8 = *((_QWORD *)a1 + 1);
  if (!v8)
    return 4294967293;
  v9 = a2;
  v10 = a4 & 3;
  if (!*(_BYTE *)v8)
  {
    if (v10 != 1)
      return v4;
    if (!a2)
    {
      v4 = 0;
      *a3 = 1;
      return v4;
    }
    if (!*a3)
      return 0;
    v17 = ggctl_open_device(v7, 1, 1);
    if ((v17 & 0x80000000) == 0)
    {
      v12 = v17;
      v18 = ggctl_hdqRead16(v17, 20);
      if (v18 < 0)
      {
        v4 = v18 & (v18 >> 31);
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          gasgauge_currentlog_entries_cold_1();
      }
      else
      {
        *(_DWORD *)v9 = 0;
        gettimeofday((timeval *)(v9 + 8), 0);
        v4 = 0;
        --*(_QWORD *)(v9 + 8);
        *a3 = 1;
      }
      goto LABEL_38;
    }
    return 0xFFFFFFFFLL;
  }
  if (v10 == 1)
  {
    v11 = ggctl_open_device(v7, 1, 1);
    if ((v11 & 0x80000000) == 0)
    {
      v12 = v11;
      v13 = ggctl_drainDataLog(v11);
      v14 = a1[4];
      v8 = *((_QWORD *)a1 + 1);
      v15 = (_DWORD *)(v8 + 24);
      if (v14 <= *(_DWORD *)(v8 + 24))
      {
        v4 = v13;
        if ((_DWORD)v13)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            gasgauge_currentlog_entries_cold_2();
LABEL_38:
          ggctl_close_device(*a1, v12);
          return v4;
        }
        goto LABEL_23;
      }
      return 4294967292;
    }
    return 0xFFFFFFFFLL;
  }
  v14 = a1[4];
  v15 = (_DWORD *)(v8 + 24);
  if (v14 > *(_DWORD *)(v8 + 24))
    return 4294967292;
  v12 = 0xFFFFFFFFLL;
LABEL_23:
  if (v9)
  {
    v19 = (_DWORD *)(v8 + 24);
    if (v14 >= *(_DWORD *)(v8 + 24))
    {
      v20 = 0;
    }
    else
    {
      v20 = 0;
      do
      {
        if (v20 >= *a3)
          break;
        v21 = a1[1];
        if (*v19 - v14 > v21)
          v14 = *v19 - v21;
        a1[4] = v14 + 1;
        ++v20;
        v22 = v8 + 24 * (int)(v14 % v21);
        v23 = *(_OWORD *)(v22 + 32);
        *(_QWORD *)(v9 + 16) = *(_QWORD *)(v22 + 48);
        *(_OWORD *)v9 = v23;
        v9 += 24;
        v14 = a1[4];
        v8 = *((_QWORD *)a1 + 1);
        v19 = (_DWORD *)(v8 + 24);
      }
      while (v14 < *(_DWORD *)(v8 + 24));
    }
  }
  else
  {
    v24 = a1[1];
    if (*v15 - v14 < v24)
      v24 = *v15 - v14;
    v20 = v24;
  }
  v4 = 0;
  *a3 = v20;
  if ((_DWORD)v12 != -1)
    goto LABEL_38;
  return v4;
}

uint64_t gasgauge_currentlog_get_entries(unsigned int *a1, uint64_t a2, unint64_t *a3)
{
  return gasgauge_currentlog_entries(a1, a2, a3, 1);
}

uint64_t gasgauge_sn(mach_port_t *a1, char *a2, unsigned int a3)
{
  uint64_t Block;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  size_t v10;
  _OWORD v12[22];
  char __src[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  memset(v12, 0, sizeof(v12));
  if (ggctl_get_device_configuration(*a1, v12))
    return 4294967274;
  v7 = ggctl_open_device(*a1, 1, 1);
  if ((v7 & 0x80000000) != 0)
    return 4294967277;
  v8 = v7;
  if (LODWORD(v12[0]))
    v9 = LODWORD(v12[0]);
  else
    v9 = 2;
  Block = readBlock(v7, 0xFFFFFFFFLL, v9, __src, 0);
  if ((Block & 0x80000000) != 0)
  {
    memset(__src, 48, 6);
    Block = 4294967291;
  }
  ggctl_close_device(*a1, v8);
  if (a3 >= 0x12)
    v10 = 18;
  else
    v10 = a3;
  strncpy(a2, __src, v10);
  return Block;
}

uint64_t gasgauge_disconnect(mach_port_t *a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  _OWORD v5[21];
  __int128 v6;

  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  if (ggctl_get_device_configuration(*a1, v5))
    return 4294967274;
  if (!DWORD1(v6))
    return 0;
  v3 = ggctl_open_device(*a1, 1, 1);
  if ((v3 & 0x80000000) != 0)
    return 4294967277;
  v4 = v3;
  result = gaugeDisconnect(v3);
  if ((result & 0x80000000) == 0)
  {
    ggctl_close_device(*a1, v4);
    return 4294967282;
  }
  return result;
}

uint64_t gasgauge_watch()
{
  return 0xFFFFFFFFLL;
}

void bq_sealed_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "could not read gas gauge control status", v0, 2u);
  OUTLINED_FUNCTION_6();
}

void gasgauge_swupdate_log_cold_1()
{
  int *v0;
  char *v1;
  int v2;
  char *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v0 = __error();
  v1 = strerror(*v0);
  v2 = 136315138;
  v3 = v1;
  _os_log_error_impl(&dword_1DA9D6000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "could not find hw.model: %s", (uint8_t *)&v2, 0xCu);
}

void gasgauge_currentlog_start___cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, MEMORY[0x1E0C81028], v0, "cannot enable current log (%d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void gasgauge_currentlog_stop_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, MEMORY[0x1E0C81028], v0, "cannot disable currentlog %#x", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void gasgauge_currentlog_entries_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, MEMORY[0x1E0C81028], v0, "cannot read average current (%d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

void gasgauge_currentlog_entries_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_9_0();
  OUTLINED_FUNCTION_12_1(&dword_1DA9D6000, MEMORY[0x1E0C81028], v0, "cannot drain data log (%d)", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_6();
}

uint64_t ggctl_connect(io_object_t *a1)
{
  mach_port_t v2;
  const __CFDictionary *v3;
  io_service_t MatchingService;
  io_object_t v5;
  kern_return_t v6;
  int v7;
  NSObject *v8;
  uint64_t v9;
  NSObject *v10;
  uint64_t result;
  uint64_t v12;
  uint64_t v13;
  io_connect_t connect;

  connect = 0;
  v2 = *MEMORY[0x1E0CBBAA8];
  v3 = IOServiceMatching("AppleHDQGasGaugeControl");
  MatchingService = IOServiceGetMatchingService(v2, v3);
  if (MatchingService)
  {
    v5 = MatchingService;
    v6 = IOServiceOpen(MatchingService, *MEMORY[0x1E0C83DA0], 0, &connect);
    if (v6)
    {
      v7 = v6;
      v8 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        ggctl_connect_cold_2(v7, v8, v9);
      connect = 0;
    }
    if (a1)
      *a1 = v5;
    else
      IOObjectRelease(v5);
    return connect;
  }
  else
  {
    v10 = logger;
    result = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR);
    if ((_DWORD)result)
    {
      ggctl_connect_cold_1(v10, v12, v13);
      return 0;
    }
  }
  return result;
}

uint64_t ggctl_disconnect(uint64_t connect)
{
  if ((_DWORD)connect)
    return IOServiceClose(connect);
  return connect;
}

void ggctl_reset(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  NSObject *v3;
  uint8_t buf[8];
  uint64_t input;

  input = a2;
  v2 = IOConnectCallMethod(a1, 0, &input, 1u, 0, 0, 0, 0, 0, 0);
  v3 = logger;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_reset_cold_1();
  }
  else
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1DA9D6000, v3, OS_LOG_TYPE_DEFAULT, "gas gauge: reset", buf, 2u);
    }
    ++gauge_reset_count;
  }
}

uint64_t ggctl_get_hdq_state(mach_port_t a1)
{
  kern_return_t v1;
  uint32_t outputCnt;
  uint64_t output;

  output = 0;
  outputCnt = 1;
  v1 = IOConnectCallMethod(a1, 1u, 0, 0, 0, 0, &output, &outputCnt, 0, 0);
  if (v1 == -536870183)
    return 4294967294;
  if (v1)
    return 0xFFFFFFFFLL;
  return output != 0;
}

uint64_t ggctl_get_device_configuration(mach_port_t a1, void *outputStruct)
{
  size_t outputStructCnt;

  outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, outputStruct, &outputStructCnt);
}

uint64_t ggctl_enable_currentlog(mach_port_t a1, unsigned int a2)
{
  uint64_t input;

  input = a2;
  return IOConnectCallScalarMethod(a1, 3u, &input, 1u, 0, 0);
}

uint64_t ggctl_map_currentlog(uint64_t a1, _QWORD *a2)
{
  uint64_t result;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  v5 = 0;
  v6 = 0;
  result = MEMORY[0x1DF0A3A8C](a1, 0, *MEMORY[0x1E0C83DA0], &v6, &v5, 1);
  v4 = v6;
  if ((_DWORD)result)
    v4 = 0;
  *a2 = v4;
  return result;
}

uint64_t ggctl_open_device(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v3;
  int hdq_state;
  NSObject *v5;

  v3 = a1;
  if (!a3)
    return v3;
  hdq_state = ggctl_get_hdq_state(a1);
  if (hdq_state < 0)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_2();
  }
  else
  {
    if (hdq_state)
    {
      if (IOConnectCallScalarMethod(v3, 6u, 0, 0, 0, 0)
        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      {
        ggctl_open_device_cold_4();
      }
      return v3;
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      ggctl_open_device_cold_3();
    ggctl_reset(v3, 1u);
  }
  v5 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    ggctl_open_device_cold_1(v5);
  return 0xFFFFFFFFLL;
}

uint64_t hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqBreak(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;

  v1 = IOConnectCallScalarMethod(a1, 6u, 0, 0, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t ggctl_hdqRead8(mach_port_t a1, int a2)
{
  uint32_t outputCnt;
  uint64_t input;
  int64x2_t v5;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  input = a2;
  v5 = vdupq_n_s64(8uLL);
  outputCnt = 1;
  if (IOConnectCallScalarMethod(a1, 7u, &input, 3u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_1DABA2120;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t ggctl_controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_readBlock(mach_port_t a1, int a2, int a3, void *outputStruct, _BYTE *a5)
{
  uint64_t result;
  size_t v7;
  uint32_t outputCnt;
  uint64_t output;
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  output = 0;
  outputCnt = 1;
  v7 = 32;
  if (IOConnectCallMethod(a1, 9u, input, 2u, 0, 0, &output, &outputCnt, outputStruct, &v7))
    return 0xFFFFFFFFLL;
  result = 0;
  if (a5)
    *a5 = output;
  return result;
}

uint64_t ggctl_writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t ggctl_gaugeInterrupts(mach_port_t a1, unsigned int a2)
{
  kern_return_t v2;
  unsigned int v3;
  uint64_t input;

  input = a2;
  v2 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v2 == -536870183)
    v3 = -2;
  else
    v3 = -1;
  if (v2)
    return v3;
  else
    return 0;
}

CFDictionaryRef pmps_service()
{
  CFDictionaryRef result;
  CFDictionaryRef v1;
  __CFDictionary *v2;
  void *keys;

  keys = CFSTR("built-in");
  result = CFDictionaryCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const void **)&keys, MEMORY[0x1E0C9AE50], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (result)
  {
    v1 = result;
    v2 = IOServiceMatching("IOPMPowerSource");
    CFDictionarySetValue(v2, CFSTR("IOPropertyMatch"), v1);
    CFRelease(v1);
    return (CFDictionaryRef)IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v2);
  }
  return result;
}

uint64_t uart_open_device(uint64_t a1, uint64_t a2, int a3)
{
  return ggctl_open_device(a1, 0, a3);
}

uint64_t hdqRead16_0(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t hdqWrite8(mach_port_t a1, char a2, unsigned __int8 a3)
{
  uint64_t v4;
  __int128 v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = a2 & 0x7F | (a3 << 8) | 0x80u;
  v5 = xmmword_1DABA2120;
  if (IOConnectCallScalarMethod(a1, 7u, &v4, 3u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlOp16(mach_port_t a1, int a2)
{
  uint64_t input;

  input = a2;
  if (IOConnectCallScalarMethod(a1, 0xAu, &input, 1u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t controlRead16(mach_port_t a1, int a2)
{
  uint64_t v3;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v3 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v3, 1u, output, &outputCnt))
    return 0xFFFFFFFFLL;
  else
    return LODWORD(output[0]);
}

uint64_t controlWrite16(mach_port_t a1, int a2, int a3)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t writeBlock(mach_port_t a1, int a2, int a3, void *inputStruct)
{
  uint64_t input[3];

  input[2] = *MEMORY[0x1E0C80C00];
  input[0] = a2;
  input[1] = a3;
  if (IOConnectCallMethod(a1, 0xFu, input, 2u, inputStruct, 0x20uLL, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t drainDataLog(mach_port_t a1)
{
  if (IOConnectCallMethod(a1, 0xEu, 0, 0, 0, 0, 0, 0, 0, 0))
    return 0xFFFFFFFFLL;
  else
    return 0;
}

uint64_t gaugeEnableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 1;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisableInterrupts(mach_port_t a1)
{
  kern_return_t v1;
  unsigned int v2;
  uint64_t input;

  input = 0;
  v1 = IOConnectCallScalarMethod(a1, 0x10u, &input, 1u, 0, 0);
  if (v1 == -536870183)
    v2 = -2;
  else
    v2 = -1;
  if (v1)
    return v2;
  else
    return 0;
}

uint64_t gaugeDisconnect(mach_port_t a1)
{
  int i;
  int v3;
  NSObject *v4;
  unsigned int v6;
  __int16 v7;
  uint64_t v8;
  uint32_t outputCnt;
  uint64_t input[2];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_OWORD *)input = xmmword_1DABA2130;
  IOConnectCallScalarMethod(a1, 0xAu, input, 2u, 0, 0);
  for (i = 0; i != 3; ++i)
  {
    input[0] = 0;
    outputCnt = 1;
    v8 = 23;
    if (IOConnectCallScalarMethod(a1, 0xBu, &v8, 1u, input, &outputCnt))
      v3 = -1;
    else
      v3 = input[0];
    if (!v3)
      break;
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      LODWORD(input[0]) = 67109376;
      HIDWORD(input[0]) = i;
      LOWORD(input[1]) = 1024;
      *(_DWORD *)((char *)&input[1] + 2) = v3;
      _os_log_error_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_ERROR, "%d: retry OpenProtector (%d)", (uint8_t *)input, 0xEu);
    }
    usleep(0xF4240u);
  }
  v7 = 0;
  input[0] = 0;
  outputCnt = 1;
  v8 = 32;
  IOConnectCallScalarMethod(a1, 0xBu, &v8, 1u, input, &outputCnt);
  if (controlReadU16(a1, 0, &v7))
    return 4294967291;
  if (v3)
    v6 = -36;
  else
    v6 = 0;
  if ((v7 & 0x2000) != 0)
    return v6;
  else
    return 0xFFFFFFFFLL;
}

uint64_t controlReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 8u, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadS8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t hdqReadU8(mach_port_t a1, int a2, _BYTE *a3)
{
  uint64_t result;

  result = ggctl_hdqRead8(a1, a2);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t controlReadS16(mach_port_t a1, int a2, _WORD *a3)
{
  uint64_t result;
  uint64_t v5;
  uint32_t outputCnt;
  uint64_t output[2];

  output[1] = *MEMORY[0x1E0C80C00];
  output[0] = 0;
  outputCnt = 1;
  v5 = a2;
  if (IOConnectCallScalarMethod(a1, 0xBu, &v5, 1u, output, &outputCnt))
    result = 0xFFFFFFFFLL;
  else
    result = LODWORD(output[0]);
  if ((result & 0x80000000) == 0)
  {
    if (a3)
      *a3 = result;
    return 0;
  }
  return result;
}

uint64_t dumpBuffer(unsigned __int8 *a1, int a2)
{
  uint64_t v3;
  int v4;

  if (a2 >= 1)
  {
    v3 = a2;
    do
    {
      v4 = *a1++;
      printf(" %02x", v4);
      --v3;
    }
    while (v3);
  }
  return putchar(10);
}

uint64_t registerName(uint64_t a1, unsigned int a2)
{
  uint64_t v2;

  if (!a2)
    return 0;
  if (a2 < 0x600)
  {
    if (a2 - 1281 > 1 || (*(_DWORD *)a1 | 4) != 0x1E)
      goto LABEL_8;
    return 0;
  }
  if ((*(_DWORD *)a1 | 2) == 0xE)
    return 0;
LABEL_8:
  v2 = *(_QWORD *)(a1 + 72);
  if (!v2
    && (a2 < 0x600 || (v2 = *(_QWORD *)(a1 + 48)) == 0)
    && (a2 < 0x501 || (v2 = *(_QWORD *)(a1 + 40)) == 0)
    && (a2 < 0x313 || (v2 = *(_QWORD *)(a1 + 32)) == 0)
    && (a2 < 0x132 || (v2 = *(_QWORD *)(a1 + 24)) == 0))
  {
    if (a2 < 0x119)
      return *(_QWORD *)(a1 + 8);
    v2 = *(_QWORD *)(a1 + 16);
    if (!v2)
      return *(_QWORD *)(a1 + 8);
  }
  return v2;
}

uint64_t readRegister(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  int v4;
  uint64_t result;
  uint64_t (*v6)(_WORD *);

  v4 = *(_DWORD *)(a2 + 4);
  result = 0xFFFFFFFFLL;
  if (v4 <= 1)
  {
    if (v4)
    {
      if (v4 == 1)
        return hdqReadU16(a3, *(_DWORD *)a2, a1);
    }
    else
    {
      return hdqReadS16(a3, *(_DWORD *)a2, a1);
    }
  }
  else
  {
    switch(v4)
    {
      case 100:
        v6 = *(uint64_t (**)(_WORD *))(a2 + 64);
        if (v6)
          return v6(a1);
        break;
      case 10:
        return controlReadU16(a3, *(_DWORD *)a2, a1);
      case 2:
        result = ggctl_hdqRead8(a3, *(_DWORD *)a2);
        if ((result & 0x80000000) == 0)
        {
          if (a1)
            *(_BYTE *)a1 = result;
          return 0;
        }
        break;
    }
  }
  return result;
}

uint64_t getFWVersion(mach_port_t a1, __int16 *a2)
{
  __int16 v3;
  uint64_t result;

  v3 = getFWVersion_gFWVersion;
  if (getFWVersion_gFWVersion)
    goto LABEL_2;
  if (!controlReadU16(a1, 2, &getFWVersion_gFWVersion))
  {
    v3 = getFWVersion_gFWVersion;
    if (getFWVersion_gFWVersion == 256)
    {
      v3 = 1536;
      getFWVersion_gFWVersion = 1536;
    }
LABEL_2:
    result = 0;
    *a2 = v3;
    return result;
  }
  return 0xFFFFFFFFLL;
}

double readLifetimeData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  __int128 v7;
  unsigned __int16 v8;
  __int128 outputStruct;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) == 0
    && v8 >= 0x313u
    && !ggctl_readBlock(a3, -1, 4, &outputStruct, 0))
  {
    v6 = v10;
    *a1 = outputStruct;
    a1[1] = v6;
    if (!ggctl_readBlock(a3, -1, 6, &outputStruct, 0))
    {
      result = *(double *)&outputStruct;
      v7 = v10;
      a1[2] = outputStruct;
      a1[3] = v7;
    }
  }
  return result;
}

double readRaTableData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 7, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

double readIMAXAndSOCSmoothData(_OWORD *a1, uint64_t a2, mach_port_t a3)
{
  double result;
  __int128 v6;
  unsigned __int16 v7;
  _OWORD outputStruct[2];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  if ((getFWVersion(a3, (__int16 *)&v7) & 0x80000000) == 0
    && v7 >= 0x600u
    && !ggctl_readBlock(a3, -1, 8, outputStruct, 0))
  {
    result = *(double *)outputStruct;
    v6 = outputStruct[1];
    *a1 = outputStruct[0];
    a1[1] = v6;
  }
  return result;
}

uint64_t findRaWeightMulitplier(int a1)
{
  uint64_t v1;

  v1 = 0;
  while ((unsigned __int16)battery_health_metric_config[v1] != a1)
  {
    v1 += 4;
    if (v1 == 68)
      return 0;
  }
  return *(unsigned int *)&battery_health_metric_config[v1 + 2];
}

float calculateWra(unsigned int a1, unsigned int a2, unsigned int a3, unsigned int a4, unsigned int a5, unsigned int a6, unsigned int a7, unsigned int a8, unsigned __int16 a9)
{
  return (double)a2 * 0.137995
       + (double)a1 * 0.0693069
       + (double)a3 * 0.137376
       + (double)a4 * 0.137376
       + (double)a5 * 0.137376
       + (double)a6 * 0.137376
       + (double)a7 * 0.137376
       + (double)a8 * 0.0872525
       + (double)a9 * 0.0185644;
}

float calculateChemicalWeightedRa(unsigned int a1, float a2)
{
  return (float)((float)a1 * a2) / 1000.0;
}

CFDictionaryRef readShutdownReasonData(mach_port_t a1)
{
  NSObject *v2;
  const char *v3;
  _OWORD v5[2];
  __int128 v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  int v11;
  _OWORD v12[3];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v7 = 0;
  v6 = 0u;
  memset(v5, 0, sizeof(v5));
  memset(v12, 0, sizeof(v12));
  if (ggctl_logShutdownReason(a1, (uint64_t)v5, 1u))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2502;
    v3 = "%s:%d cannot read data";
LABEL_4:
    _os_log_impl(&dword_1DA9D6000, v2, OS_LOG_TYPE_DEFAULT, v3, buf, 0x12u);
    return 0;
  }
  if (!*((_QWORD *)&v6 + 1))
  {
    v2 = logger;
    if (!os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      return 0;
    *(_DWORD *)buf = 136315394;
    v9 = "readShutdownReasonData";
    v10 = 1024;
    v11 = 2506;
    v3 = "%s:%d invalid timestamp";
    goto LABEL_4;
  }
  return parseShutdownReason((__int16 *)v5, (const UInt8 *)v12, a1);
}

uint64_t ggctl_logShutdownReason(mach_port_t a1, uint64_t a2, unsigned int a3)
{
  kern_return_t v4;
  __int128 v5;
  __int128 v7;
  uint64_t input;
  uint64_t v9;
  size_t v10;
  __int128 outputStruct;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _OWORD inputStruct[3];
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v10 = 64;
  if (!a2)
    return 0xFFFFFFFFLL;
  if ((a3 & 1) != 0)
  {
    v13 = 0u;
    v14 = 0u;
    outputStruct = 0u;
    v12 = 0u;
    input = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &input, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
    if (!v4)
    {
      v5 = v12;
      *(_OWORD *)a2 = outputStruct;
      *(_OWORD *)(a2 + 16) = v5;
      *(_OWORD *)(a2 + 32) = v13;
      *(_DWORD *)(a2 + 48) = v14;
    }
  }
  else
  {
    v7 = *(_OWORD *)(a2 + 16);
    inputStruct[0] = *(_OWORD *)a2;
    inputStruct[1] = v7;
    inputStruct[2] = *(_OWORD *)(a2 + 32);
    v16 = *(_DWORD *)(a2 + 48);
    v9 = a3;
    v4 = IOConnectCallMethod(a1, 0x11u, &v9, 1u, inputStruct, 0x40uLL, 0, 0, &outputStruct, &v10);
  }
  if (v4)
    return 0xFFFFFFFFLL;
  else
    return 0;
}

CFDictionaryRef parseShutdownReason(__int16 *a1, const UInt8 *a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  CFDictionaryRef v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v11;
  uint64_t v12;
  int v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  int v28;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  uint64_t valuePtr;
  uint64_t input;
  size_t v37;
  void *keys[23];
  __int128 v39;
  __int128 v40;
  const __CFString *v41;
  void *values[22];
  __int128 v43;
  __int128 v44;
  __int128 v45;
  UInt8 bytes[16];
  __int128 v47;
  uint64_t v48;
  __int128 outputStruct;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0;
  keys[0] = CFSTR("ShutDownTimestamp");
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  valuePtr = *((_QWORD *)a1 + 5);
  values[0] = CFNumberCreate(v6, kCFNumberLongType, &valuePtr);
  keys[1] = CFSTR("ShutDownUISoc");
  v34 = *((_DWORD *)a1 + 12);
  values[1] = CFNumberCreate(v6, kCFNumberFloatType, &v34);
  keys[2] = CFSTR("ShutDownTemperature");
  v33 = *a1;
  values[2] = CFNumberCreate(v6, kCFNumberIntType, &v33);
  keys[3] = CFSTR("ShutDownPresentDOD");
  v32 = a1[1];
  values[3] = CFNumberCreate(v6, kCFNumberIntType, &v32);
  keys[4] = CFSTR("ShutDownMaxRa08");
  v31 = a1[2];
  values[4] = CFNumberCreate(v6, kCFNumberIntType, &v31);
  keys[5] = CFSTR("ShutDownNominalChargeCapacity");
  v30 = (unsigned __int16)a1[3];
  values[5] = CFNumberCreate(v6, kCFNumberIntType, &v30);
  keys[6] = CFSTR("ShutDownPrevNominalChargeCapacity");
  v29 = (unsigned __int16)a1[4];
  values[6] = CFNumberCreate(v6, kCFNumberIntType, &v29);
  keys[7] = CFSTR("ShutDownFullChargeCapacity");
  v28 = a1[5];
  values[7] = CFNumberCreate(v6, kCFNumberIntType, &v28);
  keys[8] = CFSTR("ShutDownPrevFullChargeCapacity");
  v27 = a1[6];
  values[8] = CFNumberCreate(v6, kCFNumberIntType, &v27);
  keys[9] = CFSTR("ShutDownRemainingCapacity");
  v26 = a1[7];
  values[9] = CFNumberCreate(v6, kCFNumberIntType, &v26);
  keys[10] = CFSTR("ShutDownPrevRemainingCapacity");
  v25 = a1[8];
  values[10] = CFNumberCreate(v6, kCFNumberIntType, &v25);
  keys[11] = CFSTR("ShutDownCycleCount");
  v24 = (unsigned __int16)a1[9];
  values[11] = CFNumberCreate(v6, kCFNumberIntType, &v24);
  keys[12] = CFSTR("ShutDownMaxDischargeCurrent");
  v23 = a1[10];
  values[12] = CFNumberCreate(v6, kCFNumberIntType, &v23);
  keys[13] = CFSTR("ShutDownTimeAbove95");
  v22 = *((unsigned __int8 *)a1 + 22);
  values[13] = CFNumberCreate(v6, kCFNumberIntType, &v22);
  keys[14] = CFSTR("ShutDownVoltage");
  v21 = *(__int16 *)((char *)a1 + 23);
  values[14] = CFNumberCreate(v6, kCFNumberIntType, &v21);
  keys[15] = CFSTR("ShutDownPrevVoltage");
  v20 = *(__int16 *)((char *)a1 + 25);
  values[15] = CFNumberCreate(v6, kCFNumberIntType, &v20);
  keys[16] = CFSTR("ShutDownAverageCurrent");
  v19 = *(__int16 *)((char *)a1 + 27);
  values[16] = CFNumberCreate(v6, kCFNumberIntType, &v19);
  keys[17] = CFSTR("ShutDownPrevAverageCurrent");
  v18 = *(__int16 *)((char *)a1 + 29);
  values[17] = CFNumberCreate(v6, kCFNumberIntType, &v18);
  keys[18] = CFSTR("ShutDownCycleCountLastQmax");
  v17 = *((unsigned __int8 *)a1 + 31);
  values[18] = CFNumberCreate(v6, kCFNumberIntType, &v17);
  keys[19] = CFSTR("ShutDownResScale");
  v16 = (unsigned __int16)a1[16];
  values[19] = CFNumberCreate(v6, kCFNumberIntType, &v16);
  keys[20] = CFSTR("ShutDownQstart");
  v15 = a1[17];
  values[20] = CFNumberCreate(v6, kCFNumberIntType, &v15);
  keys[21] = CFSTR("ShutDownPassedCharge");
  v14 = a1[18];
  values[21] = CFNumberCreate(v6, kCFNumberIntType, &v14);
  keys[22] = CFSTR("ShutDownDOD0");
  v13 = (unsigned __int16)a1[19];
  *(_QWORD *)&v43 = CFNumberCreate(v6, kCFNumberIntType, &v13);
  *(_QWORD *)&v39 = CFSTR("Raw");
  *((_QWORD *)&v43 + 1) = CFDataCreate(v6, (const UInt8 *)a1, 52);
  v48 = 0;
  *(_OWORD *)bytes = 0u;
  v47 = 0u;
  v37 = 40;
  v51 = 0;
  outputStruct = 0u;
  v50 = 0u;
  input = 1;
  if (!IOConnectCallMethod(a3, 0x12u, &input, 1u, 0, 0, 0, 0, &outputStruct, &v37))
  {
    *(_OWORD *)bytes = outputStruct;
    v47 = v50;
    v48 = v51;
  }
  *((_QWORD *)&v39 + 1) = CFSTR("ShutDownDLog");
  *(_QWORD *)&v44 = CFDataCreate(v6, bytes, 40);
  *(_QWORD *)&v40 = CFSTR("timeSinceAwake");
  v12 = *(_QWORD *)a2;
  *((_QWORD *)&v44 + 1) = CFNumberCreate(v6, kCFNumberLongType, &v12);
  *((_QWORD *)&v40 + 1) = CFSTR("ShutDownRaTableRaw");
  *(_QWORD *)&v45 = CFDataCreate(v6, a2 + 8, 32);
  v41 = CFSTR("ShutDownRSS");
  v11 = *((unsigned __int16 *)a2 + 20);
  *((_QWORD *)&v45 + 1) = CFNumberCreate(v6, kCFNumberIntType, &v11);
  v7 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, 28, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v8 = 27;
  do
  {
    CFRelease(values[v8]);
    v9 = v8-- + 1;
  }
  while (v9 > 1);
  return v7;
}

uint64_t writeBatteryDiagnosticData(mach_port_t a1)
{
  size_t outputStructCnt;
  _BYTE v4[248];
  _QWORD v5[45];

  v5[44] = *MEMORY[0x1E0C80C00];
  bzero(v4, 0x258uLL);
  outputStructCnt = 352;
  return IOConnectCallStructMethod(a1, 2u, 0, 0, v5, &outputStructCnt);
}

BOOL okToLoad()
{
  stat v1;

  memset(&v1, 0, sizeof(v1));
  return stat("/dev/cu.gas-gauge", &v1) == 0;
}

uint64_t startUpdateThread(unsigned int a1)
{
  uint64_t v2;
  NSObject *v4;
  uint8_t v5[8];
  pthread_t v6;
  stat v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  memset(&v7, 0, sizeof(v7));
  if (stat("/dev/cu.gas-gauge", &v7))
    return 0xFFFFFFFFLL;
  v6 = 0;
  memset(&v7, 0, 64);
  pthread_attr_init((pthread_attr_t *)&v7);
  pthread_attr_setdetachstate((pthread_attr_t *)&v7, 2);
  logger = (uint64_t)os_log_create("com.apple.AppleHDQGasGauge", "battery");
  if (!logger)
    return 0xFFFFFFFFLL;
  v2 = pthread_create(&v6, (const pthread_attr_t *)&v7, (void *(__cdecl *)(void *))updateThread, (void *)a1);
  if ((_DWORD)v2)
  {
    v4 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v5 = 0;
      _os_log_error_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_ERROR, "pthread_create", v5, 2u);
      v4 = logger;
    }
    os_release(v4);
  }
  else
  {
    pthread_attr_destroy((pthread_attr_t *)&v7);
  }
  return v2;
}

uint64_t updateThread(uint64_t a1)
{
  char *v2;
  void **p_cache;
  NSObject *v4;
  unsigned int v5;
  io_service_t v6;
  mach_port_t v7;
  IONotificationPort *v8;
  __CFRunLoop *Current;
  __CFRunLoopSource *RunLoopSource;
  const __CFString *v11;
  __CFRunLoop *v12;
  __CFRunLoopSource *v13;
  uint64_t v14;
  io_connect_t v15;
  mach_error_t v16;
  BOOL *v17;
  mach_error_t v18;
  NSObject *v19;
  const __CFNumber *v21;
  const __CFNumber *v22;
  CFTypeID v23;
  NSObject *v24;
  const __CFNumber *v25;
  const __CFNumber *v26;
  CFTypeID v27;
  int Value;
  const __CFBoolean *v29;
  const __CFBoolean *v30;
  CFTypeID v31;
  NSObject *v32;
  const __CFNumber *v33;
  const __CFNumber *v34;
  CFTypeID v35;
  NSObject *v36;
  const __CFBoolean *v37;
  const __CFBoolean *v38;
  CFTypeID v39;
  NSObject *v40;
  const __CFNumber *v41;
  const __CFNumber *v42;
  CFTypeID v43;
  NSObject *v44;
  IONotificationPort *v45;
  kern_return_t v46;
  NSObject *v47;
  int v48;
  uint64_t v49;
  __CFRunLoop *v50;
  __CFRunLoopSource *v51;
  NSObject *v52;
  __darwin_time_t v53;
  NSObject *v54;
  int v55;
  char v56;
  int v57;
  int v58;
  double v59;
  double v60;
  int v61;
  mach_port_t v62;
  kern_return_t v63;
  int v64;
  NSObject *v65;
  int v66;
  int v67;
  NSObject *v68;
  CFAbsoluteTime v69;
  _BOOL4 v70;
  _BOOL4 v71;
  char v72;
  double v73;
  double v74;
  NSObject *v75;
  NSObject *v76;
  int v77;
  int v78;
  int v79;
  NSObject *v80;
  int v81;
  NSObject *v82;
  int v83;
  CFTypeRef CFProperty;
  CFTypeRef v85;
  CFTypeID v86;
  int v87;
  unsigned __int8 v88;
  NSObject *v89;
  int v90;
  int hdq_state;
  CFPropertyListRef v92;
  _BOOL4 v93;
  io_connect_t v94;
  int v95;
  void **v96;
  int v97;
  NSObject *v98;
  unsigned int v99;
  int v100;
  int v101;
  NSObject *v102;
  NSObject *v103;
  int v104;
  _BOOL4 v105;
  uint64_t v106;
  int v107;
  int v108;
  CFNumberRef v109;
  CFNumberRef v110;
  int v111;
  BOOL v112;
  NSObject *v113;
  int v114;
  int Block;
  NSObject *v116;
  __darwin_time_t v117;
  unint64_t v118;
  NSObject *v119;
  __darwin_time_t v120;
  int v121;
  NSObject *v122;
  __darwin_time_t v123;
  unint64_t v124;
  NSObject *v125;
  NSObject *v126;
  __darwin_time_t v127;
  char v128;
  NSObject *v129;
  unint64_t v130;
  _BOOL4 v131;
  _BOOL4 v132;
  unint64_t v133;
  _BOOL4 v134;
  NSObject *v135;
  int v136;
  int v137;
  NSObject *v138;
  NSObject *v139;
  int v140;
  NSObject *v141;
  uint64_t v142;
  int BatteryData;
  CFDictionaryRef ChargerData;
  _BOOL4 v145;
  int v146;
  int v147;
  BOOL v148;
  int v149;
  int v150;
  __int16 v151;
  NSObject *v152;
  BOOL v153;
  __int16 v154;
  int v155;
  unsigned int v156;
  NSObject *v157;
  NSObject *v158;
  BOOL v159;
  int v160;
  BOOL v161;
  NSObject *v162;
  NSObject *v163;
  _BOOL4 v164;
  CFDictionaryRef v165;
  NSObject *v166;
  const __CFAllocator *v167;
  int v168;
  const __CFString *v169;
  int v170;
  int v171;
  NSObject *v172;
  _BOOL4 v173;
  unsigned int v174;
  int v176;
  CFNumberRef v177;
  uint64_t v178;
  uint64_t v179;
  int U16;
  _BOOL4 v181;
  NSObject *v182;
  unint64_t v183;
  NSObject *v184;
  CFNumberRef v185;
  uint64_t v186;
  uint64_t v187;
  CFNumberRef v188;
  uint64_t v189;
  CFNumberRef v190;
  uint64_t v191;
  CFNumberRef v192;
  uint64_t v193;
  CFNumberRef v194;
  uint64_t v195;
  unsigned int v196;
  CFNumberRef v197;
  uint64_t v198;
  const void *v199;
  uint64_t v200;
  CFNumberRef v201;
  uint64_t v202;
  char *v203;
  CFNumberRef v204;
  uint64_t v205;
  CFNumberRef v206;
  uint64_t v207;
  CFNumberRef v208;
  uint64_t v209;
  CFNumberRef v210;
  uint64_t v211;
  CFDictionaryRef v212;
  CFDictionaryRef v213;
  CFDictionaryRef v214;
  NSObject *v215;
  CFDictionaryRef v216;
  CFDictionaryRef v217;
  NSObject *v218;
  CFDictionaryRef v219;
  NSObject *v220;
  int S16;
  int v223;
  NSObject *v224;
  time_t v225;
  uint64_t v226;
  NSObject *v227;
  const char *v228;
  char v229;
  time_t v230;
  char v231;
  uint64_t v232;
  _BOOL4 v233;
  NSObject *v234;
  const char *v235;
  int v236;
  int v237;
  NSObject *v238;
  __int16 v239;
  _BOOL4 v240;
  NSObject *v241;
  int v242;
  int v243;
  int v244;
  NSObject *v245;
  char v246;
  NSObject *v247;
  int v248;
  NSObject *v249;
  int v250;
  int v251;
  int v252;
  NSObject *v253;
  NSObject *v254;
  uint64_t v255;
  _BOOL4 v256;
  NSObject *v257;
  const char *v258;
  uint32_t v259;
  CFAbsoluteTime v260;
  NSObject *v261;
  NSObject *v262;
  int v263;
  _BOOL4 v264;
  NSObject *log;
  os_log_t loga;
  os_log_t logb;
  os_log_t logc;
  int v269;
  int v270;
  _BOOL4 v271;
  int v272;
  int v273;
  int v274;
  uint64_t v275;
  os_log_t v276;
  _BOOL4 v277;
  NSObject *v278;
  time_t v279;
  _BOOL4 v280;
  char v281;
  _BOOL4 v282;
  int v283;
  uint64_t v284;
  BOOL v285;
  int v286;
  int v287;
  int v288;
  uint64_t v289;
  int v290;
  CFPropertyListRef v291;
  int v292;
  BOOL *v293;
  unsigned int v294;
  _BOOL4 v295;
  BOOL v296;
  const __CFString *v297;
  const __CFString *v298;
  const __CFString *mode;
  io_connect_t v300;
  BOOL v301;
  _BOOL4 v302;
  const __CFAllocator *allocator;
  io_connect_t kernelPort;
  CFTypeRef v305;
  BOOL v306;
  int v307;
  char v308;
  char v309;
  char v310[7];
  int v311;
  int v312;
  int v313;
  int v314;
  int v315;
  int v316;
  int v317;
  int v318;
  int v319;
  int v320;
  int v321;
  int v322;
  int v323;
  int v324;
  int v325;
  int v326;
  _BOOL4 v327;
  int v328;
  char v329;
  char v330[15];
  char v331;
  char v332[15];
  char v333;
  char v334[15];
  size_t v335;
  int valuePtr;
  uint64_t refCon;
  intptr_t notificationID;
  io_object_t notifier;
  IONotificationPortRef thePortRef;
  unsigned __int16 v341;
  int v342;
  io_object_t notification[2];
  uint8_t v344[4];
  int v345[3];
  uint8_t v346[4];
  const char *v347;
  __int16 v348;
  int v349;
  void *keys[2];
  __int128 v351;
  __int128 v352;
  _BYTE input[52];
  double v354;
  int v355;
  void *v356[2];
  __int128 v357;
  __int128 v358;
  __int128 v359;
  __int128 v360;
  __int128 v361;
  __int128 v362;
  __int128 v363;
  __int128 v364;
  __int128 v365;
  __int128 v366;
  __int128 v367;
  __int128 v368;
  __int128 v369;
  __int128 v370;
  __int128 v371;
  __int128 v372;
  __int128 v373;
  __int128 v374;
  __int128 v375;
  __int128 v376;
  __int128 v377;
  uint8_t buf[32];
  __int128 v379;
  __int128 v380;
  __int128 v381;
  __int128 v382;
  __int128 v383;
  __int128 v384;
  __int128 v385;
  __int128 v386;
  __int128 v387;
  __int128 v388;
  __int128 v389;
  __int128 v390;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  __int128 v395;
  __int128 v396;
  __int128 v397;
  __int128 v398;
  char v399[64];
  uint64_t v400;

  v400 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)notification = 0;
  v342 = 0;
  v341 = 0;
  thePortRef = 0;
  notifier = 0;
  notificationID = 0;
  refCon = 0;
  pthread_setname_np("GasGauge-updateThread");
  v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
  gRestrictLogMessagesCounter = 0;
  p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
  v4 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1DA9D6000, v4, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread start", buf, 2u);
  }
  v5 = pmps_service();
  if (v5)
  {
    v6 = v5;
    v7 = *MEMORY[0x1E0CBBAA8];
    v8 = IONotificationPortCreate(*MEMORY[0x1E0CBBAA8]);
    if (IOServiceAddInterestNotification(v8, v6, "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        updateThread_cold_10();
      return 0;
    }
    Current = CFRunLoopGetCurrent();
    RunLoopSource = IONotificationPortGetRunLoopSource(v8);
    v11 = (const __CFString *)*MEMORY[0x1E0C9B280];
    CFRunLoopAddSource(Current, RunLoopSource, (CFRunLoopMode)*MEMORY[0x1E0C9B280]);
    kernelPort = IORegisterForSystemPower(&refCon, &thePortRef, (IOServiceInterestCallback)iokit_callback, &notifier);
    if (kernelPort && thePortRef)
    {
      v12 = CFRunLoopGetCurrent();
      v13 = IONotificationPortGetRunLoopSource(thePortRef);
      CFRunLoopAddSource(v12, v13, v11);
      v14 = ggctl_connect(&notification[1]);
      if (!(_DWORD)v14)
        return 0;
      v15 = v14;
      *(_QWORD *)buf = 0;
      v356[0] = 0;
      v16 = MEMORY[0x1DF0A3A8C](v14, 0, *MEMORY[0x1E0C83DA0], buf, v356, 1);
      if (v16)
        v17 = 0;
      else
        v17 = *(BOOL **)buf;
      if (v16)
      {
        v18 = v16;
        v19 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_9(v18, v19);
        IOServiceClose(v15);
        return 0;
      }
      v289 = *(_QWORD *)buf;
      v293 = v17;
      mode = v11;
      *(_QWORD *)buf = 352;
      IOConnectCallStructMethod(v15, 2u, 0, 0, &dword_1F028ABE0, (size_t *)buf);
      byte_1F028AB2C = dword_1F028AC84 != 0;
      v341 = word_1F028AC6E;
      v286 = dword_1F028AD38;
      valuePtr = dword_1F028AC74;
      v297 = (const __CFString *)*MEMORY[0x1E0C9B250];
      v298 = (const __CFString *)*MEMORY[0x1E0C9B260];
      v21 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("UpdateSampleConfig"), CFSTR("com.apple.gasgauge"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B250]);
      if (v21)
      {
        v22 = v21;
        v23 = CFGetTypeID(v21);
        if (v23 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v22, kCFNumberSInt32Type, &valuePtr);
          v24 = logger;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = valuePtr;
            _os_log_impl(&dword_1DA9D6000, v24, OS_LOG_TYPE_DEFAULT, "changed updateSampleConfig=%#x", buf, 8u);
          }
        }
        CFRelease(v22);
      }
      v294 = valuePtr;
      v25 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalBattery"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v25)
      {
        v26 = v25;
        v27 = CFGetTypeID(v25);
        if (v27 == CFNumberGetTypeID())
        {
          CFNumberGetValue(v26, kCFNumberSInt32Type, &word_1F028AC6C);
          CFRelease(v26);
        }
        else
        {
          Value = CFBooleanGetValue(v26);
          CFRelease(v26);
          if (!Value)
          {
            v262 = logger;
            v292 = 0;
            if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1DA9D6000, v262, OS_LOG_TYPE_DEFAULT, "Critical battery shutdown disabled", buf, 2u);
              v292 = 0;
            }
            goto LABEL_30;
          }
        }
      }
      v292 = 1;
LABEL_30:
      v29 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("UserMode"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v29)
      {
        v30 = v29;
        v31 = CFGetTypeID(v29);
        v295 = v31 == CFBooleanGetTypeID() && CFBooleanGetValue(v30) != 0;
        CFRelease(v30);
        v32 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v295;
          _os_log_impl(&dword_1DA9D6000, v32, OS_LOG_TYPE_DEFAULT, "gas gauge: userModeEnabled=%d", buf, 8u);
        }
      }
      else
      {
        v295 = 0;
      }
      v33 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("CriticalFlagDelay"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v33)
      {
        v34 = v33;
        v35 = CFGetTypeID(v33);
        if (v35 == CFNumberGetTypeID())
          CFNumberGetValue(v34, kCFNumberSInt32Type, &v341);
        CFRelease(v34);
        v36 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v341;
          _os_log_impl(&dword_1DA9D6000, v36, OS_LOG_TYPE_DEFAULT, "gas gauge: critical flag delay %d", buf, 8u);
        }
      }
      v37 = (const __CFBoolean *)CFPreferencesCopyValue(CFSTR("DebugPolling"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v37)
      {
        v38 = v37;
        v39 = CFGetTypeID(v37);
        if (v39 == CFBooleanGetTypeID())
          debug_polling = CFBooleanGetValue(v38) != 0;
        CFRelease(v38);
        v40 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = debug_polling;
          _os_log_impl(&dword_1DA9D6000, v40, OS_LOG_TYPE_DEFAULT, "gas gauge: debug_polling=%d", buf, 8u);
        }
      }
      v41 = (const __CFNumber *)CFPreferencesCopyValue(CFSTR("RestricLogCounter"), CFSTR("com.apple.gasgauge"), v298, v297);
      if (v41)
      {
        v42 = v41;
        v43 = CFGetTypeID(v41);
        if (v43 == CFNumberGetTypeID())
          CFNumberGetValue(v42, kCFNumberSInt32Type, &gRestrictLogCounter);
        CFRelease(v42);
        v44 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = gRestrictLogCounter;
          _os_log_impl(&dword_1DA9D6000, v44, OS_LOG_TYPE_DEFAULT, "gas gauge: log counter %d", buf, 8u);
        }
      }
      v307 = dword_1F028AC78;
      if (dword_1F028AC78)
      {
        v45 = IONotificationPortCreate(v7);
        v46 = IOServiceAddInterestNotification(v45, notification[1], "IOGeneralInterest", (IOServiceInterestCallback)iokit_callback, &refCon, notification);
        v47 = logger;
        if (v46)
        {
          v48 = v46;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
            updateThread_cold_8(v48, v47, v49);
        }
        else
        {
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA9D6000, v47, OS_LOG_TYPE_DEFAULT, "gasgauge: listening for battery interrupts", buf, 2u);
          }
          v50 = CFRunLoopGetCurrent();
          v51 = IONotificationPortGetRunLoopSource(v45);
          CFRunLoopAddSource(v50, v51, v11);
        }
      }
      v342 = 0;
      getUPOData(CFSTR("IOPMUBootUPOState"), &v342);
      v301 = v342 != 0;
      getUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), &dword_1F028ABD8);
      v335 = 64;
      if (sysctlbyname("hw.model", v399, &v335, 0, 0))
      {
        v52 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
          updateThread_cold_7(v52);
      }
      v300 = v15;
      v53 = UpSeconds();
      v54 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134219776;
        *(_QWORD *)&buf[4] = v53;
        *(_WORD *)&buf[12] = 1024;
        *(_DWORD *)&buf[14] = v292;
        *(_WORD *)&buf[18] = 1024;
        *(_DWORD *)&buf[20] = (unsigned __int16)word_1F028AC6C;
        *(_WORD *)&buf[24] = 1024;
        *(_DWORD *)&buf[26] = valuePtr;
        *(_WORD *)&buf[30] = 1024;
        LODWORD(v379) = byte_1F028AB2C;
        WORD2(v379) = 1024;
        *(_DWORD *)((char *)&v379 + 6) = v341;
        WORD5(v379) = 1024;
        HIDWORD(v379) = dword_1F028AC70;
        LOWORD(v380) = 1024;
        *(_DWORD *)((char *)&v380 + 2) = v342;
        _os_log_impl(&dword_1DA9D6000, v54, OS_LOG_TYPE_DEFAULT, "gasgauge: %llu updateThread critical(%d, 0x%x), uscfg=0x%x, dyn=%d cfd=%d cfd-voltage=%d, upos=%x", buf, 0x36u);
      }
      v284 = a1;
      v280 = a1 != 0;
      LOBYTE(v55) = 0;
      v285 = 0;
      v306 = 0;
      v302 = 0;
      v296 = 0;
      v56 = 0;
      v308 = 0;
      v281 = 0;
      v279 = 0;
      v57 = 0;
      v290 = 0;
      v58 = 0;
      qword_1F028ABD0 = time(0);
      v282 = (dword_1F028AC88 | dword_1F028ACCC) != 0;
      v288 = (v294 >> 2) & 1;
      v287 = (v294 >> 3) & 1;
      allocator = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
      v305 = (CFTypeRef)*MEMORY[0x1E0C9AE50];
      v291 = (CFPropertyListRef)*MEMORY[0x1E0C9AE40];
      v59 = 0.0;
      v60 = 0.0;
      LOBYTE(v283) = 1;
      v61 = -1;
      v62 = -1;
      while (1)
      {
        v398 = 0u;
        v397 = 0u;
        v396 = 0u;
        v395 = 0u;
        v394 = 0u;
        v393 = 0u;
        v392 = 0u;
        v391 = 0u;
        v390 = 0u;
        v389 = 0u;
        v388 = 0u;
        v387 = 0u;
        v386 = 0u;
        v385 = 0u;
        v384 = 0u;
        v383 = 0u;
        v382 = 0u;
        v381 = 0u;
        v380 = 0u;
        v379 = 0u;
        memset(buf, 0, sizeof(buf));
        v377 = 0u;
        v376 = 0u;
        v375 = 0u;
        v374 = 0u;
        v373 = 0u;
        v372 = 0u;
        v371 = 0u;
        v370 = 0u;
        v369 = 0u;
        v368 = 0u;
        v367 = 0u;
        v365 = 0u;
        v366 = 0u;
        v363 = 0u;
        v364 = 0u;
        v361 = 0u;
        v362 = 0u;
        v359 = 0u;
        v360 = 0u;
        v357 = 0u;
        v358 = 0u;
        *(_OWORD *)v356 = 0u;
        if (v307 && v62 != -1)
        {
          *(_QWORD *)input = 1;
          v63 = IOConnectCallScalarMethod(v62, 0x10u, (const uint64_t *)input, 1u, 0, 0);
          v64 = v63 == -536870183 ? -2 : -1;
          if (v63)
          {
            v65 = p_cache[254];
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)input = 67109120;
              *(_DWORD *)&input[4] = v64;
              _os_log_impl(&dword_1DA9D6000, v65, OS_LOG_TYPE_DEFAULT, "cannot enable gauge interrupts (%d)", input, 8u);
            }
          }
        }
        LODWORD(refCon) = 0;
        if (v57)
        {
          v66 = *((_DWORD *)v2 + 848);
          if (v66)
          {
            v67 = v66 - 1;
          }
          else
          {
            if (v59 == 0.0)
              goto LABEL_81;
            v68 = p_cache[254];
            if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
            {
              v69 = CFAbsoluteTimeGetCurrent();
              *(_DWORD *)input = 67109632;
              *(_DWORD *)&input[4] = v57;
              *(_WORD *)&input[8] = 2048;
              *(double *)&input[10] = v69 - v59;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = gRestrictLogCounter;
              _os_log_impl(&dword_1DA9D6000, v68, OS_LOG_TYPE_DEFAULT, "failure last_update_failed_counter=%d last_success at %g, supressing %d subsequent errors", input, 0x18u);
            }
            v67 = gRestrictLogCounter;
          }
          *((_DWORD *)v2 + 848) = v67;
        }
LABEL_81:
        v70 = v61 != -1;
        v71 = v61 < 50;
        v72 = v70 && v71;
        if (v70 && v71)
          v73 = 5.0;
        else
          v73 = 20.0;
        if ((v56 & 1) != 0)
        {
LABEL_527:
          IOObjectRelease(v6);
          MEMORY[0x1DF0A3A98](v300, 0, *MEMORY[0x1E0C83DA0], v293);
          IOServiceClose(v300);
          *((_DWORD *)v2 + 848) = 0;
          v261 = p_cache[254];
          if (os_log_type_enabled(v261, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1DA9D6000, v261, OS_LOG_TYPE_DEFAULT, "gasgauge: updateThread terminated", buf, 2u);
          }
          return 0;
        }
        if (!(v58 | v57))
          goto LABEL_122;
        v74 = CFAbsoluteTimeGetCurrent();
        if (debug_polling && (v75 = p_cache[254], os_log_type_enabled(v75, OS_LOG_TYPE_DEBUG)))
        {
          *(_DWORD *)input = 136316418;
          *(_QWORD *)&input[4] = "updateThread";
          *(_WORD *)&input[12] = 1024;
          *(_DWORD *)&input[14] = 2802;
          *(_WORD *)&input[18] = 1024;
          *(_DWORD *)&input[20] = v58;
          *(_WORD *)&input[24] = 1024;
          *(_DWORD *)&input[26] = v55 & 1;
          *(_WORD *)&input[30] = 2048;
          *(double *)&input[32] = v74;
          *(_WORD *)&input[40] = 2048;
          *(double *)&input[42] = v60;
          _os_log_debug_impl(&dword_1DA9D6000, v75, OS_LOG_TYPE_DEBUG, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f *** ", input, 0x32u);
          if ((v55 & 1) == 0)
          {
LABEL_92:
            v60 = v73 + v74;
            goto LABEL_93;
          }
        }
        else if ((v55 & 1) == 0)
        {
          goto LABEL_92;
        }
        v73 = 0.0;
        if (v74 < v60)
          v73 = v60 - v74;
LABEL_93:
        if (debug_polling)
        {
          v76 = p_cache[254];
          if (os_log_type_enabled(v76, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)input = 136316674;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2860;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v58;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = v55 & 1;
            *(_WORD *)&input[30] = 2048;
            *(double *)&input[32] = v74;
            *(_WORD *)&input[40] = 2048;
            *(double *)&input[42] = v60;
            *(_WORD *)&input[50] = 2048;
            v354 = v73;
            _os_log_error_impl(&dword_1DA9D6000, v76, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d last_update_ignored=%d now=%f deadline=%f update_interval=%f *** ", input, 0x3Cu);
          }
        }
        if (v73 == 0.0)
        {
          v55 = 0;
          LODWORD(refCon) = 0;
LABEL_121:
          LOBYTE(v55) = v55 != 0;
          goto LABEL_122;
        }
        if (CFRunLoopRunInMode(mode, v73, 1u) != kCFRunLoopRunHandledSource)
        {
          v55 = 0;
          goto LABEL_121;
        }
        v55 = 0;
        v77 = refCon;
        v78 = 1;
        if ((int)refCon > -536870145)
        {
          if ((_DWORD)refCon == -536870144 || (_DWORD)refCon == -536723200)
            goto LABEL_113;
          v79 = -469794560;
        }
        else
        {
          if ((refCon + 536870288) <= 0x20
            && ((1 << (refCon - 112)) & 0x100010001) != 0)
          {
            goto LABEL_113;
          }
          v79 = -536870320;
        }
        if ((_DWORD)refCon != v79)
        {
          v78 = debug_polling;
          if (debug_polling)
          {
            v80 = p_cache[254];
            if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)input = 136315906;
              *(_QWORD *)&input[4] = "updateThread";
              *(_WORD *)&input[12] = 1024;
              *(_DWORD *)&input[14] = 2879;
              *(_WORD *)&input[18] = 1024;
              *(_DWORD *)&input[20] = v58;
              *(_WORD *)&input[24] = 1024;
              *(_DWORD *)&input[26] = v77;
              _os_log_error_impl(&dword_1DA9D6000, v80, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x  (ign) *** ", input, 0x1Eu);
            }
            v78 = 0;
            v55 = 1;
          }
          else
          {
            v55 = 1;
          }
        }
LABEL_113:
        if (v77 > -536870145)
        {
          if (v77 == -536870144 || v77 == -469794560)
            goto LABEL_121;
          v81 = -536723200;
        }
        else
        {
          if ((v77 + 536870288) <= 0x20 && ((1 << (v77 - 112)) & 0x100010001) != 0)
            goto LABEL_121;
          v81 = -536870320;
        }
        if (v77 == v81)
          goto LABEL_121;
        if (v78)
        {
LABEL_122:
          if (debug_polling && (v82 = p_cache[254], os_log_type_enabled(v82, OS_LOG_TYPE_ERROR)))
          {
            *(_DWORD *)input = 136316162;
            *(_QWORD *)&input[4] = "updateThread";
            *(_WORD *)&input[12] = 1024;
            *(_DWORD *)&input[14] = 2897;
            *(_WORD *)&input[18] = 1024;
            *(_DWORD *)&input[20] = v58;
            *(_WORD *)&input[24] = 1024;
            *(_DWORD *)&input[26] = refCon;
            *(_WORD *)&input[30] = 1024;
            *(_DWORD *)&input[32] = v308 & 1;
            _os_log_error_impl(&dword_1DA9D6000, v82, OS_LOG_TYPE_ERROR, "*** %s:%d updatesDone=%d message.messageType=%#x system_sleep=%d *** ", input, 0x24u);
            if (v58)
              goto LABEL_125;
LABEL_126:
            CFProperty = IORegistryEntryCreateCFProperty(v6, CFSTR("AdapterInfo"), allocator, 0);
            v85 = IORegistryEntryCreateCFProperty(v6, CFSTR("AppleRawExternalConnected"), allocator, 0);
            LODWORD(keys[0]) = 0;
            if (CFProperty)
            {
              v86 = CFGetTypeID(CFProperty);
              if (v86 == CFNumberGetTypeID())
                CFNumberGetValue((CFNumberRef)CFProperty, kCFNumberSInt32Type, keys);
              CFRelease(CFProperty);
              v87 = (int)keys[0];
              if (v306 != (LODWORD(keys[0]) == 0))
              {
LABEL_132:
                v88 = v302 ^ (v85 != v305);
                goto LABEL_133;
              }
              v88 = 0;
            }
            else
            {
              v87 = 0;
              v88 = 0;
              if (!v306)
                goto LABEL_132;
            }
LABEL_133:
            if (debug_polling)
            {
              v89 = logger;
              if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)input = 136316418;
                *(_QWORD *)&input[4] = "updateThread";
                *(_WORD *)&input[12] = 1024;
                *(_DWORD *)&input[14] = 2921;
                *(_WORD *)&input[18] = 1024;
                *(_DWORD *)&input[20] = v58;
                *(_WORD *)&input[24] = 1024;
                *(_DWORD *)&input[26] = v88 & 1;
                *(_WORD *)&input[30] = 1024;
                *(_DWORD *)&input[32] = v87;
                *(_WORD *)&input[36] = 1024;
                *(_DWORD *)&input[38] = v85 == v305;
                _os_log_impl(&dword_1DA9D6000, v89, OS_LOG_TYPE_DEFAULT, "*** %s:%d updatesDone=%d same_adaptor=%d adaptor_type=%d external_connected=%d *** ", input, 0x2Au);
              }
            }
            if ((v88 & (v58 != 0)) != 1 || v73 == 0.0)
            {
              v90 = (int)keys[0];
              v306 = LODWORD(keys[0]) != 0;
              v302 = v85 == v305;
              v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
              if (v85)
                CFRelease(v85);
              if (v90 != 0 && v301)
              {
                setUPOData(CFSTR("IOPMUBootUPOState"), 0);
                v301 = 0;
              }
              ++debug_cnt_ut_recv;
              v83 = refCon;
              p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
              goto LABEL_147;
            }
            v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
            if (v85)
              CFRelease(v85);
            v56 = 0;
            v62 = -1;
            LOBYTE(v55) = 1;
LABEL_141:
            p_cache = (void **)(&OBJC_METACLASS___PLProcessNetworkSource + 16);
          }
          else
          {
            if (!v58)
              goto LABEL_126;
LABEL_125:
            v83 = refCon;
            if ((_DWORD)refCon == -536723200)
              goto LABEL_126;
LABEL_147:
            if (v83 == -469794560)
            {
              LOBYTE(v55) = 1;
              if (v73 != 0.0)
                v72 = 1;
            }
            if ((v308 & (v83 != -536870144)) != 0)
            {
LABEL_156:
              v56 = 0;
              v62 = -1;
              v308 = 1;
            }
            else if (v83 == -536870288)
            {
              IOAllowPowerChange(kernelPort, notificationID);
              v56 = 0;
              v62 = -1;
              LOBYTE(v55) = 1;
            }
            else
            {
              if (v57 && v83 == -536870272)
              {
                IOAllowPowerChange(kernelPort, notificationID);
                goto LABEL_156;
              }
              if (v300 == -1)
              {
                v56 = 0;
                ++v57;
                goto LABEL_166;
              }
              if (v83 == -536870144)
              {
                if (v296)
                  updateThermalCoolDownState(notification[1], 0);
                v296 = 0;
                if ((v308 & 1) != 0)
                {
                  v308 = 0;
                  qword_1F028ABD0 = time(0);
                }
                else
                {
                  v308 = 0;
                }
              }
              hdq_state = ggctl_get_hdq_state(v300);
              if (hdq_state == -2)
              {
                v56 = 1;
                goto LABEL_445;
              }
              if (hdq_state)
              {
                if (hdq_state < 0)
                {
                  if (os_log_type_enabled((os_log_t)p_cache[254], OS_LOG_TYPE_ERROR))
                    updateThread_cold_2(&v329, v330);
                  v56 = 0;
                  goto LABEL_444;
                }
                v95 = hdqBreak(v300);
                if (v95 != -2)
                {
                  if (v95 < 0)
                  {
                    v96 = p_cache;
                    v97 = ++updateThread_debug_break_failures;
                    v98 = v96[254];
                    if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
                    {
                      *(_DWORD *)input = 136315906;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3024;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v97;
                      *(_WORD *)&input[24] = 1024;
                      *(_DWORD *)&input[26] = -1;
                      _os_log_error_impl(&dword_1DA9D6000, v98, OS_LOG_TYPE_ERROR, "%s:%d break failed break_failures=%d (%d)", input, 0x1Eu);
                      v97 = updateThread_debug_break_failures;
                    }
                    if ((-858993459 * v97) <= 0x33333333)
                    {
                      statsAndLogs(notification[1], 0);
                      p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                    }
                    else
                    {
                      v99 = -1227133513 * v97;
                      p_cache = (void **)(&OBJC_METACLASS___PLProcessNetworkSource + 16);
                      if (v99 <= 0x24924924)
                        debugLog(notification[1], 63);
                    }
                  }
                  else if (updateThread_debug_break_failures)
                  {
                    statsAndLogs(notification[1], 1);
                    debugLog(notification[1], 0);
                    updateThread_debug_break_failures = 0;
                  }
                }
                if (v307)
                {
                  if (v58)
                  {
                    v100 = gaugeDisableInterrupts(v300);
                    if (v100 < 0)
                    {
                      v101 = v100;
                      v102 = p_cache[254];
                      if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3044;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v101;
                        _os_log_error_impl(&dword_1DA9D6000, v102, OS_LOG_TYPE_ERROR, "%s:%d cannot disable gauge interrupts (%d)", input, 0x18u);
                      }
                    }
                  }
                }
                if ((_DWORD)refCon == -536870272)
                {
                  v108 = OSThermalNotificationCurrentLevel();
                  v296 = v108 > 14;
                  v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                  if (v108 >= 15)
                    updateThermalCoolDownState(notification[1], 1);
                  IOAllowPowerChange(kernelPort, notificationID);
                  v56 = 0;
                  v308 = 1;
                  goto LABEL_445;
                }
                v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                if ((_DWORD)refCon == -536870320)
                  goto LABEL_527;
                if (v58)
                {
                  v275 = 0;
                  goto LABEL_203;
                }
                if ((getFWVersion(v300, &word_1F028AB0E) & 0x80000000) != 0)
                {
                  v56 = 0;
                  v58 = 0;
                  ++v57;
                  v62 = v300;
                }
                else
                {
                  v109 = CFNumberCreate(allocator, kCFNumberIntType, &word_1F028AB0E);
                  if (v109)
                  {
                    v110 = v109;
                    IORegistryEntrySetCFProperty(v6, CFSTR("GasGaugeFirmwareVersion"), v109);
                    CFRelease(v110);
                  }
                  v111 = (unsigned __int16)word_1F028AB0E;
                  v112 = (unsigned __int16)word_1F028AB0E - 1281 < 2;
                  *v293 = (unsigned __int16)word_1F028AB0E > 0x131u;
                  if (v111 == 265)
                  {
                    v113 = logger;
                    v292 = 0;
                    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)input = 0;
                      _os_log_impl(&dword_1DA9D6000, v113, OS_LOG_TYPE_DEFAULT, "gas gauge firmware 1.09: disabling critical battery shutdown", input, 2u);
                      v292 = 0;
                    }
                  }
                  LOBYTE(v288) = v288 | v112;
                  keys[0] = 0;
                  if ((readChargeTable(v300, (__CFData **)keys) & 0x80000000) != 0)
                  {
                    v56 = 0;
                    v58 = 0;
                    ++v57;
                    v62 = v300;
                    goto LABEL_141;
                  }
                  p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                  if (keys[0])
                  {
                    *(void **)buf = keys[0];
                    v356[0] = CFSTR("ChargeTable");
                    v275 = 1;
                  }
                  else
                  {
                    v275 = 0;
                  }
                  if (dword_1F028ABE0)
                    v114 = dword_1F028ABE0;
                  else
                    v114 = 2;
                  Block = ggctl_readBlock(v300, -1, v114, updateThread_batteryInfo, 0);
                  if (Block < 0)
                    strcpy((char *)updateThread_batteryInfo, "000000");
                  if ((v287 & 1) != 0)
                  {
                    byte_1F028AB10 = dword_1F028AC80;
                    if ((_BYTE)dword_1F028AC80)
                    {
                      LOBYTE(v287) = 1;
                    }
                    else
                    {
                      v158 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        *(_QWORD *)input = 67109376;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = Block;
                        _os_log_error_impl(&dword_1DA9D6000, v158, OS_LOG_TYPE_ERROR, "disabled passedCharge PCFF=%d err=%d", input, 0xEu);
                      }
                      LOBYTE(v287) = 0;
                      v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    }
                  }
                  else
                  {
                    LOBYTE(v287) = 0;
                  }
                  if (byte_1F028AB2C)
                    word_1F028AB0C = 136;
                  if (hdqReadS16(v300, 60, &word_1F028AB0A))
                    word_1F028AB0A = 0;
                  if (controlReadU16(v300, 8, &word_1F028AB08))
                  {
                    word_1F028AB08 = 0;
                    v271 = 0;
                    v272 = 1;
                    v106 = v275;
LABEL_280:
                    v327 = v58 < 16;
                    *(_QWORD *)&buf[8 * v106] = CFNumberCreate(allocator, kCFNumberIntType, &v327);
                    v356[v106] = CFSTR("ForceFullGGUpdateOnBoot");
                    HIDWORD(v130) = -1431655764 * v58 + 143165576;
                    LODWORD(v130) = HIDWORD(v130);
                    v131 = (v130 >> 2) < 0x4444445 && v58 < 16;
                    if (v131)
                    {
                      v132 = 1;
                    }
                    else
                    {
                      HIDWORD(v133) = -1813430636 * v58 + 9544368;
                      LODWORD(v133) = HIDWORD(v133);
                      v132 = (v133 >> 4) < 0x123457;
                    }
                    v276 = (os_log_t)v106;
                    if (debug_polling)
                    {
                      v134 = v132;
                      v135 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136316418;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3254;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v58;
                        *(_WORD *)&input[24] = 1024;
                        *(_DWORD *)&input[26] = v134;
                        *(_WORD *)&input[30] = 1024;
                        *(_DWORD *)&input[32] = v131;
                        *(_WORD *)&input[36] = 1024;
                        *(_DWORD *)&input[38] = v58 < 16;
                        _os_log_impl(&dword_1DA9D6000, v135, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d, fullUpdate=%d, bootFullUpdate=%d, forceFullUpdate=%d] ", input, 0x2Au);
                        v136 = debug_polling;
                      }
                      else
                      {
                        v136 = 1;
                      }
                      if (v58)
                        v137 = v134;
                      else
                        v137 = 0;
                      p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                      v132 = v134;
                      if (v136)
                      {
                        v106 = (uint64_t)v276;
                        if (v137)
                        {
                          v137 = 1;
                          statsAndLogs(notification[1], 1);
                        }
                      }
                      else
                      {
                        v106 = (uint64_t)v276;
                      }
                    }
                    else
                    {
                      if (v58)
                        v137 = v132;
                      else
                        v137 = 0;
                      p_cache = (void **)(&OBJC_METACLASS___PLProcessNetworkSource + 16);
                    }
                    if (v272)
                    {
LABEL_440:
                      if (*v293 && *(_DWORD *)(v289 + 4))
                        ++*(_DWORD *)(v289 + 28);
                      v56 = 0;
                      ++debug_cnt_ut_err;
LABEL_444:
                      ++v57;
                      goto LABEL_445;
                    }
                    v264 = v132;
                    if (debug_polling)
                    {
                      v138 = p_cache[254];
                      if (os_log_type_enabled(v138, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 136315650;
                        *(_QWORD *)&input[4] = "updateThread";
                        *(_WORD *)&input[12] = 1024;
                        *(_DWORD *)&input[14] = 3295;
                        *(_WORD *)&input[18] = 1024;
                        *(_DWORD *)&input[20] = v58;
                        _os_log_impl(&dword_1DA9D6000, v138, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d POLLING THE BATTERY", input, 0x18u);
                      }
                    }
                    v139 = (v106 + 1);
                    v140 = !v295;
                    if (!v58)
                      v140 = 1;
                    v269 = v140;
                    if (v140 != 1)
                      goto LABEL_317;
                    v141 = (v106 + 1);
                    if (v264)
                      v142 = 18;
                    else
                      v142 = 10;
                    BatteryData = readBatteryData((uint64_t)&updateThread_updates, v142, v300);
                    if (BatteryData == (_DWORD)v142)
                    {
                      calculateBatteryHealthMetric();
                      v139 = v141;
                      goto LABEL_317;
                    }
                    v273 = BatteryData;
                    log = p_cache[254];
                    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 67109376;
                      *(_DWORD *)&input[4] = v142;
                      *(_WORD *)&input[8] = 1024;
                      *(_DWORD *)&input[10] = v273;
                      _os_log_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEFAULT, "cannot read battery data count=%d (err=%d)", input, 0xEu);
                    }
                    calculateBatteryHealthMetric();
                    v139 = v141;
                    LODWORD(ChargerData) = v273;
                    if (v273)
                    {
                      v145 = 0;
                    }
                    else
                    {
LABEL_317:
                      v146 = word_1F028AB12;
                      v147 = word_1F028AB1A;
                      if (word_1F028AB1A)
                        v148 = 0;
                      else
                        v148 = word_1F028AB12 == 3600;
                      v149 = (unsigned __int16)word_1F028AB42;
                      if (v148 || (unsigned __int16)word_1F028AB42 == 0xFFFF)
                      {
                        logb = v139;
                        v157 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67110144;
                          *(_DWORD *)&input[4] = v149;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = word_1F028AB1C;
                          *(_WORD *)&input[14] = 1024;
                          *(_DWORD *)&input[16] = word_1F028AB14;
                          *(_WORD *)&input[20] = 1024;
                          *(_DWORD *)&input[22] = v146;
                          *(_WORD *)&input[26] = 1024;
                          *(_DWORD *)&input[28] = v147;
                          _os_log_impl(&dword_1DA9D6000, v157, OS_LOG_TYPE_DEFAULT, "gas gauge reset detected (flags %#x capacity %d/%dmAh voltage %dmV current %dmA)", input, 0x20u);
                        }
                        v145 = 0;
                        LODWORD(ChargerData) = -1;
                        p_cache = (void **)(&OBJC_METACLASS___PLProcessNetworkSource + 16);
                        v139 = logb;
                      }
                      else
                      {
                        if (!v58 && v342)
                        {
                          loga = v139;
                          v342 = 0;
                          v150 = word_1F028AB14;
                          v151 = 100 * (word_1F028AB14 / 100) + 100;
                          v152 = logger;
                          v153 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                          v154 = v151;
                          v155 = v151;
                          if (v153)
                          {
                            *(_QWORD *)input = 67110144;
                            v156 = ((26215 * v151) >> 18) + ((26215 * v151) >> 31);
                            *(_WORD *)&input[8] = 1024;
                            *(_DWORD *)&input[10] = v150;
                            *(_WORD *)&input[14] = 1024;
                            *(_DWORD *)&input[16] = word_1F028AB1C;
                            *(_WORD *)&input[20] = 1024;
                            *(_DWORD *)&input[22] = v155;
                            *(_WORD *)&input[26] = 1024;
                            *(_DWORD *)&input[28] = ((26215 * v155) >> 18) + ((26215 * v155) >> 31);
                            _os_log_impl(&dword_1DA9D6000, v152, OS_LOG_TYPE_DEFAULT, "mask real UPOState=%x FCC=%d RemCap=%d new FCC=%d new RemCap=%d", input, 0x20u);
                          }
                          else
                          {
                            v156 = ((26215 * v151) >> 18) + ((26215 * v151) >> 31);
                          }
                          word_1F028AB14 = v154;
                          word_1F028AB1C = v156;
                          v139 = loga;
                        }
                        if (((v269 ^ 1) & 1) != 0)
                        {
                          LODWORD(ChargerData) = 0;
                          v159 = v302;
                        }
                        else
                        {
                          v159 = v302;
                          if (v302)
                            v160 = 24;
                          else
                            v160 = 22;
                          LODWORD(ChargerData) = hdqReadS16(v300, v160, &word_1F028AB1E);
                        }
                        v145 = (_DWORD)ChargerData == 0;
                        v161 = (_DWORD)ChargerData != 0;
                        if ((v294 & 2) == 0)
                          v161 = 1;
                        if ((v161 || !v159) | (v269 ^ 1) & 1)
                        {
                          p_cache = (void **)(&OBJC_METACLASS___PLProcessNetworkSource + 16);
                        }
                        else
                        {
                          ChargerData = readChargerData(v288 & 1, v287 & 1, v300);
                          *(_QWORD *)&buf[8 * (_QWORD)v139] = ChargerData;
                          p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                          if (ChargerData)
                          {
                            if (v284)
                              CFShow(ChargerData);
                            LODWORD(ChargerData) = 0;
                            v356[(_QWORD)v139] = CFSTR("ChargerData");
                            v139 = ((char *)&v276->isa + 2);
                          }
                        }
                      }
                    }
                    v274 = (int)ChargerData;
                    v277 = v145;
                    if (v145 && (unsigned __int16)word_1F028AB0E >= 0x501u)
                    {
                      v326 = (unsigned __int16)word_1F028AB16;
                      *(_QWORD *)&buf[8 * (_QWORD)v139] = CFNumberCreate(allocator, kCFNumberIntType, &v326);
                      v356[(_QWORD)v139] = CFSTR("NominalChargeCapacity");
                      v162 = ((char *)&v139->isa + 1);
                    }
                    else
                    {
                      v162 = v139;
                    }
                    if (debug_polling)
                    {
                      v163 = p_cache[254];
                      if (os_log_type_enabled(v163, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)input = 67109376;
                        *(_DWORD *)&input[4] = dword_1F028AC88;
                        *(_WORD *)&input[8] = 1024;
                        *(_DWORD *)&input[10] = dword_1F028ACCC;
                        _os_log_impl(&dword_1DA9D6000, v163, OS_LOG_TYPE_DEFAULT, "determineVACVoltage, vacLevelCount=%d, vac95LevelCount=%d", input, 0xEu);
                      }
                    }
                    v164 = v302;
                    v263 = v137;
                    if (!byte_1F028AB2C || v58 != 0 && !v302)
                    {
                      if (v282 && (v58 == 0 || v302))
                      {
                        v170 = determineVACVoltage();
                        if (v170 != dword_1F028AB30)
                        {
                          v171 = v170;
                          dword_1F028AB30 = v170;
                          v172 = p_cache[254];
                          if (os_log_type_enabled(v172, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v171;
                            _os_log_impl(&dword_1DA9D6000, v172, OS_LOG_TYPE_DEFAULT, "Added atvAbsMaxVoltageMV=%u to battery dict", input, 8u);
                            v171 = dword_1F028AB30;
                          }
                          v167 = allocator;
                          v325 = v171;
                          v166 = v162;
                          *(_QWORD *)&buf[8 * (_QWORD)v162] = CFNumberCreate(allocator, kCFNumberIntType, &v325);
                          v169 = CFSTR("atvAbsMaxVoltageMV");
                          v164 = v302;
                          v168 = v269;
LABEL_375:
                          v356[(_QWORD)v166] = (void *)v169;
                          v166 = ((char *)v166 + 1);
                          goto LABEL_376;
                        }
                        v164 = v302;
                      }
                      v167 = allocator;
                      v166 = v162;
                      goto LABEL_371;
                    }
                    v165 = dynamicATV(v300);
                    v166 = v162;
                    *(_QWORD *)&buf[8 * (_QWORD)v162] = v165;
                    v167 = allocator;
                    if (v165)
                    {
                      v168 = v269;
                      if (v284)
                        CFShow(v165);
                      v169 = CFSTR("AppleDynamicATV");
                      goto LABEL_375;
                    }
LABEL_371:
                    v168 = v269;
LABEL_376:
                    v173 = v277;
                    if ((v294 & 2) != 0)
                      v173 = 0;
                    if ((v168 & (v173 && v164)) == 1)
                    {
                      *(_QWORD *)input = 0;
                      keys[0] = 0;
                      *(_QWORD *)input = CFNumberCreate(v167, kCFNumberIntType, &dword_1F028AB30);
                      keys[0] = CFSTR("ChargingVoltage");
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFDictionaryCreate(v167, (const void **)keys, (const void **)input, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                      v356[(_QWORD)v166] = CFSTR("ChargerData");
                      v166 = ((char *)v166 + 1);
                      CFRelease(*(CFTypeRef *)input);
                    }
                    if (dword_1F028AD10)
                    {
                      v174 = determinePoSMThreshold();
                      if (v174 != dword_1F028AB38)
                        dword_1F028AB38 = v174;
                      *(_DWORD *)input = HIWORD(v174);
                      LODWORD(keys[0]) = (unsigned __int16)v174;
                      if ((unsigned __int16)v174 == 0xFFFF || HIWORD(v174) == 0xFFFF)
                        v176 = 0;
                      else
                        v176 = dword_1F028AD10;
                      *(_DWORD *)v346 = v176;
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(v167, kCFNumberIntType, v346);
                      v356[(_QWORD)v166] = CFSTR("PoSMEnabled");
                      v177 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v178 = 8 * (_QWORD)v166 + 8;
                      *(_QWORD *)&buf[v178] = v177;
                      *(void **)((char *)v356 + v178) = CFSTR("PoSMUpperThreshold");
                      v166 = ((char *)v166 + 2);
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(allocator, kCFNumberIntType, keys);
                      v356[(_QWORD)v166] = CFSTR("PoSMLowerThreshold");
                    }
                    else
                    {
                      *(_DWORD *)input = 0;
                      *(_QWORD *)&buf[8 * (_QWORD)v166] = CFNumberCreate(v167, kCFNumberIntType, input);
                      v356[(_QWORD)v166] = CFSTR("PoSMEnabled");
                    }
                    if ((v277 & v294) != 0)
                      U16 = 0;
                    else
                      U16 = v274;
                    if ((v168 & v277 & v294) == 1)
                      U16 = hdqReadU16(v300, 110, &word_1F028AB20);
                    p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                    v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    v181 = v271;
                    v182 = v166;
                    v183 = (unint64_t)&v166->isa + 1;
                    if (!U16)
                    {
                      v184 = v182;
                      logc = v182;
                      v324 = 10 * word_1F028AB18 - 27320;
                      *(_QWORD *)&buf[8 * v183] = CFNumberCreate(allocator, kCFNumberIntType, &v324);
                      v356[v183] = CFSTR("Temperature");
                      v323 = word_1F028AB1A;
                      v185 = CFNumberCreate(allocator, kCFNumberIntType, &v323);
                      v186 = 8 * (_QWORD)v184;
                      v187 = 8 * (_QWORD)v184 + 16;
                      *(_QWORD *)&buf[v187] = v185;
                      *(void **)((char *)v356 + v187) = CFSTR("Amperage");
                      v322 = word_1F028AB12;
                      v188 = CFNumberCreate(allocator, kCFNumberIntType, &v322);
                      v189 = 8 * (_QWORD)v184 + 24;
                      *(_QWORD *)&buf[v189] = v188;
                      *(void **)((char *)v356 + v189) = CFSTR("Voltage");
                      v321 = word_1F028AB1E;
                      v190 = CFNumberCreate(allocator, kCFNumberIntType, &v321);
                      v191 = 8 * (_QWORD)v184 + 32;
                      *(_QWORD *)&buf[v191] = v190;
                      *(void **)((char *)v356 + v191) = CFSTR("TimeRemaining");
                      v61 = word_1F028AB1C;
                      v320 = word_1F028AB1C;
                      v192 = CFNumberCreate(allocator, kCFNumberIntType, &v320);
                      v193 = v186 + 40;
                      *(_QWORD *)&buf[v193] = v192;
                      *(void **)((char *)v356 + v193) = CFSTR("CurrentCapacity");
                      v319 = word_1F028AB14;
                      v194 = CFNumberCreate(allocator, kCFNumberIntType, &v319);
                      v195 = v186 + 48;
                      *(_QWORD *)&buf[v195] = v194;
                      *(void **)((char *)v356 + v195) = CFSTR("MaxCapacity");
                      HIWORD(v196) = -18304;
                      LOWORD(v196) = word_1F028AB3E;
                      *(_DWORD *)input = llroundf((float)((float)((float)word_1F028AB22 * -0.000061035) + 1.0) * (float)v196);
                      v197 = CFNumberCreate(allocator, kCFNumberIntType, input);
                      v198 = v186 + 56;
                      *(_QWORD *)&buf[v198] = v197;
                      *(void **)((char *)v356 + v198) = CFSTR("AbsoluteCapacity");
                      v199 = v305;
                      if (!v271)
                        v199 = v291;
                      v200 = v186 + 64;
                      *(_QWORD *)&buf[v200] = v199;
                      *(void **)((char *)v356 + v200) = CFSTR("AtCriticalLevel");
                      v318 = (unsigned __int16)word_1F028AB42;
                      v201 = CFNumberCreate(allocator, kCFNumberIntType, &v318);
                      v202 = v186 + 72;
                      *(_QWORD *)&buf[v202] = v201;
                      *(void **)((char *)v356 + v202) = CFSTR("AppleRawBatteryFlags");
                      v203 = (char *)&logc[1].isa + 2;
                      if ((v294 & 1) != 0)
                      {
                        v317 = (unsigned __int16)word_1F028AB20;
                        *(_QWORD *)&buf[8 * (_QWORD)v203] = CFNumberCreate(allocator, kCFNumberIntType, &v317);
                        v356[(_QWORD)v203] = CFSTR("ITMiscStatus");
                        v316 = word_1F028AB20 & 3;
                        v204 = CFNumberCreate(allocator, kCFNumberIntType, &v316);
                        v205 = v186 + 88;
                        *(_QWORD *)&buf[v205] = v204;
                        *(void **)((char *)v356 + v205) = CFSTR("ITSimulationCounter");
                        v315 = ((unsigned __int16)word_1F028AB20 >> 2) & 3;
                        v206 = CFNumberCreate(allocator, kCFNumberIntType, &v315);
                        v207 = v186 + 96;
                        *(_QWORD *)&buf[v207] = v206;
                        *(void **)((char *)v356 + v207) = CFSTR("RaUpdateCounter");
                        v203 = (char *)&logc[1].isa + 5;
                      }
                      v314 = word_1F028AB42 & 0x80;
                      *(_QWORD *)&buf[8 * (_QWORD)v203] = CFNumberCreate(allocator, kCFNumberIntType, &v314);
                      v356[(_QWORD)v203] = CFSTR("OCVTakenFlag");
                      v313 = word_1F028AB42 & 0x200;
                      v208 = CFNumberCreate(allocator, kCFNumberIntType, &v313);
                      v209 = 8 * (_QWORD)v203 + 8;
                      *(_QWORD *)&buf[v209] = v208;
                      *(void **)((char *)v356 + v209) = CFSTR("FCFlag");
                      v183 = (unint64_t)(v203 + 2);
                      if (!v264)
                        goto LABEL_406;
                      v312 = (unsigned __int16)word_1F028AB3C;
                      *(_QWORD *)&buf[8 * v183] = CFNumberCreate(allocator, kCFNumberIntType, &v312);
                      v356[v183] = CFSTR("CycleCount");
                      v311 = word_1F028AB0A;
                      v210 = CFNumberCreate(allocator, kCFNumberIntType, &v311);
                      v211 = 8 * (_QWORD)v203 + 24;
                      *(_QWORD *)&buf[v211] = v210;
                      *(void **)((char *)v356 + v211) = CFSTR("DesignCapacity");
                      v183 = (unint64_t)(v203 + 4);
                      v212 = parseBatteryData(v294 & 1, v280);
                      *(_QWORD *)&buf[8 * (_QWORD)(v203 + 4)] = v212;
                      if (v212)
                      {
                        U16 = 0;
                        if (v284)
                          CFShow(v212);
                        v356[v183] = CFSTR("BatteryData");
                        v183 = (unint64_t)(v203 + 5);
                        v181 = v271;
                      }
                      else
                      {
LABEL_406:
                        v181 = v271;
                        U16 = 0;
                      }
                      v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    }
                    if (v286 && (updateThread_oneTime & 1) == 0)
                    {
                      v352 = 0u;
                      memset(input, 0, sizeof(input));
                      *(_OWORD *)keys = 0u;
                      v351 = 0u;
                      if (ggctl_logShutdownReason(v300, (uint64_t)input, 1u) || !*(_QWORD *)&input[40])
                      {
                        v215 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)v346 = 136315394;
                          v347 = "updateThread";
                          v348 = 1024;
                          v349 = 3577;
                          _os_log_impl(&dword_1DA9D6000, v215, OS_LOG_TYPE_DEFAULT, "%s:%d  Error Reading Shutdown reason", v346, 0x12u);
                        }
                        v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                      }
                      else
                      {
                        ggctl_logShutdownReason2(v300, keys, 1u);
                        v213 = parseShutdownReason((__int16 *)input, (const UInt8 *)keys, v300);
                        if (v213)
                        {
                          v214 = v213;
                          if (v284)
                            CFShow(v213);
                          *(_QWORD *)&buf[8 * v183] = v214;
                          v356[v183++] = CFSTR("BatteryShutdownReason");
                        }
                        memset(input, 0, sizeof(input));
                        ggctl_logShutdownReason(v300, (uint64_t)input, 0);
                        *(_OWORD *)keys = 0u;
                        v351 = 0u;
                        v352 = 0u;
                        ggctl_logShutdownReason2(v300, keys, 0);
                        v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                      }
                      updateThread_oneTime = 1;
                      v181 = v271;
                    }
                    if (v181)
                      readIMAXAndSOCSmoothData(byte_1F028ABA6, v179, v300);
                    if (!U16)
                    {
                      v216 = CFDictionaryCreate(allocator, (const void **)v356, (const void **)buf, v183, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
                      if (v216)
                      {
                        v217 = v216;
                        if (v284)
                          CFShow(v216);
                        if (debug_polling)
                        {
                          v218 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136315650;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3600;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            _os_log_impl(&dword_1DA9D6000, v218, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d PUBLISHING BATTERY data", input, 0x18u);
                          }
                        }
                        v219 = v217;
                        U16 = IORegistryEntrySetCFProperties(v6, v217);
                        if (U16)
                        {
                          v278 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = U16;
                            _os_log_error_impl(&dword_1DA9D6000, v278, OS_LOG_TYPE_ERROR, "IORegistryEntrySetCFProperties(0x%x)", input, 8u);
                          }
                        }
                        CFRelease(v219);
                        ++debug_cnt_ut_sent;
                      }
                      else
                      {
                        v220 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 136315650;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3608;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v58;
                          _os_log_error_impl(&dword_1DA9D6000, v220, OS_LOG_TYPE_ERROR, "%s:%d  updatesDone=%d dictionary failed", input, 0x18u);
                        }
                        U16 = 0;
                      }
                      v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    }
                    do
                      CFRelease(*(CFTypeRef *)&buf[8 * v183 - 8]);
                    while (v183-- > 1);
                    if (U16)
                      goto LABEL_440;
                    if (v295)
                    {
                      if ((v283 & 1) != 0)
                      {
                        S16 = controlReadS16(v300, 25, 0);
                        if (S16)
                        {
                          v223 = S16;
                          v224 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v223;
                            _os_log_error_impl(&dword_1DA9D6000, v224, OS_LOG_TYPE_ERROR, "CCA: usermode cannot disable DLOG (%#x)", input, 8u);
                          }
                          LOBYTE(v283) = 1;
                        }
                        else
                        {
                          LOBYTE(v283) = 0;
                          *(_DWORD *)(v289 + 24) = 0;
                          *(_DWORD *)(v289 + 16) = 0;
                          *(_QWORD *)(v289 + 8) = 0;
                        }
                        goto LABEL_517;
                      }
                      LOBYTE(v283) = 0;
LABEL_518:
                      if (*((_DWORD *)v2 + 848))
                      {
                        *((_DWORD *)v2 + 848) = 0;
                        v255 = logger;
                        v256 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if (v59 == 0.0)
                        {
                          if (v256)
                          {
                            *(_WORD *)input = 0;
                            v257 = v255;
                            v258 = "gasgauge success after previous failure";
                            v259 = 2;
                            goto LABEL_524;
                          }
                        }
                        else if (v256)
                        {
                          v260 = CFAbsoluteTimeGetCurrent();
                          *(_DWORD *)input = 134217984;
                          *(double *)&input[4] = v260 - v59;
                          v257 = v255;
                          v258 = "gasgauge success after previous %gs failure";
                          v259 = 12;
LABEL_524:
                          _os_log_impl(&dword_1DA9D6000, v257, OS_LOG_TYPE_DEFAULT, v258, input, v259);
                        }
                      }
                      v59 = CFAbsoluteTimeGetCurrent();
                      v56 = 0;
                      v57 = 0;
                      word_1F028ABC6 = word_1F028AB12;
                      word_1F028ABC8 = word_1F028AB1A;
                      dword_1F028ABCA = *(_DWORD *)&word_1F028AB14;
                      word_1F028ABCE = word_1F028AB1C;
                      ++v58;
                      goto LABEL_445;
                    }
                    if ((unsigned __int16)word_1F028AB0E < 0x132u)
                      goto LABEL_518;
                    if ((v281 & 1) != 0)
                    {
                      v225 = time(0);
                      if (v225 < v279)
                      {
                        v226 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 134217984;
                          *(_QWORD *)&input[4] = v279;
                          v227 = v226;
                          v228 = "CCA: wait for deadline now=%lu";
                          goto LABEL_476;
                        }
                        goto LABEL_477;
                      }
                      v230 = v225;
                      if ((unsigned __int16)word_1F028AB0E < 0x600u)
                      {
                        LOWORD(keys[0]) = 0;
                        v236 = controlReadU16(v300, 0, keys);
                        if (v236)
                        {
                          v237 = v236;
                          v238 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          {
                            *(_DWORD *)input = 67109120;
                            *(_DWORD *)&input[4] = v237;
                            _os_log_error_impl(&dword_1DA9D6000, v238, OS_LOG_TYPE_ERROR, "CCA: cannot read DLOG status (%#x)", input, 8u);
                          }
                          goto LABEL_477;
                        }
                        v239 = (__int16)keys[0];
                        v232 = logger;
                        v240 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v239 & 0x800) != 0)
                        {
                          if (!v240)
                            goto LABEL_477;
                          goto LABEL_475;
                        }
                        if (v240)
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v230;
                          v234 = v232;
                          v235 = "CCA: re-enable DLOG updatesDone=%d, now=%lu";
LABEL_472:
                          _os_log_impl(&dword_1DA9D6000, v234, OS_LOG_TYPE_DEFAULT, v235, input, 0x12u);
                        }
LABEL_473:
                        v229 = 0;
                        v279 = 0;
                      }
                      else
                      {
                        v231 = word_1F028AB42;
                        v232 = logger;
                        v233 = os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT);
                        if ((v231 & 0x20) == 0)
                        {
                          if (v233)
                          {
                            *(_DWORD *)input = 67109376;
                            *(_DWORD *)&input[4] = v58;
                            *(_WORD *)&input[8] = 2048;
                            *(_QWORD *)&input[10] = v230;
                            v234 = v232;
                            v235 = "CCA: re-enable DLOG updatesDone=%u, now=%lu";
                            goto LABEL_472;
                          }
                          goto LABEL_473;
                        }
                        if (!v233)
                          goto LABEL_477;
LABEL_475:
                        *(_DWORD *)input = 134217984;
                        *(_QWORD *)&input[4] = v230;
                        v227 = v232;
                        v228 = "CCA: GasGauge still calibrating now=%lu";
LABEL_476:
                        _os_log_impl(&dword_1DA9D6000, v227, OS_LOG_TYPE_DEFAULT, v228, input, 0xCu);
LABEL_477:
                        v229 = 1;
                      }
                    }
                    else
                    {
                      v229 = 0;
                    }
                    if ((v283 & 1) != 0)
                    {
                      if (*(_DWORD *)(v289 + 4))
                        goto LABEL_485;
                      v241 = logger;
                      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                      {
                        v242 = *(_DWORD *)(v289 + 4);
                        *(_DWORD *)input = 67109120;
                        *(_DWORD *)&input[4] = v242;
                        _os_log_impl(&dword_1DA9D6000, v241, OS_LOG_TYPE_DEFAULT, "disabling DLOG (num_clients=%i)", input, 8u);
                      }
                      v243 = controlReadS16(v300, 25, 0);
                      if (v243)
                      {
                        v244 = v243;
                        v245 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v244;
                          _os_log_error_impl(&dword_1DA9D6000, v245, OS_LOG_TYPE_ERROR, "cannot disable DLOG (%#x)", input, 8u);
                        }
LABEL_485:
                        v283 = 1;
                      }
                      else
                      {
                        v283 = 0;
                        *(_DWORD *)(v289 + 24) = 0;
                        *(_DWORD *)(v289 + 16) = 0;
                        *(_QWORD *)(v289 + 8) = 0;
                      }
                    }
                    else
                    {
                      v283 = 0;
                    }
                    if (*(_DWORD *)(v289 + 4))
                      v246 = v229;
                    else
                      v246 = 1;
                    if ((v246 & 1) == 0)
                    {
                      if (!v58 || v283 != 1)
                      {
                        v247 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          v248 = *(_DWORD *)(v289 + 4);
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 1024;
                          *(_DWORD *)&input[10] = v248;
                          _os_log_impl(&dword_1DA9D6000, v247, OS_LOG_TYPE_DEFAULT, "gathering data log updatesDone=%d num_clients=%d", input, 0xEu);
                        }
                      }
                      if ((*(_DWORD *)(v289 + 4) & 0x80000000) != 0
                        && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                      {
                        updateThread_cold_4(&v309, v310);
                      }
                      if (drainDataLog(v300))
                      {
                        v249 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                          updateThread_cold_3(v344, v345, v249);
                      }
                      v283 = 1;
                    }
                    if ((v229 & 1) != 0)
                    {
                      v250 = 1;
                    }
                    else if ((unsigned __int16)word_1F028AB0E < 0x600u)
                    {
                      v250 = v263;
                      if ((unsigned __int16)word_1F028AB0E <= 0x501u)
                        v250 = 0;
                    }
                    else
                    {
                      v250 = ((unsigned __int16)word_1F028AB42 >> 5) & 1;
                    }
                    v281 = v250;
                    if ((v283 & v250) == 1)
                    {
                      v251 = controlReadS16(v300, 25, 0);
                      if (v251)
                      {
                        v252 = v251;
                        v253 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
                        {
                          *(_DWORD *)input = 67109120;
                          *(_DWORD *)&input[4] = v252;
                          _os_log_error_impl(&dword_1DA9D6000, v253, OS_LOG_TYPE_ERROR, "CCA: cannot disable DLOG (%#x)", input, 8u);
                        }
                        v281 = 0;
                        LOBYTE(v283) = 1;
                      }
                      else
                      {
                        *(_DWORD *)(v289 + 16) = 0;
                        *(_QWORD *)(v289 + 8) = 0;
                        v279 = time(0) + 20;
                        v254 = logger;
                        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                        {
                          *(_DWORD *)input = 67109376;
                          *(_DWORD *)&input[4] = v58;
                          *(_WORD *)&input[8] = 2048;
                          *(_QWORD *)&input[10] = v279;
                          _os_log_impl(&dword_1DA9D6000, v254, OS_LOG_TYPE_DEFAULT, "CCA: disabled DLOG updatesDone=%d ccaDeadline=%lu", input, 0x12u);
                        }
                        LOBYTE(v283) = 0;
                        v281 = 1;
                      }
                    }
                    p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
LABEL_517:
                    v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    goto LABEL_518;
                  }
LABEL_203:
                  if (debug_polling)
                  {
                    v103 = p_cache[254];
                    if (os_log_type_enabled(v103, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)input = 136315650;
                      *(_QWORD *)&input[4] = "updateThread";
                      *(_WORD *)&input[12] = 1024;
                      *(_DWORD *)&input[14] = 3146;
                      *(_WORD *)&input[18] = 1024;
                      *(_DWORD *)&input[20] = v58;
                      _os_log_impl(&dword_1DA9D6000, v103, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d READING FLAGS", input, 0x18u);
                    }
                  }
                  v104 = hdqReadU16(v300, 10, &word_1F028AB42);
                  v105 = 0;
                  v272 = v104;
                  if (v104 || (unsigned __int16)word_1F028AB42 == 0xFFFF)
                  {
                    v106 = v275;
                  }
                  else
                  {
                    v106 = v275;
                    if (((v292 ^ 1) & 1) == 0)
                    {
                      if (word_1F028AC6C)
                      {
                        v270 = 0;
                        if ((v294 & 0x20) != 0)
                        {
                          v107 = v285
                              && (unsigned __int16)(word_1F028AC6C & word_1F028AB42) == (unsigned __int16)word_1F028AC6C;
                          v285 = (unsigned __int16)(word_1F028AC6C & word_1F028AB42) == (unsigned __int16)word_1F028AC6C;
                        }
                        else
                        {
                          v107 = (unsigned __int16)(word_1F028AC6C & word_1F028AB42) == (unsigned __int16)word_1F028AC6C;
                        }
                      }
                      else if (v58 && dword_1F028AC70 >= word_1F028AB12)
                      {
                        v270 = 0;
                        v107 = 1;
                      }
                      else
                      {
                        v107 = ((unsigned __int16)word_1F028AB42 >> 2) & 1;
                        v270 = 1;
                      }
                      if (debug_polling)
                      {
                        v116 = p_cache[254];
                        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
                        {
                          v117 = UpSeconds();
                          *(_DWORD *)input = 136317186;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3178;
                          *(_WORD *)&input[18] = 1024;
                          *(_DWORD *)&input[20] = v58;
                          *(_WORD *)&input[24] = 1024;
                          *(_DWORD *)&input[26] = v107;
                          *(_WORD *)&input[30] = 1024;
                          *(_DWORD *)&input[32] = v302;
                          p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                          *(_WORD *)&input[36] = 2048;
                          *(_QWORD *)&input[38] = v117;
                          *(_WORD *)&input[46] = 1024;
                          *(_DWORD *)&input[48] = v341;
                          LOWORD(v354) = 1024;
                          *(_DWORD *)((char *)&v354 + 2) = dword_1F028AC70;
                          HIWORD(v354) = 1024;
                          v355 = word_1F028AB12;
                          _os_log_impl(&dword_1DA9D6000, v116, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu cfd=%d cfd-voltage=%d batteryInfo.voltage=%d", input, 0x40u);
                        }
                      }
                      if (!v341)
                        goto LABEL_263;
                      v118 = UpSeconds();
                      if (v118 <= v341)
                      {
                        if (!v58)
                          goto LABEL_533;
                        v121 = word_1F028AB12;
                        if (dword_1F028AC70 >= word_1F028AB12)
                        {
                          v124 = v118;
                          v125 = logger;
                          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
                          {
                            *(_DWORD *)input = 136316162;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3201;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            *(_WORD *)&input[24] = 2048;
                            *(_QWORD *)&input[26] = v124;
                            *(_WORD *)&input[34] = 1024;
                            *(_DWORD *)&input[36] = v121;
                            _os_log_impl(&dword_1DA9D6000, v125, OS_LOG_TYPE_DEFAULT, "%s:%d updatesDone=%d UpSeconds=%llu voltage=%d (low)", input, 0x28u);
                          }
                          v270 = 0;
                          v107 = 1;
                          p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                          goto LABEL_263;
                        }
                        p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                        if (v302)
                        {
LABEL_533:
                          if (debug_polling)
                          {
                            if (v107)
                            {
                              v122 = p_cache[254];
                              if (os_log_type_enabled(v122, OS_LOG_TYPE_DEFAULT))
                              {
                                v123 = UpSeconds();
                                *(_DWORD *)input = 136315906;
                                *(_QWORD *)&input[4] = "updateThread";
                                *(_WORD *)&input[12] = 1024;
                                *(_DWORD *)&input[14] = 3209;
                                *(_WORD *)&input[18] = 2048;
                                *(_QWORD *)&input[20] = v123;
                                *(_WORD *)&input[28] = 1024;
                                *(_DWORD *)&input[30] = v341;
                                _os_log_impl(&dword_1DA9D6000, v122, OS_LOG_TYPE_DEFAULT, "%s:%d UpSeconds=%llu (cfd = %u) forcing critical to 0", input, 0x22u);
                              }
                            }
                          }
                          if (!v270)
                            v107 = 0;
                          v270 = v270 << 31 >> 31;
                        }
                      }
                      else if (debug_polling)
                      {
                        v119 = p_cache[254];
                        if (os_log_type_enabled(v119, OS_LOG_TYPE_DEFAULT))
                        {
                          v120 = UpSeconds();
                          *(_DWORD *)input = 136315906;
                          *(_QWORD *)&input[4] = "updateThread";
                          *(_WORD *)&input[12] = 1024;
                          *(_DWORD *)&input[14] = 3191;
                          *(_WORD *)&input[18] = 2048;
                          *(_QWORD *)&input[20] = v120;
                          *(_WORD *)&input[28] = 1024;
                          *(_DWORD *)&input[30] = v341;
                          _os_log_impl(&dword_1DA9D6000, v119, OS_LOG_TYPE_DEFAULT, "%s:%d deadline expired at UpSeconds=%llu (cfd = %u)", input, 0x22u);
                        }
                      }
LABEL_263:
                      if (!word_1F028AC6C)
                      {
                        v328 = v270;
                        *(_QWORD *)((unint64_t)buf | (8 * v275)) = CFNumberCreate(allocator, kCFNumberIntType, &v328);
                        *(_QWORD *)((unint64_t)v356 & 0xFFFFFFFFFFFFFFF7 | (8 * (v275 & 1))) = CFSTR("SOCBasedShutdown");
                        v106 = v275 + 1;
                      }
                      if (debug_polling)
                      {
                        if (v107)
                        {
                          v126 = p_cache[254];
                          if (os_log_type_enabled(v126, OS_LOG_TYPE_DEFAULT))
                          {
                            v127 = UpSeconds();
                            *(_DWORD *)input = 136316674;
                            *(_QWORD *)&input[4] = "updateThread";
                            *(_WORD *)&input[12] = 1024;
                            *(_DWORD *)&input[14] = 3227;
                            *(_WORD *)&input[18] = 1024;
                            *(_DWORD *)&input[20] = v58;
                            *(_WORD *)&input[24] = 1024;
                            *(_DWORD *)&input[26] = 1;
                            *(_WORD *)&input[30] = 1024;
                            *(_DWORD *)&input[32] = v302;
                            p_cache = &OBJC_METACLASS___PLProcessNetworkSource.cache;
                            *(_WORD *)&input[36] = 2048;
                            *(_QWORD *)&input[38] = v127;
                            *(_WORD *)&input[46] = 1024;
                            *(_DWORD *)&input[48] = word_1F028AB12;
                            _os_log_impl(&dword_1DA9D6000, v126, OS_LOG_TYPE_DEFAULT, "%s:%d  updatesDone=%d criticalValue=%d external_connected=%d UpSeconds=%llu batteryInfo.voltage=%d", input, 0x34u);
                          }
                        }
                      }
                      v105 = v107 != 0;
                      v2 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
                    }
                  }
                  if ((v72 & 1) == 0 || (v290 > 2 ? (v128 = 1) : (v128 = v105), (v128 & 1) != 0 || v57))
                  {
                    v271 = v105;
                    v290 = 0;
                    goto LABEL_280;
                  }
                  ++v290;
                  v129 = p_cache[254];
                  if (os_log_type_enabled(v129, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)input = 0;
                    _os_log_impl(&dword_1DA9D6000, v129, OS_LOG_TYPE_INFO, "flags update only", input, 2u);
                  }
                  v56 = 0;
                  v57 = 0;
LABEL_445:
                  v62 = v300;
                }
              }
              else
              {
                v92 = CFPreferencesCopyValue(CFSTR("ResetEnabled"), CFSTR("com.apple.gasgauge"), v298, v297);
                v93 = os_log_type_enabled((os_log_t)p_cache[254], OS_LOG_TYPE_ERROR);
                if (v92 == v291)
                {
                  v94 = v300;
                  if (v93)
                    updateThread_cold_5(&v333, v334);
                }
                else
                {
                  if (v93)
                    updateThread_cold_6(&v331, v332);
                  v94 = v300;
                  ggctl_reset(v300, 1u);
                }
                v56 = 0;
                ++v57;
                v62 = v94;
              }
            }
          }
        }
        else
        {
          v56 = 0;
LABEL_166:
          v62 = -1;
        }
      }
    }
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      updateThread_cold_1();
  }
  return 0;
}

uint64_t batteryThread(unsigned int a1)
{
  updateThread(a1);
  return 0;
}

uint64_t iokit_callback(uint64_t result, uint64_t a2, int a3, uint64_t a4)
{
  *(_DWORD *)result = a3;
  *(_QWORD *)(result + 8) = a4;
  return result;
}

void getUPOData(CFStringRef key, void *a2)
{
  io_registry_entry_t v4;
  CFAllocatorRef *v5;
  CFMutableDictionaryRef v6;
  __CFDictionary *v7;
  const __CFAllocator *v8;
  CFDictionaryRef v9;
  CFDictionaryRef v10;
  CFTypeRef CFProperty;
  const void *v12;
  CFTypeID TypeID;
  NSObject *v14;
  int v15;
  const char *v16;
  __int16 v17;
  int v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = find_pmu_pmu_service;
  v5 = (CFAllocatorRef *)MEMORY[0x1E0C9AE00];
  if (find_pmu_pmu_service)
    goto LABEL_7;
  v6 = IOServiceMatching("IOService");
  if (v6)
  {
    v7 = v6;
    v15 = 0;
    v8 = *v5;
    find_pmu_zero_number = (uint64_t)CFNumberCreate(*v5, kCFNumberSInt32Type, &v15);
    v9 = CFDictionaryCreate(v8, (const void **)find_pmu_tmp, (const void **)&find_pmu_zero_number, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v9)
    {
      v10 = v9;
      CFDictionarySetValue(v7, CFSTR("IOPropertyMatch"), v9);
      CFRelease(v10);
      find_pmu_pmu_service = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v7);
    }
    else
    {
      CFRelease(v7);
    }
  }
  v4 = find_pmu_pmu_service;
  if (find_pmu_pmu_service)
  {
LABEL_7:
    CFProperty = IORegistryEntryCreateCFProperty(v4, key, *v5, 0);
    if (CFProperty)
    {
      v12 = CFProperty;
      TypeID = CFNumberGetTypeID();
      if (TypeID != CFGetTypeID(v12) || !CFNumberGetValue((CFNumberRef)v12, kCFNumberSInt32Type, a2))
      {
        v14 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v15 = 136315394;
          v16 = "/Library/Caches/com.apple.xbs/Sources/AppleHDQGasGauge/AppleHDQGasGauge.c";
          v17 = 1024;
          v18 = 2348;
          _os_log_impl(&dword_1DA9D6000, v14, OS_LOG_TYPE_DEFAULT, "%s:%d cannot read upo data", (uint8_t *)&v15, 0x12u);
        }
      }
      CFRelease(v12);
    }
  }
}

void setUPOData(const __CFString *a1, int a2)
{
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  const __CFAllocator *v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  io_service_t MatchingService;
  io_registry_entry_t v9;
  CFNumberRef v10;
  CFNumberRef v11;
  CFNumberRef v12;
  int valuePtr;
  int v14;

  v14 = a2;
  v3 = IOServiceMatching("IOService");
  if (v3)
  {
    v4 = v3;
    valuePtr = 0;
    v5 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v12 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt32Type, &valuePtr);
    v6 = CFDictionaryCreate(v5, (const void **)&setUPOData_tmp, (const void **)&v12, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (v6)
    {
      v7 = v6;
      CFDictionarySetValue(v4, CFSTR("IOPropertyMatch"), v6);
      CFRelease(v7);
      MatchingService = IOServiceGetMatchingService(*MEMORY[0x1E0CBBAA8], v4);
      if (!MatchingService)
        return;
      v9 = MatchingService;
      v10 = CFNumberCreate(v5, kCFNumberSInt32Type, &v14);
      IORegistryEntrySetCFProperty(v9, a1, v10);
      IOObjectRelease(v9);
      v11 = v10;
    }
    else
    {
      v11 = v4;
    }
    CFRelease(v11);
  }
}

void updateThermalCoolDownState(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  void **v5;
  CFDictionaryRef v6;
  CFDictionaryRef v7;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "ThermalCoolDown", 0x8000100u);
  v5 = (void **)MEMORY[0x1E0C9AE50];
  if (!a2)
    v5 = (void **)MEMORY[0x1E0C9AE40];
  values = *v5;
  v6 = CFDictionaryCreate(v4, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v6)
  {
    v7 = v6;
    IORegistryEntrySetCFProperties(a1, v6);
    CFRelease(v7);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    updateThermalCoolDownState_cold_1();
  }
}

void statsAndLogs(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v4;
  const void *v5;
  CFIndex v6;
  CFDictionaryRef v7;
  CFDictionaryRef v8;
  void *values;
  CFTypeRef cf;
  void *keys;
  CFStringRef v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v12 = 0;
  cf = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  keys = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "stats", 0x8000100u);
  v5 = (const void *)*MEMORY[0x1E0C9AE40];
  values = (void *)*MEMORY[0x1E0C9AE40];
  if (a2)
  {
    v12 = CFStringCreateWithCString(v4, "log", 0x8000100u);
    cf = v5;
    v6 = 2;
  }
  else
  {
    v6 = 1;
  }
  v7 = CFDictionaryCreate(v4, (const void **)&keys, (const void **)&values, v6, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v7)
  {
    v8 = v7;
    if (IORegistryEntrySetCFProperties(a1, v7) && os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      statsAndLogs_cold_2();
    CFRelease(v8);
    CFRelease(values);
    if (a2)
      CFRelease(cf);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    statsAndLogs_cold_1();
  }
}

void debugLog(io_registry_entry_t a1, int a2)
{
  const __CFAllocator *v3;
  CFDictionaryRef v4;
  CFDictionaryRef v5;
  int valuePtr;
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  valuePtr = a2;
  v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  keys[0] = (void *)CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], "debug", 0x8000100u);
  values = CFNumberCreate(v3, kCFNumberSInt32Type, &valuePtr);
  v4 = CFDictionaryCreate(v3, (const void **)keys, (const void **)&values, 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v4)
  {
    v5 = v4;
    if (IORegistryEntrySetCFProperties(a1, v4))
    {
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
        debugLog_cold_2();
    }
    CFRelease(v5);
    CFRelease(values);
  }
  else if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
  {
    debugLog_cold_1();
  }
}

uint64_t readChargeTable(mach_port_t a1, __CFData **a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  unsigned int v9;
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned __int8 v13;
  char *p_outputStruct;
  char v15;
  int v16;
  uint64_t v17;
  unint64_t v19;
  uint64_t v20;
  __CFData *Mutable;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  _BYTE *v25;
  uint64_t v26;
  UInt8 *MutableBytePtr;
  UInt8 *v28;
  char *v29;
  UInt8 *v30;
  uint64_t v31;
  uint64_t v32;
  _BYTE *v33;
  int v34;
  unsigned int v35;
  uint64_t v36;
  unsigned int v37;
  uint8_t buf[4];
  int v39;
  __int16 v40;
  int v41;
  __int16 v42;
  int v43;
  unsigned __int8 outputStruct;
  unsigned __int8 v45;
  unsigned __int8 v46;
  unsigned __int8 v47;
  _BYTE v48[34];

  *(_QWORD *)&v48[26] = *MEMORY[0x1E0C80C00];
  *a2 = 0;
  if (!dword_1F028ABE4)
    return 0;
  v3 = 0xFFFFFFFFLL;
  if (!ggctl_readBlock(a1, -1, dword_1F028ABE4, &outputStruct, 0))
  {
    v4 = v47;
    if (v47 == 255)
    {
      v9 = outputStruct;
      v10 = (unint64_t)outputStruct >> 4;
      v11 = 6 * v10 + 4;
      if (outputStruct <= 0x4FuLL)
      {
        v13 = 0;
        v37 = v46;
        p_outputStruct = (char *)&outputStruct;
        do
        {
          v15 = *p_outputStruct++;
          v13 += v15;
          --v11;
        }
        while (v11);
        v16 = v13;
        if (v13)
        {
          v17 = logger;
          v3 = 0;
          if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 67109632;
            v39 = v16;
            v40 = 1024;
            v41 = v45;
            v42 = 1024;
            v43 = 256 - (v16 - v45);
            v6 = "gas gauge charge table bad checksum: checksum %#x checksum byte %#x expecting %#x";
            v7 = v17;
            v8 = 20;
            goto LABEL_14;
          }
        }
        else
        {
          v19 = (unint64_t)v46 >> 4;
          v20 = 4 * v19 + 8;
          Mutable = CFDataCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v20 * (unint64_t)v10);
          CFDataSetLength(Mutable, v20 * (unint64_t)v10);
          if (v9 >= 0x10)
          {
            v22 = 0;
            if (v19 <= 1)
              v23 = 1;
            else
              v23 = v19;
            v36 = v23;
            if (v10 <= 1)
              v24 = 1;
            else
              v24 = v10;
            v25 = v48;
            v26 = 10;
            do
            {
              MutableBytePtr = CFDataGetMutableBytePtr(Mutable);
              v28 = &MutableBytePtr[v22 * v20];
              v29 = (char *)(&outputStruct + 6 * v22);
              *(_WORD *)v28 = 100 * v29[4];
              *((_WORD *)v28 + 1) = 100 * v29[5];
              *((_DWORD *)v28 + 1) = v19;
              if (v37 >= 0x10)
              {
                v30 = &MutableBytePtr[v26];
                v31 = v19 - 1;
                v32 = v36;
                v33 = v25;
                do
                {
                  if (v31)
                    v34 = updateThread_batteryInfo[(*v33 & 0xF) + 64];
                  else
                    LOWORD(v34) = -1;
                  *((_WORD *)v30 - 1) = v34;
                  v35 = *v33++;
                  *(_WORD *)v30 = *(int *)((char *)&updateThread_batteryInfo[80] + (((unint64_t)v35 >> 2) & 0x3C));
                  v30 += 4;
                  --v31;
                  --v32;
                }
                while (v32);
              }
              ++v22;
              v26 += v20;
              v25 += 6;
            }
            while (v22 != v24);
          }
          v3 = 0;
          *a2 = Mutable;
        }
      }
      else
      {
        v12 = logger;
        v3 = 0;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109376;
          v39 = v10;
          v40 = 1024;
          v41 = 6 * v10 + 4;
          v6 = "gas gauge charge table inconsistent: %d data entries, %d bytes";
          v7 = v12;
          v8 = 14;
          goto LABEL_14;
        }
      }
    }
    else
    {
      v5 = logger;
      v3 = 0;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        v39 = v4;
        v6 = "gas gauge charge table invalid type: %#x";
        v7 = v5;
        v8 = 8;
LABEL_14:
        _os_log_impl(&dword_1DA9D6000, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
        return 0;
      }
    }
  }
  return v3;
}

uint64_t readRemainingCapacity__(_WORD *a1, int *a2, mach_port_t a3)
{
  int v6;
  unsigned __int16 v8;

  v8 = 0;
  if ((getFWVersion(a3, (__int16 *)&v8) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v8 <= 0x118u)
    v6 = *a2;
  else
    v6 = 50;
  return hdqReadS16(a3, v6, a1);
}

uint64_t readFAC__(_WORD *a1, uint64_t a2, mach_port_t a3)
{
  __int16 v6;

  v6 = 0;
  if ((getFWVersion(a3, &v6) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if (v6 == 1536)
    return 0;
  return hdqReadU16(a3, 14, a1);
}

uint64_t readBatteryData(uint64_t a1, uint64_t a2, mach_port_t a3)
{
  uint64_t v6;
  unsigned int v7;
  uint64_t Register;
  unsigned __int16 v10;

  v10 = 0;
  if ((getFWVersion(a3, (__int16 *)&v10) & 0x80000000) != 0)
    return 0xFFFFFFFFLL;
  if ((int)a2 >= 1)
  {
    v6 = 0;
    v7 = v10;
    while (1)
    {
      if (*(_DWORD *)(a1 + 4) == -1)
        return v6;
      if (registerName(a1, v7))
      {
        Register = readRegister(*(_WORD **)(a1 + 56), a1, a3);
        if ((Register & 0x80000000) != 0)
          break;
      }
      ++v6;
      a1 += 80;
      if (a2 == v6)
        return a2;
    }
    return Register;
  }
  return a2;
}

void calculateBatteryHealthMetric()
{
  uint64_t v0;
  float v1;
  float v2;
  float v3;

  if ((unsigned __int16)word_1F028AB0E >= 0x600u)
  {
    v0 = 0;
    v1 = (double)(bswap32((unsigned __int16)word_1F028AB88) >> 16) * 0.137995
       + (double)(bswap32((unsigned __int16)word_1F028AB86) >> 16) * 0.0693069
       + (double)(bswap32((unsigned __int16)word_1F028AB8A) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1F028AB8C) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1F028AB8E) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1F028AB90) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1F028AB92) >> 16) * 0.137376
       + (double)(bswap32((unsigned __int16)word_1F028AB94) >> 16) * 0.0872525
       + (double)(bswap32((unsigned __int16)word_1F028AB96) >> 16) * 0.0185644;
    word_1F028ABDC = (int)v1;
    while (battery_health_metric_config[v0] != word_1F028AB08)
    {
      v0 += 4;
      if (v0 == 68)
      {
        v2 = 0.0;
        goto LABEL_7;
      }
    }
    v2 = (float)*(unsigned int *)&battery_health_metric_config[v0 + 2];
LABEL_7:
    v3 = (float)(v2 * v1) / 1000.0;
    word_1F028ABDE = (int)v3;
    if (dword_1F028ABD8 < (int)v3)
    {
      dword_1F028ABD8 = (int)v3;
      setUPOData(CFSTR("IOPMUBootBatteryHealthMetric"), (int)v3);
    }
  }
}

CFDictionaryRef readChargerData(int a1, int a2, mach_port_t a3)
{
  const __CFAllocator *v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  CFDictionaryRef v10;
  CFNumberRef v11;
  uint64_t v12;
  CFNumberRef v13;
  uint64_t v14;
  CFNumberRef v15;
  uint64_t v16;
  unint64_t v17;
  time_t v19;
  void *keys[2];
  __int128 v21;
  __int128 v22;
  __int128 v23;
  void *values[9];

  values[8] = *(void **)MEMORY[0x1E0C80C00];
  if (readBatteryData((uint64_t)&readChargerData_chargerRegs, 5, a3) != 5)
    return 0;
  memset(&values[2], 0, 48);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v6 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  values[0] = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberSInt8Type, &readChargerData_notChargingReason);
  keys[0] = CFSTR("NotChargingReason");
  values[1] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerAlert);
  keys[1] = CFSTR("ChargerAlert");
  if (!a1)
    goto LABEL_11;
  v7 = readChargerData_notChargingReason & 0x10;
  if (a2)
  {
    if ((readChargerData_notChargingReason & 0x10) != 0)
    {
      v7 = (readChargerData_notChargingReason >> 4) & 1;
      LOWORD(v19) = 0;
      if ((hdqReadU16(a3, 52, &v19) & 0x80000000) == 0)
      {
        v8 = 1717986919 * byte_1F028AB10 * word_1F028AB0A;
        if ((int)((v8 >> 34) + ((unint64_t)v8 >> 63)) > (unsigned __int16)v19)
          v7 = 0;
      }
    }
  }
  if (v7)
  {
    values[2] = *(void **)MEMORY[0x1E0C9AE50];
    *(_QWORD *)&v21 = CFSTR("ChargerTimeout");
    v9 = 3;
  }
  else
  {
LABEL_11:
    v9 = 2;
  }
  if ((readChargerData_notChargingReason & 0x20) != 0)
  {
    values[v9] = (void *)*MEMORY[0x1E0C9AE50];
    keys[v9++] = CFSTR("ChargerWatchdogTimeout");
  }
  values[v9] = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingCurrent);
  keys[v9] = CFSTR("ChargingCurrent");
  v11 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargingVoltage);
  v12 = 8 * v9 + 8;
  *(void **)((char *)values + v12) = v11;
  *(void **)((char *)keys + v12) = CFSTR("ChargingVoltage");
  v13 = CFNumberCreate(v6, kCFNumberSInt8Type, &readChargerData_chargerStatus);
  v14 = 8 * v9 + 16;
  *(void **)((char *)values + v14) = v13;
  *(void **)((char *)keys + v14) = CFSTR("ChargerStatus");
  v19 = time(0);
  v15 = CFNumberCreate(v6, kCFNumberLongType, &v19);
  v16 = 8 * v9 + 24;
  *(void **)((char *)values + v16) = v15;
  *(void **)((char *)keys + v16) = CFSTR("UpdateTime");
  v10 = CFDictionaryCreate(v6, (const void **)keys, (const void **)values, v9 + 4, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  do
  {
    CFRelease(values[v9 + 3]);
    v17 = v9 + 4;
    --v9;
  }
  while (v17 > 1);
  return v10;
}

CFDictionaryRef dynamicATV(mach_port_t a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  unsigned int v4;
  int v5;
  int v6;
  const __CFAllocator *v7;
  int v8;
  unint64_t v9;
  CFDictionaryRef v10;
  const __CFString *v13;
  const __CFString *v14;
  void *values;
  CFNumberRef v16;
  uint64_t input[2];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16 = 0;
  v14 = 0;
  *(_OWORD *)input = xmmword_1DABA2140;
  v18 = 0;
  if (IOConnectCallScalarMethod(a1, 7u, input, 3u, 0, 0))
  {
    v1 = logger;
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
      dynamicATV_cold_1(v1, v2, v3);
  }
  v4 = word_1F028AB0C + (unsigned __int16)word_1F028AB16;
  v5 = word_1F028AB0A;
  if (v4 <= (__int16)(v5 + ((unsigned __int16)(v5 & 0x8000) >> 15)) >> 1)
    v6 = (__int16)(word_1F028AB0A + ((word_1F028AB0A & 0x8000u) >> 15)) >> 1;
  else
    v6 = word_1F028AB0C + (unsigned __int16)word_1F028AB16;
  if (v4 <= word_1F028AB0A)
    v5 = v6;
  dword_1F028AB34 = v5;
  v7 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &dword_1F028AB34);
  v13 = CFSTR("atvBatteryCapacityMA");
  if (dword_1F028AC88)
  {
    v8 = determineVACVoltage();
    if (v8 != dword_1F028AB30)
      dword_1F028AB30 = v8;
    v16 = CFNumberCreate(v7, kCFNumberIntType, &dword_1F028AB30);
    v14 = CFSTR("atvAbsMaxVoltageMV");
    v9 = 2;
  }
  else
  {
    v9 = 1;
  }
  v10 = CFDictionaryCreate(v7, (const void **)&v13, (const void **)&values, v9, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  do
    CFRelease(*(&v14 + v9));
  while (v9-- > 1);
  return v10;
}

uint64_t determineVACVoltage()
{
  unsigned int v0;
  uint64_t v1;
  int *v3;
  unsigned __int16 v4;
  unsigned int v5;
  unsigned int v6;
  int v8;
  NSObject *v9;
  BOOL v10;
  uint64_t v11;
  unsigned __int8 v12;
  __int16 v13;
  unsigned __int8 *v14;
  unsigned __int16 v15;
  BOOL v17;
  unint64_t v18;
  int *v19;
  unsigned __int16 v20;
  unsigned int v21;
  unsigned int v22;
  int v24;
  NSObject *v25;
  BOOL v26;
  unsigned int v27;
  uint64_t v30;
  uint64_t v31;
  int v32;
  BOOL v33;
  NSObject *v34;
  int v37;
  int v38;
  __int16 v39;
  unsigned int v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v0 = dword_1F028AB30;
  v1 = dword_1F028AC88;
  if (dword_1F028AC88)
  {
    if (determineVACVoltage_lastBatteryCycleCount != (unsigned __int16)word_1F028AB3C || dword_1F028AB30 == 0)
    {
      determineVACVoltage_lastBatteryCycleCount = (unsigned __int16)word_1F028AB3C;
      v3 = &dword_1F028AC8C;
      while (1)
      {
        v5 = *v3++;
        v4 = v5;
        v6 = HIWORD(v5);
        if (v5 < 0x10000 || v6 > (unsigned __int16)word_1F028AB3C)
          break;
        if (!--v1)
        {
          v8 = determineVACVoltage_vacBasedVoltageMV;
          if (determineVACVoltage_vacBasedVoltageMV)
            goto LABEL_17;
          goto LABEL_16;
        }
      }
      v8 = v4;
      if (v4)
        goto LABEL_17;
LABEL_16:
      v8 = LOWORD(updateThread_batteryInfo[dword_1F028AC88 + 104]);
LABEL_17:
      determineVACVoltage_vacBasedVoltageMV = v8;
      v9 = logger;
      if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
      {
        v37 = 67109120;
        v38 = v8;
        _os_log_impl(&dword_1DA9D6000, v9, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vacBasedVoltageMV=%d", (uint8_t *)&v37, 8u);
        v8 = determineVACVoltage_vacBasedVoltageMV;
      }
      if (v0)
        v10 = 1;
      else
        v10 = v8 == 0;
      if (!v10)
        v0 = v8;
    }
  }
  v11 = dword_1F028ACCC;
  if (dword_1F028ACCC && (unsigned __int16)word_1F028AB0E >= 0x313u)
  {
    v12 = word_1F028AB76;
    if ((unsigned __int16)word_1F028AB0E <= 0x500u)
      v13 = word_1F028AB76;
    else
      v13 = word_1F028AB74;
    v14 = (unsigned __int8 *)&word_1F028AB76 + 1;
    if ((unsigned __int16)word_1F028AB0E > 0x500u)
      v14 = (unsigned __int8 *)&word_1F028AB74 + 1;
    v15 = *v14 | (unsigned __int16)(v13 << 8);
    if ((unsigned __int16)word_1F028AB0E <= 0x500u)
      v12 = byte_1F028AB78;
    if (v12 && v15 != 0)
    {
      if (determineVACVoltage_lastTimeAbove95 != v12
        || ((unsigned __int16)determineVACVoltage_lastToT == v15 ? (v17 = v0 == 0) : (v17 = 1), v17))
      {
        determineVACVoltage_lastTimeAbove95 = v12;
        determineVACVoltage_lastToT = v15;
        v18 = (42949673 * (unint64_t)(v12 * v15)) >> 32;
        v19 = &dword_1F028ACD0;
        while (1)
        {
          v21 = *v19++;
          v20 = v21;
          v22 = HIWORD(v21);
          if (v21 < 0x10000 || v18 < v22)
            break;
          if (!--v11)
          {
            v24 = determineVACVoltage_vac95BasedVoltageMV;
            if (determineVACVoltage_vac95BasedVoltageMV)
              goto LABEL_54;
            goto LABEL_53;
          }
        }
        v24 = v20;
        if (v20)
          goto LABEL_54;
LABEL_53:
        v24 = LOWORD(updateThread_batteryInfo[dword_1F028ACCC + 121]);
LABEL_54:
        determineVACVoltage_vac95BasedVoltageMV = v24;
        v25 = logger;
        if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
        {
          v37 = 67109376;
          v38 = v24;
          v39 = 1024;
          v40 = v0;
          _os_log_impl(&dword_1DA9D6000, v25, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: vac95BasedVoltageMV=%d absMaxVoltageMV=%d", (uint8_t *)&v37, 0xEu);
          v24 = determineVACVoltage_vac95BasedVoltageMV;
        }
        if (v0)
          v26 = 1;
        else
          v26 = v24 == 0;
        if (!v26)
          v0 = v24;
      }
    }
  }
  v27 = determineVACVoltage_vacBasedVoltageMV;
  if (determineVACVoltage_vacBasedVoltageMV >= v0 || determineVACVoltage_vacBasedVoltageMV == 0)
    v27 = v0;
  if (determineVACVoltage_vac95BasedVoltageMV >= v27 || determineVACVoltage_vac95BasedVoltageMV == 0)
    v30 = v27;
  else
    v30 = determineVACVoltage_vac95BasedVoltageMV;
  v31 = dword_1F028AB30;
  v32 = word_1F028AB12;
  if (dword_1F028AB30)
    v33 = v30 >= word_1F028AB12;
  else
    v33 = 1;
  if (v33)
    return v30;
  v34 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    v37 = 67109376;
    v38 = v32;
    v39 = 1024;
    v40 = v30;
    _os_log_impl(&dword_1DA9D6000, v34, OS_LOG_TYPE_DEFAULT, "determineVACVoltage:: waiting for vbat(%d) < vac(%d)", (uint8_t *)&v37, 0xEu);
    return dword_1F028AB30;
  }
  return v31;
}

uint64_t determinePoSMThreshold()
{
  __int16 *v0;
  unsigned __int8 *v1;
  __int16 *v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  _BOOL4 v6;
  int v7;
  _BOOL4 v8;
  int v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  _BOOL4 v13;
  _BOOL4 v14;
  int v15;
  _BOOL4 v16;
  int v17;
  int v18;
  int v19;
  unsigned int v20;
  char *v21;
  uint64_t v22;
  unsigned int v24;
  unsigned int v26;
  NSObject *v29;
  _BOOL4 v31;
  _BOOL4 v32;
  _BOOL4 v33;
  int v34;
  uint8_t buf[4];
  _BOOL4 v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  unsigned int v48;
  __int16 v49;
  int v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  if ((unsigned __int16)word_1F028AB0E <= 0x500u)
  {
    if ((unsigned __int16)word_1F028AB0E < 0x313u)
      return 0xFFFFFFFFLL;
    v2 = &word_1F028AB76;
    v0 = (__int16 *)&byte_1F028AB78;
    v1 = (unsigned __int8 *)&word_1F028AB76 + 1;
  }
  else
  {
    v0 = &word_1F028AB76;
    v1 = (unsigned __int8 *)&word_1F028AB74 + 1;
    v2 = &word_1F028AB74;
  }
  v3 = *v1 | (*(unsigned __int8 *)v2 << 8);
  v4 = *(unsigned __int8 *)v0;
  v5 = (unsigned __int16)dword_1F028AD14;
  v6 = (unsigned __int16)dword_1F028AD14 != 0;
  v7 = (unsigned __int16)word_1F028AD18;
  v8 = word_1F028AD18 != 0;
  v9 = (unsigned __int16)word_1F028AD20;
  v10 = word_1F028AD20 != 0;
  v11 = determinePoSMThreshold_lastBatteryCycleCount != (unsigned __int16)word_1F028AB3C
     && (unsigned __int16)dword_1F028AD14 != 0;
  v12 = (unsigned __int16)determinePoSMThreshold_lastToT != v3 && word_1F028AD18 != 0;
  v13 = determinePoSMThreshold_lastAbove95 != v4
     || (unsigned __int16)determinePoSMThreshold_lastToT != v3;
  v14 = determinePoSMThreshold_lastAbove95 != v4 && word_1F028AD20 != 0;
  v32 = v11;
  v33 = v14;
  v15 = (unsigned __int16)dword_1F028AD1C;
  v31 = (unsigned __int16)dword_1F028AD1C != 0;
  if ((_WORD)dword_1F028AD1C)
    v16 = v13;
  else
    v16 = 0;
  if (v11)
  {
    determinePoSMThreshold_lastBatteryCycleCount = (unsigned __int16)word_1F028AB3C;
    if ((unsigned __int16)word_1F028AB3C <= HIWORD(dword_1F028AD14))
      v17 = -1;
    else
      v17 = dword_1F028AD24;
    determinePoSMThreshold_vacThreshold = v17;
  }
  if (v12)
  {
    determinePoSMThreshold_lastToT = v3;
    if (v3 <= HIWORD(*(_DWORD *)&word_1F028AD18))
      v18 = -1;
    else
      v18 = dword_1F028AD28;
    determinePoSMThreshold_vacpThreshold = v18;
  }
  if (v16)
  {
    determinePoSMThreshold_lastToT = v3;
    determinePoSMThreshold_lastAbove95 = v4;
    if ((42949673 * (unint64_t)(v4 * v3)) >> 32 <= HIWORD(dword_1F028AD1C))
      v19 = -1;
    else
      v19 = dword_1F028AD2C;
    determinePoSMThreshold_vac95Threshold = v19;
  }
  v34 = (unsigned __int16)word_1F028AB3C;
  if (word_1F028AD20)
  {
    determinePoSMThreshold_lastAbove95 = v4;
    if (v4 <= HIWORD(*(_DWORD *)&word_1F028AD20))
    {
      v21 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
      v20 = -1;
    }
    else
    {
      v20 = dword_1F028AD30;
      v21 = &didReceiveDASInfoEventWithPayload__classDebugEnabled;
    }
    *((_DWORD *)v21 + 877) = v20;
  }
  else
  {
    v20 = determinePoSMThreshold_vac95pThreshold;
  }
  if (determinePoSMThreshold_vacThreshold == -1 || v5 == 0)
    v24 = -1;
  else
    v24 = determinePoSMThreshold_vacThreshold;
  if (determinePoSMThreshold_vacpThreshold >= v24 || v7 == 0)
    v26 = v24;
  else
    v26 = determinePoSMThreshold_vacpThreshold;
  if (determinePoSMThreshold_vac95Threshold < v26 && v15 != 0)
    v26 = determinePoSMThreshold_vac95Threshold;
  if (v20 >= v26 || v9 == 0)
    v22 = v26;
  else
    v22 = v20;
  v29 = logger;
  if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v6;
    v37 = 1024;
    v38 = v8;
    v39 = 1024;
    v40 = v31;
    v41 = 1024;
    v42 = v10;
    _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, enabled:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109888;
    v36 = v32;
    v37 = 1024;
    v38 = v12;
    v39 = 1024;
    v40 = v16;
    v41 = 1024;
    v42 = v33;
    _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, changed:%d %d %d %d ", buf, 0x1Au);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110912;
    v36 = v34;
    v37 = 1024;
    v38 = HIWORD(dword_1F028AD14);
    v39 = 1024;
    v40 = v3;
    v41 = 1024;
    v42 = (unsigned __int16)word_1F028AD1A;
    v43 = 1024;
    v44 = (42949673 * (unint64_t)(v4 * v3)) >> 32;
    v45 = 1024;
    v46 = HIWORD(dword_1F028AD1C);
    v47 = 1024;
    v48 = v4;
    v49 = 1024;
    v50 = (unsigned __int16)word_1F028AD22;
    _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold, cmp:%d>%u %d>%u %d>%u %d>%u", buf, 0x32u);
    v29 = logger;
  }
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67110144;
    v36 = v22;
    v37 = 1024;
    v38 = determinePoSMThreshold_vacThreshold;
    v39 = 1024;
    v40 = determinePoSMThreshold_vacpThreshold;
    v41 = 1024;
    v42 = determinePoSMThreshold_vac95Threshold;
    v43 = 1024;
    v44 = determinePoSMThreshold_vac95pThreshold;
    _os_log_impl(&dword_1DA9D6000, v29, OS_LOG_TYPE_DEFAULT, "determinePoSMThreshold,minThreshold=%u threshold:%u %u %u %u", buf, 0x20u);
  }
  return v22;
}

CFDictionaryRef parseBatteryData(int a1, int a2)
{
  const __CFAllocator *v4;
  uint64_t v5;
  CFNumberRef v6;
  uint64_t v7;
  CFNumberRef v8;
  uint64_t v9;
  CFNumberRef v10;
  uint64_t v11;
  CFNumberRef v12;
  uint64_t v13;
  CFStringRef StringWithBytes;
  uint64_t v15;
  CFNumberRef v16;
  uint64_t v17;
  uint64_t v18;
  __int16 *v19;
  unsigned int v20;
  int v21;
  uint64_t v22;
  CFDictionaryRef v23;
  unint64_t v24;
  CFNumberRef v25;
  uint64_t v26;
  CFNumberRef v27;
  uint64_t v28;
  CFNumberRef v29;
  uint64_t v30;
  uint64_t v31;
  CFNumberRef v32;
  uint64_t v33;
  CFNumberRef v34;
  uint64_t v35;
  CFNumberRef v36;
  uint64_t v37;
  uint64_t v38;
  CFNumberRef v39;
  uint64_t v40;
  CFDictionaryRef v41;
  unint64_t v42;
  uint64_t v44;
  int v45;
  int v46;
  int v47;
  int v48;
  int v49;
  int v50;
  unsigned int v51;
  int v52;
  int v53;
  int v54;
  int v55;
  int v56;
  int v57;
  __int16 v58;
  int v59;
  int v60;
  int v61;
  int v62;
  int v63;
  int v64;
  _BYTE valuePtr[12];
  void *values;
  int v67;
  unsigned int v68;
  int v69;
  unsigned int v70;
  unsigned int v71;
  unsigned int v72;
  int v73;
  int v74;
  int v75;
  int v76;
  int v77;
  int v78;
  int v79;
  int v80;
  int v81;
  int v82;
  int v83;
  int v84;
  int v85;
  int v86;
  int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  time_t v92;
  void *v93[3];
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  uint64_t v106;
  void *v107;
  _QWORD v108[2];
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  void *keys[22];
  __int128 v123;
  __int128 v124;
  uint64_t v125;
  void *v126[21];
  __int128 v127;
  __int128 v128;
  __int128 v129;
  uint64_t v130;

  v130 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&valuePtr[4] = 0;
  v121 = 0;
  v120 = 0u;
  v119 = 0u;
  v118 = 0u;
  v117 = 0u;
  v116 = 0u;
  v115 = 0u;
  v114 = 0u;
  v113 = 0u;
  v112 = 0u;
  v111 = 0u;
  v110 = 0u;
  v109 = 0u;
  v94 = 0u;
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v102 = 0u;
  v103 = 0u;
  v104 = 0u;
  v105 = 0u;
  v106 = 0;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v107 = CFDataCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], (const UInt8 *)updateThread_batteryInfo, 32);
  v93[0] = CFSTR("MfgData");
  v108[0] = createStringWithBytes((UInt8 *)updateThread_batteryInfo, 0x12uLL);
  v93[1] = CFSTR("Serial");
  *(_QWORD *)valuePtr = word_1F028AB0A;
  v108[1] = CFNumberCreate(v4, kCFNumberIntType, valuePtr);
  v93[2] = CFSTR("DesignCapacity");
  v64 = (unsigned __int16)word_1F028AB3E;
  values = CFNumberCreate(v4, kCFNumberIntType, &v64);
  if (values)
  {
    *(_QWORD *)&v109 = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    *(_QWORD *)&v94 = CFSTR("Qmax");
    CFRelease(values);
    v5 = 4;
  }
  else
  {
    v5 = 3;
  }
  v63 = word_1F028AB14;
  v108[v5 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v63);
  v93[v5] = CFSTR("MaxCapacity");
  v62 = (unsigned __int16)word_1F028AB3C;
  v6 = CFNumberCreate(v4, kCFNumberIntType, &v62);
  v7 = 8 * v5 + 8;
  *(_QWORD *)((char *)&v108[-1] + v7) = v6;
  *(void **)((char *)v93 + v7) = CFSTR("CycleCount");
  v61 = (unsigned __int16)word_1F028AB40;
  v8 = CFNumberCreate(v4, kCFNumberIntType, &v61);
  v9 = 8 * v5 + 16;
  *(_QWORD *)((char *)&v108[-1] + v9) = v8;
  *(void **)((char *)v93 + v9) = CFSTR("StateOfCharge");
  v60 = word_1F028AB12;
  v10 = CFNumberCreate(v4, kCFNumberIntType, &v60);
  v11 = 8 * v5 + 24;
  *(_QWORD *)((char *)&v108[-1] + v11) = v10;
  *(void **)((char *)v93 + v11) = CFSTR("Voltage");
  v59 = (unsigned __int16)word_1F028AB42;
  v12 = CFNumberCreate(v4, kCFNumberIntType, &v59);
  v13 = 8 * v5 + 32;
  *(_QWORD *)((char *)&v108[-1] + v13) = v12;
  *(void **)((char *)v93 + v13) = CFSTR("Flags");
  StringWithBytes = createStringWithBytes((UInt8 *)updateThread_batteryInfo + 2, 4uLL);
  v15 = 8 * v5 + 40;
  *(_QWORD *)((char *)&v108[-1] + v15) = StringWithBytes;
  *(void **)((char *)v93 + v15) = CFSTR("ManufactureDate");
  v58 = word_1F028AB08;
  v16 = CFNumberCreate(v4, kCFNumberSInt16Type, &v58);
  v17 = 8 * v5 + 48;
  *(_QWORD *)((char *)&v108[-1] + v17) = v16;
  *(void **)((char *)v93 + v17) = CFSTR("ChemID");
  v18 = v5 + 7;
  if (word_1F028AB0E != 1536)
  {
    v57 = (unsigned __int16)word_1F028AB44;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v57);
    v93[v18] = CFSTR("FullAvailableCapacity");
    v18 = v5 | 8;
    if ((unsigned __int16)word_1F028AB0E < 0x313u)
      goto LABEL_20;
  }
  v127 = 0u;
  v128 = 0u;
  v129 = 0u;
  v123 = 0u;
  v124 = 0u;
  v125 = 0;
  v92 = time(0);
  keys[0] = CFSTR("UpdateTime");
  v126[0] = CFNumberCreate(v4, kCFNumberLongType, &v92);
  keys[1] = CFSTR("MaximumTemperature");
  v91 = (__int16)(byte_1F028AB46 << 8) | byte_1F028AB47;
  v126[1] = CFNumberCreate(v4, kCFNumberIntType, &v91);
  keys[2] = CFSTR("MinimumTemperature");
  v90 = (__int16)(byte_1F028AB48 << 8) | byte_1F028AB49;
  v126[2] = CFNumberCreate(v4, kCFNumberIntType, &v90);
  keys[3] = CFSTR("MaximumPackVoltage");
  v89 = (__int16)(byte_1F028AB4A << 8) | byte_1F028AB4B;
  v126[3] = CFNumberCreate(v4, kCFNumberIntType, &v89);
  keys[4] = CFSTR("MinimumPackVoltage");
  v88 = (__int16)(byte_1F028AB4C << 8) | byte_1F028AB4D;
  v126[4] = CFNumberCreate(v4, kCFNumberIntType, &v88);
  keys[5] = CFSTR("MaximumChargeCurrent");
  v87 = (__int16)(byte_1F028AB4E << 8) | byte_1F028AB4F;
  v126[5] = CFNumberCreate(v4, kCFNumberIntType, &v87);
  keys[6] = CFSTR("MaximumDischargeCurrent");
  v86 = (__int16)(byte_1F028AB50 << 8) | byte_1F028AB51;
  v126[6] = CFNumberCreate(v4, kCFNumberIntType, &v86);
  keys[7] = CFSTR("MaximumOverChargedCapacity");
  v85 = (__int16)(byte_1F028AB52 << 8) | byte_1F028AB53;
  v126[7] = CFNumberCreate(v4, kCFNumberIntType, &v85);
  keys[8] = CFSTR("MaximumOverDischargedCapacity");
  v84 = (__int16)(byte_1F028AB54 << 8) | byte_1F028AB55;
  v126[8] = CFNumberCreate(v4, kCFNumberIntType, &v84);
  keys[9] = CFSTR("MaximumFCC");
  v83 = (__int16)(byte_1F028AB56 << 8) | byte_1F028AB57;
  v126[9] = CFNumberCreate(v4, kCFNumberIntType, &v83);
  keys[10] = CFSTR("MinimumFCC");
  v82 = (__int16)(byte_1F028AB58 << 8) | byte_1F028AB59;
  v126[10] = CFNumberCreate(v4, kCFNumberIntType, &v82);
  keys[11] = CFSTR("MaximumDeltaVoltage");
  v81 = (__int16)(byte_1F028AB5A << 8) | byte_1F028AB5B;
  v126[11] = CFNumberCreate(v4, kCFNumberIntType, &v81);
  keys[12] = CFSTR("MinimumDeltaVoltage");
  v80 = (__int16)(byte_1F028AB5C << 8) | byte_1F028AB5D;
  v126[12] = CFNumberCreate(v4, kCFNumberIntType, &v80);
  keys[13] = CFSTR("LowAvgCurrentLastRun");
  v79 = (__int16)(byte_1F028AB5E << 8) | byte_1F028AB5F;
  v126[13] = CFNumberCreate(v4, kCFNumberIntType, &v79);
  keys[14] = CFSTR("HighAvgCurrentLastRun");
  v78 = (__int16)(byte_1F028AB60 << 8) | byte_1F028AB61;
  v126[14] = CFNumberCreate(v4, kCFNumberIntType, &v78);
  keys[15] = CFSTR("MaximumQmax");
  v77 = (__int16)(byte_1F028AB62 << 8) | byte_1F028AB63;
  v126[15] = CFNumberCreate(v4, kCFNumberIntType, &v77);
  keys[16] = CFSTR("MinimumQmax");
  v76 = (__int16)(byte_1F028AB64 << 8) | byte_1F028AB65;
  v126[16] = CFNumberCreate(v4, kCFNumberIntType, &v76);
  keys[17] = CFSTR("MaximumRa0-8");
  v75 = (__int16)(byte_1F028AB66 << 8) | byte_1F028AB67;
  v126[17] = CFNumberCreate(v4, kCFNumberIntType, &v75);
  keys[18] = CFSTR("MinimumRa0-8");
  v74 = (__int16)(byte_1F028AB68 << 8) | byte_1F028AB69;
  v126[18] = CFNumberCreate(v4, kCFNumberIntType, &v74);
  keys[19] = CFSTR("AverageTemperature");
  v73 = byte_1F028AB6A;
  v126[19] = CFNumberCreate(v4, kCFNumberIntType, &v73);
  keys[20] = CFSTR("TemperatureSamples");
  v72 = bswap32(unk_1F028AB6B);
  v126[20] = CFNumberCreate(v4, kCFNumberIntType, &v72);
  keys[21] = CFSTR("FlashWriteCount");
  v71 = __rev16(unk_1F028AB6F);
  *(_QWORD *)&v127 = CFNumberCreate(v4, kCFNumberIntType, &v71);
  *(_QWORD *)&v123 = CFSTR("RDISCnt");
  v70 = __rev16(unk_1F028AB71);
  *((_QWORD *)&v127 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v70);
  *((_QWORD *)&v123 + 1) = CFSTR("CycleCountLastQmax");
  v69 = byte_1F028AB73;
  *(_QWORD *)&v128 = CFNumberCreate(v4, kCFNumberIntType, &v69);
  if ((unsigned __int16)word_1F028AB0E < 0x501u)
  {
    if ((unsigned __int16)word_1F028AB0E < 0x313u)
    {
      v22 = 24;
      goto LABEL_12;
    }
    v19 = &word_1F028AB76;
  }
  else
  {
    v19 = &word_1F028AB74;
  }
  v20 = __rev16((unsigned __int16)*v19);
  *(_QWORD *)&v124 = CFSTR("TotalOperatingTime");
  v68 = v20;
  *((_QWORD *)&v128 + 1) = CFNumberCreate(v4, kCFNumberIntType, &v68);
  v21 = *((unsigned __int8 *)v19 + 2);
  *((_QWORD *)&v124 + 1) = CFSTR("TimeAbove95Perc");
  v67 = v21;
  *(_QWORD *)&v129 = CFNumberCreate(v4, kCFNumberIntType, &v67);
  v22 = 26;
LABEL_12:
  keys[v22] = CFSTR("Raw");
  v126[v22] = CFDataCreate(v4, (const UInt8 *)&byte_1F028AB46, 64);
  v23 = CFDictionaryCreate(v4, (const void **)keys, (const void **)v126, v22 | 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  do
  {
    CFRelease(v126[v22]);
    v24 = v22-- + 1;
  }
  while (v24 > 1);
  if (!v23)
  {
    if (os_log_type_enabled((os_log_t)logger, OS_LOG_TYPE_ERROR))
    {
      parseBatteryData_cold_2();
      if (!a1)
        goto LABEL_22;
LABEL_21:
      v56 = (unsigned __int16)word_1F028AB20;
      v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v56);
      v93[v18] = CFSTR("ITMiscStatus");
      v55 = word_1F028AB20 & 3;
      v25 = CFNumberCreate(v4, kCFNumberIntType, &v55);
      v26 = 8 * v18 + 8;
      *(_QWORD *)((char *)&v108[-1] + v26) = v25;
      *(void **)((char *)v93 + v26) = CFSTR("ITSimulationCounter");
      v18 += 2;
      goto LABEL_22;
    }
LABEL_20:
    if (!a1)
      goto LABEL_22;
    goto LABEL_21;
  }
  if (a2)
    CFShow(v23);
  v108[v18 - 1] = v23;
  v93[v18++] = CFSTR("LifetimeData");
  if (a1)
    goto LABEL_21;
LABEL_22:
  if ((unsigned __int16)word_1F028AB0E >= 0x600u)
  {
    *(_QWORD *)&valuePtr[4] = CFDataCreate(v4, (const UInt8 *)&word_1F028AB86, 32);
    if (*(_QWORD *)&valuePtr[4])
    {
      v108[v18 - 1] = CFArrayCreate(v4, (const void **)&valuePtr[4], 1, MEMORY[0x1E0C9B378]);
      v93[v18++] = CFSTR("RaTableRaw");
      CFRelease(*(CFTypeRef *)&valuePtr[4]);
    }
    v54 = (unsigned __int16)word_1F028ABDC;
    v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v54);
    v93[v18] = CFSTR("WeightedRa");
    v53 = (unsigned __int16)word_1F028ABDE;
    v27 = CFNumberCreate(v4, kCFNumberIntType, &v53);
    v28 = 8 * v18 + 8;
    *(_QWORD *)((char *)&v108[-1] + v28) = v27;
    *(void **)((char *)v93 + v28) = CFSTR("ChemicalWeightedRa");
    v52 = dword_1F028ABD8;
    v29 = CFNumberCreate(v4, kCFNumberIntType, &v52);
    v30 = 8 * v18 + 16;
    *(_QWORD *)((char *)&v108[-1] + v30) = v29;
    *(void **)((char *)v93 + v30) = CFSTR("BatteryHealthMetric");
    v31 = v18 + 3;
    if ((unsigned __int16)word_1F028AB0E < 0x600u)
    {
      v18 += 3;
    }
    else
    {
      v108[v31 - 1] = CFDataCreate(v4, byte_1F028ABA6, 32);
      v93[v31] = CFSTR("iMaxAndSocSmoothTable");
      v51 = __rev16(*(unsigned __int16 *)&byte_1F028ABA6[1]);
      v32 = CFNumberCreate(v4, kCFNumberIntType, &v51);
      v33 = 8 * v18 + 32;
      *(_QWORD *)((char *)&v108[-1] + v33) = v32;
      *(void **)((char *)v93 + v33) = CFSTR("RSS");
      v18 += 5;
    }
  }
  v50 = (unsigned __int16)word_1F028AB24;
  v108[v18 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v50);
  v93[v18] = CFSTR("ResScale");
  v49 = word_1F028AB26;
  v34 = CFNumberCreate(v4, kCFNumberIntType, &v49);
  v35 = 8 * v18 + 8;
  *(_QWORD *)((char *)&v108[-1] + v35) = v34;
  *(void **)((char *)v93 + v35) = CFSTR("Qstart");
  v48 = word_1F028AB28;
  v36 = CFNumberCreate(v4, kCFNumberIntType, &v48);
  v37 = 8 * v18 + 16;
  *(_QWORD *)((char *)&v108[-1] + v37) = v36;
  *(void **)((char *)v93 + v37) = CFSTR("PassedCharge");
  v38 = v18 + 3;
  v47 = (unsigned __int16)word_1F028AB2A;
  values = CFNumberCreate(v4, kCFNumberIntType, &v47);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v93[v38] = CFSTR("DOD0");
    v38 = v18 + 4;
    CFRelease(values);
  }
  v46 = word_1F028AB22;
  values = CFNumberCreate(v4, kCFNumberIntType, &v46);
  if (values)
  {
    v108[v38 - 1] = CFArrayCreate(v4, (const void **)&values, 1, MEMORY[0x1E0C9B378]);
    v93[v38++] = CFSTR("PresentDOD");
    CFRelease(values);
  }
  v45 = (unsigned __int16)word_1F028AB42;
  v108[v38 - 1] = CFNumberCreate(v4, kCFNumberIntType, &v45);
  v93[v38] = CFSTR("GaugeFlagRaw");
  v44 = gauge_reset_count;
  v39 = CFNumberCreate(v4, kCFNumberLongLongType, &v44);
  v40 = 8 * v38 + 8;
  *(_QWORD *)((char *)&v108[-1] + v40) = v39;
  *(void **)((char *)v93 + v40) = CFSTR("GaugeResetCounter");
  if (v38 >= 27)
    parseBatteryData_cold_1();
  v41 = CFDictionaryCreate(v4, (const void **)v93, (const void **)&v107, v38 + 2, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (v38 >= -1)
  {
    do
    {
      CFRelease((CFTypeRef)v108[v38]);
      v42 = v38 + 2;
      --v38;
    }
    while (v42 > 1);
  }
  return v41;
}

uint64_t ggctl_logShutdownReason2(uint64_t result, _OWORD *a2, unsigned int a3)
{
  __int128 v4;
  __int128 v5;
  uint64_t input;
  uint64_t v7;
  size_t v8;
  __int128 outputStruct;
  __int128 v10;
  __int128 v11;
  _OWORD inputStruct[3];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 48;
  if (a2)
  {
    if ((a3 & 1) != 0)
    {
      v10 = 0u;
      v11 = 0u;
      outputStruct = 0u;
      input = a3;
      result = IOConnectCallMethod(result, 0x13u, &input, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
      if (!(_DWORD)result)
      {
        v4 = v10;
        *a2 = outputStruct;
        a2[1] = v4;
        a2[2] = v11;
      }
    }
    else
    {
      v5 = a2[1];
      inputStruct[0] = *a2;
      inputStruct[1] = v5;
      inputStruct[2] = a2[2];
      v7 = a3;
      return IOConnectCallMethod(result, 0x13u, &v7, 1u, inputStruct, 0x30uLL, 0, 0, &outputStruct, &v8);
    }
  }
  return result;
}

__darwin_time_t UpSeconds()
{
  timeval v1;

  if (!UpSeconds_boottime)
  {
    v1.tv_sec = 16;
    sysctlbyname("kern.boottime", &UpSeconds_boottime, (size_t *)&v1, 0, 0);
  }
  v1.tv_sec = 0;
  *(_QWORD *)&v1.tv_usec = 0;
  gettimeofday(&v1, 0);
  return v1.tv_sec - UpSeconds_boottime;
}

CFStringRef createStringWithBytes(UInt8 *bytes, unint64_t a2)
{
  unint64_t v2;
  unsigned int v3;

  v2 = 0;
  if (a2)
  {
    v3 = 1;
    do
    {
      if (!bytes[v2])
        break;
      v2 = v3++;
    }
    while (v2 < a2);
  }
  return CFStringCreateWithBytesNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE00], bytes, v2, 0x8000100u, 0, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
}

void OUTLINED_FUNCTION_4_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x18u);
}

void OUTLINED_FUNCTION_5_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void ggctl_connect_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v3 = 136315138;
  v4 = "AppleHDQGasGaugeControl";
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a1, a3, "could not find %s service", (uint8_t *)&v3);
  OUTLINED_FUNCTION_1();
}

void ggctl_connect_cold_2(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_12_0(&dword_1DA9D6000, a2, a3, "could not open service: %#x", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

void ggctl_reset_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "gas gauge: cannot issue a reset", v2);
  OUTLINED_FUNCTION_6();
}

void ggctl_open_device_cold_1(NSObject *a1)
{
  int *v2;
  char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v4 = 136315394;
  v5 = "checkreset";
  v6 = 2080;
  v7 = v3;
  _os_log_error_impl(&dword_1DA9D6000, a1, OS_LOG_TYPE_ERROR, "%s: %s", (uint8_t *)&v4, 0x16u);
  OUTLINED_FUNCTION_8_0();
}

void ggctl_open_device_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "gas gauge: cannot determine the state of SWI line", v2);
  OUTLINED_FUNCTION_6();
}

void ggctl_open_device_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "gas gauge: SWI line low, issuing reset", v2);
  OUTLINED_FUNCTION_6();
}

void ggctl_open_device_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_4_2(&dword_1DA9D6000, v0, v1, "%s:%d break failed (%d)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void updateThread_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "gasgauge: could not register for system power notifications", v2);
  OUTLINED_FUNCTION_6();
}

void updateThread_cold_2(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v2, (uint64_t)v2, "gasgauge: SWI line, cannot determine the state of line", v3);
}

void updateThread_cold_3(uint8_t *a1, _DWORD *a2, NSObject *a3)
{
  *(_DWORD *)a1 = 67109120;
  *a2 = -1;
  OUTLINED_FUNCTION_12_0(&dword_1DA9D6000, a3, (uint64_t)a3, "cannot drain the data log (%d)", a1);
}

void updateThread_cold_4(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v2, (uint64_t)v2, "num_client<0, client error?", v3);
}

void updateThread_cold_5(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v2, (uint64_t)v2, "gasgauge: SWI line low reset disabled, ignoring", v3);
}

void updateThread_cold_6(_BYTE *a1, _BYTE *a2)
{
  NSObject *v2;
  uint8_t *v3;

  OUTLINED_FUNCTION_9_2(a1, a2);
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v2, (uint64_t)v2, "gasgauge: SWI line low issuing reset", v3);
}

void updateThread_cold_7(NSObject *a1)
{
  int *v2;
  char *v3;
  uint64_t v4;
  int v5;
  char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = __error();
  v3 = strerror(*v2);
  v5 = 136315138;
  v6 = v3;
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a1, v4, "could not find hw.model: %s", (uint8_t *)&v5);
  OUTLINED_FUNCTION_8_0();
}

void updateThread_cold_8(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = a1;
  OUTLINED_FUNCTION_12_0(&dword_1DA9D6000, a2, a3, "gasgauge: could not register for battery events err=%x", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

void updateThread_cold_9(mach_error_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v4 = 136315138;
  v5 = mach_error_string(a1);
  OUTLINED_FUNCTION_13_0(&dword_1DA9D6000, a2, v3, "gasgauge: could not map data log: %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_8_0();
}

void updateThread_cold_10()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "gasgauge: could not register for power source events", v2);
  OUTLINED_FUNCTION_6();
}

void updateThermalCoolDownState_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_3(&dword_1DA9D6000, v0, v1, "%s:%d cannot update thermal state", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void statsAndLogs_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_3(&dword_1DA9D6000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void statsAndLogs_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_4_2(&dword_1DA9D6000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void debugLog_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_5_3(&dword_1DA9D6000, v0, v1, "%s:%d cannot create dictionary", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void debugLog_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_0_2();
  OUTLINED_FUNCTION_11_6();
  OUTLINED_FUNCTION_4_2(&dword_1DA9D6000, v0, v1, "%s:%d cannot dump stats and logs (%x)", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_1();
}

void dynamicATV_cold_1(NSObject *a1, uint64_t a2, uint64_t a3)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v3[0] = 67109120;
  v3[1] = -1;
  OUTLINED_FUNCTION_12_0(&dword_1DA9D6000, a1, a3, "dynATV: cannot write to charger startus (%d)", (uint8_t *)v3);
  OUTLINED_FUNCTION_6();
}

void parseBatteryData_cold_1()
{
  __assert_rtn("parseBatteryData", "AppleHDQGasGauge.c", 1565, "batteryDataCount<=kNumBatteryDataUpdateKeys");
}

void parseBatteryData_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[16];

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_2(&dword_1DA9D6000, v0, v1, "Cannot create the lifetime dictionary", v2);
  OUTLINED_FUNCTION_6();
}

void PLEmitSystemPowerSignpost_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_6_0(&dword_1DA9D6000, v0, v1, "unsupported config", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void PLProcessCPU::PLProcessCPU(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_ERROR, "Unable to allocate memory.", v1, 2u);
}

{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1DA9D6000, log, OS_LOG_TYPE_DEBUG, "PLProcessCPU initialized.", v1, 2u);
}

void updateDisplayIOReportAZLStats_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAZL !ioReportStats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAZLStats_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAZL !ioReportStats.subscription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAZLStats_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAZL,no newSample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAZLStats_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAZL,no delta", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AZL power is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AZL azl_accum is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AZL nits_accum is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AZL bl_update_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAZLStats_block_invoke_cold_5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AZL bl_frame_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void updateDisplayIOReportAODStats_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAOD !ioReportStats", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAODStats_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAOD !ioReportStats.subscription", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAODStats_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAOD,no newSample", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAODStats_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_11();
  OUTLINED_FUNCTION_0_1(&dword_1DA9D6000, v0, v1, "LogDisplayAOD,no delta", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6();
}

void updateDisplayIOReportAODStats_cold_5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "ioReportSample");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "Got callback for updateDisplayIOReportAODStat with ioReportAODStats.ioReportSample %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void updateDisplayIOReportAODStats_cold_6()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1DA9D6000, v0, v1, "Got callback for updateDisplayIOReportAODStat with ioReportAODStats %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD awake_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_2(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD media_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_3(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD flipbook_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_4(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD flipbook_delay is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_5(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD media_scanout is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_6(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD ambient_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_7(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD prc_repeat_coun is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_8(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD pdc_repeat_coun is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_9(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD llm_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_10(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD apl_sum is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

void __updateDisplayIOReportAODStats_block_invoke_cold_11(void *a1, NSObject *a2)
{
  void *v3;
  uint64_t v4;
  uint8_t v5[24];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "unsignedLongLongValue");
  objc_msgSend((id)OUTLINED_FUNCTION_9_4(), "numberWithUnsignedLongLong:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_7_0(&dword_1DA9D6000, a2, v4, "AOD apl_count is equal to %@", v5);

  OUTLINED_FUNCTION_8_0();
}

uint64_t ADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0CF63D8]();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x1E0D15420]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
}

uint64_t AppAnalyticsEnabled()
{
  return MEMORY[0x1E0D1BCC0]();
}

uint64_t BKSHIDServicesLastUserEventTime()
{
  return MEMORY[0x1E0D00B50]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
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

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
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

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x1E0C98060]();
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFTypeRef CFBundleGetValueForInfoDictionaryKey(CFBundleRef bundle, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x1E0C98180](bundle, key);
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x1E0C983A0](allocator, bytes, length);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x1E0C983B8](allocator, capacity);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

UInt8 *__cdecl CFDataGetMutableBytePtr(CFMutableDataRef theData)
{
  return (UInt8 *)MEMORY[0x1E0C98408](theData);
}

void CFDataSetLength(CFMutableDataRef theData, CFIndex length)
{
  MEMORY[0x1E0C98430](theData, length);
}

Boolean CFDictionaryContainsKey(CFDictionaryRef theDict, const void *key)
{
  return MEMORY[0x1E0C98518](theDict, key);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveAllValues(CFMutableDictionaryRef theDict)
{
  MEMORY[0x1E0C985D8](theDict);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
  MEMORY[0x1E0C988E0](center, name, object, userInfo, deliverImmediately);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

CFIndex CFNumberGetByteSize(CFNumberRef number)
{
  return MEMORY[0x1E0C98990](number);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
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

CFRunLoopRunResult CFRunLoopRunInMode(CFRunLoopMode mode, CFTimeInterval seconds, Boolean returnAfterSourceHandled)
{
  return MEMORY[0x1E0C98CB0](mode, returnAfterSourceHandled, seconds);
}

void CFShow(CFTypeRef obj)
{
  MEMORY[0x1E0C98DF8](obj);
}

CFStringRef CFStringCreateWithBytesNoCopy(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FC8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation, contentsDeallocator);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C98FD0](alloc, cStr, *(_QWORD *)&encoding);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x1E0C99098](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CLCopyAppsUsingLocation()
{
  return MEMORY[0x1E0C9E2E0]();
}

uint64_t CLCopyTechnologiesInUse()
{
  return MEMORY[0x1E0C9E2E8]();
}

FSEventStreamRef FSEventStreamCreate(CFAllocatorRef allocator, FSEventStreamCallback callback, FSEventStreamContext *context, CFArrayRef pathsToWatch, FSEventStreamEventId sinceWhen, CFTimeInterval latency, FSEventStreamCreateFlags flags)
{
  return (FSEventStreamRef)MEMORY[0x1E0CA5758](allocator, callback, context, pathsToWatch, sinceWhen, *(_QWORD *)&flags, latency);
}

void FSEventStreamScheduleWithRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x1E0CA5778](streamRef, runLoop, runLoopMode);
}

Boolean FSEventStreamStart(FSEventStreamRef streamRef)
{
  return MEMORY[0x1E0CA5790](streamRef);
}

void FSEventStreamStop(FSEventStreamRef streamRef)
{
  MEMORY[0x1E0CA5798](streamRef);
}

void FSEventStreamUnscheduleFromRunLoop(FSEventStreamRef streamRef, CFRunLoopRef runLoop, CFStringRef runLoopMode)
{
  MEMORY[0x1E0CA57A0](streamRef, runLoop, runLoopMode);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

CFTypeRef IOCFUnserializeWithSize(const char *buffer, size_t bufferSize, CFAllocatorRef allocator, CFOptionFlags options, CFStringRef *errorString)
{
  return (CFTypeRef)MEMORY[0x1E0CBAD48](buffer, bufferSize, allocator, options, errorString);
}

kern_return_t IOConnectCallMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, const void *inputStruct, size_t inputStructCnt, uint64_t *output, uint32_t *outputCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD80](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, inputStruct, inputStructCnt, output, outputCnt);
}

kern_return_t IOConnectCallScalarMethod(mach_port_t connection, uint32_t selector, const uint64_t *input, uint32_t inputCnt, uint64_t *output, uint32_t *outputCnt)
{
  return MEMORY[0x1E0CBAD88](*(_QWORD *)&connection, *(_QWORD *)&selector, input, *(_QWORD *)&inputCnt, output, outputCnt);
}

kern_return_t IOConnectCallStructMethod(mach_port_t connection, uint32_t selector, const void *inputStruct, size_t inputStructCnt, void *outputStruct, size_t *outputStructCnt)
{
  return MEMORY[0x1E0CBAD90](*(_QWORD *)&connection, *(_QWORD *)&selector, inputStruct, inputStructCnt, outputStruct, outputStructCnt);
}

kern_return_t IOConnectMapMemory(io_connect_t connect, uint32_t memoryType, task_port_t intoTask, mach_vm_address_t *atAddress, mach_vm_size_t *ofSize, IOOptionBits options)
{
  return MEMORY[0x1E0CBAD98](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&intoTask, atAddress, ofSize, *(_QWORD *)&options);
}

kern_return_t IOConnectUnmapMemory(io_connect_t connect, uint32_t memoryType, task_port_t fromTask, mach_vm_address_t atAddress)
{
  return MEMORY[0x1E0CBADF0](*(_QWORD *)&connect, *(_QWORD *)&memoryType, *(_QWORD *)&fromTask, atAddress);
}

IOReturn IOHIDDeviceClose(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAE60](device, *(_QWORD *)&options);
}

IOReturn IOHIDDeviceGetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, uint8_t *report, CFIndex *pReportLength)
{
  return MEMORY[0x1E0CBAE90](device, *(_QWORD *)&reportType, reportID, report, pReportLength);
}

io_service_t IOHIDDeviceGetService(IOHIDDeviceRef device)
{
  return MEMORY[0x1E0CBAEA0](device);
}

IOReturn IOHIDDeviceOpen(IOHIDDeviceRef device, IOOptionBits options)
{
  return MEMORY[0x1E0CBAEB8](device, *(_QWORD *)&options);
}

IOReturn IOHIDDeviceSetReport(IOHIDDeviceRef device, IOHIDReportType reportType, CFIndex reportID, const uint8_t *report, CFIndex reportLength)
{
  return MEMORY[0x1E0CBAF10](device, *(_QWORD *)&reportType, reportID, report, reportLength);
}

uint64_t IOHIDEventGetChildren()
{
  return MEMORY[0x1E0CBB0F8]();
}

uint64_t IOHIDEventGetIntegerValue()
{
  return MEMORY[0x1E0CBB130]();
}

uint64_t IOHIDEventGetType()
{
  return MEMORY[0x1E0CBB168]();
}

uint64_t IOHIDEventSystemClientCreate()
{
  return MEMORY[0x1E0CBB1F0]();
}

uint64_t IOHIDEventSystemClientRegisterEventCallback()
{
  return MEMORY[0x1E0CBB220]();
}

uint64_t IOHIDEventSystemClientScheduleWithDispatchQueue()
{
  return MEMORY[0x1E0CBB248]();
}

uint64_t IOHIDEventSystemClientSetMatching()
{
  return MEMORY[0x1E0CBB268]();
}

uint64_t IOHIDEventSystemClientUnregisterDeviceMatchingCallback()
{
  return MEMORY[0x1E0CBB288]();
}

uint64_t IOHIDEventSystemClientUnregisterEventCallback()
{
  return MEMORY[0x1E0CBB298]();
}

void IOHIDManagerActivate(IOHIDManagerRef manager)
{
  MEMORY[0x1E0CBB368](manager);
}

CFSetRef IOHIDManagerCopyDevices(IOHIDManagerRef manager)
{
  return (CFSetRef)MEMORY[0x1E0CBB388](manager);
}

IOHIDManagerRef IOHIDManagerCreate(CFAllocatorRef allocator, IOOptionBits options)
{
  return (IOHIDManagerRef)MEMORY[0x1E0CBB3A0](allocator, *(_QWORD *)&options);
}

void IOHIDManagerSetDeviceMatching(IOHIDManagerRef manager, CFDictionaryRef matching)
{
  MEMORY[0x1E0CBB3F0](manager, matching);
}

void IOHIDManagerSetDispatchQueue(IOHIDManagerRef manager, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB408](manager, queue);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x1E0CBB668](*(_QWORD *)&iterator);
}

uint64_t IOMobileFramebufferDisablePowerNotifications()
{
  return MEMORY[0x1E0D39F78]();
}

uint64_t IOMobileFramebufferEnablePowerNotifications()
{
  return MEMORY[0x1E0D39F98]();
}

uint64_t IOMobileFramebufferGetBufBlock()
{
  return MEMORY[0x1E0D39FC8]();
}

uint64_t IOMobileFramebufferGetMainDisplay()
{
  return MEMORY[0x1E0D3A020]();
}

uint64_t IOMobileFramebufferGetRunLoopSource()
{
  return MEMORY[0x1E0D3A038]();
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

CFStringRef IOObjectCopyClass(io_object_t object)
{
  return (CFStringRef)MEMORY[0x1E0CBB6D0](*(_QWORD *)&object);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

uint64_t IOPMCopyBatteryHeatMap()
{
  return MEMORY[0x1E0CBB788]();
}

uint64_t IOPMCopyCurrentScheduledWake()
{
  return MEMORY[0x1E0CBB790]();
}

uint64_t IOPMCopyCycleCountData()
{
  return MEMORY[0x1E0CBB798]();
}

uint64_t IOPMCopyKioskModeData()
{
  return MEMORY[0x1E0CBB7A0]();
}

uint64_t IOPMIsADarkWake()
{
  return MEMORY[0x1E0CBB7C8]();
}

uint64_t IOPMIsASleep()
{
  return MEMORY[0x1E0CBB7D0]();
}

uint64_t IOPMIsAUserWake()
{
  return MEMORY[0x1E0CBB7D8]();
}

uint64_t IOPMScheduleAssertionExceptionNotification()
{
  return MEMORY[0x1E0CBB7E8]();
}

uint64_t IOPMSetAssertionExceptionLimits()
{
  return MEMORY[0x1E0CBB820]();
}

uint64_t IOPMSleepWakeCopyUUID()
{
  return MEMORY[0x1E0CBB830]();
}

uint64_t IOPMUserIsActive()
{
  return MEMORY[0x1E0CBB858]();
}

uint64_t IOPSCopyPowerSourcesByType()
{
  return MEMORY[0x1E0CBB868]();
}

uint64_t IOPSCopyPowerSourcesByTypePrecise()
{
  return MEMORY[0x1E0CBB870]();
}

CFArrayRef IOPSCopyPowerSourcesList(CFTypeRef blob)
{
  return (CFArrayRef)MEMORY[0x1E0CBB880](blob);
}

uint64_t IOPSGaugingMitigationGetState()
{
  return MEMORY[0x1E0CBB898]();
}

uint64_t IOPSGetPercentRemaining()
{
  return MEMORY[0x1E0CBB8A0]();
}

CFDictionaryRef IOPSGetPowerSourceDescription(CFTypeRef blob, CFTypeRef ps)
{
  return (CFDictionaryRef)MEMORY[0x1E0CBB8A8](blob, ps);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

kern_return_t IORegistryEntryCreateCFProperties(io_registry_entry_t entry, CFMutableDictionaryRef *properties, CFAllocatorRef allocator, IOOptionBits options)
{
  return MEMORY[0x1E0CBB8F0](*(_QWORD *)&entry, properties, allocator, *(_QWORD *)&options);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

io_registry_entry_t IORegistryEntryFromPath(mach_port_t mainPort, const io_string_t path)
{
  return MEMORY[0x1E0CBB918](*(_QWORD *)&mainPort, path);
}

kern_return_t IORegistryEntryGetRegistryEntryID(io_registry_entry_t entry, uint64_t *entryID)
{
  return MEMORY[0x1E0CBB988](*(_QWORD *)&entry, entryID);
}

CFTypeRef IORegistryEntrySearchCFProperty(io_registry_entry_t entry, const io_name_t plane, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB9A0](*(_QWORD *)&entry, plane, key, allocator, *(_QWORD *)&options);
}

kern_return_t IORegistryEntrySetCFProperties(io_registry_entry_t entry, CFTypeRef properties)
{
  return MEMORY[0x1E0CBB9A8](*(_QWORD *)&entry, properties);
}

kern_return_t IORegistryEntrySetCFProperty(io_registry_entry_t entry, CFStringRef propertyName, CFTypeRef property)
{
  return MEMORY[0x1E0CBB9B0](*(_QWORD *)&entry, propertyName, property);
}

uint64_t IOReportChannelGetChannelName()
{
  return MEMORY[0x1E0DE0290]();
}

uint64_t IOReportCreateSamples()
{
  return MEMORY[0x1E0DE02F8]();
}

uint64_t IOReportCreateSamplesDelta()
{
  return MEMORY[0x1E0DE0300]();
}

uint64_t IOReportIterate()
{
  return MEMORY[0x1E0DE0338]();
}

uint64_t IOReportSimpleGetIntegerValue()
{
  return MEMORY[0x1E0DE0360]();
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x1E0CBB9F0](*(_QWORD *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

kern_return_t IOServiceOpen(io_service_t service, task_port_t owningTask, uint32_t type, io_connect_t *connect)
{
  return MEMORY[0x1E0CBBA10](*(_QWORD *)&service, *(_QWORD *)&owningTask, *(_QWORD *)&type, connect);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MKBUserTypeDeviceMode()
{
  return MEMORY[0x1E0D4E580]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

uint64_t NSStringFromBOOL()
{
  return MEMORY[0x1E0CB31F8]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *NSUserName(void)
{
  return (NSString *)MEMORY[0x1E0CB3428]();
}

uint64_t NStatManagerAddAllTCP()
{
  return MEMORY[0x1E0D51AC8]();
}

uint64_t NStatManagerAddAllUDP()
{
  return MEMORY[0x1E0D51AD0]();
}

uint64_t NStatManagerCreate()
{
  return MEMORY[0x1E0D51AD8]();
}

uint64_t NStatSourceSetCountsBlock()
{
  return MEMORY[0x1E0D51B28]();
}

uint64_t NStatSourceSetDescriptionBlock()
{
  return MEMORY[0x1E0D51B30]();
}

uint64_t NStatSourceSetRemovedBlock()
{
  return MEMORY[0x1E0D51B40]();
}

uint64_t OSAMoveFileForSubmissions()
{
  return MEMORY[0x1E0D1BD00]();
}

uint64_t OSThermalNotificationCurrentLevel()
{
  return MEMORY[0x1E0C80688]();
}

uint64_t PLADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0D800C0]();
}

uint64_t PLADClientBatchKeys()
{
  return MEMORY[0x1E0D800C8]();
}

uint64_t PLADClientPushValueForDistributionKey()
{
  return MEMORY[0x1E0D800D0]();
}

uint64_t PLADClientSetValueForScalarKey()
{
  return MEMORY[0x1E0D800D8]();
}

uint64_t PLBatteryUsageUIKeyFromConfiguration()
{
  return MEMORY[0x1E0D7FDE8]();
}

uint64_t PLBatteryUsageUIStringForQueryRange()
{
  return MEMORY[0x1E0D7FDF0]();
}

uint64_t PLBatteryUsageUIStringForResponseType()
{
  return MEMORY[0x1E0D7FDF8]();
}

uint64_t PLCalculateEndOfDayWithDate()
{
  return MEMORY[0x1E0D7FE00]();
}

uint64_t PLCalculateEndOfHourWithDate()
{
  return MEMORY[0x1E0D7FE08]();
}

uint64_t PLLogAppDeletion()
{
  return MEMORY[0x1E0D800E0]();
}

uint64_t PLOSAMoveFileForSubmissions()
{
  return MEMORY[0x1E0D800F8]();
}

uint64_t PLQueryRegistered()
{
  return MEMORY[0x1E0D7FE38]();
}

uint64_t PLTalkToPowerlogHelper()
{
  return MEMORY[0x1E0D7FE48]();
}

uint64_t SBSBacklightChangeSourceForDisplayLayoutTransitionReason()
{
  return MEMORY[0x1E0DAB5A8]();
}

uint64_t SBSCopyApplicationDisplayIdentifiers()
{
  return MEMORY[0x1E0DAB5E8]();
}

uint64_t SBSCopyDisplayIdentifiers()
{
  return MEMORY[0x1E0DAB5F8]();
}

uint64_t SBSCopyLocalizedApplicationNameForDisplayIdentifier()
{
  return MEMORY[0x1E0DAB610]();
}

uint64_t SBSGetApplicationState()
{
  return MEMORY[0x1E0DAB718]();
}

uint64_t SBSProcessIDForDisplayIdentifier()
{
  return MEMORY[0x1E0DAB910]();
}

uint64_t SBSRegisterDisplayIdentifiersChangedBlock()
{
  return MEMORY[0x1E0DAB918]();
}

uint64_t SFProcessIDForProcessNamed()
{
  return MEMORY[0x1E0D8D6A0]();
}

uint64_t SMCAccumGetChannelInfoForKey()
{
  return MEMORY[0x1E0DE2EC8]();
}

uint64_t SMCCloseConnection()
{
  return MEMORY[0x1E0DE2ED0]();
}

uint64_t SMCGetKeyInfo()
{
  return MEMORY[0x1E0DE2EE0]();
}

uint64_t SMCMakeUInt32Key()
{
  return MEMORY[0x1E0DE2EE8]();
}

uint64_t SMCOSAccumIsSupported()
{
  return MEMORY[0x1E0DE2EF0]();
}

uint64_t SMCOSAccumSampleChannel()
{
  return MEMORY[0x1E0DE2EF8]();
}

uint64_t SMCOpenConnectionWithDefaultService()
{
  return MEMORY[0x1E0DE2F00]();
}

uint64_t SMCReadKey()
{
  return MEMORY[0x1E0DE2F08]();
}

uint64_t SMCReadKeyAsNumericWithKnownKeyInfo()
{
  return MEMORY[0x1E0DE2F10]();
}

uint64_t SMCWriteKeyAsNumeric()
{
  return MEMORY[0x1E0DE2F20]();
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint32_t SecTaskGetCodeSignStatus(SecTaskRef task)
{
  return MEMORY[0x1E0CD6638](task);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1E0D4FAF8]();
}

uint64_t WiFiDeviceClientCopyInterfaceStateInfo()
{
  return MEMORY[0x1E0D4FB10]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1E0D4FB18]();
}

uint64_t WiFiDeviceClientGetInterfaceName()
{
  return MEMORY[0x1E0D4FB20]();
}

uint64_t WiFiDeviceClientGetPower()
{
  return MEMORY[0x1E0D4FB30]();
}

uint64_t WiFiDeviceClientIsInterfaceAWDL()
{
  return MEMORY[0x1E0D4FB40]();
}

uint64_t WiFiDeviceClientIsInterfaceHostAp()
{
  return MEMORY[0x1E0D4FB48]();
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback()
{
  return MEMORY[0x1E0D4FB60]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1E0D4FB68]();
}

uint64_t WiFiDeviceClientRegisterLQMCallback()
{
  return MEMORY[0x1E0D4FB78]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1E0D4FB80]();
}

uint64_t WiFiDeviceClientRegisterScanUpdateCallback()
{
  return MEMORY[0x1E0D4FB90]();
}

uint64_t WiFiDeviceClientRegisterVirtualInterfaceStateChangeCallback()
{
  return MEMORY[0x1E0D4FB98]();
}

uint64_t WiFiGetNetworkChannel()
{
  return MEMORY[0x1E0D4FBD0]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCopyInterfaces()
{
  return MEMORY[0x1E0D4FBF0]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientGetWoWCapability()
{
  return MEMORY[0x1E0D4FC48]();
}

uint64_t WiFiManagerClientGetWoWState()
{
  return MEMORY[0x1E0D4FC50]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1E0D4FC58]();
}

uint64_t WiFiManagerClientRegisterUserAutoJoinStateChangedCallback()
{
  return MEMORY[0x1E0D4FC70]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiManagerClientUnscheduleFromRunLoop()
{
  return MEMORY[0x1E0D4FCC0]();
}

uint64_t WiFiNetworkGetOperatingBand()
{
  return MEMORY[0x1E0D4FD18]();
}

uint64_t WiFiNetworkGetProperty()
{
  return MEMORY[0x1E0D4FD20]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1E0D4FD30]();
}

uint64_t WiFiNetworkIsCarPlay()
{
  return MEMORY[0x1E0D4FD68]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFBundleCopyBundleURLForExecutableURL()
{
  return MEMORY[0x1E0C99F70]();
}

uint64_t _CFBundleCreateUnique()
{
  return MEMORY[0x1E0C99FF0]();
}

uint64_t _CFCopySupplementalVersionDictionary()
{
  return MEMORY[0x1E0C9A0C8]();
}

uint64_t _CFPreferencesAppSynchronizeWithContainer()
{
  return MEMORY[0x1E0C9A300]();
}

uint64_t _CFPreferencesCopyAppValueWithContainer()
{
  return MEMORY[0x1E0C9A308]();
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
}

uint64_t _CFPreferencesSetValueWithContainer()
{
  return MEMORY[0x1E0C9A398]();
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateCFObjectFromXPCObject()
{
  return MEMORY[0x1E0C9A800]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _SBFScreenTimeRegisterForExternalChangeNotification()
{
  return MEMORY[0x1E0DABCC0]();
}

uint64_t _SBSAutolockTimerRegisterForExternalChangeNotification()
{
  return MEMORY[0x1E0DABCD0]();
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

size_t std::__next_prime(size_t __n)
{
  return MEMORY[0x1E0DE43E8](__n);
}

void operator delete(void *__p)
{
  off_1EA16C058(__p);
}

uint64_t operator delete()
{
  return off_1EA16C060();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1EA16C068(__sz);
}

uint64_t operator new()
{
  return off_1EA16C070();
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void __cxa_rethrow(void)
{
  MEMORY[0x1E0DE50D0]();
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

double __exp10(double a1)
{
  double result;

  MEMORY[0x1E0C80AC8](a1);
  return result;
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

uint64_t __strncat_chk()
{
  return MEMORY[0x1E0C80C50]();
}

uint64_t _launch_service_stats_copy_4ppse_impl()
{
  return MEMORY[0x1E0C80FA8]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x1E0C80FF8]();
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

uint64_t _os_signpost_emit_unreliably_with_name_impl()
{
  return MEMORY[0x1E0C810C8]();
}

void _os_signpost_emit_with_name_impl(void *dso, os_log_t log, os_signpost_type_t type, os_signpost_id_t spid, const char *name, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C810D0](dso, log, type, spid, name, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
}

char *__cdecl basename(char *a1)
{
  return (char *)MEMORY[0x1E0C816D8](a1);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

Class class_getSuperclass(Class cls)
{
  return (Class)MEMORY[0x1E0DE7AD8](cls);
}

__uint64_t clock_gettime_nsec_np(clockid_t __clock_id)
{
  return MEMORY[0x1E0C82670](*(_QWORD *)&__clock_id);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t coalition_info_resource_usage()
{
  return MEMORY[0x1E0C826A0]();
}

size_t confstr(int a1, char *a2, size_t a3)
{
  return MEMORY[0x1E0C826D0](*(_QWORD *)&a1, a2, a3);
}

uint64_t container_system_group_path_for_identifier()
{
  return MEMORY[0x1E0C82A90]();
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x1E0C82BC0](object);
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

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
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

const char *__cdecl dispatch_queue_get_label(dispatch_queue_t queue)
{
  return (const char *)MEMORY[0x1E0C82E58](queue);
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

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

int fclose(FILE *a1)
{
  return MEMORY[0x1E0C832F8](a1);
}

int feof(FILE *a1)
{
  return MEMORY[0x1E0C83340](a1);
}

int ferror(FILE *a1)
{
  return MEMORY[0x1E0C83348](a1);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

long double fmod(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C83440](__x, __y);
  return result;
}

float fmodf(float a1, float a2)
{
  float result;

  MEMORY[0x1E0C83448](a1, a2);
  return result;
}

FILE *__cdecl fopen(const char *__filename, const char *__mode)
{
  return (FILE *)MEMORY[0x1E0C83460](__filename, __mode);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C834A0](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x1E0C835E0](__ptr, __size, __nitems, __stream);
}

uint64_t getAllowblocklist()
{
  return MEMORY[0x1E0D80100]();
}

uint64_t getClientPermissions()
{
  return MEMORY[0x1E0D80108]();
}

uint64_t getPowermodels()
{
  return MEMORY[0x1E0D80110]();
}

uint64_t getSessionsAllowlist()
{
  return MEMORY[0x1E0D80118]();
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

int gettimeofday(timeval *a1, void *a2)
{
  return MEMORY[0x1E0C83820](a1, a2);
}

kern_return_t host_statistics64(host_t host_priv, host_flavor_t flavor, host_info64_t host_info64_out, mach_msg_type_number_t *host_info64_outCnt)
{
  return MEMORY[0x1E0C838E0](*(_QWORD *)&host_priv, *(_QWORD *)&flavor, host_info64_out, host_info64_outCnt);
}

const char *__cdecl inet_ntop(int a1, const void *a2, char *a3, socklen_t a4)
{
  return (const char *)MEMORY[0x1E0C83968](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

uint64_t initComputeSafeguards()
{
  return MEMORY[0x1E0D13408]();
}

uint64_t launch_service_stats_disable_4ppse()
{
  return MEMORY[0x1E0C83B10]();
}

uint64_t launch_service_stats_enable_4ppse()
{
  return MEMORY[0x1E0C83B18]();
}

uint64_t launch_service_stats_is_enabled_4ppse()
{
  return MEMORY[0x1E0C83B20]();
}

uint64_t ledger()
{
  return MEMORY[0x1E0C83B58]();
}

long double log10(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BC0](__x);
  return result;
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x1E0C83C50]();
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x1E0C83C70]();
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

uint64_t mach_get_times()
{
  return MEMORY[0x1E0C83C88]();
}

mach_port_t mach_host_self(void)
{
  return MEMORY[0x1E0C83C90]();
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x1E0C83CF8](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x1E0C83DB8](info);
}

void *__cdecl malloc(size_t __size)
{
  return (void *)MEMORY[0x1E0C83E68](__size);
}

uint64_t malloc_get_all_zones()
{
  return MEMORY[0x1E0C83EA0]();
}

const char *__cdecl malloc_get_zone_name(malloc_zone_t *zone)
{
  return (const char *)MEMORY[0x1E0C83EA8](zone);
}

void *__cdecl malloc_type_aligned_alloc(size_t alignment, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF0](alignment, size, type_id);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F10](ptr, size, type_id);
}

void malloc_zone_statistics(malloc_zone_t *zone, malloc_statistics_t *stats)
{
  MEMORY[0x1E0C83FA8](zone, stats);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x1E0C84098](__dst, __src, __len);
}

uint64_t memorystatus_control()
{
  return MEMORY[0x1E0C840A8]();
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

mstats *mstats(mstats *__return_ptr retstr)
{
  return (mstats *)MEMORY[0x1E0C84208](retstr);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_get_state(int token, uint64_t *state64)
{
  return MEMORY[0x1E0C843E8](*(_QWORD *)&token, state64);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x1E0C843F8](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x1E0C84400](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x1E0C84428](*(_QWORD *)&token, state64);
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

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

Class *__cdecl objc_copyClassList(unsigned int *outCount)
{
  return (Class *)MEMORY[0x1E0DE7C08](outCount);
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

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_release(void *object)
{
  MEMORY[0x1E0C84910](object);
}

BOOL os_signpost_enabled(os_log_t log)
{
  return MEMORY[0x1E0C84920](log);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

int printf(const char *a1, ...)
{
  return MEMORY[0x1E0C84BD0](a1);
}

int proc_listallpids(void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C08](buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_listcoalitions()
{
  return MEMORY[0x1E0C84C10]();
}

int proc_listpids(uint32_t type, uint32_t typeinfo, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C18](*(_QWORD *)&type, *(_QWORD *)&typeinfo, buffer, *(_QWORD *)&buffersize);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

int proc_pid_rusage(int pid, int flavor, rusage_info_t *buffer)
{
  return MEMORY[0x1E0C84C28](*(_QWORD *)&pid, *(_QWORD *)&flavor, buffer);
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x1E0C84C40](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C50](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t proc_reset_footprint_interval()
{
  return MEMORY[0x1E0C84C68]();
}

int pthread_attr_destroy(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CB0](a1);
}

int pthread_attr_init(pthread_attr_t *a1)
{
  return MEMORY[0x1E0C84CC8](a1);
}

int pthread_attr_setdetachstate(pthread_attr_t *a1, int a2)
{
  return MEMORY[0x1E0C84CD8](a1, *(_QWORD *)&a2);
}

int pthread_create(pthread_t *a1, const pthread_attr_t *a2, void *(__cdecl *a3)(void *), void *a4)
{
  return MEMORY[0x1E0C84D50](a1, a2, a3, a4);
}

int pthread_setname_np(const char *a1)
{
  return MEMORY[0x1E0C84F08](a1);
}

int putchar(int a1)
{
  return MEMORY[0x1E0C84F50](*(_QWORD *)&a1);
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int stat(const char *a1, stat *a2)
{
  return MEMORY[0x1E0C854D8](a1, a2);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x1E0C855A8](__s1, __s2, __n);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

int sysctlbyname(const char *a1, void *a2, size_t *a3, void *a4, size_t a5)
{
  return MEMORY[0x1E0C857A0](a1, a2, a3, a4, a5);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

kern_return_t task_name_for_pid(mach_port_name_t target_tport, int pid, mach_port_name_t *tn)
{
  return MEMORY[0x1E0C85848](*(_QWORD *)&target_tport, *(_QWORD *)&pid, tn);
}

uint64_t tcp_connection_fallback_watcher_create()
{
  return MEMORY[0x1E0CD0548]();
}

uint64_t tcp_fallback_watcher_fallback_inuse()
{
  return MEMORY[0x1E0CD06E8]();
}

time_t time(time_t *a1)
{
  return MEMORY[0x1E0C85950](a1);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x1E0C859E0](*(_QWORD *)&a1);
}

void uuid_unparse(const uuid_t uu, uuid_string_t out)
{
  MEMORY[0x1E0C85A40](uu, out);
}

size_t xpc_array_get_count(xpc_object_t xarray)
{
  return MEMORY[0x1E0C85E30](xarray);
}

const char *__cdecl xpc_array_get_string(xpc_object_t xarray, size_t index)
{
  return (const char *)MEMORY[0x1E0C85E70](xarray, index);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1E0C85F48]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F68](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x1E0C85FD0]();
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x1E0C86228](original);
}

xpc_connection_t xpc_dictionary_get_remote_connection(xpc_object_t xdict)
{
  return (xpc_connection_t)MEMORY[0x1E0C862B0](xdict);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x1E0C863B8](xdict, key, value);
}

uint64_t xpc_get_service_name_from_pid()
{
  return MEMORY[0x1E0C86518]();
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

