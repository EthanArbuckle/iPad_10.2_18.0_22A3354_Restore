void sub_245CD8CA8(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 72));
  _Unwind_Resume(a1);
}

void sub_245CD9AB8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CD9C48(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_245CDA5D0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CDA750(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_245CDADF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;

  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CDB0DC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CDB688(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;
  uint64_t v19;
  id *v20;

  v20 = v18;
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Block_object_dispose((const void *)(v19 - 64), 8);
  _Unwind_Resume(a1);
}

void sub_245CDB848(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

const __CFString *descriptionFromErrorCode(uint64_t a1)
{
  const __CFString *result;
  void *v3;
  const __CFString *v4;

  if (a1 >= 4096)
  {
    if (os_variant_has_internal_content())
    {
      if (a1 >= 12288)
      {
        switch(a1)
        {
          case 12288:
            result = CFSTR("Writer Not Monitoring");
            break;
          case 12289:
            result = CFSTR("Writer Not Authorized");
            break;
          case 12290:
            result = CFSTR("Writer Input was invalid");
            break;
          case 12291:
            result = CFSTR("No available memory mapped to write sample");
            break;
          case 12292:
            result = CFSTR("Provided sample is out of order from previous samples");
            break;
          case 12293:
            result = CFSTR("Provided sample is too large");
            break;
          case 12294:
            result = CFSTR("Framework datastore state is invalid");
            break;
          case 12295:
            result = CFSTR("Writer does not have explicit authorization");
            break;
          case 12296:
            result = CFSTR("Provided sample is from the future");
            break;
          default:
            if ((unint64_t)(a1 - 20480) < 5 || a1 != 0x4000)
              return 0;
            result = CFSTR("Sensor Configuration is invalid");
            break;
        }
        return result;
      }
      if (a1 >= 0x2000)
      {
        switch(a1)
        {
          case 8192:
            result = CFSTR("No space available to write samples");
            break;
          case 8193:
            result = CFSTR("Connection Not Found");
            break;
          case 8194:
            result = CFSTR("Internal Error");
            break;
          case 8195:
            result = CFSTR("Prompt Busy");
            break;
          case 8196:
            result = CFSTR("Prompt is cancelled");
            break;
          case 8198:
            result = CFSTR("No device identifier could be found");
            break;
          case 8199:
            result = CFSTR("Time synchronization state is invalid");
            break;
          case 8200:
            result = CFSTR("The requested bundle authorization is being requested for could not be found");
            break;
          case 8201:
            result = CFSTR("No new authorization groups were requested");
            break;
          default:
            return 0;
        }
        return result;
      }
      switch(a1)
      {
        case 4096:
          return CFSTR("Required app is not installed");
        case 4097:
          return CFSTR("Required onboarding not completed");
        case 4098:
          return CFSTR("Global setting not enabled");
      }
    }
    return 0;
  }
  switch(a1)
  {
    case 0:
      v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = CFSTR("SRErrorInvalidEntitlement");
      break;
    case 1:
      v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = CFSTR("SRErrorNoAuthorization");
      break;
    case 2:
      v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = CFSTR("SRErrorDataInaccessible");
      break;
    case 3:
      v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = CFSTR("SRErrorFetchRequestInvalid");
      break;
    case 4:
      v3 = (void *)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v4 = CFSTR("SRErrorPromptDeclined");
      break;
    default:
      return 0;
  }
  return (const __CFString *)objc_msgSend(v3, "localizedStringForKey:value:table:", v4, &stru_2516F29D8, 0);
}

uint64_t recoverySuggestionFromErrorCode(uint64_t a1)
{
  const __CFString *v1;

  if (a1 == 1)
  {
    v1 = CFSTR("SRErrorNoAuthorizationRecovery");
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v1, &stru_2516F29D8, 0);
  }
  if (a1 == 2)
  {
    v1 = CFSTR("SRErrorDataInaccessibleRecovery");
    return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class()), "localizedStringForKey:value:table:", v1, &stru_2516F29D8, 0);
  }
  return 0;
}

void sub_245CDD38C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,id location)
{
  id *v24;
  id *v25;

  objc_destroyWeak(v25);
  objc_destroyWeak(&location);
  objc_destroyWeak(v24);
  objc_destroyWeak(&a16);
  _Unwind_Resume(a1);
}

