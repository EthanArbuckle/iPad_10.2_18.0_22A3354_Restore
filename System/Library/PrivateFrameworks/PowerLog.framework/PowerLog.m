PPSTelemetryIdentifier *PPSCreateTelemetryIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = objc_msgSend(v3, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");

  return +[PPSClientDonation createIdentifierForSubsystem:category:](PPSClientDonation, "createIdentifierForSubsystem:category:", v5, v7);
}

void sub_19EA9AB04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EA9ADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id logHandle()
{
  if (logHandle_onceToken != -1)
    dispatch_once(&logHandle_onceToken, &__block_literal_global_26);
  return (id)logHandle__logHandle;
}

id logHandle_0()
{
  if (logHandle_onceToken_0 != -1)
    dispatch_once(&logHandle_onceToken_0, &__block_literal_global_6);
  return (id)logHandle__logHandle_0;
}

id logHandle_1()
{
  if (logHandle_onceToken_1 != -1)
    dispatch_once(&logHandle_onceToken_1, &__block_literal_global_8);
  return (id)logHandle__logHandle_1;
}

void sub_19EA9B934(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLLogDiscretionaryEnergyMonitor()
{
  if (PLLogDiscretionaryEnergyMonitor_onceToken != -1)
    dispatch_once(&PLLogDiscretionaryEnergyMonitor_onceToken, &__block_literal_global);
  return (id)PLLogDiscretionaryEnergyMonitor___logObj;
}

uint64_t PLQueryRegistered(int a1, __CFString *a2, void *a3)
{
  __CFString *v7;
  void *v8;
  __CFString *v9;
  id v10;
  __CFString *v11;

  if (!+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    v7 = CFSTR("unknownQuery;");
    if (a2)
      v7 = a2;
    v8 = (void *)MEMORY[0x1E0CB3940];
    v9 = v7;
    v10 = a3;
    v11 = a2;
    objc_msgSend(v8, "stringWithFormat:", CFSTR("com.apple.PLQueryRegistered.%d.%@.start"), a1, v9);
    objc_claimAutoreleasedReturnValue();
    PLADClientAddValueForScalarKey();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.PLQueryRegistered.%d.%@.queryTime"), a1, v9);
    objc_claimAutoreleasedReturnValue();
    PLADMonotonicTimeGetCurrent();
  }
  return 0;
}

uint64_t PLShouldLogRegisteredEvent(uint64_t a1, void *a2)
{
  uint64_t v4;
  id v5;
  void *v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;

  if (+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
    return 0;
  v5 = a2;
  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "blockedPermissionForClientID:withKey:withType:withTimeout:", a1, v5, CFSTR("Post"), 0);

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "clientDebug");

  if (v7)
  {
    if (!v9)
      return 1;
    PLLogClientLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      PLShouldLogRegisteredEvent_cold_2();
    v4 = 1;
    goto LABEL_12;
  }
  if (v9)
  {
    PLLogClientLogging();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      PLShouldLogRegisteredEvent_cold_1();
    v4 = 0;
LABEL_12:

    return v4;
  }
  return 0;
}

void PLLogTimeSensitiveRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (!+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    v6 = a2;
    v9 = (id)objc_msgSend(a3, "mutableCopy");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v7, CFSTR("__pl_internal_timeSensitiveSystemDate"));

    +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logForClientID:withKey:withPayload:", a1, v6, v9);

  }
}

void sub_19EA9C97C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void PLLogRegisteredEvent(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  id v8;

  if (!+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
  {
    v6 = a3;
    v7 = a2;
    +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "logForClientID:withKey:withPayload:", a1, v7, v6);

  }
}

void sub_19EA9CE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_19EA9D5F0(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___CacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9D794(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BuildMessageSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9DA8C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9E0D4(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___CacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9EA78(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___CacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9EBE0(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EA9EF30(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___CacheSync___"));
  _Unwind_Resume(a1);
}

uint64_t pps_send_telemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:](PPSClientDonation, "sendEventWithIdentifier:payload:", a1, a2);
}

uint64_t PPSSendTelemetry(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:](PPSClientDonation, "sendEventWithIdentifier:payload:", a1, a2);
}

uint64_t PerfPowerTelemetrySendEvent(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:](PPSClientDonation, "sendEventWithIdentifier:payload:", a1, a2);
}

void __logHandle_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServices", "ClientRegistration");
  v1 = (void *)logHandle__logHandle;
  logHandle__logHandle = (uint64_t)v0;

}

void __logHandle_block_invoke_0()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.PerfPowerServices", "ClientDonation");
  v1 = (void *)logHandle__logHandle_0;
  logHandle__logHandle_0 = (uint64_t)v0;

}

void __logHandle_block_invoke_1()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.batteryui", "");
  v1 = (void *)logHandle__logHandle_1;
  logHandle__logHandle_1 = (uint64_t)v0;

}

id discretionaryEnergyMonitorQueue()
{
  if (discretionaryEnergyMonitorQueue_queueCreationGuard != -1)
    dispatch_once(&discretionaryEnergyMonitorQueue_queueCreationGuard, &__block_literal_global_3);
  return (id)discretionaryEnergyMonitorQueue_queue;
}

void PLBatteryLifeMonitorLogCoreDuetEventsAggregate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("events");
  v5[0] = a1;
  v1 = (void *)MEMORY[0x1E0C99D80];
  v2 = a1;
  objc_msgSend(v1, "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v3);
}

void __discretionaryEnergyMonitorQueue_block_invoke()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_BACKGROUND, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("PLFrameworkEnergyBudgetingWorkQueue", v0);
  v2 = (void *)discretionaryEnergyMonitorQueue_queue;
  discretionaryEnergyMonitorQueue_queue = (uint64_t)v1;

}

void sub_19EAA0C0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

void sub_19EAA49AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void didReceiveNotification(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  _QWORD v6[6];

  discretionaryEnergyMonitorQueue();
  v5 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __didReceiveNotification_block_invoke;
  v6[3] = &__block_descriptor_48_e5_v8__0l;
  v6[4] = a2;
  v6[5] = a3;
  dispatch_async(v5, v6);

}

void PLBatteryLifeMonitorLogDuetEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[6];
  _QWORD v18[7];

  v18[6] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9;

  v17[0] = CFSTR("time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v11;
  v17[1] = CFSTR("bundleID");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v12;
  v17[2] = CFSTR("updateType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18[2] = v13;
  v17[3] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v18[3] = v14;
  v17[4] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v17[5] = CFSTR("BLMLogType");
  v18[4] = v15;
  v18[5] = &unk_1E416C358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v16);
}

void PLBatteryLifeMonitorStopAllDuetEvents()
{
  void *v0;
  double v1;
  double v2;
  void *v3;
  void *v4;
  _QWORD v5[3];
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "timeIntervalSince1970");
  v2 = v1;

  v5[0] = CFSTR("time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v3;
  v6[1] = MEMORY[0x1E0C9AAB0];
  v5[1] = CFSTR("BLMStopAllDuetEvents");
  v5[2] = CFSTR("BLMLogType");
  v6[2] = &unk_1E416C358;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v6, v5, 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v4);
}

void PLBatteryLifeMonitorLogCoreDuetAdmissionEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, double a6, double a7, uint64_t a8, uint64_t a9, uint64_t a10)
{
  void *v19;
  double v20;
  double v21;
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
  _QWORD v33[11];
  _QWORD v34[13];

  v34[11] = *MEMORY[0x1E0C80C00];
  if (+[PLModelingUtilities internalBuild](PLModelingUtilities, "internalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "timeIntervalSince1970");
    v21 = v20;

    v33[0] = CFSTR("time");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v34[0] = v32;
    v33[1] = CFSTR("clientID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v34[1] = v31;
    v33[2] = CFSTR("attributeID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v34[2] = v22;
    v33[3] = CFSTR("attributeName");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a10);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v34[3] = v23;
    v33[4] = CFSTR("value");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v34[4] = v24;
    v33[5] = CFSTR("Probability");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a6);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v34[5] = v25;
    v33[6] = CFSTR("PT");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a7);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v34[6] = v26;
    v33[7] = CFSTR("BON");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v34[7] = v27;
    v33[8] = CFSTR("reason");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a5);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v34[8] = v28;
    v33[9] = CFSTR("ableID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a9);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v33[10] = CFSTR("BLMLogType");
    v34[9] = v29;
    v34[10] = &unk_1E416C370;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, v33, 11);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v30);
  }
}

void PLBatteryLifeMonitorLogCoreDuetEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  void *v18;
  double v19;
  double v20;
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
  void *v32;
  void *v33;
  void *v34;
  _QWORD v35[13];
  _QWORD v36[15];

  v36[13] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "timeIntervalSince1970");
  v20 = v19;

  v35[0] = CFSTR("time");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v34;
  v35[1] = CFSTR("clientID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v33;
  v35[2] = CFSTR("attributeID");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v36[2] = v32;
  v35[3] = CFSTR("attributeName");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a11);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v36[3] = v21;
  v35[4] = CFSTR("updateType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v36[4] = v22;
  v35[5] = CFSTR("sequenceNumber");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a4);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v36[5] = v23;
  v35[6] = CFSTR("eventType");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", a5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v36[6] = v24;
  v35[7] = CFSTR("value");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a6);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[7] = v25;
  v35[8] = CFSTR("cellin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a7);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v36[8] = v26;
  v35[9] = CFSTR("cellout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a8);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v36[9] = v27;
  v35[10] = CFSTR("wifiin");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a9);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36[10] = v28;
  v35[11] = CFSTR("wifiout");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a10);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v35[12] = CFSTR("BLMLogType");
  v36[11] = v29;
  v36[12] = &unk_1E416C388;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 13);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v30);
}

void PLBatteryLifeMonitorLogCoreDuetPredictionEvents(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, float a8)
{
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[10];
  _QWORD v31[12];

  v31[10] = *MEMORY[0x1E0C80C00];
  if (+[PLModelingUtilities internalBuild](PLModelingUtilities, "internalBuild"))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSince1970");
    v18 = v17;

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18, CFSTR("time"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v19;
    v30[1] = CFSTR("prediction_c_a");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v31[1] = v20;
    v30[2] = CFSTR("prediction_c_b");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v31[2] = v21;
    v30[3] = CFSTR("prediction_c_c");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v31[3] = v22;
    v30[4] = CFSTR("prediction_b1");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v31[4] = v23;
    v30[5] = CFSTR("prediction_b2");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a5);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v31[5] = v24;
    v30[6] = CFSTR("prediction_r2");
    *(float *)&v25 = a8;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v31[6] = v26;
    v30[7] = CFSTR("ableID");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", a6);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v31[7] = v27;
    v30[8] = CFSTR("selectedModel");
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v30[9] = CFSTR("BLMLogType");
    v31[8] = v28;
    v31[9] = &unk_1E416C3A0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    PLLogRegisteredEvent(24, CFSTR("BLMNotifyDuetEvent"), v29);
  }
}

id PLBatteryLifeMonitorGenericDuetQuery(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  unsigned int v7;
  uint64_t v8;
  void *v9;

  v1 = a1;
  if (+[PLModelingUtilities isHomePod](PLModelingUtilities, "isHomePod"))
    goto LABEL_11;
  PLFDefaultsValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    PLFDefaultsValueForKey();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "integerValue");

  }
  else
  {
    v4 = 30;
  }
  PLFDefaultsValueForKey();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    PLFDefaultsValueForKey();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "unsignedIntValue");

  }
  else
  {
    v7 = 2;
  }
  if (v4 < 1)
  {
LABEL_11:
    v9 = 0;
  }
  else
  {
    while (1)
    {
      PLQueryRegistered(24, CFSTR("BLMReportEnergyDuet"), v1);
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
        break;
      sleep(v7);
      if (!--v4)
        goto LABEL_11;
    }
    v9 = (void *)v8;
  }

  return v9;
}

