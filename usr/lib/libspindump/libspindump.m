void OUTLINED_FUNCTION_6(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

void OUTLINED_FUNCTION_5(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x20u);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_2(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

uint64_t SPHIDResponseDelayThreshold()
{
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1)
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global_33);
  return SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
}

void SPExpectedHIDResponseDelayUntil(unint64_t a1)
{
  uint64_t v2;

  v2 = mach_absolute_time();
  if (v2 >= a1)
  {
    MachToNano(v2 - a1);
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      SPExpectedHIDResponseDelayUntil_cold_4();
    goto LABEL_11;
  }
  if ((double)(unint64_t)MachToNano(a1 - v2) / 1000000000.0 <= 2.0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      SPExpectedHIDResponseDelayUntil_cold_2();
LABEL_11:
    if (gExpectedHIDResponseDelayEndMachAbs >= a1)
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        SPExpectedHIDResponseDelayUntil_cold_1(a1);
    }
    else
    {
      gExpectedHIDResponseDelayEndMachAbs = a1;
    }
    return;
  }
  if (libspindump_log_onceToken != -1)
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
    SPExpectedHIDResponseDelayUntil_cold_3();
}

char *SPPauseMonitoringHIDResponsiveness(const char *a1)
{
  uint64_t v2;
  size_t v3;
  char *v4;
  int v5;
  NSObject *v6;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (!a1)
    SPPauseMonitoringHIDResponsiveness_cold_1((char **)&v8);
  v2 = mach_absolute_time();
  v3 = strlen(a1);
  v4 = (char *)malloc_type_malloc(v3 + 9, 0xA2AF50B9uLL);
  *(_QWORD *)v4 = v2;
  strlcpy(v4 + 8, a1, v3 + 1);
  os_unfair_lock_lock(&gPauseReceiptLock);
  v5 = gNumPauseReceipts;
  if (!gNumPauseReceipts)
    gEarliestPauseMachAbs = v2;
  ++gNumPauseReceipts;
  gPauseReceipts = (uint64_t)malloc_type_realloc((void *)gPauseReceipts, 8 * (v5 + 1), 0x2004093837F09uLL);
  *(_QWORD *)(gPauseReceipts + 8 * gNumPauseReceipts - 8) = v4;
  os_unfair_lock_unlock(&gPauseReceiptLock);
  if (libspindump_log_onceToken != -1)
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
  v6 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 136446210;
    v9 = a1;
    _os_log_impl(&dword_20AE33000, v6, OS_LOG_TYPE_DEFAULT, "Pausing HID responsiveness monitoring for \"%{public}s\"", (uint8_t *)&v8, 0xCu);
  }
  return v4;
}

void SPResumeMonitoringHIDResponsiveness(uint64_t *a1)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  size_t v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;

  if (!a1)
    SPResumeMonitoringHIDResponsiveness_cold_1(&v8);
  v2 = mach_absolute_time();
  os_unfair_lock_lock(&gPauseReceiptLock);
  v3 = gNumPauseReceipts;
  if (gNumPauseReceipts < 1)
LABEL_6:
    SPResumeMonitoringHIDResponsiveness_cold_5(&v8);
  v4 = 0;
  v5 = 8 * (gNumPauseReceipts - 1);
  while (*(uint64_t **)(gPauseReceipts + 8 * v4) != a1)
  {
    ++v4;
    v5 -= 8;
    if (gNumPauseReceipts == v4)
      goto LABEL_6;
  }
  if (gNumPauseReceipts - 1 > (int)v4)
  {
    memmove((void *)(gPauseReceipts + 8 * v4), (const void *)(gPauseReceipts + 8 * v4 + 8), v5);
    v3 = gNumPauseReceipts;
  }
  gNumPauseReceipts = v3 - 1;
  if (v3 == 1)
  {
    free((void *)gPauseReceipts);
    gPauseReceipts = 0;
    if (gEarliestPauseMachAbs == *a1)
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v7 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        SPResumeMonitoringHIDResponsiveness_cold_2(a1, v2, v7);
    }
    else
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        SPResumeMonitoringHIDResponsiveness_cold_3(a1, v2);
    }
    gTimeMonitoringLastResumed = v2;
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v6 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      SPResumeMonitoringHIDResponsiveness_cold_4(a1, v2, v6);
  }
  os_unfair_lock_unlock(&gPauseReceiptLock);
  free(a1);
}