void sub_245CDD5BC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDD9BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245CDDE64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_245CDDFB0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void __Block_byref_object_copy_(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

void __Block_byref_object_dispose_(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

void sub_245CDE2D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245CDE3C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_245CDE5A4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDE64C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDE6EC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDE7F8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDE880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CDECA4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

SRAbsoluteTime SRAbsoluteTimeGetCurrent(void)
{
  uint64_t v0;

  v0 = mach_continuous_time();
  return SRAbsoluteTimeFromContinuousTime(v0);
}

SRAbsoluteTime SRAbsoluteTimeFromContinuousTime(uint64_t cont)
{
  double v2;
  double v3;
  double v4;

  if (_syncToken != -1)
    dispatch_once(&_syncToken, &__block_literal_global_2);
  if (_contStart >= cont)
    v2 = -1.0;
  else
    v2 = 1.0;
  v3 = *(double *)&_rtcStart + *(double *)&_remoteRTCOffset;
  TMConvertTicksToSeconds();
  return v3 + v4 * v2;
}

uint64_t SRAbsoluteTimeGetOffsets(uint64_t result, _QWORD *a2)
{
  double *v3;
  double v4;
  double v5;

  if (result)
  {
    v3 = (double *)result;
    v4 = *(double *)&_rtcStart;
    result = TMConvertTicksToSeconds();
    *v3 = v4 - v5;
  }
  if (a2)
  {
    result = mach_get_times();
    *a2 = 0;
  }
  return result;
}

CFAbsoluteTime SRAbsoluteTimeToCFAbsoluteTime(SRAbsoluteTime sr)
{
  mach_get_times();
  return (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x24BDBD238] - SRAbsoluteTimeFromContinuousTime(0) + sr;
}

SRAbsoluteTime SRAbsoluteTimeFromCFAbsoluteTime(CFAbsoluteTime cf)
{
  double v2;

  mach_get_times();
  v2 = (double)0 / 1000000000.0 + (double)0 - *MEMORY[0x24BDBD238];
  return cf - (v2 - SRAbsoluteTimeFromContinuousTime(0));
}

BOOL SRAbsoluteTimeSetSyntheticStartFromRemoteTime(unint64_t a1, unint64_t a2, double a3, uint64_t a4, double *a5)
{
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

  mach_get_times();
  v9 = 1.0;
  if (a2 >= a1)
    v10 = 1.0;
  else
    v10 = -1.0;
  TMConvertTicksToSeconds();
  v12 = v11 + a3;
  TMConvertTicksToSeconds();
  v14 = v12 + v10 * v13;
  TMConvertTicksToSeconds();
  v16 = v14 - v15;
  TMConvertTicksToSeconds();
  v18 = v16 + v17;
  if (a1 <= _contStart)
    v9 = -1.0;
  v19 = *(double *)&_rtcStart;
  TMConvertTicksToSeconds();
  v21 = v19 + v20 * v9;
  v22 = v18 - v21;
  v23 = v21 + v18 - v21;
  if (v23 > 0.0)
  {
    _remoteRTCOffset = *(_QWORD *)&v22;
    if (a5)
      *a5 = v22;
  }
  return v23 > 0.0;
}

void SRAbsoluteTimeInitWithRemoteRTCOffset(double a1)
{
  _remoteRTCOffset = *(_QWORD *)&a1;
}

double SRAbsoluteTimeRoundedDownToNearestInterval(SRAbsoluteTime a1, double a2)
{
  double v2;
  CFAbsoluteTime v3;

  if (a2 == 0.0)
    v2 = 1.0;
  else
    v2 = a2;
  v3 = v2 * floor(SRAbsoluteTimeToCFAbsoluteTime(a1) / v2);
  return SRAbsoluteTimeFromCFAbsoluteTime(v3);
}

void sub_245CDFAF0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,id location)
{
  id *v31;

  objc_destroyWeak(v31);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_245CE0ADC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,os_activity_scope_state_s state)
{
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_245CE112C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CE1198(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CE123C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CE12A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_245CE2288(_Unwind_Exception *a1)
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

void SRRegisterForDarwinNotification(void *a1, int *a2, void *a3)
{
  NSObject *v6;
  const char *v7;
  uint32_t v8;
  NSObject *v9;
  int v10;
  int v11;
  void *v12;
  __int16 v13;
  uint32_t v14;
  __int16 v15;
  int v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = SRLogDaemonNotification;
  if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
  {
    v11 = 138543362;
    v12 = a1;
    _os_log_debug_impl(&dword_245CD7000, v6, OS_LOG_TYPE_DEBUG, "Registering for darwin notification on %{public}@", (uint8_t *)&v11, 0xCu);
  }
  *a2 = -1;
  v7 = (const char *)objc_msgSend(a1, "UTF8String");
  v8 = notify_register_dispatch(v7, a2, MEMORY[0x24BDAC9B8], a3);
  if (v8 || *a2 == -1)
  {
    v9 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
    {
      v10 = *a2;
      v11 = 138543874;
      v12 = a1;
      v13 = 1026;
      v14 = v8;
      v15 = 1026;
      v16 = v10;
      _os_log_error_impl(&dword_245CD7000, v9, OS_LOG_TYPE_ERROR, "Failed to register for darwin notification %{public}@, status %{public}d, registration token %{public}d", (uint8_t *)&v11, 0x18u);
    }
  }
}

void SRUnregisterForNotification(uint64_t a1, int *a2)
{
  int v2;
  NSObject *v5;
  NSObject *v6;
  int v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v2 = *a2;
  if (*a2 != -1)
  {
    v5 = SRLogDaemonNotification;
    if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_DEBUG))
    {
      v8 = 138543362;
      v9 = a1;
      _os_log_debug_impl(&dword_245CD7000, v5, OS_LOG_TYPE_DEBUG, "Unregistering for darwin notification on %{public}@", (uint8_t *)&v8, 0xCu);
      v2 = *a2;
    }
    if (notify_cancel(v2))
    {
      v6 = SRLogDaemonNotification;
      if (os_log_type_enabled((os_log_t)SRLogDaemonNotification, OS_LOG_TYPE_ERROR))
      {
        v7 = *a2;
        v8 = 138543618;
        v9 = a1;
        v10 = 1026;
        v11 = v7;
        _os_log_error_impl(&dword_245CD7000, v6, OS_LOG_TYPE_ERROR, "Failed to cancel notification %{public}@. status %{public}d", (uint8_t *)&v8, 0x12u);
      }
    }
    *a2 = -1;
  }
}

uint64_t writeMetadataBytesForFrameStore(uint64_t a1, const void *a2, size_t a3, SRError **a4, double a5)
{
  double v10;
  SRFramesStoreOffsetEnumerator *v11;
  uint64_t v12;
  uint64_t v13;
  double *v14;
  uint64_t v15;
  uint64_t v16;
  double *v17;
  NSObject *v18;
  uint64_t v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  unint64_t v30;
  uint64_t v31;
  size_t v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  double v41;
  __int16 v42;
  double v43;
  __int16 v44;
  double *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (a1)
    v10 = *(double *)(a1 + 48);
  else
    v10 = 0.0;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v11 = -[SRFrameStore enumerateFromOffset:]((SRFramesStoreOffsetEnumerator *)a1, 0);
  v12 = -[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (!v12)
    goto LABEL_22;
  v13 = v12;
  v33 = a3;
  v14 = 0;
  v15 = *(_QWORD *)v35;
LABEL_5:
  v16 = 0;
  v17 = v14;
  while (1)
  {
    if (*(_QWORD *)v35 != v15)
      objc_enumerationMutation(v11);
    v14 = *(double **)(*((_QWORD *)&v34 + 1) + 8 * v16);
    v18 = SRLogDatastore;
    if (os_log_type_enabled((os_log_t)SRLogDatastore, OS_LOG_TYPE_DEBUG))
    {
      if (a1)
        v19 = *(_QWORD *)(a1 + 40);
      else
        v19 = 0;
      v20 = *v14;
      *(_DWORD *)buf = 138413058;
      v39 = v19;
      v40 = 2048;
      v41 = v20;
      v42 = 2048;
      v43 = v10;
      v44 = 2048;
      v45 = v17;
      _os_log_debug_impl(&dword_245CD7000, v18, OS_LOG_TYPE_DEBUG, "metadata segment: %@, metadata frame time: %f, sample time: %f, current metadata object: %p", buf, 0x2Au);
    }
    if (*v14 > v10)
      break;
    ++v16;
    v17 = v14;
    if (v13 == v16)
    {
      v21 = -[SRFramesStoreOffsetEnumerator countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v34, v46, 16, *v14);
      v13 = v21;
      if (!v21)
      {
        v17 = v14;
        a3 = v33;
        goto LABEL_19;
      }
      goto LABEL_5;
    }
  }
  a3 = v33;
  if (!v17)
    goto LABEL_22;
LABEL_19:
  v22 = *((unsigned int *)v17 + 4);
  if ((_DWORD)v22 && v22 == a3 && !memcmp(a2, (char *)v17 + 20, a3))
    return 1;
LABEL_22:
  if (a1)
  {
    v23 = *(_QWORD *)(a1 + 24);
    if (v23 && (v24 = *(_QWORD *)(v23 + 16)) != 0)
    {
      v25 = *(_QWORD *)(v24 + 4);
    }
    else
    {
      v27 = *(_QWORD *)(a1 + 16);
      if (v27)
        v25 = *(_QWORD *)(v27 + 24) - *(_QWORD *)(v27 + 16) + 56;
      else
        v25 = 56;
    }
    v26 = -[SRFrameStore writeFrameForBytes:length:timestamp:error:](a1, (const Bytef *)a2, a3, a4, a5);
    v28 = *(_QWORD *)(a1 + 24);
    if (v28 && (v29 = *(_QWORD *)(v28 + 16)) != 0)
    {
      v30 = *(_QWORD *)(v29 + 4);
    }
    else
    {
      v31 = *(_QWORD *)(a1 + 16);
      if (v31)
        v30 = *(_QWORD *)(v31 + 24) - *(_QWORD *)(v31 + 16) + 56;
      else
        v30 = 56;
    }
    if (v30 >= v25 + a3)
      -[SRFrameStore sync]((uint64_t *)a1);
  }
  else
  {
    v26 = 0;
    if (a4)
      *a4 = +[SRError errorWithCode:](SRError, "errorWithCode:", 12294);
  }
  return v26;
}

void SRMakeSegmentHeader(uint64_t a1, uint64_t a2, void *a3, int a4)
{
  _OWORD *v4;
  uint64_t v5;
  size_t v6;
  size_t v7;
  NSObject *v8;
  __int128 v9;
  NSObject *v10;
  int v11;
  size_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  *(_OWORD *)(a1 + 40) = 0u;
  *(_DWORD *)a1 = 1195725633;
  *(_QWORD *)(a1 + 4) = a2;
  *(_QWORD *)(a1 + 12) = 0;
  *(_DWORD *)(a1 + 20) = a4;
  *(_OWORD *)(a1 + 24) = 0u;
  v4 = (_OWORD *)(a1 + 24);
  if (a3)
  {
    v5 = objc_msgSend(a3, "UTF8String");
    v6 = strlen((const char *)v5);
    if (v6 >= 0x21)
    {
      v7 = v6;
      v8 = SRLogFrameStore;
      if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_ERROR))
      {
        v11 = 134349312;
        v12 = v7;
        v13 = 2050;
        v14 = 32;
        _os_log_error_impl(&dword_245CD7000, v8, OS_LOG_TYPE_ERROR, "Segment name is too large to store in the segment header. Truncating the segment name of %{public}zu to %{public}lu", (uint8_t *)&v11, 0x16u);
      }
    }
    v9 = *(_OWORD *)(v5 + 16);
    *v4 = *(_OWORD *)v5;
    v4[1] = v9;
  }
  else
  {
    v10 = SRLogFrameStore;
    if (os_log_type_enabled((os_log_t)SRLogFrameStore, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_245CD7000, v10, OS_LOG_TYPE_INFO, "No segment name provided for the segment header", (uint8_t *)&v11, 2u);
    }
  }
}