id PLBatteryLifeMonitorReportEnergyDuet(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  PLFDefaultsValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    NSLog(CFSTR("Duet to powerlog call is disabled, returning 0"));
    v13[0] = MEMORY[0x1E0C9AA60];
    v12[0] = CFSTR("BLMEnergyForDuet");
    v12[1] = CFSTR("BLMEnergyReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v12[2] = CFSTR("BLMBatteryCapacity");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = CFSTR("BLMEnergyForDuet");
    v8 = v1;
    if (!v1)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[1] = CFSTR("BLMLogType");
    v11[0] = v8;
    v11[1] = &unk_1E416C358;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)

    PLBatteryLifeMonitorGenericDuetQuery(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

uint64_t PLBatteryLifeMonitorReportCumulativeTotalDiscretionaryEnergyCoreDuet()
{
  return PLQueryRegistered(24, CFSTR("BLMReportEnergyDuet"), 0);
}

id PLBatteryLifeMonitorReportEnergyCoreDuet(void *a1)
{
  id v1;
  void *v2;
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];
  _QWORD v11[2];
  _QWORD v12[3];
  _QWORD v13[4];

  v13[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  PLFDefaultsValueForKey();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  if (v3)
  {
    NSLog(CFSTR("Duet to powerlog call is disabled, returning 0"));
    v13[0] = MEMORY[0x1E0C9AA60];
    v12[0] = CFSTR("BLMEnergyForDuet");
    v12[1] = CFSTR("BLMEnergyReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v13[1] = v4;
    v12[2] = CFSTR("BLMBatteryCapacity");
    v5 = (void *)MEMORY[0x1E0CB37E8];
    +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
    objc_msgSend(v5, "numberWithDouble:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10[0] = CFSTR("BLMEnergyForDuet");
    v8 = v1;
    if (!v1)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v10[1] = CFSTR("BLMLogType");
    v11[0] = v8;
    v11[1] = &unk_1E416C388;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v1)

    PLBatteryLifeMonitorGenericDuetQuery(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

id PLBatteryLifeMonitorReportBatteryCapacityForCoreDuet()
{
  void *v0;
  int v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v8;
  void *v9;
  _QWORD v10[2];
  _QWORD v11[3];

  v11[2] = *MEMORY[0x1E0C80C00];
  PLFDefaultsValueForKey();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLValue");

  if (v1)
  {
    NSLog(CFSTR("Duet to powerlog call is disabled, returning 0"));
    v10[0] = CFSTR("BLMEnergyReferenceDate");
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v10[1] = CFSTR("BLMBatteryCapacity");
    v11[0] = v2;
    v3 = (void *)MEMORY[0x1E0CB37E8];
    +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
    objc_msgSend(v3, "numberWithDouble:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v11[1] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, v10, 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = CFSTR("BLMBatteryCapacity");
    v6 = (void *)MEMORY[0x1E0CB37E8];
    +[PLModelingUtilities defaultBatteryEnergyCapacity](PLModelingUtilities, "defaultBatteryEnergyCapacity");
    objc_msgSend(v6, "numberWithDouble:");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v2;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

uint64_t PLBatteryLifeMonitorReportDiscretionaryBudgetForDuet()
{
  return +[PLModelingUtilities duetDiscretionaryBudget](PLModelingUtilities, "duetDiscretionaryBudget");
}

id PLBuildUsageSnapshot()
{
  return (id)objc_opt_new();
}

id PLBuildEnergyBucket()
{
  void *v0;

  v0 = (void *)objc_opt_new();
  objc_msgSend(v0, "setLevel:", 1);
  return v0;
}

id PLBuildEnergyBucketTillNow()
{
  void *v0;
  void *v1;

  v0 = (void *)objc_opt_new();
  v1 = (void *)objc_opt_new();
  objc_msgSend(v1, "setLevel:", 1);

  return v1;
}

void __didReceiveNotification_block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  double v9;
  double v10;
  const __CFString *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint8_t v23[16];
  uint8_t v24[16];
  uint8_t v25[16];
  uint8_t buf[16];

  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.quickEnergySnapshots")))
  {
    if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.queryPowerlog")))
    {
      if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.generateEnergyReport")))
      {
        if (!objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.discretionaryIntervals")))
        {
          PLLogDiscretionaryEnergyMonitor();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v23 = 0;
            _os_log_impl(&dword_19EA99000, v7, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Discretionary Intervals: ", v23, 2u);
          }

          objc_msgSend(v2, "intervalManager");
          v3 = objc_claimAutoreleasedReturnValue();
          -[NSObject logDiscretionaryIntervals](v3, "logDiscretionaryIntervals");
          goto LABEL_36;
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.lastPowerlogEnergy")))
        {
          objc_msgSend(v2, "lastPowerlogResponse");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "getPowerlogEnergySum:", v8);
          v10 = v9 * 1000.0;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v10);
          v3 = objc_claimAutoreleasedReturnValue();
          v11 = CFSTR("com.apple.energybudgetingdebug.lastPowerlogEnergy");
          goto LABEL_35;
        }
        if (!objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.lastPowerlogTimestamp")))
        {
          objc_msgSend(v2, "powerlogTimestampLast");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSince1970");
          v14 = v13;

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
          v3 = objc_claimAutoreleasedReturnValue();
          v11 = CFSTR("com.apple.energybudgetingdebug.lastPowerlogTimestamp");
          goto LABEL_35;
        }
        if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.chargingStatus")))
        {
          if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.lastReportedTotalEnergy")))
          {
            if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.lastReportedCPUEnergy")))
            {
              if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.lastReportedNetworkEnergy")))
              {
                if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.accumulatedCPUEnergy")))
                {
                  if (objc_msgSend(*(id *)(a1 + 40), "caseInsensitiveCompare:", CFSTR("com.apple.energybudgetingdebug.accumulatedNetworkEnergy")))
                  {
                    PLLogDiscretionaryEnergyMonitor();
                    v3 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
                      __didReceiveNotification_block_invoke_cold_1();
                    goto LABEL_36;
                  }
                  objc_msgSend(v2, "accumulatedNetworkEnergy");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v22 * 1000.0);
                  v3 = objc_claimAutoreleasedReturnValue();
                  v11 = CFSTR("com.apple.energybudgetingdebug.accumulatedNetworkEnergy");
                }
                else
                {
                  objc_msgSend(v2, "accumulatedCPUEnergy");
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v21 * 1000.0);
                  v3 = objc_claimAutoreleasedReturnValue();
                  v11 = CFSTR("com.apple.energybudgetingdebug.accumulatedCPUEnergy");
                }
              }
              else
              {
                objc_msgSend(v2, "lastReportedNetworkEnergy");
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v20 * 1000.0);
                v3 = objc_claimAutoreleasedReturnValue();
                v11 = CFSTR("com.apple.energybudgetingdebug.lastReportedNetworkEnergy");
              }
            }
            else
            {
              objc_msgSend(v2, "lastReportedCPUEnergy");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v19 * 1000.0);
              v3 = objc_claimAutoreleasedReturnValue();
              v11 = CFSTR("com.apple.energybudgetingdebug.lastReportedCPUEnergy");
            }
          }
          else
          {
            objc_msgSend(v2, "lastReportedTotalEnergy");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v18 * 1000.0);
            v3 = objc_claimAutoreleasedReturnValue();
            v11 = CFSTR("com.apple.energybudgetingdebug.lastReportedTotalEnergy");
          }
LABEL_35:
          objc_msgSend(v2, "setStateForNotification:withState:", v11, v3);
LABEL_36:

          goto LABEL_37;
        }
        v15 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v2, "isCharging"));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "intValue"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "setStateForNotification:withState:", CFSTR("com.apple.energybudgetingdebug.chargingStatus"), v17);

      }
      else
      {
        PLLogDiscretionaryEnergyMonitor();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_19EA99000, v6, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Generating energyReport ...: ", v24, 2u);
        }

        objc_msgSend(v2, "generateEnergyReport");
      }
    }
    else
    {
      PLLogDiscretionaryEnergyMonitor();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v25 = 0;
        _os_log_impl(&dword_19EA99000, v5, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Querying powerlog for discretionary energy ...: ", v25, 2u);
      }

      objc_msgSend(v2, "queryPowerlogForDiscretionaryEnergy");
    }
  }
  else
  {
    PLLogDiscretionaryEnergyMonitor();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA99000, v4, OS_LOG_TYPE_INFO, "DEBUG OUTPUT: Quick energy snapshots: ", buf, 2u);
    }

    objc_msgSend(v2, "logQuickEnergySnapshots");
  }
LABEL_37:

}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_2(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_3(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_10(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_12(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_13(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_14(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

void sub_19EAA7FB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,id location)
{
  id *v21;
  id *v22;

  objc_destroyWeak(v22);
  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void __clientInterface_block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE5343D0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)clientInterface_interface;
  clientInterface_interface = v0;

}

PPSTelemetryIdentifier *PerfPowerTelemetryCreateIdentifier(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;

  v3 = objc_retainAutorelease(a1);
  v4 = a2;
  v5 = objc_msgSend(v3, "UTF8String");
  v6 = objc_retainAutorelease(v4);
  v7 = objc_msgSend(v6, "UTF8String");

  return +[PPSClientDonation createIdentifierForSubsystem:category:](PPSClientDonation, "createIdentifierForSubsystem:category:", v5, v7);
}

PPSTelemetryIdentifier *perfpowertelemetry_create_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:category:](PPSClientDonation, "createIdentifierForSubsystem:category:", a1, a2);
}

uint64_t perfpowertelemetry_send_event(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation sendEventWithIdentifier:payload:](PPSClientDonation, "sendEventWithIdentifier:payload:", a1, a2);
}

void sub_19EAAAEDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t PLLogRegisteredAggregateEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;

  +[PLClientLogAggregator sharedInstance](PLClientLogAggregator, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "aggregateForClientID_async:eventName:eventDictionary:configuration:", a1, a2, a3, a4);

  return v9;
}

id __aggregationBlockForType_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  float v9;
  double v10;
  id v11;
  void *v12;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    *(float *)&v10 = v8 + v9;
    objc_msgSend(v6, "numberWithFloat:", v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = v4;
  }
  v12 = v11;

  return v12;
}

id __aggregationBlockForType_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    if (v8 >= *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v4;
  }
  v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  float v7;
  float v8;
  double v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (a2)
  {
    v6 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(a2, "floatValue");
    v8 = v7;
    objc_msgSend(v5, "floatValue");
    if (v8 < *(float *)&v9)
      *(float *)&v9 = v8;
    objc_msgSend(v6, "numberWithFloat:", v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v4;
  }
  v11 = v10;

  return v11;
}

id __aggregationBlockForType_block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  float v8;
  float v9;
  float v10;
  id v11;
  void *v12;

  v4 = a2;
  v5 = a3;
  v6 = v5;
  if (v4)
  {
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(v4, "floatValue");
      v9 = v8;
      objc_msgSend(v6, "floatValue");
      objc_msgSend(v7, "numberWithDouble:", (float)(v9 + v10) * 0.5);
      v11 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v11 = v4;
    }
  }
  else
  {
    v11 = v5;
  }
  v12 = v11;

  return v12;
}