void SPCheckHIDResponseTime(unint64_t a1, unint64_t a2, uint64_t a3)
{
  uint64_t v6;
  uint64_t v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  dispatch_time_t v19;
  NSObject *global_queue;
  NSObject *v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  uint64_t v26;
  double v27;
  uint64_t v28;
  const char *v29;
  NSObject *v30;
  uint32_t v31;
  uint64_t v32;
  uint64_t v33;
  unint64_t v34;
  double v35;
  NSObject *v36;
  uint64_t v37;
  _xpc_connection_s *v38;
  xpc_object_t empty;
  void *v40;
  char *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  uint64_t v45;
  double v46;
  uint64_t v47;
  double v48;
  uint64_t v49;
  double v50;
  uint64_t v51;
  uint64_t v52;
  uint8_t buf[4];
  double v54;
  __int16 v55;
  unint64_t v56;
  __int16 v57;
  unint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  double v62;
  uint64_t v63;

  v63 = *MEMORY[0x24BDAC8D0];
  if (SPHIDResponseDelayThresholdMachAbs_onceToken != -1)
    dispatch_once(&SPHIDResponseDelayThresholdMachAbs_onceToken, &__block_literal_global_33);
  if (a1 - 1 >= a2)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v11 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      SPCheckHIDResponseTime_cold_6(a1, a2, v11);
    return;
  }
  v6 = SPHIDResponseDelayThresholdMachAbs_thresholdMachAbs;
  if (gNumPauseReceipts >= 1)
  {
    os_unfair_lock_lock(&gPauseReceiptLock);
    if (gNumPauseReceipts)
      SPCheckHIDResponseTime_cold_5((char **)buf, gNumPauseReceipts);
    os_unfair_lock_unlock(&gPauseReceiptLock);
  }
  v7 = a2 - a1;
  v8 = a2 - a1 >= v6;
  if (gExpectedHIDResponseDelayEndMachAbs <= (unint64_t)gTimeMonitoringLastResumed)
    v9 = gTimeMonitoringLastResumed;
  else
    v9 = gExpectedHIDResponseDelayEndMachAbs;
  if (v9 <= a1)
  {
    v9 = 0;
    goto LABEL_29;
  }
  if (v9 + v6 > a2)
  {
    if (v7 >= v6)
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v10 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        v54 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        v55 = 2048;
        v56 = a1;
        v57 = 2048;
        v58 = a2;
        v59 = 2048;
        v60 = v9;
        v61 = 2048;
        v62 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
        _os_log_debug_impl(&dword_20AE33000, v10, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to expected unresponsiveness until %llu (%.2fs reportable)", buf, 0x34u);
      }
    }
    goto LABEL_28;
  }
  if (v7 < v6)
  {
LABEL_28:
    v8 = 0;
    goto LABEL_29;
  }
  if (libspindump_log_onceToken != -1)
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
  v12 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134219008;
    v54 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
    v55 = 2048;
    v56 = a1;
    v57 = 2048;
    v58 = a2;
    v59 = 2048;
    v60 = v9;
    v61 = 2048;
    v62 = (double)(unint64_t)MachToNano(a2 - v9) / 1000000000.0;
    _os_log_debug_impl(&dword_20AE33000, v12, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu with expected unresponsiveness until %llu still worth reporting (%.2fs reportable)", buf, 0x34u);
  }
  v8 = 1;
LABEL_29:
  if (a1 < a3)
  {
    if (v6 + a3 <= a2)
    {
      if (v8)
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        v14 = libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          v48 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
          v49 = MachToNano(a2 - a3);
          *(_DWORD *)buf = 134219008;
          v54 = v48;
          v55 = 2048;
          v56 = a1;
          v57 = 2048;
          v58 = a2;
          v59 = 2048;
          v60 = a3;
          v61 = 2048;
          v62 = (double)(unint64_t)v49 / 1000000000.0;
          _os_log_debug_impl(&dword_20AE33000, v14, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu out-of-order (latest event %llu) still worth reporting (%.2fs reportable)", buf, 0x34u);
        }
        v8 = 1;
      }
    }
    else if (v8)
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v13 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        v46 = (double)(unint64_t)MachToNano(a2 - a1) / 1000000000.0;
        v47 = MachToNano(a2 - a3);
        *(_DWORD *)buf = 134219008;
        v54 = v46;
        v55 = 2048;
        v56 = a1;
        v57 = 2048;
        v58 = a2;
        v59 = 2048;
        v60 = a3;
        v61 = 2048;
        v62 = (double)(unint64_t)v47 / 1000000000.0;
        _os_log_debug_impl(&dword_20AE33000, v13, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to out-of-order HID processing (latest event %llu, %.2fs reportable)", buf, 0x34u);
      }
      v8 = 0;
    }
    if (v9 <= a3)
      v9 = a3;
  }
  if (MEMORY[0x24BE1A1E0])
  {
    if (v9 <= a1)
      v15 = a1;
    else
      v15 = v9;
    if (v15 <= SPCheckHIDResponseTime_lastTelemetryHIDEventEndTimestamp_MachAbs)
      v15 = SPCheckHIDResponseTime_lastTelemetryHIDEventEndTimestamp_MachAbs;
    if (SPCheckHIDResponseTime_lastTelemetryHIDEventEndTimestamp_MachAbs < a2)
      SPCheckHIDResponseTime_lastTelemetryHIDEventEndTimestamp_MachAbs = a2;
    v16 = a2 - v15;
    if (a2 > v15)
    {
      do
        v17 = __ldxr(&gNumHIDEvents);
      while (__stxr(v17 + 1, &gNumHIDEvents));
      do
        v18 = __ldxr(&gDurationHandlingHIDEvents_MachAbs);
      while (__stxr(v18 + v16, &gDurationHandlingHIDEvents_MachAbs));
      if (!v17)
      {
        v19 = dispatch_time(0, 10000000000);
        global_queue = dispatch_get_global_queue(9, 0);
        dispatch_after(v19, global_queue, &__block_literal_global);
      }
    }
  }
  if (v8)
  {
    if (SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs > a1)
    {
      if (SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs + v6 > a2)
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        v21 = libspindump_log_logt;
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
        {
          v22 = (double)(unint64_t)MachToNano(a2 - a3) / 1000000000.0;
          v23 = SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs;
          v24 = MachToNano(a2 - SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs);
          *(_DWORD *)buf = 134219008;
          v54 = v22;
          v55 = 2048;
          v56 = a1;
          v57 = 2048;
          v58 = a2;
          v59 = 2048;
          v60 = v23;
          v61 = 2048;
          v62 = (double)(unint64_t)v24 / 1000000000.0;
          _os_log_debug_impl(&dword_20AE33000, v21, OS_LOG_TYPE_DEBUG, "Not reporting %.2fs HID response delay %llu-%llu due to previously reported HID response delay at %llu (%.2fs reportable)", buf, 0x34u);
        }
        return;
      }
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v25 = libspindump_log_logt;
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEBUG))
      {
        v50 = (double)(unint64_t)MachToNano(a2 - a3) / 1000000000.0;
        v51 = SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs;
        v52 = MachToNano(a2 - SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs);
        *(_DWORD *)buf = 134219008;
        v54 = v50;
        v55 = 2048;
        v56 = a1;
        v57 = 2048;
        v58 = a2;
        v59 = 2048;
        v60 = v51;
        v61 = 2048;
        v62 = (double)(unint64_t)v52 / 1000000000.0;
        _os_log_debug_impl(&dword_20AE33000, v25, OS_LOG_TYPE_DEBUG, "%.2fs HID response delay %llu-%llu overlapping previously reported HID response delay at %llu still worth reporting (%.2fs reportable)", buf, 0x34u);
      }
      if (v9 <= SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs)
        v9 = SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs;
    }
    SPCheckHIDResponseTime_lastReportedHIDEventEndTimestamp_MachAbs = a2;
    if (v9 <= a1)
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v32 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO))
        goto LABEL_81;
      v33 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134218496;
      v54 = (double)(unint64_t)v33 / 1000000000.0;
      v55 = 2048;
      v56 = a1;
      v57 = 2048;
      v58 = a2;
      v29 = "Reporting %.2fs HID response delay %llu-%llu";
      v30 = v32;
      v31 = 32;
    }
    else
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      v26 = libspindump_log_logt;
      if (!os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_INFO))
        goto LABEL_81;
      v27 = (double)(unint64_t)MachToNano(v9 - a1) / 1000000000.0;
      v28 = MachToNano(a2 - a1);
      *(_DWORD *)buf = 134219008;
      v54 = v27;
      v55 = 2048;
      v56 = a1;
      v57 = 2048;
      v58 = a2;
      v59 = 2048;
      v60 = v9;
      v61 = 2048;
      v62 = (double)(unint64_t)v28 / 1000000000.0;
      v29 = "Reporting %.2fs HID response delay %llu-%llu with start time capped to %llu (%.2fs original)";
      v30 = v26;
      v31 = 52;
    }
    _os_log_impl(&dword_20AE33000, v30, OS_LOG_TYPE_INFO, v29, buf, v31);
