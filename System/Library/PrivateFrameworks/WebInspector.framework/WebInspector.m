void traceMessagePayloadIfKeyExists(uint64_t a1, void *a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;

  v4 = RWIMessageTraceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("__argument"));
    if (v5)
    {
      v6 = (void *)v5;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        v7 = objc_msgSend(v6, "objectForKeyedSubscript:", a1);
        if (v7)
        {
          v8 = v7;
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v8, 4);
            v10 = RWIMessageTraceLog();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
              traceMessagePayloadIfKeyExists_cold_1((uint64_t)v9, v10);

          }
        }
      }
    }
  }
}

void OUTLINED_FUNCTION_0(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0x16u);
}

void sub_21AD4CC30(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD4CD14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD4CE28(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD4CEF8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

void sub_21AD4CF60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)_RWITCPConnection;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_21AD4D164(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD4D37C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, void *a10)
{

  _Unwind_Resume(a1);
}

void sub_21AD4D53C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD4D7F4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD4D94C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD4D9FC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{
  void *v10;
  void *v11;

  v11 = v10;

  _Unwind_Resume(a1);
}

uint64_t OUTLINED_FUNCTION_0_0(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a2 = a4;
  *(_QWORD *)(a2 + 4) = a3;
  *(_WORD *)(a2 + 12) = 2082;
  *(_QWORD *)(a2 + 14) = result;
  return result;
}

void OUTLINED_FUNCTION_1_0(void *a1@<X0>, const char *a2@<X3>, uint8_t *a3@<X4>, NSObject *a4@<X8>)
{
  _os_log_error_impl(a1, a4, OS_LOG_TYPE_ERROR, a2, a3, 0x16u);
}

void OUTLINED_FUNCTION_2_1(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void OUTLINED_FUNCTION_1_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

void OUTLINED_FUNCTION_0_1(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

char *OUTLINED_FUNCTION_2_3(int *a1)
{
  return strerror(*a1);
}

int *OUTLINED_FUNCTION_4_0()
{
  return __error();
}

BOOL auditTokenHasEntitlement(_OWORD *a1, void *a2)
{
  __CFString *v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  _BOOL8 v10;
  CFTypeID v11;
  CFErrorRef error;
  audit_token_t token;

  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &token);
  v7 = v6;
  if (v6)
  {
    error = 0;
    v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, &error);
    v9 = v8;
    if (error)
    {
      NSLog(CFSTR("Unable to get entitlements for client task to verify entitlement %@. Error: %@"), v3, error);
      CFRelease(error);
      v10 = 0;
      if (!v9)
        goto LABEL_12;
    }
    else
    {
      if (!v8)
      {
        v10 = 0;
LABEL_12:
        CFRelease(v7);
        goto LABEL_13;
      }
      v11 = CFGetTypeID(v8);
      v10 = v11 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
    }
    CFRelease(v9);
    goto LABEL_12;
  }
  NSLog(CFSTR("Unable to create security task from audit token to verify entitlement %@."), v3);
  v10 = 0;
LABEL_13:

  return v10;
}

void sub_21AD4E87C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t RWIAutomationAvailabilityFromString(void *a1, uint64_t *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a1;
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIRAutomationAvailabilityNotAvailable")) & 1) != 0)
  {
    v4 = 0;
  }
  else if ((objc_msgSend(v3, "isEqualToString:", CFSTR("WIRAutomationAvailabilityAvailable")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("WIRAutomationAvailabilityUnknown")))
    {
      v5 = 0;
      goto LABEL_8;
    }
    v4 = 2;
  }
  *a2 = v4;
  v5 = 1;
LABEL_8:

  return v5;
}

const __CFString *RWINSStringFromAutomationAvailability(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("WIRAutomationAvailabilityNotAvailable");
  if (a1 == 1)
    v1 = CFSTR("WIRAutomationAvailabilityAvailable");
  if (a1 == 2)
    return CFSTR("WIRAutomationAvailabilityUnknown");
  else
    return v1;
}

const __CFString *NSStringFromRWIDebuggerAvailability(uint64_t a1)
{
  const __CFString *v1;

  v1 = CFSTR("Not Debuggable");
  if (a1 == 1)
    v1 = CFSTR("Debuggable (Not Visible)");
  if (a1 == 2)
    return CFSTR("Debuggable (Visible)");
  else
    return v1;
}

void sub_21AD4F70C(_Unwind_Exception *exception_object)
{
  const void *v1;

  if (v1)
    CFRelease(v1);
  _Unwind_Resume(exception_object);
}

id RWIDefaultLog()
{
  if (RWIDefaultLog_onceToken != -1)
    dispatch_once(&RWIDefaultLog_onceToken, &__block_literal_global);
  return (id)RWIDefaultLog_defaultLog;
}

id RWIMessageTraceLog()
{
  if (RWIMessageTraceLog_onceToken != -1)
    dispatch_once(&RWIMessageTraceLog_onceToken, &__block_literal_global_3);
  return (id)RWIMessageTraceLog_messageTraceLog;
}

id RWIMessageDumpStateLog()
{
  if (RWIMessageDumpStateLog_onceToken != -1)
    dispatch_once(&RWIMessageDumpStateLog_onceToken, &__block_literal_global_7);
  return (id)RWIMessageDumpStateLog_dumpStateLog;
}

uint64_t Inspector::toJSONObjectArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  WTF::JSONImpl::Array *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  _QWORD *v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  _QWORD *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!this)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("array"));
  v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  v7 = result;
  if (result)
  {
    v8 = *(_QWORD *)v21;
    v9 = *MEMORY[0x24BDBCAB8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v21 != v8)
          objc_enumerationMutation(this);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v5), v11);
        v12 = *a2;
        if (v11)
        {
          objc_msgSend(v11, "toJSONObject");
          v11 = v19;
        }
        v13 = (_QWORD *)(v12 + 16);
        v14 = *(unsigned int *)(v12 + 28);
        if ((_DWORD)v14 == *(_DWORD *)(v12 + 24))
        {
          v15 = v14 + (v14 >> 2);
          if (v15 >= 0x10)
            v16 = v15 + 1;
          else
            v16 = 16;
          if (v16 <= v14 + 1)
            v17 = v14 + 1;
          else
            v17 = v16;
          WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)v13, v17);
          v14 = *(unsigned int *)(v12 + 28);
          v18 = (_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * v14);
        }
        else
        {
          v18 = (_QWORD *)(*v13 + 8 * v14);
        }
        *v18 = v11;
        *(_DWORD *)(v12 + 28) = v14 + 1;
        v19 = 0;
        ++v10;
      }
      while (v7 != v10);
      result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_21AD4FB18(_Unwind_Exception *a1)
{
  _DWORD **v1;

  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

_DWORD **WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(_DWORD **a1)
{
  _DWORD *v2;

  v2 = *a1;
  *a1 = 0;
  if (v2)
  {
    if (*v2 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return a1;
}

uint64_t Inspector::toJSONStringArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  WTF::JSONImpl::Array *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const WTF::String *v13;
  uint64_t *v14;
  uint64_t v15;
  _QWORD *v16;
  uint64_t v17;
  _DWORD *v18;
  _DWORD *v19;
  _DWORD *v20;
  _DWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _DWORD *v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  if (!this)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("array"));
  v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  v7 = result;
  if (result)
  {
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x24BDBCAB8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(this);
        v11 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v5), v11);
        v12 = *a2;
        MEMORY[0x2207574E0](&v21, v11);
        WTF::JSONImpl::Value::create((WTF::JSONImpl::Value *)&v21, v13);
        v14 = (uint64_t *)(v12 + 16);
        v15 = *(unsigned int *)(v12 + 28);
        if ((_DWORD)v15 == *(_DWORD *)(v12 + 24))
        {
          v16 = (_QWORD *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v14, v15 + 1, (unint64_t)&v26);
          v15 = *(unsigned int *)(v12 + 28);
          v17 = *(_QWORD *)(v12 + 16);
          v18 = (_DWORD *)*v16;
          *v16 = 0;
        }
        else
        {
          v17 = *v14;
          v18 = v26;
          v26 = 0;
        }
        *(_QWORD *)(v17 + 8 * v15) = v18;
        *(_DWORD *)(v12 + 28) = v15 + 1;
        v19 = v26;
        v26 = 0;
        if (v19)
        {
          if (*v19 == 1)
            WTF::JSONImpl::Value::operator delete();
          else
            --*v19;
        }
        v20 = v21;
        v21 = 0;
        if (v20)
        {
          if (*v20 == 2)
            WTF::StringImpl::destroy();
          else
            *v20 -= 2;
        }
        ++v10;
      }
      while (v7 != v10);
      result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_21AD4FDEC(_Unwind_Exception *a1)
{
  _DWORD **v1;

  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONIntegerArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  WTF::JSONImpl::Array *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _DWORD *v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  if (!this)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("array"));
  v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  v7 = result;
  if (result)
  {
    v8 = *(_QWORD *)v20;
    v9 = *MEMORY[0x24BDBCAB8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v20 != v8)
          objc_enumerationMutation(this);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v5), v11);
        v12 = *a2;
        WTF::JSONImpl::Value::create((WTF::JSONImpl::Value *)objc_msgSend(v11, "intValue"));
        v13 = (uint64_t *)(v12 + 16);
        v14 = *(unsigned int *)(v12 + 28);
        if ((_DWORD)v14 == *(_DWORD *)(v12 + 24))
        {
          v15 = (_QWORD *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v13, v14 + 1, (unint64_t)&v23);
          v14 = *(unsigned int *)(v12 + 28);
          v16 = *(_QWORD *)(v12 + 16);
          v17 = (_DWORD *)*v15;
          *v15 = 0;
        }
        else
        {
          v16 = *v13;
          v17 = v23;
          v23 = 0;
        }
        *(_QWORD *)(v16 + 8 * v14) = v17;
        *(_DWORD *)(v12 + 28) = v14 + 1;
        v18 = v23;
        v23 = 0;
        if (v18)
        {
          if (*v18 == 1)
            WTF::JSONImpl::Value::operator delete();
          else
            --*v18;
        }
        ++v10;
      }
      while (v7 != v10);
      result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_21AD5005C(_Unwind_Exception *a1)
{
  _DWORD **v1;

  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONDoubleArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  WTF::JSONImpl::Array *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  WTF::JSONImpl::Value *v13;
  double v14;
  uint64_t *v15;
  uint64_t v16;
  _QWORD *v17;
  uint64_t v18;
  _DWORD *v19;
  _DWORD *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _DWORD *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!this)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("array"));
  v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  v7 = result;
  if (result)
  {
    v8 = *(_QWORD *)v22;
    v9 = *MEMORY[0x24BDBCAB8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(this);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v5), v11);
        v12 = *a2;
        v13 = (WTF::JSONImpl::Value *)objc_msgSend(v11, "doubleValue");
        WTF::JSONImpl::Value::create(v13, v14);
        v15 = (uint64_t *)(v12 + 16);
        v16 = *(unsigned int *)(v12 + 28);
        if ((_DWORD)v16 == *(_DWORD *)(v12 + 24))
        {
          v17 = (_QWORD *)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>((uint64_t)v15, v16 + 1, (unint64_t)&v25);
          v16 = *(unsigned int *)(v12 + 28);
          v18 = *(_QWORD *)(v12 + 16);
          v19 = (_DWORD *)*v17;
          *v17 = 0;
        }
        else
        {
          v18 = *v15;
          v19 = v25;
          v25 = 0;
        }
        *(_QWORD *)(v18 + 8 * v16) = v19;
        *(_DWORD *)(v12 + 28) = v16 + 1;
        v20 = v25;
        v25 = 0;
        if (v20)
        {
          if (*v20 == 1)
            WTF::JSONImpl::Value::operator delete();
          else
            --*v20;
        }
        ++v10;
      }
      while (v7 != v10);
      result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_21AD5029C(_Unwind_Exception *a1)
{
  _DWORD **v1;

  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::toJSONStringArrayArray@<X0>(Inspector *this@<X0>, uint64_t *a2@<X8>)
{
  WTF::JSONImpl::Array *v5;
  uint64_t result;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  Inspector *v11;
  uint64_t v12;
  uint64_t v13;
  _QWORD *v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  unint64_t v18;
  uint64_t *v19;
  _DWORD *v20;
  _DWORD *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (!this)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("required parameter '%@' cannot be nil"), CFSTR("array"));
  v5 = (WTF::JSONImpl::Array *)objc_opt_class();
  WTF::JSONImpl::Array::create(v5);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  v7 = result;
  if (result)
  {
    v8 = *(_QWORD *)v23;
    v9 = *MEMORY[0x24BDBCAB8];
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v23 != v8)
          objc_enumerationMutation(this);
        v11 = *(Inspector **)(*((_QWORD *)&v22 + 1) + 8 * v10);
        if ((objc_opt_isKindOfClass() & 1) == 0)
          objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v9, CFSTR("array should contain objects of type '%@', found bad value: %@"), NSStringFromClass(v5), v11);
        v12 = *a2;
        Inspector::toJSONStringArray(v11, (uint64_t *)&v21);
        v13 = (uint64_t)v21;
        v21 = 0;
        v14 = (_QWORD *)(v12 + 16);
        v15 = *(unsigned int *)(v12 + 28);
        if ((_DWORD)v15 == *(_DWORD *)(v12 + 24))
        {
          v16 = v15 + (v15 >> 2);
          if (v16 >= 0x10)
            v17 = v16 + 1;
          else
            v17 = 16;
          if (v17 <= v15 + 1)
            v18 = v15 + 1;
          else
            v18 = v17;
          WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>((uint64_t)v14, v18);
          v15 = *(unsigned int *)(v12 + 28);
          v19 = (uint64_t *)(*(_QWORD *)(v12 + 16) + 8 * v15);
        }
        else
        {
          v19 = (uint64_t *)(*v14 + 8 * v15);
        }
        *v19 = v13;
        *(_DWORD *)(v12 + 28) = v15 + 1;
        v20 = v21;
        v21 = 0;
        if (v20)
        {
          if (*v20 == 1)
            WTF::JSONImpl::Value::operator delete();
          else
            --*v20;
        }
        ++v10;
      }
      while (v7 != v10);
      result = -[Inspector countByEnumeratingWithState:objects:count:](this, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v7 = result;
    }
    while (result);
  }
  return result;
}

void sub_21AD504E8(_Unwind_Exception *a1)
{
  _DWORD **v1;

  WTF::Ref<WTF::JSONImpl::Array,WTF::RawPtrTraits<WTF::JSONImpl::Array>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Array>>::~Ref(v1);
  _Unwind_Resume(a1);
}