id logHandleBatteryUIExternalData()
{
  if (logHandleBatteryUIExternalData_onceToken != -1)
    dispatch_once(&logHandleBatteryUIExternalData_onceToken, &__block_literal_global_4);
  return (id)logHandleBatteryUIExternalData__logHandle;
}

void __logHandleBatteryUIExternalData_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.batteryui", "externaldata");
  v1 = (void *)logHandleBatteryUIExternalData__logHandle;
  logHandleBatteryUIExternalData__logHandle = (uint64_t)v0;

}

uint64_t batteryUIHasNoteworthyInformation()
{
  void *v0;
  void *v1;
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  PLConfigureBUIQueryNoteworthyInformation();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLRunBUIQuery(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  logHandleBatteryUIExternalData();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412546;
    v8 = v0;
    v9 = 2112;
    v10 = v1;
    _os_log_impl(&dword_19EA99000, v2, OS_LOG_TYPE_DEFAULT, "config: %@, queryResult: %@", (uint8_t *)&v7, 0x16u);
  }

  logHandleBatteryUIExternalData();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412290;
      v8 = v1;
      _os_log_impl(&dword_19EA99000, v4, OS_LOG_TYPE_DEFAULT, "valid queryResult=%@", (uint8_t *)&v7, 0xCu);
    }

    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("hasNoteworthyInformation"));
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = -[NSObject BOOLValue](v4, "BOOLValue");
  }
  else
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      batteryUIHasNoteworthyInformation_cold_1(v4);
    v5 = 0;
  }

  return v5;
}

id PLLogClientLogging()
{
  if (PLLogClientLogging_onceToken != -1)
    dispatch_once(&PLLogClientLogging_onceToken, &__block_literal_global_5);
  return (id)PLLogClientLogging___logObj;
}

void sub_19EAACC8C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___CacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAACEDC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAAD8E8(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___sFilterByIntervalBufferSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAADD98(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___sFilterByIntervalBufferSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAAE0EC(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAAE160(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAAE23C(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
  _Unwind_Resume(a1);
}

void sub_19EAAE360(_Unwind_Exception *a1)
{
  objc_sync_exit(CFSTR("___BatchCacheSync___"));
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

uint64_t PLShouldLogEvent(void *a1)
{
  void *v2;
  int v3;
  void *v4;
  int v5;
  NSObject *v6;
  uint64_t v7;

  if (+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
    return 0;
  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "blockedPermissionForClientID:withKey:withType:withTimeout:", 0, a1, CFSTR("Post"), 0);

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "clientDebug");

  if (v3 == 1)
  {
    if (!v5)
      return 1;
    PLLogClientLogging();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      PLShouldLogEvent_cold_1();
    v7 = 1;
    goto LABEL_11;
  }
  if (!v5)
    return 0;
  PLLogClientLogging();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    PLShouldLogEvent_cold_2();
  v7 = 0;
LABEL_11:

  return v7;
}

void PLLogEvent(void *a1, void *a2)
{
  if (!+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled"))
    PLLogRegisteredEvent(0, a1, a2);
}

void PLLogRegisteredEventFilterByInterval(uint64_t a1, void *a2, uint64_t a3, double a4)
{
  void *v8;
  void *v9;
  int v10;
  void *v11;
  id v12;

  if (!+[PLClientLogger isMessageOnDeviceDisabled](PLClientLogger, "isMessageOnDeviceDisabled")
    && a2
    && a3)
  {
    v12 = a2;
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithDictionary:copyItems:", a3, 1);
    +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "shouldLogNowForClientID:withKey:withPayload:withFilterInterval:", a1, v12, v8, a4);

    if (v10 == 1)
    {
      +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logLaterForClientID:withKey:withFilterInterval:", a1, v12, a4);
    }
    else
    {
      if (v10)
      {
LABEL_10:

        return;
      }
      +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "logWithCurrentDateForClientID:withKey:withPayload:", a1, v12, v8);
    }

    goto LABEL_10;
  }
}

void PLTalkToPowerlogHelper(int a1)
{
  id v2;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setTalkToPowerlogHelper:", a1 != 0);

}

void PLForceBatching(int a1)
{
  id v2;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setForceBatching:", a1 != 0);

}

void PLBatchDropMessages(int a1)
{
  id v2;

  +[PLClientLogger sharedInstance](PLClientLogger, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBatchDropMessages:", a1 != 0);

}

void PLMovePowerlogsToCR()
{
  uint8_t v0[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v0 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Starting powerlog copy to Crash Reporter", v0, 2u);
  }
  PLCrashMoverCopyPowerlog();
}

void OUTLINED_FUNCTION_1_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x12u);
}

void OUTLINED_FUNCTION_8_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_10_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_12_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x2Au);
}

void OUTLINED_FUNCTION_1_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

double PLBatteryGaugeVersion()
{
  return 1.0;
}

id queryPowerlog(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  PLTalkToPowerlogHelper(1);
  v2 = (void *)PLQueryRegistered(48, CFSTR("PLBatteryGaugeQuery"), v1);

  return v2;
}

uint64_t PLBatteryGaugeStartTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("time"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E416C628, CFSTR("battery_gauge_event"));
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pid"));

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("bundle_id"));

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("process_name"));

  }
  queryPowerlog(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E416C640);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("return_value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  return v17;
}

uint64_t PLBatteryGaugeStopTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("time"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E416C658, CFSTR("battery_gauge_event"));
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pid"));

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("bundle_id"));

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("process_name"));

  }
  queryPowerlog(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E416C640);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("return_value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  return v17;
}

uint64_t PLBatteryGaugePauseTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("time"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E416C670, CFSTR("battery_gauge_event"));
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pid"));

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("bundle_id"));

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("process_name"));

  }
  queryPowerlog(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E416C640);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("return_value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  return v17;
}

uint64_t PLBatteryGaugeResumeTracing(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("time"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E416C688, CFSTR("battery_gauge_event"));
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pid"));

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("bundle_id"));

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("process_name"));

  }
  queryPowerlog(v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "objectForKeyedSubscript:", &unk_1E416C640);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("return_value"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "intValue");

  return v17;
}

uint64_t PLBatteryGaugeStartMetricMonitor(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  MetricDelegate *v15;
  void *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  int v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;
  id v28;
  id v29;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forKey:", v10, CFSTR("time"));

  objc_msgSend(v9, "setObject:forKey:", &unk_1E416C628, CFSTR("battery_gauge_event"));
  if ((_DWORD)a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%d"), a1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v11, CFSTR("pid"));

  }
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v12, CFSTR("bundle_id"));

  }
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setObject:forKey:", v13, CFSTR("process_name"));

  }
  objc_msgSend(MEMORY[0x1E0D709E0], "defaultConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setMode:", 2);
  objc_msgSend(v14, "setUpdateInterval:", 0.2);
  objc_msgSend(v14, "setUpdateDelegate:", 0);
  objc_msgSend(v14, "setIncludeBackBoardUsage:", 1);
  v15 = objc_alloc_init(MetricDelegate);
  v16 = (void *)delegate;
  delegate = (uint64_t)v15;

  v17 = objc_alloc(MEMORY[0x1E0D709D8]);
  v29 = 0;
  v18 = objc_msgSend(v17, "initWithConfiguration:delegate:error:", v14, delegate, &v29);
  v19 = v29;
  v20 = *(void **)monitor;
  *(_QWORD *)monitor = v18;

  if ((_DWORD)a1)
  {
    v28 = v19;
    v21 = objc_msgSend(monitor, "startMonitoringProcessWithPID:error:", a1, &v28);
    v22 = v28;

    if (v21)
    {
      pid2monitor = a1;
      goto LABEL_14;
    }
  }
  else
  {
    if (!a3)
    {
      v22 = v19;
      goto LABEL_14;
    }
    v23 = *(void **)monitor;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", a3);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v19;
    LODWORD(v23) = objc_msgSend(v23, "startMonitoringProcessWithName:error:", v24, &v27);
    v22 = v27;

    if ((_DWORD)v23)
    {
LABEL_14:
      v25 = 0;
      goto LABEL_15;
    }
  }
  v25 = 0xFFFFFFFFLL;
LABEL_15:

  return v25;
}

id PLBatteryGaugeGetMetricMonitorSnapshot()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  uint64_t v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t i;
  uint64_t v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  id v68;
  void *v69;
  void *v70;
  void *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  const __CFString *v76;
  void *v77;
  _QWORD v78[9];
  _QWORD v79[9];
  _QWORD v80[2];
  _QWORD v81[2];
  _QWORD v82[2];
  _QWORD v83[2];
  _QWORD v84[2];
  _QWORD v85[2];
  _QWORD v86[2];
  _QWORD v87[2];
  _QWORD v88[2];
  _QWORD v89[2];
  _QWORD v90[2];
  _QWORD v91[2];
  _QWORD v92[2];
  _QWORD v93[2];
  _QWORD v94[2];
  _QWORD v95[2];
  _QWORD v96[2];
  _QWORD v97[2];
  _BYTE v98[128];
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v68 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(monitor, "collectMetricsOnDemand");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "processMetrics");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid2monitor);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "objectForKeyedSubscript:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "applicationState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "doubleValue");
  v6 = v5;

  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  objc_msgSend(v0, "processMetrics");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0.0;
    v12 = *(_QWORD *)v73;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v73 != v12)
          objc_enumerationMutation(v8);
        v19 = *(_QWORD *)(*((_QWORD *)&v72 + 1) + 8 * i);
        if (v6 != 8.0)
        {
          v20 = objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "intValue");
          if (v20 != pid2monitor)
            continue;
        }
        objc_msgSend(v0, "processMetrics");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "objectForKeyedSubscript:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "cpuCost");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "doubleValue");
        v17 = v17 + v24;

        objc_msgSend(v0, "processMetrics");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "objectForKeyedSubscript:", v19);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "gpuCost");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "doubleValue");
        v16 = v16 + v28;

        objc_msgSend(v0, "processMetrics");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v19);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "networkCost");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "doubleValue");
        v15 = v15 + v32;

        objc_msgSend(v0, "processMetrics");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "objectForKeyedSubscript:", v19);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "locationCost");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "doubleValue");
        v14 = v14 + v36;

        objc_msgSend(v0, "processMetrics");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "objectForKeyedSubscript:", v19);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "energyCost");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "doubleValue");
        v13 = v13 + v40;

        objc_msgSend(v0, "processMetrics");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "objectForKeyedSubscript:", v19);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "energyOverhead");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "doubleValue");
        v11 = v11 + v44;

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v72, v98, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0.0;
    v13 = 0.0;
    v14 = 0.0;
    v15 = 0.0;
    v16 = 0.0;
    v17 = 0.0;
  }

  v96[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v97[0] = v45;
  v96[1] = CFSTR("overhead");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v97[1] = v46;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 2);
  v71 = (void *)objc_claimAutoreleasedReturnValue();

  v94[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v17);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v94[1] = CFSTR("overhead");
  v95[0] = v47;
  v95[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v95, v94, 2);
  v70 = (void *)objc_claimAutoreleasedReturnValue();

  v92[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v16);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v92[1] = CFSTR("overhead");
  v93[0] = v48;
  v93[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v93, v92, 2);
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  v90[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v15);
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v90[1] = CFSTR("overhead");
  v91[0] = v49;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v11);
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  v91[1] = v50;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 2);
  v67 = (void *)objc_claimAutoreleasedReturnValue();

  v88[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v14);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v88[1] = CFSTR("overhead");
  v89[0] = v51;
  v89[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v89, v88, 2);
  v66 = (void *)objc_claimAutoreleasedReturnValue();

  v86[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v6);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v86[1] = CFSTR("overhead");
  v87[0] = v52;
  v87[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v87, v86, 2);
  v65 = (void *)objc_claimAutoreleasedReturnValue();

  v84[0] = CFSTR("cost");
  v53 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v0, "displayCost");
  v54 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v54, "doubleValue");
  objc_msgSend(v53, "numberWithDouble:");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v84[1] = CFSTR("overhead");
  v85[0] = v55;
  v85[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v85, v84, 2);
  v56 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 != 8.0)
  {

    v56 = &unk_1E416CAC8;
  }
  v82[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v0, "thermalPressure"));
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v82[1] = CFSTR("overhead");
  v83[0] = v57;
  v83[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v83, v82, 2);
  v64 = (void *)objc_claimAutoreleasedReturnValue();

  v80[0] = CFSTR("cost");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v0, "inducedThermalPressure"));
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v80[1] = CFSTR("overhead");
  v81[0] = v58;
  v81[1] = &unk_1E416C6A0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v81, v80, 2);
  v59 = (void *)objc_claimAutoreleasedReturnValue();

  v78[0] = &unk_1E416C658;
  v78[1] = &unk_1E416C6B8;
  v79[0] = v71;
  v79[1] = v70;
  v78[2] = &unk_1E416C6D0;
  v78[3] = &unk_1E416C6E8;
  v79[2] = v69;
  v79[3] = v56;
  v78[4] = &unk_1E416C700;
  v78[5] = &unk_1E416C718;
  v79[4] = v67;
  v79[5] = v66;
  v78[6] = &unk_1E416C730;
  v78[7] = &unk_1E416C748;
  v79[6] = v65;
  v79[7] = v64;
  v78[8] = &unk_1E416C760;
  v79[8] = v59;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v79, v78, 9);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v76 = CFSTR("usage_data");
  v77 = v60;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v77, &v76, 1);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", pid2monitor);
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "setObject:forKeyedSubscript:", v61, v62);

  return v68;
}