LABEL_81:
    mach_get_times();
    if (v9 <= a1)
      v34 = a1;
    else
      v34 = v9;
    v35 = *(double *)&v34;
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v36 = libspindump_log_logt;
    if (os_signpost_enabled((os_log_t)libspindump_log_logt))
    {
      *(_DWORD *)buf = 134349312;
      v54 = v35;
      v55 = 2050;
      v56 = a2;
      _os_signpost_emit_with_name_impl(&dword_20AE33000, v36, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SlowHIDResponse", "%{public, signpost.description:begin_time}llu %{public, signpost.description:end_time}llu", buf, 0x16u);
    }
    kdebug_trace();
    v37 = spindump_connection();
    if (v37)
    {
      v38 = (_xpc_connection_s *)v37;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v40 = empty;
        xpc_dictionary_set_int64(empty, "message", 8);
        xpc_dictionary_set_uint64(v40, "eventtime_machabs", a1);
        if (v9 > a1)
          xpc_dictionary_set_uint64(v40, "starttime_machabs", v9);
        xpc_dictionary_set_uint64(v40, "endtime_machabs", a2);
        xpc_dictionary_set_uint64(v40, "threshold_machabs", v6);
        *(_DWORD *)buf = 0;
        if (_NSGetExecutablePath(0, (uint32_t *)buf))
        {
          if ((*(_DWORD *)buf - 1) >> 30)
          {
            if (libspindump_log_onceToken != -1)
              dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
            v44 = libspindump_log_logt;
            if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
              SPCheckHIDResponseTime_cold_4((int *)buf, v44, v45);
          }
          else
          {
            v41 = (char *)malloc_type_malloc(*(unsigned int *)buf, 0x6778EA80uLL);
            if (_NSGetExecutablePath(v41, (uint32_t *)buf))
            {
              if (libspindump_log_onceToken != -1)
                dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
              v42 = libspindump_log_logt;
              if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
                SPCheckHIDResponseTime_cold_3((int *)buf, v42, v43);
            }
            else
            {
              xpc_dictionary_set_string(v40, "pname", v41);
            }
            free(v41);
          }
        }
        else
        {
          if (libspindump_log_onceToken != -1)
            dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
          if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
            SPCheckHIDResponseTime_cold_2();
        }
        xpc_connection_send_message(v38, v40);
        xpc_release(v40);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

uint64_t spindump_connection()
{
  if (spindump_connection_once != -1)
    dispatch_once(&spindump_connection_once, &__block_literal_global_48);
  if (!spindump_connection_connection)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
      spindump_connection_cold_1();
  }
  return spindump_connection_connection;
}

void SPReportHIDResponseDelay(unint64_t a1, unint64_t a2)
{
  SPCheckHIDResponseTime(a1, a2, 0);
}

void SPGenerateSpindump(unsigned int a1, uint64_t a2, unint64_t a3, unint64_t a4, uint64_t a5, const char *a6, const char *a7, const char *a8, const void *a9)
{
  NSObject *v16;
  uint64_t v17;
  xpc_object_t empty;
  void *v19;
  char *v20;
  void *v21;
  NSObject *global_queue;
  int v23;
  NSObject *v24;
  _xpc_connection_s *connection;
  _QWORD block[5];
  int v28;
  _QWORD handler[5];
  uint8_t buf[4];
  _DWORD *v31;
  __int16 v32;
  unsigned int v33;
  __int16 v34;
  const char *v35;
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  if (libspindump_log_onceToken != -1)
    dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
  v16 = libspindump_log_logt;
  if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136446722;
    v31 = procname_btd(a1);
    v32 = 1024;
    v33 = a1;
    v34 = 2080;
    v35 = a6;
    _os_log_impl(&dword_20AE33000, v16, OS_LOG_TYPE_DEFAULT, "Requesting spindump to be generated for %{public}s [%d] due to %s", buf, 0x1Cu);
  }
  v17 = spindump_connection();
  if (v17)
  {
    connection = (_xpc_connection_s *)v17;
    empty = xpc_dictionary_create_empty();
    if (empty)
    {
      v19 = empty;
      xpc_dictionary_set_int64(empty, "message", 9);
      if ((a1 & 0x80000000) == 0)
        xpc_dictionary_set_int64(v19, "pid", a1);
      if (a2)
        xpc_dictionary_set_uint64(v19, "tid", a2);
      if (a3)
        xpc_dictionary_set_double(v19, "duration", (double)a3 / 1000.0);
      if (a4)
        xpc_dictionary_set_double(v19, "interval", (double)a4 / 1000000.0);
      if (a5)
        xpc_dictionary_set_uint64(v19, "flags", a5);
      if (a6)
        xpc_dictionary_set_string(v19, "reason", a6);
      if (a8)
        xpc_dictionary_set_string(v19, "filename", a8);
      if (a7)
      {
        if (strnlen(a7, 0x100uLL) <= 0xFF)
        {
          xpc_dictionary_set_string(v19, "signature", a7);
          if (a9)
            goto LABEL_26;
          goto LABEL_36;
        }
        v20 = (char *)malloc_type_malloc(0x100uLL, 0xF9F771E4uLL);
        __strlcpy_chk();
        xpc_dictionary_set_string(v19, "signature", v20);
        if (v20)
          free(v20);
      }
      if (a9)
      {
LABEL_26:
        xpc_dictionary_set_BOOL(v19, "callback", 1);
        v21 = _Block_copy(a9);
        global_queue = dispatch_get_global_queue(0, 0);
        handler[0] = MEMORY[0x24BDAC760];
        handler[1] = 3221225472;
        handler[2] = __SPGenerateSpindump_block_invoke;
        handler[3] = &unk_24C3D4280;
        handler[4] = v21;
        xpc_connection_send_message_with_reply(connection, v19, global_queue, handler);
LABEL_37:
        xpc_release(v19);
        return;
      }
LABEL_36:
      xpc_connection_send_message(connection, v19);
      goto LABEL_37;
    }
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
      SPCheckHIDResponseTime_cold_1();
    v23 = 12;
    if (a9)
    {
LABEL_34:
      v24 = dispatch_get_global_queue(0, 0);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __SPGenerateSpindump_block_invoke_2;
      block[3] = &unk_24C3D42A8;
      block[4] = a9;
      v28 = v23;
      dispatch_async(v24, block);
    }
  }
  else
  {
    v23 = 2;
    if (a9)
      goto LABEL_34;
  }
}

