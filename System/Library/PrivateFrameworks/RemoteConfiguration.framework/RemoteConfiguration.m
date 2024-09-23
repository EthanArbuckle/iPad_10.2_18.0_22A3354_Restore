id RCJSONDictionaryValue(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v4 == v5))
    {
      RCSharedLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_impl(&dword_1A1FB5000, v7, OS_LOG_TYPE_ERROR, "missing dictionary value for key: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = v4;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id RCJSONArrayValue(void *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          v5,
          v4 == v5))
    {
      RCSharedLog();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      {
        v9 = 138543362;
        v10 = v3;
        _os_log_impl(&dword_1A1FB5000, v7, OS_LOG_TYPE_ERROR, "missing array value for key: %{public}@", (uint8_t *)&v9, 0xCu);
      }

      v6 = 0;
    }
    else
    {
      v6 = v4;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

id RCJSONStringValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  int v14;
  id v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v9 = (void *)objc_claimAutoreleasedReturnValue(),
          v9,
          v10 = v8,
          v8 == v9))
    {
      RCSharedLog();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v14 = 138543618;
        v15 = v5;
        v16 = 2114;
        v17 = v7;
        _os_log_impl(&dword_1A1FB5000, v11, OS_LOG_TYPE_ERROR, "missing string value for key: %{public}@ defaultValue: %{public}@", (uint8_t *)&v14, 0x16u);
      }

      v10 = v7;
    }
    v12 = v10;

  }
  else
  {
    v12 = v6;
  }

  return v12;
}

id RCSharedLog()
{
  if (RCSharedLog_once != -1)
    dispatch_once(&RCSharedLog_once, &__block_literal_global_3);
  return (id)RCSharedLog_result;
}

uint64_t RCDynamicCast(uint64_t a1, uint64_t a2)
{
  if (!a2)
    return 0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return a2;
  return 0;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void __Block_byref_object_dispose__2(uint64_t a1)
{

}

void __Block_byref_object_dispose__3(uint64_t a1)
{

}

void __Block_byref_object_dispose__4(uint64_t a1)
{

}

void sub_1A1FB9370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1FB9DD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

unint64_t RCSecondsToMilliseconds(double a1)
{
  return (unint64_t)(fmax(a1, 0.0) * 1000.0);
}

void *RCProtocolCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "conformsToProtocol:", a1))
    return a2;
  return 0;
}

const __CFString *RCStringFromQueuePriority(uint64_t a1)
{
  __int128 v1;
  unint64_t v2;

  *((_QWORD *)&v1 + 1) = a1;
  *(_QWORD *)&v1 = a1 + 8;
  v2 = (v1 >> 2) - 1;
  if (v2 > 3)
    return CFSTR("VeryLow");
  else
    return off_1E470EBD0[v2];
}

const __CFString *RCStringFromQualityOfService(uint64_t a1)
{
  const __CFString *v1;
  const __CFString *v2;
  const __CFString *v3;

  v1 = CFSTR("UserInteractive");
  v2 = CFSTR("Utility");
  v3 = CFSTR("UserInitiated");
  if (a1 != 25)
    v3 = CFSTR("UserInteractive");
  if (a1 != 17)
    v2 = v3;
  if (a1 == 9)
    v1 = CFSTR("Background");
  if (a1 == -1)
    v1 = CFSTR("Default");
  if (a1 <= 16)
    return v1;
  else
    return v2;
}

uint64_t RCQueuePriorityFromRelativePriority(uint64_t a1)
{
  if ((unint64_t)(a1 + 1) >= 4)
    return 0;
  else
    return 4 * (a1 + 1) - 4;
}

dispatch_queue_global_t RCDispatchQueueForQualityOfService(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  intptr_t v4;

  if (a1 == 33)
    v1 = 33;
  else
    v1 = 0;
  if (a1 == 25)
    v1 = 25;
  if (a1 == 17)
    v1 = 17;
  v2 = 21;
  if (a1 == 9)
    v3 = 9;
  else
    v3 = 0;
  if (a1 != -1)
    v2 = v3;
  if (a1 <= 16)
    v4 = v2;
  else
    v4 = v1;
  return dispatch_get_global_queue(v4, 0);
}