uint64_t PLBatteryGaugeStartTracingForPid(uint64_t a1)
{
  uint8_t v3[16];

  if (!_os_feature_enabled_impl())
    return PLBatteryGaugeStartTracing(a1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(a1, 0, 0);
}

uint64_t PLBatteryGaugeStartTracingForBundleId(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeStartTracing(v2, a1, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(0, a1, 0);
}

uint64_t PLBatteryGaugeStartTracingForProcessName(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeStartTracing(v2, 0, a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(0, 0, a1);
}

uint64_t PLBatteryGaugeStopTracingForPid(uint64_t a1)
{
  uint8_t v3[16];

  if (!_os_feature_enabled_impl())
    return PLBatteryGaugeStopTracing(a1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugeStopTracingForBundleId(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeStopTracing(v2, a1, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugeStopTracingForProcessName(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeStopTracing(v2, 0, a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugePauseTracingForPid(uint64_t a1)
{
  uint8_t v3[16];

  if (!_os_feature_enabled_impl())
    return PLBatteryGaugePauseTracing(a1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugePauseTracingForBundleId(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugePauseTracing(v2, a1, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugePauseTracingForProcessName(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugePauseTracing(v2, 0, a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  objc_msgSend(monitor, "stopMonitoring");
  return 0;
}

uint64_t PLBatteryGaugeResumeTracingForPid(uint64_t a1)
{
  uint8_t v3[16];

  if (!_os_feature_enabled_impl())
    return PLBatteryGaugeResumeTracing(a1, 0, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v3, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(a1, 0, 0);
}

uint64_t PLBatteryGaugeResumeTracingForBundleId(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeResumeTracing(v2, a1, 0);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(0, a1, 0);
}

uint64_t PLBatteryGaugeResumeTracingForProcessName(uint64_t a1)
{
  uint64_t v2;
  uint8_t v4[16];

  v2 = _os_feature_enabled_impl();
  if (!(_DWORD)v2)
    return PLBatteryGaugeResumeTracing(v2, 0, a1);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "metric monitor feature enabled", v4, 2u);
  }
  return PLBatteryGaugeStartMetricMonitor(0, 0, a1);
}

id PLBatteryGaugeGetSnapshot()
{
  if (_os_feature_enabled_impl())
    PLBatteryGaugeGetMetricMonitorSnapshot();
  else
    queryPowerlog(&unk_1E416CAF0);
  return (id)objc_claimAutoreleasedReturnValue();
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

id getContainerPath()
{
  if (getContainerPath_onceToken != -1)
    dispatch_once(&getContainerPath_onceToken, &__block_literal_global_7);
  return (id)getContainerPath_containerPath;
}

void __getContainerPath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("systemgroup.com.apple.powerlog"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)getContainerPath_containerPath;
    getContainerPath_containerPath = v2;

  }
}

id shortUUIDString()
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "UUIDString");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v1, "length") >= 8)
  {
    objc_msgSend(v1, "substringFromIndex:", objc_msgSend(v1, "length") - 8);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id dateFormatter()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;

  v0 = objc_alloc_init(MEMORY[0x1E0CB3578]);
  v1 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DC8]), "initWithLocaleIdentifier:", CFSTR("en_US_POSIX"));
  objc_msgSend(v0, "setDateFormat:", CFSTR("yyyy-MM-dd_HH-mm"));
  objc_msgSend(MEMORY[0x1E0C99E80], "systemTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setTimeZone:", v2);

  objc_msgSend(v1, "objectForKey:", *MEMORY[0x1E0C99790]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setCalendar:", v3);

  objc_msgSend(v0, "setLocale:", v1);
  return v0;
}

uint64_t PLMarkFileAsPurgeable(void *a1, uint64_t a2)
{
  id v3;
  int v4;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = a2 | 0x10005;
  v3 = objc_retainAutorelease(a1);
  v4 = open((const char *)objc_msgSend(v3, "UTF8String"), 0);
  if (v4 < 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      PLMarkFileAsPurgeable_cold_1();
    goto LABEL_7;
  }
  v5 = v4;
  v6 = ffsctl(v4, 0xC0084A44uLL, &v9, 0);
  close(v5);
  if (v6)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      PLMarkFileAsPurgeable_cold_2((uint64_t)v3, &v9, v6);
LABEL_7:
    v7 = 0;
    goto LABEL_11;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v11 = v3;
    v12 = 2048;
    v13 = a2;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Client Framework -- Marked %@ purgeable with urgency: %llu", buf, 0x16u);
  }
  v7 = 1;
LABEL_11:

  return v7;
}

id PLCopyDB(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  id v6;
  int v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  _BOOL8 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  _BOOL8 v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  passwd *v36;
  id v37;
  int v38;
  void *v39;
  sqlite3 *v41;
  sqlite3 *ppDb;
  uint8_t buf[4];
  id v44;
  __int16 v45;
  id v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v44 = v3;
    v45 = 2112;
    v46 = v4;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Starting copy of dB: %@ to dst: %@\n", buf, 0x16u);
  }
  v5 = (void *)objc_opt_new();
  v41 = 0;
  ppDb = 0;
  v6 = objc_retainAutorelease(v4);
  v7 = sqlite3_open((const char *)objc_msgSend(v6, "UTF8String"), &ppDb);
  if (v7)
  {
    PLADClientAddValueForScalarKey(CFSTR("com.apple.rawPowerlogRetrieval.failOpenDst"), 1);
    v8 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v8)
      PLCopyDB_cold_3(v8, v9, v10, v11, v12, v13, v14, v15);
    v16 = 2;
  }
  else
  {
    v16 = 0;
  }
  v17 = objc_retainAutorelease(v3);
  if (sqlite3_open_v2((const char *)objc_msgSend(v17, "UTF8String"), &v41, 1, 0))
  {
    v16 = 1;
    PLADClientAddValueForScalarKey(CFSTR("com.apple.rawPowerlogRetrieval.failOpenSrc"), 1);
    v18 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v18)
    {
      PLCopyDB_cold_2(v18, v19, v20, v21, v22, v23, v24, v25);
      v16 = 1;
    }
  }
  else if (!v7)
  {
    if (sqlite3_file_control(ppDb, 0, 102, v41))
    {
      PLADClientAddValueForScalarKey(CFSTR("com.apple.rawPowerlogRetrieval.failCopy"), 1);
      v26 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
      if (v26)
        PLCopyDB_cold_1(v26, v27, v28, v29, v30, v31, v32, v33);
      v16 = 3;
    }
    else
    {
      v16 = 0;
    }
  }
  sqlite3_exec(ppDb, "pragma journal_mode=delete", 0, 0, 0);
  if (v41)
    sqlite3_close(v41);
  if (ppDb)
    sqlite3_close(ppDb);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-shm"), v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "removeItemAtPath:error:", v35, 0);

  if (!(_DWORD)v16)
  {
    objc_msgSend(v5, "setObject:forKey:", v6, CFSTR("path"));
    v36 = getpwnam("mobile");
    v37 = objc_retainAutorelease(v6);
    v38 = chown((const char *)objc_msgSend(v37, "fileSystemRepresentation"), v36->pw_uid, v36->pw_gid);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v44) = v38;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog file chown success = %d", buf, 8u);
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog file copy status success", buf, 2u);
    }
    if (objc_msgSend(v37, "hasPrefix:", CFSTR("/var/mobile/Library/Logs/CrashReporter/")))
      PLMarkFileAsPurgeable(v37, 32);
  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v16);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v39, CFSTR("status"));

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v44 = v5;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog output: %@", buf, 0xCu);
  }

  return v5;
}

double PLGetPowerlogDuration(void *a1)
{
  id v1;
  id v2;
  double v3;
  sqlite3 *ppDb;
  uint64_t v6;
  double *v7;
  uint64_t v8;
  uint64_t v9;

  v6 = 0;
  v7 = (double *)&v6;
  v8 = 0x2020000000;
  v9 = 0;
  ppDb = 0;
  v1 = objc_retainAutorelease(a1);
  if (!sqlite3_open((const char *)objc_msgSend(v1, "UTF8String"), &ppDb))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SELECT MAX(timestamp) - MIN(timestamp) from PLBatteryAgent_EventBackward_Battery;"));
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "UTF8String");
    sqlite3_exec_b();

  }
  if (ppDb)
    sqlite3_close(ppDb);
  v3 = v7[3];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void sub_19EAB0CE4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id PLCopyQuarantineDB(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  double v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  int v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  int v25;
  id v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  id obj;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  double v49;
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  getContainerPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = PLGetPowerlogDuration(v3);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v49 = v4;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: main log duration = %f", buf, 0xCu);
  }
  if (v4 < 21600.0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: Powerlog is short! Looking in quarantine...", buf, 2u);
    }
    getContainerPath();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
    v6 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (void *)v6;
    objc_msgSend(v8, "contentsOfDirectoryAtPath:error:", v6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    obj = v9;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    if (v10)
    {
      v11 = v10;
      v36 = v3;
      v37 = v1;
      v38 = 0;
      v39 = 0;
      v12 = *(_QWORD *)v44;
      v13 = CFSTR("PLSQL");
      do
      {
        v14 = 0;
        v41 = v11;
        do
        {
          if (*(_QWORD *)v44 != v12)
            objc_enumerationMutation(obj);
          v15 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v14);
          objc_msgSend(v15, "pathExtension");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "isEqualToString:", v13);

          if (v17)
          {
            v18 = v13;
            objc_msgSend(v40, "stringByAppendingString:", v15);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "attributesOfItemAtPath:error:", v19, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "fileModificationDate");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "laterDate:", v7);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = v7;
            v25 = objc_msgSend(v23, "isEqualToDate:", v22);

            if (v25)
            {
              v26 = v19;

              v27 = v15;
              v7 = v22;

              v38 = v26;
              v39 = v27;
            }
            else
            {
              v7 = v24;
            }

            v13 = v18;
            v11 = v41;
          }
          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
      }
      while (v11);
      v28 = v7;

      v29 = v38;
      if (!v38)
      {
        v34 = 0;
        v3 = v36;
        v1 = v37;
        v30 = v39;
LABEL_30:

        goto LABEL_31;
      }
      v3 = v36;
      v1 = v37;
      v30 = v39;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v49 = *(double *)&v38;
        _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCopyPowerlog: quarantineSrcPath = %@", buf, 0xCu);
      }
      objc_msgSend(v37, "stringByAppendingPathComponent:", v39);
      obj = (id)objc_claimAutoreleasedReturnValue();
      PLCopyDB(v38, obj);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = (void *)objc_msgSend(v31, "mutableCopy");

      objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("status"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      if (v33)
      {

        v34 = 0;
      }
      else
      {
        objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("path"));
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          objc_msgSend(v32, "objectForKeyedSubscript:", CFSTR("path"));
          v34 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }

    }
    else
    {
      v28 = v7;
      v29 = 0;
      v30 = 0;
      v34 = 0;
    }

    goto LABEL_30;
  }
  v34 = 0;