_DWORD *procname_btd(int pid)
{
  _DWORD *v2;
  unsigned int v3;
  BOOL v4;
  int v5;
  int v6;

  if (procname_btd_onceToken != -1)
    dispatch_once(&procname_btd_onceToken, &__block_literal_global_51);
  if ((procname_btd_avoid_proc_name & 1) != 0)
    return 0;
  do
    v3 = __ldxr((unsigned int *)&procname_btd_index);
  while (__stxr(v3 + 1, (unsigned int *)&procname_btd_index));
  v4 = (-v3 & 0x80000000) != 0;
  v5 = -v3 & 3;
  v6 = v3 & 3;
  if (!v4)
    v6 = -v5;
  v2 = (_DWORD *)((char *)&procname_btd_names + 128 * (uint64_t)v6);
  *v2 = 0;
  proc_name(pid, v2, 0x80u);
  return v2;
}

void SPReportCPUUsageResource(int a1, const char *a2, uint64_t a3, uint64_t a4, const char *a5, unint64_t a6, unint64_t a7, uint64_t a8, uint64_t a9, unint64_t a10, uint64_t a11, uint64_t a12)
{
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  _xpc_connection_s *v22;
  xpc_object_t empty;
  void *v24;
  int v25;
  const char *v26;
  __int16 v27;
  _DWORD *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  double v34;
  __int16 v35;
  double v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      SPReportCPUUsageResource_cold_1();
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v19 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a4 & 1) != 0)
        v20 = "fatal ";
      else
        v20 = (const char *)&unk_20AE38C1E;
      v25 = 136447490;
      v26 = v20;
      v27 = 2082;
      v28 = procname_btd(a1);
      v29 = 1024;
      v30 = a1;
      v31 = 2048;
      v32 = a3;
      v33 = 2048;
      v34 = (double)a6 / 1000000000.0;
      v35 = 2048;
      v36 = (double)a7 / 1000000000.0;
      _os_log_impl(&dword_20AE33000, v19, OS_LOG_TYPE_DEFAULT, "Reporting %{public}scpu usage for %{public}s [%d] thread %#llx using %.0fs cpu over the last %.0f seconds", (uint8_t *)&v25, 0x3Au);
    }
    v21 = spindump_connection();
    if (v21)
    {
      v22 = (_xpc_connection_s *)v21;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v24 = empty;
        xpc_dictionary_set_int64(empty, "message", 3);
        xpc_dictionary_set_int64(v24, "pid", a1);
        if (a2)
          xpc_dictionary_set_string(v24, "pname", a2);
        if (a3)
          xpc_dictionary_set_uint64(v24, "tid", a3);
        if (a4)
          xpc_dictionary_set_uint64(v24, "flags", a4);
        if (a5)
          xpc_dictionary_set_string(v24, "action", a5);
        xpc_dictionary_set_double(v24, "cpu", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v24, "duration", (double)a7 / 1000000000.0);
        xpc_dictionary_set_double(v24, "endtime", (double)a10 / 1000000000.0 + (double)a9 - *MEMORY[0x24BDBD238]);
        if (a11 >= 1 && a12 >= 1)
        {
          xpc_dictionary_set_double(v24, "cpu_limit", (double)(unint64_t)a11 / 1000000000.0);
          xpc_dictionary_set_double(v24, "duration_limit", (double)(unint64_t)a12 / 1000000000.0);
        }
        xpc_connection_send_message(v22, v24);
        xpc_release(v24);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

void SPReportDiskWritesResource(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, unint64_t a6, uint64_t a7, unint64_t a8, int64_t a9, unint64_t a10)
{
  NSObject *v17;
  const char *v18;
  uint64_t v19;
  _xpc_connection_s *v20;
  xpc_object_t empty;
  void *v22;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  _DWORD *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int64_t v31;
  __int16 v32;
  double v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      SPReportDiskWritesResource_cold_1();
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v17 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a3 & 1) != 0)
        v18 = "fatal ";
      else
        v18 = (const char *)&unk_20AE38C1E;
      *(_DWORD *)buf = 136447234;
      v25 = v18;
      v26 = 2082;
      v27 = procname_btd(a1);
      v28 = 1024;
      v29 = a1;
      v30 = 2048;
      v31 = a5;
      v32 = 2048;
      v33 = (double)a6 / 1000000000.0;
      _os_log_impl(&dword_20AE33000, v17, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sdisk writes for %{public}s [%d] causing %{bytes}lld writes over the last %.0f seconds", buf, 0x30u);
    }
    v19 = spindump_connection();
    if (v19)
    {
      v20 = (_xpc_connection_s *)v19;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v22 = empty;
        xpc_dictionary_set_int64(empty, "message", 5);
        xpc_dictionary_set_int64(v22, "pid", a1);
        if (a2)
          xpc_dictionary_set_string(v22, "pname", a2);
        if (a3)
          xpc_dictionary_set_uint64(v22, "flags", a3);
        if (a4)
          xpc_dictionary_set_string(v22, "action", a4);
        xpc_dictionary_set_int64(v22, "io", a5);
        xpc_dictionary_set_double(v22, "duration", (double)a6 / 1000000000.0);
        xpc_dictionary_set_double(v22, "endtime", (double)a8 / 1000000000.0 + (double)a7 - *MEMORY[0x24BDBD238]);
        if (a9)
        {
          if (a10)
          {
            xpc_dictionary_set_int64(v22, "io_limit", a9);
            xpc_dictionary_set_double(v22, "duration_limit", (double)a10 / 1000000000.0);
          }
        }
        xpc_connection_send_message(v20, v22);
        xpc_release(v22);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

void SPReportFileDescriptorExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
  _SPReportFileDescriptorExhaustion(a1, a2, a3, a4, a5, a6, 0);
}