id RCGenerateOperationID()
{
  uint64_t v0;
  _BYTE v2[17];
  uint64_t v3;

  v0 = 0;
  v3 = *MEMORY[0x1E0C80C00];
  do
    v2[v0++] = aAbcdef01234567[arc4random_uniform(0x10u)];
  while (v0 != 16);
  v2[16] = 0;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v2);
  return (id)objc_claimAutoreleasedReturnValue();
}

uint64_t RCJSONIntegerValue(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  uint64_t v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      RCSharedLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543618;
        v11 = v5;
        v12 = 2048;
        v13 = a3;
        _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "missing integer value for key: %{public}@ defaultValue: %lld", (uint8_t *)&v10, 0x16u);
      }

    }
    else
    {
      a3 = objc_msgSend(v6, "integerValue");
    }

  }
  return a3;
}

id RCAppVersion()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", CFSTR("CFBundleShortVersionString"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

id RCDeviceOSVersion()
{
  void *v0;
  void *v1;

  v0 = (void *)MGCopyAnswer();
  NSLog(CFSTR("%@"), v0);
  v1 = (void *)MGCopyAnswer();

  return v1;
}

id RCDeviceModelString()
{
  return (id)MGCopyAnswer();
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__2(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t __Block_byref_object_copy__3(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A85815B4](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

uint64_t __Block_byref_object_copy__4(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

uint64_t RCCheckedDynamicCast(objc_class *a1, uint64_t a2)
{
  uint64_t v2;

  v2 = a2;
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      RCCheckedDynamicCast_cold_1(a1);
    return 0;
  }
  return v2;
}

void sub_1A1FC081C(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A1FC08FC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void RCPerformIfNonNil(void *a1, void *a2)
{
  id v3;
  void (**v4)(id, id);

  v3 = a1;
  v4 = a2;
  if (!v4 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCPerformIfNonNil_cold_1();
    if (!v3)
      goto LABEL_5;
    goto LABEL_4;
  }
  if (v3)
LABEL_4:
    v4[2](v4, v3);
LABEL_5:

}

uint64_t RCCompareRelativePriority(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "compare:", v4);

  return v5;
}

uint64_t RCHigherRelativePriority(uint64_t a1, uint64_t a2)
{
  if (RCCompareRelativePriority(a1, a2) == -1)
    return a2;
  else
    return a1;
}

uint64_t RCNextHighestRelativePriority(uint64_t result)
{
  if ((unint64_t)(result + 1) <= 3)
    return qword_1A1FDF078[result + 1];
  return result;
}

uint64_t RCInferRelativePriorityFromQualityOfService(uint64_t a1)
{
  if (a1 == 9)
    return -1;
  return a1 == 33 || a1 == 25;
}

void sub_1A1FC1ADC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

uint64_t RCUserSegmentationEnvironmentForEnvironmentString(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("STAGING")) & 1) != 0)
  {
    v2 = 1;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("QA")) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", CFSTR("DEVEL")) & 1) != 0)
  {
    v2 = 3;
  }
  else if (objc_msgSend(v1, "isEqualToString:", CFSTR("TEST")))
  {
    v2 = 4;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

double RCMillisecondsToSeconds(unint64_t a1)
{
  return (double)a1 / 1000.0;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, int a3, const char *a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint8_t buf)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &buf, 0x26u);
}

void sub_1A1FC4188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A1FC4DF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A1FC8C34(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 112));
  _Unwind_Resume(a1);
}

void sub_1A1FC99C8(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 144));
  _Unwind_Resume(a1);
}

void *RCSpecificCast(uint64_t a1, void *a2)
{
  if (!a2)
    return 0;
  if (objc_msgSend(a2, "isMemberOfClass:", a1))
    return a2;
  return 0;
}