void *Inspector::toObjCStringArray(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  const __CFString *v6;
  _DWORD *v7;
  WTF::JSONImpl::Value *v9;
  _DWORD *v10;

  if (!*a1)
    return 0;
  v2 = *((unsigned int *)*a1 + 7);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
  if ((_DWORD)v2)
  {
    v4 = 0;
    v5 = *MEMORY[0x24BDBCAB8];
    do
    {
      WTF::JSONImpl::ArrayBase::get(*a1);
      WTF::JSONImpl::Value::asString(v9);
      if (v9)
      {
        if (*(_DWORD *)v9 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v9;
      }
      if (v10)
      {
        v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
      }
      else
      {
        objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", v5, CFSTR("array should contain objects of type 'String'"));
        v6 = &stru_24DE03408;
      }
      objc_msgSend(v3, "addObject:", v6, 0);
      v7 = v10;
      v10 = 0;
      if (v7)
      {
        if (*v7 == 2)
          WTF::StringImpl::destroy();
        else
          *v7 -= 2;
      }
      ++v4;
    }
    while (v2 != v4);
  }
  return v3;
}

void sub_21AD50680(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void *Inspector::toObjCIntegerArray(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  uint64_t v5;
  WTF::JSONImpl::Value *v6;
  WTF::JSONImpl::Value *v8;

  if (!*a1)
    return 0;
  v2 = *((unsigned int *)*a1 + 7);
  v3 = (void *)objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
  if ((_DWORD)v2)
  {
    for (i = 0; i != v2; ++i)
    {
      WTF::JSONImpl::ArrayBase::get(*a1);
      v5 = WTF::JSONImpl::Value::asInteger(v8);
      v6 = v8;
      v8 = 0;
      if (v6)
      {
        if (*(_DWORD *)v6 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v6;
      }
      if ((v5 & 0xFF00000000) == 0)
        Inspector::toObjCIntegerArray();
      objc_msgSend(v3, "addObject:", objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v5));
    }
  }
  return v3;
}

void sub_21AD507A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(uint64_t result, unint64_t a2)
{
  int v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (*(unsigned int *)(result + 8) >= a2)
    return 1;
  v2 = a2;
  if (!(a2 >> 29))
  {
    v3 = result;
    v4 = *(void **)result;
    v5 = *(unsigned int *)(result + 12);
    v6 = (void *)WTF::fastMalloc((WTF *)(8 * a2));
    *(_DWORD *)(v3 + 8) = v2;
    *(_QWORD *)v3 = v6;
    memcpy(v6, v4, 8 * v5);
    if (v4)
    {
      if (*(void **)v3 == v4)
      {
        *(_QWORD *)v3 = 0;
        *(_DWORD *)(v3 + 8) = 0;
      }
      WTF::fastFree((WTF *)v4, v7);
    }
    return 1;
  }
  __break(0xC471u);
  return result;
}

unint64_t WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(uint64_t a1, unint64_t a2, unint64_t a3)
{
  unint64_t v3;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v3 = a3;
  v5 = *(_QWORD *)a1;
  if (*(_QWORD *)a1 > a3 || v5 + 8 * (unint64_t)*(unsigned int *)(a1 + 12) <= a3)
  {
    v9 = *(unsigned int *)(a1 + 8) + ((unint64_t)*(unsigned int *)(a1 + 8) >> 2);
    if (v9 >= 0x10)
      v10 = v9 + 1;
    else
      v10 = 16;
    if (v10 > a2)
      a2 = v10;
    WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(a1, a2);
  }
  else
  {
    v6 = a3 - v5;
    v7 = *(unsigned int *)(a1 + 8) + ((unint64_t)*(unsigned int *)(a1 + 8) >> 2);
    if (v7 >= 0x10)
      v8 = v7 + 1;
    else
      v8 = 16;
    if (v8 > a2)
      a2 = v8;
    WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::reserveCapacity<(WTF::FailureAction)0>(a1, a2);
    return *(_QWORD *)a1 + v6;
  }
  return v3;
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::enable(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "enableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD509F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD50A8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD50B10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::disable(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "disableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD50C30(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD50CC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD50D4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getMatchedStylesForNode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4, char *a5)
{
  int v10;
  char *v11;
  _DWORD *v12;
  _QWORD *v13;
  char v15;
  _QWORD v16[6];
  _QWORD v17[6];
  _DWORD *v18;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke;
    v17[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v17[4] = a1;
    v17[5] = a2;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke_2;
    v16[3] = &__block_descriptor_48_e17_v32__0__8__16__24l;
    v16[4] = a1;
    v16[5] = a2;
    LOBYTE(v18) = 0;
    v10 = a4[1];
    if (a4[1])
      LOBYTE(v18) = *a4;
    v15 = 0;
    if (a5[1])
    {
      v15 = *a5;
      v11 = &v15;
    }
    else
    {
      v11 = 0;
    }
    if (v10)
      v13 = &v18;
    else
      v13 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "getMatchedStylesForNodeWithErrorCallback:successCallback:nodeId:includePseudo:includeInherited:", v17, v16, a3, v13, v11);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v12 = v18;
    v18 = 0;
    if (v12)
    {
      if (*v12 == 2)
        WTF::StringImpl::destroy();
      else
        *v12 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD50EC4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getMatchedStylesForNodeEliONSt3__18optionalIbEES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD50F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD516B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, _DWORD *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36,uint64_t a37,uint64_t a38,uint64_t a39,uint64_t a40,uint64_t a41,uint64_t a42,uint64_t a43,_DWORD *a44)
{
  if (a18)
  {
    if (*a18 == 2)
      WTF::StringImpl::destroy();
    else
      *a18 -= 2;
  }
  if (a44)
  {
    if (*a44 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a44;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getInlineStylesForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e13_v24__0__8__16l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getInlineStylesForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD518C4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher22getInlineStylesForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5195C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD51C84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getComputedStyleForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getComputedStyleForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD51E4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher23getComputedStyleForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD51EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD521C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getFontDataForNode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSFont_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getFontDataForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD52384(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher18getFontDataForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5241C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD525E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getAllStyleSheets(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getAllStyleSheetsWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD52784(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getAllStyleSheetsEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5281C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD52B00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getStyleSheet(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e38_v16__0__RWIProtocolCSSStyleSheetBody_8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getStyleSheetWithErrorCallback:successCallback:styleSheetId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD52CD4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher13getStyleSheetElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD52D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD52F34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getStyleSheetText(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getStyleSheetTextWithErrorCallback:successCallback:styleSheetId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD530EC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17getStyleSheetTextElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD53184(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD532C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setString(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2, const WTF::String *a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  _DWORD *v8;
  _DWORD *result;
  _DWORD *v10;
  _BYTE v11[24];

  WTF::JSONImpl::Value::create(a3, a2);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, (WTF::StringImpl **)a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    v5 = (uint64_t *)((char *)this + 24);
    v6 = *((unsigned int *)this + 9);
    if ((_DWORD)v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      v7 = *v5;
      v8 = *(_DWORD **)a2;
      if (*(_QWORD *)a2)
        *v8 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  result = v10;
  v10 = 0;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

void sub_21AD53408(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setStyleSheetText(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  const __CFString *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setStyleSheetTextWithErrorCallback:successCallback:styleSheetId:text:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5356C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD53604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher17setStyleSheetTextElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD53688(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setStyleText(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  CFTypeRef v8;
  const __CFString *v9;
  _DWORD *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e29_v16__0__RWIProtocolCSSStyle_8l;
    v12[4] = a1;
    v12[5] = a2;
    v8 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolCSSStyleId alloc], "initWithJSONObject:", a3));
    if (*a4)
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_24DE03408;
    return objc_msgSend(*(id *)(a1 + 16), "setStyleTextWithErrorCallback:successCallback:styleId:text:", v13, v12, v8, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD537F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher12setStyleTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD53888(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD53A50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setRuleSelector(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  CFTypeRef v8;
  const __CFString *v9;
  _DWORD *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSRule_8l;
    v12[4] = a1;
    v12[5] = a2;
    v8 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolCSSRuleId alloc], "initWithJSONObject:", a3));
    if (*a4)
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_24DE03408;
    return objc_msgSend(*(id *)(a1 + 16), "setRuleSelectorWithErrorCallback:successCallback:ruleId:selector:", v13, v12, v8, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD53C38(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher15setRuleSelectorElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD53CD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD53E98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::setGroupingHeaderText(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  CFTypeRef v8;
  const __CFString *v9;
  _DWORD *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e32_v16__0__RWIProtocolCSSGrouping_8l;
    v12[4] = a1;
    v12[5] = a2;
    v8 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolCSSRuleId alloc], "initWithJSONObject:", a3));
    if (*a4)
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_24DE03408;
    return objc_msgSend(*(id *)(a1 + 16), "setGroupingHeaderTextWithErrorCallback:successCallback:ruleId:headerText:", v13, v12, v8, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD54080(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher21setGroupingHeaderTextElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD54118(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD542E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::createStyleSheet(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "createStyleSheetWithErrorCallback:successCallback:frameId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD54498(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16createStyleSheetElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD54530(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD54674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::addRule(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  const __CFString *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolCSSRule_8l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "addRuleWithErrorCallback:successCallback:styleSheetId:selector:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD54848(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher7addRuleElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD548E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD54AA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getSupportedCSSProperties(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getSupportedCSSPropertiesWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD54C48(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher25getSupportedCSSPropertiesEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD54CE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD54FC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::getSupportedSystemFontFamilyNames(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getSupportedSystemFontFamilyNamesWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD55178(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher33getSupportedSystemFontFamilyNamesEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD55210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD553CC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorCSSBackendDispatcher::forcePseudoState(uint64_t a1, uint64_t a2, uint64_t a3, WTF::JSONImpl::ArrayBase **a4)
{
  WTF::JSONImpl::ArrayBase *v8;
  void *v9;
  WTF::JSONImpl::ArrayBase *v10;
  WTF::JSONImpl::ArrayBase *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  WTF::JSONImpl::ArrayBase *v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = a1;
    v14[5] = a2;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v13[3] = &__block_descriptor_48_e5_v8__0l;
    v13[4] = a1;
    v13[5] = a2;
    v8 = *a4;
    *a4 = 0;
    v15 = v8;
    v9 = Inspector::toObjCStringArray(&v15);
    v10 = v15;
    v15 = 0;
    if (v10)
    {
      if (*(_DWORD *)v10 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*(_DWORD *)v10;
    }
    return objc_msgSend(*(id *)(a1 + 16), "forcePseudoStateWithErrorCallback:successCallback:nodeId:forcedPseudoClasses:", v14, v13, a3, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v15;
    v15 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD555B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD55668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher16forcePseudoStateEliON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD556EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorCSSBackendDispatcher::setLayoutContextTypeChangedMode(Inspector::ObjCInspectorCSSBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  uint64_t v6;
  unsigned __int8 *v7;
  unint64_t v8;
  _DWORD *v9;
  uint64_t i;
  _DWORD *result;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    v6 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
    {
      v7 = *(unsigned __int8 **)(v6 + 8);
      v8 = *(unsigned int *)(v6 + 4) | ((unint64_t)((*(_DWORD *)(v6 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v7 = 0;
      v8 = 0x100000000;
    }
    for (i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v7, v8, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)objc_msgSend(*((id *)this + 2), "setLayoutContextTypeChangedModeWithErrorCallback:successCallback:mode:", v13, v12, (&Inspector::fromProtocolString<RWIProtocolCSSLayoutContextTypeChangedMode>(WTF::String const&)::mappings)[i + 2]);
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    result = v14;
    v14 = 0;
    if (result)
    {
      if (*result == 2)
        return (_DWORD *)WTF::StringImpl::destroy();
      else
        *result -= 2;
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_21AD558D4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD55984(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorCSSBackendDispatcher31setLayoutContextTypeChangedModeElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD55A08(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getDocument(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e28_v16__0__RWIProtocolDOMNode_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getDocumentWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD55B28(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11getDocumentEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD55BC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD55D88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::requestChildNodes(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _QWORD *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = a1;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = a1;
    v11[5] = a2;
    LODWORD(v13) = 0;
    if (*(_BYTE *)(a4 + 4))
    {
      LODWORD(v13) = *(_DWORD *)a4;
      v8 = &v13;
    }
    else
    {
      v8 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "requestChildNodesWithErrorCallback:successCallback:nodeId:depth:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD55F54(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD55FEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17requestChildNodesEliONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD56070(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::querySelector(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e9_v16__0_i8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "querySelectorWithErrorCallback:successCallback:nodeId:selector:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD561B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13querySelectorEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD56250(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD56338(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setInteger(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, WTF::JSONImpl::Value *a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  _DWORD *result;
  _DWORD *v10;
  _BYTE v11[24];

  WTF::JSONImpl::Value::create(a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    v5 = (uint64_t *)((char *)this + 24);
    v6 = *((unsigned int *)this + 9);
    if ((_DWORD)v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      v7 = *v5;
      v8 = *a2;
      if (*a2)
        *(_DWORD *)v8 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  result = v10;
  v10 = 0;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

void sub_21AD5644C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::querySelectorAll(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "querySelectorAllWithErrorCallback:successCallback:nodeId:selector:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD56594(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16querySelectorAllEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5662C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD567E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setNodeName(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e8_v12__0i8l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setNodeNameWithErrorCallback:successCallback:nodeId:name:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD569B0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11setNodeNameEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD56A48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD56B2C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setNodeValue(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setNodeValueWithErrorCallback:successCallback:nodeId:value:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD56CB8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD56D50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setNodeValueEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD56DD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "removeNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD56EFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD56F94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher10removeNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD57018(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAttributeValue(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  const __CFString *v12;
  _QWORD v14[6];
  _QWORD v15[6];
  _DWORD *v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    if (*(_QWORD *)a5)
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setAttributeValueWithErrorCallback:successCallback:nodeId:name:value:", v15, v14, a3, v10, v12);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v16;
    v16 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5718C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD57224(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17setAttributeValueEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD572A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAttributesAsText(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  uint64_t *v12;
  _QWORD v14[6];
  _QWORD v15[6];
  uint64_t v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    v16 = 0;
    if (*(_QWORD *)a5)
    {
      v16 = WTF::StringImpl::operator NSString *();
      if (*(_QWORD *)a5)
        v12 = &v16;
      else
        v12 = 0;
    }
    else
    {
      v12 = 0;
    }
    return objc_msgSend(*((id *)this + 2), "setAttributesAsTextWithErrorCallback:successCallback:nodeId:text:name:", v15, v14, a3, v10, v12);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = (_DWORD *)v16;
    v16 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5742C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD574C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher19setAttributesAsTextEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD57548(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeAttribute(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "removeAttributeWithErrorCallback:successCallback:nodeId:name:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD57690(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD57728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15removeAttributeEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD577AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getSupportedEventNames(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getSupportedEventNamesWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD578CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getSupportedEventNamesEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD57964(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD57B20(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getDataBindingsForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getDataBindingsForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD57CC8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher22getDataBindingsForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD57D60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD58044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAssociatedDataForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e9_v16__0__8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getAssociatedDataForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD58200(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getAssociatedDataForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD58298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD583E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getEventListenersForNode(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  _QWORD *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = a1;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v11[4] = a1;
    v11[5] = a2;
    LOBYTE(v13) = 0;
    if (a4[1])
    {
      LOBYTE(v13) = *a4;
      v8 = &v13;
    }
    else
    {
      v8 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "getEventListenersForNodeWithErrorCallback:successCallback:nodeId:includeAncestors:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD585A0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24getEventListenersForNodeEliONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD58638(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5891C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setEventListenerDisabled(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _DWORD *v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = this;
    v11[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = this;
    v10[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setEventListenerDisabledWithErrorCallback:successCallback:eventListenerId:disabled:", v11, v10, a3, a4);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD58AE0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD58B78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24setEventListenerDisabledElib_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD58BFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setBreakpointForEventListener(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  RWIProtocolDebuggerBreakpointOptions *v8;
  _DWORD *v9;
  _DWORD *v10;
  CFTypeRef *v11;
  _DWORD *v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _DWORD *v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = a1;
    v15[5] = a2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = a2;
    v16 = 0;
    if (*a4)
    {
      v8 = [RWIProtocolDebuggerBreakpointOptions alloc];
      v13 = (_DWORD *)*a4;
      *a4 = 0;
      v16 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v8, "initWithJSONObject:", &v13));
      v9 = v13;
      v13 = 0;
      if (v9)
      {
        if (*v9 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v9;
      }
      if (*a4)
        v11 = (CFTypeRef *)&v16;
      else
        v11 = 0;
    }
    else
    {
      v11 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "setBreakpointForEventListenerWithErrorCallback:successCallback:eventListenerId:options:", v15, v14, a3, v11, v13);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v16;
    v16 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD58D9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9)
{
  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD58E64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher29setBreakpointForEventListenerEliON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD58EE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::removeBreakpointForEventListener(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "removeBreakpointForEventListenerWithErrorCallback:successCallback:eventListenerId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD59010(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD590A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher32removeBreakpointForEventListenerEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5912C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAccessibilityPropertiesForNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e47_v16__0__RWIProtocolDOMAccessibilityProperties_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getAccessibilityPropertiesForNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD59254(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher33getAccessibilityPropertiesForNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD592EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD594B4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getOuterHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v8[4] = this;
    return objc_msgSend(*((id *)this + 2), "getOuterHTMLWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD59654(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12getOuterHTMLEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD596EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD59830(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setOuterHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  _DWORD *v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e5_v8__0l;
    v11[4] = this;
    v11[5] = a2;
    if (*(_QWORD *)a4)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setOuterHTMLWithErrorCallback:successCallback:nodeId:outerHTML:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD599E8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD59A80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher12setOuterHTMLEliRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD59B04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::insertAdjacentHTML(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4, const WTF::String *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  const __CFString *v12;
  _QWORD v14[6];
  _QWORD v15[6];
  _DWORD *v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = this;
    v15[5] = a2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = this;
    v14[5] = a2;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    if (*(_QWORD *)a5)
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "insertAdjacentHTMLWithErrorCallback:successCallback:nodeId:position:html:", v15, v14, a3, v10, v12);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v16;
    v16 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD59C78(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD59D10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher18insertAdjacentHTMLEliRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD59D94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::performSearch(uint64_t a1, uint64_t a2, _QWORD *a3, WTF::JSONImpl::ArrayBase **a4, _BYTE *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  WTF::JSONImpl::ArrayBase *v12;
  WTF::JSONImpl::ArrayBase *v13;
  WTF::JSONImpl::ArrayBase **v15;
  void **v16;
  WTF::JSONImpl::ArrayBase *v17;
  _QWORD v18[6];
  _QWORD v19[6];
  _DWORD *v20;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke;
    v19[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v19[4] = a1;
    v19[5] = a2;
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke_2;
    v18[3] = &__block_descriptor_48_e21_v20__0__NSString_8i16l;
    v18[4] = a1;
    v18[5] = a2;
    if (*a3)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    v20 = 0;
    v12 = *a4;
    if (*a4)
    {
      *a4 = 0;
      v17 = v12;
      v20 = Inspector::toObjCIntegerArray(&v17);
      v13 = v17;
      v17 = 0;
      if (v13)
      {
        if (*(_DWORD *)v13 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v13;
      }
    }
    LOBYTE(v17) = 0;
    if (a5[1])
    {
      LOBYTE(v17) = *a5;
      v15 = &v17;
    }
    else
    {
      v15 = 0;
    }
    if (*a4)
      v16 = (void **)&v20;
    else
      v16 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "performSearchWithErrorCallback:successCallback:query:nodeIds:caseSensitive:", v19, v18, v10, v16, v15, v17);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v20;
    v20 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD59F5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13performSearchElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5A00C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5A1B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getSearchResults(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3, uint64_t a4, uint64_t a5)
{
  const __CFString *v10;
  _DWORD *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _DWORD *v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = this;
    v14[5] = a2;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke_2;
    v13[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v13[4] = this;
    v13[5] = a2;
    if (*(_QWORD *)a3)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getSearchResultsWithErrorCallback:successCallback:searchId:fromIndex:toIndex:", v14, v13, v10, a4, a5);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v15;
    v15 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5A380(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16getSearchResultsElRKN3WTF6StringEii_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5A418(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5A5D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::discardSearchResults(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "discardSearchResultsWithErrorCallback:successCallback:searchId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5A794(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5A82C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher20discardSearchResultsElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5A8B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::requestNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e8_v12__0i8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "requestNodeWithErrorCallback:successCallback:objectId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5A9F0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11requestNodeElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5AA88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5AB6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setInspectModeEnabled(uint64_t a1, uint64_t a2, uint64_t a3, CFTypeRef *a4, CFTypeRef *a5, _QWORD *a6)
{
  RWIProtocolDOMHighlightConfig *v12;
  _DWORD *v13;
  _DWORD *v14;
  RWIProtocolDOMGridOverlayConfig *v16;
  _DWORD *v17;
  RWIProtocolDOMFlexOverlayConfig *v18;
  _DWORD *v19;
  CFTypeRef *v20;
  CFTypeRef *v21;
  CFTypeRef *v22;
  _DWORD *v23;
  _DWORD *v24;
  _DWORD *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  _DWORD *v28;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    v28 = 0;
    if (*a4)
    {
      v12 = [RWIProtocolDOMHighlightConfig alloc];
      v25 = *a4;
      *a4 = 0;
      v28 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v12, "initWithJSONObject:", &v25));
      v13 = v25;
      v25 = 0;
      if (v13)
      {
        if (*v13 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v13;
      }
    }
    v25 = 0;
    if (*a5)
    {
      v16 = [RWIProtocolDOMGridOverlayConfig alloc];
      v24 = *a5;
      *a5 = 0;
      v25 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v16, "initWithJSONObject:", &v24));
      v17 = v24;
      v24 = 0;
      if (v17)
      {
        if (*v17 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v17;
      }
    }
    v24 = 0;
    if (*a6)
    {
      v18 = [RWIProtocolDOMFlexOverlayConfig alloc];
      v23 = (_DWORD *)*a6;
      *a6 = 0;
      v24 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v18, "initWithJSONObject:", &v23));
      v19 = v23;
      v23 = 0;
      if (v19)
      {
        if (*v19 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v19;
      }
      if (*a6)
        v20 = (CFTypeRef *)&v24;
      else
        v20 = 0;
    }
    else
    {
      v20 = 0;
    }
    if (*a4)
      v21 = (CFTypeRef *)&v28;
    else
      v21 = 0;
    if (*a5)
      v22 = (CFTypeRef *)&v25;
    else
      v22 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "setInspectModeEnabledWithErrorCallback:successCallback:enabled:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v27, v26, a3, v21, v22, v20, v23, v24, v25);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v14 = v28;
    v28 = 0;
    if (v14)
    {
      if (*v14 == 2)
        WTF::StringImpl::destroy();
      else
        *v14 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5AE38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, uint64_t a10, uint64_t a11)
{
  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5AF30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher21setInspectModeEnabledElbON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_SA__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5AFB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightRect(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, CFTypeRef *a7, _QWORD *a8, _BYTE *a9)
{
  RWIProtocolDOMRGBAColor *v17;
  _DWORD *v18;
  _DWORD *v19;
  RWIProtocolDOMRGBAColor *v21;
  _DWORD *v22;
  _QWORD *v23;
  CFTypeRef *v24;
  CFTypeRef *v25;
  _DWORD *v26;
  _DWORD *v27;
  _QWORD v28[6];
  _QWORD v29[6];
  _DWORD *v30;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke_2;
    v28[3] = &__block_descriptor_48_e5_v8__0l;
    v28[4] = a1;
    v28[5] = a2;
    v30 = 0;
    if (*a7)
    {
      v17 = [RWIProtocolDOMRGBAColor alloc];
      v27 = *a7;
      *a7 = 0;
      v30 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v17, "initWithJSONObject:", &v27));
      v18 = v27;
      v27 = 0;
      if (v18)
      {
        if (*v18 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v18;
      }
    }
    v27 = 0;
    if (*a8)
    {
      v21 = [RWIProtocolDOMRGBAColor alloc];
      v26 = (_DWORD *)*a8;
      *a8 = 0;
      v27 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v21, "initWithJSONObject:", &v26));
      v22 = v26;
      v26 = 0;
      if (v22)
      {
        if (*v22 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v22;
      }
    }
    LOBYTE(v26) = 0;
    if (a9[1])
    {
      LOBYTE(v26) = *a9;
      v23 = &v26;
    }
    else
    {
      v23 = 0;
    }
    v24 = (CFTypeRef *)&v30;
    if (!*a7)
      v24 = 0;
    v25 = (CFTypeRef *)&v27;
    if (!*a8)
      v25 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightRectWithErrorCallback:successCallback:x:y:width:height:color:outlineColor:usePageCoordinates:", v29, v28, a3, a4, a5, a6, v24, v25, v23, v26, v27);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v19 = v30;
    v30 = 0;
    if (v19)
    {
      if (*v19 == 2)
        WTF::StringImpl::destroy();
      else
        *v19 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5B20C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, uint64_t a13)
{
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5B2EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightRectEliiiiON3WTF6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEESA_ONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5B370(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightQuad(uint64_t a1, uint64_t a2, WTF::JSONImpl::ArrayBase **a3, CFTypeRef *a4, _QWORD *a5, _BYTE *a6)
{
  WTF::JSONImpl::ArrayBase *v12;
  void *v13;
  WTF::JSONImpl::ArrayBase *v14;
  WTF::JSONImpl::ArrayBase *v15;
  RWIProtocolDOMRGBAColor *v16;
  _DWORD *v17;
  RWIProtocolDOMRGBAColor *v19;
  _DWORD *v20;
  _QWORD *v21;
  WTF::JSONImpl::ArrayBase **v22;
  CFTypeRef *v23;
  _DWORD *v24;
  _DWORD *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  WTF::JSONImpl::ArrayBase *v28;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    v12 = *a3;
    *a3 = 0;
    v28 = v12;
    v13 = Inspector::toObjCIntegerArray(&v28);
    v14 = v28;
    v28 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*(_DWORD *)v14;
    }
    v28 = 0;
    if (*a4)
    {
      v16 = [RWIProtocolDOMRGBAColor alloc];
      v25 = *a4;
      *a4 = 0;
      v28 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v16, "initWithJSONObject:", &v25));
      v17 = v25;
      v25 = 0;
      if (v17)
      {
        if (*v17 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v17;
      }
    }
    v25 = 0;
    if (*a5)
    {
      v19 = [RWIProtocolDOMRGBAColor alloc];
      v24 = (_DWORD *)*a5;
      *a5 = 0;
      v25 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v19, "initWithJSONObject:", &v24));
      v20 = v24;
      v24 = 0;
      if (v20)
      {
        if (*v20 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v20;
      }
    }
    LOBYTE(v24) = 0;
    if (a6[1])
    {
      LOBYTE(v24) = *a6;
      v21 = &v24;
    }
    else
    {
      v21 = 0;
    }
    if (*a4)
      v22 = &v28;
    else
      v22 = 0;
    if (*a5)
      v23 = (CFTypeRef *)&v25;
    else
      v23 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightQuadWithErrorCallback:successCallback:quad:color:outlineColor:usePageCoordinates:", v27, v26, v13, v22, v23, v21);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v15 = v28;
    v28 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v15 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5B5DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a10;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5B6D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightQuadElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS1_6RefPtrINS3_6ObjectENS5_ISC_EENS7_ISC_EEEESG_ONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5B758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightSelector(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, CFTypeRef *a6, CFTypeRef **a7)
{
  const __CFString *v14;
  _DWORD *v15;
  CFTypeRef v16;
  RWIProtocolDOMGridOverlayConfig *v17;
  _DWORD *v18;
  CFTypeRef *v20;
  RWIProtocolDOMFlexOverlayConfig *v21;
  CFTypeRef *v22;
  uint64_t *v23;
  CFTypeRef *v24;
  CFTypeRef *v25;
  _DWORD *v26;
  CFTypeRef v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke_2;
    v28[3] = &__block_descriptor_48_e5_v8__0l;
    v28[4] = a1;
    v28[5] = a2;
    if (*a3)
      v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_24DE03408;
    v30 = 0;
    if (*a4)
      v30 = WTF::StringImpl::operator NSString *();
    v16 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMHighlightConfig alloc], "initWithJSONObject:", a5));
    v27 = 0;
    if (*a6)
    {
      v17 = [RWIProtocolDOMGridOverlayConfig alloc];
      v26 = *a6;
      *a6 = 0;
      v27 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v17, "initWithJSONObject:", &v26));
      v18 = v26;
      v26 = 0;
      if (v18)
      {
        if (*v18 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v18;
      }
    }
    v26 = 0;
    v20 = *a7;
    if (*a7)
    {
      v21 = [RWIProtocolDOMFlexOverlayConfig alloc];
      v25 = *a7;
      *a7 = 0;
      v26 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v21, "initWithJSONObject:", &v25));
      v22 = v25;
      v25 = 0;
      if (v22)
      {
        if (*(_DWORD *)v22 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v22;
      }
      v20 = (CFTypeRef *)&v26;
      if (!*a7)
        v20 = 0;
    }
    if (*a4)
      v23 = &v30;
    else
      v23 = 0;
    if (*a6)
      v24 = &v27;
    else
      v24 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightSelectorWithErrorCallback:successCallback:selectorString:frameId:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v29, v28, v14, v23, v16, v24, v20);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v15 = (_DWORD *)v30;
    v30 = 0;
    if (v15)
    {
      if (*v15 == 2)
        WTF::StringImpl::destroy();
      else
        *v15 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5B9E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5BAC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightSelectorElRKN3WTF6StringES4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEEONS1_6RefPtrIS7_S9_SB_EESG__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5BB4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightNode(uint64_t a1, uint64_t a2, int *a3, _QWORD *a4, uint64_t a5, CFTypeRef *a6, CFTypeRef **a7)
{
  CFTypeRef v14;
  RWIProtocolDOMGridOverlayConfig *v15;
  _DWORD *v16;
  _DWORD *v17;
  CFTypeRef *v19;
  RWIProtocolDOMFlexOverlayConfig *v20;
  CFTypeRef *v21;
  int *v22;
  uint64_t *v23;
  CFTypeRef *v24;
  CFTypeRef *v25;
  _DWORD *v26;
  CFTypeRef v27;
  int v28;
  _QWORD v29[6];
  _QWORD v30[6];
  uint64_t v31;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v30[0] = MEMORY[0x24BDAC760];
    v30[1] = 3221225472;
    v30[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke;
    v30[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v30[4] = a1;
    v30[5] = a2;
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke_2;
    v29[3] = &__block_descriptor_48_e5_v8__0l;
    v29[4] = a1;
    v29[5] = a2;
    v28 = 0;
    if (*((_BYTE *)a3 + 4))
      v28 = *a3;
    v31 = 0;
    if (*a4)
      v31 = WTF::StringImpl::operator NSString *();
    v14 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMHighlightConfig alloc], "initWithJSONObject:", a5));
    v27 = 0;
    if (*a6)
    {
      v15 = [RWIProtocolDOMGridOverlayConfig alloc];
      v26 = *a6;
      *a6 = 0;
      v27 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v15, "initWithJSONObject:", &v26));
      v16 = v26;
      v26 = 0;
      if (v16)
      {
        if (*v16 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v16;
      }
    }
    v26 = 0;
    v19 = *a7;
    if (*a7)
    {
      v20 = [RWIProtocolDOMFlexOverlayConfig alloc];
      v25 = *a7;
      *a7 = 0;
      v26 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v20, "initWithJSONObject:", &v25));
      v21 = v25;
      v25 = 0;
      if (v21)
      {
        if (*(_DWORD *)v21 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v21;
      }
      v19 = (CFTypeRef *)&v26;
      if (!*a7)
        v19 = 0;
    }
    if (*((_BYTE *)a3 + 4))
      v22 = &v28;
    else
      v22 = 0;
    if (*a4)
      v23 = &v31;
    else
      v23 = 0;
    if (*a6)
      v24 = &v27;
    else
      v24 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightNodeWithErrorCallback:successCallback:nodeId:objectId:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v30, v29, v22, v23, v14, v24, v19, v25, v26, v27);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v17 = (_DWORD *)v31;
    v31 = 0;
    if (v17)
    {
      if (*v17 == 2)
        WTF::StringImpl::destroy();
      else
        *v17 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5BDD8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a10;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5BEC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13highlightNodeElONSt3__18optionalIiEERKN3WTF6StringEONS5_3RefINS5_8JSONImpl6ObjectENS5_12RawPtrTraitsISB_EENS5_21DefaultRefDerefTraitsISB_EEEEONS5_6RefPtrISB_SD_SF_EESK__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5BF44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightNodeList(uint64_t a1, uint64_t a2, WTF::JSONImpl::ArrayBase **a3, uint64_t a4, CFTypeRef *a5, _QWORD *a6)
{
  WTF::JSONImpl::ArrayBase *v12;
  void *v13;
  WTF::JSONImpl::ArrayBase *v14;
  WTF::JSONImpl::ArrayBase *v15;
  CFTypeRef v16;
  RWIProtocolDOMGridOverlayConfig *v17;
  _DWORD *v18;
  RWIProtocolDOMFlexOverlayConfig *v20;
  _DWORD *v21;
  CFTypeRef *v22;
  WTF::JSONImpl::ArrayBase **v23;
  _DWORD *v24;
  _DWORD *v25;
  _QWORD v26[6];
  _QWORD v27[6];
  WTF::JSONImpl::ArrayBase *v28;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    v12 = *a3;
    *a3 = 0;
    v28 = v12;
    v13 = Inspector::toObjCIntegerArray(&v28);
    v14 = v28;
    v28 = 0;
    if (v14)
    {
      if (*(_DWORD *)v14 == 1)
        WTF::JSONImpl::Value::operator delete();
      else
        --*(_DWORD *)v14;
    }
    v16 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMHighlightConfig alloc], "initWithJSONObject:", a4));
    v28 = 0;
    if (*a5)
    {
      v17 = [RWIProtocolDOMGridOverlayConfig alloc];
      v25 = *a5;
      *a5 = 0;
      v28 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v17, "initWithJSONObject:", &v25));
      v18 = v25;
      v25 = 0;
      if (v18)
      {
        if (*v18 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v18;
      }
    }
    v25 = 0;
    if (*a6)
    {
      v20 = [RWIProtocolDOMFlexOverlayConfig alloc];
      v24 = (_DWORD *)*a6;
      *a6 = 0;
      v25 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v20, "initWithJSONObject:", &v24));
      v21 = v24;
      v24 = 0;
      if (v21)
      {
        if (*v21 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v21;
      }
      if (*a6)
        v22 = (CFTypeRef *)&v25;
      else
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    if (*a5)
      v23 = &v28;
    else
      v23 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightNodeListWithErrorCallback:successCallback:nodeIds:highlightConfig:gridOverlayConfig:flexOverlayConfig:", v27, v26, v13, v16, v23, v22);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v15 = v28;
    v28 = 0;
    if (v15)
    {
      if (*(_DWORD *)v15 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v15 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5C1C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a10;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5C2B8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17highlightNodeListElON3WTF3RefINS1_8JSONImpl5ArrayENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEEONS2_INS3_6ObjectENS5_ISB_EENS7_ISB_EEEEONS1_6RefPtrISB_SC_SD_EESI__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5C33C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideHighlight(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "hideHighlightWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5C45C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5C4F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13hideHighlightEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5C578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::highlightFrame(uint64_t a1, uint64_t a2, _QWORD *a3, CFTypeRef *a4, _QWORD *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  RWIProtocolDOMRGBAColor *v12;
  _DWORD *v13;
  RWIProtocolDOMRGBAColor *v15;
  _DWORD *v16;
  CFTypeRef *v17;
  CFTypeRef *v18;
  _DWORD *v19;
  _DWORD *v20;
  _QWORD v21[6];
  _QWORD v22[6];
  _DWORD *v23;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke;
    v22[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v22[4] = a1;
    v22[5] = a2;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke_2;
    v21[3] = &__block_descriptor_48_e5_v8__0l;
    v21[4] = a1;
    v21[5] = a2;
    if (*a3)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    v23 = 0;
    if (*a4)
    {
      v12 = [RWIProtocolDOMRGBAColor alloc];
      v20 = *a4;
      *a4 = 0;
      v23 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v12, "initWithJSONObject:", &v20));
      v13 = v20;
      v20 = 0;
      if (v13)
      {
        if (*v13 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v13;
      }
    }
    v20 = 0;
    if (*a5)
    {
      v15 = [RWIProtocolDOMRGBAColor alloc];
      v19 = (_DWORD *)*a5;
      *a5 = 0;
      v20 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v15, "initWithJSONObject:", &v19));
      v16 = v19;
      v19 = 0;
      if (v16)
      {
        if (*v16 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v16;
      }
      if (*a5)
        v17 = (CFTypeRef *)&v20;
      else
        v17 = 0;
    }
    else
    {
      v17 = 0;
    }
    if (*a4)
      v18 = (CFTypeRef *)&v23;
    else
      v18 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "highlightFrameWithErrorCallback:successCallback:frameId:contentColor:contentOutlineColor:", v22, v21, v10, v18, v17);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v23;
    v23 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5C7A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, uint64_t a11)
{
  if (a10)
  {
    if (*a10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a10;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5C888(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher14highlightFrameElRKN3WTF6StringEONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEESD__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5C90C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::showGridOverlay(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _DWORD *v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = a1;
    v11[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a1;
    v10[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "showGridOverlayWithErrorCallback:successCallback:nodeId:gridOverlayConfig:", v11, v10, a3, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMGridOverlayConfig alloc], "initWithJSONObject:", a4)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5CA58(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5CAF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showGridOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5CB74(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideGridOverlay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = a1;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = a1;
    v9[5] = a2;
    LODWORD(v11) = 0;
    if (*(_BYTE *)(a3 + 4))
    {
      LODWORD(v11) = *(_DWORD *)a3;
      v6 = &v11;
    }
    else
    {
      v6 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "hideGridOverlayWithErrorCallback:successCallback:nodeId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5CCB8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5CD50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideGridOverlayElONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5CDD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::showFlexOverlay(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  _DWORD *v9;
  _QWORD v10[6];
  _QWORD v11[6];
  _DWORD *v12;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v11[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v11[4] = a1;
    v11[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v10[3] = &__block_descriptor_48_e5_v8__0l;
    v10[4] = a1;
    v10[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "showFlexOverlayWithErrorCallback:successCallback:nodeId:flexOverlayConfig:", v11, v10, a3, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMFlexOverlayConfig alloc], "initWithJSONObject:", a4)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v12;
    v12 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5CF20(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5CFB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15showFlexOverlayEliON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5D03C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::hideFlexOverlay(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = a1;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = a1;
    v9[5] = a2;
    LODWORD(v11) = 0;
    if (*(_BYTE *)(a3 + 4))
    {
      LODWORD(v11) = *(_DWORD *)a3;
      v6 = &v11;
    }
    else
    {
      v6 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "hideFlexOverlayWithErrorCallback:successCallback:nodeId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5D180(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5D218(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher15hideFlexOverlayElONSt3__18optionalIiEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5D29C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::pushNodeByPathToFrontend(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e8_v12__0i8l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "pushNodeByPathToFrontendWithErrorCallback:successCallback:path:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5D3DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher24pushNodeByPathToFrontendElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5D474(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5D558(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::resolveNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3, const WTF::String *a4)
{
  uint64_t *v8;
  _DWORD *v9;
  _QWORD v11[6];
  _QWORD v12[6];
  uint64_t v13;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke;
    v12[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v12[4] = this;
    v12[5] = a2;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke_2;
    v11[3] = &__block_descriptor_48_e40_v16__0__RWIProtocolRuntimeRemoteObject_8l;
    v11[4] = this;
    v11[5] = a2;
    v13 = 0;
    if (*(_QWORD *)a4)
    {
      v13 = WTF::StringImpl::operator NSString *();
      if (*(_QWORD *)a4)
        v8 = &v13;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    return objc_msgSend(*((id *)this + 2), "resolveNodeWithErrorCallback:successCallback:nodeId:objectGroup:", v12, v11, a3, v8);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = (_DWORD *)v13;
    v13 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5D6F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher11resolveNodeEliRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5D78C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5D954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getAttributes(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getAttributesWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5DAFC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getAttributesEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5DB94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5DD50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::moveTo(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  _QWORD *v10;
  _DWORD *v11;
  _QWORD v13[6];
  _QWORD v14[6];
  _DWORD *v15;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke;
    v14[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v14[4] = a1;
    v14[5] = a2;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke_2;
    v13[3] = &__block_descriptor_48_e8_v12__0i8l;
    v13[4] = a1;
    v13[5] = a2;
    LODWORD(v15) = 0;
    if (*(_BYTE *)(a5 + 4))
    {
      LODWORD(v15) = *(_DWORD *)a5;
      v10 = &v15;
    }
    else
    {
      v10 = 0;
    }
    return objc_msgSend(*(id *)(a1 + 16), "moveToWithErrorCallback:successCallback:nodeId:targetNodeId:insertBeforeNodeId:", v14, v13, a3, a4, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v15;
    v15 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5DF2C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher6moveToEliiONSt3__18optionalIiEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5DFC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5E0A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::undo(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "undoWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5E20C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5E2A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4undoEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5E328(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::redo(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "redoWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5E448(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5E4E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher4redoEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5E564(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::markUndoableState(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "markUndoableStateWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5E684(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5E71C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher17markUndoableStateEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5E7A0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::focus(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "focusWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5E8C8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5E960(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher5focusEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5E9E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setInspectedNode(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setInspectedNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5EB0C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5EBA4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher16setInspectedNodeEli_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5EC28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::setAllowEditingUserAgentShadowTrees(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setAllowEditingUserAgentShadowTreesWithErrorCallback:successCallback:allow:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5ED50(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5EDE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher35setAllowEditingUserAgentShadowTreesElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5EE6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMBackendDispatcher::getMediaStats(Inspector::ObjCInspectorDOMBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e34_v16__0__RWIProtocolDOMMediaStats_8l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getMediaStatsWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5EF94(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector33ObjCInspectorDOMBackendDispatcher13getMediaStatsEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5F02C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5F1F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::enable(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "enableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5F394(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5F42C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5F4B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::disable(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "disableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD5F5D0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5F668(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5F6EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::getDOMStorageItems(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "getDOMStorageItemsWithErrorCallback:successCallback:storageId:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5F830(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher18getDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5F8C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD5FA84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::setDOMStorageItem(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4, _QWORD *a5)
{
  CFTypeRef v10;
  const __CFString *v11;
  _DWORD *v12;
  const __CFString *v13;
  _QWORD v15[6];
  _QWORD v16[6];
  _DWORD *v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = a1;
    v16[5] = a2;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = a1;
    v15[5] = a2;
    v10 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3));
    if (*a4)
      v11 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v11 = &stru_24DE03408;
    if (*a5)
      v13 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v13 = &stru_24DE03408;
    return objc_msgSend(*(id *)(a1 + 16), "setDOMStorageItemWithErrorCallback:successCallback:storageId:key:value:", v16, v15, v10, v11, v13);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v12 = v17;
    v17 = 0;
    if (v12)
    {
      if (*v12 == 2)
        WTF::StringImpl::destroy();
      else
        *v12 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5FC98(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5FD30(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher17setDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringESD__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD5FDB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::removeDOMStorageItem(uint64_t a1, uint64_t a2, uint64_t a3, _QWORD *a4)
{
  CFTypeRef v8;
  const __CFString *v9;
  _DWORD *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = a1;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = a1;
    v12[5] = a2;
    v8 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3));
    if (*a4)
      v9 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v9 = &stru_24DE03408;
    return objc_msgSend(*(id *)(a1 + 16), "removeDOMStorageItemWithErrorCallback:successCallback:storageId:key:", v13, v12, v8, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v14;
    v14 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD5FF1C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD5FFB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20removeDOMStorageItemElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEERKNS1_6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD60038(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorDOMStorageBackendDispatcher::clearDOMStorageItems(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "clearDOMStorageItemsWithErrorCallback:successCallback:storageId:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolDOMStorageStorageId alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD6017C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD60214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector40ObjCInspectorDOMStorageBackendDispatcher20clearDOMStorageItemsElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD60298(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::enable(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "enableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD603B8(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD60450(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD604D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::disable(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "disableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD605F4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6068C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD60710(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setExtraHTTPHeaders(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "setExtraHTTPHeadersWithErrorCallback:successCallback:headers:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolNetworkHeaders alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD60854(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD608EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher19setExtraHTTPHeadersElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD60970(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::getResponseBody(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e21_v20__0__NSString_8B16l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getResponseBodyWithErrorCallback:successCallback:requestId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD60AB0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15getResponseBodyElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD60B48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD60CEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setBoolean(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, WTF::JSONImpl::Value *a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  _DWORD *result;
  _DWORD *v10;
  _BYTE v11[24];

  WTF::JSONImpl::Value::create(a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    v5 = (uint64_t *)((char *)this + 24);
    v6 = *((unsigned int *)this + 9);
    if ((_DWORD)v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      v7 = *v5;
      v8 = *a2;
      if (*a2)
        *(_DWORD *)v8 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  result = v10;
  v10 = 0;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

void sub_21AD60E34(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setResourceCachingDisabled(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setResourceCachingDisabledWithErrorCallback:successCallback:disabled:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD60F5C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD60FF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher26setResourceCachingDisabledElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD61078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::loadResource(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  const __CFString *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e34_v28__0__NSString_8__NSString_16i24l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "loadResourceWithErrorCallback:successCallback:frameId:url:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD611DC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher12loadResourceElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD61274(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD614D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::getSerializedCertificate(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[5] = a2;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getSerializedCertificateWithErrorCallback:successCallback:requestId:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD6168C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher24getSerializedCertificateElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD61724(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD61868(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::resolveWebSocket(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  uint64_t *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  uint64_t v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e40_v16__0__RWIProtocolRuntimeRemoteObject_8l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    v14 = 0;
    if (*(_QWORD *)a4)
    {
      v14 = WTF::StringImpl::operator NSString *();
      if (*(_QWORD *)a4)
        v10 = &v14;
      else
        v10 = 0;
    }
    else
    {
      v10 = 0;
    }
    return objc_msgSend(*((id *)this + 2), "resolveWebSocketWithErrorCallback:successCallback:requestId:objectGroup:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = (_DWORD *)v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD61A4C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher16resolveWebSocketElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD61AE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD61CAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::setInterceptionEnabled(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setInterceptionEnabledWithErrorCallback:successCallback:enabled:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD61E54(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD61EEC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher22setInterceptionEnabledElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD61F70(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::addInterception(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, _BYTE *a5, char *a6)
{
  const __CFString *v12;
  _DWORD *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  char *v20;
  _DWORD *result;
  _QWORD *v22;
  char v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _DWORD *v26;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3)
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_24DE03408;
    v14 = *a4;
    if (*a4)
    {
      v15 = *(unsigned __int8 **)(v14 + 8);
      v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v15 = 0;
      v16 = 0x100000000;
    }
    v17 = 0;
    while (!WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 1]))
    {
      v17 += 3;
      if (v17 == 6)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        result = v26;
        v26 = 0;
        if (result)
        {
          if (*result == 2)
            return (_DWORD *)WTF::StringImpl::destroy();
          else
            *result -= 2;
        }
        return result;
      }
    }
    v18 = (&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 2];
    LOBYTE(v26) = 0;
    v19 = a5[1];
    if (a5[1])
      LOBYTE(v26) = *a5;
    v23 = 0;
    if (a6[1])
    {
      v23 = *a6;
      v20 = &v23;
    }
    else
    {
      v20 = 0;
    }
    if (v19)
      v22 = &v26;
    else
      v22 = 0;
    return (_DWORD *)objc_msgSend(*(id *)(a1 + 16), "addInterceptionWithErrorCallback:successCallback:url:stage:caseSensitive:isRegex:", v25, v24, v12, v18, v22, v20);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v13 = v26;
    v26 = 0;
    if (v13)
    {
      if (*v13 == 2)
        WTF::StringImpl::destroy();
      else
        *v13 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD621CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 72);
  *(_QWORD *)(v1 - 72) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6227C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher15addInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD62300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::removeInterception(uint64_t a1, uint64_t a2, _QWORD *a3, uint64_t *a4, _BYTE *a5, char *a6)
{
  const __CFString *v12;
  _DWORD *v13;
  uint64_t v14;
  unsigned __int8 *v15;
  unint64_t v16;
  uint64_t v17;
  char *v18;
  int v19;
  char *v20;
  _DWORD *result;
  _QWORD *v22;
  char v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _DWORD *v26;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3)
      v12 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v12 = &stru_24DE03408;
    v14 = *a4;
    if (*a4)
    {
      v15 = *(unsigned __int8 **)(v14 + 8);
      v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v15 = 0;
      v16 = 0x100000000;
    }
    v17 = 0;
    while (!WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 1]))
    {
      v17 += 3;
      if (v17 == 6)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        result = v26;
        v26 = 0;
        if (result)
        {
          if (*result == 2)
            return (_DWORD *)WTF::StringImpl::destroy();
          else
            *result -= 2;
        }
        return result;
      }
    }
    v18 = (&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[v17 + 2];
    LOBYTE(v26) = 0;
    v19 = a5[1];
    if (a5[1])
      LOBYTE(v26) = *a5;
    v23 = 0;
    if (a6[1])
    {
      v23 = *a6;
      v20 = &v23;
    }
    else
    {
      v20 = 0;
    }
    if (v19)
      v22 = &v26;
    else
      v22 = 0;
    return (_DWORD *)objc_msgSend(*(id *)(a1 + 16), "removeInterceptionWithErrorCallback:successCallback:url:stage:caseSensitive:isRegex:", v25, v24, v12, v18, v22, v20);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v13 = v26;
    v26 = 0;
    if (v13)
    {
      if (*v13 == 2)
        WTF::StringImpl::destroy();
      else
        *v13 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD6255C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 72);
  *(_QWORD *)(v1 - 72) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6260C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher18removeInterceptionElRKN3WTF6StringES4_ONSt3__18optionalIbEES8__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD62690(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::interceptContinue(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  uint64_t i;
  _DWORD *result;
  _QWORD v15[6];
  _QWORD v16[6];
  _DWORD *v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = this;
    v16[5] = a2;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = this;
    v15[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    v10 = *(_QWORD *)a4;
    if (*(_QWORD *)a4)
    {
      v11 = *(unsigned __int8 **)(v10 + 8);
      v12 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v11 = 0;
      v12 = 0x100000000;
    }
    for (i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v11, v12, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)objc_msgSend(*((id *)this + 2), "interceptContinueWithErrorCallback:successCallback:requestId:stage:", v16, v15, v8, (&Inspector::fromProtocolString<RWIProtocolNetworkStage>(WTF::String const&)::mappings)[i + 2]);
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    result = v17;
    v17 = 0;
    if (result)
    {
      if (*result == 2)
        return (_DWORD *)WTF::StringImpl::destroy();
      else
        *result -= 2;
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v17;
    v17 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_21AD6289C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6294C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher17interceptContinueElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD629D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptWithRequest(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, uint64_t *a6, _QWORD *a7)
{
  const __CFString *v14;
  _DWORD *v15;
  RWIProtocolNetworkHeaders *v16;
  _DWORD *v17;
  uint64_t *v19;
  uint64_t *v20;
  uint64_t *v21;
  CFTypeRef *v22;
  uint64_t v23;
  CFTypeRef v24;
  uint64_t v25;
  _QWORD v26[6];
  _QWORD v27[6];
  uint64_t v28;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v27[0] = MEMORY[0x24BDAC760];
    v27[1] = 3221225472;
    v27[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke;
    v27[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v27[4] = a1;
    v27[5] = a2;
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke_2;
    v26[3] = &__block_descriptor_48_e5_v8__0l;
    v26[4] = a1;
    v26[5] = a2;
    if (*a3)
      v14 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v14 = &stru_24DE03408;
    v28 = 0;
    if (*a4)
      v28 = WTF::StringImpl::operator NSString *();
    v25 = 0;
    if (*a5)
      v25 = WTF::StringImpl::operator NSString *();
    v24 = 0;
    if (*a6)
    {
      v16 = [RWIProtocolNetworkHeaders alloc];
      v23 = *a6;
      *a6 = 0;
      v24 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v16, "initWithJSONObject:", &v23));
      v17 = (_DWORD *)v23;
      v23 = 0;
      if (v17)
      {
        if (*v17 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*v17;
      }
    }
    v23 = 0;
    if (*a7)
    {
      v23 = WTF::StringImpl::operator NSString *();
      v19 = &v23;
      if (!*a7)
        v19 = 0;
    }
    else
    {
      v19 = 0;
    }
    if (*a4)
      v20 = &v28;
    else
      v20 = 0;
    if (*a5)
      v21 = &v25;
    else
      v21 = 0;
    if (*a6)
      v22 = &v24;
    else
      v22 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "interceptWithRequestWithErrorCallback:successCallback:requestId:url:method:headers:postData:", v27, v26, v14, v20, v21, v22, v19);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v15 = (_DWORD *)v28;
    v28 = 0;
    if (v15)
    {
      if (*v15 == 2)
        WTF::StringImpl::destroy();
      else
        *v15 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD62C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD62CE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher20interceptWithRequestElRKN3WTF6StringES4_S4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD62D64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptWithResponse(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, _QWORD *a6, int *a7, _QWORD *a8, CFTypeRef **a9)
{
  const __CFString *v17;
  _DWORD *v18;
  const __CFString *v19;
  CFTypeRef *v20;
  RWIProtocolNetworkHeaders *v21;
  CFTypeRef *v22;
  uint64_t *v24;
  int *v25;
  uint64_t *v26;
  CFTypeRef *v27;
  CFTypeRef v28;
  uint64_t v29;
  int v30;
  _QWORD v31[6];
  _QWORD v32[6];
  uint64_t v33;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v32[0] = MEMORY[0x24BDAC760];
    v32[1] = 3221225472;
    v32[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke;
    v32[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v32[4] = a1;
    v32[5] = a2;
    v31[0] = MEMORY[0x24BDAC760];
    v31[1] = 3221225472;
    v31[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke_2;
    v31[3] = &__block_descriptor_48_e5_v8__0l;
    v31[4] = a1;
    v31[5] = a2;
    if (*a3)
      v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v17 = &stru_24DE03408;
    if (*a4)
      v19 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v19 = &stru_24DE03408;
    v33 = 0;
    if (*a6)
      v33 = WTF::StringImpl::operator NSString *();
    v30 = 0;
    if (*((_BYTE *)a7 + 4))
      v30 = *a7;
    v29 = 0;
    if (*a8)
      v29 = WTF::StringImpl::operator NSString *();
    v28 = 0;
    v20 = *a9;
    if (*a9)
    {
      v21 = [RWIProtocolNetworkHeaders alloc];
      v27 = *a9;
      *a9 = 0;
      v28 = (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:](v21, "initWithJSONObject:", &v27));
      v22 = v27;
      v27 = 0;
      if (v22)
      {
        if (*(_DWORD *)v22 == 1)
          WTF::JSONImpl::Value::operator delete();
        else
          --*(_DWORD *)v22;
      }
      v20 = &v28;
      if (!*a9)
        v20 = 0;
    }
    if (*a6)
      v24 = &v33;
    else
      v24 = 0;
    v25 = &v30;
    if (!*((_BYTE *)a7 + 4))
      v25 = 0;
    v26 = &v29;
    if (!*a8)
      v26 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "interceptWithResponseWithErrorCallback:successCallback:requestId:content:base64Encoded:mimeType:status:statusText:headers:", v32, v31, v17, v19, a5, v24, v25, v26, v20, v27, v28, v29);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v18 = (_DWORD *)v33;
    v33 = 0;
    if (v18)
    {
      if (*v18 == 2)
        WTF::StringImpl::destroy();
      else
        *v18 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD62FD4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6309C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher21interceptWithResponseElRKN3WTF6StringES4_bS4_ONSt3__18optionalIiEES4_ONS1_6RefPtrINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsISB_EENS1_21DefaultRefDerefTraitsISB_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD63120(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorNetworkBackendDispatcher::interceptRequestWithResponse(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, uint64_t a5, _QWORD *a6, int a7, _QWORD *a8, uint64_t a9)
{
  const __CFString *v17;
  _DWORD *v18;
  const __CFString *v19;
  const __CFString *v20;
  const __CFString *v21;
  uint64_t v23;
  _QWORD v24[6];
  _QWORD v25[6];
  _DWORD *v26;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v25[0] = MEMORY[0x24BDAC760];
    v25[1] = 3221225472;
    v25[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke;
    v25[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v25[4] = a1;
    v25[5] = a2;
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke_2;
    v24[3] = &__block_descriptor_48_e5_v8__0l;
    v24[4] = a1;
    v24[5] = a2;
    if (*a3)
      v17 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v17 = &stru_24DE03408;
    if (*a4)
      v19 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v19 = &stru_24DE03408;
    if (*a6)
      v20 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v20 = &stru_24DE03408;
    if (*a8)
      v21 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v21 = &stru_24DE03408;
    LODWORD(v23) = a7;
    return objc_msgSend(*(id *)(a1 + 16), "interceptRequestWithResponseWithErrorCallback:successCallback:requestId:content:base64Encoded:mimeType:status:statusText:headers:", v25, v24, v17, v19, a5, v20, v23, v21, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolNetworkHeaders alloc], "initWithJSONObject:", a9)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v18 = v26;
    v26 = 0;
    if (v18)
    {
      if (*v18 == 2)
        WTF::StringImpl::destroy();
      else
        *v18 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD63314(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 72);
  *(_QWORD *)(v1 - 72) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD633AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher28interceptRequestWithResponseElRKN3WTF6StringES4_bS4_iS4_ONS1_3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS7_EENS1_21DefaultRefDerefTraitsIS7_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD63430(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::interceptRequestWithError(Inspector::ObjCInspectorNetworkBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unint64_t v12;
  uint64_t i;
  _DWORD *result;
  _QWORD v15[6];
  _QWORD v16[6];
  _DWORD *v17;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke;
    v16[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v16[4] = this;
    v16[5] = a2;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke_2;
    v15[3] = &__block_descriptor_48_e5_v8__0l;
    v15[4] = this;
    v15[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    v10 = *(_QWORD *)a4;
    if (*(_QWORD *)a4)
    {
      v11 = *(unsigned __int8 **)(v10 + 8);
      v12 = *(unsigned int *)(v10 + 4) | ((unint64_t)((*(_DWORD *)(v10 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v11 = 0;
      v12 = 0x100000000;
    }
    for (i = 0; i != 12; i += 3)
    {
      if (WTF::operator==(v11, v12, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)objc_msgSend(*((id *)this + 2), "interceptRequestWithErrorWithErrorCallback:successCallback:requestId:errorType:", v16, v15, v8, (&Inspector::fromProtocolString<RWIProtocolNetworkResourceErrorType>(WTF::String const&)::mappings)[i + 2]);
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    result = v17;
    v17 = 0;
    if (result)
    {
      if (*result == 2)
        return (_DWORD *)WTF::StringImpl::destroy();
      else
        *result -= 2;
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v17;
    v17 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_21AD6363C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD636EC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector37ObjCInspectorNetworkBackendDispatcher25interceptRequestWithErrorElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD63770(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::enable(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "enableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD63890(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD63928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6enableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD639AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::disable(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e5_v8__0l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "disableWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD63ACC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD63B64(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7disableEl_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD63BE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::reload(uint64_t a1, uint64_t a2, _BYTE *a3, char *a4)
{
  int v8;
  char *v9;
  _DWORD *v10;
  _QWORD *v11;
  char v13;
  _QWORD v14[6];
  _QWORD v15[6];
  _DWORD *v16;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke;
    v15[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v15[4] = a1;
    v15[5] = a2;
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke_2;
    v14[3] = &__block_descriptor_48_e5_v8__0l;
    v14[4] = a1;
    v14[5] = a2;
    LOBYTE(v16) = 0;
    v8 = a3[1];
    if (a3[1])
      LOBYTE(v16) = *a3;
    v13 = 0;
    if (a4[1])
    {
      v13 = *a4;
      v9 = &v13;
    }
    else
    {
      v9 = 0;
    }
    if (v8)
      v11 = &v16;
    else
      v11 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "reloadWithErrorCallback:successCallback:ignoreCache:revalidateAllResources:", v15, v14, v11, v9);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v10 = v16;
    v16 = 0;
    if (v10)
    {
      if (*v10 == 2)
        WTF::StringImpl::destroy();
      else
        *v10 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD63D50(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD63DE8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher6reloadElONSt3__18optionalIbEES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD63E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::navigate(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "navigateWithErrorCallback:successCallback:url:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD63FAC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD64044(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher8navigateElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD640C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::overrideUserAgent(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  uint64_t *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    v11 = 0;
    if (*(_QWORD *)a3)
    {
      v11 = WTF::StringImpl::operator NSString *();
      if (*(_QWORD *)a3)
        v6 = &v11;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    return objc_msgSend(*((id *)this + 2), "overrideUserAgentWithErrorCallback:successCallback:value:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = (_DWORD *)v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD64218(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD642B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17overrideUserAgentElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD64334(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorPageBackendDispatcher::overrideSetting(uint64_t a1, uint64_t a2, uint64_t *a3, _BYTE *a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  _DWORD *v11;
  uint64_t v12;
  char *v13;
  _QWORD *v14;
  _DWORD *result;
  _QWORD v16[6];
  _QWORD v17[6];
  _DWORD *v18;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke;
    v17[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v17[4] = a1;
    v17[5] = a2;
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke_2;
    v16[3] = &__block_descriptor_48_e5_v8__0l;
    v16[4] = a1;
    v16[5] = a2;
    v8 = *a3;
    if (*a3)
    {
      v9 = *(unsigned __int8 **)(v8 + 8);
      v10 = *(unsigned int *)(v8 + 4) | ((unint64_t)((*(_DWORD *)(v8 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v9 = 0;
      v10 = 0x100000000;
    }
    v12 = 0;
    while (!WTF::operator==(v9, v10, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12 + 1]))
    {
      v12 += 3;
      if (v12 == 36)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        result = v18;
        v18 = 0;
        if (result)
        {
          if (*result == 2)
            return (_DWORD *)WTF::StringImpl::destroy();
          else
            *result -= 2;
        }
        return result;
      }
    }
    v13 = (&Inspector::fromProtocolString<RWIProtocolPageSetting>(WTF::String const&)::mappings)[v12 + 2];
    LOBYTE(v18) = 0;
    if (a4[1])
    {
      LOBYTE(v18) = *a4;
      v14 = &v18;
    }
    else
    {
      v14 = 0;
    }
    return (_DWORD *)objc_msgSend(*(id *)(a1 + 16), "overrideSettingWithErrorCallback:successCallback:setting:value:", v17, v16, v13, v14);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v18;
    v18 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD64540(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD645F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15overrideSettingElRKN3WTF6StringEONSt3__18optionalIbEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD64674(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

char *Inspector::ObjCInspectorPageBackendDispatcher::overrideUserPreference(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  uint64_t v8;
  unsigned __int8 *v9;
  unint64_t v10;
  char *v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int8 *v16;
  unint64_t v17;
  char *result;
  char **v19;
  _Unwind_Exception *v20;
  char *v21;
  uint64_t v22;
  _QWORD v23[6];
  _QWORD v24[6];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke;
    v24[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v24[4] = this;
    v24[5] = a2;
    v23[0] = MEMORY[0x24BDAC760];
    v23[1] = 3221225472;
    v23[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke_2;
    v23[3] = &__block_descriptor_48_e5_v8__0l;
    v23[4] = this;
    v23[5] = a2;
    v8 = *(_QWORD *)a3;
    if (*(_QWORD *)a3)
    {
      v9 = *(unsigned __int8 **)(v8 + 8);
      v10 = *(unsigned int *)(v8 + 4) | ((unint64_t)((*(_DWORD *)(v8 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v9 = 0;
      v10 = 0x100000000;
    }
    v12 = 0;
    while (!WTF::operator==(v9, v10, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12 + 1]))
    {
      v12 += 3;
      if (v12 == 9)
      {
        WTF::StringImpl::createWithoutCopyingNonEmpty();
        Inspector::BackendDispatcher::reportProtocolError();
        result = v21;
        v21 = 0;
        if (result)
        {
          if (*(_DWORD *)result == 2)
            return (char *)WTF::StringImpl::destroy();
          else
            *(_DWORD *)result -= 2;
        }
        return result;
      }
    }
    v13 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceName>(WTF::String const&)::mappings)[v12 + 2];
    LOBYTE(v21) = 0;
    LOBYTE(v22) = 0;
    v14 = *(_QWORD *)a4;
    if (*(_QWORD *)a4)
    {
      v15 = 0;
      v16 = *(unsigned __int8 **)(v14 + 8);
      v17 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
      do
      {
        if (WTF::operator==(v16, v17, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15 + 1]))
        {
          v21 = (&Inspector::fromProtocolString<RWIProtocolPageUserPreferenceValue>(WTF::String const&)::mappings)[v15 + 2];
          LOBYTE(v22) = 1;
          if (*(_QWORD *)a4)
            v19 = &v21;
          else
            v19 = 0;
          return (char *)objc_msgSend(*((id *)this + 2), "overrideUserPreferenceWithErrorCallback:successCallback:name:value:", v24, v23, v13, v19, v21, v22);
        }
        v15 += 3;
      }
      while (v15 != 15);
      v19 = 0;
      v21 = 0;
      LOBYTE(v22) = 0;
      if (*(_QWORD *)a4)
      {
        v20 = (_Unwind_Exception *)std::__throw_bad_optional_access[abi:sn180100]();
        v21 = 0;
        _Unwind_Resume(v20);
      }
    }
    else
    {
      v19 = 0;
    }
    return (char *)objc_msgSend(*((id *)this + 2), "overrideUserPreferenceWithErrorCallback:successCallback:name:value:", v24, v23, v13, v19, v21, v22);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v21;
    v21 = 0;
    if (v11)
    {
      if (*(_DWORD *)v11 == 2)
        WTF::StringImpl::destroy();
      else
        *(_DWORD *)v11 -= 2;
    }
    return (char *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD649C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher22overrideUserPreferenceElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD64A48(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getCookies(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getCookiesWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD64B68(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher10getCookiesEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD64C00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD64EE4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setCookie(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = a1;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = a1;
    v8[5] = a2;
    return objc_msgSend(*(id *)(a1 + 16), "setCookieWithErrorCallback:successCallback:cookie:", v9, v8, (id)CFMakeCollectable(-[RWIProtocolJSONObject initWithJSONObject:]([RWIProtocolPageCookie alloc], "initWithJSONObject:", a3)));
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD650BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD65154(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher9setCookieElON3WTF3RefINS1_8JSONImpl6ObjectENS1_12RawPtrTraitsIS4_EENS1_21DefaultRefDerefTraitsIS4_EEEE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD651D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::deleteCookie(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  const __CFString *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e5_v8__0l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "deleteCookieWithErrorCallback:successCallback:cookieName:url:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD6533C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD653D4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12deleteCookieElRKN3WTF6StringES4__block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD65458(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getResourceTree(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e42_v16__0__RWIProtocolPageFrameResourceTree_8l;
    v6[4] = this;
    v6[5] = a2;
    return objc_msgSend(*((id *)this + 2), "getResourceTreeWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD65578(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher15getResourceTreeEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD65610(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD657D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::getResourceContent(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3, const WTF::String *a4)
{
  const __CFString *v8;
  _DWORD *v9;
  const __CFString *v10;
  _QWORD v12[6];
  _QWORD v13[6];
  _DWORD *v14;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke;
    v13[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v13[4] = this;
    v13[5] = a2;
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke_2;
    v12[3] = &__block_descriptor_48_e21_v20__0__NSString_8B16l;
    v12[4] = this;
    v12[5] = a2;
    if (*(_QWORD *)a3)
      v8 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v8 = &stru_24DE03408;
    if (*(_QWORD *)a4)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "getResourceContentWithErrorCallback:successCallback:frameId:url:", v13, v12, v8, v10);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v9 = v14;
    v14 = 0;
    if (v9)
    {
      if (*v9 == 2)
        WTF::StringImpl::destroy();
      else
        *v9 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD659BC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18getResourceContentElRKN3WTF6StringES4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD65A54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD65BF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, uint64_t a12)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setBootstrapScript(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  uint64_t *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  uint64_t v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    v11 = 0;
    if (*(_QWORD *)a3)
    {
      v11 = WTF::StringImpl::operator NSString *();
      if (*(_QWORD *)a3)
        v6 = &v11;
      else
        v6 = 0;
    }
    else
    {
      v6 = 0;
    }
    return objc_msgSend(*((id *)this + 2), "setBootstrapScriptWithErrorCallback:successCallback:source:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = (_DWORD *)v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD65DC0(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD65E58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher18setBootstrapScriptElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD65EDC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::searchInResource(uint64_t a1, uint64_t a2, _QWORD *a3, _QWORD *a4, _QWORD *a5, char *a6, char *a7, _QWORD *a8)
{
  const __CFString *v16;
  _DWORD *v17;
  const __CFString *v18;
  const __CFString *v19;
  int v20;
  int v21;
  uint64_t *v22;
  char *v23;
  char *v24;
  char v26;
  char v27;
  _QWORD v28[6];
  _QWORD v29[6];
  uint64_t v30;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke;
    v29[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v29[4] = a1;
    v29[5] = a2;
    v28[0] = MEMORY[0x24BDAC760];
    v28[1] = 3221225472;
    v28[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke_2;
    v28[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v28[4] = a1;
    v28[5] = a2;
    if (*a3)
      v16 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v16 = &stru_24DE03408;
    if (*a4)
      v18 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v18 = &stru_24DE03408;
    if (*a5)
      v19 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v19 = &stru_24DE03408;
    v27 = 0;
    v20 = a6[1];
    if (a6[1])
      v27 = *a6;
    v26 = 0;
    v21 = a7[1];
    if (a7[1])
      v26 = *a7;
    v30 = 0;
    if (*a8)
    {
      v30 = WTF::StringImpl::operator NSString *();
      v20 = a6[1];
      v21 = a7[1];
      v22 = &v30;
      if (!*a8)
        v22 = 0;
    }
    else
    {
      v22 = 0;
    }
    if (v20)
      v23 = &v27;
    else
      v23 = 0;
    v24 = &v26;
    if (!v21)
      v24 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "searchInResourceWithErrorCallback:successCallback:frameId:url:query:caseSensitive:isRegex:requestId:", v29, v28, v16, v18, v19, v23, v24, v22);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v17 = (_DWORD *)v30;
    v30 = 0;
    if (v17)
    {
      if (*v17 == 2)
        WTF::StringImpl::destroy();
      else
        *v17 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD660FC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 72);
  *(_QWORD *)(v1 - 72) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16searchInResourceElRKN3WTF6StringES4_S4_ONSt3__18optionalIbEES8_S4__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD66194(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD66478(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::searchInResources(uint64_t a1, uint64_t a2, _QWORD *a3, _BYTE *a4, char *a5)
{
  const __CFString *v10;
  _DWORD *v11;
  int v12;
  char *v13;
  _QWORD *v14;
  char v16;
  _QWORD v17[6];
  _QWORD v18[6];
  _DWORD *v19;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke;
    v18[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v18[4] = a1;
    v18[5] = a2;
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke_2;
    v17[3] = &__block_descriptor_48_e17_v16__0__NSArray_8l;
    v17[4] = a1;
    v17[5] = a2;
    if (*a3)
      v10 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v10 = &stru_24DE03408;
    LOBYTE(v19) = 0;
    v12 = a4[1];
    if (a4[1])
      LOBYTE(v19) = *a4;
    v16 = 0;
    if (a5[1])
    {
      v16 = *a5;
      v13 = &v16;
    }
    else
    {
      v13 = 0;
    }
    if (v12)
      v14 = &v19;
    else
      v14 = 0;
    return objc_msgSend(*(id *)(a1 + 16), "searchInResourcesWithErrorCallback:successCallback:text:caseSensitive:isRegex:", v18, v17, v10, v14, v13);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v11 = v19;
    v19 = 0;
    if (v11)
    {
      if (*v11 == 2)
        WTF::StringImpl::destroy();
      else
        *v11 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(a1 + 8));
  }
}

void sub_21AD6669C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 56);
  *(_QWORD *)(v1 - 56) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17searchInResourcesElRKN3WTF6StringEONSt3__18optionalIbEES8__block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD66734(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD66A18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,_DWORD *a25)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a25)
  {
    if (*a25 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a25;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setShowPaintRects(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke_2;
    v8[3] = &__block_descriptor_48_e5_v8__0l;
    v8[4] = this;
    v8[5] = a2;
    return objc_msgSend(*((id *)this + 2), "setShowPaintRectsWithErrorCallback:successCallback:result:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD66BD4(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD66C6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher17setShowPaintRectsElb_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD66CF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::setEmulatedMedia(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, const WTF::String *a3)
{
  const __CFString *v6;
  _DWORD *v7;
  _QWORD v9[6];
  _QWORD v10[6];
  _DWORD *v11;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke;
    v10[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v10[4] = this;
    v10[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke_2;
    v9[3] = &__block_descriptor_48_e5_v8__0l;
    v9[4] = this;
    v9[5] = a2;
    if (*(_QWORD *)a3)
      v6 = (const __CFString *)WTF::StringImpl::operator NSString *();
    else
      v6 = &stru_24DE03408;
    return objc_msgSend(*((id *)this + 2), "setEmulatedMediaWithErrorCallback:successCallback:media:", v10, v9, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v11;
    v11 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD66E30(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD66EC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher16setEmulatedMediaElRKN3WTF6StringE_block_invoke_2(WTF::JSONImpl::Object *a1)
{
  uint64_t result;
  _DWORD *v2;

  WTF::JSONImpl::Object::create(a1);
  Inspector::BackendDispatcher::sendResponse();
  result = (uint64_t)v2;
  if (v2)
  {
    if (*v2 == 1)
      return WTF::JSONImpl::Value::operator delete();
    else
      --*v2;
  }
  return result;
}

void sub_21AD66F4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::snapshotNode(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3)
{
  _DWORD *v7;
  _QWORD v8[6];
  _QWORD v9[6];
  _DWORD *v10;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8[5] = a2;
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke;
    v9[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v9[4] = this;
    v9[5] = a2;
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke_2;
    v8[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v8[4] = this;
    return objc_msgSend(*((id *)this + 2), "snapshotNodeWithErrorCallback:successCallback:nodeId:", v9, v8, a3);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v7 = v10;
    v10 = 0;
    if (v7)
    {
      if (*v7 == 2)
        WTF::StringImpl::destroy();
      else
        *v7 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD6706C(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotNodeEli_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD67104(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD67248(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

_DWORD *Inspector::ObjCInspectorPageBackendDispatcher::snapshotRect(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, const WTF::String *a7)
{
  uint64_t v14;
  unsigned __int8 *v15;
  unint64_t v16;
  _DWORD *v17;
  uint64_t i;
  _DWORD *result;
  _QWORD v20[6];
  _QWORD v21[6];
  _DWORD *v22;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v20[5] = a2;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke;
    v21[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v21[4] = this;
    v21[5] = a2;
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke_2;
    v20[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v20[4] = this;
    v14 = *(_QWORD *)a7;
    if (*(_QWORD *)a7)
    {
      v15 = *(unsigned __int8 **)(v14 + 8);
      v16 = *(unsigned int *)(v14 + 4) | ((unint64_t)((*(_DWORD *)(v14 + 16) >> 2) & 1) << 32);
    }
    else
    {
      v15 = 0;
      v16 = 0x100000000;
    }
    for (i = 0; i != 6; i += 3)
    {
      if (WTF::operator==(v15, v16, (unsigned __int8 *)(&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i], (uint64_t)(&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i + 1]))
      {
        return (_DWORD *)objc_msgSend(*((id *)this + 2), "snapshotRectWithErrorCallback:successCallback:x:y:width:height:coordinateSystem:", v21, v20, a3, a4, a5, a6, (&Inspector::fromProtocolString<RWIProtocolPageCoordinateSystem>(WTF::String const&)::mappings)[i + 2]);
      }
    }
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    result = v22;
    v22 = 0;
    if (result)
    {
      if (*result == 2)
        return (_DWORD *)WTF::StringImpl::destroy();
      else
        *result -= 2;
    }
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v17 = v22;
    v22 = 0;
    if (v17)
    {
      if (*v17 == 2)
        WTF::StringImpl::destroy();
      else
        *v17 -= 2;
    }
    return (_DWORD *)Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
  return result;
}

void sub_21AD674CC(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 88);
  *(_QWORD *)(v1 - 88) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher12snapshotRectEliiiiRKN3WTF6StringE_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD6757C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD676C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

uint64_t Inspector::ObjCInspectorPageBackendDispatcher::archive(Inspector::ObjCInspectorPageBackendDispatcher *this, uint64_t a2)
{
  _DWORD *v5;
  _QWORD v6[6];
  _QWORD v7[6];
  _DWORD *v8;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6[5] = a2;
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke;
    v7[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v7[4] = this;
    v7[5] = a2;
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke_2;
    v6[3] = &__block_descriptor_48_e18_v16__0__NSString_8l;
    v6[4] = this;
    return objc_msgSend(*((id *)this + 2), "archiveWithErrorCallback:successCallback:", v7, v6);
  }
  else
  {
    WTF::StringImpl::createWithoutCopyingNonEmpty();
    Inspector::BackendDispatcher::reportProtocolError();
    v5 = v8;
    v8 = 0;
    if (v5)
    {
      if (*v5 == 2)
        WTF::StringImpl::destroy();
      else
        *v5 -= 2;
    }
    return Inspector::BackendDispatcher::sendPendingErrors(*((Inspector::BackendDispatcher **)this + 1));
  }
}

void sub_21AD67848(_Unwind_Exception *exception_object)
{
  uint64_t v1;
  uint64_t v3;

  v3 = *(_QWORD *)(v1 - 40);
  *(_QWORD *)(v1 - 40) = 0;
  if (v3)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

uint64_t ___ZN9Inspector34ObjCInspectorPageBackendDispatcher7archiveEl_block_invoke(uint64_t a1)
{
  uint64_t v1;
  _DWORD *v2;
  _DWORD *v4;

  v1 = *(_QWORD *)(a1 + 32);
  MEMORY[0x2207574E0](&v4);
  Inspector::BackendDispatcher::reportProtocolError();
  v2 = v4;
  v4 = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
  return Inspector::BackendDispatcher::sendPendingErrors(*(Inspector::BackendDispatcher **)(v1 + 8));
}

void sub_21AD678E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD67A24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

void Inspector::ObjCInspectorCSSBackendDispatcher::~ObjCInspectorCSSBackendDispatcher(Inspector::ObjCInspectorCSSBackendDispatcher *this, void *a2)
{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
}

{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorDOMBackendDispatcher::~ObjCInspectorDOMBackendDispatcher(Inspector::ObjCInspectorDOMBackendDispatcher *this, void *a2)
{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
}

{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorDOMStorageBackendDispatcher::~ObjCInspectorDOMStorageBackendDispatcher(Inspector::ObjCInspectorDOMStorageBackendDispatcher *this, void *a2)
{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
}

{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorNetworkBackendDispatcher::~ObjCInspectorNetworkBackendDispatcher(Inspector::ObjCInspectorNetworkBackendDispatcher *this, void *a2)
{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
}

{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  WTF::fastFree(this, a2);
}

void Inspector::ObjCInspectorPageBackendDispatcher::~ObjCInspectorPageBackendDispatcher(Inspector::ObjCInspectorPageBackendDispatcher *this, void *a2)
{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
}

{
  const void *v3;
  WTF *v4;

  v3 = (const void *)*((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v3)
    CFRelease(v3);
  v4 = (WTF *)*((_QWORD *)this + 1);
  *((_QWORD *)this + 1) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  WTF::fastFree(this, a2);
}

_DWORD *WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>@<X0>(uint64_t *a1@<X0>, WTF::StringImpl **a2@<X1>, uint64_t *a3@<X2>, uint64_t a4@<X8>)
{
  uint64_t v8;
  unsigned int v9;
  unsigned int v10;
  int v11;
  _QWORD *v12;
  int i;
  uint64_t v14;
  _DWORD **v15;
  _DWORD *result;
  uint64_t v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  unint64_t v26;
  uint64_t v27;

  v8 = *a1;
  if (*a1
    || (WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(a1, 0), (v8 = *a1) != 0))
  {
    v9 = *(_DWORD *)(v8 - 8);
  }
  else
  {
    v9 = 0;
  }
  v10 = *((_DWORD *)*a2 + 4);
  if (v10 < 0x100)
    v11 = WTF::StringImpl::hashSlowCase(*a2);
  else
    v11 = v10 >> 8;
  v12 = 0;
  for (i = 1; ; ++i)
  {
    v14 = v11 & v9;
    v15 = (_DWORD **)(v8 + 16 * v14);
    if (*v15 != (_DWORD *)-1)
      break;
    v12 = (_QWORD *)(v8 + 16 * v14);
LABEL_13:
    v11 = i + v14;
  }
  if (!*v15)
  {
    if (v12)
    {
      *v12 = 0;
      v12[1] = 0;
      --*(_DWORD *)(*a1 - 16);
      v15 = (_DWORD **)v12;
    }
    WTF::String::operator=(v15, (_DWORD **)a2);
    result = WTF::GenericHashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>::assignToEmpty<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(v15 + 1, a3);
    v17 = *a1;
    if (*a1)
      v18 = *(_DWORD *)(v17 - 12) + 1;
    else
      v18 = 1;
    *(_DWORD *)(v17 - 12) = v18;
    v21 = *a1;
    if (*a1)
      v22 = *(_DWORD *)(v21 - 12);
    else
      v22 = 0;
    v25 = (*(_DWORD *)(v21 - 16) + v22);
    v26 = *(unsigned int *)(v21 - 4);
    if (v26 > 0x400)
    {
      if (v26 > 2 * v25)
        goto LABEL_33;
    }
    else if (3 * v26 > 4 * v25)
    {
      goto LABEL_33;
    }
    result = (_DWORD *)WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(a1, (uint64_t)v15);
    v15 = (_DWORD **)result;
    v21 = *a1;
    if (!*a1)
    {
      v27 = 0;
      goto LABEL_37;
    }
LABEL_33:
    v27 = *(unsigned int *)(v21 - 4);
LABEL_37:
    *(_QWORD *)a4 = v15;
    *(_QWORD *)(a4 + 8) = v21 + 16 * v27;
    *(_BYTE *)(a4 + 16) = 1;
    return result;
  }
  if (!WTF::equal())
    goto LABEL_13;
  v19 = *a1;
  if (*a1)
    v20 = *(unsigned int *)(v19 - 4);
  else
    v20 = 0;
  *(_QWORD *)a4 = v15;
  *(_QWORD *)(a4 + 8) = v19 + 16 * v20;
  *(_BYTE *)(a4 + 16) = 0;
  v23 = v8 + 16 * v14;
  v24 = *a3;
  *a3 = 0;
  result = *(_DWORD **)(v23 + 8);
  *(_QWORD *)(v23 + 8) = v24;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::expand(uint64_t *a1, uint64_t a2)
{
  uint64_t v3;
  int v4;
  unsigned int v5;

  v3 = *a1;
  if (*a1 && (v4 = *(_DWORD *)(v3 - 4)) != 0)
    v5 = v4 << (6 * *(_DWORD *)(v3 - 12) >= (2 * v4));
  else
    v5 = 8;
  return WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(a1, v5, a2);
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::rehash(uint64_t *a1, unsigned int a2, uint64_t a3)
{
  uint64_t v6;
  unsigned int v7;
  int v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  WTF::StringImpl *v14;
  _DWORD *v15;
  uint64_t v16;
  _DWORD *v17;
  _DWORD *v18;
  WTF::StringImpl *v19;
  uint64_t v20;
  _DWORD *v21;
  WTF::StringImpl *v22;
  uint64_t result;

  v6 = *a1;
  if (*a1)
  {
    v7 = *(_DWORD *)(v6 - 4);
    v8 = *(_DWORD *)(v6 - 12);
  }
  else
  {
    v7 = 0;
    v8 = 0;
  }
  v9 = WTF::fastZeroedMalloc((WTF *)(16 * a2 + 16));
  *a1 = v9 + 16;
  *(_DWORD *)(v9 + 12) = a2;
  *(_DWORD *)(*a1 - 8) = a2 - 1;
  *(_DWORD *)(*a1 - 16) = 0;
  *(_DWORD *)(*a1 - 12) = v8;
  v11 = 0;
  if (v7)
  {
    v12 = v7;
    v13 = v6;
    do
    {
      v14 = *(WTF::StringImpl **)v13;
      if (*(_QWORD *)v13 != -1)
      {
        if (v14)
        {
          v16 = WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::lookupForReinsert(a1, (WTF::StringImpl **)v13);
          v17 = *(_DWORD **)(v16 + 8);
          *(_QWORD *)(v16 + 8) = 0;
          if (v17)
          {
            if (*v17 == 1)
              WTF::JSONImpl::Value::operator delete();
            else
              --*v17;
          }
          v18 = *(_DWORD **)v16;
          *(_QWORD *)v16 = 0;
          if (v18)
          {
            if (*v18 == 2)
              WTF::StringImpl::destroy();
            else
              *v18 -= 2;
          }
          v19 = *(WTF::StringImpl **)v13;
          *(_QWORD *)v13 = 0;
          *(_QWORD *)v16 = v19;
          v20 = *(_QWORD *)(v13 + 8);
          *(_QWORD *)(v13 + 8) = 0;
          *(_QWORD *)(v16 + 8) = v20;
          v21 = *(_DWORD **)(v13 + 8);
          *(_QWORD *)(v13 + 8) = 0;
          if (v21)
          {
            if (*v21 == 1)
              WTF::JSONImpl::Value::operator delete();
            else
              --*v21;
          }
          v22 = *(WTF::StringImpl **)v13;
          *(_QWORD *)v13 = 0;
          if (v22)
          {
            if (*(_DWORD *)v22 == 2)
              WTF::StringImpl::destroy();
            else
              *(_DWORD *)v22 -= 2;
          }
          if (v13 == a3)
            v11 = v16;
        }
        else
        {
          v15 = *(_DWORD **)(v13 + 8);
          *(_QWORD *)(v13 + 8) = 0;
          if (v15)
          {
            if (*v15 == 1)
            {
              WTF::JSONImpl::Value::operator delete();
              v14 = *(WTF::StringImpl **)v13;
            }
            else
            {
              --*v15;
            }
          }
          *(_QWORD *)v13 = 0;
          if (v14)
          {
            if (*(_DWORD *)v14 == 2)
              WTF::StringImpl::destroy();
            else
              *(_DWORD *)v14 -= 2;
          }
        }
      }
      v13 += 16;
      --v12;
    }
    while (v12);
  }
  else
  {
    result = 0;
    if (!v6)
      return result;
  }
  WTF::fastFree((WTF *)(v6 - 16), v10);
  return v11;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::lookupForReinsert(uint64_t *a1, WTF::StringImpl **a2)
{
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;
  int v6;
  uint64_t v7;

  v2 = *a1;
  if (*a1)
    v3 = *(_DWORD *)(v2 - 8);
  else
    v3 = 0;
  v4 = *((_DWORD *)*a2 + 4);
  if (v4 < 0x100)
    v5 = WTF::StringImpl::hashSlowCase(*a2);
  else
    v5 = v4 >> 8;
  v6 = 0;
  do
  {
    v7 = v5 & v3;
    v5 = ++v6 + v7;
  }
  while (*(_QWORD *)(v2 + 16 * v7));
  return v2 + 16 * v7;
}

_DWORD *WTF::GenericHashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>::assignToEmpty<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>(_DWORD **a1, _QWORD *a2)
{
  _DWORD *v3;
  _DWORD *result;

  v3 = (_DWORD *)*a2;
  *a2 = 0;
  result = *a1;
  *a1 = v3;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

_DWORD **WTF::String::operator=(_DWORD **a1, _DWORD **a2)
{
  _DWORD *v3;
  _DWORD *v4;

  v3 = *a2;
  if (*a2)
    *v3 += 2;
  v4 = *a1;
  *a1 = v3;
  if (v4)
  {
    if (*v4 == 2)
      WTF::StringImpl::destroy();
    else
      *v4 -= 2;
  }
  return a1;
}

uint64_t WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>(uint64_t a1, unint64_t a2)
{
  _DWORD **v3;
  uint64_t v4;
  uint64_t v5;
  _DWORD *v6;

  v3 = (_DWORD **)WTF::Vector<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::expandCapacity<(WTF::FailureAction)0>(a1, *(unsigned int *)(a1 + 12) + 1, a2);
  v4 = *(unsigned int *)(a1 + 12);
  v5 = *(_QWORD *)a1;
  v6 = *v3;
  if (*v3)
    *v6 += 2;
  *(_QWORD *)(v5 + 8 * v4) = v6;
  *(_DWORD *)(a1 + 12) = v4 + 1;
  return 1;
}

BOOL WTF::operator==(unsigned __int8 *a1, uint64_t a2, unsigned __int8 *a3, uint64_t a4)
{
  int v5;
  _BOOL8 result;
  unsigned int v7;
  int8x16_t *v8;
  int8x16_t *v9;
  int v10;
  int v11;
  BOOL v12;
  int16x8_t *v13;
  unsigned int v14;
  uint8x8_t *v15;
  uint16x8_t v16;
  unsigned int v17;
  uint16x8_t v18;
  BOOL v19;
  unint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  __int32 v26;
  uint64_t v27;
  int v28;
  int v29;
  uint8x16_t v30;
  uint8x16_t v31;
  unsigned int v32;
  uint8x16_t v33;
  BOOL v34;

  v5 = a4 - 1;
  if (!a4)
    v5 = 0;
  result = (_DWORD)a2 == v5 && a1 == a3;
  if (a1 == a3 || (_DWORD)a2 != v5)
    return result;
  if (!(_DWORD)a2)
    return 1;
  if ((a2 & 0xFF00000000) == 0)
  {
    if (!v5)
      goto LABEL_61;
    if (*(_WORD *)a1 != *a3)
      return 0;
    v13 = (int16x8_t *)(a1 + 2);
    v14 = v5 - 1;
    v15 = (uint8x8_t *)(a3 + 1);
    if (v14 >= 8)
    {
      v16 = (uint16x8_t)vceqq_s16(*v13, (int16x8_t)vmovl_u8(*v15));
      v16.i16[0] = vminvq_u16(v16);
      if (v16.i32[0])
      {
        v17 = v14 & 7;
        do
        {
          v18 = (uint16x8_t)vceqq_s16(*(int16x8_t *)((char *)v13 + 2 * v17), (int16x8_t)vmovl_u8(*(uint8x8_t *)((char *)v15 + v17)));
          v18.i16[0] = vminvq_u16(v18);
          result = v18.i32[0] != 0;
          v17 += 8;
          if (v18.i32[0])
            v19 = v17 >= v14;
          else
            v19 = 1;
        }
        while (!v19);
        return result;
      }
      return 0;
    }
    if (v14 >= 4)
    {
      v20 = (v15->u32[0] | ((unint64_t)v15->u32[0] << 16)) & 0xFFFF0000FFFFLL;
      v12 = ((v20 | (v20 << 8)) & 0xFF00FF00FF00FFLL) == v13->i64[0];
      v21 = v14 & 3;
      v22 = (*(unsigned int *)((char *)v15->u32 + v21) | ((unint64_t)*(unsigned int *)((char *)v15->u32 + v21) << 16)) & 0xFFFF0000FFFFLL;
      v23 = (v22 | (v22 << 8)) & 0xFF00FF00FF00FFLL;
      v24 = *(uint64_t *)((char *)v13->i64 + 2 * v21);
      return v12 && v23 == v24;
    }
    if (v14 >= 2)
    {
      v25 = (v15->u16[0] | (v15->u16[0] << 8)) & 0xFF00FF;
      v26 = v13->i32[0];
      v27 = v14 & 1;
      v28 = (*(unsigned __int16 *)((char *)v15->u16 + v27) | (*(unsigned __int16 *)((char *)v15->u16 + v27) << 8)) & 0xFF00FF;
      v29 = *(__int32 *)((char *)v13->i32 + 2 * v27);
      return v25 == v26 && v28 == v29;
    }
    if (v14 == 1)
    {
      v11 = v15->u8[0];
      v10 = v13->u16[0];
      return v10 == v11;
    }
    return 1;
  }
  if (!v5)
  {
LABEL_61:
    __break(1u);
    return result;
  }
  if (*a1 != *a3)
    return 0;
  v7 = v5 - 1;
  if (v5 == 1)
    return 1;
  v8 = (int8x16_t *)(a1 + 1);
  v9 = (int8x16_t *)(a3 + 1);
  if (v5 == 2)
  {
    v10 = v8->u8[0];
    v11 = v9->u8[0];
    return v10 == v11;
  }
  switch(31 - __clz(v5 - 2))
  {
    case 0u:
      v10 = v8->u16[0];
      v11 = v9->u16[0];
      return v10 == v11;
    case 1u:
      if (v8->u16[0] != v9->u16[0])
        return 0;
      v10 = *(unsigned __int16 *)&a1[v5 - 2];
      v11 = *(unsigned __int16 *)&a3[v5 - 2];
      return v10 == v11;
    case 2u:
      if (v8->i32[0] != v9->i32[0])
        return 0;
      v10 = *(_DWORD *)&a1[v5 - 4];
      v11 = *(_DWORD *)&a3[v5 - 4];
      return v10 == v11;
    case 3u:
      if (v8->i64[0] != v9->i64[0])
        return 0;
      return *(_QWORD *)&a1[v5 - 8] == *(_QWORD *)&a3[v5 - 8];
    case 4u:
      v31 = (uint8x16_t)vandq_s8(vceqq_s8(*(int8x16_t *)&a1[v5 - 16], *(int8x16_t *)&a3[v5 - 16]), vceqq_s8(*(int8x16_t *)(a1 + 1), *(int8x16_t *)(a3 + 1)));
      v31.i8[0] = vminvq_u8(v31);
      return v31.i32[0] != 0;
    default:
      v30 = (uint8x16_t)vceqq_s8(*v8, *v9);
      v30.i8[0] = vminvq_u8(v30);
      if (!v30.i32[0])
        return 0;
      if (v7 < 0x10)
        return 1;
      v32 = v7 & 0xF;
      do
      {
        v33 = (uint8x16_t)vceqq_s8(*(int8x16_t *)((char *)v8 + v32), *(int8x16_t *)((char *)v9 + v32));
        v33.i8[0] = vminvq_u8(v33);
        result = v33.i32[0] != 0;
        v32 += 16;
        if (v33.i32[0])
          v34 = v32 >= v7;
        else
          v34 = 1;
      }
      while (!v34);
      break;
  }
  return result;
}

uint64_t std::__throw_bad_optional_access[abi:sn180100]()
{
  std::__libcpp_verbose_abort("bad_optional_access was thrown in -fno-exceptions mode");
  return WTF::RefCounted<Inspector::BackendDispatcher>::deref();
}

WTF *WTF::RefCounted<Inspector::BackendDispatcher>::deref(WTF *result, void *a2)
{
  WTF *v2;
  void *v3;
  _DWORD **v4;
  uint64_t v5;

  v2 = result;
  if (*(_DWORD *)result == 1)
  {
    WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector((uint64_t)result + 24, a2);
    v4 = (_DWORD **)*((_QWORD *)v2 + 2);
    if (v4)
      WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(v4, v3);
    v5 = *((_QWORD *)v2 + 1);
    *((_QWORD *)v2 + 1) = 0;
    if (v5)
      WTF::RefCounted<Inspector::FrontendRouter>::deref(v5, v3);
    return (WTF *)WTF::fastFree(v2, v3);
  }
  else
  {
    --*(_DWORD *)result;
  }
  return result;
}

uint64_t WTF::Vector<std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::~Vector(uint64_t a1, void *a2)
{
  uint64_t v3;
  WTF *v4;

  v3 = *(unsigned int *)(a1 + 12);
  if ((_DWORD)v3)
    WTF::VectorDestructor<true,std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>>::destruct(*(_DWORD **)a1, (_DWORD *)(*(_QWORD *)a1 + 16 * v3));
  v4 = *(WTF **)a1;
  if (*(_QWORD *)a1)
  {
    *(_QWORD *)a1 = 0;
    *(_DWORD *)(a1 + 8) = 0;
    WTF::fastFree(v4, a2);
  }
  return a1;
}

_DWORD *WTF::VectorDestructor<true,std::tuple<Inspector::BackendDispatcher::CommonErrorCode,WTF::String>>::destruct(_DWORD *result, _DWORD *a2)
{
  _DWORD *v3;

  if (result != a2)
  {
    v3 = result;
    do
    {
      result = (_DWORD *)*((_QWORD *)v3 + 1);
      *((_QWORD *)v3 + 1) = 0;
      if (result)
      {
        if (*result == 2)
          result = (_DWORD *)WTF::StringImpl::destroy();
        else
          *result -= 2;
      }
      v3 += 4;
    }
    while (v3 != a2);
  }
  return result;
}

uint64_t WTF::HashTable<WTF::String,WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>,WTF::KeyValuePairKeyExtractor<WTF::KeyValuePair<WTF::String,Inspector::SupplementalBackendDispatcher *>>,WTF::DefaultHash<WTF::String>,WTF::HashMap<WTF::String,Inspector::SupplementalBackendDispatcher *,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<Inspector::SupplementalBackendDispatcher *>,WTF::HashTableTraits>::KeyValuePairTraits,WTF::HashTraits<WTF::String>>::deallocateTable(_DWORD **a1, void *a2)
{
  uint64_t v3;
  _DWORD **v4;
  _DWORD *v5;

  v3 = *((unsigned int *)a1 - 1);
  if ((_DWORD)v3)
  {
    v4 = a1;
    do
    {
      v5 = *v4;
      if (*v4 != (_DWORD *)-1)
      {
        *v4 = 0;
        if (v5)
        {
          if (*v5 == 2)
            WTF::StringImpl::destroy();
          else
            *v5 -= 2;
        }
      }
      v4 += 2;
      --v3;
    }
    while (v3);
  }
  return WTF::fastFree((WTF *)(a1 - 2), a2);
}

uint64_t WTF::RefCounted<Inspector::FrontendRouter>::deref(uint64_t this, void *a2)
{
  uint64_t v2;
  WTF *v3;

  v2 = this;
  if (*(_DWORD *)this == 1)
  {
    v3 = *(WTF **)(this + 8);
    if ((WTF *)(v2 + 24) != v3 && v3 != 0)
    {
      *(_QWORD *)(v2 + 8) = 0;
      *(_DWORD *)(v2 + 16) = 0;
      WTF::fastFree(v3, a2);
    }
    return WTF::fastFree((WTF *)v2, a2);
  }
  else
  {
    --*(_DWORD *)this;
  }
  return this;
}

void sub_21AD68888(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  WTF *v15;
  void *v16;
  WTF *v17;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  v17 = a14;
  a14 = 0;
  if (v17)
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  _Unwind_Resume(exception_object);
}

void sub_21AD68A88(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  WTF *v15;
  void *v16;
  WTF *v17;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  v17 = a14;
  a14 = 0;
  if (v17)
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  _Unwind_Resume(exception_object);
}

void sub_21AD68C38(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  WTF *v15;
  void *v16;
  WTF *v17;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  v17 = a14;
  a14 = 0;
  if (v17)
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  _Unwind_Resume(exception_object);
}

void sub_21AD68DE8(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  WTF *v15;
  void *v16;
  WTF *v17;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  v17 = a14;
  a14 = 0;
  if (v17)
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  _Unwind_Resume(exception_object);
}

void sub_21AD68F98(_Unwind_Exception *exception_object, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, Inspector::InspectorAgentBase *a13, WTF *a14)
{
  WTF *v15;
  void *v16;
  WTF *v17;

  if (a10)
    (*(void (**)(uint64_t))(*(_QWORD *)a10 + 8))(a10);
  if (a13)
  {
    Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a13, a2);
    WTF::fastFree(v15, v16);
  }
  v17 = a14;
  a14 = 0;
  if (v17)
    std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100]((int)&a14, v17);
  _Unwind_Resume(exception_object);
}

_QWORD *Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(_QWORD *a1, CFTypeRef cf)
{
  const void *v4;

  a1[1] = 0;
  *a1 = &unk_24DE01410;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4)
      CFRelease(v4);
  }
  return a1;
}

void sub_21AD691A4(_Unwind_Exception *a1, void *a2)
{
  uint64_t v2;
  WTF **v3;
  const void *v5;

  v5 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;
  if (v5)
    CFRelease(v5);
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorCSSBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *result;
  uint64_t v14;
  _DWORD *v15[2];

  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (_DWORD *)MEMORY[0x24BDDA748];
      *MEMORY[0x24BDDA748] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  v11 = *a3;
  *a3 = 0;
  v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2)
      return (_DWORD *)WTF::StringImpl::destroy();
    else
      *result -= 2;
  }
  return result;
}

void sub_21AD692B8(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF *v11;

  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

_QWORD *Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::AlternateDispatchableAgent(_QWORD *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  WTF *v11;
  uint64_t v13;

  *a1 = off_24DE01B28;
  v6 = *a2;
  if (*a2)
    *v6 += 2;
  *a1 = off_24DE01AE8;
  a1[1] = v6;
  v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  Inspector::CSSBackendDispatcher::create();
  a1[3] = v13;
  *(_QWORD *)(v13 + 24) = a1[2];
  v8 = a1[2];
  v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  ++*v9;
  v11 = *(WTF **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;
  if (v11)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  return a1;
}

void sub_21AD693DC(_Unwind_Exception *a1)
{
  Inspector::InspectorAgentBase *v1;
  _DWORD *v3;
  uint64_t v4;

  v3 = (_DWORD *)*((_QWORD *)v1 + 3);
  *((_QWORD *)v1 + 3) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
  }
  v4 = *((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  Inspector::InspectorAgentBase::~InspectorAgentBase(v1);
  _Unwind_Resume(a1);
}

void Inspector::InspectorAgentBase::~InspectorAgentBase(Inspector::InspectorAgentBase *this)
{
  _DWORD *v2;

  v2 = (_DWORD *)*((_QWORD *)this + 1);
  *(_QWORD *)this = off_24DE01B28;
  *((_QWORD *)this + 1) = 0;
  if (v2)
  {
    if (*v2 == 2)
      WTF::StringImpl::destroy();
    else
      *v2 -= 2;
  }
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  WTF *v2;
  void *v3;

  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *this, void *a2)
{
  uint64_t v3;
  WTF *v4;
  _DWORD *v5;
  uint64_t v6;

  v3 = *((_QWORD *)this + 2);
  v4 = *(WTF **)(v3 + 8);
  *(_QWORD *)(v3 + 8) = 0;
  if (v4)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, a2);
  v5 = (_DWORD *)*((_QWORD *)this + 3);
  *((_QWORD *)this + 3) = 0;
  if (v5)
  {
    if (v5[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v5 + 8))(v5);
    else
      --v5[2];
  }
  v6 = *((_QWORD *)this + 2);
  *((_QWORD *)this + 2) = 0;
  if (v6)
    (*(void (**)(uint64_t))(*(_QWORD *)v6 + 8))(v6);
  Inspector::InspectorAgentBase::~InspectorAgentBase(this);
}

_QWORD *Inspector::ObjCInspectorDOMBackendDispatcher::ObjCInspectorDOMBackendDispatcher(_QWORD *a1, CFTypeRef cf)
{
  const void *v4;

  a1[1] = 0;
  *a1 = &unk_24DE014C8;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4)
      CFRelease(v4);
  }
  return a1;
}

void sub_21AD6958C(_Unwind_Exception *a1, void *a2)
{
  uint64_t v2;
  WTF **v3;
  const void *v5;

  v5 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;
  if (v5)
    CFRelease(v5);
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *result;
  uint64_t v14;
  _DWORD *v15[2];

  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (_DWORD *)MEMORY[0x24BDDA748];
      *MEMORY[0x24BDDA748] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  v11 = *a3;
  *a3 = 0;
  v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2)
      return (_DWORD *)WTF::StringImpl::destroy();
    else
      *result -= 2;
  }
  return result;
}

void sub_21AD696A0(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF *v11;

  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

_QWORD *Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::AlternateDispatchableAgent(_QWORD *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  WTF *v11;
  uint64_t v13;

  *a1 = off_24DE01B28;
  v6 = *a2;
  if (*a2)
    *v6 += 2;
  *a1 = off_24DE01B68;
  a1[1] = v6;
  v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  Inspector::DOMBackendDispatcher::create();
  a1[3] = v13;
  *(_QWORD *)(v13 + 24) = a1[2];
  v8 = a1[2];
  v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  ++*v9;
  v11 = *(WTF **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;
  if (v11)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  return a1;
}

void sub_21AD697C4(_Unwind_Exception *a1)
{
  Inspector::InspectorAgentBase *v1;
  _DWORD *v3;
  uint64_t v4;

  v3 = (_DWORD *)*((_QWORD *)v1 + 3);
  *((_QWORD *)v1 + 3) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
  }
  v4 = *((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  Inspector::InspectorAgentBase::~InspectorAgentBase(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::DOMBackendDispatcher,Inspector::AlternateDOMBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  WTF *v2;
  void *v3;

  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

_QWORD *Inspector::ObjCInspectorDOMStorageBackendDispatcher::ObjCInspectorDOMStorageBackendDispatcher(_QWORD *a1, CFTypeRef cf)
{
  const void *v4;

  a1[1] = 0;
  *a1 = &unk_24DE01668;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4)
      CFRelease(v4);
  }
  return a1;
}

void sub_21AD698A8(_Unwind_Exception *a1, void *a2)
{
  uint64_t v2;
  WTF **v3;
  const void *v5;

  v5 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;
  if (v5)
    CFRelease(v5);
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorDOMStorageBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *result;
  uint64_t v14;
  _DWORD *v15[2];

  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (_DWORD *)MEMORY[0x24BDDA748];
      *MEMORY[0x24BDDA748] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  v11 = *a3;
  *a3 = 0;
  v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2)
      return (_DWORD *)WTF::StringImpl::destroy();
    else
      *result -= 2;
  }
  return result;
}

void sub_21AD699BC(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF *v11;

  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

_QWORD *Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::AlternateDispatchableAgent(_QWORD *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  WTF *v11;
  uint64_t v13;

  *a1 = off_24DE01B28;
  v6 = *a2;
  if (*a2)
    *v6 += 2;
  *a1 = off_24DE01BA8;
  a1[1] = v6;
  v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  Inspector::DOMStorageBackendDispatcher::create();
  a1[3] = v13;
  *(_QWORD *)(v13 + 24) = a1[2];
  v8 = a1[2];
  v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  ++*v9;
  v11 = *(WTF **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;
  if (v11)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  return a1;
}

void sub_21AD69AE0(_Unwind_Exception *a1)
{
  Inspector::InspectorAgentBase *v1;
  _DWORD *v3;
  uint64_t v4;

  v3 = (_DWORD *)*((_QWORD *)v1 + 3);
  *((_QWORD *)v1 + 3) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
  }
  v4 = *((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  Inspector::InspectorAgentBase::~InspectorAgentBase(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::DOMStorageBackendDispatcher,Inspector::AlternateDOMStorageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  WTF *v2;
  void *v3;

  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

_QWORD *Inspector::ObjCInspectorNetworkBackendDispatcher::ObjCInspectorNetworkBackendDispatcher(_QWORD *a1, CFTypeRef cf)
{
  const void *v4;

  a1[1] = 0;
  *a1 = &unk_24DE016B8;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4)
      CFRelease(v4);
  }
  return a1;
}

void sub_21AD69BC4(_Unwind_Exception *a1, void *a2)
{
  uint64_t v2;
  WTF **v3;
  const void *v5;

  v5 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;
  if (v5)
    CFRelease(v5);
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorNetworkBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *result;
  uint64_t v14;
  _DWORD *v15[2];

  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (_DWORD *)MEMORY[0x24BDDA748];
      *MEMORY[0x24BDDA748] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  v11 = *a3;
  *a3 = 0;
  v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2)
      return (_DWORD *)WTF::StringImpl::destroy();
    else
      *result -= 2;
  }
  return result;
}

void sub_21AD69CD8(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF *v11;

  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

_QWORD *Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::AlternateDispatchableAgent(_QWORD *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  WTF *v11;
  uint64_t v13;

  *a1 = off_24DE01B28;
  v6 = *a2;
  if (*a2)
    *v6 += 2;
  *a1 = off_24DE01BE8;
  a1[1] = v6;
  v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  Inspector::NetworkBackendDispatcher::create();
  a1[3] = v13;
  *(_QWORD *)(v13 + 24) = a1[2];
  v8 = a1[2];
  v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  ++*v9;
  v11 = *(WTF **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;
  if (v11)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  return a1;
}

void sub_21AD69DFC(_Unwind_Exception *a1)
{
  Inspector::InspectorAgentBase *v1;
  _DWORD *v3;
  uint64_t v4;

  v3 = (_DWORD *)*((_QWORD *)v1 + 3);
  *((_QWORD *)v1 + 3) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
  }
  v4 = *((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  Inspector::InspectorAgentBase::~InspectorAgentBase(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::NetworkBackendDispatcher,Inspector::AlternateNetworkBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  WTF *v2;
  void *v3;

  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

_QWORD *Inspector::ObjCInspectorPageBackendDispatcher::ObjCInspectorPageBackendDispatcher(_QWORD *a1, CFTypeRef cf)
{
  const void *v4;

  a1[1] = 0;
  *a1 = &unk_24DE01758;
  a1[2] = 0;
  if (cf)
  {
    CFRetain(cf);
    v4 = (const void *)a1[2];
    a1[2] = cf;
    if (v4)
      CFRelease(v4);
  }
  return a1;
}

void sub_21AD69EE0(_Unwind_Exception *a1, void *a2)
{
  uint64_t v2;
  WTF **v3;
  const void *v5;

  v5 = *(const void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;
  if (v5)
    CFRelease(v5);
  Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(v3, a2);
  _Unwind_Resume(a1);
}

_DWORD *std::make_unique[abi:sn180100]<Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>,WTF::ASCIILiteral,Inspector::AugmentableInspectorController &,std::unique_ptr<Inspector::ObjCInspectorPageBackendDispatcher>>@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t *a3@<X2>, _QWORD *a4@<X8>)
{
  _QWORD *v8;
  uint64_t v9;
  _DWORD *v10;
  uint64_t v11;
  uint64_t v12;
  _DWORD *result;
  uint64_t v14;
  _DWORD *v15[2];

  v8 = (_QWORD *)WTF::fastMalloc((WTF *)0x20);
  v9 = *(_QWORD *)(a1 + 8);
  if (v9)
  {
    if (v9 == 1)
    {
      v10 = (_DWORD *)MEMORY[0x24BDDA748];
      *MEMORY[0x24BDDA748] += 2;
    }
    else
    {
      WTF::StringImpl::createWithoutCopyingNonEmpty();
      v10 = v15[1];
    }
    v15[0] = v10;
  }
  else
  {
    v15[0] = 0;
  }
  v11 = *a3;
  *a3 = 0;
  v14 = v11;
  Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::AlternateDispatchableAgent(v8, v15, a2, &v14);
  *a4 = v8;
  v12 = v14;
  v14 = 0;
  if (v12)
    (*(void (**)(uint64_t))(*(_QWORD *)v12 + 8))(v12);
  result = v15[0];
  v15[0] = 0;
  if (result)
  {
    if (*result == 2)
      return (_DWORD *)WTF::StringImpl::destroy();
    else
      *result -= 2;
  }
  return result;
}

void sub_21AD69FF4(_Unwind_Exception *a1, void *a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  WTF *v11;

  WTF::fastFree(v11, a2);
  _Unwind_Resume(a1);
}

_QWORD *Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::AlternateDispatchableAgent(_QWORD *a1, _DWORD **a2, uint64_t a3, uint64_t *a4)
{
  _DWORD *v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD *v9;
  void *v10;
  WTF *v11;
  uint64_t v13;

  *a1 = off_24DE01B28;
  v6 = *a2;
  if (*a2)
    *v6 += 2;
  *a1 = off_24DE01C28;
  a1[1] = v6;
  v7 = *a4;
  *a4 = 0;
  a1[2] = v7;
  (*(void (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  Inspector::PageBackendDispatcher::create();
  a1[3] = v13;
  *(_QWORD *)(v13 + 24) = a1[2];
  v8 = a1[2];
  v9 = (_DWORD *)(*(uint64_t (**)(uint64_t))(*(_QWORD *)a3 + 40))(a3);
  ++*v9;
  v11 = *(WTF **)(v8 + 8);
  *(_QWORD *)(v8 + 8) = v9;
  if (v11)
    WTF::RefCounted<Inspector::BackendDispatcher>::deref(v11, v10);
  return a1;
}

void sub_21AD6A118(_Unwind_Exception *a1)
{
  Inspector::InspectorAgentBase *v1;
  _DWORD *v3;
  uint64_t v4;

  v3 = (_DWORD *)*((_QWORD *)v1 + 3);
  *((_QWORD *)v1 + 3) = 0;
  if (v3)
  {
    if (v3[2] == 1)
      (*(void (**)(_DWORD *))(*(_QWORD *)v3 + 8))(v3);
    else
      --v3[2];
  }
  v4 = *((_QWORD *)v1 + 2);
  *((_QWORD *)v1 + 2) = 0;
  if (v4)
    (*(void (**)(uint64_t))(*(_QWORD *)v4 + 8))(v4);
  Inspector::InspectorAgentBase::~InspectorAgentBase(v1);
  _Unwind_Resume(a1);
}

uint64_t Inspector::AlternateDispatchableAgent<Inspector::PageBackendDispatcher,Inspector::AlternatePageBackendDispatcher>::~AlternateDispatchableAgent(Inspector::InspectorAgentBase *a1, void *a2)
{
  WTF *v2;
  void *v3;

  Inspector::AlternateDispatchableAgent<Inspector::CSSBackendDispatcher,Inspector::AlternateCSSBackendDispatcher>::~AlternateDispatchableAgent(a1, a2);
  return WTF::fastFree(v2, v3);
}

void std::default_delete<Inspector::ObjCInspectorCSSBackendDispatcher>::operator()[abi:sn180100](int a1, WTF *this)
{
  const void *v3;
  WTF *v4;

  if (this)
  {
    v3 = (const void *)*((_QWORD *)this + 2);
    *((_QWORD *)this + 2) = 0;
    if (v3)
      CFRelease(v3);
    v4 = (WTF *)*((_QWORD *)this + 1);
    *((_QWORD *)this + 1) = 0;
    if (v4)
      WTF::RefCounted<Inspector::BackendDispatcher>::deref(v4, this);
    WTF::fastFree(this, this);
  }
}

void sub_21AD6A358(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6A6E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6AB88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6AFBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6B4C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6B9C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6BDFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14)
{
  if (a11)
  {
    if (*a11 == 2)
      WTF::StringImpl::destroy();
    else
      *a11 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

_DWORD *WTF::JSONImpl::ObjectBase::setDouble(WTF::JSONImpl::ObjectBase *this, WTF::StringImpl **a2, double a3)
{
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  WTF::StringImpl *v8;
  _DWORD *result;
  _DWORD *v10;
  _BYTE v11[24];

  WTF::JSONImpl::Value::create(this, a3);
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)this + 2, a2, (uint64_t *)&v10, (uint64_t)v11);
  if (v11[16])
  {
    v5 = (uint64_t *)((char *)this + 24);
    v6 = *((unsigned int *)this + 9);
    if ((_DWORD)v6 == *((_DWORD *)this + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v5, (unint64_t)a2);
    }
    else
    {
      v7 = *v5;
      v8 = *a2;
      if (*a2)
        *(_DWORD *)v8 += 2;
      *(_QWORD *)(v7 + 8 * v6) = v8;
      *((_DWORD *)this + 9) = v6 + 1;
    }
  }
  result = v10;
  v10 = 0;
  if (result)
  {
    if (*result == 1)
      return (_DWORD *)WTF::JSONImpl::Value::operator delete();
    else
      --*result;
  }
  return result;
}

void sub_21AD6BFC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a9)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD6C2E8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6C834(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a11)
  {
    if (*a11 == 2)
      WTF::StringImpl::destroy();
    else
      *a11 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6CAFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6CE24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6D404(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, _DWORD *a17, _DWORD *a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,_DWORD *a28)
{
  if (a28)
  {
    if (*a28 == 2)
      WTF::StringImpl::destroy();
    else
      *a28 -= 2;
  }
  if (a17)
  {
    if (*a17 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a17;
  }
  if (a18)
  {
    if (*a18 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a18;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6D968(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6DDF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6E29C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14, _DWORD *a15, _DWORD *a16)
{
  if (a16)
  {
    if (*a16 == 2)
      WTF::StringImpl::destroy();
    else
      *a16 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6E728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6EB4C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6F088(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6F4C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6F864(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD6FD38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7016C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

WTF::JSONImpl::Value *sub_21AD703E4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, WTF::JSONImpl::Value *a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22)
{
  Inspector::FrontendRouter *v22;
  WTF::JSONImpl::ObjectBase *v23;
  _DWORD *v24;
  WTF::StringImpl *v25;
  WTF::JSONImpl::Value *v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t v30;
  WTF::StringImpl *v31;
  _DWORD *v32;
  WTF::StringImpl *v33;
  _DWORD *v34;
  _DWORD *v35;
  WTF::JSONImpl::Value *result;
  _DWORD *v37;
  WTF::StringImpl *v38;
  _DWORD *v39;
  WTF::JSONImpl::Value *v40;
  _QWORD v41[2];
  char v42;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v37 = (_DWORD *)v41[0];
  WTF::JSONImpl::ObjectBase::setString(v23, (const WTF::String *)&v38, (const WTF::String *)&v37);
  v24 = v37;
  v37 = 0;
  if (v24)
  {
    if (*v24 == 2)
      WTF::StringImpl::destroy();
    else
      *v24 -= 2;
  }
  v25 = v38;
  v38 = 0;
  if (v25)
  {
    if (*(_DWORD *)v25 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v25 -= 2;
  }
  v26 = v40;
  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v27 = (uint64_t)v39;
  v38 = (WTF::StringImpl *)v41[0];
  v39 = 0;
  v37 = (_DWORD *)v27;
  WTF::HashMap<WTF::String,WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>,WTF::DefaultHash<WTF::String>,WTF::HashTraits<WTF::String>,WTF::HashTraits<WTF::Ref<WTF::JSONImpl::Value,WTF::RawPtrTraits<WTF::JSONImpl::Value>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::Value>>>,WTF::HashTableTraits>::inlineSet<WTF::String const&,WTF::Ref<WTF::JSONImpl::ArrayBase,WTF::RawPtrTraits<WTF::JSONImpl::ArrayBase>,WTF::DefaultRefDerefTraits<WTF::JSONImpl::ArrayBase>>>((uint64_t *)v26 + 2, &v38, (uint64_t *)&v37, (uint64_t)v41);
  if (v42)
  {
    v28 = (uint64_t *)((char *)v26 + 24);
    v29 = *((unsigned int *)v26 + 9);
    if ((_DWORD)v29 == *((_DWORD *)v26 + 8))
    {
      WTF::Vector<WTF::String,0ul,WTF::CrashOnOverflow,16ul,WTF::FastMalloc>::appendSlowCase<(WTF::FailureAction)0,WTF::String const&>((uint64_t)v28, (unint64_t)&v38);
    }
    else
    {
      v30 = *v28;
      v31 = v38;
      if (v38)
        *(_DWORD *)v38 += 2;
      *(_QWORD *)(v30 + 8 * v29) = v31;
      *((_DWORD *)v26 + 9) = v29 + 1;
    }
  }
  v32 = v37;
  v37 = 0;
  if (v32)
  {
    if (*v32 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v32;
  }
  v33 = v38;
  v38 = 0;
  if (v33)
  {
    if (*(_DWORD *)v33 == 2)
      WTF::StringImpl::destroy();
    else
      *(_DWORD *)v33 -= 2;
  }
  WTF::JSONImpl::Value::toJSONString(v40);
  Inspector::FrontendRouter::sendEvent(v22, (const WTF::String *)v41);
  v34 = (_DWORD *)v41[0];
  v41[0] = 0;
  if (v34)
  {
    if (*v34 == 2)
      WTF::StringImpl::destroy();
    else
      *v34 -= 2;
  }
  v35 = v39;
  v39 = 0;
  if (v35)
  {
    if (*v35 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*v35;
  }
  result = v40;
  v40 = 0;
  if (result)
  {
    if (*(_DWORD *)result == 1)
      return (WTF::JSONImpl::Value *)WTF::JSONImpl::Value::operator delete();
    else
      --*(_DWORD *)result;
  }
  return result;
}

void sub_21AD70604(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD70B0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD70F40(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD712E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD71678(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD71C7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD72144(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD72618(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD72B90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD731F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD73928(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD74608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void Inspector::toProtocolString(uint64_t a1)
{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

{
  __asm { BR              X9 }
}

uint64_t sub_21AD74838()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD74FBC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD75560(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD75C18(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD76214(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11, _DWORD *a12, _DWORD *a13, uint64_t a14)
{
  if (a11)
  {
    if (*a11 == 2)
      WTF::StringImpl::destroy();
    else
      *a11 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD76B7C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7716C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD77710(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD77D6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD78380(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD788A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD78D38(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD79308(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD79890(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD79E6C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7A2BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7A654(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7AAD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, _DWORD *a13, _DWORD *a14, _DWORD *a15, uint64_t a16)
{
  if (a13)
  {
    if (*a13 == 2)
      WTF::StringImpl::destroy();
    else
      *a13 -= 2;
  }
  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7AF04(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7B328(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7B74C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7BBD0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7BFFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12, _DWORD *a13, _DWORD *a14)
{
  if (a14)
  {
    if (*a14 == 2)
      WTF::StringImpl::destroy();
    else
      *a14 -= 2;
  }
  if (a12)
  {
    if (*a12 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a12;
  }
  if (a13)
  {
    if (*a13 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a13;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7C5B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, _DWORD *a15, _DWORD *a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,_DWORD *a26)
{
  if (a26)
  {
    if (*a26 == 2)
      WTF::StringImpl::destroy();
    else
      *a26 -= 2;
  }
  if (a15)
  {
    if (*a15 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a15;
  }
  if (a16)
  {
    if (*a16 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a16;
  }
  _Unwind_Resume(exception_object);
}

void RWIAugmentableInspectorControllerClient::~RWIAugmentableInspectorControllerClient(RWIAugmentableInspectorControllerClient *this)
{
  JUMPOUT(0x22075766CLL);
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorControllerDestroyed(RWIAugmentableInspectorControllerClient *this)
{
  return objc_msgSend(*((id *)this + 1), "inspectorControllerDestroyed");
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorConnected(RWIAugmentableInspectorControllerClient *this)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("RWIProtocolInspectorFrontendConnectedNotification"), *((_QWORD *)this + 1), 0);
}

uint64_t RWIAugmentableInspectorControllerClient::inspectorDisconnected(RWIAugmentableInspectorControllerClient *this)
{
  return objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter"), "postNotificationName:object:userInfo:", CFSTR("RWIProtocolInspectorFrontendDisconnectedNotification"), *((_QWORD *)this + 1), 0);
}

void sub_21AD7CB44(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7CBFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7CCB4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7CDC8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, _DWORD *a10)
{
  if (a9)
  {
    if (*a9 == 2)
      WTF::StringImpl::destroy();
    else
      *a9 -= 2;
  }
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7CFA8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _DWORD *a11)
{
  if (a11)
  {
    if (*a11 == 2)
      WTF::StringImpl::destroy();
    else
      *a11 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7D098(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7D12C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7D1D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7D294(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10)
  {
    if (*a10 == 2)
      WTF::StringImpl::destroy();
    else
      *a10 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7D3C4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, _DWORD *a10)
{
  if (a10)
  {
    if (*a10 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a10;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD7D488(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7D5BC(_Unwind_Exception *a1, uint64_t a2, ...)
{
  uint64_t v3;
  uint64_t v4;
  va_list va;
  va_list va1;

  va_start(va1, a2);
  va_start(va, a2);
  v4 = va_arg(va1, _QWORD);
  v3 = v4;
  v4 = 0;
  if (v3)
    Inspector::toJSONObjectArray();
  -[RWIProtocolJSONObject setJSONArray:forKey:].cold.1((uint64_t)va, (uint64_t *)va1);
  _Unwind_Resume(a1);
}

void sub_21AD7D658(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  if (a10)
    Inspector::ObjCInspectorCSSBackendDispatcher::enable();
  _Unwind_Resume(exception_object);
}

void sub_21AD7D75C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD7D91C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD7DC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21AD7DD10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD7DD78()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD7E028(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
    -[RWIProtocolCSSPseudoIdMatches pseudoId].cold.1(a12);
  _Unwind_Resume(exception_object);
}

void sub_21AD7E200(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7E2E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSRuleMatch>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSRuleMatch *v9;
  RWIProtocolCSSRuleMatch *v10;
  RWIProtocolCSSRuleMatch *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSRuleMatch alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD7E478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7E6F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21AD7E8A0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7EAB8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7EB9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD7ECAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD7EE24(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7EEFC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD7EF98(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD7F05C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD7F168(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD7F204(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD7F4D4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21AD7F6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7F7C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSSelector>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSSelector *v9;
  RWIProtocolCSSSelector *v10;
  RWIProtocolCSSSelector *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSSelector alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD7F954(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7FBC0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD7FD10(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD7FF04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD80150(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21AD80314(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolCSSStyleSheetHeader;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("origin"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD803E8(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD80510(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD809E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21AD80C70(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD80D54(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSRule>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSRule *v9;
  RWIProtocolCSSRule *v10;
  RWIProtocolCSSRule *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSRule alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD80EE8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD81110(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD81288(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD81444(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD815C4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolCSSRule;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("origin"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD81698(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD817C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD81954(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD81B6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD81C50(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSGrouping>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSGrouping *v9;
  RWIProtocolCSSGrouping *v10;
  RWIProtocolCSSGrouping *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSGrouping alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD81DE4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD81FA0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD82284(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD8243C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD82548(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD825E4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8267C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD82718(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD827B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8284C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD829D4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD82E00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12, void *a13)
{
  void *v13;

  _Unwind_Resume(a1);
}

void sub_21AD82FD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD831EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD832D0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSProperty>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSProperty *v9;
  RWIProtocolCSSProperty *v10;
  RWIProtocolCSSProperty *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSProperty alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD83464(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD836B0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD83794(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSShorthandEntry>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSShorthandEntry *v9;
  RWIProtocolCSSShorthandEntry *v10;
  RWIProtocolCSSShorthandEntry *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSShorthandEntry alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD83928(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD83B94(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD83DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD84104(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolCSSProperty;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("status"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD841D0(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD842F8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8448C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD84558(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD84608(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD84670()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD84814(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD849A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD84C5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD84F00(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21AD85188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8526C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolCSSFontVariationAxis>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolCSSFontVariationAxis *v9;
  RWIProtocolCSSFontVariationAxis *v10;
  RWIProtocolCSSFontVariationAxis *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolCSSFontVariationAxis alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD85400(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD85668(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD85960(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD85A10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD85A78()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD85C9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD85DB8(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD85EE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD85FDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD86090(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD861BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD86220(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolConsoleMessage;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("level"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD86300(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD86428(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD86578(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD865E0()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD867C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD86B9C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD86C80(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeRemoteObject>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolRuntimeRemoteObject *v9;
  RWIProtocolRuntimeRemoteObject *v10;
  RWIProtocolRuntimeRemoteObject *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolRuntimeRemoteObject alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD86E14(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD87004(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD872C4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21AD87734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, void *a11, void *a12)
{
  void *v12;

  _Unwind_Resume(a1);
}

void sub_21AD87938(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD87A1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolConsoleCallFrame>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolConsoleCallFrame *v9;
  RWIProtocolConsoleCallFrame *v10;
  RWIProtocolConsoleCallFrame *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolConsoleCallFrame alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD87BB0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD87E90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8805C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21AD8858C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD88670(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDOMNode>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolDOMNode *v9;
  RWIProtocolDOMNode *v10;
  RWIProtocolDOMNode *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolDOMNode alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD88804(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD88910(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD889AC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD88DF4(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD88F1C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD89038(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD89160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD891C4(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolDOMNode;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("customElementState"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD89288(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD893B0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD89544(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8975C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD89840(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD899BC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD89BD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD89CB8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD89DCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD89E68(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD89F78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD8A1E4(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD8A62C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8AA00(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD8ABE8(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD8AD10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8ADC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8AE5C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8AEF4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8AF90(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8B04C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD8B0B4()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD8B228(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8B5A8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8B644(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8B7F8(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolDOMAccessibilityProperties;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("invalid"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD8B8CC(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD8B9F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8BC10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8BCAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8BDB0(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD8BED8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8C078(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8C114(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8C480(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8C51C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD8C600(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD8C728(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8C7FC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD8CBC4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8CD80(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8CF3C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8D0F8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8D1FC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD8D370(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8D6CC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD8D840(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8D984(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD8DAAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8DBF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
    -[RWIProtocolCSSPseudoIdMatches pseudoId].cold.1(a12);
  _Unwind_Resume(exception_object);
}

void sub_21AD8DD74(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8DF30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8E164(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8E320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8E52C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD8E93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21AD8EC28(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8F078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD8F274(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD8F42C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD8F5EC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD8F7DC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD8F81C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolDebuggerBreakpointAction;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("type"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD8F8E8(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD8FA10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD8FDE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD8FECC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDebuggerBreakpointAction>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolDebuggerBreakpointAction *v9;
  RWIProtocolDebuggerBreakpointAction *v10;
  RWIProtocolDebuggerBreakpointAction *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolDebuggerBreakpointAction alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD90060(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD90288(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD903FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9070C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD907F0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolDebuggerScope>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolDebuggerScope *v9;
  RWIProtocolDebuggerScope *v10;
  RWIProtocolDebuggerScope *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolDebuggerScope alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD90984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD90D5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, void *a13, void *a14, void *a15, void *a16, void *a17, void *a18)
{
  void *v18;

  _Unwind_Resume(a1);
}

void sub_21AD91018(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD91230(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD91314(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD91490(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9161C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD91790(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9188C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD918F4()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD91A88(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD91C98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD91E64(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD921B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD92338(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD92470(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD925C0(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9281C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD92F14(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;

  _Unwind_Resume(a1);
}

void sub_21AD93188(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD93300(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD93368()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD9351C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD93788(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21AD93A78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD93B80(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolNetworkResponse;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("source"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD93C74(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD93D9C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD93F30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD940EC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD942A8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD94468(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD94590(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9481C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD94C30(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD94DAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD94F20(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD95088(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD952F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD95430(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD956F8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD95828(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD95954(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD95AE8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD95CA8(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD95D98(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD95EC0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD96054(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD962A0(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD96398(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD964C0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD96524(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, objc_super a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17)
{
  void *v17;
  _DWORD *v18;
  __CFString *v19;
  objc_super v20;
  _DWORD *v21;

  WTF::StringImpl::createWithoutCopyingNonEmpty();
  v18 = v21;
  if (v21)
    v19 = (__CFString *)(id)WTF::StringImpl::operator NSString *();
  else
    v19 = &stru_24DE03408;
  v20.receiver = v17;
  v20.super_class = (Class)RWIProtocolPageUserPreference;
  objc_msgSendSuper2(&v20, sel_setString_forKey_, v19, CFSTR("value"));

  if (v18)
  {
    if (*v18 == 2)
      WTF::StringImpl::destroy();
    else
      *v18 -= 2;
  }
}

void sub_21AD96604(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD9672C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD96948(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  _Unwind_Resume(a1);
}

void sub_21AD96DDC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD96F10(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9703C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9751C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12, void *a13, void *a14)
{
  void *v14;

  _Unwind_Resume(a1);
}

void sub_21AD976CC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD978E4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD979C8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolPageFrameResourceTree>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolPageFrameResourceTree *v9;
  RWIProtocolPageFrameResourceTree *v10;
  RWIProtocolPageFrameResourceTree *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolPageFrameResourceTree alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD97B5C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD97DA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD97E8C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolPageFrameResource>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolPageFrameResource *v9;
  RWIProtocolPageFrameResource *v10;
  RWIProtocolPageFrameResource *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolPageFrameResource alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD98020(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD981BC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD985AC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_21AD98A84(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD98BAC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD98C50(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD98D00(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD98D68()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD98EF0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD98FC4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD9902C()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD9920C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9941C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD99748(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD99904(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD999E4(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD99A94(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD99AFC()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD99C84(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD99D58(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD99DC0()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD99FA0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9A2FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9A3E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimePropertyPreview>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolRuntimePropertyPreview *v9;
  RWIProtocolRuntimePropertyPreview *v10;
  RWIProtocolRuntimePropertyPreview *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolRuntimePropertyPreview alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD9A574(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9A7C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9A8A4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeEntryPreview>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolRuntimeEntryPreview *v9;
  RWIProtocolRuntimeEntryPreview *v10;
  RWIProtocolRuntimeEntryPreview *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolRuntimeEntryPreview alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD9AA38(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9ABF8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9AD28(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD9AD90()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD9AF24(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9AFF8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

uint64_t sub_21AD9B060()
{
  _QWORD *v0;
  uint64_t result;
  uint64_t v2;

  result = WTF::StringImpl::createWithoutCopyingNonEmpty();
  *v0 = v2;
  return result;
}

void sub_21AD9B240(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9B450(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9B644(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9B7B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9B974(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9BA78(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9BBEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9BDA8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9BEAC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9C09C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9C2D0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9C48C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9C828(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9CA1C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9CC0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9CDC8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9CFBC(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void sub_21AD9D134(_Unwind_Exception *a1)
{
  _DWORD *v1;

  if (*v1 == 2)
    WTF::StringImpl::destroy();
  else
    *v1 -= 2;
  _Unwind_Resume(a1);
}

void sub_21AD9D25C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, _DWORD *a12)
{
  if (a12)
  {
    if (*a12 == 2)
      WTF::StringImpl::destroy();
    else
      *a12 -= 2;
  }
  _Unwind_Resume(exception_object);
}

void sub_21AD9D40C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD9D588(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9D624(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9D6BC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9D758(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9D950(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9DB48(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD9E078(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD9E2DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9E4F4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, _DWORD *a14)
{
  void *v14;

  if (a14)
  {
    if (*a14 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a14;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9E5D8(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

id Inspector::toObjCArray<RWIProtocolRuntimeStructureDescription>(WTF::JSONImpl::ArrayBase **a1)
{
  uint64_t v2;
  void *v3;
  uint64_t i;
  _DWORD *v5;
  unsigned int v6;
  _DWORD *v8;
  RWIProtocolRuntimeStructureDescription *v9;
  RWIProtocolRuntimeStructureDescription *v10;
  RWIProtocolRuntimeStructureDescription *v11;
  _DWORD *v12;
  void *v13;
  CFTypeRef v14;
  _DWORD *v16;
  CFTypeRef cf;

  if (*a1)
  {
    v2 = *((unsigned int *)*a1 + 7);
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if ((_DWORD)v2)
    {
      for (i = 0; v2 != i; ++i)
      {
        WTF::JSONImpl::ArrayBase::get(*a1);
        v5 = cf;
        v6 = *((_DWORD *)cf + 1);
        if (v6 < 5 || v6 == 6)
        {
          v8 = 0;
        }
        else
        {
          if (v6 != 5)
            Inspector::toObjCArray<RWIProtocolCSSRuleMatch>();
          ++*(_DWORD *)cf;
          v8 = v5;
        }
        cf = 0;
        if (*v5 == 1)
        {
          WTF::JSONImpl::Value::operator delete();
          if (v8)
          {
LABEL_14:
            v9 = [RWIProtocolRuntimeStructureDescription alloc];
            v16 = v8;
            v10 = -[RWIProtocolJSONObject initWithJSONObject:](v9, "initWithJSONObject:", &v16);
            v11 = v10;
            cf = v10;
            if (v10)
              CFRetain(v10);

            v12 = v16;
            v16 = 0;
            if (v12)
            {
              if (*v12 == 1)
                WTF::JSONImpl::Value::operator delete();
              else
                --*v12;
            }
            WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get((id *)&cf);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v3, "addObject:", v13, v16);

            v14 = cf;
            cf = 0;
            if (v14)
              CFRelease(v14);
          }
        }
        else
        {
          --*v5;
          if (v8)
            goto LABEL_14;
        }
      }
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

void sub_21AD9E76C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, _DWORD *a9, CFTypeRef cf)
{
  void *v10;
  void *v11;

  if (a9)
  {
    if (*a9 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a9;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9E93C(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_21AD9EB70(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_21AD9F040(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9F0DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9F174(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9F210(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  if (a12)
    Inspector::toJSONObjectArray();
  _Unwind_Resume(exception_object);
}

void sub_21AD9F38C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

void sub_21AD9F548(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, _DWORD *a11, uint64_t a12)
{
  void *v12;
  void *v13;

  if (a12)
    Inspector::toJSONObjectArray();
  if (a11)
  {
    if (*a11 == 1)
      WTF::JSONImpl::Value::operator delete();
    else
      --*a11;
  }

  _Unwind_Resume(a1);
}

uint64_t std::__lower_bound[abi:sn180100]<std::_ClassicAlgPolicy,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const*,WTF::ComparableStringView,std::__identity,RWIProtocolCSSPseudoId const* WTF::SortedArrayMap<std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId>[22]>::tryGet<WTF::String>(WTF::String const&)::{lambda(WTF::String&,std::pair<WTF::ComparableASCIISubsetLiteral<(WTF::ASCIISubset)0>,RWIProtocolCSSPseudoId> const* &)#1}>(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  unint64_t v3;
  uint64_t v4;
  int v5;

  v2 = a2;
  if (a2 != a1)
  {
    v3 = 0xAAAAAAAAAAAAAAABLL * ((a2 - a1) >> 3);
    v2 = a1;
    do
    {
      v4 = v2 + 24 * (v3 >> 1);
      v5 = WTF::codePointCompare();
      if (v5 >= 0)
        v3 >>= 1;
      else
        v3 += ~(v3 >> 1);
      if (v5 < 0)
        v2 = v4 + 24;
    }
    while (v3);
  }
  return v2;
}

id WTF::RetainPtr<RWIProtocolCSSRuleMatch>::get(id *a1)
{
  return *a1;
}

unint64_t removeObjectFromArray(void *a1, void *a2)
{
  id v3;
  id v4;
  unint64_t v5;
  id v6;
  uint64_t v7;
  id v8;
  uint64_t v9;

  v3 = a1;
  v4 = a2;
  v5 = objc_msgSend(v3, "count");
  if (v5)
  {
    objc_msgSend(v3, "objectAtIndex:", 0);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v9 = 0;
      v5 = 1;
LABEL_8:
      objc_msgSend(v3, "removeObjectAtIndex:", v9);
    }
    else
    {
      v7 = 1;
      while (v5 != v7)
      {
        objc_msgSend(v3, "objectAtIndex:", v7);
        v8 = (id)objc_claimAutoreleasedReturnValue();

        ++v7;
        if (v8 == v4)
        {
          v9 = v7 - 1;
          v5 = v7 - 1 < v5;
          goto LABEL_8;
        }
      }
      v5 = 0;
    }
  }

  return v5;
}

void OUTLINED_FUNCTION_0_4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_1_2(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void OUTLINED_FUNCTION_5(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

uint64_t convertRBSProcessState(void *a1)
{
  id v1;
  void *v2;
  int v3;
  uint64_t v4;

  v1 = a1;
  if (objc_msgSend(v1, "taskState") == 4)
  {
    objc_msgSend(v1, "endowmentNamespaces");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "containsObject:", *MEMORY[0x24BE38348]);

    if (v3)
      v4 = 2;
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

void sub_21ADA4984(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_21ADA4B00(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void logUnexpectedType(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;

  v3 = a1;
  v4 = a2;
  RWIDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    logUnexpectedType_cold_1((uint64_t)v3, (uint64_t)v4, v5);

}

void sub_21ADA5934(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

id processNameForPID()
{
  int v0;
  void *v1;
  void *v2;
  _BYTE buffer[4096];
  uint64_t v5;

  v0 = MEMORY[0x24BDAC7A8]();
  v5 = *MEMORY[0x24BDAC8D0];
  bzero(buffer, 0x1000uLL);
  if (!proc_pidpath(v0, buffer, 0x1000u))
    return 0;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", buffer);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void sub_21ADA5A0C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

uint64_t isInternalInstall()
{
  if (isInternalInstall::onceToken != -1)
    dispatch_once(&isInternalInstall::onceToken, &__block_literal_global_1);
  return isInternalInstall::isInternal;
}

uint64_t __isInternalInstall_block_invoke()
{
  uint64_t result;

  result = os_variant_allows_internal_security_policies();
  isInternalInstall::isInternal = result;
  return result;
}

uint64_t isSimulatingCustomerInstall()
{
  if (isSimulatingCustomerInstall::onceToken != -1)
    dispatch_once(&isSimulatingCustomerInstall::onceToken, &__block_literal_global_2);
  return isSimulatingCustomerInstall::simulateCustomerInstall;
}

uint64_t __isSimulatingCustomerInstall_block_invoke()
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(CFSTR("SimulateCustomerInstall"), CFSTR("com.apple.WebInspector"), 0);
  isSimulatingCustomerInstall::simulateCustomerInstall = (_DWORD)result != 0;
  return result;
}

__CFData *protocolIconDataForBundleIdentifier(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFData *Mutable;
  __CFString *v7;
  CGImageDestination *v8;
  __CFData *v9;

  v1 = a1;
  if (v1)
  {
    v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51AB0]), "initWithSize:scale:", 16.0, 16.0, 2.0);
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE51A90]), "initWithBundleIdentifier:", v1);
    objc_msgSend(v3, "prepareImageForDescriptor:", v2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      objc_msgSend(MEMORY[0x24BE51A90], "genericApplicationIcon");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "prepareImageForDescriptor:", v2);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v4)
      {
        v9 = 0;
        goto LABEL_9;
      }
    }
    Mutable = CFDataCreateMutable(0, 0);
    objc_msgSend((id)*MEMORY[0x24BDF84F8], "identifier");
    v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
    v8 = CGImageDestinationCreateWithData(Mutable, v7, 1uLL, 0);

    if (v8)
    {
      CGImageDestinationAddImage(v8, (CGImageRef)objc_msgSend(v4, "CGImage"), 0);
      CGImageDestinationFinalize(v8);
      v9 = Mutable;
    }
    else
    {
      v9 = 0;
      v8 = Mutable;
      if (!Mutable)
      {
LABEL_9:

        goto LABEL_10;
      }
    }
    CFRelease(v8);
    goto LABEL_9;
  }
  v9 = 0;
LABEL_10:

  return v9;
}

void sub_21ADA5C50(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;

  _Unwind_Resume(a1);
}

void traceMessagePayloadIfKeyExists_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138477827;
  v3 = a1;
  _os_log_debug_impl(&dword_21AD49000, a2, OS_LOG_TYPE_DEBUG, "payload: %{private}@", (uint8_t *)&v2, 0xCu);
}

void Inspector::toJSONObjectArray()
{
  _DWORD *v0;
  int v1;
  char v2;

  OUTLINED_FUNCTION_0_2();
  if (v2)
    WTF::JSONImpl::Value::operator delete();
  else
    *v0 = v1;
}

void Inspector::toObjCIntegerArray()
{
  objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("array should contain objects of type 'int'"));
  __break(1u);
}

void Inspector::ObjCInspectorCSSBackendDispatcher::enable()
{
  _DWORD *v0;
  int v1;
  char v2;

  OUTLINED_FUNCTION_0_3();
  if (v2)
    WTF::StringImpl::destroy();
  else
    *v0 = v1;
}

WTF *Inspector::ObjCInspectorCSSBackendDispatcher::ObjCInspectorCSSBackendDispatcher(WTF **a1, void *a2)
{
  WTF *result;

  result = *a1;
  *a1 = 0;
  if (result)
    return WTF::RefCounted<Inspector::BackendDispatcher>::deref(result, a2);
  return result;
}

void Inspector::toObjCArray<RWIProtocolCSSRuleMatch>()
{
  __break(0xC471u);
}

void logUnexpectedType_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = 138478083;
  v4 = a1;
  v5 = 2113;
  v6 = a2;
  _os_log_error_impl(&dword_21AD49000, log, OS_LOG_TYPE_ERROR, "Unexpected type: %{private}@, Expected type: %{private}@", (uint8_t *)&v3, 0x16u);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x24BDBBA18]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x24BDBBA20](BOOLean);
}

CFMutableDataRef CFDataCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableDataRef)MEMORY[0x24BDBBCB0](allocator, capacity);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBDB0](theDict, key, value);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeRef CFMakeCollectable(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBBFE8](cf);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x24BDBC188](key, applicationID, keyExistsAndHasValidFormat);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x24BDD9048](idst, image, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x24BDD9078](data, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x24BDD9090](idst);
}

uint64_t CPCopyBundleIdentifierAndTeamFromAuditToken()
{
  return MEMORY[0x24BE04658]();
}

uint64_t JSGlobalContextGetAugmentableInspectorController()
{
  return MEMORY[0x24BDDA568]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x24BED8490]();
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x24BDD1218](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x24BDD1240](aClass);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x24BDD1268](aSelector);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x24BDE8D48](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x24BDE8D78](allocator, token);
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x24BDBD130]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x24BDBD140]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

uint64_t WTF::StringImpl::createWithoutCopyingNonEmpty()
{
  return MEMORY[0x24BDDA750]();
}

uint64_t WTF::StringImpl::destroy()
{
  return MEMORY[0x24BDDA758]();
}

uint64_t WTF::StringImpl::operator NSString *()
{
  return MEMORY[0x24BDDA760]();
}

uint64_t WTF::fastMalloc(WTF *this)
{
  return MEMORY[0x24BDDA768](this);
}

uint64_t WTF::codePointCompare()
{
  return MEMORY[0x24BDDA770]();
}

uint64_t WTF::fastZeroedMalloc(WTF *this)
{
  return MEMORY[0x24BDDA778](this);
}

uint64_t WTF::equal()
{
  return MEMORY[0x24BDDA780]();
}

uint64_t WTF::String::String(WTF::String *this, const __CFString *a2)
{
  return MEMORY[0x24BDDA788](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::remove(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA790](this, a2);
}

uint64_t WTF::JSONImpl::Array::create(WTF::JSONImpl::Array *this)
{
  return MEMORY[0x24BDDA798](this);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA7A0](this, a2);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x24BDDA7A8](this);
}

{
  return MEMORY[0x24BDDA7B8](this);
}

uint64_t WTF::JSONImpl::Value::create(WTF::JSONImpl::Value *this, double a2)
{
  return MEMORY[0x24BDDA7B0](this, a2);
}

uint64_t WTF::JSONImpl::Value::operator delete()
{
  return MEMORY[0x24BDDA7C0]();
}

uint64_t WTF::JSONImpl::Object::create(WTF::JSONImpl::Object *this)
{
  return MEMORY[0x24BDDA7C8](this);
}

uint64_t WTF::fastFree(WTF *this, void *a2)
{
  return MEMORY[0x24BDDA7D0](this, a2);
}

uint64_t Inspector::BackendDispatcher::sendResponse()
{
  return MEMORY[0x24BDDA7D8]();
}

uint64_t Inspector::BackendDispatcher::sendPendingErrors(Inspector::BackendDispatcher *this)
{
  return MEMORY[0x24BDDA7E0](this);
}

uint64_t Inspector::BackendDispatcher::reportProtocolError()
{
  return MEMORY[0x24BDDA7E8]();
}

{
  return MEMORY[0x24BDDA7F0]();
}

uint64_t Inspector::CSSBackendDispatcher::create()
{
  return MEMORY[0x24BDDA7F8]();
}

uint64_t Inspector::DOMBackendDispatcher::create()
{
  return MEMORY[0x24BDDA800]();
}

uint64_t Inspector::PageBackendDispatcher::create()
{
  return MEMORY[0x24BDDA808]();
}

uint64_t Inspector::NetworkBackendDispatcher::create()
{
  return MEMORY[0x24BDDA810]();
}

uint64_t Inspector::DOMStorageBackendDispatcher::create()
{
  return MEMORY[0x24BDDA818]();
}

uint64_t WTF::StringImpl::hashSlowCase(WTF::StringImpl *this)
{
  return MEMORY[0x24BDDA820](this);
}

uint64_t WTF::JSONImpl::ObjectBase::getBoolean(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA828](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getInteger(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA830](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getArray(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA838](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getDouble(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA840](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getObject(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA848](this, a2);
}

uint64_t WTF::JSONImpl::ObjectBase::getString(WTF::JSONImpl::ObjectBase *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA850](this, a2);
}

uint64_t WTF::JSONImpl::Value::toJSONString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x24BDDA858](this);
}

uint64_t WTF::JSONImpl::Value::asString(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x24BDDA860](this);
}

uint64_t WTF::JSONImpl::Value::asInteger(WTF::JSONImpl::Value *this)
{
  return MEMORY[0x24BDDA868](this);
}

uint64_t WTF::JSONImpl::ArrayBase::get(WTF::JSONImpl::ArrayBase *this)
{
  return MEMORY[0x24BDDA870](this);
}

uint64_t Inspector::FrontendRouter::sendEvent(Inspector::FrontendRouter *this, const WTF::String *a2)
{
  return MEMORY[0x24BDDA878](this, a2);
}

void std::__libcpp_verbose_abort(const char *__format, ...)
{
  MEMORY[0x24BEDB1B8](__format);
}

void std::terminate(void)
{
  MEMORY[0x24BEDB6C0]();
}

uint64_t operator delete()
{
  return off_24DE00BA0();
}

uint64_t operator new()
{
  return off_24DE00BA8();
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x24BEDB910](a1);
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB68](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB80](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x24BDACB90](dso, log, type, format, buf, *(_QWORD *)&size);
}

int accept(int a1, sockaddr *a2, socklen_t *a3)
{
  return MEMORY[0x24BDAD030](*(_QWORD *)&a1, a2, a3);
}

int bind(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDAD2C8](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x24BDAD320](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x24BDAD9D8](*(_QWORD *)&a1);
}

int connect(int a1, const sockaddr *a2, socklen_t a3)
{
  return MEMORY[0x24BDADA10](*(_QWORD *)&a1, a2, *(_QWORD *)&a3);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADC60](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x24BDADF78](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFA0](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void exit(int a1)
{
  MEMORY[0x24BDAE268](*(_QWORD *)&a1);
}

pid_t getpid(void)
{
  return MEMORY[0x24BDAE6D0]();
}

int listen(int a1, int a2)
{
  return MEMORY[0x24BDAEA78](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

uint64_t lockdown_copy_checkin_info()
{
  return MEMORY[0x24BEDC4E8]();
}

uint64_t lockdown_disconnect()
{
  return MEMORY[0x24BEDC510]();
}

uint64_t lockdown_get_socket()
{
  return MEMORY[0x24BEDC520]();
}

uint64_t lockdown_recv()
{
  return MEMORY[0x24BEDC528]();
}

uint64_t lockdown_send()
{
  return MEMORY[0x24BEDC530]();
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

uint32_t notify_post(const char *name)
{
  return MEMORY[0x24BDAF160](name);
}

uint32_t notify_register_check(const char *name, int *out_token)
{
  return MEMORY[0x24BDAF168](name, out_token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x24BDAF170](name, out_token, queue, handler);
}

uint32_t notify_set_state(int token, uint64_t state64)
{
  return MEMORY[0x24BDAF198](*(_QWORD *)&token, state64);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x24BEDD078](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x24BEDD080](object, key);
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

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x24BDAF368](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x24BDAF398](oslog, type);
}

uint64_t os_variant_allows_internal_security_policies()
{
  return MEMORY[0x24BDAF4B0]();
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x24BDAF708](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x24BDAFA80](*(_QWORD *)&a1, a2, a3);
}

uint64_t secure_lockdown_checkin()
{
  return MEMORY[0x24BEDC550]();
}

int setsockopt(int a1, int a2, int a3, const void *a4, socklen_t a5)
{
  return MEMORY[0x24BDAFD78](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3, a4, *(_QWORD *)&a5);
}

int socket(int a1, int a2, int a3)
{
  return MEMORY[0x24BDAFE50](*(_QWORD *)&a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x24BDAFF18](*(_QWORD *)&__errnum);
}

size_t strlcpy(char *__dst, const char *__source, size_t __size)
{
  return MEMORY[0x24BDAFF38](__dst, __source, __size);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x24BDAFF40](__s);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x24BDB0558](*(_QWORD *)&__fd, __buf, __nbyte);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

uint64_t xpc_connection_get_audit_token()
{
  return MEMORY[0x24BDB0758]();
}

pid_t xpc_connection_get_pid(xpc_connection_t connection)
{
  return MEMORY[0x24BDB0788](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x24BDB0798](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
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

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

void xpc_transaction_begin(void)
{
  MEMORY[0x24BDB0BB0]();
}

void xpc_transaction_end(void)
{
  MEMORY[0x24BDB0BB8]();
}