void _SPReportFileDescriptorExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  xpc_object_t empty;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  _DWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      _SPReportFileDescriptorExhaustion_cold_1();
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE)
        v15 = (const char *)&unk_20AE38C1E;
      else
        v15 = "fatal ";
      v20 = 136446978;
      v21 = v15;
      v22 = 2082;
      v23 = procname_btd(a1);
      v24 = 1024;
      v25 = a1;
      v26 = 2048;
      v27 = a5;
      _os_log_impl(&dword_20AE33000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sfile descriptor exhaustion for %{public}s [%d] at %lld file descriptors", (uint8_t *)&v20, 0x26u);
    }
    v16 = spindump_connection();
    if (v16)
    {
      v17 = (_xpc_connection_s *)v16;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 11);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2)
          xpc_dictionary_set_string(v19, "pname", a2);
        if (a3)
          xpc_dictionary_set_uint64(v19, "flags", a3);
        if (a4)
          xpc_dictionary_set_string(v19, "action", a4);
        xpc_dictionary_set_int64(v19, "num_fds", a5);
        if (a6 >= 1)
          xpc_dictionary_set_int64(v19, "num_fds_limit", a6);
        if ((a7 - 1) <= 0xFFFFFFFD)
          xpc_dictionary_set_mach_send();
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

void SPReportPortExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
  _SPReportPortExhaustion(a1, a2, a3, a4, a5, a6, 0);
}