LABEL_31:

  return v34;
}

void *PLCopyPowerlog(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v1 = a1;
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_1E41668B0))
  {

    v2 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  dateFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  shortUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("powerlog_%@_%@.PLSQL"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/BatteryLife/CurrentPowerlog.PLSQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".PLSQL")))
  {
    v11 = v2;
  }
  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  PLCopyDB(v10, v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "mutableCopy");

  -[__CFString stringByDeletingLastPathComponent](v12, "stringByDeletingLastPathComponent");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  PLCopyQuarantineDB(v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  if (v16)
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v16, CFSTR("quarantine_path"));

  return v14;
}

uint64_t PLResetPowerlog()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  unsigned int v4;
  id v5;
  uint64_t v6;
  _BOOL8 v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint8_t v16[8];
  id v17;

  v0 = (void *)MEMORY[0x1E0C99E98];
  getContainerPath();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "fileURLWithPath:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 0;
    v4 = objc_msgSend(v3, "removeItemAtURL:error:", v2, &v17);
    v5 = v17;

    if (v5)
      v6 = 0;
    else
      v6 = v4;
    if ((v6 & 1) != 0)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v16 = 0;
        _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Performed powerlog reset as requested", v16, 2u);
      }
    }
    else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      PLResetPowerlog_cold_2();
    }

  }
  else
  {
    v7 = os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR);
    if (v7)
      PLResetPowerlog_cold_1(v7, v8, v9, v10, v11, v12, v13, v14);
    v6 = 0;
  }

  return v6;
}

uint64_t PLCopyExtendedPersistenceLog(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  v1 = a1;
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_1E41668B0))
  {

    v2 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  dateFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  shortUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("log_%@_%@.EPSQL"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/ExtendedPersistence/CurrentLog.EPSQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".EPSQL")))
  {
    v11 = v2;
  }
  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  PLCopyDB(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t PLCopyCleanEnergyLog(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  v1 = a1;
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_1E41668B0))
  {

    v2 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  dateFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  shortUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("log_%@_%@.CESQL"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/CleanEnergy/CurrentCleanEnergyDB.CESQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".CESQL")))
  {
    v11 = v2;
  }
  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  PLCopyDB(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t PLCopyXcodeOrganizerLog(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  v1 = a1;
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_1E41668B0))
  {

    v2 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  dateFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  shortUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("log_%@_%@.XCSQL"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/XcodeOrganizer/CurrentXcodeOrganizerDB.XCSQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".XCSQL")))
  {
    v11 = v2;
  }
  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  PLCopyDB(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

uint64_t dropTable(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  sqlite3 *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  char *errmsg;
  sqlite3 *ppDb;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  errmsg = 0;
  ppDb = 0;
  v5 = objc_retainAutorelease(v3);
  if (sqlite3_open_v2((const char *)objc_msgSend(v5, "UTF8String"), &ppDb, 2, 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      dropTable_cold_5();
    goto LABEL_15;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Configure the page cache", buf, 2u);
  }
  if (!sqlite3_exec(ppDb, "PRAGMA cache_size = 50;", 0, 0, &errmsg))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Configure the cache_spill", buf, 2u);
    }
    if (sqlite3_exec(ppDb, "PRAGMA cache_spill = 256;", 0, 0, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        dropTable_cold_3((uint64_t *)&errmsg, v8, v9);
      goto LABEL_14;
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v20 = v4;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Drop %@", buf, 0xCu);
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("DROP TABLE '%@';"), v4);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = ppDb;
    v14 = objc_retainAutorelease(v12);
    if (sqlite3_exec(v13, (const char *)objc_msgSend(v14, "UTF8String"), 0, 0, &errmsg))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        dropTable_cold_2();
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Vacuum", buf, 2u);
      }
      if (!sqlite3_exec(ppDb, (const char *)objc_msgSend(CFSTR("PRAGMA incremental_vacuum;"), "UTF8String"),
              0,
              0,
              &errmsg))
      {
        v10 = 1;
        goto LABEL_28;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        dropTable_cold_1((uint64_t *)&errmsg, v15, v16);
    }
    sqlite3_free(errmsg);
    v10 = 0;
LABEL_28:
    sqlite3_close(ppDb);

    goto LABEL_16;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    dropTable_cold_4((uint64_t *)&errmsg, v6, v7);
LABEL_14:
  sqlite3_free(errmsg);
  sqlite3_close(ppDb);
LABEL_15:
  v10 = 0;
LABEL_16:

  return v10;
}

void *PLSysdiagnoseCopyBackgroundProcessingLog(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  double Current;
  void *v6;
  int v7;
  double v8;
  _DWORD v10[2];
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLCopyBackgroundProcessingLog(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (!v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dropTable(v6, CFSTR("BackgroundProcessing_DASActivityLifecycle_24_5"));
    v8 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 2048;
      v12 = v8 - Current;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "BGSQL DROP Success: %d Execution Time: %f", (uint8_t *)v10, 0x12u);
    }
    if ((v7 & 1) == 0)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E416C778, CFSTR("status"));

  }
  return v2;
}

uint64_t PLCopyBackgroundProcessingLog(void *a1)
{
  __CFString *v1;
  __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  uint64_t v13;

  v1 = a1;
  v2 = v1;
  if (!v1 || -[__CFString isEqualToString:](v1, "isEqualToString:", &stru_1E41668B0))
  {

    v2 = CFSTR("/var/mobile/Library/Logs/CrashReporter/");
  }
  dateFormatter();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3940];
  shortUUIDString();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("log_%@_%@.BGSQL"), v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingString:", CFSTR("/Library/PerfPowerTelemetry/BackgroundProcessing/CurrentBackgroundProcessingDB.BGSQL"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[__CFString hasSuffix:](v2, "hasSuffix:", CFSTR(".BGSQL")))
  {
    v11 = v2;
  }
  else
  {
    -[__CFString stringByAppendingPathComponent:](v2, "stringByAppendingPathComponent:", v8);
    v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  v12 = v11;
  PLCopyDB(v10, v11);
  v13 = objc_claimAutoreleasedReturnValue();

  return v13;
}

void handleXPCEvent(void *a1, uint64_t a2, char a3)
{
  id v5;
  double Current;
  id v7;
  NSObject *v8;
  dispatch_semaphore_t v9;
  dispatch_time_t v10;
  id v11;
  NSObject *v12;
  dispatch_time_t v13;
  intptr_t v14;
  intptr_t v15;
  int v16;
  double v17;
  float v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  id v22;
  _QWORD block[4];
  id v24;
  NSObject *v25;
  char v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  intptr_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("ThermalMonitor")) & 1) != 0
    || (Current = 0.0, objc_msgSend(v5, "isEqualToString:", CFSTR("XPCCacheFlush"))))
  {
    Current = CFAbsoluteTimeGetCurrent();
  }
  v7 = objc_retainAutorelease(v5);
  v8 = dispatch_queue_create((const char *)objc_msgSend(v7, "UTF8String"), 0);
  v9 = dispatch_semaphore_create(0);
  v10 = dispatch_time(0, 0);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __handleXPCEvent_block_invoke;
  block[3] = &unk_1E41665E0;
  v11 = v7;
  v24 = v11;
  v26 = a3;
  v12 = v9;
  v25 = v12;
  dispatch_after(v10, v8, block);
  v13 = dispatch_time(0, 1000000000 * a2);
  v14 = dispatch_semaphore_wait(v12, v13);
  if (v14)
  {
    v15 = v14;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v28 = v11;
      v29 = 2048;
      v30 = v15;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ semaphore timeout %lu", buf, 0x16u);
    }
  }
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ThermalMonitor")) & 1) != 0
    || (v16 = objc_msgSend(v11, "isEqualToString:", CFSTR("XPCCacheFlush")), v17 = 0.0, v16))
  {
    v17 = CFAbsoluteTimeGetCurrent();
  }
  v18 = v17 - Current;
  LODWORD(v9) = vcvtps_s32_f32(v18 * 1000.0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("ThermalMonitor")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("collectLogsTime");
LABEL_14:
    objc_msgSend(v19, "setObject:forKeyedSubscript:", v20, v21);

    goto LABEL_15;
  }
  if (objc_msgSend(v11, "isEqualToString:", CFSTR("XPCCacheFlush")))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v9);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = CFSTR("flushCacheTime");
    goto LABEL_14;
  }
LABEL_15:
  if ((objc_msgSend(v11, "isEqualToString:", CFSTR("ThermalMonitor")) & 1) != 0
    || objc_msgSend(v11, "isEqualToString:", CFSTR("XPCCacheFlush")))
  {
    v22 = v19;
    AnalyticsSendEventLazy();

  }
}

void __handleXPCEvent_block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  PLQueryRegistered(1, *(__CFString **)(a1 + 32), MEMORY[0x1E0C9AA70]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138412546;
    v5 = v3;
    v6 = 2112;
    v7 = v2;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "%@ result: %@", (uint8_t *)&v4, 0x16u);
  }
  if (*(_BYTE *)(a1 + 48))
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

id __handleXPCEvent_block_invoke_93(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void *PLSysdiagnoseCopyPowerlog(void *a1, unint64_t a2)
{
  uint64_t v3;
  double Current;
  void *v5;
  float v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2 >> 2;
  handleXPCEvent(CFSTR("ThermalMonitor"), a2 >> 2, 0);
  handleXPCEvent(CFSTR("XPCCacheFlush"), v3, 1);
  Current = CFAbsoluteTimeGetCurrent();
  v5 = PLCopyPowerlog(a1);
  v6 = CFAbsoluteTimeGetCurrent() - Current;
  LODWORD(v3) = vcvtps_s32_f32(v6 * 1000.0);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, CFSTR("copyPowerlogTime"));

  v9 = v7;
  AnalyticsSendEventLazy();

  return v5;
}

