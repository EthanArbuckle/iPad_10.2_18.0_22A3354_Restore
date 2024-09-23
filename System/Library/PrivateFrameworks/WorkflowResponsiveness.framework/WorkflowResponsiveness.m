void WRRangesSortAndCoalesce(unsigned int *a1)
{
  size_t v1;
  unint64_t v3;
  uint64_t v4;
  unsigned int v5;
  unint64_t i;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  uint64_t v10;
  unint64_t v11;
  unint64_t *v12;
  unint64_t v13;
  _QWORD *v14;

  v1 = *a1;
  if ((_DWORD)v1)
  {
    mergesort_b(*((void **)a1 + 1), v1, 0x10uLL, &__block_literal_global_419);
    v3 = *a1;
    if (v3 >= 2)
    {
      v4 = 0;
      v5 = 0;
      for (i = 1; i < v3; ++i)
      {
        v7 = *((_QWORD *)a1 + 1);
        v8 = *(_QWORD *)(v7 + v4 + 16);
        v9 = *(_QWORD *)(v7 + v4 + 24);
        if (v9 > v8)
        {
          v10 = v7 + 16 * v5;
          v13 = *(_QWORD *)(v10 + 8);
          v12 = (unint64_t *)(v10 + 8);
          v11 = v13;
          if (v13 >= v8)
          {
            if (v11 < v9)
              *v12 = v9;
            *(_QWORD *)(v7 + v4 + 24) = v8;
          }
          else
          {
            *(_OWORD *)(v7 + 16 * ++v5) = *(_OWORD *)(v7 + v4 + 16);
            v3 = *a1;
          }
        }
        v4 += 16;
      }
      if (v5)
        goto LABEL_14;
    }
    v14 = (_QWORD *)*((_QWORD *)a1 + 1);
    if (v14[1] > *v14)
    {
      v5 = 0;
LABEL_14:
      *a1 = v5 + 1;
      return;
    }
    *a1 = 0;
    free(v14);
    *((_QWORD *)a1 + 1) = 0;
  }
}

void sub_24A5B7A98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,char a44)
{
  _Block_object_dispose(&a44, 8);
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

#error "24A5B95A4: call analysis failed (funcsize=151)"

BOOL PlaceholderNameMatches(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "rangeOfString:options:range:", v4, 8, 5, objc_msgSend(v3, "length") - 5);
  v7 = v6;

  v8 = v5 == 5 && v7 == objc_msgSend(v3, "length") - 5;
  return v8;
}

void sub_24A5C0BE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,char a35)
{
  _Block_object_dispose(&a35, 8);
  _Unwind_Resume(a1);
}

void sub_24A5C3460(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_24A5C3B40(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_list va;

  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t WRProcessIsBeingDebugged(int a1)
{
  int v3;
  NSObject *v4;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v6 = 0u;
  v7 = 0u;
  memset(v5, 0, sizeof(v5));
  if (proc_pidinfo(a1, 13, 1uLL, v5, 64))
  {
    if ((v6 & 2) != 0)
      return 1;
  }
  else
  {
    v3 = *__error();
    _wrlog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      WRProcessIsBeingDebugged_cold_1(a1, v4);

    *__error() = v3;
  }
  return 0;
}

void sub_24A5C7DB8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 120), 8);
  _Unwind_Resume(a1);
}