void _SPReportPortExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  xpc_object_t empty;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  _DWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      _SPReportPortExhaustion_cold_1();
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE)
        v15 = (const char *)&unk_20AE38C1E;
      else
        v15 = "fatal ";
      v20 = 136446978;
      v21 = v15;
      v22 = 2082;
      v23 = procname_btd(a1);
      v24 = 1024;
      v25 = a1;
      v26 = 2048;
      v27 = a5;
      _os_log_impl(&dword_20AE33000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}sport exhaustion for %{public}s [%d] at %lld ports", (uint8_t *)&v20, 0x26u);
    }
    v16 = spindump_connection();
    if (v16)
    {
      v17 = (_xpc_connection_s *)v16;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 12);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2)
          xpc_dictionary_set_string(v19, "pname", a2);
        if (a3)
          xpc_dictionary_set_uint64(v19, "flags", a3);
        if (a4)
          xpc_dictionary_set_string(v19, "action", a4);
        xpc_dictionary_set_int64(v19, "num_ports", a5);
        if (a6 >= 1)
          xpc_dictionary_set_int64(v19, "num_ports_limit", a6);
        if ((a7 - 1) <= 0xFFFFFFFD)
          xpc_dictionary_set_mach_send();
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

void SPReportKQWorkLoopExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6)
{
  _SPReportKQWorkLoopExhaustion(a1, a2, a3, a4, a5, a6, 0);
}

void _SPReportKQWorkLoopExhaustion(int a1, const char *a2, uint64_t a3, const char *a4, int64_t a5, int64_t a6, int a7)
{
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  _xpc_connection_s *v17;
  xpc_object_t empty;
  void *v19;
  int v20;
  const char *v21;
  __int16 v22;
  _DWORD *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (a1 <= 0)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      _SPReportKQWorkLoopExhaustion_cold_1();
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v14 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_DEFAULT))
    {
      if ((a7 - 1) >= 0xFFFFFFFE)
        v15 = (const char *)&unk_20AE38C1E;
      else
        v15 = "fatal ";
      v20 = 136446978;
      v21 = v15;
      v22 = 2082;
      v23 = procname_btd(a1);
      v24 = 1024;
      v25 = a1;
      v26 = 2048;
      v27 = a5;
      _os_log_impl(&dword_20AE33000, v14, OS_LOG_TYPE_DEFAULT, "Reporting %{public}skqworkloop exhaustion for %{public}s [%d] at %lld kqworkloops", (uint8_t *)&v20, 0x26u);
    }
    v16 = spindump_connection();
    if (v16)
    {
      v17 = (_xpc_connection_s *)v16;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v19 = empty;
        xpc_dictionary_set_int64(empty, "message", 14);
        xpc_dictionary_set_int64(v19, "pid", a1);
        if (a2)
          xpc_dictionary_set_string(v19, "pname", a2);
        if (a3)
          xpc_dictionary_set_uint64(v19, "flags", a3);
        if (a4)
          xpc_dictionary_set_string(v19, "action", a4);
        xpc_dictionary_set_int64(v19, "num_kqworkloops", a5);
        if (a6 >= 1)
          xpc_dictionary_set_int64(v19, "num_kqworkloops_limit", a6);
        if ((a7 - 1) <= 0xFFFFFFFD)
          xpc_dictionary_set_mach_send();
        xpc_connection_send_message(v17, v19);
        xpc_release(v19);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
  }
}

void SPReportWorkflowResponsivenessDelay(const char *a1)
{
  uint64_t v2;
  _xpc_connection_s *v3;
  xpc_object_t empty;
  void *v5;

  if (a1)
  {
    v2 = spindump_connection();
    if (v2)
    {
      v3 = (_xpc_connection_s *)v2;
      empty = xpc_dictionary_create_empty();
      if (empty)
      {
        v5 = empty;
        xpc_dictionary_set_int64(empty, "message", 13);
        xpc_dictionary_set_string(v5, "filename", a1);
        xpc_connection_send_message(v3, v5);
        xpc_release(v5);
      }
      else
      {
        if (libspindump_log_onceToken != -1)
          dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
        if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
          SPCheckHIDResponseTime_cold_1();
      }
    }
    else
    {
      if (libspindump_log_onceToken != -1)
        dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
      if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
        SPReportWorkflowResponsivenessDelay_cold_2();
    }
  }
  else
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_FAULT))
      SPReportWorkflowResponsivenessDelay_cold_1();
  }
}

uint64_t NanoToMach(uint64_t a1)
{
  BOOL v2;

  if (MachTimebase_onceToken != -1)
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_35);
  if ((_DWORD)MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if ((_DWORD)MachTimebase_info)
      v2 = HIDWORD(MachTimebase_info) == 0;
    else
      v2 = 1;
    if (v2)
      return 0;
    else
      return __udivti3();
  }
  return a1;
}

uint64_t MachToNano(uint64_t a1)
{
  BOOL v2;

  if (MachTimebase_onceToken != -1)
    dispatch_once(&MachTimebase_onceToken, &__block_literal_global_35);
  if ((_DWORD)MachTimebase_info != HIDWORD(MachTimebase_info))
  {
    if ((_DWORD)MachTimebase_info)
      v2 = HIDWORD(MachTimebase_info) == 0;
    else
      v2 = 1;
    if (v2)
      return 0;
    else
      return __udivti3();
  }
  return a1;
}

os_log_t __libspindump_log_block_invoke()
{
  os_log_t result;

  result = os_log_create("com.apple.libspindump", "logging");
  libspindump_log_logt = (uint64_t)result;
  if (!result)
    __libspindump_log_block_invoke_cold_1();
  return result;
}