uint64_t memoryMappingsForPermission(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  id *v8;
  id v11;
  uint64_t v12;
  _QWORD v14[2];
  id v15;
  _QWORD v16[2];

  v5 = a4;
  v16[1] = *MEMORY[0x24BDAC8D0];
  switch(a1)
  {
    case 2:
      v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 2, 1, 56);
      v15 = v6;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = &v15;
      goto LABEL_6;
    case 1:
      v11 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], 56, 2, 1, 0);
      v12 = a3 - v5;
      if (!*(_QWORD *)(a2 + 4))
        v5 = 56;
      v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], v12, 2, 2, v5);
      v14[0] = v11;
      v14[1] = v6;
      v4 = objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);

      goto LABEL_10;
    case 0:
      v6 = -[SRMemoryMapping initWithSize:protection:advice:offset:]([SRMemoryMapping alloc], a4 - 56, 1, 1, 56);
      v16[0] = v6;
      v7 = (void *)MEMORY[0x24BDBCE30];
      v8 = (id *)v16;
LABEL_6:
      v4 = objc_msgSend(v7, "arrayWithObjects:count:", v8, 1);
LABEL_10:

      break;
  }
  return v4;
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x24BDD0B80](aClassName);
}

NSUInteger NSPageSize(void)
{
  return MEMORY[0x24BDD1130]();
}