uint64_t PLSysdiagnoseCopyLogs(void *a1, unint64_t a2, const __CFArray *a3)
{
  uint64_t v3;
  uint64_t v5;
  __int128 v6;
  unint64_t v7;
  NSObject *v8;
  const void *ValueAtIndex;
  CFTypeID v10;
  uint64_t v11;
  double Current;
  const __CFDictionary *v13;
  const __CFString *v14;
  float v15;
  const __CFNumber *Value;
  const __CFNumber *v17;
  CFTypeID v18;
  float v19;
  uint64_t v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  __int128 v36;
  uint64_t v37;
  unsigned __int8 v38;
  unsigned int valuePtr;
  float v41;
  uint64_t v42;
  float v43;
  uint64_t v44;
  _BYTE buf[24];
  void *v46;
  id v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v5 = a2 >> 2;
  handleXPCEvent(CFSTR("ThermalMonitor"), a2 >> 2, 0);
  handleXPCEvent(CFSTR("XPCCacheFlush"), v5, 1);
  if (a3 && CFArrayGetCount(a3) && CFArrayGetCount(a3))
  {
    v7 = 0;
    v38 = 0;
    v37 = *MEMORY[0x1E0CB2AF0];
    v8 = MEMORY[0x1E0C81028];
    *(_QWORD *)&v6 = 138412546;
    v36 = v6;
    do
    {
      valuePtr = 0;
      ValueAtIndex = CFArrayGetValueAtIndex(a3, v7);
      v10 = CFGetTypeID(ValueAtIndex);
      if (v10 == CFNumberGetTypeID())
      {
        CFNumberGetValue((CFNumberRef)ValueAtIndex, kCFNumberIntType, &valuePtr);
        v11 = valuePtr;
        if (valuePtr < 5)
        {
          Current = CFAbsoluteTimeGetCurrent();
          switch((int)v11)
          {
            case 0:
              v13 = (const __CFDictionary *)PLCopyPowerlog(a1);
              v14 = CFSTR("PLSQL");
              goto LABEL_16;
            case 1:
              v13 = (const __CFDictionary *)PLSysdiagnoseCopyExtendedPersistenceLog(a1);
              v14 = CFSTR("EPSQL");
              goto LABEL_16;
            case 2:
              v13 = (const __CFDictionary *)PLCopyCleanEnergyLog(a1);
              v14 = CFSTR("CESQL");
              goto LABEL_16;
            case 4:
              v13 = (const __CFDictionary *)PLSysdiagnoseCopyBackgroundProcessingLog(a1);
              v14 = CFSTR("BGSQL");
LABEL_16:
              v15 = CFAbsoluteTimeGetCurrent() - Current;
              LODWORD(v3) = vcvtps_s32_f32(v15 * 1000.0);
              Value = (const __CFNumber *)CFDictionaryGetValue(v13, CFSTR("status"));
              if (Value
                && (v17 = Value, v18 = CFGetTypeID(Value), v18 == CFNumberGetTypeID())
                && (*(_DWORD *)buf = 0, CFNumberGetValue(v17, kCFNumberIntType, buf))
                && !*(_DWORD *)buf)
              {
                v28 = (void *)CFDictionaryGetValue(v13, CFSTR("path"));
                v29 = (void *)MEMORY[0x1E0CB3620];
                v30 = v28;
                objc_msgSend(v29, "defaultManager");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v31, "attributesOfItemAtPath:error:", v30, 0);
                v32 = (void *)objc_claimAutoreleasedReturnValue();

                v19 = -1.0;
                if (v32)
                {
                  objc_msgSend(v32, "objectForKeyedSubscript:", v37);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v33)
                  {
                    objc_msgSend(v32, "objectForKeyedSubscript:", v37);
                    v34 = (void *)objc_claimAutoreleasedReturnValue();
                    v19 = (float)objc_msgSend(v34, "longLongValue") * 0.00000095367;

                  }
                }

                v38 = 1;
                v20 = 1;
              }
              else
              {
                v19 = 0.0;
                if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = v36;
                  *(_QWORD *)&buf[4] = v14;
                  *(_WORD *)&buf[12] = 1024;
                  *(_DWORD *)&buf[14] = v3;
                  _os_log_error_impl(&dword_19EA99000, v8, OS_LOG_TYPE_ERROR, "Copying %@ data failed, time taken = %d", buf, 0x12u);
                }
                v20 = 0;
              }
              objc_msgSend(MEMORY[0x1E0C99E08], "dictionary", v36);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, CFSTR("name"));
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", v20);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v22, CFSTR("status"));

              *(float *)&v23 = v19;
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v23);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v24, CFSTR("size"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v3);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, CFSTR("copyingTime"));

              if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(_QWORD *)&buf[4] = v21;
                _os_log_impl(&dword_19EA99000, v8, OS_LOG_TYPE_INFO, "%@", buf, 0xCu);
              }
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v11);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setObject:forKeyedSubscript:", v26, CFSTR("name"));

              *(_QWORD *)buf = MEMORY[0x1E0C809B0];
              *(_QWORD *)&buf[8] = 3221225472;
              *(_QWORD *)&buf[16] = __copyLogAndUpdateSuccess_block_invoke;
              v46 = &unk_1E4166608;
              v47 = v21;
              v27 = v21;
              AnalyticsSendEventLazy();
              CFRelease(v13);

              break;
            default:
              break;
          }
        }
        else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        {
          PLSysdiagnoseCopyLogs_cold_1(&v41, v7, &v42);
        }
      }
      else if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        PLSysdiagnoseCopyLogs_cold_1(&v43, v7, &v44);
      }
      ++v7;
    }
    while (v7 < CFArrayGetCount(a3));
  }
  else
  {
    return 0;
  }
  return v38;
}

void PLSysdiagnoseTimeSensitivePhase()
{
  uint8_t v0[16];

  if (PLSysdiagnoseTimeSensitivePhase_onceToken != -1)
    dispatch_once(&PLSysdiagnoseTimeSensitivePhase_onceToken, &__block_literal_global_97);
  if (PLSysdiagnoseTimeSensitivePhase_hasBaseband)
  {
    handleXPCEvent(CFSTR("BBLogsForSysdiagnose"), 1, 0);
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v0 = 0;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLSysdiagnoseTimeSensitivePhase returned", v0, 2u);
    }
  }
}

uint64_t copyFiles(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  int v8;
  int v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;
  uint64_t v19;
  void *v21;
  id obj;
  void *v23;
  void *v24;
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  id v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v24 = v3;
  objc_msgSend(v5, "contentsOfDirectoryAtPath:error:", v3, &v30);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v30;
  v23 = v4;
  v8 = objc_msgSend(v4, "hasPrefix:", CFSTR("/var/mobile/Library/Logs/CrashReporter/"));
  if (v6)
  {
    v9 = v8;
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    obj = v6;
    v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
    if (v10)
    {
      v11 = v10;
      v21 = v6;
      v12 = *(_QWORD *)v27;
      while (2)
      {
        v13 = 0;
        v14 = v7;
        do
        {
          if (*(_QWORD *)v27 != v12)
            objc_enumerationMutation(obj);
          v15 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v13);
          objc_msgSend(v24, "stringByAppendingPathComponent:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingPathComponent:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = v14;
          v18 = objc_msgSend(v5, "copyItemAtPath:toPath:error:", v16, v17, &v25);
          v7 = v25;

          if ((v18 & 1) == 0)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              v32 = v24;
              v33 = 2112;
              v34 = v7;
              _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Error copying for srcDir %@ : %@", buf, 0x16u);
            }

            v19 = 0;
            goto LABEL_16;
          }
          if (v9)
            PLMarkFileAsPurgeable(v17, 32);

          ++v13;
          v14 = v7;
        }
        while (v11 != v13);
        v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v35, 16);
        if (v11)
          continue;
        break;
      }
      v19 = 1;
LABEL_16:
      v6 = v21;
    }
    else
    {
      v19 = 1;
    }

  }
  else
  {
    v19 = 1;
  }

  return v19;
}

void copyArchivesToCrashMover()
{
  void *v0;
  void *v1;
  uint8_t v2[16];

  getContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Archives/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((copyFiles(v1, CFSTR("/var/mobile/Library/Logs/CrashReporter/")) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Archive copying failed", v2, 2u);
  }

}

void copyQuarantinesToCrashMover()
{
  void *v0;
  void *v1;
  uint8_t v2[16];

  getContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/Library/BatteryLife/Quarantine/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if ((copyFiles(v1, CFSTR("/var/mobile/Library/Logs/CrashReporter/")) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Quarantine copying failed", v2, 2u);
  }

}

void copyUpgradeLogsToCrashMover()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  float v32;
  uint64_t v33;
  float v34;
  uint64_t v35;
  _BYTE v36[128];
  float v37;
  uint64_t v38;
  float v39;
  uint64_t v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  getContainerPath();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MajorVersion"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  getContainerPath();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingString:", CFSTR("/Library/BatteryLife/UpgradeLogs/MinorVersion"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  objc_msgSend(v4, "contentsOfDirectoryAtPath:error:", v1, &v27);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v27;

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v29;
    v9 = MEMORY[0x1E0C81028];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v29 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v1, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v10));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (copyFiles(v11, CFSTR("/var/mobile/Library/Logs/CrashReporter/")))
        {
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
            copyUpgradeLogsToCrashMover_cold_5(&v39, (uint64_t)v11, &v40);
        }
        else if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_6(&v37, (uint64_t)v11, &v38);
        }

        ++v10;
      }
      while (v7 != v10);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v41, 16);
    }
    while (v7);
  }

  if (v21 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    copyUpgradeLogsToCrashMover_cold_4();
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  objc_msgSend(v12, "contentsOfDirectoryAtPath:error:", v3, &v22);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v22;

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v24;
    v17 = MEMORY[0x1E0C81028];
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(v3, "stringByAppendingPathComponent:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v18), v20);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        if (copyFiles(v19, CFSTR("/var/mobile/Library/Logs/CrashReporter/")))
        {
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
            copyUpgradeLogsToCrashMover_cold_2(&v34, (uint64_t)v19, &v35);
        }
        else if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          copyUpgradeLogsToCrashMover_cold_3(&v32, (uint64_t)v19, &v33);
        }

        ++v18;
      }
      while (v15 != v18);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v36, 16);
    }
    while (v15);
  }

  if (v20 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    copyUpgradeLogsToCrashMover_cold_1();

}

void PLCrashMoverCopyPowerlog()
{
  void *v0;
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  getContainerPath();
  v0 = (void *)_CFPreferencesCopyValueWithContainer();
  if (objc_msgSend(v0, "intValue") == 1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v2) = 0;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCrashMoverCopyPowerlog starts cache flush", (uint8_t *)&v2, 2u);
    }
    handleXPCEvent(CFSTR("XPCCacheFlush"), 1000000000, 1);
    v1 = PLCopyPowerlog(CFSTR("/var/mobile/Library/Logs/CrashReporter/"));
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v2 = 138412290;
      v3 = v1;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "PLCrashMoverCopyPowerlog done copying powerlog : %@", (uint8_t *)&v2, 0xCu);
    }
    CFRelease(v1);
    copyArchivesToCrashMover();
    copyQuarantinesToCrashMover();
    if (_os_feature_enabled_impl())
      copyUpgradeLogsToCrashMover();
  }

}