void __spindump_connection_block_invoke()
{
  _xpc_connection_s *mach_service;

  mach_service = xpc_connection_create_mach_service("com.apple.spindump", 0, 2uLL);
  spindump_connection_connection = (uint64_t)mach_service;
  if (mach_service)
  {
    xpc_connection_set_event_handler(mach_service, &__block_literal_global_50);
    xpc_connection_resume((xpc_connection_t)spindump_connection_connection);
  }
}

void __spindump_connection_block_invoke_2(uint64_t a1, void *a2)
{
  NSObject *v5;

  if (MEMORY[0x20BD32A44](a2) == MEMORY[0x24BDACFB8]
    && a2 != (void *)MEMORY[0x24BDACF30]
    && a2 != (void *)MEMORY[0x24BDACF48])
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v5 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
      __spindump_connection_block_invoke_2_cold_1(a2, v5);
  }
}

void __procname_btd_block_invoke()
{
  int v0;
  char v1;
  NSObject *v2;

  getpid();
  v0 = sandbox_check();
  if (v0 == -1)
  {
    if (libspindump_log_onceToken != -1)
      dispatch_once(&libspindump_log_onceToken, &__block_literal_global_36);
    v2 = libspindump_log_logt;
    if (os_log_type_enabled((os_log_t)libspindump_log_logt, OS_LOG_TYPE_ERROR))
      __procname_btd_block_invoke_cold_1(v2);
    goto LABEL_9;
  }
  if (!v0)
  {
LABEL_9:
    v1 = 0;
    goto LABEL_10;
  }
  if (v0 != 1)
    return;
  v1 = 1;
LABEL_10:
  procname_btd_avoid_proc_name = v1;
}

void OUTLINED_FUNCTION_7(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

uint64_t OUTLINED_FUNCTION_10@<X0>(uint64_t a1@<X1>, uint64_t a2@<X8>)
{
  return MachToNano(a1 - a2);
}

void SPExpectedHIDResponseDelayUntil_cold_1(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  MachToNano(gExpectedHIDResponseDelayEndMachAbs - a1);
  OUTLINED_FUNCTION_5(&dword_20AE33000, v1, v2, "Expected HID response delay before existing expected HID response delay by %.2fs (%llu vs %llu), not updating", v3, v4, v5, v6, 0);
}

void SPExpectedHIDResponseDelayUntil_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_20AE33000, v0, v1, "Expected HID response delay for the next %.2fs (%llu)", v2);
  OUTLINED_FUNCTION_9();
}

void SPExpectedHIDResponseDelayUntil_cold_3()
{
  __int16 v0;
  os_log_t v1;
  uint8_t v2[22];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  v3 = v0;
  v4 = 0x4000000000000000;
  _os_log_fault_impl(&dword_20AE33000, v1, OS_LOG_TYPE_FAULT, "Expected HID response delay for the next %.2fs (%llu is more than %.2fs in the future", v2, 0x20u);
  OUTLINED_FUNCTION_8();
}

void SPExpectedHIDResponseDelayUntil_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_7(&dword_20AE33000, v0, v1, "Expected HID response delay until %.2fs ago (%llu)", v2);
  OUTLINED_FUNCTION_9();
}