void *RCClassAndProtocolCast(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  void *v9;
  uint64_t *v11;
  uint64_t *v13;

  v9 = a1;
  if (a1)
  {
    if ((objc_opt_isKindOfClass() & 1) == 0)
      return 0;
    v13 = &a9;
    if (a3)
    {
      while (1)
      {
        v11 = v13++;
        if ((objc_msgSend(v9, "conformsToProtocol:", *v11) & 1) == 0)
          break;
        if (!--a3)
          return v9;
      }
      return 0;
    }
  }
  return v9;
}

CFTypeRef RCCFTypeCast(uint64_t a1, CFTypeRef cf)
{
  if (!cf)
    return 0;
  if (CFGetTypeID(cf) == a1)
    return cf;
  return 0;
}

uint64_t RCCheckedStaticCast(uint64_t a1, uint64_t a2)
{
  if (a2 && (objc_opt_isKindOfClass() & 1) == 0 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCCheckedStaticCast_cold_1();
  return a2;
}

void *RCCheckedProtocolCast(uint64_t a1, void *a2)
{
  void *v2;

  v2 = a2;
  if (a2 && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      RCCheckedProtocolCast_cold_1();
    return 0;
  }
  return v2;
}

void *RCCheckedStaticProtocolCast(uint64_t a1, void *a2)
{
  if (a2
    && (objc_msgSend(a2, "conformsToProtocol:", a1) & 1) == 0
    && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCCheckedStaticProtocolCast_cold_1();
  }
  return a2;
}

void sub_1A1FCAF30(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_0_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x26u);
}

void sub_1A1FCC124(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,char a41)
{
  uint64_t v41;

  _Block_object_dispose(&a41, 8);
  _Block_object_dispose((const void *)(v41 - 176), 8);
  _Unwind_Resume(a1);
}

id RCBlockConjunction(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v3 = a1;
  v4 = a2;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __RCBlockConjunction_block_invoke;
  v9[3] = &unk_1E470E5B8;
  v10 = v3;
  v11 = v4;
  v5 = v4;
  v6 = v3;
  v7 = (void *)MEMORY[0x1A85815B4](v9);

  return v7;
}

void RCPerformBlockOnMainThread(void *a1)
{
  void (**v1)(_QWORD);

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCPerformBlockOnMainThread_cold_1();
  if (objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread"))
    v1[2](v1);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v1);

}

void RCWaitUntilBlockIsInvoked(void *a1)
{
  _QWORD *v1;
  dispatch_semaphore_t v2;
  void (*v3)(_QWORD *, _QWORD *);
  NSObject *v4;
  _QWORD v5[4];
  dispatch_semaphore_t v6;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCWaitUntilBlockIsInvoked_cold_1();
  v2 = dispatch_semaphore_create(0);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __RCWaitUntilBlockIsInvoked_block_invoke;
  v5[3] = &unk_1E470DFF0;
  v6 = v2;
  v3 = (void (*)(_QWORD *, _QWORD *))v1[2];
  v4 = v2;
  v3(v1, v5);
  dispatch_semaphore_wait(v4, 0xFFFFFFFFFFFFFFFFLL);

}

uint64_t RCQoSClassFromQoS(uint64_t a1)
{
  int v1;
  int v2;
  unsigned int v3;
  int v4;
  unsigned int v5;

  if (a1 == 33)
    v1 = 33;
  else
    v1 = 0;
  if (a1 == 25)
    v2 = 25;
  else
    v2 = v1;
  if (a1 == 17)
    v3 = 17;
  else
    v3 = v2;
  if (a1 == 9)
    v4 = 9;
  else
    v4 = 0;
  if (a1 == -1)
    v5 = 21;
  else
    v5 = v4;
  if (a1 <= 16)
    return v5;
  else
    return v3;
}