BOOL PLSysdiagnoseCopyBatteryUILogs(void *a1, CFErrorRef *a2)
{
  id v3;
  _BOOL8 v4;
  void *v5;
  const __CFDictionary *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = PLCopyBatteryUIPlists(CFSTR("Sysdiagnose"), v3);
  if (!v4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Failed to copy files to %@"), v3);
    v8 = *MEMORY[0x1E0CB2D50];
    v9[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
    v6 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    if (a2)
      *a2 = CFErrorCreate(0, CFSTR("com.apple.powerlog"), 1, v6);

  }
  return v4;
}

void *PLSysdiagnoseCopyExtendedPersistenceLog(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  int v4;
  double Current;
  void *v6;
  int v7;
  double v8;
  _DWORD v10[2];
  __int16 v11;
  double v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  PLCopyExtendedPersistenceLog(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)objc_msgSend(v1, "mutableCopy");
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("status"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (!v4)
  {
    Current = CFAbsoluteTimeGetCurrent();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("path"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = dropTable(v6, CFSTR("BatteryDataCollection_BDC_AMA_30_1"));
    v8 = CFAbsoluteTimeGetCurrent();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      v10[0] = 67109376;
      v10[1] = v7;
      v11 = 2048;
      v12 = v8 - Current;
      _os_log_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "EPSQL DROP Success: %d Execution Time: %f", (uint8_t *)v10, 0x12u);
    }
    if ((v7 & 1) == 0)
      objc_msgSend(v2, "setObject:forKeyedSubscript:", &unk_1E416C778, CFSTR("status"));

  }
  return v2;
}

id __copyLogAndUpdateSuccess_block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

float *OUTLINED_FUNCTION_3_0(float *result, uint64_t a2, _QWORD *a3, float a4)
{
  *result = a4;
  *a3 = a2;
  return result;
}

void OUTLINED_FUNCTION_6_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

uint64_t PLBatteryUsageUIQuery(__CFString *a1, void *a2)
{
  return PLQueryRegistered(50, a1, a2);
}

id PLConfigureBUIQueryiOS()
{
  void *v0;
  id v1;
  void (**v2)(_QWORD, _QWORD);
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
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v27[4];
  id v28;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __PLConfigureBUIQueryiOS_block_invoke;
  v27[3] = &unk_1E4166650;
  v1 = v0;
  v28 = v1;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AECF00](v27);
  PLCalculateEndOfHour();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDay();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBatteryUsageUIConfiguration(5, v3, 86400.0, 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v5);

  PLBatteryUsageUIConfiguration(7, v3, 86400.0, 900.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v6);

  PLBatteryUsageUIConfiguration(6, v4, 864000.0, 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v7);

  PLBatteryUsageUIConfiguration(1, v3, 86400.0, 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v8);

  PLBatteryUsageUIConfiguration(1, v3, 86400.0, 3600.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v9);

  PLBatteryUsageUIConfiguration(1, v4, 864000.0, 864000.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v10);

  PLBatteryUsageUIConfiguration(1, v4, 864000.0, 86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v11);

  PLBatteryUsageUIConfiguration(8, v3, 86400.0, 3600.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v12);

  PLBatteryUsageUIConfiguration(8, v4, 864000.0, 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v13);

  PLBatteryUsageUIConfiguration(11, v3, 86400.0, 86400.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v14);

  PLBatteryUsageUIConfiguration(12, v3, 86400.0, 86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v15);

  PLBatteryUsageUIConfiguration(13, v3, 86400.0, 86400.0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v16);

  PLBatteryUsageUIConfiguration(14, v3, 86400.0, 86400.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v17);

  PLBatteryUsageUIConfiguration(15, v3, 86400.0, 86400.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v18);

  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(16, v3, 86400.0, 86400.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v19);

  }
  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(9, v3, 86400.0, 86400.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v20);

  }
  if (_os_feature_enabled_impl())
    v21 = 10;
  else
    v21 = 0;
  PLBatteryUsageUIConfiguration(v21, v3, 86400.0, 86400.0);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v22);

  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(17, v4, 1209600.0, 86400.0);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v23);

  }
  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(21, v3, 86400.0, 86400.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v2)[2](v2, v24);

  }
  v25 = v1;

  return v25;
}