void SPPauseMonitoringHIDResponsiveness_cold_1(char **a1)
{
  *a1 = 0;
  asprintf(a1, "No reason string provided");
  qword_25462BD08 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_1(char **a1)
{
  *a1 = 0;
  asprintf(a1, "No receipt provided");
  qword_25462BD08 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPResumeMonitoringHIDResponsiveness_cold_2(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t *v8;
  __int16 v9;
  double v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1 + 1;
  v5 = OUTLINED_FUNCTION_10(a2, *a1);
  v7 = 136446466;
  v8 = v4;
  v9 = 2048;
  v10 = (double)(unint64_t)v5 / 1000000000.0;
  OUTLINED_FUNCTION_7(&dword_20AE33000, a3, v6, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs", (uint8_t *)&v7);
  OUTLINED_FUNCTION_8();
}

void SPResumeMonitoringHIDResponsiveness_cold_3(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  OUTLINED_FUNCTION_10(a2, *a1);
  MachToNano(a2 - gEarliestPauseMachAbs);
  OUTLINED_FUNCTION_5(&dword_20AE33000, v3, v4, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs, was paused for %.2fs total", v5, v6, v7, v8, 2u);
}

void SPResumeMonitoringHIDResponsiveness_cold_4(uint64_t *a1, uint64_t a2, NSObject *a3)
{
  uint64_t *v4;
  uint64_t v5;
  int v6;
  uint64_t *v7;
  __int16 v8;
  double v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a1 + 1;
  v5 = OUTLINED_FUNCTION_10(a2, *a1);
  v6 = 136446722;
  v7 = v4;
  v8 = 2048;
  v9 = (double)(unint64_t)v5 / 1000000000.0;
  v10 = 1024;
  v11 = gNumPauseReceipts;
  _os_log_debug_impl(&dword_20AE33000, a3, OS_LOG_TYPE_DEBUG, "Resuming HID responsiveness monitoring for \"%{public}s\" after %.2fs, still waiting on %d others", (uint8_t *)&v6, 0x1Cu);
}

void SPResumeMonitoringHIDResponsiveness_cold_5(char **a1)
{
  *a1 = 0;
  asprintf(a1, "Receipt passed to SPResumeMonitoringHIDResponsiveness does not match any live receipt returned by SPPauseMonitoringHIDResponsiveness");
  qword_25462BD08 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20AE33000, v0, v1, "Unable to allocate xpc dictionary", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20AE33000, v0, v1, "Unable to get executable path for HID response delay: 0 return with 0-length buffer", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime_cold_3(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_6(&dword_20AE33000, a2, a3, "Unable to get executable path for HID response delay with buffer of size %#x", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime_cold_4(int *a1, NSObject *a2, uint64_t a3)
{
  int v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = *a1;
  v4[0] = 67109120;
  v4[1] = v3;
  OUTLINED_FUNCTION_6(&dword_20AE33000, a2, a3, "Unable to get executable path for HID response delay, requires buffer of size %#x", (uint8_t *)v4);
  OUTLINED_FUNCTION_1();
}

void SPCheckHIDResponseTime_cold_5(char **a1, int a2)
{
  *a1 = 0;
  asprintf(a1, "No matching SPResumeMonitoringHIDResponsiveness call for SPPauseMonitoringHIDResponsiveness before responding to a HID event. Monitoring is paused by \"%s\" (and %d others)", (const char *)(*(_QWORD *)gPauseReceipts + 8), a2 - 1);
  qword_25462BD08 = (uint64_t)*a1;
  _os_crash();
  __break(1u);
}

void SPCheckHIDResponseTime_cold_6(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 134218240;
  v4 = a1;
  v5 = 2048;
  v6 = a2;
  _os_log_fault_impl(&dword_20AE33000, log, OS_LOG_TYPE_FAULT, "Invalid timestamps for HID response delay: %llu to %llu", (uint8_t *)&v3, 0x16u);
  OUTLINED_FUNCTION_9();
}

void spindump_connection_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20AE33000, v0, v1, "No connection to spindump", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPReportCPUUsageResource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting cpu usage for pid 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPReportDiskWritesResource_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting disk writes for pid 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _SPReportFileDescriptorExhaustion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting file descriptor exhaustion for pid 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _SPReportPortExhaustion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting port exhaustion for pid 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void _SPReportKQWorkLoopExhaustion_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting kqworkloop exhaustion for pid 0", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPReportWorkflowResponsivenessDelay_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_20AE33000, v0, v1, "Reporting workflow responsiveness delay with empty tailspin path", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void SPReportWorkflowResponsivenessDelay_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_20AE33000, v0, v1, "Unable to connect to spindump, returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __libspindump_log_block_invoke_cold_1()
{
  _os_assert_log();
  _os_crash();
  __break(1u);
}

void __spindump_connection_block_invoke_2_cold_1(void *a1, NSObject *a2)
{
  const char *string;
  int v4;
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  string = xpc_dictionary_get_string(a1, (const char *)*MEMORY[0x24BDACF40]);
  v4 = 136446210;
  v5 = string;
  _os_log_error_impl(&dword_20AE33000, a2, OS_LOG_TYPE_ERROR, "Got xpc error message: %{public}s\n", (uint8_t *)&v4, 0xCu);
  OUTLINED_FUNCTION_8();
}

void __procname_btd_block_invoke_cold_1(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  OUTLINED_FUNCTION_6(&dword_20AE33000, a1, v3, "Unable to check for proc_name availability: %{errno}d", (uint8_t *)v4);
  OUTLINED_FUNCTION_9();
}

CFIndex CFPreferencesGetAppIntegerValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC190](key, applicationID, keyExistsAndHasValidFormat);
}

void *__cdecl _Block_copy(const void *aBlock)
{
  return (void *)MEMORY[0x24BDAC720](aBlock);
}

void _Block_release(const void *aBlock)
{
  MEMORY[0x24BDAC738](aBlock);
}

int _NSGetExecutablePath(char *buf, uint32_t *bufsize)
{
  return MEMORY[0x24BDAC770](buf, bufsize);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t __strlcpy_chk()
{
  return MEMORY[0x24BDAC910]();
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
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

uint64_t analytics_send_event_lazy()
{
  return MEMORY[0x24BE1A1F0]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
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

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

uint64_t kdebug_trace()
{
  return MEMORY[0x24BDAE958]();
}

uint64_t mach_absolute_time(void)
{
  return MEMORY[0x24BDAEB30]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

kern_return_t mach_timebase_info(mach_timebase_info_t info)
{
  return MEMORY[0x24BDAEC68](info);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED88](ptr, size, type_id);
}

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
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

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF6E0](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

uint64_t sandbox_check()
{
  return MEMORY[0x24BDAFBD8]();
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

size_t strnlen(const char *__s1, size_t __n)
{
  return MEMORY[0x24BDAFF80](__s1, __n);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

void xpc_connection_send_message_with_reply(xpc_connection_t connection, xpc_object_t message, dispatch_queue_t replyq, xpc_handler_t handler)
{
  MEMORY[0x24BDB07B0](connection, message, replyq, handler);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

xpc_object_t xpc_dictionary_create_empty(void)
{
  return (xpc_object_t)MEMORY[0x24BDB08D0]();
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0938](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x24BDB0978](xdict, key, value);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x24BDB0998](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x24BDB09A8](xdict, key, value);
}

uint64_t xpc_dictionary_set_mach_send()
{
  return MEMORY[0x24BDB09B8]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_release(xpc_object_t object)
{
  MEMORY[0x24BDB0AE0](object);
}