uint64_t RCQoSFromQoSClass(int a1)
{
  unint64_t v1;
  uint64_t v2;

  HIDWORD(v1) = a1 - 9;
  LODWORD(v1) = a1 - 9;
  v2 = 8 * (v1 >> 3) + 9;
  if ((v1 >> 3) >= 4)
    return -1;
  else
    return v2;
}

void RCDispatchAsyncWithQualityOfService(void *a1, uint64_t a2, void *a3)
{
  NSObject *v5;
  id v6;

  v5 = a1;
  RCBlockWithQualityOfService(a2, a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_async(v5, v6);

}

id RCBlockWithQualityOfService(uint64_t a1, dispatch_block_t block)
{
  int v3;
  int v4;
  int v5;
  int v6;
  int v7;
  dispatch_qos_class_t v8;
  dispatch_block_t v9;
  void *v10;

  if (a1 == 33)
    v3 = 33;
  else
    v3 = 0;
  if (a1 == 25)
    v4 = 25;
  else
    v4 = v3;
  if (a1 == 17)
    v5 = 17;
  else
    v5 = v4;
  if (a1 == 9)
    v6 = 9;
  else
    v6 = 0;
  if (a1 == -1)
    v7 = 21;
  else
    v7 = v6;
  if (a1 <= 16)
    v8 = v7;
  else
    v8 = v5;
  v9 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v8, 0, block);
  v10 = (void *)MEMORY[0x1A85815B4]();

  return v10;
}