id WRSanitizeForCA(void *a1)
{
  id v1;
  void *v2;
  void *v3;

  v1 = a1;
  if (v1)
  {
    if (WRSanitizeForCA_onceToken != -1)
      dispatch_once(&WRSanitizeForCA_onceToken, &__block_literal_global_281);
    objc_msgSend(v1, "componentsSeparatedByCharactersInSet:", WRSanitizeForCA_removedCharacters);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "componentsJoinedByString:", &stru_251BE5608);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

void OUTLINED_FUNCTION_3(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_4(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_9(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_11()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_16(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_20(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x1Cu);
}

void OUTLINED_FUNCTION_21(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_22(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x26u);
}

const char *OUTLINED_FUNCTION_27()
{
  void *v0;

  return object_getClassName(v0);
}

int *OUTLINED_FUNCTION_28()
{
  return __error();
}

uint64_t OUTLINED_FUNCTION_30()
{
  uint64_t v0;

  return v0;
}

void OUTLINED_FUNCTION_31(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0x12u);
}

void OUTLINED_FUNCTION_33(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x20u);
}

void OUTLINED_FUNCTION_34(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

void OUTLINED_FUNCTION_35(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

void OUTLINED_FUNCTION_36(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x20u);
}

uint64_t OUTLINED_FUNCTION_37()
{
  uint64_t v0;

  return v0;
}

uint64_t OUTLINED_FUNCTION_38(uint64_t a1)
{
  return *(_QWORD *)a1;
}

uint64_t OUTLINED_FUNCTION_40()
{
  void *v0;

  return objc_msgSend(v0, "startMachContinuousTime");
}

uint64_t OUTLINED_FUNCTION_42()
{
  uint64_t v0;

  return v0;
}

id _wrlog()
{
  if (_wrlog_onceToken != -1)
    dispatch_once(&_wrlog_onceToken, &__block_literal_global_0);
  return (id)_wrlog_log;
}

void ___wrlog_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.workflow_responsiveness", "wrlogging");
  v1 = (void *)_wrlog_log;
  _wrlog_log = (uint64_t)v0;

}

id DictGetType(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  v6 = a2;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    goto LABEL_6;
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a4)
    {
      object_getClassName(v7);
      WRMakeError(6, CFSTR("Key %@: unexpected value type %s"), v9, v10, v11, v12, v13, v14, (uint64_t)v6);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
LABEL_6:
    v8 = 0;
    goto LABEL_7;
  }
  v8 = v7;
LABEL_7:

  return v8;
}

id DictGetNumber(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a1;
  v7 = objc_opt_class();
  DictGetType(v6, v5, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id DictGetString(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a1;
  v7 = objc_opt_class();
  DictGetType(v6, v5, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id DictGetArray(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a1;
  v7 = objc_opt_class();
  DictGetType(v6, v5, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

id DictGetDict(void *a1, void *a2, _QWORD *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a2;
  v6 = a1;
  v7 = objc_opt_class();
  DictGetType(v6, v5, v7, a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

uint64_t ArrayDoAllClassesMatch(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v6 = a1;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = a2;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v11);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {
          if (a4)
          {
            object_getClassName(v12);
            WRMakeError(6, CFSTR("Key %@: unexpected value type %s in array"), v14, v15, v16, v17, v18, v19, (uint64_t)v6);
            v13 = 0;
            *a4 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            v13 = 0;
          }
          goto LABEL_13;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 1;
LABEL_13:

  return v13;
}

id DictGetArrayOfClass(void *a1, void *a2, uint64_t a3, _QWORD *a4)
{
  id v7;
  void *v8;
  id v9;

  v7 = a2;
  DictGetArray(a1, v7, a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && ArrayDoAllClassesMatch(v7, v8, a3, a4))
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

uint64_t WRIsAppleInternal()
{
  if (WRIsAppleInternal_onceToken != -1)
    dispatch_once(&WRIsAppleInternal_onceToken, &__block_literal_global_9);
  return WRIsAppleInternal_appleInternal;
}

uint64_t WRIsSeedBuild()
{
  return 0;
}

id WRCreateOSTransaction(char *__format, ...)
{
  char __str[512];
  uint64_t v3;
  va_list va;

  va_start(va, __format);
  v3 = *MEMORY[0x24BDAC8D0];
  vsnprintf(__str, 0x200uLL, __format, va);
  return (id)os_transaction_create();
}

id WRMakeError(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;

  v10 = (objc_class *)MEMORY[0x24BDD17C8];
  v11 = a2;
  v12 = (void *)objc_msgSend([v10 alloc], "initWithFormat:arguments:", v11, &a9);

  v13 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v12, *MEMORY[0x24BDD0BA0], 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithDomain:code:userInfo:", CFSTR("WorkflowResponsivenessError"), a1, v14);

  return v15;
}

id WRMakeErrorWithUnderlyingError(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  objc_class *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;

  v11 = (objc_class *)MEMORY[0x24BDD17C8];
  v12 = a3;
  v13 = a2;
  v14 = (void *)objc_msgSend([v11 alloc], "initWithFormat:arguments:", v12, &a9);

  v15 = objc_alloc(MEMORY[0x24BDD1540]);
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjectsAndKeys:", v14, *MEMORY[0x24BDD0BA0], v13, *MEMORY[0x24BDD1398], 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = (void *)objc_msgSend(v15, "initWithDomain:code:userInfo:", CFSTR("WorkflowResponsivenessError"), a1, v16);
  return v17;
}

id AllWorkflowKeys()
{
  if (AllWorkflowKeys_onceToken != -1)
    dispatch_once(&AllWorkflowKeys_onceToken, &__block_literal_global_1);
  return (id)AllWorkflowKeys_allWorkflowKeys;
}

id AllSignpostKeys()
{
  if (AllSignpostKeys_onceToken != -1)
    dispatch_once(&AllSignpostKeys_onceToken, &__block_literal_global_66);
  return (id)AllSignpostKeys_allSignpostKeys;
}

id AllDiagnosticKeys()
{
  if (AllDiagnosticKeys_onceToken != -1)
    dispatch_once(&AllDiagnosticKeys_onceToken, &__block_literal_global_67);
  return (id)AllDiagnosticKeys_allDiagnosticKeys;
}

id WRCheckForBadWorkflowDict(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  AllWorkflowKeys();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadWorkflowDict_block_invoke;
  v6[3] = &unk_251BE45A8;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_24A5CA74C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

id WRCheckForBadSignpostDict(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  AllSignpostKeys();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadSignpostDict_block_invoke;
  v6[3] = &unk_251BE45A8;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_24A5CAD18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WRCheckForBadDiagnosticDict(void *a1)
{
  id v1;
  void *v2;
  id v3;
  id v4;
  _QWORD v6[4];
  id v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v1 = a1;
  AllDiagnosticKeys();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__0;
  v13 = __Block_byref_object_dispose__0;
  v14 = 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __WRCheckForBadDiagnosticDict_block_invoke;
  v6[3] = &unk_251BE45A8;
  v3 = v2;
  v7 = v3;
  v8 = &v9;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v6);
  v4 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v4;
}

void sub_24A5CAE10(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id WRValidateSignpostDictLeafEntry(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v8;
  char v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a1;
  v4 = a2;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("start")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("end")) & 1) != 0
    || (objc_msgSend(v3, "isEqualToString:", CFSTR("network_bound")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("disabled")))
  {
    WRValidateBool(v4, v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v3, "isEqualToString:", CFSTR("name")))
    {
      v8 = v4;
      v9 = 20;
    }
    else if (objc_msgSend(v3, "isEqualToString:", CFSTR("end_group")))
    {
      v8 = v4;
      v9 = 4;
    }
    else
    {
      if ((objc_msgSend(v3, "isEqualToString:", CFSTR("subsystem")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("category")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("event_identifier_field_name")) & 1) == 0
        && (objc_msgSend(v3, "isEqualToString:", CFSTR("individuation_field_name")) & 1) == 0
        && !objc_msgSend(v3, "isEqualToString:", CFSTR("environment_field_names")))
      {
        WRMakeError(1, CFSTR("Unknown signpost leaf key %@"), v10, v11, v12, v13, v14, v15, (uint64_t)v3);
        v5 = objc_claimAutoreleasedReturnValue();
        goto LABEL_6;
      }
      v8 = v4;
      v9 = 1;
    }
    WRValidateString(v8, v9, v3);
    v5 = objc_claimAutoreleasedReturnValue();
  }
LABEL_6:
  v6 = (void *)v5;

  return v6;
}

id WRValidateString(void *a1, char a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;

  v5 = a1;
  v6 = a3;
  if ((a2 & 1) != 0)
  {
    v8 = 0;
    goto LABEL_15;
  }
  objc_msgSend(MEMORY[0x24BDD1690], "alphanumericCharacterSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addCharactersInString:", CFSTR("_"));
  if ((a2 & 2) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceAndNewlineCharacterSet");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "formUnionWithCharacterSet:", v9);

    if ((a2 & 8) == 0)
    {
LABEL_6:
      if ((a2 & 0x10) != 0)
        objc_msgSend(v7, "addCharactersInString:", CFSTR("."));
      goto LABEL_11;
    }
  }
  else
  {
    if ((a2 & 4) != 0)
      objc_msgSend(v7, "addCharactersInString:", CFSTR(" "));
    if ((a2 & 8) == 0)
      goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x24BDD14A8], "punctuationCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "formUnionWithCharacterSet:", v10);

LABEL_11:
  objc_msgSend(v7, "invert");
  v11 = objc_msgSend(v5, "rangeOfCharacterFromSet:", v7);
  if (v11 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    objc_msgSend(v5, "substringWithRange:", v11, v12);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    WRMakeError(8, CFSTR("%@ contains invalid characters (\"%@\": \"%@\")"), v13, v14, v15, v16, v17, v18, (uint64_t)v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_15:

  return v8;
}

id WRValidateDouble(void *a1, void *a2, double a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  void *v14;

  v5 = a2;
  objc_msgSend(a1, "doubleValue");
  if (v12 < 0.0)
  {
    WRMakeError(8, CFSTR("%@ is negative (%f)"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
LABEL_9:
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (a3 != 0.0 && v12 > a3)
  {
    WRMakeError(8, CFSTR("%@ is above max value (%f > %f)"), v6, v7, v8, v9, v10, v11, (uint64_t)v5);
    goto LABEL_9;
  }
  v14 = 0;
LABEL_10:

  return v14;
}

id WRValidateBool(void *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v3 = a2;
  if (objc_msgSend(a1, "intValue") < 2)
  {
    v10 = 0;
  }
  else
  {
    WRMakeError(8, CFSTR("%@ is not a BOOL (%d)"), v4, v5, v6, v7, v8, v9, (uint64_t)v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v10;
}

void OUTLINED_FUNCTION_0_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 0xCu);
}

const __CFString *WRTaskingKeyForNewWorkflows()
{
  return CFSTR("WR.workflows");
}

__CFString *WRTaskingKeyForWorkflowTelemetryEnabled(void *a1)
{
  objc_class *v1;
  id v2;
  __CFString *v3;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BDD17C8];
    v2 = a1;
    v3 = (__CFString *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("WR.%@.telemetryEnabled"), v2);

  }
  else
  {
    v3 = CFSTR("WR.telemetryEnabled");
  }
  return v3;
}

id WROverrideDiagnosticsEnablementForWorkflow(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  WRTaskingKeyForWorkflowDiagnosticsEnabled(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WRTaskingNumberForKey(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WRTaskingNumberForKey(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a1;
  v4 = objc_opt_class();
  WRTaskingValueForKeyOfType(v3, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

__CFString *WRTaskingKeyForWorkflowDiagnosticsEnabled(void *a1)
{
  objc_class *v1;
  id v2;
  __CFString *v3;

  if (a1)
  {
    v1 = (objc_class *)MEMORY[0x24BDD17C8];
    v2 = a1;
    v3 = (__CFString *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("WR.%@.diagnosticsEnabled"), v2);

  }
  else
  {
    v3 = CFSTR("WR.diagnosticsEnabled");
  }
  return v3;
}

id WROverrideTelemetryEnablementForWorkflow(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;

  WRTaskingKeyForWorkflowTelemetryEnabled(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WRTaskingNumberForKey(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id WROverrideDiagnosticForWorkflow(void *a1, void *a2, _QWORD *a3)
{
  return _WROverrideDiagnostics(a1, 0, a2, a3);
}

id _WROverrideDiagnostics(void *a1, void *a2, void *a3, _QWORD *a4)
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  WRTaskingKeyBaseForDiagnostic(a1, a2, a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  AllDiagnosticKeys();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  _WROverrideDict(v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    WRCheckForBadDiagnosticDict(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v11 = 0;
      if (a4)
        *a4 = objc_retainAutorelease(v9);
    }
    else
    {
      v11 = (void *)objc_msgSend(v8, "copy");
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

id WROverrideDiagnosticsEnablement(_QWORD *a1)
{
  return WRTaskingNumberForKey(CFSTR("WR.diagnosticsEnabled"), a1);
}

id WROverrideTelemetryEnablement(_QWORD *a1)
{
  return WRTaskingNumberForKey(CFSTR("WR.telemetryEnabled"), a1);
}

id WROverrideForWorkflow(void *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  WRTaskingKeyBaseForWorkflow(a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  AllWorkflowKeys();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  _WROverrideDict(v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("signposts"));
    objc_msgSend(v6, "setObject:forKeyedSubscript:", 0, CFSTR("diagnostics"));
    WRCheckForBadWorkflowDict(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
    {
      v9 = 0;
      if (a2)
        *a2 = objc_retainAutorelease(v7);
    }
    else
    {
      v9 = (void *)objc_msgSend(v6, "copy");
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

id _WROverrideDict(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = a2;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend(v3, "stringByAppendingString:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_opt_class();
        WRTaskingValueForKeyOfType(v11, v12, 0);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
        {
          if (!v7)
            v7 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v7, "setObject:forKeyedSubscript:", v13, v10);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id WRTaskingKeyBaseForWorkflow(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("WR.%@."), v2);

  return v3;
}

id WROverrideForSignpost(void *a1, void *a2, _QWORD *a3)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  WRTaskingKeyBaseForSignpost(a1, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AllSignpostKeys();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _WROverrideDict(v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "setObject:forKeyedSubscript:", 0, CFSTR("diagnostics"));
    WRCheckForBadSignpostDict(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (v8)
    {
      v10 = 0;
      if (a3)
        *a3 = objc_retainAutorelease(v8);
    }
    else
    {
      v10 = (void *)objc_msgSend(v7, "copy");
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

id WRTaskingKeyBaseForSignpost(void *a1, void *a2)
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;

  v3 = (objc_class *)MEMORY[0x24BDD17C8];
  v4 = a2;
  v5 = a1;
  v6 = (void *)objc_msgSend([v3 alloc], "initWithFormat:", CFSTR("WR.%@.%@."), v5, v4);

  return v6;
}

id WROverrideNewSignpostsForWorkflow(void *a1, uint64_t *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  uint64_t *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = v3;
  v44 = 0;
  if (a2)
    *a2 = 0;
  else
    a2 = &v44;
  WRTaskingKeyForNewSignposts(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WRTaskingStringForKey(v5, a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "componentsSeparatedByString:", CFSTR(","));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v7, "count"));
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v9 = v7;
    v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
    if (v39)
    {
      v10 = *(_QWORD *)v41;
      v37 = v6;
      v38 = *(_QWORD *)v41;
LABEL_7:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v41 != v10)
          objc_enumerationMutation(v9);
        v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v11);
        WROverrideForSignpost(v4, v12, a2);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          break;
        v20 = v13;
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = v21;
        if (v21)
        {
          if ((objc_msgSend(v21, "isEqualToString:", v12) & 1) == 0)
          {
            WRMakeError(7, CFSTR("Workflow %@ new signpost %@ has wrong name %@"), v23, v24, v25, v26, v27, v28, (uint64_t)v4);
            *a2 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();

LABEL_21:
            v35 = 0;
            v6 = v37;
            goto LABEL_22;
          }
        }
        else
        {
          v29 = v9;
          v30 = a2;
          v31 = v8;
          v32 = v4;
          v33 = (void *)objc_msgSend(v20, "mutableCopy");
          objc_msgSend(v33, "setObject:forKeyedSubscript:", v12, CFSTR("name"));
          v34 = objc_msgSend(v33, "copy");

          v4 = v32;
          v8 = v31;
          a2 = v30;
          v9 = v29;
          v10 = v38;
          v20 = (void *)v34;
        }
        objc_msgSend(v8, "addObject:", v20);

        if (v39 == ++v11)
        {
          v6 = v37;
          v39 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
          if (v39)
            goto LABEL_7;
          goto LABEL_17;
        }
      }
      if (!*a2)
      {
        WRMakeError(7, CFSTR("No override dictionary for workflow %@ new signpost %@"), v14, v15, v16, v17, v18, v19, (uint64_t)v4);
        *a2 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_21;
    }
LABEL_17:

    v35 = (void *)objc_msgSend(v8, "copy");
LABEL_22:

  }
  else
  {
    v35 = 0;
  }

  return v35;
}

id WRTaskingStringForKey(void *a1, _QWORD *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a1;
  v4 = objc_opt_class();
  WRTaskingValueForKeyOfType(v3, v4, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

id WRTaskingKeyForNewSignposts(void *a1)
{
  objc_class *v1;
  id v2;
  void *v3;

  v1 = (objc_class *)MEMORY[0x24BDD17C8];
  v2 = a1;
  v3 = (void *)objc_msgSend([v1 alloc], "initWithFormat:", CFSTR("WR.%@.%@"), v2, CFSTR("signposts"));

  return v3;
}

id WROverrideNewWorkflows(uint64_t *a1)
{
  uint64_t *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
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
  uint64_t v27;
  void *v28;
  void *v29;
  void *v31;
  id obj;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37 = 0;
  if (a1)
  {
    v1 = a1;
    *a1 = 0;
  }
  else
  {
    v1 = &v37;
  }
  WRTaskingStringForKey(CFSTR("WR.workflows"), v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(","));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v4, "count"));
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v34;
      obj = v6;
      v31 = v3;
LABEL_7:
      v10 = 0;
      while (1)
      {
        if (*(_QWORD *)v34 != v9)
          objc_enumerationMutation(obj);
        v11 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v10);
        WROverrideForWorkflow(v11, v1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v12, "mutableCopy");

        if (!v13)
        {
          if (*v1)
            goto LABEL_26;
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjectsAndKeys:", v11, CFSTR("name"), 0);
        }
        objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("name"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if ((objc_msgSend(v14, "isEqualToString:", v11) & 1) == 0)
          {
            WRMakeError(7, CFSTR("Workflow %@ has wrong name %@"), v16, v17, v18, v19, v20, v21, (uint64_t)v11);
            *v1 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
LABEL_25:

LABEL_26:
            v6 = obj;

            v29 = 0;
            v3 = v31;
            goto LABEL_27;
          }
        }
        else
        {
          objc_msgSend(v13, "setObject:forKeyedSubscript:", v11, CFSTR("name"));
        }
        WROverrideNewSignpostsForWorkflow(v11, v1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          if (!*v1)
          {
            WRMakeError(7, CFSTR("No signposts for new workflow %@"), v22, v23, v24, v25, v26, v27, (uint64_t)v11);
            *v1 = (uint64_t)(id)objc_claimAutoreleasedReturnValue();
          }

          goto LABEL_25;
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v28, CFSTR("signposts"));
        objc_msgSend(v5, "addObject:", v13);

        if (v8 == ++v10)
        {
          v6 = obj;
          v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
          v3 = v31;
          if (v8)
            goto LABEL_7;
          break;
        }
      }
    }

    v29 = (void *)objc_msgSend(v5, "copy");
LABEL_27:

  }
  else
  {
    v29 = 0;
  }

  return v29;
}

id WRTaskingDictForWorkflow(void *a1, void *a2)
{
  id v3;
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v28;
  uint64_t v29;
  void (*v30)(uint64_t, void *, void *);
  void *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;

  v3 = a1;
  v4 = (objc_class *)MEMORY[0x24BDBCED8];
  v5 = a2;
  v6 = objc_alloc_init(v4);
  objc_msgSend(v3, "name");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("WR.workflows"));
  objc_msgSend(v3, "encodedDict");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v10 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v11 = objc_alloc_init(MEMORY[0x24BDBCED8]);
  objc_msgSend(v5, "encodedDict");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __WRTaskingDictForWorkflow_block_invoke;
  v38[3] = &unk_251BE4AD0;
  v15 = v13;
  v39 = v15;
  v16 = v11;
  v40 = v16;
  v17 = v10;
  v41 = v17;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v38);
  v35[0] = v14;
  v35[1] = 3221225472;
  v35[2] = __WRTaskingDictForWorkflow_block_invoke_2;
  v35[3] = &unk_251BE45D0;
  v36 = v9;
  v18 = v16;
  v37 = v18;
  objc_msgSend(v15, "enumerateKeysAndObjectsUsingBlock:", v35);
  v19 = v18;
  WRTaskingKeyBaseForWorkflow(v7);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v14;
  v29 = 3221225472;
  v30 = __WRTaskingDictForWorkflow_block_invoke_25;
  v31 = &unk_251BE4AD0;
  v21 = v6;
  v32 = v21;
  v22 = v7;
  v33 = v22;
  v34 = v20;
  v23 = v20;
  objc_msgSend(v19, "enumerateKeysAndObjectsUsingBlock:", &v28);
  if (objc_msgSend(v17, "count", v28, v29, v30, v31))
  {
    WRTaskingKeyForNewSignposts(v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "componentsJoinedByString:", CFSTR(","));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v25, v24);

  }
  v26 = (void *)objc_msgSend(v21, "copy");

  return v26;
}

id _WRTaskingFilteredDiagnostics(void *a1, void *a2)
{
  id v3;
  uint64_t i;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  int v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t k;
  void *v32;
  char v33;
  id v34;
  int v35;
  NSObject *v36;
  id v37;
  _BYTE *v39;
  id v40;
  id v41;
  uint64_t v42;
  uint64_t v43;
  id obj;
  id v45;
  id v46;
  void *v47;
  uint64_t v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  char v53;
  _BYTE v54[15];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  _QWORD v59[5];
  id v60;
  _QWORD v61[4];
  id v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  char v68;
  _BYTE v69[7];
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  _BYTE v75[128];
  _BYTE v76[128];
  _BYTE v77[128];
  uint64_t v78;

  v78 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v40 = a2;
  v41 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v70 = 0u;
  v71 = 0u;
  v72 = 0u;
  v73 = 0u;
  obj = v3;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v71;
    v39 = v69;
    do
    {
      for (i = 0; i != v43; ++i)
      {
        if (*(_QWORD *)v71 != v42)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("name"), v39);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          v47 = v5;
          v45 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          v64 = 0u;
          v65 = 0u;
          v66 = 0u;
          v67 = 0u;
          v7 = v40;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
          if (v8)
          {
            v9 = v8;
            v10 = *(_QWORD *)v65;
LABEL_9:
            v11 = 0;
            while (1)
            {
              if (*(_QWORD *)v65 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v11);
              objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("name"));
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "isEqualToString:", v6);

              if ((v14 & 1) != 0)
                break;
              if (v9 == ++v11)
              {
                v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
                if (v9)
                  goto LABEL_9;
                goto LABEL_15;
              }
            }
            v16 = v12;

            v15 = v45;
            if (v16)
              goto LABEL_18;
          }
          else
          {
LABEL_15:

            v15 = v45;
          }
          objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], CFSTR("is_new"));
          v16 = 0;
LABEL_18:
          v17 = MEMORY[0x24BDAC760];
          v61[0] = MEMORY[0x24BDAC760];
          v61[1] = 3221225472;
          v61[2] = ___WRTaskingFilteredDiagnostics_block_invoke;
          v61[3] = &unk_251BE45D0;
          v18 = v16;
          v62 = v18;
          v19 = v15;
          v63 = v19;
          objc_msgSend(v47, "enumerateKeysAndObjectsUsingBlock:", v61);
          v59[0] = v17;
          v59[1] = 3221225472;
          v59[2] = ___WRTaskingFilteredDiagnostics_block_invoke_2;
          v59[3] = &unk_251BE45D0;
          v59[4] = v47;
          v20 = v19;
          v60 = v20;
          objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v59);
          if (objc_msgSend(v20, "count"))
          {
            objc_msgSend(v20, "setObject:forKeyedSubscript:", v6, CFSTR("name"));
            objc_msgSend(v41, "addObject:", v20);
          }

        }
        else
        {
          v21 = *__error();
          _wrlog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
            _WRTaskingFilteredDiagnostics_cold_1(&v68, v39);

          *__error() = v21;
        }

      }
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v77, 16);
    }
    while (v43);
  }

  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v46 = v40;
  v23 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
  if (v23)
  {
    v24 = v23;
    v48 = *(_QWORD *)v56;
    do
    {
      for (j = 0; j != v24; ++j)
      {
        if (*(_QWORD *)v56 != v48)
          objc_enumerationMutation(v46);
        objc_msgSend(*(id *)(*((_QWORD *)&v55 + 1) + 8 * j), "objectForKeyedSubscript:", CFSTR("name"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        if (v26)
        {
          v51 = 0u;
          v52 = 0u;
          v49 = 0u;
          v50 = 0u;
          v27 = obj;
          v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
          if (v28)
          {
            v29 = v28;
            v30 = *(_QWORD *)v50;
            while (2)
            {
              for (k = 0; k != v29; ++k)
              {
                if (*(_QWORD *)v50 != v30)
                  objc_enumerationMutation(v27);
                objc_msgSend(*(id *)(*((_QWORD *)&v49 + 1) + 8 * k), "objectForKeyedSubscript:", CFSTR("name"));
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                v33 = objc_msgSend(v32, "isEqualToString:", v26);

                if ((v33 & 1) != 0)
                {

                  goto LABEL_45;
                }
              }
              v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v49, v74, 16);
              if (v29)
                continue;
              break;
            }
          }

          v34 = objc_alloc_init(MEMORY[0x24BDBCED8]);
          objc_msgSend(v34, "setObject:forKeyedSubscript:", v26, CFSTR("name"));
          objc_msgSend(v34, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], CFSTR("gather_tailspin"));
          objc_msgSend(v41, "addObject:", v34);

        }
        else
        {
          v35 = *__error();
          _wrlog();
          v36 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT))
            _WRTaskingFilteredDiagnostics_cold_1(&v53, v54);

          *__error() = v35;
        }
LABEL_45:

      }
      v24 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v55, v75, 16);
    }
    while (v24);
  }

  if (objc_msgSend(v41, "count"))
    v37 = v41;
  else
    v37 = 0;

  return v37;
}

void _WRTaskingDictAddDiagnostics(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id obj;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  obj = v8;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v11)
  {
    v12 = v11;
    LODWORD(v13) = 0;
    v14 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("is_new"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          v13 = (v13 + 1);
          v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithFormat:", CFSTR("%u"), v13);
        }
        else
        {
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("name"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
        }
        v19 = v18;
        WRTaskingKeyBaseForDiagnostic(v9, v10, v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v24[0] = MEMORY[0x24BDAC760];
        v24[1] = 3221225472;
        v24[2] = ___WRTaskingDictAddDiagnostics_block_invoke;
        v24[3] = &unk_251BE4AD0;
        v25 = v19;
        v26 = v20;
        v27 = v7;
        v21 = v19;
        v22 = v20;
        objc_msgSend(v16, "enumerateKeysAndObjectsUsingBlock:", v24);

      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v12);
  }

}

id WRTaskingValueForKeyOfType(void *a1, uint64_t a2, _QWORD *a3)
{
  id v4;
  void *v5;
  id v6;
  const char *ClassName;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a1;
  if (a3)
    *a3 = 0;
  OSAGetDATaskingValue();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_opt_isKindOfClass() & 1) == 0)
  {
    if (a3)
    {
      ClassName = object_getClassName(v5);
      WRMakeError(6, CFSTR("Unexpected type %s for tasking value for key %@"), v8, v9, v10, v11, v12, v13, (uint64_t)ClassName);
      v6 = 0;
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    v6 = v5;
  }

  return v6;
}

id WRTaskingKeyBaseForDiagnostic(void *a1, void *a2, void *a3)
{
  id v5;
  objc_class *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v13;

  v5 = a2;
  v6 = (objc_class *)MEMORY[0x24BDD17C8];
  v7 = a3;
  v8 = a1;
  v9 = [v6 alloc];
  if (v5)
    v10 = objc_msgSend(v9, "initWithFormat:", CFSTR("WR.%@.%@.%@.%@."), v8, v5, CFSTR("diagnostics"), v7);
  else
    v10 = objc_msgSend(v9, "initWithFormat:", CFSTR("WR.%@.%@.%@."), v8, CFSTR("diagnostics"), v7, v13);
  v11 = (void *)v10;

  return v11;
}

void OUTLINED_FUNCTION_0_1(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, a5, 2u);
}

_BYTE *OUTLINED_FUNCTION_1_0(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

BOOL WRIsDisabledWorkflow(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _BOOL8 v7;
  int v8;
  NSObject *v9;

  v1 = a1;
  objc_msgSend(v1, "URLByStandardizingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "attributesOfItemAtPath:error:", v3, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "fileType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BDD0D40]))
        v7 = objc_msgSend(v5, "fileSize") == 0;
      else
        v7 = 0;

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v8 = *__error();
    _wrlog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
      WRIsDisabledWorkflow_cold_1();

    v7 = 0;
    *__error() = v8;
  }

  return v7;
}

void sub_24A5D0C40(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose(&STACK[0x480], 8);
  _Block_object_dispose(&STACK[0x4A0], 8);
  _Block_object_dispose(&STACK[0x510], 8);
  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_24A5D1408(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,uint64_t a44,uint64_t a45,uint64_t a46,char a47)
{
  _Block_object_dispose(&a47, 8);
  _Unwind_Resume(a1);
}

id _WRGetString(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v5 = a2;
  v6 = a3;
  objc_msgSend(a1, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  objc_msgSend(v10, "length");
  return v10;
}

void sub_24A5D3B10(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  id *v20;
  id *v21;

  objc_destroyWeak(v21);
  objc_destroyWeak(v20);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_2_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_5_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_7_0(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

void OUTLINED_FUNCTION_14_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 8u);
}

void OUTLINED_FUNCTION_15_0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void WRProcessIsBeingDebugged_cold_1(int a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = a1;
  v6 = 1024;
  v7 = v4;
  _os_log_error_impl(&dword_24A5B4000, a2, OS_LOG_TYPE_ERROR, "[%d] Unable to get proc info, assuming not being debugged: %{errno}d", (uint8_t *)v5, 0xEu);
  OUTLINED_FUNCTION_32();
}

#error "24A5D8994: call analysis failed (funcsize=38)"

#error "24A5D8AC4: call analysis failed (funcsize=38)"

#error "24A5D8E8C: call analysis failed (funcsize=39)"

void _WRTaskingFilteredDiagnostics_cold_1(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  OUTLINED_FUNCTION_1_0(a1, a2);
  OUTLINED_FUNCTION_0_1(&dword_24A5B4000, v2, v3, "nil diagnostic name", v4);
}

void WRIsDisabledWorkflow_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_13();
  OUTLINED_FUNCTION_0_0(&dword_24A5B4000, v0, v1, "Unable to get path for URL %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_24();
}

uint64_t AnalyticsSendEvent()
{
  return MEMORY[0x24BE1A1B0]();
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

uint64_t OSAGetDATaskingValue()
{
  return MEMORY[0x24BE29F78]();
}

uint64_t SPReportWorkflowResponsivenessDelay()
{
  return MEMORY[0x24BEDDEF0]();
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

int __maskrune(__darwin_ct_rune_t a1, unint64_t a2)
{
  return MEMORY[0x24BDAC838](*(_QWORD *)&a1, a2);
}

uint64_t __udivti3()
{
  return MEMORY[0x24BDAC940]();
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

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
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

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB8](attr, frequency);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

int fclonefileat(int a1, int a2, const char *a3, uint32_t a4)
{
  return MEMORY[0x24BDAE2D8](*(_QWORD *)&a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4);
}

int fclose(FILE *a1)
{
  return MEMORY[0x24BDAE2E0](a1);
}

FILE *__cdecl fdopen(int a1, const char *a2)
{
  return (FILE *)MEMORY[0x24BDAE300](*(_QWORD *)&a1, a2);
}

int ffsctl(int a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x24BDAE358](*(_QWORD *)&a1, a2, a3, *(_QWORD *)&a4);
}

char *__cdecl fgets(char *a1, int a2, FILE *a3)
{
  return (char *)MEMORY[0x24BDAE380](a1, *(_QWORD *)&a2, a3);
}

size_t fread(void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x24BDAE448](__ptr, __size, __nitems, __stream);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

int fstat(int a1, stat *a2)
{
  return MEMORY[0x24BDAE508](*(_QWORD *)&a1, a2);
}

uint64_t ftell(FILE *a1)
{
  return MEMORY[0x24BDAE530](a1);
}

uid_t geteuid(void)
{
  return MEMORY[0x24BDAE5F8]();
}

uint64_t ktrace_chunk_map_data()
{
  return MEMORY[0x24BECDF40]();
}

uint64_t ktrace_chunk_size()
{
  return MEMORY[0x24BECDF48]();
}

uint64_t ktrace_chunk_tag()
{
  return MEMORY[0x24BECDF50]();
}

uint64_t ktrace_chunk_unmap_data()
{
  return MEMORY[0x24BECDF58]();
}

uint64_t ktrace_chunk_version_major()
{
  return MEMORY[0x24BECDF60]();
}

uint64_t ktrace_config_create()
{
  return MEMORY[0x24BECDF68]();
}

uint64_t ktrace_config_destroy()
{
  return MEMORY[0x24BECDF70]();
}

uint64_t ktrace_config_get_reason()
{
  return MEMORY[0x24BECDF78]();
}

uint64_t ktrace_file_close()
{
  return MEMORY[0x24BECDFB8]();
}

uint64_t ktrace_file_iterate()
{
  return MEMORY[0x24BECDFD0]();
}

uint64_t ktrace_file_open()
{
  return MEMORY[0x24BECDFD8]();
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

void *__cdecl memmove(void *__dst, const void *__src, size_t __len)
{
  return (void *)MEMORY[0x24BDAEE98](__dst, __src, __len);
}

int mergesort_b(void *__base, size_t __nel, size_t __width, void *__compar)
{
  return MEMORY[0x24BDAEED8](__base, __nel, __width, __compar);
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

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x24BEDD468](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x24BDAF228](a1, *(_QWORD *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x24BDAF438]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x24BDAF4D8]();
}

int proc_pidinfo(int pid, int flavor, uint64_t arg, void *buffer, int buffersize)
{
  return MEMORY[0x24BDAF6F8](*(_QWORD *)&pid, *(_QWORD *)&flavor, arg, buffer, *(_QWORD *)&buffersize);
}

void *__cdecl reallocf(void *__ptr, size_t __size)
{
  return (void *)MEMORY[0x24BDAFAB8](__ptr, __size);
}

int strncmp(const char *__s1, const char *__s2, size_t __n)
{
  return MEMORY[0x24BDAFF68](__s1, __s2, __n);
}

uint64_t tailspin_dump_output_with_options()
{
  return MEMORY[0x24BEDE498]();
}

int unlink(const char *a1)
{
  return MEMORY[0x24BDB02B0](a1);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x24BDB0448](__str, __size, __format, a4);
}