NSUInteger NSRoundDownToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x24BDD11F8](bytes);
}

NSUInteger NSRoundUpToMultipleOfPageSize(NSUInteger bytes)
{
  return MEMORY[0x24BDD1200](bytes);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t TCCAccessCheckAuditToken()
{
  return MEMORY[0x24BEB3758]();
}

uint64_t TCCAccessCopyBundleIdentifiersDisabledForService()
{
  return MEMORY[0x24BEB3760]();
}

uint64_t TCCAccessCopyBundleIdentifiersForService()
{
  return MEMORY[0x24BEB3768]();
}

uint64_t TCCAccessCopyInformationForBundleId()
{
  return MEMORY[0x24BEB3780]();
}

uint64_t TCCAccessGetOverride()
{
  return MEMORY[0x24BEB3788]();
}

uint64_t TCCAccessPreflight()
{
  return MEMORY[0x24BEB3790]();
}

uint64_t TCCAccessRequest()
{
  return MEMORY[0x24BEB37B0]();
}

uint64_t TCCAccessReset()
{
  return MEMORY[0x24BEB37C0]();
}

uint64_t TCCAccessResetForBundleId()
{
  return MEMORY[0x24BEB37D0]();
}

uint64_t TCCAccessSetForBundleId()
{
  return MEMORY[0x24BEB37F0]();
}

uint64_t TCCAccessSetOverride()
{
  return MEMORY[0x24BEB37F8]();
}

uint64_t TMConvertTicksToSeconds()
{
  return MEMORY[0x24BE28978]();
}

uint64_t TMGetKernelMonotonicClock()
{
  return MEMORY[0x24BE28988]();
}

void _Block_object_assign(void *a1, const void *a2, const int a3)
{
  MEMORY[0x24BDAC728](a1, a2, *(_QWORD *)&a3);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x24BDACB00](dso, description, activity, *(_QWORD *)&flags);
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

void abort(void)
{
  MEMORY[0x24BDAD008]();
}

uLong adler32(uLong adler, const Bytef *buf, uInt len)
{
  return MEMORY[0x24BEDF198](adler, buf, *(_QWORD *)&len);
}

uLong adler32_z(uLong adler, const Bytef *buf, z_size_t len)
{
  return MEMORY[0x24BEDF1A0](adler, buf, len);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x24BDADCA8](queue);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

uint64_t dyld_program_sdk_at_least()
{
  return MEMORY[0x24BDAE148]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x24BDAE2E8](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t mach_continuous_time(void)
{
  return MEMORY[0x24BDAEB48]();
}

uint64_t mach_get_times()
{
  return MEMORY[0x24BDAEB60]();
}

int madvise(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAED00](a1, a2, *(_QWORD *)&a3);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x24BDAEE78](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int msync(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFE0](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x24BDAF138](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
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

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x24BEDCFB0](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x24BEDCFC0]();
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
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

id objc_loadWeak(id *location)
{
  return (id)MEMORY[0x24BEDD0D8](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
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

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3D0](self, _cmd, newValue, offset);
}

void objc_setProperty_atomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3E0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD3F0](self, _cmd, newValue, offset);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
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

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A0](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x24BDAF2A8](state);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x24BDAF4D0]();
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