void RCDispatchAfterWithQualityOfService(dispatch_time_t a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  id v8;

  v7 = a2;
  RCBlockWithQualityOfService(a3, a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_after(a1, v7, v8);

}

void RCDispatchGroupNotifyWithQualityOfService(void *a1, void *a2, uint64_t a3, void *a4)
{
  NSObject *v7;
  NSObject *v8;
  id v9;

  v7 = a2;
  v8 = a1;
  RCBlockWithQualityOfService(a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(v8, v7, v9);

}

BOOL RCDispatchGroupIsEmpty(void *a1)
{
  NSObject *v1;
  _BOOL8 v2;

  v1 = a1;
  if (!v1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCDispatchGroupIsEmpty_cold_1();
  v2 = dispatch_group_wait(v1, 0) == 0;

  return v2;
}

void RCDispatchGroupNotifyWithTimeout(void *a1, void *a2, dispatch_time_t a3, void *a4)
{
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v7 = a1;
  v8 = a2;
  v9 = a4;
  if (!v7 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCDispatchGroupNotifyWithTimeout_cold_3();
    if (v8)
      goto LABEL_6;
  }
  else if (v8)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCDispatchGroupNotifyWithTimeout_cold_2();
LABEL_6:
  if (!v9 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCDispatchGroupNotifyWithTimeout_cold_1();
  v10 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __RCDispatchGroupNotifyWithTimeout_block_invoke;
  v17[3] = &unk_1E470E018;
  v11 = v9;
  v18 = v11;
  RCHandleOperationTimeout(a3, v8, v17);
  block[0] = v10;
  block[1] = 3221225472;
  block[2] = __RCDispatchGroupNotifyWithTimeout_block_invoke_2;
  block[3] = &unk_1E470E5B8;
  v15 = (id)objc_claimAutoreleasedReturnValue();
  v16 = v11;
  v12 = v11;
  v13 = v15;
  dispatch_group_notify(v7, v8, block);

}

id RCHandleOperationTimeout(dispatch_time_t a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v12;

  v5 = a2;
  v6 = a3;
  if (!v5 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCHandleOperationTimeout_cold_2();
    if (v6)
      goto LABEL_6;
  }
  else if (v6)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCHandleOperationTimeout_cold_1();
LABEL_6:
  if (a1 == -1)
  {
    v9 = &__block_literal_global_4;
  }
  else
  {
    v12 = 0;
    RCHandleOperationCancellation(&v12, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v12;
    dispatch_after(a1, v5, v8);
    v9 = (void *)MEMORY[0x1A85815B4](v7);

  }
  v10 = (void *)MEMORY[0x1A85815B4](v9);

  return v10;
}

id RCHandleOperationCancellation(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  _QWORD *v13;
  _QWORD block[4];
  id v15;
  _QWORD *v16;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;
  _QWORD v22[3];
  char v23;

  v3 = a2;
  if (!a1 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCHandleOperationCancellation_cold_2();
    if (v3)
      goto LABEL_6;
  }
  else if (v3)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCHandleOperationCancellation_cold_1();
LABEL_6:
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x2020000000;
  v23 = 0;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = __Block_byref_object_copy__3;
  v20[4] = __Block_byref_object_dispose__3;
  v21 = (id)MEMORY[0x1A85815B4](v3);
  v4 = (void *)objc_opt_new();
  v5 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __RCHandleOperationCancellation_block_invoke;
  v17[3] = &unk_1E470EAF8;
  v18 = v4;
  v19 = v22;
  v6 = v4;
  block[0] = v5;
  block[1] = 3221225472;
  block[2] = __RCHandleOperationCancellation_block_invoke_3;
  block[3] = &unk_1E470EB20;
  v7 = (id)MEMORY[0x1A85815B4](v17);
  v15 = v7;
  v16 = v20;
  *a1 = dispatch_block_create((dispatch_block_flags_t)0, block);
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __RCHandleOperationCancellation_block_invoke_4;
  v11[3] = &unk_1E470EB48;
  v12 = v7;
  v13 = v20;
  v8 = v7;
  v9 = (void *)MEMORY[0x1A85815B4](v11);

  _Block_object_dispose(v20, 8);
  _Block_object_dispose(v22, 8);

  return v9;
}

void sub_1A1FCCDE0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,char a27)
{
  uint64_t v27;

  _Block_object_dispose(&a27, 8);
  _Block_object_dispose((const void *)(v27 - 112), 8);
  _Unwind_Resume(a1);
}

void sub_1A1FCCE94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void RCDispatchGroupWrap(void *a1, void *a2)
{
  NSObject *v3;
  _QWORD *v4;
  void (*v5)(_QWORD *, _QWORD *);
  NSObject *v6;
  _QWORD v7[4];
  NSObject *v8;

  v3 = a1;
  v4 = a2;
  if (!v3 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCDispatchGroupWrap_cold_2();
    if (v4)
      goto LABEL_6;
  }
  else if (v4)
  {
    goto LABEL_6;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCDispatchGroupWrap_cold_1();
LABEL_6:
  dispatch_group_enter(v3);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __RCDispatchGroupWrap_block_invoke;
  v7[3] = &unk_1E470DFF0;
  v8 = v3;
  v5 = (void (*)(_QWORD *, _QWORD *))v4[2];
  v6 = v3;
  v5(v4, v7);

}

void RCRepeat(uint64_t a1, void *a2)
{
  void (**v3)(_QWORD);

  v3 = a2;
  if (v3)
  {
    for (; a1; --a1)
      v3[2](v3);
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    RCRepeat_cold_1();
  }

}

id RCTestBlockForClass(uint64_t a1)
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __RCTestBlockForClass_block_invoke;
  v2[3] = &__block_descriptor_40_e8_B16__0_8lu32l8;
  v2[4] = a1;
  return (id)MEMORY[0x1A85815B4](v2);
}

id RCTestBlockForProtocol(void *a1)
{
  id v1;
  id v2;
  void *v3;
  _QWORD v5[4];
  id v6;

  v1 = a1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __RCTestBlockForProtocol_block_invoke;
  v5[3] = &unk_1E470EBB0;
  v6 = v1;
  v2 = v1;
  v3 = (void *)MEMORY[0x1A85815B4](v5);

  return v3;
}

uint64_t RCIsInternalBuild()
{
  if (RCIsInternalBuild_onceToken != -1)
    dispatch_once(&RCIsInternalBuild_onceToken, &__block_literal_global_7);
  return RCIsInternalBuild_internalBuild;
}

id RCAppBundleID()
{
  void *v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

double RCJSONDoubleValue(void *a1, void *a2, double a3)
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  NSObject *v9;
  int v11;
  id v12;
  __int16 v13;
  double v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      RCSharedLog();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v11 = 138543618;
        v12 = v5;
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1A1FB5000, v9, OS_LOG_TYPE_ERROR, "missing double value for key: %{public}@ defaultValue: %f", (uint8_t *)&v11, 0x16u);
      }

    }
    else
    {
      objc_msgSend(v6, "doubleValue");
      a3 = v8;
    }

  }
  return a3;
}