id PLBatteryUsageUIKeyForRequest(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("enum"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PLBatteryUsageUIStringForResponseType((int)objc_msgSend(v2, "intValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  PLBatteryUsageUIKeyFromConfiguration(v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), v3, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

id PLCalculateEndOfHour()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfHourWithDate(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PLCalculateEndOfDay()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDayWithDate(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id PLBatteryUsageUIConfiguration(uint64_t a1, void *a2, double a3, double a4)
{
  double v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  _QWORD v19[4];
  _QWORD v20[5];

  v20[4] = *MEMORY[0x1E0C80C00];
  v6 = -a3;
  v7 = a2;
  objc_msgSend(v7, "dateByAddingTimeInterval:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = CFSTR("start");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v8, "timeIntervalSince1970");
  objc_msgSend(v9, "numberWithDouble:");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  v19[1] = CFSTR("end");
  v11 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(v7, "timeIntervalSince1970");
  v13 = v12;

  objc_msgSend(v11, "numberWithDouble:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v14;
  v19[2] = CFSTR("bucket");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v20[2] = v15;
  v19[3] = CFSTR("enum");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v20[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

id PLConfigureBUIQueryWithRangeType(int a1)
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD);
  void *v5;
  id v6;
  void *v7;
  double v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __PLConfigureBUIQueryWithRangeType_block_invoke;
  v24[3] = &unk_1E4166650;
  v3 = v2;
  v25 = v3;
  v4 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AECF00](v24);
  PLCalculateEndOfHour();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDay();
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (a1)
  {
    v8 = 86400.0;
    v9 = v6;
    if (a1 == 2)
    {
      v8 = 864000.0;
      v9 = v6;
    }
  }
  else
  {
    v9 = v5;

    v8 = 10800.0;
  }
  PLBatteryUsageUIConfiguration(1, v9, v8, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v10);

  PLBatteryUsageUIConfiguration(11, v5, 86400.0, 86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v11);

  PLBatteryUsageUIConfiguration(12, v5, 86400.0, 86400.0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v12);

  PLBatteryUsageUIConfiguration(13, v5, 86400.0, 86400.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v13);

  PLBatteryUsageUIConfiguration(14, v5, 86400.0, 86400.0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v14);

  PLBatteryUsageUIConfiguration(15, v5, 86400.0, 86400.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v15);

  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(16, v5, 86400.0, 86400.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v16);

  }
  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(9, v5, 86400.0, 86400.0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v17);

  }
  if (_os_feature_enabled_impl())
    v18 = 10;
  else
    v18 = 0;
  PLBatteryUsageUIConfiguration(v18, v5, 86400.0, 86400.0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v4)[2](v4, v19);

  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(17, v7, 1209600.0, 86400.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v20);

  }
  if (_os_feature_enabled_impl())
  {
    PLBatteryUsageUIConfiguration(21, v5, 86400.0, 86400.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v4)[2](v4, v21);

  }
  v22 = v3;

  return v22;
}

id PLConfigureBUIQueryNoteworthyInformation()
{
  void *v0;
  id v1;
  void (**v2)(_QWORD, _QWORD);
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v14[4];
  id v15;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __PLConfigureBUIQueryNoteworthyInformation_block_invoke;
  v14[3] = &unk_1E4166650;
  v1 = v0;
  v15 = v1;
  v2 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A1AECF00](v14);
  PLCalculateEndOfHour();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PLCalculateEndOfDay();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBatteryUsageUIConfiguration(6, v4, 864000.0, 86400.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v5);

  PLBatteryUsageUIConfiguration(1, v3, 86400.0, 86400.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v6);

  PLBatteryUsageUIConfiguration(13, v3, 86400.0, 86400.0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v7);

  PLBatteryUsageUIConfiguration(14, v3, 86400.0, 86400.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v8);

  PLBatteryUsageUIConfiguration(15, v3, 86400.0, 86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v9);

  PLBatteryUsageUIConfiguration(17, v3, 86400.0, 86400.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v10);

  PLBatteryUsageUIConfiguration(18, v3, 86400.0, 86400.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v2)[2](v2, v11);

  v12 = v1;
  return v12;
}

id PLRunBUIQueryWithRangeType(int a1)
{
  void *v1;
  void *v2;

  PLConfigureBUIQueryWithRangeType(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  PLQueryRegistered(50, CFSTR("BatteryQueryForResponderService"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

id PLRunBUIQuery(void *a1)
{
  id v1;
  NSObject *v2;
  __CFString *v3;
  void *v4;

  v1 = a1;
  if (_os_feature_enabled_impl())
  {
    logHandle_1();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      PLRunBUIQuery_cold_1(v2);

    v3 = CFSTR("BatteryQueryForResponderService");
  }
  else
  {
    v3 = CFSTR("PLBatteryUIQueryFunctionKey");
  }
  PLQueryRegistered(50, v3, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL PLGenerateBatteryUIPlist(void *a1)
{
  id v1;
  id v2;
  void *v3;
  NSObject *v4;
  NSObject *v5;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = PLConfigureBUIQueryiOS();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v1, CFSTR("requestingService"));

  PLRunBUIQuery(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle_1();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v2;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_19EA99000, v5, OS_LOG_TYPE_DEFAULT, "Successfully generated plist with configuration %@ and result %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
  {
    PLGenerateBatteryUIPlist_cold_1(v5);
  }

  return v3 != 0;
}

BOOL PLCopyBatteryUIPlists(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = a1;
  v5 = PLConfigureBUIQueryiOS();
  objc_msgSend(v5, "setObject:forKeyedSubscript:", v4, CFSTR("requestingService"));

  objc_msgSend(v5, "setObject:forKeyedSubscript:", v3, CFSTR("plistCopyDestination"));
  PLRunBUIQuery(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle_1();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138412546;
      v11 = v5;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_19EA99000, v8, OS_LOG_TYPE_DEFAULT, "Performed successful query and copy with configuration %@ and result %@", (uint8_t *)&v10, 0x16u);
    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    PLCopyBatteryUIPlists_cold_1();
  }

  return v6 != 0;
}

__CFString *PLBatteryUsageUIStringForResponseType(unint64_t a1)
{
  __CFString *v1;

  if (a1 < 0x16 && ((0x27FFFFu >> a1) & 1) != 0)
  {
    v1 = off_1E4166670[a1];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Unknown_%lu"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

const __CFString *PLBatteryUsageUIStringForQueryRange(double a1)
{
  if (a1 == 864000.0)
    return CFSTR("10d");
  if (a1 == 604800.0)
    return CFSTR("7d");
  if (a1 == 86400.0)
    return CFSTR("24hr");
  if (a1 == 3600.0)
    return CFSTR("1hr");
  return CFSTR("UnknownRange");
}

id PLCalculateEndOfHourWithDate(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  NSObject *v6;
  NSObject *v7;
  unint64_t v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  void *v14;
  int v15;
  id v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  unint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  logHandle_1();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
    PLCalculateEndOfHourWithDate_cold_4();

  objc_msgSend(MEMORY[0x1E0C99D48], "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "components:fromDate:", 60, v1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "valueForComponent:", 32);
  logHandle_1();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    objc_msgSend(v3, "dateFromComponents:", v4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412802;
    v16 = v1;
    v17 = 2112;
    v18 = v14;
    v19 = 2048;
    v20 = v5;
    _os_log_debug_impl(&dword_19EA99000, v6, OS_LOG_TYPE_DEBUG, "Date: %@ -> %@ -> %ld", (uint8_t *)&v15, 0x20u);

  }
  logHandle_1();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    PLCalculateEndOfHourWithDate_cold_2();

  v8 = ((v5 % 3) ^ 3) + v5;
  logHandle_1();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    PLCalculateEndOfHourWithDate_cold_2();

  objc_msgSend(v4, "setValue:forComponent:", v8, 32);
  objc_msgSend(v3, "dateFromComponents:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  logHandle_1();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    PLCalculateEndOfHourWithDate_cold_1();

  logHandle_1();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v10;
    _os_log_impl(&dword_19EA99000, v12, OS_LOG_TYPE_DEFAULT, "end of hour: %@", (uint8_t *)&v15, 0xCu);
  }

  return v10;
}

id PLCalculateEndOfDayWithDate(void *a1)
{
  void *v1;
  id v2;
  void *v3;
  void *v4;
  void *v5;

  v1 = (void *)MEMORY[0x1E0C99D48];
  v2 = a1;
  objc_msgSend(v1, "currentCalendar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_opt_new();
  objc_msgSend(v4, "setHour:", 0);
  objc_msgSend(v4, "setMinute:", 0);
  objc_msgSend(v4, "setSecond:", 0);
  objc_msgSend(v3, "nextDateAfterDate:matchingComponents:options:", v2, v4, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *PLBatteryUsageUIKeyFromConfiguration(void *a1)
{
  id v1;
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  const __CFString *v11;
  __CFString *v12;
  __CFString *v13;

  v1 = a1;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("end"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "doubleValue");
  v4 = v3;
  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("start"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v7 = v4 - v6;

  objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("bucket"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "doubleValue");
  v10 = v9;

  if (v7 / v10 == 1.0)
  {
    if (v7 == 864000.0)
    {
      v12 = CFSTR("10d");
    }
    else if (v7 == 604800.0)
    {
      v12 = CFSTR("7d");
    }
    else if (v7 == 86400.0)
    {
      v12 = CFSTR("24hr");
    }
    else
    {
      v12 = CFSTR("UnknownRange");
      if (v7 == 3600.0)
        v12 = CFSTR("1hr");
    }
    v13 = v12;
  }
  else
  {
    if (v7 == 864000.0)
    {
      v11 = CFSTR("10d");
    }
    else if (v7 == 604800.0)
    {
      v11 = CFSTR("7d");
    }
    else if (v7 == 86400.0)
    {
      v11 = CFSTR("24hr");
    }
    else
    {
      v11 = CFSTR("UnknownRange");
      if (v7 == 3600.0)
        v11 = CFSTR("1hr");
    }
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%zu"), v11, (unint64_t)v10);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v13;
}

void sub_19EAB4DEC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_19EAB4ED8(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

PPSTelemetryIdentifier *pps_create_telemetry_identifier(uint64_t a1, uint64_t a2)
{
  return +[PPSClientDonation createIdentifierForSubsystem:category:](PPSClientDonation, "createIdentifierForSubsystem:category:", a1, a2);
}

id containerPath()
{
  if (containerPath_onceToken != -1)
    dispatch_once(&containerPath_onceToken, &__block_literal_global_9);
  return (id)containerPath_containerPath;
}

void __containerPath_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;

  v0 = (void *)container_create_or_lookup_system_group_paths();
  if (v0)
  {
    v1 = (void *)_CFXPCCreateCFObjectFromXPCObject();
    objc_msgSend(v1, "objectForKeyedSubscript:", CFSTR("systemgroup.com.apple.powerlog"));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)containerPath_containerPath;
    containerPath_containerPath = v2;

  }
  else
  {
    NSLog(CFSTR("Error fetching group containers for %@ : %llu"), CFSTR("com.apple.systemcontainer"), 1);
  }

}

id PLFDefaultsValueForKey()
{
  containerPath();
  return (id)_CFPreferencesCopyValueWithContainer();
}

void __didReceiveNotification_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_12(&dword_19EA99000, v0, v1, "DEBUG OUTPUT: Notification name not recognized", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void batteryUIHasNoteworthyInformation_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EA99000, log, OS_LOG_TYPE_ERROR, "invalid queryResult", v1, 2u);
}

void PLShouldLogRegisteredEvent_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "PLShouldLogRegisteredEvent: NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void PLShouldLogRegisteredEvent_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "PLShouldLogRegisteredEvent: YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void PLShouldLogEvent_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "PLShouldLogEvent: YES", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void PLShouldLogEvent_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_3(&dword_19EA99000, v0, v1, "PLShouldLogEvent: NO", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void PLMarkFileAsPurgeable_cold_1()
{
  int *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  v0 = __error();
  strerror(*v0);
  OUTLINED_FUNCTION_6_0(&dword_19EA99000, MEMORY[0x1E0C81028], v1, "Client Framework --  Failed to mark %@ purgeable - can't open error: %s", v2, v3, v4, v5, 2u);
}

void PLMarkFileAsPurgeable_cold_2(uint64_t a1, uint64_t *a2, int a3)
{
  uint64_t v5;
  int *v6;
  char *v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  __int16 v14;
  char *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = *a2;
  v6 = __error();
  v7 = strerror(*v6);
  v8 = 138413058;
  v9 = a1;
  v10 = 2048;
  v11 = v5;
  v12 = 1024;
  v13 = a3;
  v14 = 2080;
  v15 = v7;
  _os_log_error_impl(&dword_19EA99000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "Client Framework -- Failed to mark %@ purgeable - flags 0x%llx returned %d (%s)", (uint8_t *)&v8, 0x26u);
}

void PLCopyDB_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "PLCopyPowerlog sqlite replace database failed.", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void PLCopyDB_cold_2(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "PLCopyPowerlog open database src failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void PLCopyDB_cold_3(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "PLCopyPowerlog open database dst failed", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void PLResetPowerlog_cold_1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_12(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "Failed to perform powerlog reset because there is no container URL", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_7();
}

void PLResetPowerlog_cold_2()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "Unable to remove directory during powerlog reset, err: %@", v1);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_1(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "Failed to vacuum db with error %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_2()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_6_0(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "Failed to drop %@ data with error %s", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_3(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "Failed to set cache_spill %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_4(uint64_t *a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = *a1;
  v4 = 136315138;
  v5 = v3;
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], a3, "Failed to set cache_size %s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1();
}

void dropTable_cold_5()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "Failed to open database connection at path: %@", v1);
  OUTLINED_FUNCTION_1();
}

void PLSysdiagnoseCopyLogs_cold_1(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0(a1, a2, a3, 3.852e-34);
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v3, "Invalid entry in databases at index %zu", v4);
}

void copyUpgradeLogsToCrashMover_cold_1()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "PowerlogFileUtilities: failed to copy minor upgrade logs with error %@", v1);
  OUTLINED_FUNCTION_1();
}

void copyUpgradeLogsToCrashMover_cold_2(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_19EA99000, MEMORY[0x1E0C81028], v3, "PowerlogFileUtilities: successfully copied minor upgrade logs, srcPath = %@", v4);
}

void copyUpgradeLogsToCrashMover_cold_3(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v3, "PowerlogFileUtilities: failed to copy minor upgrade logs, srcPath = %@", v4);
}

void copyUpgradeLogsToCrashMover_cold_4()
{
  uint64_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v0, "PowerlogFileUtilities: failed to copy major upgrade logs with error %@", v1);
  OUTLINED_FUNCTION_1();
}

void copyUpgradeLogsToCrashMover_cold_5(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_0(&dword_19EA99000, MEMORY[0x1E0C81028], v3, "PowerlogFileUtilities: successfully copied major upgrade logs, srcPath = %@", v4);
}

void copyUpgradeLogsToCrashMover_cold_6(float *a1, uint64_t a2, _QWORD *a3)
{
  uint64_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_3_0(a1, a2, a3, 5.7779e-34);
  OUTLINED_FUNCTION_10(&dword_19EA99000, MEMORY[0x1E0C81028], v3, "PowerlogFileUtilities: failed to copy major upgrade logs, srcPath = %@", v4);
}

void PLRunBUIQuery_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_19EA99000, log, OS_LOG_TYPE_DEBUG, "\"bui_backend_iOS\" feature flag is enabled. Running query via Responder Service...", v1, 2u);
}

void PLGenerateBatteryUIPlist_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_19EA99000, log, OS_LOG_TYPE_ERROR, "Failed to generate a new BatteryUI plist", v1, 2u);
}

void PLCopyBatteryUIPlists_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_19EA99000, v0, OS_LOG_TYPE_ERROR, "Failed to copy files to %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

void PLCalculateEndOfHourWithDate_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_4();
  v3 = 2112;
  v4 = v0;
  _os_log_debug_impl(&dword_19EA99000, v1, OS_LOG_TYPE_DEBUG, "System hour bucket: %@ -> %@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

void PLCalculateEndOfHourWithDate_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "hourNum: %lu", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void PLCalculateEndOfHourWithDate_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_1_0(&dword_19EA99000, v0, v1, "calculating end of hour from %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t ADMonotonicTimeGetCurrent()
{
  return MEMORY[0x1E0CF63E0]();
}

uint64_t ADPushTimeIntervalForDistributionKeySinceStartTime()
{
  return MEMORY[0x1E0CF63E8]();
}

uint64_t AnalyticsSendEventLazy()
{
  return MEMORY[0x1E0D15428]();
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

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x1E0C98650](allocator, domain, code, userInfo);
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

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x1E0C989B8]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

CFPropertyListRef CFPreferencesCopyValue(CFStringRef key, CFStringRef applicationID, CFStringRef userName, CFStringRef hostName)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A60](key, applicationID, userName, hostName);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x1E0C98F10](theString1, theString2, compareOptions);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGIsDeviceOneOfType()
{
  return MEMORY[0x1E0DE2B90]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFPreferencesCopyValueWithContainer()
{
  return MEMORY[0x1E0C9A320]();
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

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x1E0C80C48]();
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

int chown(const char *a1, uid_t a2, gid_t a3)
{
  return MEMORY[0x1E0C82640](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

uint64_t coalition_info_resource_usage()
{
  return MEMORY[0x1E0C826A0]();
}

uint64_t container_create_or_lookup_system_group_paths()
{
  return MEMORY[0x1E0C82828]();
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C08](queue, block);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x1E0C82FC8](when, delta);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83378](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

passwd *__cdecl getpwnam(const char *a1)
{
  return (passwd *)MEMORY[0x1E0C83790](a1);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
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

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
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

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

uint64_t os_variant_is_darwinos()
{
  return MEMORY[0x1E0C84A08]();
}

uint64_t proc_listcoalitions()
{
  return MEMORY[0x1E0C84C10]();
}

unsigned int sleep(unsigned int a1)
{
  return MEMORY[0x1E0C85438](*(_QWORD *)&a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

uint64_t sqlite3_exec_b()
{
  return MEMORY[0x1E0DE87A0]();
}

int sqlite3_file_control(sqlite3 *a1, const char *zDbName, int op, void *a4)
{
  return MEMORY[0x1E0DE87C0](a1, zDbName, *(_QWORD *)&op, a4);
}

void sqlite3_free(void *a1)
{
  MEMORY[0x1E0DE87D0](a1);
}

int sqlite3_open(const char *filename, sqlite3 **ppDb)
{
  return MEMORY[0x1E0DE8868](filename, ppDb);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

uint64_t xpc_coalition_copy_info()
{
  return MEMORY[0x1E0C85F48]();
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x1E0C85F50](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x1E0C86008](connection);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x1E0C86048](connection, message);
}

uint64_t xpc_connection_send_notification()
{
  return MEMORY[0x1E0C86058]();
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

uint64_t xpc_connection_set_target_user_session_uid()
{
  return MEMORY[0x1E0C860D8]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x1E0C862E0](xdict, key);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}

uint64_t xpc_strerror()
{
  return MEMORY[0x1E0C86710]();
}

uint64_t xpc_user_sessions_enabled()
{
  return MEMORY[0x1E0C867C8]();
}

uint64_t xpc_user_sessions_get_foreground_uid()
{
  return MEMORY[0x1E0C867D0]();
}