uint64_t RCJSONBoolValue(void *a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  id v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (a1)
  {
    objc_msgSend(a1, "objectForKeyedSubscript:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6
      || (objc_msgSend(MEMORY[0x1E0C99E38], "null"),
          v7 = (void *)objc_claimAutoreleasedReturnValue(),
          v7,
          v6 == v7))
    {
      RCSharedLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138543618;
        v11 = v5;
        v12 = 1024;
        v13 = a3;
        _os_log_impl(&dword_1A1FB5000, v8, OS_LOG_TYPE_ERROR, "missing BOOL value for key: %{public}@ defaultValue: %d", (uint8_t *)&v10, 0x12u);
      }

    }
    else
    {
      a3 = objc_msgSend(v6, "BOOLValue");
    }

  }
  return a3;
}

double RCRound(double a1)
{
  return round(a1);
}

double RCFractionalPart(double a1)
{
  BOOL v1;
  double v2;
  double result;

  v1 = a1 <= 0.0;
  v2 = -(-a1 - floor(-a1));
  result = a1 - floor(a1);
  if (v1)
    return v2;
  return result;
}

double RCClamp(double a1, double a2, double a3)
{
  double v4;

  v4 = a2;
  if (a3 < a2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    RCClamp_cold_1();
  if (a1 >= v4)
  {
    v4 = a1;
    if (a1 > a3)
      return a3;
  }
  return v4;
}

unint64_t RCClampUInt64s(unint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;

  if (a1 >= a3)
    v3 = a3;
  else
    v3 = a1;
  if (a1 >= a2)
    return v3;
  else
    return a2;
}

double RCMix(double a1, double a2, double a3)
{
  return a1 + (a2 - a1) * a3;
}

double RCRandom()
{
  return (double)random() / 2147483650.0;
}

double RCRandomBetween(double a1, double a2)
{
  return a1 + (a2 - a1) * ((double)random() / 2147483650.0);
}

double RCReverseSquare(double a1)
{
  return 1.0 - (1.0 - a1) * (1.0 - a1);
}

long double RCSineMap(double a1)
{
  return (sin(a1 * 3.14159265 + -1.57079633) + 1.0) * 0.5;
}

void RCCheckedDynamicCast_cold_1(objc_class *a1)
{
  id v2;
  NSString *v3;
  objc_class *v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0CB3940]);
  v3 = NSStringFromClass(a1);
  v4 = (objc_class *)objc_opt_class();
  *(_DWORD *)buf = 136315906;
  v6 = "id RCCheckedDynamicCast(Class, id<NSObject>)";
  v7 = 2080;
  v8 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCCast.m";
  v9 = 1024;
  v10 = 99;
  v11 = 2114;
  v12 = objc_msgSend(v2, "initWithFormat:", CFSTR("Unexpected object type in checked dynamic cast - Expected %@, Got %@"), v3, NSStringFromClass(v4));
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);
}

void RCCheckedStaticCast_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked static cast.  This is a serious problem and could lead to a crash, or worse."));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_1();
}

void RCCheckedProtocolCast_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked protocol cast"));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_1();
}

void RCCheckedStaticProtocolCast_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Unexpected object type in checked protocol cast. This is a serious problem and could lead to a crash, or worse."));
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v0, "*** Assertion failure: %s %s:%d %{public}@", v1, v2, v3, v4, 2u);
  OUTLINED_FUNCTION_4_1();
}

void RCPerformBlockOnMainThread_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCPerformIfNonNil_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCWaitUntilBlockIsInvoked_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupIsEmpty_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupNotifyWithTimeout_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupNotifyWithTimeout_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"queue", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupNotifyWithTimeout_cold_3()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCHandleOperationTimeout_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"timeoutHandler", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCHandleOperationTimeout_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"timeoutQueue", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCHandleOperationCancellation_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cancellationHandler", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCHandleOperationCancellation_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"cancellationTrigger", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupWrap_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCDispatchGroupWrap_cold_2()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"group", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCRepeat_cold_1()
{
  void *v0;
  int v1;
  int v2;
  int v3;
  int v4;
  int v5;
  uint64_t v6;

  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"));
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_1A1FB5000, MEMORY[0x1E0C81028], v1, "*** Assertion failure: %s %s:%d %{public}@", v2, v3, v4, v5, (uint64_t)"block", v6, 2u);

  OUTLINED_FUNCTION_2_0();
}

void RCClamp_cold_1()
{
  void *v0;
  uint8_t buf[4];
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  int v6;
  __int16 v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Invalid parameter not satisfying %s"), "max >= min");
  *(_DWORD *)buf = 136315906;
  v2 = "CGFloat RCClamp(CGFloat, CGFloat, CGFloat)";
  v3 = 2080;
  v4 = "/Library/Caches/com.apple.xbs/Sources/RemoteConfiguration/RemoteConfiguration/Utilities/RCMath.m";
  v5 = 1024;
  v6 = 44;
  v7 = 2114;
  v8 = v0;
  _os_log_error_impl(&dword_1A1FB5000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "*** Assertion failure: %s %s:%d %{public}@", buf, 0x26u);

}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint32_t arc4random_uniform(uint32_t __upper_bound)
{
  return MEMORY[0x1E0C81588](*(_QWORD *)&__upper_bound);
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

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_block_t dispatch_block_create_with_qos_class(dispatch_block_flags_t flags, dispatch_qos_class_t qos_class, int relative_priority, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C68](flags, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority, block);
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

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82D48](group, timeout);
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

void dispatch_source_merge_data(dispatch_source_t source, uintptr_t value)
{
  MEMORY[0x1E0C82F40](source, value);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
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

uint64_t nw_activity_activate()
{
  return MEMORY[0x1E0CCEDE0]();
}

uint64_t nw_activity_complete_with_reason()
{
  return MEMORY[0x1E0CCEDE8]();
}

uint64_t nw_activity_create()
{
  return MEMORY[0x1E0CCEE00]();
}

uint64_t nw_activity_create_from_token()
{
  return MEMORY[0x1E0CCEE08]();
}

uint64_t nw_activity_set_parent_activity()
{
  return MEMORY[0x1E0CCEE50]();
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x1E0C849A0]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

int pthread_mutex_destroy(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E18](a1);
}

int pthread_mutex_init(pthread_mutex_t *a1, const pthread_mutexattr_t *a2)
{
  return MEMORY[0x1E0C84E20](a1, a2);
}

int pthread_mutex_lock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E28](a1);
}

int pthread_mutex_unlock(pthread_mutex_t *a1)
{
  return MEMORY[0x1E0C84E38](a1);
}

int pthread_mutexattr_init(pthread_mutexattr_t *a1)
{
  return MEMORY[0x1E0C84E48](a1);
}

int pthread_mutexattr_settype(pthread_mutexattr_t *a1, int a2)
{
  return MEMORY[0x1E0C84E60](a1, *(_QWORD *)&a2);
}

uint64_t random(void)
{
  return MEMORY[0x1E0C84FC0]();
}

long double sin(long double __x)
{
  long double result;

  MEMORY[0x1E0C85418](__x);
  return result;
}

